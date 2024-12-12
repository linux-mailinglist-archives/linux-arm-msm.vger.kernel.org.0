Return-Path: <linux-arm-msm+bounces-41744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB339EE6E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 13:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B71518861D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 12:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F342135A8;
	Thu, 12 Dec 2024 12:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KwHOg104"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63985212FBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 12:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734007273; cv=none; b=B0DjC/ECBSqxudveYc5G3bocIPo6CkDlgtm1ZAXsfOGU6d4TX+n4qP9xgDEvWpdxDG6V0FOPJu8OhN1gRSaZjRi+Sp2IR3LVtwUmRKi1MyjycdSTq0a7dCJ0MniOc80UYncxFMUDssHeO+on/TXDV/rx/7P3lixfLt2iI3jYsz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734007273; c=relaxed/simple;
	bh=Tu/dFKzeet27GmDqbtWEt4iGTBlq3wEZqSveNunZQyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCMULXyeEMLa80+gH7UiiM0nnAUnmXs53fRdPSMTaPjvr+q6jJsahFIZmcrqio3J5ZqW7Qm8SIRZr44+YQsATgyn7NbtoKOEjodTnRhBtx6IOvZNIcq1mP1hEHOF9d0lac0OYGF6qfiVIigBo6qOReM4tgX0/r7fMZOtrXDcZXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KwHOg104; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so1017334a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 04:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734007270; x=1734612070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8bkw8aLWhg4IdC3Iyd2UGPgLYgTX4eLLSzr6WZhm6c4=;
        b=KwHOg104tECUeLCic1AROAit2IBxU/WGSotQgXtsXdvytz1q/epPlaZQVKNnQCIheK
         FsfkCXS6s6trGXfAChurRlz7DDJcbKH6yemZgn8f8kIFq9+DvnsAHNT4ZuZhlTFy+GG/
         jJcxoIXrphCH1gr+fiUDjbT9aQaVHqdw3Ldf97Am+c99blwgiZCJjT5aDkuJ6tXY6XUe
         ChMMrimbnQcMTBxkOazSjqS3dvkS/fpLFzlPbloC7LdnutPsmP033JNyqtoKUj//UZLs
         2MGqAdkEMMoAx6txP4aon8iGMdpbv+THKqc6Al9RJcEzZNXN1R4427ZNXoTPJxieFEjj
         mMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734007270; x=1734612070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8bkw8aLWhg4IdC3Iyd2UGPgLYgTX4eLLSzr6WZhm6c4=;
        b=jLXAsXbpKXNwzpL1HpWEEzcIVqamPjDN2zufOIvd8Jn4202WB1dkulphY6ysy4tdql
         5AH1hVJPn2QObykWh6wDYpTi1vkHA4lC5emjb8uv2Hq22raa59l3z2MHTCFPAY/3Xl2t
         PLXxh5/JpP/JLJQE2Mv/6oX4u9Szp60aSHLR+/BOgmX7ye5a4jrEZpa8yJdWIE8Tdpgx
         +n4Aq7+AT/j6tSKLVjzqluj/oAqCIJvgBjhp05z93R1xxkIFj98j76rnABaki8wlXx/w
         kPkW7vYMKYnwLEwd1bPTLRq1aIMvVkuig6zsInL68TZg0DtRY18Gz/x7ANXUqpDl7jfY
         ia2w==
X-Forwarded-Encrypted: i=1; AJvYcCWXsQadbgbpX8Wugonr18EcN4vexJwKUzKOkw2bu6wiA5GiEtKS3+pqcQckZyTATUE13vEtvjb3Z0Mhp2IV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt1DL81zeQ2c2cRJ0UqgtEBrH9swnYmjc/aTTXuWIhiOJbjrCW
	fW8BAqvULdgqY3lKD2v3XAnh3uT5fuofvxumSNFZigLuvDaZKSEmvW0CHTl9b+4=
X-Gm-Gg: ASbGncsfcYXRskFjs7Aoei7OpHflugeLYeTmNkwJM/4IDdhQvv13WSz+FOE72sqpiff
	7AY5aSQjXC7NroLR0Z7qrG/8FnAPe8vMTL/XELSwFJ1GpuuWTeqDd/ZwkLhMNwF95Ois46uh+M+
	98eQHr4fCtos6jP0u9AB7TWDgMaOBYph2m1vQivz01olysRb/Nrmc3+wdwaZu2IlvjD+f7zdqNb
	Ab6A9yFuGkxW4Tm3JTp4Wmo0a8BveRu2mB7GcUZVdx4JBAfLnyrJUfKVfSMbN6TS6dliA==
X-Google-Smtp-Source: AGHT+IFur+anvIPrRfunzJYLh6wEtqp7DK5VjkUBpxyuQDBjTbkTiH5jVNJtu8OGD0/LBKO7AI5Oow==
X-Received: by 2002:a05:6402:2396:b0:5d3:e766:6140 with SMTP id 4fb4d7f45d1cf-5d6337e00a8mr76871a12.24.1734007269761;
        Thu, 12 Dec 2024 04:41:09 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d42a754cb0sm3172232a12.88.2024.12.12.04.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 04:41:09 -0800 (PST)
Message-ID: <b4afb2ea-eb5e-404b-9df8-3e11d08a6bff@linaro.org>
Date: Thu, 12 Dec 2024 12:41:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/16] media: qcom: camss: Add CSID 780 support
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-16-quic_depengs@quicinc.com>
 <138cc2e5-6b31-49d9-b70e-400a3f3c3bfa@linaro.org>
 <28b1c828-f338-4d57-bcb7-b0a8652c82fb@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <28b1c828-f338-4d57-bcb7-b0a8652c82fb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2024 11:28, Depeng Shao wrote:
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Vladimir suggested to add a dummy "return 0" function [1] for the 
> unsupported interface. So, I added this empty callback, will keep the 
> empty callback if no other concern. Thanks.
> 
> [1] https://lore.kernel.org/all/b1e1ff88-5bba-4424- 
> bc85-38caa85b831f@linaro.org/

Go ahead.

---
bod

