Return-Path: <linux-arm-msm+bounces-29108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE3958595
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 13:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2C6E1C24482
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 11:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D9818CC1A;
	Tue, 20 Aug 2024 11:20:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E17155C80;
	Tue, 20 Aug 2024 11:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724152840; cv=none; b=lrglayZsaUuW/7tB6SlHmBxCf8wzuyK/A9drTNv/yOk2jdb/Yw/uK4LnHTAHTjKv+cAxjCFB9zhQKNFght4tnPPJVNp2BnAbuSwM9skQL/lluRftvcwApzeoTPh4/6tlFtv9u0F6ZgMESyx/MVtirXe6SIi1N6d4oJYd6faMx+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724152840; c=relaxed/simple;
	bh=Au1yckoSCUXUgrrdigjhuQ0Zp4yrP2RtTGZIxjsiu3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYRFemVxGqWyczjfZxtdONun0D6ICuO6p6v1x5doZz6mc3cvCNy57v+YY2ns6+53ez9ATkLTvf5nViz5b/18vPGN1UZP3d3Fbu06eB9yIHK+LeDHzEAsca+rv1tGXXb87IsTo/wiZkMwVUZBE3TlZWRsunqfbs5IwwS7x0zY8k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37189d8e637so3225012f8f.3;
        Tue, 20 Aug 2024 04:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724152837; x=1724757637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YqNonoW+AXT4DFqG0cqXTVS5fYaya45lKpoOnLhQQI=;
        b=qSitCzkWnoYeho7x5swAUPc4Zy31XbPYXrDuGA370/BLuX2cL+Kk3SPLAo8VtOdujM
         4WKOADcQ/hmI2w9C8GqNfJPNlOIa1TOfPk/W7xd3r/yZyViYRTiSUNaJ7CB2lIs6onEG
         zEcVm9TTJd7TkhkEtVoYEVv1iT/XcP1rSqhjb9LoUp7eAZRKAGs/7oe/Ltg9X45I100j
         rL2oI3+EEgnHtFoxKy4K+JNohjW98IGxbxEmzF5hCFz0oHAz74bMyxJGthV0OiZSqLfh
         e5ASgxkiAKPKjFdyI6MQ5jmPh7O5AmPyf9etjz5wJazikrlqmkF7uWq14iKCIQO0uHVF
         57cg==
X-Forwarded-Encrypted: i=1; AJvYcCV1ii4E36dZiN+hcXiBGKm84R6X4irE+IJeEgplPHhU/fNYlgh0nQmtm/WeHs/oydgY0wOKRffAJhBZ1zmliQ==@vger.kernel.org, AJvYcCVZ+qu/1IrHEANxJ34cbFLnflya2QYTwNA8adgL7QY4DdmU4/LT+ANYBWya2jgRPdbWdYJW90LuEm9rZ9nU1HxfRw==@vger.kernel.org, AJvYcCW94vpjtpC6jI8euBrMoscUFe2Z2yd5TGSr3TY648+XmJ2uROUudPL+syo3UgFhnqQ8fSSaf4YFe0u5fOvA@vger.kernel.org, AJvYcCXZ9HIve6Pjjy3ip4lUAJv8XCQ596pr0+p0hytTkuqvBPeD17HsfRtNdCGSxQmhI0g1/7a8DUWTNkwO@vger.kernel.org
X-Gm-Message-State: AOJu0YwSeb9sp3015KUNzg7jK5LC3aJ1JxpGFZYnTsYx3SAHXgoyDJIM
	nOwPNQdAT9RD9mUbevd95+ZnFmxlPP/1WmQ2WmBoYSFbHBRtJMYm
X-Google-Smtp-Source: AGHT+IHEr21C0aY1t6Xf8SNHDmzvuwEc3DtDIQzCLlmVHlaBE3Cae0i7JJpirzSyu0Kq3f+wv+GIkg==
X-Received: by 2002:adf:e255:0:b0:371:9395:9c2d with SMTP id ffacd0b85a97d-371946a5ac4mr9567018f8f.55.1724152836890;
        Tue, 20 Aug 2024 04:20:36 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-371898b8ad6sm12890025f8f.114.2024.08.20.04.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 04:20:36 -0700 (PDT)
Date: Tue, 20 Aug 2024 13:20:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	q@krzk-bin.smtp.subspace.kernel.org
Cc: andersson@kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_viswanat@quicinc.com, quic_mmanikan@quicinc.com, 
	quic_varada@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Message-ID: <ticwyyycqlk2uqpiqckoqqnapqatw74s6f6tjqmmyt2d6siqqt@xxe2qdtr4c2c>
References: <20240820085517.435566-1-quic_gokulsri@quicinc.com>
 <20240820085517.435566-2-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240820085517.435566-2-quic_gokulsri@quicinc.com>

On Tue, Aug 20, 2024 at 02:25:14PM +0530, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Add new binding document for hexagon based WCSS secure PIL remoteproc.
> IPQ5332, IPQ9574 follows secure PIL remoteproc.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
>  .../remoteproc/qcom,wcss-sec-pil.yaml         | 125 ++++++++++++++++++
>  1 file changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
> new file mode 100644
> index 000000000000..c69401b6cec1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,wcss-sec-pil.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm WCSS Secure Peripheral Image Loader

...

> +
> +maintainers:
> +  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> +
> +description:
> +  WCSS Secure Peripheral Image Loader loads firmware and power up QDSP6

What is WCSS? Don't add random acronyms without any explanation.

> +  remoteproc's on the Qualcomm IPQ9574, IPQ5332 SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq5332-wcss-sec-pil
> +      - qcom,ipq9574-wcss-sec-pil
> +
> +  reg:
> +    maxItems: 1
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Firmware name for the Hexagon core

No, look how other bindings are doing it.

It looks like you develop patches on some old kernel, so please start
from scratch on newest kernel.

> +
> +  interrupts:
> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +
> +  clocks:
> +    items:
> +      - description: IM SLEEP clock

What is IM? Explain all acronyms.

What is SLEEP?

> +
> +  clock-names:
> +    items:
> +      - const: im_sleep

sleep? Are there different sleep clocks here?

> +
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: States used by the AP to signal the remote processor
> +    items:
> +      - description: Shutdown Q6
> +      - description: Stop Q6
> +

Do not introduce other order. First stop, then shutdown.

> +  qcom,smem-state-names:
> +    description:
> +      Names of the states used by the AP to signal the remote processor
> +    items:
> +      - const: shutdown
> +      - const: stop

The same.

> +
> +  memory-region:
> +    items:
> +      - description: Q6 reserved region
> +
> +  glink-edge:
> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
> +    description:
> +      Qualcomm G-Link subnode which represents communication edge, channels
> +      and devices related to the Modem.
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - firmware-name
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - qcom,smem-states
> +  - qcom,smem-state-names
> +  - memory-region

Keep the same order as in properties.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
> +    q6v5_wcss: remoteproc@d100000 {

Drop unused label.

> +      compatible = "qcom,ipq5332-wcss-sec-pil";
> +      reg = <0xd100000 0x4040>;
> +      firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mdt";
> +      interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
> +                            <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
> +                            <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,

Best regards,
Krzysztof


