Return-Path: <linux-arm-msm+bounces-85526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 435D3CC81D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88FCD303460C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7DC3559E2;
	Wed, 17 Dec 2025 14:15:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E4F354AF9;
	Wed, 17 Dec 2025 14:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765980906; cv=none; b=Yy86bbuHUPDzhWCmh0DcZbwze3wMb9OTZsUQvdDVIQ0G7Le4PkhZDmZcD4GLj3L7Y5mhG6PT/zQYRqLU24fQ7K1nHUzsiBhZJt6SxS6l1deu/4qKwhS1kSOriAlDdYDaNGaXVKFXczj4TWzyaXn5XQppl3Dz6IazZuqBPQoBIHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765980906; c=relaxed/simple;
	bh=MEQ2EbCrYHXrNgo/n0tyR4WzPAtMaQBZltY3EmDm+4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CGauQOM3JdCRrbOlAGwnymSkRGKM8uF6Hkg3IdaTMUgSmSNnTUDQHLI5s1qw06xW12PlYkSBWolocer5AiZiyT41pGg/QeSogpQpLgoCCGD5UC7FyFG8ZFc923WkxIM/YfEoNIMEMOqT1gv8iTUY5wUaZi+khaRr7oXyOfjsNxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.192] (ip5f5af75b.dynamic.kabel-deutschland.de [95.90.247.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 4795661CC3FDB;
	Wed, 17 Dec 2025 15:14:42 +0100 (CET)
Message-ID: <d180711b-7957-4252-b34b-81312705555b@molgen.mpg.de>
Date: Wed, 17 Dec 2025 15:14:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] DT: add bindings for QCC2072 Add DT compatible string
 "qcom,qcc2072-bt" to yaml file.
To: Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
 Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
 quic_hbandi@quicinc.com, linux-bluetooth@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251217112850.520572-1-vivesahu@qti.qualcomm.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251217112850.520572-1-vivesahu@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Vivek,


Thank you for your patch. The formatting is off, and the summary/title 
(subject) has two statements – look yourself in the archive [1]. Also 
the prefix seems wrong.

Am 17.12.25 um 12:28 schrieb Vivek Kumar Sahu:
> Signed-off-by: Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>

Please elaborate by giving more context, why it is compatible, and I’d 
like to see how you tested this.

> ---
>   .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml    | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> index 6353a336f382..197248d6f7b8 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> @@ -28,6 +28,7 @@ properties:
>         - qcom,wcn6750-bt
>         - qcom,wcn6855-bt
>         - qcom,wcn7850-bt
> +      - qcom,qcc2072-bt

Lacking more lines, I am not certain, but I maybe this should be sorted.

>   
>     enable-gpios:
>       maxItems: 1


Kind regards,

Paul


[1]: 
https://lore.kernel.org/all/20251217112850.520572-1-vivesahu@qti.qualcomm.com/

