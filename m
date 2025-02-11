Return-Path: <linux-arm-msm+bounces-47573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DD7A30C20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BFD1188AF1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 12:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBCC21579C;
	Tue, 11 Feb 2025 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wrqtQpaw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3C321423B
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 12:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278606; cv=none; b=rJ/HdEHN1nH69FXm87dIrN2DvrOIyH3pS5jRXwARZkAfEAeC0GEiFO+cU6257uHOaNahU6vg/GDV+w3meGYaKzGJOOQZB/vzX4ZP67eIOfW1Y6pfDY6rClmpwUiAFVwNQkqUJZffE3tmhgh9+smS1C6VUdXdoRyc+pEIbz85n4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278606; c=relaxed/simple;
	bh=l534KaQHeipF5HnCgvu/4eiMXBXhIzMa6xV85UpDLN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U52l1Mx2/9dJFODJY92SUYgtpIPIK/gK9vUYDREhHOw4a5n7QkW071QGXhpTOZHz8HKXdikYQeNKlsFLzbJxPxbiSLrlaKltBE7stvwQ7Hl7lQTXWdyUgxa0HHQe+eaHqU6FKld7yXeX5NU6EBySeBoOnhKV3+W35DLNDP+S78E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wrqtQpaw; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38de1a5f039so1582217f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 04:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739278603; x=1739883403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2QbcPrM7Nmj9mrvDTmLOeka9cuKDtzuzeQZCl6bz48=;
        b=wrqtQpaw9W+5V+yic2UWNcITME9hd7f9FtHXPXNb4h1QmniNsf0dbpGb4FfXDPiiwy
         /6ONFZ3kIr8L1EP7QtUc4YqV5lHTIWNatgwM5Sj6qnrJjdAqZg5tDR784whB3Cffiooa
         zn0x4f7mCrvqMORikWiCBfKL2Mn4g3pGZhHzoFtpzXz0PsnRnPJh1YOIwKmVSPSPNfP3
         2xh0WZa/nF4u4/rEo1rke1CnVPUjFdkpVMxgQWQWC0nO1fA03Tv2V1Amx2+4xwpDUq5h
         vYbH3UmtTmHYne7kgsm/C9M4f8SAhCg7xTyfVx8OfzL4sNGXOu2TZlzM6nnuJ6Uonp/Y
         H/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278603; x=1739883403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2QbcPrM7Nmj9mrvDTmLOeka9cuKDtzuzeQZCl6bz48=;
        b=K6kPrOblki2HT4d3PINp3940smMHwszRij9CEUf7yy+DEdNJ26mB1X9HLQLZxsFNBn
         U/+1qQQqFnod7sfoa/CUOjoxX5KeAgReuaaua0CumjfH3WviBRzWRRURQah3dsKFlrPZ
         UtEnqdIGJ88wMw00qdxGhdsmCvLhDUqJy/rFRNf8XeOnzzMEKtEjPhAF7SamwKn1dQJ0
         xQX9mOA7i0cVAJNCn7QiABM5qVRrXHD44YZZHnCcfQ7FFtzWNkjdI6J5suMgC5Kz0ulO
         mTOCXcr7+4fypkewZZKq3feTY5IQ07Q6Jmd2YRXGcyyVjd5wzYktsAERvUkE0olCYCXm
         tGag==
X-Gm-Message-State: AOJu0Yz5wBKOgrwlyM668FF3dqXXLRvXUDstuPWSc4hiQ77ndej5xgOn
	fIq8Yn935GpzTsa+jWIq00lYKyF+AwO1N8FzUnOaHJiWFI88q9Jp473lmjfZQE8=
X-Gm-Gg: ASbGncs67U+u2uxT5iJUAefTlN6cnRwzYUjTCJyYswMxVCWQpg7EgGKKekCPGGabcdQ
	zH36nP3DOx5jskLM96Vd3E3KQBpEeDBQZf4xedYqCKEeqsYl+5oiHd45pqNlNZF346kjCGTc04m
	8nxshndLxRCvE2wnCxCSJ9bapMhQU8xJE3m5gnT8AU70q9eGwLkkGE6x+bcIBExxBnofU4PhLRk
	pnkk2O5RLh/4pE2jVf1tl6b0uKTLrqmi8JxT7LK4kqG/Mf8She52WtE8dJUErcupHD8KcKQ3wFP
	k3l12hhsVo3gEEahgS6WJdhGKsi/WrVw4jJY
X-Google-Smtp-Source: AGHT+IHD1QJbAHIFOi1zXgE+3bom7jzBt6ncrstR3I02jDJ8eFFbcBVdMba2lvkCnyM01hKAEwJf9A==
X-Received: by 2002:a5d:6d0d:0:b0:38d:c087:98d5 with SMTP id ffacd0b85a97d-38dc8da6713mr16029317f8f.8.1739278603311;
        Tue, 11 Feb 2025 04:56:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc73c2e00sm12863078f8f.57.2025.02.11.04.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:56:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 11 Feb 2025 13:56:37 +0100
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8650: add OSM L3 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-topic-sm8650-ddr-bw-scaling-v2-1-a0c950540e68@linaro.org>
References: <20250211-topic-sm8650-ddr-bw-scaling-v2-0-a0c950540e68@linaro.org>
In-Reply-To: <20250211-topic-sm8650-ddr-bw-scaling-v2-0-a0c950540e68@linaro.org>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=l534KaQHeipF5HnCgvu/4eiMXBXhIzMa6xV85UpDLN8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnq0kINvkPdj5dtWSiZ70NKDNYYOSYlXOvsSqM0zXd
 l7PHiO2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6tJCAAKCRB33NvayMhJ0dS3D/
 9gts9JzFlQEOcgzU2aiWupKifV0nV85/hjzqNcgJZSBEPYKZ8SBa9pw8YiquPCflilhrRJOawsvxiw
 ZRzVvrzdeW/fwcDPkL3r081BfLSlgxpfBOznA0gjXvZHMe1vAeuyU/3mxp6PPCKtV3OxoKwRdQ3AWn
 JxvT9AMvh+KUNZY27qvtHEmYQvNnl9rWlEa8RDzrtA2qc3TNf2zTZVjwsVPg+Z0MvmUKeAUzjSFlYW
 rQr9eXx9kubCE1gq9tdOXAVDqRLo2ONiVbz9Ou0u6Mmu4mr9heCsJEo9HaT6huF4O87dKGVkVX+kc0
 Nzqp7gfIfQv/qS/Sjv0RvANP+y/SnV0Bc1TF1AXpDnRZK0FDDehYBD4GDqEIc1cAISYFNeUICc+Vya
 I9swqEimSh5wyyFjsjo+vn++LpE8TPND6VAOME2DKYOkqgMMI42UGMiPKAhqqx0Z5Of4NiTOIUifi8
 Kg7SjlPfz4Hnsp+nTotz2vtgKjUqVPVE7BbZKeM88TG6yPp0Y/yFnVCElAosatq1yQFacwUOukiZyP
 20XqpXWnrCFU3MsaVCwFWGKZeDeyi2beqAn60kL4xww3bdjrQPf64Ux1IzlcXpP5TFvrSvreICxc6c
 /KizIOVheS1oEEYrMW+83iX9nivKlHmsldm43sdt9ljb5d+TNIZdCOblAHbw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the OSC L3 Cache controller node.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..bc09e879c1440873a52daf3fc7a38f451f1f972c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5506,6 +5506,16 @@ rpmhpd_opp_turbo_l1: opp-416 {
 			};
 		};
 
+		epss_l3: interconnect@17d90000 {
+			compatible = "qcom,sm8650-epss-l3", "qcom,epss-l3";
+			reg = <0 0x17d90000 0 0x1000>;
+
+			clocks = <&bi_tcxo_div2>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#interconnect-cells = <1>;
+		};
+
 		cpufreq_hw: cpufreq@17d91000 {
 			compatible = "qcom,sm8650-cpufreq-epss", "qcom,cpufreq-epss";
 			reg = <0 0x17d91000 0 0x1000>,

-- 
2.34.1


