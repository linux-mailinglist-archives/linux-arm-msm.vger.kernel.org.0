Return-Path: <linux-arm-msm+bounces-68373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D05B20BDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2714C3BEC84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFE724466E;
	Mon, 11 Aug 2025 14:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N2mCRE08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABD824397B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754922352; cv=none; b=EVQP9ceUkXVtM1TYry1Vs9tG62Hb3z6DtiAZDvVBNv23hQuwHp8h/mLuRGY+k+NDfDvr1af94wOR1Z70rE8jOy9C4VuZau8bSjwBiaQxWuS9GGtD3Hce3WtYMEjRiHBaNf6G9XXO7xVWmf0JLhgn1vJUo45rAUnM3c0dRgJffEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754922352; c=relaxed/simple;
	bh=fSVaQPYV/f9rdAFIm0V0BCUnesXpfEUJ0D/aw0lPFjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPRl8cF8Cr9+Y9Ln8AtXF4kaWjn9SShPJsMEeK7xRb6T1aC2gPdTrDV6BeFlm/0VdpjVtSy0Lqbziwr1N/KiQ0GE63FQqpRF6CRnlhw3AY2bNEdQcXYHKkg/hiDpO77XHWkpJ/2xvD9AzKEKXcZKN7Od5W6SWDZzZyX2P9eda4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N2mCRE08; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-af9176e6134so53524166b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754922349; x=1755527149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BY1U4AjxHwqb/bw3CF0m9XkuN9T6CopYOjAMzhAI8Pk=;
        b=N2mCRE08acnuz6OcFUTG54kEETYGKXY89/3ZYKh0e5E4lJBIOlCjTsnSosJSAiIKvP
         l1VCsxRg22CZibEgzTsXU7/Eg1cmJ9784t34wh/agdcRKlDrTHrHSG/bbscWnodqAefc
         oWgGx6WSny5Vk7HhD8dkBxin9whnQHOPxLaGKJEcmgzd9RUR7N0BOorocHHPJZptssgq
         PY1R1XkHMAWQdnaQnCq8XiewPBAwdWHRRJKVFtdLgyuWSydH/aNqt+7Vr/ravnJmhGke
         h9iprBkxUlk3nt67D1uViKWbX8qr+7zqacd/h3K0tlBXXLvJMHl1axAtfjFLenrcqZC6
         enkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754922349; x=1755527149;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BY1U4AjxHwqb/bw3CF0m9XkuN9T6CopYOjAMzhAI8Pk=;
        b=Cq4Ot/W314IViYUb+YoMuCDG4l8LZkaLfHrFGCf5nWMb7Ss+SEiCvSdAfKIjIRQW71
         W7Pilu8N6A1SDvRKkSVKfTZ1HGp0T/Gpdxp50Bq3k4tIkstLvRexjMqJi1GdCnOsFtwj
         nnAkXhltnZzUc7FrGBiALZgq0JnQpHL44iVUPCGcJUnyh1ewTXtKYNnokcMTy8aj0iwX
         GNQ3zu6G28TobXWoFr/eZxqtZA4sZRtT4iTBveKREOzYvO9Z2YigcoP7v7bER92oqBxg
         s8rGuffv6W+hdsJn89RmCmrsFzincj0h4XfiDXh2dvxmTRjnFUDXh0zucx1p0ijC60P3
         /zBA==
X-Forwarded-Encrypted: i=1; AJvYcCVaknmYJN7OEJ8eChoJJKN++tQHcdxytupEmtaLYPX3ZtKNVsE7ppoarQEYrSTQ0vIg0Iwq0GPqyKRhot7v@vger.kernel.org
X-Gm-Message-State: AOJu0YzaSQ6l7VDqtHOKcQAlFEUMgFMLaWiyCY+L5gHqgO6LLCFLLYDr
	N4cvzuBN1p1+Rxc1l6uUgP/+NCPekpbTNhb8xS961Y+nFoQTJjW/lSsXX67ddPcbAPk=
X-Gm-Gg: ASbGncsA9lBY1mrlhlyI48NsILWS0xKfQ2msXwP7oOkbut1Di5vxgWmZG8TyQgKHrnE
	x41dTZ/R+kNDKfnpPVDBYr7Eh+V/iFpbATNwtm57sROvLloyPtcsT+WDvuIra6iaN851bU3i6/7
	afKdaE1AowD+3JkdliQC1i16EyZqSfE6qAjmXmUu/9Pzt4oKN2LrUmEmqxnFt7Uq0vtaFBdvJMe
	pGqQ8/LVvDQisum9eERnI/p0WnYT9ApdG+mhMzKI1ZGUxvn/Fj9M7dyssyPfazBKxqs++vALU5Q
	V5C4BFcWMQ8hUj07sB3ftEgd4lcFpUY7S3UFpg7QFykJhyCb8fkejRBfAWHXpfgvQlHDxq67QzL
	jfksUTxSlz4Y4/wxxg6mGCC7jpRUValLp6VnGHTHRxGc=
X-Google-Smtp-Source: AGHT+IF/BvJ49Wu4m6vJXko2Gs8AJMAgG4FWlbWkj918m8I5FUlxpNpy7puvJIQutl+vb3egmwZWZg==
X-Received: by 2002:a17:907:3da9:b0:ae3:cd73:efb9 with SMTP id a640c23a62f3a-af9dec80ca5mr367165466b.12.1754922349302;
        Mon, 11 Aug 2025 07:25:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e82bbsm2038628366b.81.2025.08.11.07.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 07:25:48 -0700 (PDT)
Message-ID: <481985cb-fa84-4b09-9b95-948ee70b557a@linaro.org>
Date: Mon, 11 Aug 2025 16:25:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] arm64: dts: qcom: sm8750-mtp: Add WiFi and
 Bluetooth
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250811131055.154233-2-krzysztof.kozlowski@linaro.org>
 <l6u4y3suv3dpylexbiiznhcuyanlc4ouizhzj2cchblaf6o4wg@fe4laxrioaj5>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <l6u4y3suv3dpylexbiiznhcuyanlc4ouizhzj2cchblaf6o4wg@fe4laxrioaj5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/08/2025 16:22, Dmitry Baryshkov wrote:
> On Mon, Aug 11, 2025 at 03:10:56PM +0200, Krzysztof Kozlowski wrote:
>> MTP8750 rev 2.0 (power grid v8) boards come as two different variants
>> with different WiFi chips: WCN7850 and WCN786x.  WCN7850 is already
>> supported by the kernel, but WCN786x is not.  Both of the board variants
>> are considered newest revisions and the difference is only in MCN
>> numbers and internal codenames.
> 
> Are they soldered on board, installed via add-on cards or installed via
> M.2 slot?

This is MTP, so same answer as other MTPs - these are replaceable parts,
just like you can replace display or modem.

> 
> Are they going to be somewhat compatible (e.g. on the BT side?)

No clue, you need to ask Qualcomm people - it's their hardware.

Best regards,
Krzysztof

