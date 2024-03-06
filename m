Return-Path: <linux-arm-msm+bounces-13520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE9B873C16
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 17:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D17E81F2203D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 16:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D291D1369A9;
	Wed,  6 Mar 2024 16:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yKII0wV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E82B135403
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709742189; cv=none; b=eoRmhA3D7ycHovi7ADeGKcF53XTLVvrda8iXFGLIGcMLuHF8J/bgJBkE7HvmVxT15LGmV8I3CB0y8yByohwiKVI0jTkl5J3BxjzPZsv61DcFEX+jNkkurbZ1vHFpBxc1I/+uvx+eukNcx3PDZhPU9wmltpw4eGdh1zBFC0tqU9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709742189; c=relaxed/simple;
	bh=afYBYeFEF4XjQ1hiQqHgb14ZhlaTYmEfuQA3UopgPDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5FZ6S9O9m3IhZKjE4hWjXthamGex3RUVzFGzZqnMFG0b1a35PCVejT0IfVNmeBSTN3wXpqtqyW87C8OXxAt5bo0nABE4k09KAadQAC7SSIyfcAf+aM6pgayEG12fRju6Ac4T+rFXXku1HbxVwSh3yXx+G8hLgBeRTD4UqsSgqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yKII0wV+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513298d6859so2343280e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 08:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709742186; x=1710346986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Sustw/UCAeUUyY936QXaGUX8YthNOQNToX9WoMoAYA=;
        b=yKII0wV+jvbFHtQQotGuCCS3LwkdnQWoCebGmHYpZLKb8OckxrtegEaz29yjotn+t4
         C5kdgveqUL6Zd5LlaZcnXYDRH1iZMFBTyAgbqUHsz9HK3C5NRCeL4g74zs4/MoihIsl8
         hT7LvTgx9pIbRqZhnivjt+K6aoJjNcdWceyBZihHvW2pRwyaEGScLCd9JqLv43gssOzm
         /JiVUvpqlU52qdSddyGIoS2VVk6MhuwVA/x1OuZjU4OcQdXGq+LcVzAsZTkp2PQhSx8Z
         jN9TIAMwh9hGCgvV1UaD7tmtEBvFaSiYawJKlnD04VgRYuXC/sM58crfuyCToYANaCmJ
         f8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742186; x=1710346986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Sustw/UCAeUUyY936QXaGUX8YthNOQNToX9WoMoAYA=;
        b=QdcPwNQSG2wYVbd+beqMA9EqUg1KL1/3SZVhhsYlYjrQdd3UMP65hitdwljv9Lzo4X
         nyENuoiAPhO9qMZzhL+UupOISBbC1nBPO+ENW5s9fAkumhk66LtSiCeTDyCs4tyxEskI
         gILZ5VUG3NVD23BJNEiO7MPx7OoLvmUpCl+E9F02lyUD2VV+SdIf7X7wejOLzoQ8Zja2
         BV+bIFdabdmjg0z/ENY2ZMFVUwgTTcdNHGUCLhgp6zAViil0muaaIt6LjvW+nPZYtRlS
         Y79OL5+bg1VXu9iCI+9JfAoRSliOUg8mVOqW31RkLFATnyxEu2mY2HYrHfHib8n2ny5X
         xzwA==
X-Gm-Message-State: AOJu0YwLaksTkuv2QFNTpPhEE3TzGO+S8miycn+Ctm6l3SJiKRtjVY4X
	psQltbGCO2r1EOLKaw+5o1hNq5IuaFJiRQgyjEHHKPZjioP86ZS7SH8wlRGlvCE=
X-Google-Smtp-Source: AGHT+IEAop9sVtkU9v+SA5q3UwOuJJehuD+/laWO1vVCwrGxrS2lngzwlNhZ4mqWY+bfhGVmNxpWrw==
X-Received: by 2002:ac2:58d9:0:b0:513:506:219d with SMTP id u25-20020ac258d9000000b005130506219dmr3589573lfo.49.1709742186319;
        Wed, 06 Mar 2024 08:23:06 -0800 (PST)
Received: from [87.246.221.128] (netpanel-87-246-221-128.pol.akademiki.lublin.pl. [87.246.221.128])
        by smtp.gmail.com with ESMTPSA id z15-20020a195e4f000000b00512ee143d25sm2728509lfi.105.2024.03.06.08.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 08:23:05 -0800 (PST)
Message-ID: <1167392e-c0ed-4504-9493-5658b4d66b51@linaro.org>
Date: Wed, 6 Mar 2024 17:23:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ARM: dts: qcom: msm8974pro-castor: Remove camera
 button definitions
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240306-castor-changes-v1-0-2286eaf85fff@z3ntu.xyz>
 <20240306-castor-changes-v1-3-2286eaf85fff@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240306-castor-changes-v1-3-2286eaf85fff@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/6/24 00:18, Luca Weiss wrote:
>  From what I can tell, the camera buttons are not part of Z2 Tablet
> hardware even though other devices based on 'shinano' do have them.
> 
> Fixes: ab80661883de ("ARM: dts: qcom: msm8974: Add Sony Xperia Z2 Tablet")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

https://3dmodels.org/360-view/?id=82800

Doesn't look like!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

