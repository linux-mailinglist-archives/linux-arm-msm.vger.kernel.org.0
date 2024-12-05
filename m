Return-Path: <linux-arm-msm+bounces-40529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCA99E5A47
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19117284FB3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 15:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAD421C9F8;
	Thu,  5 Dec 2024 15:53:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848D61DACA8;
	Thu,  5 Dec 2024 15:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733413994; cv=none; b=qHU5ZJum3yA8FDMOkesbAL3xDvbgliuYxL/YlLPzgvlhNVAl0ywvZvzZqo9LUgCYckoPXwPVUf8cJVf3u5GyfYpQYx1H9OoIZi1aYWvcjjjhN7ErZJRQ6sqbKekMRyCG9oYIvrtegv6TcpMfrRsyYEwoOTP+nsZNustgA0/Gu8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733413994; c=relaxed/simple;
	bh=vuKyWHgORrp0k28779tslLFoEq8MH6p+Hz92RvO3xBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6/YKUXVdXc53Gv6SJHACJbF9zhgC3O+uSBZx59/avQ/P15sX5XhPpNso42Edtwshq5a40iWHwlGvvF5TZJnBGe+q9m8g876ueZVeXKr2G0mdXNfNWb+mWAaJ3KbUzjOibLdaIpeaOPCWgW3sDNQDuuhLiZBrkKQFt/Hvy3Hm1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 786971063;
	Thu,  5 Dec 2024 07:53:38 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3CDF3F5A1;
	Thu,  5 Dec 2024 07:53:08 -0800 (PST)
Date: Thu, 5 Dec 2024 15:53:06 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: <cristian.marussi@arm.com>, <andersson@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, <konrad.dybcio@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
	<quic_kshivnan@quicinc.com>, <arm-scmi@vger.kernel.org>
Subject: Re: [PATCH V5 1/2] firmware: arm_scmi: Add QCOM Generic Vendor
 Protocol documentation
Message-ID: <Z1HMYt8kQ72rRMZ0@bogus>
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
>

I can understand the missing description for the above commands, but for the
list below, no. What does QCOM_SCMI_SET_PARAM do exactly ? All I can
understand is the syntax of the interface with below details. What is the
algorithm string ? Is it fixed or choice of the caller ? If fixed, can we
have that list here ?

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

And how is it related to the algorithm string ? Sorry details please. Based on
the quality firmware we have seen so far, I will be more pedantic, you need to
be patient to make any progress and I don't want to deal with the Qcom
firmware mess with all these. I will make you specify every single detail and
the code will just be compliant with that. Anything else will be firmware bug
that needs to be fixed in the firmware. Sorry, I don't see any other approach
will make anyone's life easier here.

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
> +|                  |matches.

So there is a fixed list from the above statement IIUC. So kindly list them
here in this document. I may need to follow the last version but I would
prefer you to explicitly mention how is the MEMLAT protocol in the previous
version gets used here ? I just can't understand that from these description.

> +
> +QCOM_SCMI_START_ACTIVITY
> +~~~~~~~~~~~~~~~~~~~~~~~~
> 

What is this activity ? How will the firmware know what is that ? All possible
details please if there are all hidden in the buffer too.

-- 
Regards,
Sudeep

