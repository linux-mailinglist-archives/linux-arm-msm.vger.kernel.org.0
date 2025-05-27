Return-Path: <linux-arm-msm+bounces-59544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CA9AC4E1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 14:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0D5C188F66B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 12:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F033626A09F;
	Tue, 27 May 2025 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Un+xyXFD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0613E26A0A2
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347312; cv=none; b=mEbLU/xO0ub5mhNRew1pWSp22V1Z0KQrfODWjSdnp7NSa+op1D2QcrTUE4pFiKpBXgTZUWbvXwAGUz/wesKiEc6Y3pM6knZdkGBrchMP+LpSoJk6TXXjcCEM4unhhArCH2sAMvRbMRBnd1eXBdP6rMp8PgPeDXugBtZ+6U9vrzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347312; c=relaxed/simple;
	bh=xt7D4sh1I18/wL05zXuJeAMPACAqCq4rpqA/Le9JqNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oS67IZ9zrJd+NAVBfu+qy4ye7CQgXbdIQdlNlL2rOsu8skGnMhv4HJCIOuDZX4qKiQKby9UnxtLZ7ugzGh1welbcIzVWoasETVzkVhmlkAgu0T56I/ffmbeeFvS5sNKXmTzVx3U+xHpVoi+SKAXhwKBLTM2XTH+BPnE5p3qwyWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Un+xyXFD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a367ec7840so2386980f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748347309; x=1748952109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xt7D4sh1I18/wL05zXuJeAMPACAqCq4rpqA/Le9JqNQ=;
        b=Un+xyXFDaiawZehn1l936YdhODefb0bEKjOKQgo6l02ERO5BMS6RwWHTnSrJYl1fF1
         AY9OJRUimOg0G6WA/Fl81ImZSo+kDXmWGQSqJ78gdW+cSjO/IZWtdfOUToxCa1giZjsJ
         I1Rmdw/yuZcM87GR6hZZZE/8JE1WwiQ9tcgMqoVxxaJvWBiB050MWwNFpod/zzWyowEZ
         z0FyoIxeXSsPB2cU8R7Pc/j+Gywt5XJVNZ8KAM5J9J6VVOc++s3ULjeysjy2dm3rZ5Up
         2DB7nAyXw/kw2eJVoORq8LSkE81lkCa0ZZh1Z+Cx4tAuujjCUIhmcl5Z0XPGL9GHDX/N
         /D/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748347309; x=1748952109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xt7D4sh1I18/wL05zXuJeAMPACAqCq4rpqA/Le9JqNQ=;
        b=w2Nnn+FlSh/AndiCCCnM3dSj6fklQ7zs2i/T+FmzvdNTvv0ms6K0ENT+dRa2mXoXBB
         lGnoTTvaJKmSdyDhE8dL0Oulxwf7XjQD3dmZac3c1S7pDoKRplCYp5eEGHALlO+DCO1P
         QNXUAc4lkKQ1RlGPzaGK2qAyAVh3NjEcam8gPMx8Gut29x/zC2VxaRUeZtBX35K5VBC4
         tE3EdVdogiU/8FwRD02Ul6OzQLBrhBmqNwYEOgEcNeD3GJ5HBaKoz1gHaApRXEB3pegE
         TfmlnFEC1JmgkuZSVYtBVJq2U003bvUQRb0vl/0K0gQPbC5p28mI7hlXSdmHBkQXHM1a
         Yg1g==
X-Forwarded-Encrypted: i=1; AJvYcCUI+Z+zn/dEpuKuwxNgkq26KGdQF1Vj4+oKkISfcYI/Z8/4o7UjEBgo8J3Bp8idbcNv0VFx6fiyCz8fkMWu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywem/Y3M85UsqzzlOIja+45BtD9wHwn04LDmvk/Zz/EbepQKkET
	V7nzqpylhYc/mGQRKAnQMfQ5UgQzXgdcKs18J48tqePWoNuak5uvHYOw6WDtt6W1XI4=
X-Gm-Gg: ASbGncuRupuggPJUylQMhU0FLZ/PhNQJf2LhaTuEKBnWwovppuLv5tMmhWnZPA5GTPa
	dOiD5CBGMlntd4kLbprpGCs0AjYtRMlOVyN+AfGcU5+Fk9XWb4SAZSZaQrYoE1Lgt1dXSORx+Zr
	shLpMjrIiu20K4GvJ3tUYE7bcIllMypLH+d5H+GK0fs7CIINsF1YRtMsQPbvmQF2BufXo8E64bi
	/C0sPNGSQABXoqCcPMeZCs3K91877aNJ7hxtNNTanZ5vYNQbmnxY+OZDJZW0ZXHoQvhMQbxBva6
	8NQZe6u7j8qRDwRe0xUgtXOdyzBibGFGjtzAzrxt79ewsSZGGzj/BPNJ8ONIdcMmtFOP6lor6KZ
	3zI82iCJIGPIJjyhm11G88JcyaoY=
X-Google-Smtp-Source: AGHT+IFWtDLH1zwZOq+Rw9/Jw8vNdc0tJOd1ARYqcoxhkpz9AqYUyEe5yiEWhYdxUf/zfsOc82GHeQ==
X-Received: by 2002:a5d:5f8a:0:b0:3a4:d9fa:f1ea with SMTP id ffacd0b85a97d-3a4d9faf3c3mr6111892f8f.7.1748347309236;
        Tue, 27 May 2025 05:01:49 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d437f961sm7631925f8f.17.2025.05.27.05.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 05:01:48 -0700 (PDT)
Message-ID: <308a2447-5fd5-41f6-bef2-b96d3aef4de8@linaro.org>
Date: Tue, 27 May 2025 13:01:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: qcom: camss: vfe: Add VBIF setting support
To: Vincent Knecht <vincent.knecht@mailoo.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
 <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
 <e8750bc1-11ab-480c-a0fb-262ff6a0dd22@linaro.org>
 <4688737b90f26ce56e7043a006f25e28cddc928a.camel@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4688737b90f26ce56e7043a006f25e28cddc928a.camel@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/05/2025 17:23, Vincent Knecht wrote:
> Do you mean to just rename to vfe_vbif_write_reg()

Yep, its more natural language.

---
bod

