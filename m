Return-Path: <linux-arm-msm+bounces-77924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C217BEE8D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 17:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 436404E3A98
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 15:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CB12D46D6;
	Sun, 19 Oct 2025 15:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gKxaE94t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C0E1DE8A4
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760888555; cv=none; b=aLLYlE/X8SyOyruxjrrO+eavUOBMqdZxYfMhjVgc4XS5kmKtBzvrI7K1Jwm6ofwfrT7mhOHt/6J/3CF/060xRhSl5Z7eFUNnONaV+DRAuXjUuqw1h+1MWhkoXoXqdaCxL8M5Irxg4mMDKt/6vG72++a4FE/+Fc2SaUSq7IihSpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760888555; c=relaxed/simple;
	bh=PmZlpEEY0Gy0JFWDFJ6XeXHuOCC0Mcbj7188SWxr2/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8R9ZN+ZA9pK69/olusRUGENKrFSjJXNGfeeljPkhyn2h+ma10lkLCCmNGZUPJMgF7sBqzt8WownBgSGU/RCRv/KX/HCmG0oqCo9YAEs68VmTTUDYrSTLXPXMDJDVTCaX6Zc46caNTPjELH2tXQjLY2oew5PAxT8DM8A7KkliPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gKxaE94t; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47106fc51faso41602385e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760888551; x=1761493351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zNWcI2BvDnMLdjyIaXsHEcSmjI5w2/HhMui0bLiWR/w=;
        b=gKxaE94thMAYvR6nKXNpK/F+Od/BuErYt+cdunM+jQlj9cPLNE98sgyQ6z+g4RF6rw
         XDsSllE3pULYq7o27ABIrwo1hn9kZ2RDWqwkZszblxFnft45ag87W/EY2u5asI0c0HOy
         fxZj13hSQ8qCsy/bh7ZPtNKe6o7EZD0XV7n7djZkZqpE6UiehZ4lHyaLJbIMSf/zZFXn
         7TkSQb3hGms1EYNcXaPY+0hnegpYRjAu3Rz09C+asOytXUdyW5c2Bj68Q7R1FiEEc0qR
         MqPAkvyfrfy3h+MX2PUO1FWowJUnf8hjnCF33WYmChMr6waUvpuUtrngHYEOVjJrzOqJ
         QgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760888551; x=1761493351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNWcI2BvDnMLdjyIaXsHEcSmjI5w2/HhMui0bLiWR/w=;
        b=DuFTdlApxZiBR5HJG4iye0pcNhpeMeSdA7dof/sC6TeG8EoIn21LUfiPCPvNsiHUMx
         e9eFFrs9WUhbhbRjcXrnH5ZPm1v3Y+JTYEbXZadTwBoDCFqM+sIAF/ktTXfwsN3l+k9r
         ehgvZf39gjKCjfCSmrYQTMiG5Ph/ui5vyInwYblTkOBuKzj/CfzuSUyPSNWpM4JhXLT9
         9PWSKmOCwlcEqv6vkybkuLLMYALyiGUtzz80TUa5khI9wKOVzz5kDx/Lay8xmx+U3hRd
         k/CJnfCYoUiUrJ0gx0W433PHuETULHTSCIElmD2c1dez2sT6xsLo+QuerkU4voybyrul
         GHgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgOyjgZwgYA3gHBfL84LmfqtYWmiV7moKdfd8n82WYatx9zW22j3we9ERG0LMashMP9+17DO9as+P9YYI7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4wxdZfhuefR3oU5/+OS1/ynl8lIg3nhm8LMlNqJf0Hi0E/yty
	Ck7M/KtyPGt+igLbhej/NM2YqLRnilqJrVv5OiYZpg9l0RIJ3lmiewh2sVr4050t4Eo=
X-Gm-Gg: ASbGncsxPVD4Q/007/XSlt2xEZMef3IqjNOfeC9BlawKPZvaiKYV+AjsnkiUFk9ZFEk
	9RM/hAMIi1N9PsAKH9sv8B2Q5JOIIyjbSGYJFkrLhB7Kt1NGtM8yCk2RKgL2CVH5bUkTXR+Lotz
	IFuzbDVTKcgYU+H09lCmkjAQx29U0zllR6Iw9uo/TRMCU1onnL51x2t3j6dByJUs+nH14uGvV+N
	ZDO21YjC6nWg50F9d/CEkmz6ZmUw6Dv0d8n8oYGUofwEhGPP0NzMvXFjQghiDoCQcOWeKd7HgYW
	PzBypykTPCWWANsWKG01ytLS+MaRQe1G2c2zrnuBQGpYhARyEeGTpTPtUsjkW9hwqNHek1/Rhzg
	Ebj6VF0JnwjC3axSZ5VLJBhsAiDop4HKC6K4JuG80txYAu5uot2Mu6J7p91owp95PuN/yOEHe2q
	/GpNH+CPg=
X-Google-Smtp-Source: AGHT+IGzPw85B5IfdTjkeR5UNt/iOrG4M8XAIOYwmM21CaD/W7Y8OE6WzHu9ieZ+CkuQVu1UuLTtSw==
X-Received: by 2002:a05:600c:3149:b0:46e:4b8b:75f2 with SMTP id 5b1f17b1804b1-471178a7ea5mr64647255e9.16.1760888550742;
        Sun, 19 Oct 2025 08:42:30 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0ec2sm10658362f8f.3.2025.10.19.08.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 08:42:30 -0700 (PDT)
Date: Sun, 19 Oct 2025 18:42:16 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] clk: qcom: gcc-sc8280xp: Remove 85.71 MHz USB4
 master clock frequency
Message-ID: <pexifslihu4oayqkl3b3coulirpudkhud426ntuimwnn2mtb54@dkqiriczitfc>
References: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
 <20251010-topic-gcc_usb4_unused_freq-v1-1-4be5e77d2307@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010-topic-gcc_usb4_unused_freq-v1-1-4be5e77d2307@oss.qualcomm.com>

On 25-10-10 12:24:50, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The USB4 HPG says this frequency remains unused, remove it from the
> frequency table to avoid any misunderstandings.
> 
> The reason it's unused seems to be that the lower RPMh level required
> to support it (LOW_SVS) is not enough for other pieces of the pipeline
> which require SVS, which in turn is enough to support a faster, 175 MHz
> rate.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

