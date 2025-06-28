Return-Path: <linux-arm-msm+bounces-62891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA90AEC3F9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 03:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2361C1BC5548
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 01:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCDF7346F;
	Sat, 28 Jun 2025 01:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYtymxzi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0851C1D8E10
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 01:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075914; cv=none; b=IxlXjiHUuvdUDunElhTV+U0VDVEa6uoY9C9dJoOAgKJHiCZi0nn1fRe3lmtLwTSHLgCU8IeyZAzHVgEH2I5p4FP8iAXfL/G0FoOz6SpnXyxFyejSaeQWfZJ/dYP8NFd2OYWD2lyGJAzVcFF0r4mNneHLWLVQtkFhbiyezJAbZ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075914; c=relaxed/simple;
	bh=pWpDZVpcpfLHx6uhsAoegGUK8ZMrlwyUKIRW3dlh0Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkV+auw/AkxKgb3GKcpaCVDHmxxBn0YrlKxOWbkRg4FBQ76x5GjU7qtfFdH2SYFdhivB2o5w3j8RIkvS8dOo1KPwxmlaKpKyKGTyM2EsyCJVNND3y3hLRRnAelxaOHO5zWFm0WFpBALd/4I6rd1AzqqMErZdO7aLs4uqHi6bGqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYtymxzi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S1gWUA011683
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 01:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+pXUtk7h/e9fxB5NYEsdbDb8
	SFpEksY3oCoSMDT5xBU=; b=kYtymxziEtDPUR/DR06fq5P8BiGNvLLfHjXM4qzX
	oq4YCWrtuEIxDA+Rl7mt5CPBs0GWk7Bi3UIMFIDNdcNzREw/NCvFqwYluNHxOpcr
	+Z1I+3r48v3NY3SyuqMAby9eTl6GC9vX3hcN9FpuGSQmbdT02fm6Li8lrRLtQOiC
	StJt+vkddbFxPD0J0aimDPx4rD5iv4Skptrx0Nb0TglRt3yTGMT94hsONN9EUUGn
	gMJrL9WwHc8LA7EhvtpXoUGgX46VAC8Xk8fRU5s0+11J+zrG8i/QKVwrm6IDsEm/
	fHhITWO4azrHqNIMgElZiQfBApmFO3LwcAc4uEgGY5jugw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc61jst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 01:58:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d4133a2081so389974285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 18:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075911; x=1751680711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pXUtk7h/e9fxB5NYEsdbDb8SFpEksY3oCoSMDT5xBU=;
        b=O31RxRlX2N2iuKThKaUBUUifKfNTWyTJ20zT0Wl1c88ZNTVovPP7lOeFQYITh/4pud
         0leU6aMyd+JtZXtYl1eCutPVRXNBj2RDocfKK5Baj0Xspte9a4Z1Moe3AFh6udrma2DR
         f3U/+zuLnHMv/hy+xq9F96R19tKFDatyNglshcwieux8d4edOE+diGDlJd+CmjbfBta5
         zVjQk5jWfmnUohoJqpVHpOeULlB3opEBkqRr8huiczjXyHaUgm3os3/zdj5dJqF23oqx
         ErVz/Gn2vNnJzXWnGHIyQhupN/L4zsP+xPpAv6GAZFmtgEu6VFRGikvYuiGWhSu4pGwo
         Cdpw==
X-Forwarded-Encrypted: i=1; AJvYcCX6toWeF+eAUatgG67g88jtQhblv2aspPW2kIlQeIhJ9p/hPOpg5ncEbhBl/PIpIB46tarIZEOe/VbytC01@vger.kernel.org
X-Gm-Message-State: AOJu0YzGzuGf3idGp+1YOshZC3nBnZqbzlYP50Z3pndn/KEfKDlmkuHt
	7diS5NiKqRWqL12CBuOfNhrzFy3xISJ5ewNnrYhQ/op4ZGdgKy0ygksKUmbxni7jKMxMXYsW7Kn
	2tKfpxDghztz3O5Pwmz+ocxW3jr2ZOk8/UARPgbboqzazd+1fNFjouiSE91yl7Ffcef4p
X-Gm-Gg: ASbGncs87uP8LMvB0dg/vYTfktznmgQmLbInQgC9PEOd+zVIgG4lxPVrkKd1zTUouWa
	0D+ouuKjsWdXneyt/EhC+bvqJjV6AIZbmCua38jHGAen3aKWha7gQptuo+OGZEzBEK+4LoEglTx
	tsl5eF+AemibdNS7E1bxkKEXGHCHCdnh5t6yDdvYyHONkwiSPZXaktJ9WPSOUP9Ckc6DAHd9GOY
	UtBf4+FI4HeL5cFB/lQ9Dm0muemjcHLQoGQsAcQbJ05gRhD7eH66GnOGy6kthhvTtkmHmTTN+pO
	L5cHROyJ2JzAwgfHEtsJCVUev/XNFL07yNGeGDrS2uZxGpBpMV8TMEHpMiBooym6rb15pilI4P6
	27SwYKhAvdc1h/4ZXjcu5XRfq8wqOTCy9e4c=
X-Received: by 2002:a05:620a:1a08:b0:7cd:3f01:7c83 with SMTP id af79cd13be357-7d443988efemr792723185a.39.1751075911009;
        Fri, 27 Jun 2025 18:58:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPx2U8tFKLDmMfH1PW9cHmmn8qdEgd47qN2RxSezRNQHmEDme59hKTrXVfH0mUq2+T6/o9WA==
X-Received: by 2002:a05:620a:1a08:b0:7cd:3f01:7c83 with SMTP id af79cd13be357-7d443988efemr792721985a.39.1751075910633;
        Fri, 27 Jun 2025 18:58:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b95cdsm639619e87.130.2025.06.27.18.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:58:28 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:58:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] clk: qcom: rpmh: Define RPMH_IPA_CLK on QCS615
Message-ID: <i4l5dbqrs55e5ydrwpuxjigxsa7esevujhgwpl4qwsgx5sawmw@brcbhbqltlr6>
References: <20250627-topic-qcs615_icc_ipa-v1-0-dc47596cde69@oss.qualcomm.com>
 <20250627-topic-qcs615_icc_ipa-v1-4-dc47596cde69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-topic-qcs615_icc_ipa-v1-4-dc47596cde69@oss.qualcomm.com>
X-Proofpoint-GUID: fOa5hCIpJF7O94nuo_cW_QqysqKIb282
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMyBTYWx0ZWRfXykr4+l6x14Am
 SXGcHG2iy420TxflZahSWrXTZwxpltJPOSgwVUx4JEqap7a0Wf5aNI7apIHbiYkfoxWTVnxnWZJ
 NpnVm0DyaMGutxWy5Dfza4FVsepnIHJVJG3hw/SJY5PoheSulhVUYwxYIY5U/iXZ9YiNzIyPWVY
 +eOog35ODPAI5CzfZtLix4uXMmeFkRNz3OJDl1Nu7b6o2EkcJax2FmFDR6uu3qodAK7K6SqAXET
 HFD1lqHdVW7L2SOvqG1h/CFO14oI+hEVQXlkBI7p2POaH346Zd1PG0Tv9tHXLr0zyDViiIeyMfi
 pmgywh3DnAbrhROOTBp3W/F0d1Caqvn8vcBXpB8myHnMYsQtHd4FrdPnmRN7ULbkdRXMFOc/t80
 bQQ/nWknfrhiE5GabhR48ND1luJ1crVx1WE7EaSGLLf1i+lr9tN0YnsH5fsspiiJD1ZrmHFj
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685f4c48 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=RBL-HKAeo4RFQYj-4a8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: fOa5hCIpJF7O94nuo_cW_QqysqKIb282
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=787 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280013

On Fri, Jun 27, 2025 at 09:37:58PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This was previously (mis)represented in the interconnect driver, move
> the resource under the clk-rpmh driver control, just like we did for
> all platforms in the past, see e.g. Commit aa055bf158cd ("clk: qcom:
> rpmh: define IPA clocks where required")
> 
> Fixes: 42a1905a10d6 ("clk: qcom: rpmhcc: Add support for QCS615 Clocks")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

