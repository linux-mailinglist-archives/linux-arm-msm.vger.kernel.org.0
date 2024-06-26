Return-Path: <linux-arm-msm+bounces-24307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A08D59184C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 16:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D063B1C20E18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 14:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F5518629F;
	Wed, 26 Jun 2024 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="REqT9qCp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA2185E65
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719413141; cv=none; b=Ms+ZyZd2N4NVM4TkXb9uqC1jSG0hfclmxALqeCSaslYSRc98qWKbkiJmo8QAPyq+a1hwzD742RRmXdJ6Dl0SMa4N/hx53XVcd+NDMyILm9YFFynwXOjy/OvTLzl+XnvjRCEcT47QUj5u5dwJyFDiYIyjvN6QJAvbxWnxiVmFIfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719413141; c=relaxed/simple;
	bh=y8zm/3L1kXWTD8QfW3j4aqxxls3sAhrR+o4g6osU3lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Owftp6zB7jgOG1tIqDIN9Op/wkcVlexBksRMNL8i7RnEEEpRGz6R9cY3MtMm+m9qXNOTk5U4JUeDId+YoZi3IKtvoM9aXKddfE2DWJz/qo7fQJBqaSkaFUI4nLh7uz8uuDmKEUqoTWaTqaPysZHqeojaSAyUuxKZCz49L1gGbYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=REqT9qCp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-365663f51adso4954008f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 07:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719413137; x=1720017937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ImcCGyDE7I6yMqJMnY74qb5i8teN732/9KzoWXlhoo=;
        b=REqT9qCp5tZLzKt3q/V/izKOFnQaeGrLvZmhMeXYC4JevAPAxAJvuAN1jMG2LdPdPP
         MyIaSbTa52r2OHjxGHafER8ow8HheNogFKiOS9AjJipjG7J68g/X+aXg8+crBOAqtOhB
         ywlG7QRw0b+FfxqE2QsVxf6j1COWS6T1n7BKV1hn1/mSqbfGKhkiDCQze8t1CzppGcPO
         AEuK/RI8ectyupxygwPfLs+EBb+ud+OCat78lzmAq8UxhE1hVjLhpy4fCcXKApMjzjPC
         QpJAq3j4ckgJSFdluJcMFzuv67B1kr+MVE0r2vns1ggWiXI3bBPQ/SmOYRYlDSnz1Heo
         YOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719413137; x=1720017937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ImcCGyDE7I6yMqJMnY74qb5i8teN732/9KzoWXlhoo=;
        b=lgddMZ/hLnga65/J+rtxrPb4JejhYzMdrcFsoP4dFPc949C1KZ6WLYmmaK9xiBOv63
         nF/NAcCnywgLPKaJZ4+ASY4JsQGHJNVRTAUR7gVLCCOyUYA8UDM/whuHsMtO9/evkVs7
         I7/AMV4Ctn0uvQ/Vdbwxv3j09E02W8cze7nqoXOCxt356z4Y4fakCVR1AxtO0ntous1p
         qplMP+NwS4vAjw0Gi5Ig4uB7R5lPMyMkefhj+Dq6JkywSB85QfEXm5Q/w3rNgd1UYp7l
         Q2D6P1uKczzNRyEPWZrBq7BYciYaHtjAz7X8FgCxbVcqMzrjvB397tUOa9LxKSzSFm62
         gk4A==
X-Forwarded-Encrypted: i=1; AJvYcCUNaTUoqNtfQe3ID86WghIapyBulg7NvVi5QsbmSfORcNKj2fUslbM+XYRjTblsVbh036DWqx6yWpKaN3kjw19DcQmtrt4rWhBHRScM6Q==
X-Gm-Message-State: AOJu0YyMBL1MsIAwkhFKBLTxUoHeplgXsp0OyhaRjea4YCql1POsOaJ+
	TKVf92c6eLc2y2VfdcDEysX8Q00mOV49RDwk99H3mp4ejXLd/HXUnYphAfdXTtw=
X-Google-Smtp-Source: AGHT+IG/AlewYPc0Dy1UlBU5/51vgSl05qv7I6lz3SlZ7lI0KZGsBYKoYyPqgX6httWlcghptbIbPw==
X-Received: by 2002:a5d:526d:0:b0:35f:b7c:5330 with SMTP id ffacd0b85a97d-366e4eddc42mr7416578f8f.31.1719413137016;
        Wed, 26 Jun 2024 07:45:37 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b85cesm16336996f8f.46.2024.06.26.07.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 07:45:36 -0700 (PDT)
Message-ID: <758417e6-337f-417b-a6a6-aaad01b2f966@linaro.org>
Date: Wed, 26 Jun 2024 15:45:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] pinctrl: qcom: add sm4250 lpi pinctrl
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexey.klimov@linaro.org
References: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org>
 <CACRpkdZyupZmV+e=L0KR8ospH9P=wdUrMFvBnGXyfhLhW3-=PQ@mail.gmail.com>
 <4106f2be-be0b-4263-9e61-c3a29e837a7c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <4106f2be-be0b-4263-9e61-c3a29e837a7c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26/06/2024 14:42, Krzysztof Kozlowski wrote:
> On 26/06/2024 12:04, Linus Walleij wrote:
>> On Sat, Jun 22, 2024 at 6:49 PM Srinivas Kandagatla
>> <srinivas.kandagatla@linaro.org> wrote:
>>
>>> Add support for sm4250 lpi pinctrl.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> No major protests against v4 so patches applied!
> 
> There was a protest from Alexey, that driver does not probe correctly.
> Can you still drop it? Not sure if worth revert, though, better to fix
> incrementally.
> 
Let me send out an incremental fix for this.
These patches can go by itself.

--srini
> Best regards,
> Krzysztof
> 

