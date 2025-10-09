Return-Path: <linux-arm-msm+bounces-76574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD1EBC82F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C93F3B8C3F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718CD2D7D35;
	Thu,  9 Oct 2025 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mHY5HSxo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D142D7DE3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000811; cv=none; b=a7tgtT0KqUueGR3fDtiLb3JeGS0DGPt07GNlk7/RxykXusjyfKwEapsdkBVsfJAJz2qYoN+j++FmN1zCP7Kr8uqiMwMCty502OZ7DExSkyaqrG/OGg/22OtvNMRdJObl6j7QLVWN3eZoQPYYLsHNIdGQRb/qB8uumcVOErsJoSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000811; c=relaxed/simple;
	bh=KxhWShlkMtnpgvA9wjVU6mG7t9GuRy+dxnd6ohchwik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEpvzYVJT9jUUtsdIhwJE2kPCe5jHj6YtdVUkp+itk3KoQUEB5jqnXU7mhCa5AzaLQJ/YH+SWN1c/Qd1x3Gqi+SL8OLvClH6GpevNzFKtvCEgbnnnFSBojx9RleLuNQ5zn1MqK8hz1KWea3PdSopLTxuulwO86CQmLu0D6YsM8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mHY5HSxo; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-637e74e9104so966808a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760000808; x=1760605608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOPGlZMdi9oRl632ND1QurYAdEQ/NjrqBwEHEKFq9ks=;
        b=mHY5HSxoMIr/iJDPAmDaWHY6hlykl1nXb2pepwMYNNCLH/5mbUP1dEvoP5U5E4oCWf
         WP/OAtMPueR6zvZr50kBGNy61e0K7+milgJgoSS3IhYnN0wOPbhXlHnNBVSYaYVUYfmP
         LTKm+jlRlQFGiL+eOp3I++mlOdogI27qCNHgj4bFkt3NHGFbyN3qAsfF7/u09un0CStT
         xeMgpapEtyV9Lc8lNd4s7j+2pSg6ZS2BdLMlUlDBsrYG9t6OlGJJEcQ4RbXoej1J4dCw
         CfFk2aOfXhuEhjnjWNC6WmnOHwOKWmbeqQN/Y65Wv4ucz297gWDVT/Hu62D6LP3Uh6lQ
         uydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000808; x=1760605608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOPGlZMdi9oRl632ND1QurYAdEQ/NjrqBwEHEKFq9ks=;
        b=g8V4Oja4QRX7xebEjHtd4XotGw1nSIKHWuD6TTuesv3+WBAkeCALl+dATB8Iqpg/5v
         vT5gB5yv/GFUTuantcuzRoTBzQ3eFseu+BqSbzgnns6IXBoOl3Z3MwQsbWV8ouOmUSXy
         NnEGf72Gb6nwZ56tVOEz/phjgITBe1Qu/PnDT4f8qaKwSpEtyWfKCWBkIzEq2FbgAT67
         bDGQup1GVkFt/YxCD6I8J7XHgwr2SDMng4zP/zBpoWhszDi+vgJvnv6MB2HMFqKmqVAG
         s2vMKp0z/KYKt4bmDUGeiubTmfFyAeDqNPpYnLEvbjcSj5M3Y+B239AHTxZT6OJPxaXF
         F3pw==
X-Forwarded-Encrypted: i=1; AJvYcCXD/j+sClAG/stbF3n/MytCyg0CyFH5MUVLIIulgI73WXGqW23PeInMMRjkPYwUckf0soX7FD1EFVQ1KrHE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz80PeGs6fJBk2NtdEh2FqKR0atrLOj/wwuE5CtnjSJiOWwBQr5
	w19ot8tVpYykQFGPfR5oVWD9n4FGp3j5v3gWu7kyjWmffh2JBrERPERZ6rY3zM/ck+4=
X-Gm-Gg: ASbGncv0ENJFQT1/cg91EpodlFflhbvRvctFuvWqWDM0RzuULIUJi3arOVAaKKDkSnq
	rwqkPAgkNwKvmpv+xKZvvi8FKwr0Z0rW8oo0SkHMFv+tQO5SEZnfc2ZfxTorb3AKExzEmXOaZyb
	elQkq0hNisNXUB+253Twl/z11WoY0hOVAIjydyJmIG24I8D/D73BzS+T7BX0YiTRT72pMapRM78
	zyv0nR9Pallvg27Zy4nfcrDeQVvT8WXSz5ZIz6guSr6xLpJ0VVrCNClKB/nLtQq3z1pwD+WF5Xg
	aEmJNGDFDyhmHvEA5LnC1qsvuih6XX/9dgOG/eA+sMjbsMyIlbyEm1482FSLIj34SY5SR7hPFL3
	9Hgn9+WBYllkc8T67Jfzqg+DYN1/9FveNjXbeknXvJ0zx2wwozJFm0Hr7JtbuoZCczV79LdB0rq
	uHR46RuHXuxWYIXIecAw==
X-Google-Smtp-Source: AGHT+IFHCm/dEaK50EAVOzvdljY5VuiyPEN2smCFmrRrLPkfy8suvXNEKkRcoKJAFNBkFgvYS+lgbw==
X-Received: by 2002:a05:6402:d0e:b0:634:5381:530b with SMTP id 4fb4d7f45d1cf-639d5b8956cmr6102646a12.13.1760000807576;
        Thu, 09 Oct 2025 02:06:47 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f4109046sm1905755a12.44.2025.10.09.02.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:06:46 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 09 Oct 2025 11:06:33 +0200
Subject: [PATCH v2 3/6] arm64: dts: qcom: qcm6490-shift-otter: Add missing
 reserved-memory
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-otter-further-bringup-v2-3-5bb2f4a02cea@fairphone.com>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
In-Reply-To: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760000803; l=1053;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OCp7Rwq6dXcutSgzEgmD5mLRNx5n5slwM/FWE/OfkjA=;
 b=+5zFyGY2k72voxYJC+mcK4IdqLYco3K+BRC/ZE5ickeG58QeQ3Czn8qg7S+adNv9qW3LhsW5C
 BRUAMAhdeKFCVqPOtfPKebyKMjChhjY2c7/OgilVR875VwiNVkhi27T
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexander Martinz <amartinz@shiftphones.com>

It seems we also need to reserve a region of 81 MiB called "removed_mem"
otherwise we can easily hit memory errors with higher RAM usage.

Fixes: 249666e34c24 ("arm64: dts: qcom: add QCM6490 SHIFTphone 8")
Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 0d331bda4a82..31650c29b1ca 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -118,6 +118,11 @@ cdsp_mem: cdsp@88f00000 {
 			no-map;
 		};
 
+		removed_mem: removed@c0000000 {
+			reg = <0x0 0xc0000000 0x0 0x5100000>;
+			no-map;
+		};
+
 		rmtfs_mem: rmtfs@f8500000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0xf8500000 0x0 0x600000>;

-- 
2.51.0


