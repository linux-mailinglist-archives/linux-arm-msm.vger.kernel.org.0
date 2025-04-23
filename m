Return-Path: <linux-arm-msm+bounces-55147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E73A98C08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E226F3A4B90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D5A1A9B49;
	Wed, 23 Apr 2025 13:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mhe/JN8p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B67419F48D
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416502; cv=none; b=cnowiwst8mSQuHswrE02OJPY/+7zxth8LjpAhIpv8uBonFrimXXlBH6k9snVLhBIv5j0gCmB/Uj0rj53R4QpSDPgzvGULOM4yz0NHB/LFoBodxUMWhRqDC/dZzMtdP36Ah5eb70bWkrbCdLYiyl15h+kk9LMZ3LINsb6ob0hI4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416502; c=relaxed/simple;
	bh=k62o+ay2M0IbQRNfbp10YC+dWMBh5vmDDp0amjZHXxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDklMgcL7Qp2H40dBNaUGnAQHgpLpaVLWT7fCuUbZ6ehNe33tH/2OCq0fqMUUAayU+HAxPWdDymgXm/zVrQHhmJo30weckwHLpNnGKioRnrN7jYtin26v7YL7ENgBY34TLNpImTU1JNGbFpaPWwXwwwplxCftHUa/TZ94vRti3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mhe/JN8p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAkCVp022002
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ch6JIJp6fDzsw1vuIJ2eZ7S5
	WCWU4GzfWZUvcdjbWkA=; b=Mhe/JN8pCtR+E92A8mMd4EhXFKMkh2kZiPy+dN0q
	Mt0QhakfGp0lFBe5ucWHN9RoxBj7DMIYf2b9je+98CsBB7qHlVV8+GCtTX5TPivh
	25f9FZ6nTPnG5fGN1gjA7fugN1lsoo/LZe61BL3aUyckyq5zeuZ4afmCO11lgeIT
	wQpKADPDvbsWamqduJw0k41OZdiXrFVtMZJZr8Gk5E1kJdiQLRpfPT5Sdbh6w6dW
	EHrQNryfSL6ukFxcGoNw97aNpQSlMK3LVTxpUfFrqHU52WvrzcMqlJSR56q+Kkv2
	hCT7Gyvu6nSAJ6FBlyr7eKNBj5LHMzSU+njlPslSKdomrw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh129qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:54:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c579d37eeeso964041685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416499; x=1746021299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ch6JIJp6fDzsw1vuIJ2eZ7S5WCWU4GzfWZUvcdjbWkA=;
        b=Y9DByCXyUMonf4obaZdd0LS0ba1FPHA5tlEf2VfsvJBvKhqwR7bMumnKTuHVfGA7QA
         MCwsK6EIaSoXP+TMiLETo4/RCPiagAism9TGTqtG/Qv7WqNexlkl+p1SkJ1xhSODsSSp
         SmEAyR4KclWkh7i6tYbvMVF+71sJqGrNMNZMOfGIIycjKa3lSrFANlP6xX5QP9vNrNjY
         dLa1plWm65mXRpdjAowSsgMBI56D24s04/7KtGxodPQmSO3fnE6T0e6F7FTbUDtsSkAP
         DrDqwhOoXO+KvJHH46ND14GtwHlCUEcW63a8PvaleWkQy8q4y4BYN5YqfeaMq8QsxWzt
         vtlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNvJENvKh/ZCPLj21A9gCOnha6IhRcD7e1XvQG+K9gu8qMwebQE5RhWaKjx5Yst4VU/uZ5RkNgfexWd7X1@vger.kernel.org
X-Gm-Message-State: AOJu0YzpaiTGRmVJk+6XrTCtndrhqLJ7ahAm5hIBYPoIWPdrhzKPl3P4
	2QDJyxj4+AydRSqI2lssXlIfEbmCKG74lZkec/WZGmLDAS7hsyeW8rd4AxC8y+lDs+xfCQmsVvO
	FcDBvj3wLrcSRs1yCn3U8AnRMtFeqwxrLh/semkK/dDLPwgF96PDIVZXLMv5+ut9o
X-Gm-Gg: ASbGnct+OdyuX3C5pWwCsov3E/2xS5ssvfrnl80SX5TDf80MOTrmII2hqByKtaBgcb/
	JBu1Q7UYr0Vv4GZ8y8tsIW632qjSLjisTPBh7J4mvSa5iE9jsQGNOP/GlT76/69QqKofhZYYZ2H
	SIqf7BvNyVAZWQQ4JKrDWO/hXkhyl/InW+DlBWSrl0+9U8xOxciFXmEN94JH0v6epJih8l5KPt2
	fJD645AgR4ztYY5vYEBngODuLtLA1/sP+xbIbYZYynFtnWnN2p3Z+7GZLJeWwybETbPLApdH9DH
	oA4fAEDvEOGNiJIroFROnziqTV9SoeTpep1EImq5duAZgHkSKPRIdLQl8wQll5DBzVv3/d+E0tk
	=
X-Received: by 2002:a05:620a:1a1f:b0:7c5:642f:b22c with SMTP id af79cd13be357-7c927f99563mr2964406185a.20.1745416499208;
        Wed, 23 Apr 2025 06:54:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCYGAKdZu53by47MDLIJhd7FQhQZJw0CY/lsfFM4Rh7noGH96BnMs9HrnTEVjA/8jZt7RYLA==
X-Received: by 2002:a05:620a:1a1f:b0:7c5:642f:b22c with SMTP id af79cd13be357-7c927f99563mr2964401385a.20.1745416498738;
        Wed, 23 Apr 2025 06:54:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907844f3sm18420431fa.38.2025.04.23.06.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:54:58 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:54:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: camcc-sc8180x: Add SC8180X camera clock
 controller driver
Message-ID: <xlueboano26kjqkukhdmealdkzdpxdde57w6v5r4rjegydce35@i3e77s54t6yt>
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <20250422-sc8180x-camcc-support-v1-2-691614d13f06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-sc8180x-camcc-support-v1-2-691614d13f06@quicinc.com>
X-Proofpoint-GUID: gkCRq_s6bDJusxnKRLGG-bxh9ccGT4fb
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6808f133 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TIlaLBFy8nvcEV5Zc5gA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gkCRq_s6bDJusxnKRLGG-bxh9ccGT4fb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NyBTYWx0ZWRfX+kUs6IQ7AUjO LY69c9fQmwdQv8GYZFmU4YyYrtjhk/ZC8yMBxTQcw2U28hyq2ZWlDwJmpt/IkhNURl4sQwgWIg5 lc+MUMNdgCu4V53CBy6/dqSSkqXv81A9yW7z33jGkPb+K+uN8p8qXpRUjStV1391sSUwQn/Cuhj
 vPdSsbWIXgVQpnVpIQxcF+YqDG2Z2m2OBdim/qVjG6sG7Nv+k4zuTwhYJGJ3Uy4uJHvztUebfHL z3soCX56o8hmf5ienxQm/oCg5JGUX79w/Ciw9dfynEOqN2QiJNf255vtdSyxXmiuFiJysJaWr2k DSRlu7aSCIa3Ngj8ECGiaRMC09B0Vf8dQ1KOfPRDS7S2JY0pvZkYkCc/aiJfkefTDohzwBeKBLR
 N3bqKFL5RNjsMJb5Synn32sIsnzaqdsgLtlS74pK/RJd7X94IPJT7cnyxjHmVrt7PrN+RXZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=867 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230097

On Tue, Apr 22, 2025 at 11:12:11AM +0530, Satya Priya Kakitapalli wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on SC8180X platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig         |   10 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/camcc-sc8180x.c | 2896 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2907 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

