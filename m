Return-Path: <linux-arm-msm+bounces-95442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PVpFgiPqGmzvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:59:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3D1207537
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DEE6305A6DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 19:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53873DEAD0;
	Wed,  4 Mar 2026 19:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJmso6OH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2BD3D6CCB
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 19:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654302; cv=none; b=aFOr/jOvh+rvymrq9E99Yg6PtnVl+s6jVfrX1/2fBf31GtC40cSIfJurHAVsc3qdkFE8vgKud1FqvmFJKxA32wUn3Glgcdzuw7/P7Pi1l1mjMVQlAAmXY5P/8DTzSwaOYPwaGn2++oP/yKeYQ1PDIZ2OQGboc8DZtXUKYrZLGkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654302; c=relaxed/simple;
	bh=n0R40XRfDjy1V9Ne4xBLWMj+F0n2Xug4NvKwAOU0ctc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jfJ9op+njbd2gIPbqK1fSFapbOFuh6IO4/uwNzmuuaIcKupl+cm2cU/92WatCwxsmVB4vJI75XDxJYdlAQzHhDv2aoGS51lpI/o9HA0qI+BXvboeZOcHjA+N5/Gt16HY2eP/jEYDYL6TW580fghDQ7Z3/SgTK6vtO/L1jyAzHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJmso6OH; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cb4081e82aso951418485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654300; x=1773259100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwqufDdP/7LZrzEeKntvUtFudz4/SZEf85WjJVi8KGM=;
        b=KJmso6OHJbjGM4bGpLWN5KTzHVXj6F1yoeR9f/WAWlE/vwzSYViVNd4QZFTxnkoHDc
         9bQ2IecCDTj2OVSaXuEvr0V2xYPnQ83lnQb5Tbhx5pjXFqE+AgBCEZ1TOKJV5ssFdv2E
         Rwl22/RVPL5TwWpPxw168wvsC0aa31hWlhQKo7WJjuV6feIZtG1r0h0m3yaIKs/DP7ap
         Yyu1BB75uydmDFtGTSwtDs/4egOOkHsXHRhXMsWY+eXmlHC/80aBtiA4Duofzn8gRplw
         PKT01HUQ8sAs+AxbiOKM6B82H29k8eJTo6Y6RK1lkJUdR2K89YwNmryLpM1PUf8ddsVQ
         voYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654300; x=1773259100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UwqufDdP/7LZrzEeKntvUtFudz4/SZEf85WjJVi8KGM=;
        b=slnlvppWUad6TiMObs82aVho27xcTQp3EkOoMJkVQ7UTT8C5SuP/1QGZdwj9M7H2Jw
         kKk3WgjKAMQGan4Q/FAD8AhAUInqMnrjfkoIJS0ZecRCsJGplfgwSQzDTWvgSDXnJshb
         bKzTKkgW9aQspqSjXr850/WDVBiXaW9o5UDOjYJzDy5UXQ6iUMAfGwjKBCYn3kRU1Cof
         fYOHWUA+cmr1fyfMTyIs5RdW0Fmt6c/sZItoXR8Hdlek4X7XJ3/94y6DqHnuXfOhrf4n
         aHk4Exmb7J3utvr79ObxRL8ByHYybFOo8VCDZxvXfhVFyYjtA1Be2YZ0Zk5e+VPgYJjd
         fWXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWaXbQ7qWbnV0Gkxa4GqTNgLzALYQUnRZVP+9gLWH8y2A0S0zk4EtPuHrPYSwQ0Avxvre+N4vEEITUOxeR@vger.kernel.org
X-Gm-Message-State: AOJu0Yws+YQwkcycMsw5i6fjkElszgOWogdDYwCfLwhbSbicHnGLEaYb
	ScpYBu2QxfaBHgQMKM6+GrFrnlqeVICbqdcMExlOLNWY80GgyRk7s5CV
X-Gm-Gg: ATEYQzxDgYddkwqFBTcdSjD3oopFwoZa4pEaZrze2GbKxcOAdqUwvnmtgivE4Hk18iG
	oK3VnOWLC77ZdZO9Nkx0YiSwTjbhXdsrW1P97qxlWVAImjqnlIluWz4DpDnKTdNeyJA7yaZHuG4
	U/CiaWWePiSLZm/Zhc76Z6pGulaml2k8PtigAsQOtDWjqK0rOSlcIhwxXZmWtU/n93uFKFYnSMH
	fhwWN3kboQNHHnMhn7BiMJgPPSNHaeOYJiLEQj7ggbG9VQF33WgA8pwHfQF6rjVu1DhiyLlsS7z
	RjDZGpJBGGMcnjAsN/bbCpkBeZL78JVaoXCXTv6Uy7k4g9tbZLfT7LW7ec5wkPRATjDNe3mSYPt
	AvqSfk+z/m6HFLn/zqk9LPHcPZKVdzmbsj4dywhZgaIao5SVEvDBbxU0DOLLnm1uLqfR3qgv5zt
	d7/p8ictPxp31O7A56dVOEV2F7yA==
X-Received: by 2002:a05:620a:1aaa:b0:8cb:50d6:18be with SMTP id af79cd13be357-8cd5aef9863mr364551585a.18.1772654300437;
        Wed, 04 Mar 2026 11:58:20 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf65921bsm1681618985a.1.2026.03.04.11.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:58:19 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 03/11] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
Date: Wed,  4 Mar 2026 14:58:07 -0500
Message-ID: <20260304195815.52347-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304195815.52347-1-mailingradian@gmail.com>
References: <20260304195815.52347-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AF3D1207537
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95442-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mainlining.org,quicinc.com,linuxfoundation.org,kernel.org,opensource.cirrus.com,renesas.com,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The PM8916 analog codec is also found on PM660L, typically connected to
the SDM660 internal sound card via the digital codec. Provide a space
for specific compatibles and add the compatible for PM660L.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml      | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 94e7a1860977..c7424d755cd8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,7 +14,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8916-wcd-analog-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm660l-wcd-analog-codec
+          - const: qcom,pm8916-wcd-analog-codec
+
+      - const: qcom,pm8916-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.53.0


