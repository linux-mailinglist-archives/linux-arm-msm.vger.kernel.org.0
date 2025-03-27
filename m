Return-Path: <linux-arm-msm+bounces-52652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F837A733CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DABF6189DA58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 14:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBC421771D;
	Thu, 27 Mar 2025 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhVxOS8n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B36217671
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084034; cv=none; b=hNiQSVcrjU3R57Da3a+e8kEMy6uzrsHGy5HHSrq0g/vi6wP9cOV/U9aj54vRriBVOYD2NiMDtupzHDq70iUDqY14MDPt53KU3qhfC0mKOdk/9jgFaqv2xyhcO1NKgLQJYR9MYKBpbne/zUihnxMQmoQKz/Zq34oUhz8ukHHf4P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084034; c=relaxed/simple;
	bh=yQiHjUFcyJIrOWKZ5UhJU8gr5ewgmJPG7QiORquZUdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkPCSGWeKGtD3nURA5yunPwfMytzkrEV5e9sKJG1IYP+7sP4Mqly2EbW7pCVbQe8eEYRKLWZiDM398faiXJwpiP+Mz/Oh/tVR3Q8b8YJF/3DBixMzq5IrESpKyVmlhhTq+E0NYakhZreplOaPA7SaQWSzEocvmeavBMjpCA/B1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhVxOS8n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jEiF012433
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xzv6Jdtih4Pjuewr0XazKhab
	UDZVPmr6YzAUTkg3XoM=; b=PhVxOS8nHVDf1TOjSeTHcpCxOCi97qEGEJSd4VXm
	0K4Z/+g1vZ0zFiThjZIOTP/zXAMBGmao9w2XM9dDyL7V8NyKyTnZpsY2Je0QUmzn
	ImTySzzXPzufvsQoPOQIeqfm1kyns4x2XP/3Ive/4X+8uO7Vyx8P8hj6kgvLyBjc
	3uXX2roKMB10WBx6lfNUa0h+IWuvC5O7ormyRJ6j/gZ77rBOhkCT28WsylfoqDTa
	CD5oOCUtAEXVKuqEC5/pdH2LLrz0J3Ff/bshJJigOUJsPyy0I24YfrZbN1S5eYce
	oqEvDdpPOlBcY26dWUi7tYoTZbRlIrHWJ+eycRYFiewrQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mmutk53t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:00:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54e9f6e00so361604485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 07:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084031; x=1743688831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzv6Jdtih4Pjuewr0XazKhabUDZVPmr6YzAUTkg3XoM=;
        b=BtRN+OCROCeLwigU7dvPIlSPfNXzb702Y9DIibHpYzOOCFJKbM/sugLVCQmM1Od5mq
         ES3rAX8gsvh36h8YxJ2icCU8AAzkscK9Ms/ukX+4yQyj8GiqavdbYscGCqFkJmke6OV8
         0fTZjlfhYhHXM0LsqevdzHKbj6b9pzpghDAn/8QjSkDPqtWZbszOeO5DWasjgwH6hRSL
         4gQkVOPJXOQ3g9MGkIntQUwx5niur+KIYf7SH2y1yQ83VkH2pwY1Y0/xmosEft7iw7CT
         NgNinynnScj+vkjk0Q/S4CRznHLYEg73I+0sBevc1YlyHZ3uwdJQvLIN3KK9lnskN47w
         h4ig==
X-Forwarded-Encrypted: i=1; AJvYcCVOTgB1as1SyG0mkeqa7CuV5DonQDY92sBmcst9DHM8ut9Ye1i6k0VT7mzU6gVhfDWw0vrUUUqN0MxOLGM9@vger.kernel.org
X-Gm-Message-State: AOJu0YwunzJN2yRG6x3/N5LhPyeopNYTOZlMqsb4HphlH1S5OvfxWMlY
	HFFrlpUwkQVbuuZ2vVFHKiLk8VfgZzEAagC4Z5dEGKq0Vol0ImbHbR1jpsF+9PRR1U8EkD0Ne1y
	zIJkn+pKiNq8LxLV73xGZWnxuoLEvAj6r9A1/+6GwRVT9M/vDGOgwGpBFimZUaaDQ
X-Gm-Gg: ASbGnctHsJSsewgGax7f/N7tDntVGuDiJoWS5G5IRD2KrizSH9XWl/PLzE2iKVjLMlJ
	PmB+HzPRdwyWOzfug7jB/kMQLG+Vtt2t/dkMosm+VnuXcMK10pq23lvIJ+UKGqTm8okoWI+9OYx
	cDu7QPnhUn2Wj55U688i9pE0C4+mLvoxERBelMJnI7aERG0hnOzQP34EweTp4UeHh4tZ976ks/c
	IaWduXteRC/4K7qRAQqmYIvrh1xaQZyHZYYYqSRr8UcIGBQd+38F+GR95MvNqzoAIsIRmrYYBcT
	3wv4+NWi+xqC9vfLmd78jcqr6hzr4lch2Gkq1FZKHy+1Nw7Zf54t0qbr1przghf3MvnZ+2iszFx
	OCrc=
X-Received: by 2002:a05:620a:424c:b0:7c3:cccd:92ec with SMTP id af79cd13be357-7c5f6afe158mr46280585a.0.1743084028269;
        Thu, 27 Mar 2025 07:00:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdaP58PwQwtVzSyQhWchxMjVTCY2g/ULYhQT88j870psO7tT+kuGTL3evaUlHEe+4GDAFVig==
X-Received: by 2002:a05:620a:424c:b0:7c3:cccd:92ec with SMTP id af79cd13be357-7c5f6afe158mr46269585a.0.1743084027452;
        Thu, 27 Mar 2025 07:00:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6508158sm2091751e87.185.2025.03.27.07.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:00:26 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:00:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
        Sayali Lokhande <quic_sayalil@quicinc.com>,
        Xin Liu <quic_liuxin@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 11/12] arm64: dts: qcom: sa8775p: Clean up the PSCI PDs
Message-ID: <dr2wkctvk2glk5agdxpijmz2wifvj5f3dwyh2pjlzesravutwx@xa4zcsuyur5p>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
 <20250327-topic-more_dt_bindings_fixes-v2-11-b763d958545f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-11-b763d958545f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fdyHv_4RiVv5alRoHGuFds69js95p9V8
X-Authority-Analysis: v=2.4 cv=MqlS63ae c=1 sm=1 tr=0 ts=67e55a00 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=LKVomu9JRcyPd1K0AmMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: fdyHv_4RiVv5alRoHGuFds69js95p9V8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503270096

On Thu, Mar 27, 2025 at 02:47:13AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Because SA8775P comes with two disjoint CPU clusters, we have to follow
> a similar topology description like the one in sm8750.dtsi, so:
> 
> system_pd
> 	cluster0_pd
> 		cpu_pd0
> 		...
> 	cluster1_pd
> 		cpu_pd4
> 		...
> 
> Do that & wire it up to APPS RSC to make the bindings checker happy.

Should these two be separate commits? One being pure cosmetics and
another one being a fix (probably with a Fixes tag).

Anyway, 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

