Return-Path: <linux-arm-msm+bounces-55171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88098A994BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 18:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0513B465C43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 16:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B54A26772C;
	Wed, 23 Apr 2025 16:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NH7V23Pn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB8B202F8D
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745424549; cv=none; b=lL+tqoihJIJI3E+QNMm0SvFDQPOGtIsrDJiqE80AgGQRYfsLCHJyzxgYZRafGtV2bVb+c3BJ/qCJCubYXkm1//EuXGqukh+NtVidtxojbWnia3+/CEAg3ivkm+5o7buOefCggx/D0Ha4IfYa4x81iC9y3X2euWGKd+xty12loCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745424549; c=relaxed/simple;
	bh=6C2WruQbnruVUvUmNXf0D+YaVW6T/QQf/Sp/kmZLHXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBhyY6FD/mPm4jG349pm0bUQBSqRtULUQfMcFubVXhZ+YrwITQTr9fjrWF4P3quD0js30bTeSliMgDlsvjaZkESKTixIWmjLmDOdz87Ly3GqKEfNbfLV9x5fjZz6eBAv6NiD3soqOTYxNBjMfVsMFNv8vrTdppVgwp2SWZCxxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NH7V23Pn; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso870377f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745424545; x=1746029345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ORF2CP6OomLWk1e3FvUJDGLD2Zyr1DBGn5dtUvbKU8k=;
        b=NH7V23PniSMOHIH0enPZd43lAHQWYV/F57q9+jtie9LLBIvz7ypkuH/etPZxLCIgIG
         XM6wYvExR7tCxKJ+rOk/RcAoLRJE0ZfBGVULsQYudSSqFr4DsLRCWGm53w0ClP2lpAPn
         6itrEnf9rjc1glviVLUiSy/Pwa7bGZXFj0mUcSh8/oqXDQInSAKZ9BZf9s4IWuUMeJY6
         OwOyNmGHRzcGXhkxXMikUcAsq7hzwaUVd1hfG9NQwARJp+1oPsrGuycYtCvETm+YXKjv
         MClsKxiYToPmYkJofYIFB1v5m54LnumJNfAPocE6PLtQFPCMCy1j8yBmeeUYHynu/F/J
         wpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745424545; x=1746029345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ORF2CP6OomLWk1e3FvUJDGLD2Zyr1DBGn5dtUvbKU8k=;
        b=fkdwGVcAkNmgsyOyuDtBygZCwO33KvSIfcacyq8WFUXSHxarK9Cf2uJc+wogzRC1jb
         XUV3acMbZaZAoQd54fhyMwOzCMlJOb6Nw1phzreu8jhlwsMPuJ8i+iX9BeDp+7/ac7Fg
         IfYOHBm7Q0OP3Y7SBBf5rJEzi+9VxzbC6OfgdaZmYb7OIHruXhCM5P/dXYgbkYzSqiOy
         w6yyBH/5tXOM2jaCISZKwSdOqK179MM7u6sFOPo+BYXTwvO62g4ELGBfc+K6GYPCP4B0
         jTOh6v2EFYXzwf7lb4oCDkdgrXN8DPrm/yPmSlXNYtzJeXjnEfZVHBQ2VKcuSdrOJCZM
         vWTA==
X-Gm-Message-State: AOJu0YymUu6drbeWZZyBhH9PnWl/GdmJ/YRULFU4hZzql80PGXHY7yMg
	FXJvG+62FToEPipxQZlHax9NR9XD5RP43ImlzrPEie4SgRfDW8P4fy3DYbNSqaY=
X-Gm-Gg: ASbGncvDSpOLYIJrptRPm4upGRE1mInOOqR1KAfUOzkuLhgMXasggMvqX4XaPtVoiFp
	Sigx4bTW2Bhb7WPWbUiVA8oWIcIu5/6GT1EAs/QUHFDDNJf4iAvYSgoDqPW4q/oUkoHqAHeI0Bl
	HqaCnIBu/uETavoaVezS5mbT9PGbocbm7m6gJe6AcmOAdXJxzScpjOLG2PKw1MTmlyKp64EzAJo
	wARULU8zWilUas8rBsh/6RL1EC9arYbQ3aJ6NrUYAA7Lc/9XltEkLtYH62yUiDCu/cU5cUDSNdQ
	aEFVluqAdCgmaLjTuGsDYasrZzD9sbp5sy5Lj147xzf2NVQ6YTV+e/WTwHC6gFT2K1x58+GjY/R
	rB7S0DkxNEtrAM/Cz
X-Google-Smtp-Source: AGHT+IFD1qn4MEpH3wlqbTJMbw5sAArPinlMyJX/VVOG6Uxi7wIwgbVxMU66H+xq9iPQlQCcNDplcw==
X-Received: by 2002:a05:6000:420d:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-3a0672927f4mr3220079f8f.24.1745424545592;
        Wed, 23 Apr 2025 09:09:05 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa421c79sm19064267f8f.1.2025.04.23.09.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 09:09:05 -0700 (PDT)
Message-ID: <55f49107-e7bd-45dd-af1c-5d9a5b2020a4@linaro.org>
Date: Wed, 23 Apr 2025 17:09:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] media: qcom: camss: Add support for TFE (Spectra
 340)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 konradybcio@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-2-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250423072044.234024-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/2025 08:20, Loic Poulain wrote:
> Add support for TFE (Thin Front End) found in QCM2290.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

