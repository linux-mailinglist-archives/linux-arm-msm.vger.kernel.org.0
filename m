Return-Path: <linux-arm-msm+bounces-28892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252EE955E6C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 20:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C45262815CB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 18:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F209D14B087;
	Sun, 18 Aug 2024 18:00:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5153C33999;
	Sun, 18 Aug 2024 18:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724004008; cv=none; b=KebSWWvzNwN6ec75s76Kuf1IWrb0vJT4edjBXvKkxdZ13kjHea5S0+zo1j5KCVA0BfNsCZxVzXaem78lhSAMAWEZ1ahiOhpTFVqP6+6EpU4BVpU12v95mlXN+3cjHFeA89gNltmcRTEBmmN2It4cofgH93BkwIiL+kq01PApRdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724004008; c=relaxed/simple;
	bh=kfqsfv57DVDS/vp7L8IMA2Y5h1vow7qmksD9p/I1Yqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRhT+DNjmISyLAwHsRml0vmvmh139KUbTunMOISYZesF+tCu1G/kVFAj/C34FnbCNMuCEIyTWAqOxXkkMrZNKGWXPUfEr+uS19mqb4sFs75Q2BAmY31+cGt0Z3+y9xNYpVzEFG23jArF/rgK5JVj/S30dihddDF8+4yXxq2XzsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37182eee02dso1787991f8f.1;
        Sun, 18 Aug 2024 11:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724004005; x=1724608805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xv5kxdMF0HY3Xx0ovqxUG45Dd/e2FxVGmprSK3V/Bf8=;
        b=K30U6dweiYgICO9DBU2P8y5gB0UwBc5w6vWc32jriYT1UZ6HK8qiF434K0gbkJ+neN
         456yExwcz4BjXvZz+x6v3C5/I2Eyz/BYHFNXvM57of6Xzq0yngOfQsodNExHNOhNlytp
         W3l1cNu+OIrTn0vjeFOnP6qRxnJe6fXHPotC6Fimo51U/eMLWa7/InjatsXIoiqz2oFf
         Dp///zDQaImri4k7IMv3wqAjrEgiKopgullJd/hsjU/xuXl3sWmsblGtf+EStx6W+ZGW
         ycrWepn/vVQs0bhQifnEfmWdLDDEGmlM/nauoRrUZICG60yjdIAwkHUGTIQ2iW0bhBts
         Fe6g==
X-Forwarded-Encrypted: i=1; AJvYcCVToPInktZZtu7EVR6eUkMNeuoW0OZwsx3Uwz9wcT75ZzUrnsYZ1dbR3z589QBEf0yPK2J5pxkXGzK7IgPJ/hBnmOUH0MXNswQLzkXoKf7P776nhi+ad1mWvieXibr1rJylQmCRXc2koMT3kiQPrcu3fwerHkspobDiP+KOZf6WlWnt9RyLJxV82h8aWLKZ/2lCsihU6aZjpOERxKD/Z6KO0/M=
X-Gm-Message-State: AOJu0Yw7Xr0cs6bRzACvbnLif1xzUE8a72VFqebM+12fG6E1fXx9j8c1
	URHpq+YXv8/aw/SD/XDajgxTd630VL62bTNCXH0z33J62F0aLtRQ
X-Google-Smtp-Source: AGHT+IHrZK8SSJS6CpKt4gJPEW/knW5lt1z9dWz2r7y2szQ+DSZmly7nlgZblFExw4OUKKjiHYLeqg==
X-Received: by 2002:a5d:46cb:0:b0:367:9049:da2e with SMTP id ffacd0b85a97d-37194badde1mr5540882f8f.8.1724004005098;
        Sun, 18 Aug 2024 11:00:05 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3718983a13esm8562980f8f.22.2024.08.18.11.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 11:00:04 -0700 (PDT)
Date: Sun, 18 Aug 2024 20:00:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	quic_imrashai@quicinc.com, quic_jkona@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: qcom: Add SA8775P video clock
 controller
Message-ID: <wjiosbt2ysmped3iwbxfwg74snqipfve2hzsysbjbxbwgfjw35@7zjf2qghb62m>
References: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
 <20240816-sa8775p-mm-v3-v1-1-77d53c3c0cef@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240816-sa8775p-mm-v3-v1-1-77d53c3c0cef@quicinc.com>

On Fri, Aug 16, 2024 at 12:01:43PM +0530, Taniya Das wrote:
> Add device tree bindings for the video clock controller on Qualcomm
> SA8775P platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

