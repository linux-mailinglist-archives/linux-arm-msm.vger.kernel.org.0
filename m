Return-Path: <linux-arm-msm+bounces-102250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A7RL1uz1Wmo8wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 03:46:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D23A93B6090
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 03:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CBA830209CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 01:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1817E25F98A;
	Wed,  8 Apr 2026 01:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="F/iqHiGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35F914D719
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 01:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775612734; cv=none; b=uKhiOkYL0mDGwQMjEfMDDwR0ml2ArtpzYVrpYrKh6/Htfqpv7G8xoYkYYIBS2Sl1Ui8NMttIZI2rO+nCfkAWsUiSIoJYB2ZE7mjXZPqwi1YYuILAkVkHn9SkUmuIbQHvUEvH9YQAyz2BNMr2n+WRsGu9QfjjLoQMlZznVCjnB98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775612734; c=relaxed/simple;
	bh=eU/cSxB6Uf0re/3rG3Ty2Mmq7/rXHXC9/PXDZJO5zXg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LwIvrCU94svgagjX5c2cJbxTkSjPOZhQTvymG/gSVZPivc7rMPuwIUaB5Cj7n7pT6zhQb/kjI0G93dplEX/gWvNmtq5Kk4M8+4J4xtuas5J0GOZ8OXwIDUVHTAIZ5VmMQW2wnCgAHcQPg2DcBAeOZoiaLkW0WSHasBu+4IGr9B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=F/iqHiGt; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775612730; x=1775871930;
	bh=sK1TlZBAQYySSMv6oS9up9cb7t40GRjDltzChsfIaAk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=F/iqHiGtrsXpGp7fc5ftevgQN0JChZHruPsu6yG4yzy6U5r/MgPK8mxsI6DxhomNc
	 BcV9O3AoOvSm4hSLBb3IqNBXq49Y8JbIp/HnvokG2UNMpVrQ40qnWtynFv1Ux2ogXx
	 p6/wgLx7TxXwyvzo7lxwssRVvhRFJfOwZsrRcLhT7RvEWf7d1Njy2nuqpJF+et0ZF0
	 rZOGMLAK6ffjIdqAlCVdkip6ACeJN9mukTHU70g1pVh7bxyTQx9at8AbBLgbfJfwQR
	 zCG7y4Kb6KjXxg62QSYuT0Fr/+iBJUhZYBB9uInq6EaiyC2yl9MiqrkqG3LNRu8Plh
	 zJy5fs4ds8EHw==
Date: Wed, 08 Apr 2026 01:45:22 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RFC v3 1/7] dt-bindings: display/msm/gmu: Document Adreno 810 GMU
Message-ID: <20260407-adreno-810-v3-1-30cb7f196ed4@pm.me>
In-Reply-To: <20260407-adreno-810-v3-0-30cb7f196ed4@pm.me>
References: <20260407-adreno-810-v3-0-30cb7f196ed4@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: a6fbc1f333b64e18a7010722c4cfc4d3c6db0aea
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102250-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: D23A93B6090
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document Adreno 810 GMU in the dt-binding specification.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 ++++++++++++++++++=
++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Docum=
entation/devicetree/bindings/display/msm/gmu.yaml
index e32056ae0f5d..cc03cda67ea7 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -299,6 +299,36 @@ allOf:
       required:
         - qcom,qmp
=20
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-810.0
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: hub
+
   - if:
       properties:
         compatible:

--=20
2.53.0



