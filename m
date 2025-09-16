Return-Path: <linux-arm-msm+bounces-73662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FCFB592FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D0F116530A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893052F7ACB;
	Tue, 16 Sep 2025 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClHK62Cv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00BC28D8D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017428; cv=none; b=KzoVgMK3YldM1NxFhSoyqATsEAA07VmsLmTYrshtc6i0XPRAFlz8jbMfS9n3LvE5/xGGCPJNNEdpO2IfDPE/nsCAaqqHsHn8u12Wjag5J6EDTWgK4QK/kXOa/xqRD0O4mopnFw6XHif+pQJj+JTaHYHC7woE085htboR/SJhVyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017428; c=relaxed/simple;
	bh=XbVFcqCWViC3Ty/3Z0wTLN06tYYojOW9npjz34zaKWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhFg8d7kMUxfpQk7tecsN4RosucBsCX/6gm7g7QlEQOQE/DD4hyjgMNDhaptkKb0FnNZcoXO2F8HbpNnCeuVFebjB8AVd/mx7b11sbv4IUP78HPHIBivysg2JCaTZCtc3ylLgFiacmwsoJN2XRZ7YyL84rNV+5PSP2664Ika1Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClHK62Cv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3qYaf005518
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wKZA8BPl5AnCLEV2joJ24RdF
	tVw9jv4aVixR67Q19MY=; b=ClHK62CvK3ZDTQyUBb8sTAip0ggbSrF2CZpplJ5x
	kO5ini0JvfXSEuOy/Lpkb+DFOFY8lTxJaIGNYgOa7plJ3Xabo/CJ6WGBFN4D2DQn
	RkYRVLah6rRN+eEVLwJsRZY6rNYvjfClgFgKNMXrlAQCdr8ECZd3z6uFXgxfHCiM
	mq03sRBzh2eBtKC6clanyxDxRY85HYJCXhJAyV2wgrrgkunjnFz0wX58aR1Phngy
	9x5aD0uyOCb2jV7GwMq9IiTDcL13t+Mw0o/SwEACbgVeuihHe4q7CXUkZCOMMqca
	udi0dvciKfes0syQg6dB6iKhND0LNku6ga7hvCS3RbhN3Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr8r53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:10:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78e0ddd918aso222016d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017425; x=1758622225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKZA8BPl5AnCLEV2joJ24RdFtVw9jv4aVixR67Q19MY=;
        b=AOUuaEaAnLZk7w8HXazDehgwTXh06yreK1Ysg6nZ1WQ3uVU7SjwPbzWjRNzPHLPs1v
         3JD+JBoGvAEaEAyidoCDdq3t3xy5J8UQfgH3zsmyHg6cRw0FTRYgET5C1FG6s/0CAcUy
         46viRUnnrhbV05hcNNe1g6tos7XqzA2292V0w0CHr7dNb/K/qXfBhYSlvfXd5ZCDrHX3
         CkS2c2ye8/ZoCARXFHCdYX3OkTwUhlOIe7BDO9p9xmj4aAl2I6oSEXNkw874Nqqq7Q19
         MJewyFtc2w1mRW3sJ5Iwui8ESihbf7MU7WaU8YGA85HvzSZPgQbRP3F6o73SoDpkogkq
         L3DA==
X-Forwarded-Encrypted: i=1; AJvYcCXmeGOg2HK+t/si/u/Mc6teJo0GmYvYfMupSZVeqx4W8QCRolxvSYyygccdBGLAlVVhRvLqE4fJZrYyr0st@vger.kernel.org
X-Gm-Message-State: AOJu0YxRRTG5hg8JBBe9X14fT2mQ/KO3coDOjdPOkfH8GDuwoGK9VDmu
	SUoeJzjPT+KKmqDAeSulVJnmCrsGH4dZ0q0yHIamUTZmY5Jgy3qTs7P2F1VzFeU9V+fU/8NtbE5
	nj7btuFgtbegDu1vuaHdjGfGXJQNZTzMDcuB8t3GsZZj/XFfR7PSHimvVfv090mSCdUVn
X-Gm-Gg: ASbGncvtJRZokFy7WGlN/kCN85ed/036wOZs4SE9KAAzrUItligg+pOCt6nKE58S6Os
	ZcAqMqnCwXWx0vszHLgs5yveyIaD/1gcMmY7UUCcoucKcz/BSsvCfnYyDZj3ipB5X/Xk2T+KkYj
	9B1NGu7PNIWmgLNC8IQMd4PySox7d7wzxdGN4fjRiU2fs6x+wCQV/0UsexWwx8YNzc7Y7IAJ1Sk
	trEvA4WMk8CKTpizinHqnxckpQKGFpnBB/fmUEwB1mpV9ts0RmDFrDIKnOr5KeULp2hqG5NLh53
	sfs1fhB81n/Obvmn0O8dXsVmvEgrxJ2Zi6Mv5EGyIomw/uwdhIFoB6hiIMkdNiSDyDIX5ChTr1C
	y6EUJ8sGVIWkXuQ4YDyIur+eL3HZOfcLq/ez6E1+JP49cKv/ciNJF
X-Received: by 2002:a05:6214:dae:b0:78d:4b58:2eca with SMTP id 6a1803df08f44-78d4b582f82mr20475146d6.26.1758017424855;
        Tue, 16 Sep 2025 03:10:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1ZEAVjtbKX71iAiDJ19Ofyo+pVaF7VLXJpCCJ2aZl++ji5oAc1d4XKZOcSuQMCS9y6Mh/8Q==
X-Received: by 2002:a05:6214:dae:b0:78d:4b58:2eca with SMTP id 6a1803df08f44-78d4b582f82mr20474886d6.26.1758017424433;
        Tue, 16 Sep 2025 03:10:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e651919d1sm4386662e87.126.2025.09.16.03.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:10:23 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:10:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm6350: Fix wrong order of
 freq-table-hz for UFS
Message-ID: <pjalx3o2lfh3g6fxsaw3beir7ufpls4j5y3f7zdsgopvpr4vuc@5vldxr6lvojs>
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <20250314-sm6350-ufs-things-v1-1-3600362cc52c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-sm6350-ufs-things-v1-1-3600362cc52c@fairphone.com>
X-Proofpoint-ORIG-GUID: Ii7TR2tNXNMMKUqTciP5b3y9Vy0oH8Re
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c93791 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=08tnehPgh3LRQT3fcTIA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX03CmBinaGZgl
 p/MidOZmMjjz70naGtOWQIWG/6odm9hYbb8FLaVIrkO2ei94I3C2wQeMF7eu1h5/qeNv8yk5ITN
 425LLugH10KZwqtXlzPc60BdhDXqxhyzAt1gAmS3aQ18aoKINtm64rP/ediVgBKhmLQgOt5IoE1
 w0H2TFc9TjHjXsc40kBfTWXRilbGGesHzh7wzaoiNTeD1QLchjsfUBlIYiP3N9Cxp/BWKYTmsT0
 0HyFn2b1g9hQVroq6+C8kDs0YaCnKFlK6d9ZcvW+SNfVru14MKLAXVcLJzMzF4mRgw6C2r1bUC/
 sCQ6FJTzB/qYcLGNBj9kkfhuqwQW9xy6jtkdNpsWxTatJ8DooI8fFJETOdIl0TT3XuoBfkdXkBF
 Xs2Sxf8P
X-Proofpoint-GUID: Ii7TR2tNXNMMKUqTciP5b3y9Vy0oH8Re
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

On Fri, Mar 14, 2025 at 10:17:02AM +0100, Luca Weiss wrote:
> During upstreaming the order of clocks was adjusted to match the
> upstream sort order, but mistakently freq-table-hz wasn't re-ordered
> with the new order.
> 
> Fix that by moving the entry for the ICE clk to the last place.
> 
> Fixes: 5a814af5fc22 ("arm64: dts: qcom: sm6350: Add UFS nodes")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

