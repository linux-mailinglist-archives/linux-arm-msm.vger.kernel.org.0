Return-Path: <linux-arm-msm+bounces-73330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FADBB54D5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B9C51741E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBEA30AD14;
	Fri, 12 Sep 2025 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4qudoHJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AC130146E
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678965; cv=none; b=TkduoxMqWOiwCrFlp7yNIGZk065qtzVUghoCOATY1kzT21eolKC87mq4RSsxVL7xmBz6ID9pb4a2MnLnilvbBudXvgixClSeIGjr6JObaQr4d4I0tqjMIdchgGCB4DAKACz+0m9025NL/b2iSTE+vnFvqmsPkq+iaKhA4fJcB/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678965; c=relaxed/simple;
	bh=fts+Hs5q4CqZXfPujRbJyGAxy42t96v29pQ9JjRsBII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDoBQ4BShS3j/SfS3/tqYrRkMUcDHeQtQI5GQq+j9ZJE10FOh6tYQeYNF8FRnLBm5Vvxvs7kp2DKEBdFaLo5KXrtiE6w0OoLksqwaMRQCQ3HzkWNxzIJ8RS3Sx0yZF6Df9Y49Cil8Tc9oHwWXd30MQAK2X2C1fKn21ZoehrK6Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4qudoHJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CBBI5Y017441
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AWecxXQ1HoSKQokJLzYb6tbb
	rzkT4uWaDcoy5VKKVeg=; b=N4qudoHJb3LgJAVQziaNCtZl0F7NfM5kABN0udgc
	AwnPkhRGctPPhNtrEqLj1TzlUOG7nqOcWGSmqBVNjTg6DCl2lMUA2s0tfzfC0MZc
	Fxi2T88hQ9TmuN2Ii1EiknR4CbDaDKab5CbHdp4w/UTqpA+DLbERlyEL6wN4Q68/
	9mBcuHp2OYC0JTRzDzirqGh0PLA2h1x8mt2KCFlWij0Wi3AQPDBYO0lKID6iXfw+
	BCDg27FiO+Fc+Uej1F+ZvbLM7+d8T92gEbNwOmwMQZ7uN2y8hE1PqR4BgFYIG/jP
	qf9YitCAwwqbtQ4uQqbX3SL1vs7PQMsE2V1rqc6ePsawUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494jdx04va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:09:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5e9b60ce6so50618471cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 05:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678961; x=1758283761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWecxXQ1HoSKQokJLzYb6tbbrzkT4uWaDcoy5VKKVeg=;
        b=enEx/Peu0uj2Llp4dH50BZf5qQF5IjZQ18lm18ipVqlZz+tHjvtMks6aUnFeCVawbf
         vUf6wMKBoKyN2mxg4dSwXbv0HEdhuCSw8TKH18ze2KFduqbkDrpiUAGr95lF3np+3tph
         1sc5C8jTv37KPnLoEbVOpun6b7IIHSexvGS4UmtlM+Em5vyMZK+HGYHNiaDt2kgr/WGT
         rtSv7bu5CyVvXe3c5sreqN5UT/2olxvy3Q8Qj10Hqquzdx3I9CpT8EaosnO+P1dc7grL
         bDw06EKDuGZzqZ9l64vTNTLs/gnDUDO+V/CFl5Jh3udW0Y9HSXGSXYI9L4wH+bk1Rhlk
         k0ww==
X-Forwarded-Encrypted: i=1; AJvYcCU/oWrZG5OJ6hnSOtDi5FN9Ah4cQqd/XN4YaDBjaEnMuql0pd3dJclvLj8fvd/bCqgVuD9yfaZacrX2u3/m@vger.kernel.org
X-Gm-Message-State: AOJu0YyaH6IlbwVccpMHMrpetp117X0SDg6bGZ3U2PGpZc+eY6nP1F7f
	pmrvJ4aEly6zT3K5sgZN2rjfkbFSVVcPBh9tBjHSKPTcT0xyHcru7D/HV/yxd0uIADOQoljGDkG
	+RHp3Ja29gKX0SlKg67in2E39o/it3gMKry3vmqb6wuEgKR7FUD6KKZTo76wOMBWXeUzB
X-Gm-Gg: ASbGncvpPOv5+vVpg6ja7syxOfYzgXyCfrOoSHsNeKKnxE0d+nU0Jx+ar0IPtdstqcL
	2wh3cx5WyV773etvwWP1+gqLsLqUfXeHfw3zV2HuOszqNDSja36AsD/mHkO9dKTscQ25z2F9rRB
	8Qtw503FvW2lPd4GqPtNih+FO88UKkQNWbp3zV1OfoJ0SJyLGpzk5YpHVn0OKMqDpvJxECwqlgB
	/7K49qVTU+VC0zAo/BCfx2S7mDNttET4FNu2bqZdYymJx/CCdObNcRu0gFldOiRzgm/70/ZjJDs
	vh7MFL37uUwu+PQ2gbNL4HbW4g6dFjkN9KeGaH4TXsLhkM4ysrUCseodjkX/XQpkUas8/QQu1ab
	PDS1ULTg7lSCxDBN89SBc5eGmpcdfDyqwTS7LYQ+LLFHRfGZ89VOF
X-Received: by 2002:a05:622a:2b45:b0:4b3:12f7:8baa with SMTP id d75a77b69052e-4b77d044455mr32331391cf.51.1757678960470;
        Fri, 12 Sep 2025 05:09:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBlHDLz23zA5O+/vEKCN91ortJnwiUYeDorqJurL/VJ4hd/jMETJMt2eSQJiBv4Cvs1e54jQ==
X-Received: by 2002:a05:622a:2b45:b0:4b3:12f7:8baa with SMTP id d75a77b69052e-4b77d044455mr32330571cf.51.1757678959880;
        Fri, 12 Sep 2025 05:09:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-35062c8da78sm5874761fa.0.2025.09.12.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 05:09:19 -0700 (PDT)
Date: Fri, 12 Sep 2025 15:09:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 11/13] phy: qcom: qmp-usbc: Add USB/DP mutex handling
Message-ID: <q4dplt6fq3cneludcuhxevklaj6omeio3cjxw2owt4h3wistd6@arv23ri4cl75>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-11-2702bdda14ed@oss.qualcomm.com>
 <nfugwwknnlxls75yo5rex6ggu5nzpq6enyx6e6nfnfei3icxjg@t7dnzcfcjw4o>
 <cf6c2c2f-9878-4181-a3c8-9692423308bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf6c2c2f-9878-4181-a3c8-9692423308bd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDEwNiBTYWx0ZWRfXwgamWxVh66PF
 hnhuaBoU9CjX+6MvUwOKpSQndKz9nGqdnmcVZhOue9mWvzP99hyGWtQtzWprZCipknan4ajalVz
 Zm2XHw/p0mHGdmUPn5azCLdVlsCxXe6HAceLxoucghzE6hyQVkhW/l/KE4etSwH+zywa6rfFfjT
 8MOqFWGPSIafp63JhsHjLDPBlI9dyovFktiAswhX8inh8OzqH8/P99qitkU5UKY5wNZvQIl7mUM
 N84659IjgogqsAipdocepOWq4eeLM7crInWjtHzhmrBuZ8unXL/Ul1oiCQZmnPe5ebmNsKa6vS1
 D5WSIpFUVNWEOG0dbdOktp+g69VFTJSrLpjPdsN5LGvVZwBlnUQx5f0m1knAl/qiBmbvaxz8tRS
 HFOJr/aR
X-Proofpoint-GUID: c5bFksOd1PYWnvO4OtM55CZb_luwK7sE
X-Authority-Analysis: v=2.4 cv=JMM7s9Kb c=1 sm=1 tr=0 ts=68c40d71 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=h6lld2rfrDIzuLPEmGQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: c5bFksOd1PYWnvO4OtM55CZb_luwK7sE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509120106

On Fri, Sep 12, 2025 at 08:03:01PM +0800, Xiangxu Yin wrote:
> 
> On 9/12/2025 6:32 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 11, 2025 at 10:55:08PM +0800, Xiangxu Yin wrote:
> >> Introduce mutual exclusion between USB and DP PHY modes to prevent
> >> simultaneous activation.
> > Describe the problem that you are trying to solve first.
> 
> 
> Ok.
> 
> 
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
> >>  1 file changed, 21 insertions(+)
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >> index 613239d15a6a3bba47a647db4e663713f127c93e..866277036089c588cf0c63204efb91bbec5430ae 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >> @@ -1061,6 +1061,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
> >>  	return 0;
> >>  }
> >>  
> >> +static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)
> > mutex has a very well defined use case - a sleeping lock. Please find
> > some ofther name.
> 
> 
> Then how about 'qmp_check_exclude_phy'?


qmp_usbc_check_phy_status()?

> 
> 
> >> +{
> >> +	if ((is_dp && qmp->usb_init_count) ||
> >> +	    (!is_dp && qmp->dp_init_count)) {
> >> +		dev_err(qmp->dev,
> >> +			"PHY is configured for %s, can not enable %s\n",
> >> +			is_dp ? "USB" : "DP", is_dp ? "DP" : "USB");
> >> +		return -EBUSY;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int qmp_usbc_usb_enable(struct phy *phy)
> >>  {
> >>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);

-- 
With best wishes
Dmitry

