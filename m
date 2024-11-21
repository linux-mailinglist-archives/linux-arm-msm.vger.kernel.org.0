Return-Path: <linux-arm-msm+bounces-38682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E236E9D5125
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 18:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82011287748
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 17:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70131B5325;
	Thu, 21 Nov 2024 17:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KVE8F+V/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91D81AD5D8
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 16:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732208400; cv=none; b=neOTSxwPDNH24AVREkSMw6ISbwuWSuN4P0cJHCaU/Fmr0KPutiB6HzWvGfQk8zrGEZG+YxG5C+ZQyHnUQ+BTsZ0k7e8BcUSKdptwj/mwznj8pYOkJyqNl/JLmr+ypftBLy12i5jlLyGJJpx5mzGyo0UI4rRTEbV/rGqpX7Zq8Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732208400; c=relaxed/simple;
	bh=qJI7JAC0Ed2camEWXFgqiWsh+z80E3RdsXM70TPSvcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nktuTrAPTc0mgpTPrVshMO5U2tOYjGw7FYE/lAJlouaS6hgsACq2XXPDb96AgT9fFcPxcyJM9Lz6AtrGtKF8xZlEBzAeS5WHCP9KhKyrKROlvqMt7hPCmhbt0fjAHhotWTqI5ZhliU4gPoRd2F1iKX5H+LYpvzMF0ZCZJCtVoSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KVE8F+V/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f53973fdso1033333e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 08:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732208397; x=1732813197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4kWmOlhAyvLltjxgfGITPOMja876WfWZzWl3k645acc=;
        b=KVE8F+V/cdPKTlWryJdccPU8fok3PgAhRHpyvS/S6nxWDqXL5I4d4eKXFWuas79cDa
         VWgTVDWZxy2vo83zWJcueTyC+ZRHlEyM1uLJI68FCDR7PbX87z4ZH9amUkREb8wSeFEJ
         ut6D/h8npNnC4Ai1J5jBxSoQQ7XY8uQqAOjWGFUamv3eLY7RIn9iVrG76TrAquvVSEKF
         OaHSO1eJ7eo3iUqdZ4h+KJRjlrpmZPhbVqDGktDGM3WmCQSDrKAoUiTxfzFr6SdjPIZV
         atdR6EuFDJwQjLN3ufyy/P3t+s/MyCk3BgsO9nygxoIwM44wISfdm2pbHXkpiYkS0XTk
         5ilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732208397; x=1732813197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kWmOlhAyvLltjxgfGITPOMja876WfWZzWl3k645acc=;
        b=RirB3zUiwErb906Gxqwn4FbBFIb1ddOm4IadNLbdpyL3rN0vWleslr2pgE6egLKVk+
         Mzc/BCwUryIBs6DgkM2+67uekYL2hkVwT2KlM62u3s+Rp1jXiKMYMSrIKKSu5idYJ1/C
         k/tEsqL6bYdUWGfOi9g+F7VLoo6DJX6XfNsyj7UBUWNYn5M/mAh29xB0cS1oo0tlLB+R
         8lhsyIn2lSknXz4mW+vRmt1tDHHEyDcdqTeu9xILf4jfeS6nThLLTmvPFQaGbeN3pYtp
         +Efa3v8xb3M4q+qyHp/K+02Q2p+DEBlU0zCwZzUcC/iqFetzpXEtPGevgmRs99VlA2AW
         Ga8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXai7LhD9rdgRFWkYMuncl1VfH2geFzFG+K5L96NytPv6TxznztGYzPgAlpe8Hum+uZgnn7f0g34xWDWXM/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8/+hk+LvduRCXW7d1RNPTirF3EcVa3CDuFB/5CdZY7zYfUohB
	Ifhdu6V9lzMUTp4lUV6q8BgLii8tXJqsWXPaWeFCB++/K4sMr1n3XJSZC+I6j58=
X-Gm-Gg: ASbGnctrNj08oSUsjQkm1efkokb8lhcY4d8bc9pMw2r4CsiVhcI1+8YVnu8S3tBkXf2
	RgJ5iJCCNr1YX+mC9X5tNScIc27qILWv5ltoKE5JrmBLY3d51+F3NVBIaZcIqvmZwlALu+UqF3U
	aWhlYVx7J4JEgbCghpdSMtPeGMgAxOYA7InDae4SLkfVs48Wfwu0KftohagUR35n5VXGRb3CSUk
	JEg0NaHuvNy3Q2MBxcZpkF4oA5eutmnItfvyBstwkmu4Dk3vBaqjGaHucauGHy39FgsAB6Y7NNz
	tFzJVpy5uOgqrblO8FopIES5lXiGqw==
X-Google-Smtp-Source: AGHT+IGL3c3ho7r8sF8Xcr9a+4/C/Ler4BcrWhP6ykFH/IDRrpCDlTkssOTbniD/Y/so77ORXxYebA==
X-Received: by 2002:a05:6512:3d18:b0:53d:c861:38a3 with SMTP id 2adb3069b0e04-53dc86138f5mr1426353e87.27.1732208396862;
        Thu, 21 Nov 2024 08:59:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd245186dsm16381e87.100.2024.11.21.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:59:56 -0800 (PST)
Date: Thu, 21 Nov 2024 18:59:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Xin Liu <quic_liuxin@quicinc.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	quic_jiegan@quicinc.com, quic_aiquny@quicinc.com, quic_tingweiz@quicinc.com, 
	quic_sayalil@quicinc.com
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qcs615: add UFS node
Message-ID: <oikbuo3anhiifydvzdsjazbdwqqwt5ssi64sxopjrdiryr5r3y@igj3gzan4ks5>
References: <20241119022050.2995511-1-quic_liuxin@quicinc.com>
 <20241119022050.2995511-3-quic_liuxin@quicinc.com>
 <4bf9ea1f-4a45-4536-82c0-032f72b28807@kernel.org>
 <f5b40d0c-defc-4b91-9313-9e454af22fb8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5b40d0c-defc-4b91-9313-9e454af22fb8@kernel.org>

On Thu, Nov 21, 2024 at 08:41:53AM +0100, Krzysztof Kozlowski wrote:
> On 20/11/2024 17:58, Krzysztof Kozlowski wrote:
> > On 19/11/2024 03:20, Xin Liu wrote:
> >> From: Sayali Lokhande <quic_sayalil@quicinc.com>
> >>
> >> Add the UFS Host Controller node and its PHY for QCS615 SoC.
> >>
> >> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> >> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> >> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> > 
> > Confusing. Who is the FIRST author? Please carefully read submitting
> > patches.
> I retract my comment: It is actually correct here.

Yes, I was also confused first.


-- 
With best wishes
Dmitry

