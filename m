Return-Path: <linux-arm-msm+bounces-63472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD077AF6536
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 00:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B73063AEA89
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 22:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5DA246798;
	Wed,  2 Jul 2025 22:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wz3TSuHy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F2423C4F1
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 22:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495353; cv=none; b=P2As6p4P4FnS43EvX0AXLS/hoz7rFYYiGr+js8Xdk45ej4PFFXBRI/l3tRQQCLrR67P2tGBI4Qy9JdE6PdIbhvXygs0rlsG0HB01pTbaww8axUlyswksUjbWV0SbkQDxjqtrwJhDVZw9utdIzCaSH5+6epYBVdLcKT5RqRH8q+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495353; c=relaxed/simple;
	bh=up5bIfuRe1fh3Im2a2gPebVavaYz7/DHfHtuntIyrf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NszH9sJnATfSZHFR+VkylP50b0o6FeHI1irsIvfYvd2+dtW3dvnhjomcQhZAuEaMTNhHMmIlaLyuNs5NxSGMwe+jLKr0jhpWQQSfH/ldmsU8NX//hfu8rHzrEqNPo0KFvqxxbDc3JYnhuW4Xq0ESG5HEZRud2djcK0ZO3Zt/lhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wz3TSuHy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562DR7Si007338
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 22:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BgDDI86k+9nrqehhROmR+AQC
	x3airBLaLzyH+/CSltk=; b=Wz3TSuHy8B9lSuyMjnWMsvL8ffmgZOBUjpAb9o+B
	WxvSXCHUXubtjRRdR8Hwf1xFjBDhL4n+XhdVygBtclHUPRU6vCW1Utc2QjFVGEyv
	EDWTZd4a2i42N8SKSwIBMNFqf4tlzdvsoinqos4/7/6Wp+G02mGS/BKtZYEqptXc
	fFpaqvJcU5pUSWI9Rh30GRqNYsEvErvQ6IzXWIVtx9HZc6vuEIaMlZXtABs6+a35
	g5vz8OPC3uJcuGso2lHWIfYtSiP3I3QKKcg1l4bKfsILU2ZJCk6G2cvkzdKSXcTh
	3177S7rczzTCCKpAyZPFKaeOAxn4r5A4zXgNOBqt4F0Agg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jjny7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 22:29:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7ceb5b5140eso1111785585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 15:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751495349; x=1752100149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgDDI86k+9nrqehhROmR+AQCx3airBLaLzyH+/CSltk=;
        b=N7rRtnXSseyPskZOYTyl4c6C5lT86ndpLcl/8tNzanfukmQHoRcKYI/MqH0Li6pVfk
         oGnJu1XaMFAca87ebAwLRuEKJYUoKjWZqYIxC9k6Q0HXz7h/sacCkjh6oi6/PPEmuqaG
         4RC5vP6h9YUFcCIcu+XPhlQbpiaFXoZEGsOO7W9CE+c7Y0/FLOtKOIOOCXynRdELNBT+
         BFHGij0bAIhfcD43Sb1AsBxWrRt3NWPbKKjaJgT6HL8/i0olfV6T4DgWJ6491bFTpreH
         1QSjpe1bNUF8faBoGfzdOIB7yux3SLfLwgc53er2vzBJ8+QrHmkZXc/uXrhDX0GErCo8
         4Haw==
X-Forwarded-Encrypted: i=1; AJvYcCXNdJgi8vG45StQK/D/6jTNc2uAA8Q+hEOb3LR6wRnuC6XEfVbupD5TT88+mFN5B7q79G1AWTA7EBTb0PbS@vger.kernel.org
X-Gm-Message-State: AOJu0YyGsYAf/+0oBoxKc6c5G4uxEuWs+VIMTlO9+u0oqxgrrXcvHiHc
	b6fmV/xClV+zCHfK1rhLd1dAzgSpUfR7QuqIwvT1ijlGb7rKop2B+d80dPB9vJPezxb+tLP4zaD
	tiKRQQPexAga4Wcq3netff2nNjvR/0w52ruv57byYRinpvFWA44Q75zwYVg3tvIcGvCm8
X-Gm-Gg: ASbGncvaUNY8hiAULVY5phZkn1hAgI1FxSzHY0LBXqDN4j9ayeTCE1muUKZefCoRPDI
	Hki0HwHVwgTsgThXmxmU2+sJ8zllfLW39FsR2bMhYR63M1+6ljUCaFNnLoED+07OPmxWuVtWoY7
	YZ/UpKiy6ccc7xj8YAcSMTwHdR5N19Nev8tCUQ+WocBKRsqPa1JzOVJTCzZ9g3Q2uNDy8VICZ/X
	gk/kLVZcc8atKdjovwb/4lusAWBDloFpnzBU5txZrpXMmcFW6RC+AJAWwCzW/Wyp7riAYIG0JZ2
	TuVeZNuuPCuDQCqV40TK9iWSmwZRFkm+T2tTnPj/dFEHLQ5CFulA11BNK0vBZYLzsI1wdUhV+pV
	qwZ0EP/PE4ogd0oBKVKQETyFEYuPmPeWcUKs=
X-Received: by 2002:a05:620a:46a6:b0:7d4:5c30:2acd with SMTP id af79cd13be357-7d5c4717717mr613056785a.28.1751495349310;
        Wed, 02 Jul 2025 15:29:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrSVTOJQ9y1rva3UBmjLIEBviVC9kwZsRJcNapTvyl3wOwWuQm4n9kgbG/8VBXUhQbv5kwMQ==
X-Received: by 2002:a05:620a:46a6:b0:7d4:5c30:2acd with SMTP id af79cd13be357-7d5c4717717mr613052785a.28.1751495348903;
        Wed, 02 Jul 2025 15:29:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2eff7dsm2261580e87.246.2025.07.02.15.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:29:07 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:29:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: qcom,videocc: Add sc8180x
 compatible
Message-ID: <mzmer4g7df7xqhnstpfhyzcm2irpmsk4iwtx6esjksp34lpkk5@76lrsoyb5cp6>
References: <20250702-sc8180x-videocc-dt-v3-0-916d443d8a38@quicinc.com>
 <20250702-sc8180x-videocc-dt-v3-1-916d443d8a38@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-sc8180x-videocc-dt-v3-1-916d443d8a38@quicinc.com>
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6865b2b6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=_TNEKbHo1ymzoaDRxC8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KFYgdk5oAz0JpIWEO5GvyyiqjW9shc8T
X-Proofpoint-GUID: KFYgdk5oAz0JpIWEO5GvyyiqjW9shc8T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4NiBTYWx0ZWRfXyjuaHmNeu7HN
 jQCOw1SGCZ6xKzBiV7H9eYHzoj8+9Qxvv8c/Z9us+hjvfL48caMKga2VM3+yRLXzJEkdbsbyrnt
 cE6NV5rkLkZ7b43ScI2FRF0GNv0syfvohm2++xuc8F5GgcMChMbDvDbvpTzb6+o7YOTjpTiFZea
 Rqk9dJcGfOafWx+BLgNSdVtYgK55Z5ZD1Embs1g8eVCVDw0YGlJhCfaLYVvOpOccjkCRy7KEc4/
 K7/9ew5KM+s2xeIedg3G21Lk0qrFvR7zpEU10NX7iNPBw9zs9wtHGt9faIbKa4PJYPZVgqvontI
 STHSfwurayoa5Cy51W+8C1yh6bk0f3dUhLy6Ten+fKYt7BG4YVnz7I+IKCzew+VFXr8693pSMFa
 FaRlm4hOOHva5H4VipStkZJU6TrTrARzXSV1x/K0M0LYLlFBLm0UgJpNR4QDlDtcHOsjxe1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020186

On Wed, Jul 02, 2025 at 08:43:13PM +0530, Satya Priya Kakitapalli wrote:
> The sc8180x video clock controller block is identical to that
> of sm8150. Add a new compatible string for sc8180x videocc and
> use sm8150 as fallback.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,videocc.yaml       | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> index 5f7738d6835c4ba999402e163fc85a07e3a47a5a..b490caaf843243a7a96395fdd2b99972a45679f9 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> @@ -23,13 +23,17 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,sc7180-videocc
> -      - qcom,sc7280-videocc
> -      - qcom,sdm845-videocc
> -      - qcom,sm6350-videocc
> -      - qcom,sm8150-videocc
> -      - qcom,sm8250-videocc
> +    oneOf:
> +      - enum:
> +          - qcom,sc7180-videocc
> +          - qcom,sc7280-videocc
> +          - qcom,sdm845-videocc
> +          - qcom,sm6350-videocc
> +          - qcom,sm8150-videocc
> +          - qcom,sm8250-videocc
> +      - items:
> +          - const: qcom,sc8180x-videocc
> +          - const: qcom,sm8150-videocc
>  
>    clocks:
>      minItems: 1
> @@ -111,6 +115,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - qcom,sc8180x-videocc

Is there a need for this? Isn't it already covered by the SM8150 entry?

>              - qcom,sm8150-videocc
>      then:
>        properties:
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

