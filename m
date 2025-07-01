Return-Path: <linux-arm-msm+bounces-63199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B2CAEF650
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 13:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78B6C3B0274
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 11:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AEE257451;
	Tue,  1 Jul 2025 11:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7PDeVf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA0F235341
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368620; cv=none; b=qIdWIN3W7Bl7dwZWDtP0itNvNrOlDS12ZLzY/gYTT3youU1NzrSvkh1UczDrdzKTjfDvMzt7znPsbwgruFSaIFxTDSS/PtTDkhPFI3o7yab6VK0/pyVbglyMH1HSLZwEWgj7uI7P9/ZA9TofvtXxvTo5mWJvC1RE3Y8kB7ODHL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368620; c=relaxed/simple;
	bh=P+AniTQtNOyYYO929SsdBmccebThUXBNEGP0tTQX+Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ow71Ydg4l2xDGwS8idqZJGWGtOZyb/VaJxvcY8pmZQzyp3zmUOEltD7O3v1U8EsGylDq8HNYiOGM02HphgXoYbNf2h3e3EBcklfdX9sajLkBi7a23rOGf7AfnnoU91pZ39aCpIkgecvNH5gPhThkhcQuCfKHy6gWpCQiSw8olMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G7PDeVf0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619LEDc028664
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 11:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A/DsPTsBsBDmT1yFH6Ie1eyY
	DtQOwvGO1EI9mJaE2Y0=; b=G7PDeVf0vg+kdCXuIrrqktt00oLfENIIZzDDghVl
	5mZXfMXZI/cDcT7xbYlaYlxK0pmGbFagyxYsJz4dlGTxJmCO88X+5UKQ0fbXZQEC
	9EiF6/EYmZHAbJtX6LUAwkxBEjXut5t7kwZ25fuGLnWSRuNrnmU1Eq9HqdcF0FwU
	3gklU5U2xLVkjPGP5IHFTElefB9zKYEttE9O8uzrXm/6btQ8QQJeUCTxvcvKAEVZ
	Ze2XpYEU43JmoI2qEvSH8Xac8KWNE/7dBgr87I7mhFvchmts9Ox28KzhuoyLbjd6
	GeDYQ6mjAOrGrYTZPzbV5Dkd0wND7WvEaj5CJM0RP53pXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvrk94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 11:16:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d413a10b4cso926865385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 04:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368616; x=1751973416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/DsPTsBsBDmT1yFH6Ie1eyYDtQOwvGO1EI9mJaE2Y0=;
        b=dYTW/ypeUF6tiGcnvXwDeaYWQfOS4MM1JBcywZ4X+iVh1l5SHI4W8IzxQhDRnwYPyv
         309yNXfxLoWimAb6g6gjD1uYu0PBM04NpgvMzyBxoufNuliqWR/ymIOlWhJiMq5GbRjo
         V/acCiBCULfm2DmLE3f/+R42DZfs7YQMnvHXhKoKMfIbUV9GYvYxmIKeQMJEM/j/YZW9
         rbAqXeec+m2ShYzdKE8zjNE48blqTluYJoRZEf3C0fxgAlBSTmsHhftqWCmrPKhIijNv
         ACWV4gSUASAj72mXTeuv0nP3hP3qXI4+K+sMG5Fj1+Elwo9PX1rSO5SBF8CSF+DJkjQR
         IsVA==
X-Forwarded-Encrypted: i=1; AJvYcCWJpTX/iXBudzwg+5DVkcIaclK0BjMTzs9kpelYvFbQcHJ0dfxY1djeCSkfYL1w7S7rXMCsBmZSFU6twnro@vger.kernel.org
X-Gm-Message-State: AOJu0YwIr7p9lPhFt6IsYGMfG5JFDcdoNFKrpX8eIzaQAs7mXG6CwY5d
	pcjdFBSgxfmNbdjstTTxUfS0lOe2lqvrjOAtbsi8FQUMAhNU6+8o4D0P9BghX4iQs4Nho6mb+tC
	X3WqK23ftaqHEbBjNE06wkBIMuyGvTvWr0vMtal88oejh2rMduxBP2wcfuqFM+TMb9YXI
X-Gm-Gg: ASbGncv5E6qWU/vHad7xGj1MDohwQjKfwcKGQDiJHZLZLU4K4vkY3A2hQxjFb3FjA9L
	TNgQoB1sjBvautk9kSDM76f4lek6nFvZ7cEJv8I5bt/hvs07C6/rv9WZMTbFNyonCU8sf9xfML7
	jVZLh9NB1K25ZqEAIWmFaxMh4Upi+A/S+S3hcciOr/2p+H0gIwR9nO8mHt/VZ/mYiesEJ8f31cS
	/8flIKCvRiLMLO9ANJcva2GjASVLviOpX8l6LDxiqj5r6iVsHvygLvsPjaCQLFZPCvGoKVLa0VQ
	gv2BuD4J6c1Anhe+gZYwmuEoy9Wm/vcqh3g0vCQZr47KMQ+0lnK4vjmd5HkcKmiVTVltlzMBENn
	Befz3vMdre3PwfTy+I02NKFuAQ/K6uoC5D8w=
X-Received: by 2002:a05:620a:2703:b0:7ce:e010:88bb with SMTP id af79cd13be357-7d44392577bmr2261952585a.22.1751368615987;
        Tue, 01 Jul 2025 04:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZAnQsK8oP+yGp6Y9qLuzqAu6F5wPwMy0Ri51LK9L6uuIylK+nYr9DS+MORAP0pvUs/HHlqg==
X-Received: by 2002:a05:620a:2703:b0:7ce:e010:88bb with SMTP id af79cd13be357-7d44392577bmr2261947085a.22.1751368615341;
        Tue, 01 Jul 2025 04:16:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2dead99sm15783941fa.22.2025.07.01.04.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:16:54 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:16:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
Message-ID: <w4eujq72uqflqpsqshc7zhu6lkc7owufep2g2rjacvzgj44vmf@auonp4ugbgow>
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
 <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
 <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>
 <DAZPKV5DQ1EK.2D4TQE5MIH4K9@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAZPKV5DQ1EK.2D4TQE5MIH4K9@fairphone.com>
X-Proofpoint-GUID: 6-wHee22HUcGC9_36EwGeb-tg6KuhawE
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6863c3a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=2CDl1CmQ9Cb19c7lbDQA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 6-wHee22HUcGC9_36EwGeb-tg6KuhawE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2OSBTYWx0ZWRfXzyxRtNTlDF/6
 w7YXPRpjIpNdqeRbW/WzMHG/DT6+tzrygpdnBaNE8UImElw8sYN/vbWIS0AQ9uc9y2kXsbpD4R2
 jiYjf03kV5Lf7W3KoMeOgMw1HCNlEaI9w7I/YjuzFkPJ8H+H3/A7F8sLvtY6kJUFw8G8bgS2maM
 iYNgwgYts5eTAx9beNM80eSMKUPBzWhUhQ3d/LXqF6w2/KmV1qCGYGaKVaWYGG/4MbkLFxxEVgZ
 vUsMfwyHWutvt284MIzjiSoKpxL7EfVh3RfC05ltyK3/uFZgcr66lXEIqjnhKrrVwI3cijmu1NW
 8utiIfHF0eIZhu4l/CyQT4OPz6Wd+GYVkOAOyHs9KeBb88fR5WZyKr46DcyQXPM6cF4jD6t1bCg
 cfWN23AZMCrdev0Y7aBkjG4C319+Vg7L+pC7eI3I0/ffY6luHhUnvDzm2tUZ0NSOqtlXuU6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=892 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010069

On Mon, Jun 30, 2025 at 10:01:35AM +0200, Luca Weiss wrote:
> Hi Konrad,
> 
> On Fri Jun 27, 2025 at 5:14 PM CEST, Luca Weiss wrote:
> > On Fri Jun 27, 2025 at 5:10 PM CEST, Konrad Dybcio wrote:
> >> On 6/25/25 11:12 AM, Luca Weiss wrote:
> >>> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
> >>> VIDEOCC on the SM7635 SoC.
> >>> 
> >>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>> ---
> >>> Luca Weiss (10):
> >>>       dt-bindings: clock: qcom: document the SM7635 Global Clock Controller
> >>>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
> >>>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Controller
> >>>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
> >>>       dt-bindings: clock: qcom: document the SM7635 Display Clock Controller
> >>>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM7635
> >>>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Controller
> >>>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM7635
> >>>       dt-bindings: clock: qcom: document the SM7635 Video Clock Controller
> >>>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635
> >>
> >> We had a massive yak shaving patchset go in this season, please move
> >> the magic settings in .probe to qcom_cc_driver_data {}
> >
> > Okay cool, I found them
> > https://lore.kernel.org/linux-arm-msm/174970084192.547582.612305407582982706.b4-ty@kernel.org/
> 
> For camcc, gpucc and videocc it seems quite simple to follow these
> changes.
> 
> For dispcc I don't know what to do with this line.
> 
> 	/* Enable clock gating for MDP clocks */
> 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);

Use clk_regs_configure() callback to set this bit.

> 
> Do I just keep the regmap references in this probe function and just
> move the clk_lucid_ole_pll_configure & qcom_branch_set_clk_en to the
> config struct?
> 
> And similar for gcc, I can move the qcom_branch_set_clk_en calls there
> but the qcom_cc_register_rcg_dfs needs to be kept.

Would you mind extnding struct qcom_cc_desc with args to call
qcom_cc_register_rcg_dfs() and call it from qcom_cc_really_probe()?

> 
> Does that sound okay, or what exactly is the desired outcome of the
> requested changes?
> 
> Regards
> Luca
> 
> >
> >>
> >> Konrad
> 

-- 
With best wishes
Dmitry

