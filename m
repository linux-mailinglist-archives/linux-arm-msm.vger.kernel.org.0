Return-Path: <linux-arm-msm+bounces-95688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANJUASfeqWm4GgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 20:48:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D43217BEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 20:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D2DB30219B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 19:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB20C3A6EFE;
	Thu,  5 Mar 2026 19:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWRqKTXJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kp1gEQtb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9901331F9B8
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 19:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740116; cv=none; b=VFTjU3yNN06QVlD4J1OkBcBfw3w5SheVD50Safgay25mIOYTQ2myMTGklvBg6YbXe3uI/Tyrhtg7Hya8QPWfuq8Lv8l7BMcPdoUPnzrZfZ9EosUFDEkbScU39u1mANdok56yPKJzbK+k7nnxxnvjdeD8aHTCu2B/VnUgGDfR8B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740116; c=relaxed/simple;
	bh=dmLrtFAAtyuGaXYoY+v78OgY9Wdehxq7Jj44ExPzdfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuRlAmIRQc16yJ1Qb3dYFB3fWwSQacaiW/U9NUXvF9FOrA07Pe0jgny/IM4FGJyj/oXqr02rIzesG7AHT1nogIK57IYmGI0spRGIAYY8B+cxUhQyh/mj/BdEKhmb7oYIRVs5FpJZlIFwbaAe1+5SXcEXWLwRCgvgoy7pyb7C/as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWRqKTXJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kp1gEQtb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Ho1Z31517935
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 19:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=brQJvLzGSg1FNHbunEnKNL87
	CiKohImsgvm9vmEVnZc=; b=HWRqKTXJDv9CRYuHW6AkxIrJUi7AT0CwdvxIMPMZ
	yAhmVgLfj0z5w+OFNPRT0xQisHx8Yt3UK/+vQxGxX5KP0P7CzKR7LFaCi/rUII9E
	9pgY+Av8R1//h3p6JXQZj+ry8vPl946OxRAVDnma8KigEffmCR1PpKOuMqu1T28p
	PDg1SVQxMnlvDrEdfw3p/0bXfrH9+XV18D9NCZnVbdDjMqzfBfx0JOOtMfYUYNd+
	as/StFXtjiEoONus6618GPgkciGX4LRf1N72Ec4j5X62GOxVZeGIPef4w3N1Vffs
	I0UYBAAOnW8v1wuRjJhwoVBQnLipRjXuOisw+AGegYL+hg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptm8k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 19:48:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae3e462daeso27427505ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 11:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772740114; x=1773344914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=brQJvLzGSg1FNHbunEnKNL87CiKohImsgvm9vmEVnZc=;
        b=Kp1gEQtbNfoE4exkw/RlCDH1bgc+0+oerboBGEADE+Sa2ckqURB9r6bo4KkFKNwGQu
         nb7exj9XKWhPy5ztwf2oglwR4/aVFu/9FGw1llJYBfHCShNiAcdAdYp040QdM3EfaWFU
         QE7PwL5Zo6rmLJgUaLjbZWrBaVCo80YuQ4kDBh8Xa1b4nz+xy+psFw+AvX1ks6rBJOQM
         REEWCYFfuFargXyDQQL8OgFySQEQxvgV/hMYU2EUPtiSs12Y0mVKZLQ6WkqP8VPLLwoO
         T2y/kc1LtTuYO8fwza66Mxpqar8NkjFALRwrfsh9P46CfbMz3aG6aOPlVGrS3mZYQlba
         hyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772740114; x=1773344914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brQJvLzGSg1FNHbunEnKNL87CiKohImsgvm9vmEVnZc=;
        b=lsai6OTb+QhkoEGZCi7WCbAG4WG48aCD9QtzVW/ustuKfsHWFaFE7FgsdqROYXBl6M
         0gMCnmOGdfCSOH6MYg3J0CPPTlLlodcoNsrUY8dFzOWTxm6+2o8aJhWWVpx0YGVVR7JZ
         GF6WFxr2tGyarZgS/5UUDsb/IfNkZHG/5D/YH7w8+0GCT4ZL86deifwohCzzhzgncXwY
         FYNwVP9D534aXc9kWBWQP4TWr95uRX5G9UOITl4pIBXV8L2aJsHK7BYAdk5HlHAN7uTe
         OCXrDBokckXEjzK4H0N30+2QtHhMrVeYWsai40HNWqSO5aoDxLnpXErdNbf/Q1gN2LBQ
         i3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBCwPdxTGeO+OIbWwUCnQIaoMSa4IsQlping/oWIvo1dTy1lfoWMAOs8O2JMMnlCeMPojTKvfBjJ0SAFvx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw11LMANoRYMZGFUMlZEWqiw2FG2nqv2kdFgud60KfgrTxe71Nw
	PdXPcPAsxERANRRr9gJLfNKqdQDNyExrZkVf7V79QxRratPmNFjyADB7fV37qXa6BUttv0kx6Ee
	bgdAil8We5a8/KW3OV2Ue3hGENhamCSNA9WWR7qooS2H7AkomuP6SxWNVbipGRFMoiZvP
X-Gm-Gg: ATEYQzxP7/lcyR+t2POGIDAyQvpzdQYBQ8nJdG168c9YBtf02nLgJpZ/dLk7UnZ9+F3
	g85U+XKdatxf/qLl2T8tVBWvHyOjsn+jsKbKkABNfjljh3JAyqPDaTbsc99PSolPWOAjEg9ACpe
	FQXMCQ5y0DcroAcnQEQSbTgWfSZrec9lAr6Lac41y1NzanoFELNhbgCpiOAWsbsqjG/am2G/kKb
	v0tSvWkF209ipLhjqkiR7GtBA/+nGreiUt6xw5SrUrkB/HZ6Xay62QweQm67D9z79nXTUx84WBd
	UMTtg/bn7sNXFyfa9CGh2KrnkKeb0J7VmE+zfDfKNV6chQwMRa+zEp0eGf7I+jkHBXvW2fAkIC4
	GGqXmC0hlUDBSMU5GeE3nFnnQMD9or5iVVWQ=
X-Received: by 2002:a17:903:2c03:b0:2ad:ad0f:bbc3 with SMTP id d9443c01a7336-2ae6aab2710mr80733045ad.33.1772740114019;
        Thu, 05 Mar 2026 11:48:34 -0800 (PST)
X-Received: by 2002:a17:903:2c03:b0:2ad:ad0f:bbc3 with SMTP id d9443c01a7336-2ae6aab2710mr80732835ad.33.1772740113587;
        Thu, 05 Mar 2026 11:48:33 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4dcf80f2sm127371555ad.90.2026.03.05.11.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:48:33 -0800 (PST)
Date: Fri, 6 Mar 2026 01:18:26 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 2/7] net: stmmac: qcom-ethqos: convert to use
 phy_set_mode_ext()
Message-ID: <aaneCvwkgMOLFsVl@oss.qualcomm.com>
References: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
 <E1vxS44-0000000BQXU-38lG@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vxS44-0000000BQXU-38lG@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2NSBTYWx0ZWRfXwsn1+CSomcRT
 Ij2FsQ6aImNSFA/sg+yfyjTKi8QrPER30PURDoH9x72OpxxeuAJyuZLXcf9DgQVI1xHCXh4vT+p
 50kHdAZEY3M6wH18g7CHQ/lCkdIgjad20dP3RAF1PAJ5a5TSgU4DKeiFzUc5V9d7He/hIwLznCC
 /0hZiT/yEEtkJGLOfP8JYqgn23Vp+pORMiiDjN+W9OOxPX3jV1Gufj2bld1smh+50QXaSRhz1mq
 jgKKTpxwKI0ZIXo4YCbU2HDqtyAfeXFqRYeb7K+aoiPJReMpEB6rYXInwyplPWUQoLUNSjZZ6Hl
 MVxfNT2q6zPUfS/Poq3trKrNVuVlSd1139wqkJ6MZLmpYj04nFrsKfLpTMz0rcGSuKfIjJ+EO99
 PYB+EarqXmnYya/QFzc49jjIDdcHW3gdLbKcSaOxAuHtp2jpNGBdru/z0X8QgLLtCKmlgmccuLF
 dmK3epjAh0X46vjAVQA==
X-Proofpoint-ORIG-GUID: dts3NKXqVrsDRuskRGziVnkuqJnViM4r
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a9de12 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PHq6YzTAAAAA:8 a=a1qNmnCxCMJs4MpL8WAA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: dts3NKXqVrsDRuskRGziVnkuqJnViM4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050165
X-Rspamd-Queue-Id: 72D43217BEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95688-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,armlinux.org.uk:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 03:53:40PM +0000, Russell King (Oracle) wrote:
> qcom-sgmii-eth now accepts the phy_set_mode*() calls to configure the
> SerDes, taking a PHY interface mode rather than a speed. This allows
> the elimination of the interface mode to speed conversion in
> ethqos_mac_finish_serdes().
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

