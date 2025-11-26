Return-Path: <linux-arm-msm+bounces-83384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1CAC8875D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4F4C64E297C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 07:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9F82C0F9E;
	Wed, 26 Nov 2025 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNZzUL+E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBAEigi7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130A519CD0A
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 07:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764142959; cv=none; b=u1DRLbSVmC1cR6R0RcG60K9rMsg7xtqlDVqcCDCBFjPfZI6amtLWI9HSqMhOb01wunGJDiHTr8+MpbtuNST9pJ/o5aJ4HzNROmj82G7LdvNrhHAtRUL6pcuzdK1t0WhR5/y0OdYmxIAeAgXtZPGOKhJh/JaAth8f4Xd5Lm8DmKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764142959; c=relaxed/simple;
	bh=gj67tU7fCgd4qMli9x5qk42NWTlcPG3BdVQG8dfKkDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSkqVRhMUC6lsF5FAzV0a+14sxP5MoSkYFiD5YE2GmCAtP8YkSXStS8SoM7zZrMnsLEtW4tNs/Va8OVNfA6cdzjluc+WRqdhGmCajhl5SSK3bnOaN+4qKYU/SF/wXf2PllSSNZQlZlAmN+LGs+vKNHsAPVeGOZv9nz2zJ9nJjek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNZzUL+E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBAEigi7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ1dRi53317499
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 07:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7s66tWLAOdIGl88Krxo+sxqm
	YAV4Fj6MYm7lnan6hT4=; b=SNZzUL+EmsyB2HI0CkDfucjphKmkqVqpA44lMNvJ
	72gpb3ivf7sx1YH1+GgYkTBbLhrVica+cdXd1s0dFw+ruihvm3zOsbqKYfJIQIqw
	zYNrbPGX2F1Rd8v4+pcXOrggYf2MvbClYv2+cPXZnv+RzQWcOE5kG1kBQVjZ6OL9
	+ot6Wbv4RiN74FxzH+Ugvi0pqn02vXjcsJwIZVvTNpr1IKQkyhAFbZkngKF66ZzX
	ZG9q32MWckZqqh0IbVNTfwSnxfVwM3pt72FyojRkmDQ0C4EzmghNRF/0Ka7jqaPs
	lRH70SF0ih04rwSnJEJOAqC2UffaqGL86GnHU5ysjeyOEw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qjpke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 07:42:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8805c2acd64so161681396d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 23:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764142956; x=1764747756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7s66tWLAOdIGl88Krxo+sxqmYAV4Fj6MYm7lnan6hT4=;
        b=KBAEigi73r5cSx9zWQIPRifTUpzyufpky7jDL51JNOOH3akn29sJSmYH+zv3TYNE40
         buYjOCJBSUE+C8E4EYt7dJpd2hXjigRaKyujjJ6KnzEoK9p5Z3+KbfelDlkUFlMhFsAX
         BI7AUdng6YqPw6rTly/IYGwPnWXoPuNOCu+g3nu7YrM43t0vErzfp0cdpheRqktKF7ap
         bnal9/8LEtSA+nfcN3GuxjGZwFJVWWzbMDhQLStJQeZfQk/d+hqsgmIY53EojUO7wZUJ
         NHNOva9c2/ifK6owodDEEPPoBP50Zd8GZFV2kuOiV5hUuO+gFePtviXehfHsYdOEioiN
         XjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764142956; x=1764747756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7s66tWLAOdIGl88Krxo+sxqmYAV4Fj6MYm7lnan6hT4=;
        b=T1Rss7DWDhFY6Uu8OiNhjbNC6EqZWyVz9e1k2iZzh7SZWHi7LelQmtEgUIaMhmIusM
         OAkjIXdoFmn9jLi56fHz8qAgkOSmEgouQvz3UV8p7TA4Aw86id/duIRHSxLCOHTQ46ZV
         jUdlccgCk3Px9cIM6FXzcSNiwhmpFjXfb+T1LWXtC8UEsiY7uLvX0bii7Ox06aE0nm7+
         5+zwAA9KtlEK9hC+Nj0hAJbZifIdqhS10UaeMv2A8E8Tfi4bPTRWdOUWl0yj46N1VQMy
         jA48bhFqu26i0SkSp1M5jpRVSfjToAbM2KgpBZ6IJCLYomABb3HsAD4aXrFjieb/8OLP
         uvGw==
X-Forwarded-Encrypted: i=1; AJvYcCUgUnZBx13WdlFWA/W/4WsPUVMPuTgYfrzlSzVLuxGdhVKa+aNCxdpb8mCBdpl9vtUN/di4gYsLxAhsvuVr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9aEqFZNoPnOtj1Z/AIqlbUMjlhuBwiIAXZkXKdqbBXDRtQB2X
	lkM8T9tXbybA32aOO9KPzhYRQk4hbGzaeuFesytr9sh61yRkigDgO8zqv3fRvp08OlZF/ttWj7D
	0M3Mi4vdE8RDpwmefjksf0Lq++02Var2E+x4MCa7ziaIrybzH422P7FoJhKt/Xm4ksrD2
X-Gm-Gg: ASbGncuvcS/49+h7B/fMKcNsV1uCiiZl3NyoCbD5bNVbTxmP0HlWDHz980IuVXOTb0d
	F7PGRb7i3IOQrTrTw8NYnfAaMN3FXY7XRyEcA04mTShFm6BWqQ8criBK8+Ku8gEOUXKpsN4n/fx
	HX0xfGsYOg7teYlndd/YqcSTGezWRcORyEzRt/elGNtZAp/FeI28Wt25mRroU0vsPg0xoBRmbuo
	TNYW2Bpe+c9zTh6wB1yFcrnItI7X3lolgInmUX90DZo9YHAeJUm+JKmdTdRgmARRhPK2w7ESyHa
	awbciVtyHkPlu0XS8sUfxlriOy/TZanaWSw71YjTWB6snOS0j2IyEQhURqBpLOKzNAnI0BaClAm
	JTLFLevUzN1mTzndJfU5bPfdGS/EIjiI3ThhJkJ6Tqkt2wKX/yZwaI3ixZaWVUKoDpjBz1eanDE
	WmnxaG/G5EIQmN4Y8o/BQ3K88=
X-Received: by 2002:ad4:5bc7:0:b0:81b:bf92:8df9 with SMTP id 6a1803df08f44-8847c525a91mr259026016d6.43.1764142956225;
        Tue, 25 Nov 2025 23:42:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZMVHggZd+jKgb8/wJ+L2+9g5fNlc+Zq2G0W23ZV8O5OiP4l9vmjzhIAMKsJGh17k49EVPog==
X-Received: by 2002:ad4:5bc7:0:b0:81b:bf92:8df9 with SMTP id 6a1803df08f44-8847c525a91mr259025766d6.43.1764142955730;
        Tue, 25 Nov 2025 23:42:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc5c42sm5651468e87.82.2025.11.25.23.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 23:42:35 -0800 (PST)
Date: Wed, 26 Nov 2025 09:42:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: qcom: gcc-sm8450: Update the SDCC RCGs to use
 shared_floor_ops
Message-ID: <vh5fjylsjxahu7fzczssobe5xomagia5pehcn7e4wrpcnkp54u@fwiwmq2q6ob4>
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-1-9038430dfed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-1-9038430dfed4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA2MSBTYWx0ZWRfX/qdBAwkktPc5
 AVbZ+UJ8zaAPtyGUg5I85D5+SC4G5gE87CCTzCOLZEXOZAHbJp1Ar3gPyG2GOo4VepqhidRuUZi
 SW0Oow0DbxpBGxRlnKxPcROCKw//eUy892+BSDnBnmKXY+X7yzMDh+h1J8w3SnYX6A117Ihkp7q
 sdyLsYSFPaFvD+xArxAmK4+458Tv8rESlhUYmXJ4cm7W/N4z0CvagFU/BA/qDtqnti4spNA6I9L
 PtWa+mU0zpTdGhkdrHRO8etyyIc7NQ7iPO3+/NU9hfHZFb+eI9sL/4lAlau23NadQOrqDg/K6jK
 qL1eeMz0dJukD3IBdOxHjQxGgeku18HDjTrkqqqVVaA+CIh3yTPGVKH6mLO5kGbstpoH4ZZsvkS
 1gHSFiXWfrZPZOx6fP9ZBXpClIMP2g==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=6926af6c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6P0SHjgeIOX3w0gCKs8A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: xwQAKuf3hTb7xQ1DEUEgvknZBpoPmEkk
X-Proofpoint-GUID: xwQAKuf3hTb7xQ1DEUEgvknZBpoPmEkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260061

On Wed, Nov 26, 2025 at 09:45:50AM +0530, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8450.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

