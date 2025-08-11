Return-Path: <linux-arm-msm+bounces-68363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC89B2080C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 13:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F20418C4D02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 11:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01092D3742;
	Mon, 11 Aug 2025 11:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGBZsmHz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCEB2D29C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754912430; cv=none; b=kRBk/ZrIbv3DAc+2XhD/VPBi0+h0BqZHC7KwcqaXCD3vs6YfwLdYuGhIoXb+Cb/HCFpz1QoO734aIpkikYfjqZBwCSDqJHA/RpQ8OF3W+zin6HJTq8c78SIwRWhC/jtwDs8iQ1WtbaVLUGUTfAMYmg091aqVFjYrWR6Pk0ykKus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754912430; c=relaxed/simple;
	bh=6lFao+Zb7QpPd8YuHQG/nU2Wug6imx5UBEuBoNzE88s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKW7ZgNbmYm2DOJ1S2jm81aT4/drPKpHoSoyw8pAsWhX2Sbz/5bNqL16QH+8wQ+7OB/GonWoeWaXPq+tY/NBOQHQ7RfuViLNrE62UwlDI+KYhatvWGzKnpkoWCxF5fNDYsUt/qYPOkGjTBdybD78L39bgdhgokc8j3xt1IeGk3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGBZsmHz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BBJpio008687
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MI7eOWlhA8wMryLN7DmMCKNMSC+NaTn6BOa2zl+P8EU=; b=cGBZsmHzqQa3K8cg
	aNlqzxrGZNzagDvgTVYlPOUIVixavEVjuA+9qXI7IODtbXS4GIDclPvYIK788uOg
	dBr24Bb++1teD74Qpf6QJU/hiWfKHfDm+aT489OpTw+ykU6oMca+AvDKFpsHGP2q
	n41FnnRow9Cfn4x3BTaAzArfoNDhaHj1rTgkCsu3AkzE+JnknjUgJeMeBKk02QL6
	tr8surAZ6TRk9/DG2eJFK2dgp5VsRdlFQqqD3Dbl4/WXM3ZqTyVD/2il67Oo+UZO
	HcbtQ2aisCxfr/Pl3HQ4cqu4qFTMrwAEX3Y/aLrzWQOhs3c/sXm+r2zqxYVXqgTY
	0YHOZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjg1rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:40:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b0c502e87bso2049111cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 04:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754912426; x=1755517226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MI7eOWlhA8wMryLN7DmMCKNMSC+NaTn6BOa2zl+P8EU=;
        b=ad6mn6mT7arB7I45UwwjtXNIlpK2T80wdPve2GdSURH18aO5kNlV0iB2EUePU82rqe
         YnCJV+Kh3NeGyr0LV6m9kA+dFxLQweMdndsfGBIvSI8JNt3Ix3pWgVq+5jrpqtyrOWNG
         oSHlwgRU4tr/ttWH6LhXF2WsEcYDyPFUNHJPaXOLF5uCPdRvALuCOWa73rL+TNo/Nloz
         udH9fsC/kgqxsxpkG0dkjynHrfDe1MGKylKf90U0kQxhky1oVK5/NR0Ff9s7jvLMF/Ue
         YWnVw7NTq7XuyHQU4avC3OOf1bzczIcYjDdtV394xT2TKS8cfCEdLP1E3yDijzvM9tgd
         XOVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZEsHh35I4r+vFwPTsO59xAbx27iKXCWKS0IUv85bs2AOBGzwk1Un0HgIoMJsQh35XulbdDGWyPmKPYOYs@vger.kernel.org
X-Gm-Message-State: AOJu0YxZYhTz9bhTOj9moot1rKcSdluRWGUvtjxqecPJOIlY2TfAMn/O
	sgSf3RxUevN0Ld6tCIvNnpAhF0JMLB44QmjJ5oLf2lw3rUzWutZ96/Ac72Hp4t/o+xJlmeaGYPG
	bdJ/UkwPLKgLpoW8nGK3wnrinDxE/30o3c95/GG9+DKh3W40HDExbCpJESFk8TLjAShU7
X-Gm-Gg: ASbGnctp8t+UGlx4rV8lZvODCUwpUsERKAiRCgZISw2TuEj97KUC6cEuncpoUkjfal8
	Fxj2Y0FDZ5LBwMhPJ0oEdMe+0blCKpRELQubB0CQ7Evph8DMvrW1GdsULSGXNWHdn3FWmQzuHJv
	KjVNklX7dJhiObUC33cS0b5Tmh34eBnIy8zXDNgP4yRjar6jfmfAJxJ7+Q5j8TghkLMr2PQXXLT
	lYqjKPeVMDnAt1hXLfQWJSUX58i2naXdH+z0azKouzkPZbWRii+YvMXZRrPZa4ZLBZSFC8i3GEn
	5jgIjwWaEuv/Ka+8omZduNQWzfbUAmJKQNFYksMJQNDUKwCrMN0ubBh/Bk21Yrb+BIPWoU3UFxY
	A1BhzOBXi8gl+l66ylA==
X-Received: by 2002:ac8:5a8a:0:b0:48a:80e5:72be with SMTP id d75a77b69052e-4b0bebf823bmr63470001cf.2.1754912426055;
        Mon, 11 Aug 2025 04:40:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIIAf6uSUuU4xC43V1tuCSDMHeT1D1YgDQ6raFA0BynMKaAicqiW+cWh3QOPFeReGv9rWEcg==
X-Received: by 2002:ac8:5a8a:0:b0:48a:80e5:72be with SMTP id d75a77b69052e-4b0bebf823bmr63469761cf.2.1754912425547;
        Mon, 11 Aug 2025 04:40:25 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f00252sm18323144a12.8.2025.08.11.04.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:40:24 -0700 (PDT)
Message-ID: <d7058c31-8591-4e7b-9580-218888c13738@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:40:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 vibrator support
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
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
References: <20250811-aw86927-v2-0-64be8f3da560@fairphone.com>
 <20250811-aw86927-v2-3-64be8f3da560@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-aw86927-v2-3-64be8f3da560@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX/eegY+MYFm6z
 LcSNpMDmXSykrvPqdScDwmXb3xf+tsjvg9Ga/NUNT0DWV7JHYU9EeJr6MhwkhktWn1YMW2YlPSE
 1A7gE6IPFiWfybsegP3Eqf5QmtNsseO9NXRibyU31lQ3izfJT8soWhGYtOoSUL4tOuK256dZasE
 eEW8IHS8achGrdCUkSEJ/XiXT+tIpiykbE0KYGqJ6sNpmNM8TgJVJY5t+JI+Kpuo0YpzP9RqH1c
 61dHR8PqC9XXcHhtLQyOAYy2m9Ulgjgo8TWYnh9eQh0MpHsX/mT+xaj2AkPLmDiKuiDQ+svGueJ
 OHAyVCQcV/H22VeghU/jhqvhBEUqJ5zy+OFSXmL5y646zS7191Fqg4LI2A35dLcgJraS2cb5mv1
 dAQdkUDN
X-Proofpoint-GUID: wkn59QBMR6UlpVutRCKFb8nPhbDmMjz-
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=6899d6ab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=wGZfWhOSCpwZsoq7SDQA:9 a=QEXdDO2ut3YA:10 a=a0DIy2mVpJAA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: wkn59QBMR6UlpVutRCKFb8nPhbDmMjz-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

On 8/11/25 1:12 PM, Griffin Kroah-Hartman wrote:
> Add the required node for haptic playback (Awinic AW86927).
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---

I'll hit enter harder this time! ;)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

