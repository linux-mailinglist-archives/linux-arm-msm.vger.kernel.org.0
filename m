Return-Path: <linux-arm-msm+bounces-48613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE1EA3D39B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 09:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F39A175B15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 08:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9F51E9B1B;
	Thu, 20 Feb 2025 08:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LQeZ4ApO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1CD1DF962
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740041387; cv=none; b=rY5mkOUKmZr9/WwM6VDKulXSVZ0Js4rqgx8eBtD5M0h9gYZuNK11YHwNOyjSwODYSJ8pZFrWDNFuUtVG36XtkGdW7LdMdmF46TMM6TvBSDUCySV1cFH59GKKgUkvTGRqCsT5ZQKHb2iUqGcm8wrF6QRmyZxdVbYB7ijczvwTrzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740041387; c=relaxed/simple;
	bh=9GRQle34YcjfgiWZwko3yDvtJTlH367rXx3Cbqx4DF8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UOJvz5N2s453MR8CKeicTqDR40vcwpQUzybp6j45kaZNRkfSqM8FqEJ0cchqKrbmtt0KMvC01sYJ+7tdvHAJve31NuRorMqqcqEIgSjIEX6tCOXbxzl6zGwlLx+xM9gO4MiYG8U8ZhmSm7asb/7OLq+1qu4XRlVdKR2LjdAmT5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LQeZ4ApO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38c62ef85daso51819f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 00:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740041384; x=1740646184; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJjAYRgPzkjQ/gM/tfY/GlddEkfV8+B5j+nIT1URPMg=;
        b=LQeZ4ApOCQ3619Zpt4UAlO5BsMvylwfiFvzUv3u07AsALu9iH7RjjYGgtCAGRbBENl
         0qtlqC+Fi7C6TnwtJA8dct4+rUmE/4Y/ZXsRoJjGeXlvuIHAZ4xSC/eXipuh4DK+Z6qJ
         SbloEXesOznX7JijPtAtVN7H+gjamE2sLNPCRDFOb6LsaglwsB/5lwZiYic/fa4p/y1d
         NsdQKTeEwxM5UAFlVL6y1YqvOT8Htf6CfX3JerUE1ib++EZaaaGhv3sJJw5sSpOwxMd+
         5LthOLjj1rnwAogLeJuRl0lmGJSAsVB/h/tGrlvK+tTDPtBYLNoLgBbCTIZki4kqn6jE
         sEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740041384; x=1740646184;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJjAYRgPzkjQ/gM/tfY/GlddEkfV8+B5j+nIT1URPMg=;
        b=eLPXDB2ziowhJWMQQGO7OCcV0XmDn28Uv89qW60AsqEuf7wfnIt2Z868UsWUBrmXs2
         X2rKzO27aEDoqA7mVHSD3sMDzGakdCRPB/g27rr7kmnoFWhLHStJ1tuO69yOkm6K7ZCK
         87SEQM/QqOonQmF7wDdQVcK/Tmu2uGBJQyLPoeCHkCNXI6K0WR+WihM+wMzgJSXT/wiQ
         mtpMe3Vi+d+zK602uFwjT6hmc7zUjgqd1Fz2wgozXCnsZrl3J6ZPrK+GAW1CJzIVeTTq
         nUszR+r0xSRipSGOPI+DPC6tQtk6R/BVdH+WZHF8xVfu6kvUaGvIK2pSUwKFylZ/erDs
         Kv/g==
X-Gm-Message-State: AOJu0Yzh6YZrIHoHHzfGHgHlLUjLfU86uKdmIdHGNoCCdIjNF5A7H9Cx
	T4zODKEYhzNqWhM7ZJEOJOxdXP9AopfBeq5B4R9tnP3zJCClMTv19qH/9708Jdw=
X-Gm-Gg: ASbGnctxL1glvznTjL4LMAyRKFkgYWvAka5+G0E1hu7macXuOykhr91kseRRaCrS6jI
	ORZ7p8OCS7RkGZQPxxpPtU8kD4PO0/fcTRg4rNzeD0gWjwwEEGdEqgyceDHCxc2jRUfoxKiQWTA
	mQfr8Bo7rZ/4jbH2xxxPtVFa4J0TWIsrjlJlWcDCldSj+W817BIv1F0230dL2A2em3jG/8OtoQY
	6UdofLCqTx1+PgUApYSBVSdXoRwxiyCEkDbHh/fo2JHuWV0HAhb29O7ORj5YW54TSToWtwSicqa
	2TeWmYiSEHVYI9fRxUWqxZgAkv7JcNZOJldNrqWLuhJW4LtkZV479pqnJMH8Y+q2
X-Google-Smtp-Source: AGHT+IGlrjw3yzFug/Hb4OGULJMWTF1gWp98xewA6c7xrzvNNBzktDK7efl8Wrgxer7Jqlz1DFDcAQ==
X-Received: by 2002:a05:600c:4f02:b0:439:930a:589b with SMTP id 5b1f17b1804b1-439930a5a88mr33223935e9.3.1740041383895;
        Thu, 20 Feb 2025 00:49:43 -0800 (PST)
Received: from [127.0.1.1] (46-253-189-43.dynamic.monzoon.net. [46.253.189.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8397sm234417565e9.36.2025.02.20.00.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 00:49:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/4] arm64: dts: qcom: sm8750: Initial audio support
 (not yet complete)
Date: Thu, 20 Feb 2025 09:49:39 +0100
Message-Id: <20250220-sm8750-audio-v2-0-fbe243c4afc3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKPstmcC/1XMQQ7CIBCF4as0sxbD0BbUlfcwXWA7bSdRaECJp
 uHuYl25/F/yvhUiBaYIp2qFQIkje1dC7SroZ+smEjyUBiVVg1IpEe8H00phnwN7MdRkxqs22qC
 GclkCjfzauEtXeub48OG96Qm/6w9Cif9QQiGFqaWlHo1u2uP5xs4Gv/dhgi7n/AGVowxNqQAAA
 A==
X-Change-ID: 20241022-sm8750-audio-d3e7fb676716
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Melody Olvera <quic_molvera@quicinc.com>, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Hi,

Changes in v2:
- Use 0x0 to match rest of sm8750
- Re-order some nodes to keep preferred order by unit address
- Add Rb tags
- Link to v1: https://lore.kernel.org/r/20241101-sm8750-audio-v1-0-730aec176459@linaro.org

Dependencies
============
Depends on: https://lore.kernel.org/r/20241112004936.2810509-4-quic_molvera@quicinc.com

Bindings for these
==================
All DTS added here have corresponding bindings, on the list:
https://lore.kernel.org/all/20241022064238.22941-1-krzysztof.kozlowski@linaro.org/
https://lore.kernel.org/all/20241101170309.382782-1-krzysztof.kozlowski@linaro.org/

Other bindings were already applied.

Description
===========
Add necessary SoC components for sound on SM8750: ADSP and relates
blocks, LPASS pin controller and macro codecs.

This is an early release, as I don't have sound yet fully ready, but
speakers and DMICs work with these patches on my WIP branch.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      arm64: dts: qcom: sm8750: Add IPCC, SMP2P, AOSS and ADSP
      arm64: dts: qcom: sm8750: Add LPASS macro codecs and pinctrl
      arm64: dts: qcom: sm8750-mtp: Enable ADSP
      arm64: dts: qcom: sm8750-qrd: Enable ADSP

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts |   7 +
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts |   7 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 342 ++++++++++++++++++++++++++++++++
 3 files changed, 356 insertions(+)
---
base-commit: 9be34b68f9b3a5990fddf4ee5c1437be454d7fcb
change-id: 20241022-sm8750-audio-d3e7fb676716

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


