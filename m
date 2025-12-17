Return-Path: <linux-arm-msm+bounces-85535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F2CCC850A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4A11306FE52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AFF35CBCD;
	Wed, 17 Dec 2025 14:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edqmPMzA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYW7vBnn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C345A34F278
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765982986; cv=none; b=LYuXDG4kvBNo6oNHv/LaFScqEGMyTdrwYf/572JA+ctBr0gIlmUT1gAi3tTNL206pdgxIHJxBBcpO1kINu9/bXxeihEfwg2XlpmDUEPgMT08tsEktCg/ep6LLaAWjNoLoT3z2R63Yt0XwDwNVerA1R2JS3UK8wqWUBDsqM3ctvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765982986; c=relaxed/simple;
	bh=ErVoJNCbnQY3nVxZRlyoQmnDgnlE+T605uayOZ84szo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBHqbo5XJyGOpAewEV3bm+nJfUILP2sazBYZqtvnK5b+fD2ysaTBjpMV3y7gbXGL/3mz2MU0eGCrS5y7iyqWblJhxJ/VqqU5BOKhxngJ43nBJa6nekfmzVLpyPkwOZ4Q3sDkRht5cMfbdG1cGyid9t85adzDLBc/Yu4MO+Pi910=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edqmPMzA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYW7vBnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKnSV2764396
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hsRWhAC/dFLJbXHdBrmbP/ko
	fllr0J3s1ZonK0eFjOE=; b=edqmPMzAwXkcyqcho20mgjBcZWQN7LbawWCL7XdK
	d1YkveTf9GFhvWxddW/PCyC6XPrfcVyeSgx+d2Ockrtrels3cghtpekmEBVAySPu
	4Wu+mf7qopaMQxvPpkW/gJSR6venMLGvCLk60vW4cEfXhAEaGgtoj3dhE1NN/Xqe
	9QFrnDhyM+bnzwAaVfgkEnW6ZknIe9Xvs+S86NWww5VmcFl5JEbPpULvMxbr3F46
	wzgAiy7pnamyxprMIbMIyI4+sNH+HHO7Ru4xhh9FysvqMdGgAgOIXd9OdTxw+IbV
	LQe2gDD4ACiiyAGjw2gNWY2CSgHT28a4vlSQVX65OTbgDg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fefjt34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:49:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee1b7293e7so196607641cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765982970; x=1766587770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hsRWhAC/dFLJbXHdBrmbP/kofllr0J3s1ZonK0eFjOE=;
        b=OYW7vBnnNb2TQVr2qfNvsz7hq99KKeDMAD6WkyMDaoQvXdbT6IeyMq8V4Vg5e+dxxq
         VRHwnq6Dah/hnL95KlJcpHDQrsDCezDri4p92CZhldubxhAqBUJAUycx6bt47LZ/X9ho
         Eh0kFx9fJj4lbcseYpisnr1BU57slLXvV59GSgYdU98ZfF9catit0YY9bLfQF7Zlk6Pi
         8Ypdpb4UaX/iXg8bphWGzp7oJJ6UdFPrtZWFX69okqh+OkHD8LGIlOnldv16nJhNzYFr
         /Qha06xPBerYzFygLK4gTL+RPMG7AOL9cpJbR2JnSipIKFP/2bSPGpZTafrcdocZ1AS4
         c/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765982970; x=1766587770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsRWhAC/dFLJbXHdBrmbP/kofllr0J3s1ZonK0eFjOE=;
        b=V9K6xK1P4YDH1sg4h2pOuMxonvfeUyH+nKnnx8HWp1IMWHThIwwaEIrht9mJ2RDAcH
         vZ0TeZ6xqmEaFcSOLNNxPM7Gg8DeN7J9oh/NQS+t73Po3okAOLlpm1u/Ea5Wp3T8CFH8
         hAG9PjgXLI5GQQYYYjaRKFdF8Wn7QPzSV8tkw7cgyYLUkSXI7/0Ixi5tq+7uGN5Sa5C4
         tNkMjDpgxGExg1N28GZBw5oSjo+RBgEnGKENEVl9RDEixvCsIiB70j+UGXGQsHOXNecE
         oNxnf36TXakQUXseHu4iBdBSur4rEoDKSXGao/gxcPmT9A0qytHm5ZUuhR1X66LmaWmr
         EzyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa4jjvCvm0zbjZuyZOMc3Vgj4phiVn4k2BzVo4xthbIgiJFTEoLAGSYrc23zWGEE/ObuAXmLB3y+C+clRT@vger.kernel.org
X-Gm-Message-State: AOJu0YxuWyCeI3JTa/WGWYszH9esZgc4wjmQzHXj/c79odD4Lt04uiDX
	BdBhCJtm2Pk2fdnYCl4DoJgEL+MgVAKWek6e/HmPUbOByspYwe3RcQEqJtrv2ENz9CtVYAS2hja
	FHpA/4bo7W40E3y+jwWP8p9cyFCTZ/rDquHaMPwnN1dygEjWmjY4hgIEQkRgwsRUhOpZE
X-Gm-Gg: AY/fxX6hOmBDrjm4pVKmAUSHqcX6xay/cJTDgezmCXEL5EL3YRTo9tRr8YBG+MBd3ce
	enFnu34rHd7iUNYlpmcxna/y9GKimy2Cx/X28KeB2/gA/lz8Uz2kXwMuy2dPiYV72vj8KHlJz5X
	cB2IGqPPAd+BbEL+Tco9HHl4eyTramkSji59PMy/AoXpy/jAOuFn/6sbO1X5OSCUkuJq8BmG4J6
	uaoOV0PF11IZOV8NSq1N/WbhVEbyyV4EaBfiA+znuBS3tWIjmCxKrCwSEiWPrQ03kaoRBd9cyiS
	/G/IEDnawFylzKqNffSsxJZbC49cOtam8xAnzpmLX5euuB/h0yhYZiVFwKKCtCzXNYxyPtvwbx3
	+yZqiWvwzvRZnjsWWsxMtGUqK9Tv8MB/ZC8yePFztj2FAEVSAySCleJj3FwHKKVFPW194kTGqBN
	S1NKj01ql0L9WmxjQRLaMXNMk=
X-Received: by 2002:a05:622a:8c8:b0:4ee:19f2:9f1b with SMTP id d75a77b69052e-4f1d04fe751mr239770441cf.37.1765982970277;
        Wed, 17 Dec 2025 06:49:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/Y6bLOtLm+DXZJeGXhNOVcMF7QE9a9MK8BkAB+GSbTifY8ATrdfLgUoAru84o522iEz09ng==
X-Received: by 2002:a05:622a:8c8:b0:4ee:19f2:9f1b with SMTP id d75a77b69052e-4f1d04fe751mr239770201cf.37.1765982969874;
        Wed, 17 Dec 2025 06:49:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a10268453sm951896e87.50.2025.12.17.06.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 06:49:29 -0800 (PST)
Date: Wed, 17 Dec 2025 16:49:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: hamoa: Add sound DAI prefixes
 for DP
Message-ID: <cu42ceqfbu52i474svaohlzjh5e7hz32fs7otzx2ded7xrjhzt@q6yas75xb5ji>
References: <20251217120051.98198-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217120051.98198-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExMyBTYWx0ZWRfX6jcsAqWgMiBZ
 jc+xKOI1BzzpNgHJcGx7HLy9zbkiULTdBlil7/Sd3JZsl59vsyhYdQtQfyy6sxaQt4hbyCOIy/Z
 ONV1zSrC0i6DhUUJHD0iwBkwi/fJlcZQKaRzDOlZs5tT22TbMmk6rZsqf2oXjWrOK9zk0w0AgKE
 mpgeCBvdcLt+txMisXBw/3wtcwreS6rJ8FRbrVTFTwsEdqqW2vSb29Sm7i7t+6e4cqquxdbwJys
 UcBz5LeN/bEUn+oKHlZZ80cIQzoL/y6WS4UaAKEpPbPd04njNYG/ih78ewJa2vvup8lWAH6xvNG
 R6sqP7UZf+9t2JSgqGCzBcyCCLsejyx5JfAflV5qosQD+O4+ugAvavNBHNftHhVr2ijIkuDdkUQ
 1sqA1MLnVzguSFFPq91XnlhGXoEQaQ==
X-Proofpoint-ORIG-GUID: H63ZWTl1BTHWd51R_vt2FlyzllizT60S
X-Proofpoint-GUID: H63ZWTl1BTHWd51R_vt2FlyzllizT60S
X-Authority-Analysis: v=2.4 cv=R48O2NRX c=1 sm=1 tr=0 ts=6942c307 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UpTyAFhicMDBmGaZp7IA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170113

On Wed, Dec 17, 2025 at 01:00:52PM +0100, Krzysztof Kozlowski wrote:
> Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
> controller, need to add dedicated prefix for these mixers to avoid
> conflicts and to allow ALSA to properly configure given instance.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. New patch
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

