Return-Path: <linux-arm-msm+bounces-62626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4802CAE9C19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 13:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B78C21C42293
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F33D274FF4;
	Thu, 26 Jun 2025 11:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RO2pg7Mp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9EF274FDC
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750935758; cv=none; b=GTzWXuF8gZ24ZXB8fy0smbkmp7XdLKaZMmRihDpF7dxGLcQGvTUo06LsZJbwGBZQO6xjgH6f2Tuf3az9xDA/xdIlnmg4XaBbpaUrnOgVXkI1fEPqJxtzfTGFjeMRn6XrGswdCkfaDaCqpWNS8mxvmXs9ai8PQVhbph98Dta+s14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750935758; c=relaxed/simple;
	bh=0Bp+qonHH5jylyHIXz9C6sgn6mP+n+r83KDRf7t/N5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eW7GQslHsZIMszWbLl0a5WDLhBk2Vd7Hrx/cB9NFS3frD4rdxUtE2oUh3DdIOCr/ATY+QWvqX2sagDUeYLEDBxA2vV78jsFTlkr8CgKT8uHTqUcXaTTWSrl6c7dx92dsA9+uHRquCzgWI79YWdAAEhgcFvVqOPQQ5rIl5MtOZZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RO2pg7Mp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9VAdV029529
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UE8txzOn/QAzC7EGqvtVxraZ
	th8YujXtysaU5pU06LE=; b=RO2pg7Mp20tMtr9g+z/d9ptLvnH/ztTZHViy7ixU
	shvntBNRiYLuvSW64h+jHPBbNRHbAe7ynwVIyUbAiCZr46/oj+rA0BQSaj6mRMdp
	mm93GYKHgi5MGjd1M3FxNyX74jZ4nGKhYyUPzdTUozFuTB5HI7xVuScDoUKJs6UT
	yiCFcuj8UsB/dq+JDd5CjE+Wm3Qz0A7nhuQ+WtA3QVFyPwX3WQR1T2Y9/BdmgBCX
	nsWwF3DgBNHa75SQ4t5LdsWF/Fmg+s9O0NZfkJh7BP9p/tqNCFBdsvSYSBEIGlzg
	sIUJHhkvMuRZ10QhD+r3wFJB5OxMnVZ7JFb+FwTctrtOaA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4vaj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:02:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d40d2308a4so128914185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 04:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750935754; x=1751540554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UE8txzOn/QAzC7EGqvtVxraZth8YujXtysaU5pU06LE=;
        b=XEQ0A14rlvPmA+7s3m+YxTA74Z/y75WEfLKQXqiCjc+7JXXhNL03dA0meXrN+Pvrcp
         b8NKAOwcLtu+Uhug4FtknHaXIhqYdsrT4DA3JgV8064SY94ND0xZ03rvt8K2PZAh+9du
         VoK/rraoinS9jTkLcE8jWXp7cs2oRkxLTyh293GtN96ovGL+elA//BpHe3tvxC+f7Ng4
         PEndo4MR45V/2ctmBsU+CuzAs6vcKSUzpWagX8zrsBMuLxLibI/hSrdJb22hFN2VK/o7
         WfQ+mBBmMHFsPmGzIzaq+9ZnwjXJt2V+f4i9uCJzq5CcNPMzjjSJuZBIn+sDS/3pHVGC
         cTMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBUnp4zT6lrvQ5cuSuwkgJMyYcYmnqgXat4Mcs8ids6HzQiWLClFGzlVS/SFAW61ifkGD96N+S0gjjXUQ/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyotkrzo6PQ8gcSUkt2p7T5j8zKSZXu3GSEKCVLHq04E9MfTrLH
	vuZdZDH1EYpKrNJRdMHK3YmBWucFvgtRwQJ64vvMgP9QzLi8Bg2/A0CT2cGUOIyYTA4NkREBF80
	7tT9TtzLoZAhgfuTgQjfPjk35g8JgTrxnw9pXTnP+uKxXoAGv8h7NuJA1CzWY+/Sj+oed
X-Gm-Gg: ASbGncuTM+N+QiuS2tXoje00cJDLUdGdxptK3EM74Llm7amg1Zi5JrSD3IH+qTXHnpV
	h+2l/6tC31Ev0XixsOHy9ytzjIum7N4roHa5FmRdRZnwTG94vJVTRyG06CTBwbSIa2BVDKQge0R
	RCKUmDlCN8TSmcohGq37qKQk/WPcizPC9K4glb8EzOHQs7BiH/NGy4P7lYWRVqE9/OsoCdyxzw5
	rrpDQzmJ3wGoJVuG2HIROACUcosW+EbKH5MBvci0dEzGhSgAK/YJquYE1GX0w0BZBg/pfq1rjA6
	rxED/q1nYkVufLxGbIWGbrxdESF4b5+mNU0QZK/NllJrcmyE+LXb1tLHzrgOiZfwCL5JHUVxg8p
	L+8mIxpCHePwMhqWLc478x0pIK+3kGxggNxM=
X-Received: by 2002:a05:620a:4708:b0:7d3:a611:b72f with SMTP id af79cd13be357-7d42968282fmr882464785a.2.1750935754108;
        Thu, 26 Jun 2025 04:02:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCNqTQMhKRAgDVgIkPVE6+Lum8rJ6kECVPTi0eyeggPAIZDp/ebpXhKUViiZfcfoDb+hbfMg==
X-Received: by 2002:a05:620a:4708:b0:7d3:a611:b72f with SMTP id af79cd13be357-7d42968282fmr882457885a.2.1750935753495;
        Thu, 26 Jun 2025 04:02:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41442eesm2524970e87.14.2025.06.26.04.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:02:32 -0700 (PDT)
Date: Thu, 26 Jun 2025 14:02:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qcs615: add missing dt property in
 QUP SEs
Message-ID: <x3cmdir4lotf3yekbu3tsmts6idsvwygrp35opszmgabhpvdda@nlwrs5qojcml>
References: <20250626102826.3422984-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626102826.3422984-1-viken.dadhaniya@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685d28cb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5yXfonLdrd0yReSgdogA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: vCso6AE8xrQblknGkDf836XG8RHj6BnB
X-Proofpoint-ORIG-GUID: vCso6AE8xrQblknGkDf836XG8RHj6BnB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5MiBTYWx0ZWRfXxalQsVNbmcsn
 QNcpTwfZBHPF6OMyU9LQS6B+5gsczcxrnzUrX7c6QDsuhfjbSm5jiUdukk09awMl37hHdcCcWBC
 Z6i/QEzFCFQzQKXwqqWc3m9rhKOhKgHw7xGE6kI3c5L7k8yzXKHYwscVmlTvrxhzUUNxebVsOoZ
 8z2KufHGXJbrPzVRlC6wVKQ7vnWm7HLU1Uqy5L5UcIlRQjiz7Xkw0JWt0aUAX2BYwbtfYuZnbYo
 mU5x6UX0nzg8dHt3NG4741W3EuAGe0JDb9PrnCF5mm4xgWeAEmR+YGx7BHYjf0WytPdOksTXIie
 yNtye3N/5pcuyxYQZ5GKuJXSIbbAwaAgH/azQUh3rhVEDqX2kIg8H9RjmCxLFvVY4qwur4SnzSZ
 jLmmx51y7kzf5qCbc93R6p+OE81+QdbFKKVbqY+zww8ZkodXbyMXAOo4fX/9nJhJqZrSGKgz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=729
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260092

On Thu, Jun 26, 2025 at 03:58:26PM +0530, Viken Dadhaniya wrote:
> Add the missing required-opps and operating-points-v2 properties to
> several I2C, SPI, and UART nodes in the QUP SEs.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
Missing Fixes tag(s)

-- 
With best wishes
Dmitry

