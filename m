Return-Path: <linux-arm-msm+bounces-79407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A93A4C1985F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A5CE1899FD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AB1328605;
	Wed, 29 Oct 2025 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lur2C1j9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRE1VAqr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F535324B3C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761731824; cv=none; b=WXYa7azu9fjdWvQoy+C2E9Y6h5KVXT9KHEggxFHDnLkdFBRU6fer+E/+z9GKytcEfRSSteiUYuZiLfltli9URtInuDKppA6djlWkWtgnCqRvlXjg0GPVdTv0iP+tLv49fu8hIPMNBDOVo2XBqUjfKa/24HOxjUAXQLvxdcOufhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761731824; c=relaxed/simple;
	bh=zFO1aO6erZNCnEKZzjaSx9KENRHEVHys2N7NvVHVqU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8Y6/FWSaPOJMyfJx/jMbYarMQ/PWoS75/pa+6j9oT5TbO44hgPuODE0zAg3uOE1ZJo/CA6TO0IAKvhqejlsd+H13Tq6MGnHQLD19Flj/Y3h/eGPRyNPJqGj5CTS3X7LMDm5HIBGU8fXxPvwX/OA95jyT44n/RmGA27gECpY3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lur2C1j9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRE1VAqr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4urwc3764246
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFO1aO6erZNCnEKZzjaSx9KENRHEVHys2N7NvVHVqU0=; b=Lur2C1j9P4kQAIWc
	RIPkHpoXkMQTAQoFe35/Kc14UqtPdJwEujwSXqLhICI0Untl3AcsEx7ukXLRF2v9
	YIZ2Dvleki1Vly9dRGLzYg9HokZ6xmF6BaKLC8YHXrX1qXoE6OH9PvFWyTIAVR3L
	ng+TDBSt8gCAPo2b5H4bxPzk8M9h0FLaLUrnvNGEUy1QPjitMqwbamd+tixQduPP
	D6IISulQIZV3Ypg1/GM+J/6O6cmMLqV7Z79xhRMex+7UBNY818e732yUpEg/pv9X
	MoPkgO5O21xU8LGqOVmY9317j+Dm4PLTf4DOpIqOAoOPsloJ41X0CHMb0+1nftAC
	xBIzYg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1237x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:57:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c19c8393dso19487206d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761731821; x=1762336621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFO1aO6erZNCnEKZzjaSx9KENRHEVHys2N7NvVHVqU0=;
        b=BRE1VAqrmcJfUNnsx4N9QkGiJnQpXWuCw/2Ns3M3bxO9fDqOr4qfLazTknh5Es3+2m
         29AjCsYOuemdEaHFAjcQzVy/KPMBeHLAdNGqJMLsV9VZADyyVUnPp/B4YSfK9OMTpEFO
         GnLiZ8vgDDjUxDCmUCU+yiXWmYrz/Yk4jKSCI4yx+VkPPpdpPaLlDiJ79DePMJVjdKCQ
         7y+8gibcm3BZ4FYIM2gEAV1MpWdgm7ANHshBZkeDMb7+GtsrxFqg+asg8AnEBuWYTRSe
         yvpBjsMTg+LO2swd2N4iBRFyJHgU+kkT3u1QSoD9fJ3vtWbY1MvSzpyksVSBa5xavu4g
         Nxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761731821; x=1762336621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFO1aO6erZNCnEKZzjaSx9KENRHEVHys2N7NvVHVqU0=;
        b=XtVOYfs9/ZtIvmhsI7lq3jAZ7rvaprJARWz1l512NifeSDxWrFRabbj6IEwi8Sk9nC
         1DkGrNuBY8n0l0wldll/w8BtFBPN43fHzRPgon0UFmg0MDJRuEZhl77/zMTj6LP+dGsY
         A3syD4X348qO7pzf42PGvCw8TJhGOIu0RhbO524vDHSPRhvsjieGMCRJrRs3oC0zTddj
         6EVRFzDmqOqzbmMd/UgCSNFJmhWkpw3Dt9sj+SYgnBDhMB1F1Be77GWbv39FLT87nuzu
         do3yyqpiu0c5933teVj+eh8KxJAQVLoMKzO9/ZTE3lFvjkcCsptbMbir/5QgEUm7wxpR
         XpBg==
X-Gm-Message-State: AOJu0Yxjt9PmX24C5KqKWThnnm3UTDByjKBhv19dVrOyBTXj6FK9up0K
	XebPXS+q0J//hB1bgsOiKdswEBdwVP37Gqb1tcPbqIu5AGx3ETkXLoCGKTFCYWBtFueT9a1ojat
	tHJhByLF+LIl7ulh4+ztQP/ZPjMpUEPROpwwDXAPVSSn8L+Nk/soD7AQqiScZboBqMTG1
X-Gm-Gg: ASbGnctv74ISXPcIJQ1Y/GrqCygqzwAHamQ+uxYpG/6TsDkm0k6pzuY71SGorWRvXAT
	Lx+TkHy26oF6roxcr8Gf0t0vO8OrEbdDmXJGEDvObmihKd4Ki9Q+qo4dnljlICaQlKWYSn8Jqxv
	QCypYDJbWIsUNzFdchnja/c6ODfF2u6+pbTaas6vaxnpq+JmWherF2tRA1hzHM8H0lscVvKC5UV
	cyiySKqYtQfgdNR+ELaNWhy7qTV5SxkBgtQEbVEBDRz2VUbk9HMB2XUGtcAwG67M+sB1tYT19Bq
	vlcpuDK9k2RCaZYO6CIKiSNb7KYKUxgIKJpYsr4+GI05xSHpX7qok64s+YWDRzzoCZ6aT0WUuQp
	oJHj/DSxNsrfAag4LC0tdqlr2G+Eed9FuQeIm0extxM8D5l9W0tsOPdhk
X-Received: by 2002:ad4:5d67:0:b0:77a:fa17:551d with SMTP id 6a1803df08f44-88009bcea29mr18956756d6.4.1761731820662;
        Wed, 29 Oct 2025 02:57:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCsBaGyKgmNCMDA4NCSIxtCQwj0AhQLLLMTnXbsb+Ii7K3dCO7DOjvpVRwoUPvaYD2FU0OQw==
X-Received: by 2002:ad4:5d67:0:b0:77a:fa17:551d with SMTP id 6a1803df08f44-88009bcea29mr18956596d6.4.1761731820120;
        Wed, 29 Oct 2025 02:57:00 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7efb9739sm11517523a12.29.2025.10.29.02.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:56:59 -0700 (PDT)
Message-ID: <abaa9d52-6e82-4beb-b7be-fab0496338ae@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 10:56:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Enable runtime PM
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251012230822.16825-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251012230822.16825-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p1HGE7VcSgz2TSi7IpgXyFmbS2K7vLtA
X-Proofpoint-ORIG-GUID: p1HGE7VcSgz2TSi7IpgXyFmbS2K7vLtA
X-Authority-Analysis: v=2.4 cv=A5dh/qWG c=1 sm=1 tr=0 ts=6901e4ed cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Em0PNhu3BUuMovijCD8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3NCBTYWx0ZWRfXwGntPoZ/3LdC
 WQ9iEyLuon6jZV5HAPIqe5UohBVv15yVLNWVcc0qcSxj8kQMSCTWN6zSJiuj8HBIRV8JXzweUt2
 pNFZTXOsGhvN471I/FNmEl83DMR8h2QMiL5F0GEPCaksuJM+2HHixK/PgBZwy5AJL1wz2JFl5EB
 AKQUHVjiJBemfqYwmJVnJC3OdYtnH8fxI78vP4ULpISw9Svzg4/NZg2xdRQGJpTwPhWsdEc+FTg
 boocpr8hjgc+mPduiqeQBHnJVR23bBaNd32hMJFzOV4lqyFXWps0cu/ee0wvVAVIhEHdwiVqNgN
 HirZHB1iMq8dYJXvuB1gGTU1GcTJnmjvj22R4LgOKa2172+r+N32ygSMGVkemrtxQBWaL5o/JGf
 BuNsW89UgOjY+mFm2VwxYwkBMcn/pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290074

On 10/13/25 1:06 AM, Val Packett wrote:
> Enable the main clock controller driver to participate in runtime
> power management.

The commit message does not explain whether there's any observable
benefits to this change

> Signed-off-by: Val Packett <val@packett.cool>
> ---
> Seems like this would be one of the prerequisites for actually reaching
> deeper power states.. I've been running with this patch on a Dell
> Latitude 7455 for quite a while, did not see any harm for sure.

"seems like" is vague.. is there any change in behavior that suggests
this really makes a difference?

Konrad

