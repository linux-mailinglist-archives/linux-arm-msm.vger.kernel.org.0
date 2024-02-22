Return-Path: <linux-arm-msm+bounces-12143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E80285F3AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 09:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 534181F2116F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 08:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DE42C695;
	Thu, 22 Feb 2024 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nopmczYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA88F2BB13
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592287; cv=none; b=EuO7QFYEYIzIwThOIHBQF6KWs7UQpXqQr6U5viBCbLrVDJdoByyCjgCe2TQyjrkeg9E25NZvu+tLePqNQ/ADRgEHRH9SpMQTekxm6nLVilOrdrOafAfCszC0si9d3YElTtU3iEsZUJ9rqz8653QAK08qJzLyTcdXcv2gCUkqKbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592287; c=relaxed/simple;
	bh=gml93mw2Qyh049HUHxbRDGJuQ3cOWnxq4uz8Qzoh5Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X1eVrYNuWWi44T2BJpmtlFSLHIHhytudk1Iy4UTEG6ZOMF7nK4qs2kMwM45LddsfhyJyxtYUwh+veQqnVCl727mTIdD1iqYH6wmnTsNXwxueW2YDYkQjTfdpUeGLyowyikXKpvhAYptf5OjLIVcwxCa+IA9EzKXF5LEf84mi/vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nopmczYq; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d26227d508so3636691fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 00:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708592284; x=1709197084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=InnA2fi+9OUiyjfIuMtov0BHHll7ueKTvAkfvELf4u4=;
        b=nopmczYqB8XoMvZfulG+vThYrgWiH0JQRhyOC6JYX2SyhUAdGWvlAi9uNvzWco89jH
         f9Ao1kE1o9ZNyRP8R9TlAcjaEyfhTxKW9+08ubSNeuO/bwjFuXNA1MISRNf1fFPiTsXN
         yRE2stcLDIvKnQs0pDeAm9STkiKQJRPV0d7WhUu7ZFsVLGrHMf88JcM+W2xSvdrfTopF
         KpR2EIncWkilGfoo4uhZ5bUey8/6Xh55Kn+WGJqQlEA0Nh+4+swAvhkQ49kIZrRjdVSG
         DGIlv7uk1dji0IYdd/JGt1a59pKrFOiCLPR5WO0I3QQyGERsf01QASzkqi1nJ1xWZTiF
         pl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708592284; x=1709197084;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InnA2fi+9OUiyjfIuMtov0BHHll7ueKTvAkfvELf4u4=;
        b=WrbOL17YjyDf+6QTk0FZHPrHHT0n2F72mGTvak4tEiY8yT+qAkbP3MdYhWQM9nSRgQ
         n3XRuR8TsMAG5ZhLicCwvfiStOi2GMg0Xav5CZdQ6hTkvi4/nxk5lBbLSmayTtraTiRB
         MCw4htHkpuqWlhD5RnlkOzqgGqdU1muUcYND5yOgubkf4Am1Fr0GwbD7q0zr1xKbzHI4
         saBV2/yuZQHYR+WGyLim6FFXmi8QJ3aYHjhXGhvRYcWjowxAl8Zc6VNKvYzRmBVJhKh1
         3ch+MwujIbkzFSK5clW8pq2BZbxpM9qz69qcQ1kggwG6kBumQjwW2C0xHI98j+C8q71u
         rVbg==
X-Gm-Message-State: AOJu0Yz/zjErAZO0H7ZICxailJkp872c4nZnIfY5PV+k84ar+3xiLP7U
	J66gSMW0CkCJKJAxvp4lGpxwEC/kWUztn8Bp1d4bKqQNVzXsf9dwP5jiqihVlAE=
X-Google-Smtp-Source: AGHT+IFYqsqFTXHNGYBEA/VbzHq9YMqt3pAFuZeURFayWiGEc6/8KE7KjhnMY7Lt6sjZKOb0joqMBQ==
X-Received: by 2002:a05:6512:2312:b0:512:cda1:9bab with SMTP id o18-20020a056512231200b00512cda19babmr4000278lfu.13.1708592284042;
        Thu, 22 Feb 2024 00:58:04 -0800 (PST)
Received: from [87.246.222.6] (netpanel-87-246-222-6.pol.akademiki.lublin.pl. [87.246.222.6])
        by smtp.gmail.com with ESMTPSA id b6-20020ac24106000000b0051176ff32c1sm1992022lfi.62.2024.02.22.00.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 00:58:03 -0800 (PST)
Message-ID: <12af5139-39a1-4b1a-a9d8-ac616f29e961@linaro.org>
Date: Thu, 22 Feb 2024 09:58:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: qcs6490-rb3gen2: Introduce USB
 redriver
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-7-dc0964ef7d96@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-7-dc0964ef7d96@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/22/24 00:19, Bjorn Andersson wrote:
> The RB3gen2 has a USB redriver on APPS_I2C, enable the bus and introduce
> the redriver. The plumbing with other components is kept separate for
> clarity.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Any chance you could add an alias for this I2C bus?

Or all of them, in advance?

Konrad

