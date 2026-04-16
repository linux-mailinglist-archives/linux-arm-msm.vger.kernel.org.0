Return-Path: <linux-arm-msm+bounces-103461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBPnBg1m4Wm/swAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 00:43:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5C241551F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 00:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1257530FAACF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 22:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4583939B5;
	Thu, 16 Apr 2026 22:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="boddJPt/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F64D378D96;
	Thu, 16 Apr 2026 22:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776379281; cv=none; b=BavhuuKOg5x8kQZP+EWvTuiZuXE6PGOgyVbjdwSxk6/R4SjhUFChn8KQq2y4NKzIrEG/FD/46ubebnUq5muahMSH1xNWqE5dZRb/3/dOy0O+EGRiJkMSLtjATXyO+f8JSFcRJr7trLWFA4UKzF2zrCmJWJvtdlqR6KLsoj5Bsqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776379281; c=relaxed/simple;
	bh=aUjWVaG/AsZGo9OOyhDKeH9Xa2AzjQV7a3xd7Aa7Wpo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i8tMMD+lfyCuITmIrHdg4g5JAhB5+M6ZsIIGllf/v0Kr0h4OTLLqSRDYIyczQMxsyFMVrxyEfEJLahrczmVcn0psaPhIUycSFJdc6+E0ftmHJPYqNxY5SX8qA36qDipTA1HhnSGeh69kEicBXOHvNMEgaGWk4EjlmCbIHVtf9bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=boddJPt/; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776379278; x=1776638478;
	bh=6U3qpcWjGRGrSSH0rUcmatHH/KtvKsv8QjT4ZCqboJU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=boddJPt/VoLwQLuGpu7sZVwn6K2TbAhKxOs9QYvG37DSmCX03K+I4F4fiKxJ92sDa
	 UlfEt2/jHjpeZz14Xo51RhmKbBkGL2H24ryzExX7Ko60ZjYWDa6ow0xoh4/BSC1MRI
	 pSmlZY3tT8nOqS22ri8xpIseWcx4vF8GdHPzrWTOg0OXKldCL4axgVzFDgWTxa5bsD
	 +6qM5rKXhk1xoyTEn30plpXYpgIkcdqhRP5ZZcsmaLuTPjyMmhgkwCq6TgaRc6rz3/
	 XCHeolzMInae2PZS/QQgCv4dcQBqpm3WQ1JOzkfF8c1B3oRgFEhnTCri8epKL46EEs
	 elBsBhOVB+WAA==
Date: Thu, 16 Apr 2026 22:41:13 +0000
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC 4/4] net: ipa: add Eliza configuration data
Message-ID: <20260416-eliza-ipa-v1-4-f4109a8e43c4@pm.me>
In-Reply-To: <20260416-eliza-ipa-v1-0-f4109a8e43c4@pm.me>
References: <20260416-eliza-ipa-v1-0-f4109a8e43c4@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: fd2c3096340ea8f5b8bd3fd6d1288823295f0b50
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103461-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:dkim,pm.me:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B5C241551F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the configuration data required for Eliza, which uses IPA v5.5. The
difference over other platforms that use IPA 5.5 is the Q6 FnR counters
have been increased on the firmware version it uses, which results in a
different memory layout.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/net/ipa/data/ipa_data-v5.5.c | 163 +++++++++++++++++++++++++++++++=
++++
 drivers/net/ipa/ipa_data.h           |   1 +
 drivers/net/ipa/ipa_main.c           |   4 +
 3 files changed, 168 insertions(+)

diff --git a/drivers/net/ipa/data/ipa_data-v5.5.c b/drivers/net/ipa/data/ip=
a_data-v5.5.c
index 44a9df7346b7..e1454454bde9 100644
--- a/drivers/net/ipa/data/ipa_data-v5.5.c
+++ b/drivers/net/ipa/data/ipa_data-v5.5.c
@@ -288,6 +288,148 @@ static const struct ipa_resource_data ipa_resource_da=
ta =3D {
 =09.resource_dst=09=09=3D ipa_resource_dst,
 };
=20
+/* IPA-resident memory region data for the Eliza SoC */
+static const struct ipa_mem ipa_mem_local_data_eliza[] =3D {
+=09{
+=09=09.id=09=09=3D IPA_MEM_UC_EVENT_RING,
+=09=09.offset=09=09=3D 0x0000,
+=09=09.size=09=09=3D 0x1000,
+=09=09.canary_count=09=3D 0,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_UC_SHARED,
+=09=09.offset=09=09=3D 0x1000,
+=09=09.size=09=09=3D 0x0080,
+=09=09.canary_count=09=3D 0,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_UC_INFO,
+=09=09.offset=09=09=3D 0x1080,
+=09=09.size=09=09=3D 0x0200,
+=09=09.canary_count=09=3D 0,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_V4_FILTER_HASHED,
+=09=09.offset=09=09=3D 0x1288,
+=09=09.size=09=09=3D 0x0078,
+=09=09.canary_count=09=3D 2,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_V4_FILTER,
+=09=09.offset=09=09=3D 0x1308,
+=09=09.size=09=09=3D 0x0078,
+=09=09.canary_count=09=3D 2,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_V6_FILTER_HASHED,
+=09=09.offset=09=09=3D 0x1388,
+=09=09.size=09=09=3D 0x0078,
+=09=09.canary_count=09=3D 2,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_V6_FILTER,
+=09=09.offset=09=09=3D 0x1408,
+=09=09.size=09=09=3D 0x0078,
+=09=09.canary_count=09=3D 2,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_V4_ROUTE_HASHED,
+=09=09.offset=09=09=3D 0x1488,
+=09=09.size=09=09=3D 0x0098,
+=09=09.canary_count=09=3D 2,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_V4_ROUTE,
+=09=09.offset=09=09=3D 0x1528,
+=09=09.size=09=09=3D 0x0098,
+=09=09.canary_count=09=3D 2,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_V6_ROUTE_HASHED,
+=09=09.offset=09=09=3D 0x15c8,
+=09=09.size=09=09=3D 0x0098,
+=09=09.canary_count=09=3D 2,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_V6_ROUTE,
+=09=09.offset=09=09=3D 0x1668,
+=09=09.size=09=09=3D 0x0098,
+=09=09.canary_count=09=3D 2,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_MODEM_HEADER,
+=09=09.offset=09=09=3D 0x1708,
+=09=09.size=09=09=3D 0x0240,
+=09=09.canary_count=09=3D 2,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_AP_HEADER,
+=09=09.offset=09=09=3D 0x1948,
+=09=09.size=09=09=3D 0x01e0,
+=09=09.canary_count=09=3D 0,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_MODEM_PROC_CTX,
+=09=09.offset=09=09=3D 0x1b40,
+=09=09.size=09=09=3D 0x0b20,
+=09=09.canary_count=09=3D 2,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_AP_PROC_CTX,
+=09=09.offset=09=09=3D 0x2660,
+=09=09.size=09=09=3D 0x0200,
+=09=09.canary_count=09=3D 0,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_STATS_QUOTA_MODEM,
+=09=09.offset=09=09=3D 0x2868,
+=09=09.size=09=09=3D 0x0060,
+=09=09.canary_count=09=3D 2,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_STATS_QUOTA_AP,
+=09=09.offset=09=09=3D 0x28c8,
+=09=09.size=09=09=3D 0x0048,
+=09=09.canary_count=09=3D 0,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_STATS_TETHERING,
+=09=09.offset=09=09=3D 0x2910,
+=09=09.size=09=09=3D 0x03c0,
+=09=09.canary_count=09=3D 0,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_STATS_FILTER_ROUTE,
+=09=09.offset=09=09=3D 0x2cd0,
+=09=09.size=09=09=3D 0x0c40,
+=09=09.canary_count=09=3D 2,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_STATS_DROP,
+=09=09.offset=09=09=3D 0x3910,
+=09=09.size=09=09=3D 0x0020,
+=09=09.canary_count=09=3D 0,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_MODEM,
+=09=09.offset=09=09=3D 0x3938,
+=09=09.size=09=09=3D 0x0d48,
+=09=09.canary_count=09=3D 2,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_NAT_TABLE,
+=09=09.offset=09=09=3D 0x4680,
+=09=09.size=09=09=3D 0x0900,
+=09=09.canary_count=09=3D 0,
+=09},
+=09{
+=09=09.id=09=09=3D IPA_MEM_PDN_CONFIG,
+=09=09.offset=09=09=3D 0x4f88,
+=09=09.size=09=09=3D 0x0050,
+=09=09.canary_count=09=3D 2,
+=09},
+};
+
 /* IPA-resident memory region data for an SoC having IPA v5.5 */
 static const struct ipa_mem ipa_mem_local_data[] =3D {
 =09{
@@ -442,6 +584,14 @@ static const struct ipa_mem ipa_mem_local_data[] =3D {
 =09},
 };
=20
+/* Memory configuration data for the Eliza SoC */
+static const struct ipa_mem_data ipa_mem_data_eliza =3D {
+=09.local_count=09=3D ARRAY_SIZE(ipa_mem_local_data_eliza),
+=09.local=09=09=3D ipa_mem_local_data_eliza,
+=09.smem_size=09=3D 0x0000b000,
+=09.fnr_idx_cnt=09=3D 68,
+};
+
 /* Memory configuration data for an SoC having IPA v5.5 */
 static const struct ipa_mem_data ipa_mem_data =3D {
 =09.local_count=09=3D ARRAY_SIZE(ipa_mem_local_data),
@@ -486,3 +636,16 @@ const struct ipa_data ipa_data_v5_5 =3D {
 =09.mem_data=09=09=3D &ipa_mem_data,
 =09.power_data=09=09=3D &ipa_power_data,
 };
+
+/* Configuration data for the Eliza SoC (IPA v5.5). */
+const struct ipa_data ipa_data_v5_5_eliza =3D {
+=09.version=09=09=3D IPA_VERSION_5_5,
+=09.qsb_count=09=09=3D ARRAY_SIZE(ipa_qsb_data),
+=09.qsb_data=09=09=3D ipa_qsb_data,
+=09.modem_route_count=09=3D 11,
+=09.endpoint_count=09=09=3D ARRAY_SIZE(ipa_gsi_endpoint_data),
+=09.endpoint_data=09=09=3D ipa_gsi_endpoint_data,
+=09.resource_data=09=09=3D &ipa_resource_data,
+=09.mem_data=09=09=3D &ipa_mem_data_eliza,
+=09.power_data=09=09=3D &ipa_power_data,
+};
diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
index f7566c8edabd..da01fc84edac 100644
--- a/drivers/net/ipa/ipa_data.h
+++ b/drivers/net/ipa/ipa_data.h
@@ -258,5 +258,6 @@ extern const struct ipa_data ipa_data_v4_11;
 extern const struct ipa_data ipa_data_v5_0;
 extern const struct ipa_data ipa_data_v5_2;
 extern const struct ipa_data ipa_data_v5_5;
+extern const struct ipa_data ipa_data_v5_5_eliza;
=20
 #endif /* _IPA_DATA_H_ */
diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 788dd99af2a4..981be8b538d0 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -637,6 +637,10 @@ static int ipa_firmware_load(struct device *dev)
 }
=20
 static const struct of_device_id ipa_match[] =3D {
+=09{
+=09=09.compatible=09=3D "qcom,eliza-ipa",
+=09=09.data=09=09=3D &ipa_data_v5_5_eliza,
+=09},
 =09{
 =09=09.compatible=09=3D "qcom,msm8998-ipa",
 =09=09.data=09=09=3D &ipa_data_v3_1,

--=20
2.53.0



