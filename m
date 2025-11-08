Return-Path: <linux-arm-msm+bounces-80849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04596C4340B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 20:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADF4D3A5142
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 19:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F48D3FBA7;
	Sat,  8 Nov 2025 19:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIEl9Zrd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DokuCfRp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB74C23EAAB
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Nov 2025 19:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762631173; cv=none; b=B+5vewr5yQWCWWzet5jfj/fh9Md6NbTexHXLKgRBJ/ljxiSuB7fujfURWBXSo1MX9mboMxtY/blDsmSsYk4egcHMupWPSajufKmnIvZk2Nqs8BhPpuHMWQQjb1LuQ1YYpoQLkHmAIBIUM/C1CTlAHoEo3+mbKpUJ+3p3/NmxiI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762631173; c=relaxed/simple;
	bh=+Hoil888rGf7WfZpji4y4VNmOyUwaxNOhwYYWlexOJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drry+tgmWJOjdbFwMwy1LWmIOKMmE4kMd4cnI1llUzihC0ub2kEvyiC3v2CNOFr0gpEVloWdSJPonb02bU7Q3RCeL3GKbSC3MdB6f+GMxITiAIkYE/q8gZXfZuQMOYvWQl+YjkEv23S9ApKUPtO74wJwRa5iBTRl78PVSwRsKdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIEl9Zrd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DokuCfRp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A88P5sR1272560
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Nov 2025 19:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N5kLP8hDSeanKiERqglKodoR
	Cnx8rVn5yjp6JtXx5aQ=; b=pIEl9Zrd6spWFEWF0oEEF6TNGZQW0DzqEgEONpBZ
	0AhHTZBrEOrCanWbOIRRceZHDYSDpxUzTlMpU1tQ1nExMM83HVfkxCegwwjS8dh1
	1ArQelJGO6WJbYqvWVTWBd/AO4yniwG9LIQCdUet8a8luT8wwdq+6dTxRUtmXKRl
	3iWhjTZ/d0Zo+jbP8F61yRSJ2kEgP8TwNrva3LEKPfETvH7vYBt3HkVsTsmGil16
	HHKWeviIjiod0t5o54aWRjHJC8FiZnZ0FFm2LGMVPQY7SS45Pxgu1Q7V5/azEIX6
	4pZZNRnF/CkyG+Vyu8hV03U+YCo0EfzYMKhngr5xSB0Hkw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xw6h3d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 19:46:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb366a926so124971cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 11:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762631170; x=1763235970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N5kLP8hDSeanKiERqglKodoRCnx8rVn5yjp6JtXx5aQ=;
        b=DokuCfRplZI83PeUymA+yDI5Q7ALquN8kEtXcdFHD+uDEE46kD3Kkb8m4PYj0hDZLy
         K+4XqmQ3CxQpl7r4trF9yAfxTHQIumnvS/97OLpW3KM6PepfxkMyqNo3Ez/Tg3hy8DsK
         8cqp8mKm2dlzxzOKfl+pMsBDvBgsCwqm14nvTeKHHwGeFcU+UoaXOwdhxFHiO0OWVWG1
         J2J3bI14sBjspLVkCKGCU9nRNoSpN23ykIRl3ZYjRh7xyRQKuWzG8ArtWt6+pxZ1WBG3
         wALIfZwpMHeW8B3z1YSkg+sOWarlUBQkJei7nU+3D1jPWq7hepkSKroyDtqzJkoT/EQv
         DKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762631170; x=1763235970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5kLP8hDSeanKiERqglKodoRCnx8rVn5yjp6JtXx5aQ=;
        b=H2o5vBvDDp396+cSIuL/rmhHRIoQOMDSsXHR2PxbHQNoaKDSLjMZsLI1Mcq2Qc+aMW
         onF10LouZHYJCG2FS052tpbcnsuq7saAQAgfd56N8Yc2QYd+iN6aifJFBmOQcru8YYoR
         nh0Uq0dboajM0a9TqkOmIE+RY9TEOh0Fj3hZw6OEkTSqDTz1973RfcrimLQq0Xwxjo5i
         FGws3MJlGcLbJqUz+/fjONalHjSeAeQc70g0SbppRfL6x7ZRWlJBxDFg+8fXFGAKToF6
         b68H7CF1CdtN6KBA9H57r5YV0Cr9/S0+3hk56H6/XBk4e0mSynX7fTZuvtl0sx4XEquy
         7cYA==
X-Forwarded-Encrypted: i=1; AJvYcCWf/vEdRB8LMLCt3vh2IapSkgiXT95Zd32xm6euUYd9kowEzZtVciIj3tsHyrCfR5KWcH02XlK/oFcZPNcb@vger.kernel.org
X-Gm-Message-State: AOJu0YwOZRyb/o35BY2pKb0ldMNCy6ovIVI8p2MVkdIbO/l5c0arR7LI
	PDXk169fv41yl6xKNIsHn6Z5QmlJbxstetkTJuX6X6lve1JzwCnJaot4Mq40FxJ22uYfsPPBSdK
	dK+FNpaakp3iVtWW4sm15zAQajhUDJFVj59JhZeG1H5bqXX3Ok/R+vakSeBfvoFbqaWTr
X-Gm-Gg: ASbGncswIwHq/lBvCzFdkfHLfR0kQ7wLAJo2Vi3Hp5FK8Spbq5Km3NhH9m/muiUSctO
	V7yGFHVioNCSsVROIfwRD86iBsPV3iT3WMG+GJI5XnOO0mpoQE1CenXiw6fnpzFhVnBdrQXwgCx
	sQL//esS/OywmDXR1TU+9aeLfcYo6OvYqom8fzJ0NZvXCU8025zmm7fFqAtu6dJqs9wLxlEWk2r
	pOOg6Qakgb82eR541qLlNkNqmgwHr94WiLE6b2xu6haepZqJBpgQTirca5dYNvZ3+YD5POOcr5p
	bqfFg7Rgx66N58/6/K0t0JdsCs3hWfP8g4Hc9FvW+IAYzXD6/20prrF7OzBZ/RvxE+TV8NycW7C
	RhOC94Sx2aijBvzRqKPZZTuii1BafZyofI8IEc27lWrcUGD+V9OobWrISC7bS3KqCs5CbRB4+05
	gHXslf9+5+hiy7
X-Received: by 2002:a05:622a:286:b0:4c0:5e82:86d3 with SMTP id d75a77b69052e-4eda4e6ec21mr42626761cf.1.1762631169998;
        Sat, 08 Nov 2025 11:46:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxWcQNlieXpFs0/FgNMHfMIB0ifmLg8ipoQ00ZlH0+sZ5XazDWrKkbEsLsyh7hlUoYpPIS3g==
X-Received: by 2002:a05:622a:286:b0:4c0:5e82:86d3 with SMTP id d75a77b69052e-4eda4e6ec21mr42626511cf.1.1762631169567;
        Sat, 08 Nov 2025 11:46:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a840e20sm2422937e87.60.2025.11.08.11.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:46:08 -0800 (PST)
Date: Sat, 8 Nov 2025 21:46:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, jingoohan1@gmail.com,
        mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        bhelgaas@google.com, johan+linaro@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org,
        kw@linux.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_krichai@quicinc.com,
        quic_vbadigan@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v14 5/5] arm64: dts: qcom: qcs8300-ride: enable pcie1
 interface
Message-ID: <3ero2b5vzlyncubdbiknkimytvuelashqn62x5bg2x2kx66ml4@hmmzxt5eiip6>
References: <20251024095609.48096-1-ziyue.zhang@oss.qualcomm.com>
 <20251024095609.48096-6-ziyue.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024095609.48096-6-ziyue.zhang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDE2MSBTYWx0ZWRfXywz2LTPzq3ZB
 sdLnPt5vQaa7faZOEFx8iv99YPsoxIF1FjctzeCgVNWLq9VmuqBo+NxoUXqZMsIPHXUJ5j6/Rmm
 QXGn99kg0cWK4nbCibCZFeF4Uyve/j0EGkl5YPSQsqVU/Y4zc4Ay78X092z6x6TLfOyvtWV2Hsk
 BS5FxHJ072WxABOTzMDIHdQt4CixU8XPhLfD2eVn4aWlD/BWMXEAxnIThsZZIiW9vExuYI7BV39
 ZCpdURxPvziuawUOK7xLfdRcw51HzTNsKPuRx+TldVCwd0EGknzRI3M9Ht0To4BgM51vn4iVURK
 8dQwUF5Fc0fZU1snjpAdvqsSNbuaG8b7YNOirlobPp/6dhOh7ejp7KEQdTd9J+HXcrAiVysWpek
 xzbV/ewSsxMX7T7Z8FKJt9OEWkGgKA==
X-Proofpoint-ORIG-GUID: hPmQ_u8XFbYWsbVcvLhtvlaeGHlQGSpb
X-Authority-Analysis: v=2.4 cv=cpmWUl4i c=1 sm=1 tr=0 ts=690f9e03 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=wKY8r5YjdiK6585sAzsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: hPmQ_u8XFbYWsbVcvLhtvlaeGHlQGSpb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080161

On Fri, Oct 24, 2025 at 05:56:09PM +0800, Ziyue Zhang wrote:
> Add configurations in devicetree for PCIe1, board related gpios,
> PMIC regulators, etc for qcs8300-ride platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 42 +++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> +
> +   pcie1_default_state: pcie1-default-state {

Incorrect indentation. Otherwise, looks good to me.

With this fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

