Return-Path: <linux-arm-msm+bounces-84384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF757CA3E7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 14:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34637319A25E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 13:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974741FF5F9;
	Thu,  4 Dec 2025 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Io+LgaAh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9KN/hNS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC46B21E08D
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 13:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764855925; cv=none; b=FnLF+XLLaB16OSipVs3fTrBjnIiHkDjoyiZip1TUPFX3oxgyL6DCOPy1H6Gd0+TX/iEbZ4LEg53yUoSLJsyJugSGihBGK+zsVpHTPPhQhxehnLmljuwOM0t+DxcQEEFuh4MxusdTz/Zul4Z95QuLBI6EY0e3vZQ4CCngYOdXFUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764855925; c=relaxed/simple;
	bh=AcrXjqUZ56vkkb/G0elF56yoIRnt+e4Jj41beyyDcms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkivyQftyiPSf/tUMTBrME6IZ6vvGA7DKIyeM1sE1DQ92rh+IDQmNzy7zHbxmwsbNtdTi4aOdiM1txJ8o3JwDZCyKSZCIuXU00kUtAe4YYRzCO/6sL64HcaJUNUioYrcGJ+82HWtp5W1XRQhAYHni/tW5VwnLwvDNSr/NZFAZYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Io+LgaAh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9KN/hNS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AErhU1179124
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 13:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2m0RAcitcHEW2YNQM08Cl44Xo0ln3RiUZ4rAoKevP3c=; b=Io+LgaAhKwJECQiA
	EDj+da3YRIHW31eeifYPvfkzP+1yFWU7CppATC11afnGdBWBmwDlioQU8/ihXMKD
	k0OHKrjsCHAz4NEpgHleUVI8V5yd+oBRleAwlQFy5fGb87b4wO5zwzKZwDhlw82H
	So9VskXs3EDXefo8gQw6+dRNHstthl7SaoujcMKxjUsVijs1WBF3ey5PdxvIY32J
	cGlKmNOY8/Hi1Wff/w76s0TXeD7anpgnMXXJ0xLK/UDEWyh1+ANhKaGuwDZqqa1A
	O8/xO86ak2duwyNZnDJSwIg/aevBTCxyAmUFB+7Sm0cq1d2YzaTDQ1+XZOl4p3ig
	CdFbvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6v1gxf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 13:45:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b21f4ce5a6so17860685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 05:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764855922; x=1765460722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2m0RAcitcHEW2YNQM08Cl44Xo0ln3RiUZ4rAoKevP3c=;
        b=a9KN/hNS9IA/svGkQfunUVRpINRNE9qWmCq/bbzxvNfRj4dYgzuO0iKMBsDstYOlHl
         kcFzaploWR9a8xghJMY1nXWlk4qCe9uUekZzsClqBKZYcbuHUeah0wjjXRYccief2Bxg
         zkFFKrbA1Pcljb10ID52EEVESwJ+9Dp3MbmZWujKoYnKo6YWY6WsLgiZ+j7NWgI8zkQ9
         dLyRmF7/wBGeJ4m3oOrOpvcWp9myvxg3JqQq6p5bd71VdUnD729LcuzDBper5dbT58l0
         JGJq09yfL8NtnvpuCAwwmblR2WOX0PO8JTsZhLmZaKKgMB/HtJGTyLspcvIr898PwSQ+
         kz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764855922; x=1765460722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2m0RAcitcHEW2YNQM08Cl44Xo0ln3RiUZ4rAoKevP3c=;
        b=JEhq5sat4pvnLgHLN5c/CuoFW+3ttSuR+RrUDk/ZZj5dqHDmJZZAH2gPBc5PQcOBtn
         dSzBknewTE5wZW+YT6kAhwgR0tRZOx/2A2wasjudIHvzOg5aU0sUzI0TVUQdbD7Hdzjf
         +zEtbXdXCUO/0MA0h5FLbAsi3ZFatEsxucwQzxn2al9Y42LkeEMctySxFWQO8yLuNX2i
         eBANwqMR5dhmtIzTFL0zGsCyNuiAss2XymLnIgF1BLVlcVuQVkjVS7HI4J05cLEcLmXY
         84haKvvT0YqVBJ9Q8ytBSuS+OMfx6xC7dV58ABIUmcjB4swnkN/Y82f76QZl2UNnLyII
         kNDA==
X-Forwarded-Encrypted: i=1; AJvYcCU2T+vTPqCrSSEgZCQJtNjx/xoIJG/NOUP1pgbhitpbzvPiKsHCb0owAeerXKq+JyTdIjF9DByC8HI49XST@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi814qL4EQw5H2fT4qDYbOWlVqHu0HD76pGkm5cHidaS7Hwcsa
	ttdmC7tqzQuIoPkrD26qsVvIkRYElgaOZ47tQZANTBN1WZr2icTYHx09hpHZQNZBUIMvebkr46r
	mhA4jvef2m2XlkyyNh6iS6KZMFglOjeepp588JlfDAIw1vzxOZ+/yIh6sXZXajZ9wn1an
X-Gm-Gg: ASbGncspKiHqlchUKXwNnOTgnIvtrO8/qhBvFu9UCoXIaVXn/NkG2aILB0kvsJTF3m9
	To3OsGwCs/FS2o7aQUUCV4QASQhSWLLxzpcBaEdjN/0XlPopxd0XujPPYGIRNmEeEgS3mfuXymK
	kf67FhIZe5qXa9gp6EZXlBOq3NOIUUHViJep0Xh+ckR6hnhj49KLEHlLgA9QNgKvVrte+xMdfnn
	mANTr22ZhyTzzo12ZYNU2itpRBe0U2znlv8RfHt8IVDuxVb5Nm5AjTHjsUNxquWzCZt4uchC6hN
	B/ySSRewXzqQiXsDP/C0fWkg0jZm643zuRP+O2olSQ1JXGrfHkEKr8fheIJfDRo4yLuqg+vnuHi
	oZRIzmGtzCNiWzg9c7ZAarGf9MnobrmGV66DwiTr5HP/G8gt1sL/8pAqHCiyizOI7gQ==
X-Received: by 2002:a05:620a:4494:b0:8b2:e346:de7b with SMTP id af79cd13be357-8b5f8bff756mr558493385a.1.1764855921959;
        Thu, 04 Dec 2025 05:45:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEE4K9QNIzom/XckL+1wntqd34BKcJJw86KK0TA5TcHyRER3mpyApu+tld0J6twAewFcg/bRg==
X-Received: by 2002:a05:620a:4494:b0:8b2:e346:de7b with SMTP id af79cd13be357-8b5f8bff756mr558488285a.1.1764855921370;
        Thu, 04 Dec 2025 05:45:21 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec3003sm1327057a12.6.2025.12.04.05.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 05:45:20 -0800 (PST)
Message-ID: <8d2db9c8-b053-46af-abf9-f57765b0afd8@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 14:45:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add vibrator
 support
To: David Heidelberg <david@ixit.cz>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251204-aw86938-driver-v1-0-ebd71868df3a@fairphone.com>
 <20251204-aw86938-driver-v1-3-ebd71868df3a@fairphone.com>
 <bc89b3ac-242f-4890-9996-060c4a0f2b67@oss.qualcomm.com>
 <9794dcce-0c1d-4c30-8d07-47c50548b4c1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9794dcce-0c1d-4c30-8d07-47c50548b4c1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExMSBTYWx0ZWRfX9z5gWsYHFhMC
 IFTcuYSxZ6Aa3iDwRNcYuY13GgCfGpDBRLTbuhhgE64PA7GUD0N0EUZUXukTBfDZF1tQFsEJsAx
 88xV01rh4zmGgF0etje7NtTEUe6ajRSqV4ZhgP33ifaJ8Lejt4J8FmGqB0UC+L4VpDJu5nID8+a
 gxr9FtYlCQC/+Y5GOZLxR1bLKxphKeldocizDLWH2Y4TCA7mdKgIWSDnhu1z64q2/Y1e61POnhW
 Axc7T3jOaIkfk5h/pP2n7Qi7Bl4Si1NV10auDU+jMkhHBKy1g5TqKwhjhr65LxZM6CTRzyduLBu
 il6X0vb5qrM5ag/bDhX/wrdxj2WgfOrgJrAhTtrM1liZdzj4Z2QrPYCmV35iNTnbq6gS6d43UQS
 hrbbca55Y20pgr+wUuY+33pxU1MzFQ==
X-Proofpoint-GUID: PFArHW-TQlAIaGwm6y6sFXS8PmHMaVNT
X-Proofpoint-ORIG-GUID: PFArHW-TQlAIaGwm6y6sFXS8PmHMaVNT
X-Authority-Analysis: v=2.4 cv=KY7fcAYD c=1 sm=1 tr=0 ts=69319073 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=kx0EAdazurEMUcr3plsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040111

On 12/4/25 2:43 PM, David Heidelberg wrote:
> On 04/12/2025 14:34, Konrad Dybcio wrote:
>> On 12/4/25 1:29 PM, Griffin Kroah-Hartman wrote:
>>> Add the required node for haptic playback (Awinic AW86938)
>>>
>>> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 17 +++++++++++++++++
>>
>> The DTS is unfortunately still not merged :/
>>
>> Please arrange with Luca and either squash this into the resubmission
>> (depending on how the driver changes go for the vibrator) or resend it
>> afterwards
> 
> would be enough to provide dependency on the Luca patchset trough the amazing
> 
> b4 prep --edit-deps
> 
> here?

This makes sense for patches that are predicted to be merged without
obstacles - IIRC Luca's original series still may have some dependencies
on various subsystem maintainers for oneliner compatibles

Konrad

