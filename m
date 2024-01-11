Return-Path: <linux-arm-msm+bounces-7030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3418C82AF38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 14:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8B21B22A3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 13:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8035C171BB;
	Thu, 11 Jan 2024 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EPVJ0A7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02011641F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50e7b51b0ceso4978599e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 05:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704978586; x=1705583386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GIyM+BfF8xHU1FJh7yiMO3wXsBj/wGchq1QVXNUljFQ=;
        b=EPVJ0A7LGPcDFhQGMTJglXWiBNp4wRXODg1DirjSr/49BxHvG4cPdt1K3COc/zbtB9
         5kv3nujKWbKKkT+OZ+3CRlJa9wKQa4Pwzyer0OcjpW2Ph9S9FjfA4qsJa8+oJ+kmPtn6
         Q8aiKvXVcfCYnJyOQT8aGrDOZda+xrJWIpSgIEF4NOdd6HUP7/hDp4YO9ACp+OxcP3YQ
         H+iBG2C0301BkgPhIorqXGBNNPgiBtf64c8y6jAL3LAcWFvfYL42Eb6qdHi0+N/OVF2e
         mNx3bBhuxplppGigYDdF5wpHKeX/dNj8QErHA5Kmyugcmhnr9NwG4UWITR7ZH0jY3JiF
         CAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704978586; x=1705583386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIyM+BfF8xHU1FJh7yiMO3wXsBj/wGchq1QVXNUljFQ=;
        b=Lo1EPBErrld3R0X+rJBQxER1vVP/o1WR2oG25Yb5HZj9H9SwqyELdSX9QVlyN2iVo4
         5p3uWj2ugyuajkAZLGMAdPt2rkyXPBN+98mvIFEdGBeUnqJl1+ndqTFWye3JqdLLawMt
         vb6iGf6woUkxtih7GbZtMKU7/77tcTtJAo8RGMbf+KjcH5MV+wJZQ0EVZ8XPeYZpTWkE
         VA7cYlJy//KGwqboAhsvCeNbvyWx4B+vMvqWJ4PhrV+uKoxNNtA6QSGQ76Cp9nXXZiG+
         pD3H1/wMjU2SCWMPVMlNgaz/tVtF1lEzaUB7HvRa/XLua/UJh5XJS6BST4exKkGC028X
         sf/w==
X-Gm-Message-State: AOJu0Yw0OUSz9pVKgkRMwDixBiMSGLs2MCWnLsNivGbzErC3COn7QSqm
	8jBpH/klbBxJxZlqZfBJX3CPvtsRNGkwiA==
X-Google-Smtp-Source: AGHT+IEH+zCu6/eCGw2g1ugvsVdgpbvtUNxZtoYrQWiVE9lA5FZfjE7IPJTegTu5eRr1pbpEYqX3qw==
X-Received: by 2002:a05:6512:23a8:b0:50e:e1a5:2368 with SMTP id c40-20020a05651223a800b0050ee1a52368mr436773lfv.1.1704978585701;
        Thu, 11 Jan 2024 05:09:45 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z22-20020a2e3516000000b002ccc0c55163sm137597ljz.73.2024.01.11.05.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 05:09:45 -0800 (PST)
Message-ID: <046a7bd3-3791-499d-a604-ef408d3d8aa2@linaro.org>
Date: Thu, 11 Jan 2024 14:09:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qrb2210-rb1: disable cluster power
 domains
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240111-qrb2210-rb1-no-cluster-idle-v1-1-cec14ec15b02@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240111-qrb2210-rb1-no-cluster-idle-v1-1-cec14ec15b02@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/11/24 03:01, Dmitry Baryshkov wrote:
> If cluster domain idle state is enabled on the RB1, the board becomes
> significantly less responsive. Under certain circumstances (if some of
> the devices are disabled in kernel config) the board can even lock up.

I got that $sometime ago, but can't repro now.. which devices being
disabled would cause the hang?

Konrad

