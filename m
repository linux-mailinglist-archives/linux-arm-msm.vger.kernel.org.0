Return-Path: <linux-arm-msm+bounces-86919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D16CE8DAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 08:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F528300DCA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 07:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B6C2F290B;
	Tue, 30 Dec 2025 07:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ieezjixL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fpzic+sT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFF52DD60E
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767078638; cv=none; b=rk8VhTjZ9ZjFDP76sr5kyacLKbby1q5Zd//F1jsWYfXynLIQCg5sEzIpr9WGGaKz6a+iX348sKGFOWUXLD5Tv7bVf35WYjz1yze3GgHhEWmuT3RABHqbXq/v04WTXU0i7LnNMdkLyumqGzFKkTemXln9WrAeskJNm6n/cU7ZO1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767078638; c=relaxed/simple;
	bh=R17+CJsKfPYDagV/52hj0B7Nn/W6fb14oABCDkmtT+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXYVVR6aUmFpMYWlymMItrKRmj8sCZj2FKL3836SQfLpvbwHw88Z+cqatUajHqzkhL5wzhmzTzY+FHetApXZFb+wOCg30IHSBDjP3Z4s2VOH++GNyIHUgPpEDawtHgRTcGSt0mTBLpsiKWSnUuLFrAwcHJuND968Xv9zzESmTZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ieezjixL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fpzic+sT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU0vQOG956302
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9WV7PKT00pAN2x6ZgLCoHXDx
	uNoUm0pfMF+EsPTxgZA=; b=ieezjixLrejr6xDut8QF9m3D4L1UCx7179NMLe4x
	5yFfzXWp76NbzYQV3YF1X1uIUnyenyQlxnNP3OtsLvoWDSaQu/GaFdAg8OcN5GF/
	EaBGmUa98UEI4MZkrAoU1mxfX1PvV+RSbcY6ngMGzbsYy/OFKyf+eSsDIjfICV2D
	LXgjIfolimEchcHpCV+QpEjOsVLbssk4XOft7aZ5UYShcuOIs1bVd0DTmNyihTcW
	kJcEV4ZzfgHEzU2L0/jYH4ww6YvV9VD8dYmSsLCmb+YC7KE/OSIdC5gKt6Vwsgn7
	ntJPR9F0iUybqbhRphP51RXkI6KLNqpJZibhuox8uKkN4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk1adnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:10:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6855557aso224780081cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 23:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767078635; x=1767683435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9WV7PKT00pAN2x6ZgLCoHXDxuNoUm0pfMF+EsPTxgZA=;
        b=Fpzic+sTW2ReyjkDAga6AaACbwATPiotsGTLz32W7ZQYlq3DftCTknjjaRoDS1ynXQ
         hzqOZpI0iFmlxUwBPN5TUdFFOI7FcRScDRtypinCCL7YHz0ZQ7UZgwpJjsYn0wWtNtc4
         D6UzbIg3CeCCODxAtKonXDrL2SkpbZXNyDGhxB8PTJZ8pMF/9Ci1xcWzIU5LWtEr7jse
         XG7hALmLb1Htfp2Ool7XR8/NDQUybCyKQGGWXcxDN8IU921xgcKPplkwpAQHf/G0ttZZ
         ZtRnY6th5FyHFeJxkqBbMzUwMntXY9oGSt5bJ6j9mPAquEkQTy5gWbEvZk3WGmfovEYL
         Hpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767078635; x=1767683435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WV7PKT00pAN2x6ZgLCoHXDxuNoUm0pfMF+EsPTxgZA=;
        b=F0JvYeU1JoE0xlmLVF0pLBd+zIMNFHw7ZT+ZcDONKJxfziMVKZ0DX3obv0D2/xpgNV
         5aC+D6bMhJahVCbzA+fjT/HSTIZjmJFbtO0WOi5jH2mDljqjNTxnlTUbt+CpHuj28DlX
         YwgIXZQUz+ccHSBzEalm94iYJm+QbpjVyWb1bW9LXzz4ojdU4S7gHcPPSSBvczOebLJG
         DccfoSpbFm/rnG2MHNVCNJIORoMA+NfnHi9kXCPipvmGCT5PkvYalW/MwKDWdW8fpOhq
         lyHVgpgeZbqgFyBgm1BQWOFt/2H/iQaVjpRRLfPaHTRdfWJLWVZyoym/IS9XbjAERVN+
         A38w==
X-Forwarded-Encrypted: i=1; AJvYcCVW9HNX18A/jDbRsLsObLMMErnms93vpz6hCvO6inqyz3ykIrtwNtA4qiHs+pXqbRBKIyQ7P3/JVKnHzhT6@vger.kernel.org
X-Gm-Message-State: AOJu0YwNMeBpAXtWviXCfadQUxu6x5j3zGkrizC5NTiwmg7j3+/iBAlw
	v849iloIIDvMcjM/ZnUgyMTdmDJUVx5ch74AiW4v/fHRb7RziH6ORo11GZNj/hkIGK+Bdn3Jm9x
	I5Dqfh3RUyKeX71ZGy6i2SLsgnqgxm47W+yugIOGMXiXJi3RymTeW9t2+b7itTz8q1OWd
X-Gm-Gg: AY/fxX5/ZtpMu5eCbmUJn1j79bbMCtb82FTw5ueoY9LHH4J4QRY5SmPgJdMhRUNpYp7
	/jT0j4syLGTJcwqEZ2UefikvpPUuduaHbYLchXn8WjPF320IuTTI6Hzs9j+CoxIKLfRQDmzAIaM
	UC6PG5m9JS9BMHEDaT+Wj3sE4X/CWfSoMO6mGBW1MBkLVT9eBgjWmQr2kVRf4idrL4+7G9LKsd/
	oRnCh5LeVXZO8Ct74DTyfxt5sEIoT12oyENtwXeXTmKrelq5vlGh7jrL8FDDn372dTB45g4mW56
	U+jgqtNkPYOsckhyttG1/i9wclOoxIpyHlQNTU139yIbNI0e4vHL/jG4NvXBdYcjyXMnE8tG2lr
	gaL+gBvofS1cwu8pZLhgYxsHy9eBVmJ3BhsK5XVW/jKNTbLVvVBh6IHLBRBeiuNjgVMhg9TO2MF
	Ay7T33HZ2i0ZEoCTwRcq9+NQQ=
X-Received: by 2002:ac8:57d0:0:b0:4ed:7fe3:7be7 with SMTP id d75a77b69052e-4f35f43a812mr494351711cf.24.1767078635543;
        Mon, 29 Dec 2025 23:10:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHd8J9DX7BM4TqV0H7uqpBjz4gc7Ib5HPjkR0SRtqWbScQ68yZAJQX9MYNcv13mKSOr5LlXA==
X-Received: by 2002:ac8:57d0:0:b0:4ed:7fe3:7be7 with SMTP id d75a77b69052e-4f35f43a812mr494351611cf.24.1767078635142;
        Mon, 29 Dec 2025 23:10:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b360sm93786161fa.28.2025.12.29.23.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 23:10:34 -0800 (PST)
Date: Tue, 30 Dec 2025 09:10:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] media: qcom: iris: encoder feature enhancements
 batch2
Message-ID: <7744i77dgostmgzifadpmewxeqg3olxpnocghd2jae5ky3ijnu@wq3vhrjlpx63>
References: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
 <fef64cb8-06a7-580a-7d91-04013ed1c5dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fef64cb8-06a7-580a-7d91-04013ed1c5dd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FBEpmFwBuYjDgie5JI4wGo6K1T2Wz6Nc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA2MyBTYWx0ZWRfX7eVXmvgEpvCw
 iaXdS6whutg+WKUO/oWBZzYIlh7tcCLSulSZ5uAt5wPpTa2tAF5hehl91nQsT/C/NihkP+X0/gA
 48KVT2xqx5y01TmFwa3LFn+aNrv2er36VR0Ho04dK4Dl5TAFgjw+gtj/yu1t68Yr6Gjbarac8d8
 SJggrKGeR/BF2vbLYe5OI5UrQhSiKsnLHT0XVAJqYoMXNleSiA1pdLknDRB5nGRWnVNIrS2pR2A
 4rWgSkdDc609Z9n4lpHNV+iFJgkcLqWUSa8CWnrso6EElElWOXg4DlmRTkmJFKRDV+DDcBjNGW8
 SuZmySBSbLICQY//UTWtxUy7zWfzmoZGe3ZGSmHKRKxLbi+4p69MQ4cVvBd7gpogz9+bN+ACeIB
 8IdeAVfIrfEImZ6F/om7XulZTcCa8LNAumCKNe7sYtvaZtGGp+pD8maQZ6j93UK4wcC1T2DYQ3k
 0yAU75X8Pj9uO4PV8lQ==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=69537aec cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pvVE7NzpYgYTDHsC_WAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: FBEpmFwBuYjDgie5JI4wGo6K1T2Wz6Nc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300063

On Mon, Dec 29, 2025 at 12:08:43PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 12/19/2025 1:12 PM, Wangao Wang wrote:
> > Hi All,
> > 
> > This patch series introduces several enhancements to the Qualcomm Iris
> > encoder driver, improving support for V4L2 controls and enabling more
> >  video encoding features.
> > 
> > All patches have been tested with v4l2-compliance and v4l2-ctl on 
> > gen1:QCS6490, gen2:QCS8300, QCS8550, QCS9100, X1E-80100.
> 
> Pls test it with SM8250 as well since you are updating the corresponding
> platform file.

Isn't QCS6490 enough?


-- 
With best wishes
Dmitry

