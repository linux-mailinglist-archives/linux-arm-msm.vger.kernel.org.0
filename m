Return-Path: <linux-arm-msm+bounces-73455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CFBB56D39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B287D3BA456
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7222BAF9;
	Mon, 15 Sep 2025 00:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUOFF4XN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9917C18B0A
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757895258; cv=none; b=e8RiODLrIQnaqfLimkV275UcME0vlWlPSoaYfv+dRUfU/vO8ukj+cCzHFiCZ125dm482+wugWAspKyyzyXGtOWAoI5ex/qfLOHAEYJgogYx9KQza4JcoHOIHQ8U5//txvxDTX5FMpeMBtCEnWCV6xx/yqtE+Zj9iGzNlBeDnInA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757895258; c=relaxed/simple;
	bh=WC79OzZ3VedAq9lMgsTQbFWH55VqwdungFuaBpz3XX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUnhkf/qLbaOXm9463MguAbClzt2N98/jjvw9FAxMWsL+0kK6U4m5p8tNFnck0nw43BqGISNSMbOicb2HafBmL/z86YhLEycgDeqhTXrvArCbGz4iZxHK5jam5ETcrKsssjnzfKwWDevyFTm+4LAWUqRJhm+rmD6kJBS/s3/Qac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUOFF4XN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMSH6T019448
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wfIfmtGDU0fMWPSXfBq3QGPr
	RejWAR38abE4jrrVyJ4=; b=SUOFF4XNRO46ay3UYMsN/RFX10KQxXKyoxTnQuXZ
	jFJzdaDG7YKTMEn9DWCJWxVSXROJy/EXK3NdO04I9mcIXSc+Yh/oybm+zoM+ge5X
	gi4fhfdHiD1oKn3jHPCZVjcbVhwM3M+b5O/K2xeAn5ptq4erGu7d/KduI3Oth0WJ
	+B805Q8T8Djcm8Rj4Ww2v9PMeN3VK6fe56aORWjK90imQIePdZ9NFJr4nuelu3MG
	rhecpEnLlhZspV/JJp+w/R9551cQIuSaCTbO+YqVOXuJrhx273m369UH0Fdvprq4
	MlL1BYxYnMQndpZgj3CiU5DnpjQx81xZnY8MOt7Q2TsqqQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072jxc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:14:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7814871b57dso8755176d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 17:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757895255; x=1758500055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfIfmtGDU0fMWPSXfBq3QGPrRejWAR38abE4jrrVyJ4=;
        b=IVc9fcyMw/rTWhWvu1q7WCPxios4iT1GGdS1d9yN4E+ZXtXoTqILmwksiZDey1BvTE
         tELpvbRpxw2O10ZHVZqliYdlzjAnkpHJmj995+kgLeYfHjgIUmSUnIiqqw8dRV+GSxw1
         UfwFELtDEE+gSxIpSf9QkUsdp7NrtKNeb5P2QCuAicjenmqONY9xiqkKDB+MQRzKAoMn
         W7QOdvKCPRQFX4k4FJ7sNtogVQRsuuYf2xw2SYtxbY6h3ecQ0LAcMkj089lLNmiPB7YS
         lm/qA++srJeI8qT2BMhYVsgL2hn+t02dAaIZxDDFMSobzBnclCs92lEXY6QSCePfr3/M
         iiPA==
X-Forwarded-Encrypted: i=1; AJvYcCWCa/XKbOkdCzgYLWNM45vq6wASddU9ftfiIFrXHaY+Nq9XUNfhi2+Rw6BGZaTNh1c4pX4zm6JDlYCttfUf@vger.kernel.org
X-Gm-Message-State: AOJu0YwdOz56zsKrzI9ZVdspflstrIRkO40PHvMFEN1UG/wxpLmkcx98
	GCeVfNy/OnQnM/CVQM69mX51R6SWcp5B0YfOyvLeoBa9LvunoFAp97zrgoJpPyAAqTuM6jczx+W
	31lmRRkKOvixL80GZUwKnAT4LSyRDLPox4C0/HUNeiqC2eXEbTcJALLNLY5Aov5n8jjDa
X-Gm-Gg: ASbGnctiElovlbDrN1ATO1U6f5cPPwnMFwB6hteFnAO4KZo+yziUdI2W5n/7B/8yvhE
	pkLYpyrvhw/oZppkYXqEXeC4cLrFOf8FY1iJEt9ZFpBr2s3otgj5WIpKnJmzK+AX1hFAHy120l5
	YWn4Rg+1qbrokEfQy82NHA9EKGuLXMa9t+FeibzGTpKCgWHKcNVC0MmsHRRWMUjkjLtqyryPKOb
	YKMSN8HXmJxN6UK0hUYAqxtSIqmVUHoIzDfizKZbCUas5Ifi+ZHg5CJbodZZlEVxMWIuYh8RcEk
	daOFWIqXlEhKdc3VhPevLbzNgLkwAJWbAeooI0ZJYra1g/53qDRd4lxfliMWUR+a0rVXxFRUXyP
	Bf6OrBWZjA/VrZOZRe8esI8rBdakrIkhqxHVcfDITNIxGdkmO/1ED
X-Received: by 2002:a05:6214:268e:b0:70d:cabf:470d with SMTP id 6a1803df08f44-762262daa1cmr182242136d6.27.1757895254743;
        Sun, 14 Sep 2025 17:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHObBFwIlp3GQ+VOBYwejw1PxkvVAwhDilkZbOEooVdFxkX7Rq1AOhro4RGokvljow6YU9iPw==
X-Received: by 2002:a05:6214:268e:b0:70d:cabf:470d with SMTP id 6a1803df08f44-762262daa1cmr182241606d6.27.1757895254257;
        Sun, 14 Sep 2025 17:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c692daesm3255202e87.26.2025.09.14.17.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:14:13 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:14:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] drm: convert from clk round_rate() to
 determine_rate()
Message-ID: <pdodeksqchby7gtr7oukm7wqleu535kzh2g3uaseqmkxv5g7qx@jvh5fcppvutm>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
 <aMawQYUIjPw9m4IO@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMawQYUIjPw9m4IO@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX7t5Ff5ckaa/0
 eab5D50+e695KMS+11uiysKfziyqq6H/yVAU1Kd2f2L9cmTsOU9MEc0zA9JJs58oLkSeWO4k8X0
 dK4Ehfj+mGc9B+W04r4MJ7OJQp70adEk/0UDKc0Qz15gO6BOdfPEgZIaeCVQ2CEIL9s+RSzM4Tv
 fokjvfMFI5M6+NccQcOeJ73JiiAwOBptpRWARuHSdzDv5x+Om9ZWWrX06w1tcedfGwuHqff11mK
 HdbHulfTAaMOLyjdCuxwhc9nrP55CXogKeYRF32rYQxlI8wQftpRV2n7B+Jb6s95oz1DLiVPY1r
 gt90SXK+pYE5SHktx8J2Gb3Fvxbwt4E+A88yXxPDgCvtH24tjQF1aPWpV1DnSecLYFbC9VIGjxY
 Smob4LgH
X-Proofpoint-GUID: Xma9Z3BFzZWOgnNH9riUK-FY69-bEepM
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c75a57 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=ErCwDgQeR7lfzThPobAA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Xma9Z3BFzZWOgnNH9riUK-FY69-bEepM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025

On Sun, Sep 14, 2025 at 08:08:33AM -0400, Brian Masney wrote:
> Hi all,
> 
> On Mon, Aug 11, 2025 at 06:56:04AM -0400, Brian Masney wrote:
> > The round_rate() clk ops is deprecated in the clk framework in favor
> > of the determine_rate() clk ops, so let's go ahead and convert the
> > drivers in the drm subsystem using the Coccinelle semantic patch
> > posted below. I did a few minor cosmetic cleanups of the code in a
> > few cases.
> > 
> > Changes since v1:
> > - Drop space after the cast (Maxime)
> > - Added various Acked-by and Reviewed-by tags
> 
> Would it be possible to get this picked up for v6.18? I'd like to remove
> this API from drivers/clk in v6.19.
> 
> I'm not sure which tree(s) this should go through. All of the patches
> except patch 1 have at least one Acked-by or Reviewed-by.

Patches 3, 4 were merged through the msm tree.

> 
> Thanks,
> 
> Brian
> 

-- 
With best wishes
Dmitry

