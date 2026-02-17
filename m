Return-Path: <linux-arm-msm+bounces-93220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E5fEhq2lGlMHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:40:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA5B14F431
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B0C2300E393
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 18:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79C536F414;
	Tue, 17 Feb 2026 18:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOqpjRYu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXODYcz5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CB9264612
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353623; cv=none; b=du51GMUxZczJi4lZv1z2nxeeLc9qvQUoLTJ6mEqJ/ZNpvsMzutDogelbKF9VJkXNdTMp13KwqeBi1iC44j65GsQ5phyor1YOSZ1K8+9KTiQPqbmM68kT4YEpiwnaZ1WkMDFYCrWbDcQocqmYsVulXCftFeAtpX1xSDDtWeniJp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353623; c=relaxed/simple;
	bh=gL7vi8XaDsR6AJUOsYywCadvZLRWfiPCMGRL+niCQ0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBiygTuWStJ/s7zWuDhm6S0WvosT3Zcydke/Y5Di4nNwnLkAgszAJbvEwz7LfgTJtE7mlgL/AG8R9kztp5Y8C8k0Gs8+jIwNp4dGvwq7uG+C+5Ry1c1ThRv5M2+LxykbxSwKTiGYjLS4tZuYBksWWP6ie9XAuP5my9Djl1jo/hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOqpjRYu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXODYcz5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB3Xti1942820
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4eqYZw+qW466/zd9o0hZO+Wr
	bSIyZjH1x8DDDr0yC84=; b=JOqpjRYupn9Fjgx6aUFYuSq+vqZrEJFB2W4Spezz
	aaDKrAUMKpj14T1ZnKXaGfIOTd50gSSYLFNaayjCIu8h+Io4msOmYBioT6cth/PS
	+IA8j2gt+eG1CVUxqloETCK6/njQZ6CEraP4BXqF+vjbp2kCm5thAOSuOTz68j5R
	ZFgTam9zOQR6DhCgOp/GruFXMeVTGG7NzsA+XtMmrfvM+/Qnwlv572y2zyEhNZst
	H8B8N9SGwgLLH14/wzcjVK4g52PIEc7SZWX1l8m7NrfqSN6VKftAGXkP23pmqy1e
	4e9vR0BdxdkhL5ZB12damwFeE4YLYzUePkKd13oH2Cn7MQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g1fdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:40:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a79164b686so59413425ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353620; x=1771958420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4eqYZw+qW466/zd9o0hZO+WrbSIyZjH1x8DDDr0yC84=;
        b=bXODYcz52NkqU0dv/pEf1lCQ2UacuYhSLFBgl3xupqkuIPqo77Xi5z7eVMp4unRZH4
         3VpI/9OI1+7Xszw9b2O9quoPY5f9XUJTMjVZ11vGacjWXHUyR1SO1YYWXaNHM6tBxIXJ
         otaZuHEw/JFqlenAwr8g5ShvXhcOf5AsZ+DVJNrvCN/+7aCdVoVO3kgbmLFEFKvA4fBM
         DQDB+XzX4VpwP6pl3a/Nn6sHvfwJS16c/8b+qlRx6ssv/H3DV/W/pTX5GhiGhve6ERib
         y4Kq/jkLywn9Ti1QYJN5Q2zSzktacwJESaQ6XZ5GbqcXMHdDVKbcMkAt4QAQgXp66vd2
         ZIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353620; x=1771958420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eqYZw+qW466/zd9o0hZO+WrbSIyZjH1x8DDDr0yC84=;
        b=gL/VqAAVH9pM8GH/t+1Cb8oezkqrAco3kU8SSKgQ40n+9ro7KPkVnedXh8pG5GEWfv
         VXiRxtUU8aNe7LFabiFLr9IdiQdRnsDAKSNjeQ7VlwKA2Udan+qR4Zpfd3K0QNvmdSFO
         mfDH7pSCwaHM069hsNOu8iqHPvtJWAk0RsOfFWsUrxhoskSEcv1wmjaVsj91eon0Zk13
         lNNhQZ6/x+P3KCXwuUvIcYBdUPYcVmePZFWyf0tptqStMSiZMk7j8MVLPFJecb5kDCcW
         sEZU8mM0w/uJt07PmDeU3X3u0t5QW9lf+bVmLVgT3HOVa2UmPDyiakl3t+1ucX2awqWB
         A64A==
X-Forwarded-Encrypted: i=1; AJvYcCWZJMr3aNPFZQ3Yniajm1mZLqzJtkqMr74WKVUXCPnpO7gdTBQ16Q3XPEjCtkPSNc4K95AM02wyn0xVDmIm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl/INfQ7H5V+9niprp+lzRtsxkgiapCXQVqzSn/aphpTF1Agrc
	Wn8VmUvmPeyVCiG3w5M2njezQPoCHziA9erh0gtdEQJEIFMAbFeTSDoPT/6Ij5NdZiYO8QsZo+Z
	dMLUT27OOWZF84ODoHEb4BPAluBESRYFm2+pAyg2pLU4Hv5McAgz+OoBGdnBkJ72O1TIp
X-Gm-Gg: AZuq6aI/Y9+1DJIiwi5EHi3yi2sOTq+uCSQdaSw/GKzdh/NAOQAhkhAj87qMwHFmpma
	/+SJdzWbtBr6yoVNCpCUDC0hD9ppilrdA4uj60TvF4VSspj8NYjZmzAvfvyfzU++foUk7XxW0S7
	W9P15kAMf+M3Y1EEpnDVE8/R/x7WZO6ybq7bZCrlkoPd+DUtsS/P+QuF1ZahrChiDNkGc4bi3xP
	48rgZLP6Exc1yCfy5ZUao4JbMQBco1njHmHlEsO+oa6A0GjbKD8bagSC4oUzV6gNlJO9F/1yIdH
	6UpvJek0GiF3hotVVQJKPCU2KGJ/MrIKLs8upMcWC3stixBscBOKnRH/8WtoI5Ne+VQTSS4xhOF
	0i+OOmoop8Hj5dIe2kdV1VPSYAunlXIb02Qo=
X-Received: by 2002:a17:902:c947:b0:29e:bf76:2d91 with SMTP id d9443c01a7336-2ab505a365cmr131982395ad.42.1771353620404;
        Tue, 17 Feb 2026 10:40:20 -0800 (PST)
X-Received: by 2002:a17:902:c947:b0:29e:bf76:2d91 with SMTP id d9443c01a7336-2ab505a365cmr131982185ad.42.1771353619915;
        Tue, 17 Feb 2026 10:40:19 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad416ee045sm30863535ad.90.2026.02.17.10.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:40:19 -0800 (PST)
Date: Wed, 18 Feb 2026 00:10:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 8/9] net: stmmac: qcom-ethqos: use phy
 interface mode for inband
Message-ID: <aZS2DAd9KQYHML+U@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPV-000000093mr-3iT0@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPV-000000093mr-3iT0@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX12T8T4EaPrwS
 DGTSehWnrHGrjtB7h4otwPQIZ8nmxbGjX6tO4kR2KadZFLYT6WzwQj4AfWkpZB5xmdIhGBFRT9s
 gilUeJlThvI4kD1EjTeMt3q5UL4tPMYrkfnvQXfXqz3p2GrXqKLT3EcJOKO2msZaUIOy41+O0Jr
 7Szr/k0va6XjjMx6colmF/H3Na/8OnqskDavbSfWCWBqiJTlUg678vc/22Q2knyEGtsuUlL5sSJ
 5RuVZjpW+06Ne7dKJk6+LZLFwD4bFbWZqp3ywasfWI59g+kFZURY2fJPBkL4PORttD/YWh8SzMA
 FXn/IvCpfVIzVmytYl2uzvtJNqzDEPN9YmH170FdRkfAIl6oSJBO1YxnTb9ON0yLuG16RfpBBWR
 UQqJcf2rFyeXyQiePQ+XaJz1RtE4C62OMODJb+oTN1AXoLYt6fft8CIJUJFMOxMhb2006peKdFT
 s1fRueW1Vi3/DgMoKCQ==
X-Proofpoint-ORIG-GUID: euzSKbtc6V9AfJ3rliiAf7ons8FeIcSk
X-Proofpoint-GUID: euzSKbtc6V9AfJ3rliiAf7ons8FeIcSk
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=6994b615 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=z4Hhns87Kg07ZqANAhsA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93220-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFA5B14F431
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:18:21AM +0000, Russell King (Oracle) wrote:
> qcom-ethqos currently forces inband to be enabled for the Cisco SGMII
> speeds (1G, 100M and 10M) but not for 2500BASE-X (2.5G).
> 
> Rather than using the speed to determine the forced inband state, use
> phylink's PHY interface mode which will switch between SGMII for the
> 10M, 100M and 1G speeds, and 2500BASE-X for 2.5G.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

