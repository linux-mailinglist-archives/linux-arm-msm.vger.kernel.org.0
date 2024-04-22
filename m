Return-Path: <linux-arm-msm+bounces-18193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E61E8AD1D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 18:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06AE6B257E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 16:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD20153825;
	Mon, 22 Apr 2024 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rXN1Gn0U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DD015358D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 16:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713803018; cv=none; b=s73UvBcLciwL+bUCfX66OQI91LrrvDcOh5nQoKOJcS+8XEp8+cAf/nU4GxMOYlcBBLWSEUt3VNzDkBl72/oFnFHppme+8IxPmqaS3rhS1SKuaRZSxOSi9h0B/45Ov5EfV09vlEGXJbUfFSxtf++Zvk9plbpMpRy+/sy46/IoOG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713803018; c=relaxed/simple;
	bh=gqAW7fj3sgPiDcoedoxjzT94bBENsJV3N5K7VEiaRyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qIfAZXPvNfKAxCRzCByV+O+yIyIjeer5XAXD8Cu07/GQ34bIEvzc4lFtSYysnKoxkxGlJk2an309VdNkjfy1aRKfEkohjfEomY3E811+WKkud3t/9/BshHystcmnSQrWe/RAyVW5cDjyIwPGHf/ifTeE3t1rsEtsilsZ6T4KM4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rXN1Gn0U; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a52582ecde4so419400466b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713803015; x=1714407815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2Gdo6hcLZXgF9GvYlYr9IKBTKZTq045vqCsZKtFOJU=;
        b=rXN1Gn0U4rIil6Kl1u41s8budwzML064Epq+/m4lm2zb5Ix1SyWd2FMdMipa0d7Bvn
         479gxxq0X0UhU6WxHKR/iDBtXis5sGDvhMnllXXbyvh/prD26+Ymvom2c9vRipzArxPT
         iOCIiOpe6lscY4aZAsxNIWtBd0REXM8Q3jdyU6jv1ii4PwQlhrIqOAH8Ie7p4WPmhikE
         xlV46C2hrgKfBYeoq9l8iHw+FQrDAZ2kqTvv1hBNVlB+46lmYbcEQYkomF4qMTai0Etv
         HBKV+grPj6or+UXOOwHwNw9tt1TKqf21RDyRD5C5J5Wjd8Oz6vfvuj5qxgVjbVX4jR8o
         9MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713803015; x=1714407815;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2Gdo6hcLZXgF9GvYlYr9IKBTKZTq045vqCsZKtFOJU=;
        b=lNO3gnn0Jc8bnguzEu9XmwFONZwH4Zm3Eo9ORTOTKiZt6WAMaap3JHUEDLCqRNbyMC
         Ncfn9Cl879d/EDOevU1Qqk7C7eVUxSxydeiqXrwlp2QkRoV9G5QHKdSwHOrGgTsAJRHF
         0b2walHpN60ZpVJ0HTK41FAIW5YzqNMNcOrREgt8lSTjw2hyYIS+2thZj+gh9MtYILJa
         +CMQn8t2YPFnrdE5yjPCjxlNMW1xPlq2xp2YtNlH6b6I6om84oe3XNGDjpqciTAajIJ3
         0MEiPUFHVdbwGhQ0yVYIuOPuTgLeA+s8n0yfZklop6Gxi40kN4/pfYx2+77HDQ+bwnei
         5lTg==
X-Forwarded-Encrypted: i=1; AJvYcCXOkCigRZ/TLfsH/7Jpaav3SMdRCziBXigI7LcytUmIZGGCXwNIDQmMgv9I8aPJ+p6oBn886L24BhfC3hqkq/bCs2ZnXIp5ol+l6SXFyA==
X-Gm-Message-State: AOJu0Yxwm8CWRBzItEhlhg8xkBeVTpBP1eGv2accKks3WKE6vljlZsTr
	5xsJdnvh4jGpq1Ac0CSUUzlSk3E6SxVwBKJ6fwuqK1T/fcR6pwArd4lT3nfl828=
X-Google-Smtp-Source: AGHT+IGb3tPKIR9iF0L1avzReD6Mvwqc3ppr1BDLASz06MR3UMXIn/UmsJyjK9xZIyrnuqWwhkPifw==
X-Received: by 2002:a17:906:17cf:b0:a55:5ddd:ec0f with SMTP id u15-20020a17090617cf00b00a555dddec0fmr7102481eje.12.1713803014742;
        Mon, 22 Apr 2024 09:23:34 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id a10-20020a1709066d4a00b00a52567ca1b6sm5924253ejt.94.2024.04.22.09.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 09:23:34 -0700 (PDT)
Message-ID: <e1f44931-41f2-40e7-84a6-9e7685b3d4c4@linaro.org>
Date: Mon, 22 Apr 2024 18:23:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/qcom: Remove some unused fields in struct
 qpnp_tm_chip
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <d1c3a3c455f485dae46290e3488daf1dcc1d355a.1712687589.git.christophe.jaillet@wanadoo.fr>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <d1c3a3c455f485dae46290e3488daf1dcc1d355a.1712687589.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/04/2024 21:56, Christophe JAILLET wrote:
> In "struct qpnp_tm_chip", the 'prev_stage' field is unused.
> Remove it.
> 
> Found with cppcheck, unusedStructMember.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


