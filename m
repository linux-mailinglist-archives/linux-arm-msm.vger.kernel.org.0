Return-Path: <linux-arm-msm+bounces-35617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 506C99AD2E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 19:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10F132847A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 17:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FEB1D015E;
	Wed, 23 Oct 2024 17:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvDO/zTb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF46C1D0148;
	Wed, 23 Oct 2024 17:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729704362; cv=none; b=D2nue9Ltlhwfps9IlIZFYuIhkDW9rxtQb4pNUvUkyXaqVg/OMc48cxdV8IPul5lbYt3ROtdHrhU0wU9xwvRHCPmjzWlYSOVQ+ahnlr38dRAvUvgArqZJ/9Mduo48FBM0QVAlbLvMihysZqvDHHUYjjE0TYibvbolb8IyQ6nVfeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729704362; c=relaxed/simple;
	bh=ExKSSArRGdy7bRdVoF8OmsrxTfnz4ONUWKTYnBGexz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3ljGjN3TOhreoKeUho795sfch0ENimqZwDwUIxzVajS7XhKWdOwhSnELH/1o28DXxckaT52EP7aKr1PcDJfeATFVhdAjM4qAC9dnvqL+RGsbgRd0KFuezZ96a19d5IKqBRJ6pj97zv3pJGpfRwJ4lZmQMPop4wfoI/pIZlsmro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvDO/zTb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43163667f0eso239935e9.0;
        Wed, 23 Oct 2024 10:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729704358; x=1730309158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kb9i9zUsNMVUYPzfr+JSRlA9YASTj0l4XU9VARfF+lg=;
        b=JvDO/zTbvhM//Q7lss6FbwkjzjS5DJsgi+86XUOuqsBTMVeKKdicCtU9J5YIT1k42U
         AIJxvvei8W12O8CyezWz21bEdIaQ9/H49VOWaTWSxaJ8WVY0mBCvDnSsU1vikqZNR3RG
         gNgXnds6gWN4OjDVjDABWe+N6+3fv9ykJF43lJDkD4GAkcyZFgSwAR9JowsLxrBzILXR
         gY4Op9HckUwMIej8O1XzvG9fDDduY3D8omisOvwwh5BHNFdg68CXG3PFfunBd9aLMfVO
         9zJfAhsPHWXNbF7N92KsR7NDLKvlydinyWb2p2f+1ia+k6qcRNWz99PyLSn+eJzE700y
         wgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729704358; x=1730309158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kb9i9zUsNMVUYPzfr+JSRlA9YASTj0l4XU9VARfF+lg=;
        b=KO2yxjbc/Vofsvugv6dxEIuWeYNkf8aUHvZTV4Tn5kEzWhCKskAdOJrn2+pdv/PQJ3
         uc8IWPeHR0AjwEhOkscEsXw8eAEOcXnXRV7iJ8u1d8gia4eB7Qikt600Eeu5SQkDg012
         zteotSq6LJcSNSqOsX8717x0zbbQ/WX2pEVG7fb5fsRfzy+9qDdDnBiHxv8dxFQhJIaE
         WPO7K0dYRSK3KgOgpGuIvARL2eIiNJ+UyCZBP9WOvc4G18ERiLXrmmJzU1LM+baFiZrr
         W47ZWd1BiIMz6ygZOZ+pfCx24Z/epDQ3epSPmjLoLir4DdkDH4iocL5DqhA3LOrFuclc
         CuOg==
X-Forwarded-Encrypted: i=1; AJvYcCUFkxz5/C/REyFkaJdcyJjwM/k2subj6+NWoIdutEa34yzbQszO+6L7iFh+WTkbiwWo9fNRYgE+m/XQ7lqOeoNaHUp/ww==@vger.kernel.org, AJvYcCUhSLJ448pt2Mcf+EurLrkNTTw6fvj7s57tAF4miCWx6IvkwZRdo4mheZMu0jyNJ5fgya7XJAyDv0v1loks@vger.kernel.org, AJvYcCWZ90wTKpHVQWlwn6hLHOex3c5HympYCW/CJs9IQZsl9SSs198t7dAU414PKx8nRcaYPD0Df3/t/F4F@vger.kernel.org, AJvYcCX0QSM0vQQfssFFvKeDM3Zdqvu6Gy6Vx09W06QPL7Tfp6lTQgQWk1ebjcqCNjG8zx4/G4IqEJON9clCQ+UG/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoDteE3+2627KIxg3AtaClMiZGgBx525j/iPkb2wlR5n04H7oE
	PwPbh4aUUkUDDqFpcYvOhcw6bwie7iKM/fnPYaBiewM3nWxPp0qE
X-Google-Smtp-Source: AGHT+IEbJlcbMDXNmFlVO5YLPk7N+x59kLpszwlxBi60Qf5wpQvKuK0j3CdPszBmP5ozz2mfUuD2Og==
X-Received: by 2002:a05:600c:34d4:b0:431:5533:8f0b with SMTP id 5b1f17b1804b1-43184246647mr34064505e9.32.1729704358419;
        Wed, 23 Oct 2024 10:25:58 -0700 (PDT)
Received: from ?IPV6:2a02:8071:b783:140:927c:82ba:d32d:99c1? ([2a02:8071:b783:140:927c:82ba:d32d:99c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186be509dsm21671835e9.16.2024.10.23.10.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 10:25:57 -0700 (PDT)
Message-ID: <ad9fa9f2-7f97-401a-8e8f-ae633ab1932b@gmail.com>
Date: Wed, 23 Oct 2024 19:25:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] platform/surface: aggregator_registry: Add Surface
 Pro 9 5G
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
References: <20240908223505.21011-1-jerome.debretagne@gmail.com>
 <20240908223505.21011-4-jerome.debretagne@gmail.com>
 <f9cbd1c3-eb05-4262-bdc6-6d37e83179e5@gmail.com>
 <CA+kEDGEdd_s+DGKsVNY6Jy870B72eHuaj2EgEnwP8J46ZGbxpQ@mail.gmail.com>
 <8370d062-b3d2-46f5-9e7b-8e16edde8480@redhat.com>
 <555f8a3a-ae5e-57e7-f176-96c52e1a5d45@linux.intel.com>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <555f8a3a-ae5e-57e7-f176-96c52e1a5d45@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/24 10:56 AM, Ilpo Järvinen wrote:

[...]

> Hi all,
> 
> I've now applied patch 3 to review-ilpo branch in pdx86 repo.
> 
> I'd appreciate if somebody confirms I got those comment edits right.
> 

Hi Ilpo,

looks good to me. Thanks for fixing this up!

Best regards,
Max

