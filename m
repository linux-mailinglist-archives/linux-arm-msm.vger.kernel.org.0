Return-Path: <linux-arm-msm+bounces-66988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EA8B14C82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 12:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46FAF18869A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 10:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61EA2882C1;
	Tue, 29 Jul 2025 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQ3J8MGM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522F428A737
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753786176; cv=none; b=t/eUEvo+45ZiOlY4GGM8pbhA2LMBP4x9zs+TetTnuxU6UEzvP3QyzCp2X00ypJjLfi4r3ik62KbsZYgS0JZmsmFVc/lfUSrYZujeIrqWSSH57/QeHPNkqkvNa0fVf+sth2ZeGFa9tVebk6vR1Tj1JxyPYjv42EKotzjvq1OZj/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753786176; c=relaxed/simple;
	bh=vUdyfTdjbF+l3su631l5cooBtaC3WlleYouL0ydx3Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOWHIg2+oiJZFkroRRajj0YQw2bq9ep7ig2T7UyzTZCgYic2HRr7YzojlOWFQXhdBw6MdvLL60oORY1r5ElPp7tSr/xyYeFKMIKiSu7a30hyCrYHz1GQnk8MdIlC2DX+bYdOiOkta8UptphiY9o5Sz84RSaXc1VtgLDacX1P1sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQ3J8MGM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8WBTU018832
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lo5hcIj++3t+Pk5CHCpA6OOx
	qnwkB/ZqQgNwTp/vi58=; b=KQ3J8MGMx2ou2NCU7VYBeXt19vAJfMqVfNj/9ypd
	0BSOxe0HgLgumZ30klRpZzBfzJseh00YNBfVMOWXaGMzug31SVQpplld+hMP5Uka
	uGYWwjbAo490xmiLjPP4jcWVFxrFvAtTXNsVF+ByODS4UdCK7jnVer3hETec86Ia
	SZM2tgeHDGPmp2MQMKXwuw/SJqk82PBWFqKO6JFewh4tExPUtqcAPYR0U/eHbE3x
	QOe5WyFTVd5wNGvJIGEJJKdRHCvwR0BnAhjQ8Gmh8bqZahaL1YYwnOu04LKO6/sq
	cRvW4xo0AAdT3SiUecGZwezPtUkICm9XzvHUuVshydv7TA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q85yv4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:49:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e207330a45so811933185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 03:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753786173; x=1754390973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lo5hcIj++3t+Pk5CHCpA6OOxqnwkB/ZqQgNwTp/vi58=;
        b=BSGprzvP5vH7YyS9m6WWwDk8ANPIpWFnL7yOSe/O7ZMyU6G6oh8h5PStXY9ISGQjxu
         N+aXgG7fKDW4x5INOMnC+COmKP86ZlNCb35Kc+iQxutJsl4n5dzRBqxNaqlLUjOx1Ei7
         9tWygoYK4r91SKHqC3LOgN2+g/M5aczuxnujVbrbtVk/T0Bb+uu+lZsUqOfOCeKGxm/A
         6JLK10zk+H89a/tzfvep/FvmPESyVEHvXVk9+xV9MQ4Q3vRc1ivPSX2Fp1sXW1HGuWf7
         vJ8F/RZNjHLamwXpZcBP6H4hz9oWJS1tuq/pxtzoX7YEwn2TgT61ZrMZI0Vwe+n2zZUS
         lkrg==
X-Forwarded-Encrypted: i=1; AJvYcCWDcjxwrJn2oe/UVvV0+vMEVhqwSzAQPrktAzkAyTWVCThIHtde+NHFuEsGNKU9pORC+g1rI0R2prYqQusY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk/irIgIIlurV3wMQpMdUbRnB6Z1eY6RCn15Izf9nfPWZMcX8y
	Pb9eNGdX9t018fx6Ivfbj8h+ANKpN4lvBxx5Kvc00uSISTJYuMPWspis0YFkRXQO+1L2ybnovbi
	GRNa1OBc8RckG1c6fYiv5ZkycLeQJJiGgLMfjP9ojcpD6+PwV8JVjUlHFHnDBHJ+0IYQC
X-Gm-Gg: ASbGncvPBowsYsNXB+P4W2XtIUIJzeN0iHZRiVApTd8C1X5MawYQD3R/m2N94hjzFsq
	0YKC/GREFTSakCVT4tJ3NdJhpKOPDoiMdKJQA6uRW46vt5EW92l9ClnwyPZLVoFKQTGOaGvH6r6
	mVTLHHLiZZyJBOJ/PfgCFhJjVo/xT3wWSd+EOnqSoMOw2lj6ievxbV2tld0RasKIxhSePQmlymK
	oGWAVcpGrFAOjuLybBllEKHiHI9jEQFw6RHZzxKX14x0GFFv0d1zmn2+yyLJszuhMOSv4rv+f6x
	BPUsYh8vMyyjv6nDAABM2KVVu83xI+q8gMFcUVx0/dKnwOGITIPqbxE11RTcvFba81oe4L2hV6f
	1ZzTtwaBPPS4BuUKIfRMt9uQq2uK8KYj04ZrNmgHRJO7y+loP0qvk
X-Received: by 2002:a05:6214:300f:b0:6fa:fddf:734b with SMTP id 6a1803df08f44-707205aeaf3mr174250016d6.24.1753786173076;
        Tue, 29 Jul 2025 03:49:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJD7qzRsibNuXaKYj25dTlRQLHEQU+p+3CjeKzyh+6IunNWCn9ZNOdwvfaAwF05to0NXbu7g==
X-Received: by 2002:a05:6214:300f:b0:6fa:fddf:734b with SMTP id 6a1803df08f44-707205aeaf3mr174249386d6.24.1753786171940;
        Tue, 29 Jul 2025 03:49:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b631a1b6esm1645910e87.77.2025.07.29.03.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 03:49:31 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:49:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
Message-ID: <63iuccupcdhzlo6u4j66vr5latfabjpbvtvrq4gx4lmxqsqskp@4yamwbuv4ct4>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4NCBTYWx0ZWRfX3m7uy7UmC+bW
 xp9S6Xq2KEC2ZzCGp03SFz8TnMouMW6A9z/KfsYXNvJO1ObL1M4+4Ojdl9a936kfe4HrEP3GzQY
 UmJJL5ji38jCf2zJ8BymxqnykCaNy4etY/XpWIYJ9u7c+id9svYIyUc26tbQPJ5L/3Cb4hP8jtc
 ZRS3536P8YKo8yldc7PFVhMBosWAGmBvTder5UMsoF1YEeYct7genV3MOLtfXQgKVgVrQxgpZhf
 KtgSVOne0BXBlVtCKnnc6AclURfde2TLtdl12K9kqt6nLArP/dO+33w5McYKUrTKd0N5ZqNEgS+
 9Lot0/3m3p46g9+gaI7sx/pZ/dujojPVuFIVUD8CdpXDBI22mgfzeihA83bGqpl53/RV782ghJh
 tqDmu7hTQZ8+CLcI0oMTsgJ+uhvvIGhx5VPMu7RuF5HD2etPUFc2aTsGESnluegBautlv7mh
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=6888a73e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=CzopthhaEyFBFQvfYY0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 5cD_ZGh-6g-ZdSYIAni3rZUzgJFat68d
X-Proofpoint-GUID: 5cD_ZGh-6g-ZdSYIAni3rZUzgJFat68d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=755 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290084

On Tue, Jul 29, 2025 at 11:12:37AM +0530, Taniya Das wrote:
> Add a clock driver for the TCSR clock controller found on Glymur, which
> provides refclks for PCIE, USB, and UFS.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |   8 ++
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 266 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

