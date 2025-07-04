Return-Path: <linux-arm-msm+bounces-63712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9CBAF9542
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9670F6E1EC3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 14:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4646B15442A;
	Fri,  4 Jul 2025 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNsLn6uq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3C11957FC
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638723; cv=none; b=sOnDNdpLQaN39qyNAeCROIQeNYmQV/eXCEuUBpGNheNZVZ+A2yics7hlZFIt/59lkOil6sPDeueEy+c+oS+kXYZYIzPvw+6Gac4gbeHtjnQC42qaJJNmBZBei/04fQzg5YOm9f7obs2m5vCyxi5vZD2RHwuigPxq99w1S5EhMyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638723; c=relaxed/simple;
	bh=yKb5SrhL6MrA+CsE4Jh/Jd1VRcCRTY2ajGhaIxgCk1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbtdPRpqf3u8NI6ku0FdZ2OzisxcRLeDTi6XXDglTnOXXVitVhG2oT7El3N9p1C93u7K9KpOgJ8PtAQnQsFVoKI7uOgZ9c39fH7FiASitauAkaSXDvfaopAhU0A+Bx2eaR47aptgnnnPoZ1w7IssolBEeF6FvUuqnDGUhKQcrW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNsLn6uq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564Diqrq028664
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 14:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xREkybw2FDzvYMizFF8rWZ1X
	RUqOCyiP8R0mJaXN15M=; b=pNsLn6uq4RZ3H8Q+RCuMq1AJRZwDznFhrdfcmATY
	gVY30zS68KDJfwKvCDEDfRmOZyThi7JVmemTaMliFF7SQ9xhDy7/opU2X+/ClkTQ
	tAF0Q6v95JKP28JtR2SIdTGyMLIF5srt+Rb78aKx0B+E9J/87uXAuuAf/2eJQhaj
	aVs4DO9cPT+g1EZl4vw7VojK6i9B8TfjSQsIgzRYdm9uzl6clfl3+VNdBhJhZ0oV
	B1Eeue3cbvuM7M9Bti+gMhlBnooRtIZnMqEf4vig9NyfiJw1Vpg6mBznD5I/Wah6
	nIqf4jHApFVzOToP5D/zKVJyvKdmibkMA4Ipb0OROIUSCA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw4cy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 14:18:41 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2eae95dfae3so1266112fac.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 07:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638720; x=1752243520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xREkybw2FDzvYMizFF8rWZ1XRUqOCyiP8R0mJaXN15M=;
        b=DSMZl5ENfhFiXnI60eDawgzw9SVtOPv61NnwReUKR0XfAoQGWTCjyhvs8+arfa3y33
         NWvtdCXv/OlhmANK5qNIS+ZVjm41ln0+BfXRlbMmZnOZYX8b6bTKCSgfNZEqyR85f29+
         5uVAEsJl9YZCUEXb4xG2jGh0/QJ9qboIfFUdwJ9J5Zz/tzKDVjJwmQz1vgqpEaep0KwP
         8qRagVBphF/OGtCCXlKT2vut+Hbs+fZpGUc2znnekTRrFjpnHh2lFmHUvdOT7YF4XJc4
         mKBzC4abgpCvssxUeC6Ku2ql43PAkBsYUvGWG4ioa6jRyzN9tDmlT5v5kpp0+NzL9i3a
         /kag==
X-Forwarded-Encrypted: i=1; AJvYcCW06Qhf5ifkdnUIZGZQQD0svGvJFPXpnE9SOkOPP3o8YhP+dyI4loMbw3+CHwEpIzEgZJEurvB/cKL92OlM@vger.kernel.org
X-Gm-Message-State: AOJu0YwR132Euw9FKhot3M0Z7d4GRlDWHLcFZRhkTiK1spq4/R5YHWGZ
	Pomr1TV+6GP6jHd3XuVFmrC2Q24kBg5S+I3uuwbe/O4wyZfOTDASG2wWgeOwIJA/qYWKrAx4hO4
	VC9oxi398KaHjlMMxu5PGLsButu2q+8hTNH3djxrXTZjw7L7AwHrSSur3GuOuMX2uF8tj6PLx7W
	AKkyU=
X-Gm-Gg: ASbGncv5HCl05UdxOhiThAfPkRK5a54HnlxCaPwzMRvCQbVLMr+biEAzlg/dPyedCgE
	nhhpP9I4JN34Eqh7kKmpYt1amsJajTjzwxhH4tSB3ud4LDZCJtzKJGrDrCnZOQyRUGLX627lH1s
	PO3n/xjZgP5645bVSWPky43C8Oe8nRs/ErZRhgPTN3l0cTyCcL+XgAFY91xQuvBmvWzWEjE15QW
	zx01baMg/rv7y+yNy9Os0nbYGBMjWj/YL8d2MW9r4RXKXs2twSyZ/KMmk+tLnoFAoIcUSM8FbaX
	qzPWWll1avDHo6H056M5Zbdag+nuzLGD8Nagi6o0UdAORObmmKxRhdwXIP5Xei1XiIK3kPXJJ1m
	7axKZol80uQ7/z9md9sYK01LYzbyT+iLmk8Q=
X-Received: by 2002:a05:6870:6586:b0:296:b0d8:9025 with SMTP id 586e51a60fabf-2f791e86acemr2425342fac.20.1751638719567;
        Fri, 04 Jul 2025 07:18:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE55trtrcvfMvQ50U1in5p4/u5VIdRpePmzlTLLMw+K1L0TgUF2JLfaCgovy4RVVDL8Gwf5PQ==
X-Received: by 2002:a05:620a:8014:b0:7d5:dbdc:ceef with SMTP id af79cd13be357-7d5dcc9a32cmr410173085a.18.1751638708650;
        Fri, 04 Jul 2025 07:18:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494e29sm262902e87.102.2025.07.04.07.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:18:27 -0700 (PDT)
Date: Fri, 4 Jul 2025 17:18:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] ASoC: codecs: wcdxxxx: use
 sdw_slave_get_current_bank helper
Message-ID: <xglngdprknerf3uoeixiocagoml26kw4zcwrnmb7c25m3zt3ol@2vnglqifcb2e>
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250704121218.1225806-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704121218.1225806-5-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: uqh4U0NzOCgy2WM_KE6P4am4QT_Fkw4l
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6867e2c1 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=XXM5SuZbuiGnn3J7RH4A:9 a=CjuIK1q_8ugA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: uqh4U0NzOCgy2WM_KE6P4am4QT_Fkw4l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEwOCBTYWx0ZWRfX4A1Ip2id7PV8
 CxXh7v4gvqi9T4SIeQniYbpqt5HADu5LIhjcGvJHtv5v9HKigtZ2CswmEx2Cu3GvAbvKc20xyE/
 AmubHFoTr93YHE2XN74IXRqI1CMd2ItliZluUOZixHLIgj6B4fjquZDcYtJVmM7KmqTXYkSHdve
 Gw0FS1jyTsqwox+2EXFsNpTxSlb4ngNbb7CCJj42GH9H/n6zR+i2FF6Mnmuy/TUpmjG+ekz7tjh
 eC68eaFBGpPsF7e1YiBfW8TQJURk4IVuOmxI5crTFoxgDt/rUYFHsMfsXPP93S+5q+P6xsp7j7J
 yZgN6u/8sJnhdn9OwzmipD68GTtBOBwigAAqClX50pPtenqe4WBJWtvvLXR8U4ji0yr9yxIq1PZ
 xOPswim74HJ7BE4VYiri32YiM4EAnF5imBLurk6dmgE3aeCKslESQZulV0JPE+5DEXopzUDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_05,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=535 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040108

On Fri, Jul 04, 2025 at 01:12:18PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> use sdw_slave_get_current_bank() helper function, rather than duplicating
> this function in every codec driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd938x-sdw.c | 10 ----------
>  sound/soc/codecs/wcd938x.c     |  3 +--
>  sound/soc/codecs/wcd938x.h     |  7 -------
>  sound/soc/codecs/wcd939x-sdw.c |  7 -------
>  sound/soc/codecs/wcd939x.c     |  2 +-
>  sound/soc/codecs/wcd939x.h     |  7 -------
>  6 files changed, 2 insertions(+), 34 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

