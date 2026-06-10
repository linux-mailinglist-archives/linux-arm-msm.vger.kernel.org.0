Return-Path: <linux-arm-msm+bounces-112330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zPm9CqgVKWrJQAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:43:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CC6666B7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:43:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=MKzBnPJT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112330-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112330-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 398A5307054F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2323988F1;
	Wed, 10 Jun 2026 07:41:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC4939479C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:41:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077318; cv=none; b=H/dJ45Bmwr0S6aqY05CavIVa2isXXlzPIdOfHX4BDlI/LKA9TsBsqrOWbBCaVpy1czY/bIP7mCjivQqTe3VTzgNWGw8kKcSpbXWOYyDUSSgnUfghcw3R4I/AJg/V1+Bml8+yh6ghmsZJUriQfA4bxsi9F90i1O7I8Hy/W52vyZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077318; c=relaxed/simple;
	bh=RUQYACSew3cfYX34zgSR284JiIolXCPlfeeA2gfHrsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HybEhtwuSTddsFgGnGXp0ssoyYyH2nU9T5xNS67ywzSoIRBZDISL5cbH4dV6bjZ7o2f/oWtQkM9bsn8u05WuWC6ZxvP2m208FaD8s01qV2XlJ52qaFBwsEOXWzWPno8AMXzBvUOa9oTdUr2EazUcfoEpoCjbRm9ZIXcWuOv3xNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MKzBnPJT; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso4642982f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 00:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781077314; x=1781682114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrqigCCHxDsMi9xkcr3nQgEkjpdgCmWeRsU/XEzQWc0=;
        b=MKzBnPJTID6e6EF21YmyQCtBRczubFhoGJDzbSdVy7gb2kD0euOVSRjXSe1e+IAWqg
         cc/EHBgRUM2N8gPFVYRIrTH7Kol3lLzyM7Ss1EspMX418JCPCD/DAiGZspM2bOQKXo3L
         j9Z94F14mslPsMEBa1JZS+MoDF3c5UjjIeAS8v3p1dSSgrSOW/oz5Yqh/S2O+9GV1Cow
         Rimy+6BUwQ0y9vBBmLpWE7piLRWowY/bzGof73kJZcwOyscKfXpkzUV+8EEcG7otXWKj
         8KxSrsL32F9u9A8yj5dAdgO+qPu5Ho68cl9twdBau3WpSJ2CSalYxpac7UNE7igmTl88
         TE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781077314; x=1781682114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OrqigCCHxDsMi9xkcr3nQgEkjpdgCmWeRsU/XEzQWc0=;
        b=SIBViHG97MzzUXdleXkW+AbsE/G9qTBb8vJUqgkcirboC8IfSn3zm1EBQf9xW3HO7W
         NfEcMZEai6KuQCTmGusJ40ta4y7rY4eE9qBlFuJcNIAQHunFr9HrFcSQQ7j4iV4HsSXP
         p/crd0wg4SrJlVElSFbtj50KaR5oLtMJ9lbA60tD8ojW3Po7EKHd65N/Zt3o0qiuNsrC
         g2FLfy14umSe2Gg6wYTG6Iv08NyBSyW4zpJYu0NTn2rSeZw0679uLENktMxE9vzPcmc/
         95z3YeP2Rm4zit1A//rfqHPqAKxJH2+WGD5nX8IvHV+c/hZcyoTPZ4Pd8waYlK98zY8i
         fELA==
X-Forwarded-Encrypted: i=1; AFNElJ/k/m7wi1DW0dkPP+ki6MxTg6ZNPmXSx/icGwLyOjRzQzf0PwRMbF3GSjc0uZUetUbOWGpWpCymdxjdJ1Le@vger.kernel.org
X-Gm-Message-State: AOJu0YxAiuf5BvLXf5kc0sY15IpxGGDaK3SeQaKfAFlZvdZZSSiTcWSB
	Ft5X14i3lyBt4DwZTR6TLzrza4zfXYH4D+mVxK1f+nk/uTQMVNfDhgte+bvkWY2oNpo=
X-Gm-Gg: Acq92OFnO0PcwIanYtpyl9M0/KCgVkYP2D/xKESLACSXxATriaseN/FW3F9UTV1xBsJ
	RV3qmjY04XsRDenq121/zj4y/fSmzqamkcNDqFVi2W5fDePbTVh9+CxT1VQMjGlGrhFvUgktFcV
	zZ60Qrv+G7C5iznD3YlCqdM98ICM+F5f9UBSVgIt5p7DpkpQpXyZI7DUTvL+DVk0mEiy3OgwWQd
	Jwcuiq7+VTxv8vHODWygagXK62738sPXMPAXvMtvxYPKyZMvpS22kNyZzIrl97FjPfi00BuVRYa
	UUS0kb41FPU2qXN6AqPUTSTPxAKLoY4am54T/0qXBdkVsQgUP4KkGET9puEGmnnY63gk0yQAzQ4
	DYcVi8q3B7ak5NQcaOk45eaXV2etWbzaC6z1aBXwhGanvbYOFFzW1x7gXNw0+R8drWZTizl2edf
	ToFWwazEOGESG8wRyjxteWybFKDAhMNQhBEDfcwQw+p6h+TC02/sYA18Y=
X-Received: by 2002:adf:efc6:0:b0:45e:fa7b:a7cf with SMTP id ffacd0b85a97d-460304ee122mr26773651f8f.2.1781077314148;
        Wed, 10 Jun 2026 00:41:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm69161344f8f.20.2026.06.10.00.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:41:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 10 Jun 2026 09:41:48 +0200
Subject: [PATCH 4/4] ASoC: dt-bindings: qcom,sm8250: Add Ayaneo Pocket S2
 sound card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-4-18bb19c5ca22@linaro.org>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RUQYACSew3cfYX34zgSR284JiIolXCPlfeeA2gfHrsM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqKRU8wuDWQxwbLtSGmJeawuYayQs0Qcj0laB5GNNz
 X7mZs6iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaikVPAAKCRB33NvayMhJ0eykD/
 47yri/yFEa9A9JkT/e28+Ty0O9LdEXHm1iWQMBFYse3uP5q3qDm4PyuXsgzjBhkrbOdtrgt38OY/P9
 8goI3bThbQ0y2BaxrAlVTveukcI9xRdNXOae7Ul29NITYrtHCIKNHFO7Zk9S4VZLwbyojH+Iq3WQny
 HTYCrPzx+2v4DPmePsGaTDRCDpc6yVFtpm3NjuwahOFzpLOAMxYupiXLqRRJvZv3BnvOn20Om57HHq
 UdDrKaatlJP6ElvH3540DXldo2UtPr8hpOlA7HFqKEkZ0WA4qOBle1RvbQRjQi1eyKZch5SDmJdTSp
 i1HL+N/NnVSzQZcw2yKdM0tWXfGSO/kJpHuVb/hi1XMGd2VFaGLpaoUy7+blqCybW3VkgRSer24a5C
 4JpTz7H+6fsTmfL4vohISWvgSBSE/2wocxDQm/Ve+BsdSdpbuB2buXyH0KM1zsX3D14BXf7+C7dXbz
 PvmsmlBVez4cT4Zuiolubyg66PkkgjOUoWKhiQWeDoVz/z5HIB45kWVD5gcoXzumukHymQPsCh4QyL
 zje233G+4XG86o6qRjVx7aZrLTgF+IxH3l37vm1rpfzJ0S+yW+yjhZO1DhPRp9V79OnoVi+4KosAzl
 WjAf2ezex07diTiV4OJxOw4zIX/ea50YPFI98KXrD+07tOiD4zN8iGgt38WA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112330-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[outlook.com,vger.kernel.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1CC6666B7C

Document the bindings for the sound card on the Ayaneo Pocket S2
which uses the special speaker connection incompatible with
the default SM8650 sound card.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..1fc458276ab3 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - ayaneo,pocket-s2-sndcard
           - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard

-- 
2.34.1


