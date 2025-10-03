Return-Path: <linux-arm-msm+bounces-75948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4F0BB8335
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 23:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 477C63C74C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 21:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E2A277C9F;
	Fri,  3 Oct 2025 21:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Csy55Eek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD907277C9A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 21:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759527117; cv=none; b=RhPTRJxgHra1O3Feuu5pNp2rdrM6+W5ffylH/0kBl5UGOnez/bpK1d7JZvftXj9UfexgP0+Eq9FfqBAt486SqaYZ8i3UjiFK4OJcqhW2289otxVRkHSRirJZi8aCd4HuZYbB1kTRPbOkr3K7RuimysriUCJmIhhSx/Il9bx1/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759527117; c=relaxed/simple;
	bh=wm9ZU493L7nyZfSKRNprptA6DzCCwoVPpIC7wpQR9KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPb2lc8mQ3A+VouCA7JDxV2OXh3XLwQWVbxZlggFz26WWseawE8HAzQzdH+M3SXV2eiq4kwfaXcPl5RPP9L2Ac6Pw11uuXwww3WZ0fFoXm/qmZTWOFQ+X924g8LxMXM/nEtnIv68JBfEd8cZJ4bSIspDWnHkUOKiLwc0LSZRxNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Csy55Eek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593AUrFp023589
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 21:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oaNyogpft37KQqjCqwX1Jc8A
	KV+C13HugtmRlZYmt2M=; b=Csy55EekRWLAgtg/vag9/RrMegNMhD65SN7kfmSQ
	TEyTyl4lyOcak/TOB2Qy8ezSOlmb0TnWl15RXKy8gDaDx3Yv6lkMajRu5N9oTPCL
	7pm9VZnTjSb1QBY3GrHEkgyjVWdwOL1sTwHYYOT5GJ3A65MejLpebIa6yBFhQkxO
	3x3n53HgbHDYo6lwo4B4EirAahH3lkXthVIsQw5nmrTHv4QSrpkGKmbQsVB0v3Gb
	mAIovm+ZA+oGGD6vNixLjhtDvatlQLZkO+hEXTkxNZ+EpIAwG8Ta1ystdYY/miyl
	AtsyIYN6Z9IkXAqdlsEr1NyruSqS2TjroaBkDmINuidNAA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a6c1sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 21:31:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4df7cdf22cbso97425941cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 14:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759527114; x=1760131914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaNyogpft37KQqjCqwX1Jc8AKV+C13HugtmRlZYmt2M=;
        b=D7PiKuu+VKtvRfWsu+h9dtRW8CNdroDTRWDp2XuP9mN0dMHnWEdQ99iwMZwBmxA67t
         y+cWD2f7ThXy2D4CTb0S8Mr/JpQv6Jnqbj/wUTYKEdYJ5Hyz4lZvL9rIH1c20cGoJC94
         Dv2VUFoCxswWuxjS2tYnEQDb/s5LdsnhPcL/ZiQebA9oKSIWdMBhjtjVz2ZLPmPPW3BI
         8JVc7bU5tbGEIbU/TOuRR08/+cDak7SR+HhvCJ3wNTZR1C6IoRhzJ8Y2wUkVBaPtAyUC
         834S/HqMK8S3/rZ0kPfPIkekOJWXTz5dsNI/qIdFvb2qDkKzjDms1qaGBXinz4koMq1U
         K+ag==
X-Forwarded-Encrypted: i=1; AJvYcCW3OqYUc2A3aa1uQvZqeyacEQblxBq6fMCkSpNRaKzp2pbgIN4r9sRv5hh2jMwouvwkCft06iojXq7jDdH/@vger.kernel.org
X-Gm-Message-State: AOJu0YwCRf5Mu7vfdXYzqsJyTF0tK3clzpcH+n+os0iXm6yzDdgtLbga
	xcsCpWLncr1gUbKC45ABk2XtdsGf8ojqx0Aa7Hm9FJ6yeleC4ydyLxy9MVYyN2RoEcEkvdslBtN
	xNuafXuAi4puX6WgY4O7+uEednAOVZvex05DLQvkB/XRNqr9LhixuSrNlv9H1hPuGUC9V
X-Gm-Gg: ASbGncv3et1C2tH3jqmGOhAeuxI65x1VEAdm3ZKS61SrkLQ8qhf8X14MRtAh5293rxV
	c4mtqY8Sma58VV95OOLbx2zh0EKhRnZ0/Ltf3r2QVyyywda2TaNdyEfEp5o90sl9sQVZpCYAj1g
	B7mzHqg0di4oQutw9anaDPCOOKbkrqEd0oUH9yetIMcIFhk2Ag9RiJZCbaPw9Un5RYLsIXLUOib
	cHC5gY/KBhezDmwvoFLo2JB1WKPapPQjzn7cWcW8YebVkRCmfH++9uqCcAmwnS+api38kOBQw5t
	+urrfUqF8b2IeGoYcQ+jz6K2QRFewWWtSH5m63AoDYiqZMvKVHinTvuIskP6zOCaBG7d1ZU5i9L
	iJqIrckDXy3mF1uSD4hNemNS9ceg7yOfyU1k4iMZGHESAX7hLSWByXZ8YqQ==
X-Received: by 2002:ac8:7f89:0:b0:4b7:a1b6:cf29 with SMTP id d75a77b69052e-4e563c5e765mr134806511cf.41.1759527113745;
        Fri, 03 Oct 2025 14:31:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8uln0Wko2wLLU40Gc9Vh/f3dVBHUalTsis+iK+YSQPZfzQaGN1q6miGwZWTtBH0BVOLKuFQ==
X-Received: by 2002:ac8:7f89:0:b0:4b7:a1b6:cf29 with SMTP id d75a77b69052e-4e563c5e765mr134806201cf.41.1759527113281;
        Fri, 03 Oct 2025 14:31:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124b4dsm2186492e87.13.2025.10.03.14.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:31:51 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:31:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 03/11] arm64: dts: qcom: sdm845-lg-judyln: Add battery
 and charger
Message-ID: <fsqrhnuqmckxldsjejmdszlcfineaglt57g3vgm7fxwz2y45pw@avd5pf5beo7r>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-3-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-3-b14cf9e9a928@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68e040ca cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=Gbw9aFdXAAAA:8
 a=PAAiZjNMvmahcd2zdhMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: ZQ3fCvwAreqRY-xyhkioBbUQ79AftPfq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX1oikmSTKiqM+
 1r9ZaOVLWrLwEKfau3QDP7B9jOI7kedKPiTDvColxtMktSAVrXF/D6xBQiT8pnQ0NynAJVqskm4
 vu+TklO12oKnKEZ0WVkpSforOAUV35wiERQp0D01v/1kRrtwdruxyO8PnxucxikyzEE4F7gvJ7h
 YvOkoK72dCIhW/l9BulH0Jcb7RfH0niSUZ8yn2SyyX2rPJLflZCRbfF4LSYsL/jjXCR8hqx7n9V
 /kfqNEYtBBSz+jyF79sZkNAj3ioKFLA9WU3A6hCY1gHF5sVyU2yAkcDfVbDQ9or3OD0SvDuJYAU
 p33BBTw643H+B1MCnsTT4ptWIqOkdnnLd16qXyj1qFCcCZKTtIZ5lrWKtkYPKZZignWb8vLVGLC
 QMLgi8OcuPtVvsRLuF9gnBe9tvbWLQ==
X-Proofpoint-ORIG-GUID: ZQ3fCvwAreqRY-xyhkioBbUQ79AftPfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

On Sun, Sep 28, 2025 at 10:05:26PM -0700, Paul Sajna wrote:
> From: Christopher Brown <crispybrown@gmail.com>
> 
> Values based on lineageos kernel
> 
> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-battery/LGE_BLT39_LGC_3000mAh.dtsi
> 
> Signed-off-by: Christopher Brown <crispybrown@gmail.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index f91578ce7195dc3bfd1ba0a722fb48f950816246..df65b0e32b195d2f668883542cfcabbb9bde8204 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -37,6 +37,14 @@ key-thinq {
>  			interrupts = <89 IRQ_TYPE_LEVEL_LOW>;
>  		};
>  	};
> +
> +	battery: battery {
> +		compatible = "simple-battery";
> +
> +		charge-full-design-microamp-hours = <3000000>;
> +		voltage-min-design-microvolt = <3200000>;
> +		voltage-max-design-microvolt = <4400000>;
> +	};
>  };
>  
>  &adsp_pas {
> @@ -57,6 +65,11 @@ &mss_pil {
>  	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
>  };
>  
> +&pmi8998_charger {
> +	status = "okay";
> +	monitored-battery = <&battery>;

Could you please move status after all other properties and insert an
empty line before it?

> +};
> +
>  &tlmm {
>  	thinq_key_default: thinq-key-default-state {
>  		pins = "gpio89";
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

