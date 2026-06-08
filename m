Return-Path: <linux-arm-msm+bounces-111829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hgFjEh+dJmpDZwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:44:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5D9655475
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:44:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gp1vqFte;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ld6rBYI8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111829-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111829-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC222300B2A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92A03BBFC1;
	Mon,  8 Jun 2026 10:33:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFEB3B8131
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:33:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914839; cv=none; b=kePSMHEj7M6CzhFkja/heejrWVWAe1mApflfE9u95iLEcDZBJx03OWA57ldHWQAdDpVjJ+PMo2RoUZYY324aVBSatHFH1UvqsqlWBamzIxkmzLR9iFhnfUN34u7g+r2R7xlZ5hT/a60xaZnw8nTTOz4VpexJdfoMASTUEU7Sfo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914839; c=relaxed/simple;
	bh=A+/EIF8eXT0VuvNfYNQPJz5eVhkjLGGcH5RSGILTHLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BXgBdd9kYf9VeFv+I8PsUl3Tr0ZtAyKDYFEx5Yj2slB6Xb/uA8aS2zVHMb5gksiidPeFAA3Ny9aETnUszamksAmM4GBykQp/F/FwPf8h1/ezZAOKlp9POzoHCEpwpRqybj0xoO9o8tIrIrowCpgWccaVzqeEcb0QuOxgc/yPZk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gp1vqFte; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ld6rBYI8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Oteo2384454
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5kZFXrYXkFu
	MwRonPUnIHxpnv8Am/3Jb5Xkdegig3qg=; b=gp1vqFtegVxv+mGdJo+NWdUIQUI
	yrYNxHxtvGZC/FDMXsTxhoDMSc+B5bwZNT5yfkwqoajmAubIncHT8MjwQ8CzYqmh
	JgiK44XkM8MfBpqqjiU3ub8eRpj/HVeD9GfWqlUIMT4yKjdpYbvR+8cxvyGxhGMh
	vDkIo/wVWSHzbEnLZljFNeqfxoEXlNO3Hm1l2zN6x5jOB6EEagvbEj/Kimx1po1B
	uqG8Id2EwDIyZl+LYqPnHh4H3EjQliMTRq8FMpjcifTjdpt8hu8sIvryVZtj/AsU
	hRqbrsyQ4ScFZb4LFxc0VFaHbtMmnG4idmUCW40CSne5yPbsRDCsGGAYRdQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1f93k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:33:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso4617079b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780914836; x=1781519636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kZFXrYXkFuMwRonPUnIHxpnv8Am/3Jb5Xkdegig3qg=;
        b=Ld6rBYI80H/vrDqsKcyXfekZcOeb2Q6v69Q2M1zqlLE9A7mDFEpsMjGmYZKPZmIjxZ
         cHiVKt+rqXOSqPV2vZWrXwAURRNX6rraP/NsWfufO2uqFKmszGhQ95e9WIMQCxqjF1zm
         KaKFpavcBXffc2G8FgwIcb1YNfPZ6LqIapvD0l4HJSVt32NADMqSTVIBVWMhPqDXj+lU
         UeLjjzqQcEKqourGLmIlPxx7Wp+wO7XBUYcwHAZhm6SegBF/mlT/OGGlOQPh0v6UjQyC
         +cLEh9Kn17A1+aAWXboKYVxSlF++xwtyZ9X3lWLZlYhwrhmRRsQejKOnrHxh7kmCdMXr
         Ou6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914836; x=1781519636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5kZFXrYXkFuMwRonPUnIHxpnv8Am/3Jb5Xkdegig3qg=;
        b=rZCC2HrEFp/ukQOJr+nMyDAXSGNwCuaEBi+CnEb2MTTs+Q05clnMxDQoUKpgS9s9zF
         m3AWJ6vyXUwFBCucOkvFP4M+K+oY5THlWuuvTrOF72S01k5CY+fmdQ7mIoZTJg5+54MF
         oVt4w596TEh/lCHfWlGUjCmHCnOGBCac35jMS+PGxKTAefS4m3+erzt8Waqw21lerOZc
         VgeE+J1yO6vTNr7/lsSgOHkjIHoNpk/iAazS85K+6sm33iEFEGGHzaq13GCuciqVfCGs
         QXA0xgemefVagRSbdmSDFm8zz/BrFRfJR+BFJm3f9i2CmZMzGQplv2WbsMGQmKZOcqM7
         opng==
X-Forwarded-Encrypted: i=1; AFNElJ+uDdJrXh3S6qRnVvc/4WkTr7HSzyjVdLq8iZwGDMhtpOihnAxkOAV2eeyqK2gxYEzvl/cpIBNpHCUqsQs9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9i4mTjG0fXPsGpX6W9CgBf7VJEPvF72mlIZC2PhT4In7t0K+R
	ECLa5mT5FwFShYzEToIufzRd/L8F40H/5LMyM9km4sICRTI8PM2XFhUuluq64zrqXEMUlSrnOYW
	8UPc4EOW7WWeoAentGPeUx8Wgsjo5Cri1cZu5yScFfD+lAoic5+SBKkFaBr5Mk64J+qBvPCUsoM
	Fq
X-Gm-Gg: Acq92OHUFBFns5gki3alwhzORY0iQnuORgmGykg1bodqHzyjB0I80yXuOh9adhFDYeZ
	EqvxNJGyvANKHpUxPcxxrByQWmTmhuaxQvLPVkoyVriTsMeNcIFtcazpl5oKhJSqUDF4V/Gf5Ow
	+7XIQgJaLAPJddmiDQw2sbwpgyzJRT3rZdSYLslRucqRgF4+V9IipvcJxd4tPoZuN2r69i5zdM6
	EhtHj4UTeWLunQsAdh6FDpELnGB/ABtAK3qxeQbxs7Wqzz1pTw2i9ofM+K5cNG8UKP8gHbCQ0wq
	Gx86vM5CKf8zTZhQv1TCAREipw/yV64w614LvirS5IlyZw6wfwnjklp4zCONOegFOQz6HRk/+ch
	NZM0AIUIedSzi735McRsKawRLLNu8YK3kL9p7PxbOlzogmGIlFvlk9+2UEXgsVDjzZVUm9u69cF
	9Nd1Lqu2uHSA2SWjdk/O3IlRdnr8kCeJftgKDqpKvl9FnzoprQJo4lK1y2U8BiYw==
X-Received: by 2002:a05:6a00:2ea9:b0:841:d7f6:7297 with SMTP id d2e1a72fcca58-842b0f0994bmr15341783b3a.40.1780914836352;
        Mon, 08 Jun 2026 03:33:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea9:b0:841:d7f6:7297 with SMTP id d2e1a72fcca58-842b0f0994bmr15341757b3a.40.1780914835851;
        Mon, 08 Jun 2026 03:33:55 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a2600sm18571570b3a.27.2026.06.08.03.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:33:55 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,qusb2: Document IPQ5210 compatible
Date: Mon,  8 Jun 2026 16:03:43 +0530
Message-Id: <20260608103344.2740174-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5OSBTYWx0ZWRfXwDJNx/YI2Q+H
 n0SCuojtbe2+d6RLvXZJrBriVS87h/DANcCl415g2h2MU5+gak7ClTxyCflOTR/ZQ/QJyl0y8VN
 /hq45eD9N7T7L+e1RrzFkjV7Egl8pchM6nSHWFweTwfmy8G+9ydqvJFb0vIqHzi+nb6U8VKrlup
 yqHCrT8zeMQVPgtqvqGFYKHDMleLBmbh0/ATIBIfY3EtMc1L8eR8f7YmzAjLRFVIthuDLecrmqQ
 ARXQubXrenhY69cRfOZL8XzQeEww1SjWQEot2E7p1QPQxaZNiI78YTFaGRZmmY425KgzbzbxrQY
 kAgKLeL5D+bh8Woy0D5FuxZNJIpvLrSN92bjamqQifwc45LSjOpuoDgzmZqDbb1OuingM5xO/lb
 yr/zVfWK6HV/6icOrnLmh3QyCewZmBEIGL7uZP4WuvfQuVklwju+loVdg+bQvZAB5NK1sQE+Hqu
 Fu8JBGx5zOZVdlOjJjA==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a269a95 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_sJFZoy4csN85dw_wmcA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: jBhFm53aftuydgJ_DHx1_BJhyt8qIEG9
X-Proofpoint-GUID: jBhFm53aftuydgJ_DHx1_BJhyt8qIEG9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111829-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E5D9655475

Document the QUSB2 PHY compatible for the IPQ5210 SoC. The IPQ5210 PHY is
compatible with the IPQ6018 QUSB2 PHY, so allow it to use
qcom,ipq6018-qusb2-phy as the fallback compatible.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 39851ba9de43..449c2a7e5fec 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -30,6 +30,10 @@ properties:
               - qcom,sdm660-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
+      - items:
+          - enum:
+              - qcom,ipq5210-qusb2-phy
+          - const: qcom,ipq6018-qusb2-phy
       - items:
           - enum:
               - qcom,sc7180-qusb2-phy
-- 
2.34.1


