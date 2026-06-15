Return-Path: <linux-arm-msm+bounces-113242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s2GqH80vMGqfPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:01:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 282C0688A07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:01:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=GP+ZIybc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113242-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113242-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0B08305D463
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F35413D8B;
	Mon, 15 Jun 2026 17:00:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBD8411686
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:00:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542823; cv=none; b=Hxw8h+cyU0SLcXzBhHUtALz6SglsW2Df5EnyZ+p8qvkSoO2aRYqA/KgRo9A/ISOde1dfnXjldDtq2l93BtaPynDV0iXtUhB6c0smvsKLwzzuVK+ThxNoIARpFFLPwTu6Ase0UaDSmBIOnJ/YQKX6G1HSHPBqUYHApg4/o/NM0qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542823; c=relaxed/simple;
	bh=7a4mitWB+CP8nQNV9k3Hn5b6MfzrVl6jjOTLFj2jUWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XYdhzoCSgUwcjEIc0gYRJaUcOcUJY92Jyt/pFu2ZD8rh9R3yYOYZkQKPFywxEQ551GPT/gdVbbsyUi7D4MMQn1w7T5GhG+QljEJDUG1rzIhaZrZg93Srbo1a7/d6UPZR8Lv1aaIHNO1aHBZbQ0sKuYVa6V5s/pgWL4fmv5UCvF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GP+ZIybc; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490c1915793so31760845e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542820; x=1782147620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+VdzbAXe/Rlb0p/Xi6bXIiDc5JUDQVJT5OnBZINtDw=;
        b=GP+ZIybc757YmKx7Nvt4Te39xPa3eeRKudbftFBgDz8DgfYMPk30bMgK8lsWmtQEb2
         PohKhzMV5DTsTLoIRdlxfanwFhgNDCNEBHSk+wumW9suGZXkEMFbbbtOsoecvt84MGK3
         P+pd/f1jcSfrvkrjAKdDB53p6Mdr/Z/UCQeMJ3WWHSYiD97/E97hff9EWwkc47HkBUbs
         Low67lZ88HJz1Q8GW+dMN1Cba4dsBp/BZO8aQhki4PWqmiwZGzDFB8gZTbh+RJ0eW0AV
         yT2PPySHn+6wvbTeS40gufIZ82wYI5T/jYgD3NkHgmrH/ToAVf6QJ8p6B+251d6b+vEI
         8rrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542820; x=1782147620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5+VdzbAXe/Rlb0p/Xi6bXIiDc5JUDQVJT5OnBZINtDw=;
        b=WnFtyXDQeGZFZQYaElZzh7A97264QIT0sNzQFXT4CX4ojSZ3Os95rKOTrzwUIJGO96
         g4RYESMsYsGYXxx3+CYN+zE1dexHGOpUkUo3ohIHczF2i9BOV2o7sZFVHkjBrsm0LjWx
         RUO4EZMG7KKCKYvGMFcVLmChDKknW+6cW/UXkQ+MoAhuY2lfmeNQXZVIA4fvlcFnmq+p
         sO3n1PWy16kCpCHY+cSmE/5UbDWTBzpSN7NOltitGNa6QgbmpIjZldlk4g8n1M7CcrWS
         trRn4u0TaEEIFRrgUve86j65kw8ydv16LRp7wUPjDY7yvaptss5qr4cZOin/rYv5uETC
         /uZg==
X-Gm-Message-State: AOJu0YycscPVasFC6TFkyqzdv3w/JHg276MhIXzs2JUw2gyyjHLPa9Xc
	EWOawdILqB4xtqls8UKDgJ3sJbBu+5L9Q+j2PAV0iPD3dzui7C2owpUw6UH/FSywDrw=
X-Gm-Gg: Acq92OEwO2WH0746DtzIYNLbLqQbPJGTzAQxWrOKvFD7Q5BR+4BoIh1Fa4zQr/tdM3p
	2fkuFsOqanqnhywldOM3lENq03bePRkMU1xv0jdo4+esufON+VpsYlEKmrnUUQikhNfBoMawbAJ
	HyZurPUTePAstb4yhSOppM1janvVDfoLYEk1jlvgEIkJbypN5/t9Qecib8TbOxA0y9x9/9D2IRJ
	iLuwT6y5THlndwdQ/pI72efaK7WyLjpp/1PM6pHo7WlAoyS0BSNURWAkMg/ne3NCSjbmk6SWBlL
	cAgqDAyBBqA2jDLIav/3lnC+9SvJl+3XjuVgKKVCjnv4hR8i081KIQoSVCWbaD8fTsMSgrmQxsu
	GPhjtGLF+aVMcQIx/Erg8UpkfSqu0TiFoE2Qf4uh2rn7crsIz2ndVsX5a6tjZBUOT2ZhskZaVQc
	pjWWLQPEpknesgivxh8hiS6ueSBSGZ77qNHO1rvWJK499n
X-Received: by 2002:a05:600c:3144:b0:48f:e3e7:3d39 with SMTP id 5b1f17b1804b1-490ec4d523dmr203951295e9.11.1781542819863;
        Mon, 15 Jun 2026 10:00:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47d1csm5716425e9.4.2026.06.15.10.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:00:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 19:00:08 +0200
Subject: [PATCH RFC v3 2/6] arm64: dts: qcom: pmk8550: add VADC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-adc5-gen3-v3-2-216a2b5ccb85@linaro.org>
References: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
In-Reply-To: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7a4mitWB+CP8nQNV9k3Hn5b6MfzrVl6jjOTLFj2jUWk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC+ePrHo1DsAs4BxT26u19Q481/AZ/g+SfmJ/f7n
 zBb8jnGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAvngAKCRB33NvayMhJ0VuFD/
 426aBWI+rtVqsem3Pcx40E7pRg1vfROX75vFrzcPCc5sZum6jg4Ab/qCWUJ3a9y3BfZVtI0V3c64Io
 XpMR9AgvsJbfOLfOQLEHjQSUQx5Sl7sgpr7Hup4j4Y/VGfU+XvqqaoZChwZV+5NpMT8WP6OG3wS9i8
 G2aqXczt0xUNd0dUJ3+zKHDx6WV8UwK6T6pnHQfwSaW1ZbHhnVNTvXX3iCXTdMzKFBansMKRDPMBxW
 jMFF79f5HkeW6vtDNWCKazl7uP6+otB3IoQn9357LBA/3C1fpFHJlqpFTm3TVMt6V415HKNodNOrAD
 QgDXpqAp/wpvW/6WTP0o+kBwbpb5rc4xNpBoN5sgan0l0ek9sHqm0bBd3pULLFgUgLtDy0XTIAGSHb
 ydzkKcCmVU4QrrxAPrycftPQmRMQhCEbG3eU+2QGHD0UEcSsb4a3VziP+LweNbrPbbnAHBDoNnQtr1
 dVtw4eTE05uVejaSBfhuGwMDBciM5gcY8nzf0xFLgNp9ooX4gse4QIHBwAx/HCe9LZxEufGv+Uf5PM
 9exb0e0LpPqAwVlUD/aDOVofcpZxzxyMPu11syYl1irGJjXttG0Z19WwAhoSE8TKANCez7kDbEdksa
 RIqevdwMBmQxRLLtXSLQhv+LSP4yxH14bldxsfEzdrTcW6/W53fJFzSB4c/Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113242-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 282C0688A07

Add the VADC node and the initial pmk8550 adc channels.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 3049eb6b46d7..515cae060f27 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom,pmk8550-adc5-gen3.h"
 
 / {
 	reboot-mode {
@@ -44,6 +45,35 @@ pon_resin: resin {
 			};
 		};
 
+		pmk8550_vadc: adc@9000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x9000>, <0x9100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
+
+			channel@0 {
+				reg = <PMK8550_ADC5_GEN3_REF_GND(0)>;
+				label = "pmk8550_offset_ref";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@1 {
+				reg = <PMK8550_ADC5_GEN3_1P25VREF(0)>;
+				label = "pmk8550_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@3 {
+				reg = <PMK8550_ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmk8550_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
 		pmk8550_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

-- 
2.34.1


