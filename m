Return-Path: <linux-arm-msm+bounces-51437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 859CFA6164A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C67D73BD53F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 16:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAEC74BE1;
	Fri, 14 Mar 2025 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RxhYj3ng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763EA38F82
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741969891; cv=none; b=YG5B7MIBSiulJid/6BVdIfBz4ptKYS2F4Y3eAmzjaZeUOvvh+EJTPazehRzYxEFk2Cw4RThf21ow+Es6VQ0tiDHFoyxNeIHtqAWwrfLcX2PuTyQ2/2LyLiRlEq8ZFwXK9CLLtzyD6zF8K/e95LPuKjLOvN6uWT2p4j37LT/71tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741969891; c=relaxed/simple;
	bh=qPY4EN7Af6bi9uHdodXn5eQbRgpjfJXW3bXuBSWyEU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8XkrGTUrPDV+DshlszAAf3gpWAxIRo5zQdzJYBfMgdBZVxEgO2M8mAfVoh9WDY/PyWh8qO8Qq5qeIk9O9GuW74G32ikvYQQp4qXE588XA14WYZ+CsXRgph/Puz0CwlsBVXBPMHxDkCX+C8Pqey5Qsw4BatFSBGDuoUYXpTsdUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RxhYj3ng; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EBTonX031670
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nAXFePP0RbZzwbI0EAHZFL/N
	CowD6Nmqb6dIEWImErg=; b=RxhYj3ng91kdTOl5XwMSLsGAcdRqP8p3BePpYI0V
	bnYvgxR5Y8UwcELrNVfBo3lSfK2rNBPTanTFBJaw/by43r/1tJZBH5kIMm12duic
	7liDuiLtl5oQDTLVPBOqRLpZdkSjuX4mHhcsLlUSQYla9F+IRQuxXRBydGijtS6w
	wZQabBLQ/MCOJj6TfDOhSbk+1io0HvjaVH7YDhCr6rZXPUrthwkgEFTPn3CKlmzH
	byQY4xBAzZ1nmOdxn20/UWiEraA2D3heoKpLlmN54YnW/K9y+waKP5Qhi/a+jPWK
	rNHj7v7RP2cdXzRkLktBhlC4qUfTy/xdyGi21zi/fdM9Wg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bx1jm8k3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:31:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e19e09cc20so45429986d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741969888; x=1742574688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAXFePP0RbZzwbI0EAHZFL/NCowD6Nmqb6dIEWImErg=;
        b=h3xL1TRgRu1FQOXtF8OpqzLFb7hdLQyKJkfReSo33rJzabZvgn8zprK+b5VG3Du1Z6
         1Dc693Ogl65azXjobPCx1K+HgR0NdOgWPIQTTBuE71+G1Uxho1XWOO4KXAu5AKsjdTkO
         ZUeKbwKDBQvmWMDeKd2woCOmO+/qbkBZFFh3/3vcC/UgTCUYAixue6lUsJdds/Pg97fl
         RIZIlA464IojKdYAaCL0QlgWNgRfGsdvCk+ZdPw6BVTnDdgAz0iTiAA6Oz1OG2OU/0Ui
         guglIdEoPJxXTflAbVC2fosOVM0Lx1h0BGogdURPV7fm87160TICOo9dW7zeMzWmUd+P
         A6XA==
X-Forwarded-Encrypted: i=1; AJvYcCXsGfGVaMKa0ONZs0ejOTDXkQc4tkQQ8m3CCCAAiauPlzA8UVlO8pLdFEQs+E7xdHO10G8G/yDRdRZS16qo@vger.kernel.org
X-Gm-Message-State: AOJu0YyiB0gZYubdRiUFRFVPobIXsRO14mmcDgvPKeMjbewlmnxZIPBl
	x/On+vZaMofiiTrnceXwu0CEQOYR42NLYv0rWJ4RbwP2Td2oBzt6AUQyVPSvqkiTkU45Beth0LC
	X0UEpAg+JqcJFhnHkfeRRrxVBX8HUz6Jr0xZX3ii+CY3XpoJZvrzvieD2DlH5q3Cg
X-Gm-Gg: ASbGncsl8ClL/xGZZA4AEdquHWn2sjbKS037EEDQ+AQwcR5TqBRLjBLwVreNywbPsSg
	wIVUvxvKApXB1kEHy4/AsWSpFFiiwFoB/Zk81lidanqMsvQ/AucoQF+EuUhGBrp82HQ5qcwQ6U1
	GK2w+gHSTsupI263d+pt4f0631b/S45ejj8KqGaDTsAUtPtJ+y9FO8Ef7LeGCl+P60dh9kESxO9
	ttLOCr2vHJeW/DCOftSpXXJZoPg1Mqjn+GaritYFMgxZro5NTEGlQbjHL7XCFbp+HCh+ePL5RKr
	jZ7oIUbpHSp1Y7l7ScRcz36g7Dok9vL5X3+dbVq3Zqfix9MtaHoBEHukEaB9B5zCSrXW53mPqiJ
	0yB4=
X-Received: by 2002:a05:6214:1c08:b0:6e8:fec9:87ff with SMTP id 6a1803df08f44-6eaeaa68e04mr43230746d6.23.1741969888324;
        Fri, 14 Mar 2025 09:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtuaStWmz1o7nqkvqYgpWeef0Emh0DysLoQE7JRy9U4dzIkitCXsXSIo7FtqLbc+UHyWVpSw==
X-Received: by 2002:a05:6214:1c08:b0:6e8:fec9:87ff with SMTP id 6a1803df08f44-6eaeaa68e04mr43230446d6.23.1741969887995;
        Fri, 14 Mar 2025 09:31:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a951asm552080e87.252.2025.03.14.09.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 09:31:25 -0700 (PDT)
Date: Fri, 14 Mar 2025 18:31:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: uniphy-28lp: add COMMON_CLK dependency
Message-ID: <p3opci3q32xtxryfo7id67dxx2bhygpqjptbldr7a7cdjm3tdo@25smzojqguo3>
References: <20250314154915.4074980-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314154915.4074980-1-arnd@kernel.org>
X-Authority-Analysis: v=2.4 cv=CNQqXQrD c=1 sm=1 tr=0 ts=67d459e1 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=JRMrfg_3uorDYgpOfGEA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 0I-9gyN-FsVeGPqD88Sjp26VXlJljl9E
X-Proofpoint-GUID: 0I-9gyN-FsVeGPqD88Sjp26VXlJljl9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=774 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140129

On Fri, Mar 14, 2025 at 04:49:10PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> In configurations without CONFIG_COMMON_CLK, the driver fails to build:
> 
> aarch64-linux-ld: drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.o: in function `qcom_uniphy_pcie_probe':
> phy-qcom-uniphy-pcie-28lp.c:(.text+0x200): undefined reference to `__clk_hw_register_fixed_rate'
> aarch64-linux-ld: phy-qcom-uniphy-pcie-28lp.c:(.text+0x238): undefined reference to `of_clk_hw_simple_get'
> phy-qcom-uniphy-pcie-28lp.c:(.text+0x238): dangerous relocation: unsupported relocation
> aarch64-linux-ld: phy-qcom-uniphy-pcie-28lp.c:(.text+0x240): undefined reference to `of_clk_hw_simple_get'
> aarch64-linux-ld: phy-qcom-uniphy-pcie-28lp.c:(.text+0x248): undefined reference to `devm_of_clk_add_hw_provider'
> 
> Add that as a Kconfig dependencies.
> 
> Fixes: 74badb8b0b14 ("phy: qcom: Introduce PCIe UNIPHY 28LP driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/phy/qualcomm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

