Return-Path: <linux-arm-msm+bounces-110074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B9yFv8RGGrKbggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:59:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0E65F0162
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 614C03054953
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 09:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7482F3B2FC9;
	Thu, 28 May 2026 09:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Hz8PiSFs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E7D3B19CD;
	Thu, 28 May 2026 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961727; cv=none; b=lLeCX0SBPEmaqfaDZgGd/T7cdu3hL5lrizEgT71cYnDatzoW8IGUyNG39Wx/ip1dIAcsK/0SUtQSHy5gWGRE0XNy4u/Yvy11ltsZwXbm+aONVkPWqKfIfrQfRKyMrfRL3fACIDmFXkvAnETyOMpLyouxVunjEBmso75v28GKXxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961727; c=relaxed/simple;
	bh=EOfkEqoI59XmVVmUQgLQY7QKKEQ7Ln2MOTubLdT2nN8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fxRv2jmwprw7ZUr4+QmzmwXMOd8BCZfE0moXGHVSweJ7W2TLQJwbUjtCkFACysJ9ICPpdnu3clVlliaFJMUZlijbFdb2B0igLQD4wzFtU96CdlcfhQbtz5rLfKsacWM0H9FRxar7V7ollLEu+7YzU3PA0YUUrYBd9PilPjvhd7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Hz8PiSFs; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1779961722; x=1780220922;
	bh=6quOadJw0T40j2a2pj1RIqbFfyX3sZvPfSLjCbf9oyo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Hz8PiSFshssZhY+P9tiFU17cGqAmBJOZ3nx3xv9n4sShdSKzYGfwhmU+Gpfeo4yCz
	 M2x7Sy+apvxVC2Ok+6YKind9vQc45ZRrbIrvWWIAbZxVsib7xZK0DIxHGlsPRPSKiJ
	 jDUWHeuriJjfRrQ6WiUF//Ru6/PE5hL15CJvUd8thD3v+xU73/lBZKy4SmhlAAbadu
	 2mLIOUP5FVwWMKQUzxr+jrUo27VX2jjCfqWOfevSpP5AcDt8y4+SGzbCbpABgCSsaF
	 sdiG3x7lW7rH8OVB06odeU0ApkkW4PtvI8yDo1DFpM8jrazi2DmiNkRCGTse2Vdydn
	 gjd0D0kjL1/NA==
Date: Thu, 28 May 2026 09:48:39 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v7 2/6] dt-bindings: display/msm/gpu: Document Adreno 810 GPU
Message-ID: <20260528-adreno-810-v7-2-7fe7fdd97fc2@pm.me>
In-Reply-To: <20260528-adreno-810-v7-0-7fe7fdd97fc2@pm.me>
References: <20260528-adreno-810-v7-0-7fe7fdd97fc2@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: b0700308c569d04cc9deec9ef3d4d5b4f1f32221
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110074-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:mid,pm.me:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5E0E65F0162
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the GPU compatible string used for the Adreno 810.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Docum=
entation/devicetree/bindings/display/msm/gpu.yaml
index 77caacd0fb3f..a40899e5ea58 100644
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
@@ -449,6 +451,7 @@ allOf:
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



