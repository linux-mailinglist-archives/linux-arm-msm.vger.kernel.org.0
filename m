Return-Path: <linux-arm-msm+bounces-8201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D881083BCD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 10:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88C2A1F2EABC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 09:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1E91CD25;
	Thu, 25 Jan 2024 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b="hC0eDsgQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC21CD11
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706173477; cv=none; b=obewMthU0Tcc9Z6+XcBnMFOq1OB/+RXBK/CHklPRqe2DnN+KdRNuDG7pgO5mCqi3UoTNCkypvazkWIITk8bZWl50GmWMZr4JboirUclQXm63sugPHyD41lk4mpevt+X9OqvLYgT6yr1qFdjYsuQzr3FqxHQ3bIueEMHydi+Ck5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706173477; c=relaxed/simple;
	bh=COtAbM7RJTtMRbtk7i6Tx7S7OWuaB2ZiKtohexJWlFg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=RPuL0DrUPuRd72iGVaLP/c9t9UAtkycz9v1FByMBzizyryHxEwWAD0JpLaBHymoMYciZnU93M3YzPtn4BsnfLb+fRZ8V6yAa9EAcaUG3RJBQvji9x1BCbpFTjRAQWWarQKNNgTuDxolTHijy4u48u193KRPIDFjyCv8HAKoBmyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com; spf=pass smtp.mailfrom=8devices.com; dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b=hC0eDsgQ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8devices.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cf205dc075so18848791fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 01:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1706173472; x=1706778272; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sbN8fdebOyzeSDzgcpAdiySI0Y63EdYcxgGZBLtd78g=;
        b=hC0eDsgQQy5zPtnrljg+ZgnsWfDNJpspd+bL1L5MlbjUkEe+OCx9aA+9OfDhBAojx0
         tV13GOlaxknMsHs3EcD4y6gVmHuTs6SNa9TVnF83eufCaedckaJ2V2I0sNFiQtzPO4r8
         BesHhY9Dng4clGMExNi1MXw+hdjvCBfgGoxvW6Hmdz48JmbTF8oJtwjk4FgiRh1XUL4s
         vMWwERJYFP6MshIJV84xSTaIuitCyv9CU8VJyj1WuCdihJKrrnp05tPE6C9WxkLHLw7y
         a4dsHA709wsPwcNUGGqv4F3XGm95uCn4V44a/DtqR8PBV1U1robvVGQnkr5ek8Xe8T4f
         s78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706173472; x=1706778272;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sbN8fdebOyzeSDzgcpAdiySI0Y63EdYcxgGZBLtd78g=;
        b=ABmj6VZvjfTC6MKlCNXNTar5YnsRCXu65yLOzAZZaMPkY3xMXlmJNRnNzUIapf7yn5
         VYkFph7Sf3ukqpyQ+8jcsJTBpzqE8S08tzaR5+bZxKyNLQH+Pssc9kETQpJl0F/3BswV
         SNKCHLm257hhAdfDRPXkVTAhLZ/Aas8FYTmJsV7n056poLX2fqy5Q9gFD39nTw4vY8pS
         Z0mIH6RtnrCNxeEAMK40uPJirlqyCHjsPbGBo0frJVlwNd3SMSNF/hr3aI32sj2PV7Un
         eeo97Pp0MtjY2D2PEWKDScYfn8F8mFhc1xDe8Sp4yEmufeLahD490F8Zt3+CDzbMyduM
         LBdQ==
X-Gm-Message-State: AOJu0YxbRfC+/NKjXYHoVS17GhSURedYnT04bigLtGi0b0cOW4sT87Gc
	TrndW4xpgg+/+/NWOSpzCPFGhTtyR4W4XoNQydTzvAT68uKVDXG+9zApWItQ/wQ=
X-Google-Smtp-Source: AGHT+IFc0sYdhDzxkmSyEK4zXLlWsd1jzKhHs8mVKbHHYe5HOCJw6HEx7dZkRpOB2wcDj51hN/wk/w==
X-Received: by 2002:a2e:700f:0:b0:2cf:2d82:a5f5 with SMTP id l15-20020a2e700f000000b002cf2d82a5f5mr307089ljc.56.1706173472614;
        Thu, 25 Jan 2024 01:04:32 -0800 (PST)
Received: from mantas-MS-7994.8devices.com ([84.15.37.222])
        by smtp.gmail.com with ESMTPSA id m10-20020a2e870a000000b002cdf8c9af34sm229123lji.57.2024.01.25.01.04.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jan 2024 01:04:32 -0800 (PST)
From: Mantas Pucka <mantas@8devices.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Mantas Pucka <mantas@8devices.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: thermal: qcom-tsens: add IPQ6018 compatible
Date: Thu, 25 Jan 2024 11:04:10 +0200
Message-Id: <1706173452-1017-2-git-send-email-mantas@8devices.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1706173452-1017-1-git-send-email-mantas@8devices.com>
References: <1706173452-1017-1-git-send-email-mantas@8devices.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

IPQ6018 has tsens HW block compatible with IPQ8074.

Signed-off-by: Mantas Pucka <mantas@8devices.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 99d9c526c0b6..d6f333a7bcd1 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -76,6 +76,7 @@ properties:
       - description: v2 of TSENS with combined interrupt
         items:
           - enum:
+              - qcom,ipq6018-tsens
               - qcom,ipq9574-tsens
           - const: qcom,ipq8074-tsens
 
-- 
2.7.4


