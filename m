Return-Path: <linux-arm-msm+bounces-96015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCVGAB0crWlxyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 07:50:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1F422ECAB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 07:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07B71301FFA8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 06:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9496126A1A4;
	Sun,  8 Mar 2026 06:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MayzUsso"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833B52550D7
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 06:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772952569; cv=none; b=bKXJRUqlgSgkuJe/Zne8+r7IJSH6F3xhZYfklrAJTi7Oaa/V/53LasTvbruIPCRh5vavDwHYozLMwtFJwSf4IJoZqyHjjQsWrSTxH2hO01Gq6IVHkATBCx5RLtoDqGT3WtCZsM8vkrF5XR/4hdAioh7AmiK/PkHmDPIeF5VZvIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772952569; c=relaxed/simple;
	bh=Q5CR/czXZ1f7yhcmxuekHIsA5XP7moyN7bsXJtlxvCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9zzBY4AqpZdr/Fpb3tmlZgqPyxHEabA/D9bUYAummIUEpQOM54omkE1CoXbGrWgcTqbcIlQXea2CkPoWr1d/vdK8jr1FividN+HRRJGXCxePlt8iSEzw3A5X4l4FW/yR5FuNrqrjjoIswYgESZ4mk3SFrx3WE5NVfkd8tpPtsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MayzUsso; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ad4d639db3so47311235ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 22:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772952568; x=1773557368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVqZVQCQ9M+s/60nh17cYdg5jAVVqaMsdAamEjRVdF0=;
        b=MayzUssoAsNPwHkY6TESbI8IPyaqUSjjL3IAfg5KOlxquJ/0JwosghOQeYt57JPYAq
         +CZDfJY5oRZE9eNsCKjY2cKG9bptcMK2yJBYJDqIRFCfyRr3UYXWa+XF2jo0H7eU9lLc
         EOaX7DqdbC6+jYUqF654IVWAYwGQc4WO6KbK6Za6w/ZGURT0DLXOBZjQ7rvWK71j7KDT
         hB3e/tbRKG7khuecNi4H7Yl6LA2PGB4YZGzq8z5dgaW7CcAo+mc1XLO0X4w4unfL76fB
         SOdzEfH2WmxTnz7upyU01krrhu7sNTJLRbijuP+r9lCR0lgu2Q6k3PWkO8Y8tUChefWf
         aOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772952568; x=1773557368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XVqZVQCQ9M+s/60nh17cYdg5jAVVqaMsdAamEjRVdF0=;
        b=XBaSBgluv++Doyj9nZYAzGyNbG7Raj7HuuXcgzoarwymRYtie0EcK9yKrfJwn4badV
         NHye/bqwGnLxwX3EZEUIVinjtby+i3HIRGM9ZKlqQBFK2X2peBcW6m2mYzifsoD4fB1j
         Pzd25b3E64GoQgCq+4V5ULhQXdX7l4Sdan4ewojVbU88Fc8yPkv9QCVDt3aHFMSUHo3z
         U6M9NR6zCuDtZdA/9y5rF49i2tNbsL6NQURNSXPAAbPgXvtxzMPZXmOugVtfhJqmCh5w
         DrWmU1UMQLnRsi6CnfuyHqoZd24t1UkeJuzS0WcdHZ9NTItr1wO0hLQngT37/6AIcLTT
         ecSA==
X-Gm-Message-State: AOJu0YyvfP4K9CGISHIHhP0TR4fBT8o/2PsnBuag8hHyBQ5x8zGUleWM
	0Bq40ZKkXphN7qlrVfzzZR7j+76/WKHvdWYECZKctc7rFiI6+nXnWQCs
X-Gm-Gg: ATEYQzyG5HVr4V1CeA7zNGOI4w77Pur+qaLv90hvqwhqyVGat9ddxrq/q5VJ2cD3N5t
	UBGyOje9tjE/ICDtcu9iUhGOvbmcYlbf/1eDXwnnakogoGU+n2/x0V7EZdux5/brsbdci6eKu7d
	2TRzk170AdpgAzOtMNOHxm2vYtkOQeDpP5yyw27quc70hTsea5udIOXRbc9WxMf+lVPX9gPNtr9
	V3PpoOaBz65BBpjU29qxwu2L/7mYlCkC1CXt84vL7mrdThy9qpzbAEy+u+JxgHO2EeQyCTxDxYe
	RJ+kQT0mVefqfc0rQrP85wDaW+TAdXDerfutS1dILPeNxjlrK9EIs2nPnInRqVch8n4Z/L/dpKY
	Sd4Mo5n6nJCuanekmUpXV50HrR34shnV3sxUzd/vhO8oS0cJd4BCsfHHI/YnxWWfunMGwljOsOL
	e08weddHoYxJb/Er7eiA==
X-Received: by 2002:a17:903:f87:b0:2ae:44f4:1678 with SMTP id d9443c01a7336-2ae824b83e7mr69310475ad.57.1772952567915;
        Sat, 07 Mar 2026 22:49:27 -0800 (PST)
Received: from nuvole ([109.166.36.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840c9a0csm72503225ad.91.2026.03.07.22.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 22:49:27 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyu Gao <gty0622@gmail.com>,
	White Lewis <liu224806@gmail.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/4] dt-bindings: display/msm: dsi-controller-main: Add SC8280XP
Date: Sun,  8 Mar 2026 14:48:33 +0800
Message-ID: <20260308064835.479356-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308064835.479356-1-mitltlatltl@gmail.com>
References: <20260308064835.479356-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8A1F422ECAB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-96015-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.992];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

Since SC8280XP and SA8775P have the same DSI version(2.5.1), then we
fallback to SA8775P compatible.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v4: There were no changes to the patch.
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index eb6d38dabb..617dd110db 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -49,6 +49,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs8300-dsi-ctrl
+              - qcom,sc8280xp-dsi-ctrl
           - const: qcom,sa8775p-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
-- 
2.53.0


