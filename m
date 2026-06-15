Return-Path: <linux-arm-msm+bounces-113236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Uy8RDmsxMGrkPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:07:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A21C688AF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:07:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=g7WpVLRx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113236-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113236-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0AC531242B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1F2413235;
	Mon, 15 Jun 2026 16:57:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B99410D08
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:57:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542633; cv=none; b=SIOWbb+YtSNOy+7dwuP+D83y4jJ/FNKXvocxOPzkEkLAkPYFl6NY9D4EK4+wFMmptdhV/+zFPlvu2K3YWK4a1+wSXKyxf5OXny5xNildF79hqKHzbTCIFn2jy3hIWceiLgr28GfAFoNEsqTUle2JJ4kH0FHuJhZpcC5hNQou4B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542633; c=relaxed/simple;
	bh=Ynlf+8B2Fa2GRaSP9wn5ZFdvLpA1HXp62fw1akGqkRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nK6S1DRZd9NBmcuagD38uAgBKfB6kxp1gLLIUGt3g6oGjtjEuUr2WFCMdJ6SNlbEGHnWxOD/xYJ9bTU8L0dsB9wt/8gxCHQVTzl2nA+cyRZquegGCDU21I5Q8BEsSZXLIk6j6u8F17dVUuzzkPKEAAaM9A2btdCEQB3FD9nJi1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g7WpVLRx; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so2972222f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542631; x=1782147431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2syVWnLMc/XbSmB1l/iep16wgoUi68kiSPihH4m+92o=;
        b=g7WpVLRxurJP795JiQ1x71+RDp79oBcbUAU/U/0dkdHbeC+yVHdCBZRVABGssGIIDY
         we7niPSluPJogquVwiKwsgh1kVdo+xK+H/dND50zX3F+9/CQ/MIy9+navTPteg3BwgcH
         kse9q25qsOPvNGIA1dDpZHK8V7riD+cDNyfyfAnJNan7eZWY0iJLf3LweZrst+Q3rDHL
         trGhhsIwk97BVuk8i4P7JvHUG1wr39l24rP1kH4G9HDaIgwDHGGXOnme3VrgY6XlKXr8
         wHMhiz7rrbwGF+oMt2uLYuos1P0VbGcgm6250+W+tawdNKsy4lhJAbZCK63A5r6Z7wdy
         IF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542631; x=1782147431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2syVWnLMc/XbSmB1l/iep16wgoUi68kiSPihH4m+92o=;
        b=lPNUNla/ZlqFTX5qEUxZbGj+1YvxjXcAXMFID4rVJiba4nQJnjpbmXWFv6JtbqpYde
         6A3fLtub6an3wDfzTp81fd/gnb4qmk6s3ucjyPCFBXLKMDXY52Pe2p1J9DsaVhjjNunw
         z/5kJXdP8EAfk6OW7MLOoHuvFi5g476T1YqUrvIQqOH4EIZpCxCK983Ba0YJlJ/oiPCD
         lJh7mG4wh37hy1DEoGuawFacAnU4TXfCcYp9cb12y5Hu0B+LYV2JRAWdeKaurynq7hY/
         wc/8sNkGFV7CyOoH917jAdHW9pq9824LGEGrM6PWaYYG6K6VkI44rlNQBPiT14UXPawu
         TBVQ==
X-Gm-Message-State: AOJu0Yyg8OTKgmJu07M8W8CoHxFKrqKg9iZ3ZXoQr4F/ian9STqTBZPR
	lsUZ34A3SDHOyI7PV7vPlgZ5l8nYMMYAVkl/BAxkSRnOr4yk6cqE3T2eStVVRYEg2C0=
X-Gm-Gg: Acq92OEx0YK+d80990OvefU2gLZxkb61S5EVRt+U8hsIGXjlkLbelNkYX1w5n4fCVJv
	LhSRcHsrGZCh53dSQFYPTx8UNIzZ27PsPATdb7TP0/8Sumd/bb61sxeKW+haLt846fmk4cKtMrb
	2nFTu9f8ITOl9AaXOSm2mIlZ3n0PJJTLTrwx0sR843qzdGI1p6es5VRCMYHVEoVC8jSrdVxwywb
	TbeQGeaEY/ZfdWFJN0Tejd+KTGtZnCj6z91sR2ovhpm0oBAPgUxHDBlISdOI1tOJzkzWiNytbEs
	jkBFUniT+VQxpTV19bYey/o8B/AII9yhVrGBFzUxo/L0KNReOZU5y6b/zVBQrOkvKSRot71LtRA
	je3McgL8iHGtUHZ7UsoVm9HQORC0HStYZgfMVN1DZuuv2jh++YLv/YlnU4e9HGyKj0uE1dyxZgK
	w3Ba83insUPsj2NTF3SHmobkHwDbeoJkNPoTroN/dHMZqV
X-Received: by 2002:a5d:4808:0:b0:45e:ce28:666a with SMTP id ffacd0b85a97d-4619f37eec7mr209346f8f.1.1781542630607;
        Mon, 15 Jun 2026 09:57:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm37202471f8f.22.2026.06.15.09.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:57:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:57:03 +0200
Subject: [PATCH v2 2/6] dt-bindings: clock: qcom: sm8550-gcc: Add missing
 power-domains property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-2-6b5752dd4747@linaro.org>
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
In-Reply-To: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Ynlf+8B2Fa2GRaSP9wn5ZFdvLpA1HXp62fw1akGqkRk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC7g6PkeNC/y4Fjn01vvHIaWL+Fm+RJ1Xt62QNnG
 jlFS+0eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAu4AAKCRB33NvayMhJ0STJEA
 ChokNzF9nQ3JPeeBadKuajC3w1m/9owiuFtwvm3i5wB+k4bIZeU1csCgiARwTANWlZj2tzHgxayVbA
 99hlWKUG+J1B4WvZxk5iZNC6fPeySVLqHwqLU+9j1UGAaAASUMsiOTw6CNeB4AtkCPmvnrX9tEV9FE
 ifqfkFHgHdfP1iwXnFSH0EHPX0z59Sxf4XWrMgPwnxpg5AsgqzsBbrSTkuY7yNrawMopLDE22HpBad
 40JHTY6dWaNC/vqAUs7RIKZdwmtbaUQBVwE1TVZJDQAtaMxwH49PT3DShClqpKR3rk3ST6GzS79JUB
 Xnu2iO3SWOKXpeWZC5W03F47CfAOTOtu0BtMN3jJNi0aYgv8wkF0DzXg0fpM3uK3WetSZDSF7kuu8w
 A4sjXCbhCwxlEu1uch1hohsI1vD9T36w8sA+DW6Hmp0tkHckj2OEMMC+eUdsOeSAR0mw2Ok8uRp4nU
 4QeOvlNO8n531+vMDuDISI3oEZhUk28CL2NtLnd7oAmzogkmLWHn1E+cxqtYKg8Nw2+2I/0Qgrr0nl
 E9lNLqkj7PvObjDrz1Rj4DGjdF6lmy6NKYCqBdI+l68AnUle1X8Uj/PuNRVyFe0fD9KuJx+QjXkkAf
 kDrC+Zl9uEUrIcVQYnVBcE7HATuDYDXvI3/9T0ZFbYJKoda+hsy+ViUHMWeg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113236-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:abelvesa@kernel.org,m:konradybcio@kernel.org,m:quic_saipraka@quicinc.com,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A21C688AF9

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: 47ba9c50bbeb ("dt-bindings: clock: Add SM8550 GCC clocks")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
index c4e9b9bb63f5..19f06d27c7c1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
@@ -31,9 +31,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -55,6 +60,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.34.1


