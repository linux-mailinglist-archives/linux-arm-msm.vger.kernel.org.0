Return-Path: <linux-arm-msm+bounces-8381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB8283D131
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 01:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 515AC1F2250F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FA11B5A0;
	Thu, 25 Jan 2024 23:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bx7/bl4/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7077D13DB96
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706227137; cv=none; b=B9eQ9qhh86ZJnQIR70K+M+o1s/K/0Mwi2r4s9uysfRtajc3qhdLgLZEG8GFznCV7GgD08ZgDzHzVH2FkV/2Dz4Bs7ylN+Fn8oO2UVgRRY5yJoAN/YCLdE60Q/1rBJ9SMwYnHf9V9vHJe0HZ9lIRRjfaEt8JihlJpLZeXEuPULJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706227137; c=relaxed/simple;
	bh=CFqwXny1ePfKM6cY8BhIdMZO5pqYOzc9+MQsrZlzj58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VL1i5H5hQMYultuZClo0YT2OgX7Mr9RIaAkasfi9DhEy1ywsYHf+Lon1r0TmT8pkZYKOxeT9r2niIOGp9JUmSpjArvG3Eg5enVp3DQ2ZpsQ74ZySr5UztlRk5MGY8zfe1hXbQfFZIDe9gzerq7x1OtDzjB6MSOz8ILdvxoBKxY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bx7/bl4/; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51005675963so42141e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706227133; x=1706831933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUQoT0CqkTx4RdOASZu5iDw95CBsXpS9e0dYJzMD4Zg=;
        b=bx7/bl4/T55QBYHXhajw6NDo8DFdPeZnHjhasHoHCUY9zBDOTRL/C/Xixnv7f/0vMy
         afJm4o/znCqXOsTvEwVJ8RUmEX1W0+z9FP/J9hINQ1svMqixnHDR/bfqldx+v7bmHy1v
         48N31IN7HuxAr0pb0snqZ/fAvRVgVKnqzmi2KrjtPbnkXgwpXN9mzcl1qSdaB3HNOAdL
         v9od4vNEVXdNVvZQTBIorJmpzqA2wkP6sL8Rv7rGThEYDAooMXW2kQEokHrD0WQyCsuA
         di4t6vR4peHujBOxIAqpvSNxFYmYwOxFdTh3MyTAOjA1s1Pf4L/6Uv2BksTjjW5H/AoT
         k8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706227133; x=1706831933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUQoT0CqkTx4RdOASZu5iDw95CBsXpS9e0dYJzMD4Zg=;
        b=JoJN9cTpowa1Z+pi1IYmlFtrfDsgFMCfSDZ21kN7Pdc3j3ffYNLIP/uwslyhhEQfhu
         HnNUQ8YwLRZ6ppG+N14VGQrVtxs/KJ+L0lh947cAiqYzQF+2hq/cd4K4mHotXH4d8XzZ
         SzpXeUYBTh+/1FHrpd10S+UKcjHGs+pevipTLrOayw76hkAhMAq/OzWwmpnUwOL/RJEX
         GdWhkwz6CHMDDqI4s8MRd/WGDJuYGiIs6AvbZgSu9HEHiIKEHPnXh8UiGwXuKG8nJJHu
         SACUuALQWigmnFbY7+GXkFB+z6IsXPuVJNOjtCKCGDqfts02s3ZTq2VjmTVAX7LC4VdD
         TXXg==
X-Gm-Message-State: AOJu0YzungsCzzvKskxVXEAhZ9UVI0f24nI8lnGbfvzzh2aA8Q4TelaR
	wqOozHkUaMVtLhIe2gUvx06VYjZ3ntaJEHScDtkY32hk5AOf1THeaz/+iQ2a02E=
X-Google-Smtp-Source: AGHT+IHo6AiqxuqV7NyrAINNh1GNxMRCwCWG46Vnh6uaxPiIE2xFOo+X6kFSrtvayPDqzIBtXXLiXw==
X-Received: by 2002:ac2:5928:0:b0:510:dff:59e6 with SMTP id v8-20020ac25928000000b005100dff59e6mr164531lfi.146.1706227133232;
        Thu, 25 Jan 2024 15:58:53 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w20-20020ac24434000000b0050e64a0c62dsm12363lfl.240.2024.01.25.15.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 15:58:52 -0800 (PST)
Message-ID: <b8f588cc-712d-4f22-92d9-a613acc8d1b0@linaro.org>
Date: Fri, 26 Jan 2024 00:58:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] phy: qcom: qmp-usb-legacy: drop single-lane
 support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
 <20240126-phy-qmp-merge-common-v2-1-a463d0b57836@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240126-phy-qmp-merge-common-v2-1-a463d0b57836@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/26/24 00:22, Dmitry Baryshkov wrote:
> All PHYs supported by usb-legacy have two lanes. Drop support for
> single-lane configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad DYbcio <konrad.dybcio@linaro.org>

Konrad

