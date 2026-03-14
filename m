Return-Path: <linux-arm-msm+bounces-97666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDJIJ/jJtGnRswAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 03:37:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 494D028B6D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 03:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00CF53085C1B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F4C282F0C;
	Sat, 14 Mar 2026 02:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gviUSDgV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274362C11E2
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 02:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773455859; cv=none; b=BVw6vMO4fowSvLXvNEUJo+cUT+54cVk5NJymJNbRKUcSAKswI5n4VrdzHZr9nImSTTddR4J7v5pzZJmyKcUkWaEHUjLTOdVAvHBIjcxY12pIKTjG8vkFvnQ8TtS8t8TN7MfLgM6u+kRNkt/YPQNXm3wuBQ7nAmXdVOwUsLAQCgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773455859; c=relaxed/simple;
	bh=X6NhP/TEjKWuJSU8sppXNTI//X8Yy27FBG5SFK+VEsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNBj5G5346KbRAcx59xl9NM1h+vffhiDhuPZkn3F2hn0kl9R5PWI8x7oNui0SJcONtagXxYq3katWEw+qkpS0ASMAgDuk/4oHVMGRRIoKzP7VGXZcA1v22KQtvkU/oxwjxgPI1HNEYHun/FQp48oPkhyylB4iOVPbioAlgMDDAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gviUSDgV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a13d3170acso355503e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773455855; x=1774060655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw9+jEXp2AiFSk3+X/0cEy73bNDKhZc7BhU8XBZqY2c=;
        b=gviUSDgVLx7QmhVMC6d+UbAIcYW3Jmo6Gde+1l2AX/nLClSVC6Ybz5ar+Eh0cTtElf
         3JtN3uQnb0/zpfTeSLzLrpYSbOKoctLXV3nTaMAvWAkfOa6+jjJxnIYxBpVYyN2dyHcL
         q4AodUqabLdr1S3gXeAa5PxvDkT+SG426tsttOgU/DH9JjOXomuBqg78ejzOBzefyjch
         BblUBQsobpPLHANtSsMcZLBeJKw8JpwFSvtzzC6uBJyqDmwwNVEpFvoMAs65gCSUbC1o
         FwH5/+PDNKUsQ6ZEOyMXQCEbure+II+pSrLMKZwDDsk0OsUyWikkyiA/43WHVIATKNPO
         TxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773455855; x=1774060655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tw9+jEXp2AiFSk3+X/0cEy73bNDKhZc7BhU8XBZqY2c=;
        b=PQPQ2XazgYGfKgPj57ei56TBJyWWgIaUled4rfXPtABMmnrcNM11YhkOvtM5WNzTw/
         rS63WFIgkTCTNWU5qupKmIBD9qlLOVc1ibr8FkGCQCUtj5cuYMVzLTyr20ntn+AXWOlj
         zqTZlJqwKDX4atHtozDfHCewKkRBrqcpTU/aQxFrspFml+yAg06C57m26PJnoZkWlQPA
         iUmxDz5LuZIJwTWAu/KW+uf0iqvlnJbbcWbk42vIzLm8rM6YthB0JbKlsZ9HR5gUKDuf
         BPVdwHTgK0czs3yg10wwl2ixwVDUdu49eC593W+QSvMlAzBBsahZ4H3P8UfYhSXFWIEy
         8aJw==
X-Forwarded-Encrypted: i=1; AJvYcCXDlu0ojKJT33HgIFWJT2j2dRgBj17ZixIKNVDDk2MDsi4d6PSuK3sl5G/BY93sl2RC7lz9Hryr54CWgkVq@vger.kernel.org
X-Gm-Message-State: AOJu0YynNxARNINCK5Dpno68ZZN41WZp4uPjrVchssqz+5M9ZTeVESdo
	4YtTUnDhSiQY5eXaIMkRZ1O1KiEkuSv54ZDoRorR/XnD2oYB8J5o7c0OxcpOWDR5Nek=
X-Gm-Gg: ATEYQzxlR01LvRgJGbHPNHbpR0YgfrnMINDo3h/Zc3uagcWZOsGjk08U3oMaePjdIBq
	awTdCLqfFI2vI9pZN0H27EWZVConAM7vA2XBgf9Fk8p86ZhCOdddPNWixbG/Hl9S7O09i2sPdIl
	y1s0QYQHh6f470+0y6Ag1KJmcfpAS7FQUVRhfjRv9YbAfZ/FAcyvPDzUndJLZqat5zOwvKEF4d1
	rdaHbOXHHhXthiLK7saZJ0H5Xfef44lZZfcm2nnxTEvo8YmDi4cgOj2s5zeX51VYZ72nGfyxpWs
	CVOfNRVLivUeo1RxCGCZ/EIQTvuEisqm9SyYeQRbCSz6wYSqNC+BQdCMaF2gSWcRXCiYAj2hEFc
	/EVUcoweeAdXGvSeRtGIQm/ugLGql4hzuWUKJTCo9+Gdx33HZjkU2wqM0D7EJNEsBCKx1v+gcND
	pu5IAfem5s7SREW1bBH1k03TZ3kfEovrBDOMb46DbFLR2hlVEqHO38Ytq74MCyrIOYOg==
X-Received: by 2002:a05:6512:603:20b0:5a1:4526:b8bc with SMTP id 2adb3069b0e04-5a162b59ca5mr677149e87.8.1773455855360;
        Fri, 13 Mar 2026 19:37:35 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e692sm1884296e87.30.2026.03.13.19.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 19:37:33 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: dts: qcom: sm8550: Enable UHS-I SDR50 and SDR104 SD card modes
Date: Sat, 14 Mar 2026 04:37:14 +0200
Message-ID: <20260314023715.357512-6-vladimir.zapolskiy@linaro.org>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97666-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 494D028B6D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The restriction on UHS-I speed modes was added to all SM8550 platforms
by copying it from SM8450 dtsi file, and due to the overclocking of SD
cards it was an actually reproducible problem. Since the latter issue
has been fixed, UHS-I speed modes are working fine on SM8550 boards,
below is the test performed on SM8550-HDK:

SDR50 speed mode:

    mmc0: new UHS-I speed SDR50 SDHC card at address 0001
    mmcblk0: mmc0:0001 00000 14.6 GiB
     mmcblk0: p1

    % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
    1024+0 records in
    1024+0 records out
    1073741824 bytes (1.1 GB, 1.0 GiB) copied, 23.5468 s, 45.6 MB/s

SDR104 speed mode:

    mmc0: new UHS-I speed SDR104 SDHC card at address 59b4
    mmcblk0: mmc0:59b4 USDU1 28.3 GiB
     mmcblk0: p1

    % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
    1024+0 records in
    1024+0 records out
    1073741824 bytes (1.1 GB, 1.0 GiB) copied, 11.9819 s, 89.6 MB/s

Unset the UHS-I speed mode restrictions from the SM8550 platform dtsi
file, there is no indication that the SDHC controller is broken.

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 03672df25eeb..333dbf84b631 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3227,9 +3227,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			max-sd-hs-hz = <37500000>;
 			dma-coherent;
 
-			/* Forbid SDR104/SDR50 - broken hw! */
-			sdhci-caps-mask = <0x3 0>;
-
 			status = "disabled";
 
 			sdhc2_opp_table: opp-table {
-- 
2.49.0


