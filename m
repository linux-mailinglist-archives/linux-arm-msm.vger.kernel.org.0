Return-Path: <linux-arm-msm+bounces-38903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BDF9D6800
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 08:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC88BB21567
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 07:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2AA16DEA9;
	Sat, 23 Nov 2024 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="eyiOFG+3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF89C481C4;
	Sat, 23 Nov 2024 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732346159; cv=none; b=sV4QSG5EizZugd0BiTBaD36Rf13Ngs6llkhlnl69hVAWXIn6M7xbm60KTd7jIm3iGwJratJcDl48yBpJCB/mVAWdJAC9RKtPgnGYI+rbV1uZID0YWvjlNImZcATP7fTA1WTBooSgmKWdr94aKm1Fv9p3r2O8g9/KPqaTfNyHYtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732346159; c=relaxed/simple;
	bh=1am9n3/3GzgieIZ5JVk6dYKvl+zfaoe+COkiKuLcthM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=czJS+sMu1viYdwAjoZpOCi8QUEX++pZNLFjfz/ZKH9+qTYs7PiMZH/cSUXtJ+4t29F4H+CmiFulhMZ1RYMw5g1x06OYsUAOo56bjDz+1wpbjT2uhQ7fWYOqH00Hf1maV64bAYMh7JHJ/na8MfjMThlN2Y8Cz7KH4vQ03traUzUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=eyiOFG+3; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1732346150; x=1732605350;
	bh=1am9n3/3GzgieIZ5JVk6dYKvl+zfaoe+COkiKuLcthM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=eyiOFG+3vFTuE3wVIXpZhGYlJE20qAv30gxv9O0uVCabb8Bkxl3Vdaa9vC36F90t7
	 kyRA1Y9YtOqGw2eM6xFii8pleUWldLmE/zlLoJerAeYcsrCxzNf4tWSeCmY679QEtr
	 pl6KJX2Gqn3gjDzmN7mQyeNv7qUKQMQQ/PZUXV/s0bfRpCdofKQ8rBOvK8ECgOQ9bb
	 RiUcItNS2/SjPc6PZuIA0g42TuZ1Cz7Gd64PfRKAsy48BjgG0mxcOsPBBhwFML8NJP
	 VsIUrXJql1E/Mh/73vmHJVbxQ8QC4+UehvmqJlNxQqkpawkhQH1fUKDS00LWC69XfQ
	 5Dk7++Cqg/Z0Q==
Date: Sat, 23 Nov 2024 07:15:47 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH] dt-bindings: arm: qcom,ids: add board ID for CDP
Message-ID: <20241123071540.50329-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 52a906fb7ee843278ecaa97ba1fddd80dcb686bc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add board ID for Core Development Platform (CDP).

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/q=
com,ids.h
index e850dc3a1ad3..f739805a840d 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -293,6 +293,7 @@
 #define QCOM_BOARD_ID(a, major, minor) \
 =09(((major & 0xff) << 16) | ((minor & 0xff) << 8) | QCOM_BOARD_ID_##a)
=20
+#define QCOM_BOARD_ID_CDP=09=09=091
 #define QCOM_BOARD_ID_MTP=09=09=098
 #define QCOM_BOARD_ID_DRAGONBOARD=09=0910
 #define QCOM_BOARD_ID_QRD=09=09=0911
--=20
2.39.5



