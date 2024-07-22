Return-Path: <linux-arm-msm+bounces-26786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AB5938D3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6790B23C2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7446F16D9AD;
	Mon, 22 Jul 2024 10:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gW8nv4HT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BCB16D336
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642736; cv=none; b=hV+c7IT7wHtQy//B7HM2VwT/tb+N9HHBbRkwe1UNRrmTBXG3HfB4a7zswmKhylZP/j1k7JfwHxSdyaTKAZcW9VPjRHq58xGn7Ms0RlqAjI9bXgjUT+iNVLzjp0ZGRRTK8Rrlj8pAcSC/b6mfOV9XTGeMb60Xa4nXtHmRKb1Pr7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642736; c=relaxed/simple;
	bh=mBatEs/i1mjmH/98dysHNBUfultpLmlwOFWM7rYEgiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sEVfRcz3kF1gFxMmgm66Fhz4R8AEAuUgCY6GmVt4F+t+u9O/tNLLhw7xuB1L/kU6X2Argec74gKUtkSzQ7V9ppIqjFV0eva4i/lezM5Lh5iyIuvjoA3wlYA0yzFYMG0t97Yipnxizj0p2POmZKA4IdZJ2D6wzcErTlpHywlLVgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gW8nv4HT; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5a156556fb4so3032501a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 03:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721642733; x=1722247533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3Qy1RQSlyxNtzxTY5rpUTzBxe21u5K7ph8Ilplegc28=;
        b=gW8nv4HT9JfcVqDGpnqPDcXyrUTAh+YO/YmBhMCv9nQKyjKKe5GVnTRXQQKpHnvNev
         r3plVu70SwF66nXLTAf2HehM5J7WaI++3GxxoYMNz3H/7R42GU9WXrRFtRNOQlAPahHB
         s59LZJMvsbTIMPRMX5DublqhZ+SdakGbJtSmTjGWPZ/IETDdmOrWNQ3UOK+/VPqnum4N
         p56wMq+ldMBhmmsKmnGUd4LfN48AJxaNWBEXq13iMQKUOxRwKidUDFxZJ0QTcvGpUD1K
         YVb8SzzCZvNRejDsdYWwiSmmY2ktY2dAcZr7b5PRECTN0A7l3elj++dwzs45p1AkUyCm
         411A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721642733; x=1722247533;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qy1RQSlyxNtzxTY5rpUTzBxe21u5K7ph8Ilplegc28=;
        b=ZaMQEPFBHFra35DpB9CAXiOWYuA7HZnmGhnWO9aWVxyUevV39soCBJQy52B5dJatI3
         KVzYu84peC11PxpmPnhHepLn4Y7uIV8ImjfMuN4r4QhDhNUC1z41bxudkAjeKq36BwWW
         aVhbMoCHh68ww/wLXOqHU+LnGtNtNrLan/0HyyaM4vuYIoTMwel3nbLNBSjLcXJj0an5
         HTLbM17fQ7PjhVmrVUBjzmfiTg0TXO6NZvrVh0jUu10WQ6POTDAWuAzJI8fi456nc0Lc
         RdEcAq+zK6NSC+NsKMkoFKk7u3x/RkqWk4KnOKRnonkzqD/4Zu07zIvZctxNOpRZsS8k
         e+OA==
X-Forwarded-Encrypted: i=1; AJvYcCWX2rlZOgujesRLcNO6rkJAKiYo7RiJhjlrVMJSKw3CeohGKGiDbR8qhQN7vAlopxtdoxDLA3VHLMtfIu86ed0s68M6hDLniFKWX7768w==
X-Gm-Message-State: AOJu0YxSGCnScT4e5fReFS3IEUgrzq2tGlGa0P3b9+wvCPDtQ/eQwj63
	XRYJNhOq7Es9yQYKuZiBCPGMrm/J0Aw0110dItDcVkqB+4YPYVqqkhH1A1/GCjQ=
X-Google-Smtp-Source: AGHT+IGt/hQ2ul+oUK3LX1NJyEgpaoxeGpjNrmy7o6mjEmSQX6v1AkKajv8P67KV0lb2aHSC2whHkg==
X-Received: by 2002:a05:6402:5246:b0:5a2:abcb:c4d1 with SMTP id 4fb4d7f45d1cf-5a47c17ebebmr4164498a12.34.1721642732860;
        Mon, 22 Jul 2024 03:05:32 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a3e642b647sm4760707a12.55.2024.07.22.03.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 03:05:32 -0700 (PDT)
Message-ID: <df679e65-9a8e-45ca-997f-b372326c9abc@linaro.org>
Date: Mon, 22 Jul 2024 12:05:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] arm64: dts: qcom: sm6115-pro1x: Enable MDSS and GPU
To: Dang Huynh <danct12@riseup.net>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
 <20240722-qx1050-feature-expansion-v1-6-c4d486435b96@riseup.net>
 <b902989e-148a-430c-a013-172e49733769@linaro.org>
 <15331308.O9o76ZdvQC@melttower>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <15331308.O9o76ZdvQC@melttower>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 11:17 AM, Dang Huynh wrote:
>>> +&mdss_dsi0_phy {
>>> +	status = "okay";
>>
>> No power supplies?
>>
>> Konrad
> 
> Doesn't seem to be defined anywhere on downstream, may be hardware controlled.

my downstream suggests L1b

Konrad

