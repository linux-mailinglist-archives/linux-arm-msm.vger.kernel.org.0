Return-Path: <linux-arm-msm+bounces-28893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDC2955E71
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 20:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78A58B20A79
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 18:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424C1148FF6;
	Sun, 18 Aug 2024 18:02:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A13C8CE;
	Sun, 18 Aug 2024 18:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724004138; cv=none; b=GBEZrFx4mkK1GOCgqLYcsdY/0XBMTiQDkA+VHqOqdtiUlR+IQ8hn0YkLMvyJh2qM/Kg3aliLotT2Z+2b+PPkOtHnWqZ9dk1Ocj5nsuC5ofqd7aGXPgtFWA9ZsWciQrSzGDCR6xl77E735vehdzvlR0qAi2vO8rMoYnduz/pr9iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724004138; c=relaxed/simple;
	bh=fxOoZ9V/h0EkJo4ES6GCBlX3l71DbvbeK+1ca2+ZK+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJxGvItHzCX0LkCWaz8/ShI1BbfpkQqv0STbLI/lL7f8TuW2juzLW1nWuENts9hTztyTJ3/JNWe3uCuxUVz5oFYdkeMvoufGPoFKNvPEUMl5d7na0mS95iFGbytplbS53n0wAF8JELUUmxggR4lt+9Xzos+tQFuisZkikRAi4OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-429da8b5feaso38891805e9.2;
        Sun, 18 Aug 2024 11:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724004135; x=1724608935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpQlOOYdSsipBnC9N45khCsglOfNqMsuGcIOoKkGF4Y=;
        b=LClg8k0IflR7qHpqn39yqf6GZ1URf2KZ3OMDiW0ag+0c5SsTs8CdD8mDGh3oNPD496
         t8pcGA3SLfGaSJ0/g+NNM4xo6hyxYs7GSawk1sDnFN0ZShdW21E1ElB1v/VZcV0Sdbwo
         Q6CjDZse2mwsxonapUNZvbiDGMYBL1ggJeprpfKYY5ZgtNrGllYldQAluJEH97uMCTlY
         SRVcoMno/7IbVR2Utx3A/3FDknxt6YoKo4q153VVxl69NKywKBxaAghP+cv1NeuxgqoW
         FkYhAQZb80tOXqEJDoyFBeM8UFyftS5flxKTuNGup94Hri4bvx3ysoIC9+XsGYaG9MbB
         K/wQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5XVLM376arw198e74ePS2Qdg/Vt6urq1yGQ9hCwHm9A0cH2Wciyb66rvKaD7ROGaCWuCe0ZfXM8duTJzXNP0OSVqQsn6vuomSv4klKp2tjuYuPWepKdKCVf+LHTDRYKkFMHyLxcVuqUonLYzNhFFkqka+LHced6il5YYoWtniugOmB/VbxLx1nrkGqF/CYSngC/dn0CfaARIR+NTrNPwVhYk=
X-Gm-Message-State: AOJu0YwHBlVdC6YI2jUENyA26efUv5b9TonLZXZqItumwZYsbwtEvhM6
	UBl1D7x3IWhjZt/wfL30UKFjqV6JvBPwMuK2d2ddwhb1DmaPunC/
X-Google-Smtp-Source: AGHT+IG6wtxlooq/43WSyfb2p/LLw1d/k6aRhxDTcqDTVmxqWGbbecRugQ4CphiDl528emfW/2NJcQ==
X-Received: by 2002:a05:600c:4aa9:b0:426:62c5:4731 with SMTP id 5b1f17b1804b1-429ed7d648cmr91545595e9.29.1724004134382;
        Sun, 18 Aug 2024 11:02:14 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ded19627sm135506205e9.5.2024.08.18.11.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 11:02:13 -0700 (PDT)
Date: Sun, 18 Aug 2024 20:02:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	quic_imrashai@quicinc.com, quic_jkona@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/8] dt-bindings: clock: qcom: Add SA8775P camera
 clock controller
Message-ID: <57672tyb6pij3h7ensq4itbhnw3lr4wahfttc2fdcj4twbqpta@pwskxpet4nsh>
References: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
 <20240816-sa8775p-mm-v3-v1-3-77d53c3c0cef@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240816-sa8775p-mm-v3-v1-3-77d53c3c0cef@quicinc.com>

On Fri, Aug 16, 2024 at 12:01:45PM +0530, Taniya Das wrote:
> Add device tree bindings for the camera clock controller
> on Qualcomm SA8775P platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

