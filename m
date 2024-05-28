Return-Path: <linux-arm-msm+bounces-20747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB98D1B65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BE462823E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 12:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1040216D4FD;
	Tue, 28 May 2024 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="DMtObHrW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBCA16D4E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716899768; cv=none; b=rsy8wY+dqqWKuH5X22UX84CGeS3hZYYxkeGO3Og0aUBvbA5gBR98kQXO7RciSFJYZ7I5zExjY95jsnNKbRWReAGVv8ZbZHghS0uB+7bPc4R3rARVc7vKuHwBBSEQm20uvVi3htaR67yRYvE4arWBHTLu/zQZQy0hr+EvglyPH/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716899768; c=relaxed/simple;
	bh=dxo+VD6etbgWoCyr/ttW9EQDmp7oGUltI2KkYjRfzQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0OauA4Y2UxZEg8hf/Pa4SmkeZSaMbyseRMrxbtL7hOjgck1EK+FpnKDGY0JwjM4rPjrvaGt+u2jnTTXKRWOxfB+PyhyPnpFp+SkLkLpFGo0I+FKuT6HtZo4sr31Bx5/tECG3tR1C7I2BWtaYc2fRydBZFzmdESjjTHjoqEGajo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=DMtObHrW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4211249fdf4so6081925e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 05:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716899763; x=1717504563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cKjV4fgQjqu5wh6AYtxjbKfildzmBjMlCCtP3nDdjQo=;
        b=DMtObHrWOcYrcPSrmZ5dzAXS0ov6++6jbbvZWyUOnTOdlFXIJx183q0QTJveCoH3/4
         GiKdHFoc5Qn9n8/iSvudwgrU693pxRjmy2KYjkrvb7DyXbbCWF0A3FsHH4XfY5t1FGSD
         pOM/56YpMO+m/CO3dTFOvvtH+UuGYMdvZOchRESfAv8TgD3Jbgh1bVj2mFgCNZi/aQN5
         rpuQorCQJyVaPJlq4DyWPeEbffdnIsTtoV66rfrCtTjIr8YC86hWg0QDhMgnQRz+va2q
         IbGKbhH3hwNL7sHAzuSzHrg1aDFAC+3UgwYVK9RLydDYg0ng6zUuKr9y4yh0SpzMbR1E
         gNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716899763; x=1717504563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKjV4fgQjqu5wh6AYtxjbKfildzmBjMlCCtP3nDdjQo=;
        b=PAGqbm8hjEcoj2tBw+PT62B7mJsem537DyiTtfpeRMwna03+LqeCUf8ah0KNKmnmqS
         Idn+6U/0ySzmbE++5H/VlahMD6dVJOkxHIbaN+l1u3tnv4jc0GsOtHloKiPmFGieD9Jq
         gs5O67kHSNWoxireup/Vq+kYte5Bb6SVvHabf+fxinvimbcNn25Xsku7vZdShSYRmr9d
         rTbnrn7sayL9XYaR0IAFRspguRE2txMSMqf2IAQuVlYCjgHzS7oEZVRMAtMzr3QEyETK
         OVklEvLFlRoKqZlI0ekAjHRz5xlipTVArcb3iTfgguYHEnApleTE0g9IQ/CE+gQMUWx9
         qd2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDD37a2JCSte8T/X7iLzmXHDR37T04oUEjNYNl2lMxa0jvElgQL6NXkQ/AyL8LUpUHwSh2JoP5nG7It54Xl8W5p3YQx+S5TBZOa3GUzw==
X-Gm-Message-State: AOJu0YyiaX/SFSEBWOjPNzKrz+FJMhyRA5Xgdn4DRHsQcZcb/7Qf+Nh3
	JXQHOgRUPA0CR56YCXHYRELxJANR/5grDLlGPZjXdvQGTYUFGlKzRbSTWnIPXuQ=
X-Google-Smtp-Source: AGHT+IH/nIHnbKuaQ02BEZC+tUBPKkKNzrItqWNXK99sKCPB3sE+lmgdRWRIDZRs8kvy1AAgHOeL9w==
X-Received: by 2002:a05:6000:248:b0:355:21f:be1f with SMTP id ffacd0b85a97d-35526c155b3mr7235867f8f.4.1716899763394;
        Tue, 28 May 2024 05:36:03 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7d88esm11676251f8f.19.2024.05.28.05.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 05:36:03 -0700 (PDT)
Message-ID: <74ab64e2-9bb4-4e98-9f2f-f6402ba42c08@freebox.fr>
Date: Tue, 28 May 2024 14:36:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Kalle Valo <kvalo@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k
 <ath10k@lists.infradead.org>, wireless <linux-wireless@vger.kernel.org>,
 DT <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr>
 <171560975908.1690511.498631481702370762.kvalo@kernel.org>
 <3464a980-36a7-4ed2-b2dc-be8fd9091b06@freebox.fr> <87zfsa6ybl.fsf@kernel.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <87zfsa6ybl.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2024 12:11, Kalle Valo wrote:

> Marc Gonzalez writes:
> 
>> On 13/05/2024 16:16, Kalle Valo wrote:
>>
>>> Marc Gonzalez wrote:
>>>
>>>> The ath10k driver waits for an "MSA_READY" indicator
>>>> to complete initialization. If the indicator is not
>>>> received, then the device remains unusable.
>>>>
>>>> cf. ath10k_qmi_driver_event_work()
>>>>
>>>> Several msm8998-based devices are affected by this issue.
>>>> Oddly, it seems safe to NOT wait for the indicator, and
>>>> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
>>>>
>>>> Jeff Johnson wrote:
>>>>
>>>>   The feedback I received was "it might be ok to change all ath10k qmi
>>>>   to skip waiting for msa_ready", and it was pointed out that ath11k
>>>>   (and ath12k) do not wait for it.
>>>>
>>>>   However with so many deployed devices, "might be ok" isn't a strong
>>>>   argument for changing the default behavior.
>>>>
>>>> Kalle Valo first suggested setting a bit in firmware-5.bin to trigger
>>>> work-around in the driver. However, firmware-5.bin is parsed too late.
>>>> So we are stuck with a DT property.
>>>>
>>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>>> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>>>
>>> 2 patches applied to ath-next branch of ath.git, thanks.
>>>
>>> 71b6e321e302 dt-bindings: net: wireless: ath10k: add
>>> qcom,no-msa-ready-indicator prop
>>> 6d67d18014a8 wifi: ath10k: do not always wait for MSA_READY indicator
>>
>> Hello Kalle,
>> What version of Linux will these be included in?
>> (I don't see them in v6.10-rc1. Are they considered
>> a new feature, rather than a fix, and thus 6.11?)
> 
> Yeah, these commits will go to v6.11. Because of the multiple trees
> involved (ath-next -> wireless-next -> net-next -> linus) we need to
> have ath.git pull request ready well before the merge window opens and
> these commits missed the last pull request.
> 
> Yes, we are slow :)

My understanding of the merging process was that

- new features are queued for the next cycle,
so vN+1-rc1, or vN+2-rc1 if the submission came too late (after ~rc6) in cycle N

- fixes are queued for the fixes batch in the same cycle

This patch series is handled like a feature rather than a fix?
(To me, it fixed broken behavior in the FW, but I understand
if the nature of the changes require a more prudent approach.
Though they are disabled for everyone by default.)

Regards


