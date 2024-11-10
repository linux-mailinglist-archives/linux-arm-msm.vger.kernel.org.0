Return-Path: <linux-arm-msm+bounces-37411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCA89C30B3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 04:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07B581C20C58
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 03:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F66143C40;
	Sun, 10 Nov 2024 03:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dt1k2qJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B077B14264A
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2024 03:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731208276; cv=none; b=LofLo7a5weZZTPHXufWQABsD9UR+tnQ/7trwPTETSjar1kNpzIueU+dQHv9w4naApdgKaWoAGmE7QwY4zgoGvYj2A4frOZYBt5NQcDhsCCDFXl9esfQHixufYT60pvvBtXxF2EeAgFV7T7I8LdDfe50SiRMiUVEJKoZTj8Lf4Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731208276; c=relaxed/simple;
	bh=g/KMlcMVXNTbNZFri33l43WlCq7/c4sXqfwmJIHrgjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XcXslL8gpGM2suHhrnhgj7RFj8Wat7yqj8EXAHYOAkThNuFGjQDu8C2l96oq0RKLFDqVNXD3yReRElJVpHLa3iAgBa9KvRuxOjOFhjQQmeNtmshMBeQaRlz4o1bLRQTm+WHfPKY0mZREI/I/S2Qh3ABo4Z1gOtA5wLQOv4zTLiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dt1k2qJu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4316cce103dso42893045e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Nov 2024 19:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731208273; x=1731813073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cko2Ugguk3Az/odluOUc+24GVofiG+QXX2HCknsFNAE=;
        b=Dt1k2qJuuSTp7HMcRV3W5GiyHEbvFzRd2fRbGqsGsSEzyK2WEUJzbj9uNPcgg9sO2Y
         RKNbiE6KtWxV0x3TurM8XcNmApEbN5IVSezJ0JQV1uymXZOiNN3fAF/8e81QnGBbwNh3
         kLyGbUbtNM50qIGEyw4cOBZSgF0IhambRr6p2BZY0+jsKO/QpQfwqQs0vE0LsqlO4HIW
         5AeTASqXme3edTLgcSsKfm88idioEhXrvniCN7ajVZGbhHChE2dbL/CnrzbDYitdWUKu
         XQya9t6QEBd4TyVD/foHGZrXCktAAG8/xZWtj1lhvhrtY5xCNKrJNrIW7ugbMS7w7bU+
         F4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731208273; x=1731813073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cko2Ugguk3Az/odluOUc+24GVofiG+QXX2HCknsFNAE=;
        b=HGyHqRmVpHuhaPICO0TCPXYVuCJyYv2xzdCK5lEnQcXansXC0VvwMsUcxF38NxHqRB
         kQsXOZsK8mMbkU6rk/qRp7auhGjira6XUxpICi8vugsqmXB2IojDdB0SLqL9NJomDbsz
         eeCDnEHb+1NtkkurBgIaMlC34C1YPW5vu0swe2jYJlQ2Jh3AeEoDiG34c0n5+3SSsWeR
         oTmXY9NEBqwSJOxKJ5P7nxxKc++GJbd2HQbrISqUGqc8kbE3YhkmytFheaD1MTG3l5ei
         Qz3bAutgdf+h7uKs+R8NVb3h1WR/JcGAoUYPtOwHb5Y4TKYygDZSsocTclyfHyCknuar
         /gLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvhBruLTJcSmmHB/SGCaO+O+Eor5sClq973+FWFDqbsG+UAASlintTmw+xcxRjjCSErlH7TgMW+gqgPRUJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz76beXzIHj/vBrpgDEzLdkDzABSB/PDi9EkrMTWGbPZlYWde3h
	yPNhiaA7fCm/OqCczO7OfKxMHHAjRmC4d05+YP4hEKUpq1w9KG4ETKiNp2GXUXU=
X-Google-Smtp-Source: AGHT+IFaIidm3QPf6bn0cWOlTbHdw3gWZCS4Ki1/N5fALPksgNqv20r6Ewl7HK2fNVn1X+eNagNWnA==
X-Received: by 2002:a05:600c:1396:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-432b7518e11mr80462395e9.21.1731208272963;
        Sat, 09 Nov 2024 19:11:12 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05c1f61sm130198805e9.35.2024.11.09.19.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 19:11:12 -0800 (PST)
Message-ID: <05936fd6-862e-4727-be0a-22eaa8ab4448@linaro.org>
Date: Sun, 10 Nov 2024 03:11:10 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/28] media: iris: implement iris v4l2 file ops
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-3-a88e7c220f78@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241105-qcom-video-iris-v5-3-a88e7c220f78@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2024 06:55, Dikshita Agarwal wrote:
> Implement open, close and poll ops.
> 
> Open:
> Configure the vb2 queue and v4l2 file handler. Allocate a video instance
> and add the instance to core instance list.
> 
> Close:
> Free the instance and remove it from core instance list.
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

