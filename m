Return-Path: <linux-arm-msm+bounces-73446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EF4B56CD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7241918910E7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 22:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B509C289E17;
	Sun, 14 Sep 2025 22:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="N4sjPjQB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BE4221703;
	Sun, 14 Sep 2025 22:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757887547; cv=none; b=oo27Sdw8wOMEIH7BW+kcuyik+LGJxCZucztlYz951coXwKcAKcex7BTvFDc0VKNbosBiisK8FmUbvSj1k44ZwbQaOji9vd4kNim+krljq4OAOjyP39YxXwktgw/1uTKQ4GI5mgAg0RgtG9/Ab1ksisNB9lUVEEtwM2LOX2qSQpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757887547; c=relaxed/simple;
	bh=qFiPkWat8cdpZBzK/3FKHWpNrgeiJ1tBgvun827YDfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKI3VTyQAV89t42xpZ8R/Ndl16hXQFkQxn9EAcNaPqV3prkpUI+7CQa6wsRm29pCZQ0FCZz1mnSnwGCXBzZr48WRSrAmBje7G4azagihFjf/58oDuoFS6vX3AJpBzi6iKpDfAbbGkBxwTFIjgT5Bb4YoGBtceksCYh26Eg7oc+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=N4sjPjQB; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cQ2KX2zYmz9t26;
	Mon, 15 Sep 2025 00:05:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757887536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p2Lb0eDUU+reyEvRitOZ46ibWVAxjEfgUhYXpxgOT+0=;
	b=N4sjPjQB47a78EErnipynxhPYj+1VWofg6sXGDISMZ9wEso32SmoVla1qIeUXdrTk03Dnw
	8HoXJMh1o3y7gWaXJuohCX1ydePw7/jjjFQYRyhuihCjXwndrvg/jgtVz+LoKaQoQsUdMG
	PHKFNkI9OjMMMjeTuU/3E4XfMgwr3jX/qY+41T/iTaNPOcMjU60Llns9zi25ZOc0I5mc8k
	9QIUHH28T77jVuYUTL9aevQH30h7lwSLPoClr+oONn9Gu5auLamNN1ARzPawzQLOzqUuuQ
	3O23ouqQ4vMXeQeC7GwQ/qGsHAYa0fgfGdxbbA4ElYktCJxMBUTJslaWWpqSbA==
Date: Mon, 15 Sep 2025 00:05:32 +0200
From: Anthony Ruhier <aruhier@mailbox.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/4] arm64: dts: qcom: x1e80100: Add IRIS video codec
Message-ID: <yw7fr67vmkdrjovtrf6pmjqsbwhfft425krl2j46xmrlc3jkmn@m5iysnhq6m7f>
References: <rPv92n3EVkoRrO1v7nlw_tPMn-nHUhpYhQP_FjmQsESL752mly20FWQqPHLs8JHGC4mklm9wfPABc5kd-x4LYg==@protonmail.internalid>
 <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
 <980b7247-e8a5-40bd-ba20-c9c72c8a397a@linaro.org>
 <aMQJ8Nb7TZNmD1Vq@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMQJ8Nb7TZNmD1Vq@linaro.org>
X-MBO-RS-ID: d0ba793f0241d45ddbe
X-MBO-RS-META: opok1qnuq7hyfdss6hwcxo1gwwcs9zfi

Thanks Stephan!

Tested-by: Anthony Ruhier <aruhier@mailbox.org>

Here is the diff for the Slim 7x (with a Signed-off-by, not sure if it's necessary):

Signed-off-by: Anthony Ruhier <aruhier@mailbox.org>
---

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index b7dc436a99da..6fe93d0a05a4 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1102,6 +1102,11 @@ touchscreen@14 {
 	};
 };

+&iris {
+	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn";
+	status = "okay";
+};
+
 &lpass_tlmm {
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";

--
Anthony Ruhier

