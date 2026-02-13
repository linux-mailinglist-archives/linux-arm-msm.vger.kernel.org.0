Return-Path: <linux-arm-msm+bounces-92824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMgZD+R5j2mWRAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 20:22:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90168139282
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 20:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EB4430733BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 19:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19F229992B;
	Fri, 13 Feb 2026 19:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6Jpo9CH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvUc/hKI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608EA2857FA
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 19:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771010485; cv=none; b=cKSIFa2nBCeVQnu6WsH+BWRJ54FvejVjHvXZF+6qBZEfScQ8OOnb8Y6wCK3RaXouA2+iXRW6reyA9N2OZuTUIBBjqrczkjjRA7pzkG9SpeXHHPxbzCEuQtsMt5Y+nbFJCKkYU+To8cPW91mPqxAV2T1nhysYqOBPc0mUwNmxpRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771010485; c=relaxed/simple;
	bh=LBhP1N70laMxAtabFHUh0SPSyW/npkn2TmBtw510or8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcJjVz1ZWQEexqaPRa6y+qnhKLqLb9C7np+WSj6kg4nH0RA8F9JaNSS6eDXFC2gG62bDdX+J0UD6eGI2PEgUMmSVj6Kfvua0Kn2ws8G3mmEgSggcclGwhkp56nM5ah02UYe4W+8CRd57rRn/vWVSYgEQS/al9e1IxlJ3X2zRrno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6Jpo9CH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvUc/hKI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DJ2OLK1756664
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 19:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/j+c1dsKAqHBdFM+Jul/RdoFeeY+gCzkUvQYQD74pFQ=; b=n6Jpo9CHKdqjFPx7
	v5EaF8vVhX2l082qisnceDw76JfYyuBwc6L9g1w4yVqlFMNWW+77QDBsi0b7372K
	+S9LsOh9lh4EhGHWcLlUSXL1ZlmBcX1kbd5uNJqC7Kg/Fmi496jZEkJXjGsOWufh
	juv38KO6kgtRk1KTohNdRF3wQuzpnB0cBkPNi5UkDvfn0LhkabUfLFxuKPnAjLnZ
	gZJh0ap9UNNJfjyQNpivsLTgmzY4vpQ2AV6HOKKWDSlVPMu3vAERkLjC0Re8Qfw4
	YbH1nE+Owm7rr8tFYkNi51LG1delweknJC1MCdM+lOQcbsLTK8S5f07uEuBiu26b
	UfGh4g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9mb14xee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 19:21:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-824b42b8a81so3722076b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771010482; x=1771615282; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/j+c1dsKAqHBdFM+Jul/RdoFeeY+gCzkUvQYQD74pFQ=;
        b=kvUc/hKI/Uzhb33akxlDEY1XVDnZjqHViFZEW9gnfWlBP0sR7PKDutmrq9QyxyVwDS
         pcpnh2prFE1ynZKJkSS59sMZnSyP3YIiJmrOmGyrB/O44m1ZjyvOOC4Hvgu2W5tUVx3e
         9zxzVeJoIlX3EAKBa0w4rUFVrp9jgOWZ/CHC885yUMDhumyi/OV3O+KbDpfKAaibNyou
         XD38BOvtYZDIjLyYp2pQTvKAHIRwsv149dkchaoEl4k9ILg60Bn9xR7KPQVX0ienZ0kj
         opZ8WxrEZ21tt/mTsIMByiOVFWf9vhG9sSRWMPiYQWVt//sW078dP82DlxlpU9pT5027
         TEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771010482; x=1771615282;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/j+c1dsKAqHBdFM+Jul/RdoFeeY+gCzkUvQYQD74pFQ=;
        b=DEkPD8023NDHbl/9rvNItpvb4s0/xEg9wgVNBCkpx8UeqEhUv3p2+g21lKbfIbqfbB
         8CC9RBUJgqbaKyT4u2dmSUtXCs6bUHaj61yzZIoLhRUdmsTmc17RNk0wk4IQz+ODh6QG
         cDyvjqXZRxEXzyHQIDQD1r4hZstZtmvPpuc1pWtFsXg1734/w6XCO94y5mH2bzhSsIgd
         CeV2K6N8xH8zm5O97qDJBmUkBVyzBZhpD1WuvhWFgsBMcBhE4VhdeYp9O6IOdKe6aKNg
         TORz6nIiepkiiMzcW6789+RLDc8dJf14Kt9t9QJUGe+Y4lECpj0do63aqga0x7mBMsH0
         0QwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYTLHpufrKLkpW71l6VDIhp5aqgoidwxgnBJhgVQZQaiQjoozAMznKPa3EZum91tNlZ8EhY/Jteg16Ttxg@vger.kernel.org
X-Gm-Message-State: AOJu0YySkGNVs7t+FSgQieq/4Ov9CugFQoXCxuzfboQ/xmqqUq74P7xe
	dArqiAN1q/0BoMsx2fgq8/EpghjDpsGwfbi4cGRybUkDtj21Z4z3qqEsg+la93Fi2+awqGyoOvm
	KvVH6fjMBCo++JKAvQBM8wBtTretM3SWk4kYeZ9MANu02rMFIOwGK2DsAyZ02SIid6YH4
X-Gm-Gg: AZuq6aJsxinR9CfDnTq1BWLZHz+K1qzJvzv42/jbi8fItQ0L+yWsJlIL7DfR8cggipr
	BAkbbr5ieAoCa5Y4wjqyPKeLL6PkPrwAnENkwJ9ox9j3XNujZAQLJU6FzUnVE9XGvAMWw3m/vEw
	hUD4+F8sxTlQ57XqW6O+/Jkd2Vulbm5Nach2oCADjk2vc49Pu+7cmuEp5zPbYWAwGmRL3qCbTFv
	dBYWVZoJjYOmmL9al5ZsS/7XvGxvKqKvgIDqnUGYp4S10xEEJGsNxVytGgyuy2/4L+guQOJnWTJ
	myE3Al8zmwiKzNzOfqc8yJ8AHNA4HWKzcVrZxdqtzrJ7zOYGBZHy1DyyFQQUe2RwSmSKefE5Zoy
	msSVwSR24U51ncOodM8esEkESdOELbVwtwoE=
X-Received: by 2002:a05:6a00:3996:b0:81f:4675:c2a9 with SMTP id d2e1a72fcca58-824c9310c16mr2776894b3a.0.1771010482234;
        Fri, 13 Feb 2026 11:21:22 -0800 (PST)
X-Received: by 2002:a05:6a00:3996:b0:81f:4675:c2a9 with SMTP id d2e1a72fcca58-824c9310c16mr2776865b3a.0.1771010481623;
        Fri, 13 Feb 2026 11:21:21 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bb55adsm3238949b3a.62.2026.02.13.11.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 11:21:21 -0800 (PST)
Date: Sat, 14 Feb 2026 00:51:13 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH RFC net-next 0/9] net: stmmac: qcom-ethqos: cleanups and
 re-organise SerDes handling
Message-ID: <aY95qbcG2BLGVzHy@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE0OSBTYWx0ZWRfX/yOENfZmAQX4
 w7qfb7AGiLdmMPryKG+k2gl/2akkLmKXkWz0zd7V71qp9VkGqNcC4Uk7dal5VkBjCGbwbRnW77X
 JFgqteOXeTSKVGPUVi4OKB8aI8gScgYU3MdYOfbAsvvI9OI6eBxpuo8KjgwNL/czCmdN/w7vABX
 CYESNclmy0hYnGXMN1ZsgmPZ6SnpIfy7RMpms7+o7AMnbKGy5n13Z74M32ZegQRwx5r2oD8O5Uc
 p/5LaZj5DkiAm/QAE9MNdZ1xvvGvL4etBQDRY/YPPbClFNJDMFDbhCQEoxDIdNBnlWIEKBFZiAX
 0GxjIX80mw2tiSJcE8SlM+9lsJNuCXmaJ13T/s09doE2dOAta7hTUzSURgGT1Pf0zNAcHux3EiT
 JqZMnhkw4T7SosjgseuzKQBt1VX9VNteK3BR/T2r+VMPPiwg0lh3ECLLsATNB/g/wClpGW5oM+0
 UeOd/GMGFtrbJOD+lWA==
X-Proofpoint-ORIG-GUID: qtPX1cT-aIyXfV_DM46iFMpNCbLVO7ku
X-Authority-Analysis: v=2.4 cv=asC/yCZV c=1 sm=1 tr=0 ts=698f79b3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=D3qBBfOVRyNl_mCGRPIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: qtPX1cT-aIyXfV_DM46iFMpNCbLVO7ku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_04,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130149
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
	TAGGED_FROM(0.00)[bounces-92824-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90168139282
X-Rspamd-Action: no action

Hello Russell,

On Thu, Feb 12, 2026 at 12:09:10AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> As the last series had issues with stability, I've changed the approach
> in this series to concentrate on keeping much of the SerDes related
> code within the qcom-ethqos driver rather than trying to move it out at
> this stage. This means it should be possible to bisect these patches and
> pinpoint exactly the code movement that causes any instability.
> 
> This series starts with various cleanups to qcom-ethqos (the first four
> patches) before beginning to move code, passing phylink's phy interface
> (which will change) to the fix_mac_speed() method, and then using that
> to configure the serdes and inband setting before moving the SerDes
> code.
> 
> Please test this patch set, and let me know whether this works, or
> where it breaks.
> 
> Thanks.
> 
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  11 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   3 +-
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 114 ++++++++++++---------
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  11 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   3 +-
>  include/linux/stmmac.h                             |   3 +-
>  8 files changed, 90 insertions(+), 61 deletions(-)
> 

Things look pretty stable on the QCS9100 Ride R3 board (with the AQR115C
PHY). I would like to test a bit more and should be happy to provide a
Tested-by once that's complete.

I may also get access to a board with an RGMII PHY on Monday, so I’m
hoping to verify the changes to ethqos_rgmii_macro_init as well as your
patch from the previous series (“net: stmmac: qcom-ethqos: convert to
set_clk_tx_rate() method”) soon.

	Ayaan

