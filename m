Return-Path: <linux-arm-msm+bounces-76280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ECBBC2F54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 01:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8C403B3733
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 23:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489B72248A8;
	Tue,  7 Oct 2025 23:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vm1IWkU8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86B721D3CA
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 23:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759880120; cv=none; b=AbXKJrkq1t1MKlJPkBCoYN9HqDRFC7mboxJwOy0Dh/hloHAesEFYL1regInUB7YNBb5YjP6mtQ+1uuzHp+N7vFAebTOl9KV3SPPnEoVs7oPYzYInI0ByHl6rvQpZzdkVD+Pvf6bhxYW8Q+8bUmLilt8+4YgXSqxjYmxs79MS0ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759880120; c=relaxed/simple;
	bh=EPStAec2fJeedNbavFDgNAE7lMGq7OM5kFHtxn2IjX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEMYhwYXKv/1fe6f12uuJZKeI/TusYC7EEu4LEBxBIyIc2w2mhfmr6B57U5Ij79LjOQGHe3LacVaM0d0rbsX1D7r5rPsUgjzoyMDqo/x8zV+O4rA5Pa3tHlyzbqHME81N1FYwjilYeRSVtumEMDPWgOTT1kDnMVJTsXWLgmh+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vm1IWkU8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597Ib4DL011808
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 23:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q/RNWE4WPtVrD0A2Ri7p7e+w
	iyovyIg8BoY3vYsiarM=; b=Vm1IWkU89TG3gnNUZB0zty0IDY+1zCXI9YBZ7BVL
	r0swwCvhIKwaF9d9SfYU+DszpGqPtq2oyCrpa4NzqAEK71Q1UgWwMfpjvb7YPBom
	jnHA5WN0IVDR3NR53wY4+vr85k2N93JbRd8J2JdYNIMqxWolH7jg1hM1qP4BnGQF
	wHcC1NPBdiJb4AJlAPiqG6FBCPTpd9isLnPhUZviJbamrGhDrlgJrmzhAfbAQVhu
	XNLjpdglk9vkDAMBAo+V9GHhvGvmHLtbXqIF3EROp5CI/vgkibXZhQwUe5/rBxPG
	gtQBI+ZUGjxN1T7BsQkfEScIOXyw3X8C0Y43pF2dcnJONQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n89hgk4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 23:35:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e6e4f29c05so44520141cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759880114; x=1760484914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/RNWE4WPtVrD0A2Ri7p7e+wiyovyIg8BoY3vYsiarM=;
        b=xFW3NfIbpXOLVLqHGDLgi3ScCytxqK5moYh4vc1FHXf1aDa0sJa2UIojR0SrGJoBzZ
         UxQ5YwA+wLaER9QoPSBHDQU2r2D6vYOcaHTDXI88XiG871VqFa0r1Wk4F3CnyKzo3mn0
         hu/sCugRU9HUNklMSDBi8nNcIaDnXZC8oFam4XN3eW33vSzGpsDRGi3LG/06Pj8Nz9Kq
         ++nPx58Ce8KqPJ8AISjJROLsszq0N7wQ5/wqnzQou/4BEWX8mJyMDy9KDzCYbfGYcRZO
         +8H+zYGi11EHJSFbRBEuR0LOuupkFlEBCS9DOnj7P7ceQj8sz5RrOuZA+83nGR4gnrki
         AGQg==
X-Forwarded-Encrypted: i=1; AJvYcCV/P7MV3wBJ3VvP6qR5uYMjC5UZ2kUO9fi3aP06hcguVeclRJ8IwmwysDYacxrOx588g4vbgJ7WEqZoifig@vger.kernel.org
X-Gm-Message-State: AOJu0Yzox/flGCqVt72ZlQX1JaVUh6A7PjtjhcE0UEpmWzod/VJlrMDc
	pySMbwMj9B3jql8daJSALDDufAxtcqwlnr1/9vwuKXrTcVdjC7buh0fwliM+AUXF+ddnzcpzCqB
	/vyhZCNWoc1Zdq3RmuieU3CdY8Ldqfqf7VmL8YaoN65+bJTPC41O+3+A9NIjIrirjk9Jl
X-Gm-Gg: ASbGncue+Er1I3MNjyVDY4f7oSACenFOPI2hrR4oQX3zQ65KDAzRxCkcwpRSQpgW8/Y
	EkkLzQtncqhNsAOvbmjrtA013HlnrmWuRRbe7usOxK/7dP+fr3VnezsqJt5da7dzKWqVkkb3UG4
	QZ7a1GFGqGIBKCrqQy08vjyQVeHBziyDLmcIM7bfraYBj0pdkM2ji4/cPDuAgVGGjVQ4IhSNNco
	K6VPAM4CZ9Ug3KZ6lPhbNkG7HFFqSk+0rgCl8ie5lNyc2nSPBujlq6REAw3ekDmDV9xsYzV7Dcq
	Sf9hM1vE9g7nZeLaJuodb6SP0IA1MzLLRFt1lCUlUAgJAkmF/2BqYKnWaz9fvoVSEHqdhdYtY4k
	2vbn3uQX9oq1knMuVscJFadaAWxBHr/TgE8BgGJd5Wguz3X8R3X7oLIU3RQ==
X-Received: by 2002:ac8:5d05:0:b0:4b7:8d26:5068 with SMTP id d75a77b69052e-4e6eaccbd0dmr21852511cf.17.1759880114427;
        Tue, 07 Oct 2025 16:35:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9r2FTZlq6TMwmbswYafC+KqPkgoA4YCMEpp5X9qCpqlC6TV6kgalC38X0LAXDHJu/FxN2Jw==
X-Received: by 2002:ac8:5d05:0:b0:4b7:8d26:5068 with SMTP id d75a77b69052e-4e6eaccbd0dmr21852291cf.17.1759880114009;
        Tue, 07 Oct 2025 16:35:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b64437sm14497351fa.37.2025.10.07.16.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 16:35:11 -0700 (PDT)
Date: Wed, 8 Oct 2025 02:35:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: media: qcom: iris: crashes on SM8250 / RB5 board
Message-ID: <yjbx7sjosfp5yqinm6tjcvz75ttttyfuh334hkxfxngkes536r@2jzoqioeehkp>
References: <rs3olaoudntfrnsgpg4nivtnyrdfqsvb3flnr6mcejih3me6zd@udzutvmmkj45>
 <4e1eb99b-05d6-4ab9-9e0f-b2a2b01012ed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e1eb99b-05d6-4ab9-9e0f-b2a2b01012ed@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE0NiBTYWx0ZWRfX0bXRLv6OK6p+
 2GIDvhpqFHqNcr2Z368W/5SuOtpli4q4U8xmtCoGF4Qj2+pMv7rzITthzahhDBGheCDBGDg4AKj
 Ny0aBgrX1aLdfyw2SxiBf61tTixvqQZaybHxO8lhAquvRA7012VfVQZhCOGVc9CFNoq/7c6Xh8S
 CQhPrfrV++6KHnrdhTn19FJXO4KCLKBog61rsVGch8clETrZgL2LVb8EED6YFyn8+7E6KB2br1s
 guNNYzV5greG3xo+J8D9RKklnbf88wUlupD2mH1R2myfF4ZhxFlUmiPXOHM2y0d+P3zOzDzSyFm
 G0Nes2+4XyYmygUsmjcXE0hgmejK5zDTmocvsUV5q9HgQUm3WB7oPZkOsqySgLLTiyBlM2AINxE
 HmS725056OQR/lYs09osHfp7dNPhAQ==
X-Proofpoint-ORIG-GUID: ygVDRQP0ZzZiFiij935mbGjX2bT9tJ1y
X-Proofpoint-GUID: ygVDRQP0ZzZiFiij935mbGjX2bT9tJ1y
X-Authority-Analysis: v=2.4 cv=cKbtc1eN c=1 sm=1 tr=0 ts=68e5a3b5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=7lvPcvWaT-PTCA-fBnMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070146

On Tue, Oct 07, 2025 at 11:18:41PM +0100, Bryan O'Donoghue wrote:
> On 07/10/2025 20:34, Dmitry Baryshkov wrote:
> > Hello,
> > 
> > I've tried running fluster testsuite against the Iris driver on the
> > Qualcomm Robotics RB5 (QRB5165 / SM8250) and I noticed several
> > instabilities:
> > 
> > The following VP9 tests cause the board to reset badly:
> > 
> >              vp90-2-05-resize.ivf
> >              vp90-2-18-resize.ivf
> >              vp90-2-21-resize_inter_640x360_5_1-2.webm
> >              vp90-2-21-resize_inter_640x360_5_3-4.webm
> >              vp90-2-21-resize_inter_640x360_7_1-2.webm
> >              vp90-2-21-resize_inter_640x360_7_3-4.webm
> > 
> > Testing H.265 with JCT-VC-HEVC_V1 passes with -j 1, but quickly resets
> > the board with 8 paralell jobs (the fluster's default on that device).
> > 
> > Neither H.265 nor VP9 testsuites crash if I use Venus driver.
> > 
> 
> Sounds like we are failing to vote for something. My own smoketest for this
> was h264 encode/decode and fluster.
> 
> Out of curiosity, what happens at higher resolutions say 1080p ?

There are 1080p testcases that pass, so it's not a question of the
resolution.

-- 
With best wishes
Dmitry

