Return-Path: <linux-arm-msm+bounces-8421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B5A83D851
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 11:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 901BCB3BB81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 10:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403145B5A5;
	Fri, 26 Jan 2024 10:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3p4HPI9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747FD5A7A2
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706263242; cv=none; b=Wh5KjXGr0jrpl3OAjzliAbQQ9xMO+97WMiXmRosnta2L+1KGN0c0ktQDlZpXqiQ/6ipMxdy9ZZuBAWRMe9huj04hs7/aBQrHy7eNU1Fsa5mYe2UG0ew9fzNp1Fs4BiR5mLBSO7iAALHaUdw4Gp3uibXjQ3RypmN0iaEOsfDoqPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706263242; c=relaxed/simple;
	bh=TcSH6PTQ+XJnw7PPfCZDpuCKVk8yXAt9SaMXMBrCZkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HCerv0p23bKjall5YFoY3k2wDNbtYpD/TMPoVHkQYt/4wgGS34vi76CDT5Oi59jfoQ/SKL+9qHir7j7L5djEEWV0d1LHCuNkxR9aR8rq/5Mm4WVUJOQoFfT1PP1zC+yO83koSkrM7P5X50bvqH1yhQcotoT4xTtnROHT644+0r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s3p4HPI9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-338aca547d9so242263f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 02:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706263239; x=1706868039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYDA92LfZ0itUlh8YMaZwnv54pbCjg8ilHywXWo7zrM=;
        b=s3p4HPI9B4d1cXAZPvM6ee1j8GxOdB9eI2yJRz2ZUuWhSASNYHZ65swKKGCbGcaRY0
         c9cvlYTjAnk7hrP2MSZwseHwGP4zISj6UVR0BTcgfHbtidu2JcG9NmUmjlbW6w2+CWys
         khJux/CngqyUY2VzappiqD9Kk2eu4AFDA3z0syDK5JlhrvZVcNPwULotax1UJ6jToizm
         Fo6vRCnzWhiCEBxhZLRTt0H421VGP3LlBBsFXI8DjuhbVyzlVUgmPe2YDM6b70mz5kLg
         r/DqPRKFFKo+J9ouycFLB68tK+ERkQIVGZsj2poWBG44otelEpLGfF/tuD0ekxdLh3GS
         fEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706263239; x=1706868039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYDA92LfZ0itUlh8YMaZwnv54pbCjg8ilHywXWo7zrM=;
        b=btzD+44mRaAwt2Ilj5MLm5w9KyVoa0l/1jTRS2jcBWVnpFFGnzgdy7fecp6gLxQbDC
         HIB+i5+YhB3vUfZ30sybuz3aZ29sRbyEsVDLYOQwhIAdE0eyM6/QFUVwKbziLEKfmbqX
         CrQ5vVXgoTjaYXRLvWO2gziTqAf1PRDgNSpbWZ9H0TTztBN/N34Ue9I7ZLam5WJBC29b
         Em8CnEmIju1KwcH4QaM8Swr+UxHgSPZRiN03sFYyrHAepmYCmDtbfpBEpsJu9Jz7My4H
         W4Ory5vyhZaEKvfVbi6GvSgYqh3Qe96EH606j0kNQKJdpupNmNGunGnu4lM9pD72Odsm
         F5ow==
X-Gm-Message-State: AOJu0YyRfMutn2hYNn9doKSHN0Y2+/Lr3LSHxXM9xwJvuKieYAdRUpCh
	MGXg2lJBK2DZ0ChAyio0GUeGauuQm5uRhWhmljpEOej5vSupY4rzicx/0B5CyiA=
X-Google-Smtp-Source: AGHT+IEWWv/d4nCExMUHtpqA/aJuSEywjj24celrCXAl1Bgnt2mFeYuxEb+GZk+LmXItVgkejkpsBA==
X-Received: by 2002:a5d:510e:0:b0:336:7c62:9ba with SMTP id s14-20020a5d510e000000b003367c6209bamr346553wrt.25.1706263238661;
        Fri, 26 Jan 2024 02:00:38 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id ox27-20020a170907101b00b00a3221b95ce8sm448494ejb.77.2024.01.26.02.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 02:00:38 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 26 Jan 2024 12:00:14 +0200
Subject: [PATCH v5 03/11] arm64: dts: qcom: x1e80100: Add QMP AOSS node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-x1e80100-dts-missing-nodes-v5-3-3bb716fb2af9@linaro.org>
References: <20240126-x1e80100-dts-missing-nodes-v5-0-3bb716fb2af9@linaro.org>
In-Reply-To: <20240126-x1e80100-dts-missing-nodes-v5-0-3bb716fb2af9@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Q8J4vtmwt2/riBkSH8HC4PZAyD7bl2d1ez2isASmfa0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBls4K3nkuAJXVmtKDkvftmuiPxe3YYj5p2WgIxb
 fGrlnnBPAGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbOCtwAKCRAbX0TJAJUV
 Vul4D/9Cxl6T+2Ggl+PMi3ZGp9FMslPiT3feAS5fL7kvprSlOfBKGDygza/pMkjJ65C8MZdvsBZ
 9fSBD84eKS0v/PYqcdb2DGsYPYo2GRj+F/A4go9EmmfG+m4VbuFF4mn2cOeYwcRUNrpiCJz2JL8
 MiQBlwE2qOAhYRTHa4XeD6yXaNbc+5h74UX7+uSyfe3PbiNVHyjuG1XcxlF6Rx2DAieLHuFdRE2
 ogetuCycLPOeZk0p+dkv/V/3lOSBdVWk255RsS+wypBX5vmF8IwlxNEtXqNUZ3VvvoJ5deMKDPl
 blGBtOis54eaWJ3GBKMPlVMkEhX3579SuuYawOjOaPFZy4MauZPfv/KSw5YpzooHundypCTY+6p
 f/mOsGF5qCf6Q9DGOtQjkvgfrqK6AUiB+PpJ0Ca9BHmvEWMzQ0mteMcKlagrcve9/BZTkdo+tLZ
 JquNOYQljG46y392fO7M1Rk7q0bxiAENF4y8/tkcSZIjcobb3hSRCjQgJC419FIVqoI5fjTW5Eg
 M25V3qIuAa86lcHgMEyEFqEnjZ6sCo48MUxSwxFNmSTt9yk0WV6c8k9dU+0Gh0h9tz8ClOEupnT
 YGr5wKXxaxrI7bypaOzonMzuLlYZAOeV6haVYrxTsm340jgl/99PZz4KRLzb19sWvhfoC6TASyf
 tp1bsO4roHXoPCQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Sibi Sankar <quic_sibis@quicinc.com>

Add a node for the QMP AOSS.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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


