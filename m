Return-Path: <linux-arm-msm+bounces-84020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C0CC99220
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 22:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A23104E1D67
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 21:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5CF25C804;
	Mon,  1 Dec 2025 21:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBOLxtsq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E943223324
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 21:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764623087; cv=none; b=gATwnBAqJRBDkaH0bBqAdPa4C8kC8ht94NwL59RaqIccAajxyRjx1BN2mR846W/VTHphOdpbeIqDhi8Y1YzcFvENvPQyXzaAmSlvEnjXM9tKR1+SZ6kTGsEHl5EW/PtNbl+TvDf7Jz/OE6ylhESHZ9LDlXwy8ipKVEbaHkYucC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764623087; c=relaxed/simple;
	bh=RCsVhoMziLTlsWEXutjwzN/H9l/9RoDXtZVKvXMTT8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7G3ceiHPabBllptOilGl6dX2Naff8NjopOTRNwY+a8l3G9m71WrtjnDV0vRwmywlr+UvC2O18MK/BupLmedTKrTU46Ihozgz+9FIrPpVzWgZ2q2XpNaBxhlsQs0D3N2iRPh/jpBis6/5T3IGl4BWt+9ahEplYQebRqaxy3Vpjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBOLxtsq; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7c71cca8fc2so3000317a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 13:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764623084; x=1765227884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QwOlm/EYAEjlVOmwG4107usguWk7Wsz8CJGeHU7XeLA=;
        b=OBOLxtsqJVPSKW+aHIpA8zwjV8HyHRBAh1BGfHFRU1JV+Sgc2GA66rRqiRzgA5Qh3i
         Yb2voglyzTCb5ScMJBo2TZA0Rny586Os2wbxSABYSJFO819mJTFeYGz2ktc5hU6K4gOr
         jBqzCav7Y9P5Sp1jrLE6/8GYzEGwJaKM66ws1uy3LKUkjY6oXRQmiF7Pu/6Fc1RLglWR
         L+AlvRj8ioZXTqHVDw437sB0seRPXc1meRz23GQbKL2QmxS4xkDPNyAOgzqNpeBublYB
         WeXpxZP3BO6hKGPC7kW6oSsaHQ2/hQd144T9S2hG87B1nxu+HwkJV/Ob09w5scnEwvR5
         RO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764623084; x=1765227884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwOlm/EYAEjlVOmwG4107usguWk7Wsz8CJGeHU7XeLA=;
        b=Sd/QRb1jLtNJfnte4tkXV8+IK4O+Hlm9O1PjmJy8eC86h8zgdCu7YqMvIqJlbk6Uvo
         NYPCtkoDvGRg+fnUrb/ed+ptTsbCP/LjvAkM4k1JaxYGV7ShrmYMmmD/WrG5ag9q7BLq
         CbJ81BkSI4DGwVyt1OaAzT4wy2UuCGP5uyQ8zPcT+YB0cz9xjMCYNHrnsOXqQUWGkCXd
         qBfUTfoP0GYQEXfGJkiAwBABc6LE3zbi6wV/cdZ+3iM6jR34s5jnyRejGkC7i8MWmnps
         V3sbdBJ+23CwW9LnuwGeG+L281NHc6IIE0XvGT/aDO191dcjDSxCAfVL+CmhKpjp+szV
         oeFA==
X-Forwarded-Encrypted: i=1; AJvYcCUtCeO6L4asMGNIhLkgW8pFWlc0q80uzA1Mhy/o0pA7ouiOE48mE7R8gbaJ1L5CZwywxaHTXog+BcZhFfsI@vger.kernel.org
X-Gm-Message-State: AOJu0YzeOAnQtAv7fEHH0tCiKHx8xPXJ8ucDovYpAm2N9R3WkAEdGj56
	hOVWKmROvlmuSghKQWd6gn9mGFZrft/io6E5YNDxvJYnhRSLUmCACKyjrbcLbw==
X-Gm-Gg: ASbGncs/i2Vuvy86QjOVsQKmgaVEU/TZsX65IsUCAvV5HGN/RUHtbzN0uIplupIuLoy
	8GcbsgyUEHXDePiZS4Zhguw2ACKRiPOvq8HseBumZBRU5mt2PGOUIsK2JrDmsd5BGSBi+ipkNfa
	sdH5wzQsZmCKbHPLcnBEYn/iYkBwnZIJLpMuEwbtyOwTd7uG32HZhMwQXwRLlYUEgFSRUIX8CZ+
	yUndYKPtvbtFiJL5F2UbuYgdUhGOVaZHj0ftVePZlIZPlyWaHa4+/cMhDL6wreeS55iGcYmPm8r
	0YDjQSCMCcwzyq5dUOtFLD8lhT310FoOh1v2M0hhTwREQyqTGJWc1o1MXEH2SgxwYvsliLDsUqs
	pG8G0+GYwxCP20NZRt1/5n7ON4EYuGyIGqeD+KoI1t/MJPtfp8FCouac06B8Lw6nestZh4AvOMq
	15/2XZ2Wx3zZZokceZmXiUMqgQrO5sQXYaVjEV2yvtOIAz8OgMXdPMH6jZ9Ici9QLb5w7Z0hVDk
	9XaYCrwE3Fbb353qO/g7um2f+FM1M+kGQ==
X-Google-Smtp-Source: AGHT+IFiFedp/ndsw4dL4kyumPRb+RsFpIkJnX2Tsf9N0bw5HOBbzoF37M3d37e7AG8acuTRmJi7/w==
X-Received: by 2002:a9d:6143:0:b0:7bc:f443:fa3c with SMTP id 46e09a7af769-7c798de468amr17127045a34.25.1764623084473;
        Mon, 01 Dec 2025 13:04:44 -0800 (PST)
Received: from [192.168.7.203] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90fe15847sm5167781a34.25.2025.12.01.13.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 13:04:43 -0800 (PST)
Message-ID: <47f6bed6-4d21-4e11-ade5-b3314d026502@gmail.com>
Date: Mon, 1 Dec 2025 15:04:42 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_wcss: use optional reset for
 wcss_q6_bcr_reset
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org
References: <20251129013207.3981517-1-mr.nuke.me@gmail.com>
 <20251129013207.3981517-2-mr.nuke.me@gmail.com>
 <1ba66817-42e2-4c63-8a94-d2e5c9cb8c34@oss.qualcomm.com>
Content-Language: en-US
From: mr.nuke.me@gmail.com
In-Reply-To: <1ba66817-42e2-4c63-8a94-d2e5c9cb8c34@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/1/25 5:21 AM, Konrad Dybcio wrote:
> On 11/29/25 2:32 AM, Alexandru Gagniuc wrote:
>> The "wcss_q6_bcr_reset" is not used on IPQ8074, and IPQ6018. Use
>> devm_reset_control_get_optional_exclusive() for this reset so that
>> probe() does not fail on platforms where it is not used.
>>
>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>> ---
> 
> This reset is not even used (or documented anywhere).. the closest
> I can find is "wcss_q6_reset" in qcom,q6v5.txt, initially documented
> in:
> 
> Fixes: 3a3d4163e0bf ("remoteproc: qcom: Introduce Hexagon V5 based WCSS driver")
> 
> which claims it was made for.. IPQ8074
> 
> Peeking at the GCC driver, this reset is most likely present as
> GCC_WCSS_Q6_BCR

The downstream kernel uses GCC_WCSS_Q6_BCR for ipq8074 [1] and ipq6018 [2].
They only use of ->wcss_q6_bcr_reset in the QCN404 path, which does not use
->wcss_q6_reset. So maybe we can get away with calling it "wcss_q6_reset",
store the pointer in ->wcss_q6_reset, and drop '.wcss_q6_reset_required'

Which path do you think is the most appropriate?

Alex

[1] https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.5.r5/arch/arm64/boot/dts/qcom/ipq8074.dtsi?ref_type=heads#L1060
[2] https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.5.r5/arch/arm64/boot/dts/qcom/ipq6018.dtsi?ref_type=heads#L1440
[3] https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.5.r5/drivers/remoteproc/qcom_q6v5_wcss.c#L967

