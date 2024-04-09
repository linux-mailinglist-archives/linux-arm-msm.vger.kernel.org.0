Return-Path: <linux-arm-msm+bounces-16922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D214C89DD75
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 17:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CA892870E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 15:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940A612FB3C;
	Tue,  9 Apr 2024 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="taWyYBVG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07228287F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712674816; cv=none; b=DMpjyJrxYd1MwBkQC0wyIHhhW0BT8rnpZ1KNtkIDqE3d9s0yIiby+76Eilzn2C+hfzulhRcq8XiaS8xDjLcL5FMmJmOp2UmFQGfF9/zcVVtzXZaaloVGZURmO0zt+lgSl7CNJuoUo2XPxVSvlNsoydu68sllQw3DefYGdJWDWkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712674816; c=relaxed/simple;
	bh=qItj2QD9lAb71zQHuCbigKkildQRgrro60WwdGPxFY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WhLXgJOr9wyS9zHPwFQQqSNnvhciD47iHEcNzmHOPJVQ3An9iIgT9dI0rzi8NeesKhunRnznh1Mj6DT8u0HykH39CzhWOZeFgozrG/JUonkNOYWafcQm4I1TKOI8BWbXMxPLrbwPODgIh/DGVgyrzOkh98BLxZvjD6SOTXnSF7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=taWyYBVG; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d717603aa5so67622361fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 08:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712674813; x=1713279613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=crTB/gy+FeOZ86NhZBPcpLgT33Zu4oRIi6sok1xfkbU=;
        b=taWyYBVGZWHX+Qw1SGlHtWtMA2Zpk+nAfQTgdZi84bT5zepe37bMSv4RyRiwdpOEok
         271f2DpkfvgtQAbV78AP00lVTrGROxfckznB75nVnJxyCtQa4qGZ4I2VV0xXmHcCO6zr
         gTiYSFFBLNO5wIR5WYv1njwzj7kKkM7087ajCUVGaXSX79tc5umRtApNf9aynFiTFQdv
         0XbXm+4SRKl/mMD0g5HakVd/pz9KpHQ88TnpINN6ZqFphg6Kb99zE8/Ko6PHFX26CtWJ
         LmZKLEsg1pGIy8O7GTe/peOE8teG06EsOZF6UwL4XCeylUEmrqwrfd7VNCqgd46nQc+w
         HX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712674813; x=1713279613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=crTB/gy+FeOZ86NhZBPcpLgT33Zu4oRIi6sok1xfkbU=;
        b=hdNVnTe8coG8Bk0hx1I7KbjGYIbv/E32bb/GwzBSSgPbqBmytB5OVBHFAV7RU9o0DM
         1KDOqmAbBeOI/FQlfEGqk9RAkKVHyNCR1tItCJQuwhK8h0TGXuLM+MxcfrHKwnV9NZ8w
         48A91tqua+U9COIyu9OO4NIYXGLjG+Xk+XOO7wzlQ7mQbLtPhyrTanRdJeOCTHOtWGL1
         VOjNBASRTl9HluL2FF8ZCsfa9xFg7rzQOAQcrrzk1TPfa+BbLq3ujXAkfZKIBweQIU+7
         vOdkF22ZTHJl2ALcurvdrLHg12XLhkOvTScjdHJ1TACHT21D/evEN1fSR9s/itwchkmP
         2TWQ==
X-Gm-Message-State: AOJu0YzHFaphkLHT0k0X4jYBZLHHmDTdGRL9FWU1to1WaQaw63+qQCOL
	T23QcMjwjILdDpdBevIcWbYG+yruKjMSOqSQ7OJvImfRNevsa734Or+sw+l1KNw=
X-Google-Smtp-Source: AGHT+IG18AzDt8XyooNje4R5lhWjWzghy6yLZKsZ0hE9gJCtN4aCZBqy5lbYEvW6mlqQAurtx+37jQ==
X-Received: by 2002:a2e:a7c2:0:b0:2d8:3cd3:35d with SMTP id x2-20020a2ea7c2000000b002d83cd3035dmr48727ljp.33.1712674812999;
        Tue, 09 Apr 2024 08:00:12 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y32-20020a05651c222000b002d871fe2f41sm1401375ljq.18.2024.04.09.08.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 08:00:12 -0700 (PDT)
Message-ID: <c7ac10fe-3fef-4f78-b634-e22bb61f9618@linaro.org>
Date: Tue, 9 Apr 2024 17:00:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: sm8350-hdk: add USB-C
 orientation GPIO
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240409-hdk-orientation-gpios-v2-0-658efd993987@linaro.org>
 <20240409-hdk-orientation-gpios-v2-2-658efd993987@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240409-hdk-orientation-gpios-v2-2-658efd993987@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/9/24 16:28, Dmitry Baryshkov wrote:
> Define the USB-C orientation GPIO so that the USB-C port orientation is
> known without having to resort to the altmode notifications.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

