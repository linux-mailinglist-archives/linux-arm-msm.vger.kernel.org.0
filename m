Return-Path: <linux-arm-msm+bounces-57718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69398AB580A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 17:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 574B618882E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 15:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1851ACEC7;
	Tue, 13 May 2025 15:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hJiw6hPi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5191B4132
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148809; cv=none; b=NgJIe2ae2P2FeKVGEwoGd/wdUVDbjNVtdboG3/GtSQAzcFecxsVgwnwIgioZZfV9BWfR1zqAga5dGLmmGS075xCisndCmqh1L5kjDLaqKuKKVTwpdbiIyUpzsDDeYIq0xyDqc29MlB/C/dUxbsEh8gRK12qGfelPi2mk5TGhGdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148809; c=relaxed/simple;
	bh=QJKApr7XJNXpjR44GNJ3GfdVDAk49SmW3369Yfifhf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZKNOUBWAHEn4xaTGnX4oiWvurqdGJ3/Xskx2WCvV0MYtSFiQqkTOSlOioTMjNgQx2qnHaiVncLsgJKQEYNzI4Enhq+Tu2E2ylxs4daVaJ7bTiiGgjDYKR+ff9DBTRHZIN3l+zZpXwWnDfUbMCpUqVLOLfaZQ7zoRyHWHO4EdfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hJiw6hPi; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a20257c815so2866600f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 08:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747148805; x=1747753605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=erPCsUBPE+n+nRQoLBs46ePmP8dEM7YKPcXt3baYKPk=;
        b=hJiw6hPiysQT1E06Xp+MYAluWfwnL/zZU/hgxMRF4G6YUqBz2ZY3gMyNGJ5EItuTo3
         15Iv85o+HT5vVyLYiaNnfFQKaGaEUsqcFw0FcNiljcvhaYjExqTFiw9tChNOi+TSDxgj
         xuepXtl9F0mmM214dcmQDxJCYM3Wn1YZtGUe4S3dxYbkExbQL3qrM+KJWUZTHEYKOIGH
         FsC6morgwfFpCEmEL1TAIx58GEeCmoWAow3tQLNianem9J4H69KwRotwUYieN1yevLbr
         EfQpoZ1NvK6AGVXY4SqlIKfM/fiX+YGF8cWwGm7zIxqBTmh1blJll8ZHXsVt+nQDLSdh
         N2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148805; x=1747753605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=erPCsUBPE+n+nRQoLBs46ePmP8dEM7YKPcXt3baYKPk=;
        b=SO3QXVyDVFMlDXfnZ4Fcf6fxroYvEVLCCpZ7HsFqgI2Q7WqbYxLIEsMeHZ0OiDkY4P
         MEqSx1u776xQDwj0wUavHQuCHb5s8YVTa4XeRvuHhUXUidgIi/l0mSaKII91dBY2jU3F
         fVFhu4JLxkaOhPgTPauY1H/yeLgWctgOs1CMGrEEu4nl55ZYWVjA8RNiWKrnfG3pcJZS
         Llv8yb6/vSxS3Z8FYToSzjwrZa+BhbgYN+2/V0pcYYHggVGtSLjpgTalpPYGdUbtUt0a
         uyyu+Jb4jb1Tw748XL8HTobPUAxHiBDdqJxGh534z5NL0M2Wyj2Zo/PcZHUhigYFxPxo
         YbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwXNnoFqMKdqkb7DJME1fYZm/rbomuePL9Du0Vo3f/XGOpWlqipE/qvJ9XNMWiMDwl/Ac9ezEDLPuciZEA@vger.kernel.org
X-Gm-Message-State: AOJu0YzlfQ8fg4POHVNRxTjJnuLB3JNDv3y/F8X6eopWark/Xdv6XdLm
	cIob4wCi+qoBGXffkqbT5lSxhfibZZyWyvzVUIjwlmLty1TngjpAc7iWu7To0E0=
X-Gm-Gg: ASbGncsoI+rvJX/yE4USMcmiNz+NnXkV3RgcMtjQ8OqyOk/9MecrIROdoku15Fd8HJ0
	w21dGLzd0BV6pZrnBmS5PmUt7R0Z+wQPWasFTKcYZHzKtl5XvxeBMZ55WVNmQvenQDyA0Te78VZ
	rbvyIKMEG2+Z8T6510PAGs2TdTIy47wNwLFwkfnkfuY0koVLNp8Z3nuw3ieat+MStByVIzH3Ws8
	F1Lozzcnel5r1/+sfSJkJuC0SvuClqzLqZcQsgQMJiILJFZQtI+7QUzz3fc7iTp1FKAEb2rIlja
	pVs9dEU8BECp6UFJ41QRyDPPVJXcWkAwoq6XKDxnKUvV0BD3L60GGjHnJq4iURTF69Jwh8/QDSm
	0S9MZFtBwPkV9Hg==
X-Google-Smtp-Source: AGHT+IFgBEqOGN7/vq6eVRhhgQQxF7mXCUlFJVI50PSYPqMAYmlyn6fbQ0E2ootYEZZVkAmqGzuDTg==
X-Received: by 2002:a5d:64ec:0:b0:3a0:b8b0:43ff with SMTP id ffacd0b85a97d-3a1f64577bfmr15079655f8f.14.1747148804805;
        Tue, 13 May 2025 08:06:44 -0700 (PDT)
Received: from [10.61.0.125] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ca31sm16648232f8f.65.2025.05.13.08.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:06:44 -0700 (PDT)
Message-ID: <6bc6d93f-6d0b-467e-bf9f-784a40ef2207@linaro.org>
Date: Tue, 13 May 2025 16:06:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 9/9] MAINTAINERS: add myself as a CAMSS patch reviewer
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <20250513142353.2572563-10-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250513142353.2572563-10-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
> Add myself as a review of Qualcomm CAMSS subsystem patches.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6dbdf02d6b0c..9b973c0128fa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20135,6 +20135,7 @@ QUALCOMM CAMERA SUBSYSTEM DRIVER
>   M:	Robert Foss <rfoss@kernel.org>
>   M:	Todor Tomov <todor.too@gmail.com>
>   M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +R:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/admin-guide/media/qcom_camss.rst

Acked-by: Bryan O'Donoghue <bod@kernel.org>

