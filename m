Return-Path: <linux-arm-msm+bounces-59168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DBDAC1CA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 07:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 852AD18951D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 05:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB46223702;
	Fri, 23 May 2025 05:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jW0B5fjS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF291A5BA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 05:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747979512; cv=none; b=cjB7fqY08t9Kd3QW80ImHi1ykEz/qAd/YNcMjmtY7gVD0QXl5kMVZitmwv/xNBR8ilhNS2aVNhNNZc/3VlrDVdz+6IOvucHVpidHN9Zx6P1tQCddqCRIGm9f8gJ4E+UUZD+2XZGX0AnbUsM5xk52v8SSQQLqCAamc4UhTvOj61w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747979512; c=relaxed/simple;
	bh=+Vr6IE5YP6gSNF0sYVXBQDOOTdCJAwKBdrwjzpIKREk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOAritIUqATiIZfkNt1ExNO0Mq2sxfQ/W8SLa8BpOgVISdZ5M0Jn3KuSwvbswar17fb1GrBxPz3Wwj35XrTFXGK6oqgStU+lKgIMcyBueZavoPGROAQc5gaEk5VzlMghTwRtzqmspR/yYfrUk9dQrU8JotwTVqBwvZdgpBZ+ivk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jW0B5fjS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHfAI8024983
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 05:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QXrNGmCmt2zhECBpwtfjdX/H
	WyQDRPapxMVv9gaUZfM=; b=jW0B5fjSeWzuzpVhQfTMEJLldza0fotTojG+Sb+O
	lxtSBi50yJOCtd1O/xHB0GqFcBKvjgZZNYFKRFgu2QWSy7NwdzqgFoMy4JrXP/mo
	p/U0swFqGPIDvL7p6KbFT8pCEbUc3FzmmQVCmUs8EDD6c7qCGtqoV+3VD5SQHwJF
	vsn2z8+gHnQa0n0U4gjR48SoLNoFWd5HdHnWzhZWq5Lbmafns9i6dsLigfvpFxUd
	Z85ffhpy4Z8vbER5omrEEUTfA4ASVVHJIU59js1cQK0MXJJo/cVYbE3yiWusaZG7
	otKao2r0n+LJosEdZB8N/5El1J4P+BU+EaNtYIMYPHH3UA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf50myn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 05:51:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d4461e7bso57096356d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 22:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747979508; x=1748584308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXrNGmCmt2zhECBpwtfjdX/HWyQDRPapxMVv9gaUZfM=;
        b=rhTl1BPiquqyUgpMi7Q0VpGuGkNI7Cl1W/KPJOpY1ot2Z5rDSaUSQavcQhdmQjyP0S
         C2yfb7LiSdewJS6pXQiOdHuftbtvyC1shoT/53V/YCzedkB67vTh3+2WWySFgW3tIlTI
         bjsCfAaKOAqDkdTeNQ58hRdgW4Vj3r3BtqNexjUxip5UgVcPPpVI7CBUL0EYIsdN3JTu
         i+1Ymaad6oE033a7a9nbbN210ToF6ihu/kGEP6RVkCXOBWRH7Hg40sm3G7w4S0BChDj7
         /wVAy1AqDnCqhUSD15W8A2ykRI3uodIapUras10Z/GpB8jfFJU4gWXKhTtBCf/vr4T3a
         5eEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVRrc42+PiG8B/EasW598e6bJjgdQyed4p+Wb8NBLW+yI20V6/044PdZCmpjv8DKbRCxMT6idG90sCo/9i@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe5VsjtF7sWNi9cuSSUMuPofg+XYLsn/lRO9RvQpWhc+gSLDJo
	izU3o47mSSysol5y+oEl/oiwtglC1myksH3Cb2JEYqdJ8BL44V31W02UqSw+/raOkGw4woXtSKD
	x4IltNwW6zNmN4ZH4aHmPnAhW/MqM7EOqL7OWJQuB51aVeuCyC24QOWmMbkuHFP3YluDv
X-Gm-Gg: ASbGncvAnMYRXd4qJQLRj4X6aWYod0dIl6vbjgbu5Ms5ngLljglRELSnLHw4Q++sQQB
	QGDFxGKHJ9QdIBFOIpaxAax8vm14/VnqBRzMp9AF/r9Q4nvRyLzgULsGuSA480THVJMeYSzz/2p
	MXVe5D9BBQeyPF9n9M8Wg2efKO3ZHSeDmwK3oIOQgUUih+4KaAMzRe8FdeWUcIZ0XAoXzGJd87K
	bK6Qq4zSaZBz2NihHnipG52To46+9L34MoOykBP3Cuzqw74FhZRFhQoLWlKk3OVZgLZLSzz90vj
	NtuoxvdA27vamtU2vgHIGKik2DkO6tppY4CFNJyrJnA25HxTdCtY61V4Nh0Ak8OZu4/slvrTPtQ
	=
X-Received: by 2002:a05:6214:21ea:b0:6d8:9d81:2107 with SMTP id 6a1803df08f44-6fa93a3cf76mr26275966d6.20.1747979508620;
        Thu, 22 May 2025 22:51:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFezhd1t/DrxIQ4E+HtvXS9OGyRKywlZu8VfL24fR/uLLWgaowbUpflzX+MwS4KemgCK5nrPg==
X-Received: by 2002:a05:6214:21ea:b0:6d8:9d81:2107 with SMTP id 6a1803df08f44-6fa93a3cf76mr26275736d6.20.1747979508218;
        Thu, 22 May 2025 22:51:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fdf900dfsm1724630e87.60.2025.05.22.22.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:51:47 -0700 (PDT)
Date: Fri, 23 May 2025 08:51:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/10] Grab IPA IMEM slice through DT, part 2
Message-ID: <j23rf3rjfv6rh73ce22ka6g5e4tujeeg25fmobvetpxo4kth7p@rvi3krl5hvwh>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-GUID: mVmpMGd9MpxasT9nsTNdSmZpc0oBb3to
X-Proofpoint-ORIG-GUID: mVmpMGd9MpxasT9nsTNdSmZpc0oBb3to
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA1MSBTYWx0ZWRfX+i6zJ3M9Qt1T
 PYnrsxyeJsnU55WS3PycSTu2FxOURGl/EqOHcmiKP1JbobRtYDStKFpXyCXtm8X9WbF19rHgS2F
 pqmUDgUjEY88ln5V8CddXJVtA6kgepU+Al/6l/8qHUFbydODw00A64MYK/2p1JKWhaju+Bq2Gf2
 ZALkNNywkv71Zltl0AgHP+a7WUFmMqNJXsykdvxBGyiIalQ8O6V2P9uCuEySLJJ3CB1oZLaE3e2
 sQhuAuJ1XW8ICQXBDcCYOUscNT9seW0xR4ALBI3oJJMbBov0l9Lj5YzxfGGt/syi05J2LoKL6Oa
 JhI/wGp1cqwDShSUJsVqZ3CE5BWl89lA1i5z5MEJ0WRIdf2F925d4QDgMZV7l7oOEcfulRAev+8
 oQ+OuHdOUwEPtWkpfCBEJKYtXBCltj0Fuh2FiPmID2S2m3B9nUcSOr4QRfSxLTADai0GdTJ7
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=68300cf5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VhJxsdNJsIdQkEDcdXYA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=868 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230051

On Fri, May 23, 2025 at 01:18:15AM +0200, Konrad Dybcio wrote:
> The IPA IMEM slice addresses/sizes are hardcoded in the driver. That's
> mucho no bueno, especially since the same versions of IPA are used
> across a number of vastly different platforms, which invalidates that
> approach completely.
> 
> This series wires up the IMEM slices in DT on almost all platforms
> (need some more time for SDX55/65) and fills in the necessary bindings
> holes.
> 
> Tested on SC7280 only, FWIW.
> 
> Patches 1-3 are good to go instantly, the rest must wait for the
> bindings changes that were submitted in the series marked as a
> dependency.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (10):
>       dt-bindings: sram: qcom,imem: Add a number of missing compatibles
>       arm64: dts: qcom: sdm845: Expand IMEM region

You've expanded IMEM region for SDM845, but you didn't add IPA slice. Is
that expected?

>       arm64: dts: qcom: sc7180: Expand IMEM region
>       arm64: dts: qcom: sc7180: Explicitly describe the IPA IMEM slice
>       arm64: dts: qcom: sc7280: Explicitly describe the IPA IMEM slice
>       arm64: dts: qcom: sdm845: Explicitly describe the IPA IMEM slice
>       arm64: dts: qcom: sm6350: Explicitly describe the IPA IMEM slice
>       arm64: dts: qcom: sm8350: Explicitly describe the IPA IMEM slice
>       arm64: dts: qcom: sm8550: Explicitly describe the IPA IMEM slice
>       arm64: dts: qcom: sm8650: Explicitly describe the IPA IMEM slice
> 
>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 13 +++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi                  | 16 +++++++++++-----
>  arch/arm64/boot/dts/qcom/sc7280.dtsi                  |  6 ++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi                  | 16 +++++++++++-----
>  arch/arm64/boot/dts/qcom/sm6350.dtsi                  | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8350.dtsi                  | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8550.dtsi                  | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650.dtsi                  | 16 ++++++++++++++++
>  8 files changed, 105 insertions(+), 10 deletions(-)
> ---
> base-commit: 6add743d2854d744c3037235b87c1c9d164fd132
> change-id: 20250523-topic-ipa_mem_dts-58f5d73a1f21
> prerequisite-message-id: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
> prerequisite-patch-id: f6aa0c354d434ec11dd88b93528c05cb3a45bb07
> prerequisite-patch-id: 89f72ef0c3d3f29753b0cb9e290a4036ba380cc1
> prerequisite-patch-id: 330c94ac7c2b42dd86c5f763b133f0d2598fda40
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

