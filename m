Return-Path: <linux-arm-msm+bounces-19258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 024D68BD0BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 16:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39B0FB26466
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 14:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61019153583;
	Mon,  6 May 2024 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="b2tbhVl4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6879013BAC7
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 May 2024 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715007068; cv=none; b=ke4t3+6ot1p4V2dJ6nQa+pbK6/2uRX3LxbIK/tgJjU9y27Lke0HEqTrPuEVtLeBW1mbQxC43wxusUFNeKNwhoFDdMDjSucH0V5nUi2JLhudHqux3SJMlGNcwRkCl2+DrvXSEBJTh51PG9GsZ2epiAHvnqI/+cB54olD+g9XEijw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715007068; c=relaxed/simple;
	bh=7iDH+N4dqEAyUlSQDlKArZom8EBUBD3poBUiJ60lMGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b61r+mGisGpMPsP0yHYZCqJAxs6FUZbsxOl8eU92m2cqtOWbkJk4eJ8fL0hOxqhzramwZaEaL6zY4hEWyv0QQeLgoghw6xt9TKOdQfUdcPpi+slYKqX2bF0iLfhrntFeCdA+KYvB2xYCf99DfVcVaqqDg8fQgqRKuFmBU+eUefM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=b2tbhVl4; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-346359c8785so1672129f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 May 2024 07:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715007063; x=1715611863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s25nNsZfQA5RmRKiUCh/t8nrLzDrKkJ43LxgVyizmD4=;
        b=b2tbhVl4XNL7z9VJm8J6AJqim28IW0jhxwkWTsAx/md/NspgjIJYek9Qeay56dXMw+
         ZhR21uaOU4j5tv2gHf2bYFv6TYZ5+WqraxA5LQt4lK/u1qZrePN9EZjLRz2FjWNsk2ZW
         yZHiYYXlO2kN4RraJY6RPHwX41hcaSYMs3IfEOPIO9HT9vjtj6KcZCU5DUalG960k4Qt
         Bqszzh53ABam5xddvbnNIzX60v2fEJqtTS9FzDY5Mf8xJhEPp8xoc5zvF7jfpu2X20ox
         9OhucEs4gsMrE8JRyPyhn70BblHeYvs84LnIvMY41sKqTn7bE30ckx7oXtp4nrs6gu8t
         5bHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715007063; x=1715611863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s25nNsZfQA5RmRKiUCh/t8nrLzDrKkJ43LxgVyizmD4=;
        b=MQcRbyYW1mWPyf3HFi0pRQcHJ9W2obIwz+2DYYy6eZX1ksvB6CLobmLbts6ees4FcX
         HvMqCdgqF58Woa8UKYe70vG0PkZiJLqrx7I+KZcFjmzQL7Da3SlsgfM0m3jcIvt/qtHE
         uujY2EBwpD5g4QYC08icK4OaR6v9sIZEw56Rknj3hz2MZMkPmwQ825yn7CdNnFO1hjMA
         pSxG7ibQNQDxDU+CCU/VSQA0jx0LtsN/d1vaRBXGDqe1opOgonXQcwdAvgWe2MH3SblM
         H34ve2M6HAAHdyM+qvzNuK5xDir4I1v1+JVU56EVs29uXByGXFzXEB76CNUlmnr3046O
         cLTw==
X-Gm-Message-State: AOJu0Yw2i3cr+i5/29H1S1ibH3eecO29ZNR76Pa4ekt2ssfcWOX2hdr2
	LNohqNQ1QBnfdUGFQnMoAnvWWXI6xOrwxve3Pn7fTHzIzl3X4cGPP9qs6UBzW1k=
X-Google-Smtp-Source: AGHT+IFoP4sD7V1fmiJRQwVHulmnwjUmlkDpvPyjrs2aw3izXS0DOoteipwwYPOAeJK5o2JUSbOdWA==
X-Received: by 2002:adf:a29e:0:b0:34d:99ac:dcd0 with SMTP id s30-20020adfa29e000000b0034d99acdcd0mr6277700wra.49.1715007063674;
        Mon, 06 May 2024 07:51:03 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id v6-20020a5d6106000000b0034d743eb8dfsm10852322wrt.29.2024.05.06.07.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 07:51:03 -0700 (PDT)
Message-ID: <4349e7ea-380d-4c91-83be-d74983e2cdb0@freebox.fr>
Date: Mon, 6 May 2024 16:51:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: venus: add msm8998 support
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <72860c1d-7434-4be6-8c1d-9ea177602802@freebox.fr>
 <14bda891-5035-433c-888e-b3c330eeffaf@freebox.fr>
 <803b267b-9171-8234-aa3a-fba0d738a64d@quicinc.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <803b267b-9171-8234-aa3a-fba0d738a64d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2024 16:43, Vikash Garodia wrote:

> On 5/6/2024 7:17 PM, Marc Gonzalez wrote:
>
>> From: Pierre-Hugues Husson <phhusson@freebox.fr>
>>
>> Add the missing bits for msm8998 support.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>  drivers/media/platform/qcom/venus/core.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index ce206b7097541..064120127cb86 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -554,6 +554,9 @@ static const struct venus_resources msm8916_res = {
>>  	.fwname = "qcom/venus-1.8/venus.mbn",
>>  };
>>  
>> +/*
>> + * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blame/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8996-v3.dtsi#L403-414
>> + */
>
> There is no need to add the link to downstream code in comments. Please remove them.

They are needed somewhere, to double check the values.
Otherwise, it's just voodoo programming.

If not in the code, then maybe in the commit message?

Since qcom doesn't publish datasheets, downstream code
is the best we've got.

Regards


