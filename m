Return-Path: <linux-arm-msm+bounces-59044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3386CAC0B91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 14:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDD951748DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 12:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659D028A727;
	Thu, 22 May 2025 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7GLlyr3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788E928A712
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747916722; cv=none; b=MiybQVb4TBdlg4VE92eiIT0Ap6RUUggMlbREUG2KjdECkrmTQs2pzbx3zCkYmrjd0k3gKI7OsyaN3Y7LmpMCSDRMlcLHpLAyuK0wdvNzFzKUv98WzDvZ5w+yEGKK+uoFWn3t1i+Qxwr2U9ZKSJsrMx74VkguDjGKZjEs9LjzOUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747916722; c=relaxed/simple;
	bh=sFWdLCw1yS6Oixnql//xrLxtUNnFBMyddbYGl5qZkwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QiZujMXlbvVlXLZ0VwvtIc4+8W38hcHh6VfLbhIIC9XBD5G33viWVuPo1Nw1r7ri4oTaVOHojHbNSyfuoRpBMiSojlsM157k1xN83D5TuNT6KpIGZ56dO/BVXB0+fcka715PQlnb/Qrgvs5Qp0Re958LrVH1YWlZIh6i0+EJqOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7GLlyr3; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso1344334966b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747916719; x=1748521519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WZuijAJRPJZ+p2n09IvIvH7D3TfvZOkc/364B+Mx6Yg=;
        b=F7GLlyr3J8I40iVu60gieSuE6EbHSf5P8bEd5b9y7xNgXExSYfOww2aW2J4RyX+UQW
         VfNRN/kQ60w1uGwoGxbnXJx91atiOkfRB4dzfd/18P9SbuTQ6EAoEcDFxUzTuZ6q7TmW
         CARzeBbGxoe1r6zaGr79btguMPIhjLV1mvSqUh6GVD2eKO+x0csYVWSlQDGwXl4p4zOm
         a0u2hENVBcZLDU/qBXzcLn6hR3Vikxo0IeqqEp+A8Muwxvb9x9LoLVWpC89FE+Gu7pGj
         Tqq/jtwVGaTKlTqGrC+olkjp2EYfHXdeEbaNpuzkbq0cxv8AjEyks1Q42+2VkZipNHDe
         IItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747916719; x=1748521519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZuijAJRPJZ+p2n09IvIvH7D3TfvZOkc/364B+Mx6Yg=;
        b=ud0DvwlzI/7+Gupujj+AV/x1OW3tVTJnNhz3zwkcFyD9fAP8jodneXhvRKEM1xrWA8
         tYJtsr5d/q/MY9xPUyeWMVSVegkbuX2Y2zo4GA3Hz5zKWvPLW80WAIlrMnnpO8BXbawU
         7m6vKPr2CtbWNXczNHle2ywxuHDCwIQIex3lC7PMq4D7rHK75rfP+6XNhmaaMRc2ooog
         0CHKIx4Auh5SQWj8PjIC3j//x+E+gf/9FxZtd0wbhwUjuHXwZx8C8RiC382p1sYUEFPf
         FMAtjszyoRQTkJwmvBaGLGogpkUCFQsAKjmdeSPdDHYNpOV0rewhV3by7jgl/o8UFtZl
         NlQA==
X-Forwarded-Encrypted: i=1; AJvYcCXSrIVB6GhRneFdPetmUYlWr84vks2HFmoso689B8Fgsm38KlJ+KEJjg2lXhFqXHDzJsDZbkFw31DfuPDR7@vger.kernel.org
X-Gm-Message-State: AOJu0YwrfvnJz4yIMvAo3VmdQQFeJugFd4SIxHX5pDX0Xbl2xq5UdYzu
	nIoMJ+H31EOvdYQi8T9Mr4UMsNGb2MenVhODWC4uSk3b1qaY3ZqP14j4Yfy/yysM/W8=
X-Gm-Gg: ASbGncsZrWmeFGc1IYbgC3BufUynMoV9Gh9nds0heBCyNdAXeYDC7WZa9gS2TZQJSyw
	csUhmHrs1RXhqpETCRZAXAPl3aXthuWJqNa+o4My2Fu5UiWsx/0zd+6sztWfKt+KsCPK0zGfHNN
	wtsWQUHMNZErrQsflUDQuHWas6SU2+TQvo5V7rR88qjuEZvVsgVv1ohJzaWUKG3L0Chx+61HadT
	EoYqlJ2Ad9GW/UViqd4+Py4vK5vlUnW0MPwrzJmpqxH1eyyzcYYIzugYp6FxkCHt1s52BjftGrr
	zPdAKNr2tF+FZMoqx6Jw8cXCNGgG+de1/uV5MnewpjavfRv2
X-Google-Smtp-Source: AGHT+IHcT2PY89g15o0bxhhQt0NPg7NGUlq73S+uSn8e6SJg6l2RRfQQixZwQtfKRbnT5KPfhf/pwg==
X-Received: by 2002:a17:907:8690:b0:ad5:4fdb:a2d6 with SMTP id a640c23a62f3a-ad54fdbb14fmr1991573666b.43.1747916718712;
        Thu, 22 May 2025 05:25:18 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4ea7b7sm1081211266b.177.2025.05.22.05.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:25:17 -0700 (PDT)
Date: Thu, 22 May 2025 15:25:15 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <aC8Xq949p6NNDXa7@linaro.org>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
 <aAswZg9s41s/m/se@linaro.org>
 <f7de2bbc-4925-430c-b263-226a633e4bfb@kernel.org>
 <CAO9ioeXzzSBy+wYFATeckKZ2641GaTA1dB_1HOb238DdB7ACoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeXzzSBy+wYFATeckKZ2641GaTA1dB_1HOb238DdB7ACoQ@mail.gmail.com>

On 25-05-22 15:18:00, Dmitry Baryshkov wrote:
> On Thu, 22 May 2025 at 14:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 25/04/2025 08:49, Abel Vesa wrote:
> > > On 25-04-21 15:00:13, Melody Olvera wrote:
> > >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> > >>
> > >> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> > >
> > > Nitpick: Drop the double space from the beginning of each phrase.
> >
> > Sorry, but why? That's a correct grammar.
> 
> 
> Being absolutely nitpicky, this depends on the country. In some cases
> (US) typography settled on using double space after full-stop. In
> other cases it's a normal space.

Okay then. Please ignore my comment.

> 
> 
> -- 
> With best wishes
> Dmitry
> 

