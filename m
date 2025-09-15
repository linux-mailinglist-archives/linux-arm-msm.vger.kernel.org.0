Return-Path: <linux-arm-msm+bounces-73467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4340B56D74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FE5A3B26E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218F31C1F12;
	Mon, 15 Sep 2025 00:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNWjrptQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E89A1AAE17
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757896555; cv=none; b=cBIh9aVw+3JYNJ27fZ6QlhL8eBmWuHVGt0O5R5Li587y0bwBiMy3yCyg/VfZsgv8lzr5cWytqbc1FqiIESriILh/0FnTEN8aDOJmkLEZANMeqFNhkSlkZCMW+pc20JAfToDvxBjuMtIRxb97Gd2bv02qJ49WFJoazM/9w+OQ6iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757896555; c=relaxed/simple;
	bh=lSZxC9QJIX+S9xfCOuzcDQtUiWjlEROk2ZCchUnn7kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDl6M3s3j3iG54sUYEDwB/jgrMF6br6f5JemJCcWjB3cV2iTMV6D44HhoCB4c4LwxJw1MfT9BlPUSrYHpBAc875Q5h2OFiq4cdTPsdRt8PqSa4KMQZRGgRdnpKeb80mXhnBDPLkA4tTBZIHdSpC/YNiwILCAkErRvxhW1Yz5Tn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNWjrptQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ENU4AA028080
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D08sD4breznQvAIPhUVcgY9/
	ePdboBCRyWjrlln0Q8E=; b=kNWjrptQNGBQAPM7mziEVEezRtYX4PcgYn6/ZLIQ
	jSBU7ubKYHrCo6EHBWxE6eqm80opd62fs9/PeSL2VB+vjV3WIanCKDsOVAtR/nFm
	MmajUPXTghhS1gW/f+83Z18pbdIsvHcE9p/nIBoDyRPimjDsW1dJ7O9GGz72tq1M
	UEIVOZ6TCi9AaAOzs9qdYuYhlk+ZQhEbsl/RKvDBLGdwJj7o92xTvkjx86UrK2qA
	x/KaJoWp+xTw/jd2RAaNyAYO1gipFIEHDHJKZMRLzrJYH5wm+lk7bj0AUkRpU2q0
	vldngBdgKk3WuyLrTe+5MoyMKGnnk/JkMz2KbU43kP4rNw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49510aay77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:35:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5fb1f057fso52949061cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 17:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757896551; x=1758501351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D08sD4breznQvAIPhUVcgY9/ePdboBCRyWjrlln0Q8E=;
        b=ORtZ7TmFY0tIuVVuTfVT0cuqqqWnevTWcuGGQeiiuVF6Kl9wqfRTOLXbqDKFhcYMAZ
         wVj7UBNv69v04EyzMlnH9skDsytvV9Yxvg9zHo2RyrutsOLcBKMIQlappoSEvMHePHPU
         3lbbUUoGypfihm3gushYh6q4X1f8ZSZbmw27zaP2Nj78Cpuxs7MO6HMNWa9MVdClA7tC
         LmYhewBqA6vlqkzvctQVwWfqdkYVwEC2PYMbUw9AythlURf0rhri9DWAN+Y2QR9lkWEA
         Vfx/3Wf2YG6U09dLodwVuNOUO2v+L/OzOKXS7VgnhIDjsENtCj3r1yGtMQBQGHJN/lkc
         8WAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIcOVcDV/IBquefmiL16ziruNfKfUxgeJhmHqQV6GsqhHKY9NYkftIB+JaCvdkGM2R/BT4zcRVN6W19Ylg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2isld7p1ogt6ysOmsqjafcDXJqGBEjgBI8dWy8M3XdeH6JKrL
	ZUFVQ3H5AXAvldvpxkQf0rDHHw1Vn5arWz3yGrUgwnZiGIamnnDeSaX4ySIuBLE63jEUFtebn4L
	hpP4HhE/SytiHapX/G/6kdr9lQg6EPlqviy9XTZH3jbB5SQrKv4rEL25Qpb6R/6PRNBRY
X-Gm-Gg: ASbGnctYcRmX4+DgKHqtiP7W4WvXvfxUYDG2Vu4Fg9LqI/e5ahpZqwQVYm6C+zdce3X
	J3lbWCH44rVTU/yPllbuIBt+/azLllKLY0ehKDgfuHwAevAYILkcUdQ4rGbOq7U39uCac3JX0jK
	A9VKCnocBCY6+BmtyyBkLKGYsSf2wdpXk58zFYIkejgXcFAZUxLToT77SzWlpd/Xc9pz0qdxEB7
	b6HHMdYIZWmADtSHITpSEDnaFhR0cXGkHZaZdAL6weny88j/CmOy+pGlgd2t4kk/FjTFEzYWZp3
	b/cOKq5zO7LadKAV+LNqiofDoyUpohcIvso1ASc9ITdHw5RfjqiXwsJoTpDDUJpt4Q34xPQX2TW
	MAQ1jINj1LoOw2GmQLX/aAWedCFehrkTsELSEXwHjxkrEJzDZJjoh
X-Received: by 2002:a05:622a:15c6:b0:4b5:fc2a:f37c with SMTP id d75a77b69052e-4b77d0e25acmr108045031cf.74.1757896551533;
        Sun, 14 Sep 2025 17:35:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8SGKk0OcpL8EajdUw1gys0MsCLMCUQPEIfzZJKL+F8vFm0ZeB2KxlkNsxEqoPlkvAnY3b/g==
X-Received: by 2002:a05:622a:15c6:b0:4b5:fc2a:f37c with SMTP id d75a77b69052e-4b77d0e25acmr108044781cf.74.1757896551053;
        Sun, 14 Sep 2025 17:35:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1b491f4esm25403941fa.49.2025.09.14.17.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:35:50 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:35:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sdm845-lg-judyln: Sort and
 cleanup nodes
Message-ID: <gquntlik42knkhbe2lklc3pc2tnof2r5kszc72ugmguru2bwnc@t4mjswema7qc>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
 <20250913-judyln-dts-v1-10-23b4b7790dce@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913-judyln-dts-v1-10-23b4b7790dce@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=I/plRMgg c=1 sm=1 tr=0 ts=68c75f68 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Gbw9aFdXAAAA:8 a=ijzItukGkLEnUYRUYaEA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMiBTYWx0ZWRfX0wQBGwt4Wy/U
 yeEKz2VGnZSnNTlDg5QsqRfYaJF+69iJ3L5hcnfksaUGPULXoO03c4Yaav/SSt6ZEhs/9j/Xv5U
 nL7krmHdNyc/a6kQHe17aionoo2+NCQkJ+0WsSi22Ifz44yu8kjIOF/ectzhsnYoHTh976TPBFi
 Ath77hI+hKeFKAEFaTlWPOLSJrauBoXKNpxrEyRO9nn7FSfhuxTfMq3VfW8Zmq7lXn99qIS30ZG
 qLC8XcjWqJgJxgEFp4VH0gNv2O77vSfxDdpxh9rgA3OC5QYQHh5/mMSDaazSoFjuzEkwuS0NXO1
 M+ZnnKaqLFgxzc9d8HqwJT9W754GYscQthC/bhSHf5VD6ZtgWwi7x1gQfMTHbKZyErkkoMGIlwX
 7qyLByAW
X-Proofpoint-ORIG-GUID: HYwRtMBE_6MXGlA6huubckA-5Z97EEng
X-Proofpoint-GUID: HYwRtMBE_6MXGlA6huubckA-5Z97EEng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130032

On Sat, Sep 13, 2025 at 04:56:43PM -0700, Paul Sajna wrote:
> Fix style issues and sort alphabetically

Please perform cleanups before actual changes. In this case, however, I
think this patch should be folded into the MDSS patch, making the nodes
sorted from the beginning.

> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index 467aa0fd0ef3938e4a8c08b2240d4dca2f74dbcd..493b8554ad8ef083d836a6664435010ea915f2e8 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -75,15 +75,6 @@ &ipa {
>  	firmware-name = "qcom/sdm845/judyln/ipa_fws.mbn";
>  };
>  
> -&mss_pil {
> -	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
> -};
> -
> -&pmi8998_charger {
> -	status = "okay";
> -	monitored-battery = <&battery>;
> -};
> -
>  &ibb {
>  	regulator-min-microvolt = <4600000>;
>  	regulator-max-microvolt = <6000000>;
> @@ -144,6 +135,16 @@ &mdss_dsi0_out {
>  	data-lanes = <0 1 2 3>;
>  };
>  
> +&mss_pil {
> +	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
> +};
> +
> +&pmi8998_charger {
> +	monitored-battery = <&battery>;
> +
> +	status = "okay";
> +};
> +
>  &pmi8998_wled {
>  	status = "okay";
>  };
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

