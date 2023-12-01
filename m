Return-Path: <linux-arm-msm+bounces-2869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E55D800A4A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 13:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 296B2281C01
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 12:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8278022080;
	Fri,  1 Dec 2023 12:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bf2IrbwD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C08B172B
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 04:02:28 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3316d3d11e1so1313275f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 04:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701432146; x=1702036946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MSQnM1vQQkiijwl5GySI5P/M85/cHy7IVYxrkl5uoyo=;
        b=Bf2IrbwDabwiQ3Vu2B7jSJisomyFxYsRV3NiBJRxDhCDIU2ziId3VjPvB3rRKucGau
         OsXdCj+gKS6XqNrM3w5PlLO2USgdl3/tZYPPXWOP4Rn7ThvqCHwYC99BddPcW1CsW6dR
         bjiiRWYm4H6BY8HGmepc1DLLkbdGaaLMQ3VHqy+JJwCyvsOJMS+8sLdIN2qntPBM4U57
         zUTop/0nw/pgBXC1sfjo8Z1KoJ338MidXo9DnFPd3y95deAIj2A7X0vAGJvjtNgcPt0t
         NYiz+X/xQHstOjrqmaGaR5Qphkeo2Z23PvxcZ9W8JK0JD6/PuoQ6X6iDbGCuW4I9ILc5
         GBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701432146; x=1702036946;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSQnM1vQQkiijwl5GySI5P/M85/cHy7IVYxrkl5uoyo=;
        b=kwIoiZlso4RfaJVq5FRMxlU16TvYCizhWW2NscLmRDn1bIqeJ6UAlC7SqrqXiY1WOj
         qbZDcTEj3CI9FqpP3GnTCuCIVcgNVJU4o52Xng3vKcsIavG3/esazKSAAGo8hdMxZOxW
         2KQNHf+xvYaOYMaTn/Zrpud03iwQxuTT6f1JyydKdgU/7SouZhFIjozKArVRvvdApV1O
         wdk9tw03hEPEAgJWzWi3kAt4ZCz2KJdV16KmsV9LpJMLxdLc1kATttjCknn55skdiUJb
         pfyeJirBGtPE9ZNDQaAT36uxryHtg0PEI6nott02XM0JhI0FPaF8axfFxhN5h7YugpLL
         3NgQ==
X-Gm-Message-State: AOJu0YxgiG1LEw0Vwl0jUMPd60fslQHPizB2k0kkP3GBdXmCYlFFPIwm
	cgNkS6d4VjzgEVoUSGqNhgcpsQRc4HjAGSKNY1Y=
X-Google-Smtp-Source: AGHT+IEd9n7ghSa9QGa60fqnE6pvHoZaXViY7WK6tfO5zbK/xM8uZHTuwvB4nwuA80faTO6wR4pIWg==
X-Received: by 2002:a5d:4fd0:0:b0:333:2fd7:95ff with SMTP id h16-20020a5d4fd0000000b003332fd795ffmr606690wrw.58.1701432145841;
        Fri, 01 Dec 2023 04:02:25 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3390392wrb.105.2023.12.01.04.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 04:02:25 -0800 (PST)
Message-ID: <268bda81-d5e4-4e34-8cc0-da1c4825444c@linaro.org>
Date: Fri, 1 Dec 2023 13:02:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issues bringing up WCD9385 codec on SC7280/QCM6490
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Johan Hovold <johan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org
References: <CXCXIAY8RBVK.2Y9W66THN9QH2@fairphone.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CXCXIAY8RBVK.2Y9W66THN9QH2@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/12/2023 11:35, Luca Weiss wrote:
> Hi all,
> 
> I'm trying to get audio working on qcm6490-fairphone-fp5 (the SoC is
> sc7280.dtsi-based).
> Unfortunately the current sc7280.dtsi only supports directly interfacing
> with the hw blocks (lpass_aon/lpass_hm/lpass_audiocc) and not using
> q6afecc, but I think I've done this "conversion" correctly, based on
> other mainline SoCs and downstream dts.

Eh, you probably duplicated a lot of existing work. Here it is:
https://lore.kernel.org/all/20230526113258.1467276-1-quic_mohs@quicinc.com/

> 
> So, to the problem: I've added the nodes for the WCD9385 codec found on
> this device which is handling the microphones (and analog audio over
> USB-C). But I can't get it to work. I believe the first problem I saw
> was the error "soundwire device init timeout" where I saw that the wcd
> tx & rx devices (on the soundwire bus) only appeared after the timeout
> of 2 seconds expired and wcd938x driver probe failed. After bumping this
> to something higher (20 seconds) this was resolved.

Please describe the tree you are working on. This was fixed some time ago.

> 
> But now I'm having these errors in the initialization of the wcd
> devices.
> 
> [   45.651156] qcom-soundwire 3230000.soundwire: swrm_wait_for_rd_fifo_avail err read underflow
> [   45.651173] soundwire sdw-master-1: trf on Slave 1 failed:-5 read addr 41 count 1
> [   45.651182] wcd9380-codec sdw:0:0217:010d:00:3: SDW_SCP_INTMASK1 write failed:-5
> [   45.651186] wcd9380-codec sdw:0:0217:010d:00:3: Slave 1 initialization failed: -5
> 
> After some more debugging and changing some timeouts I'm noticing that
> the swr devices appear immediately after pm_runtime puts the driver to
> sleep, qcom_swrm_irq_handler is called and then we get this:
> 
> [   45.531863] qcom-soundwire 3230000.soundwire: SWR new slave attached
> 
> The same also happens for the other soundwire controller
> 
> [   47.581067] qcom-soundwire 3210000.soundwire: SWR new slave attached

There were similar reports on the IRC, so I wonder if this is the same
issue?

Maybe wrong interrupt flag (like falling instead of rising)? I collected
over time also several ideas of fixes from Srini, not always ready to
upstream, but maybe they fix your issue? Did you try some of my audio
branches like n/audio-sm8450-sm8550-on-next?

Or maybe sc7280 needs to toggle the same CSR reset/clock bits as
sc8280xp (lpass-csr-sc8280xp.c)?

> 
> And this is currently where I'm stuck and can't really think of why this
> is happening.. I've double checked nearly all of the properties I've
> added/modified incl. wcd reset GPIO, wcd *-supply, lpi pinctrl settings.
> I believe the "read underflow" error here is because the whole driver
> stack is already trying to suspend so then communication fails. The real
> question for me is why the swr 'slaves' only appear exactly when
> pm_runtime is suspending everything.

Yeah, good question.

> 
> The only thing I've not really checked yet is qcom,rx-port-mapping &
> qcom,tx-port-mapping, there I've just tried the two different values
> found on the various devices but I don't think this is causing these
> issues. I will try to look further into this property at some point but
> with msm-5.4 downstream it's quite tricky to find where these values are
> represented (I got some hints from Krzysztof though where to look so
> I'll try to do that soon)
> 
> I'm attaching my current diff to the email, just note that it's based on
> one of my dev branches and is manually edited to remove some debug
> prints etc so it will probably not apply anywhere. I can also push the
> git tree somewhere in case that's helpful.
> 
> Regards
> Luca
> 


Best regards,
Krzysztof


