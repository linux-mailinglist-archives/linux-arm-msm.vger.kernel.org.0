Return-Path: <linux-arm-msm+bounces-87876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2E0CFD946
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 13:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E60130191A5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 12:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5260D30C372;
	Wed,  7 Jan 2026 12:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cd/b/mfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgB535y/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E3A230BE9
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767787883; cv=none; b=M5BWELnL30/uGTfzLir70A7g3kUByGxKyiO6PZckm3KCIyB75PXAVAOwcwP0eULYBpl04d76m0TO4hkMMRWabhHkm3tmfj7la5B4DCnbhVv2TjTwMBO59oK8JLt7UeeuA49L+7PwCd9SEWvIxClipZRJz7B8xv7YHB6rO1zRfjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767787883; c=relaxed/simple;
	bh=MZrSJkX/zVhb2SHr5TN7TgRgyGzhssV0KFhxXE9mb2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8qZYKeoWh88lXoLZldNzvGFWUJUa7YKlR0a0FH/SK/on3eBdYkc9PIHPWwhaLtGa8xNRKiGWp6dmQsFxulaa5CCvjw0neq/j/tsvFUteM5V2e7pDf/9hS1HA35TDcfwz6g+NqD55lh57NfunV3/a+At0LU+uGXcpsYUTopI5VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cd/b/mfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgB535y/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607BMPuW3152254
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 12:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B8DdWrTqA5MJK0IX9QJHOaBg
	riaD+iPxH3wCc6Z0zlk=; b=cd/b/mfOAvReJlNiL2kdfQNwutDDZbbPomqgNSwB
	XBY+WKW3cf6+Y4DZd1+FtMvM/OdURJweunR8Atk4wu6Jg5eUeh6tFD1wH2xBDaii
	dTXiDYgJKbQHX961th8IJEiBYatQ/p4ua4IRjQ+REbAjOcWhZlJ0OmM77u/alosW
	r8R/us21+a0RkCAzFDRhsNRYXUoe6Iw2HV8D+ga79FnuLY4Bl/wKgG9SiThzBXWV
	KJc/eI7qGCYZNXAjk9ZKEUWWB9Vy5aTuQNuC/QhFaBQgV/9KR0d+h6ngH+SQOCFv
	JdFREcQAOqqc8U+EH4tSeR7A/NxOKMwXQEEWuDvkmo227Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhpjar3xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 12:11:20 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ec338650e0so1137014137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 04:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767787880; x=1768392680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B8DdWrTqA5MJK0IX9QJHOaBgriaD+iPxH3wCc6Z0zlk=;
        b=JgB535y/tSVYUAaipFp/dCQEyxGg7lN4W5RCHqYz0RDM6Vk56blMhLMwrYPaflRokf
         LHYU1nvn24/KGGYrV5vWViNwX7NecWQZJymgptBVSbKcpZOghD2BhUHZS/V3pdbZFzGh
         hx7XosZA79ES5rZh35d35t5wgu8/M2Hks9gXrDxPDrkSajhTP2T+Yyxli1iE24zgHp/j
         CWroJjKdd+pRKHJ+ynP5T6Tesj0JADyeXzU30zk0Xm4EzT3W90cfTtiIR2cc8kJJrZ+e
         0eplwZ+72uAd0fUtS0/NkrKGnVSp1drt06/1PotWewwu4enLRRiQS77wPLhf47EaQqL0
         ZHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767787880; x=1768392680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8DdWrTqA5MJK0IX9QJHOaBgriaD+iPxH3wCc6Z0zlk=;
        b=vA+Bi37H/GXuPL2F82GOiaWd8HrRLt0kFrIVQXVXiQ6huRwP6y9YiB1DGIIJ49mENF
         TtCBOK/FiTNOq3dC2WHIfcAB1ob3iiyILvOaKBCJ56OFAjDEhPXD40eQ5EGHABrvjUjo
         yk4tpzjlcLELRpAX3ZAZcf2KdRcQz6z0kA0mXKkvGfN8cooOOiprp6gtcYmNwmTFLhp5
         39z00qWqtAHPhvMLKzBbXlex6oS8I+q1Q+Ap+4fEpuODpurlyW/eexEhG11Ff+eTE1YO
         6ab/nnsex0oCpS3xKZosjXWGIWayjLhw0DQFkug6zVI55dWWG13FgTSkNcXViPYxrdx4
         vMzA==
X-Forwarded-Encrypted: i=1; AJvYcCW9DXHcBmKJ0vEJak8rVQ2v48qgswZOzE7E3EcoqR/uF81SOvxpU/1YbudfSOnX4YpQQWiF9QODGWAFZCBJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzHsu6hP6+cIs50bd+y9uTGabInomUzV2NhZQLPztfv3vHoCINr
	Is/XmF8reO09pE5SWULtfIlaldXtrxBPycuUi1C5tgKYW8F/SYYhvdJBVJnBc0CGNiqETf/XfW0
	dTbOb+RffKOLhE/jpBXp0Em/DRvLvCnAeeLSlDqrupaW2k4T4nz2UyhU7f5I7+/tHZPFp
X-Gm-Gg: AY/fxX7/FKQcQc3dfBkvRC4943wGmOIF7pU6fM6HdwhlANLgsS0sDnIKm1C2jgp7Umb
	sMAd9mrdnGNfDC2DSMTxEmfSbS8w+M3cxCC2jIPoLVl4F+CAnnj6imBajR/89Olw651+H7ULAOG
	ty803YMDbLlKLGd5p2AwYPxrA4/3nerCN2FcLQWTxLpHYdA8/HONzE4zMTxmdOFg/d0OSbWCEw5
	a6fKA1F4RYSM3kB3GVdICHFAMWgMz8dr46gcaHJaFjJm88wn/uTlhiiVG1abcJQDUGKt3AigzHo
	0MasaQujuO5rnoesPxjC93fyjq33vdK1sOk3MA1/XhZS+LpDNxGoH/4bd+BpIlSe0VR/57f9wIx
	XtPyjSH+spJPKFxgjPPh8bHwHD5zcOvEdgSm1tCyd/zFF24AEn8RjYEiVLxo9Yb0hH7dOTcJDqL
	OygsEfz4yaiExy/o16z1yK558=
X-Received: by 2002:a05:6102:944:b0:5db:e851:938c with SMTP id ada2fe7eead31-5ecb5cbbb36mr717449137.4.1767787879855;
        Wed, 07 Jan 2026 04:11:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh1Hd2zzf+PWTMiMR3FmXPRYIbB3XVhByWTYZd8M4UR/fRJlpbBKx6uJ9xR17c8To6bYWZoQ==
X-Received: by 2002:a05:6102:944:b0:5db:e851:938c with SMTP id ada2fe7eead31-5ecb5cbbb36mr717436137.4.1767787879384;
        Wed, 07 Jan 2026 04:11:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7a50c7sm10830281fa.15.2026.01.07.04.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:11:18 -0800 (PST)
Date: Wed, 7 Jan 2026 14:11:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: petr.hodina@protonmail.com
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
Message-ID: <e4sfp2cexck3llleywxev6hfn72zx7kuq73kdzckks6qms3fvl@i5jjlq6y6rcg>
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
X-Authority-Analysis: v=2.4 cv=efMwvrEH c=1 sm=1 tr=0 ts=695e4d68 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=wgz80j5CkXKHoATOBwwA:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: NeMraSONxbGT0RRCr4hV4bV6vLReiBmQ
X-Proofpoint-GUID: NeMraSONxbGT0RRCr4hV4bV6vLReiBmQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NCBTYWx0ZWRfX35TsdtYeo/Af
 tIevPRsLQsaR9UlV9K51uEGoL+CxfOIMJ0NCwA4ELYm23oxBGRwYRIVnuShueQA2gHkAHZc5CzE
 Kg7MLHj2PXwERYiYH0YpJC8P0Vvq78JkaHE/pY59q/rpcpLvnamWoYb68U7tWTbbYjt8ehG1/Rb
 8ccbpGQcrfP2UT8kAvK8pArdgg+D44M10Kz0ufIRYsES/7VhVFFS5rH1TdKX+/pVFLMiEY9LZ2x
 gDuGQ3Ig0QY5W/mOb7FsIWoSLdyaWTziEIgPg3CyPcCx48dpp7vrri2zD7FTrgZJapci1vnp6N3
 PdMOFmi4YrDjAvxV5iSnfHUx/Wmkvfl22Gy/x9oGFeiv6mKnQwCAoCyx5h51G5kxECicHRaIYjI
 GBF4ua4zl+Yvj6lyDaso9NZIktO7uogvhLtFG6Qdy9jYwUmAhD5GXfb6g+pO+x2n/BQ6I3iuC+V
 9KjLkZhbW7lWyiAwJwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070094

On Wed, Jan 07, 2026 at 12:44:43PM +0100, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
> clocks are enabled during clock operations, preventing potential
> stability issues during display configuration.
> 
> Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
> We are currently running the latest linux-next snapshots (next-202511*
> and next-202512*) and have encountered random freezes and crashes on the
> Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.
> 
> This commit fixes the stability issue. I've checked other SDM dispcc
> files and they also contain this configuration.
> 
> For safety I also set the configuration for `disp_cc_mdss_pclk1_clk_src`
> though it should be sufficient only for `disp_cc_mdss_pclk0_clk_src`.
> 
> Kind regards,
> Petr
> ---
> Changes in v2:
> - Remove commits from v1 and introduce proper fix.
> - Link to v1: https://lore.kernel.org/r/20251213-stability-discussion-v1-0-b25df8453526@ixit.cz
> ---
>  drivers/clk/qcom/dispcc-sdm845.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

