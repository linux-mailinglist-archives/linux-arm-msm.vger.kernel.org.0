Return-Path: <linux-arm-msm+bounces-67752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D74B1B02F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 10:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F47B17A6AE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 08:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F18254846;
	Tue,  5 Aug 2025 08:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IZCCYivz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6952494C2
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 08:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754382600; cv=none; b=kwYXTiBTzRcWjCWkUvUadw5byyYSEzyS+RO8XMdpg4/gr1jbHpFJEjPhH7RJ7dKYTAp0L1FFUFwVSE82p7kz8BttaF1Vh8io0u+NNgqbpQOErwqfR5iOGrDdzuVn1xF9jIDedRmNXubVySzy0xTmTXvNIpXJxjVN1IdLuhYeBYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754382600; c=relaxed/simple;
	bh=vwzQhfg01r+binZbgcr7a/QRd8jw9d+nqmk4LD/Ao7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nnGDW3swVfkRIjJyVDf5Kof6NCZOIGlRiRXWiBvYPsqTs+y2pscoKfPJQhSBqelrd0zpte5Vwf+fs2fEWkWXLlpJLAUGDkoq6+yIRdoOiF10UOJYUR9EAtdKlqsCCvBd4HTN3bShx0BTu9RHpLAcY4HRFG0C/cDZQPHbcOApvsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IZCCYivz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso4482615f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 01:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754382597; x=1754987397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LyLVSQpb0tLUDxNzw0tajIN36UwJANGlESlbNcPlm/w=;
        b=IZCCYivz1UdBYRbyqXOFsSsdBD+OVewZ2mq5hBYhG3Ysk4YBNTV8sTXheoEQ7WccX9
         0p1QNCnqkUZ1awpVfCwbDdmD7Gx1MHFIQ6rKdeZlZy/JsiZL4HMFpV+GKt4atwHu+hwj
         tHtdzZ3pFFJ7rrBGj4AkirlShDMOaOWqQmUzv1vvZPzmx+2zowDn8Gtziu5dSwIql7DF
         EYTg/5E1vZnYkFv/KRWjoukykaO/P1H6jOwG6U46ubKnXR33QCUVeYEBOkUe2/QD4ZsO
         V1BfJK/0HXhtaS8h/X+GophK3v23cg9GNetIO8xAc65kI+YcSf/gKhRtwwFxUYxKm7Aq
         ra4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754382597; x=1754987397;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyLVSQpb0tLUDxNzw0tajIN36UwJANGlESlbNcPlm/w=;
        b=qJNblRbqqRGa11rwSoGA3Fii8L+1Wugy9SLvq1GD8hquNwx3xzMElcpV5uQqYT4txm
         EOKnFn5J9RV5GrZJqSv3/xdmUpS5/XUg3XP19vPEq5m56yaaUNGQZ+BSja5aXmBn1Rh3
         5l9X0TtMMk0edHBR0dnbRPqcqO7aRNz1tPRuPdI0ypmWJUhp7RWmahBtMUZgky4MoymP
         Mm2DU6YTf9MM6BRKRefT0eqZ0vEZNkSy2nlI/H5a3CjY8bTjbb3AqWyg8ktaqkn+OhA3
         0e4ZHSru+kM4UW9rNRYLkJb2b8VK2zE2p9yiaNvj1OG9xvNOvwxjaL8HmMJ2jfgdSp1R
         6HCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhbHRLhQs2WF9B6eNPAHF9ouGR3T69yQt3rb+8rdNRJVTlD+3LbHGrKEKQhGdog41dsEygw3h/mgn2smJ5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6+14KU9Mmn0XsYHjhEtcVuZwN4AzL6LEwS4VQRfthianjxbm5
	GU6U3U9UsAzU5OQACz6gnFdkOlNUMh/VpfUIkI8SeYsD+KspLDcwKHyZlRIXwU3IpJg=
X-Gm-Gg: ASbGncuA8JNNtCRlLYtvXDP3llBqlM3t/GKTRrbuyuG0M8LiqNel9HuI1ELVJjtnWz6
	0lTTsVo9IsPDiE8lIg684wtY73CVM2bWvfe9iVWE6lmYcSAWkvrmjGcGok6ioH0ZhrZZ9tB1itP
	A+R2tP45QTYwVQTw+7faTDeOwxhTCLs+UGi5BY3kd5pND13xYBZdHh3Bq/qhfXQ5cGXUhj9CAhX
	MSwWj22/XgI7EVzrlvq753WmvzsfE7yzpM7vsDA4U6oFNhxfvY4HKBtNZd4VMK3wHbWzZBZKXN0
	CvYdIo/UQEjBTHW0oQtsFAd4dtpffHfYTvNwag0bold9f4JFThRIZmytdiGMOJrZLIqjWI/CqyP
	tOFobGej+X2bQal2l9RbMY6ct7vanNTcuAqO51/qpYcz7HaYATcIO/bvPMLEAN20JxaJNR+aYIg
	==
X-Google-Smtp-Source: AGHT+IHxXn2yLf/O2bw0wSVQuR2yrp3qNWp/lca6o04wzOt6BocP+pKYn0NEJrwyp2gbNHx+3bV2CA==
X-Received: by 2002:a5d:5c84:0:b0:3b8:d79a:6a7d with SMTP id ffacd0b85a97d-3b8d947167fmr8598420f8f.13.1754382597141;
        Tue, 05 Aug 2025 01:29:57 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4595cffdb28sm98597745e9.32.2025.08.05.01.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 01:29:56 -0700 (PDT)
Message-ID: <a5c292ec-e59b-49f0-9681-a990128cbdfe@linaro.org>
Date: Tue, 5 Aug 2025 09:29:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] media: venus: Define minimum valid firmware
 version
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
 konradybcio@kernel.org, krzk+dt@kernel.org
Cc: mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-3-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250805064430.782201-3-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2025 07:44, Jorge Ramirez-Ortiz wrote:
> +	if (!is_fw_rev_or_newer(core, ver->major, ver->minor, ver->rev))
> +		return -EINVAL;
> +

This is the sort of error case that deserves a kernel log.

dev_err(dev, "Firmware version %d.%d < minimum version %d.%d\n, etc);

If I were to try booting venus with an old/unsupported I wouldn't know 
why the probe was failing.

---
bod

