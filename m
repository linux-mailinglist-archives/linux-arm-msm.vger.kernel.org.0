Return-Path: <linux-arm-msm+bounces-78060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02076BF34FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 22:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9890C3A8688
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 19:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A358333434;
	Mon, 20 Oct 2025 19:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WkeJBh/G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBAA332EA3
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 19:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760990359; cv=none; b=eN9e9WaXXdSuRhToCMoayS+r3CSApd9qyS6vSS7y+/LQiWhE92Vmg9QnVzqJzr8euu1QIK93DbyvJb1V/UUfkMDXud7dBy24giHnxDiXUqOLwJ6CBTGBcpRzP9n040cqRmlMIB1xcCN7WHmSEWepbWu1fNQJjjBvD5QmFT3+d7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760990359; c=relaxed/simple;
	bh=RGfpAN5rzMHTTLTFD3Loxuaxwb3861xuxa5WQkx+zXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rPpT4LepcpNqyTpydYU88K1DHNVgFE26XqQpKFVIxPR2NcJWy8T59cmByZN2Xs8Icd5uMtz6rfhc+8isMlq6hYWkKmJoPNnUtMpPEf/CbMh9YI2+T0Gnipi8O8att5qkKz4NzCnoOG/W5Knc07ETo9eOXdTw+p96zAMYUa4OV5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WkeJBh/G; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-474975af41dso1005e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760990349; x=1761595149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RGfpAN5rzMHTTLTFD3Loxuaxwb3861xuxa5WQkx+zXw=;
        b=WkeJBh/GhWNSApkJsZAVMbPiFNLpdO876HgkWJdzb9VP2jbuW1zwgZglrrkN6KYALG
         BCtVRlA5lRrBgZg+Rtw0CxE8iy0/x/spNUHaOkXaueLrK4wBDNG0l0LRP6BiSHOl+W9Q
         1Zq5SzvKF6E9GI+zsojA72FKsiOjlLF77Me90JIkujGAZVkuxGB2MgVKdXtppKQJa34M
         LqprURPuLU3hhqGO3LXlQHYyLX1DvUZMOp8/A5FLRgunTmc816GkVlHXjm/jnTAUVsox
         2mAHrqOXwcyiaFc036goSvI/yg4benKqGINRMrrv2IxbM6xM5kkRudprrL/G5fKQycDq
         7jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760990349; x=1761595149;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RGfpAN5rzMHTTLTFD3Loxuaxwb3861xuxa5WQkx+zXw=;
        b=eDf/mFz88qc7fNX4aDxBpxR0cHFIks0j+taSEVc+BNiFvtj8zZ2lGNAKqQjATXDXbt
         lOnlY4ClAImTWPvTqNkW/MyfY387vuFaUC2hIv9c9OEOPBoHIny1i9h8b0m8khs5XlIt
         hAqSSKU1zGyiM13RRUB1Ts1h0OgFzh5Aj8Az0sxcU16G70p/waEmEscADlYTGFXvk+wf
         h0uJCA42N6GtdcIycFQCh+RSdAz0eXujlx9sZg4OD3GQ4c1h2eAhS5KkE0D7N8lD21yi
         B1J8XQh/s1k5tA0SxaKQqYpYcWO+4nlZ9jbzbHsO7wDJe9LgC2Ziq7s209zLv79TVNZV
         A9Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWV6ut3ReKr0XZqgBE0CQ3xWczopX9LE4PCsHbv9bcq7cNIlX8GnHkNDMQBYpV53HC2+jt4hq5LvALXHNdj@vger.kernel.org
X-Gm-Message-State: AOJu0YxkFt7qvaob63oqCMvLzl/xFKALMoSw5BfosCa+o+dVEY9IqRk/
	R/GomrNCoEe7QM+3q6Gj3TZOOHqTZzZ3flcTVvJdnIl5jOURqz1REXZGr+sLdfbF3YM=
X-Gm-Gg: ASbGncujZwitFMf4KLb5Llrc3zlAUR2Lh4pqrXlMhX7HhQcHk7I5S502y8u48cr45Xz
	l7EGkcRHhmteVpoEQS1sQzAv7AB2DocYL7m8dfpyYf4VU2ZOsdMFX4OSwRAGemhUndxaO3VtlD4
	yQpobYfhtMD/xGMvHLUuyqvSxRdVC7rPCVd7Bei4S7nN/0Cf6T8rZW84gLjLJz3uHfm+W+R0a22
	Il8Iuxq7IqZpB0cer3pMTg6cqvDoeItxEv+BYM5mhqGPUDK555fa7zey3GryWc5g6Hwsy/lW00L
	xYEXiRIhCLLh/z29Pu9GMMOL/+TJkFfy6vFR2TaNGYRyVSA3+D4BE+xeTQ9dbOeGRRkVovEG+8P
	9DfyzEhdV7FX3EfsG7aiFYptqrKwdFK1GRfc0LCEzRDCH6x270Er56v4edUTyWoKTcodB/rZeqo
	PfyB8/LglSy7CKFdNuJA5CSeV1EH/wmkfW3lApyptjdyjjnAORYHy/1w==
X-Google-Smtp-Source: AGHT+IGvccbSI11XJaSMgNlpFHKrVHSLfRMXa/L8Zy3VVZh4FfZmD5f/hOBseLwrd7XiHIRl8wNufg==
X-Received: by 2002:a05:600c:5298:b0:46e:432f:32ab with SMTP id 5b1f17b1804b1-4711791d1e3mr108234665e9.33.1760990348602;
        Mon, 20 Oct 2025 12:59:08 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144c900asm247164875e9.16.2025.10.20.12.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:59:08 -0700 (PDT)
Message-ID: <c1fae486-ee56-41bf-b3e9-e2e2a9338d1f@linaro.org>
Date: Mon, 20 Oct 2025 20:59:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] media: qcom: camss: Add common TPG support
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com>
 <20251017-camss_tpg-v5-1-cafe3ad42163@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017-camss_tpg-v5-1-cafe3ad42163@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 06:06, Wenmeng Liu wrote:
> + * Rreturn 0 on success

You might as well zap this too since you're v6ing.

---
bod

