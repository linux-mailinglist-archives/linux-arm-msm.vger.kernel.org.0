Return-Path: <linux-arm-msm+bounces-34199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3AD99B84F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 07:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3592F2828FA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 05:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FA313665A;
	Sun, 13 Oct 2024 05:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="FrzjGw1i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28B22AD18
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Oct 2024 05:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728796961; cv=none; b=B8ceAEn0kl4Yj/HhDNRBcyO4Tg6kLU9BG1zuaPabWdc7yy1SnGpSQ36vGEwBsFjSAh8g+AeEz39eGJcPwG5puK19WlSRuOx+Iftg9USLY/l0NxE8oBt8AkxH0n7x5uC4ijSOMKHLyjvLSWTwmRMXg8rTQcnF3F7+IoDmI/9ecYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728796961; c=relaxed/simple;
	bh=H8ErPu/ImGfE+2rjIbwJJ2vkwDeLqOsDxwgngECtaqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aZWc9ix75rPZ4knpVAgWYmk9xnRhqr21kS7JdLKwXbEmZWOM7T9172W/HnEV9lCWOSqA7qwhO8LCuk5ZYrh3lx5H5G04ZzbvYvPrqt6tbBobs51JfNVAu/wdsA/+7UXXrw7W3XtqKMGQj9LAEA7q5MZ4Y3nagB3vRVv8FIxtHCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=FrzjGw1i; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6cbe53a68b5so22083146d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Oct 2024 22:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728796958; x=1729401758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rOLKkxt2O4eXFAynwZlbFaG/jsGjgjQ3LzOfyoxebZg=;
        b=FrzjGw1i6ton/y0V4C5aKOSvED7GVhyJ30g7KH2mB3BrX7tmxUVcs51+ccaH8ag6ut
         UJNlCrTKfUyv1T1Xo6DDa06BK5hvOWn/BP6Dvc8T+qSFIQqowc4ydN22xgisrhTxiN2w
         vEbaHY8aeQAUcAXO7z+XDHMDQ1e1ycBnknf9eUuBEPSl0xPIZmphZ9D3Bdfg2ZgJxxgs
         qBzgiiCR9V+toE2hRdStHW0VW0l00UnO3c+c1IoCKPfcZJrpzUMmVI+Xui8s7K8ZiBiL
         EaxOzGMvuSviLpGgIZV6mInKSorqW4uclv5hPNDypQiRh7v40DsMZobRsGAVlodT8pcD
         rq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728796958; x=1729401758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOLKkxt2O4eXFAynwZlbFaG/jsGjgjQ3LzOfyoxebZg=;
        b=h5KrS8PamvzF3QKWx3gt7wcn/BwP1DS0NLeUIMvN+yDMuEfie+Nj3rwxytUeD3tSR8
         I3xPXk6BivvzjCs2bWG3Zdq/do9DwxobrKrC5Eec9iWCOJOUfIuHf4pAnFeilrsYKONf
         QGIP24iMMwnK6nBCpen1WNHHcdgrxBPp4vyqxuGbeK2x0p5nRT0Ko/aPEKsKAfuehek9
         HfcY6cwXJ5/RGrWQDYUd8b5tOg0tGvhwVdexYsOB+siv5147sI4Psl+cOrXfkSAxTFXc
         AOmoSrKdQtGp0IprM088CAzXhFSGwWQ0AvR2808XwF/gU9bpUfRbNzbU3DwITzJtHIXA
         fE9Q==
X-Gm-Message-State: AOJu0YzmYHwaDUk1Kizfhn6K9qO92VD2i7RBw+SQHwNJj25B5y2ZceNU
	UUMUhjsSjg5PKkLyTGS8N1zbc2yFomBgH5aS6Yn8xpNADxM9M9VNZ22sjKJXW7UGBrmBHymDTCY
	vXNM=
X-Google-Smtp-Source: AGHT+IGUAYa5kQJxeIRdbuM7yQSyo+dJ62ySg64ZZp0mo56zPCmw8lAZbrBCpr2OqBEFjEbKczgt0g==
X-Received: by 2002:a05:6214:3c9e:b0:6cc:ff:e695 with SMTP id 6a1803df08f44-6cc00ffe70amr44689326d6.52.1728796957755;
        Sat, 12 Oct 2024 22:22:37 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe8608e2csm31821496d6.102.2024.10.12.22.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 22:22:37 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	Rob Herring <robh@kernel.org>,
	Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH v2 0/5] x1e80100 RTC support
Date: Sun, 13 Oct 2024 01:15:25 -0400
Message-ID: <20241013051859.22800-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

x1e80100 needs a workaround because the RTC alarm is not owned by HLOS.
It also needs the same offset workaround as sc8280xp/etc.

v2: remove duplicated ops and use RTC_FEATURE_ALARM instead

Jonathan Marek (5):
  rtc: pm8xxx: implement no-alarm flag for non-HLOS owned alarm
  dt-bindings: rtc: qcom-pm8xxx: document no-alarm flag
  arm64: dts: qcom: x1e80100-pmics: enable RTC
  arm64: dts: qcom: x1e80100-crd: add rtc offset to set rtc time
  arm64: dts: qcom: x1e78100-t14s: add rtc offset to set rtc time

 .../bindings/rtc/qcom-pm8xxx-rtc.yaml         |  5 +++
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 11 +++++
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts     | 11 +++++
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi  |  8 ++--
 drivers/rtc/rtc-pm8xxx.c                      | 43 +++++++++++++------
 5 files changed, 59 insertions(+), 19 deletions(-)

-- 
2.45.1


