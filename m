Return-Path: <linux-arm-msm+bounces-73464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D982B56D6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 202CE3BAD00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE8A288D6;
	Mon, 15 Sep 2025 00:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZD30o+P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C5E17A303
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757896437; cv=none; b=tBCA3gWnOs17WQ5M0OqpY5Hv5ZNKqH7p7f/jB4YCYyTRuEkyUM3uL1/s9F+FeV78AaVWfsdGtUfjZqdn6mp448byZA/A0FUG+qo1DmMhWdGf0DS4u0dJ+ZF/9RiH+L4hhcyujj2TvttnzPFPM4doJHxmwW44veltnewrskCPQUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757896437; c=relaxed/simple;
	bh=d5LJuL7DuXUvIfq5ipMR2VXHr9pFqwhZ+y8GKc/qdOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVDT4D7a7GzSvPgeoASzIpYTex66gs2YGSNmzVGFUUBR4ZfOGfoZB6RziYhJ3hVXu2h+yHouMt7Vubfy0k1FHMO1CIRkNQXn7Zh9QlpJzmOUiS2I5RJ4sl0w3R7vQbCEdXaa+hyeUYsy3udNf/uiJPJ8tcKcO3Anflq8Ebcx3kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZD30o+P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ENAYdH013712
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6K/VpkD4TuvbK5PqWkaGNmip
	rnAsqrO40m4H2GsRV3E=; b=OZD30o+P+gMV88FOcWGpocCJqtkKmVqj6MZk3qsf
	/3LxyzdHbbxdPSLY+Dtn7OGAlsDwTxWi4IKy7x+0QaCN2wwUaK3TK5khw4mUby4+
	56TdTa5c01tz3XiRVQGj3PEbeIDbeRV8diuTj4l2WD+WI0mYdd2YxGah4hPF3LlG
	WaiqWXBRQZu8XCV8fzEkmn6dhDBXfRLEnL8REbbGZvfOOa3013aQnHgbupabNKcS
	4rayxMyPYGJg/gEpQk/Ts5RXYlRNgpcibb604W0c1NYh02EbASvMSM1DkWlpgI2z
	c5Rpw816uiKeyHf4DlYNzrRVbDEptxqZ/hrg7wtZ0wmeCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqpst1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:33:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b7a2999d38so9688111cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 17:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757896434; x=1758501234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6K/VpkD4TuvbK5PqWkaGNmiprnAsqrO40m4H2GsRV3E=;
        b=OPSqRpFLRcR+b1oYeqoFj49N2OndjfHcwGVbopSBMoZa7OOjhtZR2pZPvWkA2I4YXs
         4XE5w6SEMsrx+XYZHrNxnSMPl+hn5ehx20nIIP9lZf05Z1OAv7FyBZhtzS5LX9ciPDuR
         eCk0EtEORv0p6QIgg70ZefnJFR0OA4NG+jGv8Ldg0u2jHcDEMqaDv5JhJuDaUbswZfh4
         ZrHzAuqB1EyzktCWjMnqWbwXneIaeDdf7vZmj//Q3/5y6DIK6Ccokn+OB8Hzaygvxt/1
         qf5Qb9jiXcGh9ok0LYj78N8vE+Dx1dfvtMDsHmVG6fAlA44iJH3upCRi0/NilqjzhnLd
         ISGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6Kt583j1DSrjePQUTW7ofF08SpKWmAqHiw7nX29i5ZOmYSgpATvz7fNtsunSOmsg6a46vexu7C2TeAWAg@vger.kernel.org
X-Gm-Message-State: AOJu0YzlMRBoEH7YS/fKXhQGeoyOhJvuMaPKMz2YrEMT/WOP5/l1T99j
	S47reA+boFdjkheXz8eHFxKONAVyl6wXFs6LMj4TOcF0toznOPekYD0n4yRrG1ilT7ZE0Wq9Fy3
	eLovZod9VAcVCD8X3eWAiL0B/Iyw21GMAPqZsX6wBvu9j64WLg+buOOmHm7uq8uGf3Tec
X-Gm-Gg: ASbGncsWD3Q8LJC8P0rjsPiqmd0S7IlbLAVRSMi0rIId4V7+IIHJCsBwBL9RCA3zjmQ
	V1aCdzjGkfTs+Weqyp7r0EkQAv+Hjla/LFgsHwRjFch0weqnyT9eYbSy+tFVlr7yhAjokkHBm9Q
	twxC3sLY48XI4XrJvC1//4+eDj4b3298s87T4LpNfpAPhfyqJmEdEdMaqoO5mpStybaIVkXjkgH
	5Sxms4ZZ9TTv3OxkNIzmfG37IFM0sUOuc2pZdnVlrsjpK2mpU1XqQLQKDWZlm/1EOuWCjUOujJe
	nmkI0cdZ64Sw+lyKGVPBu6PM0WndrrrKZ1+qGOMiBLJyoHBBxmA889J75mfD1yCtQC4hI1NIBQ3
	3hrN75T7zTG8R2rZz/OWhKt48WyeXYmX5y7XOztVGf8wxxrz0EeCA
X-Received: by 2002:a05:622a:a16:b0:4b3:a2f3:47f9 with SMTP id d75a77b69052e-4b77d151f25mr148354411cf.62.1757896434152;
        Sun, 14 Sep 2025 17:33:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFplQatiVjk8b9qHlsT38sNdyQt9MMBZQrsYKu98S5KcZiwsZiUSOCDtIlLFRzby5KjL3eVpg==
X-Received: by 2002:a05:622a:a16:b0:4b3:a2f3:47f9 with SMTP id d75a77b69052e-4b77d151f25mr148354251cf.62.1757896433749;
        Sun, 14 Sep 2025 17:33:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-571a547ad9asm2284751e87.65.2025.09.14.17.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:33:52 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:33:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sdm845-lg-judyln: Add firmware
 nodes
Message-ID: <yneazsozjexv4b7gvzcdecv3zdzzbbscqg2vil3czdeqtdrdbf@l73eggl6y6uc>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
 <20250913-judyln-dts-v1-7-23b4b7790dce@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913-judyln-dts-v1-7-23b4b7790dce@postmarketos.org>
X-Proofpoint-GUID: idStLy6rUvmF-STfznH7kdByB5GpVPPr
X-Proofpoint-ORIG-GUID: idStLy6rUvmF-STfznH7kdByB5GpVPPr
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c75ef3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Gbw9aFdXAAAA:8 a=1lR73kVuVWel2aiOKFwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX00u0XEdGqiOK
 cAO0s4osaW6UPWaoaFGnbCJGdXL74Sbl2mxa4W8LLYt1RhWkdZAUFfU8MFPMqlspeFNVUNOkYm6
 YWpsXvAba86ksCCN3lEYVs6HP4IDr5jGOuifAvKZ6PNoHo7hQnWjl2Ju3bfV9o3XV+YaicSHw1E
 7DISjcEfpRdZIAv5+PVv3ZKkpdRt/96lSgHZPWI3UyrtlNECvZ/1WiTB2Xw7h0bDawb16QJlbrv
 iqpxNesObSa7Cbwi8jtY5wpUq6+Bvu2QqgBW85hZLbpp4q3MUcyt6A/qnGfzp13suiX0Zs+NKbS
 g3H/3fmNyrsc1fAhO6yFHc1sHqkCQA8oyDNbPK0nrM5nCjhaEyFMVWgQeOpYJlS6bugsmaTb1FH
 Q+A1EDFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186

On Sat, Sep 13, 2025 at 04:56:40PM -0700, Paul Sajna wrote:
> Firmware nodes added for ipa, modem, bluetooth, venus
> 
> adsp and cdsp enabled

I'm not sure what is written here. Please describe the change according
to Documentation/process/submitting-patches.rst

> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  8 ++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 585582ff4e0bbe8c994328278d5e5dd3a280ddb6..cc1c78162eedd50d30a70810ac3790efe6c0492f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -173,6 +173,10 @@ &adsp_pas {
>  	status = "okay";
>  };
>  
> +&cdsp_pas {
> +	status = "okay";
> +};
> +
>  &apps_rsc {
>  	regulators-0 {
>  		compatible = "qcom,pm8998-rpmh-regulators";
> @@ -483,6 +487,8 @@ zap-shader {
>  
>  &ipa {
>  	qcom,gsi-loader = "modem";
> +	memory-region = <&ipa_fw_mem>;
> +
>  	status = "okay";
>  };
>  
> @@ -683,6 +689,10 @@ &uart9 {
>  	status = "okay";
>  };
>  
> +&venus {
> +	status = "okay";
> +};
> +
>  &wifi {
>  	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
>  	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index fae85d4c1520e044d8166bb22a8f5762fda250b2..1596a3408659323d60f1b7c395098ed628782dfa 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -70,6 +70,10 @@ zap-shader {
>  	};
>  };
>  
> +&ipa {
> +	firmware-name = "qcom/sdm845/judyln/ipa_fws.mbn";

Note: it should be qcom/sdm845/lg/judyln/.... (or qcom/sdm845/LG/judyln)
Would you mind fixing it to follow the convention?

> +};
> +
>  &mss_pil {
>  	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
>  };
> @@ -190,3 +194,7 @@ bluetooth {
>  		firmware-name = "judyln/crnv21.bin";
>  	};
>  };
> +
> +&venus {
> +	firmware-name = "qcom/sdm845/judyln/venus.mbn";
> +};
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

