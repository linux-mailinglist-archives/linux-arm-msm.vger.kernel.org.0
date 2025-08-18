Return-Path: <linux-arm-msm+bounces-69527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B475DB29FF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 13:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FAEA1964C9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4E330FF2C;
	Mon, 18 Aug 2025 11:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gKi7dEQj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5342F1FD7
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755515013; cv=none; b=gRv0Icf4xcb46hUG5DoMPJJ5lfENyRZmpXDJ+XL9jcWTlwloOHzWlY4Dwo9f19qryuECK5uQMPWGOjyjFFUW3OtjLY2aKOhrKZafEbhYWnHioOaJa9GUA3rHmQQ8DkiKaCq0EgwaK3ZU4c/t1uscAvtsNNyrpnn5E8xEl4pdFuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755515013; c=relaxed/simple;
	bh=4Vrnl54e8ENja3qpeQbW9kYQAacjBD4IHfjVX06fN1g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jDVB/SCdJTeu8OgMaxfkan4gJBY9DNuOxrvsfU2Cb36BRvDntMVFM0/YPR7sSq8Sb4BnfgoQhdEZL89Qgu88zPR1313Kdk5yqc9p+7H0Ju5mWyaLZDm/O2I+Tk9KIYCGKBDmHNRr5exT/XJclIgCkHcvxoyWD9uy0EN+J7GQJBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gKi7dEQj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1ac7c066so22056085e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755515010; x=1756119810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Ua8O/1O5+5nB5qEW6QCnDHLWUhwcA6cIXBt4qTLsb0=;
        b=gKi7dEQjpn1YlC8zkQsd25Nx026YFeWVE/vuDPLB7uE47HAMF6RQYL0ieBFVB/Xsah
         dbnnJNH+JYTqvM0kZq8THRMmYBOFZilJ68/t4cde/vE6bzwupVMm8H6iZGJ6oIsa4fyk
         igMyb40lW2OFw+iaqxOgf4pba3asuC1JCfO6Aoy1hPDm70konwWs0le7HiLEDirrzuIs
         Cl5QdHLKM7Oj76Lko1Sov4u2Q4Ur5zdhMm/sMnjE4HYoUaEvpj8FTj+0Sk09x/8G4OXv
         ug6ksrYMFYZykmbeimDwKnPYg/pT/cgFJymQcL3mtw/MDywFC+sRc9kOmjZsbnRK+6Nu
         NuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755515010; x=1756119810;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ua8O/1O5+5nB5qEW6QCnDHLWUhwcA6cIXBt4qTLsb0=;
        b=j/KX67l1Y9XqcjZZIbFOTproRC2dFYC1Gvnrz2sCe5zKwLr4QC6+aC+Idnvia4sXJe
         jlgNQkt0jQB2xo7macfLD3d8I6uFoaiFMQg4+Erj4XUh1VJZ5SVko2P5mFIgJR9Pq19r
         8Q+1aulqRi7KJGzjcUCKtFXiKg95V3L84fql8dexzGKFu1BwbaZCtl+WCWmoxYd5wZER
         wXePvHTk5/0kvtsIdb5l+AtS58myMtKrMpNvJpBLhohn4SD5D1E7y4+ogM7zpukVFEEZ
         xvEPENj35uo11s1u+XqPUM4s9u0l2vT/rc/b5vJoHFhPssAuUibyJ9ejVSLqxQy7Y6Jn
         oYNw==
X-Forwarded-Encrypted: i=1; AJvYcCWp4L2We1lVvPaTPAetbDabFrrD/HymbKdLiSHA/9j28QExvfbh3xwwEd1Rwo+n5L8EqqQVW8UJiIOzIjVM@vger.kernel.org
X-Gm-Message-State: AOJu0YweDw/aJWwYq9phtS+jRj6p8aMWWBM6AYH5ekWD/Qh0jgrBdzL+
	yL1xChpyyouVeQZMPvv7JTXwVzojemZc8eZ9W1PV8etmraYV49zCi0nsnUzrndQcSUc=
X-Gm-Gg: ASbGncvJwmMgp5+wn+7I5xjDkmzQ5XtYDAWY0a/1Tig31WKVG2+n4bIASIAdR61M4Gz
	HZCwmcW5KtzHLv/rteUhXwXWj+DqsUfmfO8fxIEvPPRWRABMRXCFb13gwwVPnyxl/AVabvAqYrR
	n2+Zq5TGHROI3uOst5ofcVAn3bPTd2TBQ3PDMALRJB0E5uZku+gOVAV6E1ZO531dVGPBQ94KpSW
	NBuzmnnUj+FIuaYsylDewraguC2TvKUlCIRtzrQhRBxe1iuQYfYawqeeLPIpEoD5OONOjKiUDay
	olEYgQll1oRrNl/a863QEhcGq5VmeTxOZ5j3sYmlITsmWLECwBrms25RfzY2HE+/CxfJQrGeXYx
	sEvQsCCnHVUbhF64FbUUbiBO8gP1397pyaLlj1iM2zcoVNU+H/E9kgzDCwp3VTmQ=
X-Google-Smtp-Source: AGHT+IHHmd37mBk/UuuFz6An0XBY9iz2o54JOg/oul5o+HNUvG1nx/R428eD2ETm/rl5tKc9uMFbhg==
X-Received: by 2002:a05:600c:444d:b0:459:e39e:e5a5 with SMTP id 5b1f17b1804b1-45a22345439mr84584705e9.5.1755515010400;
        Mon, 18 Aug 2025 04:03:30 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22210ab4sm129022355e9.3.2025.08.18.04.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 04:03:30 -0700 (PDT)
Message-ID: <8c2e9767-feef-4d1c-8100-d66eb1207016@linaro.org>
Date: Mon, 18 Aug 2025 12:03:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Fix firmware reference leak and unmap memory
 after load
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250818-iris-firmware-leak-v1-1-1e3f9b8d31ce@linaro.org>
 <61f9767f-ee4e-4f93-b84e-59ccd422c98f@linaro.org>
Content-Language: en-US
In-Reply-To: <61f9767f-ee4e-4f93-b84e-59ccd422c98f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/08/2025 12:01, Bryan O'Donoghue wrote:
> On 18/08/2025 10:50, Stephan Gerhold wrote:
>> +    ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> 
> You're not using the latched pas_id declared @ the top of this function.
> 
> With that fixed.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

No I'm wrong you've moved this to a separate function.

This patch is fine as-is.

---
bod

