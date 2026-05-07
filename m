Return-Path: <linux-arm-msm+bounces-106540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID/JE+YQ/WnjXAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:23:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B11264EFC44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D8A9301DE29
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 22:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6076346E47;
	Thu,  7 May 2026 22:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Hcrw5OJh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDD433ADA8
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 22:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778192254; cv=none; b=EZrq6unxaMY5xAKRjVp1uReoAdd6NOp5bMvrAZz2ZRWlKFS1Wk1KoeGUa+RtuLp/wTClTJmymShsrcaY63SDTSQqkGo8oHe4QZM0+LrWeWLyoQgjEkwIJbu2j202InR327pCANEKE5pDqEVMEAf602/0HU9fSjFWdQnO9Utoc64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778192254; c=relaxed/simple;
	bh=nUqtAeSwtxg2g10Nn3t8JgkOkKTEyo+HUlH2xOySZMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j52tsnSM6gAkgIJlSNtwA56vFfGd/seaEzzaWT1N18efhIwdi2ow2lByi47sd10zeMu4SctzzVFn8Z5iScRoKEdkwNNxjjJRBWdbqmVtadcT/SHMwxh01BzKpH6sf17Ds6DW0PUZv02dp64bWqbOF0M3agqLAW32jC67dBD54qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Hcrw5OJh; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8f83efb5729so130009885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778192252; x=1778797052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2Ov38+ykmqD6nZk6coLqjQ6cOEYuoDtYD74/Mx9UCo=;
        b=Hcrw5OJh6PlWZxzRnvFn+UW5odJBcqGZFJAcf1xuY+dVv+t7TCtX/vMaAWFjnVG6Yl
         s8oCh094BPUtVBIgneGKmDXKHHuzH8VjK4vRJtA4Rl6w91nS9Sa03BErXGDM8Oha97dk
         DFBaOSG2YwDEK8fJ5SrMSPqxu79cKZLhgnOh89+RnV+k7iyV/GB6Z7JdiAXASADEJvym
         oylte+CJp0zC4SJBr5DZIudaLYj/Q9TVVIuLGNsdPJISYCzy4uWhcPby4JoMNC8bsoET
         O9flifkcoqz6p1mZHo5I5LI206l8rwCXTCivGBs2kjGFapbOr5zY4k83j5vAUmXaArLP
         LNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778192252; x=1778797052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2Ov38+ykmqD6nZk6coLqjQ6cOEYuoDtYD74/Mx9UCo=;
        b=LIrnPUP2KvHBxRzWz+jo3lzuZH9Yqe8aZ/I5eo4fido/MJ+46UyOIGxarWbEckdzi1
         KLE0q1ASb9WA2IIeL1drn1gM/a0KYOa8M0pmJnmE2euzS3BSId7393ZwLbBaNy9MhPgy
         qxsvU70Y2c495iNhvdbkTJvpbUDWQVAydj4KgATyBhZqRNRj827Wte88SRJoTu97KNRH
         UD+Bhmyq9iBZ8FF84YehNrxkJzC3Q8aeVEVFVD0IxSQp8hbbmkQG7f/fRwoP2nDVm3TH
         JkQyseeOSluST5azPhCDcNMeId6kUHxywADCb9dGVmWtiTkveOsT7UIa1U1cpCTVvQm6
         GODw==
X-Forwarded-Encrypted: i=1; AFNElJ9VDnSd8Ba0p91kT91+LtmmZ49Np6ArVBB4Ty9xp0mjdZw7OcVCYl77Oxh2KOGars0UAndZJf4tznhLjGJO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8npxroNm2oKmRo9NJd5m65/CWn91buFVEbi1sMsZtbJ76PzCg
	DaRV6JdUqhsedFkMlitjMZ/aQzXIf8nIBNyWmYPLFvdFMyVBn8OL63AYuXdwbPOexTA=
X-Gm-Gg: AeBDieszWXovopfQcbKk5APPGufebUCUBxmZi8XmP2bhU+tnzcO09YC6lNyXOLJ6hR3
	PtChi5cBw1ze9CarnPEA18MhwFPMA/bLmTvveQ0Ir86i/6VU9Sgp/QutHnqBQRxlQ8ntNZAsXxk
	06vC0uTYXPLAy+EzFmSYGWQkyiEmAdTT80+W/CqzOHXimtpmyBBdpCKjODjabNVvrys/E0ccd9h
	AlG+jwGsxYB5RNIETs8xnpx4sou7lKMB8QT1zcf9Cd26xDaCacTOHEpIdeezI8aIfUuI5bDxicH
	4Dv1uzUxmU4axO0NsyUT65nECfXZnvP60nMyOe7djoPU/6B2AUrNS+tkvu9SATQI/H3Opbf1w81
	jI1STG4f3oCfvSrp41hODDwjxcq7PxfRdYRB2zBH8hpo8wP7+8HMtNPjiLxmM68g/O5ww0dwrZ0
	8P/O5t5FlGzEBugQjlnjbWPQm70cAminT/1reFhxA21vofi7UxOY5xHknv1R0QnLOCxsl5fOqmc
	Qk=
X-Received: by 2002:a05:620a:29d0:b0:8cd:9033:1724 with SMTP id af79cd13be357-904d3cb8ed7mr1550360785a.9.1778192252020;
        Thu, 07 May 2026 15:17:32 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b986c371sm9463285a.2.2026.05.07.15.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 15:17:31 -0700 (PDT)
Message-ID: <967c1d96-9a48-48de-b7d9-58b63e782aee@riscstar.com>
Date: Thu, 7 May 2026 17:17:28 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, matthew.gerlach@altera.com,
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
 <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B11264EFC44
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.94 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106540-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	NEURAL_SPAM(0.00)[0.661];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar.com:mid,riscstar-com.20251104.gappssmtp.com:dkim,1c:email]
X-Rspamd-Action: no action

On 5/1/26 12:38 PM, Andrew Lunn wrote:
> Why not add an subnodes for the ethernet interfaces?

We will define "ethernet" devicetree subnodes of the PCIe functions
in the next version of the series.  Something like what's below.

					-Alex

pci@0,1 {
         compatible = "pci1179,0220";
         reg = <0x50100 0x0 0x0 0x0 0x0>;
         #address-cells = <3>;
         #size-cells = <2>;
         device_type = "pci";
         ranges;

         ethernet {
                 phy-mode = "sgmii";
                 phy-handle = <&tc956x_emac1_phy>;

                 mdio {
                         compatible = "snps,dwmac-mdio";
                         #address-cells = <1>;
                         #size-cells = <0>;

                         tc956x_emac1_phy: ethernet-phy@1c {
                                 compatible = "ethernet-phy-id004d.d101";
				...
			};
		};
	};
};

