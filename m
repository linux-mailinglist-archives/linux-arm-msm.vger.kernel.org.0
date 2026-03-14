Return-Path: <linux-arm-msm+bounces-97665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C7ODPLJtGnRswAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 03:37:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B48FE28B6B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 03:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A61E03049467
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F87628CF76;
	Sat, 14 Mar 2026 02:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cq9j/bma"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C84287259
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 02:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773455855; cv=none; b=CRbwpGmJCnAEGlkR2bT3w7dRNAdelvSBYShA/ITqqpOOnO9AkZZOhTAwFA7tG3WZLCI7sUHOxEby+B1nnQf9kUDNPatNXGYEjlyUkH/EB3/m3XwNJ0fgt4enBkT1VLXod0sDOhhFTaeJl1cuiAIWN0W4hhFa6w3Tmy8dOpZ82c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773455855; c=relaxed/simple;
	bh=ZFNJJlCgyZa1C7vDI21Y3Rz9XaJkveJ76cso1WBNdXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jmURQ0y7jSWAbKqF3Clv5GBFrwRMRXer/2wqc0i43lYtUtDVX1Y4EWq0cb+82qg4c+TozYhBK1WT+aafYKjoIx2DxLr4893Jtwq3sGiAWEM/gNAgniIKl2GnOeqghQWtC78C2Sodl6LWuprP98wVDIj/9LkvE/srH10N5GxjrEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cq9j/bma; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a13bd862e0so486814e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773455852; x=1774060652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/opkgg6okUs71q5M0rpiyolB5kTlQLVts8m7Q3IEa84=;
        b=cq9j/bmaJlw4RnlRrNM4IOYUwUxtcTHhcexKhXWoJE2S1Y0Neo5WAb5XvXC4rKWxII
         YFWOzm4XGwzhkHgoAh3z5+UE3sd75EOGVGrmYR4IaedaoP+j5tn3VT2HnwJIcJ9zaZlw
         l+Ip/oKvsBJBWZodw+dvmHlHSt6lGYVCW7b7DzvijID7s3mcFLZz7uicuwkU2QNd+fyn
         1YojZC/MfYmXAwx+5+LndTO2MopkcGRj2xdqi56SUVeO6z58ZEgp8gsoE1x1Rl7+LAWx
         JYreq//z+xMU4IXPGsMkdSQrXYz1o9WINf+gQUq0kBq9m2edTHrNOuAyXAkiJG0MXV0/
         l8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773455852; x=1774060652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/opkgg6okUs71q5M0rpiyolB5kTlQLVts8m7Q3IEa84=;
        b=LYuhf2ciF3nX/UoRAXgWOeuepztd+JS4dL/Avo+YGc+rkz+7kKMH02pD2y+oWntC0h
         sw+iLH2rvssNV04seByq+XIKY+UG+d0ahr0Cp36qIDSS6v+Mh8I5+OB+nH8hfS55gj/U
         qUKLhJVY0EDfkyvTyEiqVOM7Wp5awwi+hnpPj3xP0cBYCW+2zngUjXhQwJqtvhuFW+bf
         CkpqQ+oHssj8PlPGCiaxMWid1DhKbyeI1q1JGfySp8qyGG9TvvySrcFUTpMq+VuHmCTa
         PkIQ96Y5kCgczY821wQolFb6UhCsI0T8jTZNkhRwKvw4S6rgcF1UwxltVOafql44Sm54
         egYA==
X-Forwarded-Encrypted: i=1; AJvYcCUGF3dKPkWL6ogiPge0pZ1epAeB1OEzE34h3Jx+wT9WvT6/S9M3E+aWfyMcU8lTlZVfOaoavjN10TE9lXpZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwZou5AONl3/FVv0QiLGfhYeqJ7eVr9PrKvZgZO94f3aTF9kxiV
	OrXCOxbyqD1T/Q8PJ96UL3MRarBjNuA2r/OIpKodb4uA1nQZUtdErlVUegCO1l4g8Uw=
X-Gm-Gg: ATEYQzwT78CgqI8E9PMOk6LLyZUyIeoLYvMXm/a+epEju0jMsSurq2JUsQdnH48K1r9
	He8Bq2YzKxdBOwXqvysyG92Kfff6BUwK94pl+u/3+doQMNbjnYAcUzFWMZr3/amoQf8XuM/hL5u
	9AbYjl0DsZ5IG1MISaupiWBfP8S6OwgDJQ7xOa3SQ7cgloLu+bA9h4di/ca1sDUBY/SN9vagnZA
	CPc38d+uUozS90tc0BmCjfj3B85l4GHqnSZAK4IOQztH8Lo0DvTClJK/Of7NVD6PAoMeegdjH7w
	GOuplXeqMCbXn3k5vPNsAYhLGXRsh7HfuL351KPbDHmRMy+9u5dBd1tPii0IR4TiUVJYTwy+PQ9
	mHOEDKRtzmX5IyDwOLy3IiEmPR58SC67SEz3IRLNfZnIkEXDcxIhgU0Qfmf+BykcfFzkSYpWQZk
	PRzA8GBwUSn2YnT55HLgNtes0e6bxpzgB2Xd2JqAvW/i3xIo+kzOFZAq1TGziMhfvldTwv0ALfr
	dYs
X-Received: by 2002:a05:6512:609:20b0:5a1:2ec0:7442 with SMTP id 2adb3069b0e04-5a1626b65f6mr608892e87.0.1773455852353;
        Fri, 13 Mar 2026 19:37:32 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e692sm1884296e87.30.2026.03.13.19.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 19:37:30 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 4/6] arm64: dts: qcom: sm8450: Enable UHS-I SDR50 and SDR104 SD card modes
Date: Sat, 14 Mar 2026 04:37:13 +0200
Message-ID: <20260314023715.357512-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260314023715.357512-1-vladimir.zapolskiy@linaro.org>
References: <20260314023715.357512-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-97665-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.134.86.160:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: B48FE28B6B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The reported problem of some non-working UHS-I speed modes on SM8450
originates in commit 0a631a36f724 ("arm64: dts: qcom: Add device tree
for Sony Xperia 1 IV"), and then it was spread to all SM8450 powered
platforms by commit 9d561dc4e5cc ("arm64: dts: qcom: sm8450: disable
SDHCI SDR104/SDR50 on all boards").

The tests show that the rootcause of the problem was related to an
overclocking of SD cards, and it's fixed later on by commit a27ac3806b0a
("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs").

Since then both SDR50 and SDR104 speed modes are working fine on SM8450,
tested on SM8450-HDK:

SDR50 speed mode:

    mmc0: new UHS-I speed SDR50 SDHC card at address 0001
    mmcblk0: mmc0:0001 00000 14.6 GiB
     mmcblk0: p1

    % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
    1024+0 records in
    1024+0 records out
    1073741824 bytes (1.1 GB, 1.0 GiB) copied, 24.6254 s, 43.6 MB/s

SDR104 speed mode:

    mmc0: new UHS-I speed SDR104 SDHC card at address 59b4
    mmcblk0: mmc0:59b4 USDU1 28.3 GiB
     mmcblk0: p1

    % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
    1024+0 records in
    1024+0 records out
    1073741824 bytes (1.1 GB, 1.0 GiB) copied, 12.3266 s, 87.1 MB/s

Remove the restrictions on SD card speed modes from the SM8450 platform
dtsi file and enable UHS-I speed modes.

Fixes: 9d561dc4e5cc ("arm64: dts: qcom: sm8450: disable SDHCI SDR104/SDR50 on all boards")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index fd2d5648b92a..d34de55b0d48 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5429,9 +5429,6 @@ sdhc_2: mmc@8804000 {
 			bus-width = <4>;
 			dma-coherent;
 
-			/* Forbid SDR104/SDR50 - broken hw! */
-			sdhci-caps-mask = <0x3 0x0>;
-
 			status = "disabled";
 
 			sdhc2_opp_table: opp-table {
-- 
2.49.0


