Return-Path: <linux-arm-msm+bounces-105443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJFVD0tT9Gm6AgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:16:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9F4AAE2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAA2C302C902
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 07:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E42A367F42;
	Fri,  1 May 2026 07:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="kXPdV5Eh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7890E366079
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619732; cv=none; b=IGpk+PkJxnaMXC6zHBSxV6HzNfgB1zYjh7TwT52A4+GwNw6Y4AlqiIn4jDOq6in8pbMQkJfprYgCB6DWys4AKob2ug24PvVsiyG9sw2B36kBM3Wb0MNiyTQHVaRCPpkArst82FxFrGIYt0/B6fAHLfacp65gelFJ4N942PndGrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619732; c=relaxed/simple;
	bh=eqkvnjw06SSJ1hiPbfLlBQP+odbRhP/MaR7qzy/itWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xfq30HDaXtyBEdwdSd/U2mvg77LXxjVlXNSpXDRqVf7qCHWBpzN32ZLtK+gdYOv/2/iDwrv5I/JYOT0B7UfW+GVLfGc2ihJX4igV+4OdUBcpeW+CQN9lCeAEQMqJFFmrZWqls3gF2rtcEilFG0TgEHngM25yEMLjk1Vd2zqI3a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=kXPdV5Eh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ad135063so14158075e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 00:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619729; x=1778224529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2t17h10rSE2WAVFCSqROPUo3RCLB72K5unwgCexayM=;
        b=kXPdV5Ehjx+JqaveyEdqvrsj+lFrqFMztXIw82EbM6Agxkbcj4sYorYM/CXtm4//vk
         3b+L+xzULaqrnWInVdFQ+nvYYxWuKvC/GPQqt3eP5Nt6K8VqxhZdxbQJJ9wkzYoxOMCM
         fFyE1qPLJfRtRipMOxcazTvqVrjPVp9CnAy2KEjpSM2TqKq9LAEzSmEwFRcDfRvLPr0v
         rbYwltdz2wG2BMMqDbZc30FkqFlsxfgPVmohnhhb04hFnc/eGZnjJzI/2X2aXcUwcMOd
         67f4R6q7eQ+ZnVDVA8sxikgrlhYZoXriHuPZLJFtpNSGUlaMFBVyuCdCZCMY8htdxTVM
         wGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619729; x=1778224529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W2t17h10rSE2WAVFCSqROPUo3RCLB72K5unwgCexayM=;
        b=sV6i+whxjttLbggUGccib7PeUx28peYb3d74IC3avxNXgXENNW9OV5c9j+tAlJv7a+
         PrzQJoBgtQvP00DWVdp6YFYx37BLdTrUDa8EM6kkpyVT30hST5IxS/rK5Bx30b6iT5KW
         XTvEUVPcTuREWNvp/CsSPuyF30PwcaoCekED0rUMbe1pYjnuUnq+vfWkoLstic5jDd5C
         DHPTzZZ3GjLiFnCnb9XKYrP2lypvFHeH9qNVghmI5eX8GxlAyGMbzaREOS0lHp3xiHHZ
         KRAqqAe1FP101GykyTaPSzbQ/AeiLaqSoCexnkn7C11FuWpd391Y52fCf/5z2uIhzY9j
         hjtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CpKyIusURgMQITeRQ40tiY3erY5MxbmrE5FqetBaqgJjZYQ8KRGwL7oRqSxFF6BdIOhB8XKU7ESJDJ8p1@vger.kernel.org
X-Gm-Message-State: AOJu0YwfcZ1WQqws9qIfWouO137B2WymE8LzmKXjBa4+Tq787Ag+QwWo
	6GV/vbe2CpvkqMSIUWmlIHkGg/SMSKiw5QEeyoPqBfkgEYK6sDd9Uj7SvG26xMn6ZmI=
X-Gm-Gg: AeBDietoxvJ5Oomkve54uY0H/mbjGC9gqr98Jdnukl8IAsQLH6PU93xq/zbWrNlr19i
	Wtxxhb2w3DW7Jmm0CNQSAV6e+2VGbTeBLo44SVccpiGTszziAVGMngyjYnMu4zi6JRPh5VGdVP1
	zCTXmmrJoGZw92B39/Z97t4kpGP6Q8HkJZG5IZ6zMnIWcVySUwWgFyniyopTDasVIxOGjDY/Y18
	md9x4eGhoVFoQvplZNE4LRLxtjyttWkWRwX8bg5z7eOd/vjVPHJRXIhf2m2AO1z111IEfOJLQsC
	WUqplFunV630BSTBWguAVndq4zQTeM4TR3hX2uNdmNdQme+56x1WSOkNQNJx04MrX9iRCXDFbBr
	dblhoXvryE6obDsJtjdAQUEsl+CxXYcZ/L/a4juGZ/9NryIwWawDMPAWm5lmmTXGF8sIgYhsFtU
	DVn/rKrvx638SCDCIEVmMVLgR3er0AoXpjw3t9f+AT2OOJwgTmXEPSWNSvXY5CBTz16JiGlFEc2
	d/ycAyl
X-Received: by 2002:a05:600c:350d:b0:48a:57e1:d8cc with SMTP id 5b1f17b1804b1-48a83e7055bmr103427505e9.9.1777619728957;
        Fri, 01 May 2026 00:15:28 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:28 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:45 +0200
Subject: [PATCH v3 3/9] dt-bindings: display: msm: document the Milos DPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-3-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=875;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=eqkvnjw06SSJ1hiPbfLlBQP+odbRhP/MaR7qzy/itWM=;
 b=rxEwrApcvMvNoaJkEGaACXpYfW+GvR1w9019BHl9gaSDxAV0SGk6cXAI935/LGMJtkXSV6sb9
 X+aYeFpdrx8BSgEphHNPQRJeb80NpybMurDmMFS7XQl9vQp4fzepGAJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: C5B9F4AAE2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105443-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Document the DPU Display Controller on the Milos Platform.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index dccac525d202..9da981639ddb 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -18,6 +18,7 @@ properties:
           - qcom,eliza-dpu
           - qcom,glymur-dpu
           - qcom,kaanapali-dpu
+          - qcom,milos-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu

-- 
2.54.0


