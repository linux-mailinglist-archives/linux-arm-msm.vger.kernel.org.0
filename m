Return-Path: <linux-arm-msm+bounces-70353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF032B31524
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11FE5AA55DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72022D7DC2;
	Fri, 22 Aug 2025 10:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k8UIYOsm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D5C2D3A97
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755857873; cv=none; b=kr9KhNOHslycjKQaLxckuC00iIWG8IQtWUcz9iHlMwhR+/Udwr9AUnDRou62kIJFkoizFJTzksQskrrVpd+u7naBDAkY3jLFJvwl3iemxfhamkWAIpdOsdtCVB/j125JjUlUWH7FJHci7ioxtInqN+qkEqNCU9wh9KCi3yaL0sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755857873; c=relaxed/simple;
	bh=dwy1mShF1PZxzzBuHTRn8TQEplDFuzWD+llts5KfLfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhYMn91NEI9jxw3gudTMMb6Qgch/vWEG20ajY91BrMDP1yxkt9Hg/dVFcmixx3zv0YmKpSBToqpDjvhDA7ghTD2HaRia2XCKtvHKtbDTUCPaA1L4LgMii/ZpUz3yKwm4rEwtQ/3CjCL2VVYt1PXRYjl1W65OCydSMHgxFNPu5LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k8UIYOsm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UHim000978
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iBQ7WvE0H2xSgLFqIELm4rfB
	EkobKCDAjN2aokgsXOY=; b=k8UIYOsmVWWPINPoQjHFKJTHAGxOoDe3cNAYj9+b
	drfEsEEzIHMUY1Neahzhc+zSPKELpQ+0RopbuPjPrwMyQE1v3O2HpL2SgqxZ4jxy
	0+MmYQQ2Q1HXk44thJ+WfZrOk97RskqlJIk2MHgEtKxV2uQ9CSls4ijhduG/UFH4
	WA8KRvh4bqfFuOsJscNGIFckCh6t97OftvcYk00BmFgeD1pN68rxwfXojTNv+5MY
	ozHmekQGnPpgr7MFlJRz6dfj7MvdRvL8avySHJypxL5kNuhf3PBbIWdNbnp+N7bc
	4cFz4Oxxk8+/srrQAFdkcp30TeKf7V3sHLgZtm6x0rMS2A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5298vht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:17:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70d9bc306e0so8891726d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755857870; x=1756462670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBQ7WvE0H2xSgLFqIELm4rfBEkobKCDAjN2aokgsXOY=;
        b=wkm2raIB2Rb5svpW3hQa5lX8IrdBWj5wPAsxRWpGjW+WWN7FuoX54Vpaf9BaAjovnN
         gA5ncOLdL9cjzMGkDhjKzfkR5xkmQ09cb61mKx90OgXAEr5p5cWGjxqbXhMrB/fsbbfD
         ybxvdqlzWeJm+qlV/dn3Rqkn+wWyRc8liiz/FuAyTUl7EMiwIYaNKLXEMgKqaQJkoVp8
         ERr3gDcQahO4yPDkPcsuuGiqlWEvGKymTSgp4uWHkVwwHiy4VRg9MMjzKMG5VT7a2Tg3
         sc+DU1Q3jmby+go6lhJke4OSgndFW+LBrNe4l8YOqumILvUxEqC3lI76VuqmCdJxnVPE
         Grrg==
X-Forwarded-Encrypted: i=1; AJvYcCWrl8BxQUoAZvnqN7Lc0nU5hM38XN1vv7J6ogQwSKscfLtnLOpjj1p8bwPejzPXUOB8UCHqcmqoiZGzjxKA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4RkgXwc3gc6Fd6xIA5J++zect1TNZ35zMoIbZn6RsVk4JRbeE
	Am4Hhik3P88aFKbqiotQ8oCPVtpEtn83fPcYiqTnfNTeZ1xohVveV/tCsS2DgBraw/0VIbLpa2m
	SN6rSIjOzHnXG05FaCo1lX1+CgupEg54adU4yYHI/wRR/sD1oSnSh8G4anz08mfDKg2FX
X-Gm-Gg: ASbGncs6m51L6/qMvwESZDkADnYNgqE8m4T1bk9geL+0pxetry+stZDN1k1Nzq0L2DQ
	bgLW+48ffPk0SqXEj572p2lo26ehgQ2jvby8g4RKjBg9BCIfHdyOgf5yXI1UOldjQCl23D4DJfW
	iuXOMFn66V4qW1Yi2vffA6sV4SDDGLIvaRJeF6FbKDAaXOhKF7zH24ywJPHLr83EWVZXJUEWpwQ
	dX3Y1aT4U7PzeY3+ucR6mBqkn7nXYA1eVLZWyCKit+r0bhjmYjMABr11XWU85c07W9LbE/hh2ok
	s5GonVXkkkZQqeRG8pljHbPM599s5ywAp+u0/q1270OaD3Q2alhcv2UbDWq2ISsOY5KPePAJa4D
	BQ07Uks3qoUSO4/+LlpeWSQSO+K+gVXJrB8t3lc0A9OoKt4zA/jGo
X-Received: by 2002:a05:6214:3014:b0:70d:6df4:1b1d with SMTP id 6a1803df08f44-70d972371e4mr28644696d6.58.1755857869914;
        Fri, 22 Aug 2025 03:17:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH62oAsAMsiUv97NbT9YVzJguJ02slvA/bRLNpNdl+mlKb3ebFjncfo2wZhMvsCIXsDoIBaUw==
X-Received: by 2002:a05:6214:3014:b0:70d:6df4:1b1d with SMTP id 6a1803df08f44-70d972371e4mr28644476d6.58.1755857869279;
        Fri, 22 Aug 2025 03:17:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55e0281cf77sm1536535e87.135.2025.08.22.03.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:17:48 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:17:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/16] arm64: dts: qcom: sm8550-hdk: Set up 4-lane DP
Message-ID: <3dt5hkmi7trwyynutgkn5r3e3zips4vouhdp2fsxu6fiw44sef@kgxoyyih4tsk>
References: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
 <20250822-topic-x1e80100-4lanes-v2-4-4b21372b1901@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-topic-x1e80100-4lanes-v2-4-4b21372b1901@linaro.org>
X-Proofpoint-GUID: P25OSvlNwwOKXUzAeeRTHLvTsVpXkkB8
X-Proofpoint-ORIG-GUID: P25OSvlNwwOKXUzAeeRTHLvTsVpXkkB8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5r2ArpPQ1kWg
 ARnIQmoMhyQxzuaSViZaVmqYG8RKn0k0I7/HTrQSDs8sPDYidkzyO8nt1iUvnoLCEOi8LHxUMKx
 fTHqr6N09NyiP6pC+O/Q6d3WsN8lQYbLzBRhWjNTAL73io5VLBojfIKNpnoj94c8xH+GONpH+RG
 vWFocdK0ffSB2G7O4dCucbE9C8pxYZEYsmQUmIP/P9ESf0L0XewQBmq7XxTHpRcV05xAwENe1zQ
 TgXiJPSEhIQvWkTe0ZenpqEv06xxWtMVlKXNjOgiTjbVelN2hy20qpvlbrR1zXB0cZDheF/6gYK
 hNn5/b8nMhFebCiIowtfkKescmNJw2PrJYYxBSGuFy5/bjA3ea45FfI4E+CeUyAkkerZDb/p79N
 MzHPLjq9M3FdzEs+131zcL7Mg97QuQ==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a843cf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=YJrRJlPzAM5hdBvFenMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 11:39:16AM +0200, Neil Armstrong wrote:
> Allow up to 4 lanes for the DisplayPort link from the PHYs to the
> controllers now the mode-switch events can reach the QMP Combo PHYs.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index 9dfb248f9ab52b354453cf42c09d93bbee99214f..6c2c9514a7396a8b75ebe24585b47571c74ff568 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -1003,7 +1003,7 @@ &mdss_dp0 {
>  };
>  
>  &mdss_dp0_out {
> -	data-lanes = <0 1>;
> +	data-lanes = <0 1 2 3>;

On most of these platforms the data lanes between DP and combo PHY are
hardwired. I'd suggest moving the data-lanes to the SoC dtsi (at least
for USB-C-wrapped DP controllers).

>  };
>  
>  &pcie0 {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

