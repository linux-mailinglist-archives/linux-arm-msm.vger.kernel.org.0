Return-Path: <linux-arm-msm+bounces-42787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9AE9F7AF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 13:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6D2D167ED3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 12:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BF9223C75;
	Thu, 19 Dec 2024 12:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QnFvLD/o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630AF223705
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734610043; cv=none; b=hqALm3VPp9SJXmMQyEW4mHksSsdwPxwldyNVW1nSpqajF5Cm1CdwkN0ShhpRXjVq8GuTebPvyPWeIgbXHlx6dNgR49dI5IlmHnyAPraxM0H0BZ7QYGLe0zmsNDpejCuONrB82OUHUrs3XBy1zMT/xxmrEjBanZUfMcN+0ecc7XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734610043; c=relaxed/simple;
	bh=TQ2k0hDSEioqe4OJkjemYr7Wajz2gW6QOuogE6HFEH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAg3Xc8DehErXZGuYUMafNUeRPWZ63w0TKWIk8Vx55S5SiIVtrp+Gz/4YgVjvJ3iJxQ5W1OGZmab2A49OTI/angTef3hNm6sKFCedVYn6gi7/dmonhAQ3WvzVZOePDWZxIkvCnFE70c39AFx2/o9+jPCk2W7pouSN/d2q9kiFNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QnFvLD/o; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3862d161947so328851f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 04:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734610039; x=1735214839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8YmmN8nkKjrK99ISGjRqnOlBNpvXQaOLxV6iv9YKRvQ=;
        b=QnFvLD/oE3b2PNktW0Znxw+G9fJ8vD833CaWnWQWZVd4lkXJPhNvQ01atxkpuLVgFf
         +W7lCQJSjYzyXVrEMZeXY2G0V4dB4+EguoJNlPXeRX3al+hHLpZ9rllUXWoi9+SqR5t+
         iGpqmgGxqX46OajhxUvlDC24wcRQrsQibn6pJMLA0bltCNPGXOO1FpLP1E6O7wRanuup
         KTiYwpvU1AOOTLGttCZ+UQ/F+lIkDC8inLw0uVXgI/lecEs74o4HhdfJYnVB9YQcxjGW
         BkTfzHJCEN1ZR2yQE90F2xviJyoR/6Bi91WfJf1zPKCeNWapkU96Jo9TB/CefH+SvaRU
         omzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734610039; x=1735214839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8YmmN8nkKjrK99ISGjRqnOlBNpvXQaOLxV6iv9YKRvQ=;
        b=O6N115e7dstESw0L6q5hiqZEmZBmOuLN5UWt0kIbShfd5j2Mr0IY8KZTozwhlB9qka
         HmCbwZbWyM8ZmSof90Nwvfyrd2mgMBJxy4f/5Y4gJLbPi6By9rF3Fg2rsSF5QbEMUFL5
         a2cCAw11u7V1OS/6pqw8ujKgcWnOCYNZw7n4iYOr2XdAM+YhlMr88rn39/kQc/60TIm8
         GkBs3hZfzy1EclF10bCtPQFZxmN1U8hBqBDUoGb24I8nDcRQgyQlXgPK31Vs17SkgPZJ
         Pddx+FSl7kZVGhvw5qcq5l1nobk3jfLeiOqJ/tXkm1PjVAf5jyamTg2gjQhYKTdN00QE
         NMaw==
X-Forwarded-Encrypted: i=1; AJvYcCUhgq/H7spcyBnPjms3UaToI7sItkPCOPKnYBxzWk8rUupZ54sXm4VAQV0L3UlapnUrFDnMm8y/E/CjSVlv@vger.kernel.org
X-Gm-Message-State: AOJu0YzAYDnRwCIbcZxB4zyJlwoR0iTHs2IMCuLBXSTohkhm+QxJW4sG
	1zhY/ObjC+vqlCK13F7NZYZiAy/AvVUkBcN3yMgrpVvhWGTifH96IaQ0uWrnqWY=
X-Gm-Gg: ASbGncv9ex5HPYjKbrCPBECSH2IV6wOw3R8M0HkaZfh/svk2IAAFO8EzOfmI7fSMJSz
	E3lvIvqteyn0gsq+lUbQEOc/Qc4q0s1a7E9TpC0gWaphZ/YfaEj1FfDZISTJKo4vj5G6+3PwAMA
	ftWqaqPOqagavF2MsQLgqVupw+DsimwyrGsC22chDmyxwXBnjx12N6k7GvzOZgdusf9Q34fer65
	iAkDCu8XZMg+NRNiMCxLK4NZNeghkzGOw0WdYPnMy6TS7lCy1edNOK0qjBnJhzMe46waQ==
X-Google-Smtp-Source: AGHT+IHz+r3tOTq8K22KGT7iziw6NLDUZNcFTL4o5oiT1OGLu5RtR/FnRqLm817TU0hdrBOo//KULQ==
X-Received: by 2002:a5d:6da9:0:b0:388:da10:ff13 with SMTP id ffacd0b85a97d-388e4d65ba7mr6286145f8f.21.1734610038756;
        Thu, 19 Dec 2024 04:07:18 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4432dsm49706455e9.41.2024.12.19.04.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 04:07:18 -0800 (PST)
Message-ID: <1e1c190d-b897-4d6b-bbaf-7b82b0935c14@linaro.org>
Date: Thu, 19 Dec 2024 12:07:16 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] media: venus: Provide support for selecting
 encoder/decoder from in-driver
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
 quic_dikshita@quicinc.com, konradybcio@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
 <d8cff621-3e19-da49-0a20-8df74123ac91@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d8cff621-3e19-da49-0a20-8df74123ac91@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2024 07:37, Vikash Garodia wrote:
>> Signed-off-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> Thank you for the changes, looks good to me. Let me come back with some
> validation on few SOCs and update here.
> 
> Regards,
> Vikash

ACK, appreciated.

---
bod

