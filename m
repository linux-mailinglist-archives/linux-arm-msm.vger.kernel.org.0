Return-Path: <linux-arm-msm+bounces-21262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82FE8D6123
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 14:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 251A41C20B65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 12:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CC11581E6;
	Fri, 31 May 2024 12:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KHS2iAly"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6AC757F5
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 12:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717156869; cv=none; b=EI4QUTkNurEvHLTZNlpSUQnZVgvFTVSrC1Qz9nx7OTsN2FHl9qhpZNO1tLPJTgdJ3VdPOtM4P1jEiTxhBMFTYDlXhfUr2HdxFbCcDHkLUCqZlrppdv32mLlgzzhvioOPSaHfucrBZQhmavRKUyrA/baNlKAqkcrjJ+MIPIrrKHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717156869; c=relaxed/simple;
	bh=bW5zzM8bs27zTZATdHyo2Ybtut/npyUTT2XNvIKR3Lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RM7eS+787XtLOSpRYKpxVLIjJopsihsxRnLrtDiuhQXBCdQzht5xLsKOR8PqSpipjGM54XwOUfs2wrfAw8HIo1BDDQ3gdwS8XrcEjWVt7WWVAFT6jhyhbbajgQVz5WSU6vNIVYysrt1rj4k0VoVtFO5N9i06Hv8Xn9oMMeC1P6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KHS2iAly; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e95a1eff78so25687281fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 05:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717156866; x=1717761666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EkimmVRionmbveSgy/pQfvIw0jfi4rqXwPhQ/l3BZpc=;
        b=KHS2iAlyKHQT7PiN17lkQ8xNLh13DWAxYC90CvfxBmrAv4Kz0Bg2HpQfaOhdT4sdx8
         2jFw2BejY0l5VD0O0041ZNsVkpLpY8dIIkDOzGulAz0I0jpYwZGXr/Y9TE7x1Zejeswv
         PbqxGuShAnbrUdUFVcABxIwAr0grndoSLYWEqy1Z8CiFxn6dqq7JzJp/cmKAgTjBu1BU
         DXYUToRuGOrFlzF/Rz/1gXsImL0HPkpmoq6DQjzolQ8NjjWBLuZOZ7iBuXtMvhcJ7Qbz
         q27Ak0qr+geRq5Knepeayk/UfdncZU28/03giOGVLI0AMKLXQGRAE81K0gE9Q9gsuzJI
         kArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717156866; x=1717761666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkimmVRionmbveSgy/pQfvIw0jfi4rqXwPhQ/l3BZpc=;
        b=ufyUVKFeIC18HSIjAqyt5q9P9Xqc1afajz2r4gAVATKamZs5LLwl9fY4UYrhw5i7y6
         GLwC9v2HC4g8M+Gg7cTV8r/7zaqLAHbETV4KzM1wEPuCM232SiWqVduQehE0m08+eiYg
         fGoWnx1yPxqjqDyP0iwBhLfS+VscsJyMIv10NDoe1Jz0onJaIy/2RUOkN4+8Lykl5sxU
         22TX2miScyoQl95wEuElIfVZmArFt8/fx2WB+BmsEc1VDMqWBL6Ry6xYXw4C6uD1loT2
         ERrUnM8qkhaRgLoN1kkNmMxfXqea4BOf0cYEZkGo6Eqew+NQJ3YRSkBr5HtM8wUq2J4j
         xadQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzVCu6gI/Xn1VIWpebF3pJzS/hnVnAAAxqRvICm1e2xkd+0znTDkN/TVB2hudXnbC+735Erpztk1bI7LtVjrH8cV+v6FUdygAKUg9kKA==
X-Gm-Message-State: AOJu0YyjqnIYYmrCCeP4J/lEDXwGhKUT8IzOgWzbSqgV/5JfhrO89n3Q
	KmsAnaI5E9L3sBlU+B0+16tHNycpMzQRjh7xaSj21Nkjb8S5mCLa7UPcjiPiK3M=
X-Google-Smtp-Source: AGHT+IHXOLhyFOmg7Ft3bP1rtXhtr65J6u+ORCVMMMVKXR8RwSaLWBE/VXLgbAjUCfBSI7EGCbMegQ==
X-Received: by 2002:a2e:a583:0:b0:2ea:82cf:ec5b with SMTP id 38308e7fff4ca-2ea951e4a03mr16463951fa.37.1717156866140;
        Fri, 31 May 2024 05:01:06 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cc9d40sm2879191fa.93.2024.05.31.05.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 05:01:05 -0700 (PDT)
Message-ID: <4940120f-d0bb-4131-a190-e1af0e75b47b@linaro.org>
Date: Fri, 31 May 2024 14:01:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8998: add HDMI GPIOs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>,
 DT <devicetree@vger.kernel.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <8cc61db5-2920-4dd1-8132-5af434fb05b1@freebox.fr>
 <o6wwzb4qblelfpfsrmqhoovjnyvymf42p2ilv4bzn4le3nklbv@kj3qklez7izy>
 <40903165-c965-4c6c-a3bf-104b1088730b@freebox.fr>
 <CAA8EJppg9ftnQVrZhEO9Ro2Ji6whCgQLaJrr0yCzV-2hF2HEtQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAA8EJppg9ftnQVrZhEO9Ro2Ji6whCgQLaJrr0yCzV-2hF2HEtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2024 3:06 PM, Dmitry Baryshkov wrote:

[...]

>> +                               power-domains = <&rpmpd MSM8998_VDDCX>;
> 
> Is it? I don't see this in msm-4.4

Yes, it is. msm-4.4 says VDD_DIG which is &pm8998_s1_level which is CX

As for the PHY, it's a safe guess to assume it's backed by MX. Maybe
Jeff could chime in with a confirmation.

Konrad

