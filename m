Return-Path: <linux-arm-msm+bounces-78000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D779BF11D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 24C9F4F3CA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6CD3126A4;
	Mon, 20 Oct 2025 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pRj+KyPW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E162731280D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760962719; cv=none; b=eH0DBrjQ8j9B93luuqhhF67DYbTmeLb7S/aWircnJOYz1FBsdwQdsXqEgihLKB1bYucVstPD50c7qgaLR0pIKPN6LUbpHE48x6ikPA2yBmO+o86rK5BI8YXutqtoBA8/sgxQsc51SmGFAQyqGFDS1s48GfKGdwUOYv/EsplDKLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760962719; c=relaxed/simple;
	bh=8a8AR6tiCU6DFQ3mg8jBjjoUZhwx7+JJL0g4l6drVNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7DvFrCf/n/sLz0AshqXiLqiIqYVSqgBJuz53sUODu07RuAYP38J2rWb+RkT4yzBT0oEiXIvPl3PT3Gai4g7Sns38kVWAokiwd6PkatJf2py6+qdg2djtjU+bj0lHpbWS+QVbOOy1QK6KDzeqtwal0e13F8AYoRGiHK3Tw3SJa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pRj+KyPW; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63c49539cf7so3484393a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 05:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760962716; x=1761567516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHtoWy0rW/Dfa0K/dIGZkJv1hj/FYjxxGrknVD25rf8=;
        b=pRj+KyPWrkTIdnv7YGRt0B7woKEkF2ePySDDIiHidqCeT9jsbQWw0tmSutPgBAhJ+6
         m1ikHhzNhPMxiDDRM64B3ZH2TrIlUYNLjv5swCCUkvL3cFzNgDboDaEC9gZrOMOegMq2
         cvSuFABVs+fPUxYl1Kt7QKIYQpvl3kSY2rwdaWZMhArBKQX1iefhaY/fv/OcITat5o1N
         yhiPyzT9uxZha5ZYOzP1Okocw+gGci3uqyZfwHu5vzc/qp1dYUguAIfAbKVWRT0B+0jb
         wg0OSG3O5CYN+1nE3HoOK2kSp09Yu4gAYVzVJzHR/LLbSzEQFsSWuMUxqLkeoMaozT4c
         UvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962716; x=1761567516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHtoWy0rW/Dfa0K/dIGZkJv1hj/FYjxxGrknVD25rf8=;
        b=sMjnz5mwYwOq0aalCjftZowAI6i63U23vzRrKUBCQ89X6+Vef5Uu5OgfLGO+E4JI+G
         iT2ZRoB5NErEHnB99zGvFIeoSK45ZfIyWOakphFqvTzpOEVFTtaYoV+JDtG6EAStCSbx
         z3sZBfA6wtkMERueJs2lwf2hNFet/k8+kyuzDHldRagS43ZaLVLOkGUrX+t2W+9pQqcy
         K5FnlMOCp3wyV2yiTv9mnAJW4AGzTV/HZYWR6Vv3GeOshp/f226CnAHMlpzmCfEcbKxe
         UeQey9w2+vMVtcvaDHn0F7IQ9C5h7/Dzf3l2YY2goL2yHlQdvWwsy90WL5Cu3NzlXDau
         NDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYzKV2EI0cD5DQ7GxwIHN5GWLk+aupDOqQ/Q4yj4NvLjjWzTNZI5WF7Ne0VqlqDbz0ntNXMAyHcFCLovn4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+6Y784AIS2O8avQpR/tJew6nwKviK+SAQG2Y/MvwK5QMhtBvB
	+gnAKTX+2wLRRpFOe/Xq9VLjhLe/RlXT6xUVJmfBZGGMFNH3Y9LowHuFLx2Ga7fKsV0=
X-Gm-Gg: ASbGnctnesGTCxthVPcH0f+ArVX2BWtM84cmJJ6Ux2GeeEn4Sv87p7HXvxG43YhQ1Ex
	zAOF9TOQ7pKRimmBr5XHjS3Zcz8b+fb9dQocobRhBpQ1n+zadn7nE8yBLUsMPL/+ODnBxfWgylh
	ZLpf9McZxyDdbrSF/GY8ks11EaaPIuYhi9pe3RiMVYV8q1anNeXjKOZkhVhRMGwgzNwSI4zUXZf
	7sdtEOKq+w9Zs9b9tShzD4FvvpfLRE8xpNfqFvhC7OYcPl3uePaMAts6TW7P2DsjQs5xxco0MIJ
	PYJBmyfxZUXo1XqpMOy+MeavqxP3gF9qJT7GRAqqmKVuWmXH8S/mDRCpSooUd85F45ADNrA74/j
	gGhgae8cyQq9VSsoFoHR316fe8MN8tQ+PEN/K7yPUARlAuYd7yVjKKCGM6f5ec2Ka4ORQGcFWRT
	ylEV+6YEg=
X-Google-Smtp-Source: AGHT+IEYTKLbq7qE2pr8wxA/yckx1iXmo+BlNHAbmHOkOmRXJq652IxDbU9LA6fH4X1E2sL5qKkwnQ==
X-Received: by 2002:a05:6402:2787:b0:63b:efa7:b0a9 with SMTP id 4fb4d7f45d1cf-63c1f633e3dmr12601718a12.9.1760962716133;
        Mon, 20 Oct 2025 05:18:36 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c494301aasm6738466a12.24.2025.10.20.05.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 05:18:35 -0700 (PDT)
Date: Mon, 20 Oct 2025 15:18:33 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdx75: Fix the USB interrupt entry
 order
Message-ID: <w7jln5k2xaq3iu23v2z3auoychicjgrbpvavsbvb2g2fjk56yq@sramtyump6s2>
References: <20251020-topic-sdx75_usb-v1-1-1a96d5de19c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-topic-sdx75_usb-v1-1-1a96d5de19c9@oss.qualcomm.com>

On 25-10-20 12:13:38, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The DP and DM interrupts are expected to come in a different order.
> Reorder them to align with bindings.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

