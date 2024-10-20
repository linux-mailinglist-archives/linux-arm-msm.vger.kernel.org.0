Return-Path: <linux-arm-msm+bounces-35144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555779A55D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 20:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7176D1C20DEA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 18:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE84719538D;
	Sun, 20 Oct 2024 18:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mY+Kty5/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076B419415D
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2024 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729449058; cv=none; b=OYwvSwi6Vjftu9qxOJdTi9/5TSGXaUFjJwDibSUaaYoutX3+CZpskKGxJbB2GBxaAzL6vhzVyaTJ3D94dNOxKyynZ20aJiuRN2qUs+4weLhbBBU6iPtuDOAqZfFlj1Go1GOefkq5tPiH2xaENfAotBAoUqPVGw0IAIlsAbGG5LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729449058; c=relaxed/simple;
	bh=64HPjqZKC/4B2OBJyRzQPoNGhFwzV2vT+MOg0udOYmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOyDQFaKyuht9pIF76Ewre5KKrwDAZvRUuvUylLqCyuauk69UCUT9DOhPToRuQE8eYu1gDIsrEC5uhxJdhZjKU2810MsrZ0dIL8JdqpRXRxkU9l8UDUP6C4CICzt2qRog10gmZ2YIPBK6yPXlSsC6yCJp0eshgl0WU4c8hNCr7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mY+Kty5/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso548238966b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2024 11:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729449054; x=1730053854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ycrwr9FEnksI3zMaAOZn7S7AXHWQh2BKeqpuuGUtii8=;
        b=mY+Kty5/+fKhKbbCDrV+dBoVrK5NTc3eMd6VIgGvNzyzK02QZFeK7U/F48BXgCWJ6a
         utxC4DTVmZ/kq9cQdFdBzfjv3HvWN9gk/E9vND6I98hp1q361uJcyfO96+WuXdI+yit3
         o6H1s89S+1VpyiVe1HKQxdZ97ycDbvOG53lButFjoa1TXPXaeHVsEOg+QjcBXOCuKhHM
         u3B6HWOZgPtrg0ocagEe9AwCRafV+GFBCzmFuTO9dUoB0h9uh4nQJ/IcFCE15uQVbAoY
         /uR42f3YCGhPNlxN1Iz2kH5slqycF7AtIo1DVKpJjH24t6XVp1nRz+40gEsYi7W8u8TH
         c+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729449054; x=1730053854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ycrwr9FEnksI3zMaAOZn7S7AXHWQh2BKeqpuuGUtii8=;
        b=czxAQyahz8cJG/1RyieJMwePfD2vG2dP3VAm4XNtSyw8FLIBVI0pGOaWkeQh26l4Wy
         Ix3jSy4q1tucqC6cKJ1WY/sdPbusmZLGPWDUaM6jA874XepH3i8zpLFLqCiWm9dY/YWG
         ufzk2qsXZjGCta2z1dWyiPeGbEWx4c8dlnwhd2K9ro7ths9OEcUsq1V4sGXlVX8Hkw2U
         0PwuVAKCCt4HP06i6A9s4yBukaDetk/2OHd6MYtH4EXhPwDsaU15h1xdffQG2dfH9CBO
         f4+iT1rpmt8sR7p3Ap3rSL3p4NNrq9AdqrZMgGHgCc3HtKrYtsObj5V6Al+3ECBqaRdK
         oxlg==
X-Gm-Message-State: AOJu0Yx4CCFJlNPfHn1fKXkF/AxbmaLCshzYBpyYBPG8U/+6iPBXnhZV
	U7Mimn6I1Pz9CLDrAlFPa5d67gRJCt417jIv4MMbV+imvT0pmzNjuHOdSxXRFoQ=
X-Google-Smtp-Source: AGHT+IEeZYETzTHYFSe/ch8+Hmv6kdhp1/PipGST6DmWGt8Be+OA6K7Lvq/jEMzNmd+G6ckMTQ/1eQ==
X-Received: by 2002:a17:907:9623:b0:a9a:230b:fb5e with SMTP id a640c23a62f3a-a9a69868cb2mr978299866b.4.1729449054068;
        Sun, 20 Oct 2024 11:30:54 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913706b2sm113778566b.121.2024.10.20.11.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 11:30:53 -0700 (PDT)
Message-ID: <abe44e99-7f99-4912-b94a-7856b3104627@linaro.org>
Date: Sun, 20 Oct 2024 19:30:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] usb: typec: qcom-pmic-typec: fix missing fwnode
 removal in error path
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241020-qcom_pmic_typec-fwnode_remove-v2-0-7054f3d2e215@gmail.com>
 <20241020-qcom_pmic_typec-fwnode_remove-v2-2-7054f3d2e215@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241020-qcom_pmic_typec-fwnode_remove-v2-2-7054f3d2e215@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/2024 13:56, Javier Carrasco wrote:
> If drm_dp_hpd_bridge_register() fails, the probe function returns
> without removing the fwnode via fwnode_handle_put(), leaking the
> resource.
> 
> Jump to fwnode_remove if drm_dp_hpd_bridge_register() fails to remove
> the fwnode acquired with device_get_named_child_node().
> 
> Cc: stable@vger.kernel.org
> Fixes: 7d9f1b72b296 ("usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 73a159e67ec2..3766790c1548 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -93,8 +93,10 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   
>   	bridge_dev = devm_drm_dp_hpd_bridge_alloc(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
> -	if (IS_ERR(bridge_dev))
> -		return PTR_ERR(bridge_dev);
> +	if (IS_ERR(bridge_dev)) {
> +		ret = PTR_ERR(bridge_dev);
> +		goto fwnode_remove;
> +	}
>   
>   	tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
>   	if (IS_ERR(tcpm->tcpm_port)) {
> 
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

