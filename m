Return-Path: <linux-arm-msm+bounces-22627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5669079E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 780E41C22D97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F9E14A0B5;
	Thu, 13 Jun 2024 17:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Db3RscMi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B23112CD8F
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718299847; cv=none; b=jt700TNQuTCt7zoXwv/XsWkkdQDgsdfK6X2blry4q/rcofQUUtdEEje6Ls+r3NXTpSgrtkPo/WR0QLvj+mAVWIESCy/50y5YBin2Y3VSPT0eXxoRFnAaBl4rE//aLffzkIApBYYWp/qa+mKk5OpC20ObEwbPfQEcOs4P+ZnxxOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718299847; c=relaxed/simple;
	bh=KA1OkzV8OrlSYImubg3Y+NVBWVWANZieJIPAFPiHSPk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Zdp2IoBT8GhRZpt7stAHVvetpOi9EiOAgu5rq1nQq95l1V/XmCiUBA4XzGqDaoBgfmYtHXMuf0b666u6CJf5UQaAJyvMStRF1TMJf4eKqMkT2kn+kCF3PFF33dB34HJwZR7EBj3vuf+4HRwxSadDTl9PfWzeDPOS25v8m8pOMDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Db3RscMi; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52c7fbad011so1635994e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718299842; x=1718904642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lx2U7WRpl1o/bC54tR4hlb4jrNUDdZHaNHC2EmxCiNA=;
        b=Db3RscMi92a40gwiIV1kMCYvUdat+0TmhlW5SwgvBPQALg0aMYSXiOFG9kede9plre
         6lPPz0Uog3L2oddgiD4exxogqUVaAKnI1p3vD5agnjPtSuaWIK2S3Hko1HoNWKtmkA8/
         +I79roj5lYTLMOe3OvoWrhDoAsvfTfz8bgatZ2rZbe6R81mgtQuyUo0FUwu4vc0vOF2N
         vskPukZnesNO/uzhcT3KycwfnzunzKqmk0rx/YF1wsnonj0CPbjFrgqyZjxftnINgZq7
         1MCW+Vy087gxU4dPuZe6IEgndomHqF6IOENYuxTc/kjLrT5Q3UWqqB26smE4kLeuFy3d
         /49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718299842; x=1718904642;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lx2U7WRpl1o/bC54tR4hlb4jrNUDdZHaNHC2EmxCiNA=;
        b=BRC5fGQ2HAjn+OTrtF8GPWvMvf18IxSwXfWfyq2XJ6ta3SwQG+Q8aQDenyXZModHz3
         SUGHAdG41pPGBKKbkqSp7Jd+C3dqvXk1wQt2rHoCCR95+Y1wEHHY18ethaNALu/GjkRK
         GoDaPg3cE8EFXKoQTkH/SR7n7jsOItFmS5T5hFXrwrycnekXiQoD3qjt+XWponwN+Tt8
         quMOle2ln+HV3RCNG2yKkpRPH45EJGgLZ72vlJWAsdYDFDCM9mE2GJqalYS68AJPy9xe
         mlAAEv2WI59JRKqB/6K9Kos0j6mYE70lWbPPWEWpVp7gABirXFlQkiSwivB5s9vuk3QK
         t4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUkqW/P9Gu4z5xK/mI1r9onIlnCo3YbY2E4P5jSBwFGXXnS43QIa2iW20s023gGd5QyZWjE8KtNNMkUizO4020MsUNbfdzmPYbIMCjE+A==
X-Gm-Message-State: AOJu0YwQyM/yKvtjm03sjVL1B97/I7Q6hIkDSYDU+1Q5UHPVxDThkW36
	C8uPyx9E6XWNaJXVZX1TVJP+7xwVPtCZZ2R+5XmRrq992Zha7ed/uJGRGNDzUPA=
X-Google-Smtp-Source: AGHT+IEYkUhvdDsXs+neXBkAAyGN4++uIdP1bW2w5p/v22k5zRDrl8RS0GoNX6pUWit7HXbbwfVaRQ==
X-Received: by 2002:a2e:9b53:0:b0:2eb:e365:f191 with SMTP id 38308e7fff4ca-2ec0e5c6bbamr3103781fa.15.1718299842492;
        Thu, 13 Jun 2024 10:30:42 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76? ([2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c8b0b3sm3275101fa.122.2024.06.13.10.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 10:30:41 -0700 (PDT)
Message-ID: <9e61aa30-de71-4201-a406-62fb8fc833a4@linaro.org>
Date: Thu, 13 Jun 2024 19:30:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Fix refcount imbalance seen during
 bwmon_remove
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, thara.gopinath@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, abel.vesa@linaro.org
References: <20240613164506.982068-1-quic_sibis@quicinc.com>
 <75d675f6-d827-4b8d-8c88-29ac5785e5c2@linaro.org>
Content-Language: en-US
In-Reply-To: <75d675f6-d827-4b8d-8c88-29ac5785e5c2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/13/24 19:29, Konrad Dybcio wrote:
> 
> 
> On 6/13/24 18:45, Sibi Sankar wrote:
>> The following warning is seen during bwmon_remove due to refcount
>> imbalance, fix this by releasing the OPPs after use.
>>
>> Logs:
>> WARNING: at drivers/opp/core.c:1640 _opp_table_kref_release+0x150/0x158
>> Hardware name: Qualcomm Technologies, Inc. X1E80100 CRD (DT)
>> ...
>> Call trace:
>> _opp_table_kref_release+0x150/0x158
>> dev_pm_opp_remove_table+0x100/0x1b4
>> devm_pm_opp_of_table_release+0x10/0x1c
>> devm_action_release+0x14/0x20
>> devres_release_all+0xa4/0x104
>> device_unbind_cleanup+0x18/0x60
>> device_release_driver_internal+0x1ec/0x228
>> driver_detach+0x50/0x98
>> bus_remove_driver+0x6c/0xbc
>> driver_unregister+0x30/0x60
>> platform_driver_unregister+0x14/0x20
>> bwmon_driver_exit+0x18/0x524 [icc_bwmon]
>> __arm64_sys_delete_module+0x184/0x264
>> invoke_syscall+0x48/0x118
>> el0_svc_common.constprop.0+0xc8/0xe8
>> do_el0_svc+0x20/0x2c
>> el0_svc+0x34/0xdc
>> el0t_64_sync_handler+0x13c/0x158
>> el0t_64_sync+0x190/0x194
>> --[ end trace 0000000000000000 ]---
>>
>> Fixes: 0276f69f13e2 ("soc: qcom: icc-bwmon: Set default thresholds dynamically")
>> Fixes: b9c2ae6cac40 ("soc: qcom: icc-bwmon: Add bandwidth monitoring driver")
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Cc: stable@vger.kernel.org

Konrad

