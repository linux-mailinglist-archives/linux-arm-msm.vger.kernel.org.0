Return-Path: <linux-arm-msm+bounces-87721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B27BCF9370
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 17:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 13EC03000B2E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 16:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBD033D4E6;
	Tue,  6 Jan 2026 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZXp++uu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17D333C1AD
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715168; cv=none; b=F7CVSD/qNO0sEJgdpf3IKthPmm2kuTRdeS+wDzxrpvU4jcixf6xbQ2TzEF4DrAgdZML7KUGyIjDSMJvdrtkRjM0NoDcf7X64FFkJ4rT65NGUVR2Y/9lxIucFPPEpa4Y2oTwyAx/+caLPUmCEzIBlHvb1mM4tkvZXbt9Z+f7T5cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715168; c=relaxed/simple;
	bh=ueCY+mvsO/KMOr22nP5/FFGdjy8fsWe2E4gnFXrWFj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFGkCfC+p7DgRLQX6tAOlYaXBJKkE502rsVUG/muPmSMPxRu3qOUIRspQiEX0w1W6I6q+qpLXvqQrs8UCYrBxXHt4eXfj8VKgg5QLQ1dJuF8tK0L2U+ulOfjavCBBejpQZtciNfY5FtvR0i6t7VsYICqGgQFIUIB9rwlDLu7xjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZXp++uu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4775ae77516so12331875e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 07:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767715162; x=1768319962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4W2C9eI4hJYiNPglW3HtAsZGvKDbpvE4vgVhhGjmOEY=;
        b=eZXp++uuwpRWjoYbziJRzgbS5I164UG9vjDY06oAHGP+jSUgf0yuCOH3hJlXOJcJeX
         oDr3lhaMjQKrosKTiO95z3KuFwC+aGyqhxMqEfr/0L5seG/zyvFbD1T4XnBEHo8eR1rN
         IBwuyyD2npDHrlKrUEgm/psZ07oMXDKtFp3L888bMbd6GeRk6h1y7Iq77XUbdGLNtfCE
         JdSgz5nqOm7s+HcrlR6/AwRxcFIJ2y2UoGSntd5Kkfp+SbjQLr9Y3hPCKgatiIpuHOZj
         azfZhw9ofLL8SK/1tleKihrR26IVNwT/GGYEFgKFdBSc5a3OTN1GOCdkCXAFCmOnzg5Z
         AOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715162; x=1768319962;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4W2C9eI4hJYiNPglW3HtAsZGvKDbpvE4vgVhhGjmOEY=;
        b=Ar+Sslx9s4hup9/fGBmyRySZnwlNTmxtAjRoUP2ibcNtbgeELtvqW/bGB1tl7W5Ly7
         a2AYuc69OKQTO5DnF1OzD+04H+OXH8dSStvbT+/1aP299IdrqlZxtKhE2pHa5VahJyDh
         v0BqQ0C+AJgUNhyxQrUb6nLhU4eja2Zinf5l1yRJe+n9Qz4qm1jmPh8MC8g+0Y3ovcsG
         xXlTPtgNte09wY9wCMuUZJr6wYtKmyDZQsy8+UqDoxwl5kFd1JooF2Kwb6e/feCPilx7
         KawczDeyvIaTcIf8uK/fwSKJGyjGIYEeTD1PWJ1U+DKTOkKvNZO2yBkTZxqj3xZ2HWSI
         Qdaw==
X-Forwarded-Encrypted: i=1; AJvYcCXpU1/k3tuWvdN5EtNPkvdpt03G6iqYklk6/z2TMdEcmc7EKWEAqe5F1M9zLiDWot7xS1+a4vePhZ58sr7T@vger.kernel.org
X-Gm-Message-State: AOJu0YxA2c5zl8vXRnHdmqJ36iDk6Uwz2nLFEmWn3qqBOS+99ibDhPsj
	gvuX1RlVIUnKYvmtrqIrUkFrSHaii6xHfQRU29iZpoXel2smSG3s2Ho19Cpx+WSbil8=
X-Gm-Gg: AY/fxX6QlnvkndnZn/KRHiykrDGKweSJeIz+slojvuVSnR+hMI2emTUd+AsUzcIAKWx
	LV9OdNECChkYvMRvaD6H0X/yC7UItHJModicoSyMwhjwuqQ06aAY0pIhWjaLqXq44G9FOI5eQu/
	cy888DcSxM1FthOWmrsIKglC2OYlGKpUonROYGxLCJfhFt6qYV/UD9vAfCXsBPzOHqB7pKDB0n0
	Y0sPBaGZw2pfebl7RLJbPkz84S2me2/Yg+BQoWrbHuefwy2APaoM46jmHP+qDygOhRWb/XXKenn
	mMVGNr79y5M/9dkB3praPVgIKPDieeIntsOKvSu5fenTgwjMh3djsismeT7qK2cv7bssZygGTrR
	2Yd4pDKPmvKfLrnNrAEv4DVLx4yUKisVsKmerxA6q8P9pQV7X74Gmq3OfrgcwuggXMnvypxny+I
	A1csQhdt6QTAk1fcuQwRpew48Inv3DZU91Nvhh9I9/IGas70qLjfw+
X-Google-Smtp-Source: AGHT+IE81MyTpOihFiXfQldR76y9pRvsvI6sUpKphTO4w8zyeJMmkWKMGOVun4In3C7kS7nyI4yt/w==
X-Received: by 2002:a05:600c:3115:b0:477:fcb:2267 with SMTP id 5b1f17b1804b1-47d7f06c695mr41487175e9.8.1767715162204;
        Tue, 06 Jan 2026 07:59:22 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d836c7923sm6621335e9.6.2026.01.06.07.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 07:59:21 -0800 (PST)
Message-ID: <c4dd688b-6b57-4dd2-9c3e-4f27e50935e8@linaro.org>
Date: Tue, 6 Jan 2026 15:59:20 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: qcom: camss: add support for SM6150 camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260106-sm6150-camss-v3-0-d1d5c4d02b0b@oss.qualcomm.com>
 <20260106-sm6150-camss-v3-2-d1d5c4d02b0b@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260106-sm6150-camss-v3-2-d1d5c4d02b0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2026 09:04, Wenmeng Liu wrote:
> +		.regulators = {},

There's no need to initialise this to the empty set.

Anyway, I'll fix it for you on application.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

