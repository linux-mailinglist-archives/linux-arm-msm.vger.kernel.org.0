Return-Path: <linux-arm-msm+bounces-58257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B81E9ABA8B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 09:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4654189F391
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 07:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C6E1C3F0C;
	Sat, 17 May 2025 07:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6Mzp+M6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B382E628;
	Sat, 17 May 2025 07:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747467431; cv=none; b=NF1Hd5LLjtU8v2AanhAFdlnJAvYfzQ8YpiQOKSqSHX7ji89w1acIXKw4kyK6qUlu2eZc9/ZjVG/YeAJnIa+WojA/WxWyy2W0ySvDPxVEF8DyAdMWdLXWh9djhWMRsaenUfUxG9RQ5F5LTQtkbeZE3VLd4yI10HzD/DRCiYHJgIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747467431; c=relaxed/simple;
	bh=WuAHkOW9ql5yv/SUiIu0f7YuUFvaxuASyvebZHs6ZLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YaQTVSo/byhMi5i8iwXPIrxRN/rt8Apc+sboxFP3jmCPMuOkzM2uYzoeTH2w6JuBa/5zGtHeZNUK2OBI77oARQ5puXwBxFZ7X6AtUgVs9CT/Cqfd9zNnfx3rU79cFT8KAR70FuVU28pfAROwesjRYjIN9/W7nkWebRVLH5Wyops=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6Mzp+M6; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so1765237f8f.1;
        Sat, 17 May 2025 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747467428; x=1748072228; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rHYIKB/0zV8yrGOwmdmiFz7Fi2QYRZJNTisvQQQ6Btw=;
        b=i6Mzp+M681hGI7VDqZLHU5HFRCt+FSJgpCA0V4JUGM7c0avUqWkfaRlw3ZCaCFdsY1
         fNFxGkc4NYNsEVQFHF5NsSkfJtRM4teV+R14DHBM2JfjNeCP27fK1E/v8O4cVpjJB+TN
         +rreLCAjnIHmdcQ5rBHrr6zpEshLeQLIa3O5kA+80Wpz5A9FslnAcjpQhb2gF46ebyyS
         ymbCKmI1xvpZGrfe5mx8dDDLbvYfGqHBNQMx8gWsij6oKYFTD1yLjHqIKg7g5oPUNl+C
         xOqPu7b+eNvAISlUmIiilIqQjZQua0yDfBU8MFU8oOr16tdX4sg45WmeVAB3tjx3jOGL
         uFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747467428; x=1748072228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHYIKB/0zV8yrGOwmdmiFz7Fi2QYRZJNTisvQQQ6Btw=;
        b=rwmGvolLcQkAgnJgdnFaDwkNwtFl8S5S1uuvWwzRKfD0jcftixdYdUCx12C9wgqjJn
         tPuKF+Zf82L3+CQSgz5qcfXjPMyKRHe7VWPB4Hydp3uMjqJbTm+yCiPNG5npj+SeNaAT
         Uy3WU7K/yS1U+1ll4pSFCKFNEvzp6aC8CbuOm45rVl5z3E+x+kDeS9V/rZUDaOlWDvuA
         JQ/Q976rGWP3VQ4Cp77KYgCHOFG+JZZxds3aBS/wZ7P1rRjvgZWBueKr0sbv9U/qRErN
         6McinE+Gp+DqFwu816GOAXlubc7ML3RxiQVZUBBjbPRnjyBcPGsjWxU7mqwKRnPy8FcH
         eofw==
X-Forwarded-Encrypted: i=1; AJvYcCUNg2ezPdWr/hUdF8CRIVEry2pxDCJa3x/hDbpG0e7s3kVQEJ96xe244EXMDV0fOFa9tBLZr05OpiKy@vger.kernel.org, AJvYcCUoPMwPeUXAC+2tEoAp9B5CGLnA31gCmnm28JUD+T48y0ktw7NMIcqDsHgmcKdnmVbMGBOIzRiCC2U6AOIaww==@vger.kernel.org, AJvYcCVkYfRQmKbs7YlA5pkWTwPBgADJBobNaLCS+ruHpId6t1mYPTOa0qK2TM3Rxg2taZBJhQstMbcYPpz9rzNR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5zoe7U0HCZ62Pk/J/y8+J7CSGcSl2OdK2I+ty7c2Ob209mNh0
	/wzERsB/dLsJZu6uA6gk22lQ9Xp+M0UagGj/jcvpbDrb23rsg1pycvQgk6qaUlLjxfgDvtFzais
	lLfrnkSX7HrGMd3gsShCak0V+KRJz78WGqX0=
X-Gm-Gg: ASbGnct4ZJj6Km9WOj2/cPIDqwKKec2R7JEAMLcy/y4lDB7fgRHc8sS9zwcmpyfxsKy
	MEUWh5t0nQB0IIWgVu+jB7oUNT54ICMmTzmVTHmpG+LkqhkYhZTSFMy2AgN01I/tYzQvf+U1xhQ
	+DaMRto2ViFjCYzpd4ZGtw6fcOraDX9YQeD65r+Z68Vro=
X-Google-Smtp-Source: AGHT+IEKyb/pKJIOSy3lBKTBF6kz37Mbh9p/L7AFJleoZoBWXPA8bDN4nJW/RnK4Iutw6/dlRJRxPz122PID8RwPTag=
X-Received: by 2002:adf:fd8c:0:b0:3a3:62c0:fde with SMTP id
 ffacd0b85a97d-3a362c01034mr3209289f8f.35.1747467427343; Sat, 17 May 2025
 00:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331204610.526672-1-alex.vinarskis@gmail.com>
In-Reply-To: <20250331204610.526672-1-alex.vinarskis@gmail.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Sat, 17 May 2025 09:36:56 +0200
X-Gm-Features: AX0GCFvAiofb_Uy-3eUIz1YQ-MA8_4UUZRMU5FPRF2iVPAIqvMukDd3P0i25i7M
Message-ID: <CAMcHhXqWzrqc4wFJy=ZAj1vygR9d26s-yspHT3VVXmnbSye=CA@mail.gmail.com>
Subject: Re: [PATCH v3 0/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add
 WiFi/BT pwrseq
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	laurentiu.tudor1@dell.com, dmitry.baryshkov@oss.qualcomm.com, 
	johan@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 22:46, Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> Add bluetooth to mentioned device.
>
> Changes to V2:
> * Fixed commit message misunderstanding
> * Picked Bryan's R-by
> * Picked Laurentiu's T-by
> * Link to v2: https://lore.kernel.org/all/20250331073423.3184322-1-alex.vinarskis@gmail.com/
>
> Changes to V1:
> * Fixed commit message
> * Picked Dmitry's R-by
> * Link to v1: https://lore.kernel.org/all/20250330212729.3062485-1-alex.vinarskis@gmail.com/
>
> Aleksandrs Vinarskis (1):
>   arm64: dts: qcom: x1e80100-dell-xps-9345: Add WiFi/BT pwrseq

Seems this one got forgotten. Shall I respin, or it can be picked as
is? Still applies cleanly.

Thanks,
Alex

>
>  .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
>
> --
> 2.45.2
>

