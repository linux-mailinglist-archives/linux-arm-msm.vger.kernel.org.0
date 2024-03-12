Return-Path: <linux-arm-msm+bounces-13882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E1A878BD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 01:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E8DC1C21137
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 00:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E38A6FB9;
	Tue, 12 Mar 2024 00:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q2uEYH5k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C262D5CB5
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 00:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710202519; cv=none; b=M3+wiu1RifCBOQMvsta3TkeWXzFXPmDYhzXV0wnpIsXBe7YL2W8uhOzuoQATqj94hWy6PxhT47HdNvwhEk9TRDFeBniBOOZHjf8fGE1hbG5ViJeJwKVDsthWICes8TMDYyvqPiFRoIqgN/RJGJ3oi2WKY+uQC0AZ+yb0Pa+vAhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710202519; c=relaxed/simple;
	bh=rITI8OESR753/vefQ3L3VFR8tWQjBHYPqjT7mS4NSjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIzqqSamsaNbrX3ruH6EVS1rMGf0UODZXxubodthRcsfpFzxkNYWYQ9/P+RsiOKMS0liGFhlQRShKolsxirDseIYVMz3OzUxS2ZAlSlnafkJ+maKqkT6r2JPpIBtYE/z2u0NjXFm1WqsVbrFT+Ocxbsh6a6h1xw5N2ImrcYZlGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q2uEYH5k; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-513a6416058so2308337e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 17:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710202516; x=1710807316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Qkp8yJOuOQf9llDA8dXhEpB/c4pbLigp+bR+rYBnmE=;
        b=q2uEYH5kE+xxF+eFoeiobBa7CWEtD57BSnYDvdKlsAivDV2uKbNiYybYmCN8ui0G1x
         0TJ3KfC6r+bk7MDutGtyVwMFPHMMvwrrak+n7yga0tHEaFUAR98hpnm64W8bAZDL7CmJ
         /JOghlnzWhZw8E+oHnya9FfLaJP2V6jyWueNMgrLhSISDjDfpqySeg4zNX+MV8njWueb
         /IRqhMyVmmLKHrXDWaVMEjXT2VraGSOkdbKxmbMLFFjQLY8YrK6yfptwW9ZpEckjwlPY
         5LD849BDHBj8VsJhMLUmNcRkDMwJDDf8JwUOgNcS/bfmsAXjONI1/0U4mMBuOsaHSt8X
         2QDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710202516; x=1710807316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Qkp8yJOuOQf9llDA8dXhEpB/c4pbLigp+bR+rYBnmE=;
        b=YDzrEuxkHM9l3dgBcFTOkuRg9GLuEqNAPS7vmp1c5Sk5s48SRjejaHgmQcqGr/+lts
         XKVXaDvUxxjfDO+T+HEbt1yKgDXPIj576KzWsiST9k9kycZO2fGT1y2gL3bPkBcZ4Cda
         D4jTI1ZIENK4sj4P8zPCfAEDbMqsOPIb7rYemSr/O8juavVtie+E1c3HJVQq+i0bRDly
         SlxKQ5TGWE6HIZay3+pf3D1xfOOAUZmibDSosvBVrj4i3+NfKE7wpWPGqsRhKSXjRG6W
         UJuZ9K5sqDYhKpKhFKmp2piZ1OsZFuBHvW56oXxmDRIFkmVa0Miz9n7/+OKWlZYrzPbn
         an2g==
X-Forwarded-Encrypted: i=1; AJvYcCXIRm2ZtpRpemPaT/9ifzACnILtuBuAYJ/W8qtNg1l8FKLetQgvOVN4PsKWpvU8EJe/fZvXN5z8PwD7iWN3ts6fsKSr2SRSIWVbXO2SLg==
X-Gm-Message-State: AOJu0YxmYDFCFUdhJ4AIKiuztx+9dRqEf+iFoencVJW9kdY0O4/sCCTN
	WzT+oDLCzN9k/Y+dilexli7Rh9Uek7x7nS9BCK2P0iWwWjsUhn848sb1gMoQnTY=
X-Google-Smtp-Source: AGHT+IEomKQ5UiV5kQrHnD4DnrPNCZy0DNRdIj4/L9aS6kAWvKFL4YQPwyqHTl77dD2YfiSgXyy0jA==
X-Received: by 2002:a05:6512:3456:b0:512:da79:91a with SMTP id j22-20020a056512345600b00512da79091amr4367597lfr.46.1710202515734;
        Mon, 11 Mar 2024 17:15:15 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t22-20020a195f16000000b00513a7962930sm807970lfb.89.2024.03.11.17.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 17:15:15 -0700 (PDT)
Message-ID: <6efba698-b9b7-41bf-84e3-849da99db45f@linaro.org>
Date: Tue, 12 Mar 2024 01:15:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] slimbus: qcom-ngd-ctrl: Reduce auto suspend delay
Content-Language: en-US
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
 quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com
References: <20240308124129.7833-1-quic_vdadhani@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240308124129.7833-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/8/24 13:41, Viken Dadhaniya wrote:
> Currently we have auto suspend delay of 1s which is
> very high and it takes long time to driver for runtime
> suspend after use case is done.
> 
> Hence to optimize runtime PM ops, reduce auto suspend
> delay to 100ms.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

