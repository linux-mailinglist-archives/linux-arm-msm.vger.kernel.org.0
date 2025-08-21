Return-Path: <linux-arm-msm+bounces-70121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E49B2F4AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 11:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 725BD18999EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 09:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5D22DCF68;
	Thu, 21 Aug 2025 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EeUCq43k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC152DC327
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755770236; cv=none; b=ADiW2HEen5V18SBFQxUJziIbXyHhC9deOQsOmxkdc5gzIcf5nJDyYaJarX1r3xAeX5KGL0GQrjZ8o5qv3Tv7tQvAFwMgJc41bbNcMSlROWr/0UNqXsmNH7YXztbhzKEjfConB8OPZ1r7sKmO/K3UAMt2kKkEanM7RJ0W24PN7mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755770236; c=relaxed/simple;
	bh=IOpmcn53PEqkS2CYk/u+AVkw5l37Cd/P5pjacTzQpXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXjg+tr+cyF8OqdtaNj58YDaovbeCRd+5fWNXzuItjdKBHmpRRW9u5p6OBqkT9nvfLl/emU6rvlvYKke5Tho3x9T4UJxGSY7LTb0hDFVnvhX6M2XBOPhsQ6g+1HMmDF2eSkhX+ODGWwIL14cnQwwGI/liDckOpncjZb2QivyN5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EeUCq43k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b7xh024167
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SVb9XlaHh7NAzDiLQrW+htsh
	4PsmGg/oSLr5rbvMx1c=; b=EeUCq43kFHXicsz1AxT5uF7u5O7rqZHJ3xxwAfDn
	dAoz5zy3dbXp0J6cgkRG4hr/iIR0La6XgV8F9I6IXxukzNVZPoptQT1yxaSETHhj
	h3v+w/wVHnn4dd4Xi8SHUi9E1buREiZZWRHzrelcaYEXInWbYpVguQJauIslnf5J
	3j3t1ay1quy42AoFzDT3urFsMCq8kd1sm+iPhcyTFyaqdJoX9N/TnLazKop4tQsn
	xay7YO2vRCMPZLjTsmiztnMjV4KwSC677fYCNusqkFV527BBGMVto7NCs0jreSuH
	3HsxigaDt2xtUxgyDezqw157YdLDSH2WDBXBuE4Eol8U8Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ad195-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:57:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70d7c7e9709so23004736d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 02:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755770232; x=1756375032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVb9XlaHh7NAzDiLQrW+htsh4PsmGg/oSLr5rbvMx1c=;
        b=j8ngUobehb+oPAc2wdPYp8KNTZ2A15I171s7n2mKGL8Tr7V7CNLPq+C0fB3SAAh8+F
         ynY6Wh1ZrDydjCXc2WehRSdTuMn8ge94f6ohSYScLIg3FS+HtcwxvTQHYoTrkqy3HVce
         PSLuusHJ7ALIUyOr7I8miLJ06kas6apUW2hp+/AFkvF/y4sr77tToHitEk+SJ3IiD0tb
         DPqr9PMPpDM/+T4s178pf4n5eVZwNGQjRea7q9BuDUApknvXR8MzZfUtd/KXegzxP7P2
         dF0HTmNgAyPNZZk59Ctsbjo4uVR1hTEDzPArfdYdVSjRvs6itWRnDEcjUJK00mw+S7Nt
         nAAw==
X-Forwarded-Encrypted: i=1; AJvYcCVy0A0xhuwDlP5paySC/2PFJzqQgbecHdTJbyrAC8jdm8yVi0SSd6omVfKnBens5H4AkG/iIj0qeOTMkJ4U@vger.kernel.org
X-Gm-Message-State: AOJu0YzRfbcJ0PwUwg/nwFr/zQ0UndoyFjAYsnRS+ormYlNrE6vamoiG
	p36SXApvCpnLUBJJkm0X0gTPTt6nMJb99NdDHWadKgwKoGuHC0u8DWZ8S4MTct8mOWf0tzlFPCx
	KWtHxiE3wg5CJ5NDwmD7zCmiuOMAA9daq4Tri4IgHwZ6iBSaomE2DocCYNCiNKvRtbd+s
X-Gm-Gg: ASbGnctJyROlpBM9aLR9B8wKZoORtNOXR/BcnA7xcmXmqU5yHCNrWLpxjoljbwHuK3u
	ftrm3szX1N1cR37gAGmxcEp3jfDd2RlzndWWzh72LSF1gVMIiq9Ei8Fopa+ul66pDfyfK6wic7R
	4t4ynZjnBru0q5AkTmi/ikTylQ5HmpfwkbjzbeeCO/yoTA7WZvh3FBZk07EOz7UUMJG0Xh80Owi
	w5GmLt3XQX8IF9D9+J0xcFieVbR8PyGYOtjr6Ts1QbgJRRbcSQFFtpSAFpmQSYnKd80iytj5o0Z
	Nl/dd4Bk4yPKVbMmBrMqvTeYPV9vq1tMEJVvfeDI19OJ6DHjFAnnFEyPTxd/sihD0CFBTGpt9Th
	iebVZ5aFjwU5HTY1YLnWmXM19ZBRoCa1BFBLpxBI22B+XBXDbeXCW
X-Received: by 2002:ad4:5c4c:0:b0:707:56a4:5b56 with SMTP id 6a1803df08f44-70d88fd7384mr13862856d6.40.1755770232119;
        Thu, 21 Aug 2025 02:57:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqWaMiKK7y86qlSXKsjy23FxD9WLBPQ8WQUmWHwy0IkQdYYOWie51bXUGTqyoqGxLizYaDnQ==
X-Received: by 2002:ad4:5c4c:0:b0:707:56a4:5b56 with SMTP id 6a1803df08f44-70d88fd7384mr13862556d6.40.1755770231656;
        Thu, 21 Aug 2025 02:57:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef367728sm2973854e87.56.2025.08.21.02.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 02:57:10 -0700 (PDT)
Date: Thu, 21 Aug 2025 12:57:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Subject: Re: [PATCH v2 4/4] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen5x4 PHY
Message-ID: <bm3cp2vyw4rpllkwoxoxwrvsjxrtolcroqwx76bkpwmcdvx7ag@b6hvybyouq7m>
References: <20250821-glymur_pcie5-v2-0-cd516784ef20@oss.qualcomm.com>
 <20250821-glymur_pcie5-v2-4-cd516784ef20@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-glymur_pcie5-v2-4-cd516784ef20@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ztPSW0Yj1vBI5BlLSoWi61e1UvNCFQYh
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a6ed79 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=nE5-FXN1NE7ZT85CS-kA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ztPSW0Yj1vBI5BlLSoWi61e1UvNCFQYh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4utlMYDneMU6
 eb7uTSLPytqIdJeE4j0Udj5S2VSC6VFKprF5mzrKNAz2ZNoM+jMojtnTAAsB7hL/XtUcpQiQ6w8
 V72KWswLLfadP9qSrTUvIxcRvRYmUFtTQhJ109XXiwR43kf2KfcDeLC2VKoX6UV/sz49uTb4GrC
 LujBT0puVfhL37gLfGhM2uSrMtTpnmIVjPed4rjG3ItXIYSg78/SRepIPunDEMnpywWxKeTRoep
 zTw5NMszmFk+Hpv6H1zEHEHlWAYh16FMT8VcPNburtMBmkHc1v3TsBsvmhgoGx5rKgEnaaSyaZY
 nF65BHaX1+AVTXTsZD4uXtmaAHsO5Zdd/ofmqE4EU7CKiX/KM0vQoHVZJ6iL3Tae8gI/lzttxI4
 3H2YmFE2ZDS+wnH++zTOT2PzCAAA7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 02:44:31AM -0700, Wenbin Yao wrote:
> From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> 
> Add support for Gen5 x4 PCIe QMP PHY found on Glymur platform.
> 
> Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> @@ -5114,6 +5143,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy",
>  		.data = &qmp_v6_gen4x4_pciephy_cfg,
> +	}, {
> +		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
> +		.data = &glymur_qmp_gen5x4_pciephy_cfg,

Please keep the array sorted. LGTM otherwise.

>  	},
>  	{ },
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

