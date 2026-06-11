Return-Path: <linux-arm-msm+bounces-112791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QMP8Dg8BK2pc1AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:40:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD9067484F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:40:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F5iuHgXg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BZBPNh9q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112791-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112791-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56D70302A6AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 18:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFB549691F;
	Thu, 11 Jun 2026 18:37:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1746B4D2EC5
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203057; cv=none; b=KHOW2ZTP2eyC8SampxDxOfmAbp6VWIVzE6VbBfgopNRamXRIcOU5venpRRSxMD2V1HfDgqFcFw7hgIzsy35/Dp1OAK9P3FPYOC6Kyddz78D9RsDZcmCKOVmUfHapyelKgfCuF7rmX6MN1xykff5gtP7yE4ARTmBoADGaHa+5QbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203057; c=relaxed/simple;
	bh=GtqYv8yTeq4PzlXpWMuFX96v7sPl9ApaMmizTH0wFJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0NFOuR9hrt9W7QdpMYGGCtzQUsnXNw2rBfDb7ebNFpak3riJtjj/W828zaTeLrFB/9W8/FTXxD0NN35KXHS46Zig1J5gamQJ6U/nLP7wa4G9tUrZSpQxStXSAUmMxl1NS73pFuZMzJIzD8jWMZyPRPfqi3KEwXt9WA47qxxdxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5iuHgXg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZBPNh9q; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIS45x1350239
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eVzOoLNEuPfZZT/bNo/rgtUOyCTzQansB3UIDE8kQC0=; b=F5iuHgXgf1aSnynX
	P0axqcV/oPzWvCV+xrFy8Yb39DCbQeQiEeyihNrwxlea301CnoMJ2l2boBAlm9Tq
	7XeMKgdqY4Dy/UAmDLJhMy+zADavzOwUjaqoesTGJJZYXUbmdowcGLgh9iLa5n2E
	/zaLl7u9Z/MlXSGq/hPEvbdjR/vdkNj57Or1TgRCEjeM2nFsuTUEzhaIpvgN7Qkr
	+MIIn0DDoL86GpPgH0mA9wXl+TdHQCeghEovmNqJGgJB+h7QdfbVXeEJyrAXut/h
	ZNoRplB4M//3aShd7eOuoBxHBm7GuD1Lj5VUuqiPsDblWBqF8gvjVMYPlBp6unki
	hRqDpA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcg5x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8596e4272aso85812a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203054; x=1781807854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVzOoLNEuPfZZT/bNo/rgtUOyCTzQansB3UIDE8kQC0=;
        b=BZBPNh9qFoOHkkUaglF0199Y5JIhHwx4imYYGRssofQif3XoPcpLxSnZv3KZyr9YB/
         RvmiMnSVuO2SEaVqmOMOExDapuRHUoBlBdO+7Hn25ybSxkzyUG/HOingrP7+kcqE+9cT
         ABWHPH3AhRRPwADqbMnuVlSJdzHWJH+HrsdFbVy9Cecuf6rBtNIumE62Z7CHjQViXu4V
         Tys/Iu1vLaSNhzE2LJhgGPIHV5GNZiL+YlLSnXzbaXJDQw1CTdiss0e2plYOqfRJrFu0
         SpWb83sZshq/hJjg9M1llpu/w9tqx6t2/OsBgF/uTXeRb28c6R9lWXNxcPPYWQfi2wqe
         WJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203054; x=1781807854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eVzOoLNEuPfZZT/bNo/rgtUOyCTzQansB3UIDE8kQC0=;
        b=QGG/sxSiqj6mZPgyCHg4dajbQusO2omHPpSKI5cLn2rKn9gxFdVLeysZ6wnDdymAU6
         U+/JqIFDMvmE/lJ7UMsfa5F1NMmPG8v9EC3gVbm3DySXXJON+vQ02YZF+iefrK1aECUm
         l2Pf+Cr6fBbb165VioLtX696XuFS7DvshTt4VSbDvzxVck10Xstp3jaXMN6LVMP/jbbL
         BLI+LmACoTx+CONEqXaIMDxwptpFtAjfobSoGmKpJX/A2GB0gwYmCBcHNVmsgz7R1xCt
         D66ctPsgi79zPo4twjJLBwTsVBFMY2sSeBE4lDmnYsocCQhBuGFM22ndrOpBqH9Guyns
         Vnhg==
X-Gm-Message-State: AOJu0YzWyGQSwfNrOWojS/Yqe9diPctTyF1+Ng6LrMiuBBxZhSZOj+DQ
	LcqeQ1/9ticcsW4WbjzUvh6Gx8K3WjWChxDR9Z8WZznib9SOd9yXU80ACReuItpoCbyDeFEFUMH
	Kei0kacQO7wnAwhBzPzVxq4Z8YuMYB8ilQNjCelOSZ86Yu15qmcP4D3NS56A7gVHoiisR
X-Gm-Gg: Acq92OHt6nO/LH3BRU1O8AWwi0OsQ7A3PUqnWz572fygOf5YtX6jNiV0prg01dqyccA
	Z7oefZ6zo3aaCr4ipJcMZC2a3aoAMhbWXdatawtCfjdtjN90VMXiuLPQLdUrAAHutwvyOoIb5zm
	TLTG/YmU+bPDvto2kqcr0BasXzoe/WxIP7zGhNw39aGLiBUTo+9CRhkat2hbdX+ze8rmdeflcud
	lJJEo3cGTMLWWDbU90YP/CKQPKoTI9H1G1QGiGFQZbJlD46vZIDG78lHnXylErJ/LLOEdoLABvJ
	sVNWMtaXl9UtioDFcfkhKYNDbhAc45P5C4W/P6vYRxNoT3ovNilZaFno4+k4dopPz0OkoU1BAEJ
	S1S1CKV4hxT+X+7jHnWldK37318Zevblez2nnrP1uCfVNlBu99HE=
X-Received: by 2002:a05:6a00:4487:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-84336e079d6mr4799923b3a.38.1781203053886;
        Thu, 11 Jun 2026 11:37:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4487:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-84336e079d6mr4799886b3a.38.1781203053392;
        Thu, 11 Jun 2026 11:37:33 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:33 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:06:59 +0530
Subject: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to use
 DLL bypass
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
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
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=4799;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=GtqYv8yTeq4PzlXpWMuFX96v7sPl9ApaMmizTH0wFJ0=;
 b=A+o89b25yP5p1Mg5UsjerNAHlaA07dc6XakrqeXi467eWa0RjVcP6DjQXPcaF1Q9iH4lXirnO
 FRUuZjNj+8eDbM88yMdkC3X/Cmd6n8mAbCu9bcJ0Qil2xlIc6WbjsXV
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX3kBrV6SzVkT4
 N6aU0LLEl3qmy6/sSgUD2a2ZtJ8jE+OilmwPiBqz/bP1AdbT7wFFQrWo66c8AK74GK41fko39bi
 1riBOy9Hp2xmPkjQF11DnMLWj97dTTyJRXec9qTNolx0Dys3mCKtlF0vPozypAIu7aebBRI4uqn
 VESq+5GwPgLYfC1eW5Is3q9C/neo5zbcUWPUqN//UTlalcwP9l3/DndWGe84KXGMb2lr5+KOOzM
 QucYJhs376nLglG9JYJS4Xz+2nAqsmQPif5m1Wpu1vJvTN4dYKmD/JLs+X6FtK5m12QomUMIiuG
 6oZUwhYOsxzb8S5F//7h+18GZb3Nr9bMkCm3B026B+6LDxgEdm9sWb9wWVJ4b68yvOg5XJO/nRR
 THZrxP5oEMe8MdypNMdWyUxeKiliwktW9wzn5M16zeJOru6QOoFPS2faszhEh7CgIHpVB4uOGV6
 NNjx6cHOfmd4Sd4KzCA==
X-Proofpoint-GUID: uSluaCjB1sHdsrUm-oRxrSwMHhCNk8KV
X-Proofpoint-ORIG-GUID: uSluaCjB1sHdsrUm-oRxrSwMHhCNk8KV
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2b006f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vSCEUKm3QqZMBpSZvnQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX5hsZ1mwsH2AR
 300TRRL4hqH6W3PtSun9ikkgrx3RIpzuBm36jBwzJN/SsaqGnf9UJCZuOZ8VOEoxiOKEdSu8Z9l
 R9D0EFuwfefWvdyydU1mb9T4eh+F85w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112791-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mohd.anwar@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BD9067484F

When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
the MAC must not add its own.  The driver currently falls through to the
generic DLL initialisation path which programs it to add a delay.

Power down the DLL and set DDR bypass mode for RGMII_ID, then program
the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper.  Also fix
ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
100M/10M, and remove RGMII_ID from the phase-shift suppression in
ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 65 +++++++++++++++++++++-
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 44270c25d874f72e7f971757fec659d36468c315..bec08f1eb8cb41484ba3c91c77393e163e7fd071 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -67,6 +67,9 @@
 /* SDC4_STATUS bits */
 #define SDC4_STATUS_DLL_LOCK			BIT(7)
 
+/* SDCC_USR_CTL bits */
+#define SDCC_USR_CTL_DDR_BYPASS			BIT(30)
+
 /* RGMII_IO_MACRO_CONFIG2 fields */
 #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
 #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)
@@ -183,7 +186,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	/* Clock Rate Requirements:
+	 * MAC added delay: 250/50/5 Mhz for 1G/100M/10M
+	 * No MAC delay (DLL bypass): 250/25/2.5 Mhz for 1G/100M/10M
+	 */
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII ||
+	    speed == SPEED_1000)
+		rate *= 2;
+
+	return clk_set_rate(ethqos->link_clk, rate);
 }
 
 static void
@@ -405,8 +416,7 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG2);
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
-	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
-	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
 		phase_shift = 0;
 	else
 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
@@ -475,6 +485,40 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG);
 }
 
+static void ethqos_rgmii_id_macro_init(struct qcom_ethqos *ethqos, int speed)
+{
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP, RGMII_IO_MACRO_CONFIG);
+
+	if (ethqos->has_emac_ge_3)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+
+	if (!ethqos->rgmii_config_loopback_en)
+		rgmii_clrmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+
+	rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP, RGMII_IO_MACRO_CONFIG2);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -493,6 +537,21 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 
 	ethqos_set_func_clk_en(ethqos);
 
+	/* For rgmii-id mode, the PHY should add the required delays.
+	 * Therefore, power down the DLL and program it in bypass mode.
+	 * Program the IO_MACRO as per the settings recommended by the
+	 * programming guide for bypass mode. This will ensure that the
+	 * MAC core doesn't add any additional delays.
+	 */
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
+		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
+		rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);
+
+		ethqos_rgmii_id_macro_init(ethqos, speed);
+
+		return;
+	}
+
 	/* Initialize the DLL first */
 
 	/* Set DLL_RST */

-- 
2.34.1


