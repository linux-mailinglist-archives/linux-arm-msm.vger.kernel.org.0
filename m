Return-Path: <linux-arm-msm+bounces-113070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zwZWAEd/L2r9BQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 06:27:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CB0683420
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 06:27:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mcdVhBPb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HBxnHKzX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113070-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113070-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2A2030115BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 04:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515CE3033FB;
	Mon, 15 Jun 2026 04:27:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B733043DE
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 04:26:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781497620; cv=none; b=DILUQuk0cwqP25gDDAdXe54JszlUbuywNeM8jfL/ks/poaMPECOXjcnI9wXn/EpixoDDbR5WSk7M/8iuePahiFVFWHMCDyOINCS35htynKX4eYZomqs/YAwac4nJ6BLK0j+38XQBuyfD/es2qIZfI21sNpReX30ngT4J+yAs8yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781497620; c=relaxed/simple;
	bh=xVsyuODdVz9kxo75UvGI4b6xOcgVg2E/JYbrEZYn87o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHDDpNWvTKXnfPqq24hVnvh0XQtWJwkfQ04j7M8iSLOd2JBmFOcDLeFUjoc5ALLNCwDZNpa6x/div6taYAmv7W93N+DJpDjwS1SZj3A1OaXtMqMeK9KE0ZR5Z4jw4VA/qrepigF/6YbwTsDnExR3Y167yezv04kSLnQv/OtcP1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcdVhBPb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBxnHKzX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1ht3M2646541
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 04:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ius7qSkqzXV/plY/PfxR7AWe
	MN4ainKUgEjXPW/93NE=; b=mcdVhBPbSKzQTqHys85yFccY/q1MdqJ6b4igU7DM
	RsQVUFzjWaEDez45O/afLn/nED+puAwousbBXTdh0ZGnVKUhUh8WkYqT6TVh9PK7
	BsrkRIuTk4MYRuiKAUAzm4FuJs7kAr/H8eMt2cjJnbck9DuGouPGuxDP5i3SAG6p
	7bxs5Sxfseek8aNwedw38AJW93R7bI3oOxU8+Y+tgd8ga9nWmnE82xgJllnkn9jM
	VP2a/G6taB+giFNN5sJJd4/KHlqxw0YeE7+RDcH42DlWxYAFuCEaCRZPvRWon4kD
	RMx1b/Tr3/RaYwK0X7w3RGg6gPFr5kmmmjdvdp4hAJYnSg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybwcwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 04:26:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0d0516ad7so30050305ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781497618; x=1782102418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ius7qSkqzXV/plY/PfxR7AWeMN4ainKUgEjXPW/93NE=;
        b=HBxnHKzXT238a/c0wdUam0EWsbCigMQ+1zlG6Y7nTEPgLMT9yPlaa5RlM/2091Wg8t
         p/fpJj7gEQiQUJ3D7SEuxD+sbsMh3aAiKvYDYg+wtaTx5B+XIFo5SHULU2tTQSrXsLHG
         05PAxY2JnQtLCa9HwT5agdxgpYrGI65Wip6Lz1z0Y3TP+0u7u7c29hNpmQA6i8RPlk9C
         1N5t9N7rNw4hT6Izdy/Y8jt1ov7s3RUiDQos8l3xZEg0jUje9gNfi7Zl4qPR7U6pOAAC
         8LwWRMwWA7dYZO2+Ot9kpZ/7uZecOA4cXUcKnLgmfKVgIaCMkqQIDzCGAq5bNqyTzumR
         9kVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781497618; x=1782102418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ius7qSkqzXV/plY/PfxR7AWeMN4ainKUgEjXPW/93NE=;
        b=mUB+3LmOSEyfcUzNhkkE9nQMW+5kG1yeX9zZuAoQyZ897b9e6lj/nabxlFg6M5HaHx
         C+ic2m31jGAJZwh0YiNrsHmbb9NxDMw7k/ZS61hhN4kmeQdMFg3e5rSqEgNiQaFOGlvo
         JNacu90bxVyoA+KU8M/FizVZtk1vEYiiGLUiznwF0abK6vAX2hpu28eb3nE/H9JzzSNw
         aUyT2kTZ7XrgztjDjta36RH+MJmXVnwRTYIZouJzXdG7vTFWtfz1vktCn08UZBM7sOt+
         Yx06sbwuQfgjhwYjwjAsaK/u+wNb01jZj+zPYY2WkoDzI1WWFkIInoVCTm7XA946Vugw
         Apiw==
X-Gm-Message-State: AOJu0YykJ8016Shju7psdU7fW9qMD3YbmVhspOcZetOjGu6nPS5YcE2e
	M4dNbVGVi2rzXuC1hm/xPRUZ1SsyMGoEEv1niUVof4xslpJGIxVbmas8kKUZ7At6U2ZYL3Jx2sY
	UEwigGShAn6KVMjyr4bo7STW3O7xikM69ylbC+W3nkKSh1r8RVHNNlf+Bhui6LzVr18kG1U9yaN
	wDBqA=
X-Gm-Gg: Acq92OFcFQYYUZH1xR2nRTtZHF1dkJEvFEI/SBk7j0lymvB0J5rtBalPZyUShzfNI3Y
	UMQqwNHO277gjrIb4aqUv5S93BWoQUqzlzVHXXu5Q/mhiJNlbo/furJjgJEuWgWCUa1bN9JNj0q
	97dEKIOSw65RaEn8bO7Oe4qmd097uXwb2ZYOw7u/AQ3IgSUeVEMUmycWuyx1MQnQK79yOsHUNMN
	LNVvEuCWYrymrpWalBX/u2KelhKXkD3N8ymXnE5I5p/hHxKw7wmq7ByJPT5bUXt5Z8z9QC5XL4d
	FwH99gxdK/+ZIvbgBLFY3rXsjSVvhjeKFKGMLBtT7itwweaKHzyZpbz+DwYT45xsyO9Ikcnzdk7
	3LxFk4JmIWACLMiIUK01hdduaqZpw9LLmHSY=
X-Received: by 2002:a17:902:da8c:b0:2ba:7881:948d with SMTP id d9443c01a7336-2c664148a6fmr98607045ad.1.1781497617746;
        Sun, 14 Jun 2026 21:26:57 -0700 (PDT)
X-Received: by 2002:a17:902:da8c:b0:2ba:7881:948d with SMTP id d9443c01a7336-2c664148a6fmr98606755ad.1.1781497617294;
        Sun, 14 Jun 2026 21:26:57 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac80asm77208425ad.39.2026.06.14.21.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 21:26:56 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:56:49 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 6/9] arm64: dts: qcom: shikra: Add ethernet nodes
Message-ID: <ai9/CWh9oRpYvHfA@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-6-f0f4a1d19929@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-shikra_ethernet-v1-6-f0f4a1d19929@oss.qualcomm.com>
X-Proofpoint-GUID: K7KqR6BTDBBFw-p029LCwUaOWnjFKYJa
X-Proofpoint-ORIG-GUID: K7KqR6BTDBBFw-p029LCwUaOWnjFKYJa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA0MSBTYWx0ZWRfX09lTbNrjlI/e
 wYzEJdTE6gRU+dpNl43zgAxjytGoGjIDYPcW3djyl25aSaRtxSvWiXsoJVBVgi1qJ3PvUt44+cR
 6hceK1qFZDHoiCAzYvOqfEVPhGCmcPA=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2f7f12 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ppQq2EeoAVl_dUmsFbgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA0MSBTYWx0ZWRfXzWm9X80x775s
 wNkLxeM8Hsx54si2Y26GBtV5xO8zuhfuPci7ZRLWsYupQTH50MqMizFj70jzjk5VY7I6k4hQIQa
 Z/zxKg8SaUeC9KdOCrhxyS+H+KJ1AFT0bXPI4kQelnRlPIjTMaIiXM7+MbaTe9vWoK5OSMqKO6n
 fAh8K+NS/TxfOnT31kNr5Xn/Ld1sXnHqaYxZpBEP1CL9pLmQSop4LO31tjYTKdgAto4Humbjavw
 dfaWqUjIvAdZK/2WVINyTb6XRq9gXxweQwznsURe6VnXvlJBYEXLyOAdz4lT54rPRVC/cBdp68f
 Q1Iws90e/q0+8yIFRWSXq2f7tLqa7RVafdP4WJxLHJ9tgmHpqW4hnj+rCTgTYB4JLsX4hM6QWWQ
 Z/oFfsmiKZinPyyNewpiUl32IjrLSsjdCKCeevMvwh4pIpbLTduy3y0pWoL48miAVDU7upHJ31o
 X2q5Oxc6oNh/UxJuUNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113070-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59CB0683420

On Fri, Jun 12, 2026 at 12:07:02AM +0530, Mohd Ayaan Anwar wrote:
> +			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
> +				 <&gcc GCC_EMAC0_AHB_CLK>,
> +				 <&gcc GCC_EMAC0_PTP_CLK>,
> +				 <&gcc GCC_EMAC0_RGMII_CLK>,
> +				 <&gcc GCC_EMAC0_AXI_CLK>,
> +				 <&gcc GCC_EMAC0_AXI_SYS_NOC_CLK>,
> +				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
> +			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii",
> +				      "axi", "axi-noc", "pcie-tile-axi-noc";
> +

I now realize that having GCC_EMAC0_AXI_CLK for both "stmmaceth" and
"axi" clocks is probably wrong. I will remove "axi" and have the glue
driver enable and set rates for "stmmaceth", "axi-noc" and
"pcie-tile-axi-noc" to ungate DDR access.

	Ayaan

