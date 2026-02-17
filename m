Return-Path: <linux-arm-msm+bounces-93212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNNLGu2zlGlbGgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:31:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEF914F28C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E675030364FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 18:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D604C374165;
	Tue, 17 Feb 2026 18:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikqywinT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXElvxmx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934B23EBF12
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353061; cv=none; b=O1t9FoF8KYWNpwrsEwzxSCJDreF1qb/dwRHSe13tj27a7ihQ5C+N0dzgrs37+tJzVnEf+8QeDaY6np46ZHYgt8CxApwRC8B0xARHxAiImrdVSSA3+87W19V53sco7zfmAWaK5TyD8WCA7qkKM3Tb6B4qzUNKfNGrsYn5PhYKaq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353061; c=relaxed/simple;
	bh=x7VepQbv4zE0qSIXnc719tjSDUvFwelQPfuLaSK8vFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcy+fDMlHD/GA3qpDNsDRwboCTdnc7L/Gh6xg99rxGhRBLH78HpB8FUklM4TnhEN2EPzzktKy2nGE9zEdHQb15PSe48M3D0TVAiMX6XiMromragCAVi0JxhLynO0UPdVl/zM8kob4fEfkmI9FVfQB7BBjF5czhRHAiwPaeRntbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikqywinT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXElvxmx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HDqvvE2960656
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iOD+nAdpJf1uzrUdiNFRB8KZ
	FSJpSBc7+kYwsye2bH4=; b=ikqywinTuKS2fa7esxmRwIAfZa+/VkzXtkVep2ZE
	n3W0IiiKCI09Rb62+jl4GeMZ26ELYqCT0N0tftBYfFXFY6+QDOChej3a3Mas2yqG
	RCWvYwNHtKP8wqMmjnMwuqhJ0jx07dd6QsxLYoJ0uu2odhj0s7dAhZSEwpzVp7If
	Gm2HYurPUjh+dI5jivTFtRpVCSHO7NVSVLi+M70EWGHqBLmnoIAjJv1eGt4MOfwW
	12tPNDU1QGg17uQH/6nQvRUUxrzVABxih+o2KKiXgPz9ZpuQgiGGaQfqGiYxBL6k
	JWhHk2noSB+Emfs3YUqPqzrTHWBo+7C0zuoERW3bxCBhRg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tmbd29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:30:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f2381ea85so231368705ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353058; x=1771957858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iOD+nAdpJf1uzrUdiNFRB8KZFSJpSBc7+kYwsye2bH4=;
        b=RXElvxmxpxYJMnzumRUhsXw39QXGAIUH4EXKtvTlbjcZ4RckzsPH8XPyur13bWHovs
         V5Wd17i+yopFbzmfORHTP3p448TEkL7kG3eTqwYW620vK7FEUIj96u1dV8aRd3h0+X4Q
         cGR0Wooo0AiKd5EQ56aSQQ2tidQ/B6mwLK+XWKNy5g2VcbyhDEhXLCfSLzED9vkZDcc7
         PTvE4W8i/3/L5+746mPY/W1C2A+6SsOBQx1cGXlc/0L4u5FbrjFoRqwE93Z9KGeFTPgD
         q8Piijmuu+n6XjOOS/b/Ty3+K8DcrwCzKPn3oZ3ODDrPalYaUjb07c/v/SC3ClKjvc/x
         5yMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353058; x=1771957858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOD+nAdpJf1uzrUdiNFRB8KZFSJpSBc7+kYwsye2bH4=;
        b=uGiam8CzHcisxWX16+xIdDpI7EAXgmCzNpT9I1ns+pFD8AQDVGSyDSGNXWc6t+pXAl
         UT+Ony9TPRpCt5bxsVURGaiSeAD4IXpOHiJNXk6zZCIvzarknZ4/Ti+3MdkF79QEJDzc
         FaJ6YgwueSv/FHr7Jx4qlfbRy9oFWF1gIPuPwkY9yFiZBhO6FDN72hEfcoDfU4bvfqdh
         FSEi0QD1x4eJ+0kz8CpAuPJVWXNLEZpzfPDFp41ocQfJUC9JGGRTPvBcFQftObq5oBRf
         qHAtkBzBizXjE41aqBZz3bgvGY2DxCTae/2a+72JRlF6IwtHqGgd19oJrsJ7u/8tAMZt
         tlFA==
X-Forwarded-Encrypted: i=1; AJvYcCUYo3bs3fkBLoBWadNhAe5pLxZycicmvohE8JUUsf/NAqfGNRdLHCDSbcq2Xp8ngiRiaH44bYrMTpVrTVVR@vger.kernel.org
X-Gm-Message-State: AOJu0YykjRnAJ7yAKwjPcfsCQoeWRSg5XJczdmGqCF+V3xfbMXGyQEFD
	K6aeEY/ZG5+K1CwEq3QeiT1ifEIeV5695iJ3BWOTHymrW3yAtzOTDc0Ft1lLEPkfP55Fv9kIq6j
	2C4o3HK1WReqZDYQaSUnVsqXxoAJnlOU9e71nBpCL9wiB8DXJmUUWfYoJwn/d1gxtwkFl
X-Gm-Gg: AZuq6aLxl3HXacd7eyw8SVrBfnTuVaDx7PTEU7BbjX6YSORj8LyEyR91x6eIaqJwXSs
	DHBq9VMxHOfb1ch7+Wv3F6SEMCF5wNjCWNuOyqO1mPONCqBqCnfdyITDbUAvaLeUUIZgxa7AJcb
	OQdSccMzR/YnYWEpPUVgl2fnQt0gJ2R9fDirv5Sv/wKJwe416iuhWE/4732yFt3lMcrZSDCJTY+
	xcCj9CkF1eTTc3ept/PjYiEJZSyG5RAKPV10PV+5cCvLLCP4SyMk0I0NTIkS0LKwznwdSJeUIDB
	7rrwL5u//M7cdskdEtVzrG2HKbO4QdrmIygVFM3HBYI01mrV17uphJdYndSuY9nEpcV2Wt+mVGI
	ZueXqGTmQRTl4C2sKWtVzQST88EDe/Wipwks=
X-Received: by 2002:a17:902:ef45:b0:29f:1bf:642a with SMTP id d9443c01a7336-2ad17433468mr128152105ad.12.1771353057872;
        Tue, 17 Feb 2026 10:30:57 -0800 (PST)
X-Received: by 2002:a17:902:ef45:b0:29f:1bf:642a with SMTP id d9443c01a7336-2ad17433468mr128151555ad.12.1771353057241;
        Tue, 17 Feb 2026 10:30:57 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a72e444sm115401545ad.34.2026.02.17.10.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:30:56 -0800 (PST)
Date: Wed, 18 Feb 2026 00:00:49 +0530
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
Message-ID: <aZSz2Z5Ps47XrcHf@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
X-Proofpoint-GUID: EWgnBZauAsgCTkmZVOHO94beZIhE2Wgu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MSBTYWx0ZWRfX3XS/pLxtkRdO
 IqSyRgoRBKaCLm6Fn/Q2vbdx4PFmGcDZWQ2HwEdbmfPogqgjXtvMV1rRAQk65m8ta5t92i0uT0V
 pXmObKgq6u7XVNcnt/wNyDZZVFRdBtHJ7ynR8WZiXNEvhlUZeJ5CekNOZnOPkTtsGrS6znDn/p8
 F9LsHBqXg9oiJnKYW6bCLOvG8RNJgNokk6vkE4vjDlM1VtLWdUFgFNmrA1+gcPoAfAK8KQRACeN
 uDrx2d8j+DiPXEEw9YHKqdqeWQlVvxsouvGeDa5NakYrJrclx4NAQHfqsX4TBkbWYLQJft6fMzN
 T0qD4aIiXIQoJJPtD+MhZOrGhOnZDEkTuPe7E4qEoc5tplTh3K/0WuW46edE5ICgTU/hHggm3BS
 M+bToKeAEeb3SHCCzdVg52vGUgWcoESwPejCZMx+29hIEM4KvASaH9v7c+fy2aWco/2Inrh12L8
 viXUxx5CbpZN8ECaJKg==
X-Proofpoint-ORIG-GUID: EWgnBZauAsgCTkmZVOHO94beZIhE2Wgu
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=6994b3e3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Q1s3vWhG7-J6-f9QwIA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93212-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: DAEF914F28C
X-Rspamd-Action: no action

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

Tested without issues on:
  - QCS9100 Ride R3 (AQR115C PHY, 2500BASE-X) - 2.5G/1G/100M
  - IQ9 EVK (QCA8081 PHY, 2500BASE-X) - 2.5G
  - QCS615 Ride (KSZ9031 PHY, RGMII) [0][1] - 1G/100M

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
---
[0] https://lore.kernel.org/netdev/20250819-qcs615_eth-v4-6-5050ed3402cb@oss.qualcomm.com/t/#ma85cac924488d580b971e6477e7df30dc7e48045
[1] Ethernet is not yet enabled for this board in the upstream kernel.
    The changes from [0] were applied locally to test this series. I am
    trying to figure out how the board deals with RGMII delays so that I
    can revive the series.


