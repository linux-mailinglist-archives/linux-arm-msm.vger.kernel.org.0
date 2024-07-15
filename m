Return-Path: <linux-arm-msm+bounces-26234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CBE931B15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 21:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8CE42831E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 19:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A76137930;
	Mon, 15 Jul 2024 19:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=patrick-wildt-de.20230601.gappssmtp.com header.i=@patrick-wildt-de.20230601.gappssmtp.com header.b="cXTiYOxj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f225.google.com (mail-lj1-f225.google.com [209.85.208.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB16130E4B
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 19:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721072299; cv=none; b=egc7ZGwc8S0gH4D33XufQ5JvFzfdVsvu1mPSAx4kO+/Fyj1JF1xVeVBC30nIAo7dOwXjh9sUUGzXTY4TXWzpQAxeXkEWcep7j5sBafjwUH0ofKaO1AyoHgEyvD3145fDpF+Mk5l9HSpgAgsohLCwXY2sx6372FVOMlJOlHMRJsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721072299; c=relaxed/simple;
	bh=cemq+9OuqeY3+ummp337Mvo5F4mXDIT79m4hgKaBI1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OqsRneVQcgN/O9P7YCZOW6Z4mGkt+X3QoC1kxRnOwlU/7Jl0XqgOIcdnBvLPZR6LHXJttflkTiBPzBe8n0dZ8QWYdODHJQvIAzWpLy+drYU5MFJBR6R90itSerbbp2y0W9+OXO+K9R/hLd/N3cL3EZ/uByZZVuoH5eBernllqwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blueri.se; spf=pass smtp.mailfrom=blueri.se; dkim=pass (2048-bit key) header.d=patrick-wildt-de.20230601.gappssmtp.com header.i=@patrick-wildt-de.20230601.gappssmtp.com header.b=cXTiYOxj; arc=none smtp.client-ip=209.85.208.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blueri.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blueri.se
Received: by mail-lj1-f225.google.com with SMTP id 38308e7fff4ca-2eebc76119aso52975011fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 12:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=patrick-wildt-de.20230601.gappssmtp.com; s=20230601; t=1721072296; x=1721677096; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NFsCI/nUGMHpQYBhPffSAiv0o4Z8VMEXV4FQksJuyUk=;
        b=cXTiYOxjsrz5BFWB5pXFPYwf5UusjMzd5o6+Kwrii5SuKh/2njn3BY9/edtzCLuxWn
         TRzSnXtUIkdwbyAxibs7EOTVlJEVmAxZdOiRsM71pRbF+eNhztMeijNDVSxe2SlziSxX
         EMAq3G5sVqhGIYC9cXO0/yxR9YQaPtRAZPt/RT5idM5vwS8Qj0Rb4Ztvx4wGIlOxE9Zm
         A9B8d2QaYZZ3XnEsbt+aYRGczVBra+jhfdbqUbt/osRgy2JofcSWdya490iHGSHts3us
         lEY5zUnHVMJE+KG82VozYh659abwJ7jmNvY0Jv9S93Ly3RTwKpLBDTkPGEqDFgMdjxm2
         zBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721072296; x=1721677096;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFsCI/nUGMHpQYBhPffSAiv0o4Z8VMEXV4FQksJuyUk=;
        b=RJHp0Cr8Od3PZdJQ02goRC2kD286Q15C1Etko/5IBYpWxw09M0o7Ha1szSWYuTg0NK
         tzwnSPkNzE0u/dljkEIQZk0FvEs9/IKw6Y462kvWQiIecGzE1tZoYInp05blukoOvyjb
         UXdckMHnzQVnk+6ZXW7hgOj++ApPTvgMO4DFDe/2EyX5up9OLdleAOaRSmuc7fUtyBDn
         bQo199j+e1iBD8EpbBy0TqoO7maTmW4yLs6Ok/5F/viA0hEvZ5yNEYCHtff1crLMgJ4x
         in2aZEvCOdbUHSotyjQt3/FszDv99dVpak4p8ccOQCI2Dob5dodloz8ZPvyKK/e+QgAf
         oQiw==
X-Forwarded-Encrypted: i=1; AJvYcCXuCxUebl03rtsubECxyZpdw+LxYMtfwxHHfRfoYjI/uAf8Sah4zp0jgc1ftylD4it/vpLWm3T5HWKoZogzfAMzy5wi+mnqZnJCu86/wA==
X-Gm-Message-State: AOJu0Yzmw1HCAbsUmdXKzYkEq8C+mqrfXfgyOV0YZ3LcrE43/zbPKI8F
	S9o++9rykNEVa11DAyotevWVm8ZvUN4Fwzcl6LTIZR0tOOOk96z5KwEZqbCWSTWjVN7Q+v86/W4
	YiwUb0hZwEz+1ZknyAlb3opzJpTERGvaj
X-Google-Smtp-Source: AGHT+IHjhs7lFn6xanLhyvwaA7PatZ3sOOeEdpx/Nn5lzGlDNwLD/+lV4ElphVBjqkaDIyu0IV9Qs/ersaIQ
X-Received: by 2002:a2e:91d3:0:b0:2ee:8eb6:ff61 with SMTP id 38308e7fff4ca-2eef4156be4mr722331fa.2.1721072295803;
        Mon, 15 Jul 2024 12:38:15 -0700 (PDT)
Received: from windev.fritz.box (p5b0ac4d1.dip0.t-ipconnect.de. [91.10.196.209])
        by smtp-relay.gmail.com with ESMTPS id 38308e7fff4ca-2eee1936872sm625101fa.64.2024.07.15.12.38.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jul 2024 12:38:15 -0700 (PDT)
X-Relaying-Domain: blueri.se
Date: Mon, 15 Jul 2024 21:38:11 +0200
From: Patrick Wildt <patrick@blueri.se>
To: Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Steev Klimaszewski <steev@kali.org>, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Patrick Wildt <patrick@blueri.se>
Subject: [PATCH 0/2] arm64: dts: qcom: x1e80100-yoga: add wifi calibration
 variant
Message-ID: <ZpV6o8JUJWg9lZFE@windev.fritz.box>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This series adds the missing calibration variant devicetree property
which is needed to load the calibration data and use the ath12k wifi
on the Lenovo Yoga Slim 7x.

Patrick Wildt (2):
  dt-bindings: net: wireless: add ath12k pcie bindings
  arm64: dts: qcom: x1e80100-yoga: add wifi calibration variant

 .../net/wireless/qcom,ath12k-pci.yaml         | 59 +++++++++++++++++++
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  9 +++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 10 ++++
 3 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-pci.yaml

-- 
2.45.2


