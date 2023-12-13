Return-Path: <linux-arm-msm+bounces-4502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 232AA810B44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 08:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCEBF1F21468
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 07:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08779179A5;
	Wed, 13 Dec 2023 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcq0pfR0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11091D3
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 23:15:48 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a1ef2f5ed02so713601966b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 23:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702451746; x=1703056546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMTwt7L6rgKnu3PUy8qh8FUCF9fFCzjsiWdGKd+O9a4=;
        b=pcq0pfR0y1hcqMtgToMZYxK2f9BkZFZg07gT1bLleAhKLU8HxgjgkqS3cC0MfyytQP
         z7tgY5jDRYcCJmtOkxyW8+nuZH8vdW/D8VoHpsIzfyd2FyHtOQCXVO4T09LmJfzl70aN
         sahsIGJjCIEeQEYM6J7C9sYYK69E9Za7agPICKTYXDUdOh5LjT7C+qSLa1UO62lz24NM
         GBA6X2YHp7iiQqm40kshkZbz+L4a32euWONXU4D+msBS7RJYedPutkZnZqsguhDTZkxR
         enruOmO3KDpf/2Ykg9iKhs8320BRXjbG/IoRb6wUd+XAZMpYUahhJiEeWyK0WxkuZl0A
         d0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451746; x=1703056546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tMTwt7L6rgKnu3PUy8qh8FUCF9fFCzjsiWdGKd+O9a4=;
        b=Ytr4FubsVHQUSDn8qSQILPvEc7dBzLkbCISdBknikATpVqB0ZOJZSxbmQQzs+UC96Q
         1wek7wYD1w3WKqhzYrY/nCDg6tJQ6S3fbQ83qzmn3Jd9U8HLn8z/A7//SvoqHobfG+hn
         6zrrzb7GCQjotNVXJzHfv5o9jf4qu/TQvDO1qj6zVBtAA0homKTTX7iglMNCJWtwxgUC
         HKD4cuGfLuTp2JE0aREoZUk3Qatfd7F2oEmDLeI9ZeFQNFB5FYL1nCUcjhOMJKXVrfHu
         Ih1zNb9SEqdfiOYa92FOXrnn7zUATCBsPs5fn+KjJvdRa/drORU9dFYZeD/c02lklVOg
         Ojog==
X-Gm-Message-State: AOJu0Yx4D/DzD3xpBrLIl9XoH1zIs5tAnLatg7q39QRcb5+LXP8g08iM
	8Oecj5ko3HqA1s3kM8061LrW6w==
X-Google-Smtp-Source: AGHT+IGsrKBnPBDqJ4VH7yA/4zgFx/jx29FZ3j6NGsplz0s+1Bb3O0BwU6x9CkfwnMlKKrFhbWUseg==
X-Received: by 2002:a17:906:5ace:b0:a1e:82b2:e2fc with SMTP id x14-20020a1709065ace00b00a1e82b2e2fcmr3715564ejs.120.1702451746469;
        Tue, 12 Dec 2023 23:15:46 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id hu19-20020a170907a09300b00a0ad580e1b6sm7196336ejc.48.2023.12.12.23.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 23:15:45 -0800 (PST)
Message-ID: <24fb0b25-0139-4370-864c-839ae931f847@linaro.org>
Date: Wed, 13 Dec 2023 08:15:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: dwc3: Clean up hs_phy_irq in
 bindings
Content-Language: en-US
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Johan Hovold <johan@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 quic_ppratap@quicinc.com, quic_jackp@quicinc.com
References: <20231211121124.4194-1-quic_kriskura@quicinc.com>
 <20231211121124.4194-2-quic_kriskura@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231211121124.4194-2-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/2023 13:11, Krishna Kurapati wrote:
> The high speed related interrupts present on QC targets are as follows:
> 
> dp/dm irq's
> These IRQ's directly reflect changes on the DP/DM pads of the SoC. These
> are used as wakeup interrupts only on SoCs with non-QUSB2 targets with
> exception of SDM670/SDM845/SM6350.
> 
> qusb2_phy irq
> SoCs with QUSB2 PHY do not have separate DP/DM IRQs and expose only a
> single IRQ whose behavior can be modified by the QUSB2PHY_INTR_CTRL
> register. The required DPSE/DMSE configuration is done in
> QUSB2PHY_INTR_CTRL register of phy address space.
> 
> hs_phy_irq
> This is completely different from the above two and is present on all
> targets with exception of a few IPQ ones. The interrupt is not enabled by
> default and its functionality is mutually exclusive of qusb2_phy on QUSB
> targets and DP/DM on femto phy targets.
> 
> The DTs of several QUSB2 PHY based SoCs incorrectly define "hs_phy_irq"
> when they should have been "qusb2_phy_irq". On Femto phy targets, the
> "hs_phy_irq" mentioned is either the actual "hs_phy_irq" or "pwr_event",
> neither of which would never be triggered directly are non-functional
> currently. The implementation tries to clean up this issue by addressing
> the discrepencies involved and fixing the hs_phy_irq's in respective DT's.
> 
> Classiffy SoC's into four groups based on whether qusb2_phy interrupt
> or {dp/dm}_hs_phy_irq is used for wakeup in high speed and whether the
> SoCs have hs_phy_irq present in them or not.
> 
> The ss_phy_irq is optional interrupt because there are mutliple SoC's
> which either support only High Speed or there are multiple controllers
> within same Soc and the secondary controller is High Speed only capable.
> 
> This breaks ABI on targets running older kernels, but since the interrupt
> definitions are given wrong on many targets and to establish proper rules
> for usage of DWC3 interrupts on Qualcomm platforms, DT binding update is
> necessary.

This still does not explain why missing property has to be added as
first one, causing huge reordering of everything here and in DTS.

If pwr_event is required and we already break the ABI, reduce the impact
of the change by putting it after all required interrupts. Otherwise
please explain here and in commit msg why different approach is taken.

Best regards,
Krzysztof


