Return-Path: <linux-arm-msm+bounces-67849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8ACB1C02B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 07:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 439A47B10C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 05:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B9A1FF7B4;
	Wed,  6 Aug 2025 05:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="buB0JW6U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6146B15E97
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 05:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754459899; cv=none; b=bsunXGX7oey13ooK7NCvqkfUBIU8hLcXgeHDD9duNBloEtT0B2/B/f1qPsqFMG+F6UxNUOLGy2HSzff8w4jnK48wfXxHlUctPZu6eqYVqdT02orGk8yOj9jQvfVA1si8pislD2qTqhPxf3WWyNu9mFJXrxxXMgRUDEtrXAASLFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754459899; c=relaxed/simple;
	bh=0wRXWn07qZNdwQLWXGu6/e6uroSeA3oZMDdv+cemm/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ebtu4DauW4iCkOyV0ogQ/7g5EZarwzbetU4hNm/ZUSrSLn0KIpRP8Af5dS9kJgwabktLOYWz/Z2O/umst+ZeftoSLVJCMXTEmX+BTxMuRAd19AYWfudian7s+gwtBU5wpDTqWgiZhZW72xrKm9jMrYJkbwrkwi476zqhaQpQOWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=buB0JW6U; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6158c9766f8so977810a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 22:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754459896; x=1755064696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lujnusIOjVna7AWXW37RrttIaPYgCcALZjbW0FcrlsY=;
        b=buB0JW6U1frAANZoApn/DEBHagqDYAP1ZGDEKb8bn2lDnYhEKCam4Mgabl73S8QTZf
         zSirLjJ96biPP5dlgHMTU1bHYAdPGmcjFEekgAJEdte+H6QJ9bAQb1c78jMy+4tdecEh
         zeYE7Hy74NiivKIzgrzpm4dYid29MdDbreMNfsW6BV8X5weMCKkyC8LH+lzk7CMZg2pc
         7oubyX4HMROp+DtB4+q884UavLUIx6jlTWNRe9Y/SSDKo8y5DVJHbW0TtzL6tsZcdywM
         yTiX3Uh13EhcusumjS6WVwqvut1Hip7GQMYMxja3ODmXW9iEFol6c8G0s/MmY1j2otwm
         lDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754459896; x=1755064696;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lujnusIOjVna7AWXW37RrttIaPYgCcALZjbW0FcrlsY=;
        b=gOJJHJdqVtTJTPqSP3c9QFEZ2Py5QwOtNqx8YqqOu2Dfeaxp9pPz4z2qAF4FkWwuPZ
         uZG2ZNOehchvwzLFiFgBN2aEtrd4zvHJ8SX9BJCs1LOgIZdPFI9U4SWMCEsJNa1+c0zV
         J3g6TYg+Vqe8o1jW+hiTAHOc/cTQOUrx5+MIwoLOK4hVHl9StXyPsdLWEd8C2clHnLA8
         QngLMIm3dALz5i/ZNz8dFXQvjtYN6D6mmS0gpRAQRs9aU2d73sdmJ0aEZRFhZNmWLTE/
         FptIWzUGd0tK1z9LCRNIxp8izxDhm7XuxjTDZ5NX0Rbq6Y/EWK0OTz0Y0t67XcyRcQNa
         BZqg==
X-Forwarded-Encrypted: i=1; AJvYcCVjogKZ01AZkP0vBjGbpWMLso+G6vrgsvV1r5ySx/pTHHzWCRkCUNCYnEYljrr+HIYVuHzgSQDwOf/Jt+nB@vger.kernel.org
X-Gm-Message-State: AOJu0YxUnk52ZaSnDzpmrHf28wOS3GSHVJU3/ag+BQvwfED+Vd22keZ4
	2rf37BbPlbvwLzdG8R7Ncr2LrTgNZQhPkuM8qA13Sbz9ti6kBW338LnzlI8zLxWKMes=
X-Gm-Gg: ASbGncvUv61UPDaf8B/KvAuUZtq0jJOXVAtRLqcqvwuGZu8/zgEa5qLO+pKWzo1F3+M
	9VBnvit8z25WA9ZPuXqd+GBQa0DlhHlkjDvYi3RsxB3HrbYlUo+3yZVPsNfm5FlaUdzrCwgEqzP
	vCSbVqIxa2XH7c2ghigYnaJK1q5DJMarDksLHkiQ4vY2mhD0WotoRZsLNGvOVV60+0UDyYM0xTw
	3sTHc73EkqyDDuP6cVBIpU9b7mnwZAr6v2qhJs6Rx8Z2enQIrmK2fjGjQCMLGGw4XbUHcTzz5Lu
	mFc87rNG63YoLArGkl50hrWxfYeGLqQ+L8GiX960IE+JEsnzRYEG3kIno75vmnXGpdEpoTLnLew
	rNUkFFA1TY6mlg7J/aorq5xSxP/2kJOy5pCl/YWVMLu8=
X-Google-Smtp-Source: AGHT+IF5PBw1AWigxP/i3lXZ9qZ3IjP70cb7iYCKvwuxa85ErvQ/KvH596gR5FjO/aMn2ru4M+YOEg==
X-Received: by 2002:a05:6402:3595:b0:612:e258:33e2 with SMTP id 4fb4d7f45d1cf-617961d10dfmr592247a12.4.1754459895685;
        Tue, 05 Aug 2025 22:58:15 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a9115562sm9686773a12.59.2025.08.05.22.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 22:58:15 -0700 (PDT)
Message-ID: <279fb589-d22c-47f8-9c71-4e959bce3800@linaro.org>
Date: Wed, 6 Aug 2025 07:58:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] dt-bindings: ufs: qcom: Split SC7180, SM8650 and
 similar into separate file
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250731-dt-bindings-ufs-qcom-v2-0-53bb634bf95a@linaro.org>
 <yq1ms8d9nx2.fsf@ca-mkp.ca.oracle.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <yq1ms8d9nx2.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/08/2025 04:37, Martin K. Petersen wrote:
> 
> Krzysztof,
> 
>> The binding for Qualcomm SoC UFS controllers grew and it will grow
>> further. It already includes several conditionals, partially for
>> difference in handling encryption block (ICE, either as phandle or as
>> IO address space) but it will further grow for MCQ.
> 
> Which tree did you intend to route this through?


These are bindings, so please take them via UFS tree. Just like with
every other driver or bindings patch.

Best regards,
Krzysztof

