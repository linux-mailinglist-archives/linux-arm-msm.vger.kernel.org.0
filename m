Return-Path: <linux-arm-msm+bounces-94022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKIIJqWMnmmPWAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 06:46:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C00AB192235
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 06:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7940C30074E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 05:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C8928314B;
	Wed, 25 Feb 2026 05:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvGl67J1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E4826463A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 05:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771998368; cv=none; b=KE6PACLicwI3zauj195/zCcQrQR2UJM0JqS4D4JksoMz3gamB2HHvJBxP0Fc1W3UvgatUNhR7htCQoRBJjGnQNWIKQ+8aB/NLeTbD48+3dJPgae3dEpV+ZIhDa0UbIQ9JTJ8v+KKhQEhNnq1vdb4VZxyEFF9/j6e2F4uSQt8ZhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771998368; c=relaxed/simple;
	bh=f4MAmLndA5dXtp/7Em+VCHsCsHtOI15mvjAHUcTywsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KDbrWlDtahHx+vm6bi+N90CE9LcsGXBtBwlc0Pa4huCT3rNQFL6u64WP12YH9zG3qxz7uWkeiPITqSre28mgec+MW8ziXAJGai5twHYEoJS/jmYIKnckufsxzHcStiszEqNjxjRG6wjqwy2A/sdxbTYy0fRddwt1Nr9yeGMo4ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvGl67J1; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c6e77ace76aso2904999a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 21:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771998367; x=1772603167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKkr4eeTfN7wADREvjdWZpjwmy9o6+cZb2Ap/abwYj4=;
        b=UvGl67J1da/2qf3DJdQ7lBwWLMe3KLKoHsCu/XK81jWGhKgrWA6tbJ/hWxDbY1DwF9
         LyuB2drehq33RjxREQc3ErmBSlchdHxhxkmBVf0CboWa6QfmJKjA4zYBNv9NvImxjTHA
         yFgZCE1oWV7w+J3RKDo5+mxe2DVG1QdC//1UcG6+e/BmqEgKzuHE5iM+v/dUnAz9zcPj
         Ar0taIS+7fo7moZVyhM0SvpdWqX3ylLDv2gUjDJjxG986l84PBX+5x/pduCt8dXnxjV7
         yL12k58JB0aQHQSkR21wdUda/TmJLdaSc74nz66+ZOYBvlPjO0MofgYKRt4poq+Y/c02
         prBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771998367; x=1772603167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EKkr4eeTfN7wADREvjdWZpjwmy9o6+cZb2Ap/abwYj4=;
        b=Bn9cp/jjtOYWiZSPXTyS7FGICDYGD2jjfMDfdvz/buh91OIfJY6CUCcLxnOlRbDNhj
         YzN+MIi7VImC8nI8cm3y07hCA7iMWXiRpiHap/ddg9NSaT/fIa84zKxPTFyyHdi0xL4i
         mXb0dKyQ33Jab0IPL/b5VRffOxHAVIdoKeoLXQ8Qe1WogUHGJ5TPJRuN9tVnORyiBxtG
         /t51yz/ivrHKuLSxXsj80p8lyI/4C1dcGjEzGBjF2FrhzopelRoz0Xy5ECnf2gXI1iwP
         kr159Kl6Hmgh4OUt/u9QV8jtv7kIvOhnBV7r1HY0Q+S9eCExifqop+2SKBfpV/5Cua5A
         p8lw==
X-Gm-Message-State: AOJu0YxAMAJuNm6jZnj4aMEolsI1ppuhFKDTA94Mc5Zzh5esrFSkbe70
	0QfbQoVsSxXD8KDWXD51liVg+ZJuXvKUtAsT7pHM9+KXutXnWiVPrv8H
X-Gm-Gg: ATEYQzzNP/i5TzAz82EDV/Z8mmwXWAOkYkV++d0Enh209cR6+BGPT4KxnKxvoAz0iIg
	+xtMevP9KB844diEScEKQT3fr0iiDydMkHfOsc5BbZMnewcHh2co9qt+L9cnHSRSMIWzeT9QBV8
	lKZJHJAxNQaJ4TdpBCqvzgWLlgnKB2oEBjvrwO3O/CqfKhols8xkQ+tWDqdimBojDUyxJW73X5f
	qVNlcEs11Gw4k99LuF27mnmM2vsLeanWEUufoWvB5bm97j/1NARtzNy0gPMX2jze/OcpEb7Zqao
	i5sMrF3NGQAs9Be7JNDR+9q9hh/cGyYTT/y06/0HpBZgkwraYaDaKMEGho5s6jNL0uAB+Tye1xM
	HBUZ1onm6wFwXb4dlm0hjfwlLuy876VMjhMNik2yDWPoFmbfREtPy0cL2tILBq2VWOWBo1X7nA8
	KNmOjVuA==
X-Received: by 2002:a17:903:1210:b0:2aa:f9d7:68a8 with SMTP id d9443c01a7336-2ad74511d60mr126836005ad.28.1771998366891;
        Tue, 24 Feb 2026 21:46:06 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e318sm119665295ad.43.2026.02.24.21.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 21:46:06 -0800 (PST)
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
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 2/5] dt-bindings: display/msm: dsi-controller-main: Add SC8280XP
Date: Wed, 25 Feb 2026 13:45:22 +0800
Message-ID: <20260225054525.6803-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225054525.6803-1-mitltlatltl@gmail.com>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94022-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C00AB192235
X-Rspamd-Action: no action

Document DSI controller on SC8280XP Platform.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index eb6d38dab..e6aab0e6f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sc8180x-dsi-ctrl
+              - qcom,sc8280xp-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm670-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
@@ -340,6 +341,7 @@ allOf:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sc8180x-dsi-ctrl
+              - qcom,sc8280xp-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl
-- 
2.53.0


