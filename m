Return-Path: <linux-arm-msm+bounces-111609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 34enAcThJWplNAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:25:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 541EC651A09
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:25:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dGL3uKVu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a2YdbvCL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111609-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111609-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFA11301014B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A7E32E13B;
	Sun,  7 Jun 2026 21:25:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0296D31715F
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:25:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780867513; cv=none; b=ZqRYqby/CpRiFhqLitfBxY9juWniqWN8/IdOPJk9lwZ1qL8LUBiHicno95sPzPjqNu1kkfFfq7RSQyU9KRAd3BxUaj391wu6yNbYHYgQBQI6liWakH60U9Zc051Volqz8LG2utdYmEfwi20r44HHrnafaebrUZ4W6WO2ZEZTHHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780867513; c=relaxed/simple;
	bh=JspvaUJRNeFY/zfOlAVhSEXztX+e6YmJbVR2DNvyD84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euGcv2uNJcvtG9pgTfbrK7JmsQ9Zr6rFFDwT35SuHB7N7gktfuDC+07r6yOX04R3SKMX2R8eZjVrlNTE/qD5bXloM0PDVx+x+90zbveltxPYNJD0hs6303RdF6EXkPMO0vjXV98f0zBQK1cNvYlH2ddu2cE7HDbVvbuOTUuqH+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGL3uKVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2YdbvCL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El3lh866294
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ozNLs3FUHY1eJZG59vKhqJiZ
	Z3qQ6l8PY0jEa/SkSdo=; b=dGL3uKVuzuQIgPMrisOPESGgRTZ5gaziUgrAbWJl
	L9IgzWqN+i99OQHGvHbP8VJ8qkUa0+iJ6jHSPMmJUeZJpET6v1GeemKXA8hagB2v
	MjuEFm9ibp9N0Wc5uvVYWKIy8pkuTb9bROEODNlWTOQx95GeiRovo+seaNrSGti9
	SgL8vzAE0ttswpGRoU2BrQobYqvaIn6SI98NqkCgY99anYLYmTvy8dzv997akvxY
	cimLlxwhIFKDkCT2v3ikAOfD56KyRN2gokVDkhpX3kP6p1utDepdhwXB2hnj0NBV
	6q5vytgW4PHQx3k7Kg+5REb+bzq6YqjpbWB7sQ97UPV8Rw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w4vgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:25:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c5794db0eeso4346407137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780867509; x=1781472309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ozNLs3FUHY1eJZG59vKhqJiZZ3qQ6l8PY0jEa/SkSdo=;
        b=a2YdbvCLapqDkeUSFkODH+YeZYHbc0IUzxJWanZY7jyevR6czqSV2K0nAQAbopu/8J
         alW92S0XT6iZI0feCzuVCvmBL3GAddG32ojbiKp/CJ6zvUSsQVpLKrNEPKj2spId6sLn
         k9ogCzaOZFwRCRc+wrUalw/IJL3fUZXorhn+XIYfQGguYizse4IauLjMTdMHu4TfQbVq
         B2d/4N13fJ09vQl3K7rB8//b4s/zqlPA2gu7ZDsL49wY7VwoUefsoxa7inStiZKBzD32
         uDIoTXP9ucMqu2qqryePxWpf/GuUiW/UgGBOAXrzNUKPJPvrl0S7D+PxsgJA1MKEsG1S
         9SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780867509; x=1781472309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozNLs3FUHY1eJZG59vKhqJiZZ3qQ6l8PY0jEa/SkSdo=;
        b=OyNU2Ho9L8K7B2Rse7FeAkBKZwOXAdqK1JjA9W6G8xw2Fig/D1tj+X8EZZEvSg+Eam
         1Uow3ULUjBoTZOCXhbwHT0kckndVsrZmImp8uTkyaDSHt3kgOfGo/yESLOYYo3O/a1Zb
         zm2wKzSxtfu24y0P8A+jUk3gXEp9JPiPGBeQyFcfGqIEsEIezgSojN8hvQN6/JDroCQE
         julGau0dR9Kcm5UQTFcWrosGCJ5YT7KOt2OUhZNJQiC2sfxoqSE2gyDRWZyz5dAueBH8
         cUzVIC8ZjoFFompMFIrhO7c1M6gBIcM17foBZ5r79YwmGFb2+dbheYxJucdL6crhrvR6
         iHVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AU+ZpOia5ZNALrYVsIf46X2zu2/17HAI7owKwmL4hKJc6cShq4dJfDELDkp1pqaD4BMdvgaN/q4+Mur+8@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ3LfByMayp1tTKXq6hOYn8gOvuWfYo8+eLuEOyLNT81Zb6wmI
	LcJBhh463mrh5WWMpXmBUWljFZeL/iHZqz8T+QkndOcPikWYpxhOFe9misC+JVgYFe0xj8iQ+yx
	nrl+BRc6I7nyZHX+wnPkpYSyBI5sOVNP56x/KKPDaVpcAk0UCetmr+/8xWR0RDFFhioS0
X-Gm-Gg: Acq92OG/vMyf3xqO0gNIhpQ7UKLzXkZvBO/OVosFSapbcDIShj9G1eisEn0tuUqUfXd
	Eu5Q7sU8L69mnvs/DKgtyyUC4xCr9aNvr08CQta4GEcZfpX3U8UGDnIvxfgP+/hzrgagMFxOUlz
	oFF+qDKM9taOTA6bIMnMjGKJqM3/iqhHeJdpqsZlGyo/3xuVWLadv8oha/4DnFKMjIA2r0ACcOB
	ot0cV+5G6XVhUiX7ew5mAaL/ywfnkH5SJjaFs2ByFGuBh1/mwprqoPEZgAeQyB9tGh8tt7GFstL
	twPAaA9J75hUB1ibyfNJDRguV5i1Ljm7IXBXZtn/Iyc8FnkB18PicuuRAOnqtidZ9gvxydtdLS3
	8loy1yS6tZFJJlOR+CBXczdnEFaZ9RAHRIfpRx1TleuB+phfC5ChVEUmarW1zjKaEwwbxmm75H5
	KpLLlxlE2PCoszfkdVlGJPpyrjaq50tjQPn8a5z2iW3PPKzA==
X-Received: by 2002:a05:6102:cc8:b0:62f:3abe:907f with SMTP id ada2fe7eead31-6feed1adbffmr7232870137.4.1780867509193;
        Sun, 07 Jun 2026 14:25:09 -0700 (PDT)
X-Received: by 2002:a05:6102:cc8:b0:62f:3abe:907f with SMTP id ada2fe7eead31-6feed1adbffmr7232858137.4.1780867508806;
        Sun, 07 Jun 2026 14:25:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9868afsm3353904e87.59.2026.06.07.14.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:25:06 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:25:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/10] phy: qcom: qmp-pcie: Add PCIe PHY support for
 Hawi
Message-ID: <egojnbup5igcre6ccegojsdrvtokwfoccqhwmfxkoy5ukvuxvj@ailtbrgrgocs>
References: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dcDZHJZljIo9A28TvycqNdNI592y3k-h
X-Proofpoint-GUID: dcDZHJZljIo9A28TvycqNdNI592y3k-h
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a25e1b5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=JfrnYn6hAAAA:8 a=KKAkSRfTAAAA:8
 a=ju8jlmDeA_GJ2jklb9wA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNiBTYWx0ZWRfX2oy+yk3S7foQ
 gtv6nueMVJqMT+EhcmW0o2EzoKmYCH95o19tAGPRinuaD7cOvNC0+rp6PhkcKDMp/t/eEZEnm3W
 AgVLlgMZFFK4QxbDzAeYYT+GG6rbBXs8dAuAZtAycWRMG9IDbXmbA88YFN0pTgVVxt6tuZ2lxo0
 gHuqvSOunssT2N0V5VDXo/65P6SnPFciXINtvt46NWK9cySIf7I037xQVXssLMQZjS+meAp1slc
 E+OpdU2LeWAQPnscN44vWxP7bJh5SoSSaHIm+zFkslnVNFFdfVx/t32Z6DrBnFKCrVJ+M2WyHs9
 3KcBUrVJgUf7WB5LWvAkSOfaP2s8wwDfnPCclTcCkiaWnrfNhnZ97h2D5+8z+W+4V8s4weYtqgx
 1uV+2CH5p0pmc/Gq6dc7yxhNmYbD2SJo0BkEYwDcrcXN0e/1FHo45h84w6jaosGvEwLJb6y3UxA
 BoYlHlhlH1nY+O0AHuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070216
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111609-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:url,infradead.org:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,msgid.link:url];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:matthew.leung@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 541EC651A09

On Thu, Jun 04, 2026 at 01:32:54AM +0000, Matthew Leung wrote:
> This series adds QMP PCIe PHY support for the Qualcomm Hawi SoC. The Hawi
> platform features two PCIe PHY configurations: Gen3 x2 and Gen4 x1.
> 
> The Gen3 x2 PHY uses v10 register definitions, while the Gen4 x1 PHY uses
> v10.60 register definitions.
> 
> The series adds:
> - device tree bindings (patch 1)
> - v10 register offset headers (patches 2-5)
> - v10.60 register offset headers (patches 6-9)
> - driver support with PHY initialization tables for both configurations
>   (patch 10)
> 
> Overlap:
> The series has overlap with "phy: qcom: Introduce USB support for Hawi"
> by Ronak Raheja (see link [1]). Both patch series introduce a subset of
> v10 registers (this series for PCIe and Ronak's for USB). I have
> coordinated with Ronak regarding the overlap, and we can update the
> series to resolve any overlap based on the order of merging.
> 
> Link: https://lore.kernel.org/all/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/ [1]
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased onto v7.1-rc6
> - Patch 1: no change (Reviewed-by carried forward)
> - Patch 9: rename QPHY_PCIE_V10_60_PCS_PCS_TX_RX_CONFIG to
>   QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG to be consistent with the
>   naming convention used in previous pcs-pcie headers
> - Patch 10: update usage of renamed macro
> - Link to v1: https://patch.msgid.link/20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com
> 
> To: Vinod Koul <vkoul@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Matthew Leung (10):
>       dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Hawi compatibles
>       phy: qcom-qmp: qserdes-com: Add v10 register offsets
>       phy: qcom-qmp: qserdes-txrx: Add v10 register offsets
>       phy: qcom-qmp: pcs: Add v10 register offsets
>       phy: qcom-qmp: pcs-pcie: Add v10 register offsets

Squash these 4 patches.

>       phy: qcom-qmp: qserdes-com: Add v10.60 register offsets
>       phy: qcom-qmp: qserdes-txrx: Add v10.60 register offsets
>       phy: qcom-qmp: pcs: Add v10.60 register offsets
>       phy: qcom-qmp: pcs-pcie: Add v10.60 register offsets

And these 4

>       phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Hawi
> 
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 382 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   |  18 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        |  22 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 ++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    |  49 +++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   |  47 +++
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 ++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  10 +
>  11 files changed, 747 insertions(+)
> ---
> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
> change-id: 20260506-hawi-phy-pcie-283933b4113e
> 
> Best regards,
> --  
> Matthew Leung <matthew.leung@oss.qualcomm.com>
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

