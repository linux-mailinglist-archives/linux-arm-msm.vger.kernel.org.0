Return-Path: <linux-arm-msm+bounces-112074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LeY0CiPaJ2p+3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:17:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2E165E355
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:17:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P8+HoqDA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=I1djfGp4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112074-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112074-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 993F830C427D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57703EFFBE;
	Tue,  9 Jun 2026 09:09:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA32938332A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:09:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996153; cv=none; b=BisogQFA3MnjEUbmsZrZtL19icszAOZRvsWcH9OGoDXMEt4z84tdI7d+yTFIAIsik4SjF09JBWzEHeiMVpfEPbh/rJD+4iC+lATd/hNSnsuU7UfDGEL5VYGt8lDUPdb0s9X5/zP4+rDv45dvqODATybzMqoMphcDSJ7onVf32uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996153; c=relaxed/simple;
	bh=eKA0uRMeiYBzZ8FrqLiIcawxeUNdHDbGqu3nsVelPBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GPMjqnKd4fwyxqyNineHpKHUYxBGks7HR1uZasJjLBvath/2KvcUMRcrCXTcqUbnyWKk55GkvVLXpnvBw0qC+4qlkgnMnLPgcTV80bpAScuHK09a7Ji2KlsEWV0kU4TuKVq7sbitN4EWdv0WAY9GGUY71MCScqh1ipbmS/QwTMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8+HoqDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1djfGp4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rWbO1585860
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9kqHTn3HwlauTP/Mvnc9qY
	JtQpvMhNbtivLTo6vwNmo=; b=P8+HoqDALbmM6lrJAsBlwLuD7PzyBkSN3a7MxH
	4Rb4pUOUEIOJHmlvRsaKlIHz0ZOAX/F4ZV4Ozd5gKQTFAV2q2YI+9MXfZ9DNppD0
	dLpJSH0tvLcP9f5ClT6EPsmMmxyKmRMaXGzgzXkEM036KRX/OvfjhXLn6OPUt7fl
	4CxvK2uvqWirzjDQZ+r/xpepABzRjjX7iS/rEp3ATDXWkcSp49jTF/dbcmgGBPqa
	6YPBNVVk0eymPX2am8dvkxeiuODa7XBPvwcrdXOsdTgv6C1WnC5Uu5fvrPKRs/Lg
	o720RvkGdw4bdeniErqxeFaAJZUrfsFjF9CgdOZvE/NLeggQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqggbst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:09:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304d8613efbso5285178eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996151; x=1781600951; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9kqHTn3HwlauTP/Mvnc9qYJtQpvMhNbtivLTo6vwNmo=;
        b=I1djfGp4tY94fnWaDK4EgJ1w6kVfXqFdjPnzvN9oz8P1uA5vGDwISOpbf3wmE2AwM9
         5iM3MvXojYgAsdvASugA5jbqiCc0gFqUeGYxUmAL//Z4goOakCy8z+wp+S/9IUxwmYrw
         qhcNrFJXbSDajuZQKEV9W53qGZlmtn9gCPxOkosj8Hy2bxzrEwWEiHx647LagyNxe7a2
         az4q5IFk8RtObdtrEuAJM69rxi7JPyvoX+/GZe3uwQUBWdXi0hldsz5gamaeTiYWL2L+
         2nPl1VwNGt4DJan5nWDmKBaMysRszTBuliaj8NXQM1m4nCrg2/Tvimie4otpXnyrxDIJ
         nzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996151; x=1781600951;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kqHTn3HwlauTP/Mvnc9qYJtQpvMhNbtivLTo6vwNmo=;
        b=HfFUBCAu/u69G4LXGmuooM+1EAZ6r5dTmKUBYuaobnduvbDmXgrk+liI2Vqd0EVWlM
         pD36+QWd/z8ipYt7DQ8p/VhMP3Y+G7srdneWEg/ClvRf8jLeTalyUqK9gH/rbx8ZKqOe
         piuptRwXkAZU3HJpGXsSIAGXOqj0epxUZku3kJOahnIqLBb+0ifHBr7Yb7HDqcuPxHFh
         BYzEJp3Q938YkCGqfeURcMD48AucffuuWu6VlUD5vMvUY8bjFkLL0BLL6zs+tYKeEz0f
         VPAjW3IgJNGRs8R5XFZ/jmdenaAfUjJp8Lz2G5ANI9Cz9S7WpJaBGx9XGCZHxnyYDmAI
         U36Q==
X-Forwarded-Encrypted: i=1; AFNElJ+es/Q7bw1eprtELN77nbCMJENiE2Tnd5CCQcR+jn3ZU3EWVkW2IoBFt5OKTPUmkfztEQOHe7PRcwxJp1Ds@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Kx/Ggf9iGy1H2rXeio9pHSpLu52E00RO3Ukd8sffcrQr4zvP
	AaRHNjNDxTnECJPT5QAmfAopJTlu3hAQrshJfQgs3twNTwpDRQmWx/bOcka2JFlZR5pOistgfQC
	oPgF1IghPcB3xRWnpCf0iiq3lNfM/CpJgKlndbmYRiHMRhCA70tcJ8PZ8EjUAZxyosIwQ
X-Gm-Gg: Acq92OHJ9yXJEXNQmutdQfJuTccwB3qCMmCLKoBulD5wxbWo06OrK0QIDkXRSMJzGJa
	4ZQG8M6W2uGVl/j6HGOunfWd0x/3ZIZcJp5Y/wDNvEH3TP388OV6LMaQDhS8LJEXdvFIHRagNB4
	vytjeSI94Oam6b9t23WOn7TMAuEmHzxGZFX7mm3G7G7JEg+Z1Rq1+Hyw06crMMHA2QgHfP/FKY8
	2p23mOaaVNHb2sGE0cPgvgeN3+Ss0O7TUX1PsjvV2Df2IQ1sWjHoem+/oqVJXXdQ4CDBaPGQ7Ix
	hB498x2P86uRYbacVLuyeIl6+cvibUchkHaWIQGs/Q96Un6cKAh6wxGxSbR+BoJ6+ItgWFKye5k
	pkq/o8138Bnm+c/M9XQ7uP9Z/W7wtYYQ6SeerFX1GRqzMRdHnZp2qvZoyy0Kz/+hAfdFxxG+jNg
	71wNrFxkk=
X-Received: by 2002:a05:7301:1010:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-3077b78cf1bmr10329037eec.25.1780996151375;
        Tue, 09 Jun 2026 02:09:11 -0700 (PDT)
X-Received: by 2002:a05:7301:1010:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-3077b78cf1bmr10329009eec.25.1780996150851;
        Tue, 09 Jun 2026 02:09:10 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df102a1sm19356606eec.20.2026.06.09.02.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:09:10 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: crypto: Add Qualcomm Maili crypto support
Date: Tue, 09 Jun 2026 02:08:55 -0700
Message-Id: <20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfYJ2oC/x3MwQqDMAyA4VeRnA3Uwsr0VcYOsaYzMKukIg7x3
 Y07fof/P6CwChfoqgOUNykyZ0NTVxBHyh9GGczgnQ8uuBYnkq9g1N+yzvgYQuNT8C3FBJYsykn
 2/+71NvdUGHulHMd7YoMnnOcF4lTVqXUAAAA=
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780996150; l=666;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=eKA0uRMeiYBzZ8FrqLiIcawxeUNdHDbGqu3nsVelPBk=;
 b=2HviacF2Bp945mv5ccBbzVgys2yKYLPu7Kcig1USbJ05mOHa+uNnyxs9bfNAw6tCxj6fy11gf
 3x4CM02VNsFA+WbCAGzdtMjtbxCIzCknCmkwuijFsRPEIHJrJuC06yv
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NCBTYWx0ZWRfX3adjuwsYRCM0
 hsfpdx7cY6srpEyXM+ekGYUe/FH4Vfpy7DerZ068t2xSAmnzBgjFcRJybSNvl6+iLJLVNhePK50
 GiY9sMsq3nLLqzQQ+Vy1w+lFmjrKXJCrCiFV/wAShFvjzemlzTzPPdd5cwRdLVzL0/3yqum2cFl
 DXO7Vm0cGhGmbDGQ7MI86C1CYyLeKhpPLy1T491QpWbCTBfAvTF6eHw9MwNHJLYvV6D4/62aeqM
 iJIHzeX8hZiqj53gz2Ley/cjla2ufgIq65IN/a3hqCj0gR6Nx5JL2LOnSM83fsCYJ+ifRtZlI0D
 0Dnl2xvR+uPUB8ql/c7vObU0niihCQHHwMOHK3g5T8oxU/oLECLn9tiIrq6r13CowJHOh5epOEv
 U80yFe4Li1lq/WVwjkkYS9F8mfvaxn6SzDuB7+ziWAzAHfyAjATF9j2/8kAg4s3ovONCWcLvXvC
 6v+0lCxPwAGgrMJZORQ==
X-Proofpoint-ORIG-GUID: iEv6UvcUb-A-MOPEogIs3lX7rmdtspj7
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27d838 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=R6wdMziQwWSI7NrRmIEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: iEv6UvcUb-A-MOPEogIs3lX7rmdtspj7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112074-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B2E165E355

Add crypto(ICE and TRNG) dt-binding support for Qualcomm upcoming Maili
SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (2):
      dt-bindings: crypto: qcom,prng: Document Maili TRNG
      dt-bindings: crypto: qcom,inline-crypto-engine: Document Maili ICE

 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml                 | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-maili-crypto-5d612f629acf

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


