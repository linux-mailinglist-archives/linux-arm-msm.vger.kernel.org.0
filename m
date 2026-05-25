Return-Path: <linux-arm-msm+bounces-109658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DmXHUJJFGoqMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:06:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D05CAE21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C569300373E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2406537FF7F;
	Mon, 25 May 2026 13:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qtz4TJxa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWTsaUJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C519C1A9FB7
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714365; cv=none; b=fDPCXwvMRoaLr9Ktqe2WgQR+vGEOKEeD94E54OouJwa8OUGDQ0nSBhyjjIbCJx6YZeeteq5X9esDb9fDjRKr4Tx2syqxHYcjQr7xIh+7cGOKPp2MB+gAXn2yViRnHIhkHJIz+y62MPnt7znm49P6/3q7Lv+3lzeXHf9iLND2ZUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714365; c=relaxed/simple;
	bh=/Pr+5Ry1zTs8aUIk6lNGig6XVxgObTH7nUPuyTIi1bQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKG0om09Jhdi70iiVXGTO2KO0RFKL4bYg8x37Ws7rWjFyAVaTVSqI1R+TDw4ByEtgJZqzg6hV5C7yOTT8MEZQmBWR4e0uNnwiJXKc7aVRe4LBR4GrzeyaItv0HzMBQN4R2COAZB5JcN78SewLGpSZypH4+hReuGXaivAurQSma8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qtz4TJxa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWTsaUJ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7Zl3q2195696
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	evZk4pgnuT6oNp4zokHouUD8piNfRkq1KbjkBraCMps=; b=Qtz4TJxas09hgh2A
	FqZ38xAI0lpycFIBZFYioJNy31J3D/Q0yo7INzdsjR5j/AMGE8CahvNeRdO2vEw6
	2uYoT8RF8ME/xykhPRqm1pe58GmRuUrY6uc0KztoygayAphGOvD0QleHzUUue7D9
	z6ENMsbw8IDAYy8Y14eoI7GUB95kbwd0AagkpwKNJj0RZ9+XfMzZ8/5lSKpp9Xcn
	TsfZVfYxf4o2N4kp92jPkFtwpVtVqGHQInzkG/6wvd9ILX7dazRwxtkcABby7oBY
	+uR/r6HqyCUH1oKLrE2+bS4qPJXAZvCuVx7wGhaIyqezSs/vQ2nr1ZVkQ58opJYk
	wa6SbA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7ppwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:06:02 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-479e99d2d9eso1668029b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779714362; x=1780319162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evZk4pgnuT6oNp4zokHouUD8piNfRkq1KbjkBraCMps=;
        b=UWTsaUJ3CWCQmnRRAsyd//TkUhxvL5TnEJ6hU6OL5Zhg4rKqysuQ+gw6YCawHW6alT
         Pg0apy2IpDLZwmjte57t8UdlwrlUqxVv8i9Qfu89+dgRKcRKjaV4sVaUkml/xMJMPErh
         nwxXypfjR/XgtfRsmGv6+uk500K33szDgLHYqK1bEWs9/V2/VQpp/sw2T3t5aTKIGgxf
         ySnTqO3jmNsLBHu7sUKhK2FZ30GQvhU2Ef2zcWosC2V6uyjyKvA4OFsvdCJZnkjrmoL0
         D2EGNTOyibAQoTvVBtrtlLi8vAHgVY3ZQv1eYW+pveyrv5np8SLf60X1FNP3+MU1GfIN
         Mk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779714362; x=1780319162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evZk4pgnuT6oNp4zokHouUD8piNfRkq1KbjkBraCMps=;
        b=kUujsqccPHToyXk/4fBPq/ol1nlNScxdLN27Xn9xLQDvspBMOUpTgGK6DmzJQpD1eC
         LjsdTvXYyp0PW/FjfO83IKbPa/b/1vPU6EDg8ftZkHIJy3gK8xGxjE1lO9Gx9ceLdfHB
         T6BvBc8hzrib9Oky1z/JCiPFe2wI7kp0Gu8tmeqG9sAAbgE1Uzy2lgs0BfVqCnZncIMs
         +idIoV3icE2TBVN0viv7s6QK9TF2z5MJpS3u//CpCHWUCKMtoMdZIm0JDbKXxSSx87GK
         81hmFjzkBqxr5cXE/8EF1kfwX2nRqlTzO5zsSv+dxYmgc2wjKPc+n0UV1r/GzkKUAce1
         kk/A==
X-Forwarded-Encrypted: i=1; AFNElJ9pN4tllK5lYGjmJ0TvzdVgWTUQ4kBpuVbLUeUv0SxhDioMjuscVO6LQ6sa0g1qukN+Jw78YlyvLfYxW6Qs@vger.kernel.org
X-Gm-Message-State: AOJu0YzNsPsf4KWj4sWnlC1oGjNichDf/+jeyn176oas34oD4dmUw+l9
	ED0uD/dqm0ZZve/YwCqXp1plb7U/0iz3jOg6MkuIdGucgmPB8C651Qt9FKSPOTkhYg19f9xMdPA
	2vtGidNC0uNPIcIDHTLjJ/iTC17COSNYTuqVsam+h9/IuoD5RG/R1l3bU+kxe+2edG8Dk
X-Gm-Gg: Acq92OHunsoY8I+dzB7tYIf5QAeeU1xmHXBNNyOQP1zPfHJ7wMtFtSZeWM/S5DKrLEY
	R/l+PPm8QG9fahJeHWUrOvpLaJBgF91+A2nRKBRlkfeCooEqRro3ZXQA+N4KEfU+bynYAEU56zD
	SpYNdUMAHMDAD8VQOrOmTFmkMHY0LZKqPTEON/1SlkHkOi/n/pRpdQFK/0yq8NIJesvgd6KHde9
	2nJEddffq/PoLqw7cempAbzVRsEq+VAJ1DnQsIabV/MgFt9AW83BwRCtLY3CmEgQPYCO0KCIgKF
	yiIHNb2ZCTchiMMjIIs0I+tkJ7TjbnWZ1a9IohyN2OB32YK0dBsuV5aNmchsy7z5mcTY6lZeK7H
	7WNQUb8k4gS2hONUZNZ9SYq3e1IOWjiEwyS4bw3MSZ9zeUw==
X-Received: by 2002:a05:6820:a384:b0:694:8f39:3bf5 with SMTP id 006d021491bc7-69d7ecc6b4fmr2810936eaf.3.1779714362021;
        Mon, 25 May 2026 06:06:02 -0700 (PDT)
X-Received: by 2002:a05:6820:a384:b0:694:8f39:3bf5 with SMTP id 006d021491bc7-69d7ecc6b4fmr2810912eaf.3.1779714361426;
        Mon, 25 May 2026 06:06:01 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc2c45ec9sm405950866b.14.2026.05.25.06.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:06:00 -0700 (PDT)
Message-ID: <7d9ea19b-c6f3-4f14-8752-994fea304a17@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:05:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Set MDP MMCX corners to LOW_SVS
 per Windows
To: Daniel J Blueman <daniel@quora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260524115704.9442-1-daniel@quora.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260524115704.9442-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x47vb9UlVr4CvwA-aWB6i7U9clwfc4Ua
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMyBTYWx0ZWRfXxpQ+cUTm/Wnu
 pUL1OKlLWLshie0M8lCKbgkycXUTjz/Lp3nQjOWlCG2ljqBVadUVZw24vpieFyzT3GOhtKQ2m2P
 IhDreuHxN1T1rz3skGdUHgIJjdOy1eg+LhhD1diaSKBbCzwCwc+QSGq71DAX7LZRH4/FydwP9S7
 hySya4ihOHKtBmhFhkrF7b6lL6VALFNEe7lk/dNHk8vrbdES++tst3mm0MDfa7xPcnkRfdWHlsA
 vOZV8TfFhRyOSfz6fRH4zCHJhaOJ/wU0IJUM4v5L5prgMtT/LSkOzjmvZniamJe9IOBj1JpuHdm
 qup4OjwnZZzhgqfNpnYD4dHuAddzuGgZdZ6HxTY3+fs23f6aUtKiq4STwp25LWCqeleIBy3xUNl
 6MFMtsCWXOvtudDIcSE0gKh56RsdQJz5uoOmzeALXzT9LaRhHeYUPXDujELgsc6v6l8/4k0/YdV
 ZGzxeSgr8aCPAERwNQg==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a14493a cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=80NRCOff-oOgzxwK4b0A:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: x47vb9UlVr4CvwA-aWB6i7U9clwfc4Ua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250133
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109658-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D5D05CAE21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/24/26 1:57 PM, Daniel J Blueman wrote:
> On the Lenovo Slim 7x with Qualcomm X1 E80100, the current Windows ACPI
> DSDT votes LOW_SVS (0x40) for all 7 MMCX OPP packages in the _SB.PEP0.G0MD
> F-state EXIT package:
> 
> "FSTATE",
> Zero,
> Package (...)
> {
>    "EXIT",
>    Package (0x02)
>    {
>        "NPARESOURCE",
>        Package (0x03)
>        {
>            One,
>            "/arc/client/rail_mmcx",
>            0x40
>        }
>    },
>    ...
> },
> 
> Apply the same in Linux for power saving opportunity. Validated on Lenovo
> Slim7x across daily workloads over 2 weeks with the internal 2944x1840
> panel @ 90Hz and a 3840x2160 @ 60Hz monitor over USB-C MST DP alt.

This ""works"" because the DP host holds a higher vote on the same rail

The max frequency for the MDP core clock at LOWSVS is 200 MHz, so this
patch is incorrect

Konrad

