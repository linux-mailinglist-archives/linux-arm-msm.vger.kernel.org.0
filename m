Return-Path: <linux-arm-msm+bounces-96478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOh1G1KZr2lbawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:08:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E47B245249
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3D39301D499
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA1E3C6A52;
	Tue, 10 Mar 2026 04:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dh3UkXyN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMDpGdjr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC9C3C6A36
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115710; cv=none; b=gB8BupBkHUhpiu4iEXvPLXLq303oJX+vGGwGZNYHc0uoaeTKDlRSL7s28FybVdfyc6Jvm1A8h7IlgMf8o5NNWaXUxucosQELJL7TB+enaVgrN27Ag4PVoY8bYbbhVDqaqadAUqEDz0CPQiFnWfL2aRIHmyZaUgnkcU11U0zLOjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115710; c=relaxed/simple;
	bh=DuZeqPcjKYhEn8F5NjUZofnkhzNvaLI1wnEiFR7wyuU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dW7TT2ZmEdWXRUwMQ5MZLiG7zS1gfhFrg+0yVx9P+q3myw2KVuUXpA5yuYK8c877ejWPD1YG+ywrnz3yZkJC4nxYNeHLMKhpECmvSDchKoQUImDdLyis2vDpSLkR6SoHuN4zfUI9vX/KUH3ul+ln3oNLKFtP8tEEl4hkhIYuREg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dh3UkXyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMDpGdjr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2F1eQ2021596
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ovr49Ywe9/o
	J6BapOkVc1HhRaNPcXs0HWWpvcanHAR4=; b=dh3UkXyNKIU8M//12ZwRo0qw0s9
	UNEgbJ9US1J9pMcAKLV712EWGgkO9EGK668AaHqBn6Qg6SkqOJ4BICTY1j9OW+bo
	8F0jz78+uVH4UV8EF+dGAAzHpE/8yeqA3R3A5pZcmvOAC7QzQAAUgdSdZ0tQD13c
	+KsAT4Qx39cN/ukvL3aZy5tpCh4prJ2tDuNIyRZztpFP4snraf/b7mylQxIEYKkb
	TZ5pVSmDAbravl2+L4u/m5UjyUsLpqvda1k2GTRBHpJb8LG6JTsWweZEn+9bWSCg
	YRK/uawDo+zTO6cFPthJpr4zczmi8lvxQ7c2yA7yDj62y8jaj27+Nq0FPUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbtfyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:08:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae467f128fso87891325ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773115708; x=1773720508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovr49Ywe9/oJ6BapOkVc1HhRaNPcXs0HWWpvcanHAR4=;
        b=DMDpGdjryuUXDI31jHvP7c0J41Ca3A83ZQVkkpUJ3aN6G4WH7lRDioFCvraDUuqCSW
         C/NS8D/GlA0fwCurxbmIAVVmls5jMWoYEfYNiJDuAVcVJiUN53TUzorH/nwUKAgfQHop
         YayQilhQjGohPuUxusrMv7YDtSiJA4FLtw1aqL2lruSJLwkF/+SKhYD0N9qOEAO8PTRK
         Kd2oVBjvBQoK8BFxD1IOdfFONHLzhnZajHfUlQ0iFHMp9L7oOBDuYVWjtxgNnY/40sIV
         PBZbHxajwbMH+mN1SOIf8VP6e/QVa12io947c9NMffBzI8Tql2/M8nK6uL4kxhgPD1Aa
         bBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115708; x=1773720508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ovr49Ywe9/oJ6BapOkVc1HhRaNPcXs0HWWpvcanHAR4=;
        b=qQxywfKGrZ5nH8JhFC/4KFBMPuAJl/9MT/9+UbGId5GRpconhstZLMR60IxvLxGQta
         ID/+c3zO33fTPSe6fJwOdF6ijbxuoBnPuuqQv5eQgviUVunWOv1h2d9DtzEyzOKayNb1
         2vKXVc2Hle/XV6aQjbVZ6B7yl3fmFTrj4ndpjt22QYkJBI7cRtcqY2C26Q0ceg4c+PPW
         GE5wAu4b7mQ1zxAUYlh8ptwTeiL3jgrZChUTxBzkLYDd0uRrgY/2HvhSNWwZcjkYTQ+h
         vo56ewuapXEmdvg+/EYZWBs9RCcTzXPRmYZ2yGoy/Jlj6buQWA0m3I+sHvkbOHnit8g+
         We0A==
X-Forwarded-Encrypted: i=1; AJvYcCUqaSHPvsvFrSH8AkYfvFk6uX7m4GqvagnRti7jiJ0lJ8/vm70Uwh43ILSzYuhhm+Eilb7MM2P0FKOtNR3I@vger.kernel.org
X-Gm-Message-State: AOJu0YyZPjirfdVGCKiCZh8tHtqBeDQVOWVevkt5RJdSIn88paq8Vib3
	X7pp6s09uxDk/aqRLIsqoQZ55Q05k2j5E/twipaGJHg56oWUzoKH855cBo7h697ExIhiX5zAOzI
	qjBAgZAvlWzm++p4U24ftdyNZs2sfIIUEBczLIgj6IbWarU/MOFqz5pqbkkG+IiuxDCEJ
X-Gm-Gg: ATEYQzz48MI6CbWHTtXV2sJ3x4v7IVgW4Y4pv2hGkupGy6gtPcg5Ov76gt3dJbiqUTB
	XYbsa6FjMkcrLr4r8VI0lUH68T6NsfUNpFbFVqd6Z4yfW39DTtZWa9jnI4Tbqtb/qu/rp3fzkgq
	PvR0WBQD+XRymQI+cMUOMD+7DPDLgpK/v8yumXAYhb+U6R1A+MpIQSEKtRNaHjlYSt62F1gg58Y
	x794n4u/Fr0Up6tO99MXTqg56IljSQkvFRr7Zkv+EvvSWZylCK2ldEvwM1gEtk1iutyDb4GDMFc
	0OJrfhM0Zx3pjK/Zs819gMv+720xhMdsNyF8IxznJMl/bBzr7sNc3lILqn5DCI7TGUH+bELd9aB
	MM5dj6+UmgOZVPQo45Cl6zp9isKqAWY3qJOSxHCfjH9mgMUlrJ4uoR1dhgnKuqlEbKI3LpOJwcf
	5MAjL5QR7hj8i+A5geIV6IUxCKym0b2m59FCIh
X-Received: by 2002:a17:903:35c6:b0:2ae:4e43:a606 with SMTP id d9443c01a7336-2ae8245df81mr109276455ad.20.1773115707804;
        Mon, 09 Mar 2026 21:08:27 -0700 (PDT)
X-Received: by 2002:a17:903:35c6:b0:2ae:4e43:a606 with SMTP id d9443c01a7336-2ae8245df81mr109276175ad.20.1773115707311;
        Mon, 09 Mar 2026 21:08:27 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aea4eed00fsm9797975ad.80.2026.03.09.21.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:08:26 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: sudeep.holla@kernel.org, angelogioacchino.delregno@collabora.com,
        viresh.kumar@linaro.org, neil.armstrong@linaro.org, festevam@gmail.com,
        Frank.Li@nxp.com, danila@jiaxyga.com, lpieralisi@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, tengfei.fan@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: cpus: Extend Qualcomm Oryon compatibles
Date: Tue, 10 Mar 2026 09:37:49 +0530
Message-Id: <20260310040751.3132523-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310040751.3132523-1-sibi.sankar@oss.qualcomm.com>
References: <20260310040751.3132523-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af993c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Jikm8KGWMo0igBCjT2MA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzMSBTYWx0ZWRfXwRlz+w3Qhtli
 oFEcmCKbPwEArf8YvI7BB5uyZa/jyTDd0Anmt6zdbNpgE4EJTCnoRSFtwLp/hocerHB/PZl052c
 S1YzfdyGsHjdW15B6PWY9XJ9wFTs94zP0pRog+Q6qnAIKjzhE9HRxdG42M67mMtTUmrgF8AVVNY
 CMjUIp0k2QpxzH1VJGlciMlpZO4fJkPCOOyYHnv6Wfk5O5cVCi3F856aRZZHDTAmPlWjvfldavs
 ZNuCsHYOCcYdQt47+D1eTY/YQ+J7hhns8TvrM96nwuyD3bV7qLYtQ/Ll7SIhll7dN+lOapbsGdM
 Q1BP6vivx5BN5UsnPIj8p8ojII4qOMlyF6PdHrtsu42M2/Hfqpvav60/9PtcoKX3J/vqHdMnzh3
 zHEn3VkSjKgQ/T7fdYATXjTjgA+UDiRUdy1X48gmC21JY56wepFe+bW+AljTd1Iwu4wJMdSeqGA
 dtz4YbSXKTlb59/oK9Q==
X-Proofpoint-GUID: e2qksxtqGDAFR3TMAXJGnReP4UR3460o
X-Proofpoint-ORIG-GUID: e2qksxtqGDAFR3TMAXJGnReP4UR3460o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100031
X-Rspamd-Queue-Id: 6E47B245249
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,linaro.org,gmail.com,nxp.com,jiaxyga.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96478-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The generic Qualcomm Oryon CPU compatible documented in the binding
doesn't account for differences between core types and has been
deprecated. Introduce core-specific compatibles, based on MIDR part and
variant numbers.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 700255e9a002..fb6e5871b625 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -218,6 +218,13 @@ properties:
           - qcom,kryo685
           - qcom,kryo780
           - qcom,scorpion
+          - qcom,oryon-1-1
+          - qcom,oryon-1-2
+          - qcom,oryon-1-3
+          - qcom,oryon-1-4
+          - qcom,oryon-2-1
+          - qcom,oryon-2-2
+          - qcom,oryon-2-3
           - samsung,mongoose-m2
           - samsung,mongoose-m3
           - samsung,mongoose-m5
-- 
2.34.1


