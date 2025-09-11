Return-Path: <linux-arm-msm+bounces-73183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A99B53D5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 22:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4CFF1B27BEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 20:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57822D7DF2;
	Thu, 11 Sep 2025 20:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak9Oh9xk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE252D7817
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 20:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757624227; cv=none; b=a6uUceEv9Xd/yWKdPBTw3KGWL43rmtDax+f1ihGmGXsatWtpIpRUthwN3a8YcTkyoGmPIZHGwXb/894dw2r7DFD10Hz/uj9cUdZhWXaP7TH7IOrOIR0sMGuSuq1TO09/2qSVZbgx3lzb7Th1q8w7JdqDLVLWieifOwaf5z4omjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757624227; c=relaxed/simple;
	bh=3/RgRAcFV2NW0rUq1O8pSUOarRj54QaeN5/ojlVNaE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HHJyiAt7yz1wWevOsMUOP67vL50qcoo3SPvFHV4XJIdPxB+fWwVFTByG6IcUgMdqgBJRY73w7V0wf7AWM0pu/YFDuDDEggoKqkhC8EXYdNQaI7yh0UQynYaRuBo/ghITT6UmdctyajWabiMLNACkCO6mJppnZX1SgmlGaVJsObs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak9Oh9xk; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7322da8so229664966b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757624223; x=1758229023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6aOjs8PgmMeVOmmIH10qFkLTayDVCN1LF6r/kVHD1s=;
        b=Ak9Oh9xkVmpI07XrcH6OJrH4iBbaqqA4NLdGjnzh6TEI0UDmko++HT5vd+PI4hbb7p
         p9ncWfCSz1USyg+i6PMrhU4pw9nbOIxJLGDIMomJY/YOYOMnuLfMR/JgCK+PkvXPEFVx
         LCi+gUOYIw/334v+UvmNj5nQe4/TH3c9DN4CtcKb5PN4rnMg1PD/NpyfbQTG0T12rjP6
         hujI2CxxhAZnuxmcgZfS6uyEzzmza7gYcAldWk9E78kUQ068TRTThr6ugcl06iKpiS7x
         GnOVYwvvyAJyevkIvRFXC8GWqA96/ss9MpDA+FZn6Wx8PpRZoNJqdvE0rrArJzrLB2pR
         QmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757624223; x=1758229023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6aOjs8PgmMeVOmmIH10qFkLTayDVCN1LF6r/kVHD1s=;
        b=b1hj1eSnjYWFI7oBnIwsQoNe/bMRsQHwFi0dYpY+BXQfwqarNvWg+gr6gIRsrn1iMB
         QsOCK/V3yknNTCerEoGcyQeynMwNFx12sr295sA0eyKT7XPOIyworT1GjICM40lT6Zvt
         ZIF/NUApTLT3so9j4tA8O2IsUXFhEGTaBpCSaEC5BZR2Ao3Grq24KLRLMOOlRd1lqDsw
         h87DpU8FhI9BQOEfiDQKj3BOp3KU5rAP+XuzW1lKDohwfomaaA9PClJZSj1eOkFN5dVH
         6HMkye+ikrzo3YtW++vctZhgaRLMQrKPINd6UaLsNxU8EWOyWwU8tILOVL0C8j+gEAAs
         RkPQ==
X-Gm-Message-State: AOJu0Yym0+fm6lUgz8UBCjej3IxuDk5msnbunTtWARSNEMmatN8c2zcO
	JVbDw/zl5nLV2DBVNwWbI3Jq3xMXEUyvGLg5X9ifxWjpByaqBcgg1kL0
X-Gm-Gg: ASbGncvNpSjEFODnh9hgf6EPDFEC2tkbIAnq/z8SM9h7XGZ7WNgGgYIcdr+5tI1E8Un
	Uky0Fct3lJWjXVq9wUb0fxUl5doNzPL9sm6crM1i1+OJOhiuB/doZz4tHlDBvobKDAE+K4cNKel
	7mH64Njyc60t5ko3cD6Ohqm4gVrP0dTbFzLAt8nwkm+RU/WHMd8mvbbzrICQ2SbeJUFl0+dOF3t
	jVHZh+QMfp0CqftjrXWy81ciq6H13feiRQ9chBvk8eeXF2KFWeWjKsEWWaMqhYnpEmkNhwbNP2E
	7zZBUfYqJCWUNr/2/Qy+KC5NhkeD3pClx/F/HOVIe8Wz1e0DgDDkcbTclugR4f1NXMuSmJBEalo
	+WoxaHBQMh5z/evl9W9BRTjEaC+Q6R96Ojm6s1bwmQA==
X-Google-Smtp-Source: AGHT+IHWdhuUM6f2lywRYg4GOnoPtBiWkw6/PuE3vzVz7Rso77GO0FX2u+NDjsUbuHwsz2f4SXE3DQ==
X-Received: by 2002:a17:907:60d0:b0:ae3:8c9b:bd61 with SMTP id a640c23a62f3a-b07c354fae7mr53944066b.12.1757624222769;
        Thu, 11 Sep 2025 13:57:02 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b07c28f190fsm38775366b.39.2025.09.11.13.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 13:57:02 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 11 Sep 2025 23:56:56 +0300
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845-starqltechn: fix slpi
 reserved mem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-starqltechn_slpi-v1-1-93ebf951a932@gmail.com>
References: <20250911-starqltechn_slpi-v1-0-93ebf951a932@gmail.com>
In-Reply-To: <20250911-starqltechn_slpi-v1-0-93ebf951a932@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757624220; l=1069;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=3/RgRAcFV2NW0rUq1O8pSUOarRj54QaeN5/ojlVNaE8=;
 b=r49EsUNrjWPtZZoQrQ5ZDJdhA/iXH+3jXbgBpvJhDi6VzZKIxfYF7ar34ZX5QtZVE1HAIpRJm
 SD5KLWof2lqAW2ZPaBVxsi7wHs6XHrnGwhBUd49y5OlxYCRUKZdS8YR
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

When adding adsp reserved mem, slpi reserved memory was shrunk
according to vendor kernel log:

`Removed memory: created DMA memory pool at 0x0000000096700000, size 15 M`

However, kernel refuses to boot firmware with 15MiB reserved region.
Increase slpi reserved region to 16MiB.

Fixes: 58782c229e3e ("arm64: dts: qcom: sdm845-starqltechn: add initial sound support")
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 9eeb4b807465..32ce666fc57e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -118,7 +118,7 @@ removed_region: removed-region@88f00000 {
 		};
 
 		slpi_mem: slpi@96700000 {
-			reg = <0 0x96700000 0 0xf00000>;
+			reg = <0 0x96700000 0 0x1000000>;
 			no-map;
 		};
 

-- 
2.39.5


