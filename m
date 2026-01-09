Return-Path: <linux-arm-msm+bounces-88281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34265D0A621
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 14:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 294C93079AC9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 13:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68AD338F45;
	Fri,  9 Jan 2026 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIwHT/IZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSWc9aJx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C2328C874
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 13:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767964173; cv=none; b=RZQ4HwFPq5RCu4NtM4ma+DilngMLao3ptCspV++DbskN9ggYoLESOnzEKGfwysPq23Fp4MF9b31IXq/iDPM1ITJWKAPK6ZnUF+xnj1ZKB5CUorB9Fyb+Qd8apkV1T1a339OSOycUIAt3tWY7rOqJ8mkegULC7AAyUxQmEsqEeD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767964173; c=relaxed/simple;
	bh=ps/OHQAiC6se3cEW2zplxvs7ZvKj6l3oo/RzaBwZy8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCb9E5QMACQMiMdgZy2wLGCwoJvdK5srUjqQCG16rnmoOYMQ7fcJcNNn1K2TJdomVAJ7B52K9FlXnD/CQquZPfZfNbCyXfxF5/0KsssgWI77pePIuEtTAqju5zdUb4M0aRb+oXQjjYLnqicvCXsFKFIgHNgfSYf+1RLesVvZmyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIwHT/IZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSWc9aJx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609D4aSC3019338
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 13:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R3a7pfMrwbdfP6OiQTe+1tjO
	UlbBTRlV6TY59r847XY=; b=LIwHT/IZ8UoQUUNUe0HlpwrU5Dmrch0OONEB2Qis
	V5fSau88OleOvSYAsy9FtXjjGntVc0wTEjniH1gVnP6DKycrdgD/Wh9fT2a3kvZQ
	sxsyl0EmJR043IR/xx8LCVPH+XYF9BnOKHuKm5si+kbKfbNVREXCsRvOuAOzBITq
	pl5v6sJTpsdH5raa/WEhWwejCwitXCMuu8DK49Haypa3j6rmMQRaTXDWb2y98WFE
	kBDkmJMwpUZKBtDu8t0Ba5QcS+nSibGIiDlVnoGix5MKPl0LgbVnikF2g+42r1Wr
	fZ1NEdgescWit4E9a2yhBcDkB3EQ0cI82wpGwjra3BbVPA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3jt2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 13:09:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a47331c39so105721976d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 05:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767964169; x=1768568969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R3a7pfMrwbdfP6OiQTe+1tjOUlbBTRlV6TY59r847XY=;
        b=kSWc9aJxpVTNJIdRtQzf+sIorQq6U4TIfIrJ5tABKHRdYGZfJtAG+LpQnrZLN0851C
         Y5XKY0G44TAkVPPBHj5CXiDLH8cYCHGG0p2u4Hcb5PHMM5UBA9VRILtPXDwlnsdBZA91
         IR4nrW7BZFJACLPz0vsvJR8yBfyH/U/g9Em5Rkuw3FnjwxT1lk9F+Mqu3ldncH6KejQ5
         P+7+AQST+qxNwmzL3ZxJ7rbRhcumXfUyOOrWug14Qepg9ywqoQgh9kgTuIdgRmosQCGZ
         VOHxT8o18ZqCYAa0Rqru61NvUo68K8x2yO6Q+kM7WCMNn59UbZSlvGpAHly307JkFnWx
         wfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767964169; x=1768568969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3a7pfMrwbdfP6OiQTe+1tjOUlbBTRlV6TY59r847XY=;
        b=mOwtwelqiNFNMubhjGHp5IXgmNDw5QpRC1f/XqZQ2aaGEJ720jjV201jyZ7MTiNdNY
         Hyidm8h2//mNtASh5WfduxkEChhTN2g1GPO+ERnx5XGRpmQGpcdQSV21p9+K+EQ/ER/T
         ppWFz5KrF7G4LIL1fF5NCiRL4mE094a2pkDxKVz2rYIpMzLfxmp7cltDJ3+5QUADfXxs
         jf95uc/qapqw9PFWaSPMkH03BTomj0t8rxwfesgYJUQQeAz2dg8iHXe3ZDL83496pxfJ
         0cYOb31lINt7lZs/nsTFa9WFH/jrerbXjDyJlVzSGMGVOsmA/uxuPki1L1o8z64KuVts
         Jptw==
X-Forwarded-Encrypted: i=1; AJvYcCWIKzsmgY0s3kr5tIpjrAzJ1MZxTouanFxz1i4beS3DHCIgk1OMRMIS9vUYoE/GTE3bb7G+t8bQFJhdZwZZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxiVgXDK+Bf57x5NR22HVksLP53DuY7+cQ9R63JCtXTlAdYWGm/
	lL03EJAXq3F+lERmJD3CxzIOi/jLIP0N9L1jtJXrPszdzHV7G33jFZIEOjEXQxJQW6XF7pCB0EA
	v+soXiKUhkoQ0KzSVNO4rohph1wMRZtoxLMm9H68V/wdSYZ6AsSbrOTvihMYYT1U6KJed
X-Gm-Gg: AY/fxX7ONtMwwz7Vd8SV58KiygobmvownvmmkZm91TU004hWSB18sk+bX/0XoQf6J2H
	fEk5de+kbpJX3F0c/ZmrjO1nByKdqQVIU915iB3VnguX1MXP9i0gZgNXEfTP0iFjRfF7HPPbA3E
	yMBdHxgadFvj6LH50v8/0qUuaFqYgIoOswhrdaIs2z3zURulMXXOu6/z3x6689bzo/TBzuMulWY
	VMKoc+RDwseKASJHgo/22x9fYkRSWGdxCO21OSLSoGFewyDcLjQJgUDuJN4GRZD5cMk91FyfkLc
	Hi/0xC8eeva3RGfpKtwbAyuWuS9uDOG7raRyWtyy0tt6TIsmKPUVOsCn1clh+fmyE2ZCzGVYC9m
	zXC7mLpj/bGnxlL4ck0g/kiYiG4H7f95PwY9DxJkhUZeEDICA1o2um00AmmyOEibi3U64Fu5NVF
	kJjWV/QghDVhiHPpXOPo/B+1s=
X-Received: by 2002:ad4:5fcf:0:b0:888:4939:c29 with SMTP id 6a1803df08f44-89084337fa3mr121940026d6.71.1767964169096;
        Fri, 09 Jan 2026 05:09:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExPjHfm5UM4LvqSExffBGQJ/2HOmM9rKV3EjtLbJMMh8Ei6M6ooIa7N4YvIEzPCYTBdksAxA==
X-Received: by 2002:ad4:5fcf:0:b0:888:4939:c29 with SMTP id 6a1803df08f44-89084337fa3mr121939296d6.71.1767964168441;
        Fri, 09 Jan 2026 05:09:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b71b7eb22sm1841461e87.41.2026.01.09.05.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 05:09:27 -0800 (PST)
Date: Fri, 9 Jan 2026 15:09:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 5/5] PCI: qcom: enable Link retain logic for Hamoa
Message-ID: <woztsrvxwkgi34z3yop7nja6ojbxdboyzz5xpz4xlym75dtyja@iopi7hvw42v7>
References: <20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com>
 <20260109-link_retain-v1-5-7e6782230f4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-link_retain-v1-5-7e6782230f4b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: VBOm0jPDnCHz3UUK07YcbRUC_hqzorXf
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=6960fe0b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=M-jGJTmE-ygQmRKCDXMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: VBOm0jPDnCHz3UUK07YcbRUC_hqzorXf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5NyBTYWx0ZWRfX7OKPWRHCl487
 n1iuWW5HbZUsDqJ36cKP/ssXlJzxqpAdcQjNLwHRTSGwpiFv6sFlQp1/1TD+hTXbzFBWFRmbxtD
 GCg8AjeOXYZSn7m5DE6kf8ySmtqTb3Joskzj36r2JArDXrB7jVDN35UCRjyMMOzIwV/tAnvIbEU
 FyvxY65JmESvSnjTdR8HkPUejn8tcax9COt7NI+UXiH7MJS69pq+v90uaiERx+xpnPFXovUWmZg
 4VrboWu1PguhvgmmvAwF8S9Rh8lm9GYvNptFRQ622i4J5zdeY1UxfKTfzw3RDusEdrfZ8r9AtSC
 4zaR3Pj/tPIjq2MHdz9LErjG+P/+/aNiG8KGlNFmGqzhKzhKeawaButXjgU66xXrboyzO2buGQ3
 +j5sIFVeMkwitSfzERZRejlWqIP+OVqWCj9NShZFJsnHl/eLadGihPny+88spTMAMuCY420oaw4
 cPOca5RO6rc5AGvB/rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090097

On Fri, Jan 09, 2026 at 12:51:10PM +0530, Krishna Chaitanya Chundru wrote:
> The Hamoa platform supports keeping the PCIe link active across
> bootloader and kernel handoff. To take advantage of this, introduce a
> specific configuration (cfg_x1e80100) with link_retain = true and
> update the device match table to use it.

Why are we enabling it only for this platform?

> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index bdd5bdb462c5f6814c8311be96411173456b6b14..975671a0dd4757074600d5a0966e94220bb18d8c 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1531,6 +1531,12 @@ static const struct qcom_pcie_cfg cfg_sc8280xp = {
>  	.no_l0s = true,
>  };
>  
> +static const struct qcom_pcie_cfg cfg_x1e80100 = {
> +	.ops = &ops_1_21_0,
> +	.no_l0s = true,
> +	.link_retain = true,
> +};
> +
>  static const struct qcom_pcie_cfg cfg_fw_managed = {
>  	.firmware_managed = true,
>  };
> @@ -2168,7 +2174,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>  	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
> -	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
> +	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_x1e80100 },
>  	{ }
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

