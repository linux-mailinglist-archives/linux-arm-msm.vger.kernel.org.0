Return-Path: <linux-arm-msm+bounces-18332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E89E8AF46B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 18:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45C4E28ECCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 16:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3631013D508;
	Tue, 23 Apr 2024 16:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RNSD4r7V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A81A13D2AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 16:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713890412; cv=none; b=OfDz9dS2rMSy4L2VjRjlMlXlfsaK2si5DkziOvvG2SuJ6HoloTajPd7Jvc7bPRH7WWtF1G1jDSs8grvJfrlZ39LuMEWhS2NJX5tefl355qFfXo1y0DjKTgtzR+oPW6ao2wGYHg78QmLf2alHTI6CGItPGQY+fF1q8+TCPECJ5ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713890412; c=relaxed/simple;
	bh=BOJw2vRsPZHwOmrOygNkShk96qoSCUb9rWqqoRjUYVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ui01LQ0C+fb5ub39Q81QX/QBIMo4Ro1HKPhNvEKiC06tKBprz3IUOwGAx80/gJjnuuZWTducCEddtx7DIX9C1vUcbnmevw9PVPFbaTw5IKKQXsimfjt0GCzNp5ydzsw1iEP+xvc0tI8fiPsC8yJJUKXY+9kq2L0uF26SDbEdU4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RNSD4r7V; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-34b029296f5so2604805f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 09:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713890409; x=1714495209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PnokyArXxcyIbQ437WBi+fXlNam0sB9x6yTE3BbNzdE=;
        b=RNSD4r7VuLRyOqnAVo8FDasZJdi0r4QbZlOO9ic3gffI0SVua7s+uV6T51O8LLcmJb
         v5HZU06DqVvaLv5/XWoDMXk+fpgljPkLNa1ugExgEGASSkv7ddvZZpyaMXvlnMGx2g/T
         Hj3/yYPe4D5y00A9l6RdhAs3l4mipbBEljHEzJRTsGzIeE2tBQuzASV22mjSKvizyZWW
         xKqiKJWzJkt/7LOIhK8vPpFwmM54yNbk5yIss1M32JS0XDeF3CLZmFoWaqOFD6jZwW/Y
         y9eQSO9pD5CSlgqn2AhCMBNJqDJDUuV8FHZxw++oZrbEexUW3VUGoAoctZsXuD3dqaqF
         mKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713890409; x=1714495209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PnokyArXxcyIbQ437WBi+fXlNam0sB9x6yTE3BbNzdE=;
        b=am9QsBBSlS2T3K57+HeYsbEZMWe2VydaidhB6uysclLN4rx6jKSG+ghS0quFRHV41U
         nSv//IUgA8ePpbaSwGW4Qo+opl81nfkYyBFwpgwYvJCm3efNmLR6nvEcnIsFqosIdV5V
         S07Fg651IKHv0wRhZ4YGaj2zIApYgkXY2V6rT7pM0LeQkvzMmDjE63tRghFFgJ5fXIOZ
         20tv3WoHGDcis1rhzli/ogmKSmYOqFS0JcTjAvVWeJfAskRiqFmVXe3MhHAMxITA4ozv
         FHmqGX41UIDSPdPHdPVmfv3U6jQzJ+NtqJeqtU+PpERpSJolnoiYJMXdshSqmQ2tyiil
         2Pgg==
X-Forwarded-Encrypted: i=1; AJvYcCVujjFlW5WEB8MhiUJezYH+mqxz/ZbTYvVGOwIG3vwbDjFggDpvOn8ZeU9yn6PR9xPtVEd6B2ofch15y8q8cuQ5fmr3DAcfSaNBCMxHUQ==
X-Gm-Message-State: AOJu0YwESXL1qRP2lVpBk8UdSxvxm4ITfHDRkdS3fmmIv5et7xZ5NWhH
	crtS4cSpzVMCg1eSeg+piiuWzZdIZ2yyshPnQjI9SVHJzz25lbw36zzxL71zzM8=
X-Google-Smtp-Source: AGHT+IEt0kyNa/ubkeo1mtCZlcqjs3AUlplSYGY2vYsnPCR+hlV65yLYcKKdjfNDUj8XC7Fvmk6LWw==
X-Received: by 2002:adf:fa88:0:b0:34a:d130:611b with SMTP id h8-20020adffa88000000b0034ad130611bmr7073198wrr.17.1713890408973;
        Tue, 23 Apr 2024 09:40:08 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id bb6-20020a1709070a0600b00a55b020a821sm3270479ejc.13.2024.04.23.09.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 09:40:08 -0700 (PDT)
Message-ID: <90569329-62e1-472d-88ab-c93b44abb60c@linaro.org>
Date: Tue, 23 Apr 2024 17:40:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/35] media: dvb-frontends: drx39xyj: Use min macro
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-14-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-14-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Simplifies the code.
> 
> Found by cocci:
> 
> drivers/media/dvb-frontends/drx39xyj/drxj.c:1447:23-24: WARNING opportunity for min()
> drivers/media/dvb-frontends/drx39xyj/drxj.c:1662:21-22: WARNING opportunity for min()
> drivers/media/dvb-frontends/drx39xyj/drxj.c:1685:24-25: WARNING opportunity for min()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Code is fine but, I think your commit log could use some love.

"Replace ternary assignments with min() to simplify and make the code 
more readable."

Not super-important.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


