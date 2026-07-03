Return-Path: <linux-arm-msm+bounces-116235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZgvRKX94R2oeYwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:53:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0798F7004DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:53:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QPOU8Pbj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZZyv4Sed;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116235-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116235-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A328306039D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5B53403E7;
	Fri,  3 Jul 2026 08:34:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CF22877F7
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:34:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067684; cv=none; b=ECAclPfgegMSZqKcZWSF9lqux6e9Qalo6bYh6Pu7+PAgu7kNbZazcj7XaC54P7gskJlhs5ghzlnryX7xtnsF9zc8XflH81pZJ6pIRcpNTo9lAlu9FI3FARDqfZdHAQWLxZN9BKC5WtQtaanDLwCSWUGQwzIJSj5Yc+MacQz19gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067684; c=relaxed/simple;
	bh=YYqifraEzFq8eN1gIxEHMMpyvNsgxXs8TV7wj7b892w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KiJE55ooPOzFKhoJsdzCL7y19tlg5tw/ayWx0Jb7EMH18XPJURr4hdbhs2Ojr4W3BkAVfJUKLIejaztIxni3WZRAXZIUA4r5scibSLFZB9lVA4VfqeOz6ZvRBrFto99QwA75KC8zEF7uB4h2CUWVpmB8VGPWwVzCIZVopMFcFNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QPOU8Pbj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZyv4Sed; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663686jb3053703
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 08:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jxNvCrjuH9H5uETZtM973jb+mipb2zMotZk
	DKMQHYpg=; b=QPOU8Pbjl/OUCmCmWgl2iap00bu3Gp0zmk0XO+eDcYmmG1d+4As
	h9YDiQejdT1+8dD5Sq6GrZLgNGIC5CBiCDL9VluNj8zdQIw/htgFBgHQW20juQDW
	vvU8/GZWSP+4LFYycKoZF4KgAakzf3vGrKb4pGjIt2cPK56wTyqueeZXOmqKKo+I
	Tx3WZ3OQU4Jcc7EDe8Q/N1R8behOKeg/2wMzl9DSyUydjY/sPrJYoRtRcOXCdJrU
	+cOA4Bv8xGghuIJmmmjsryhRxqxfse2QWIkF1xOhwH1SKVY75YkARcjVpbPKOzb1
	llSgsLqLj+BXFyCh1deSL5zrNkx8DOdR3uQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j00hrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:34:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38108fb9d83so278618a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783067682; x=1783672482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jxNvCrjuH9H5uETZtM973jb+mipb2zMotZkDKMQHYpg=;
        b=ZZyv4SedZVQ9Enpx7d264kesgogV3ybW2MWihw9H+IWmRHobblJ9w3wkNBzzlnHPGY
         kW24hr9mTVml5GPNpb6+gvR1filBmmDDEWC7jSeKz6VAKtRiUR3bFcrkbpVCGnbdXfup
         E6UFztuqGD2vmpIvcE8qV+EclCLnNE5olFIlhQwYZOvTc6BHCYr5OzhyY83Do04pJfZh
         qLbx4dKrMihb7daNZXq2hgV6jMZu216U0vR+vVko5iz7NQuoHGYoTsudVrSmF0dzIq6U
         kqUJ05hyd+Lg2XN9N6aqYLge4qpIooS1cBfddZ0V/+GdbpS2nreXJlbXGroMatpEM96Y
         vgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067682; x=1783672482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxNvCrjuH9H5uETZtM973jb+mipb2zMotZkDKMQHYpg=;
        b=JqD3HMkDWNh0JCxTJQljxAYO0S0nbB25niR/gN7u9g/xuLPeHMM80tyYzpcnC7F39j
         E3uqaOyDI3OQN7mfdRaca8j+flMTIXyWQs52PFzmrnOmQg87wnBW2bmPcOTX0T9Km53o
         /d+p5V9DBWHE5/u2kl9BCmKc6XzBOvJd03KJ3tAW6QLJipVNM7CEbNzAxjYnYqrDC7Qj
         VVNH3vTaa4n1hCVZ80gKzUsnj44GtnQeoysMVjCY2sFx6MjmDuKxzrQq24xQzVDldqjR
         xhMuQs+BzyKNgaGLqiovH3xuXvQNbaLur97x/0DWUS6Zy3+BBGQJThFtwfOLY8a6CGRD
         9W9A==
X-Gm-Message-State: AOJu0Yy/eC6xatEppY8gDbwlpV8Bo4wLOG7R0F41VJwkWX+7+++6iN3/
	1jxGl0OLo+c9g7b2Bvj2kSBzum18C21LFJmhs2M2YrTgvMhp4ewe4+X/hb4B4bZ4dtyfB+2qNsL
	UzurYIN8mD/CeueYsbvjODF3mDmLhZjZ/bCKjSV2psgLSORAn3ABuc+lz/TnnR8F+WpJ3
X-Gm-Gg: AfdE7cmJhhxYRE74tT5kX5gPs/zYsYpIPHvAJoqbYoqfyCZAGhiIQtutL7JIbBEOVXu
	ahWYm3rN5AlrLlRY/xGUm26XTkiXVuE7rSQJWTbfC+yCjF5Rrmr9adYd9cH50/fekeaTOKzJefD
	7y875Gm/FyIIZIWSImqH3zH6Xfr1dpL7P4yF5xtLjgrUD2UEfRLd5kpvKBhRvnEY/yrShnCjinP
	a+nedAqTtQmXZF9h5voV6X24LhI5g/YuKYiewX/FI6IvDRpeSBZ5sotPrHKs59PB72McgBcJDLN
	n3++0Yg/aF2YVbqySv9y4V9eQKoKFIfAoOsLHyYTeerKJJMizzf0qq7EHGx62SedUtgpOjScufE
	HjPdpnAZJRahlorC73IjNQd6UNOrGP9ZtWqkD9Hpi
X-Received: by 2002:a17:90b:3e45:b0:37f:d27f:5186 with SMTP id 98e67ed59e1d1-380ba91d167mr8733572a91.25.1783067682166;
        Fri, 03 Jul 2026 01:34:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3e45:b0:37f:d27f:5186 with SMTP id 98e67ed59e1d1-380ba91d167mr8733540a91.25.1783067681667;
        Fri, 03 Jul 2026 01:34:41 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm18797839eec.2.2026.07.03.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:34:41 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 0/2] arm64: dts: qcom: eliza: Add audio support
Date: Fri,  3 Jul 2026 14:04:19 +0530
Message-Id: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iWnnf8ZYie1LX5HibLqqIFPFWoQq2Nj7
X-Proofpoint-ORIG-GUID: iWnnf8ZYie1LX5HibLqqIFPFWoQq2Nj7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX6JrjLlyebftE
 Qr0gWQrI4O7m7BvcxRU2MXdpXwRkD8A8kMJmJxCyDu4plOdoqpxDpYzl/RrH6u1SVS/Jb64yQWp
 g7VQOkINCBOVcgD3Mo81CFz/92z9KSY=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a477422 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=h2ZIktL6sUqn7g4XYOwA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX98cwZWb1es0f
 aDcZTnuarIzWemCzlVjZgP3ic3NiJCrijO94NtwKVx2zSCLHaKtogCeQ8EOh0VhYusBjIOgcx+r
 P/xjThIK4+8qWeV/HaDKeJfW5Gr4lzqUdEBQQNSCWMZoWdRJ1T+P7WB0VMLTAO1Uh5HJB0qOWfQ
 UVy79bk+Ds4PizQ/p2vgHXUAFGh0hXuk6JYSavfLv3Oy0zl+ZnbI3saTSUniaNdoiUMWnlEzCEW
 7APJNrUfSxXdh/CxoCCHKycJzA2wzqUZh4ezBU5X1sHb0TBY9y42G30aMAlX3XxkuLI0FXbsruO
 8dWN77mRugaf5mH9nHG3eZecua48A98t1i0Sz1NO7IWlM1OKxMQcRLuhEV2tkoOIKHJTyugYP4Q
 cBhImRnSE2zLmUb/ufXS2fm+o7Kpm1NxRCNy8IZdE393EX7tlS/SoSWjasQN4ooOrbSCEZy77Rb
 W9MrMfUDlgqioqkwRxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116235-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0798F7004DA

Add audio support for the Qualcomm Eliza SoC and CQS EVK board.

Patch 1 adds SoC-level LPASS WSA macro, VA macro, SoundWire controller
and LPASS LPI pin controller nodes to eliza.dtsi, along with DMIC and
WSA SoundWire pinctrl states. The macro and SoundWire nodes are kept
disabled so board DTS files can selectively enable and configure them.

Patch 2 enables the sound card on the Eliza CQS EVK platform, including
the WSA8845 external speaker path and DMIC capture via VA macro, along
with the required LPASS macro and SoundWire configurations.

Ravi Hothi (2):
  arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
  arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with
    WSA8845 and DMIC

 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 156 +++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi        | 193 +++++++++++++++++++++
 2 files changed, 349 insertions(+)


base-commit: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
prerequisite-patch-id: 7afccbf2863f25c18c4ccebd721defee1f84325a
prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c
prerequisite-patch-id: f3615b5c1e2222a2491f862a7fba3994058ecc53
prerequisite-patch-id: 84282f8a368672c3f0f8944c442c71713cfd7390
prerequisite-patch-id: 84db6b0611553825dad5b2d6311bcbd840d75a2f
prerequisite-patch-id: 707f23d1ad401ed79c1a2812c294cca66fe9d9d8
prerequisite-patch-id: 9cdfb1f97205bf64d207cd98891bcad4cb841783
prerequisite-patch-id: e990c9019a8c5bafd59a75ff9829a0f0f7350239
prerequisite-patch-id: 15da7545070f556b14e772424dea20b6f012dec1
-- 
2.34.1


