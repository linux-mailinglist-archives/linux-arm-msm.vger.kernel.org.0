Return-Path: <linux-arm-msm+bounces-60886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82282AD45DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 00:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49CEC1779F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 22:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DF028BA8A;
	Tue, 10 Jun 2025 22:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TspI/1g2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA1D28AB07
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749594209; cv=none; b=DdWk8Ta89KIUXNZfZ3kZFU7Zq2Vr0j227Kde7ToP/iZj8EC6G1dqTam5sNL/rqdHzfBLTTPrJJUkSTJfB1dX+ofN/Mf91K/DmF5VPh6YulegPKUzPVLMol14DI4e/hluYKsg893yY96c/zWHw/mnjQGzVwM7Yo9HSIbeBUXkGEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749594209; c=relaxed/simple;
	bh=npHB7Cz4fEyvzZ7FmcG0r7LLLmBlvaufPDf/mhV2evM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvhRUzD4gr2Z5dADYRhAMoqU1IwD35q4yj2RbVkKk3EPFcctYeRdhL0/SB2KBUid9vcnZaQ736HH41ekeOi+KLV1ae3cZl44BZcKP9RowweXLdrjmJSx6A7quWG1NbljvoaciJgyWVOu/jQZ/0FopldFN1dOVWSocF4aG8/A9DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TspI/1g2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIQr8r024965
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2hza23gY3coL4GLirsikjG3A
	jHM2RQT+qzkG3p4icuA=; b=TspI/1g2OXSBthgYyOLRrh6omOIB1ysX+Ho0IDwa
	UFE4/OLz1OkqKVRSYwuo3h70Z5kmmTaLsGtnMMY6Tmg4ObuVwIBR6+J/8Z5azzzE
	9apr4NQuprzo2pR+1uHLxl4Je9JktEK3mCY+boeehrY4XAO02drVYETlCRrEsbgj
	0joXd+igquKPoSJJH7UvrCCLtCZgIInP+dA2fvV9sn0syUuF5r3IoGs9+EiYOQeL
	1PSlcjMxkfPsEVBeTiRjVzuR6Te5OHWx4y2KdWPr6yqL7diZdGWzGbszpYlFo7kz
	mTnKpsnkjoxPI15BAEU5kQ7idKQnXKYLOKraxByxVqGwXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9u0d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:23:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d399065d55so309299485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 15:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749594204; x=1750199004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hza23gY3coL4GLirsikjG3AjHM2RQT+qzkG3p4icuA=;
        b=XABP5GDy9MvDXFFDtF0RLafx/cJpe14QOYTwzn1/hkCVf36qBvcieZxMPD+cWSYTEX
         6wFDz4fsHsxdpubepyF1Mb643McZ/ZkpdhbR0tS8HjcFaI594smbrmAij9odnuwn+UCu
         1ahf6JDy0kVzPgy/FxTT9sUm/w8ED1epyOQpREATbxMiahaVNo819DSD77VzA7JJwwoV
         xWCi90kcmLoYtWqQ50RSfJgx9AfVfFziWnv/Kjw1+u4cduD/Ne2+vPPX1lLYt1uZqP9n
         2I8mQdt0MdU95amLA8R/3ZIz834HPB462KHOi4fWP/Pgg1qqhuTUgi3PYmqUiJdv+QTr
         BbUA==
X-Forwarded-Encrypted: i=1; AJvYcCV/hWcuw+TTztsbBUHSXoqqF8+H0ygumz5zWel+GGWVkUV0iDS9C9wx+hMVbxecUnZqH0s9KHsq2c6NywHh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpy3WnzMNw5UWquz8jwZeGJr/k5vOim+bPgWjSXl5ia3xEOKJA
	F0jGaNL5oIVroxkgCq7VH/5Nv+3K1g/EJDJmaQIsfv1BhAlNxjItFRV2KLvoHIqHC6UFtjLNd64
	fi9UtdO/5+c7nnXTtcMjFJnLRJMdEeyzWVTCTccheFZRIYERRbPJ3zZxmS/LFzq3SjvUY
X-Gm-Gg: ASbGncsapyU/DhsJeDbAxTXYHO/hEd1KPTcHycwTrVMOyBQg1pEEvorI8iAmTFejwvV
	PL8E78MTS7YyrNW6THG1NBoMBdXmmMRNvFX3/lKOuau59hEzZsWA9y3mrnotTg8XCEDYfuJoWs8
	W31YOA6c6Cq+kupDnojw3psvwjvTRR/RDcAfnxwJCnPAJrwTPQy2dQFYlwFGKKPvRmbNbxuK6ot
	59JIixo4PSgXRQYKUdF/OajmEdxsrps/FK3aSI+nrsNzrj40YWCo6XAgCV7A2GnW9uJJodHdpgX
	hmeq62gYmizBdCr7u8kHBqMaG1Mu7IuiLNRrARwRuMIENvr4yUuvrbcSDTSnI6LzyH+szraZ0Y5
	8DWvg80L5NUmtKnwn7H+eHMmhXOfcc7U20eI=
X-Received: by 2002:a05:620a:198e:b0:7c5:ee84:a575 with SMTP id af79cd13be357-7d3a89bb112mr168585585a.46.1749594204463;
        Tue, 10 Jun 2025 15:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCcqxVLVUJFrq+O0cQ9j5/TPx+SAaSrKInIQWb4KK+4mCxXHk5ZJ92VOUVg+qUAfhrlPtaxA==
X-Received: by 2002:a05:620a:198e:b0:7c5:ee84:a575 with SMTP id af79cd13be357-7d3a89bb112mr168578585a.46.1749594204049;
        Tue, 10 Jun 2025 15:23:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55379b2c854sm1321061e87.142.2025.06.10.15.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:23:21 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:23:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 07/17] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
Message-ID: <w4napqk3loelkhl36gvhke6z6xg4g4xxymxsfjn3hmntkj2urv@bshk4l63nfrn>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-7-ee633e3ddbff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-b4-sm8750-display-v6-7-ee633e3ddbff@linaro.org>
X-Proofpoint-GUID: FbmY9ddIFpP0F7O4GnwqhQXcakXCzwSf
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6848b05d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3n_StpEWJ1elpYQgr94A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FbmY9ddIFpP0F7O4GnwqhQXcakXCzwSf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4NCBTYWx0ZWRfX3PKiZ9rqfnH+
 DbWtgfRuRh2XePjXt3IphfiA2D/biC51UDJkv4u4mplBvHgXu5qCkqtkT4ylqeCybPLzT3e/kWO
 CovrgtDSk9kc6SDxCuy2sEr1RzIQZuSZGBPiQGyfHKW6a/7nY7o0G3DWwCjsqZIpV6lXwnu7CsZ
 V/PIpgGOA6UF6BWU1cJKakT4mquF7nWCOxwg/oKO7bTlcG6im7JSZFHJWKA42oGxlUbq68GphLW
 xi/oWDrMPruqPn4AfmgijydDUh5BVHuuZ+mWesVxsWOjz9PrCx1voI2GpyayX9+okVdtwGmWRHr
 1A7v2AW2cyc0OE+iZ+4amGFvUVkrxyXeeSel5LCPnYfcf92M9BaZY2irurknbUU+hxcFGkf9KAI
 d7hXzfVzzXI1Tyt0RSKpJPCTis/Bh5NNWMh/xCFwerwCWFrLSzXQLtrfy5VFDqYhgXtf6c26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=411 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100184

On Tue, Jun 10, 2025 at 04:05:45PM +0200, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
> masks and shifts and make the code a bit more readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v6:
> 1. Add new line between declarations and actual code (Dmitry)
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 16 +++++++++++-----
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

