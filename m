Return-Path: <linux-arm-msm+bounces-7927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BA0838CBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 12:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B4DA28B67B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 11:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF7B5D8FA;
	Tue, 23 Jan 2024 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zYVlCkWN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8EF5D73B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 11:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706007719; cv=none; b=VAAvDaM08PnZ+ILt+X8KwqbBipE4FKJgBai8qxZV0fM8Kwvrt0pgMm6cTXER0uQEalmcAO9DGFg6Dzn+osxkeHmi74W4FTy5oCrlIDWffcgQu7c+xtG1eI3quL5qRIQTiXANN2D5+Gtme5o3tGSlh4oXR4Ng79u3UPVs/UeXDZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706007719; c=relaxed/simple;
	bh=tx4kyU5130JQklcMT0u/f9UNERWWdQSXmZjEXww6BvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rALChQEO+wi3q1XG/5AV5YXFemheR+7WTz901aNkMKbabgEc42qRZe0O0igPKvFCoDRYqxc5McUzrqjlEXex1CVee45AMOHBphJjQMwm5YeRtsccBHYnvx0GsAAqxPAIcvB6TIGgZzPF/TAEorJI+eNLVve1NoYbBiYEluJah5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zYVlCkWN; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55817a12ad8so4609859a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 03:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706007716; x=1706612516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoXONBUAbVlHo3DHcqRibgt90d5J3XAE3xf2yCRQRgw=;
        b=zYVlCkWNPYawKN7IoI8VgT1rzKhfOD09jmmhyQPDv9r4rWoVekQzWG8Uepqahf6Oq/
         DPPgLUw9y47nsjlAADIehrI/gvWjpbD/lOWYKbv57wKm6FzSJUVbnMDZLmOKWhBdU2uD
         dxyOxFMdEH9jDbAErkbG4KQMwkKk7mUzCRAkZJglxK9mwPUqfmGGWCiY3la9fU2HWdSP
         V084E8OMBnEhi3NZcELS3yqdYA1M6MqCRCEd6FQMrLnEXJMBNock2x6ktjTvL3ZC5ODt
         ck6PVq0ww7h3QFviQmSaa8h+gPT30RjxlC6Mg4GOdQFFqr2Hoq8Nk8ER/4H+tzNKQDCI
         e2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706007716; x=1706612516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoXONBUAbVlHo3DHcqRibgt90d5J3XAE3xf2yCRQRgw=;
        b=GSVNPiLA6px3fxWG9YcmsRlRb6NgTr4P1PXktehZhlb6BvZzgx/HIJ7IkTieNpAH40
         6bJlGljoldzXtUWXr1vM8x8Qc3p2onPVn+vwAHEIvQzvvKzU/H7bdyBV2joQAKleg9xn
         nrMUQKR+NwTWBiKnWKt1Ghr5hhCrsLQVHk/XJXBV+rQZwA6ZeY++dIntDXEgsaGNBq+w
         4ewnoCfm7XfDZOkqpWdWDEyMC520Tw4j1boQ5uENTOoVEwN3zFD9vXkV9A2D2OnQLbmy
         Z2G/0MJp5RwtDVxZf/6jwYU9vOSpMW4P6RDV9z7TPEiU0qHqokQ7i2VCM0J5oUR6Pif0
         JWpQ==
X-Gm-Message-State: AOJu0YyRTea/Ghh5d0wGahRJzXrdwIMckTO/+RA5Q9ZhBKhA2ChJML4B
	/fXw7lmE4IDd3DF34Lc2A+NK95tu+ViBSl/KyGgU+aOaWtuQYUcg0Bv+Vn668Qg=
X-Google-Smtp-Source: AGHT+IEfNsk9L0g4s8vJfsvbAiDMdVUeTODmP1Xq5n/ArwSkMIfm+DJiXWeNiKAXlwf6dlyMlVT4LA==
X-Received: by 2002:aa7:d957:0:b0:55a:2f50:53f3 with SMTP id l23-20020aa7d957000000b0055a2f5053f3mr856010eds.38.1706007716196;
        Tue, 23 Jan 2024 03:01:56 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id fg7-20020a056402548700b005593c83bdafsm11430074edb.45.2024.01.23.03.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 03:01:55 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 23 Jan 2024 13:01:17 +0200
Subject: [PATCH v4 03/11] arm64: dts: qcom: x1e80100: Add QMP AOSS node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240123-x1e80100-dts-missing-nodes-v4-3-072dc2f5c153@linaro.org>
References: <20240123-x1e80100-dts-missing-nodes-v4-0-072dc2f5c153@linaro.org>
In-Reply-To: <20240123-x1e80100-dts-missing-nodes-v4-0-072dc2f5c153@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=uhruz9tzEahNH2F+362SSx/RVU2PIo0lL6mu3SYOWPA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlr5yToeDIe65tkiekRwtNNDg9NvyXARy78Tt9B
 MX4UJ45ziiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZa+ckwAKCRAbX0TJAJUV
 VtDSD/44xZDfbuKEB4OsZ1TuVrZQKx4E9T5MuSJ5hti61vAcN3uScdvhdvtIylm6N+wigqirf7I
 c8IKg3O27M1khiTz1DRxv2aanSJb8NNM5h6nBlJEzO4ibo9fP7fPw1umaj5hrv6/BlZuN3b4k51
 70V/IjWS7J5Uu0Uk18uL2lfHP2RVB2aNmJeUu9mygtQ/qzMAoNGo4AVGOk6jVuV41PJd/ymzD/o
 lL5gMEu1jxnxFbaDx4QFiVnjMrnjUm0TAT972/n8eKrEOkqmV2gW+7xHDwZy8rO0e59f7nOZXDz
 8z5kbuhqltQcEndxO6RF33QPLNhi4axH0pNER8jG4Ngkout0U2pIEvkvRx1VZNUqi2KNkXXNKrp
 td+tOzjZDEGS0CTa96IcNeQEojaxN2Ke64/lbHAas8qG09g0jxTS/lEZ5YG0OKogyOhRKaYob8I
 NQfKH/FwKCCLJBmL4z/IsU9MfR9jFRxsxohEfzgJUgmq93jCokE1YNf0WQirqfIn9JjPDQqLaNS
 nj6gF5k11tf8Do0YQBIbceK+VO0u6ju9uuVex/aWgVK9swh8XHj2bxXZA7ARVV2PumKEpa26L0R
 bohvWRJTMNZmps4KZTVtufjmdx3nP+BiUt40BN008MxQCZs3VZJ67mDsKnxOVB0s22Syfjz+LeJ
 0Oemeqfm9m6YJgQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Sibi Sankar <quic_sibis@quicinc.com>

Add a node for the QMP AOSS.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 1210351b6538..3790d99eb298 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2663,6 +2663,18 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,x1e80100-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0 0x0c300000 0 0x400>;
+			interrupt-parent = <&ipcc>;
+			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			#clock-cells = <0>;
+		};
+
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,x1e80100-tlmm";
 			reg = <0 0x0f100000 0 0xf00000>;

-- 
2.34.1


