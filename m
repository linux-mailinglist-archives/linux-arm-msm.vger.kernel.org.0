Return-Path: <linux-arm-msm+bounces-84570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14734CAA56D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 12:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58D25302EF54
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 11:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568BC2620E4;
	Sat,  6 Dec 2025 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTJxXLoP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UkFhADm9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD6023ABA9
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765020965; cv=none; b=tDdkv709swAuGYG/+kkk4gY+XwbFRk1sLoDBVrnTnDhnFiDs+03mclexLSBgQ1vA/cP2EaVe7LVJNXbBlzoY4ZERVYNjchf/J//SBMb8e8+nvkH5fHRYG0f3ziOJmZiqNLnb9Ltb9KCp7TaDDdFXHLzS0g0WAIv8y2laRNz7Me0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765020965; c=relaxed/simple;
	bh=TWXTh4G/GB8qR9wtU+Yh60cAXI5YS93+qehRJjwCoFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LefLKb09x+w1L8D3BVbEbpP9r/3zbba4lcnHj0ffFilLXTq6yAffOki1Dul8UhDrPYVxaM34iTGt6QbFBXPD1iEYoycGqflXJ1LXd8OvYAeYyNFxEuhVbVAfbbxjI0cM1NPrS69cpA5EaiuF0dCMQOCfOvUjQnoGZC3cqd9xCjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTJxXLoP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UkFhADm9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B65XDFU2395304
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 11:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hXGOfIFrT6tlrdvOyxWfrbwf
	gfuH6E74CK/4+1Hc7wQ=; b=CTJxXLoPMVoIXHL4RQFqBtBJHLc5PaqOj4GO2cj/
	cgaQLmyQYYpXcq/2efkeGx7soaGABIasfeQGR6y0qi3hgMpwe7iLEAZWcIGCMxaA
	zpAzyheDPZs6W/74+UCEmz0BJ1QLhHIWqDRsRptLrxoWZL3tW5hGQGVFc6pnCkGE
	WShHUQqJinnf1WX1rhxsAtNn9G2wgV5yijJ2GYdSccujAYv9cgf0vBGbnI74/8MD
	AggTRyXJ+Jcad9ecPNltk4sANjYWIxEbv5MJHcDPPJo0I7W4SKtWwLZBilRivMJW
	2q0eH6c9rNI34Kxdx0O+fRgaiSOOL6Q/gdbCgluu2wxFUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avbes8rts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 11:36:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e2342803so659176685a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 03:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765020961; x=1765625761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hXGOfIFrT6tlrdvOyxWfrbwfgfuH6E74CK/4+1Hc7wQ=;
        b=UkFhADm9S7KIy5fD7pv33R9CPFWh7lrWreZEhmnCymvJh3Ap2CL8Yg3m45H2m4d5dH
         0HNXNUyCk3MeAWBYMcofKVh1Eu12AVrteFx/JudAX0ZKqkP8XWyIIHBjxg5Q1Uwv2gZ2
         fdIMsiOKCl1uksUl+XvEeOE3oeyrmW8Aunc/o2JPPQKxmNZMx3DPD4v9Ti3vVVa8hiFE
         NaAveBFCXjKTFm/mNv4ohQzkEAD6+lXOllFW3Gar6sJyDgSrIZm8CyFriA8E/ACjIojB
         eBY9HrXWQeUGILFevEnDJDCc90qGU3WGCUWduzVyLNHmETG61V7O3LLTpM2DBIhDllby
         33iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765020961; x=1765625761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXGOfIFrT6tlrdvOyxWfrbwfgfuH6E74CK/4+1Hc7wQ=;
        b=wrk3gCjBOv2jda+Uiwho/zr0PmGEq1vq4F2oXEoA01wUwdTwthioDFozIpamZ04mqO
         F44Yg8OoTMxAEFdDStVaWIZo3Xb9Ss0k39cZ2khxukoXHiQwmUlQgiKIsGY5oNHXWPrr
         XRiuUOI1LcHyoNxGL+gqzLYqzrvzdAaJvj6iT7Ea+18lUaEQo6E7c1IVDXN6EhMhKh7m
         CzxajGsXfUnf8m1NfUcXonpiiQsHxnJUx+OGhLUHGuls+sWZqUUrUNoQYmn22eVT/Q29
         5dF4TyGePBfpqi6Mc/ZQzUpxg64U30/0JR5HG2nK30IOUNd1jDL+SF8xs4G0fIV+HkJx
         cwaA==
X-Forwarded-Encrypted: i=1; AJvYcCW2lz2m/+mPlQsDtodGrf65XhzymH4Z9RjYyy/Bu3oI2OExo/XTapJFfOCa6vD/NiSZ+b/Wo8UN9G6uXdn4@vger.kernel.org
X-Gm-Message-State: AOJu0YzSk3Uxfm6cdTLQ5ZO56a51eFeBvbv/899xj1GIesS3RflbSE2M
	41ejH6TrmXkaCcUy4zgkEvo7T6XRbAHzdpsHY4wv4hrMA9psVwbtkcVr7vdo+ngqFbwa53Ohu39
	Zq6NpKPqm5KBliDexqxMaVRbILb+1hanFu78jzCPxZbs1XZ4Ni/TvAKkPQ1XsnTq9lrR9KmE54X
	77
X-Gm-Gg: ASbGnctw4/nfGBlVBsUQa2qXf/boLIBaMg+is+ZiebrTV8G5tXXg9Fe+rxvi+Q9IJor
	cy6KvB67JPquN+kDdKjySRmkKh2UoivkT4XE18eQwidZmUgKuHyGZU0Q5F5N+UnWcCDjTcn27Y4
	HTQN9Go1Rcxvtmvba8s8hZ3c2CVAxoyDhm55lfI69oBqGjmdzZIPiU4TXkklHPKjXgUogVQkB3r
	MZsdJdTZpylWMJJbYjNDFqIhPjPViKTz86lnDjDqb0bdbrwsRtAArWdkC2XuHPrrej2CzfAWYW1
	nFtvwpbufgiRSoOw9ufINnNuQcz2i2UldV4eYGjScXx/+McVb9FYR22e+X9iYLAhfzyAhYLLodk
	AC+i62z+KhCBZgww7p6BpPmm0BzUnL3FH/s1fAbn5wMg4aXqtltc/0C/JTqvOMWNibvvKJbaiNI
	cfvbIrIacuImIzij9JAC1qVjM=
X-Received: by 2002:a05:620a:1a02:b0:8b2:d26f:14a8 with SMTP id af79cd13be357-8b6a2332cd5mr244725085a.9.1765020961491;
        Sat, 06 Dec 2025 03:36:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjuaHF8TWGGPrKUS6THC1vXCbkovfw6NNhRf+EmDdpBgkGrHPkLBmOug0DmmXwnR/GhUZJRQ==
X-Received: by 2002:a05:620a:1a02:b0:8b2:d26f:14a8 with SMTP id af79cd13be357-8b6a2332cd5mr244723185a.9.1765020960989;
        Sat, 06 Dec 2025 03:36:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70596ba4sm22774781fa.27.2025.12.06.03.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:36:00 -0800 (PST)
Date: Sat, 6 Dec 2025 13:35:58 +0200
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
Subject: Re: [PATCH v4 2/4] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Message-ID: <wbxfnx5xtqclgw4akurn3icypskvwz33x6ukwuleehpmjnrvvt@ufqsvi37u5dh>
References: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
 <20251126-gcc_kaanapali-v3-v4-2-0fe73d6898e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-gcc_kaanapali-v3-v4-2-0fe73d6898e9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nOUjx0P0-KJjw5_V48AdSMlLgdwsPapZ
X-Authority-Analysis: v=2.4 cv=GulPO01C c=1 sm=1 tr=0 ts=69341523 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QbvjaY1k1g57wFy_ms0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5NCBTYWx0ZWRfX3PmSMhXc+at/
 BBz7UUIZ6JDG/+5GTlrjlZ0PJ4MJCSmmiYuZYrNMxPZKtv6VXk9AuMNDoZC1RG53yJLcY49GrWg
 gcUrDx5Fd2eNhJV8l2cbWdFmkAzJUsx7K7nM13/FPtPbYnq688JgnDaVHOnUrbT0oyjKFPP4LUE
 ELTUiC4yblFU7wAKO/RJeT4sJLRVUGtL7Cot1O8Tvu+VhRJGcmRVO7QUZwidEUiVFJEiOi8D4PN
 zcCT5ajBp7r4/Yp4f4RJsTIdZTTrrb2BeM9u9FW1CwzRYhW45FDHm/hOVJNY+Y1YcjkGEPOJ6IU
 K8ggLiAqssTuayNdhTNOY6Mo2DDO4u1oNd1wE6Bq/aSHNvQ8eoagBVrfrxB+ZctiprJeIvb2A7M
 z26nGNyKMpKFTjuUxLGkWV4CjGr+3w==
X-Proofpoint-GUID: nOUjx0P0-KJjw5_V48AdSMlLgdwsPapZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060094

On Wed, Nov 26, 2025 at 03:27:16PM +0530, Taniya Das wrote:
> Add the RPMH clocks present in Kaanapali SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index a2185a6f321fb60ddc9272582ed67fa9ada6535e..bb2cbd2961d9aa1e4475d5876c1761dbbffe5338 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -395,6 +395,18 @@ DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
>  DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
>  DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
>  
> +DEFINE_CLK_RPMH_VRM(clk1, _a1_e0, "C1A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);

So, why are these two clocks placed here and not few lines above, before
clk3_a1_e0?

> +
> +DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(clk4, _a2_e0, "C4A_E0", 2);
-- 
With best wishes
Dmitry

