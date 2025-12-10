Return-Path: <linux-arm-msm+bounces-84947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6EECB4459
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 00:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B95F301DE06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 23:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939FE2FE593;
	Wed, 10 Dec 2025 23:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQu/+IXv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZbqrerY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCFB29BDB3
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 23:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765409323; cv=none; b=QEGPoY+rgyWLItqAnnWHzXLPLw2fBP1TRVkgy9Flo0xPS1KcN2y0sJZijicIi8hNC7rvVKCDq0NpezCwvUxTfjRggZ/tOnu6vUQC7lmEdRLGYHVJDL8xRmGJgrnVFO32gNRDBlZhBKTOscVGb9K8bMFIVLXpnlBYuz1g7gMSTAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765409323; c=relaxed/simple;
	bh=74xtyYf6xpPikNlwaHYFuT/sUIl+m7DSphjJpZzHmy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OAs9P94gRAjvIYIF5MaTiC8Iiiu3E3hYffTdXXlY6sjtjPtKzmLm6TGK6HlmFoffFdqBFMHDqr3+OM9W6k+YrcO0dy1EKMZatlT3Srwotxw/WuJfcFLNmlvtJFrsv51v5HHC4DGHCk2Jy6Hq0+C7bOuK/tGvjRIn4sp9iXNBOos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQu/+IXv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZbqrerY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP4Fx3726640
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 23:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z/o/3XF4alkAwZCUKfNDjJzZpS8RokO6HLTLhEtus8Q=; b=NQu/+IXvcd3z+JO/
	Ph4SLwzoTzMhSUypqAAfnQzD326Yn4vGA8+iEGUnET8Z3XprLkm1s0bFc51kF4nL
	qQeUB01sqH2DCQ+33yelh6BRDN7Pwuka9Fz2/yFntXcFUscVMWEuKR2FSg/LFPfR
	h7J38G65jTJYL9TkgYoJcpoaY+kZEi0CikcpGWG2UPif4XmrsU09qo4E1rfbO15R
	4J/mEq3egErm1rUzLsPqm6KqBNABfy6NsMYu5cfTdZvJWDsPtIF4AlJ3iVfuIkIJ
	1k7AxHobRVz5rHtRIW50IodmNuQ5oSd+1irBChlyUjyt712n3EXlH9jqe6COlj93
	ZHGHYA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayg0pre3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 23:28:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3437863d0easo578017a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 15:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765409319; x=1766014119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/o/3XF4alkAwZCUKfNDjJzZpS8RokO6HLTLhEtus8Q=;
        b=iZbqrerYz0Nb3ld3+74oueY3j+jgtg8aAiXTDrnfkVYB0IRyNk3c6d4QoUIHVWFczZ
         sVUitnK0UHJcBvTwa0Vd7XljmbnWkAJLyLZqNe9iFH7zm933mTFxGvVn6rvo732w4qAD
         /KrKWXUMWqMrxgCNRLubhN1luMtgQjP6p/ua10YpmIPqOr9QY44lOadullqfaY75kn2J
         /5f5C8oLMHqWihGu9b4uTHBG/jCEk2hJzXAhztg7+Ck9bdaLKwZf77gMqrPoPajEqO1K
         a02LReMOn6bWKdAs6bRu9FF0MHhGmYVKoG8iH+VJYcPZ9jszLvvNDgRKZ6sA8BwvcL4y
         5GmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765409319; x=1766014119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/o/3XF4alkAwZCUKfNDjJzZpS8RokO6HLTLhEtus8Q=;
        b=Gyi6GEEe0wnXW+bYrdQt2S6steVfDm0RuY7RUnQbIqmT7+Qb3DOr2GUU+zw8sM8NB9
         ru8wwkWQgg68ns6Ip+BQSmi1d/DMqrR56VkcxVrDn2iRzn89N9ifvr82LeRPt6kydUfF
         W8YwwGtzaMIzEYKPUPJFaalZJuFrjnWcogazsecC6BjBR9J8n7I2/8iD8gyBBadJ5q3w
         YTH+017tfmfFDeRobcfTtgMrq5+/HAgUFCcm/c6DGxHx/M+TK01q1/BP0yqy+3qOjPWK
         Z8v25uPQKd7luqb0dKCN7Xy0YxtDXmY6f+PyrHSyH1jr2jecZKhQDDm3M+bJXf7FDXgF
         fBtg==
X-Forwarded-Encrypted: i=1; AJvYcCUJjxMSjsGz0vWTiCKw2T7E0+f9rn4wT0YSVldwg9c1h+1+WhqIOJhMHXtO8sLJi2EZ51kLw5u2FNC/yDy2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcg9DzQEDbTnhlj542ivNIv8UHPUfEnnyqwpNGKplydyWpfQye
	I8ttlO0/LH3rv0s5gD9oX6dhI/qZ2X7xrf2BMnIiViDn7VDoZ/xdPFZas8M2uLbPuPYcZuArNsI
	2XerRDcaYUzwddj5wKfumJKL7Ehxc99rrZxuZ33Nie8j+FPsXMzCAmLpjdTBh7zbs+ozm
X-Gm-Gg: ASbGncs1+jCswrzGZYECm9S9yNv4d3ps0MiOH0ves6ehUTQQ06EMiqbEQIAiB/IUox0
	mwYBS/ts3PIsXiU035ZYXv5iyJCO+/G5LcXQ1Vle9DtJaNY7CEVrDvu8yKXfagRFb+XDy6di7lt
	5W9S4HSPL/xmd219gAImOsZkNc/aMW2NMGqlvg5jPaeQCd15nXfEUOL5kme+srbFqOD4Fxu87qb
	Aeic2VpWzXfZqjVxlTF2bf9i5wWLqtU4RXXIQXfT0czHjhUpjpfNXQjeeaM97K0rMg+7l3QPGLS
	M5sfoF6IF7zamvuzSBaDnEFaJWIzPVAOFQ2Bb/V22rndxMd1SBf2jbc4/m6Cl7K4BL9lv+T0DyZ
	78QMA2J9oEK3rSeVQwTiEo149CeuehjSbNQYdcE0IDF11XXAqrlUs4rjBfBbndJPlBf2Ibg==
X-Received: by 2002:a05:7022:3897:b0:11d:fb4c:db13 with SMTP id a92af1059eb24-11f2967ed3bmr3206857c88.14.1765409318740;
        Wed, 10 Dec 2025 15:28:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJjUKbWsLNQG4Z+pS28oopEuiIA9c2gp/Kvg1Kb03NiNxnxDwCQgbs+FhWg5OtZG1MZiQtUA==
X-Received: by 2002:a05:7022:3897:b0:11d:fb4c:db13 with SMTP id a92af1059eb24-11f2967ed3bmr3206828c88.14.1765409318039;
        Wed, 10 Dec 2025 15:28:38 -0800 (PST)
Received: from [10.46.163.175] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb28dsm2427513c88.2.2025.12.10.15.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 15:28:37 -0800 (PST)
Message-ID: <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 15:28:37 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
To: sudeep.holla@arm.com, cristian.marussi@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mike.tipton@oss.qualcomm.com
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
Content-Language: en-US
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
In-Reply-To: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TFi9Pz98srI3crEzXWaP0sLW_YeiAwVz
X-Authority-Analysis: v=2.4 cv=b46/I9Gx c=1 sm=1 tr=0 ts=693a0227 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ySjACDpaaGWjUKYOdFYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE5MyBTYWx0ZWRfXy1ag+QkTzZSE
 ei2C1BlC46UnaD3FJ0sSN0y3Cv82cEzh1IIylSwdQUj81iZa5qVNgo+bxGVYTnghGj7hacP/1/y
 WW5JwWxKLKtzzlu4WKMKy0IYeQ3xZOwXty+R2y6WGpDEFcNT1xLqF/V+oKTe6TB5IItGDhyJ9Sy
 1shf6j1i72womo4Up1d0lMef9gS64nY0aQCwjzxk5WsTxJ4O18pt08vJHHJPHL2EeZW5jvILLfq
 QzX/IpIMrkuG13LsXfQgbbREejp3mm2hihHVuoDV0QywLwghdgYdz6JuK3scYq8GsnG2uX3E4cw
 1uBGTVoxcObM1dfbTPCiOUV7pZFVKwheOmeGWqOfC4eWwTyEHInXCp6OyV7FiXSHY1XT6vwzS/S
 Ss/06VNXUH3DO1XLwwIH47IU5wT3pw==
X-Proofpoint-GUID: TFi9Pz98srI3crEzXWaP0sLW_YeiAwVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100193

Hello Sudeep/Cristian,

Just following up on this patch. If there’s anything missing or
needs adjustment, please let me know.

Thanks,
Vivek
On 10/14/2025 12:34 AM, Vivek Aknurwar wrote:
> Some upcoming SoCs define more than 32 operating performance points (OPPs),
> exceeding the current SCMI protocol limit. Increase MAX_OPPS to 64
> (next power of 2) to support these configurations.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/firmware/arm_scmi/perf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
> index 683fd9b85c5c..2249ef7fe790 100644
> --- a/drivers/firmware/arm_scmi/perf.c
> +++ b/drivers/firmware/arm_scmi/perf.c
> @@ -27,7 +27,7 @@
>  /* Updated only after ALL the mandatory features for that version are merged */
>  #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x40000
>  
> -#define MAX_OPPS		32
> +#define MAX_OPPS		64
>  
>  enum scmi_performance_protocol_cmd {
>  	PERF_DOMAIN_ATTRIBUTES = 0x3,


