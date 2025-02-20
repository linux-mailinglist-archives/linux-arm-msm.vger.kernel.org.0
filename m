Return-Path: <linux-arm-msm+bounces-48597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 945B1A3D07D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 05:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F94A188E780
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 04:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EA21E0B86;
	Thu, 20 Feb 2025 04:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOYThNhB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602583FD1
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 04:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740026075; cv=none; b=s6uch9jFxbHPd+TEsZvHvuwtck41tC6TX7QTiMcNK6mU7WCDIRYy8M1qgtVf6m7V2PZIiOdSAoeOqnTH7G+y4Ttwan/T8gZdYonE+wLJ+dQCfUpTyhSNqRmcdt2QTU3rQ1QfCSquF3SWcnvXlcf5FHSfuJ6A+ik0OQqbvGfmbZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740026075; c=relaxed/simple;
	bh=jgwDoqy69Zoi+YVPD9FqEbg4CovWykgUn6vteBc7gB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MSUZVlOe+/Q8q2mm5rw5I13QjV7Uq89XWNGm6uqBzhIzTjy84Zp2iWJjXqJH277PTjm9/N7cv9HtvRByKOEKpb5IlnHRuGU+ZIz11faJm+VKHu0RFCS4Ff7fF/RMmZTjrYbJ+bQHnoL8FZRkSsdB1Z3U6nnLypMkmMYLorFFpnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOYThNhB; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30737db1aa9so4219491fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 20:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740026071; x=1740630871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zIgZ1R2fo/uZR08EAHjfTKiWP5NrtPRgl9O0Ta2Iyuo=;
        b=iOYThNhBlRaeNob5B4Vf2Ah8E4Uqn3Iu64625cWrT8f1B4OGSvucl4/kACnwVnZHAJ
         mff7LD6OwgqA8r7zKmTXUNOEwq5lwfUhtwD4a9UefC76FIVNc75ozwoV2pwicWccuupY
         LRd2aaAudci0NJN1CtuTqvjGEYCX+bx4lmMH4pWqZHR1THgYK6JmU3FpADNm/7YpJXmn
         OVFHrL+rXlGpkUX07dFzOoZG0F4z9a1piiJWrjCXHAPjfoM+SM3rj66FFVquzCOG8E8e
         +lQ9dsV21U0vz+7NctUXlD93RQxdiegWlfdLCunMuRecVkhYuGSoKO/S/WJloafVEPpe
         5NWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740026071; x=1740630871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIgZ1R2fo/uZR08EAHjfTKiWP5NrtPRgl9O0Ta2Iyuo=;
        b=at31CKltJZrvWtEJyPgZGOWAcifrY+TO7qsPIQzpoXr9U3nQkd2x6G0kgGI9jiwoQz
         xhYYA37GQauvwFbENOZhTgnaYyGTxXNFpP0WTyRnKRSM+yKGXpeudAq+h89cvD2DZ2eZ
         xC4bHLp/EzaISFr2C4oB4DRLjlRPwqHpKNm+ti+vnQU7O2tbRgNOeEWb7aRTcGWLLllJ
         NftmfvBbQVU2ORU10tyj3doW7a6a4SfxgXh+w8RAVYrPDZb1FJjzuuLZxxqeGejSUqRu
         egvws3Y/0w+ePwaDymyJQunnzmG1rohORpjXsQUyeMWNgrJG1A9FrCrg04j4708ussNa
         /S6A==
X-Forwarded-Encrypted: i=1; AJvYcCUQtOCKDj91HlZqyNb8TXWoC9gfCD7sw/rbn3pRIaYZBU//ScD/xU8o+d/VrvRLLEUjLBJ33F+1ya1cAPlI@vger.kernel.org
X-Gm-Message-State: AOJu0YxbugkuYkaf0tcicyUJJ74MsY9jx7ITgRcK5QvepenBEJL92fU4
	4QFg2MLnvni6I3gptvEreN+C+rs9Yp042AVMMDF9rlhjtmF4Sw7lFJXOyT3+vls=
X-Gm-Gg: ASbGncvWar49qXwu/Wt80D5YT91DsO8gWy1TClxoS2yKaYuuMI9o9jMPJEJy3Qo21oG
	bJ0mxbYKv1MBROzWWw7cI2aFnkgCC0FkYwBavBzreIIsVx101X93gCo+S5FZYd9VQ8chBiOyCj2
	8GrT5hEmteWHjfduDMJFKJZ0BVL5nxo+KqKUFS+YRil7QyC9sR/o1Jpa+fZrYx0YjCoS+D2Ki1J
	3liQlw0IThHQjpj7l7y/PGlbawknhdX7JDSTHvzMCOne+VzlA1jgpWTu9z0x4tGCzLKyeUAA1fJ
	0ag9HZmup8atJ4KT2aeLZmxCpPBgEosg/5yzPsr2sKN22eQ4QvvvpLHbqb3Dk7MmMbxdv3E=
X-Google-Smtp-Source: AGHT+IE/wbNVeqMIzJ0mRBTmf4NCpaNwWVzHs+1/sXMuy2O8j/XZA2bHjBHzaK7WJJplOVmy6+jcMg==
X-Received: by 2002:a05:651c:20e:b0:306:124c:69d5 with SMTP id 38308e7fff4ca-30a450620b4mr22664261fa.34.1740026071154;
        Wed, 19 Feb 2025 20:34:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2699d0f5sm15178761fa.78.2025.02.19.20.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 20:34:29 -0800 (PST)
Date: Thu, 20 Feb 2025 06:34:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
Message-ID: <mtfck3p6touzlsogv7xu2sqstfi4tapee7dqdhx76ktpgqhw5e@g45ralchrf5l>
References: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
 <20250220-lpass_qcm6490_resets-v4-2-68dbed85c485@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-lpass_qcm6490_resets-v4-2-68dbed85c485@quicinc.com>

On Thu, Feb 20, 2025 at 09:52:51AM +0530, Taniya Das wrote:
> On the QCM6490 boards, the LPASS firmware controls the complete clock
> controller functionalities and associated power domains. However, only
> the LPASS resets required to be controlled by the high level OS. Thus,
> add support for the resets in the clock driver to enable the Audio SW
> driver to assert/deassert the audio resets as needed.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/lpassaudiocc-sc7280.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

