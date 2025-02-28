Return-Path: <linux-arm-msm+bounces-49816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF57FA4914F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 07:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE4673B5DD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 06:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A08A1C5486;
	Fri, 28 Feb 2025 06:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VqqStP43"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD3B849C
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740722783; cv=none; b=Wb+rJNA9NhpHqFdhvGH+gQmwkUfI8vvSTM79A6MelbxInLst8gfHNXyi+NNZYW+51nk2xEBwQpKwMK43Nr0i4NIiKTbrQyiY8bZk3vbtgYd8ETRR/y4ZAE3rDuKYQ+aHGWe4gGbyNOsfNNYnSoBNWPfSGhBvmRMRrbRYcYUcdZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740722783; c=relaxed/simple;
	bh=JqusIMvVL0UFmx1UCVfD1GhzK+cvCugHV/vJBworDMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/yVKYvMdqONr0hk5LG3axmQISB61mYckac1EtYD0KXi5PEAvAt9O2yW+S2Q8PyhcfuZkfcWXSAYPvxdCgYCOOnFs2k1upDIs1bpwrItJiEuTfR5GfUKr1JxPDaSUJSLYmUHYCScrzUDYO/BHooagNpjlN3882CLe2XEtO95dng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VqqStP43; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-546267ed92fso1776683e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 22:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740722776; x=1741327576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=br1sUID2XECp78Ip2pAJh/qbxtPKzeVh8yZz/p0eCOk=;
        b=VqqStP43+2dIEtaRlrHjlv4DDdwOZ8MvJ++Eyf6wIG60wAT3LxESMPZusoCU5flnAD
         VPw7yo23gIJBRDshlsiBiUdhkjI1K7GrS52XJTYhL4fEGo009toLPmK4Rh5csAVfX46S
         dzczoV+G6czfF9Ux+Rhu1zs+b/OY25QyR+AX26rSa+i/esdKXmOl4kaIbE+KYzfHRH1a
         keYUPdB1LDiICj+s0OlX5tpVW/l5YALY5z9AfEbJxnrHrE3+maKYVRl6XsYBI2Y9O5Ax
         2AxUkbwKYOEBgvNTHpE4ac3NOiRtkBaV73Rak48mI8NYd35ZpVFQsQLua60DrForZ/VB
         xCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740722776; x=1741327576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=br1sUID2XECp78Ip2pAJh/qbxtPKzeVh8yZz/p0eCOk=;
        b=KTL/3sXVcsEwsSLJL/mE0tfYy9AcUBKsB1TKd9UBU3rXpTVU4aPJK8/qqAyS53OT0P
         X0r39YSS1pyVHXKSkQHnGaVL0+krGMM5Qrn2pWKWEfkTnt4aUMdP6AkGeom+0CGzfRWk
         omFuxBzNup7wfbwbEsDqy/b5AHmtJBeEx8hv3/MX0eNbbnm7jIX2Sx1gw2w++NqGJA5P
         J7+IJI0Ms7WR4EcH4Y0HT/6N6hjpy7H7MeeBi3uwqbTWHPl2Fq06NSPVqKCi1Ztxlm+o
         SvZmCYOCdpL9aksPzJWlLosg8ISRSkuV4tAgb+4/KvWsEBvdGr61vCBMWB1elyMIU4NW
         1iFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjwKXE6u0SgQIv0vcWA4nnM+m2LIUGWMeeebjj/QgfE41jlE8mcuqq++9YU356iXaiv0JYbfmRW8xsPK4p@vger.kernel.org
X-Gm-Message-State: AOJu0Yy98qWc9TRi94mt/r19au5sKQarm+b7FG+gUMAiOxsBwBaubupA
	4hDf8kjbvfv5LC0btGfd6WhdYVCTQeB2hRL3T3sBc0xhQssHDLYp7vDO+N21PgA=
X-Gm-Gg: ASbGncvxOBrL1/XC1o4sTJJCTQrdaTwgpb+7uSyUQ+uGNU4Y9Sf1so6aeh3n5ypJ9h9
	XrW+283NoUMBWpkEKqvGHXJqgWATq8v3WngzVirI0iYN0X3TZW4SsQUsvHBqlIGaNnCU8t46MQK
	bBnuwTWTVVsqPcg7UxZOjHTsgZJYRcGyuXJxO1FGO6SAw4rl2XINRi2PyaVRvhEFQ4N/z+QkhXV
	K6GM1tHhuDBM8o9ACa/d2Enf9puTBYck+jce95WBZ8qbfhIYysl9aHd71sQDwu1PrerJV1vRl/C
	/+JcqAJHSXgEamyR/oMg4VfBVfs1fzl+hqT1/3QAxDQ1vbYRhQeCoVVAI1+HZjtHKPEnvGaNf/z
	whyADMg==
X-Google-Smtp-Source: AGHT+IE4qQn9kKkpyN7ObLIhf4a/RYfZo/3gs6I48/5OZv4eBm789sqVDGis5DXi+FZ8ZgIqAP7Rog==
X-Received: by 2002:a05:6512:114b:b0:545:3032:91fd with SMTP id 2adb3069b0e04-5494c3282c2mr986947e87.16.1740722776122;
        Thu, 27 Feb 2025 22:06:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443be5c1sm386975e87.175.2025.02.27.22.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 22:06:14 -0800 (PST)
Date: Fri, 28 Feb 2025 08:06:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH V3 1/2] dt-bindings: mailbox: Document qcom,tmel-qmp
Message-ID: <velvqajyhrdaipmqmsduv3l3dsv56sy4rfukwm2hrdvh47hgqx@7sbnrgkzsn67>
References: <20250228045356.3527662-1-quic_srichara@quicinc.com>
 <20250228045356.3527662-2-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228045356.3527662-2-quic_srichara@quicinc.com>

On Fri, Feb 28, 2025 at 10:23:55AM +0530, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> TMEL SS provides different kinds of services like secureboot, remote image

What is TMEL SS? What is Q6, etc? Please provide a definition on the
first usagem both in the commit message and in the bindings text. And in
the cover letter. Also, in some places you use TME-L instead of TMEL.
Please settle on one of those, unless there is a difference between
them,

> authentication, key management, crypto, OEM provisioning etc. This patch
> adds support for remote image authentication. Support for rest of the
> services can be added.
> 
> The QMP mailbox is the primary means of communication between TMEL SS and
> other subsystem on the SoC. A dedicated pair of inbound and outbound
> mailboxes is implemented for each subsystem/external execution environment
> which needs to communicate with TMEL for security services. The inbound
> mailboxes are used to send IPC requests to TMEL, which are then processed
> by TMEL firmware and accordingly the responses are sent back via outbound
> mailboxes.
> 
> It is an IPC transport protocol which is light weight and supports a subset
> of API's. It handles link initialization, negotiation, establishment and
> communication across client(CPU/BTSS/AUDIOSS) and server(TMEL SS).
> 
>    -----------------------------------------------       ---------------------------------------------------
>   |                                              |       |                                                 |
>   |                 SOC  CLIENT                  | SOC   |                TMEL  SS                         |
>   |                                              | AHB   |                                                 |
>   |     ----------    ---------   ---------      |       | ------    -------     --------    ------------  |
>   |     |        |    |       |   |       |      | WO    | |     | R |     |     |      |    |SERVICES   | |
>   |     | CPU    |<-->| TMEL  |<->|       |------------->| | IN  |-->|     |     | TMEL |    |--------   | |
>   |     |        |    | COM   |   | QMP   |      | RO    | |     | W | QMP |<--->| COM  |<-->| a) ATTEST | |
>   |     |        |    |       |   |       |<-------------| | OUT |<--|     |     |      |    | b) CRYPTO | |
>   |     |        |    |       |   |       |      |       | |     |   |     |     |      |    | .. more   | |
>   |     ---------     ---------   ---------      |       | ------    -------     -------     ------------  |
>   |                                              |       |                                                 |
>    -----------------------------------------------       --------------------------------------------------
> 
> This binding describes the component responsible for communication between
> the TMEL server based subsystems (Q6) and the TMEL client
> (CPU/BTSS/AUDIOSS), used for security services like secure image
> authentication, enable/disable efuses, crypto services. Each client in the
> SoC has its own block of message RAM and IRQ for communication with the
> TMEL SS.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
> #V3:

Creative. Where are the previous changelogs?

> ---
>         Fixed wrappings.
>         Made mailbox-cells as a required property and changed value to '1'.
>         Fixed to use compatible as filename.
>         Renamed compatible as per Krzystof's comments.
>         Dropped unused label.
> 
>     Following tests were done and no issues.
> 
>        *)  Checkpatch
>        *)  Codespell
>        *)  Sparse
>        *)  kerneldoc check
>        *)  Kernel lock debugging
>        *)  dt_binding_check and dtbs_check
> 
>  .../bindings/mailbox/qcom,ipq5424-tmel.yaml   | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml b/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
> new file mode 100644
> index 000000000000..2e3c79add405
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/qcom,ipq5424-tmel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm TMEL IPCC channel
> +
> +maintainers:
> +  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
> +
> +description:
> +  TMEL SS provides different kinds of services like secureboot, remote image authentication,
> +  key management, crypto, OEM provisioning etc. This patch adds support for remote image
> +  authentication. Support for rest of the services can be added.
> +
> +  The QMP mailbox is the primary means of communication between TMEL SS and other subsystem on
> +  the SoC. A dedicated pair of inbound and outbound mailboxes is implemented for each
> +  subsystem/external execution environment which needs to communicate with TMEL for security
> +  services. The inbound mailboxes are used to send IPC requests to TMEL, which are then processed

This string is 100 chars long. What is the recommended wrapping
boundary?

> +  by TMEL firmware and accordingly the responses are sent back via outbound mailboxes.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,ipq5424-tmel
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  "#mbox-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - mboxes
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mailbox@32090000 {
> +        compatible = "qcom,ipq5424-tmel";
> +        reg = <0x32090000 0x2000>;
> +        interrupts = <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>;
> +        mboxes = <&apcs_glb 20>;
> +        #mbox-cells = <1>;
> +    };
> +
> +...
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

