Return-Path: <linux-arm-msm+bounces-15579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA3989031F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 16:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E4831C24DE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 15:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01AB612F384;
	Thu, 28 Mar 2024 15:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FwkfVc8b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4783E7E583
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711640082; cv=none; b=jpoqhI0hZN0OGw8roLPFD1Av4RMSF+ciowQ5VrT6hQOcqW2H2IQDH85v2YLLdv3+yTz/sTpXdbl9kwWHwRZsKjfNYiKqLjuBVgC0mEZeqIUcDfr5N5Ee90w60NAnPm237QLO3Bf6qVEnA4mE8me+LtTT4DfjgYHMzil1PbhlyZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711640082; c=relaxed/simple;
	bh=7eKzfYn8Y0OHXo6ZzMF+F2RG+B/o3HUZemwxG799TYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8uXH3Qo7fAMoBWsI6lfwZC20xJX9H1ynubwzMOtjLztdgQVv9TZCFF2Hlp5c9J2vfOeSRTQI9sGRtvWvTKs+nVKzoM52yUZdzHspo4KfedodyXjeXtR7NgwIP+uAzeJ/kD2O83f7rXS/te4zPww+9K3H6vyYWAdHJZAjBxy+wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FwkfVc8b; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56c1922096cso1449529a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711640080; x=1712244880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RfWKKt2eV/02zOeFoWUCxZZDJeMFYtZCYwbKheGjbEI=;
        b=FwkfVc8bpRppvn7MxJqTou+TrZgGfdpDdsAsJa7zeA3FQuab0tVL6tKPR3864oreEF
         XTsxNeq5bu93hRDtkKYOykadtnn1FzjJJUw/Z1RAcOWxP6WCBUwZpQTOhIcrYsaobcuK
         9SC28+wl55GqDkBRcW3TnwlI6cqSOMu8pEdHukYf6EeqRj3X9yztsr5KGMgGKSGd0yYM
         H4mcUBDUUhpuiuL7QD7O92A3rJUYjnrNl7QXAczTlaD18QsmU+M0TO1xoLocmdrQhu42
         baC87rDHV5aVfD2bngu7m6r//9u6Efxqj9r7SgXm/SjToOq9A+GjSYSxRExAUMjTLwrW
         enwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711640080; x=1712244880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfWKKt2eV/02zOeFoWUCxZZDJeMFYtZCYwbKheGjbEI=;
        b=nTpvDUWdWly0ZqeuXo5iLFGg5lxOOBwp0BIA00dP3hOrNwCB3pbbJERxt2bb2iTtnf
         vv821/RW8CymEAfEIg6Jt/l5QFy8mR6KmrawvNdncPOPgzGXjWeTdvL5ZmWoG12t9tOy
         ECM5MVZW00/pTNEFNJ4uIh5HTu1N9uKlrIBv8l0Jj35FFQnSJcVpaKfSwlWbEhqR00aF
         lDBf2QCQzxbHoHJdlmSkFmYxl3LKVnHZBoKhsVHXlSrEIAgQCUYs51WKPNQlua5v3Ajt
         XmOc1WSb84dz0hJAYps922870tk5QdHL3rshzzVWuAXLTufP5Ve23B1MuGKW3b1yzpaL
         TC2g==
X-Gm-Message-State: AOJu0YxX0Dv9Z9/9JeQVfZF/O0tU+zH0+HjbIM+tnWWPMAlE3nzXptIn
	uRCvpF9ZndaQUCKm61Om4W0FT2WNGdvXxVR204Btw96vd+Z3nj+itURc88fl7/0=
X-Google-Smtp-Source: AGHT+IG8F+QcLObQ++fc7pdWTkqZt13SbAvns5rQJONkxwaI3w+8TYNvHiwOOpZ+BlXvv8Kn229T2w==
X-Received: by 2002:a50:8ac5:0:b0:56b:c32b:2dd1 with SMTP id k5-20020a508ac5000000b0056bc32b2dd1mr2331787edk.33.1711640079753;
        Thu, 28 Mar 2024 08:34:39 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id en9-20020a056402528900b005697d77570dsm940422edb.66.2024.03.28.08.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 08:34:38 -0700 (PDT)
Message-ID: <6b77633e-c501-4488-9b10-1881cfbf6f2c@linaro.org>
Date: Thu, 28 Mar 2024 16:34:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom: Add Samsung Galaxy Z Fold5
To: Alexandru Serdeliuc <serdeliuk@yahoo.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240328-dt-bindings-arm-qcom-add-support-for-samsung-galaxy-zfold5-v1-1-cb612e3ade18@yahoo.com>
 <ca4ed5e3-32ea-451a-82ca-25fba07877dc@linaro.org>
 <33e23d1c-5b6f-4111-9631-0f8db1100d0c@yahoo.com>
 <8e09b779-a18f-46b4-926c-40e2a5782d85@linaro.org>
 <20620ab0-5024-439e-943b-ab12d35a60d8@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20620ab0-5024-439e-943b-ab12d35a60d8@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2024 4:10 PM, Alexandru Serdeliuc wrote:
> Hi Konrad,
> 
> Thanks, I unfortunately sent the patch 2 prior seeing your reply.
> 
> The warning was this one which says that i need to send the mods separately in two patches:
> 
>>>>
> 
>>>>WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

Hm, if they were two separate patches, this is a false-positive. Could you
push the branch somewhere, so that we can report it to checkpatch maintainers?

> 
>>>>
> 
> 
> I suppose that me sending two separate patches was not good, how i can fix this?

Please pick them both onto a single branch and send together as a series,
with a revision bump (v2) and mention that you made no changes other than
combining the two in the cover letter.

Konrad

