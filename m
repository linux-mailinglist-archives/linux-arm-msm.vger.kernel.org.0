Return-Path: <linux-arm-msm+bounces-84446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 66202CA7C8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A93A032F3C1B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 10:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C80325724;
	Fri,  5 Dec 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EyOISVt3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959E63254B5
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764931193; cv=none; b=g+gc8GSIC9C1DMxOvnuJreR/1yzow22T5goDMh6SfAOzknNwZjWCyUByb7gz+mgaN4HDU5NO7e9S4AChtvg+zeQVp2UNYCDCUGFJAFUEix04kaLRAPgz1A5zlDX78V5Ru6RGwUzfweMc6HmrNT2lelJBdrojWXuXJtg/JAXOdzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764931193; c=relaxed/simple;
	bh=o5zYQo/pdhvmT1AW6TQbgPX3NoefX45zPL89CUC7CN0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=flwzKQk2icnmj0xtGTPXohAaoeLqP2g9DZv7XX4UTnf7u+UXClWoJ8LmkVsBZooSb5G/ImpGAe5mIUOsj8tLs99xTDDChO5AVw3AkZF6kQ96zgVI8JCZTmDCggkB6dz/wEcWzsZ+AyWthpTpYT2hYDFLqy3lMz7RHOD4R1l1VyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EyOISVt3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477b91680f8so19430605e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764931185; x=1765535985; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o5zYQo/pdhvmT1AW6TQbgPX3NoefX45zPL89CUC7CN0=;
        b=EyOISVt3IcNqBjNzKBPVLixt7VHbxvSfGxOvF6OJNqG/Q5ka/WiKsHBAO2G5lN2BlU
         M3HIbSLDX4fA+lusj4Pq77rEbS0ecT+lSnw4+Hnwwr+iqEeoU6mq/C/32RCRnMl92bn1
         plTperEaxlOB1y2tN83UGvkJahEhcSRvXz7ad+p/qIYdDHkMDEVxZPfwyAkDcExex9kQ
         HfpIStRpGPUMSzNfn9M/TlP/wVASmZZNJy64i5Yhsw0O+twro1IbRwG17LUYCsV/B/78
         LrW7P8cl0If49cTJ/H8BbjB32x3Q8yvSdyzCMhmup1TaF2kSoKKEmh6tBsp+/nzCwuoT
         4Wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764931185; x=1765535985;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5zYQo/pdhvmT1AW6TQbgPX3NoefX45zPL89CUC7CN0=;
        b=WQvj5qj5IhwkQdr4q3bCeKL3dKaEPCnw3//+eAhq9c85upR6sc8AGzl7Sk1TG1fF1p
         5SEamoqZ3qe3hrqIMLzJp2yorYISzr9ZT5pRclxkqJOl78gm5N5HbS8k8Q9jXz9HB1Vh
         OiIdJu3THGJTD8a2yJs/fKpRuUos2MxY8PeBRq6F0armWaUCPsioPvTBGJtz5x2P2ZrG
         dymOhd0sM1cGuZmLlkqA9IrcqAxW1imsCY4mSTN65a9aEqHJTBdt8ci4zqs2IcpPH2cX
         Mwm3LvGI9iZpEtqTCVe+8Dx2xjKBzN0cRJCsSbcAefmbGmOowlk5EgwVfKy9PeKY5iyv
         ZHzw==
X-Forwarded-Encrypted: i=1; AJvYcCUmPbZPhCQMjWild0x+e6sGCqCouM0ZapSVmzTRRpq5euXcXRTgcjR16vB3K8ta8XDEbpRAKG/XWupUf739@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Zg8yVQXNK/fc6O0JzbLcJRQX4nAnghsRArcweC5WEYumGWza
	TN0CV1aFnupR9O4FhtSmvnDAorNhtDtq4FRhmgl2zOh2RcZowWw1ZvXWSlG9cBH+tQo=
X-Gm-Gg: ASbGncuEVjgfzs0rP50AWxwi37Xy1fWzVBTUIrA/0wRXPWm64bgR+IpCh9FK623/1az
	zcni49DBzpRkEDcQQegERDHoFihe1+DvcSkEvkRC5/uYo2AgtumHEYFfHuEHvKhUxyJ/DnxdY3j
	hfEE0jKuy88CpEj0jYZM+jPDxHyU3Sw+QNbQ6t+S+fmaGe+gomVwBL7BD6g1Q0z2Ly6xeKKjtKp
	yZfPQYJdFcXL10WAJNtsBTrHvt0auFhZe8isAwpm7NZuOrQrK6nTY7HfM9LT5NJR/+ZoJClCyI1
	Wa4QUcezxTAy/xSJgseICh/OaK1jLwKk+0JVenaS86hSIo+9kQHb+LkGZVAkeGxIoPlOgAbeH/G
	kZAc96FdEsA5bXNXzZOQRSqpYh7yNqP8UBnFnVqtScGrTM73kbjw2+COgJkin/4mQQ7g496Tpap
	eE5wh3yxc6ayhowNJy/VdtMdZXRyyHi133qJNXB3y/s2q1uM0iDC7o
X-Google-Smtp-Source: AGHT+IHAcPLHZg6bWDyZGKpCbcZudLY6bYaoGTsYh6dE+C0Igma98JGLt6Qsc4L18+Bxn9oezOhieQ==
X-Received: by 2002:a05:600c:4f8b:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-4792aeeb58cmr94509685e9.10.1764931185544;
        Fri, 05 Dec 2025 02:39:45 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b02e84dsm56877255e9.4.2025.12.05.02.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:39:45 -0800 (PST)
Message-ID: <862de579-c7d8-4374-9090-cb42c5dda73a@linaro.org>
Date: Fri, 5 Dec 2025 10:39:43 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 7/8] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
 <418e11df-1e17-46a7-813c-045a31d5c657@linaro.org>
Content-Language: en-US
In-Reply-To: <418e11df-1e17-46a7-813c-045a31d5c657@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2025 10:38, Bryan O'Donoghue wrote:
> and int.

*an int

---
bod

