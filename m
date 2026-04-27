Return-Path: <linux-arm-msm+bounces-104782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOS1MRGf72nwDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:38:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEAC477C37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D7CA309552A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053923E5594;
	Mon, 27 Apr 2026 17:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BswXOTsk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxOGN/C0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB683126D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311366; cv=none; b=YUds2TNGpFWPJfiXjI9MH3hjcjmovDHRemWfjGvIFplO0OCWuJNSOQYKXPOjaObg1i+ZOcvzEir3ZC1+L6L3M3gOlrpxHMDa2x4QXvZA5JAKdvzkJ7oXIpfE1q7XVnw2MVoBPcnAvqmAI+3sG/0b3WtChB4L4ZxcpTFYgmExadA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311366; c=relaxed/simple;
	bh=lzropSLLuEUOTlXB3lVSMDCK1IZ7W79RN88MySMJil8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oN+DBJN82ZNsaehq+wQVE3+d4nX/DTIzF0nnMuyl8wFsP7zF4mr98Vi5imOycRkvtS7IzfgxZYha1HhbPcclxb+HPl0AalnidRUcTRcE4Ce50jCA5Wn36vknZ0NmVIsxT/5BEePLNy9DAIQJjBQ7lnsYvpLGvZXL2Nb97qMEho8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BswXOTsk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxOGN/C0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDrHg73961889
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCiNA24JLGnW+ALPlEr94KdNN1Dg8+VWxK2km+y6x2o=; b=BswXOTskG+3prOc4
	FTddRVN2lV4PCYS8uOSTVqn5NxfgTYMz0v5f1fcQefm7AjKbL01cOo57B7+DMJrz
	TofHv/LRT2uPdMsgdYap+BiXQkTRAWofVxb13DDLUx+gj+FOR5lyGvbkOXphd9KJ
	q8wGlIVErkHWUKIVsBPDsZyYIDIomm+8y/Jvv5D9QXIjH8lNr3CcIIiujiBG8pW6
	eRaB5xfihyzp/4AlUK6Lhfjs0hMi4YAezUOasbKKJfI0HCEWFP2+X96AhYlktmvx
	JJsT73MLpTzNEZtCWCTx56k8b5jRxIfsxYn8vGVuB+XKvWwop0NB117Egu7h5h7+
	y/7yNQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k3280j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e06219cbso128158455ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311364; x=1777916164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCiNA24JLGnW+ALPlEr94KdNN1Dg8+VWxK2km+y6x2o=;
        b=kxOGN/C0hM2IHgggZ9CZDY2JY0dw58E0Vf9P5vrUM/O2u8dtPdYzWBt9Muh7gObHd8
         +V1vovKsab3+f2kK1AOwq/H0onKI+aJVC+UgGtEbojKuqNfRT+xTko5vScpnEF7/EfzZ
         rCM9MyoK19fHyVbTyKHuMsRcWYvKPLN5LJlb3RJJNV7wG2mCaKWbxYjjg+jg15TYN1HV
         KHg1F2eIjlTs0YAZEQWnZtm/nnJGZvd2Pn74TA3zg6y2Rj+XN4K1yHreC8tRqgbwTwlo
         RWcl3/SJN8GYLzE6jO6gXBJ4tvxuiJXjud6Utb8dOMidhPSEGWXkzx/YsTwWKNZn2aVZ
         2BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311364; x=1777916164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GCiNA24JLGnW+ALPlEr94KdNN1Dg8+VWxK2km+y6x2o=;
        b=d+HTB2njrMgdz6MP2pWDG+tVopMorpGqgQ2Ql3kf67uGm9nG2vcCmQiKXU1piSwM+u
         skUqlfR6L/K4ZweNMlVK9PM/J+DOOreyIZ4ia7YK/kNTXbu/0/sgAgd9owvU3UE6tAGl
         BAMnA+0sKd1VwFbgRU0/Q+bQ5io/dvuEBIWqztiPDu0vjDNh5/Uc/28VvUrJ85+pWl+u
         k1hnz5czmkmF562fhUTb1uqHLpjx65w25gM1mj/O0rnIiSJ3Qd7TOmQtWKso3ThQO/dH
         HSm9dVqMJKKUlsM1KDg3Nqer2ZDtc1Qq+9yvBcFvbaMnLBivgWXSAn++lt5hBr0h/Lmo
         TtzA==
X-Forwarded-Encrypted: i=1; AFNElJ8j8VLef+4oWD7qh9gPJnU4ElwRwoqe3p9TRAdSR/ovrVekV2RIZ93zH1X7Ro0lthr+gz75mullz6qzffZy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2NGc07LadOb5oI9Hx0zOCsgIWwegByxPSI1PpeC28/gyqQEl6
	6Wg51dQ+QW0oLiJQdV65tVBpfuPB9VMpjMhMZ8Ax1ZVAKI28NkmQn4SvG21qKcc4bDioJZFPPzo
	DyfaBGXN4SdlxCJ7GvJYxXjNggjfBBcmZm3aEGdIuciw1QjhgDbNtnZniG8NyQ8WHc4xA
X-Gm-Gg: AeBDiespEW0e2PgV2/STcP4KikRHUZFxVCi8pBlIkBExJK2BwQ8rJ0ZWrywT4wmacjP
	8idAfNWL0Pe+LxBP3BDSRhvb94oSG0+8L3Xyus20ukIuAvQpLH6EPGgCw8Wr0FloqCw3y9mtHS/
	yWInWb65RBlgVFPQGNbkr6tVht1ay0DfRFA+DudMBXG87bsvDd8aTkD2Z5F7S7Tvre38+roY66q
	aV6DjV+4RVeQLEEHgcJ3Pvp/bFarQgBhZFd1d25VDe4CGwZBFtU39qB6/M2TWgFt6i7pywBM1BT
	bSfA0XGrf3ywP5bjeNMINdd+SFLe0wiZwb7zAbrM0/tYROAMEY2II8MAwc6BtrF2GK3c4Bk6q07
	ByEzHLksqIDQoLFD9DoCcc4cOdBDF6lXNJHydBFxlD0GnJ675axgvMaMBfGkR5hZ9/epH
X-Received: by 2002:a17:903:3503:b0:2b2:4ffc:a7c4 with SMTP id d9443c01a7336-2b97a9661cbmr1763715ad.24.1777311364017;
        Mon, 27 Apr 2026 10:36:04 -0700 (PDT)
X-Received: by 2002:a17:903:3503:b0:2b2:4ffc:a7c4 with SMTP id d9443c01a7336-2b97a9661cbmr1763215ad.24.1777311363460;
        Mon, 27 Apr 2026 10:36:03 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:03 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:45 +0530
Subject: [PATCH v21 05/13] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-5-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=5704;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=lzropSLLuEUOTlXB3lVSMDCK1IZ7W79RN88MySMJil8=;
 b=Yax9prFDQv171HwJK8GhB9i1LBifVuZuKjaRqdRPhgOa/XGkco6ROfooGv8bt0WStsk62OajJ
 3ndcItGxp8SC2hfvo1UlvIJlnuM8CXU8VJPMMcPr5ymXTPII1gaX4s+
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX8UpKzd8lP8Wf
 8kX7hmXtfxposOti009GDWEUwbrR7f/TGcGzwJU3mSxTiaZ6V9vQnQCGNFNBBbFjmyNVerqvpCA
 5+tUbBcoF1/HLIA1bbMteq5AnBLJrKNYzlFoPHx93n1ZtIZjsezG0bPr8jyGLXlnTilII7a5So2
 jo7bmslV6I/xJ6IF9Z4ikjes1plI+HRR6Z5TIKUwh74BwAC/1pFKY45k3f7PrEJhqxddz2dXP/m
 aUV3gQxyAA+Vua+JYgwfhxyrjFPPT7kcqLvFtufuVC3e4ZGYEhAbLzucgDpQ+nahEdtYOQd1I8+
 xAIQVQuSnG3KP5NPaplAOKdXAsAJZs2UmMHtUTYlJeQmjterGt7Nip50jsVEjRJYa0YZWwLM92G
 zbrDHxEN7Ga0+1XFApBPDoJAU21Fcpp0D+/f0bxYwzGdqubtfFoQuBOsCIGeDlUB3t+g4PSgBL6
 TP0+ianBRZ1NaweICfQ==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef9e84 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=_6Fr27BeRXDgthG3VUMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: jB2YvPUSHbujBfqS2OOkp_j16iaJok0o
X-Proofpoint-ORIG-GUID: jB2YvPUSHbujBfqS2OOkp_j16iaJok0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187
X-Rspamd-Queue-Id: 3BEAC477C37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104782-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
Currently, both the PSCI core driver and cpuidle-psci-domain bind
directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
introduced, would also need to bind in the same way, leading to several
drivers attached to a single device node.

Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
PSCI child cells. As the first user, register cpuidle-psci-domain as a
child cell.

Update cpuidle-psci-domain to probe as an MFD child and use the parent
PSCI node for power-domain traversal.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                           |  1 +
 drivers/cpuidle/Kconfig.arm           |  1 +
 drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
 drivers/mfd/Kconfig                   | 10 ++++++++
 drivers/mfd/Makefile                  |  2 ++
 drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
 6 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c871acf2179ce16c80b404027e6b969c7787a6bb..333b01fa00b8fbd15e6f31a6b9af47600411624e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21239,6 +21239,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
+F:	drivers/mfd/psci-mfd.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index a1ee475d180dacab245510674514811aec337ad3..1a1316d11e0a2e4f61801586229f5104e2435865 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
 	bool "PSCI CPU idle Domain"
 	depends on ARM_PSCI_CPUIDLE
 	depends on PM_GENERIC_DOMAINS_OF
+	depends on MFD_PSCI
 	select DT_IDLE_GENPD
 	default y
 	help
diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3310a76ce62018dff0af1488e33d2..a2d01810f2957abdfa52ae66503dc0cbb205f163 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -17,7 +17,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/psci.h>
 #include <linux/slab.h>
-#include <linux/string.h>
 
 #include "cpuidle-psci.h"
 #include "dt_idle_genpd.h"
@@ -122,14 +121,9 @@ static void psci_pd_remove(void)
 	}
 }
 
-static const struct of_device_id psci_of_match[] = {
-	{ .compatible = "arm,psci-1.0" },
-	{}
-};
-
 static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.parent->of_node;
 	bool use_osi = psci_has_osi_support();
 	int ret = 0, pd_count = 0;
 
@@ -181,7 +175,6 @@ static struct platform_driver psci_cpuidle_domain_driver = {
 	.probe  = psci_cpuidle_domain_probe,
 	.driver = {
 		.name = "psci-cpuidle-domain",
-		.of_match_table = psci_of_match,
 	},
 };
 
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268e93d1557ca6519ac96056e37e221..75ea5b47315cedfd1153899eef28614a165a14f5 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2376,6 +2376,16 @@ config MFD_KHADAS_MCU
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_PSCI
+	bool "PSCI MFD for psci child cells"
+	depends on ARM_PSCI_FW
+	select MFD_CORE
+	help
+	  PSCI MFD registers PSCI child cells and exposes them as
+	  platform devices. Child drivers are probed only if enabled in the
+	  kernel configuration. Select this option whenever a supported PSCI
+	  child driver is selected.
+
 config MFD_ACER_A500_EC
 	tristate "Support for Acer Iconia Tab A500 Embedded Controller"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28afae975ac61d282b3b85af5440119..36e872b11b995135a04ca24c33fd3a4d08e4f49a 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -24,6 +24,8 @@ obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
 obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
 obj-$(CONFIG_MFD_MACSMC)	+= macsmc.o
 
+obj-$(CONFIG_MFD_PSCI)		+= psci-mfd.o
+
 obj-$(CONFIG_MFD_TI_LP873X)	+= lp873x.o
 obj-$(CONFIG_MFD_TI_LP87565)	+= lp87565.o
 obj-$(CONFIG_MFD_TI_AM335X_TSCADC)	+= ti_am335x_tscadc.o
diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
new file mode 100644
index 0000000000000000000000000000000000000000..7affd6bb09dd83452664edeccb09290fe4f43186
--- /dev/null
+++ b/drivers/mfd/psci-mfd.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+static const struct mfd_cell psci_cells[] = {
+	{
+		.name = "psci-cpuidle-domain",
+	},
+};
+
+static int psci_mfd_probe(struct platform_device *pdev)
+{
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
+				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
+}
+
+static const struct of_device_id psci_mfd_of_match[] = {
+	{ .compatible = "arm,psci-1.0" },
+	{ }
+};
+
+static struct platform_driver psci_mfd_driver = {
+	.probe = psci_mfd_probe,
+	.driver = {
+		.name = "psci-mfd",
+		.of_match_table = psci_mfd_of_match,
+	},
+};
+
+static int __init psci_mfd_init(void)
+{
+	return platform_driver_register(&psci_mfd_driver);
+}
+
+core_initcall(psci_mfd_init);
+
+MODULE_LICENSE("GPL");

-- 
2.34.1


