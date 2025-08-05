Return-Path: <linux-arm-msm+bounces-67777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F69DB1B298
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 13:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4714B6205BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 11:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D83A24DCF9;
	Tue,  5 Aug 2025 11:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cw2X+wcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BCD247297
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 11:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754393261; cv=none; b=IRhWT6fD6toCSbXQUTskf85GSyCSARWPq8cZFXKk3nlLap9DacH9e4uWZIxqeKNU9V3E4D32NthXuENkygjAyNz9Knw5IOVxW/CArqVRMMw7ylnril0HXNuxLr2zGC4k2R3edDMZoyfeLiWJ3ylpW+FDjZLCuJBY2TuLzKr7Wrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754393261; c=relaxed/simple;
	bh=DVXddEgeZPuQcDtEKtxLaY59mZ2sxeocu63HSG0+8+U=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vdo1/bWpn0wPdQOu5UTRdoRhojLl//mKdFO6YyKyX5ukoMxuH3wGw1rVOnmqtk3J8Aq6nLJfDD2lAmvivgIqMVI3waMDMbybOnzsu+EK2a3DpnsYRS+AGt9X4v7NYC6yF/bonPWsmVqFhpdFnI9vOQcuGMz1/VWvNrhH7yjOdVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cw2X+wcC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5755Jh8T015069
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 11:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1gPoqe4y4yIUUPTwhZsEUYLD
	5BOfc3h2wVUekz4+9NM=; b=cw2X+wcCKQ8oVP/V6Yb96P3FsimYKqX+BJZA2ybW
	PUhWTy2Mjt7aii6st4/IQjBVuzYWLJyCFLhx4171pfR0t0ILoMZ5EbptKkaeAyu5
	ipemR4L6DyOoEoQSUA9GIWqSqI+1PsmUFKVIbnk3Fh/v+KnbMfmvuzBOfNX6Cr9t
	h/r6os//QcNMA6BSJITOjm2wxM0SIaG02ufHCeb5/qWaYIkszbRLf3sN/EZEl7aM
	zc6tXMHe6XuZMdwfhxYbFqvdnbOJIyDoRkwpJMizbQ5jdKrE9Vkr6tcHaoX1XkIE
	XS1X7Bu318M+ViqEp/Ooi4iEP/U9+Jn7HZWjwlwpHWKRuQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc88pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 11:27:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b068c25f04so41347101cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 04:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754393257; x=1754998057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gPoqe4y4yIUUPTwhZsEUYLD5BOfc3h2wVUekz4+9NM=;
        b=Vn4y6MaUEr9biSrfjlfD96p8l1/C3KRshAMkQd5Jv1iaZ0qPlKsS3YNCpi5sjonPOv
         tg4cKf3oL+Dbx+iIZeQsK/tsArSwQKp/2valE9kZXm6l0N1+ggQ0tIlbRYASG+U9mWv6
         5U8Am/iNzvh7yQsiXeS6beKyGcMIhhevXxEb51LyYomPef/1WjxSKTsVxO2Rqo8VOlIJ
         FMrQ+aQZzyN7MD1iFkomYs+jZrH+G5nk2J/1rCsyOEIo+L6o2OL0jkzNKzA9N4SKqJj6
         BbqW+fa0BV/xkhuifUOF9Cks1EhJccreEaBZc45xbM2fJVCSbz24bJALKlHVRiGmfv4i
         wvnA==
X-Forwarded-Encrypted: i=1; AJvYcCUlQQrNzuBP3TE4fQoStn36vpTexKR6PFCth8F9Vfp04qgiWZhiFXXnMBW5bMeGKiNPWF2ZS7U/+8zMDbfk@vger.kernel.org
X-Gm-Message-State: AOJu0YxI533t8oeYeCReGoNCp/8goYFeOKMzmaVLL6wbQyHZo8beotSD
	dxt7f+xF9M7CMS6NpZiqzarvqk/s4NDRf3is0cX2PtwJJA/a3dQMIc5Q0ddFiX8l8xuOoOtThIG
	n6tPYu6dmQ+ke1sgjsS77dmbh/1vCywch9qi/7M+BNeX3CXCGNFo0+r/JXIZqhwqJPsh7
X-Gm-Gg: ASbGncsa9kBpka1r2M6PjhQE4ixISKvcSpLcJIYPJSEwlD6bjVsOBGCq8CRAvXz5nrn
	UIoUs+6cHlHK8oeYieRdGI6seEt6jYXCAyJ/1msXr1yaBfgXqfDbA1a70ryC7TgYG+AcVkz3VGY
	ip908P34eApDhb/Km2o7Tit0jf6w9WP9xYx8fNF6U3LjFzCsz+GC75G8sqtGv+COZ15uEBAi7TN
	voJ0ZP54mHLpkY+EbUEEfO9FNLYYuSsZWZuDACJtp6FgmoHv5cV/ShUG8+2HYR3XdQsKhTNzdPu
	a7rYBHNzUnWA6NxjZfkWhoJTPtKIkur0wjmIybIv93I6Bmt8Bwuh21LH3r0chrvcu+gpbQ==
X-Received: by 2002:a05:622a:148a:b0:4af:21a0:c65b with SMTP id d75a77b69052e-4b07f8b757cmr45494711cf.13.1754393257255;
        Tue, 05 Aug 2025 04:27:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0101lXC5zt5OQUJJcCTrjM72+E5bMhWeTi/5/EpeoZ4H4alza+OtyPzFZhjZskEOxR4CjkA==
X-Received: by 2002:a05:622a:148a:b0:4af:21a0:c65b with SMTP id d75a77b69052e-4b07f8b757cmr45494321cf.13.1754393256695;
        Tue, 05 Aug 2025 04:27:36 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469582sm18593886f8f.52.2025.08.05.04.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 04:27:36 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 5 Aug 2025 13:27:34 +0200
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        quic_vgarodia@quicinc.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aJHqpiqvulGY2BYH@trex>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJHgh8mon9auOHzi@trex>
X-Proofpoint-ORIG-GUID: wC4KDEvQoQbI8ImmeE5MJaK6sYLiJXM4
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=6891eaaa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=uolHg1VUeg_AKm6FvgQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wC4KDEvQoQbI8ImmeE5MJaK6sYLiJXM4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA4MyBTYWx0ZWRfXyOcMJW/86gMu
 aVpnDGwNquLd3xJhlrmohdjB7rIhyxNXA3UMSC+KRQTgGYjX+OIcpxCP0kjG3QfYgM9miO+8JaO
 WQskjQ6u/V1Tf2tndcbx0MtUbe2PGyR+gRxrNm3sygINxXiw3wDMoBqLWdYn6nwWUqVq6/BLmx3
 PAXxnGC7tPVok6tL4N+tlJNozzIyMLoi2jHmG2v2kRsy24HjZj3tahL9ypLZW5Ucr9cbN1UxdQr
 +xfuNYAfj0ZUo6w2ShKylfOdIPFF+JR4+wmXQKtaNEZWdxofiWwLMwpLezXrWL5gHGIhFrddTH9
 3vZQErOK75IWpsGD1XuY/6EuJIw4QbAErOCa4NuZaO0DGerDlhd887hSKxv8g9RPom3N95aAYu6
 YvlxRDtMZZeK2hFSAi+3eFFP5D+HzipVPw7uu+MIp7K3BF7KvtVl+vyxk6xnvYmOaKo+Mqjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050083

On 05/08/25 12:44:23, Jorge Ramirez wrote:
> On 05/08/25 13:04:50, Dmitry Baryshkov wrote:
> > On Tue, Aug 05, 2025 at 08:44:28AM +0200, Jorge Ramirez-Ortiz wrote:
> > > Add a qcm2290 compatible binding to the Cenus core.
> > > 
> > > The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> > > encode at 1280x720 (HD).
> > > 
> > > The driver is not available to firmware versions below 6.0.55 due to an
> > > internal requirement for secure buffers.
> > > 
> > > The bandwidth tables incorporate a conservative safety margin to ensure
> > > stability under peak DDR and interconnect load conditions.
> > > 
> > > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > > ---
> > >  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
> > >  1 file changed, 50 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > > index adc38fbc9d79..753a16f53622 100644
> > > --- a/drivers/media/platform/qcom/venus/core.c
> > > +++ b/drivers/media/platform/qcom/venus/core.c
> > > @@ -1070,6 +1070,55 @@ static const struct venus_resources sc7280_res = {
> > >  	.enc_nodename = "video-encoder",
> > >  };
> > >  
> > > +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> > > +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> > > +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
> > > +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
> > > +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
> > > +};
> > > +
> > > +static const struct bw_tbl qcm2290_bw_table_enc[] = {
> > > +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
> > > +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
> > > +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
> > > +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
> > > +};
> > > +
> > > +static const struct firmware_version min_fw = {
> > > +	.major = 6, .minor = 0, .rev = 55,
> > > +};
> > 
> > This will make venus driver error out with the firmware which is
> > available in Debian trixie (and possibly other distributions). If I
> > remember correctly, the driver can work with that firmware with the
> > limited functionality. Can we please support that instead of erroring
> > out completely?
> 
> yes, in V7 I did implement this functionality plus a fix for EOS
> handling (broken in pre 6.0.55 firmwares).

just re-reading your note, in case this was not clear, the _current_
driver upstream will never work with the current firmware if that is
what you were thinking (it would need v7 of this series to enable video
decoding).


