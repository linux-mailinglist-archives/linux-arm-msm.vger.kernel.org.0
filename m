Return-Path: <linux-arm-msm+bounces-39898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 498759E07EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 17:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48737B3E19B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 14:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A755E20E012;
	Mon,  2 Dec 2024 14:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SyzuzLdu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E5420966A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 14:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150809; cv=none; b=pX+Nq4ooVaG3dSB7Ly0vAiv7FL4oslMGOFfWLsERq7U1c6k4RdkjO/sPY1r3EikF0wJhgqZVfaVMv3IwMMZ6du1pGanagXwn4bEsvimU01d0fQ3BsFyz8Ti+jmGvx5BB0aJ0xDwgsJuhMqvt/xPIxsqnGLRdlRgNTzhd1bGFR+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150809; c=relaxed/simple;
	bh=YDs+AUP8/sPXPpRK2RvKyuumBkR2iVV6ym1xSAp2m1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JM1Jl1gTYPsHj0a0dYlntnb/hP3A1T3gpl060o3NHPu2gOMeLCOA35Hdvii1fby3HipZc0qnQ3MgKKJmGD8zH8GkiSTOQtAyMSuaiYWLCNzIGroe0M1+sQ/pJvZNID6Hmuaa21/TznNHrXuP+G15+UGBHjw2CL+jO1H1vEGO6Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SyzuzLdu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43497839b80so27618455e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 06:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733150806; x=1733755606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4jngKSnV1SnlkeqtipOyUqxY6v4EepIgqkXVcaaXUUg=;
        b=SyzuzLduOoNRgG6ZuNKAtCFUvrAy0lRXR5iCtS+Q/NEL3NfPCj/B6fG+3Y8EqgG5lr
         RrVV0jda6qkHmf7r80zgEUywWKiIY5x1RfMCmbNF3me9CK3DXszFEs8EZQ9lsnfBoTit
         COVjEnOtyumcNN5olTi9T/zbMLSUQeYQZm89Bn/QD2JHmMIlGlovOrlk1QHWrZlZF8mf
         WfOCxSVidxfoO7e4jlY6nN4z3uhG+lgeM8EAQ6dfwNTR/4GGqjbW8avpEeIiXqSVa//9
         sEZM8oR3bfiNmHDNmyB/3bEtsJU5lznAHoGH+WWwfirclFDsRdOqkRSO5vi4/qNyk6Sk
         MkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150806; x=1733755606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jngKSnV1SnlkeqtipOyUqxY6v4EepIgqkXVcaaXUUg=;
        b=C3qZ+AyDW0cgb0BPWnLDaEh4j7lVZOEpUW5WztaA4EosfJVeAQpYos22zLsDdOc0o1
         77Oy1PzC28eyO8OqObEwKHpQ1tNZE0k9QCzenwTz9yaveZD7rTXoBmZdy0fQwWKamH+3
         dsde7kZhgZDrMEl+6fRiAZtFZoliYLe/usrdOkRN1kj7x4K1FwExZVUMKfOqSQpUGoCD
         FLu1udNvYuZbx2gyLEhAAmzZUiiL7QJS0JdA2TP6OryWjveDMR0JcOTgiVYzEJp/RLzQ
         ffOPNGXmFRiwRje5eBnNaeLYbIRWfG2Z/I+EMn+oIJX4+2AKtbnsRTcx1IzlBB3Ha6JS
         jJSg==
X-Forwarded-Encrypted: i=1; AJvYcCXjcuUtPDQpky0uhxlhzWbUiQknNy/0gnpy1ZQgeh49BXVwh6xkXxjMzcIlLb9q9umc9JZqyMiijIzOtKDO@vger.kernel.org
X-Gm-Message-State: AOJu0YybbCWLTBB9db/OpraaNPfFHOfDOqf0UPngYy1DecUe8VTtiuzu
	sTk9Unza+aRKTKWhFZ76GOgI3UfSK1HvH1S8O5cBJkYXBDLsTR091yPf4BS64qQ=
X-Gm-Gg: ASbGncsp0GSMci7gPNvOhVkB34u2jQC85nnPrpj2yDOTUMPYQOCeFxGf4vOGasoxrBu
	E+0nyDuSxEAWHcUk0WEZ/82pL7yLcc82dcTzhdqH2Un7LnJkjV+8IVpm5QWF9wnmUikdKspuonL
	AdYiJLsCErkIznQuGghJlMeW5T+zkRf4WNMPXHaOCICBuTSCRgLP9Kn/CAkDrIkobwl1D/GhhtS
	B6UEZHfgUsRBC3CA9oBGEySB8rNmOPs6eV6O3PqB8W7krUkThrnXKyvsluuzY4=
X-Google-Smtp-Source: AGHT+IE49b8JjMPBK9ZvR+0YrEE6wFU50bpMjnp0L2s2ALML5mrxtbe7syEjF4yg8qOV9t5qAfufhg==
X-Received: by 2002:a05:600c:b87:b0:434:a1e7:27b0 with SMTP id 5b1f17b1804b1-434a9dc3d08mr207426355e9.11.1733150806267;
        Mon, 02 Dec 2024 06:46:46 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa74efbesm185888475e9.7.2024.12.02.06.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:46:45 -0800 (PST)
Message-ID: <1a063942-22a5-4ffd-807f-67b681ddedf5@linaro.org>
Date: Mon, 2 Dec 2024 14:46:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: venus: hfi_parser: avoid OOB access beyond
 payload word count
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241128-venus_oob_2-v2-0-483ae0a464b8@quicinc.com>
 <20241128-venus_oob_2-v2-2-483ae0a464b8@quicinc.com>
 <65002924-3b8b-47ab-aa90-4733ccc2f728@linaro.org>
 <1a6d05d8-08aa-cb84-ca36-859be3c589c3@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1a6d05d8-08aa-cb84-ca36-859be3c589c3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/12/2024 13:24, Vikash Garodia wrote:
> If you see, words_count is doing the role of remaining_size. In existing
> implementation as well, we can move those increments per case to once per loop,
> just that to avoid incrementing for default case.

Yes.

To me it seems

- A redundant step to have words_count
- That the functions themselves should return the amount of bytes
   words += should increment by
- That you could do that words += outside of the switch instead of
   at each case:

but to be clear the logic of incrementing the words looks right to me 
now, I'm suggesting additional stylistic change.

---
bod

