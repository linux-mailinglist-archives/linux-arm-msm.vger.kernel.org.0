Return-Path: <linux-arm-msm+bounces-26776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C04938D13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2A4B1F29349
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328B016E866;
	Mon, 22 Jul 2024 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gux0cL1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8028916C6A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 10:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642599; cv=none; b=ei9/K4wD7cmQ8kxTVLAGOJtXn9FRIFt13Xd6pvOm9Wimhl1eEwR0luhLdjAebLAyK67814tH2+xVz45F6X7KNHOqaOUSXOzLKGPRMIGBSee3E27J8RiA7INFEHpj+0mrTiP3AhKEfpEcrl513pWeTf0NCmBRA/kE9/KC3+eU3U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642599; c=relaxed/simple;
	bh=o4RZcY4W7Uwu6UFVroj/gdueZlAftoT3H+QJcWPsMOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sVOqgK726rVHhGTjVP9To8UVU4f6TDKp6/yaE3E6C+mQf/Cf+2Yk7Y8FV66Ltobzf+S4ZxL0UuJXu7c+lVYIkSBLsojhe4xjRcGlDI4jASDRYIbH9+oFDClp8B7jqcdGDs+PPTUq4yJT9OBZPIaGVo6IDwsLZZzYEAJ0L9opaPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gux0cL1P; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5a3458bf989so2527146a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 03:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721642596; x=1722247396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rOwpugS95aKFSVrwyonBdyE1UJidF+jjYwlg/0nAfHE=;
        b=gux0cL1PaDqGA7v4s0SFOOJu96Z8vbrm2CFCscR7WBO27hN7bRBVXJ5ihILeRW7ZWJ
         5zVwIVIWIHFazGHq87WNWyAbI7Sl0qLCHtKk86XqHGFEfNKjUw7J+oms/N/5+oZZ+G0h
         tGuydbPDHY2QjV1mwrn4uYKRsHx2MzyoygwTegz5qj1wRnafHDURczDaIYvsYCRUeCsm
         ryd8bcLMnUeePsxSzl5Ew/W6rUmaaJq2Ok6dUXjirCl82J2HDkAdYHagQsAFPWqy8B5W
         mAX8PqHVztUFRsdSLm+gh62O8MDidCdtW3Ze3Mjt8Lk/0Q/Dd4QSD5Uxgqr7ZauGMKzA
         aqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721642596; x=1722247396;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOwpugS95aKFSVrwyonBdyE1UJidF+jjYwlg/0nAfHE=;
        b=QUVHQ8gA5yqlKjLb0Ps/ppGcyIqLhcTR8QT+j4LAW+yC/OazTyp9TBuVh9WUTaeKJd
         Crb4cBU5dFfsCGesvmiovEiGlJv3b9JBvlJ4TZodAIE8RNzrBAgXNguoSVRookI3gPIC
         O8T8qVbcazlhKPf1cJGQLbdgPe3d+dgJHc7D6ojV1qSd7rEUTb6ptIo3w0/vZaDY7Uyb
         qEdqZyaWLspn1Bo89MWG5AsA6DiZI5bQLU+byUu2/WIOqF1i8JupUfIflE2ETjCaZLlf
         uFD48rnLttAqD3TJ4MlSP2hdf0RH2BI8hB5cEVRKnrYVrTdL3LCAvM1xWVYWC85WIO09
         MEWA==
X-Forwarded-Encrypted: i=1; AJvYcCVuLbgjEvpLAF5BuOhW1LqJOjPnJybuJ4B/dQ9YZDWRByjnpwDpxrU2hbfbHe6OwC5gQj8UBYAk+DVVSbjxQaxJQnw8zn/58z0YPrkMFA==
X-Gm-Message-State: AOJu0YyByBqk64wNqf4pHylKixXD+84ekjki9EIUhrXRjnvb0w8UOebc
	VQuFPW43oIM4mj+KtEj/HPZxaIajdRlo84x8XEkj2MWGXq/Tq06X8tJTM3suYSE=
X-Google-Smtp-Source: AGHT+IFaPovvL+J27yUcLLsytE4cYRr9/Nyjd4Yr5S8EgLDHi9IH3xceTrHf2Z5Zm+3QWm06/nXLRQ==
X-Received: by 2002:a05:6402:2682:b0:5a1:f74d:2d58 with SMTP id 4fb4d7f45d1cf-5a479f5a9a6mr3905330a12.24.1721642595714;
        Mon, 22 Jul 2024 03:03:15 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a44cb995absm4253102a12.45.2024.07.22.03.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 03:03:15 -0700 (PDT)
Message-ID: <caa472d5-8f4c-4d0c-98b1-2d381959ad2a@linaro.org>
Date: Mon, 22 Jul 2024 12:03:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] arm64: dts: qcom: x1e80100-vivobook-s15: fix up
 PCIe6a pinctrl node
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 Xilin Wu <wuxilin123@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240722095459.27437-1-johan+linaro@kernel.org>
 <20240722095459.27437-7-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240722095459.27437-7-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 11:54 AM, Johan Hovold wrote:
> The PCIe6a pinctrl node appears to have been copied from the sc8280xp
> CRD dts (via the x1e80100 CRD dts), which has the NVMe on pcie2a.
> 
> Fix up the node name to match the x1e80100 use and label.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

