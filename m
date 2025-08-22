Return-Path: <linux-arm-msm+bounces-70332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B89AB31408
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAC741D22A40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A852E7163;
	Fri, 22 Aug 2025 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cfi/8yHy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF182EFD9E
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855574; cv=none; b=oHN/gT72d2b0sZOShCbwegwye546UHlDyYEdgqwESL5VB+H5fH0WSgleNgktODpdtIUGmoXtqbjq0oJQMdIN6fQSrb8e5ww0QmS9srtf/8ZdfeFkHRKxoguq4Ca+YOY4BNhmCFLa3S74A4COmzIGkr2ea4R2gi0wV6HEsEBp44M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855574; c=relaxed/simple;
	bh=DbsExdoRyp3kdjCk0epdoDIR0B1+3ES9cdqkRoNTHi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZC2psFFU1vQM6Z/I8ISoHRTOaIXUu7VSELDsV3O8vUr0jqO1hQYJf3kVBLh9yffgb1iiVsFV2OIgnTwetW3HU+/urABdbrWKpxvPnY3SmWIoCJNR+ArT79JbBOng9KCQf1RHh1d6apqbrHiNSgYqDsP+x/6DcIR+3mExm7OFKqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cfi/8yHy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9dc5c6521so1010793f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755855568; x=1756460368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5otisq1c/9/dwhaTo3HsCPZ/30o0nEKHZQeBlO8KVEI=;
        b=Cfi/8yHyOfdgtC7uL7tSYtCSfzOdrvhB2s9RzVqRjlEPuyGU1JsZoh3a+wGyOGy9mm
         S84BcYdC9oP2xrotKi+YILCYjbZ8+UblbpOZ8kBmwbHIB6ScGoVg01Ov6eEB1kTv6QV2
         St/uW84y5biil3YE/CxhEVSWl4nk7WJwCXIROCR/G+jHOwmWQzPdOSrhF93M2bNT0aFw
         o4Nv5QnCmYkiWrw3Z8HpPyDWdjEIV1OOCrEe0B5mjXRvxU+FLKG5vG/YEji3pNeQeWDw
         vmnUYO7lpAsdMvfJT6opA+aDXtyiXa49oN2Y0N7pTnBa98ykhZlVSRgjJ2EOkwT52mm9
         fUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855568; x=1756460368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5otisq1c/9/dwhaTo3HsCPZ/30o0nEKHZQeBlO8KVEI=;
        b=q050S57VgQfa7Z90NC6HHzftZGEDo13kJz5+5koDBa6NRv4esBVAF9uh7LSO1mCpzP
         qhofBikp+dfemhvasiv6Bmn4M31QaFkMdH0ZhxnrmMyvizhB1PZpdhRuqaI0lVFN1cJI
         lbPg92CPb8vV0BNh51cOGxJLMPgjAZ3gHhBLYrH1eseepIIdSVEv/NuIb4eou3O8Kooj
         7Ch8Xdd5oLyLsAETY4gXMZiJOW+SFL+bm5tGkTDpOD8OmJBJW9+D7skFg+FxvaNg842k
         60ZQXr5b8GtbD5c3HS/L2WwdvZUGv6duxlh8MQkyEHYii6CFWu5REdV79mbmWR4gTyHN
         52eA==
X-Gm-Message-State: AOJu0Yyik5huBm8IibeeC98Gd3guFbgYwbZ/i0vW2xAvUTacVun5oHl/
	9Jo2rSJyyMYmx/1DM0oivTUnfMreWPQVAfYPw1Fa0exEFcK2v+Yr5ocwyWOcNyJmtN4=
X-Gm-Gg: ASbGncu57iXeTAo3KAi9aN3l1F2owyuOsHbTqnwixnUk3YfVt/QwpPkZ+Qdh6bLXUZc
	bqCnD+8KudPCy3eggJeb3VhG3pbGp/NdZcHKhhkYujxKDkAj87/16qkFP6ZGYvGCXjb2syIU0uK
	v7wlOoruG+YHGFwH6n3zi08iJLRaZ2e7HIRU8MiECkQ+5ULRkNLIerU4xBVIbhFSysCevo2V1ay
	B6T3vZgfDuWBAYF2pWHWKDUotjuCshTm9cg3cD2jNmqPGLc4foaEbdbikMYY0eG2kroao2/NSq1
	hHtiO6XnWvVB+Z15c/Lfu/DQVKZuDWKydgLhDObOxrxygSm/9JdQYpy4qLlzZ1zH4Yv9nqJ+VTD
	EhSnlF4ThdnKRksgQ+gPnlSrl9SEhhmi/5VHgbWqes0A=
X-Google-Smtp-Source: AGHT+IGoSafaMShGAhyL0uPmSQ5Go+OMOZAWfey8bujTBly9Sd9IfalZviwj6/bmexg0ZbQqD5Zmuw==
X-Received: by 2002:a05:6000:24c9:b0:3a4:eef5:dece with SMTP id ffacd0b85a97d-3c5dc733e04mr1776437f8f.35.1755855568329;
        Fri, 22 Aug 2025 02:39:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c684524163sm609890f8f.61.2025.08.22.02.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:39:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 11:39:22 +0200
Subject: [PATCH v2 10/16] arm64: dts: qcom: x1e80100-dell-xps13-9345: Set
 up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-x1e80100-4lanes-v2-10-4b21372b1901@linaro.org>
References: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
In-Reply-To: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DbsExdoRyp3kdjCk0epdoDIR0B1+3ES9cdqkRoNTHi8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqDrFUpiExxFun+gPYtavnvc68tqffKglmf6QDK+3
 J2EMioqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKg6xQAKCRB33NvayMhJ0SoWEA
 DMD07+exlTYQzOOqpgxM02WzNd3YceTj+CorC/WBpy6n4rgAuCmiU2dfOH/rpmdZ57wR8kNDNzfpQd
 why9QAxQvCVYJZ9gemYW7tCCHJVSbr2onTaC5C5ouEgVOBFmYJG1wcPSQ+igY3C7Y1hSPmBGHiZGBv
 y15FEWSrTUOzcsaVcPdHW3J3lanVWOjci1vzE/4XAUhZpswEUMXSYixVE/v2q3r4z1NKPN6ttSqPyI
 H3jHemRDTG/usMCXbt8Gu/F+HTeEO/WAfEBaa2frXH45UzFKM0Ip1JV/o1Rqp7L5P0h1mJO3kAGyLE
 bjNXzbhwD8vdjAvxUObyIfSrTKeFjJ6XtyoPeiNHEVq25xGfg8BbNJNQfYDdIkuycpUjvEgbrY/YIN
 S/G1MqB6o4l6muPQFVbySUWpr4LOTUeM/o6oq5e8Ft8rxiZNQTyNP4OVkWyq86hJY6pHhb5c3ZbAgK
 EvqzaIurd2MOHLpGmraXO3Ekl/ZPqG87KXLTmW7VeBEkydS64QZDsnuN57cTlnLMvPqIaW0UFXFMKt
 toZn5geBxR4eJnw4xpYVH4IaUtDJrP/zKIvFWO9Qv+Om3AqfRJmja1NtKVnajMCZsvYiGvud1NvhSE
 UCb3boNBJYFFZHqcFWytlXYMy7ZrUrhj7sba4i53MgETUuC64yxx6udVuxqA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 6b27067f0be66b5c41fa681ff3b4f535100bdf59..293e557ee07e0e622984d6f869a5f79a5766ed18 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -884,7 +884,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -893,7 +893,7 @@ &mdss_dp1 {
 };
 
 &mdss_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 

-- 
2.34.1


