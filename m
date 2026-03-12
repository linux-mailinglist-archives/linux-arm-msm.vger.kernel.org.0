Return-Path: <linux-arm-msm+bounces-97118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN9gFPEssmmlJQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:03:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF62C26C8CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 409B430C6EEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4733336C9F7;
	Thu, 12 Mar 2026 03:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NISpcn1r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQ/7Q4Nl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231C638DD3
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773284554; cv=none; b=Pgx0YnBXeKkIce9Sh/tZQwclGJP1XMt7UbAlqxrN0gzLiDoOqhPqaSFFo1IzCpgqX3HuBedpWEx3mMJ2Uti8xZbF2qzqGngofdT3pV9+RhfKC37ByFArDLRYFgo55rzhqY5Dy3PRf+FBJD3dARWz1Pc3bw93xMlHzQ+Y1UXAjaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773284554; c=relaxed/simple;
	bh=hsBHYMjruem2B0HZ5S4uclQXOX5/H0wl7truKZhJU7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/DmJyDRPTB6qIySZitRPfcQCbE7C6neVeyHxNWibzuDKwp4sHwljFpyDWsDNRveJ6v2+AYCXHVMSHvoXK5b4C65uY/26n36QgwhwN8kM7nfbKF3FX0P5Oce5BioyzX0/9YGyUNxHhBvWypjoweUK7JmfphWz0QLA2HRhkSjZ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NISpcn1r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQ/7Q4Nl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C2bjhr1740425
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KRVsL4S1GEk69Ycl0zqkkOAv
	W0hdnwsy1vUPCv7XOTc=; b=NISpcn1rxhuqv8ONMt895BTbPMHqZh5Rk7Bz3J64
	rdB0gW0vZ3xvB1EI0By6VHPyytIXQfGrNuhjYY3Jppqh3wfRr/SfC9EJSREXWzWM
	UhAa8Yf+iWFyMwQQyyC8+xCvYOBXJInydbic+jAsc4sEptP6mURJkteWD1mSYjY9
	iud9hM8bbW34gsI8fIDkK/B34kn/1AUO5VqkzimVQFDX4rKK4lzN8JvpU5PRLPdY
	JFW67QsDJjbsN/HvgIMVomN5r7TbMukKt+Uy2WzaoZ6WMMoZiy2eK/E2G7NfsL5f
	ybu6C10RnBDwbAGOGBOWUiNrhzNrU9IpUVwnEiMVrjWMuQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdg1yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:02:29 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffa0b00da1so1001666137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773284549; x=1773889349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KRVsL4S1GEk69Ycl0zqkkOAvW0hdnwsy1vUPCv7XOTc=;
        b=TQ/7Q4Nlv0jxpnqfUtVgJnCG41pVUVOxNTmFdzXo1U6rwUiG8Kyinheme+dKKi34OX
         SnAxFXnw+WsNZr7bY6rQJCU7wL9TAWwyydyL96q8bAN3JZivhvZ898X0uOxTa/o2d9WA
         OgZRyR0ujov9Q5E+RW91EDMgub2bvZlikt1kb1CreNdwuUkPJJlTT4n/wfl5CkK+75Fs
         /Hp9HS9XoEDriwfys+gRpW7UWKJ+mZzmCFhnEUdC+Z0v+8Sj+UeEfjlLI+FvB6Jx2n7x
         SULyigOtLDXrdx6QqB+6FC8mXfnwXZvas/BZoPNAthG3o1VdUo/oJMGZRq1ywUwiF1LZ
         YKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773284549; x=1773889349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRVsL4S1GEk69Ycl0zqkkOAvW0hdnwsy1vUPCv7XOTc=;
        b=mFwUWQE9EDN6yg4aDssS7MWA6uoFxZ/Zc4ru32pS2ydZUn2Ua3fepjyCMS2GaiqDbs
         thqTCYOi2csc1pRf7youC84OqL307uw27r11YP3fLgsi1zK/aKvEEJjzc2g544VbQXD7
         7PDEqKncpg2vmE4PArqrn/fCHp/J4+yvXXLt+UbK7WoEOaV+fFEgNhJoiHUhd/mewCtN
         u41SLET4+wkDC7n4rppGcp1C3qSFU2mn8LQdOFuNPpSGdnS6rEHFShWT0XPNCc9d/dEC
         0tYOzcOq0BUWIHM8Tm49OJZX9V/IBfdOlmsmE+8Gy1G79btfGJHXBt5OSrhEFIIg14lQ
         Huog==
X-Forwarded-Encrypted: i=1; AJvYcCUzXge9YgR70TgBWUiMwj/+fBHQEZslAKS3mfFVVIMoyehTviF9Q8bZUbG5r1V+UdNRHmbj9/ShW1DM1qHm@vger.kernel.org
X-Gm-Message-State: AOJu0YwUX9rqbCSpOh/eU1cdgJrycxjaac1ul2t3GPiFispzdD/uHWUx
	7n7yuNcz9VC1dyFa+AOxCLGT7Z2JPsAJpFmVO6c5BaBMzVDCQiFBjJQo8f3g3PMK6wSkenV/MLp
	07Co+qUhQYj0OmhOWtU1UFpnzOpYBNxgsnISdsxUCPrEV5EMUWuExc4bRts3LQOI4Km0l
X-Gm-Gg: ATEYQzwMtI8KU3N0wmW/cRKJAAMtul33++G4uyy9Jqzp+gGGl12fF8acIHfnpfEnsQd
	POqi1W0kFXMlKGyInBLMcijft4hMZZ1BWS8Qic0758sdxuIMwsNyzQVFp4S3/JFFtj04D+0+Ea7
	yhMPiis8KDQNktOP5Q2qqR1EsAcVb/ai5DM9ivJwcyjjJcZuJb3jDZxbEICuVMYZSfy1Y2LtnUU
	ogcCUDcswmVeuDJtTh9Z17nMBSLyMhrXh3y0jPp07H5XI07YRX230BjCecN7Xfe9jl9x8AGgEsu
	jXKpKF7RBaaCmeFnk1glubjrfCWI3KMHr9cmc5Ma4pFb7V23pm49HpdnwtBmSpz4Xl3d5fkY66s
	mwb96lRa4ZUY/ayjd0pPVXz0czT5/sJI1bZy0EpojehT8+9FzkxvQt9q+4Jko6hk6lK7D1rOiaF
	ggDX+oD6NkHRgxiA9tTHg2D83KI80CHoD5FoI=
X-Received: by 2002:a05:6102:26cc:b0:5f5:4055:4556 with SMTP id ada2fe7eead31-601deaec7fcmr1729493137.4.1773284549306;
        Wed, 11 Mar 2026 20:02:29 -0700 (PDT)
X-Received: by 2002:a05:6102:26cc:b0:5f5:4055:4556 with SMTP id ada2fe7eead31-601deaec7fcmr1729477137.4.1773284548864;
        Wed, 11 Mar 2026 20:02:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d61f25sm6967201fa.7.2026.03.11.20.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 20:02:26 -0700 (PDT)
Date: Thu, 12 Mar 2026 05:02:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Mahua SoC and CRD
Message-ID: <vznk4wbziuieoctzrqwbjm7xwdudsrj4afanl5lx67mmbar2rx@5msox6m4h2xn>
References: <20260310054947.2114445-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20260310054947.2114445-4-gopikrishna.garmidi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310054947.2114445-4-gopikrishna.garmidi@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAyMSBTYWx0ZWRfX9YHkJgj684a8
 deeyPMLq6JfX3Asydo64U9hsjWloWP+suVZlP6WjPhninblWamqG7GC6iQYsPNJhyFYoVM4Uz5P
 MC6baqYt5Oy/nK0f/Sm7bJIAQFrVDMKAKZKsDb8Dpw40xKzTlA8AIuF7nXRtfCDvdKsbPIigAO3
 pmShWKozrKprHN4cavIWc9UAh75uvVbRGvKyp+vtF6T8STycpQKJYeFozrLC0YH45ol/FJs7LFD
 Sho9bU/dOpRQcGKy3IslnWl+njjKGjemXhyNYne4EbKw1+KkN1kY8lKD16Jz0vtoQw5J/SWAQYd
 Q6P6ZZSBoQ3hQYtP4uSa+3UH41aKJWkQ4IgyzzZE/5mEtiX9+7Zmsnk1lAUkfydSPvh298Xn/kC
 j/m1j45dmyk2URcjuMNyKexNYKYlio9HMdOy/YeDRafoBRF0U9kRP4UNuesSrAguoscA3NOs/VQ
 wrC3jf3v9+OYM/0rkVQ==
X-Proofpoint-GUID: PJ21SbIZXTRUza4JhSth6bCoapjKCSZ3
X-Proofpoint-ORIG-GUID: PJ21SbIZXTRUza4JhSth6bCoapjKCSZ3
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b22cc5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=1i8W6yGvfobWeyyWttIA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120021
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97118-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF62C26C8CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 09, 2026 at 10:49:47PM -0700, Gopikrishna Garmidi wrote:
> Introduce support for the Mahua SoC and the CRD based on it. Some of
> the notable differences are the absent CPU cluster, interconnect, TLMM,
> thermal zones and adjusted PCIe west clocks. Everything else should
> work as-is.
> 
> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile            |    1 +
>  arch/arm64/boot/dts/qcom/glymur.dtsi         |    2 +-
>  arch/arm64/boot/dts/qcom/mahua-crd.dts       |   21 +
>  arch/arm64/boot/dts/qcom/mahua.dtsi          | 1040 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |    2 +-
>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |    4 +-
>  6 files changed, 1066 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/mahua-crd.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/mahua.dtsi
> 
> +
> +&tsens4 {
> +	#qcom,sensors = <13>;

This matches the value in glymur.dtsi

> +};
> +
> +&tsens5 {
> +	#qcom,sensors = <15>;

This one is indeed different.

> +};
> +
> +/ {
> +	thermal_zones: thermal-zones {

You've completely rewritten thermal zones. Can we patch them instead?
The difference would be more obvious this way.


-- 
With best wishes
Dmitry

