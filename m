Return-Path: <linux-arm-msm+bounces-22626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A68519079DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55D9C285910
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259EB149C4E;
	Thu, 13 Jun 2024 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X7J/3Kki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EBE1474AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 17:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718299804; cv=none; b=WsRGHgPbMOm0OgB+ANbIDduK+L6ltCCKduzFpqsNVWIxxH9TrymiR5+eVhJ5SwpCfLF2QfOMjlrBWp4YwMmkUTwIf/9nd54COT2EnKOZF+rCwSNlpQ8dQ8XAc4BXmaDDZCLZTsuYbM5K41npv5exmhYMFhI1V6MHUJKQ29wzPqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718299804; c=relaxed/simple;
	bh=nQiDweVW/klqoccVHaFCqThejMLRDTDiNKGZP8SERFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hgabb9VWYPZxWucNoi4BAGBJjNwF7lAj3lcjq83vlSSYP4Qz/cn1hGZHsTSdUpGWp8D+Y+ARtCfmG3Uib8p+OHyBWzlBbDIKEaASB0ZAj8tHmYmgP68c2zXWXplzYs9ROBmLE+tmMrgWdhn3wTUKB3WPBRIhU/DBzClma5Jeynk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X7J/3Kki; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52b78ef397bso2211538e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718299800; x=1718904600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sWKAFEWXLrDJc52wb2CYS7tZPMyOOyhZnNSlFzB+HrM=;
        b=X7J/3Kkihoj2iI84ibKwbukASjpmL35Y+rqH/K5n6lkuuE5P5+e2RtbJAbAiBqdnCl
         e8K4Juh2GhPHzSqzU247V8hta/S5ihNYjQRQv14NDLjRDdKQUMzGnsjDSG885qhtXncI
         TCsxgj9ewTWN2rRgx1wrwABH8v4zB2OdqeF72oGhMGJ5gy1z4R1gt84bft/DFtBTz/GW
         oEo0L1iLNPzH0nteRHZk7xcr92zSNJhypresnj1bjSsgxup2De8nIPGKO7bURUiKREs+
         AAcWOtnQmsc4s9kGLQ/dI0xzQCYepHbqTJZkDrViPhu/IYsS4nzRqfWpEMOUMjGkEbrm
         w5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718299800; x=1718904600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWKAFEWXLrDJc52wb2CYS7tZPMyOOyhZnNSlFzB+HrM=;
        b=qKuIgdK7KG2ah5ClYYl/mJdP7Q+I6KKJluqzAmTTPCh6Wjt/820BoZ1H3E0jz07Cc2
         /1dcb60NB/DZb5zULKaiIN7Bdc2slq2L3ZV0ciXsKZHmUmp/mg9ahrCWhXKjTHP7e/Rf
         Y3kuscKulsxgoHhe5vzKFDP1Pv+p4tX5PkTzDK9/9xHvw/3fzguRJQB3jyKXUJc3wIsA
         0+auqS0UO6QGzmS32wu5jsrRyitEuEt4VVhpfxV2WEQ9jtggkKEa1mArfBfFQaWcOpy+
         S1iyNJH9PMs7IEoF6BLvQ09G2GY2NohFULh7Cz4IaHVUF1OiswNSHNSSk9rG8eLLjftM
         9H3w==
X-Forwarded-Encrypted: i=1; AJvYcCV6kMEg0mpEQH/Je8W/S755WrBvboKR2bWUsks5SHu22nhuXt1YsAMNRZ/BSm5uDPEmqnkXzX+D4XI+3fNG5dj3+JzNYe6niTBgO6oNmQ==
X-Gm-Message-State: AOJu0YwB1ufDWhBi//Cgku6D2ltxlS5Zbq+39ia8Be4hqisg1tHylRza
	sfmzIdzJk03yKviPH5oMM9AvRM57JON2XTfUnl89+6btPioHBEtETeHDB2ZOqoU=
X-Google-Smtp-Source: AGHT+IGt6b57iPGgKOMlgH4lEbT/mnoJM6KeEbuePOr4Y0cQ9OdVWNFNg4ifNbIJ64ZbC30ao5/7/Q==
X-Received: by 2002:a19:e04a:0:b0:52c:6464:a7b1 with SMTP id 2adb3069b0e04-52ca046458dmr845484e87.28.1718299800458;
        Thu, 13 Jun 2024 10:30:00 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76? ([2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca287aaccsm295981e87.223.2024.06.13.10.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 10:30:00 -0700 (PDT)
Message-ID: <75d675f6-d827-4b8d-8c88-29ac5785e5c2@linaro.org>
Date: Thu, 13 Jun 2024 19:29:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Fix refcount imbalance seen during
 bwmon_remove
To: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, thara.gopinath@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, abel.vesa@linaro.org
References: <20240613164506.982068-1-quic_sibis@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240613164506.982068-1-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/13/24 18:45, Sibi Sankar wrote:
> The following warning is seen during bwmon_remove due to refcount
> imbalance, fix this by releasing the OPPs after use.
> 
> Logs:
> WARNING: at drivers/opp/core.c:1640 _opp_table_kref_release+0x150/0x158
> Hardware name: Qualcomm Technologies, Inc. X1E80100 CRD (DT)
> ...
> Call trace:
> _opp_table_kref_release+0x150/0x158
> dev_pm_opp_remove_table+0x100/0x1b4
> devm_pm_opp_of_table_release+0x10/0x1c
> devm_action_release+0x14/0x20
> devres_release_all+0xa4/0x104
> device_unbind_cleanup+0x18/0x60
> device_release_driver_internal+0x1ec/0x228
> driver_detach+0x50/0x98
> bus_remove_driver+0x6c/0xbc
> driver_unregister+0x30/0x60
> platform_driver_unregister+0x14/0x20
> bwmon_driver_exit+0x18/0x524 [icc_bwmon]
> __arm64_sys_delete_module+0x184/0x264
> invoke_syscall+0x48/0x118
> el0_svc_common.constprop.0+0xc8/0xe8
> do_el0_svc+0x20/0x2c
> el0_svc+0x34/0xdc
> el0t_64_sync_handler+0x13c/0x158
> el0t_64_sync+0x190/0x194
> --[ end trace 0000000000000000 ]---
> 
> Fixes: 0276f69f13e2 ("soc: qcom: icc-bwmon: Set default thresholds dynamically")
> Fixes: b9c2ae6cac40 ("soc: qcom: icc-bwmon: Add bandwidth monitoring driver")
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

