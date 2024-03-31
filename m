Return-Path: <linux-arm-msm+bounces-15854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BADF892E37
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 03:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20ACDB216D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 01:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5433F4688;
	Sun, 31 Mar 2024 01:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pHKamGTk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D585B10FA
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 01:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711849010; cv=none; b=fg790WBV/7fzY2OrlvURdXqQmSv9aOKVMrx3r2lV8UOQcAXpUzHa3idK9EhxU86J33st2rVsShY/2sAc3AdjjuDAI0E3Ps5Hnx05Tdo3aTyhsDh7lh4Kre9GXDzzApCdHNEvpvXnHeQB/nqGiPvOeuEwKzrWLm9hEnaXQ36hPY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711849010; c=relaxed/simple;
	bh=EXKQs2yHznRuQNdL5NyjxdibUS87VDcxqibYqOefYFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mx3KXCGn2Ljo2mHH9cCqs+Jtnyzcis2+2dovhLFkB5gCPvU4Pwmrn3hlNtDbKaHkYcWie1PYJfdIWMbY0FSiHXho6nH/ZNWrEViVp8664eqspCsut8mxX7WC5YUnRznBL0w/8XUdJlza10XA9l3hgxWXuZVBWpjjF1AqyLa7nFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pHKamGTk; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-614ac329a1dso1393277b3.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 18:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711849007; x=1712453807; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4dFkRVydPkaE015eU5BNJh990ZNi0Lf5ZRU1eS0SWY0=;
        b=pHKamGTkFPGBAu5+CBVZ49MUJGvVOC1bv2R5ubBXmmCwbuD1tgNUTmK2n9SOBlqpal
         VfhXGG7oe+k9+JqVQEm0/tP6gUhEy7r93dPH85ISkHeMBbx1+X2MOm7dxH1Te8YgCkdk
         ZaGrYgrBwuGVs0P9HVmIcULBk0K/iRL79VF8PxQadUI/QwwP0gNW8pn0zGjjx28Siw4J
         1t/CFaTxQl2gCqezj1HInIgu9EI1le86oyeSgPwYV7UdeuiYF+U/X9RSIF2DRi/26nOy
         iAYYbpZLqV1LcnZz0PD9SOzt0Xc22n99Fh+NePuOCpvr/Hftt7f5ibqhBmGXk3GYiAYn
         +qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711849007; x=1712453807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dFkRVydPkaE015eU5BNJh990ZNi0Lf5ZRU1eS0SWY0=;
        b=cN5rlYJNQHPhe8oElTKEfw9xk6AdCt3/XytxHCHaWXMnTBjoiJH8Sk+iRT0gNntE7t
         968v1bL9M3IAPQ3PCSSBWTTu3lLkaGDEZaQSPiJp4cmNED1KQ4pJm3g3FbzgxUhRYgjI
         mk66tJYWE5/wR7n4eJI3tKAf7ncefET7+Gn+tbP4Y2UVEZtZTR8zXNtZ54QpCVmcS6t/
         4R3wCzgYegSDymx2JuuhbV/6h0a9fENIYN5DPxri/X5UskQK8KeYOgVbj7W7rMo6pVN6
         BCe1Sq6PlbZKu0yKQ3jsy3GH0iyweY74QRkWTt5kY9uhAdKVFqzBLgGwOOdSDczsYJ4a
         V7+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCHZJa/8OrDg6PIye/8K8HZ0k3atijNy3VErol2nqZSc1FbJujsLQFvEc85GN27HkDw1AECW92+ZvQ3gEV/8gcxqd/NvpIYG5T26fsjg==
X-Gm-Message-State: AOJu0YxZLje5wcINrpZbFutEB6TKygDhzA8N7DHvPb9rQ2yY/uXWTYcj
	LplbXYCPfNtSp0xvOsBYj1gF/cI8v9mLo4Zo9t116xsJJfr81/bGUypFCFeTWSX6ueE5zInjMdm
	8F69XO6ZlrVw0nFfItYIz8bV31zjIuFwwmRfH8Q==
X-Google-Smtp-Source: AGHT+IHAjPkSd3yfAE7NxKWJXWx1xvCt643u6rPv6idQACrkemOcNCuSb2gCAYq8f+RLRMwcZpBCFbJctjz3VUfO1z0=
X-Received: by 2002:a5b:f82:0:b0:dc6:b617:a28c with SMTP id
 q2-20020a5b0f82000000b00dc6b617a28cmr5201001ybh.5.1711849006870; Sat, 30 Mar
 2024 18:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240330182817.3272224-1-quic_ajipan@quicinc.com> <20240330182817.3272224-6-quic_ajipan@quicinc.com>
In-Reply-To: <20240330182817.3272224-6-quic_ajipan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 04:36:35 +0300
Message-ID: <CAA8EJpo+RDowyrrAWMAzotdZFZwjZU77Rsb3tX__V0qLPU22Cw@mail.gmail.com>
Subject: Re: [PATCH 5/7] clk: qcom: Add CAMCC driver support for SM4450
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Mar 2024 at 20:30, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
>
> Add Camera Clock Controller (CAMCC) support for SM4450 platform.
>
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig        |    8 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/camcc-sm4450.c | 1688 +++++++++++++++++++++++++++++++
>  3 files changed, 1697 insertions(+)
>  create mode 100644 drivers/clk/qcom/camcc-sm4450.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

