Return-Path: <linux-arm-msm+bounces-83310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F32FBC86991
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 19:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51D253B2CF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 18:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C6132D0DF;
	Tue, 25 Nov 2025 18:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1+ZAO89";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFqQdY1y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FF232BF21
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095150; cv=none; b=SgTc88Uz4Ea0bzjfPvYDGa5RFXvAHwD95JDykz+MTkwhM864Ldij5HQNdLL8nWkrM8Mmt4uk/F0el81Zxm333xExNCO9FjRmjuYGgfjIPwcWHHC4scVRuC5g1YSY3YRRa3Q1yWlRYxKRGzglV4vv2S8DHil4m5C34BIb2lfwd98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095150; c=relaxed/simple;
	bh=IzSLreeQoCw7D4iAy3wUNJ1iSVzNzx0iH6ty9Dq/OUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfAbtsGsUw/EO6JNjQE+IGDGWMtnw69cvBx17dEaKEK6pY64IR3+EI4OoKgDqOE3y/9OUekPDX9J0IwchhZmoSy3D9aUPcxXyKyN4A2wYLesCfsjMUPTWOoWYc6bh+Dlwavl37JXDhnGxUSu9kGVZAjCVVqy4032W22jeOGbqJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1+ZAO89; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFqQdY1y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APIC9Wg1232480
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A02wTRJ975rFMW2wk1hYlR4W
	67AFtakoJZ6vTYb47Fc=; b=P1+ZAO89p4HNY4NOGL5w6zU8U3WoKSeVxuDNZqIP
	0uPpDwjsF4wcFbaOrfAGFdOeu39VPIqWBQD+1ETLfpRl2fV/ElORdOiqk1sBC0kC
	K40hcj6c9cBU0tTxoWukiQTmQ4+kB1iesmmvT/2Z0fDwJWBwqUyolfGKDzPfETGE
	EitoHvdHtT7IioVn8S3xlWRvHVz7KOSiApQUVdbWqZrcPfhn6AdVsL5u7y7jhYo0
	v1nZQSF6q5Z4OeeL5oz/3GaIm7EGzdYdqCEdUegKzuovfJ2t0IR5HmDq0wb89Dqs
	uqLExbG+UdQ1S42cD8AqYSkpwRnEGyVH/puqFlLqlU5cew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xyk7qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:25:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b225760181so670465085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 10:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764095146; x=1764699946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A02wTRJ975rFMW2wk1hYlR4W67AFtakoJZ6vTYb47Fc=;
        b=bFqQdY1yrWpYxz1xmw6vbePMOZH1Bwy5L7eeFZFwwFvyb3VjId+f7S1OvI6xditPVW
         yHFFtQ111RQ0b9UExi5SEQ5C63D91DIZAb2bIN1nQx3Q2GRiLqFcl9XHRgp+398WIjBx
         HE7oRssdZYM9iYQVBPhuGvu6UUQk0wPlnV8fpVukrLMhfLpRra7CW48yw2dHym9Nq/Wk
         0zP8w3Yqd5cGs04yqY6SSEglXoCQzKtb6vDm6d+/x+gWLCendT4p7wu7MekK4js773J1
         jJFe62LQ/ZehVsPpGa/pdDyaeZXodkmVWAlYGQi4ToSnZYw7mHxNgCFwjhjuQtvAalRi
         Uwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764095146; x=1764699946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A02wTRJ975rFMW2wk1hYlR4W67AFtakoJZ6vTYb47Fc=;
        b=u/kuOQ1eNz08fmFc1WhFiKxetw+HCgb3kTSiBkKBCWduHN8h4oNSmIkF2+1wtCbCis
         CXC8oGqDwMip4qNwdLOKk40oILSwXHmb/j3BgwNRvMQEKzLJVZAnhOrA92l72yQjT6cB
         HcRC0ktKGQUu7XrypMsOMQSBEhvrj7CdXTDmnnX2/g8puhry2NLOyYPzrLqkovLgWaUE
         UVwRV2q4q26RjWiFQdLtz9/KvLeUEZ+15KIDzUF1RV3kgW8Ot5iRhQBPow5FmiRK3i8E
         U+ymRS/xmR/djpdTJn5HFmBKTHqoXeGW/ISTrhtAKBTbwh33ubC++sJ2NRCxeIo/paVG
         Nxrg==
X-Forwarded-Encrypted: i=1; AJvYcCWHpqq5OPyN/Vw2adgZiiO2M1T1ifYP9G+zKONiFP11Pfv8wmG2zZDN0gJPcLsVdF90NjmND6Y8mHI+3hZo@vger.kernel.org
X-Gm-Message-State: AOJu0YyzpeDa/TI/kRjzFBKkqGGS3YiQkGqE7K/yX+7IiIvgk4kiMLzi
	/hFnO1nQYv1DQvMlEhTp8hQ6+OvBEK0UOHmzFqryqOCD/yX6gAQKQ72bH9AgvfcXcsO3QoUy2La
	+0VUZvUiZin3Rxg5o8/5LNTXNt+XPzouipr2NDm3laAK4p2PxNRFOaih37hot55p+cahB
X-Gm-Gg: ASbGnctIJQraoWgHxFO1QJ7SzhCq7jQR/AohpfOuBGnkFDSNXIr6wdY4Z9fp1TOt6zn
	JRnDDZnnxlmIU3AQh6PFUoHdi/a3UEP2VXVi96dKgU1DQdmS4X0I5YjklfJTGDXGcfRUCrPD9ez
	nIdgonVnI4xojSEP35KTV8/LKAXRWZf6xx84+iJf/PLEPFsbtie16BW0vkIlGjjylfbf4xUZmD9
	OoTbjawxnz3C4CTLdZOGrSZSOrpDtddt8jVvp2gAGNWqsq3FYaWZa9paS0H7qAx3daWWKOemrT5
	EQ5BbMwwHYX5PhJLbAj9rqRxbSUUXND5qREcYh1nd1e/zYtOxAvTqFoJ3kridEGVYwJcCtInMU2
	DG8Z9mqGCCE0LWMcI+XGGeQn36yQ+5nISQlys02NwZQNpzuL1Yqz9INpVUfi8pWdShsSVw7wdOb
	4PPhGPfVHb5K+quxhR7DAqrrk=
X-Received: by 2002:a05:620a:4110:b0:8b2:ec5c:20bf with SMTP id af79cd13be357-8b4ebd5221emr513999985a.29.1764095146074;
        Tue, 25 Nov 2025 10:25:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpceJA5GPR+w+PFvq4RhqsnRCcvJZSSoVUfQbCpueCo5hkos/APHsoaEC59Zev2FvVk3QTwA==
X-Received: by 2002:a05:620a:4110:b0:8b2:ec5c:20bf with SMTP id af79cd13be357-8b4ebd5221emr513994485a.29.1764095145565;
        Tue, 25 Nov 2025 10:25:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbee7bsm5374894e87.50.2025.11.25.10.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:25:44 -0800 (PST)
Date: Tue, 25 Nov 2025 20:25:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Message-ID: <ykiqrdylblbfgozswsogqtiqj3tdbjrk77kunllqfwf6dhhwrl@tmcnamk55yh3>
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-1-89a594985a46@oss.qualcomm.com>
 <gxjidpjoc6h2rvuqpv2wjynumj6qfk6ktznte6igem5g4gt4ai@ukflachqlg3i>
 <ab4bd349-9f63-4a2f-b643-414510adf8f9@oss.qualcomm.com>
 <a1ab1656-d140-457d-8b25-f2c65c4770a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1ab1656-d140-457d-8b25-f2c65c4770a7@oss.qualcomm.com>
X-Proofpoint-GUID: UdAQPIW5pxtBpxyxdm7z2wbrs1xdSi-A
X-Proofpoint-ORIG-GUID: UdAQPIW5pxtBpxyxdm7z2wbrs1xdSi-A
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=6925f4ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IjlTTp32iJfPQkFbh5AA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE1NCBTYWx0ZWRfX9ru0vmvvLQhS
 TFEJDn3jJcEJIzbkzsMpPga9B0wuYaxoVvKBJIFNdqQCXziEk4uxLbfNKqaFiOGxTXeEKn9JBvR
 9/1N8IA/EKYDJGZYg1+cuqKMqZ6abR3sLvl1E40EUOjVcmfSqDEXjLZkW4AzLbybtG+v9tc//rn
 ocu7L1kXqt969JWnLvAJwT21fD71lsQ686+JIIsR3LROGAI9kCD5s/AfeUKI9MzEOZtnxKM1u3v
 /QsBb3tgL0fkoKSDKI7se7MuGFn3JqMRn8PaHQQZhu8j7XlD1+ZXYtxmsZzUurAxwXCgiThyByF
 gDCyiufZsWfUrovrl2yy8/O4KBfPJps6eh5yJegsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250154

On Tue, Nov 25, 2025 at 11:45:23PM +0530, Taniya Das wrote:
> 
> 
> On 11/22/2025 3:30 PM, Taniya Das wrote:
> > 
> > 
> > On 11/22/2025 2:10 AM, Dmitry Baryshkov wrote:
> >> On Fri, Nov 21, 2025 at 11:26:27PM +0530, Taniya Das wrote:
> >>> Add the RPMH clocks present in Kaanapali SoC.
> >>>
> >>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>> ---
> >>>  drivers/clk/qcom/clk-rpmh.c | 41 +++++++++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 41 insertions(+)
> >>>
> >>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> >>> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..c3d923a829f16f5a73ea148aca231a0d61d3396d 100644
> >>> --- a/drivers/clk/qcom/clk-rpmh.c
> >>> +++ b/drivers/clk/qcom/clk-rpmh.c
> >>> @@ -395,6 +395,18 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
> >>>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
> >>>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
> >>>  
> >>> +DEFINE_CLK_RPMH_VRM(clk1, _a1_e0, "C1A_E0", 1);
> >>> +DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
> >>
> >> This got better, but not enough. Why do we have now clk[12]_a1_e0, but
> >> clk[3458]_a, describing the same kind of resources?
> > 
> > I am going to fix those as Dmitry.
> > 
> 
> Dmitry, I have fixed this on Glymur to ensure to use "div" and "e0"
> https://lore.kernel.org/lkml/20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com/T/#u

The patch should have been a part of this series. It makes little sense
on its own.

> 
> >>> +
> >>> +DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
> >>> +DEFINE_CLK_RPMH_VRM(clk4, _a2_e0, "C4A_E0", 2);
> >>> +DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
> >>> +DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
> >>> +DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
> >>> +DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
> >>> +
> >>> +DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
> >>> +
> >>>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
> >>>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
> >>>  DEFINE_CLK_RPMH_BCM(ipa, "IP0");
> >>
> > 
> 
> -- 
> Thanks,
> Taniya Das
> 

-- 
With best wishes
Dmitry

