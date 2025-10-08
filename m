Return-Path: <linux-arm-msm+bounces-76494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8245BC66E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 21:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 128891887879
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 19:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DF92C08C4;
	Wed,  8 Oct 2025 19:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TS/+3fj3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D48A2857F2
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 19:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759950660; cv=none; b=oATUWL7dc46eoT2WCnfkc9KYMbdYNKONneX8NsD7OneUw3Llk16ignCV0zn4GHLhMlDSMZhPmETMc3NFjMweEdyvQdpjRYaFbMovaN0TSrEpUdhuTIS//uqGEhcUfsvW0ZyunO98kkmImTmNcZWrmddktnOiqg+AjczQzRS8MLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759950660; c=relaxed/simple;
	bh=3393mM6j+zRP6aM0V23h5dXXACKdbdldLNfjY/xfisg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2ZwOWJszYZgHN4cXHeBNJuuCJcLAciHu0hfVwTEP7VGQriVca+Q7tWvATY1PWHL76O8fKmDwMFJPFOmzl5ocRO0mEKbMfh6nyNeUqXinIcYFZUsfJ+Y56hUQiVc2OYBe7YRZBjb6ITDyBsEViVFtldJkSGnJnSZupc6MYLhIuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TS/+3fj3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5IrF004522
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 19:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mzh8Mrx9XBniXDY+QCxqv+ig
	jEo2apLpJTr9CSk/4oQ=; b=TS/+3fj39ikimruvs9n7Tjc/boB6Pc6NpdraOeml
	nvljvfpRtK0Y6RST7K7uELbx47tB3LpsFtEQNHlOm+gdE5+m3zyBy23rOo7F3MKQ
	SjJZp9Unh+k/7RkCCdseMKLwl7CXXsEUCeD5K4jB1yC8fGDpVX7AykMKErSeGkBk
	bMROR3CZQuezSRlswcV79uxyvy411/k2DeqN4VGQIiAzvnxhsegFygpcPojmUUqA
	cwKqwlRS/+EFtJWQF/exXMXrh9uPcDzkjN3PI4Ar8Rcr1dEBi+1iPDHAZ+F4cXpn
	OECcvPNZLaQ1Ci0ouq2BO8grVpUOBs6lc6hUD9c1Yn/Ykg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4krasf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 19:10:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4db75c7fa8dso5447761cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759950656; x=1760555456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mzh8Mrx9XBniXDY+QCxqv+igjEo2apLpJTr9CSk/4oQ=;
        b=v29R1c6gvZV+xafD610i8HRE90+0MzKHsRKXQ2iX9wzmcTv7F66+d22z5oHNAC7adc
         cA3Umoff/B12HSkt5SB2kRXCy4kkUffbP6tqiM/LhzPwkHU8UEyf2otKqs0zUlO4BM1l
         3+62mJiCNpPPQLVCgrBfCl+RlPS6htreAcug3tHxjDoMxfsURVxtAE0z4aQkQRB/qPmM
         v38fB8pP1qKEeekCknJG82XLgMdFV0/aEF+AP9rHKD9KJ7WRk397Eh5SbUkCOu4vHAdQ
         +KCiP62gEy2M7VJMNAcf1z73hbQedgEAYvGGKxCFc5x46tRrQpW0RUUnfaOHqALN0n0/
         T2hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeZzh3gW4Rt3lki2tsCYCxSuGC4mlwSL0ohgLYnbiR+UaWCN5HjS2Em5MH7uLmccWqMf0rUXqCUlwF3R7x@vger.kernel.org
X-Gm-Message-State: AOJu0YwY0xFEr9CnzQ5UgLknP4vmTqI7PCfYA+vnWhK87UIKzrh4haEa
	nEYrjFFRWiOi7dm4qYAgBmxqLKtNVpAy0B3+lzRYkgrYEB2nE5ByQ7tWTDgeDR5LvT5gxSys++S
	PyuwsvZeqty8M+dJNIZOTazOCpzNi8Id7IALWRCa5mRugvGXQW0V0oyv4xYBj/ahWs0gc
X-Gm-Gg: ASbGncsS/Wnq4DfbJddMCnh853ZbQO9Ht9H14Ndd9OMC5MYo0qFuQMv9cP2ECidobYc
	8v7CEDQzH4bnKDSMMROFAxU8UnK2+O0HPXM5/tivc9GRms0ITT3JRmZKP+OWXHuWLuNYAsgdpsB
	GmT0p9XgnNoFB71jVUnrm0yX6GwuOswX3x1ft9kco9y2HW1fnsvWlLvAQKRguOhUJSoy+BjAnkv
	U1335cfKrsGZl4WXYj17JbH7A1/HsvuwCGrG7TrcwULWY/bpUvV0bjBGRhTwKSVnN7tiyBQxdIl
	m9ZWSDvubniUWWjet3XR3S+obwtt9amL3M3UfPoFMB1U94C5r31CvqkLHnjJuAlqWskwmsi7I4d
	Ru/u5XIYwumjZgvNttpOMHlr+L4wMMXs5D0wWZadW4BjbzUNtwsqWK1W0Xg==
X-Received: by 2002:ac8:7d41:0:b0:4b7:9abe:e1e4 with SMTP id d75a77b69052e-4e6ead8011emr63168441cf.82.1759950656044;
        Wed, 08 Oct 2025 12:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNjZ8q/pme0xqe30pUUGYIGQ12Gl+haC3BRzE9Uf6qMFoFnkdGOaRBmsKs07f1ZOvC8HGxuA==
X-Received: by 2002:ac8:7d41:0:b0:4b7:9abe:e1e4 with SMTP id d75a77b69052e-4e6ead8011emr63168031cf.82.1759950655543;
        Wed, 08 Oct 2025 12:10:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907aeb3b15sm260834e87.117.2025.10.08.12.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 12:10:54 -0700 (PDT)
Date: Wed, 8 Oct 2025 22:10:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] media: iris: stop encoding PIPE value into fw_caps
Message-ID: <p2kbhv5ybdqethvwspupezeivrdpqzk5cdwmw3cwurga4mo6wa@34yu2us322ux>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-4-def050ba5e1f@oss.qualcomm.com>
 <d9b6ed42-d70f-46d2-a0c6-a98df4b46607@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9b6ed42-d70f-46d2-a0c6-a98df4b46607@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0DOC1KfsWq/y
 rnYIXCK6v395yTVsPLsCxjyMoPrUnttY/goT1izcgHEnQIxm/5kKRK07bR09tPiavaR4nzHyGGU
 LOTwkKFDnYuftapUGz6WCnQR8ZjZII/Be2NNKifkx0OtS7BhXsPOB2fINnV1NB2BkKh6yiiIeAz
 jjZ3wXXVAOMDPYHIe2wrZxFAFVd4AifI8mfgalqqppypzyaQDKTVUwIfb8G6vIowby/XqjWUWwX
 tIm8lWJDhIQ9AOsE5m8F58z8L9sz45h+A6Qyj1KFVQ0Czbv1FLJyr4GHrpb7mazM9WlO5dc+o75
 W6/E+PxngwybzUHNFHQ5GR8veCQ8qZpO3Fy3KZWqKVx5ocGc9tvMaRYmeOtT3X8s+aEAeN3IofX
 Sfn4B92a1t3TpNVwWIiBrr9NHUEV7w==
X-Proofpoint-GUID: ot1mt74oqKoY7tDKnhVsF0duKr1cWE5b
X-Proofpoint-ORIG-GUID: ot1mt74oqKoY7tDKnhVsF0duKr1cWE5b
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e6b741 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=13i--0rwG8f77gcSRFgA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 10:03:49AM +0200, Konrad Dybcio wrote:
> On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
> > The value of the PIPE property depends on the number of pipes available
> > on the platform and is frequently the only difference between several
> > fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
> > iris_platform_data rather than hardcoding the value into the fw_cap.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_ctrls.c            | 6 +++++-
> >  drivers/media/platform/qcom/iris/iris_platform_gen2.c    | 4 ++--
> >  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h | 4 ++--
> >  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 4 ++--
> >  4 files changed, 11 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> > index 0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38..8db3fa222bdb92a7ffff3dfe62d33f16c0550757 100644
> > --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> > +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> > @@ -318,7 +318,11 @@ void iris_session_init_caps(struct iris_core *core)
> >  			continue;
> >  
> >  		core->inst_fw_caps_dec[cap_id].idx = i;
> > -		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> > +		if (cap_id == PIPE)
> > +			core->inst_fw_caps_dec[cap_id].value =
> > +				core->iris_platform_data->num_vpp_pipe;
> > +		else
> > +			core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> 
> I really hope this if-else won't grow in the future

It really means that PIPE and several other caps should be converted to
explicit code sequences. I think, only V4L2 controls should be a part of
the caps array. Everything else should eventually migrate out. But it's
not a subject of this patch.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry

