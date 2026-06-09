Return-Path: <linux-arm-msm+bounces-112015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IS+YIau2J2oF1AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:46:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4917965CE9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:46:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PljWi6oF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NlfdxrZS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112015-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112015-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64EBD30F5316
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 06:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675BF3D5679;
	Tue,  9 Jun 2026 06:41:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009863D8903
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 06:41:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780987273; cv=none; b=jr+vNjijadAyNZtyttYC1mlTIpuiCt0aqq7GFXe7Dd4N0/6wSOOx0fivgbvZg+zXVWlvknetixcHtP7UQlabQMPIJPEgnBUYMfo2BZ+fNFIQkBgLq+8DD7+3I6w6MO86D5pV13C8QxUYgQ3aOxIwaqIp/rmoYbGDfByhRJq1rFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780987273; c=relaxed/simple;
	bh=k7hnaVwjwEIkJyXL/LJ7DFiDXivFH7f0z/XpS1exHps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D+mRM2Kns00LGLF6kUkpsXN0Vq5bLq7ShtzMrjlixqZ6QDL8dLA/NLxaIlb15o9hMjsV63C2pdYOhWiDqd/wcYrYG5MfuCX9IHpzGaj0liLAiH8p/T/lv0wnL8Nrm/98n409qcOGPifmvJ5ivb77ourGdatxts6LyoPru7fbTUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PljWi6oF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NlfdxrZS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593waih1060937
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 06:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=af7uDGxlOM9
	GSSBjuKfOXaPN2bE2DNplYyQ/Iae1peM=; b=PljWi6oFGBJiS4QempAYtE4shqA
	BOST2KPtqfnR7QSkUMpwaqO+0/XuYY1PvqQI59aLIuuaasm6zKoonu9MHiHiuKB7
	/6w/vOpARKAPLpqYMuZXahe7Dl66ePRi7Z9wU8os2OxFC7a6zmM4GdgRZaOHQcy/
	rptvp/CogdjSfNzEkkeT3mIhECiUaD7KlwkNxw3A4gdwKB6sV/UqsV4CtAWXgcBh
	4CVeaMvBz8HqW9RNB+VgTsbW2adw6FAi/NbYq2gz7RLuN/UrX66oh+w/mI66gJs0
	W1A01tP55pdhwy0AQQJ39bOL/FOb8keWMnuz2XvxWyhye/SKKH2VPz52QLA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun44uet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:41:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d97415004so10023460a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 23:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780987268; x=1781592068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af7uDGxlOM9GSSBjuKfOXaPN2bE2DNplYyQ/Iae1peM=;
        b=NlfdxrZSFIar/1+0mkZTvdKDULncDDATQBxvIpME7+4wUfVWeaQ4cGb1PbuRYjSEw7
         /lltp0ZkQ0DGQqNrWezte37wWMhqkq5X9/L6zPNyam4FsrFH7086+9rUfXRWpu7KXSVQ
         ySCHjqYdXa9S6ChVk+OoifD+vmXtbf7ZCZapSFpxNQgJn/ZMcL572mH28AVByuIqpnck
         a+6gwXzt/3xfKn2eJZ/1fMeGDrbsibloxIY/FDPbDVK/Vr/feTU0kbmnrKKfUHL8p5/W
         rR3v9TY6PM8HPhFuHX7YLtppr/r4o8D88epQwwFK0RwpdxIAqVpPoSpfqjGfLlHJNOOq
         Y3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780987268; x=1781592068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=af7uDGxlOM9GSSBjuKfOXaPN2bE2DNplYyQ/Iae1peM=;
        b=Apk3uw+IxfLdUBcb174JgcFKQ1DDfavluq+Tg/zFnHhOskSYvXe857JVqzE7INm/dh
         cMj/0vXKRpRpYOeZpuXPRyGcmEtWf95VsgB+PEEljJQjpg46udcUIiDi/BUgdLWdAzQ0
         6cag1XGTJgJpF00ApF/TPaEAFZFD7j2rp0odm5FJFtcWef7qmznDJNP52OCvo8986GH5
         5SbZ5npiv81UIQdht17Xl0F2du/2jLNF7hsbl6Jxm50xWkELQCgeZTKwMw8aOiPgjjdF
         goouY5cEjjmmDy6X8sdraaIVYfgPO0vJhf1zbMccWiE3/B5riEv14eyLXh9Qr5rICCRP
         UD4A==
X-Forwarded-Encrypted: i=1; AFNElJ+mamXsX40gmET708LNG+Mh9AemHVp90FNk9FNm9y1v1ADll++FBkX/lSA2/5D7Fm3xsqGxKZBDZHZva1k4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm7ViFfCaMPRc+yohf6PvTZG3kEoeWByuHBCMv+gwQWomrMasj
	FcFmhZosjgcml1uO+qPzdmNN/iI6zjZyJVEm+guLm1KVdD9mUzpkaUqneERNlYZhXA6xp1BmBcw
	pSBUbSGg5v2wBfGMjRBV8Mm5mG+Qa9RDHP9ENzKb2hmTbcWG+zg6r0dHji8dIsuIePGP2
X-Gm-Gg: Acq92OGgjfKXZjeeULCNyzWOe57/ZGLOB/W7CMJcgtkcH9g/NrQ8kFncj7IIefZ4J/r
	/4RXotm172KG60+ynFnA0gzVov8fssdOjKdCAevkIauwmwfHoV+YeJKiv8L9qZtSpGFoWgPa0lc
	H5N3Wk9SQ7wVfgJET8o1RM1yJqKrnaeYi6xKesO4f7/F+2MKqB+f3CG5z8E+smYiM4DH1TYeCBE
	mvyImB1Vb3prkzWuuMzQhXqN2Ijkqv3RoAj424MpCFMQ+OrLG3DgZm4U8cvveSiC+slBPXxSjX4
	oUgsUEyNA/QIALTi0R2uAioRByfqEOLP/2cjGiFvBJHcy//us+4wy5RMigsN7iuBh1odqma7spW
	Fnes2xRawRkblAO/Az/1adBOC04noSasBZEqmxUKpnIlvf+xJ+1gixV538HIy
X-Received: by 2002:a17:90b:3d8c:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-370f096ad7cmr20921974a91.18.1780987268133;
        Mon, 08 Jun 2026 23:41:08 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8c:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-370f096ad7cmr20921933a91.18.1780987267641;
        Mon, 08 Jun 2026 23:41:07 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668f9bsm17898953a91.7.2026.06.08.23.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:41:07 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
Subject: [PATCH v1 3/3] ASoC: qcom: qdsp6: generalize GPR service domain
Date: Tue,  9 Jun 2026 12:10:38 +0530
Message-Id: <20260609064038.492641-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
References: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MCBTYWx0ZWRfX482r9OIKWoH3
 z4sAZq0D1EjIJ/NiDZvo+2tkrVtPQgpDPQnlgtory1R0kQLaUvd8ReEZ4GNbuKPs1FBMm/bAHjW
 NkgiHa0R0kpjyxApRVoZYSbvdwhHs87PWbXkEzTT9XwJQLfRdWe+TmxEvOBJeVp3KVsh3OHhLK4
 csAEWIOUOJQxX1y947KYBaiIIcG6OWYqj/LOF4w553U94XKHgCAroQekhmKSvztnTs9yuFzQk87
 HVGHouqhbSnOXIIykcd0FHAYg+MYivBcx0nRamDBFrlas1Q/pq/U5XjQ6uED3D4Plh2Uv9p+cot
 ZKPBm47gaZsX4kZXnxvXDcs729abUMqOB5HdnhKm6i0lHLSp9Fu9uLfBomxNJ32JcREkkZx83FX
 2bIobq6AxDFk2/TvPLsdc3feCJPHqK+m83fWBqPmsswYKZGZooUZ+U40l5uCyIa9sajKIxwUnJq
 APMQ0B0xgEFRtkvhfFQ==
X-Proofpoint-ORIG-GUID: NenaYnBP3W0vghRQM-Q9ppRBQaMT2VVH
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a27b584 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6XYVsKxM_fewtrCP58gA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: NenaYnBP3W0vghRQM-Q9ppRBQaMT2VVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112015-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:mpratyus@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4917965CE9A

Use each GPR domain advertised by the qcom APR/GPR layer when building
APM/PRM packets and add explicit dest_domain parameters to all AudioReach
alloc helpers.
Legacy helpers fall back to ADSP while graphs, media-format, and
shared-memory packets reuse gdev->domain_id for modem targets.

Co-developed-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 112 +++++++++++++++++++++---------
 sound/soc/qcom/qdsp6/audioreach.h |  23 +++---
 sound/soc/qcom/qdsp6/q6apm.c      |  48 +++++++++----
 sound/soc/qcom/qdsp6/q6prm.c      |  19 ++---
 4 files changed, 138 insertions(+), 64 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index e6e9eb2e85aa..8090181ac7ce 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -227,8 +227,9 @@ struct apm_module_sp_vi_channel_map_cfg {
 				sizeof(struct apm_module_sp_vi_channel_map_cfg) + \
 				(ch) * sizeof(uint32_t), 8)
 
-static void *__audioreach_alloc_pkt(int payload_size, uint32_t opcode, uint32_t token,
-				    uint32_t src_port, uint32_t dest_port, bool has_cmd_hdr)
+static void *__audioreach_alloc_pkt(int payload_size, u32 opcode, u32 token,
+				    u32 src_port, u32 dest_port, u16 dest_domain,
+				    bool has_cmd_hdr)
 {
 	struct gpr_pkt *pkt;
 	void *p;
@@ -248,7 +249,10 @@ static void *__audioreach_alloc_pkt(int payload_size, uint32_t opcode, uint32_t
 	pkt->hdr.dest_port = dest_port;
 	pkt->hdr.src_port = src_port;
 
-	pkt->hdr.dest_domain = GPR_DOMAIN_ID_ADSP;
+	if (!dest_domain)
+		dest_domain = GPR_DOMAIN_ID_ADSP;
+
+	pkt->hdr.dest_domain = dest_domain;
 	pkt->hdr.src_domain = GPR_DOMAIN_ID_APPS;
 	pkt->hdr.token = token;
 	pkt->hdr.opcode = opcode;
@@ -264,31 +268,35 @@ static void *__audioreach_alloc_pkt(int payload_size, uint32_t opcode, uint32_t
 	return pkt;
 }
 
-void *audioreach_alloc_pkt(int payload_size, uint32_t opcode, uint32_t token,
-			   uint32_t src_port, uint32_t dest_port)
+void *audioreach_alloc_pkt(int payload_size, u32 opcode, u32 token,
+			   u32 src_port, u32 dest_port, u16 dest_domain)
 {
-	return __audioreach_alloc_pkt(payload_size, opcode, token, src_port, dest_port, false);
+	return __audioreach_alloc_pkt(payload_size, opcode, token, src_port, dest_port,
+				      dest_domain, false);
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_pkt);
 
-void *audioreach_alloc_apm_pkt(int pkt_size, uint32_t opcode, uint32_t token, uint32_t src_port)
+void *audioreach_alloc_apm_pkt(int pkt_size, u32 opcode, u32 token,
+			       u32 src_port, u16 dest_domain)
 {
 	return __audioreach_alloc_pkt(pkt_size, opcode, token, src_port, APM_MODULE_INSTANCE_ID,
-				      false);
+		  dest_domain, false);
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_apm_pkt);
 
-void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode, uint32_t token,
-			       uint32_t src_port, uint32_t dest_port)
+void *audioreach_alloc_cmd_pkt(int payload_size, u32 opcode, u32 token,
+			       u32 src_port, u32 dest_port, u16 dest_domain)
 {
-	return __audioreach_alloc_pkt(payload_size, opcode, token, src_port, dest_port, true);
+	return __audioreach_alloc_pkt(payload_size, opcode, token, src_port, dest_port,
+		  dest_domain, true);
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_cmd_pkt);
 
-void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token)
+void *audioreach_alloc_apm_cmd_pkt(int pkt_size, u32 opcode, u32 token,
+				   u16 dest_domain)
 {
 	return __audioreach_alloc_pkt(pkt_size, opcode, token, GPR_APM_MODULE_IID,
-				       APM_MODULE_INSTANCE_ID, true);
+		  APM_MODULE_INSTANCE_ID, dest_domain, true);
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
@@ -485,6 +493,7 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 	int num_sub_graphs = 0;
 	int num_modules = 0;
 	int num_modules_list;
+	u16 dest_domain = audioreach_gpr_dest_domain(apm->gdev);
 	struct gpr_pkt *pkt;
 	void *p;
 
@@ -519,7 +528,8 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 	mc_sz =	APM_MOD_CONN_PSIZE(mcon, num_connections);
 
 	payload_size = sg_sz + cont_sz + ml_sz + mp_sz + mc_sz;
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_GRAPH_OPEN, 0);
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_GRAPH_OPEN, 0,
+					   dest_domain);
 	if (IS_ERR(pkt))
 		return pkt;
 
@@ -645,7 +655,10 @@ static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
 	int size = ic_sz + ep_sz + fs_sz;
 	void *p;
 
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0,
+					     dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -704,7 +717,10 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	int size = ic_sz + ep_sz + fs_sz + pm_sz;
 	void *p;
 
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0,
+					     dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -764,7 +780,10 @@ int audioreach_send_u32_param(struct q6apm_graph *graph,
 	int payload_size = sizeof(uint32_t) + APM_MODULE_PARAM_DATA_SIZE;
 	void *p;
 
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0,
+					     dest_domain);
 	if (IS_ERR(pkt))
 		return -ENOMEM;
 
@@ -820,7 +839,10 @@ static int audioreach_set_module_config(struct q6apm_graph *graph,
 	int size = le32_to_cpu(module->data->size);
 	void *p;
 
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0,
+					     dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -843,7 +865,10 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	int i;
 	void *p;
 
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0,
+					     dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -958,9 +983,12 @@ int audioreach_compr_set_param(struct q6apm_graph *graph,
 	int iid = graph->shm_iid;
 	int payload_size = sizeof(struct apm_sh_module_media_fmt_cmd);
 
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(payload_size,
-					DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT,
-					0, graph->port->id, iid);
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_cmd_pkt(payload_size,
+					 DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT,
+						0, graph->port->id, iid,
+					 dest_domain);
 	if (IS_ERR(pkt))
 		return -ENOMEM;
 
@@ -988,7 +1016,10 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	int size = ic_sz + ep_sz + fs_sz;
 	void *p;
 
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0,
+					     dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -1050,7 +1081,10 @@ static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
 	int size = sizeof(*cfg) + APM_MODULE_PARAM_DATA_SIZE;
 	void *p;
 
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0,
+					     dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -1088,8 +1122,10 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 
 	payload_size = APM_PCM_MODULE_FMT_CMD_PSIZE(num_channels);
 
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
 	struct gpr_pkt *pkt __free(kfree) =
-		audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+		audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0,
+					     dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -1172,9 +1208,11 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 
 	payload_size = APM_SHMEM_FMT_CFG_PSIZE(num_channels) + APM_MODULE_PARAM_DATA_SIZE;
 
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
 	struct gpr_pkt *pkt __free(kfree) =
 		audioreach_alloc_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0,
-					 graph->port->id, module->instance_id);
+					 graph->port->id, module->instance_id,
+					 dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -1219,7 +1257,10 @@ int audioreach_gain_set_vol_ctrl(struct q6apm *apm,
 	struct apm_module_param_data *param_data;
 	int size = sizeof(*cfg) + APM_MODULE_PARAM_DATA_SIZE;
 	void *p;
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
+	u16 dest_domain = audioreach_gpr_dest_domain(apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0,
+					     dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -1244,7 +1285,10 @@ static int audioreach_gain_set(struct q6apm_graph *graph,
 	struct apm_module_param_data *param_data;
 	struct apm_gain_module_cfg *cfg;
 	int size = APM_GAIN_CFG_PSIZE;
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0,
+					     dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -1280,6 +1324,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	int op_sz, cm_sz, ex_sz;
 	struct apm_module_param_data *param_data;
 	int rc, i, payload_size;
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
 	struct gpr_pkt *pkt;
 	void *p;
 
@@ -1295,7 +1340,8 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 
 	payload_size = op_sz + cm_sz + ex_sz;
 
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0,
+					   dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -1480,8 +1526,12 @@ int audioreach_shared_memory_send_eos(struct q6apm_graph *graph)
 {
 	struct data_cmd_wr_sh_mem_ep_eos *eos;
 	int iid = graph->shm_iid;
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(sizeof(*eos),
-					DATA_CMD_WR_SH_MEM_EP_EOS, 0, graph->port->id, iid);
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_cmd_pkt(sizeof(*eos),
+					 DATA_CMD_WR_SH_MEM_EP_EOS, 0,
+					 graph->port->id, iid,
+					 dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 62a2fd79bbcb..d07fcd3a8fa7 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -912,17 +912,20 @@ struct audioreach_module_config {
 };
 
 /* Packet Allocation routines */
-void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
-				    token);
+static inline u16 audioreach_gpr_dest_domain(gpr_device_t *gdev)
+{
+	return gdev && gdev->domain_id ? gdev->domain_id : GPR_DOMAIN_ID_ADSP;
+}
+
+void *audioreach_alloc_apm_cmd_pkt(int pkt_size, u32 opcode, u32 token,
+				   u16 dest_domain);
 void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels);
-void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
-			       uint32_t token, uint32_t src_port,
-			       uint32_t dest_port);
-void *audioreach_alloc_apm_pkt(int pkt_size, uint32_t opcode, uint32_t token,
-				uint32_t src_port);
-void *audioreach_alloc_pkt(int payload_size, uint32_t opcode,
-			   uint32_t token, uint32_t src_port,
-			   uint32_t dest_port);
+void *audioreach_alloc_cmd_pkt(int payload_size, u32 opcode, u32 token,
+			       u32 src_port, u32 dest_port, u16 dest_domain);
+void *audioreach_alloc_apm_pkt(int pkt_size, u32 opcode, u32 token,
+			       u32 src_port, u16 dest_domain);
+void *audioreach_alloc_pkt(int payload_size, u32 opcode, u32 token,
+			   u32 src_port, u32 dest_port, u16 dest_domain);
 void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 				 const struct audioreach_graph_info *info);
 /* Topology specific */
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2e5b25b8d00f..12ca9fd0fbe8 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -102,7 +102,10 @@ static int audioreach_graph_mgmt_cmd(struct audioreach_graph *graph, uint32_t op
 	struct q6apm *apm = graph->apm;
 	int i = 0, payload_size = APM_GRAPH_MGMT_PSIZE(mgmt_cmd, num_sub_graphs);
 
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size, opcode, 0);
+	u16 dest_domain = audioreach_gpr_dest_domain(apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_cmd_pkt(payload_size, opcode, 0,
+					     dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -142,8 +145,10 @@ static void q6apm_put_audioreach_graph(struct kref *ref)
 
 static int q6apm_get_apm_state(struct q6apm *apm)
 {
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(0,
-								APM_CMD_GET_SPF_STATE, 0);
+	u16 dest_domain = audioreach_gpr_dest_domain(apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_cmd_pkt(0, APM_CMD_GET_SPF_STATE, 0,
+					     dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -216,9 +221,11 @@ static int __q6apm_map_memory_fixed_region(struct device *dev, unsigned int grap
 	uint32_t buf_sz;
 	void *p;
 	uint32_t pos_mask = is_pos_buf ? APM_MMAP_TOKEN_MAP_TYPE_POS_BUF : 0;
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size,
-					APM_CMD_SHARED_MEM_MAP_REGIONS, (graph_id | pos_mask));
-
+	u16 dest_domain = audioreach_gpr_dest_domain(apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_cmd_pkt(payload_size,
+					     APM_CMD_SHARED_MEM_MAP_REGIONS,
+					     graph_id | pos_mask, dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -326,8 +333,11 @@ static int __q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int gr
 	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct audioreach_graph_info *info;
 	uint32_t mem_map_handle;
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(sizeof(*cmd),
-						APM_CMD_SHARED_MEM_UNMAP_REGIONS, graph_id);
+	u16 dest_domain = audioreach_gpr_dest_domain(apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_cmd_pkt(sizeof(*cmd),
+					     APM_CMD_SHARED_MEM_UNMAP_REGIONS, graph_id,
+					     dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -475,10 +485,14 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write_buffer;
 	struct audio_buffer *ab;
 
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*write_buffer),
-					DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
-					graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
-					graph->port->id, graph->shm_iid);
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_pkt(sizeof(*write_buffer),
+				     DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
+				     graph->rx_data.dsp_buf |
+				     (len << APM_WRITE_TOKEN_LEN_SHIFT),
+				     graph->port->id, graph->shm_iid,
+				     dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -512,9 +526,13 @@ int q6apm_read(struct q6apm_graph *graph)
 	struct audioreach_graph_data *port;
 	struct audio_buffer *ab;
 
-	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*read_buffer),
-					DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
-					graph->tx_data.dsp_buf, graph->port->id, graph->shm_iid);
+	u16 dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_pkt(sizeof(*read_buffer),
+				     DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
+				     graph->tx_data.dsp_buf,
+				     graph->port->id, graph->shm_iid,
+				     dest_domain);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index 04892fb4423f..15ca51ce33b8 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -71,8 +71,9 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
 		rsp_opcode = PRM_CMD_RSP_RELEASE_HW_RSC;
 	}
 
-	struct gpr_pkt *pkt __free(kfree) =
-		audioreach_alloc_cmd_pkt(sizeof(*req), opcode, 0, gdev->svc.id, GPR_PRM_MODULE_IID);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(sizeof(*req),
+					    opcode, 0, gdev->svc.id, GPR_PRM_MODULE_IID,
+					    audioreach_gpr_dest_domain(gdev));
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -112,9 +113,10 @@ static int q6prm_request_lpass_clock(struct device *dev, int clk_id, int clk_att
 	struct prm_cmd_request_rsc *req;
 	gpr_device_t *gdev = prm->gdev;
 
-	struct gpr_pkt *pkt __free(kfree) =
-		audioreach_alloc_cmd_pkt(sizeof(*req), PRM_CMD_REQUEST_HW_RSC, 0,
-					 gdev->svc.id, GPR_PRM_MODULE_IID);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(sizeof(*req),
+					    PRM_CMD_REQUEST_HW_RSC, 0, gdev->svc.id,
+					    GPR_PRM_MODULE_IID,
+					    audioreach_gpr_dest_domain(gdev));
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -144,9 +146,10 @@ static int q6prm_release_lpass_clock(struct device *dev, int clk_id, int clk_att
 	struct prm_cmd_release_rsc *rel;
 	gpr_device_t *gdev = prm->gdev;
 
-	struct gpr_pkt *pkt __free(kfree) =
-		audioreach_alloc_cmd_pkt(sizeof(*rel), PRM_CMD_RELEASE_HW_RSC, 0,
-					 gdev->svc.id, GPR_PRM_MODULE_IID);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(sizeof(*rel),
+					    PRM_CMD_RELEASE_HW_RSC, 0, gdev->svc.id,
+					    GPR_PRM_MODULE_IID,
+					    audioreach_gpr_dest_domain(gdev));
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
-- 
2.34.1


