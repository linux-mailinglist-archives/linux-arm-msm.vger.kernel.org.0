Return-Path: <linux-arm-msm+bounces-66410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E4CB0FEE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 04:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 972B2546758
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 02:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9401B4231;
	Thu, 24 Jul 2025 02:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOlzwA1i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3371A2396
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 02:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753324928; cv=none; b=q0LMVhlGIWZVcvHe3CSuABQvDmGByprGGshGIbdGC6nnnaC/Us6+1je/eJNwMGBPy0DMMCpzhi/UnhMdXTKIdX9UW7H1Blzr/UXEBwKVVSnVgDgXenqa9FfRDN7IDe0K3DPPwRWA+XXy/kb2wnqHjeac3GMBk2kxuHuyRumnlZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753324928; c=relaxed/simple;
	bh=h4frGDfrcoPFjquRdJloro3+LdnHf515DuJQKJtAjms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLwKTuHtbTqjfnM/42SGgj/Z6LQZDquzBrgRaU2sEkAwKbd+AhcpCznofcqjH2YCL7i00KjrQoR6BMLAjaYHQ2OklOBAj66MjLTurv9AMVLzK9LXSWU7ktX7XSZBQfAjY1/HSghIdbKWpG14qLVQWO0hA7VEog5puz0Q0PE/kuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOlzwA1i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXKHF018046
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 02:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eDOg8qXq6ts/jqvtj29vp91Z
	bBfT4Y7kQHLHI9O6E7w=; b=AOlzwA1ivWq4YUhMvIaBdqQjXDrX1E9X8eHdKSRF
	sR7xZXz2eQ0qlO0eNfpQgMJWTo+d/cXRs11Eo70/gk9m8TxoglesSSS/ojCUFgdS
	bSzL/DPfZDrZFbT6XI/znkWI/t3U+X7L6URwp1HFOfTQYwMd0KpHn1xZO1uB27Jh
	QJy38JeyHLxRjqhpNVfS/ettS+P41QO+AYcwi1XAlMkWJ4oxJ2Xi3PsufZ9fYRt6
	6PBgbCHCx3CHXZ2nFNONB2S5DAYIc47/ZXA4ISRZZ6KT0Z7Oo7d1uOMYXN9fh01K
	yTAcEE2Nv1TXMFjIqtkf365sbTGXztVqhZHATm3+WODqtw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6sb1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 02:42:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235eefe6a8fso3549625ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753324923; x=1753929723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDOg8qXq6ts/jqvtj29vp91ZbBfT4Y7kQHLHI9O6E7w=;
        b=vembHUwex4o53/So/2CXsCMkJT9dR7VrKy3nnjU7DMTAY4p5CdTh6fHxr+cRZcZg3K
         o2D8Xe1TWWTgpV+oh8bjGsqf/EOtoAe/OFYdyVzWSk1OTmKJJ0IWGOGRu/mGyBCCezIR
         a4FyUxPjFETFUX/kjlF5/IJQylmcl8A7OrbtioA5+Q+Q+ULPGC8adIPHj/TD08rBH/07
         2PsvDIUoCljLzUyoaJyEiRPpmifjaHzw8mVIrTbsBHqOFCo94e4MzP9Ar2YeKc36PZ5I
         tAkCPLJ5RxKO62MO/MO6HsV1X6xBg+pd38hczpESzOzjN8WQrPCMdciY9a+HRZny0k03
         Ml+A==
X-Forwarded-Encrypted: i=1; AJvYcCU9FTYccntqw7TMu6vdZdVlxN5Iyrim0AQG4TYwLc5M5K8RJI4VYksDwYt1SHW/26GtmGePUaZkORIwNXvI@vger.kernel.org
X-Gm-Message-State: AOJu0YyUtIiOqrze0dp4/4KyNeklHo9z6DlODRXtNvXOfKh59LkvYs98
	MLu3Bu0wf1Mm8+H6HYsTus7qnJwuO5lTbRDDAqr2Rw3AyeZQ0lGXu9kNXsTJBBchAwgj4ERYn+E
	apIJUcETH9wymnc/FVmucbFXpqoQPjoaHvHIF+MvhCn5JQmYI8ZVSWA7oqZEs4AeDjRpu
X-Gm-Gg: ASbGncssbeyszSVLo4YF/ZeJu851GHWew53Bq9+f0ycZWCwLky59KtgCqxwVlEnRxGe
	4qlyi1tvFsgy/FXlDQregaTVB70I1crsef59D5XnGwm9X4IhqVAj2fjXsgmKuw/z/WlJCrczGFx
	YWK/FP8PaAw+Ahfk2DRi9YZAAzZr7j5aiv9U7s4ebg+sct8IDilgIaI4376yGs6HpJd2TrCJUxJ
	fA2G5IAYp32nINMVK/dt9BTb3QfpjXUA7hL8hDkbAyBWmtODyDRAZCjCJfHBuEfqx8LnN5N0E5I
	ctjTT28vG5zYTdSJ4rDivqmub0n5hmhud9uJ+L/0Cz/jq9X+LZaHqimM19aetXTYKtKYvbukkov
	jh2MRlIGR64D57cmK
X-Received: by 2002:a17:903:2ec5:b0:234:f15b:f158 with SMTP id d9443c01a7336-23f98171cddmr68323205ad.13.1753324923261;
        Wed, 23 Jul 2025 19:42:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwZbf1jwRdOeHqFTB+q34Xd0NzngKZRUNeuMorAiN0u6i2hgQggAiHuKf+kKKaL3Y8JY2bnw==
X-Received: by 2002:a17:903:2ec5:b0:234:f15b:f158 with SMTP id d9443c01a7336-23f98171cddmr68322935ad.13.1753324922787;
        Wed, 23 Jul 2025 19:42:02 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48ebe2dsm3335105ad.155.2025.07.23.19.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 19:42:02 -0700 (PDT)
Date: Thu, 24 Jul 2025 10:41:56 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Subject: Re: [PATCH v2] pinctrl: qcom: Fix logic error when TLMM reg-names
 property is missing
Message-ID: <aIGddOWlz6LTAxgV@yuanjiey.ap.qualcomm.com>
References: <20250723075024.4604-1-yuanjie.yang@oss.qualcomm.com>
 <nqujsfdojllp74ykhskftdgj6kcvje726av2bgu5xqymiwvzl3@mw2cqji4qzqc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nqujsfdojllp74ykhskftdgj6kcvje726av2bgu5xqymiwvzl3@mw2cqji4qzqc>
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=68819d7c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vfjdRiaXop_0gXblzogA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: xrPFnVwzb4MEHW_0ikR3b8NFe-lNdkkt
X-Proofpoint-GUID: xrPFnVwzb4MEHW_0ikR3b8NFe-lNdkkt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDAxNCBTYWx0ZWRfX2mkWazDQ9BAd
 UC+nbT2blNPMLN4mMTgDNZMfnm4QPv+UqkLAZCUjrS4wAGoLEYXMxjpf1KEYhPHbHvqw+aui+ti
 qQP3oPqPmj2kcRcGJV/vC3e5DomlLH22Ac82bk+V4xehDiykX49ZeYUNfvOQr5XCMWwL6KausHp
 JTicQN6SpFL6HNgukwbqJUzxKPHS9gIQgvEPmcdJOyYkvLvkO5pzX6e+HdHpO0GWofsT+pnn7ZH
 r1clnee6V74ndE+4bSCBGYE1Yp3i7FepC0vPf/rU9XzWuHtokJsNl912C971oBbzc3WaIHLP/ni
 7AuoSFmfDPuQYPHhVZ+iiXtIvn59B1UxWKeovTdHovvHhu8/mrtzsHrUk22vmlzcYmiDZIo0CiQ
 rXjML8pt5yI+jfPTet/NgJbbk2eNjy07YGdEhIAYHR0oS2EBf7nUvBe0ExQj7nKLhR5IQZDw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240014

On Wed, Jul 23, 2025 at 02:27:46PM +0300, Dmitry Baryshkov wrote:
> On Wed, Jul 23, 2025 at 03:50:24PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Some Qualcomm platforms, such as sm8750.dtsi, define a single TLMM
> > region without the reg-names property. This is a valid and expected
> > configuration. However, the current code incorrectly treats the absence
> > of reg-names as an error, resulting in unintended behavior.
> > 
> > Refactor the logic to handle both cases correctly:
> > If only the gpio parameter is provided, default to TLMM region 0.
> > If both gpio and name are provided, compare the reg-names entries in the
> > TLMM node with the given name to select the appropriate region.
> > 
> > Fixes: 56ffb63749f4 ("pinctrl: qcom: add multi TLMM region option parameter")
> > 
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > ---
> > - optimize commit message
> > - optimize code structure and fix kfree issue
> > - rebase on tag: next-20250723
> > - Link to v1: https://lore.kernel.org/all/20250722054446.3432-1-yuanjie.yang@oss.qualcomm.com/
> > 
> > ---
> >  drivers/pinctrl/qcom/tlmm-test.c | 22 +++++++++++-----------
> >  1 file changed, 11 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
> > index 7d7fff538755..e41fe7e76c80 100644
> > --- a/drivers/pinctrl/qcom/tlmm-test.c
> > +++ b/drivers/pinctrl/qcom/tlmm-test.c
> > @@ -581,10 +581,13 @@ static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
> >  	int ret;
> >  	int i;
> >  
> > +	if (!strcmp(tlmm_reg_name, "default_region"))
> > +		return of_address_to_resource(tlmm, 0, res);
> > +
> >  	count = of_property_count_strings(tlmm, "reg-names");
> >  	if (count <= 0) {
> >  		pr_err("failed to find tlmm reg name\n");
> > -		return count;
> > +		return -EINVAL;
> 
> Why? It's better to propagate the error instead of reinventing it.

of_property_count_strings often return value > 0 (count) or value < 0 (error code).
But theoretically the return value can equal 0 (value == 0), perhaps this situation
will not happen.

However, from the code logic perspective, this tool should early return when count<=0,
if return count == 0, code flow can not stop, this will lead to a mistake in the tool. 
  line:
    639:ret = tlmm_reg_base(tlmm, &res);
    640:if (ret < 0)
    641:	return ret;  

With this consideration, I have reinvented the error code.

> >  	}
> >  
> >  	reg_names = kcalloc(count, sizeof(char *), GFP_KERNEL);
> > @@ -597,19 +600,16 @@ static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
> >  		return -EINVAL;
> >  	}
> >  
> > -	if (!strcmp(tlmm_reg_name, "default_region")) {
> > -		ret = of_address_to_resource(tlmm, 0, res);
> > -	} else {
> > -		for (i = 0; i < count; i++) {
> > -			if (!strcmp(reg_names[i], tlmm_reg_name)) {
> > -				ret = of_address_to_resource(tlmm, i, res);
> > -				break;
> > -			}
> > +	for (i = 0; i < count; i++) {
> > +		if (!strcmp(reg_names[i], tlmm_reg_name)) {
> > +			ret = of_address_to_resource(tlmm, i, res);
> > +			break;
> >  		}
> > -		if (i == count)
> > -			ret = -EINVAL;
> >  	}
> >  
> > +	if (i == count)
> > +		ret = -EINVAL;
> > +
> >  	kfree(reg_names);
> >  
> >  	return ret;
> > 
> > base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

Thanks,
Yuanjie

