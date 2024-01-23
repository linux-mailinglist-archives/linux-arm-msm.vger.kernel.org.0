Return-Path: <linux-arm-msm+bounces-7925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F0838CB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 12:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 636B9B251A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 11:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6B85D72E;
	Tue, 23 Jan 2024 11:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="umG+KiZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5C35C90B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706007717; cv=none; b=qx+02B+g8R5sZVC7gY0d8i+lPHIoX0Lzbp2MsKtvCY0ZfXv4+ni/M4s6pYBL+sGSngcQAGhB4fh5lOyAofRJDa7jXdWNJkxPQDLLBTNaY0Y8t91Kufd1z5bfLP6AsIzNQ3KqJO0Xnysum6mFp5/hacVMnjKtyYMQK8dh6R+Rdvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706007717; c=relaxed/simple;
	bh=50YAMmOYJzNisU5yZg0uYU/wS7zYvX4umQW0cCtPrCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UqgXSp/Yb3yuU7YohBlzg1Y3pnsg8OwGWbPoP41bFdXRmzAHBKiJV0OyTvz+ViwpjQa3p6yAFS89dqgqSPf+MiEcC8jW1gnXv8bgyPCAvZx3nMirkZwG5gUiMSxNKhlpMfR9W91iv65U55/ev+h9DdHA+fVA2HUX76rRF78YVCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=umG+KiZC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55c2c90c67dso2440708a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 03:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706007714; x=1706612514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNYUIgDvOBG1nDWJh0kXOFeqoIQY7BdgluW0bM1fVK4=;
        b=umG+KiZC3rRCbsznqLeUY+f7lIzo08wEQNdmdbUbSEIJfCV60PkPkzWwhukU57Q8q8
         zwC7x9GEKhI9JJL2aEzrALjVYgUTzNrcUcfRZV8jTtqMcVjAyK8uoCsmeU5Z28PnjjYy
         DeiQoN7d/CUNWQLq+A87Nrrg55+zNyB/vCBYYLnZigz4APNz7Aidwub8MSTCvo/lMlRs
         0RMKeCsl52LvS4eqsV6MyMnmmnTRHSgC4cb7avGuLYSOyxkNu7SE5LYCfi0uWv/FPaZg
         +6zIFCS7XUB4z+qW7pARpPj6+rkGqPCMjZI6kLVBwUrtzoWbsO505Svcp3yeILIvxFlb
         zklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706007714; x=1706612514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNYUIgDvOBG1nDWJh0kXOFeqoIQY7BdgluW0bM1fVK4=;
        b=iRqtLCFsEPr8DY2DsznstpBCAmo2X55vQJ/Ek5O94GdRtwhXX8PjUhu7aZSgIhq4Yl
         JQwQ+qPVukeoT4C3IqkDaopwKxs3+MstoczrLxzjYy8ytUuDxV7cFwVgj4FcoTL71qk6
         hXKI6PwhE6OdCqrQ0qWq+MYThP8Wh3gmtljCJSgWGkGvqScV2+swP1OWEO+DqdLYSO9h
         Mo17czzd9g6kZhNSaWHuCjPGZK2kOKgYF43vWJn/Msz4qXcFZ+jUsclzOlLXtbc8Zj2C
         rJVrZM2N3giafBguouf9h2/O6Vil7dMqdMesPEmRWmR3b8dB7Ajouv1NF/At0IzJrGyR
         Le5g==
X-Gm-Message-State: AOJu0YypDrLfbL/7LmHWtmwMyKQKYGlH+jmlFJWpS1X9OdHquGhwHn2/
	eX1Rcs8fbrjNXCf+EiB38/3q+DwH1ZL+B/EIy/icLHAtnKGkPofRhNuYlDBGMZE=
X-Google-Smtp-Source: AGHT+IG6GiPgvzhcDFmsHZG2F8SNYJ1Lt3Yj3ROJb2O6QLFtgCeyrrbABMF9oeclecS30vq88eDgsg==
X-Received: by 2002:aa7:c887:0:b0:55a:34e1:4d13 with SMTP id p7-20020aa7c887000000b0055a34e14d13mr765839eds.17.1706007713761;
        Tue, 23 Jan 2024 03:01:53 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id fg7-20020a056402548700b005593c83bdafsm11430074edb.45.2024.01.23.03.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 03:01:53 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 23 Jan 2024 13:01:15 +0200
Subject: [PATCH v4 01/11] arm64: dts: qcom: x1e80100: Add IPCC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240123-x1e80100-dts-missing-nodes-v4-1-072dc2f5c153@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=B6cUt3TzJgP69BQkJMXOG1vdu+0w4ubweb5duiU79oY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlr5yRXb874h4KDzLbsn64jXcTBlCmBhebxizTC
 +eVufR0MXOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZa+ckQAKCRAbX0TJAJUV
 VvhJD/9ARJm+1Jun/5qh2snlkt3fLwhwF1aiN6PFF4hm/EjPQLFhNZDQ236NBUnp8NspK9QM23+
 T57mBAJCjFnjRR8AX4X7OOPqxh1GhTd5ijJAy8wgyUrJo6H1I1t4MNwpcj16Zskr1eyknj9GH52
 1LqqbhAHklyeoTSxIL/ZC8uq3O2EjlaOIGr0X664HK9gL3IHlDrkS9JePPpmuqvk14PjLxdo6Vd
 gq1sIqsKjduKhbcyxQK9ryc09TQ8CRQNLp8sE1Jhv/2rEykx+4wNC9uTofvHj5wVO8CQAHGjuYN
 tXBTjMmy2yL8M548XZaxMY+x4XbTMVqdngm6JMgB/tnBks/XJSWRJRj7FsQVoy+eogB6HZP2fRC
 UHpVXgAQTtXuSbI5O5nBZLtyBCjKp5BssaJ+odCv8uKdUfDgAPHNsT8oQyq5uD+70qLfh4BqA73
 NKwcrR7mwn6sq6xZsz/W5PbTcsY/qWJi3LGppzFEtErEC9E6KhYXoROuhVJfHszeY/Q6eiAai/f
 0BwwS/FRt8w9Hl+yFVfn0K5GfYLpRq5UZp+b3kckGXiprfbqBOysSjpum567dezKH0TCm2Gl4jK
 2yTwCSxpJx64Z+CEPW3FgG7RuSP7PzP3FPH4VDFB6iZuSUVSt4ELzl3Y43d5gfbipBhzg9U/1z+
 l1j8Z3W/J/EqM9A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Sibi Sankar <quic_sibis@quicinc.com>

Add the IPCC node, used to send and receive IPC signals with
remoteprocs.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 6f75fc342ceb..954f2bd9b1de 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -691,6 +691,17 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 		};
 
+		ipcc: mailbox@408000 {
+			compatible = "qcom,x1e80100-ipcc", "qcom,ipcc";
+			reg = <0 0x00408000 0 0x1000>;
+
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			#mbox-cells = <2>;
+		};
+
 		gpi_dma2: dma-controller@800000 {
 			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0 0x00800000 0 0x60000>;

-- 
2.34.1


