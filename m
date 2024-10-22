Return-Path: <linux-arm-msm+bounces-35393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC279A9FDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 12:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BA7C1F23591
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32B6199FA9;
	Tue, 22 Oct 2024 10:22:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7450B18E02D;
	Tue, 22 Oct 2024 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729592574; cv=none; b=o3xCZ5oanVFOeu/4CFIrc4JE1EKOIuWNXAjJMPgqfevVaVwBj3n9b1LMPYcdLeq5OmfUI+DIoIWJgXHbM4WO/9y69o6iE1Jm2vJcl/tBTaqaHp9uHg118ZEZJNHk+xAosMqGTO9Ox5LbUzDtHS8syijIvYRMoJQ7onZ+Dax92s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729592574; c=relaxed/simple;
	bh=z2Yhmilg+UYDHUsb/vztXERraNrcfmPCLPaxc8sntoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZVcDUtugiVMnCr9LUd1KbSn+95eayj+xBdwLo1kfEVKe1JG8F/ZfBM+Vj2J0obq7Y3Ia8HguA106+Yx48iezr1xRsWTI+Q+jtvrmBVjxmENLpYxIJ78td2nd8ZHvMnq73AGVwJxNz9oD4aMFFSXGz5rmerpymPhyHHnMC4Hu3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4D77497;
	Tue, 22 Oct 2024 03:23:21 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B16EC3F71E;
	Tue, 22 Oct 2024 03:22:49 -0700 (PDT)
Date: Tue, 22 Oct 2024 11:22:47 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 2/5] firmware: arm_scmi: Add QCOM Generic Vendor
 Protocol documentation
Message-ID: <Zxd89zenQAzafGpS@pluto>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-3-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007061023.1978380-3-quic_sibis@quicinc.com>

On Mon, Oct 07, 2024 at 11:40:20AM +0530, Sibi Sankar wrote:
> Add QCOM System Control Management Interface (SCMI) Generic Vendor
> Extensions Protocol documentation.
> 

Hi Sibi,

a few remarks down below.

> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  .../arm_scmi/vendors/qcom/qcom_generic.rst    | 210 ++++++++++++++++++
>  1 file changed, 210 insertions(+)
>  create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> new file mode 100644
> index 000000000000..1ee6dabaac23
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> @@ -0,0 +1,210 @@
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
> +|uint32 attributes |Bits[8] Set to 1.                                          |
> +|                  |Bits[0] Set to 1.                                          |
> ++------------------+-----------------------------------------------------------+

Mmmm, this does not explain so much what are those bits and what values
they can indeed assume :P ...

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

And what abot the size of this payload ? .. so you are relying on the
fact that the transport will add the total message length at that layer
and so the server can determine where the valid payload ends...

...it means the server will have some expectations about the payload length
based on the param_id and will check against the received transport-advertised
message-length, am I right ?

...BUT what if you end up with multiple versions of this protocol in the future,
with varying payload lengths for the same param_id...REMEMEBER that the server
cannot know which version of a protocol the client is running (while the client
can see what the server runs) UNLESS you implement also NEGOTIATE_PROTOCOL_VERSION
for this protocol...

...so without an explicit length nor the NEGOTIATE_PROTOCOL_VERSION you wont be
able in the future, server-side, to be sure if you are assumnig the right payload
length for the right version that the client is speaking...so at the end you
wont be able to support multiple versions of the protocol even if the Kernel
can support all of those versions...do you see what I mean ?

I think that would be advisable to implement NEGOTIATE_PROTOCOL_VERSION
if you dont want to carry an explicit size in the message for this payload...

...or am I missing something ?

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

Similarly, no payload length means you will have to code some builtin
check to verify the length of the message that you have received against
the specific version that the server is running...this is NOT so
problematic here as in the _SET above since the client/agent DOES know which
protocol version the server is running...

...it is a bit odd, but indeed similar to other variable sized SCMI messages in
standard protocols that sports optional fields in the reply, for which, similarly
you have to check the version of the protocol to desume the size of the message
based on the presence or not of some fields...

> +
> +QCOM_SCMI_START_ACTIVITY
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x12
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
> +|                  |and is generally used to start the activity performed by   |
> +|                  |the algorithm string.                                      |
> ++------------------+-----------------------------------------------------------+
> +|uint32 buf[]      |Serves as the payload for the specified param_id and       |
> +|                  |algorithm string pair.                                     |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the activity performed by the algorithm string |
> +|                  |starts successfully.                                       |
> +|                  |NOT_SUPPORTED: if the algorithm string does not have any.  |
> +|                  |matches or if the activity is already running.             |
> ++------------------+-----------------------------------------------------------+
> +

Same consideration as above...being a SET-like operation with a variable
sized field in the request AND no explicit payload length, you will have
to derive the size from the message length BUT since you doint even have
implemented NEGOTIATE_PROTOCOL_VERSION in the future any kind of check
will become impossibe server side if you will have multiple protocols
with varying sizes for buf depending on the protocol version

> +QCOM_SCMI_STOP_ACTIVITY
> +~~~~~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x13
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
> +|                  |and is generally used to stop the activity performed by    |
> +|                  |the algorithm string.                                      |
> ++------------------+-----------------------------------------------------------+
> +|uint32 buf[]      |Serves as the payload for the specified param_id and       |
> +|                  |algorithm string pair.                                     |
> ++------------------+-----------------------------------------------------------+

Same.

> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the activity performed by the algorithm string |
> +|                  |stops successfully.                                        |
> +|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
> +|                  |matches or if the activity isn't running.                  |
> ++------------------+-----------------------------------------------------------+

Thanks,
Cristian

