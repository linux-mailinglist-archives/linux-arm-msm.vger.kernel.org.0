Return-Path: <linux-arm-msm+bounces-52765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 300C1A74A14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 13:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFCDB3BCA26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 12:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F9817F7;
	Fri, 28 Mar 2025 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USj+T4Ha"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FD812B71
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743166134; cv=none; b=KEk+o3hXzeaPLaraF6vhiws5F8aQCSYaSnhxmKMh987VWmFSJ2VgpInF9SSKHbZweQv1+jjp9KGYkxIFOnDYWMymGcJ7sjTJVEcQRyTA5csFSiHVxlR+i/EZi3b4ovqyiA2l7DpWUSJGXUjFecOXued2eFaiMdbkNOS+LTo2RqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743166134; c=relaxed/simple;
	bh=aG9LbwcojodufeLX75+lvULHAcyRacaCsFxgbMpQgkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0ebXImaQfRSYRRwwxbNgybrg3jEBrbZ/IDJJC8C9ec9NkvAg4TnGZfIIR30i+Y98zsSWSsAHV1aASbONWQNMBZJgXSEJbBnxfnLPV9YES+yb2TFNWKylJldS54QqPn5sxdBNkDZQHoCOZW7x6IQnobTVfA8e6LigYhe/o+sbqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USj+T4Ha; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SCKth3002259
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 12:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xcpiYNIqknV81nGF7GJN/LXy
	6620213LuyppeII8+H8=; b=USj+T4Ha5w+c+j3c7vVVrwz/lr60gyx1nhmou6BU
	mNmZuodmQDVxcP2YUl7GVCsEXHZv97ayGTX4XHMvFfGSuc9s8sir3TB8LqgK5sYc
	2jqvh6pljWpJQDNX8bHzM1aIYxlonNKZpOKBtjbbAn7/FjhjZjE0FGbHZUALMpV2
	KK3+6MGVGWp/SDK72LB6lGU4DxiIULjKQH1vjE+7dWihvazPVuOpIUHuSV0cmdOw
	DeBD/Bjb47QB0dS6DDIiCWnURADvGRW8aUzi6p4pLXtRPJAO85JzmXIn815Vm2XK
	eAavUgjhycHmAXgIOdFp6aE2oZeyX6N15HBAiCQ//1AtRg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xe1txd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 12:48:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4766e03b92bso34821081cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 05:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743166131; x=1743770931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcpiYNIqknV81nGF7GJN/LXy6620213LuyppeII8+H8=;
        b=E2h9an0GONpMOdsxPB9rNzE/wjx/d0KqWzKPmqNuPHRAlDLWk9F65gLmbMgQQAxuAs
         hl00SekV8q+3Yll07eUSDqajX2eVImFfMDBAzmVEAjoS80tn8pliOfFhnby5mgHvouqU
         FYUf7/3LrhktyuZWOxRnrIGXMRxq7L6/hx3AuXFtFLwEd2Epbc0YhH2l0fwUBpX4la/V
         AhwK7IpnNhd24cxnyy6d/x/MGbM/jPk+TF08OUXDHHV3ucD1sOQRMUxP9W8ipJJmiWHR
         QtaWAhWTacU2ZV7GQnJlyK97U18qmdXKuLGyErdT38deHme9iyJjxEeHbE2aI43i1kxx
         t2SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCAoLCayh/ok+EyFLmB1mwyS6M9+KZYoDvADXVheCj9oXETAKSEcIwqOaJ1CeCWc6WYB6lqgMxYD1dlWqg@vger.kernel.org
X-Gm-Message-State: AOJu0YyDeEySai1DMVKwdH9ZJqfwA3XhvzbLIh+MzdV1tG9yNXJMw1Q/
	C2wld1VKeHxU49xnyKVlUHZ4KO37iQcICD+aQXn03aueeB1lLMtEIk53LSDwAjrhbwhdM+qa1u6
	gaatJplVSZJZdynbI3oLyMDry1Syhz1MnfgmGvGj6wDgZy70JJJNWVeJx9zjseMIZbRF3tzum
X-Gm-Gg: ASbGncv7TJJEugjGZjPBj//xX2JZkiep6bSVtADNGRAw6Xt6iNhnHZC3aX48MLaWHc+
	1exP6zj8a1vYMhZA0raBJo1DwdAoU617JlucMhsF56AtoMKHLpqn0YdbainESTqzKl5znxxFVY6
	Na0tmLUXSHpGOlzWz3W0clpkeHo8zK4O5/+a2uVQBMXgwC+ae/Qzkw66YO1GhBDBqYz3XkMcbCb
	zsQaEstrObN5rN8O+DfG1ZiWmS7DwdnrAjSRLwyfkRqfvKcqGAofWelQQtG50VrpNA+NxPnseZ6
	aARya7ZwcXyvd3tjqlRW91Ruv10CWkb1TWju+VU9fpYhcm1OUOgyyuzTnvaMYHfek9CiLp952Lx
	OWkc=
X-Received: by 2002:a05:620a:2492:b0:7c5:5f19:c64f with SMTP id af79cd13be357-7c5ed9d8b9bmr1117994985a.4.1743166130897;
        Fri, 28 Mar 2025 05:48:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERAubvl2cw0dj4D5vjvRb7scF9GMs+j0NzaT1mlxhC3MAFWppR+M1xWZGPP+2dt8DudrBXvg==
X-Received: by 2002:a05:620a:2492:b0:7c5:5f19:c64f with SMTP id af79cd13be357-7c5ed9d8b9bmr1117991185a.4.1743166130410;
        Fri, 28 Mar 2025 05:48:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb305sm298081e87.7.2025.03.28.05.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:48:49 -0700 (PDT)
Date: Fri, 28 Mar 2025 14:48:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcm2290: Add crypto engine
Message-ID: <vtk6zczs6uc5z6o2fdfdqqwgakqxqvnmsfswbg3zuud4civl3u@azmmwdtigohj>
References: <20250328084629.1290797-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328084629.1290797-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OjhZufxBTOtGjYDZhJPQTt85Ev173DNr
X-Proofpoint-GUID: OjhZufxBTOtGjYDZhJPQTt85Ev173DNr
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e69ab4 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=HZsnow9p7GAf8o9iJ-sA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_06,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=693 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280088

On Fri, Mar 28, 2025 at 09:46:29AM +0100, Loic Poulain wrote:
> Add Qualcomm Crypto Engine (QCE) and BAM related nodes for this SoC.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  v2: Remove redundant iommu streams already covered by the SMR masks
> 
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

