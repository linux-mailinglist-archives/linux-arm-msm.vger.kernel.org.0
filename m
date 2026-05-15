Return-Path: <linux-arm-msm+bounces-107708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFCFHKesBmpAmgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:18:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC465497D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA493302CEFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 05:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0012E093A;
	Fri, 15 May 2026 05:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gefiTsHB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244105.protonmail.ch (mail-244105.protonmail.ch [109.224.244.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C1A299AB1
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778822307; cv=none; b=Ywv9FZmOX0Neq1w0VgWk686SykUpa7tyzncydBvVw0UG0lrApTQxX8DU8txoDc+OD0wVReTSKaQdvZhd2MpiEvhMZOFBDZ1w+a1f8YxGELwKJ4tpbowflyjQnmpMvUFI4+jckWhPlWv8v6F8Fb7fUGaMOGNlcP1sGfQr1/T2EH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778822307; c=relaxed/simple;
	bh=Azu0XRvCkmyNZahZrQEaamecpEr5Ild99+NQ1TvFI00=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kgOKMulHLiZ/Yl9iAYpeey0CZb8DMUG2yqzYHJwdCUgwwT+cWFCvljCPoZ6KiAoqinKEtDJc+jKCCDkMpuEewB0iEYTXj4rGc5qIVWT1E/4SSKcj15+rf8qoXGKBcISMwkQ+bmjdGM4pA66VsJD6MxnY3yD7n0WvQJTxP7oEe0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gefiTsHB; arc=none smtp.client-ip=109.224.244.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1778821719; x=1779080919;
	bh=tTGGp9tpW+UaiFNc212qlp/NLmpaLC1hIuxmeV+7WaU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gefiTsHB9uSN8S6Bthb4UwZHzXrD6hE1hsyGiLaqCqmTodq0Y5uzph2XBz+lg+Ws3
	 T62B8hdJvXPbju4/D1lH15eiiUsWKl1D9eDfvM5gjECfWbXSjuVbZ3boDN5J6MxzzY
	 wRYj4pTeVjxoByxkcQ04RFVaImo7rCiKBn09tx3nQ4YPzVjh3elAzk4ARwKQUkW+Pn
	 63LsFGeRbPyxKC69xMwuBRZIBUogkrDkQtAp0D45dFNwfdPyAXPNslObmv3HyzuX9g
	 /6Wc1x3TZzubjnOWfR03QxEbuFYWbcuBRq3Gq9BMA81cSCODgkjSq79KW9BY8GhfJg
	 QuPhWZ4O6fAQQ==
Date: Fri, 15 May 2026 05:08:35 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC v6 2/7] dt-bindings: display/msm/gpu: Document Adreno 810 GPU
Message-ID: <20260515-adreno-810-v6-2-fbe04c7203e1@pm.me>
In-Reply-To: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 28d789b8b45c78c3903495463b1d0d9f6703e962
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0DC465497D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107708-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pm.me:email,pm.me:mid,pm.me:dkim]
X-Rspamd-Action: no action

Document the GPU compatible string used for the Adreno 810.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Docum=
entation/devicetree/bindings/display/msm/gpu.yaml
index e67cd708dda2..1ee2f1d57f12 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -415,7 +415,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-44070001
+            enum:
+              - qcom,adreno-44010000
+              - qcom,adreno-44070001
     then:
       properties:
         reg:
@@ -450,6 +452,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44010000
               - qcom,adreno-44070001
=20
     then: # Starting with A6xx, the clocks are usually defined in the GMU =
node

--=20
2.53.0



