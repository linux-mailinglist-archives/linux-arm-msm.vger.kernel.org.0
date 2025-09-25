Return-Path: <linux-arm-msm+bounces-75196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9DFBA174D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A6A3741113
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BAC277CA1;
	Thu, 25 Sep 2025 21:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5oj7i/R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE53E274FD3
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758834405; cv=none; b=NkNQiUpl5G0cas33E0dAsRSBIc/F+8LgH2BwPTnr96JbVyDTfRKUj/QtjwGIfC6zL0nDTx4riLKrL6+fA4m9PyfcYQEqBzGWRvzpW39biovs0Kqfwjog+9+JS11Js46elkf2yNVyq0UcJ/bZXbSeVRLedU3wm0KGjJDDSh35+IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758834405; c=relaxed/simple;
	bh=2DU/adLG9pkWQm+grE5YGZgRglstjeNrt3cNHO+bGqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rx9I4kvWjm/CBHjR5FMzgKgzxS2XDy/0QMF90Cp8IOPbhf6jrigHYiVOejAX3PubF0ZnFl+AqhH09zkBzPWOLsYa3s/yz73eaGD9AL1V7GeAVuuNF0hV6NyZxkiUV5HEF2dlXiF0LCTl6ZEP3mY8y4InpAXG0GShuIwZweI3Iwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5oj7i/R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPiLg027682
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aYqmcdVOcild8mjHLy/eaUpc
	OfsqKV63wySK2/T5LUc=; b=o5oj7i/Rh5COiNq/iNm9a4K7x+K17sbmFTw13FEE
	Subx+JS2+RAvXMsUwa1fh1NuWtzc8AhdshyFD8yiE9qZgWjBAP2LB3FIDyrKIFSJ
	8JmBawzkE4UuIYzmrbrzQAd4AU17b0WNF6GoJW214V8YnucrBkZBBt5o/fip9PAE
	IMFIhvYmHqNwkz2VZPy4EKA69LBA/zhYS1GyUhaC8375FEUKle5eZzdNddBB+ak5
	R2mTb8pe4j7iNeVyUZ3UVccdlWegHsCt76cTG5Qcrw3qDn6hO2mnKBkcREjxABEq
	B2xQ3+pphrRQhlinWPfxY71Jh6JHHbyKiHci16jrDZTGEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0dc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:06:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5ecf597acso32768441cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758834401; x=1759439201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYqmcdVOcild8mjHLy/eaUpcOfsqKV63wySK2/T5LUc=;
        b=t+a3Kr3FIZHiR2RjwXGDF4r0uOFMPPCCSH7DrVy+94IN5ugI5XCwPJ0h6zg9FM9EJz
         5v/HtbOVDFTQ9PeRdXa+jAg9nhQ/LS9ELkIaxvb5A3QW4Pi+klO7OGhcCSdOrSV/OKvG
         96gS4R8CbNBd4qBX3LwK3sIVSU8X5KLnZ3VaddjMLdDQz07cW8jlnuWHaAConWgiDwMM
         txE2JGxsW8Ue5ngdTxvw5vyc2gRlAZIx2WWKR2gCOATn6ZdRoklsZrvWBf/ZxppfTZ5G
         +ZOeJ4NLYjL8alZuoJ3LuLoTaiEUEaOjveKDFDlEbQHHweqeZthkR3qRl2njYAkJjxv4
         Vx2A==
X-Forwarded-Encrypted: i=1; AJvYcCU95T52YWVR7xvMOf3p+mW3NEM6MF3u127aKmHt15ZQF7PJNlPMn28JHgqFe3/yc1kXqNdZgJlUU9wicoei@vger.kernel.org
X-Gm-Message-State: AOJu0YxAFco+G/rC9tGbxFTApW/pQ2Fv4cGL/Y/4Q3qNqe5u2S8xoefz
	RzbZTzY4HqYkaybYy8zpkdXoWUjdgkcaBlbmpL59aur3MBXDCSvNby4unIobVuQ2OP6tpvIjRw9
	qOfKjnFUnWHGGyFg6r+z1zI3jslnimDFi0aTBvidV3fA5bUQ7gCZFYXd3ywER54tnkhBA09b0Lf
	jI
X-Gm-Gg: ASbGncud8Dka1ayT5tFVwilftCfFwhTYmCYlJwRb2GRgugWSkI/0vtvqgVjoJEjpYps
	KHZmrJJqgYYMjZJUejj8JvXVxw6DK4UofYA4GuElLqdnNbEXGQiV1YjypuF6SPSKHmB//TgVWUG
	cbkDWozi8NjDxw9rd9Asf6D4Jvaf0VYH0Zcn38/U1YvyUUIiA+sMZVxxy69z5b2wkIn11IAUnPV
	lXAnL3LzLYV45DH+mv0Z72GjiNaL/o/MFQcieuXQ0Ib4qYcoBAQzAoC35GvvlzEr1b7wZVb8Ofw
	HMUmlWmaAeRuVBb3I1kkAvOAMhj4VPKjbBGSrXDkqnHrWDVGjTiGmKmvtvge2zsl+V5zKqu1aK2
	9CUVpuSgiUrcUdwAMz84hS2UnNNJxJljS+0E+OeWF4gZF3BKGk8Eg
X-Received: by 2002:a05:622a:4a87:b0:4c8:36ff:7930 with SMTP id d75a77b69052e-4da4c591f16mr76061601cf.67.1758834400904;
        Thu, 25 Sep 2025 14:06:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENm68K98a4D8Y5bwT8X6HOEjf44eNgOG7R53vAn+su2QeI4VjcXpmyY0SwMYOk1Es2nkBkiA==
X-Received: by 2002:a05:622a:4a87:b0:4c8:36ff:7930 with SMTP id d75a77b69052e-4da4c591f16mr76060781cf.67.1758834400253;
        Thu, 25 Sep 2025 14:06:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb0eb4a90sm7958981fa.0.2025.09.25.14.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:06:39 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:06:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <taniya.das@qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/24] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
Message-ID: <76bbww3gsb2w47h27jrs5z32bdtxf2r4hwce3g4sbtjo232tov@yx3pripyve55>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX8Bc1wpaLNupy
 1jySixMk2uCEWyiPQb/Km31xX620N+ADy1KoiLQaxyA2oK0yfWg1DEbuys2KUtKgOTjzqv2pV3N
 EqvJUK5SbIYmqqJO72Ttd3Q97ccbX4jcMrV1lfXTQEJuPBgv1RrVZFE8GYBeWFabcE+C7d19+Zi
 /pvlrj6pzjmZ9Zz+dCtx5sMJMAV7zjZ9jFvs6OZQeZ9j87tQnJ4wouDIkJRM4QgXfPqqAgC1ZvF
 hJ+lMWdOUNJAdtDXqplFP10xZVTPskzcHep0GrmlVe2ZtBNIiu5vgGrMWIA4KPjMv98+XNe1BYc
 GAmoBpBgIGFOgOW0cqaY82sidJsirjJGLbDBm9DWBn1iI1ggwktQ8xs63IBR17dCe8JBeHt6qkr
 YCP9TKmzcvgRTdWASMn1Hj7I+IhotA==
X-Proofpoint-GUID: z3ZbnVY4ySz7m8BV7xbzf9GuRlyk-OSs
X-Proofpoint-ORIG-GUID: z3ZbnVY4ySz7m8BV7xbzf9GuRlyk-OSs
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d5aee2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=YcTb5pCOJs5GMJ2OGDMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 11:58:06AM +0530, Pankaj Patil wrote:
> Introduce dt-bindings and initial device tree support for Glymur, 
> Qualcomm's next-generation compute SoC and it's associated 
> Compute Reference Device (CRD) platform.
> 
> https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
> https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-
> 
> The base support enables booting to shell with rootfs on NVMe,
> demonstrating functionality for PCIe and NVMe subsystems.
> DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
> TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
> thermal management. The platform is capable of booting kernel at EL2
> with kvm-unit tests performed on it for sanity.
> 
> Features enabled in this patchset:
> 1. DCVS: CPU DCVS with scmi perf protocol
> 2. PCIe controller and PCIe PHY
> 3. NVMe storage support
> 4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
> 5. Interrupt controller
> 6. TLMM (Top-Level Mode Multiplexer)
> 7. QUP Block
> 8. Reserved memory regions
> 9. PMIC support with regulators
> 10. CPU Power Domains
> 11. TSENS (Thermal Sensors)
> 12. Remoteproc - SOCCP, ADSP and CDSP
> 13. RPMH Regulators
> 14. USB 
> 
> Dependencies:
> 
> dt-bindings:
> 1. https://lore.kernel.org/all/20250918140249.2497794-1-pankaj.patil@oss.qualcomm.com/
> 2. https://lore.kernel.org/all/20250918141738.2524269-1-pankaj.patil@oss.qualcomm.com/
> 3. https://lore.kernel.org/all/20250919133439.965595-1-pankaj.patil@oss.qualcomm.com/
> 4. https://lore.kernel.org/all/20250919140952.1057737-1-pankaj.patil@oss.qualcomm.com/
> 5. https://lore.kernel.org/all/20250919141440.1068770-1-pankaj.patil@oss.qualcomm.com/
> 6. https://lore.kernel.org/all/20250919142325.1090059-1-pankaj.patil@oss.qualcomm.com/
> 7. https://lore.kernel.org/all/20250920113052.151370-1-pankaj.patil@oss.qualcomm.com/
> 8. https://lore.kernel.org/all/20250924-knp-pmic-binding-v1-1-b9cce48b8460@oss.qualcomm.com/
> 9. https://lore.kernel.org/linux-arm-msm/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/T/#m46501fe9edb880fc11f69442eaf4d2855f7e4608
> 10. https://lore.kernel.org/linux-arm-msm/20250925002034.856692-1-sibi.sankar@oss.qualcomm.com/
> 11. https://lore.kernel.org/linux-arm-msm/20250924144831.336367-1-sibi.sankar@oss.qualcomm.com/

You got the feedback and ignored it. Should I ignore your patchset in
response?

> 
> rpmh-regulators:
> 1. https://lore.kernel.org/all/20250918-glymur-rpmh-regulator-driver-v3-0-184c09678be3@oss.qualcomm.com/
> 
> PMICs:
> 1. https://lore.kernel.org/linux-arm-msm/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com/ (Patch 8-11)
> 
> PMIC-Glink:
> 1. https://lore.kernel.org/all/20250919175025.2988948-1-anjelique.melendez@oss.qualcomm.com/
> 2. https://lore.kernel.org/all/20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com/
> 
> spmi/pinctrl:
> 1. https://lore.kernel.org/all/20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com/
> 
> PCI:
> 1. https://lore.kernel.org/all/20250903-glymur_pcie5-v4-0-c187c2d9d3bd@oss.qualcomm.com/
> 
> Remoteproc:
> 1. https://lore.kernel.org/all/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/
> 2. https://lore.kernel.org/linux-arm-msm/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com/T/#t
> 3. https://lore.kernel.org/linux-arm-msm/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com/T/#t
> 
> USB:
> 1. https://lore.kernel.org/all/20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com/T/#mb7879fdba16496554a53c3726d90f94b6063dd09
> 
> Linux-next based git tree containing all Glymur related patches is available at:
> https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/glymur?ref_type=heads
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

Nice. Any reason for ignoring b4 telling you to edit the cover letter?

Please actually describe your changes in the changelog.

> - Link to v1: https://lore.kernel.org/r/20250925-v3_glymur_introduction-v1-0-5413a85117c6@oss.qualcomm.com

No, it is not. Something went wrong and this is not a correct URL.
Please make sure that v3 gets a correct one.

> 
> ---
> base-commit: fdcd2cfdf0db0a8b8299de79302465f790edea27
> change-id: 20250923-v3_glymur_introduction-e22ae3c868a2

And no dependencies here. Please stop and instead of sending v3 learn
how to use the tools and how to interact with the community.

-- 
With best wishes
Dmitry

