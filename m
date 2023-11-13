Return-Path: <linux-arm-msm+bounces-560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 875D87E9BC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 13:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 416AE280A61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 12:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC681CA90;
	Mon, 13 Nov 2023 12:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDX1yNZi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2F11CA8C
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 12:03:11 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63822D70
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 04:03:10 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50949b7d7ffso6372186e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 04:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699876988; x=1700481788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9dtMC1kY2J9KsRELK2Rm5xgzngoz9ZGk6SxL2fxFBaM=;
        b=vDX1yNZi3tfnE8F7dY09JVBaP5sBNoLFEcrIJqtlVm4Ihmy2O3uEr7E4k8cdZuTYyq
         8EU9e1JhJUrCqBSO51859lTju/BRD/9LvgQ3vMFTacIp0oDk4r0H89PO2pX4nutwue2B
         Zh0f3s1EcPTfPnGCSRcABOk0BFKs5sgS6aSyQHOSBjcjr8ea6n9JzujSUdjXo/SYRt2r
         IwpMc/Tx79Q4VN3daB73E5X0aVYQCaTg1QA+rZ+cHY5mO3RUa/zhWKNK8gwyapJa9mSp
         V7haGLt3qe4vvn4vu+zjHG/g9ZwX8wZgm5S73u+51l6UEKXYohMiPeoC0Zf2i8dsTboD
         IqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699876988; x=1700481788;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9dtMC1kY2J9KsRELK2Rm5xgzngoz9ZGk6SxL2fxFBaM=;
        b=vnUPyHRwF0BrwGtXx4WdapdKTTK5XrjGcG6/3SbXD3so5nzbM4/r7LDq0wYk5afFw0
         pRcwTE3nXocxOW5zqQfLsWKUAGnP2zAoUq97ct6t5KSNYhY5nErDP95J/wCuosib+MaY
         eGUOCX+6lk6aVVg/WQA7dCIUd81R0c8w3mbX8jsDcm5Vb2J+povJp4HSwPWxyDkTpa3c
         bWXuERr9bKpQuvNoMVDKSXrtvKFA6d0HUiRelh//AG90uBRJTdhjMWIVIA3/y7FMl5Qm
         uFkk51vLAdH2sUHt+mugsY5OBIBXCKLoF66a/5koRZZkhyYOgMzPLE/YVneQj+8sEzFR
         ajHw==
X-Gm-Message-State: AOJu0YwWlNVqUlM+OWkT9pFcctaTe07CcvbGFVZWkq9Ax2Emo2OQePK/
	S0oiOLZVO+cLot6vky5mKR9f+2eVe4zHdGYIWNY=
X-Google-Smtp-Source: AGHT+IHYvhsazOb7ua3c5YpJCZ/gCrc2shFaqHQ2g5OW+WZ0/FTegW/L6WIUZPF4bwAUMOTSijEU+g==
X-Received: by 2002:a05:6512:230a:b0:509:4b59:d40e with SMTP id o10-20020a056512230a00b005094b59d40emr5214561lfu.49.1699876988550;
        Mon, 13 Nov 2023 04:03:08 -0800 (PST)
Received: from [192.168.201.100] (178235177064.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.64])
        by smtp.gmail.com with ESMTPSA id gx24-20020a170906f1d800b009c503bf61c9sm3868184ejb.165.2023.11.13.04.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 04:03:08 -0800 (PST)
Message-ID: <8b683f78-c034-4b6e-91f2-8ceab62f4ab0@linaro.org>
Date: Mon, 13 Nov 2023 13:03:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: defconfig: Enable SDM660 Clock Controllers
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>, linux-arm-msm@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
References: <20231112235124.1671468-1-pvorel@suse.cz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231112235124.1671468-1-pvorel@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2023 00:51, Petr Vorel wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
Please provide a commit message.

Konrad

