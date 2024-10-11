Return-Path: <linux-arm-msm+bounces-34136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1AE99A7D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 17:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DFD61C2175B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFD8198846;
	Fri, 11 Oct 2024 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G7vfvnhP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CDB195FE8
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660768; cv=none; b=pbeu6ZB1aQPTs0i5q0wWHFht4RL9y7hZzP27tFXNrh2OLEdW66CyGLVHKYksUPu1VtuhPrlvyZzcrwEZ9INKcEhrq5KqFxkIlCFaG1pd+C84au6oYDUBwzXLXnrErW/i6CCbKkxmcRWQccNi9fGMA/BWFuQlB+h0Q1xhI2aefzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660768; c=relaxed/simple;
	bh=bRJ4Y1/jdFojuUij4IeYNNekIWbJ2nzLiEuafUuGJn8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cKp7VIMfbtOW7+2LsPwJB/xwIIf/nlt8AGGmECXa4zKe1kBYWxagVxRpOehZ9FjaKo7gnYlqeUpDS8Vtr720VQsYy5iIE4LSUBgceWTQBXQcLNSPiNFndOumQeVbMZz1QUqTWanpBvIp5CgmfPlJch/gD6qhZPm4Z+UrBaXXKH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G7vfvnhP; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c928611371so3009182a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728660765; x=1729265565; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Rat4MPBAsLDnNiR+W9/KxSukyb9q48U+Dl9neWjYf0=;
        b=G7vfvnhPR+1WBPKyio3JrSyJ52wjfu/6z3FP2FHzp2HY+d5NdOIHgU6LhY+pFCMIM2
         jnrCRYSSolupvAOFRuULP5hp0SJt039ORqaiUloFg6wTRlUIIrr56cQ3DzkW6k/yYkT7
         NjnNalltEPMuonFbSm6+QXI0qofrBrfSQUhIn3+CmSZMwJG7QpK6yl56sTaJhoJaRaPz
         piy051V0uMa5MpYPD6r0oJ/pAUwOPcj5BXUpOvcrJjTg/dZiiOpiu4gYZGpwsKq3pcHE
         FuQ7kI9/DLbPPJ+Gdgvcu/k8OdDAILuADbVhd/zRqyDb+DuPmmZOuV0KbRTnrDn8H3Ux
         03Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660765; x=1729265565;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Rat4MPBAsLDnNiR+W9/KxSukyb9q48U+Dl9neWjYf0=;
        b=MyRw48/T93wOsgPFWm28/mI2OitgRWDIQYBGleCBuXCzYbhEbZJLPZC4Q0RdEpoQXc
         IFfCBhSpgjRfrxdQMKTaW1O8dTvBqbyksOuzpTVnOdlpKw9JmdOZtxymm36LgWLaefRK
         889Ay1BEM96UJsxPpJvSKGZBzxTedvsCYmDtScA303N7AwYDFcK6cZ+7d2WSmE6BkrlP
         k8jkqoGD8qLU7SgFGFf8ixIZ1aDM48rA5A95O1HBidATtbdoB7BV8dmIHe6+nd3OXqI+
         0rshaT0SVTFKuTV12al3ce6DITsy59DGl2C31Es7Ds7w2KH+uKkdDv3vqs2I05yjJNcP
         PV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfwmKoUI088A2ex9kSdeBs6Xf6k/oXGDRkYhiQyEdfOLDAyl8jSJd+9Ib3al+FoitclQiClITEa0DBfrlD@vger.kernel.org
X-Gm-Message-State: AOJu0YwRjwyGuAUbIyYXiOnRL2nGjQcembC2nTai14PwJ5rXY6lXpbwi
	O+i6S7NCVLVRIU0TIFAyVJTq7IcolLx67MjdJfAvwTJxdCJh8nfZqWy9TBRtuVI=
X-Google-Smtp-Source: AGHT+IG2RSuYoUetJ32zLi/kp0cBZ33Kg6Bh/AWm4gP1CZLAPGxS//Bmvvsy9YjdHMWJKgnFnWy8sw==
X-Received: by 2002:a05:6402:348e:b0:5c8:8381:c308 with SMTP id 4fb4d7f45d1cf-5c948c8831fmr2027670a12.5.1728660764556;
        Fri, 11 Oct 2024 08:32:44 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c93711adacsm2049796a12.37.2024.10.11.08.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 08:32:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Oct 2024 16:32:42 +0100
Message-Id: <D4T33J6B5SPK.25S50D16VMDRI@linaro.org>
Cc: <linux-sound@vger.kernel.org>, <srinivas.kandagatla@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <stable@vger.kernel.org>,
 <broonie@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <krzysztof.kozlowski@linaro.org>, <pierre-louis.bossart@linux.intel.com>,
 <vkoul@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: qcom: sdm845: add missing soundwire runtime
 stream alloc
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Steev Klimaszewski" <steev@kali.org>
X-Mailer: aerc 0.18.2
References: <20241009213922.999355-1-alexey.klimov@linaro.org>
 <CAKXuJqiK3BHT-=3zyT1tbunpNF1b_gyZUAd4EE2FY2r7TbaXug@mail.gmail.com>
In-Reply-To: <CAKXuJqiK3BHT-=3zyT1tbunpNF1b_gyZUAd4EE2FY2r7TbaXug@mail.gmail.com>

Hi Steev,

On Thu Oct 10, 2024 at 1:33 AM BST, Steev Klimaszewski wrote:
> Hi Alexey,
>
> >
> Thank you so much for tracking this down!  Was experiencing the same
> thing on my Lenovo Yoga C630, and testing with this patch, I no longer
> see the null pointer and also have working audio.
>
> Tested-by: Steev Klimaszewski <steev@kali.org> # Lenovo Yoga C630

Thank you for testing! I didn't know that this affected more than one
board but I was told that it was long-standing bug.

Best regards,
Alexey

