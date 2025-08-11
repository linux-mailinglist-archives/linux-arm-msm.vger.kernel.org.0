Return-Path: <linux-arm-msm+bounces-68322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4230DB205B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F67918A2854
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2735E2475CB;
	Mon, 11 Aug 2025 10:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTqmBZqL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B089B2586C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908558; cv=none; b=P8QZ7CDbpalw2qQR8z3+Qr5E7jfok24NfPbmUCfp26gN7g4mD6KfyL88rgvvh5LZM0kHJ+TyleEbv43aLsOjEG3DJEfXQ2Ms9KfKjKXf3wc/+xlr/Fbs3C9WjGXsZk7J64kU/PBSogzdr+Kcbt7xsmpmXQwWgNWURZfRb+6AEEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908558; c=relaxed/simple;
	bh=mwmkjas/PoJspIq5BCg9bX0zU3aIDV1rw5FUo9Xgi8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBCw0dgwnmz01owvjyrTOQXhlQQF/1KspZ8GkdSYKRB/GoRAslVzROgXe2HiJSjg6lQEgHZYg7YuOYXKyocTR8ieGa4iuqwok2Ph3klxCpCSAlJSnFSAdY34AanLeDuZwk9QOheKHZDYX4x0ME6toy5r7vZvFTqkwH1FjY/YrqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTqmBZqL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dKqG018337
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8L9FpvsfDpsj4VZq/OufIKbL
	+DTyr83VxTwATCE/HEA=; b=dTqmBZqLmGIfBWZJKBveSUIWlAT5tG+uvmHYJqQe
	Bkvc8Br581Q9qZNHpVI6L9Xzl5tKPGW0vNlBiiK1/Q8MejUyXmoHXTD7BcAhG91W
	wjajFi+2gqeiC4JdNr6MA2gJWE7xpdkBQ1C42Rz3N3dh6OC1EyfT8KgLK14R71g7
	Gz0DpAHLmm+g50WogaaU5SXhSJmAnwTT/dQQhOpNt62ykFxRwzGG7x+/M021sWpx
	3Re7dqn9dtv5cgz/kazTxkJ6l+TJtnGaaM0dbAOtKr3Iy9vNw1n+wfeA1F5AUKwl
	oHyAatjE3pzm5TfKHwNbKtuz5KoLhxatdIEoYu1Bb8RQsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g40fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:35:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b08a2b3e83so128417431cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908555; x=1755513355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8L9FpvsfDpsj4VZq/OufIKbL+DTyr83VxTwATCE/HEA=;
        b=nTnRb2osVXFNaBOu/I7dqKpQCZYSZ/S/o+gpo0YbkFiqq4/jKo/PPmFkoiEjAAfrQz
         gnk5JcN9rWLZ9KUnVcsNhePiCGjybDLKFJszTS5aggMoh2vly33tO4piOILml2cGYRtu
         fGZm6Ozc1TbMfjDCkuIKOoo8nwQxBjErKOQaS5vL6bXFhnfHQfZ/hADSpQDUs/3QwMG7
         Lmz4v2rzFtlrCtlTQfWH4FRktm22PnaTqwrl4LEYE360KLpc8DxxmUCGd+0i1Cy8/cAY
         ZMA7nUiNKx4Iy7uvZh/D6lKmPYzv/eW9+v4y/gjE9WC8MAlMuSyySgmbpg2daKX8cGwT
         zVXg==
X-Forwarded-Encrypted: i=1; AJvYcCVp6XsHmTosBLh3wEz8Blfw42a65BZKO8MqPMnXdWhgNcFwCLYdQclnlHqgolcTqHf67KifsguZvblLwC0S@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1vrLIRRuAobMp+5xpxb/xUSK0g3a2KELHUEM9r2AQNGwb0nkG
	5p8Ya99VZS/5zSxsRaAPxWLk5/qbAgt4KMj7CqFASRj7GYiJVR1bIizz4aLmielY2g/u2jheKXj
	/9PbN28ZU7tKbwneZfZ9LCwsQtNWPto+4nbjcKau5FZzCSneRUOo6HeVItz/uxjcJIT7h
X-Gm-Gg: ASbGncvwyQagfqTTqzp3SPLWXbK6XgYRdQqRjmeAi6HxWIGocv717mDV1UB4PjojKJv
	TPXfyCbbNu8dYhOzHGAjpLygNgtF4iy2+oBMFHseQ6Jvli/noMtlAnrAe363HaCWIIaNxGTAgLd
	1ht8H4pUzu8oNkBkfhBdVtMvwwC+NIQJ2jcNS95JU2okfPSCrURrQDDG633zVCRpzs971qCjfI+
	R8kH2G3peNAxUQzEjVi8wou1KohqKcEERLXl61g2t7KBOEs07bSGH8K43Tzko+bOYzQEbW4YiJC
	x6B43ID/O3m6ZqCl3T2lAlsj1NL0FrTlw1dfDt8L02WXQAKRYz6WvCBwuqf75Rt9QXT6K9FKgJs
	P2e5p5tYdbOHQvqcMAsO2gzS4P9MbuHcpKDx69V/QxlTWuBu86fxi
X-Received: by 2002:a05:622a:4083:b0:4b0:bf67:3517 with SMTP id d75a77b69052e-4b0bf673f18mr121726981cf.50.1754908554696;
        Mon, 11 Aug 2025 03:35:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGSGkWKky4fViZdB9BU2n85HeQbATJIlEfA7+ozin7bCsrRVF6S+s11E+zYmbw4+o2YtN05g==
X-Received: by 2002:a05:622a:4083:b0:4b0:bf67:3517 with SMTP id d75a77b69052e-4b0bf673f18mr121726581cf.50.1754908554193;
        Mon, 11 Aug 2025 03:35:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c99083sm4268055e87.94.2025.08.11.03.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:35:53 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:35:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] drm/msm/hdmi_phy_8996: convert from round_rate()
 to determine_rate()
Message-ID: <snpidtke4k7cekzsbhs7vytr7gaoc2zmxadixgmedo5gtne7tn@laybummcgllc>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=6899c78c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX8FID2wlFS6CW
 kWk4WTMEYRvew1HjfX3gKQ1vROqcg54w9XLHl2zDX44HmVNPQRv4J9j0QjHIvEVYi0ywOW223S9
 iv8MVD9ChhoFCVyRwbjdaTf+QCtux/7dIqedAFZdZLmVm5a4ImYrkJSN/y9ii31Pr8mqayXrLxg
 Ia/KMGU2/VuxUKDoKBxC3hN0g1veLPbKARdopCQ8lr4e5G87TmwzS0v33P7o11KoCgp9tnGAkSW
 ZrYYOThrzI4XGB0oqdDB5it9LVGno6GOdy8H8gpZyuNkmwED3VAi2doaQD9hzD3+PEdgwEcHrBE
 6ozFonEOx4M98ATKsxpSHlMg2WHg3n8uEcDh/HxKeXewyUqz6ZdbfG9owdD/VNaGBc+JI/tG95l
 8GRjzstu
X-Proofpoint-GUID: 2nsq73Rf1mmSruEAEVkGloSH8kbiDeu9
X-Proofpoint-ORIG-GUID: 2nsq73Rf1mmSruEAEVkGloSH8kbiDeu9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

On Sun, Aug 10, 2025 at 06:57:30PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

