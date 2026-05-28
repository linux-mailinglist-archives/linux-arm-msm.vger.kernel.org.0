Return-Path: <linux-arm-msm+bounces-110126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N1WOPJIGGpoiggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:53:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A265F31E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E92A301C16F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4CF2690EC;
	Thu, 28 May 2026 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5FThEl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XsZifynL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24CA243387
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975987; cv=none; b=NsRT4MyGrxagHn6b1+5sxMQfm8ngKNGhEOCzKGd4vwfw9xumdt8ec60/zGpF/Vw/qbVyilXiTUwV/k0RIWkiyZmTo2XFjFJ1mHdmHPOqG58fYrY+3GsaXLEIO0WFBdQKRSb6P29FOJLfM8Hlx+Gun++1QSvz7AomxXp/2WuNG48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975987; c=relaxed/simple;
	bh=7VV/t71l+0kX09iU71UG8VmZYWugkTXL8rSSpmoZ2oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWJZweSCToxJ+KE5K3f3Xu2Lua98FunN6NJ00vGazfl+SgvXKb8mANJWwdYcKFO/FMpwyX6h2jUEK5oYU0DAUzBda5FbtdceQ088i8rv4bvNvtBrOQMWpaOY/9wa7hFqCdTv8AbI2WpB6Gj4AsCWWrWo7x+CrC8kz3LMA5cTJuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5FThEl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XsZifynL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vKgj1562577
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NpU3NN7FDiNcysH42nW1Cck0
	RUxplWQ1oX9H0ThuCGo=; b=p5FThEl7weuy8chHSPFuYlh8bMwcv08ebX0hqkcd
	UmfZ8dB5Sz+gF9rxD5ZycqOR6QqKn9F2tvcpEk8EIuolcSPySmR1H69mEv12aKKV
	emZhJA9uFAALV7MZ8cA5FoIk5cX7iRtAjxvQIYkNIMFL1Vuy5X9lfx5cEobM4QDf
	r68eNSBsxeT6HPW8Ap8AplawBQ/BIkbAQG2k7ScncV6ounta7CStnbppe4/EcQ2e
	z7g1yZPxVUI+4xMNsmX5Zbqf1AOHN9q1HAtiRUNUMtS/91hPjTe8uUFdAMH9p0+Q
	gRWFhgWm0QIDAJ7y6HMtz5nUxtiiTVoI9fiHxRhbW5QuKw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y2txgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:46:25 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cfe3d4c16so19344046241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779975984; x=1780580784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NpU3NN7FDiNcysH42nW1Cck0RUxplWQ1oX9H0ThuCGo=;
        b=XsZifynLGn/CaZVV5nXiv3P8mPsMLpOtqNvPaucm6iHmSX6yGkJ6XY5f6FO7a+TlhI
         4xJjumsq+MTPlwTPMnVBGJ8PHQKgzyH99gY4G5FhBKUTfrH4RNAHJ+M9Rmfmf2k6DlnM
         q5CS8c2B0Q939QAY9zAotREF6T6HfRGw8ywWaN+dyIFc7a+qzgXiXd6EG48j2yydSjDD
         +dar+zL7JZciN6PQwN87v6Msc9k4YNgxYedgQnC2MbR8PAIrKvSqhCwe12xWlt/mw58I
         AZ0kBUPtI1E5caK4hP2yNHbiaRq8nqPk9LL5/zOg0otZlYXL/uj5DYyvJcpU5DEaB5Ho
         4HrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975984; x=1780580784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpU3NN7FDiNcysH42nW1Cck0RUxplWQ1oX9H0ThuCGo=;
        b=V3+As4oYzDl0GEjP2YsLM0LK5Ha3AxFT/zs21LcAzrtcYpE4dmaFpHhn0uj/ttyPag
         s5cbKXbfI3hnHsWvx6631gjG3DUY+s6V1sMYP5yPn22rqyzhY59AdwZ0bqbhyGNDiL54
         LYjCRxrSpdRNFJuNIqzEt0SPEbcyVBMwBEEvaO+hsXnUOoOp7jdUY18tX2943kfiVmjK
         3Nwd/djBbMOEQgQpBfZDacbruw7hPm93fq2+yfNeUD0QwW02nRNfp2FZffAsxaO4cHA8
         UtnxirEsosmpjnhe9YjjBbuOQccwceZlqFd1Qyt6MPJR/k33iNRGK3SGMop/lsiCnM17
         +H9A==
X-Forwarded-Encrypted: i=1; AFNElJ/SQXHsbH7yM8GANblxX9usotTgd+AxDQ9avWYImqflQEUa4eWpfXdVnzyZLa41+j90DM1mdpMNdTrLch2I@vger.kernel.org
X-Gm-Message-State: AOJu0Yykg9joS/AUip5+5pUXiHL7YFnIcF/YXCG271gqRPi5NQv42hP3
	zCuqKNIiMge26faSdagnOJLU4ceKL+IjpQGd17s/xYQcf/ZfcDUufN80voj60TR60i6SuldcIB5
	/7paf+5MtsrrYQovmsiNUjvI74EYDoeMKbECXGw+qHHADbH6aE9KmvzwlcviqTSJ0VDby
X-Gm-Gg: Acq92OHXfc3tG+wwHOXeUTdMormwEwJmyCyyltfjHudbqR0xAh/8ZfHxwOxilLr7NIv
	GPD7dsWx4F3uLost1Hx785QEDd3JewZNPDI4a7Ma91+/eGCIHrsyzlyuCZXLzER7jD9/akeiHQh
	RCzXsibXAzfhXvH1PUi2GQH0YbtnJjo2lF8pWQXvPRx2ICjNUMARpvXDrh/1mjT+ri5hCMtHUQX
	p5lS2adbM/ctaG7xVcvQSIPlwXalUV5MwhCBuoW0jhJXbZ/poY/nHZw3POat2Snlp/Yj5XRt+2b
	+QsyCOpLSoYQ6BRfB39eYGVJVPGP6DGlURI9ERMzI+UzyF+uOMv7KZgFnLnJeaS4CgqeLrFDmq8
	IIqqOuaw160kdv/ipR8Q3LNe88N5cnmv7HwKO4+j0p450KMODKh8sWdNa7htTk6f6KI1/fWeZSc
	1n0OiquTTzixIT0ANxbJG6KcyzrhOrIr6qrADrf4i1CD3PLg==
X-Received: by 2002:a05:6102:2b96:b0:65b:47:2c8 with SMTP id ada2fe7eead31-67c80b74c05mr15133721137.10.1779975984282;
        Thu, 28 May 2026 06:46:24 -0700 (PDT)
X-Received: by 2002:a05:6102:2b96:b0:65b:47:2c8 with SMTP id ada2fe7eead31-67c80b74c05mr15133652137.10.1779975983879;
        Thu, 28 May 2026 06:46:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2c6efsm43049781fa.29.2026.05.28.06.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:46:22 -0700 (PDT)
Date: Thu, 28 May 2026 16:46:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
Message-ID: <mnbrfojxfu7acedzvaxv3wpkcv6u4fhfoc5lh7xv24spm7juvo@srxwa6rnpje2>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-5-953f246a0fbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-5-953f246a0fbb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VeXH+lp9 c=1 sm=1 tr=0 ts=6a184731 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=bx6E89HPZMyV9SPDFu4A:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzOCBTYWx0ZWRfX2YZ4/Y+Mht8N
 Twl6tNLiuPDb6pPypMtSqfEhydKOO4W9gtfbt+4GBKe+5NkdS/l7KRFnlkkL5jcCG4GZNbYACEN
 gHtg1WNpKPZ1sw36tVCsnvSo+zrio+BGtPBQusPllsW4g1OEPG12U/Gg/ibqCfnIkbRAUXRqVi3
 xdOUfxv4KK3LDNPQERPfk2SS76/2vx0JKH7CNt2nXk2noTjvOVTJqywnMSITsZd3/SEtKf2tHZj
 OMRIeZrioH3/1wlAWeC4AP1f2cNtlvlSNJ7/hfL1GCJyMBGEUc4vNkDIMTmFa/uMvcKnzdzPtvf
 ZrwcP9nC3R3J2zfqwT6WCCPyg+jrq7EM9rQTlbEkpgXF0vVTzlszbhIw/77h2zuvOHdUW9oRzoB
 aXrcv5IB3OFJ8aXSMVP7wLJkZNrYt5OhFtmzOVuNJs81elmWkrebxnBZPRqzEamRNCIsV93aZon
 SIKP/LOay4GlHziIb2g==
X-Proofpoint-GUID: 0DWR52M0H1M068AMMo8G6sLmlrwWU6a8
X-Proofpoint-ORIG-GUID: 0DWR52M0H1M068AMMo8G6sLmlrwWU6a8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110126-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 43A265F31E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 03:37:06PM +0530, Imran Shaik wrote:
> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
> hardware block, with minor differences. Drop modelling of critical
> clocks and keep them enabled at probe time, update the QCM2290 GPUCC
> driver to align with the latest common qcom_cc_probe() model. Update the
> GDSC *_wait_val and flags which are applicable for both QCM2290 and Shikra.

There are a lot of separate, unrelated changes. Split your patches (not
only this one) following the 'atomic logical changes' approach.

> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 174 +++++++++++++++++----------------------
>  1 file changed, 74 insertions(+), 100 deletions(-)
> 
-- 
With best wishes
Dmitry

