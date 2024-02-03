Return-Path: <linux-arm-msm+bounces-9720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFC784885D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 20:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0B9B1F2304A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 19:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601985FB95;
	Sat,  3 Feb 2024 19:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="ESCF8mdi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B4E5DF19
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Feb 2024 19:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706987550; cv=none; b=pHRsUtmhVWOgcF2GGHH0644E2kKO77+vM+lHvnP7p/qII6KtoSWwW/h/CGbcOA0z5Otj4+STH7SY1ogsRyOaqTdlnDyOeZhcSczYzz7Fo6XkbZXmBof0isPHr1nyxobWHIi9pryeoMVa8ODe2fZLSs4HQwJGl7OCqGnxIW9iafs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706987550; c=relaxed/simple;
	bh=u1QLkA77qJUV2s+haADuAyOF0wOezvuTZRjcx5x6hLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l0fSaATLP2VJyD57Z1lP7SmBH+76t0/EpMaSlbDj/mKtwdmmQU2jIHokBXbJpuFYPt2DkvdM57D7ZQLPcMjN7BS7Css35C88WhWqwxGML1D1ZceC5yLVqmK/ctWovUHI6OIMLQrLeNhZUfRAK5PCIHHmQUA2tB5qzBHWbWP7V2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=ESCF8mdi; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1706987545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D1MXZI9L74r1ABpx4pzdB40ULzWPeZ87x2jaWvvAELo=;
	b=ESCF8mdiLBfK3pKZmMQBhWkcZgZnntajRFUJyB+aEmrPgzwd5JQyY1XUePSvljVefCa6uR
	eoRaVolnRbRc1IgauUP0Usl4KLcodmvNQyJhbbwfCiCYIGysQgvJMVJAsiPVHx/yuzNPFR
	+sAkJv2/IchL+n37XRxl5PeyyVAOoGhXJNd71UdQMzZdgpqNj/vZQ6IXxdpfm/I5hy4XJl
	6sdahhDl9iiJBJ8mUgrLbBNNK9j/B6H36vl7jjZgt9dELga61G394fnTdjuyJQSWwvuA/H
	N2vo/ZxgC3ySA3Umhu/kVR1SD7BL1r0z5Hqunti3MY7zLqwUjeKAg6Yu3UBSUw==
From: Anton Bambura <jenneron@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] Device-tree improvements for Lenovo Flex/Yoga 5G laptop
Date: Sat,  3 Feb 2024 21:11:54 +0200
Message-ID: <20240203191200.99185-1-jenneron@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This improves device-tree of Lenovo Flex/Yoga 5G laptop with these changes:
- fix GPU firmware path (make it use device-specific firmware directory);
- set names for i2c hid nodes (so it is clear which node corresponds to
which device);
- add touchscreen support;
- fix touchpad issue when it gets stuck on right or middle click;
- allow UFS regulators load/mode setting;
- move some pinctrl properties to appropriate nodes.
---
Changes in v2:
- fix the description for touchpad i2c patch;
- move touchscreen reset gpio pinctrl to appropriate node;
- add a patch splitting and moving some other pinctrl stuff, so it is in
correct nodes as well;
- change touchscreen interrupt from edge falling to active low, because
edge falling is apparently against i2c hid specification, and ACPI uses
active low as well.

---
Anton Bambura (6):
  arm64: dts: qcom: sc8180x-lenovo-flex-5g: fix GPU firmware path
  arm64: dts: qcom: sc8180x-lenovo-flex-5g: set names for i2c hid nodes
  arm64: dts: qcom: sc8180x-lenovo-flex-5g: move pinctrl to appropriate
    nodes
  arm64: dts: qcom: sc8180x-lenovo-flex-5g: enable touchscreen
  arm64: dts: qcom: sc8180x-lenovo-flex-5g: set touchpad i2c frequency
    to 1 MHz
  arm64: dts: qcom: sc8180x-lenovo-flex-5g: Allow UFS regulators
    load/mode setting

 .../boot/dts/qcom/sc8180x-lenovo-flex-5g.dts  | 85 +++++++++++++++----
 1 file changed, 68 insertions(+), 17 deletions(-)

-- 
2.42.0


