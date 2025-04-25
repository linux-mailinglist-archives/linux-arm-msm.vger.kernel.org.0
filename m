Return-Path: <linux-arm-msm+bounces-55718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8827A9D0BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 124E54C6A86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 18:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9BC21770C;
	Fri, 25 Apr 2025 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxhYNBXn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5730192D87
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745606980; cv=none; b=EGPg3WgFwvRc1cDmy7+cAmrm6ET7HxzT1e81FXbVlNVY7eMP7kcL47ncP5K6AYXeKajUaKAqvBcJ7jgrfN8pwk/3DOoCmCYGP1HtphCfNPBhq/noxIMRfISORQtBErvn/zWmnlqil2io2ccVQX/phAWrlSOoQkuX15H+Oejwceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745606980; c=relaxed/simple;
	bh=RneatS8jBZNd3NEWX3fEjnR61uPY8UIAAgxyzxoZsMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TulYQX+lGutn3GdNo6pOzV3Xfaza2+jyztPSwxRIYdtgzZ8zInohyw3QxjvG/xw0C7dwF1mXXNBuV/aKTwJ9rLtph/LjlNPyqaObIWXch0Nm+UZnTdg0eZ5N0F+fczdVNEOAj8sTu5K+wRJq44jUC+/08qikQOnSt9+ZZ4JOpvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxhYNBXn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqZI003980
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x1Wut12kvCNJz+De9wNvp9Hw
	b3L5Js19Bom/bF2EeKY=; b=lxhYNBXnlKsP/l8aCYiQmV6P5tw7E2BocR7YKujm
	oTDtmGQoPf4boqnnvUX8YT1cZkFvPsalIjfvb4jLU5iWvzgWc9UACXUukBDJcMnR
	y6qP+0soiw3rWxn86VlnOyZ+gShpaSvIw0wv2UoWeyX8cz5KJs8i5cl5Ka0SIWaa
	iy64rfVKv3wO8IBZnQSCfcsMvmpol6rntsKOsSuDNhfn0vkwq6qahyBc+1TEhKg0
	k9TX3iuUCdo1/LJJIUbjnC+NnPg70PZggYljCBuZL5f5V8Ku3aFRqOi6VAN4xeRE
	a66WcX85YToo93+jSlRchsqDG5faBFAm/xpVLoUFFpcsDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2a3cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:49:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so793273285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745606977; x=1746211777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1Wut12kvCNJz+De9wNvp9Hwb3L5Js19Bom/bF2EeKY=;
        b=MZqgxEPT9gdybvGHfiXOkBXIiGS7dMXNJLLf0PH+OsBQaAEODT3DPrfyCBTXEsQ3RY
         4y1qJdyXZ+g/zAfvRwoJbeWTZqAi996Gpay4TwmrYdohfRRZP9EDx4dutQsGB9+kPbHL
         kgyVWiPMqxlUAu4Cge/Iv5tQ/eJDMAX8rkuO6HPu9i+aPJRVTiz70YQLduBWcKWFNRto
         pT74FToSCRxEdmyYxjVwkDWYGiD8YW1Z8scfI9h/RR/yY3LzjTn5GjuSdRhet/aoTnLM
         Rl71GMKqD8j+sF3wZu10Ip7knM27zZGIwlIy9FnAAa0bPFagoPJhixSaerfBVHbUpX+k
         Dotg==
X-Forwarded-Encrypted: i=1; AJvYcCUkPXqNto32QjmA3yoawJoeQVjGeDqSl9iyPRr0ycVjgUrcmiKgwGsLgvQwklRbhjtfbU+GpkLbHrtKlCIR@vger.kernel.org
X-Gm-Message-State: AOJu0YynNSccfFAfJd0fjFKIlGEgPsZJIjn2jgcWAihqI1aQyZAwnqzK
	bB0hFE33cpok8M8w7K6nNZpY8/sJ8gv7vpNbu/cExYO9qDaQXvHd0GafQ9G24PTxU+t/aSCW9Oe
	5hSfRcDTNND8PFz7HDfPTrzAJ6wDahzQ4h6myGH+6smf07IztY3ojYkTTxcL40waf
X-Gm-Gg: ASbGncua8XmW3mi/yOt1PyJJCMhIziywrPXv4U6iGZzw/MDWS6vxHTSDNnvgyTUhVUV
	V9dMpfnbyz49JOGK5L7TIB9HEkHJ7XKJDXNVK+4XfIJPsSUy88FVIhe1dUjkyncp1jCmauIltlX
	QmTlOmJ6KTonTH/6zA3T182OKH/2/bmbN5wMBlPR0MJjf5ZA3IlfI4VS0O1IltZI3RrVzFZxoyo
	OWHd8F7w7rBq4jKdN0Z+ODNXCW34h5cb0i7Umar400MBswAQ6Nh5qoMHMi5W52umG14mE3JsLSW
	SmQqgQRapGeNbD0nm7s7a5ptpZsW5Ex7etD16ucHdluX/Zkwc8li2Pl7YanltUA+7NEkOvwTtq8
	=
X-Received: by 2002:a05:620a:4628:b0:7c5:4de8:bf65 with SMTP id af79cd13be357-7c9668bfda3mr136847585a.36.1745606976787;
        Fri, 25 Apr 2025 11:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFixpTIh9UohupnTvYjAkyQD8NuRNclkRjUtv4PU0Loqn4qq6wPUiPcvzkwrjCCdxtuuH0pgw==
X-Received: by 2002:a05:620a:4628:b0:7c5:4de8:bf65 with SMTP id af79cd13be357-7c9668bfda3mr136843885a.36.1745606976430;
        Fri, 25 Apr 2025 11:49:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca8677sm687754e87.175.2025.04.25.11.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:49:35 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:49:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/11] arm64: dts: qcom: qrb5165-rb5: Use q6asm defines
 for reg
Message-ID: <e3s3jlwayij4uxtdcekvs6ei6cfkynbolvp4tmkac7elehosih@76m5wond2dyx>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-5-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-5-28308e2ce7d4@fairphone.com>
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680bd942 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: v0X89dVe7AykvLnuULYx1jEBG57_VhAd
X-Proofpoint-ORIG-GUID: v0X89dVe7AykvLnuULYx1jEBG57_VhAd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfX2A6b/wXQijEm Q93bs1O37eHp4o5itPi3zNKDOz6TgoWz0ORdeJ5P49wH14H6YLcONMI7/iBfKqdlSQPqr0S+AgV zOHz1rEdi1g/seMZwI9uczkYEYWuT9Z9bbUKABHTMDl/7rLNCUDBJ/QM7Vk+LigtvK37CMljU/Z
 dYevu+H8JDVyCUtvvYzrx7pSKevmKsYEegDDWxejq8iYAduJT3xeblMZZx+ZlUTPYMuoknQtybW 987lzzxj2+E1WXee0AJw8pC1/68YtITvUS6GNkYGhtU/IvKSXVd0ccp5lmTxs7cHnJjJMjHNA3r H3j6+qCbIa4UKbv0yQd1DsAEPX5En4Es7YqZzoPAmcHGbe4Hcieesocmlk/HTkpOyDflRazP8cJ
 YYyKs5oAVfqUIOvdks/+9HVzG/jtze70n4qCp3XWROukQjhAL7LOZp5zD2I406+Ym7nZZlyf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=621
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

On Fri, Apr 25, 2025 at 01:53:44PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

