Return-Path: <linux-arm-msm+bounces-50244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63349A4EB75
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 19:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BBE98E4668
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A5024EA86;
	Tue,  4 Mar 2025 17:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmgxez1k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC859279324
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 17:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741108018; cv=pass; b=oLGNTeQqm79x44okggEf4NI6AuLvyhrGzhxfFEMzowULLqB0woxDwKu3OIOHSa5a4HiTFske0V1dyhIzF0Muegueu8gnwPpUH9brgtZvH0zMWrQr8AkjSZW9jAvnfbKy1TZM3rUwzKyama1y8jfXek8V1VdjWou7ptJ4W7OjsJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741108018; c=relaxed/simple;
	bh=SK1S7HC+F0RX5MreBPa9cOuVM4xw7HiLj2Szt7QCPUU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MpCJ+MfTt/hVb/KrKYup1pCQ9x90bw+dMnGnLP4QY2RwgNgiz5NnuGf9zLicB+0pdfkHejJHceNG2VzPdqCrWur4mkDYjU3XRINd8yMVTdEInIGlj93xMkad25MAZecn4TQD96efAgCs0JKgjpPRAQ4NKUrTssfU5v4vMJJxSZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmgxez1k; arc=none smtp.client-ip=198.175.65.21; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; arc=pass smtp.client-ip=160.75.25.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 1C09E40D977D
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 20:06:55 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dmgxez1k
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6d9m1xn2zFw7p
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 17:19:56 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 8E5E04274D; Tue,  4 Mar 2025 17:19:44 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmgxez1k
X-Envelope-From: <linux-kernel+bounces-541239-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmgxez1k
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id 0772E426DC
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:10:35 +0300 (+03)
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by fgw2.itu.edu.tr (Postfix) with SMTP id B2C1F2DCE0
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:10:35 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DBC9168C03
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 09:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D872E1F0E32;
	Mon,  3 Mar 2025 09:09:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1FE1DF721;
	Mon,  3 Mar 2025 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740992965; cv=none; b=XpwmTRzSe7SYubWx9rE5s5ktJ5Vbi5xYhNqy5WUNpIu7BBZg/fjphMGBsjejy1kQvW1yJmJgVz7vJBJwk/qXfXiq8KFIBQIs5t5RPlwyHzg/MANZuY7MugM2U09RfZX0ev3ldD6JzC84S5/qIyFkS8A3AaQFiVjYrBQ0/1SptBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740992965; c=relaxed/simple;
	bh=SK1S7HC+F0RX5MreBPa9cOuVM4xw7HiLj2Szt7QCPUU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n4PBAXPNtsfsQBO4B0QNkvWzVLv2GPFaK7CvqEhfal4rXtsgL9/LmzK8VWURTy2FcBuq8bQgP3nAezZP1MA5jsfaiNezvPfVxTjP2T4vU9xiGEaHo7hjuyjQH+jCBJD5HNlWjAomwiL5Wbg89Q9YZ2EvCRV61iCHNaAjHWV4s50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmgxez1k; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740992964; x=1772528964;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=SK1S7HC+F0RX5MreBPa9cOuVM4xw7HiLj2Szt7QCPUU=;
  b=dmgxez1k+bNXiZk3rJFilqg43r/gkMIwly0wDZIbnQf0pJ0RrojuifzF
   n+Qy35HqLDDv79hcTJne5PYdrjjlgt57u2TAA/l1AmWb/+RvfFyWa2pgR
   5xMQskhO/5/dDBzGPS4c+/9I0+FK+GGlH2ZLLQ/BRwzDrVZCR15EMHIis
   7IZBpfvrie8Zka4aW5nevgb+pFXJToRyF2AAz2W7qdWci4pQLg0G3gUJl
   AT4xCd1I5FMV9Sxyu8JgnQMpf7+jvbTh2pkAhnbXwF8CIC+tF+SSKNEp1
   SOzVeE/MYEuGKmgltVf4KW2pej63q09cOv0f8xGKsPB3kJk8ScPjKKpX/
   w==;
X-CSE-ConnectionGUID: 1LuNZc6tTjO8CcGvGycE1Q==
X-CSE-MsgGUID: bOuWak5ARBO0YDOvXuRASQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41771196"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41771196"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 01:09:23 -0800
X-CSE-ConnectionGUID: KI32nAl3QpW+0soO/P2K+Q==
X-CSE-MsgGUID: iR1NtjSnRn2CkFWbNEzgVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="117951324"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.14])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 01:09:18 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Pengyu Luo <mitltlatltl@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-hwmon@vger.kernel.org
In-Reply-To: <20250214180656.28599-1-mitltlatltl@gmail.com>
References: <20250214180656.28599-1-mitltlatltl@gmail.com>
Subject: Re: [PATCH v7 0/3] platform: arm64: Huawei Matebook E Go embedded
 controller
Message-Id: <174099295441.1736.4659664887828946482.b4-ty@linux.intel.com>
Date: Mon, 03 Mar 2025 11:09:14 +0200
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6d9m1xn2zFw7p
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741712691.66322@IRmE/R+9sd1BSp/2uCrGMA
X-ITU-MailScanner-SpamCheck: not spam

On Sat, 15 Feb 2025 02:06:53 +0800, Pengyu Luo wrote:

> This adds binding, drivers and the DT support for the Huawei Matebook E Go
> (sc8280xp-based) Embedded Controller which is also found in Huawei Matebook
> E Go LTE (sc8180x-based), but I don't have the sc8180x one to perform
> tests, so this series enable support for sc8280xp variant only, this series
> provides the following features:
> 
> - battery and charger information report
> - charging thresholds control
> - FN lock (An alternative method)
> - LID switch detection
> - Temperature sensors
> - USB Type-C altmode
> - USB Type-C PD(high power)
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] dt-bindings: platform: Add Huawei Matebook E Go EC
      commit: defcf2fb30f7bf128c0be5e571f4db2b7fff66cc
[2/3] platform: arm64: add Huawei Matebook E Go EC driver
      commit: 7636f090d02e791918bb3c924e695880123d0c59
[3/3] arm64: dts: qcom: gaokun3: Add Embedded Controller node
      commit: 0b6d8f9d2df78116afb159df05bbccf13a51b758

--
 i.



