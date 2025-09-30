Return-Path: <linux-arm-msm+bounces-75598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DC8BAD302
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 16:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F1623221B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 14:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E55305071;
	Tue, 30 Sep 2025 14:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ggRZ0me5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40369284896
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242759; cv=none; b=Og+yf31GGFGR9cNI7VShEvlqZ1tPzCHVh5yVgY8s0VWfIMnu/m8GLI4Su7zvsGEMs7ItRHaf9OZS8GA3YUtkIOUUdNrKT9vK1TsQMjX+4LZshDvTPtEVbfIWWFqGcZoPYiOpoAUxEzJWj9NvzM08PRnMMlTZs1Uc4ITZoJP7/Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242759; c=relaxed/simple;
	bh=+LFiRy3Z1LxfRQYxjXUFDS9xzpk3P5GtXoUbQtbfGYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kqlAaG4TdjT2EHFYcQN8NBja7MzaT80P67gszkSpi73xcC9mNBs2vaAbREThs1OudlBgC/Uo6k+hW4W6XXXAmJUf2F3B754u1QJa5U/ISOYAIfFrYjm6iuoDcnmLVwNWfccEssy7FGzfnyP/tEetOE4yNbnTmrvfLtJvXp60gHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ggRZ0me5; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so12005643a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759242755; x=1759847555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5x8EyhLaWWj+c8MV0HkR8SIUiKQa6BIuaXkJKptBZg=;
        b=ggRZ0me5vvAsk5Mo4yS+qlqFfvMsIMTAwjLnUT1fuDJMHwCzC+X2H4y1/HDPACkE2I
         4RMSkMv7UsSaPWHEDawg3u/h6z3w+0E289S54MZVSMAUkc7crjI0XtNOSPXMfTGeTmc2
         PYEMn16fGUC34k+H9I+JjdPZdYB4mKJCjK15tYJrm4SrA2LGVzwBqu1alnCoC60m59v6
         QjYSUrSczfY+AX01RZeOs8s7YZ0DCMd0ymmONtRtiPs/UFnSBpgmVifuYTJLNcJgG8WH
         yfduAXUD+SciNRlrd06RGokTh0h07Sva0fl9rTuIPZdRbQArOqHMxN3YFGtn2lbMOGyT
         55PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242755; x=1759847555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5x8EyhLaWWj+c8MV0HkR8SIUiKQa6BIuaXkJKptBZg=;
        b=i9Cdnpm9cwvMDR/RVDkIArfJKqMyusXxQG4La9Kzg2KczlFMpiZQZPkvzl8XhbMD+X
         e9uYGrcqQmSx3eO/mzXGIc/Z2S7IpDQFSpJi0eB4YlEpLm33zialURHhU6VU4kA48+3Z
         sZel+b0HVUgCdQA9gq4kDRffXiXRnW7KD7fASKMM1lvR5Z+SZr6yxxDBfE8qcLemrjhx
         8dFFz3kvC/VAGPBSnyWqJkJzYP34pj8wZWFBYaK1REvkAt2RDpJABDsGSU3gppOZOsHZ
         75qVZpLlUBdqjbnh1a/s3TfEvReYjLwUIa5LX01eMDguTIjwpynJo035gsTQQJ2xNcPW
         Edsw==
X-Forwarded-Encrypted: i=1; AJvYcCVe7H3SaHQVpUym+6lB9YxaAQGdS6m5yAFwKI4VWf9+RZyS1Qg/kLZDviQMllRvM0wg40U7rvuKuz5Fmz9k@vger.kernel.org
X-Gm-Message-State: AOJu0YwirahwCrm1wz8KI3YTQd0AQ5TdhpqcM8ds/vh+S8852fDQMRw8
	jEiyY3pVFiw1bnNJSORT5QsuGGOABMTh0bWLyAu5E0ZAuvvmzkpqlJtOJ+rhLY+uETg=
X-Gm-Gg: ASbGncvwQob3ECp6WWFcUQyF5M2XctwzD3uZKDmrUqOSx72KRV4vF25Yj7ArxeK+gna
	OfTRxdoEqqXDsZjneurt+EEdcEIphWF3Y4XaoV61fxDY1CZRaBJHVdkDfK/bYztWc2tD78OYIfD
	TpZDlk5D/m7asdQUxgCUg7NA2P7jcRUG2wrTNUob1erhsPcxxvJPquiED1wDJ++WmSH0dyLj377
	fukCoXkKGn+9qaD7amx26c3z3Y7XjZX9FJ1clMZoxx3JsSGXGs5UP1gEONA7Lphee+YMrJa224E
	61nQdbzlXn1hArn7NwUCl88MrK6O1Y7NWVvDRfxYmyJi4H0M3USDzogikJIMAtUhLaVDXkGhpeb
	MrU2xbtCXKyBJGoLH8YARO72aEehHkDMXDV3uOsJRUf2TnsxvOIA1pMJ6rRrmzdwdCUwZk0KeaG
	5gfQVIba6dtOrHiNZnefeRY6Q0M0T7
X-Google-Smtp-Source: AGHT+IEDUJRM0GN5W5q15/tGP2wBwyGlX0yymXPHCIRCaXyEjbXUNd83PMCVK5ptl+ENOKcbxttmzw==
X-Received: by 2002:a17:906:478f:b0:b46:3a39:3ad5 with SMTP id a640c23a62f3a-b463a3951aamr135599766b.9.1759242755483;
        Tue, 30 Sep 2025 07:32:35 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3dc2cf61dbsm499858466b.29.2025.09.30.07.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 07:32:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 16:32:20 +0200
Subject: [PATCH 2/6] arm64: dts: qcom: qcm6490-shift-otter: Remove thermal
 zone polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-otter-further-bringup-v1-2-7fe66f653900@fairphone.com>
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
In-Reply-To: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759242752; l=2062;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=2qIN8MfH9qi0zQH2HVOb0uwrinuQsozaHPS9vO6qYb8=;
 b=AbjQrk2iX1Feii3SrCw0VNGiNG0q2XCedBBBM+eKVS5/5P6KL+5yniSzPjM0G+Wt9pkyeHbzs
 oSgU2cuX5g+BVbHsQWu/zHaXqVN5+pkRgw2XrtjN6TIdZlIedtGIckX
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexander Martinz <amartinz@shiftphones.com>

As with all other devices in commit 7747a49db7e5 ("arm64: dts: qcom:
sc7280-*: Remove thermal zone polling delays"), apply the same change to
this device.

Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 8d45e6ac0e445b9e20bb9c1520f804623c505653..2efcfb631c3683456794b0a0cc5686f00efd329c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -131,7 +131,7 @@ rmtfs_mem: rmtfs@f8500000 {
 	thermal-zones {
 		camera-thermal {
 			polling-delay-passive = <0>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pmk8350_adc_tm 2>;
 
 			trips {
@@ -145,7 +145,7 @@ active-config0 {
 
 		chg-skin-thermal {
 			polling-delay-passive = <0>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pm7250b_adc_tm 0>;
 
 			trips {
@@ -159,7 +159,7 @@ active-config0 {
 
 		conn-thermal {
 			polling-delay-passive = <0>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pm7250b_adc_tm 1>;
 
 			trips {
@@ -173,7 +173,7 @@ active-config0 {
 
 		quiet-thermal {
 			polling-delay-passive = <0>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pmk8350_adc_tm 1>;
 
 			trips {
@@ -187,7 +187,7 @@ active-config0 {
 
 		rear-cam-thermal {
 			polling-delay-passive = <0>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pmk8350_adc_tm 4>;
 
 			trips {
@@ -201,7 +201,7 @@ active-config0 {
 
 		sdm-skin-thermal {
 			polling-delay-passive = <0>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pmk8350_adc_tm 3>;
 
 			trips {
@@ -215,7 +215,7 @@ active-config0 {
 
 		xo-thermal {
 			polling-delay-passive = <0>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pmk8350_adc_tm 0>;
 
 			trips {

-- 
2.51.0


