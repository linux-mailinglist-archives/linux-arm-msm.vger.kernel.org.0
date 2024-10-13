Return-Path: <linux-arm-msm+bounces-34204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EA099B860
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 07:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2287B1C21197
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 05:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B640813E02E;
	Sun, 13 Oct 2024 05:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="NxwNnV69"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA2E13CFA5
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Oct 2024 05:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728796966; cv=none; b=Ho5huASBNYD5HJF7I5WUtY8LMRPY7/VFEcbN5dh2xoVwXTbWVaTCxz9N3xMAClgQACjdii3yc3h/oyaY6UWKMa918CNDbyEtqDhERnKi7i/yfcgW7IEpKIxjG4KS4M8Gxqq2BNG3vOMS0yrrmYNiT3V2rNnehGmtRVBi8ERwJMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728796966; c=relaxed/simple;
	bh=ARvTbpZoesd0jYRqz5wVnIxLACSl1t1S6Mt4dSv6f9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9yezrqIegCWtkjL24Ie7rdmY8s6wSOKdYCi6J1GRw2K98S2kjNX2obD/NkH2ZnQOoIir6BlFiPL3UK/eTLlhXj+Lyeq1Vad9vnMmvHjlu5C/ScrJquKXcdOVT28SWIzqkt1+818A9CgojDP9X/xjdVXLG6OmzTVovxZRPAFiY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=NxwNnV69; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6cbceb321b3so27108516d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Oct 2024 22:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728796964; x=1729401764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6yGSmyzg21J/Zpyi1ZX21XVWREXLzfX8fd72TE5Ubs=;
        b=NxwNnV69paSBGyIY4pzVHL7FcFuXndto0DPfmRIOFboC0lRRDOYoJm5AZX4PzZzMRu
         QxRnKSO73MbWyAkRVp1iN9KkqRTXqIDp1Dc9vKsqIRw2ve73nA5cp1tyWIeKusheSvZC
         /BBSkv8YhelIlHMBjT1sYeOZpa8jw32idbeSyLKObMYkq6hy4zLhif3Kbt1KfwfS3Ow2
         v1TUI7hDwt+pnvEdxib5Sp22ctHTd8tzFk55N/ilj68T0m3dmY/ocI7gO8e9V9fcGhcw
         MdiNPlCsAuMz0UxG8Ydd9H6B4IOPNljRPZgnIW84Cr8dFWewj5hbXsvRYuihvf1uM5xx
         Iuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728796964; x=1729401764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6yGSmyzg21J/Zpyi1ZX21XVWREXLzfX8fd72TE5Ubs=;
        b=p9XwFj3PDb/ThTCrnszbKACTfPSydByCU/4fEitmxongK3TDmYi9qZVUOLdhjJbn71
         6ho9vo85HCw1b7ZuQAPdIFt7qzxQK2C1Be2OIGB5oejgG52jyoymNP20aExDnqjwL6wf
         q7qKFK1IPHUE3fvzMkn3j62SD8Ns/+CEgekeMTxEAYwVl16Z1cTXIg4MKb+ch1NVL8S+
         AXxAkcjaXKYfKciRqOrp42SVcev5qhRugsGn5VAnn+pvYJeOgXtAXsjARgw+1+ZDDGKo
         RXKKW56nuaAeIkvCFs0J3s0Ohd9HXoe1bHgqaukOjprdTD7IK/Jx3lbxQNoCmU/y5rQY
         XGCA==
X-Gm-Message-State: AOJu0YzjUwOxKBVXH05A/WGnF4t9+zI73Gi9XcfsOIqR7MzCrOsmzgj8
	OZJC35mvpGZOjMhhV1JID6SHfhsa61cxQpMGA2c4Fo7M7GHS1320KWMRPXVa9v7u9HuDl9nJWjg
	N0mY=
X-Google-Smtp-Source: AGHT+IF8AUTc+jOtWy9UppEuKKcTtAsp1aniVjQun9cMK8ZFcTOjysON2IY5sk1DerArEgUw7kRllA==
X-Received: by 2002:a05:6214:4403:b0:6cb:fb55:5378 with SMTP id 6a1803df08f44-6cbfb55552fmr48947056d6.25.1728796963959;
        Sat, 12 Oct 2024 22:22:43 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe8608e2csm31821496d6.102.2024.10.12.22.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 22:22:43 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/5] arm64: dts: qcom: x1e78100-t14s: add rtc offset to set rtc time
Date: Sun, 13 Oct 2024 01:15:30 -0400
Message-ID: <20241013051859.22800-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241013051859.22800-1-jonathan@marek.ca>
References: <20241013051859.22800-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

See commit e67b45582c5e for explanation.

Note: the 0xbc offset is arbitrary, it just needs to not be already in use.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index d18461c545547..f05523cb51cd4 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -897,6 +897,17 @@ edp_bl_en: edp-bl-en-state {
 	};
 };
 
+&pmk8550_rtc {
+	nvmem-cells = <&rtc_offset>;
+	nvmem-cell-names = "offset";
+};
+
+&pmk8550_sdam_2 {
+	rtc_offset: rtc-offset@bc {
+		reg = <0xbc 0x4>;
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };
-- 
2.45.1


