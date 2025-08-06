Return-Path: <linux-arm-msm+bounces-67859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AA0B1C1C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 10:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73F5418657B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 08:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4DC21FF57;
	Wed,  6 Aug 2025 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ml1ZRBFQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4B721D3EC
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 08:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754467466; cv=none; b=GrVgszFahDQ7j+ED2+MKUcSKj36zv8CnZItL7QTL7VUxXMMOk9ZuoWh+d/9Ux0lSqW0crqA3tZZTngU902Wi1TBqYJFfCP/zP+9KirnP2j8owTxnDVas2AYdbu9R2/w6HouDvzAM924JjoJnwvFGhc5z4LzSEDjwvqGWieT1qxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754467466; c=relaxed/simple;
	bh=do+Q4TBy90VHMwLyvqQnXrNgaertEGk/GAWekoVTcyQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iO7EJw6fNzKPRpvqonW/d7Pb+UV4eiS1AB+P1HeQqtj4Ao51Bh3nKib0Kh5k1hRnSlEpOpkjdN0M79XSzZ3ydqyJxGUlgQbpMrrARsLFdwg1zjxuUuyf+lsPHzGVgV6H+gETXAxogeNkk7N1T4yjq6XyG4LBtlc7fx9fM9Fdwpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ml1ZRBFQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766K2q8008089
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 08:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WI0JgqSLyH04MZ9ZNbOt2fQtDP48Bzia2Yj36myistY=; b=ml1ZRBFQjvXvxNRy
	n9Tl1YQHuqsKpRtEWlaq4OQN61vg2TvH/p1bai7XXBgzL49ZQe1mdaZnObzaJoKp
	wbnlr2XuPcXN9m9xAMgCSqu7rQn7glZLDYOLopbT5JFZq2wEfZJBvwCIgpXx2tex
	5skVJqKsdT5hK4idVDL7p65Ddo6jD5vbd06GVT/BbfH8RsfyqWzHapIzwY44AdSw
	rMmZvN1p8TTLWLqw9m/pHxcnQ9WTfLQVF0tWHuEjAV5oNmStEYupdB8FQkz9U9o8
	jPUIbe1IlQHxjyD7vCtnkywGTMXt7+tSsjvNLSuq+5tJY3kfItzj8lSG7Lrpghun
	yHBGQw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy7sx3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 08:04:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b08898f776so29277761cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 01:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754467463; x=1755072263;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WI0JgqSLyH04MZ9ZNbOt2fQtDP48Bzia2Yj36myistY=;
        b=SI24Qj07RZvl9YL5CLEhubqpYhE+76kUvq81Np06JIZIYlSifckmol85Im5sWpiKf1
         dspBzDlJwSDMNk+/HM9o52c1LqSyUYTbFW82MKZ9Jt8sk9XU6Ukoy8m+D/ltCBuELCT8
         sjyCXtav9WxCVLkvoiK4up4qnE4pKi/kn+gXoVhuJMvwxu3qoRSQBL3jxYIPla1LJugt
         EWkKXudh0YxVEY9H7D469Qk84wBMzqah3HHPiR1N8TYsX60bn2Fi+Bt66QdpdO5Zjpy3
         cLWtOI18m2hw6FzYbXRMh68jtdgvbcXSkoMynqodmOVJg7m4qLF9fujOs2G057SA8ZMJ
         cZKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRk9kq5mKQpmO5ni8VRhnwP27bnWUMadkr2Zn/SHOdP80oJ4FjfoQQ30yE+bKcRfGTfIsv+ZjkImh7M1d8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg8rEeakNT0zfDXC8BsBdt6K1ImYn6krmpTQFmX99gydKaBbYk
	WkQw2hpVsZVP0p5oyvqzSd6zN+oym2p9GxRLKuyfVx/DetlIIJbOzzjxfdqiY5FJ8gnRbdUA6Fx
	epqHVrvUOSX/lcFJXPrLT7IMy32hyEYAqjwdhiW0BYtS1oFijV1i12a3ekVJknuiGPKUR
X-Gm-Gg: ASbGnct2NyHMEMgfY2GNOk5/adWBLQrBd5aOTJ6HbYGhY5MCgPbLhwQBL86xLvM6vTC
	4sVXAnUBpr3VCuXgth6r2gi2ABCYXA8Oc+XfZgaBoHomuaWC0brZBQx7KK7qn1O1aXQXHlqRov+
	gGgMEfa0wMjl3NXhZk5CmcTJd6SLUbnJZrO5f4Zl98el8d2kjxGz9KNItWH5+F2HGei0COSG5YK
	0uDz/czLJN8D8eRNcjcS8fKm+U8GJ6udTxO7Wlrnd90yVGiylDkxC9uoz8HWHwZTlLvaCVcRU6G
	Jz9V+eeeJguTe0twA10sOLqtWGXcQ+DrRUUcq5n9VQGZiz3KXqq0g8CDdIjo+Kcir0PoGw==
X-Received: by 2002:ac8:5e52:0:b0:4ab:66d1:dcdd with SMTP id d75a77b69052e-4b091544948mr22883951cf.39.1754467462650;
        Wed, 06 Aug 2025 01:04:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtlSzPQGiiI/wu3WOY5X9QIs3aR/1fM/eIbQcYjPvFkmQJWYe04ZKBxf13+Ic9+phKzl0JQA==
X-Received: by 2002:ac8:5e52:0:b0:4ab:66d1:dcdd with SMTP id d75a77b69052e-4b091544948mr22883531cf.39.1754467462069;
        Wed, 06 Aug 2025 01:04:22 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eaeeesm303179955e9.25.2025.08.06.01.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 01:04:21 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 6 Aug 2025 10:04:20 +0200
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aJMMhIqNupwPjCN+@trex>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
 <aJHqpiqvulGY2BYH@trex>
 <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
X-Authority-Analysis: v=2.4 cv=Mftsu4/f c=1 sm=1 tr=0 ts=68930c88 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=RNsuWQFUNzCQQpSZkWYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gWTZZkniWrujMeqMn2MWCnvKFN0lGCMo
X-Proofpoint-GUID: gWTZZkniWrujMeqMn2MWCnvKFN0lGCMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX5yOvwctHPK8d
 CmfVGi5SojDyi3kyDKSRdtkg+NtCQf86oHvVA7xP/59IGFVdWdzzhr/DrsUTvsERrBIqT+yef2r
 sgd8vxmgnCntyu4TamNvaVw4cLNnJEoGDm+NcWcZZq5W1s4Mb0GEP7RX8YxrakS4UUBjT/Ze22+
 QiwTpWvM7I07tIcE6+t5h789WGAvrm8ZEDO51xgzR3SCUfsxAxqOWB8pErZ3RWld7fJeu2mCv9i
 zmYzu8B9khZ1/eJCHchmViMhxPmaD5FustDLC6mRnI44abjbcYL8/di0He2eBrLshEdNlF0/63X
 Nh+8CvMJHWGYoHyj68psFnEh0ojixEyZm6BtXeH1xqnF/TYwpGgvV66dx8wkBlFHXZYDDYCA12y
 yIqBGfk7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 06/08/25 04:37:05, Dmitry Baryshkov wrote:
> On Tue, Aug 05, 2025 at 01:27:34PM +0200, Jorge Ramirez wrote:
> > On 05/08/25 12:44:23, Jorge Ramirez wrote:
> > > On 05/08/25 13:04:50, Dmitry Baryshkov wrote:
> > > > On Tue, Aug 05, 2025 at 08:44:28AM +0200, Jorge Ramirez-Ortiz wrote:
> > > > > Add a qcm2290 compatible binding to the Cenus core.
> > > > > 
> > > > > The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> > > > > encode at 1280x720 (HD).
> > > > > 
> > > > > The driver is not available to firmware versions below 6.0.55 due to an
> > > > > internal requirement for secure buffers.
> > > > > 
> > > > > The bandwidth tables incorporate a conservative safety margin to ensure
> > > > > stability under peak DDR and interconnect load conditions.
> > > > > 
> > > > > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > > > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > > > Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > > > > ---
> > > > >  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
> > > > >  1 file changed, 50 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > > > > index adc38fbc9d79..753a16f53622 100644
> > > > > --- a/drivers/media/platform/qcom/venus/core.c
> > > > > +++ b/drivers/media/platform/qcom/venus/core.c
> > > > > @@ -1070,6 +1070,55 @@ static const struct venus_resources sc7280_res = {
> > > > >  	.enc_nodename = "video-encoder",
> > > > >  };
> > > > >  
> > > > > +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> > > > > +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> > > > > +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
> > > > > +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
> > > > > +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
> > > > > +};
> > > > > +
> > > > > +static const struct bw_tbl qcm2290_bw_table_enc[] = {
> > > > > +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
> > > > > +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
> > > > > +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
> > > > > +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
> > > > > +};
> > > > > +
> > > > > +static const struct firmware_version min_fw = {
> > > > > +	.major = 6, .minor = 0, .rev = 55,
> > > > > +};
> > > > 
> > > > This will make venus driver error out with the firmware which is
> > > > available in Debian trixie (and possibly other distributions). If I
> > > > remember correctly, the driver can work with that firmware with the
> > > > limited functionality. Can we please support that instead of erroring
> > > > out completely?
> > > 
> > > yes, in V7 I did implement this functionality plus a fix for EOS
> > > handling (broken in pre 6.0.55 firmwares).
> > 
> > just re-reading your note, in case this was not clear, the _current_
> > driver upstream will never work with the current firmware if that is
> > what you were thinking (it would need v7 of this series to enable video
> > decoding).
> 
> I'd really prefer if we could support firmware that is present in Debian
> trixie and that has been upstreamed more than a year ago.


I share your view — which is why I put the effort into v7 — but I also
understand that maintaining the extra code and EOS workaround for
decoding needs to be justifiable. So I chose to align with the
maintainers' perspective on this and removed it on v8 (partially also
because I wanted to unblock the current EOS discussion).

At this point, I have v9 ready based on v8, addressing the latest round
of comments. However, if we need to revert to the features in v7, it
will require reworking a significant amount of code.

To avoid going in circles, I’d appreciate some clarity on the direction
from Vikash, Bryan, and Dkishita:

ok to post v9 based on v8 or should I bring back v7 support (decoding)
for firmwares before 6.0.55?


