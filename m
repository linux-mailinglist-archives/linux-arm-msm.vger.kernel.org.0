Return-Path: <linux-arm-msm+bounces-90781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOqVGIbDeGmltAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:54:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA076952A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E134314A45B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAC835A93E;
	Tue, 27 Jan 2026 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6wilfU5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUQwfIWd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3C535B62A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769521511; cv=none; b=Sn2eWLzCkWuCbK7JBLVCQctkek1c2WKThnit9L9uUOjdAg4MUPVJA4uX2GpxNYzQAV955pFAKSg5nKRtM/vuln2jLNLcXwqMY4r21pgjVARkpI+62mimPeDTdFcTO9HAbxeChCHmggrHDcVjLqPQ5BXDc39uRqrvgAQg+3bS7/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769521511; c=relaxed/simple;
	bh=HL18fgXkdgJF9QdeVDk/2U9jrroWxf6RWO1+7ZAfGp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxR/z7UXMyT4ilwl1lTFUqzMZ+J1vh2bG0ZIo2Sgd3EJSy8eBeKDzpepytYbeaiAuvt7fbBliBbASS93PH3C8P5kufHd3PnGY9naLLn3wRzZPVAAZISsR5YEO/7F7VBsNWUgaJBr/YKGV9hs63SspbXFsOPaBuwniRn48rOQK9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6wilfU5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUQwfIWd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RD4o9e112650
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+KoxU3lQMnCDsUz9/HEPI79F
	t/PTbWYdpT8UE6jWc1A=; b=o6wilfU5s8bXBP2STeBnmiA5I6XiJBQj4RpvUpkV
	f4dbXpJVC7BDE73HApnOeEld+tHX/9A86npskqVnIGxMN7IgF0AtibhiEnWvzIbv
	Zm+xbx9TiS/ioqvKOF9qWjK2UgdAvgI3fH07qNBbWTZMiUMB0NB+cSx3iOsC3Edo
	eRN7hrjisUZ3EfUHvN0SHzx9f8Ld0O3qcCOyUm9+UDO+EkzD+azxzvqqmp/OX3Ue
	KYBpq6y1CS9Basa96vDqoJhrtx3xho+UanRP+1CESf3CIRxdgUtUpGWU0JW4ck1K
	ah3R105tTpnnhcjx8jojyw9xmGbNJXaTI/ujT2fUequbzw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxs0e18gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:45:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0e952f153so17013005ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 05:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769521509; x=1770126309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+KoxU3lQMnCDsUz9/HEPI79Ft/PTbWYdpT8UE6jWc1A=;
        b=fUQwfIWdyv7E1nxKQWwc1BwvZDPzHo4Z4XrGBrrTBp7Zvy2KqiS0y4jFnGr/KqiLaS
         DwPtPVvNsOgh9MjZSY1+jUGOM78/WoV5sGcPiMQCPO7Dhc9togsiptyoxHhy9hQ/Bc4c
         hSRCKDiO5+0fJRC5t7yS9hN+WyyVRm9TuBjRCpqSAVAkPgqop3oNhtrc/lZrrnt3+e2x
         M8VGnWm3KkqO/l6/1Bpw9pQ8Jk/TSXxhAdaOORmTClVMjVL8bXJziKgKWQ5UkYVa3Gxj
         DLI/wFcvM61qDjbnzsKkKOf/nQa2Xdw0GFtdqYNZUBco09DqUUTNXooxl6k0/W43IciS
         bKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769521509; x=1770126309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KoxU3lQMnCDsUz9/HEPI79Ft/PTbWYdpT8UE6jWc1A=;
        b=HWAnPvekxnSoe+ev3lTSpBJQxR2yGj84B10yVdlzOiP1jnapX4KMe2M4Qd2e2sHv70
         UmAA8XqVfi+ssWbspLfHcjLc8C9OVtNrTMszApMcZLDQnZADBcwdDxjVDmjpm+BSGleh
         7pAMoUrsRBky9WBeo8HRGVPFYbvdweAPIKmPzogYmt8R0OuuH5Bu0UWNzfjG/ENUXgq5
         4dq2rS1QGKy7mV2967w7rIpsir1PEPAwtyDwsP3WplsK5U/MWqr1gNI/bDaM7Yh2Fexf
         68HU1DAmhhToVLBELkJm9iFXLEhDn+CCMm/r867KbVI6wuKfpEsqiS9acIfnQlXqSlK1
         ZROA==
X-Forwarded-Encrypted: i=1; AJvYcCX5nZb3iVdiPYm2NRphQGCypmOo5tlPPcWz5j0mdnFwTMEPoFf6vvLbikBxqLNISgQx6aAMnE/NhBkoCMso@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpe4eStFzukEctcOja+YAIX5viDbU/D0V2cxbk6E4DYGbyyW0T
	PEzyKNNBH+X2UOlxFKnEHYZLFw58r73k/4iGOELJ3gFPQHeHe+E0lUKfFMAcSRVUiKtkOxWATL3
	AS417oovRHPA0hE3z8EyQbrWT+qW/WJCHlGKtzi0dPiu5uG+fwsxaUhZvo42lqZ/AlHXk
X-Gm-Gg: AZuq6aIkBywwqd06RoGqp7v4FFHy3iHxwIQY+60gAmGpFKFvQvrGgO2A7KXC5Rn4hoK
	eZbOSDGVWNYSebvPvyPx2ilFsUZ8zA47xr66oV+6C0af6CTcOJ9eIvDWiBRTQcObK5OAVEiYweZ
	qM65lQ8DnWFfBFaRooJ7JtqzQL3z2A5jBSAdK70x3rZa7I+brHX8BTJ38C0vyOfonqAkVdomP16
	e6Vozw0svYvSbsDFFNPgITPaHvcDz2y8m0kvaiJGnkAeKyyyCSNssaNUXV9bYjDVhoPx1Zeej6F
	Nf5CbiRn4YWfj2XZqi2pud8myplQ74/hBR4dRnUxY+GELzv9k8SXxf8iv7t+C6Ls6DzyK0g0JSc
	/43A8q7n0ajVv0xo8mJfIDo8=
X-Received: by 2002:a17:903:2acd:b0:2a1:10f7:9718 with SMTP id d9443c01a7336-2a870e18919mr20174265ad.30.1769521508930;
        Tue, 27 Jan 2026 05:45:08 -0800 (PST)
X-Received: by 2002:a17:903:2acd:b0:2a1:10f7:9718 with SMTP id d9443c01a7336-2a870e18919mr20173925ad.30.1769521508384;
        Tue, 27 Jan 2026 05:45:08 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97a81sm116816095ad.47.2026.01.27.05.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:45:07 -0800 (PST)
Date: Tue, 27 Jan 2026 19:15:01 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <aXjBXYLlFChzI7mb@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
 <aXOvV-XRmn_Pe-ca@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXOvV-XRmn_Pe-ca@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDExMiBTYWx0ZWRfX9ZB5GmTdG8qh
 vRinBYyeV23jHlQDQIpmYhukvkRQnJ/WrB/cnEOcOMlmpR19b433x8zdRG+hQINCkPYNGiMt8sP
 H3bHWQGHK4rhZJPYicEOJcOo/8IyB9EeznzxiY8F6ej2G6H+D5nv/bGnSJnoRGBqRMxKhsqReU8
 a4ue3dKgmlZIZ9BCeL7/4yddp68k3NFhkbMieorzu+0RZwZ3uF2i6N0+XUuB9uUiBXBY7uIjHPk
 97wAfaDzTK5cwCeIjs6vWMgwKhXurXqVDlT3fPZOUNOEVMXRNzexiXKLwDnyxSMv0yC9xykS2M+
 5Y03dlJJsoPzFfslU6M8ZnBdfd+NYqHLlusyqd+GN2HnUm/kg3swZMfa++VUiB9QRGtJ0O2mjom
 c6fhquXvaTbkPcvFkeykaNLf2etkQ7maP7EPP53NL95cN8TqG4j4sOp1OI7QddnM1UEQGzDqNWE
 XONavnWhuEkKRFxRicQ==
X-Proofpoint-ORIG-GUID: SnJsAugi_qeVEl0AHv018aIwym2GIwpP
X-Authority-Analysis: v=2.4 cv=Hvh72kTS c=1 sm=1 tr=0 ts=6978c165 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tlC0plkVVdZB6woX1b4A:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: SnJsAugi_qeVEl0AHv018aIwym2GIwpP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,foss.st.com,davemloft.net,google.com,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,linaro.org,redhat.com];
	TAGGED_FROM(0.00)[bounces-90781-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA076952A0
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 05:26:47PM +0000, Russell King (Oracle) wrote:
> Sorry to hear that, but if it's any consolation, you're not alone. On
> new year's eve, I had three teeth extracted, including one that was
> laying horizontally in the palate of the mouth buried in bone, and
> needed in bone graft (modern bone grafts are quite different from what
> you'd expect btw.) It's been quite sore/painful as it heals.
> 

That sounds like a nightmare. I hope you get better soon.

> Given the results you've given, my suggestion would be that the
> following patches are probably the most risky:
> 
> Patch 2 "net: stmmac: qcom-ethqos: convert to set_clk_tx_rate() method"
> 
> This changes the way the clock is configured. It would be worth
> testing that and giving a tested-by for the first two patches if
> that's successful.

Right, this new sequence would move the clock rate setting to after the
custom core is configured. Unfortunately, I don't have a device with an
RGMII interface. I am checking if I can get my hands on one.

I have given a t-b for the first patch.

	Ayaan

