Return-Path: <linux-arm-msm+bounces-74233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B265B8ABFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 19:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 171533AC71A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 17:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1260E258ED6;
	Fri, 19 Sep 2025 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Akjzzx2E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B25D155A30
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758302673; cv=none; b=uEa18vZDpJurMeBfquP2QPA5enxjNLHC67xEKsYOJx1Z4nILp74erKppJHNIRYiEy/LQ4IxQfIkJuION2Gb+KtHSHobX+Ahuo4a8w3q1yeEoNDXyucqGWh8MGpK2FBPDvvxIs/PP/ra9p/YIzaAMugPbQfaRNFDj2k+vNTz9G0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758302673; c=relaxed/simple;
	bh=jz6EK/5R/cZ51gSyiWj0rppUrk/++V0bISlTdb7FPBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWMlRR6I7kdbxK2jQ/9EbiahYInYHEE1+U4YDhcxSewc+ndOPzUH3YYIDpsfttDWP29EsQJUnQpodtzic5W67cSU6wUSKXJMSCwLGPBHg99xb+1qaCJfRTylcILoVI4G2A7Y+gpjUx6Pkn1g7xffht5jkkqyi3QsOZmqmXFdAdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Akjzzx2E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JDkRj5009015
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 17:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2SmCmfA+ffYL/cc7ScaFG2SQ
	47LI5h70ggIXvRCOHEw=; b=Akjzzx2EPN6moRmflxOtitL+pQPgsWDdtWBjIDzb
	SI9gvZn4SDbKuRbRCI/W8Namjisn8Gj47i+y1yqNnNW0fWGAeWiU584myZTd5prs
	sBFkfPgTJ5061jNFFGvJTdogvEPSvgarLFocP9gB5AgIoGdMbaeu8bZr31+UCY4L
	WTp7+VdRKzvaRfr9DHQS+PAe7MyrPo1TzIWT0qVgC6JYFJ+Q1CRgNonqOWyGk2Qs
	+gxPs/0sFDZGU2olQdb1AT/yv0CqMqMB5NgveyKypKLRs13HlFsQsHeF0zUPgdJP
	7+THt5oGeOj0QyVna4exc21dD9bEF2V1AW0CPntGWCmHdw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498q9dbq85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 17:24:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b3415ddb6aso74882701cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 10:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758302670; x=1758907470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SmCmfA+ffYL/cc7ScaFG2SQ47LI5h70ggIXvRCOHEw=;
        b=U8lk7Upo3S5RScbA2M7Wq68KeOHCJU4iXt5FC7ADKNT5W05etVFTyMqNkXCU1vg9xu
         Pwz6zlPC0phM/yEa2F/dqAugC3GYW0Vucx2AyyRuvcFrSIsrhOTvxvFpm/eLBCKBNQcu
         8OfiDSpeZ65cRzpgeQX4+b+nJ0hs24o1GIfuN8ybEVGNXyjkahKlLs6cNSND9IvUaNPu
         fAXz+dDv9j1U50jiAy7Qxnler8wXWhW7LVd83fEV2Y2DV7V88GUNB5a23xFv/Vv+eHW1
         n3EPsPubrECE3sqsyld6QLBwks8SG0A6/HxZcPjnxLbKP5OJ6YJZQskn4kHKIwOw9DIP
         4W/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1t5WXkV9jTneQqMdp+dZ3JIE88dHmS+vO7CHPqOTg1cjS4MICasdrM0bmmW1U6Xo3S7cpMgmTN/K0WSn+@vger.kernel.org
X-Gm-Message-State: AOJu0YzaBztIb9w9SpOnCA5ylagaN2kq3Fr+tb8O6MSwuGIkNeplvlGG
	ZosDxJ8co+KpLrZ2zG9mcPTvwXBq1oLZW/ajII1dGVOfNhw8FuS4ZtXlZp40uIuRcvhlS14ys/w
	l/8DosTMPXj1/xk6kpYmybn1Uu6yT/1iFhb68CZ9lCgZcmp0CSlzNLs0bEPbGs6EbKO4O
X-Gm-Gg: ASbGncuPvCjYoBcn2pJZ9lgBiiHf6KDV+dCLfGQx87dzmKgYWsRjA9pIwHHHsVG52J7
	d+OwRTh+XxB+nvoQOVuPDuEO6hEI7g3Huwdd/v5FewLhvqziTub6rCON83fZ4sMEFF6zwCJvNcF
	aOZNGxajDkAPg9eaJbFiy0ed9MCRXl+ENaWJosQg0kOLndJif6fGVKlzPcgM7xgDcWcd2Zxa1/3
	MOK56Pde3SCdUH2oFV0E/i710YTt0pYoWWIjoWyVSJ/Wiu6oF9rItEnm0robgx0bH7K21vzjaNz
	IKRkY4HC3qb5Q0jhFoBGgiPJCJMF64SVIY8YuDHHyyL759BzX4eHfh13YEHJEzCJ7fHbfGcRj/U
	HD2OUmBadFdCXvk935GMgZNcdmOgvJpUSMRyP1Tpk1AcJ5aHTjpHJ
X-Received: by 2002:a05:622a:110f:b0:4b4:906b:d05d with SMTP id d75a77b69052e-4bdae5ac1b5mr88562271cf.29.1758302669489;
        Fri, 19 Sep 2025 10:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEowL0VkIS55e+wrnpXk8ejFGWmiVu1K7CSpGZAvwocAzm3e82EVFvLe2rVUzxckJSDcYN9iQ==
X-Received: by 2002:a05:622a:110f:b0:4b4:906b:d05d with SMTP id d75a77b69052e-4bdae5ac1b5mr88561851cf.29.1758302668930;
        Fri, 19 Sep 2025 10:24:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a8fada4fsm1524487e87.89.2025.09.19.10.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 10:24:28 -0700 (PDT)
Date: Fri, 19 Sep 2025 20:24:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC
 resets
Message-ID: <cujc27qvhzblxsvkiyn2kpyl2btkeysr22amuhpfhjlsvwfuka@ukzba7jz4ftp>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
 <20250919-sm6350-mdss-reset-v1-2-48dcac917c73@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-sm6350-mdss-reset-v1-2-48dcac917c73@fairphone.com>
X-Authority-Analysis: v=2.4 cv=YsAPR5YX c=1 sm=1 tr=0 ts=68cd91ce cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=S60hzewbzrEDFSkdeIwA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: UEC64ooVZ8F4eIjjIyiBHxQliP8gSsjm
X-Proofpoint-ORIG-GUID: UEC64ooVZ8F4eIjjIyiBHxQliP8gSsjm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDE2MyBTYWx0ZWRfX6E2mp0yJgmym
 CLVuKV7vGitpWQFJWUelqmYRRT3rhmNXUR9YRTMTfWhdOkBybZrkOzwRcD8+UE0v35bDoYjo7XR
 YMzkC9nAPNfOB2DvXGQsGhQkHlhuq2YpCTx/U9fnmxYxJs4RroCMCI7OeN/y52z6kQSVnXWdMqH
 rchhoNX1Al4KJLpUMgJjNhit7bTYS7i/hFTHOBlF/NLK9sQXAZRPTAoYmX7+J/RpX0aUDZ0qfs2
 weeB2kshODnDeDpFT3U5lGwlBJBXqq+cq1wkZqWW/t7N4NfM+6EdNpM75R1I20YBlQ/GYQmqdQz
 t+ijfT6215LGlJ4du0NU1eCXtvEZxqlXdSGymIl7rg3tHQq6E2PPdhmnEdeHARFynslO1JjVbBl
 P41A1miz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180163

On Fri, Sep 19, 2025 at 11:57:24AM +0200, Luca Weiss wrote:
> Add the offsets for two resets inside the dispcc on SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/dispcc-sm6350.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
> index b0bd163a449ccd2b27751e32eb17a982facf07d8..5b1d8f86515f251d90e01a4f3cb3b5582b5db683 100644
> --- a/drivers/clk/qcom/dispcc-sm6350.c
> +++ b/drivers/clk/qcom/dispcc-sm6350.c
> @@ -679,6 +679,11 @@ static struct clk_branch disp_cc_xo_clk = {
>  	},
>  };
>  

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

