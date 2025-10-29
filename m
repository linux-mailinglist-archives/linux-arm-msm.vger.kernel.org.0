Return-Path: <linux-arm-msm+bounces-79477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3F6C1BC30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0A185631CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F65629ACDB;
	Wed, 29 Oct 2025 14:27:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC516279DAD;
	Wed, 29 Oct 2025 14:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748025; cv=none; b=buSD8RU7NOoTosvszDJMKnOQuyHmGXdEb+dBS6qD7ptFWdgjxjPkH6MT5IIhyz1VRjwo2eksidtpu/fMFJuF5fUTgI53TJyRmNnGwlmGLEwf/Y1sLTrGnmSXL4My6ysDRtuSD1YstnZ8dt7yxd6tx9JADPte/3t5t0TW8GIGQoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748025; c=relaxed/simple;
	bh=dbygQzHttqjNpSjAjnD19UM0SjBDk0tlkiBX6toMasA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=VuoU09bVl8ra+F9OVq11snhpUrpLahp06OPMyZZYAwgM5ED/8JRFfBsJX5+Q0g0XQJQz6CCwjeT+8+1Df/mzPRms5tcHH4LSJ1puvGIcgXSxIHFlMNY8gCu5f0Zy0aNWvFPTcYBAm7nQSrLTs9+RTUpAswTfJm8YJDWC48yHDeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [10.101.2.66] (ip-217-65-134-37.ptr.icomera.net [217.65.134.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id AAFAD6020D324;
	Wed, 29 Oct 2025 15:26:44 +0100 (CET)
Message-ID: <ff745987-6e62-40e2-b2c1-ed35c0b9ffe4@molgen.mpg.de>
Date: Wed, 29 Oct 2025 14:26:43 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Bluetooth: MAINTAINERS: Add Bartosz Golaszewski as
 Qualcomm hci_qca maintainer
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20251028155320.135347-3-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251028155320.135347-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Krzysztof,


Thank you for your patch.

Am 28.10.25 um 16:53 schrieb Krzysztof Kozlowski:
> There are no dedicated maintainers of Qualcomm hci_qca Bluetooth
> drivers, but there should be, because these are actively used on many
> old and new platforms.  Bartosz Golaszewski agreed to take care of this
> code.
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Marcel Holtmann <marcel@holtmann.org>
> Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
> Link: https://lore.kernel.org/r/CAMRc=MdqAATOcDPhd=u0vOb8nLxSRd7N8rLGLO8F5Ywq3+=JCw@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> Don't orphan, add Bartosz.
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8abdc0e50699..8a2c5fb0ba55 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21145,6 +21145,7 @@ F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>   F:	drivers/net/wwan/qcom_bam_dmux.c
>   
>   QUALCOMM BLUETOOTH DRIVER
> +M:	Bartosz Golaszewski <brgl@bgdev.pl>
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
>   F:	drivers/bluetooth/btqca.[ch]

Bartosz, thank you for stepping up!

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

