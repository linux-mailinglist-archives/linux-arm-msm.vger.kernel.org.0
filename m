Return-Path: <linux-arm-msm+bounces-35730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C945A9AEF23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 20:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0603E1C2164F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 18:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22271FF02C;
	Thu, 24 Oct 2024 18:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqPstOEd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9D21F8920;
	Thu, 24 Oct 2024 18:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793028; cv=none; b=t7F4pmhbKH6cWdSzbSGpWXdAlYk7W0MDJ3bp3I8DIL/dG/rYk062dFQcEB2S27s1JpczEWlkqDRXYG6cGsbkGxC4hln7jIRwoUAioA1JybtMz0hrS+bFhVXVP5h/lUbnUO2XadsC1UlVTbHY5UDKFMOtlIDW/aip6TMJ2cBV/co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793028; c=relaxed/simple;
	bh=Jjzb8d4htU59o6z6jqPz9K9lbCUgcLZlUXtrGLA6Dm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+E4XENzeBKZVPpuC5WaAZTtbYMqDDbGqUDBijJtknwvfZvWNymA+wcKumG5ZEtvc5kKLrU470IGL8TfvbUnzQ2QaP42hGJBgLHBwyl1BtWhRCepPckmXQjzj/O3ExzF4EsvuvK3QOsRv4mjvFEjcfkitTnbVUmn8S2EabHmVII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqPstOEd; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5eb5f07410aso646527eaf.0;
        Thu, 24 Oct 2024 11:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729793026; x=1730397826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WQGdXv5S60VUVlyT05p3hjweqi2hxOBMRjr1Qb7WPDU=;
        b=GqPstOEdeBvAb8TGoNY3g3wkiWlTGlvZnSY9p5zy2UJeC0m7IOZQTXcdlO1Xx0qBtv
         V22A93Grk9pqB+JSmypPmOyg1oGP8TQp6zuynCI4u2YhxdRDyXbUF9xv3cLglIv5hAn7
         Bz2uAdFWtJwGkXw0KKZNcY5GTz6TLhJTNZEbO+Ws8YffMMhLyBxXuIpsWsqMzcaPNbNp
         DO99m76kwF4B840IcSSnuMsW7FYFkK/MbtGtUwWoRYhhQ6m0yxy6IOvbXUA1Ut4ft+4h
         dgBzXpnrMQX7EHxNVr18D05fHY1b/UbDqNP8nADrEloJIZYjFOXFUN6B7hN+TDQ7SRc/
         sszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729793026; x=1730397826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WQGdXv5S60VUVlyT05p3hjweqi2hxOBMRjr1Qb7WPDU=;
        b=c9/94+GYYMQrC5ADMNdsxCb3EZROOP6JsbKs/lJILLxFkjju7U5NVIJsFX1zcPB+8m
         dVFONv90P7z2H4FJHwth6ioseQC8m7mR0yGWuzwfMHFGq+80v3z+Zq9MQ6hiG8ULp4DI
         nnAnlKgWooRZ/FTj2EPS4KP1xyfYW32w2myjP+RyiSTqIkH+fXGojY1/ILTfAuWPwc+q
         1ilijzALODpQRGO1zDyD7Um69OpNk9Mlvs121yK8X0Ac5S8rzHkk2JSDnnTyBBiLM5iF
         VxqRz6v+iBJTp3YYdIqHCN0/8O2WKkhDoODBXV0z5fZXqgNOooqjgngLv1dtHuyBtWte
         +bBg==
X-Forwarded-Encrypted: i=1; AJvYcCV0MA3R0Co1xlsGbZXi73DchBUBLLnFrsDic2J1zQ6iQlw7s2E+WkI9alk3pleSFudzfisrvgQGBK2E2k3B@vger.kernel.org, AJvYcCVX7CjrNO8EqHMgZXcTelWo5TV03fA/bp6rVK5pZBmmqhmlY6c+XUwu6nOp9/bLJmvd1R2/DIBN@vger.kernel.org, AJvYcCWveSdOxOWuveN1OPCf624VRpEcEtfIm0lb+45F2d3s8grNZQ0iowTc3Y2qr8l41/UD/3APfc/J1eHVr7qb@vger.kernel.org
X-Gm-Message-State: AOJu0YwyIYvyNNaFMt8dIv5L6eHvZ89zGQPrI9vks3jZUCsTIdOhBcem
	dpEmYY7011YWfst8rjKbo/3vBvGj5R/0y+ZSUSmwIAQTQvJWhul1
X-Google-Smtp-Source: AGHT+IEDdUkbXKnxujsmYX9exMhMs6FS/KZ5YYHR//YNh6qEBbfieJsIHl4Cdu6SHu/t7EAhsRWTfQ==
X-Received: by 2002:a05:6870:a785:b0:25e:1382:864d with SMTP id 586e51a60fabf-28ccb9e54bamr7740583fac.30.1729793025885;
        Thu, 24 Oct 2024 11:03:45 -0700 (PDT)
Received: from [192.168.1.22] (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-28c79250fc7sm3148757fac.17.2024.10.24.11.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 11:03:45 -0700 (PDT)
Message-ID: <462e098b-efca-4be1-ba5f-e44d8e3b4189@gmail.com>
Date: Thu, 24 Oct 2024 13:03:43 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 08/10] net: qrtr: Drop remote {NEW|DEL}_LOOKUP
 messages
To: Chris Lew <quic_clew@quicinc.com>, netdev@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>, Andy Gross <agross@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241018181842.1368394-1-denkenz@gmail.com>
 <20241018181842.1368394-9-denkenz@gmail.com>
 <2582b8af-e18d-4103-a703-4dbf7464746d@quicinc.com>
Content-Language: en-US
From: Denis Kenzior <denkenz@gmail.com>
In-Reply-To: <2582b8af-e18d-4103-a703-4dbf7464746d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chris,

>> @@ -560,6 +560,11 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const 
>> void *data, size_t len)
>>       if (!size || len != ALIGN(size, 4) + hdrlen)
>>           goto err;
>> +    /* Don't allow remote lookups */
>> +    if (cb->type == QRTR_TYPE_NEW_LOOKUP ||
>> +        cb->type == QRTR_TYPE_DEL_LOOKUP)
>> +        goto err;
>> +
> 
> Just curious, was this case observed? I thought we blocked clients from sending 
> this control message to remotes and I didnt think the ns broadcasts it either.

No I didn't see this in practice, so this patch is not strictly necessary.

One thing I thought about originally was to remove the check in ns.c in order to 
extend struct qrtr_lookup with the endpoint id: an application interested only 
in services on a certain endpoint could send NEW_LOOKUP with the endpoint id 
included as a CMSG header.  It made the proposal more complicated though and I 
didn't think it was really needed since QRTR_BIND_ENDPOINT was the better tool 
for this kind of use case.

Regards,
-Denis

