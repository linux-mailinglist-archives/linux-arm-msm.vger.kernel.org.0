Return-Path: <linux-arm-msm+bounces-112792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /Ys7HUYBK2px1AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:41:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CED5E674875
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:41:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MUO8Nask;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UjyLPbRr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112792-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112792-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3483933965CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 18:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8B448A2D0;
	Thu, 11 Jun 2026 18:37:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654644C954D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203063; cv=none; b=LQryjIZQHXDghkthltbRBAFFzBGQM3gcd/W2riG+7dLCvr9s3l1T9dlHtsOk/Ddv01CzV9Gx0V7FtLK/HWByIW0vPlnl+OBCE0sRIiaXbq0VfIfyf5INb5gpsvnq64bljxOsD62otXMydt3NzdrW7ypY3d2T65Wyz3N7Bl95vXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203063; c=relaxed/simple;
	bh=ZmBtT5CKOpRmxcc7v3W7uVY7c9Er9mvwK+eDsLT5JgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NYSOCREMJn0dB+17MvojJNhMO+Dygm3+oID9chWYUeZ9AiW2ysBmxtIcFY/kK4+KoDn2moqHDVFI7yPRjr+YnCuRIWDier6HdeK7to6lIlBTXWEkXQnI5tILYBk4NtEbqzNXqm8g8QJohXMZzG2GFpBpWNS6BfScQdqxHH/ryWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUO8Nask; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UjyLPbRr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIRo691432892
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/v4X6+xp1eqpt5xDCt7e2HETdMjp4dbWkZLG+SeJDac=; b=MUO8NaskBty+GQfn
	grcHqROxQkF2kAJTeL7/02vjr7Om122IM0OxpiKBgVuC1yhFBwQwzqAXNoK+Bap2
	pCyjGAQ4vPTsaeX28NlguttVcG90Dlu1zeWkGURiMS9JvsbpqQQVCmgRxfIw0fdV
	pUsFjSeUWZvM6Jhj56BI4glbnUbmbxM92ll7HdCqJ93dEs0NjtCOarWtkymEWjrY
	mJHy2Y8zYdlTzQPuYX4IWGGU38CiktMGdA2s0sr73R1lys1CuDnoajtKfyP2r0oA
	mO0FREmCkDR8Pti0cLAxIRKydcif5MTDrYNLvRnMBqxEEp+wu+MqZjLML8+z2Yls
	MrwdHg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7051mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so144461a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203060; x=1781807860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/v4X6+xp1eqpt5xDCt7e2HETdMjp4dbWkZLG+SeJDac=;
        b=UjyLPbRrjz+CyGvcAqsGthBSjk0WsMQzmauRAgBqz6W6kXeULogjANeF5ztp4AIn5S
         XVoiQzyZFANtm9EKJSyKFZhfvyqW2wRzu/DRIji1rqdFYpS+QRdkZeTJBCxPEs+6f6YY
         MwKmwlCmuLljCye6dmphEJ+mMoa507AnpJfxmCXID1uOQHxFtAWKxYNq8VXer3dte7Vd
         cM+UqXlcQ18GwOstd87psdckx2oTgbyoHfJYv2GEZ9R66NDCGcEUnpaQ5xd/Vo9j7NCN
         43K2ACpQG7iQW6CIUjVAKJIxn6N3k/jm/8kC2CBtsvAE09Pu+nu2bahsa0UBCLRdSWKy
         4ERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203060; x=1781807860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/v4X6+xp1eqpt5xDCt7e2HETdMjp4dbWkZLG+SeJDac=;
        b=bLLYp3OhBQDo+Rz/T/CXBAdeIgsGDGj72YJkuDrIzEX+BJqqdYfcY+mYj9K6Dumvkd
         N9Hp9ktn+G+Sm7BMWtT+NGWUwEejwgffBlsyB7zNLaOAm0u0Jj+7+NLVRCgmChFKsGCZ
         Gnk24O0zZm6JHlsHYpJwT2rGbh+4vr5OVryXmVARf22Iy4V+1DsD5hZfX/jf8qScqFu/
         iR805RFWnRjBDpfQDg2ZsbNg8wsMx3h/pHoylLDxve3to1T9oai/JccLogn8sNVK027i
         lUTv5Zq6VplVi3uYWNRujlsX52E97zpTYaU1sEzr/8wgvm9vTqFnftNXKo/B2XQ3aRxs
         vY/Q==
X-Gm-Message-State: AOJu0YxSgHutVwazZCsLZNlhcY8L0utsEM+MC17xCcrFKrZ+wI7z6FkO
	+17dKlDEPZNZ7ozFuWPEBDHtMQg06RBEQX+O3TBglrIAj6NRSwsyG4+4PRgwnbytIEm7OoREKdc
	FxvKias+3HfzbmmYoiVISVLQF+FsQyBo0YQDyYNiucmFC2u1tVAmDEd5MxVbuN2anaHUZ
X-Gm-Gg: Acq92OEHH7IToPmVwvBf4g3bACiFWmuvseDLq4zYyiKNKB+isMa2imX+Mu5ef4J5eP4
	oE3naBAF60wPjZG7l8MVXrZL65uSjI/1hr/gKm00KSUmnpPsrU6ZU9S5UJE3zxonTxK+xA6/Yte
	+o9P0QwVVNQ0hTJGSA0YFBXcPh9dbDbLUquFnFVlvLIz9/0LLiNOAEXue2Sa3jMjtBUNGe+yW6j
	BCE315YeklRKFPKwU5wWLWKvjrUIyqvIKG6tn8OpnvdBBGtMutfkKJs9pCEj5FiLHzstvqbfckN
	X+gDbuz3qaWkATJofCCShO7kud5O7KwULGFPeztcAUcl6Ta3sYJNsnoubWULulXCoqGIH5fDk68
	5/WH0yFBbXY6QUERi/EekbiH1dH38aPzptOhyAnINLh53WIZVCoA=
X-Received: by 2002:a17:90b:2690:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-377a4ca0e30mr4643601a91.16.1781203060246;
        Thu, 11 Jun 2026 11:37:40 -0700 (PDT)
X-Received: by 2002:a17:90b:2690:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-377a4ca0e30mr4643571a91.16.1781203059802;
        Thu, 11 Jun 2026 11:37:39 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:39 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:00 +0530
Subject: [PATCH RFC 4/9] net: stmmac: qcom-ethqos: add per-platform NOC
 clock voting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-4-f0f4a1d19929@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=4681;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=ZmBtT5CKOpRmxcc7v3W7uVY7c9Er9mvwK+eDsLT5JgE=;
 b=bCe8anHiaYQQwnOm3jo4Hsfoo/mKrJW/Wl8EEkqNTPeb4F7OP3gQPxML+Va5VRquQ4ea3SbeS
 NSdDKQSUdd8CSPtEDIX1z/IMfhBJE0waxtMBBKSSF5s2NDKd8mzvSC7
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: SHwKSisdyoDfpm8NDHXvU94KdQ0FM-Ix
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2b0075 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=upsBg6xUXwFThmIlPvgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX8CUhu3T+RKbB
 y6kVdi9SHmLc+o6xXZWqgJTCNPtgo0mgyFhKmMwubnJI4FyXHducgaZotaCm4zu3HbKuunpZLtm
 3hz7sjd3fJVg9KS8XI5sDcltP9JkswiO4dURcxe9VvqHGsDYD8QzWo67OX8ZuE0pBnyFidyjyma
 0nZwyw4L3CJTtmN0Vfsnj/LFqc4/qoDM3mdgLURdqrtcLW+GeXTef7YVHnB/E4iJEymUCBEPtMR
 iiBt56lB7GOnlgE9LOo3twSlcDj0KsZQpYgDYqnfXPUtemUcfqmIk2mSb5K2MZA64vcb8V811O2
 tgVkhY6qMdZaQvLFiBrq64uS1lC98x+Ka0TEtyy1MtWIvM8Fe0lRmBMV7fziTpZ/POVQqIgGIVg
 m0D17dCLIU6WOvXVp8a5OPMlQTZZnebv9o0D7aFIFykbH3dIchqzhvt0VB1eiB2YQZOEarfFVGU
 uiEpVGw0sgkj8ja/Vlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX2DypP0LREbyV
 +yEhqsTYFZY/uMXZ09V+S/QKW9QnwgG0bMniqu2+OKh50AD7D3b8LkMIpEmz3DnPvVDodSxSf0Z
 oPS/0Z1OwkTJCofjEe0GBXAnAE9IoZA=
X-Proofpoint-ORIG-GUID: SHwKSisdyoDfpm8NDHXvU94KdQ0FM-Ix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112792-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mohd.anwar@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: CED5E674875

Some SoCs gate the EMAC's path to the System NOC behind dedicated clocks
that must be enabled before the DMA can reach memory.  Add
ethqos_noc_clk_cfg and the corresponding fields in the driver-data and
runtime structs so each compatible can declare its own set with per-clock
rates.  The clocks are acquired during probe and enabled/disabled
alongside the existing link clock in ethqos_clks_config().

No functional change for existing compatibles. This will help us when
we add support for Shikra.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index bec08f1eb8cb41484ba3c91c77393e163e7fd071..f4d4b419a76277cc6c56f03bb10d883cd4dff424 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -84,11 +84,18 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+#define ETHQOS_MAX_NOC_CLKS			3
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
 };
 
+struct ethqos_noc_clk_cfg {
+	const char *id;
+	unsigned long rate;
+};
+
 struct ethqos_emac_driver_data {
 	const struct ethqos_emac_por *rgmii_por;
 	unsigned int num_rgmii_por;
@@ -98,6 +105,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	const struct ethqos_noc_clk_cfg *noc_clk_cfg;
+	unsigned int num_noc_clks;
 };
 
 struct qcom_ethqos {
@@ -112,6 +121,9 @@ struct qcom_ethqos {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	bool needs_sgmii_loopback;
+
+	struct clk_bulk_data noc_clks[ETHQOS_MAX_NOC_CLKS];
+	int num_noc_clks;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -696,6 +708,17 @@ static int ethqos_clks_config(void *priv, bool enabled)
 			return ret;
 		}
 
+		if (ethqos->num_noc_clks) {
+			ret = clk_bulk_prepare_enable(ethqos->num_noc_clks,
+						      ethqos->noc_clks);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC clocks enable failed: %d\n", ret);
+				clk_disable_unprepare(ethqos->link_clk);
+				return ret;
+			}
+		}
+
 		/* Enable functional clock to prevent DMA reset to timeout due
 		 * to lacking PHY clock after the hardware block has been power
 		 * cycled. The actual configuration will be adjusted once
@@ -704,6 +727,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
+		if (ethqos->num_noc_clks)
+			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
+						   ethqos->noc_clks);
 		clk_disable_unprepare(ethqos->link_clk);
 	}
 
@@ -732,6 +758,37 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+/*
+ * Some SoCs gate interconnect access to the System NOC behind dedicated
+ * clocks.  Acquire them, set their required rates, and store the result in
+ * ethqos so ethqos_clks_config() can enable/disable them at runtime.
+ */
+static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
+				     const struct ethqos_emac_driver_data *data)
+{
+	struct device *dev = &ethqos->pdev->dev;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < data->num_noc_clks; i++)
+		ethqos->noc_clks[i].id = data->noc_clk_cfg[i].id;
+	ethqos->num_noc_clks = data->num_noc_clks;
+
+	ret = devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
+
+	for (i = 0; i < data->num_noc_clks; i++) {
+		ret = clk_set_rate(ethqos->noc_clks[i].clk,
+				   data->noc_clk_cfg[i].rate);
+		if (ret)
+			dev_warn(dev, "Failed to set %s rate: %d\n",
+				 data->noc_clk_cfg[i].id, ret);
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -791,6 +848,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
 
+	if (data->num_noc_clks) {
+		ret = qcom_ethqos_init_noc_clks(ethqos, data);
+		if (ret)
+			return ret;
+	}
+
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),

-- 
2.34.1


