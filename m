Return-Path: <linux-arm-msm+bounces-69177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1104DB260C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAB687B0223
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01E32EB5C7;
	Thu, 14 Aug 2025 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InNM54pB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589DD2EA142
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163490; cv=none; b=KJHVbTNZTwVA+rOINFT6CcFW8PDQhJ0Qny5mjqSaXHanhQ4IFg2kcfvMXJuQpHL1pTAHnYG7ajVFT0Ruo5ju059fka2m0cax18BJ/nZt+t4fWvUo8omiSXC71bMtNL0GWgDi+ORbeOToT+ZCHwGgURfpiRGCQdf6F3urbjy9EYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163490; c=relaxed/simple;
	bh=eSTBNyh5qgA1GchKDkFcLTpzfX2XNDNDhYNDNClDeVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DOCLLtjuiKBKYPgidUC+AulicRpYjtdFe06tRkO53S9agwKBfYi5NRvrqgn717BzEFmN7pwBpvnUnpWUGGzEGx2ZzqcdJP+4DFmbOlp8WXPy8JoBvMRURpCjea7XPaKwzD9cYio3fTK1fAw1mMzPdHql2Tx6dOQlmMmx0227SwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InNM54pB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNeMTH027115
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhD76Y+LWnlDk3QMceTS29ieyClXA0Qtf1FA6Xtw2+k=; b=InNM54pBTN9QGN2P
	nxyICmv6J4Kp8T3pCQzimSHEXWX3z3/Lc3eXh3LO+nK6JS5lnTgZQCGDQFbt5W/h
	arVNfr00CsKpHTVIL3Z48f/ONEp3hgeG8P1ax17ratTLrBYK+6LvNQFtfTToCap7
	VvRkgzn/ZUo/D3gT7dMpzHWfMcZYkLWY5zQGoLZnYBbHrC4mAwlxjy99XM3QAo/F
	nhbdnuBCLzj/nrSncUM1m3nqx4he0MbT2XskBzxYeHiFp5LUkpU6FzbfiSMxtr8R
	zZye/3rN4vFiGII5PU+o+gqyJBixYejdEVe7STUX/9v8goZkwlje0Y3i02oQEeFX
	YP926g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gf26m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:24:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b10a2d8423so1732811cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163487; x=1755768287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhD76Y+LWnlDk3QMceTS29ieyClXA0Qtf1FA6Xtw2+k=;
        b=WTn/hzbaf3QGvK6gv52Aq31e1Pb3wufh6ECQhLYtrp6c/MAn/6p1o/YxprpcTzCfil
         CYLrCdVDmbJJrLvZaOS/FbryVk7c8h6qrQEQQe8SK518flsCr3NUD8xWoE2bafL5IS0X
         mSH2EJJ19zTFwR11EIYaStvMf/XyuLPnjtdd+J7U/enpN+pir9wmdfiBImu7PGI/Bwqn
         B0CExi8PLLIK3B6FaUf25N9IBzYQK45IeW2x66cI0TyZJMMnnRvHh6fuXz5lQBVK37SR
         QZn0pRDqG0NWq2Egr/oBKXxaK4DjmkEZEiMlsyYPqI/H3XH8HIrr0nqCUPOeyXR0oTNS
         Qcrw==
X-Gm-Message-State: AOJu0Yz0V7rgn1EWUfXawPaH3eaX/DZhHxiFSbqPCWNJJFky4Z3NDx+0
	FxdSpN40zTLg8rWe8vPljLGUSd+g+a66fXGqmaYr5MvbltbmGRzsfvFkaK2CA0bs4UVVqRwq2B0
	6xzDKtK1DGMhWAACNwMyxzBTwJrowQWXL4H3xxZB8jHPWpa/0BlXxmKRdNYVOYJOXUVIe
X-Gm-Gg: ASbGnct+WDic/npbRwmFXENhbMa4izv4xboW+SrHuoaBCJ3/33Q39iPGtMWW2XTZWst
	8LiqWnggkF6CbBhirCNiTF3Wa874t29zkDHV47qCJQXYmMFQFothVDnSWP/TfOQ2leXbaiOBaQs
	HwD7pF1cNA+vvWqJ9vxRbJeK9utnOWwR0Lqdz3I1K6MXu0+r6OWX38SiKOsSJli6liKFN0pWCKc
	oBZcxFUH7axS/sgiIcDYAFB+IP0FOJT43armMQeJej5isHN9UDiGV12A5ZCh/IhrbYSrnqdrvfo
	58srMQds4HM8OwwxLhwWUpxuR+2a82VEKud5XjoAKP3QEeb5C0d8A68xfgVG46ZNcSlWBLgxF/D
	GYqf16RfRDoSbsWmtuw==
X-Received: by 2002:ac8:7f09:0:b0:4a9:7fc9:d20d with SMTP id d75a77b69052e-4b0fc6d592dmr36978621cf.5.1755163487385;
        Thu, 14 Aug 2025 02:24:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtaN7kx9dDlW8uOCvct21Xzo5DX7UKUDLDTUNq5zdRR5wx8V0EGb5Be6DEAFsefWEx3sg4Bg==
X-Received: by 2002:ac8:7f09:0:b0:4a9:7fc9:d20d with SMTP id d75a77b69052e-4b0fc6d592dmr36978441cf.5.1755163486865;
        Thu, 14 Aug 2025 02:24:46 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e820asm2549856366b.90.2025.08.14.02.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 02:24:46 -0700 (PDT)
Message-ID: <f304f8cf-54a7-44c3-b1b6-33f5dd6763d7@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 11:24:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: qcom: add configuration for MSM8929
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
 <20250814-more-ubwc-v1-3-d520f298220d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-3-d520f298220d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689dab60 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=J6cW6M6AcIeHNtzA6f0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX/Td1sZqnQt/v
 PT5ExIqFYnus/jfozEkQfggKspniBg0XyJEqkbi2cSMrnLyx9DO6VhU6B80qSemxXzSLYgFvyPK
 Eh/WMcfH9XlY4wryfxkUryiGqAQM/ENDojC7u7uoBkAzVNcwMbzNtYxiMahFIBQ36/ezq2skjxi
 20myWLkBFWGfqIebEpM1+/yH4YqcU47hI64nor1P8zq06SlZBQUnURmjvBBg7kM+QpdBCgLdgFs
 7FAz6P917Xf52wmeUWORBAkBz1WY4gmzCH+KbsITtnmFoHCD2OgRtThbhqENykSOvBXbbaXno2B
 weJ0z89pqZX5drWggyMORv6YFbvCGJCzSHW1gNiOVkyrOKWnsBMArFiZhiKO0e9A+JMypTTxYbe
 h2R3w1Bm
X-Proofpoint-GUID: YoXxEr2aFLD-tQHI0fIUqCNQKdfej0Rz
X-Proofpoint-ORIG-GUID: YoXxEr2aFLD-tQHI0fIUqCNQKdfej0Rz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

On 8/14/25 9:22 AM, Dmitry Baryshkov wrote:
> MSM8929 is similar to MSM8939, it doesn't support UBWC. Provide no-UBWC
> config for the platform.
> 
> Fixes: 197713d0cf01 ("soc: qcom: ubwc: provide no-UBWC configuration")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

