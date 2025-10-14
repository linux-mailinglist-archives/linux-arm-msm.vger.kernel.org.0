Return-Path: <linux-arm-msm+bounces-77084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E91BD74AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 06:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 32906343C72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 04:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81ABD30DEA0;
	Tue, 14 Oct 2025 04:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZezoxSMQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F4D30DD35
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 04:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416969; cv=none; b=T3cUgbH2V0/szcQhhMWbujrETjogAJ2/hv2ygu4Rmp9QwGH+5p/bEBq8eaLNieEtyjtP+HdEKLFAvnJXz62iXCad/DL9A+If21NOwhVBUpeLRXpIJHDglqTdG7cGEAiyIhiwR5lPS41vAm7HkER4zKq5ImfIyx6gJTsnjGYIWik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416969; c=relaxed/simple;
	bh=isCQg2Qmxa9ipukkV50sTI8P8heS155Zat21GVABUs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nFXU8BjrDLOBavHch+xj387Fb7zFJa+ZkcparWqgvvC2frfQ9kqZ+bsB8VCJcCmhpFVpDxYHTXoNq2BGRTn5rSn1qMZn+2z+1a1uyvwIffvaVx48kFSkpaQykwgGM3GzSZddlMOdn3D/BD6UnTCwMauHgpVUPkvTZxp8PMUbSFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZezoxSMQ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-793021f348fso4453959b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 21:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760416967; x=1761021767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdehfY3g3zjxWma/hGhUnMxogBhAstUttJRuG22ztsE=;
        b=ZezoxSMQfVQTYisSNqoIJYa7PSe+sePD5iG2SLuEBg6p/jYCNQ6QoxV+KMmB2qsCQ+
         YJ0ABhuB5QvXwvtC1Q6DHmiqmXlKvc3+4EmiP+0FY+xSFlGHgzrddyvpavxo4djpZqbP
         lal8PVygauJtNBJ3PTcQ6e1+6Ly9qLWPrHhKCN13CPPtYW8j+NY6bbJwpn1Y6H8owno4
         k46HPOE0pzNSF4LCgm/3lXN/4s914MK1eecCw+DKBvOf6QBShTHyH9MWOScm+iAHSN0p
         YzlJeLZGbITW1AZ9id83ij6xHsXmvK/6uimXEQbLJ1EHLpBOMQHlSDVfRwgL2EnHgmYV
         8A0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760416967; x=1761021767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdehfY3g3zjxWma/hGhUnMxogBhAstUttJRuG22ztsE=;
        b=Pqef/qZu7slnPFFSQCkSEWXMR5ClZxxG60MFh8P8h0kFH7Lv4VDYaB84j1ZT4uDnju
         1ob3LL8gb6DTv9mtBgtC6FwlUx0LZ07Ga0qRxUr3PaR+p4sDbuU29d2DCJAaWs+zYphX
         dNKfCoE63KliS3Kdyu0PZNKRvEH+oG2P9/eGIc3MLtURKOwhU19GFfh/kZBbn3IHaz/U
         tt5r1RGIY1bcU/yB+EfcPa15nTAigsVR59QHTqjA7ASi252Au5tYXCOaJN+bHfkv1r9p
         GqWq5/4vm9zDdntI/oUKWa1oKPKnlt3vruBJh5WWovJbvjKf2j3DjCrhmavFGaA/2Uwa
         uJGA==
X-Gm-Message-State: AOJu0YwLXDKS2/mZcs6u3Opb92wbaajU8epMAw54C6aogVBxICLcKxzY
	LM27NNxWlx4iNyagbpJ2xMCO+Oz05wNesha0dJugHbxB9E4Ze8svwK6D
X-Gm-Gg: ASbGnctM+fbNpWILsk8dMPu1ss/JWm8H2+rFgpz5v/+iibVncQGT6qkJD8BadlHWJVu
	tOZckBu5/ER8rmZqHkhukLHvnutWcc98od0zt/wrL7/8zcYFu59K4SWKhJTYWMoZpknWp2oxcYI
	sv25JctJ9ucm7s0mHuC0df63wP9yvS0ycmDdB9uVlPT0RfIZ4n/8kYBcCF4w9ERa+3AGokl4Ucj
	NcxULXjgmWSO6wT0BvphAajQFEhwDlFTxdgAlTYKWdp7XUmGwvg5T6HZSfX3fYzcQBnBbOcvaAs
	kJIT6DBd+p8aC+337OI9zwMN7EqnnitWqWtINxM2rGIPAhBgOlyIj9/8owoZLsISpa5bh7TP0I9
	yHt2RiiXggH4j4w5klYNY4MxRUEgHGXLBKmLE
X-Google-Smtp-Source: AGHT+IFVo7nH9HmOWaQJIpTOa8xxtz0naCajk8mBW0l5w2WcBlbPqaeuoOio18OCz3U68lcFPbDpDg==
X-Received: by 2002:a05:6a00:a14:b0:781:171f:df6f with SMTP id d2e1a72fcca58-7938762f586mr31416228b3a.18.1760416967419;
        Mon, 13 Oct 2025 21:42:47 -0700 (PDT)
Received: from archlinux ([177.9.216.59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-79b65528a51sm8440684b3a.85.2025.10.13.21.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 21:42:47 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: qcom: r0q: fix reserved memory regions
Date: Tue, 14 Oct 2025 00:41:35 -0400
Message-ID: <20251014044135.177210-7-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014044135.177210-1-ghatto404@gmail.com>
References: <20251014044135.177210-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ADSP and video memory regions in SoC dtsi is misplaced on this
platform, fix them by deleting those nodes and redefining them.

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
index a3b81403d180..8ed8a67aae0d 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
@@ -10,6 +10,9 @@
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
 
+/delete-node/ &adsp_mem;
+/delete-node/ &video_mem;
+
 / {
 	model = "Samsung Galaxy S22 5G";
 	compatible = "samsung,r0q", "qcom,sm8450";
@@ -64,6 +67,16 @@ splash-region@b8000000 {
 			reg = <0x0 0xb8000000 0x0 0x2b00000>;
 			no-map;
 		};
+
+		adsp_mem: memory@84500000 {
+			reg = <0x0 0x84500000 0x0 0x3b00000>;
+			no-map;
+		};
+
+		video_mem: memory@83e00000 {
+			reg = <0x0 0x83e00000 0x0 0x700000>;
+			no-map;
+		};
 	};
 
 	/*
-- 
2.51.0


