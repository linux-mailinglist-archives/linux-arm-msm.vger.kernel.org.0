Return-Path: <linux-arm-msm+bounces-114625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nx8eKPFePmrhEgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:13:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB6F6CC503
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:13:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CMXxKKbs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gDK4gTKU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114625-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114625-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD2A1303C42F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 11:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A633803D6;
	Fri, 26 Jun 2026 11:13:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DFD3B6363
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:13:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472397; cv=none; b=DH75blhLBdwO6nM4JglM0WpU2cu5+1PnH/rAiKLrDUgPjj1DIWmSkj+6gkz8kB8zekV0fU4uISaYeIe8VXTRJHvA7iOu6ndJt5xvJPfwjGt3eqqh41e77kyZC/DSyspzHp8DRg3Ckzh5vSrNHl3MhsQJa6W+KJkZmY3oL4Zk59o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472397; c=relaxed/simple;
	bh=5CcdM1owvnxwLYUd3cJ8hL4UP92+ukXLaJN7gwUdCPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XxaW0eo2XVkH/35HQsSaBJiqQQV3+VT72M0+e4H9fc/2Xkq4FTTsBHShTupeRsXxxK4GnMtwa6/DTJE0ZcB8ZIThULCrFFzQASSX0JGvV64NSy+BfgwPyuuj2gQv9rRf2+1UMqOVT1jLbCV+dvJpzb+WQxE4TYngjX3O9MRNlXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMXxKKbs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDK4gTKU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QActdq1069994
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y84swSBgXfG
	en6xzSwkrQfwxGwFanU/sxFKsgfy6qzA=; b=CMXxKKbsgT7nw9MxU5h2sBargYX
	Qojys5begMUXh/mSSrDFinkIuCmP9GNX7EglHMPizbTg15pfALOxFRO5FTQ9mKX0
	y4SmJlPRiTTE+hWOjHxTlgLDlUX7tGNu1S3Q7w3S+Vci/XhRlDzAJ2nzDx8XXcVw
	KyZXfWrwDrSqWfDoKW/d6/csXwUtIwrjDx3xCXXpRUZmiMgv20dkwnObOQA+gtUo
	Zrl64ysdmfFdj0YZi8nyzJY8wR84hPHYZ0WEg8sa5nPapohUVkD7ZumRLSaIzAV3
	gHY2QJSJ3Bk8tY+hx6NwMrY0ykPvfMr7kzWkbvC9KuqKVo41Nt7mxEG9T9w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fcta2qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:13:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845c85d911dso148093b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782472392; x=1783077192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y84swSBgXfGen6xzSwkrQfwxGwFanU/sxFKsgfy6qzA=;
        b=gDK4gTKUVQovSsNpJ0zjGjGaBALOmqECHpfbiDfWMmaLvmSvlFVh6MOnYUwJcJriuh
         GMGU1jCekG30hptGUnxKsNthtVWqEAG4HN1XO0NAMjX10V4LSi8K33cwCZRz9g591QV6
         kEo7u5UmC4p3eueO9S6T4UtNmhJz3/VPy8452hBfeCkyQTaLrlx6Hr1ZyTJqQGujgASB
         ALy0RcNNh9Dd0xbh7mUyslHlof+hvJ6YnLZQeKJtgce8S7R3TzRgi3ddoVWYFNGoJub2
         hacXY3XE6SfOi3OHdPyHY9bmaBhwhTyST5HJRZ+NbeQ1hc9Oh/ToIKNf7+P2qSxZiAUE
         H+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782472392; x=1783077192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y84swSBgXfGen6xzSwkrQfwxGwFanU/sxFKsgfy6qzA=;
        b=RfGfrwgCDWDUz8P5FnhdYUpj5WXJuCfZkn/+pbbdlIqGHxjaOm6S56CcFYloFJf0PW
         LoyAwWnUcR1afRX5+EXFLM4v/IAimKOUKPTok/FHVpGhSeqduCc7Nd4dnbKs/+NuO6fz
         LbJ0NPrBDa5/c8+1fY1F8tah3ebcy9eQgQ3vJkGOclaX9b5TqEsZpgMmtq/+/YBgQL8N
         LjZ38f6ZZqlloMjz3LSopMSs4Mt9xEnpi4haHNvHdcecyWnQOaM2SMtTSi3Ox2XvGIPB
         aiAXk+wlxyn58zrkZmbnVrstL5hEZ0WIeRZvgAoriNaNTl2HQDiMsNUYrjm9RX22Zhwk
         IAWg==
X-Gm-Message-State: AOJu0YzH0fi10Za4cWVlOQN+8TwLZ9m8BwiD6gNFns4pDzL8Qdq6yuS0
	jaJPf91DRi4+8mnegkGkf+qgW59cxXQiNSCaKiwjpb1s5JtKzvazVzDzFIZXjhykc9JvAJXnA9H
	H3OwpwEwMZP3/JcoTVU/tW5LKxy93vlh5tRU+Doi720pVSWZTgkGTThVxXQljKeqLZwbO
X-Gm-Gg: AfdE7cnFZt4enRoWArOB/7tlvdYgpXHrI/xecJib0L4AaI4T2SjaI8OCSO9GrP08o6b
	pQ8mR3M6rxaBd9HgY+CPrQGsp87x4Ii4EgYCdrkrIQ3fKoz2gDo02QrubiPEdN1+g5AyDJQ87Om
	+0ruTX0yXOwhrqtgLnSPSbycdbXwgXxwZ/092lUJmBlMx28twNtoq9ShVhRQZZ5yjFOYkgTXsnN
	KoBfvjNT/fo/mcFKIweFj0YBUWKbxj6OuiE8r26UgwHgVZoR3TdQ8dBNczrV30KmlnuODGKrNW2
	zhfu3syuSgddHamoyCMCup9fW3YuYAzt3BAh8pK2K5syrA89AuuEHul9gVcEiNcNW7rN3Q38bbl
	9F4vOVvUMubNyA/6CDvS4mZDu3pLGWgrAch72Tvzb9Q==
X-Received: by 2002:a05:6a00:726:b0:845:ba04:5881 with SMTP id d2e1a72fcca58-845ba045935mr2207590b3a.5.1782472391865;
        Fri, 26 Jun 2026 04:13:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:726:b0:845:ba04:5881 with SMTP id d2e1a72fcca58-845ba045935mr2207561b3a.5.1782472391389;
        Fri, 26 Jun 2026 04:13:11 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845c7c935f6sm1097384b3a.19.2026.06.26.04.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:13:11 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: Add monaco-ac-evk support
Date: Fri, 26 Jun 2026 16:42:59 +0530
Message-Id: <20260626111301.3479559-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
References: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HtgsmAN8watpcajWhBtCZGXHZPpk_NnU
X-Proofpoint-ORIG-GUID: HtgsmAN8watpcajWhBtCZGXHZPpk_NnU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MCBTYWx0ZWRfX0GsLomQAqUU6
 KffUrfHYAxzpU1N9pROPUiSl4FDDGB1Hf7zswTlVmNFeUfnC0H3lfrPX5mRcNARTFJ1d+abFgb4
 4+y4FMaPbMVK1EfBHICIg3DSha0PD/qKkmeG1QY5KNwVhZ/UPnDS8nXwx1Zgb0X3bLtbUkbd07v
 FtJN3dgD5YWU8IwIKOIjy+R7R575ydyha/NAf76jOtFiL788SU9VSN0EBbkOQkJQDVXm0c/j25J
 E4LY7vCLHCrACfYyXuk700ndaeI9RfAisbx0xYicJmTRNDZjNRDoXZLbq0Nvf4bbq+lx44j3wGi
 WgnHPHspfvvFzPvKJD/VAhdrQ/Rlx8EF+R7LXKKhiaDJXjEDTRSXwrPuflRUqcFsuzweaz15rl7
 EQw7ca4vBtUJ6NKf9IPkuL1fE/clyc+MSg8oiukAxC9otYmEhxwt2MpWs23lipq6XkOB5T9ltwl
 yam5yxH1/B1Tv2JdV8Q==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e5ec8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=vnR2pTXPFHMqojpGVs0A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MCBTYWx0ZWRfXy2fUvfMtYsLI
 1bS/IHGReR5QFXrSjqDz1RYhej0fDtvVNijzekybOCc4Wq50QP27mPPXtbzZ6G41FMtEJoXJnIw
 Mb/LPtzUOKQq5TCgqZYE1YYNaIJx6W4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-114625-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:umang.chheda@oss.qualcomm.com,m:mohd.anwar@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEB6F6CC503

Introduce bindings for the monaco-ac-evk IoT board, which is
based on the monaco-ac (QCS8300-AC) SoC variant.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..0624560643e5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -932,6 +932,7 @@ properties:
       - items:
           - enum:
               - arduino,monza
+              - qcom,monaco-ac-evk
               - qcom,monaco-evk
               - qcom,qcs8300-ride
           - const: qcom,qcs8300
--
2.34.1


