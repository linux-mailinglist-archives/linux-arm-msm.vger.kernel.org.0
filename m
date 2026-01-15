Return-Path: <linux-arm-msm+bounces-89122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 230ABD22C38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3723B3058194
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A43328260;
	Thu, 15 Jan 2026 07:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j76IMzSN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahG1grMO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CCC327C18
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461361; cv=none; b=AUi9gv/8KQzVIIdq7tt8rOjuA+ssqxGpr3q6REDjUMrAoHU0wmi4FpcKja+svymPaOXki7PDGWbU66AuaGVerRHYxB/7w1ckZibLdplVDeoE3Rfqy7WY81qMl63L59QeDgHD631pOGITxeIodMgRlEUr0f0ThsZKizYliMkitzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461361; c=relaxed/simple;
	bh=HJbybca+wr8o9lUuo1JWLswNiCcKQn2bcZDqcemjVpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOjboa5/diJAxzkzty5opRIZUQDzQko9ymuIf7P9UZ07CVA6FyTzmB83tq2qk781WFmfufP1IL9IV9qZUoY/TRJyJwTGQ72+xESdAxv5qPWIbXMmhF/q8dEbPbehS+DA66ZlbuangA/z+w09Xm7mMq7UwQtBRd1FiS/4LA7U4Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j76IMzSN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahG1grMO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g9Lq2074999
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U8drD34oan7dihf8y4tFhjeU
	iGioslwpR1YxYCHlkAU=; b=j76IMzSN2gaXHQG+qS3Q23/o3cr0A2/9Ry/YLnly
	+i2AKd40JIFJtTtEkxsfQNeVqvx889baY8/CdtV7UUSVOekOF19Dlg0lhTV/innU
	qF0r1LW8Jgz+oL8m/29544zpMBdyswtSeWErbiPwyLiD4U+atfhbIz+dE1qiE9KQ
	1JyNDdnKrJs5xkGV+cNeNFvktJkQNzLaxNveaKuwzvtCSM1aAXdfHnqL/acr4yiq
	0Q4xIm0gHp4NwmGoWRhrWLR/GpwxOYFQZXcksNfbZP8MAV1SF52LvmQK+gbvxGTL
	ddwxbszUym5uEIWjJfDDkL9Dr23idJGbBnS9DBfbZDOLsw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj9hhv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:15:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52dcf85b2so249935685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768461358; x=1769066158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U8drD34oan7dihf8y4tFhjeUiGioslwpR1YxYCHlkAU=;
        b=ahG1grMOD5Bv/Sfs9LtCvTIoMfQvCqnUPKbHsS+NVUqBxAq39W1oq2KswZPyBaa4BU
         FoaXgOsJEGQFcHjDgqMTr6+hAa0nr6X9b3Evt8qyRNPngZBmDwsmdM85HyiFqX1OvFni
         ZHy7h76+rX9sK05GT4M9pyFupUrMTWgpg4gCDenvFxI8mIhAwfGw0wP/CL4tooihDhQY
         wlxRa8iXYX9hk+e6ybYXVSnGQgQJHMdstE2h4w1COB8BhYsVLr032ZphUEhi/ANJ6yBr
         bI2YmO1JNSNznF4S+dlWOzFj62zmL1vMOiOM7vCad3bfhq1/bisXp3XSsTfp74k1IwVP
         5i/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768461358; x=1769066158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8drD34oan7dihf8y4tFhjeUiGioslwpR1YxYCHlkAU=;
        b=oo/qzZu/3KwRrUjSZwPG9gqATy7wuwapyxuUIkZ3/1OwBN/0/KhuXMry3+sWy56bCK
         svuN5yiL8QgzICAG0VWI57yzJc1aHOMt4tUmIbSzFXs6tj+X/FBQYiJVqm9UEq4p8ts0
         ayy5AFWYFJYbTuDXsD26WGiY3ymehNAnau2EYVOxNW47iXLb/DBVEsdFriInA5xwAi1z
         cIE+aQACzQyEiBcEOZmazgilwFwKmQ0RvxDi4nt+HAEYGAn67IsM8A2CIiuF9ZUAdRBK
         XatWVG9M/dNhlHVa7kHlwWg6wvci5j01JMoeDLQNgb3tQLU1v7/xq7qFHiecnW/Dwxtq
         QteQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHtjb6Li/RWgmIH2o+WQBl+XtbpusEbMREjba8JUnZNQbEeDF1UDiC7+cYTxpEaATvApy62xuGyNviG12F@vger.kernel.org
X-Gm-Message-State: AOJu0YyXFg3wV2wvD/c46Q4JMMPqWjcMk3fWn+jFgXoMEsoK95r2xQxM
	yjH9trHei85nQDPl2qOpSZYaC6mq0ZykT2eLdedTDDqlyYc/hwPibrrZn+tmuKBCSF/TWWeKQEn
	Ty/m1FBZFNKsX7Lfw7f91I0d/5nl//KESwY0GL2udor5VM99l4eqy3X1iySQ+RMwO14N8
X-Gm-Gg: AY/fxX63wZrmIa+TQRxmPhLgkDV7aps8BWP0yzP89jFsupqRyoXh3vR7+XYS/GMN0/5
	xuLrqMmETyjplGW2tUNWFYEDIDWMEOe8zO8NWjku2J6VmXjKChUQuKZpxSLnDUGbju8K8wPHaN+
	me+8pxkfI6mXfQg7l218C+gk+IzPkLFehm0xhz7HtNFVyOFlmumDQFDvDU8zZWCnVqc9pjp83gi
	T+O8wNYQqPu78oqQXF6WOaMVIJdW9TDBaSj64htD/ptPzAUTNl/+vQ8J6K5vcWkqO2fsTu8tkbG
	DFjAKk1IN6pVXYuRLmR/hZWqMeuzJWJ1OjCKfOHZOpSYwCjNW0476+tR6+KRrPLsjqyMiHh4xYm
	DRwyxeF8RdPK+7/T+8uNcVDZESLgxz3vhGid+nK6cEp51uTNIO/qb0VK/LEI/KeEnsnktWOReTw
	iUrlxcE/e6fKfSyLbkW9nr1cc=
X-Received: by 2002:a05:620a:c55:b0:8c3:6f20:2ed2 with SMTP id af79cd13be357-8c52fc10ef8mr766537485a.84.1768461358059;
        Wed, 14 Jan 2026 23:15:58 -0800 (PST)
X-Received: by 2002:a05:620a:c55:b0:8c3:6f20:2ed2 with SMTP id af79cd13be357-8c52fc10ef8mr766534785a.84.1768461357524;
        Wed, 14 Jan 2026 23:15:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382ff00220esm51342661fa.24.2026.01.14.23.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:15:55 -0800 (PST)
Date: Thu, 15 Jan 2026 09:15:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: kaanapali-mtp: Add audio
 support (WSA8845, WCD9395, DMIC)
Message-ID: <v5rprswnwedm2y7rjr3y2zfvhdh5qztvm4nnaeti2n6yqyj5yh@7wbyro7orb3q>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-8-a6cc9e45de93@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-knp-dts-misc-v3-8-a6cc9e45de93@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vTopeJaI3grUwgtu0LguTu6QWjs1JXgy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0NyBTYWx0ZWRfX8t0ka77Ycw4U
 NTwsLTlgJ3aTlPDOjl05+u2PrfqHrYwh2aFHJPafhQ27Zbndsdg2NSc6TRRZOcRMBjXQbDzfY4e
 WWZ0yvRY5XP+rPZPHagF/WbxAwZJh7ER1lAUouWcuR5zkU0Jz+i2FWMaiCfiElEgdWFPxWCxXum
 /X/hRk5CLVoTc0HiaXIasnuykiGvqHHriOadnxX1kj45X4njq5TkPRLN+evE9+H+gD3es63nYE+
 8Hb1r/WgjF8zmne6sMqiZceWBpwaZXpt2ig7jqzLcMxfgdFX2avXlFBHEGCOdPTuEy0eRWw2NPY
 lEjWBrIb3bM0ebvixYy/8Qrhhcfkg1JhGbhOh5hFGI6YULg+ai1LpRBsAcoCeV9cAeWpgJBr2vi
 1iLmlWinAlcAxEJ9JGK/ysGNkWlNLhwkhTIzhEj/oqTfiaSYQwerH+Saf6CXQhhrtW3x5NTBiUS
 CJAnUz/QQA99KLr0gQg==
X-Authority-Analysis: v=2.4 cv=dcCNHHXe c=1 sm=1 tr=0 ts=6968942f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=k45dlaRLeZTL36E3v-sA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: vTopeJaI3grUwgtu0LguTu6QWjs1JXgy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150047

On Wed, Jan 14, 2026 at 10:49:10PM -0800, Jingyi Wang wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Add support for audio on the Kaanapali MTP platform by introducing device
> tree nodes for WSA8845 smart speaker amplifier for playback, DMIC
> microphone for capture, and sound card routing. The WCD9395 codec is add
> to supply MIC-BIAS, for enabling onboard microphone capture.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 226 +++++++++++++++++++++++++++++
>  1 file changed, 226 insertions(+)
> @@ -684,6 +793,14 @@ &pcie_port0 {
>  	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
>  };
>  
> +&lpass_vamacro {

It is a strange alphabet, where 'p' comes before 'l'.

> +	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
> +	pinctrl-names = "default";
> +
> +	vdd-micb-supply = <&vreg_l10b_1p8>;
> +	qcom,dmic-sample-rate = <4800000>;
> +};
> +
>  &remoteproc_adsp {
>  	firmware-name = "qcom/kaanapali/adsp.mbn",
>  			"qcom/kaanapali/adsp_dtb.mbn";

-- 
With best wishes
Dmitry

