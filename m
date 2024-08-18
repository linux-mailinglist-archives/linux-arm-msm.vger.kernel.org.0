Return-Path: <linux-arm-msm+bounces-28894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19922955E74
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 20:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D01F1C2098E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 18:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9063A14D282;
	Sun, 18 Aug 2024 18:02:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADDCC8CE;
	Sun, 18 Aug 2024 18:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724004169; cv=none; b=iO8yRx24YN5e5vSJDDBL4t/U1+L7Eni0Od5Ktl1zAHtk+6F8mH/MnZ5emCy8YYJLpr3ZFMCpN5XO1O3a1dlklL3DvtIjiBUCWinD0EncAtxB8uCktr/W8TUFNT2mOnKXP0GgWYV1eU+j0+gJMO3jwGRbnaudhWXifCRFjXyBwPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724004169; c=relaxed/simple;
	bh=g+jXiy6543sBjNbRGouwqw6kRV97VZUZhB0qQAiu3HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DejJ4L7ON2rnKPbg4CNgr7cK4iA5XkIFHaRWU7CVQImlEHQgIK5dG38CPcBkwMbRUGuNx1EEVTnG/Jgl+u4VR5qxL26luJsptNuTFeRn4HvkuOqY/nT/5b/sI7ixaXshIrQj50bNWiBkC+CERkwQg3afyRu4xDUkD74F/0iFsJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428101fa30aso27809405e9.3;
        Sun, 18 Aug 2024 11:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724004166; x=1724608966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Di6gZrKVdDYoKgr0Xt2+aj16wU53T1dxuLIdBnGwDgk=;
        b=V3Ya+jPINJlRHx/U/EuGX7UZgAU96Kpf6hqd1XLDLwXgmAQPBWJ1X6zquW1aT3wRb5
         Ne9XTk/dKsWVO1DDVmn7KcQgt+yeZta7ACRnvIN/H/qhx9yfQ63/MkwFCs9oe6RAvgX4
         eJ5fBMo43aosrvvGfpL9EdM8nHztf2NQflNWy32LSW8rUNRecnpqEMqxCCJl355sRyAT
         Vi/a0v8U2SyvcpgCGf3ZSY08OREtroXU2pvnGNTK4mqWZxFjb0UNG72ZoWNJfQPajVoE
         WoIFtEbhCIABpQJKQwlL4A9dI1ZK7kNTxxk0GUW6UWa1chquoqgt/8t1ysSHEGCp9rTV
         BpyA==
X-Forwarded-Encrypted: i=1; AJvYcCV3lvJXJSQkGDA66+rw/eXK1LGXDOyzZ1W7Hxfe3c0/u7JHGlAiOJhWapsc/BM1ds+JgWZzyhURMEZIivPGqmfyVajf8mHFfEZsugC7ZjBPoJY/dLZ/jyAcUWEhI5viMEK7Jzp4YyxhQi3YySvC5E+H0EMfCwaWN4/zfIVGaYUY6Pw4HxhPvz9Hly4EN0AdwbHQYFuPiHWnO/dOmSc6LiDRG4Q=
X-Gm-Message-State: AOJu0Yz/rkSXCD2C9MPiTz8iz3DjvrW2XpGP9J6+D66gUTI7fyI5Il6g
	ZOlDdnA0yfqJFZOVbHcKfx6QVOttLt0thzwTPaHzX8Z6gP8gMiz9
X-Google-Smtp-Source: AGHT+IH7PC4O26j61pOK1QoFNDy019FNR79CmFhoNtdpr3mTf9smt7iUP6E71asYVKWvWTYwZ+3WxQ==
X-Received: by 2002:a05:600c:4594:b0:426:63ff:f763 with SMTP id 5b1f17b1804b1-429ed7e3351mr51906395e9.36.1724004165778;
        Sun, 18 Aug 2024 11:02:45 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-371898aadc4sm8569189f8f.96.2024.08.18.11.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 11:02:45 -0700 (PDT)
Date: Sun, 18 Aug 2024 20:02:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	quic_imrashai@quicinc.com, quic_jkona@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/8] dt-bindings: clock: qcom: Add SA8775P display
 clock controllers
Message-ID: <5kaz5wcvxhjtny5yy5i2e63ylzpor74lknvtvdkgpygxkf7yim@m6p5zof755lp>
References: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
 <20240816-sa8775p-mm-v3-v1-5-77d53c3c0cef@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240816-sa8775p-mm-v3-v1-5-77d53c3c0cef@quicinc.com>

On Fri, Aug 16, 2024 at 12:01:47PM +0530, Taniya Das wrote:
> Add device tree bindings for the display clock controllers
> on Qualcomm SA8775P platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,sa8775p-dispcc.yaml        | 79 ++++++++++++++++++++
>  include/dt-bindings/clock/qcom,sa8775p-dispcc.h    | 87 ++++++++++++++++++++++
>  2 files changed, 166 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

