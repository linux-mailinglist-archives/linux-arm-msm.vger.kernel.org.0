Return-Path: <linux-arm-msm+bounces-40233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ADD9E3935
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 12:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10A622815A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B281B3949;
	Wed,  4 Dec 2024 11:48:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC6B1B4152;
	Wed,  4 Dec 2024 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733312921; cv=none; b=rDysUAIQD3EgG3mOXH5yxozVTY19x4oGzwp2zv9hTJ+fMHZt/doBHxYK/ONWFbeCAWl4Ed1+2BhvmLaSLMksFHEKxunsPWpePoJFMgDcVc+tTJ8ZfOofGbhESlqnizm+Ngxq+a0fmQneJCV2qmlHiLGfgIEu2OCEHqIo5WpAIOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733312921; c=relaxed/simple;
	bh=/yIIYUBP7kkSoJoC2I9xEAcI7i1lAFny+D59IeEc0IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q33tQ3TAtpvEqGkzB4f4gCk39Rlrqi3eyj672FdMzIsO9DgZJ+wJUIHf7+xaJyEf1ZL3ZlTYfR049veR8Imacy2lxgzQtdE0k/DtU9E8bVDbFSE8/r+dlcGerCzJrhyxWb11COYKO3fRWeZFdEu/ufYGFk4ef5mSj8W0ZIfjSvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DA49FEC;
	Wed,  4 Dec 2024 03:49:05 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E3B73F71E;
	Wed,  4 Dec 2024 03:48:35 -0800 (PST)
Date: Wed, 4 Dec 2024 11:48:26 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V5 1/2] firmware: arm_scmi: Add QCOM Generic Vendor
 Protocol documentation
Message-ID: <Z1BBirNWH1eaSKtr@pluto>
References: <20241115011515.1313447-1-quic_sibis@quicinc.com>
 <20241115011515.1313447-2-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115011515.1313447-2-quic_sibis@quicinc.com>

On Fri, Nov 15, 2024 at 06:45:14AM +0530, Sibi Sankar wrote:
> Add QCOM System Control Management Interface (SCMI) Generic Vendor
> Extensions Protocol documentation.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
> 
> v4:
> * Update the protol attributes doc with more information. [Cristian]
> 
>  .../arm_scmi/vendors/qcom/qcom_generic.rst    | 211 ++++++++++++++++++
>  1 file changed, 211 insertions(+)
>  create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> new file mode 100644
> index 000000000000..141bc932e30f
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> @@ -0,0 +1,211 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: <isonum.txt>
> +
> +===============================================================================
> +QCOM System Control and Management Interface(SCMI) Vendor Protocols Extension
> +===============================================================================
> +
> +:Copyright: |copy| 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> +
> +:Author: Sibi Sankar <quic_sibis@quicinc.com>
> +
> +SCMI_GENERIC: System Control and Management Interface QCOM Generic Vendor Protocol
> +==================================================================================
> +
> +This protocol is intended as a generic way of exposing a number of Qualcomm
> +SoC specific features through a mixture of pre-determined algorithm string and
> +param_id pairs hosted on the SCMI controller. It implements an interface compliant
> +with the Arm SCMI Specification with additional vendor specific commands as
> +detailed below.
> +
> +Commands:
> +_________
> +
> +PROTOCOL_VERSION
> +~~~~~~~~~~~~~~~~
> +
> +message_id: 0x0
> +protocol_id: 0x80
> +
> ++---------------+--------------------------------------------------------------+
> +|Return values                                                                 |
> ++---------------+--------------------------------------------------------------+
> +|Name           |Description                                                   |
> ++---------------+--------------------------------------------------------------+
> +|int32 status   |See ARM SCMI Specification for status code definitions.       |
> ++---------------+--------------------------------------------------------------+
> +|uint32 version |For this revision of the specification, this value must be    |
> +|               |0x10000.                                                      |
> ++---------------+--------------------------------------------------------------+
> +
> +PROTOCOL_ATTRIBUTES
> +~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x1
> +protocol_id: 0x80
> +
> ++---------------+--------------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |See ARM SCMI Specification for status code definitions.    |
> ++------------------+-----------------------------------------------------------+
> +|uint32 attributes |Bits[31:16] Reserved, must be to 0.                        |
> +|                  |Bits[15:8] Number of agents in the system                  |
> +|                  |Bits[7:0] Number of vendor protocols in the system         |
> ++------------------+-----------------------------------------------------------+

Thanks of clarifing this....may I ask why number of agents is reported
here too given that it is already exposed by Base protocol ?

Not really arguing about this so much, but you will end up having to maintain this
on 2 different protocols fw side...or are they not 'agents' in the SCMI meaning ?

Anyway, I'm fine with it, even though you dont seem to use this
anywhere.

> +
> +PROTOCOL_MESSAGE_ATTRIBUTES
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x2
> +protocol_id: 0x80
> +
> ++---------------+--------------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |See ARM SCMI Specification for status code definitions.    |
> ++------------------+-----------------------------------------------------------+
> +|uint32 attributes |For all message id's the parameter has a value of 0.       |
> ++------------------+-----------------------------------------------------------+
> +
> +QCOM_SCMI_SET_PARAM
> +~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x10
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 ext_id     |Reserved, must be zero.                                    |
> ++------------------+-----------------------------------------------------------+
> +|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 param_id   |Serves as the token message id for the algorithm string    |
> +|                  |and is used to set various parameters supported by it.     |
> ++------------------+-----------------------------------------------------------+
> +|uint32 buf[]      |Serves as the payload for the specified param_id and       |
> +|                  |algorithm string pair.                                     |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
> +|                  |by the chosen algorithm string.                            |
> +|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
> +|                  |matches.                                                   |
> +|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
> +|                  |is rejected by the algorithm string.                       |
> ++------------------+-----------------------------------------------------------+
> +
> +QCOM_SCMI_GET_PARAM
> +~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x11
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 ext_id     |Reserved, must be zero.                                    |
> ++------------------+-----------------------------------------------------------+
> +|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 param_id   |Serves as the token message id for the algorithm string.   |
> ++------------------+-----------------------------------------------------------+
> +|uint32 buf[]      |Serves as the payload and store of value for the specified |
> +|                  |param_id and algorithm string pair.                        |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
> +|                  |by the chosen algorithm string and the result is copied    |
> +|                  |into buf[].                                                |
> +|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
> +|                  |matches.                                                   |
> +|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
> +|                  |is rejected by the algorithm string.                       |
> ++------------------+-----------------------------------------------------------+

..missed this last time...so you should add here also a field describing
the reply buf right ? (as it happenns really in your code) something
like:

 ++------------------+-----------------------------------------------------------+
 +|uint32 buf[]      |Holds the payload of the result of the query.	 	 |
 +|                  |					                         |
 ++------------------+-----------------------------------------------------------+

Thanks,
Cristian

