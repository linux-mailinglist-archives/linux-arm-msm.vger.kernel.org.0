Return-Path: <linux-arm-msm+bounces-22298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1681903B33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 13:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EF4728900D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 11:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C782817C20C;
	Tue, 11 Jun 2024 11:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xEug2285"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030E816F839
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 11:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106866; cv=none; b=ObrDcoJA/arDaY/ILgqqek9/5H1oqcSPmmmUi2TuUSgjVybkvDKriwbVgPSJLd1nPwTNIj2GfVOid8S2Dq8Dmov8cuumFHv9USLresI1qGXrUhVcc4TrnRfcXCLigj7rKj6vmT19yKjC0pwrxGMU5m6H2hsKXDLwDEeZkxugQ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106866; c=relaxed/simple;
	bh=TPskSCV1ByN6PwkEkrDCakDuKheDqbde4+cyZylMKeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F/qE0o5DWmX1YwOxz5O7ANE3n+OwjS+VtufnbXivyEgyJP1/qR1hP8nyVF0XOp/K9Sg5VrYg29PCBOlG3NMAGoVRFTbHsj9nU5XW6jbTtumBQ+XppIa/yrUxEt9ngWaEX51uUq6NwkvKYwhQWxD3qKsTIvaDoIFPirzE194yyT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xEug2285; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6f09b457fdso266705266b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 04:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718106862; x=1718711662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EUpzl6wit0+FDgfySZXvlg7FvtOLZgcqhU3pCudAFIc=;
        b=xEug2285HymjnQsfp7xJ7L8rTWI7csVRr1/GI5GmL/+LojWsIWqEB/+sEO3+aBzwJG
         ZEg18GhOgI0vswfzKOH5xpXLlGrq6uORv8l+GVpB6EVYDzFmFrAUvieqj4p1/9+npyD4
         qapxsbI9HwyjWjZsEP16jiPGfIhYHwSkAYl8qbevo9JPKkb8f0ArpxrM1ACsx/DGHdzY
         G1fAZGVCBS66zW2iyV7m06JMKDEyiUT9A/czfUzNkYMBhRSADotNIiYJzsv4/AOnIXDM
         IxKGk3l59DZzniy/NSJv+SJZNIfWmA5xm2F1tpdqnGePM1vPE+sAn7BlqrJ2332+jZF+
         +ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718106862; x=1718711662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EUpzl6wit0+FDgfySZXvlg7FvtOLZgcqhU3pCudAFIc=;
        b=bZYdlQfEM/86hTBCWTM66mkOX4XHuTIi/YGhFRE2O5TdNL93AggLNBuvvLVDUSCy11
         cTE8VgqBSjFF2YPwePvVDTvV/lVerKrwRh03Kb0rfKvXI0ccAMtgjAsYvVwEO/Ea5bqw
         aCXPaNVtzGHfxTEj+0LztH6rlXTCz+0o+v5IURQHYtdcYKM4GbazQXUaSKifJUpEcMVE
         hgXoDAQVZLXs0nV1ayiv/gf+kqgFxti98OmmM9a+8bAduRXOM6kvi46fm5BSSZCCMkh+
         2cafH3pYTBX9MUoSumax9Y5TeiW+BTYsFnsR9Q2E/sn2Z1pUXWJWjRASZlxI9iada1ZU
         xOhw==
X-Forwarded-Encrypted: i=1; AJvYcCXdBhEzVUKNR9bbz9Jp40jUi4JPUfUp3d4PMQOVg4w/HO476atow6gc8dDUyC7DIF2f5aPRlA7Q0D8kEIUutbZtONAopMCzrD4ME55WEA==
X-Gm-Message-State: AOJu0Yx05wxkKNyL9bI4zlQ1ppVOVk3CZrysbUG/IMDIiqtlFhcZWnTf
	MvKQn37emr9qMP2pRnlGLTm742sKrSM+XJCr7a8sZXK8EEJBpOxxNhakX9clG2w5AhsDt/UqeDL
	Xgjk=
X-Google-Smtp-Source: AGHT+IH5LvLNYVJ1vtJY2LPpr/3oSUYfVlUUAbWo90Ke7DbNTiGbM8niRjZiJ5XYcOsq9yELzeB5nQ==
X-Received: by 2002:a17:906:579a:b0:a6f:16c7:9130 with SMTP id a640c23a62f3a-a6f16c79640mr368006266b.28.1718106862182;
        Tue, 11 Jun 2024 04:54:22 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f2706d8ebsm180513766b.114.2024.06.11.04.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 04:54:21 -0700 (PDT)
Message-ID: <9518804b-a231-40db-82ae-5f8a44edf88f@linaro.org>
Date: Tue, 11 Jun 2024 12:54:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add missing fixes to FastRPC driver
To: Ekansh Gupta <quic_ekangupt@quicinc.com>, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for Patches,

Please send the patches in correct order, fixes will follow enhancements.



--srini

On 11/06/2024 11:34, Ekansh Gupta wrote:
> This patch series adds the listed bug fixes that have been missing
> in upstream fastRPC driver.
> - Fix DSP capabilities request.
> - Fix issues in audio daemon attach operation.
> - Restrict untrusted app to attach to privilegeded PD.
> 
> Changes in v2:
> - Added separate patch to add newlines in dev_err.
> - Added a bug fix in fastrpc capability function.
> - Added a new patch to save and restore interrupted context.
> - Fixed config dependency for PDR support.
> 
> Changes in v3:
> - Dropped interrupted context patch.
> - Splitted few of the bug fix patches.
> - Added Fixes tag wherever applicable.
> - Updated proper commit message for few of the patches.
> 
> Changes in v4:
> - Dropped untrusted process and system unsigned PD patches.
> - Updated proper commit message for few of the patches.
> - Splitted patches in more meaningful way.
> - Added helped functions for fastrpc_req_mmap.
> 
> Changes in v5:
> - Dropped PDR patch. It will be shared in a separate patch series.
> - Dropped fastrpc_req_mmap and remote_heap specific changes from this
>    series. These patches will be shared separately as a new patch series.
> - Changed patch series subject as this series is no longer carrying any
>    new feature changes.
> 
> Ekansh Gupta (7):
>    misc: fastrpc: Add missing dev_err newlines
>    misc: fastrpc: Fix DSP capabilities request
>    misc: fastrpc: Copy the complete capability structure to user
>    misc: fastrpc: Avoid updating PD type for capability request
>    misc: fastrpc: Fix memory leak in audio daemon attach operation
>    misc: fastrpc: Fix ownership reassignment of remote heap
>    misc: fastrpc: Restrict untrusted app to attach to privileged PD
> 
>   drivers/misc/fastrpc.c      | 51 +++++++++++++++++++++++++++----------
>   include/uapi/misc/fastrpc.h |  3 +++
>   2 files changed, 40 insertions(+), 14 deletions(-)
> 

