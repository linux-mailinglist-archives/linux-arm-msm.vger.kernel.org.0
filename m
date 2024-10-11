Return-Path: <linux-arm-msm+bounces-34131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DBA99A79D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 17:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BE6EB24FDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F17119755B;
	Fri, 11 Oct 2024 15:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="ZG8n9i8z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F6A195B18
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 15:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660455; cv=none; b=Pj5cTlickqcGihAX9YXdTTuUg2avC1ivLz9w5/siUTst26oSjVVX/hwEICQLVQgqhOuI2O79tXqBOEGZ4TUxakiP1NdHrn5ZSPRYjrqNUpIVtjO7JEv9W1LaT0jUDX2vodyhSGKQ+P1waOMD99UezmBG3CvFbfL6ZnAZoivrbCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660455; c=relaxed/simple;
	bh=Gx8UGYyCoJLkmTfYCCLLqZ+vI7a5HA77QIzlDLw8kbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1BxiJ3BG70tGkiXK1T7Qk9aWFqy+2ewZb9O4BLt80EeVSPTYKz++vAfgYxnQCBl6uMYI+4B8YUSTBcejWUcwLZoIDrpU+CExE3x02w3dGGAZz/i86/2xg1W4NbQ7BOJFzvoryLD4EOoowYj4NMsSZIpOmicYgh7cekjfOgdpzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=ZG8n9i8z; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4604d8f162eso5601891cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 08:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728660453; x=1729265253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvVQKd9PLxbemSCsM67gMOfDNJDIxXsysvUovMumA3I=;
        b=ZG8n9i8z9nKjdmPOMvK/qohYGGfjl+Ja/TS3pKgck6GbYlIAqBzCiDYhcOQM6kjiCf
         CUbo+dO0aMxlFxIxDI0NPjVyX7C9PjMH42QHs8zJx3wOecaHNJNY51wRZh81+d4kIUfm
         sgb2LYqfy8RxX4Zld5o4oosQ0NfTPFmFtXKZZxgSTs3dWEsQsY6kf1xKrhnl42uBcRv6
         cx03c2c9wcm54Yy84NIXIMoRuQgtdziRbHvTsKnPvOGgZzMfDjKdKr+pQxmZvb8Lz/tQ
         qHzjqBXiMiwJDPT5hxtqw5zZ1u0ZzbKWhfMZcjSwUlFnvfoGMnQ48cwCu43gpaE32U8x
         2bMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660453; x=1729265253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvVQKd9PLxbemSCsM67gMOfDNJDIxXsysvUovMumA3I=;
        b=JjdJ4YAcZGHOaVEdCCmwwQF2EFHME6woOiS29xnTQi3bhV0dfAmvK4lvDHdjiIPf4n
         /j7aUpofYK0veBzvQ2OGPVuHHs5Qlt2sY0AODDJcLjvAjOwj9bBKNN5Qj53jBlX1LWq6
         9LTBVaGdApm8uroEZL3qrlECT49KaOktwYgJFJsh+qATe6mZ8Mwmpwz1fBPjsLjdJlf9
         W/GPu1QUuaK0R+PwAUChrJXo8xXDnIDcBRgLiFXVGntZwPSFooYEK5KbdFVodVgJ8IT3
         pseI3B7B/BNOr89wIfBZDu2LHvL7MAEZMf/Yls7rfScQPg0/Khs1TsozxfcwYXGleBzL
         fdNg==
X-Gm-Message-State: AOJu0Ywd1ED9pQgC3NBFJbHltF8CPXjVo3JcJNscIEYl2vJvRwgU9g2b
	wjy9lSNGUUU/Ge0RCO7XsoljD/5n25H8GTxlZzHdHaT4duMIN7OdlYDWVoer6O6zYOvZnBvhHB+
	whvA=
X-Google-Smtp-Source: AGHT+IEXnQ/LD2VsUTesyG1k3Rzr18V6yq2EmOcJVW7Bge/+h5oQISsyZXZcWyI3JbjmbvZ/MrE3dw==
X-Received: by 2002:ac8:7d46:0:b0:458:2764:37d5 with SMTP id d75a77b69052e-4604bb93e90mr37264241cf.6.1728660452820;
        Fri, 11 Oct 2024 08:27:32 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460427d5220sm16344131cf.32.2024.10.11.08.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:27:32 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/5] arm64: dts: qcom: x1e80100-pmics: enable RTC
Date: Fri, 11 Oct 2024 11:22:41 -0400
Message-ID: <20241011152244.31267-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241011152244.31267-1-jonathan@marek.ca>
References: <20241011152244.31267-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only access to RTC alarm is blocked.

Enable RTC access by setting the no-alarm flag.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
index 5b54ee79f048e..304a98d60472e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
@@ -220,11 +220,9 @@ pon_resin: resin {
 
 		pmk8550_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
-			reg = <0x6100>, <0x6200>;
-			reg-names = "rtc", "alarm";
-			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
-			/* Not yet sure what blocks access */
-			status = "reserved";
+			reg = <0x6100>;
+			reg-names = "rtc";
+			no-alarm; /* alarm owned by ADSP */
 		};
 
 		pmk8550_sdam_2: nvram@7100 {
-- 
2.45.1


