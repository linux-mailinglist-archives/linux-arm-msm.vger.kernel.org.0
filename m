Return-Path: <linux-arm-msm+bounces-77926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAF7BEE8E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 17:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43BD6189A2F0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 15:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CC21ADC97;
	Sun, 19 Oct 2025 15:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pXn38SEP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DFC2AD22
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 15:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760888604; cv=none; b=nfeuRQeAdxg3BlYFH8qRPVDCFYJyVLQT+QisLNSTCerRdHcVT6UNKDCBckoXorAUWLPHKWG1JheFXGb2Or+DszAIyaZai3l2hJwpLIEaHBYlnP3x9IaHJ7Hvu7zGKJT8xGzhyLYg6QoEuKLeiboBKep4upSK3UmszSgZhAJNPPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760888604; c=relaxed/simple;
	bh=zOgFDFMH+2xwjTfGmnxCyniM7hXdqEvlv4hRW9M9HWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8cUukbBeXPhuikdJ8ER/S9RDQGU1PoMry0WSeqNcT6kvcKn4d2PnC3CMkkGxmck+eaVOiyR49T6wsXzZH9aiLDnODeGXI9TwQJTnMu5S8Bx8KwcaIh05uw+rhjuABSmsnJi4rgGAoD/PwA1ne+npAq7/F2T95+0+LOgYFwaIQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pXn38SEP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47103b6058fso24994065e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 08:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760888601; x=1761493401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EUr/HT5GdfdpAP+uGAqN8uEBQXKUdVxJBVCEqLCwkic=;
        b=pXn38SEPxeaImqEtFhztomjO0LuSkNW4TRqiS9Y+sS/I+Mf30jFdCxIuqpYhkxpxoc
         gNbGi4vpdbNP3hfKPa5MnkdXTCJ8+pKkACIDNJ1CIOowdPA9Qe2O6R3AKOuTemgYZJpe
         hj9Ko+5QeYkXy+XPEZu0qr3R8pmXtM7sts3ym3yIvCxKhFGVsiBwEZErDyMmq3q49X59
         WGIDomYG6hTX7nexZV4Nul2gO438STbNmVfca4Xw4b83b5BQp0q8n9Zc/8SZ1YKVepEy
         dLrSYbv4a2vyc0Cs97WJlDo0LtodHMSsC5rJkIiDXBHOBhZviziycp7itYlCuy2H75fR
         RCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760888601; x=1761493401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUr/HT5GdfdpAP+uGAqN8uEBQXKUdVxJBVCEqLCwkic=;
        b=a1VMftKO2A/tX8w84CX7tbunJt4+M7QeOWS4EFIv0yAHZUJSJr85ybIjXSy/+8Eygk
         bQH/+R+uhDYC/YhjXL3v3Zoqw6W9UD+zIntuFXKrnobN/mz5KUWCdJE5j4pu4/DGDwJZ
         1OKQ92boqGa6hJa+ysGaiIqhUZg44yZuIiCOmyEtzYB2HdufBxW/GuVnCNvaeeZpL4pi
         utg0FYDYAiuSS+q0xhTVJcaj5PV6l3rMVOZAqOl2tv4dV/NOPFQDFh56BbImKPI2SdwA
         eHS/gwGyXBNNOFqHAVcd+UWxvcms2n0XkZ9p45d/aEKVeWuIANyoMxWLV/TFYkZZoFer
         9SHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYT+T8hD30ZTZPhW/WyNn4fOIxPrxIv6u7bpMBlbuU7cBU+hQsCLMYAl+6YrlXQOw81WPWdNoLACXuJeqS@vger.kernel.org
X-Gm-Message-State: AOJu0YyVPDrmSF5IaZ7AoMr3iA7IVunV0bRWcB9su2DluqjAHV0UWoKA
	MksJT1OdBQaWy9oKo/IZbIv+WDs+h+v8pp2n/YTQfeFv+Oum5hSRkTB9+fteRsTTUq8=
X-Gm-Gg: ASbGncvqHxfp3sPAYJnPIMco0YTTcGJLZNCix27ePS++McS1ODNBoQRwPBFJ8wQD/vf
	RytMcI2sFMZZcJhwzjRkAlpfTXHEu3YOAuw/Gpox3i6LYOwIlz/Hk9xVbjzXHGNRzAj+W0MH380
	dGGxghlU/iOtT6kQ055diiwOLwoj5NJm9rocp49O6a8Vla+OHlpiluA9Thbnngzw1VqSB86wFIu
	IDcH08YwzP9bo1Rt1VQzoNUYDwqq6HTxPTkva4FaXqBsi3Tl7M/Z24IsC5ozA/YlRhWST7L2ECW
	Sq019j/w+iTKB/yC5nbzc5swsNqk4fi34vlIiACxE6kG0dHB3oolKPDSdxlepAMaJNrDe33zkqL
	699H1Adq8IaH9ttKgoHOyJYPlg0hE+YzdJSXtakK1Mj/yl/eFCWc7XXEHD6uW3DWzaEd1Eh6fr3
	gA80vBDG8=
X-Google-Smtp-Source: AGHT+IGJaFTKBG1axeoh5yYjZyMcN1++OBgdmC7QlvOy86QSdbXxx0ZA+KHhVZA7w26vZD2Y0J/nug==
X-Received: by 2002:a05:600c:c0d2:20b0:471:704:64f3 with SMTP id 5b1f17b1804b1-471098fe592mr88225155e9.2.1760888601212;
        Sun, 19 Oct 2025 08:43:21 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144c900asm188000445e9.16.2025.10.19.08.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 08:43:20 -0700 (PDT)
Date: Sun, 19 Oct 2025 18:43:19 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] clk: qcom: gcc-glymur: Remove 85.71 MHz USB4 master
 clock frequency
Message-ID: <yr6vld475g7lkqjr53tnyllkdvm2zyclifwpm5ljlhg353dbsd@jy5yycwmf4nm>
References: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
 <20251010-topic-gcc_usb4_unused_freq-v1-3-4be5e77d2307@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010-topic-gcc_usb4_unused_freq-v1-3-4be5e77d2307@oss.qualcomm.com>

On 25-10-10 12:24:52, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The USB4 HPG says this frequency remains unused, remove it from the
> frequency table to avoid any misunderstandings.
> 
> The reason it's unused seems to be that the lower RPMh level required
> to support it (LOW_SVS) is not enough for other pieces of the pipeline
> which require SVS, which in turn is enough to support a faster, 175-ish
> MHz rate.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

