Return-Path: <linux-arm-msm+bounces-113234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RPscDMIxMGoAPwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:09:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 64611688B2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:09:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Go4HbGxR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113234-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113234-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3469A300B505
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709FC40E8E1;
	Mon, 15 Jun 2026 16:57:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22621407597
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:57:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542631; cv=none; b=eMzTk3kkfmXM5icYI1cSh2QK5xh2BT79mUWuiCcCrEoZn5O0VcZ9sEk4u+co3riFttzvMz5Px+qv/JIHEQSSuTSM7G1cIg08H/8gWFOyqXsn4yFYjxit6jFpsQFoNjkw62caEGwI0PxQxwssZsKkurvXZ+5utBx3sl/HeN481bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542631; c=relaxed/simple;
	bh=ZNpbc/ndGhGFIsZ8mYVotPtP6aCZUUCwcGqJQ6E6I1U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UVr+EMLvHyAeastcUapt1Dti+LDw38S+ZE74+08E8HaP0S9V/sESWvNxaKV3a5FZrVuBzQDcGQ/XHNOdGPBRokpWNdspwpA7KgpJgJinZxi2ofH+epP9M6wVzI5GBz/Q5mGBe/ISwMUxLxWP/QdGto+lvapLnC9YpIHOZiv3DOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Go4HbGxR; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490a76757e5so25951565e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542628; x=1782147428; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SSClQZ140XmgUn13nb7ZzIvNnjIo0fluj23pWBj9PG0=;
        b=Go4HbGxRkk/hGrRcDzDYBbLTvAe9nCGHZIBd41fIjCkzQLAm4HhfXU93DHPwjMfYMw
         c2uUtiCQke2cJMQaSxcyaaHDrvcIB79ilAY4udAgbQ1N7mft6w46fBmBmV+LUEOnqiqd
         jtVzn5xn79icnzdhNcrMmYm4UUiRZBgGNAHnB07pMya3KUazkbFvOpTdaK9IYzcUJIMO
         f49X42rOJJ48awaHf7/+16x0zw4MxSbwyW9DaS2T2yvvz1vAx36GX3FKnWPc0YukosQ/
         D6Cl372pUClOwKCwSaBdgXh2SLCZl3F3vdmYc9LZc/a6whLuO/dihPidaiCDW7JoRumk
         LuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542628; x=1782147428;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSClQZ140XmgUn13nb7ZzIvNnjIo0fluj23pWBj9PG0=;
        b=O+PqX/sUnFO0XzptRPn8va4X3igqaxVnBauuRfceGnNclHTanZxM4bKQoJEn++9UEZ
         Qfw2UzHPCFHxRotlzOhKpFg7f0fq1JpxAkehdzBO77SLvk47slExHtEQdDwIUoBrc/o+
         Z9Im5YCeGYoMo4RBLP5Gpfvdb0IXwPzjUz6daZjx9P/mi53DyLYBmIqk+wuCVtL8bvku
         wUBh0GRgpcJnx16cMQPN9z3R64G2WUsVfWCe/icfsd/T4ervS5ovXq7qM7vMxNH2a1ax
         OFTz7lp9OvRlwjnJJdrUT2a97VORYM1aIhJbesur4BWuWpWyHVxe4Bp8gdeI0q3Yu7bN
         iTjg==
X-Gm-Message-State: AOJu0YzF3GO5go0huxI11O2Rqh+qBMbC9BCS19RmbOm1Bc0g8fh9CHR8
	MLHtd8eWOxKDbsVubIT+Fpwd2nByaPW6nFkSvwOXN+hl0CxoxDJX8vMQyP/y9w2nuR8=
X-Gm-Gg: Acq92OExq+5a/tcKVDXCbDzTErWFMNppIJeeqDXIrgPlcq5hxd6Cb9udP0gN3lEsQLi
	gZEZcOX73ud03KuOWpVqLivNejZgRiINV5qd/ZkzEJwTc4tBkV/meCTvxVy4MQRj1YtKsc6JEYw
	ATcPowm873LC4SHb0dDF3iH5/yGwJDep4OHXl3ZGKssVDr9gaSza7LL2H8Xk4cRVbIY6/WWA3jQ
	qCrfcWSTdCG5lZnEeIbyE8pVaPv5SLmULRZYLvOrohzLBHYKXfuBYT37FbdOMolwqC1dXGgvsfB
	9/OYrEtkfFl1BrYnTP7KiopccxUMXWDY2K/FPUZtUXJhP6pAs8cBoz/GpC1BpRZoORcSxqJa8Fy
	d3PjreXVId1dLZLopEIkC+b0jkkAQTJyV9+tbFJYbeZ2xEn6OQkXyLaCe/K3G4kwy7P4snqHo9s
	ecTs9rGqWuWSVBVPtDKPhSVBZV4tQtDYwWt8DPU/aoAiNK
X-Received: by 2002:a05:600c:6542:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-4922006283cmr103978665e9.14.1781542628464;
        Mon, 15 Jun 2026 09:57:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm37202471f8f.22.2026.06.15.09.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:57:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/6] arm64: dts: qcom: sm8[456]50: Add missing CX power
 domain to GCC
Date: Mon, 15 Jun 2026 18:57:01 +0200
Message-Id: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN0uMGoC/42NTQ6CMBBGr0Jm7ZhS+ZOV9zAs2jLAGKWkrQRDu
 LsFL+Dyffny3gqeHJOHOlnB0cye7RhBnhIwgxp7Qm4jgxSyEJnMMNiJDfpXteQCAxP2xsQRzYJ
 U5oXqVCm1riAKJkcdL4f83vzYv/WDTNiN+2NgH6z7HPU53X9/heYUBWa6IHFt84s0dHvyqJw9W
 9dDs23bF1Iea7TXAAAA
X-Change-ID: 20260424-topic-sm8x50-tie-gcc-to-cx-e756afa72bb8
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZNpbc/ndGhGFIsZ8mYVotPtP6aCZUUCwcGqJQ6E6I1U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC7f2Equ/+QnyEvAg2mLhD04xTg3Fe4xNZLU0vAq
 vyGhbnaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAu3wAKCRB33NvayMhJ0f6nD/
 9TTJbhHPWsh2VheUlTHslJBatl4nLI3T1QE8KADY0rOLTEhFFGhXm66oUp3c85WiQ+u1DhGYX4Apgv
 EDDeFngyCfISQaZWe4eP8FbPOXusdfj79A+658uw/gyuehlkeu8mUCvPrulSPf5tGS/bdbOamifAfd
 Q1O582YOn9KVYgDLvV8bDvI42y3TXMIsqVy5D2G+9S6BJFFYWhytrpu8FDlSOR3wRxg/Fl8CaW7Q4W
 dfCyjE4bSPTw1TZD1vsZDOrsiYxlUrJW4FwO0DfFou60xFl2CFs/oCQFx98RaEji3MsR/pS9r3oLiI
 8oDFBNBnD8fZpFlcVPmCv9hFX5axRzS3Af5+4fsbRdYzJPET6+iNpWgaQ6g6nL4aBN4ifRA8T++pnP
 7S7/C6Rx+moKgLCbBska0P3it33+uU0n9F9kcjpo+wuJIktB476SkWbNV6Q2kK2leG/CP1YCU4PQN5
 f1Ahk1391SYqHSWGG1iU4BibOch//CEyWYjUxhv2NlV6hauN2U7FEr/H1dM4HGGKmNf6Fj1v+hmHfX
 4hMJfHdhIRDctJvpE7bvdDxYuUSr46q8Gb6hdCGPe2dvR9iNtxCbLO3VrBypcRsqGnc6SDiSNuOSub
 X0kD1e5q2Qmfu6P93qrJulCfJTd4npT/eFLBkc+ANU/YoiYGQdpNl+zyBhrQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113234-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:abelvesa@kernel.org,m:konradybcio@kernel.org,m:quic_saipraka@quicinc.com,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:abel.vesa@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64611688B2B

Recently, on Eliza & Milos, the CX has been tied up to the GCC,
but this is valid for most platforms including sm8[456]50.
So tie the CX power domain to the GCC as well, for the
same exact reasons as on Eliza & Milos.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Add missing power domains in example
- Pick review tags
- Link to v1: https://patch.msgid.link/20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org

---
Neil Armstrong (6):
      dt-bindings: clock: qcom: gcc-sm8450: Add missing power-domains property
      dt-bindings: clock: qcom: sm8550-gcc: Add missing power-domains property
      dt-bindings: clock: qcom: sm8650-gcc: Add missing power-domains property
      arm64: dts: qcom: sm8450: Add missing CX power domain to GCC
      arm64: dts: qcom: sm8550: Add missing CX power domain to GCC
      arm64: dts: qcom: sm8650: Add missing CX power domain to GCC

 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 6 ++++++
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 6 ++++++
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 6 ++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi                         | 2 ++
 6 files changed, 22 insertions(+)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260424-topic-sm8x50-tie-gcc-to-cx-e756afa72bb8

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


