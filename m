Return-Path: <linux-arm-msm+bounces-84694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18730CADC46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 17:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E67B130194E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 16:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F5224E4A8;
	Mon,  8 Dec 2025 16:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceMw35R5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RcUIal19"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C0323EA92
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765211729; cv=none; b=WAYfJTU3spJPrtf01+S3nFvT1NtYi3mPobvm0u8WjZDlxQeIbsH2jQYQOrTNXxZiZ1G29uDuDq09LANimDCYcAzs7Y5/pJITS1Rs+gKPWCiPgV9vscY4HCzC6sqetWrK9yV9GvEZz3Ya9TxI3Y+ln5H8sfq/0EsjHXma5z50r+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765211729; c=relaxed/simple;
	bh=WRhl8m67559d/bMp/HmglladIBTlRdZDTyG3K65sXPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxwxfAkCMLF4/et7ZbFkYm9EeBtJNhIdHi/Y+sswH3rIQPVpxBdxwrarwYnL4ZypEh/NcFHuS0e37rB1JMz/Fbl5f/a/m02tEcRfNVJqa/H4jyZBKKEpX422wNYdqHsCWELXJJbD0xrMYpHLgWpVB4Oz/ONcYctVxq/yLOGc+kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceMw35R5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RcUIal19; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8E5IDU1419135
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 16:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JAlzVtGlJb3tb/zpufHIER3XlqaUXfI2HB/I8TTodRo=; b=ceMw35R5jAeeWZo3
	YgA02xdbUkAoqvnH/I0O7FPGqfXGuLLr6c+1R7SIyPSQ+zARklNkATjL61dE2gCR
	wttAn22OoSs2ayLcJ5GsCdfTkb8Vo85LGhORBJGzGApkT2R0EdoIf6bx3JQR2n8N
	GxPfEFQkKFiFIdBTtRpWH/SQhqesW/cbjOEDSrGRGqziwAtaMm5wswPDNTMflGCb
	ObGHSAuXfH/Fbw3gkFcOOcrRddKsuJhBH2m1HhK2WLQD+eBT7cwQyHi8p/xid7Mo
	t6opIkzwJjya8R+2+g0N6AFWBwpQ/yDnn6hXRjiEAuO9p4pYq/PaGB/H4oIPJtSA
	iNZkcw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax04ngf4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 16:35:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8804372387fso13985656d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 08:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765211726; x=1765816526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JAlzVtGlJb3tb/zpufHIER3XlqaUXfI2HB/I8TTodRo=;
        b=RcUIal19F2uYrvJHN4B3ErqFD+fw88mOlEf4R+4kKHeCkzeCUeeB48mO0wHAhZ4w1H
         dm/IJk+sRBL3B7UxAjLor1iym1jz5A/dbQZ5jUT8MedjgwLEFcwFE4tz+QC2EPYSpkNg
         mow1hphs/a9ztW78XsK4gqYFwReXdDMO4wKafW0kIZJSFQylZNYA119E57Pxx5F0RdBr
         FWjjdEcdJAdCaqh2GZ0X6OfkHViDs4g0FeyIic/R20Els+zeJ9jiDasMCRi6DKVukUIj
         UAaon3Yosi6dYexxB8DhhVcdNbD6SuAQp0EZd4vex62kQIv43z50ktvM+VGoVGQEFtum
         U49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211726; x=1765816526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAlzVtGlJb3tb/zpufHIER3XlqaUXfI2HB/I8TTodRo=;
        b=VornN1PmmyLKf8R4b/bh62oj+ruh4ZzESbYdXFOVTS8AmKFatxLOapSm4x57BLKK21
         7avG7uoLsqDFBDKJetdRsZgQbTu/Rj/y2nDDzalCfgqtcuWmBsBOHDfJoNiTPGXYj/TN
         d9j66mP2mjChZwy/ECD/9BZZqzYyeWJ0Q+PRtTF/mxm30Bs0Fng1JQvM4b3+N0r5rRi/
         JtTzdz5QjvNhl3qMI5OqgKirn7aCr4h4Lf0C5GgIVblkmV5i/165iSupucGjh0pMoPzT
         6lbvqcxAPuljcgnl43PkiWFi9WfdJZMUTwzppsjSKAgvP66V7rzJTvG9Bt0rDih4faOr
         jq+g==
X-Gm-Message-State: AOJu0Yyu6ZQxAQx/KqPcEQUAk/XC/s78ugtYqGdZkFNBocy4e6hlcNyM
	2exEqkf4nlRPn8RyvFqxheWn/OGrnWQR9u0miizZOhrCSRWekWemQNpzzbjMztM0N3wkNJFsJCK
	FiCcnh1KxJe5WiKJKZqHatDw9P3npMN41bRrz7yCaqBriaMUKZg7M6010K/j+8RJdtyK5
X-Gm-Gg: ASbGnctFBZVBHrQMCIGuZJNgtOCkOj81juwGmCZ/I5rLWcc0thvmnEprcmPdGE8/SZ2
	XafoVEOgmgtK1YJyOiqFq5HSZ9sbH4JPzfQBbUXvodtGWiqChsN+jFpALhmFmps0hJ+7WQjI5Xa
	mg8ZNTALkRmHNllnBezb5I7WvceIvegRc2iT/LgF7KFzJw8RtXIY7iagBR/MhUYKqa+JT3ogPga
	I2IAm4a9GcVn0WJHfprzdaPQ+0//qSwKXLAlcy6WUtirpGoj1LAeYSNe0n0pkaferAPXFxeoUdm
	BPhiDHdajQwlKXRE0OXO4C8QirGcV/9D0+V4SaiE14OU+dfwK/uC2Sp+lJ67HPsPQKYZwzNCdHA
	xrQqUmVA031yL8VscXRvUmmLCb/SZ/cMxmv9q55BQJMuuRR89sesJnJwTscm8jLt1HA==
X-Received: by 2002:a05:622a:178d:b0:4ee:1f0c:c1aa with SMTP id d75a77b69052e-4f03feb8ccdmr102805911cf.7.1765211725691;
        Mon, 08 Dec 2025 08:35:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGci8UgQSWlaltZSzak+aKVBGVH/z3CvEzlp6n/VDNbYwfFSN/xBcIF8oiUdbFctNSG2CV2rw==
X-Received: by 2002:a05:622a:178d:b0:4ee:1f0c:c1aa with SMTP id d75a77b69052e-4f03feb8ccdmr102805571cf.7.1765211725346;
        Mon, 08 Dec 2025 08:35:25 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412dd8csm11356749a12.33.2025.12.08.08.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 08:35:24 -0800 (PST)
Message-ID: <532531d2-8f26-4ffa-9355-7821a4d64200@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 17:35:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE0MSBTYWx0ZWRfX4h1s2rmazW5+
 3X129K3tWpk8yN78T/aeDcvWMp5IeGYDXJ71IOtjnHnxDBdx5IVPPlusagJG6BboQeaMLjc3D4F
 fZrqoVVhPVbzZFiJGaFpV/vbLR3+HAwIbB9e6mnguKxAHBDUmGd09T7+9ky/7KWC0s5Al4DWThT
 LdJk7uosW0linwwb8cEhNhxZ30kNkpdg58n4Kfd+mjkzMDiNW8XviPvObrXzg3eUc79R2vo0jk8
 QHQLeLuGctHGm7zgnRPB1kH2bErnGrv0MvLicjVNfxNJWq+2b+yNX0zOYy7XsWEyZdT08psIpG8
 LMYAyzZojGjL/S6BOwcLp6HUnJ9njwmTGJnCWf5yBBZ1RKYy6XoONu4NWhutARlTZml0g1YSLVU
 kz25RS9xxCKlAydxdvKrigmMr4EaXg==
X-Proofpoint-ORIG-GUID: -7b9JgcnXPGGUIzxXexYJJ3a-NGh7-aT
X-Proofpoint-GUID: -7b9JgcnXPGGUIzxXexYJJ3a-NGh7-aT
X-Authority-Analysis: v=2.4 cv=CKUnnBrD c=1 sm=1 tr=0 ts=6936fe4e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8
 a=W2_YLVZPviVWVX_7ETMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080141

On 12/5/25 11:16 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the tc360 touchkey. It's unknown if this is the actual model of the
> touchkey, as downstream doesn't mention a variant, but this works.
> 
> Link:
> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
> Add the tc360 touchkey. It's unknown if this is the actual model of the
> touchkey, as downstream doesn't mention a variant, but this works.
> 
> Link:
> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5

This driver mentions a register called CYPRESS_MODULE_VER - maybe
it could help confirm the model?

Konrad

