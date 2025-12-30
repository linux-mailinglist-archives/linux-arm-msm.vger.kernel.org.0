Return-Path: <linux-arm-msm+bounces-86901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8353CCE88E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 03:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C617E301B837
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 02:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C76B2E03E3;
	Tue, 30 Dec 2025 02:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cY2u0zxS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4432E041D
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 02:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061679; cv=none; b=dEIQb0Nl7GO22anqO7IvHLUrTCq779ivmz6WQrgNLxu4KHaGxDQ47sswoRsZlKUEEa5dBh+Z6zFJbug2R7f5w5n/mZnlNlkNyaV3QYarlPDsYxEKLsF/LdDweGL1wMb7WWoqp3cNjjo2n8Dn2JYG4/JUJJ4wDMynIHI3ClZDRU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061679; c=relaxed/simple;
	bh=E9hCkg13sMLGfBn5Ay0BI1/P8wO/vHWD7Xt7AEV1nQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8IuY9XRpkDVabpWftP3AIUlYNU9zm3CWJzxJW9D+ufEZPlv54t4S91CCUNKS2tvMFV8C9gneglYpgT+tcEm+ZhfhHBzszdgEPdXnYZe2r7j5ulHHLYhOwFmNVjyEJFN7IZubGaImfp0vo98Wr3qGIFIFlvF5NIXBKMGUotFh1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cY2u0zxS; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b2d32b9777so1409927185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 18:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767061675; x=1767666475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdQi+fone+BESYBoxIz7XE56ZJgQDpFhVO0ekIamygA=;
        b=cY2u0zxSMpv1g7BKV9kb5fXDgEI+D3aOiSpEQIqQnNwFrN9HXaCL8Dm6JfWcLCYVlx
         FW1b58oE5+Pph0hhBgsoBPIqvSIVXLyr6pZl4Qoeb3eDAFNeAOnhtP+SBlVXHxOO5C4p
         CxWc1Ji+cWdEsQbDxP7tLTnW7FfAAUn4dt6xd5Wg9c22ou1ITqR8ruaCVlvhB/nV1s0+
         4PqHli6QWvc0lasR4n5ETJRcbDqlEgKd2NkQAoT6Xd5jPsKKcWhTkIETv4BJsgXBSAnV
         9gfBrAnkL1UxH/+Eceguf8vmamepo7nr+poJaMZNvgHUhsnUHw2WB5ADekvJ36E3fYKl
         kLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061675; x=1767666475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gdQi+fone+BESYBoxIz7XE56ZJgQDpFhVO0ekIamygA=;
        b=EUyPQwv8iFwh1PieczDgKE/ZQA8Sptjc5StuNWm55jA91oP4ETYBnSExK2Rnug5Jop
         bIzyL9sDxMCVje67Dy4syQO+X/EJ9Y21loNUcn7R4taEhE2pV0gduPRIcg6Ptabf60dJ
         FFCla2dqMJnqxBADZdLDSGmCHuWaHB5kWSjczwzjbIXgzSQvu2RZt6bnZfoPOEt5dmNh
         1KSWWOHYJDChIcEnabxZBatv4ojQAwIlqb5wbu05FWZDxjNtMVNccnnIuRDCa0Kwhuz/
         FR+gVxLWfbsvEgdKu1Kt5NvN/t/YPiMV0+mWKHor3UPAPNv7T47qLLV6UuVAndwFonAE
         HZog==
X-Forwarded-Encrypted: i=1; AJvYcCWdtncv2CUGP/BTR4wuvpUr9VBSuqokEErDQXhI1JZhONrbndVF27X/oBDeu77ACSDHqpF+7TpldhAiGKNN@vger.kernel.org
X-Gm-Message-State: AOJu0YyGlGTX9hLpL34eQ4OpbIEIMngiIvclvQoMzU0uupBFU26S21Kj
	WKEEUWalWrf3TvzMKxB39TU2u301qJHJ4FnoBtYcAhXF1RIl9GT6zLBN
X-Gm-Gg: AY/fxX5yDOVBRbRzAJn61Mfzj+Rf1R8tTXobkHbSATATrsfWf46E0TXh7TLDNmIYELY
	oqMTi6xavCDxxIXg0D1iWm10+9FJkb3GDWQiikEnF3060x0i2+axghVUbT/PnycnquJJbzwAPHo
	KrWZwCYop4IVr1iO5ZpZ/uPc1Xu8u3zTI/m9NfB6Lbf6e798nNG02GoW1gHqZdVsGrHpds6iHG/
	dRGWYnQaqqxcXH1CSAi+rWsnpTZEfN9EFZiAZuzMDHSmYZPS8LBf+Ga0zLgmqhGGNb9O5YG+mTb
	rkR6ExX/PIzK2RtZ7dZSCLSxfUk0xyaWjfaYTny+oQadSUgbeWRl0qq9gQRDQhiyhzqdjJADjyO
	N5QMDnq0akCjhhFcWUgtZtvwDaxhVIFCyrPuZHVjBhGDQSQTyIDKhWL/SJsUZzOeZv//2zynKAE
	nhnrAOvzftS4r6c2zUkKEGhGPu0eILoPw/m/QPkW/ZiWMPEwv1An/zLLWLjEl4k5epxG8RBbC9m
	Fs=
X-Google-Smtp-Source: AGHT+IESgq4DW1/APtEVb+UkOUyGElCFnWbvcmi8z4IBQ8xiY1CWJijDJv1f3yoretJFcVlC3IlW3A==
X-Received: by 2002:a05:620a:4403:b0:8b2:e8b5:1ea3 with SMTP id af79cd13be357-8c08f66bfbamr4929958685a.28.1767061675239;
        Mon, 29 Dec 2025 18:27:55 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0970f8572sm2447446985a.25.2025.12.29.18.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 18:27:54 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [RFC PATCH 2/3] media: qcom: camss: allow endpoints with no remote
Date: Mon, 29 Dec 2025 21:27:58 -0500
Message-ID: <20251230022759.9449-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230022759.9449-1-mailingradian@gmail.com>
References: <20251230022759.9449-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera subsystem is part of the Qualcomm platform, and common to
devices of the same platform (minus the devices that may omit it for
some reason). Different devices of the same SoC connect the camss to a
camera sensor with OF port and endpoint nodes. In the devicetree, the
SoC dtsi is responsible for defining the camera subsystem and ports,
while the device dts may connect some ports to a camera sensor and leave
others disconnected.

Currently, the camera subsystem separates SoC dtsi and device dts by
defining the ports in SoC, then using the top-level &camss label in the
device DTS to connect the ports. This is the standard, although still
disliked because a typo can cause the device DTS to define the
connection to the sensor in a newly created, unused node, with no
compile errors.

Another option that functions (the camera is exposed to userspace, even
though the approach is disliked), is defining and labelling the ports in
SoC so the device DTS can use the &camss_portX label to add an endpoint
and connect. This is disliked because an endpoint node is also labelled
in device DTS, so it adds clutter to the labelling.

The option used in SDM670 is to label an endpoint node, but also to
disable it. The device DTS can enable it to connect. This does not work
anymore.

When Vladimir clarified that the SDM670 camera subsystem isn't like DSI
because of the disabling, that gave a possible path forward. The option
used in DSI is to label an endpoint node in SoC and not to disable it,
but to leave it completely blank. Any endpoints that have no remote
endpoint (i.e. endpoints that are disconnected) are skipped. Skip the
endpoints with no remote node to allow an empty endpoint to be
pre-defined.

Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/r/e9dc1a6f-156b-40aa-9209-2010464d54ed@linaro.org
Link: https://lore.kernel.org/r/488281f6-5e5d-4864-8220-63e2a0b2d7f2@linaro.org
Link: https://lore.kernel.org/r/95704b74-52e7-4831-bc93-d4d7aa32736f@oss.qualcomm.com
Link: https://lore.kernel.org/r/79e2bb5b-9bca-4712-87bb-e0371b36bf50@linaro.org
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/platform/qcom/camss/camss.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fcc2b2c3cba0..e9f0926ae92a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4092,9 +4092,8 @@ static int camss_of_parse_ports(struct camss *camss)
 
 		remote = of_graph_get_remote_port_parent(node);
 		if (!remote) {
-			dev_err(dev, "Cannot get remote parent\n");
-			ret = -EINVAL;
-			goto err_cleanup;
+			dev_dbg(dev, "Skipping endpoint due to missing remote port\n");
+			continue;
 		}
 
 		csd = v4l2_async_nf_add_fwnode(&camss->notifier,
-- 
2.52.0


