Return-Path: <linux-arm-msm+bounces-34202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B3799B857
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 07:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C5CE1C20F61
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 05:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5762913BACB;
	Sun, 13 Oct 2024 05:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="ZNIjy/PT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADE313A863
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Oct 2024 05:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728796964; cv=none; b=d1kPE32ct2/YAREbigieXWgetSXuZsrxoFCqNq/YhnmCiEXwAs5TSgOrIyZISPlvmVyhMwyMUW5Ylc7Cp7bwwdTkWSyd8XNrnBuhgbkamT81/01XIbyZi1v48ey3y7hc3z2TO/22qnSMUiz9teNJat2BSYvRkPvDt+e4Bb1w6q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728796964; c=relaxed/simple;
	bh=Gx8UGYyCoJLkmTfYCCLLqZ+vI7a5HA77QIzlDLw8kbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UiCWbuHW8s61Y3MmPvd/qKKTVcHOTPNf0EolsRhWFpNp19kSuVikeX5FtXigoPCKGZ+xIgCRdci1szDQ+hscJcvNG1sk6oieP0dpzeHstlpmoyB0Uxw6C0q/Nr3sCqov06UPdhFbchHC2mfvjrS7Sy37QDf+tTKVz3NKFYyP4Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=ZNIjy/PT; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cb82317809so24002666d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Oct 2024 22:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728796961; x=1729401761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvVQKd9PLxbemSCsM67gMOfDNJDIxXsysvUovMumA3I=;
        b=ZNIjy/PTVeIXaYotaYX/g9VE01S/vydF8SRR0MZpOnriqODjVTgj4lTtQXaHulF9Wq
         VIdYvCXhZPYdNqC9Ep8rpao+QdhSeZfYlO1ky5+fBtDa/nHXq3k5q0jfZ5YqWq9VG3TD
         L5qCCvqOAny2ZKZuFsOCAwxaKc/VCh4gry+I8TJRlrDJMm3NUFXKZKlehrLveur2oC07
         6pqW495xE06dSF3C1GNaWx3s5R6liVuSR9f6TJVqLEW0f60zSxzHgxW2uns/uCmEQf0R
         yVU9NQO7CItHAJVjF+MFKDJ3pX5jIrWKOAe9zJvQXKqV6qnzVe/X9o3eLWPL6qUTNyDJ
         ZciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728796961; x=1729401761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvVQKd9PLxbemSCsM67gMOfDNJDIxXsysvUovMumA3I=;
        b=mBgrJVqvjtdtLlkLw7scpfqaZUONxpSSvZcTUZO4hX2OSRaFG7T+Y9bj3M+dtT+luQ
         gS4fILTY9G9KAV6RgmmETlOSwjFRro/Cp7c+Rjo5kdwPxB6Xv5zBbSAj+EEK1rO5aCb7
         nbWTKxJnrY/EJe0PMYL7LrDx3IPwrOyI1CgvFhZ1f6qk6LhtdMkrrHWVpbsps3b3on0E
         YLeS0/YuvUlng6rhHcJDHcWg1rvWftUXMJVA2CH8succM3/mVmg93JVm84HCFGpvWIsX
         uObdb9QYDtg4lJJBLkKBHKm66X0gZG0pjtGVhebU5PttW0qEsnlAE/FwsQ8qWabv5KKk
         I+cw==
X-Gm-Message-State: AOJu0YxSvjZFijMc21bwcgy/uu9/pBy47UcWQiuymkECIg4TorEy7KFc
	LmHoswbjP3mWOEF50vwcg/0KvDg6qq6B6EFcBEh0Gk44vB17+h3PpCC/dWkBwwQpncmPQ2cqk1T
	Ijdk=
X-Google-Smtp-Source: AGHT+IG3X+CwbagBKnpKliy5KyuMFT5lYpfYOdROgevhJ0y9Vsl5tgYm7JjVvSB98U3HFa6I1oDaqw==
X-Received: by 2002:a05:6214:5b82:b0:6cb:8339:3443 with SMTP id 6a1803df08f44-6cbf9d0cb9emr75169256d6.7.1728796961575;
        Sat, 12 Oct 2024 22:22:41 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe8608e2csm31821496d6.102.2024.10.12.22.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 22:22:41 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/5] arm64: dts: qcom: x1e80100-pmics: enable RTC
Date: Sun, 13 Oct 2024 01:15:28 -0400
Message-ID: <20241013051859.22800-4-jonathan@marek.ca>
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


