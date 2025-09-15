Return-Path: <linux-arm-msm+bounces-73599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C36DB57FC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 17:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D04DC189840A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 14:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA63340DB3;
	Mon, 15 Sep 2025 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXh5hcS1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE4932ED42
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 14:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757948076; cv=none; b=Wq9j8PtqQKRV5ocPMM5qfmpJmkzNcLfD5p0G/huvWAFPjbWvFpPFCXPrVQYc/bxQv1V/s0qQl6cOFXhbkAT7NvJr2MFGdSYy6sRu5jMhzjD3FnTzcGwGrap9Gc/En9aLOOfZUynEhpWCFkZre7VC/F64FpLi4J0YcI4CqxsKXZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757948076; c=relaxed/simple;
	bh=PS/pbmTRXcygzjKLV/ZriweIInnpNBJCFMpcte3A8mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZxkEZTPGLQEE/gJouG74Q3o/nOKAs+6va5uu8SoCtGeLYfvlKiFzFZbzfJjswNm0q2jm5UdPDVvpQHWc3V7rrxn2CMAXBO4pE6VUBhWpg3Uj4Ztmhn9fhJYudrxiC4qOadG9d5EcLJgxLZufL+CWcysZaCp8/K223zRSTRGXKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXh5hcS1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F9QrTM022184
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 14:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TMSXgi/BqIZSCVKz3fftJI0C
	kUt1hfyDi31hmUWvWS0=; b=aXh5hcS14xPsBunpQrH8Eh5TQbDRg0PmqQNaHo/6
	9S5xu31giH22C693vkM+MrT3c0BnZpy3kubiltEDzBV2AGFaDTZ2e/nUSAioudg6
	2d7jOHE77Hdve05PsSQpNzaryB8ftWFlOBy6oW/FhYwB9w6zK0ifHxkKFoU6qedT
	s2yl9vDonKEeKN89fiswvww/SJVFcGrmiQhjFvE3zqD8PoCewii1RfrPc6a+w49x
	jDns2D3p+956O/I+QPrKrGO8xj8iDWtvsxhIIcDeCP5djCM37XNOHxj2m/kWt3YM
	DCO3tmL0Yc/pw35b7pddxCE7GWUkfsGfFek+YI1xAA2d6w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n109d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 14:54:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2507ae2fa99so80982215ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757948073; x=1758552873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMSXgi/BqIZSCVKz3fftJI0CkUt1hfyDi31hmUWvWS0=;
        b=F53Q+v70FJnBCEuv34MTGMSsc2NFBoxWDtBFGTygE5ti0RY+QuXETs5U0ubplKmF++
         qWrhI1oL0wJSvAOebljt6aHJGBsa5qOPQAqqOq70vvFZ+hes/yn7y/H3+DaenmsPOVAg
         hqn/lPlPNJotu4cP4wRNfYj0SREWOknup5rSfmaKqGJsNnQe4hMpcn8uGGcqVunzlzyH
         FKYK0xjKRIvgMCIoyMR2wONpDNMcxmn1SiHi0oMbLX8tPNj1J2dM75FDnDyjn41AR+eI
         JXf6LSt2X4jamkhFb2nswVhN8r6Bi++oPtsF47PXP0UR+w9jF74D/wTiVxo6LmF/v2f7
         HuiA==
X-Forwarded-Encrypted: i=1; AJvYcCVKiHenUjW4Cdq7EAABpuwbH85pBmHa2B9vbC+TeM7yytc2nY7Pb3N94En/jAqkTNF8NKm4wyzdrXqZpcpO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi6IW2+i4lNHkoxP6HEdn/h7sv4odSwbTzDxgMKS7dt7MOF6qF
	gJcjv3sMlgYDsQXbUSF0B9t9x8hrwv+Xvtow9GO0xCQhP21d7pIY4ygSDPrKQkNjoXeN4h7HXMx
	a/CzPh17h9K2JDa6KyE4yn0Jnp8xBYdqgKOZ1omfkkz2Zy6ab27HBdWiN7NgXAHVtpoh8
X-Gm-Gg: ASbGncs4Mr5lu8/VS7EZt+O+oEEBr7LP+14paBRVvNWtD3VNcnUx74QBVBxXzCj/6J9
	aqZFXfMkQ8uMQCAMz8noUFqbEggXaQfF/EZiwoWn0paBCyUBLCgWUCmQ48v+m5ohL+gY06Ho0h5
	4r/cyCq5I7kwqduoiHPMzecwoWybc6iZqmD92DTZu1j2cW4uBztZAKaQYvPj/Zd+bb3xp0GJqWH
	fW+4ibI93qQ1RbAJYNUarQpq3CO7pdyakbJ9cnC1VyUKWAsf5sxF7WhQ6Fd1xrfKF/YTBqglaYV
	T7njHZO7Ml1jCJAFCURQHckwH/du1mOGAY+QLJnkV5rIdUGWNISWHQ==
X-Received: by 2002:a17:903:1b28:b0:24d:4d8b:a17 with SMTP id d9443c01a7336-25d27929650mr163440625ad.56.1757948073183;
        Mon, 15 Sep 2025 07:54:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoNwqnfXJFToAd40yGFcgFxbZGcyYvpuu1gaAnNng/OHoz50BZQe6dvr+nmCY5nQscoatjSw==
X-Received: by 2002:a17:903:1b28:b0:24d:4d8b:a17 with SMTP id d9443c01a7336-25d27929650mr163440125ad.56.1757948072624;
        Mon, 15 Sep 2025 07:54:32 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26628eddb09sm35094205ad.59.2025.09.15.07.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:54:32 -0700 (PDT)
Date: Mon, 15 Sep 2025 20:24:26 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qcom: qca808x: Add .get_rate_matching
 support
Message-ID: <aMgootkPQ/GcdiXX@oss.qualcomm.com>
References: <20250914-qca808x_rate_match-v1-1-0f9e6a331c3b@oss.qualcomm.com>
 <aMcFHGa1zNFyFUeh@shell.armlinux.org.uk>
 <aMfUiBe9gdEAuySZ@oss.qualcomm.com>
 <aMgCA13MhTnG80_V@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMgCA13MhTnG80_V@shell.armlinux.org.uk>
X-Proofpoint-GUID: l_V6EVzpQuyL59kmB2svQvQ6dZykSmZE
X-Proofpoint-ORIG-GUID: l_V6EVzpQuyL59kmB2svQvQ6dZykSmZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfX4X1HDVCpDruM
 sycjw6v1xzL8Sf0ytuWPT1Ox+2VUltFmGZmB+8QXYvdTGFL9xDB6hugLAkLlaJuzNg6QZ+A5S1e
 IH3aD1nr6Fh/UfXiBn9HXKMqqSLvEj3sDTPy6NnIHbSiZEQERXDeRCLzCbSrw+/7bIZo9E2FKk5
 CCnh+z1/gwMl8cNKXk4oDY/r/3iwIcL3VaVF6d06UxeIBEyWTFWs49XSRVYhVtSSlyz8fZe1Bun
 ZCn39dRA4EU1KRkU8qFU5uYs09y1kx5tG6Q4iUOewnqaxgRx5eytfINnkKrusdrm976nBpGyUFd
 Xrik7MPknqiVj9yQeHVMAxlSydG+TI50weltRhmLLDt9vlBV4jtV+jHyDS/2ifmoBJXFdasU1hw
 AhuyLsKc
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c828aa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Tu3KNy09MRMvIius73gA:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087

On Mon, Sep 15, 2025 at 01:09:39PM +0100, Russell King (Oracle) wrote:
> This shows that the PHY supports SGMII (4) and 2500base-X (23). However,
> as we only validate 2500base-X, this suggests stmmac doesn't support
> switching between SGMII and 2500base-X.
> 
> What *exactly* is the setup with stmmac here? Do you have an external
> PCS to support 2500base-X, or are you using the stmmac internal PCS?

Internal PCS. But it's not really pure 2500base-X...
I found an older thread for this exact MAC core [0], and it looks like
we have an overclocked SGMII, i.e., 2500base-X without in-band
signalling.

Just wondering if registering a `.get_interfaces` callback in
`dwmac-qcom-ethqos.c` and doing something like the following will be
helpful?

case PHY_INTERFACE_MODE_2500BASEX:
	__set_bit(PHY_INTERFACE_MODE_2500BASEX, interfaces);
	fallthrough;
case PHY_INTERFACE_MODE_SGMII:
	__set_bit(PHY_INTERFACE_MODE_SGMII, interfaces);
	break;
...

This should ensure that both SGMII and 2500base-X are validated,
allowing switching between them.

	Ayaan
---
[0] https://lore.kernel.org/netdev/4f642463-3a8c-4412-a007-42fb65c4276e@lunn.ch/

