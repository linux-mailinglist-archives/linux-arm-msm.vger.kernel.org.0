Return-Path: <linux-arm-msm+bounces-96256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFNOFgC+rmlEIgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:33:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C48E2238E57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 500F63001BDF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521B33859CC;
	Mon,  9 Mar 2026 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXZi76l3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IwFscSDk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A6D38BF98
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773059221; cv=none; b=AnFkDY9ah+vf0iuThoFaAyqFyv9kjeMEa1uM9O3t7Lt0nz+9p+L/HvCndoyQxH4SHNBl16YqGeb21dAKSLw2R9znsHltoRKfMwgez65Cyx6qDmWfLc3W4S19WIuksbNcwTLwVCJy83+YRNznT/pBOagvYsVtrv3tTmW8cvqDdW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773059221; c=relaxed/simple;
	bh=F5D/T0I45Z8bAKRvKImty7SNyckVvmv0OAJZmQG5f5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPNddNIm7ztBEMwv5antgANsJCDifqhDhecrnjDefNXkmRH3aN4zg1w5CKdgTZ/6mpMIz3zJ/Dy3HCXlNe1WyWj4NmFWpaFv5suQ4sZWUkBlhGlm8JAJxX6XtRoPXmBP3EFjjROpNYJvqq0ffg2mYOTjnrxv2jIoLEDdDGpvrVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXZi76l3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IwFscSDk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629A6fER2195131
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rTeDok56LaLfDQuOKEeyhxvT
	asa4vMf5dB210aMR+zw=; b=oXZi76l39P4j9Nrm28AcHNcmVO6jQ/URLpNfbsky
	RDe4ewVm0fu1BfayaHIlA7XjnRvmDP5OqdUbkNM/cC+OTKMfwbUPFt6KlWtfUZcw
	CMqooEO8u9zzOZLY7b5YzVDv90S68eqzO2vSBYVBm7dt5V/tB+lg/nO9q5g8QPO4
	t3DUq29qFjDwbLA1mZOjZruhEG9LajgCo4l/I5cmPxNKk4RCNGO27jIfxbeWvdre
	M7SSYEewtsVtmDXOZ9xKrbfkqjbZ0mU5eCoUv0kuPUvuh/a1b/riTQQ/MA9WyV1t
	vIgJVxx9G30zXya+Fu2uBfKAxP/SSeAIPVtpBNyc8SJCag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5u8epe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:26:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae57228f64so83099255ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773059218; x=1773664018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rTeDok56LaLfDQuOKEeyhxvTasa4vMf5dB210aMR+zw=;
        b=IwFscSDkhEXHFvIc1VbLESwTzVige4PlEWgtb6lc59iBBPMWQzcX1Od6O2T+VlZvDm
         WRnTOOY5oXF9D/NBVsQe50cCpwZQqoC8jVDvQ23nhVFbWTgFKbb2mCfnhz34X6XsZu0Z
         Ggl7VkHZSE0nVUCQOoCNpdy9mjaIejCICO7BBl8rVqv0N6F3l1uudt2aOthx/PYAV7j6
         0uX39vVz6AcYtTcWFeMy923Nyav/uRivgAQ2NLRysSxiW86JzcRBLVPYyd4C4eCiVkMb
         UPibNdwLrxsVaFPPldPOoQnK6FlO2pBnfKqvqPEkcvShhPizalhCVup5zEvYunBGt/Q4
         KD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773059218; x=1773664018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTeDok56LaLfDQuOKEeyhxvTasa4vMf5dB210aMR+zw=;
        b=cjFGEkhIqzvHH6+gYHs2nfcL3zZslo/sy01oT5OdoeVEYHswVZwJ5nhrptXXMsSYWS
         bUzAE4lu7141WphQhQMLfYLgkXhJGUEUcz1w+w6eu/J75KhyHMxwEaG5Vl51KjtXFmEL
         lN2O0PzuCHNxRN07nUp6LFPo/hu/7B7GJV3fw1ysUIMCuhGacbU/zfllmUqcTx0wYFAi
         54/mbyCoV7b65vxT1Rc5rN7MgNVbejikQKDR5mkeDN+/lCy7hXhrgGii70pjsTBiQn5d
         KcE5xiEyx0ler0ZiOiW+89e8rV/lQW7bit0E2E8fnwT5aJkYNk5uhV7+3varz2vj0+BV
         Mqqw==
X-Forwarded-Encrypted: i=1; AJvYcCVmjRkMePreRaBXDpCDdkbzyVLIp/QWOXGr/G6D5sn6AwUXJf9erKcL6O1wVeGmQ4CFF1YevTorl/C4wFFS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9AAiTzVGfKeJ7oBQ3vrf4v5BTUxtIDFQKs5zhCHJtv7VqPK6Q
	EdDNFccuFY+K6TfvpuIdSivCtvu8CETAp07a1K88ZzdPFmeU90LI8iBKjgdPKypW0NHiUMIT1Rc
	9SJRD96XyX6JvLk52A6A7vkdlgTHg03zgSbqUXiNV0/3x5OzlaR52MeQWWJ+/9SI39jfZmxG/VJ
	Qy
X-Gm-Gg: ATEYQzz9G07GDWydToro7F4ib4qAO9PPNhF7nB421F9gMvmqXRSzF6SvbsD6oDlWGTB
	mwwG8npWXSXpQskxn+pPZFL3I/AnZZSjNWjGMq9TyB6ciufKA2YIqSOTxLMYTUf/e4u/wbO0f0B
	UCKOjUkqexayqSxZLSulChqHulXUEqdVUKe+BYeLAjTv411lUaSZZEZqy7s/3X18GmkzY7ErUHK
	iHdDOyExjcdEiveBl7k/BgeSzhddMNNCC0YTGcUX+YMzGddIsKCw6/FxBUMqGfXXlMnEHrCkdz/
	b2CB+o81mXL3HLvDtFj6L7Z5kkCrU1ZG0kRjFeNPtKJIOYaR++JWuDInAU9mm7/nqGTeMsqeh61
	0LUSA7iuhQoM5j9lyd3R+4fQBcc4GPh5YBtY=
X-Received: by 2002:a17:902:f68f:b0:2ae:42ce:1e5a with SMTP id d9443c01a7336-2ae824b8437mr105759795ad.54.1773059217736;
        Mon, 09 Mar 2026 05:26:57 -0700 (PDT)
X-Received: by 2002:a17:902:f68f:b0:2ae:42ce:1e5a with SMTP id d9443c01a7336-2ae824b8437mr105759455ad.54.1773059217193;
        Mon, 09 Mar 2026 05:26:57 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f751edsm154196825ad.50.2026.03.09.05.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:26:56 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:56:50 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next v2 0/7] net: stmmac: improve PCS support
Message-ID: <aa68itP3mXx0WUNJ@oss.qualcomm.com>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
 <aandp3FYSJbwoZxo@oss.qualcomm.com>
 <aatLjarGu_qdRkP2@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aatLjarGu_qdRkP2@shell.armlinux.org.uk>
X-Proofpoint-GUID: k_InasEXhsvr08dGw1z31JFNBXe4CayO
X-Proofpoint-ORIG-GUID: k_InasEXhsvr08dGw1z31JFNBXe4CayO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMyBTYWx0ZWRfX6gt6pKdwQbeb
 s1eFqU377vth5mKvIFhi2+uF1ZpGKCSI67IF2tBnf2wYg8KSR9H+N3d8iMbOMCy7axDGh6HeOWD
 vYOBfXCaTbPEf9VerVi5M6wBELXsrGSkOfty5gwxRgUtOSZ4ck6weCQ3/+2BePU3qXDw+F5iqkk
 DhVDC/xGu6aCX2rymXitKProSRxgpgPB/M8/jAcfbMriEl4kCYW85Jrz21qVV9pAEiVlatdAzqV
 CHdQzTeepgQuj00+yg0r2Cy7GZcHzyvYrJyDn1PfXXMmPtZ6/DVK7otvVwJBuNBS2XbDiWVtOBZ
 mqVCytu+VY0P4wbNShU3qGksJfabZSREgFFTLEV2FKKLV2C8fZLhnmoR7CwXszNe9GPvA5AUOaB
 P/G//I/gjhMeESwxP1KEM/KHY6HpWWTqZ/+ZyU+cToTlArtYvckLz787Gur/wKrmrA3euw4cZZ5
 RQKe4/zg/3hDMGrP/HQ==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69aebc92 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=GKVA2r4k85XJU_JwPvIA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090113
X-Rspamd-Queue-Id: C48E2238E57
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96256-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 09:47:57PM +0000, Russell King (Oracle) wrote:
> Has it always taken a moment to stabilise? Note that the ANE changes
> will trigger a re-exchange of SGMII in-band, which is why you see
> the PCS link go down and back up after the "ANE 0->1" message.
> 
> I do notice:
> 
> 	qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
> 
> which is a symptom that a clock is missing. There's been some recent
> patches merged into net-next which changes this:
> 
> 2cd70e3968f5 net: stmmac: Defer VLAN HW configuration when interface is down
> bd7ad51253a7 net: stmmac: Fix VLAN HW state restore
> e38200e361cb net: stmmac: Improve double VLAN handling
> 35dfedce442c net: stmmac: Fix error handling in VLAN add and delete paths
> 
> please indicate whether you have these applied.

I don't have these applied. I was running these tests with my tree which
had the serdes patches. I will move to net-next now since those are
merged.

I should have done a better job of cleaning up the logs, the VLAN filter
timeout has been there since forever.

> That's currently expected, because phylink thinks we're using PHY
> mode (where it's in charge of reading the PHY and telling the MAC
> what's going on) rather than using inband. This is something that
> will need to be addressed later.

Understood.

> I think you added some debug between the logs that you've provided
> below, which I'll take as not significant.

Yes, please ignore them. I forgot to clean them up.

> This reprograms the vendor provisioning so that we use 2500BASE-X
> for 2.5G and SGMII for 1G and below with AN enabled. Note placing
> the PHY into low-power mode while doing this - this causes firmware
> to re-read when exiting low-power mode. I wonder if that's required
> in aqr_gen2_config_inband() - but that will cause the link to go
> down.
> 
> Note that VEND1_GLOBAL_CFG_AUTONEG_ENA enables inband signalling on
> the link.
> 
> With the above, you should be able to test various scenarios with
> the PHY - and changing your provisioned 10M configuration will likely
> get 10M speeds working.

I will pick up v3 and try this out if needed.
I am also going to test these changes on IQ9 with the QCA8081 PHY which
shouldn't have this issue.

Thanks!

	Ayaan

