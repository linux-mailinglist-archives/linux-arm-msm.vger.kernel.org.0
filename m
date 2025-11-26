Return-Path: <linux-arm-msm+bounces-83398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8BDC88B98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8EE4B34E932
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392C531A54E;
	Wed, 26 Nov 2025 08:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UB6Bd9EI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frY8lBc4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0733161B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146866; cv=none; b=f9K4YTqcwNRoULueps7QROkx7cniiCqlUXPnhXJDctb2p1bKtZwHA57c/MMUObDYmcO0Avb0ZY3wuqrXgC+3ReUIh3/+5hLrG45nToH3LXcqyrQ2tkR5mO9j3Re0EiqSTdRFAPmPw4qW+CGRHqfzWf8NltgukDG9dBwu6+RfuHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146866; c=relaxed/simple;
	bh=Y2lKCts5CJPNH0MSL8iowT5ojUWvEug7hDEUecBfUVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3ONX68xQOeNjr4FaZma8KuuLU6LrBTT5GDRnJM8QpPzsil3OKIuL5+S28Wu0u985F4DLAGbGOaQrgLJS8Dn1AN37/7EvjQkn3IiPkyo/ZJXRaYzL0wmLQUGox0ZgtxnhBBTpvQEftszk7BaPo5ziafKGmA0LM4Z4VznDMRXIbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UB6Bd9EI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frY8lBc4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6TmBJ3738620
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SA1QjlGJ7UYJoW3bkSJoRtZs
	L6FcyH/jM6IDdNF5+J8=; b=UB6Bd9EI6P8muNVAQscUaIaGfC7kuMC49BYKjbei
	1V1/iosNN6MIkLMh6DKABUch95CiOD5jUzz7iv9IMIFvytw0M4hpRPFVG2uaFlcc
	nO+sV03z77Q/k7BJN5SQwoCLAqAgwqeEx2A1WjI91UcKKa4oUr77MqPahXDpRzg/
	xYa4tZeAuKBm9NatR8pnp36yy9ejrzs3wY34wtnNDUrsGvXTniwESyc0ecP1LLZ/
	ufWXURD0CaUhJEWi0ubGkSpHAex/grcajiUBdFwEwgXN3+teQ1tL7cr2q4GNMqE5
	G0uJIJHHerP3JiHBdv5RM9biDu9Yo6Bn8nJOW5ynj4ro9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggyj5fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:47:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2d2c91215so1590384985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146862; x=1764751662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SA1QjlGJ7UYJoW3bkSJoRtZsL6FcyH/jM6IDdNF5+J8=;
        b=frY8lBc4vePUvaBX7FO/Xg3QH50IpD5akvcLvNUOx8WppzKrGYjNmF4tJarnQb93+2
         nCe9yOfxkE67u+rSotV0NVUJt7acdqEcO30UA8fCZAESBhd+6I+Gp/czXWKjeNW7xVQE
         u9W9x8AhVOjzXlkxZ4cCcgk37rQJHXITn1YqidOEdy2x+9y/bjHLSW0DQ0UC6qZeoeId
         04n9TgYfz5nPeMZOiaxrYypOj0ckJ7VoxBoQMf+64M/Hl8peeUtpXINxt+S+TrloM4KG
         ebWYO0/MeWOs9ZA3VWxmAPjFLez5JEorS8Hlql8gO3bqcrAA1xAiiUnmr/NVWeaKyA0w
         yXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146862; x=1764751662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SA1QjlGJ7UYJoW3bkSJoRtZsL6FcyH/jM6IDdNF5+J8=;
        b=CHj+5E5bP1wKiPRulG1Je2B93u2lFcQy8KMelsendLyzTUob18/yJHVW/9F/UdOj10
         DC/nd8mwhpA/RiY2WasZxgnc/4T007i6Fm0Pe2pacjE0eu5g+S7sWjPVmVjKxCe/NZLl
         pc4e/J/s+7W6a1w+gVLSomzvNFDCJn/jdqin7oW2lPMk+zgJ6+EaMQ9xLf2cJKt+tkzS
         QTMPjdlKLeRxoBDWpDQMIjHqK74EfEdK8SjLtVPXMLZurnOwpH9aNMbvz3kbcOuJJWIM
         tKHQ+N7W4hsq2v5v+WDyaflJSV/CcbNjtRwsdZDXwPlksKgiuNGSf2MRQR1t99+lJsRm
         HORA==
X-Forwarded-Encrypted: i=1; AJvYcCXjpCjRODkGk4mxsc8nzI1Kf2RVZvMahVllQhIL1+z2Jm+56jFqYaEqzDVNwhBUDMW3VfVZ9M4wkFTxfNhs@vger.kernel.org
X-Gm-Message-State: AOJu0YzJjZG4wLLBmPITamg/Rk9Xn+Yw7YdCuvbwTCdf2s/QdeWa0MDk
	bVcSNEKqpaDq32AJ3qnkv2wQmuc+nZQNichMWIUAZ7C0jqmQeRRXYoTr8lMYcmu883hR1RzzwAH
	ghJujQcXdw93g8Vy1FGMVDxVfmEoWDPLcG/W+6iHT8dRg0F4JH1EvNmACiAFPDa+O97gf
X-Gm-Gg: ASbGnctHifJK7zk5SR6v57zfQBYvPWVDx8rDn9/YfYAKuaSMYfICXLKubBnu3Npm61v
	UZWuKY/J66Wu+VQuKqgh0WPU4FlkFgvuWUVmfE6+zzgkVpKG5/wbpBhGFlH4l6UeA6G31qPkNT5
	df+9/DmmoFRplOn+XGszwHIulUYA8X9iXPnvXrj8T1UALkqsYxzyLHr0f0MWlD03R8qpzn1yx3S
	veGxyeML5w59AuVUv0sLLSc3lzkt1cGMpkw/VDhi9+ecU8mc7cxiQODr3idifVSjxd8XVZabmoT
	mxGyYa2XSJmBBAlQt3snjEvsXm/ALLNIQG9pbZa1VY5o7iY+JMrg+RDvkm5NEKc5DMzxkLrB5vD
	K5toKoiCjdEL2QlX8oe804dsbCVACTg4AcNktIUskbDrn3lPsonYHLZFEydfmRGS9D9ln4SaG3W
	wci61wsjgMiCyTku1cmXH5NmU=
X-Received: by 2002:a05:620a:4102:b0:8b2:f0dd:2a89 with SMTP id af79cd13be357-8b33d1f009dmr2299921685a.37.1764146861911;
        Wed, 26 Nov 2025 00:47:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8s5j5+VqMpqJZ/EsYjx8m89SW1+XSyVuNt5iFdlq1JMKVOVOpsI8Wuj3Hse5mJd69888Rcg==
X-Received: by 2002:a05:620a:4102:b0:8b2:f0dd:2a89 with SMTP id af79cd13be357-8b33d1f009dmr2299919485a.37.1764146861487;
        Wed, 26 Nov 2025 00:47:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc5be9sm5716685e87.81.2025.11.26.00.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:47:40 -0800 (PST)
Date: Wed, 26 Nov 2025 10:47:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        bhelgaas@google.com, robh@kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Clear ASPM L0s CAP for MSM8996 SoC
Message-ID: <utecia46qscniiapbki6nonn24pr7rimxh5mkptkbj27ohvgsv@6fftnshj3rjs>
References: <20251126081718.8239-1-mani@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126081718.8239-1-mani@kernel.org>
X-Proofpoint-GUID: LBePiPV9GQjk6x-2RGukJXPz2QfO7atp
X-Proofpoint-ORIG-GUID: LBePiPV9GQjk6x-2RGukJXPz2QfO7atp
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=6926beae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vqDPTjLrrVU5Klh6hrwA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MSBTYWx0ZWRfX3vcsZZP7pnca
 D4Mi0pNSAnPFrOLTQwZSNtZk+d1ktSma/zBH4YffNcZeTyeHhPr9XgWd94NQeeD7UzFbM2Imm3X
 TDXjYLPO//gXcTcHOGrj8wn2l7jx6pj7Rt1gU4bsbB8CtRySjcYvHZhSY9IKMUvTexZwV9qBCpj
 nSbQ8gHZPOLSnUWS9PS8a5Tfk4Cd0h+NOwZatY2a6UUEc3aNpYWlv3SwXVplItVv9Gmly9ToAuO
 syRbqur4Rbh0O4tnn2SkPYjLx6OLsGxNv15ncst+qeWPIXom/MxpZEnIgrXYqOd/8PLZQGz9A4z
 ravrKMloCAV0rcV+OP04mZf9m1cyI7ILqBaOS5fF+8vbubx1qFAQakPqHLTagfsIXLMeSshDeW6
 1vnF5aYs0aV67nAcxeXLhzYeEl6DwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260071

On Wed, Nov 26, 2025 at 01:47:18PM +0530, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Though I couldn't confirm the ASPM L0s support with the Qcom hardware team,
> bug report from Dmitry suggests that L0s is broken on this legacy SoC.
> Hence, clear the L0s CAP for the Root Ports in this SoC.
> 
> Since qcom_pcie_clear_aspm_l0s() is now used by more than one SoC config,
> call it from qcom_pcie_host_init() instead.
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Closes: https://lore.kernel.org/linux-pci/4cp5pzmlkkht2ni7us6p3edidnk25l45xrp6w3fxguqcvhq2id@wjqqrdpkypkf
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thanks!

-- 
With best wishes
Dmitry

