Return-Path: <linux-arm-msm+bounces-82199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFC6C67F96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82F3C4F526B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 07:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3D330147A;
	Tue, 18 Nov 2025 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTztex/0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HTi08K/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93B02690D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763450837; cv=none; b=ucBzwnzpnlvzatjKu0DJSlFDKHaQWW8W0NbEq08BPZJ7kwlPqj5WuQOjySIpizPi/2018UuScrH2QVSePkKRjZwbcI6VJfHqK8H99pwkVobi8UxTcofGrU5G4YI7BMBgzSimAscvaq3HEJVpzilS0BldbO2yyjeN0qaqmAyrQWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763450837; c=relaxed/simple;
	bh=GNoQn/hthikhALi2JpZPyjQoYPFTEfkr86UlLOs2u/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YO7oDNwuPoD4c78N565taQiPixZ6fmWNQe0vzXSt4kNz2j0zX/VejbEqWRSyLQw87zqkP9TZmutuqnJY9sSXN8EPsBfdrybJS3zK8JR3sb+QOV0uzoNXmqooVqpWgm41IikXXq6Ryo4gSBueR5hEmCnOGymyOeisW0Id46sZYrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTztex/0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HTi08K/s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI1MPCT375295
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+YPJPXMwuMWtPIDlSQE+IIGY
	3z6hcI8lbExcS5jy8Ak=; b=PTztex/026NqxlIOXpfBdEY885w56E0Lf/PCLzhG
	b250fsyFZgxVXFzv7gNSy64bNEEnaFaVsGMduYqatUlnQRNRm95eHwwQv3hWrv8/
	YNTt8RHIfOLI5sNXqc6B+lfU+i5/S/c8pym6IcdzDyg1zPn2Q9QODQcz3fXaIYKK
	woiRMQifn7mjCgnptJOYU0IBDXQ3kitZAn3SnkIs4/lk10J+tPBVF9VmK9dm0/NP
	mVAB1r4q2ptOSxbABkgMfthmvWBYIEda5sQvQb5V6BJJfm+7iYIh0L9QiMSjFe71
	Z2SIzxhcIoUL0pX0sdOzFLVdkxCiq4lJ3TPMvcsGwE+LTQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag599akg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:27:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b95d06db747so5309718a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 23:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763450833; x=1764055633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+YPJPXMwuMWtPIDlSQE+IIGY3z6hcI8lbExcS5jy8Ak=;
        b=HTi08K/sMHDVAiNbYvl9nsgN6cF98SQmgyg44cxtqeVDQPEB0yfWA9Jr0gI3j3/Xe/
         HtPm8xfQkd5OPkIa6yITp0iOfBpGopF2VeUu5Q5pKgFGF7FAU3tVgnVZ/jWuXa06Olqo
         VW/z5Mcp5M+9W+AMpeKuB0oq6+HlHbUbN6HZbBmVM480h4iNDC3HTqWFk2tURUOeKikm
         B2ibPBS8ZPRmwBwOvez15/Em7W04/3zMCkRyZ7QU+8eUYTLTJ2+ZOyJ9P0MjlCpzEV5O
         zOGR9MhJx5xUC906fj6RlV61QwsTQGlAkFRZl7Ko8shcUayJIJCvO7rx1L6YvKXDYfrN
         gT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763450833; x=1764055633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YPJPXMwuMWtPIDlSQE+IIGY3z6hcI8lbExcS5jy8Ak=;
        b=izbZv1kQ8VjGRwUsVn2UN/lXInqqVKgvniPTj7wGnU/VI8D74IU2Qkdv1vlUr07N5B
         CmZ1NRGIHbyo9O7gr1VLO1TctLV61oFKuPvDnLKQncP7Lp+39qmUKR7CiHdDrMED/m4/
         pzhb6jkUqh1JSIJZLZvuAdvMa7AL/GOUaskX4h2ljN3WCmdUOhe87UI+ibbQoM0JfBcv
         IeYp0bbG+sUiADgcJeZBA2Gj4I+Kz7k19yErI/t4DiBNATLN1EfWhupY2+2UC5PiOZBv
         DPtKre+5NRFqJAkD4CdkCY5TWNTIw9ySi7S9J/cVb8BwJKcaDmTte26S+GUsaLBlZqlO
         710w==
X-Gm-Message-State: AOJu0Yz1j740NsOOO46eGdOcEL257zb4Rj+/yXqpPyNSR5kyWS5ZEVYR
	1YqYi3kAJ/X4gsQCKJr80UEQ9q1vQG7UilKw3N8n8yNSdiGo/3HBcxWBYaBwIM/e0qwFUWOIf94
	ioz1TPG6piYVhmpBN1cGWj2ChH4SwZCJrR7ONntV3PiVloe8qLmaXyeokuwumk0bD7V7EhbHC/4
	8PEvtyOA==
X-Gm-Gg: ASbGncszgKDwmdGA8wNw3Awm5jKWLIT0xTncg2mlM3Sdntf40Id7MMZZfZ11K7ur1Mr
	qavPNgSUZ0vPqF2Ngf3H9mAZJZoNhHhPNWPptQ3BktCrRIpLrDmUb/uKrwIFr/AdcceB9MF93Md
	fI1vw1RABdko05PjCCjFg+wNinfHzMg1k+nDNYvm3zpSCqqAoALOVvxnyiydPPOozzjCUe4jdC/
	CC/ZecWe8rOxSldmJySJ1KLDB+Zwvlmf8nJlUUHeaYkX05e3Mlj6fRebvd4dIYX6MyKvBKICSsF
	GzbW70UZ6RXPZn26nd2Ple56NvCe1nw1tT345zRqVlCWaBtW15OVDtif2ziHodND11xc2zxcQ2U
	oarh2qWY781BLJCFIisLv5cEWJ1gWjJlbfF1PpAczya8JiA==
X-Received: by 2002:a05:7022:4188:b0:11b:9386:a390 with SMTP id a92af1059eb24-11c750a7e91mr1070241c88.23.1763450833055;
        Mon, 17 Nov 2025 23:27:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbNCvsOiL8ZS+pAuABDL3Gy6F8Zr8vYWsr5Bzv9WUjJiWh8SDxOqpv8j0+EDDltIqiYDldGA==
X-Received: by 2002:a05:7022:4188:b0:11b:9386:a390 with SMTP id a92af1059eb24-11c750a7e91mr1070226c88.23.1763450832431;
        Mon, 17 Nov 2025 23:27:12 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b80fd6790sm31322813c88.10.2025.11.17.23.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:27:11 -0800 (PST)
Date: Mon, 17 Nov 2025 23:27:10 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v6 0/3] Add support for Glymur PCIe Gen5 x4
Message-ID: <aRwfzv+bs6/4W66/@hu-qianyu-lv.qualcomm.com>
References: <20251103-glymur-pcie-upstream-v6-0-18a5e0a538dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-glymur-pcie-upstream-v6-0-18a5e0a538dc@oss.qualcomm.com>
X-Proofpoint-GUID: h-OKVfhyEv8vQ767agklH3RmqYyl0M2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1OCBTYWx0ZWRfX+V+8QvBqT5Se
 fY1mrblCvZu5KsotTv9QctPR9Fu+UVXvmEI5y4EmZHWOSQYSHni39i7yXKiH2BSp34sU77QD3xl
 /7GexVfyJ0xUbAUP/YKQ010mfZhFjHCY0iyR7iVXWWZuDWCF3wslIq6mx7NjqBEff4FNpbSZPoe
 Hf2nDS3Rh7//3GIhkrbgxrORnW+TJ6TZ29KgqdfjLq20s3Q5z2GZCXsNFivVPlEutmH/QpwWPpk
 m9EvM1h/y61QidK9n5RAoev0LaY89bsU/OrprPEW28j7PxibIuZZrae4T0zmKIcUbMp6p3EUO36
 9P3pn7SEtwkDV3HQ7xSkZQ4+GWye2k4rDsnNVlhK5pRnY5U6Rx4NRQSsYpM8ZGL1pgpeX7ykqby
 tG9SP6wpDjErCXPJSVwUISPvAgfGMw==
X-Authority-Analysis: v=2.4 cv=HaMZjyE8 c=1 sm=1 tr=0 ts=691c1fd2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=CuAKqyvv_hBz-pJDB50A:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: h-OKVfhyEv8vQ767agklH3RmqYyl0M2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180058

On Mon, Nov 03, 2025 at 11:56:23PM -0800, Qiang Yu wrote:
> Glymur is the next generation compute SoC of Qualcomm. This patch series
> aims to add support for the fourth, fifth and sixth PCIe instance on it.
> The fifth PCIe instance on Glymur has a Gen5 4-lane PHY and fourth, fifth
> and sixth PCIe instance have a Gen5 2-lane PHY.
> 
> The device tree changes and whatever driver patches that are not part of
> this patch series will be posted separately after official announcement of
> the SOC.
> 
> Changes in v6:
> - Rebase patches on 20251017045919.34599-2-krzysztof.kozlowski@linaro.org
> - Remove PCIe Gen4 x2 support because Abel has posted it.
> - Link to v5: https://lore.kernel.org/all/20251017-glymur_pcie-v5-0-82d0c4bd402b@oss.qualcomm.com/
> 
> Changes in v5:
> - Rebase patches on 6.18-rc1.
> - Add PCIe Gen4 x2 support.
> - Link to v4: https://lore.kernel.org/all/20250903-glymur_pcie5-v4-0-c187c2d9d3bd@oss.qualcomm.com/
> 
> Changes in v4:
> - Rebase Patch[1/4] onto next branch of linux-phy.
> - Rebase Patch[4/4] onto next branch of linux-phy.
> - Link to v3: https://lore.kernel.org/r/20250825-glymur_pcie5-v3-0-5c1d1730c16f@oss.qualcomm.com
> 
> Changes in v3:
> - Keep qmp_pcie_of_match_table array sorted.
> - Drop qref supply for PCIe Gen5x4 PHY.
> - Link to v2: https://lore.kernel.org/r/20250821-glymur_pcie5-v2-0-cd516784ef20@oss.qualcomm.com
> 
> Changes in v2:
> - Add offsets of PLL and TXRXZ register blocks for v8.50 PHY in Patch[4/4].
> - Link to v1: https://lore.kernel.org/r/20250819-glymur_pcie5-v1-0-2ea09f83cbb0@oss.qualcomm.com
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
> Prudhvi Yarlagadda (3):
>       dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the Glymur QMP PCIe PHY
>       phy: qcom-qmp: pcs: Add v8.50 register offsets
>       phy: qcom: qmp-pcie: Add support for Glymur PCIe Gen5x4 PHY
> 
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  3 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 32 ++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h      | 13 +++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  2 ++
>  4 files changed, 50 insertions(+)
> ---
> base-commit: 0688945f3e5f85f64c7fc9157223f92e0fc5cfad
> change-id: 20251103-glymur-pcie-upstream-bee1d45f5e21
> 
> Best regards,
> -- 
> Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
Hi,

Do you have any further comments about this patch series?

- Qiang Yu

