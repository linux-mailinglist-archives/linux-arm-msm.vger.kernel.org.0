Return-Path: <linux-arm-msm+bounces-85868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 385DECCFBD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2416B3022B6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E223314B7;
	Fri, 19 Dec 2025 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nm7iX2Bq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IEZAKI5C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED9333122B
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766145972; cv=none; b=qyO9NnPNpFTynCjFT0TfNIYcPrgjAfRqk4YH0+TVdLkW4CR4AWWHuE5GEcx2bqSzouu1dvydl4WstzfdeopEiN4iy4WpZoqaeuNWUWB+Pq6fZin8JOpuKxeSp6t70tc4k4lI7v0kT6apQ/3tXUZCxhKo0tUJxIpXutdlwFLYIU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766145972; c=relaxed/simple;
	bh=wdi/yODiJ2EWrZQaitI9NiRHflatT+fACXV3XsCgRzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQr1vyaD3WXEeglYljtE2YQ4pPWubwMD5RnkZyD+1SaYpUXzr7iTk80XLFP39HngMXl1Io1O0tKOYSbfSkCAbyb8hHc9a6vtquiOdrxuCP7sApuA/UiSc5Z5iDklM7xTBnWiB00TKPr6p7w3vlxQOhH02Gjk5etfRPnZdoOkMk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nm7iX2Bq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEZAKI5C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBDhMf3559086
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VGoeFQSnl2WPi9PDYnu7OuHO3EMjoE6y/soErcQm+ww=; b=Nm7iX2BqQhn30U+o
	50cnYUNhB6zF5k/lvJ62alajHIUYDfvX7tK7ke2rZVnoX+sqVv3JAqXGfXJ4Sd6q
	mv5UQNjo5ngyt5AgF7rllJq8LaCIkrjxCE2iyMYnt79Xv9LADGnlylR8jUY5xY5s
	YrGs51g9YiekmQ24TJFT05EUMNdZJsO3PyQmbxuPXUqXtqaxjPLHBGe3BaCmnFCm
	xoG62CyOpi46QRlleDDe6fnU/+Z4HQKrNd2E6b+e2PUZLth7tAxk4dGkmFsf/jHs
	w8mxqfLKs6IJ/8rj28VQnMRLgSnhl8VlOXorqC4HuOXLVkrT8Qo/nUFa6Vnp7Jfb
	QqeW7Q==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2cakaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:06:08 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-645527c5474so347031d50.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766145968; x=1766750768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VGoeFQSnl2WPi9PDYnu7OuHO3EMjoE6y/soErcQm+ww=;
        b=IEZAKI5CfSrJc/BblgZKnmX6mXNESPZmU0Lnm4nagukCJuzcE3S7ieWiZG6qkOuDVk
         FTMCm1rb9PCRO3nJN0WEGqaDO3Fm7kwCQEZ5ciBVspjN8mzXyc8JgkYBGdpNIQdsgslb
         8nwRgBwmmx+QiYBH8H8DaXdviKQtIwbbhaVT1Vp9aUvZbk8mVfpUFADFdZCjpRJASZzv
         +Aokh5CCzIIcURIorLqG87MSwl0myOwv9ZvX5LIt2TgI4dihPvxEPUhVZR/bpjJZIKGg
         gwN6H6gN/w6E7NqYBZpvNSXoOBpqt0Mv27VAI9lxU9aJIDQufHMV3Qp4SvXVzTKnNbW9
         mTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766145968; x=1766750768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGoeFQSnl2WPi9PDYnu7OuHO3EMjoE6y/soErcQm+ww=;
        b=ip1ToFA4Pm18CAe5t81/RcR3B0gd1i/HxxuDfkEdvrKyzn1TEXhKSWbvzczH7rbhlw
         R4NJHgg/dvGjyPX18TImOoM7ezJr06vSKFLJJeRWG6Pw7Qn8bTCEvjulLjeoQ/S/6ZbI
         r8maDL6a7MG3t3a7iNCD+A1+06nZtfGTU5E9S2SYs5QTAYieznF1xofsEyOghKPn2NO1
         3faj8EFPptYM+SFXqDX80eOq3JhEN1yHqNCj7InnfnMX9UrUCpMOYev+iYgzWd/lvAtN
         tMN0vrSj9wUMLDHic60ifxDo+MNe1ikHuQugpUIW4Msyku6VlThshGVfNDZ+FlbLnp1M
         VhyQ==
X-Gm-Message-State: AOJu0YzfOAmNqIAVz7lC6vgLPCsCWof57xOalWu/jIKEsU+UtSugMxfW
	V3cUxVrGF9hpcR9eqPWh72Z9lHDnhZIIZ/1JT8HBK1c//zRs98fg1tcI0RzVf2+1ZntMxV4P8P9
	2EyMTUoSyKCTo6mLX1Me9jHSI60DTaeRiufFLJ4BC+sIp27Ih7ZHFDh5Sz27hQB+BRkoM
X-Gm-Gg: AY/fxX4sWQeYCeJ2zvC5JpRF/f0LNbwIpHxL0LcgpAt94bMuqQRud5FYUpXhuBtsfgQ
	/5jahqGljh9diFQjT/AKdnRsdeFCUJvDIEysu7dWRQhje9tXRL4L4w3/7OXzZs+RO/cUFycnrFY
	L26DVD6Sde3RQs/FXDRIdd+2Lxu9qPqUATAknfxM0epmqPS8GOCqLSuSc7G5D6HUBlomI8FWbnR
	aWBx+Luzvh8wDXMrx8Ql6FH1qxOk+ohMXZL3PYg1Dk7ax/14yWa+C9jcjyoZa4Z0MoprtRF9mC2
	GKAlbjFDthpusTn9+AavEx+skb5/+5VnfgJuOB+bIsxxsUJfrGHqphUCkqoyBr9rgUzj0YE+JkE
	tasEU4oEjQts0hwFAd6pbisg5D7mfQceA3RAxlumlusHJyzyBHJnYhwgoTilzDRFWnA==
X-Received: by 2002:a05:690c:6610:b0:78d:6aae:9cf0 with SMTP id 00721157ae682-78fb41fac50mr20275877b3.9.1766145967755;
        Fri, 19 Dec 2025 04:06:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHusdFDh+i/DW//dWaTFL4zVklWp9Amv8rOiySIQIwrUcVabQh8tJvaUfyM7fnTeu8yOfASUA==
X-Received: by 2002:a05:690c:6610:b0:78d:6aae:9cf0 with SMTP id 00721157ae682-78fb41fac50mr20275637b3.9.1766145967223;
        Fri, 19 Dec 2025 04:06:07 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad1e6dsm220744266b.21.2025.12.19.04.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:06:06 -0800 (PST)
Message-ID: <c2ba3b29-c92a-4faa-8161-ac7e59de16df@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:06:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable options for Qualcomm Milos SoC
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251219-milos-defconfig-v1-1-f58012ac8ef6@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219-milos-defconfig-v1-1-f58012ac8ef6@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=69453fb0 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMCBTYWx0ZWRfX++jV9etfL+pg
 RzWIi/zykaXz1DiRrf+qmlW1PhUcSWuZ4xDBJEiTJPA3araQVT5p0z9YrDEV1e2BXlXWF6QcKm4
 3AJfp7TMKECTelHkJ1AsCqONz+c34dLiTZj0lZOlT8vjqsq+wzqMQuR3mXH/8R4mIURaFJtydcv
 zb+t+vpb/LHl6sKqyALcuRcwfrERQ5uaAgR5H3zDLCA1rxqUd9PyHzC/T+s+wieVKD+57HrlTWq
 98f0Ge1L7ldHYPvinyY7+mIn2s1C2k4Q208pDrn4fKv6kdXJy6wtHD2XIuk2IO9A7SL1Mwla4Pp
 JWLfDbjA5N769bl8o4gOC37f3zxb/xja0sqqVCJ48d4/M8Ta/yaJNmlQxaLBf/n4y72hm/W0wVc
 SmC5SsTmHFtMHSr1hnYUnqb3qts52gRs0XgOR2HdaPs2xZVggUadaEN0S1UBgIp5LRVeQoRiB/U
 6dvQ1JHY1YM204YAP2Q==
X-Proofpoint-GUID: S2BDjFp9N9LCrkim2q2UL9MV9DqDTn2Y
X-Proofpoint-ORIG-GUID: S2BDjFp9N9LCrkim2q2UL9MV9DqDTn2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190100

On 12/19/25 12:39 PM, Luca Weiss wrote:
> Enable the pinctrl, clock and interconnect drivers for the Qualcomm
> Milos SoC. This is required for booting The Fairphone (Gen. 6).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

