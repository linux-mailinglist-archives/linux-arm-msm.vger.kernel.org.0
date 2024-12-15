Return-Path: <linux-arm-msm+bounces-42259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D079B9F238F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 13:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBCB21885F1A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 12:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76AD178395;
	Sun, 15 Dec 2024 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eA+2/hjk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CCF15D1
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 12:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734264233; cv=none; b=KFphi7rSKZXDjiE5pBStpPVibW2P1rB4ehZrfYKE0+y/7HodlXteBRN3kA5ejVI7YY0xhrMJF2Aq4x7e0xet25POG6T3VmehebxCSagfZQsfL3xGn30LGyijh2ryuz9DUUvCwxwzgF1WQ6/toCXszh9riEQPdA48C3oY5+svscQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734264233; c=relaxed/simple;
	bh=aGpiOGREIUcShpcp8ShVC5e2TvYuN9RPLMTv9UtamMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HfPsg7Ud0N6nDwE8KKNye/G+KPj3LAsgu8lsQ8UoTgcCpjZu36zr+ApoWRY7odC9PrbcnTUgEQrdNHgR7j4vTnweSDCi68qGVr7C84y1fK+LVQOkS4bhczn9wJKL3vaWmTmWv7a9y6QBNpNUgXWMootDkqgT9h6FTE60q0mT6g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eA+2/hjk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so2136869f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 04:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734264229; x=1734869029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MS0JrlD/MIP9EaVqJjdQNvfB2tn7DETWLm6kEprczwQ=;
        b=eA+2/hjkzWvPwpHMu1ip6KzFEc70WIAPC5jR73P4uzT9MLBQq47MPZqIQlw1QEL1b/
         ptrRAMOPK0ZBl/rG15iro7vHULH24jmoA+7yqqH7XrCCWc774GUKoHEeauCnwTlx0xBh
         PbsKn9+x1LH17YbDeIaUZ+nIjlAumI3CnDwQaAG+FrwOhMYRCzEAuqqZjtgGjI1/liW9
         McFkCMFxCMVHEw83Sk0T672fl10vUynG/ABPJ629M8VcPKfj7ORb4d1cH7c5tVWPYMaz
         Ifj5IoaNIXvbwYx0h7P5MLWOnqjXeV0SGbF2xapKngPs3XdW3KJjuci0ZRMKN1Ck460a
         W2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734264229; x=1734869029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MS0JrlD/MIP9EaVqJjdQNvfB2tn7DETWLm6kEprczwQ=;
        b=dg9C8jatK/+FfHk9iMX5bhbzE1lVpAQ0tMcZaIda9OvL4Kj7UodNxTAsxUjqVKb/bt
         FYuIWnTk2RiOtYEEK73TA4nXDek/fHD+LhyvNuLX/Eec1Wv+hGtdHWBZrHO2uOlgdwZ/
         Q+IvUR99lMV5doHUDYAPt+cd7Bpcf5YybeSURMZwf0fcy/ZMYrkJ7e4GERQ+k3z3FKNp
         ysjnlENOK1KuIoSVPT5ASwWZmS0py58+be7W7lKHCQCyUa8wiVuFy5ZW179qetwLudAi
         abfO1mS8Lg/XhbISK9p4JeuDL6hYaU+vPWpdnTnJ0whaip9k86IvzzJDgYdyyqQ34plK
         rFHg==
X-Forwarded-Encrypted: i=1; AJvYcCXKti8OFBZI8Nw89LNLNPkpyWID6nvIMrBJSP5I1k5QJCHyqc6pRLEgvL8MVqlJck9I3kNZvqtuuXVCMVH5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+tfylwil8VVLCWHA804kpY7OhdSpE01kRYnma+zOzTXgQXjXy
	2tPDgWETcIcYWv/tlj3iPZMHMKTLBF62X8M52daVg09srwVrDZjYJHElySsdqJI=
X-Gm-Gg: ASbGncuZbslMg85bndfqhP24dZCYGrKSBFy6l/qo6drD12wzOhuIVDc7UyRBy8LNTkx
	mmdvgxuBvkbO5VyF2ieo6MB9NVKnXdsaDFLJySD9QR47OYfxL63/YqriqIAZRlYqYinZPl86kOx
	s8X+u0exHkJEn3M9dEHrxsZ3osghYhFJTVgtV3AXe92ecw1hiPiVtlnbhlqnXDVc/QhjizuAlgR
	hP2H15TKbGPZ5oqfDRYtdIv+Q9GFjWB22gBvkVwBTzpoLfD3J9yzzC+mz/oUkGBH7tNVQ==
X-Google-Smtp-Source: AGHT+IHdf+axtUaBvNo+jZg5gVqNEZh7fpsNxrZqvb0qpatqR6zQGoIT4kFiRZ3VvH03TdccPTyjiA==
X-Received: by 2002:a5d:47ae:0:b0:382:3754:38fa with SMTP id ffacd0b85a97d-3888e0ba9a7mr7465978f8f.51.1734264229096;
        Sun, 15 Dec 2024 04:03:49 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80120dcsm5216297f8f.8.2024.12.15.04.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Dec 2024 04:03:48 -0800 (PST)
Message-ID: <ee6bbbb3-f91b-4568-aeec-11d773ae4df3@linaro.org>
Date: Sun, 15 Dec 2024 12:03:47 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Revert "media: qcom: camss: Restructure
 camss_link_entities"
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241215-b4-linux-next-revert-link-freq-v2-1-62d5660004ea@linaro.org>
 <60bfe389-cea9-4aea-9175-fc80f1e9f594@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <60bfe389-cea9-4aea-9175-fc80f1e9f594@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/12/2024 11:58, Vladimir Zapolskiy wrote:
> On 12/15/24 02:33, Bryan O'Donoghue wrote:
>> This reverts commit cc1ecabe67d92a2da0b0402f715598e8dbdc3b9e.
>>
>> This commit has a basic flaw in that it relies on camss->res->csid_num 
>> as a
>> control to index the array camss->vfe[i].
>>
>> Testing on a platform where csid_num > vfe_num showed this bug up.
>>
>> camss->vfe should only be indexed by camss->res->vfe_num. Since this 
>> commit
>> is meant to make the code be more readable reverting will simply restore
>> the previous correct bounds checking.
>>
>> We can make another pass at making camss_link_entities look prettier but,
>> for now we should zap the bug introduced.
>>
>> Fixes: cc1ecabe67d9 ("media: qcom: camss: Restructure 
>> camss_link_entities")
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> This change is very welcome.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> -- 
> Best wishes,
> Vladimir

Mauro.

Hans would normally merge for us in CAMSS but, he's on Xmas holidays.

Could I impose upon you to pick this one up directly ?

---
bod

