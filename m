Return-Path: <linux-arm-msm+bounces-67071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5F8B15ADD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 10:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6669317BE66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 08:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5016A1DF244;
	Wed, 30 Jul 2025 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bzFWRwQJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C479228CB0
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 08:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753865160; cv=none; b=VLWPDGnHEc0gx3tvalf2xlpryq41tZMUIrj5NkaERwDiwpYjF7k9K8Jsa/zki+A0aViQsbCZJEQAICtrMjnBb0DSDlGxHAGFo0HA3m8cpwB3eroJH6mUghBgOHw1x7+FJWUkYHCoHUuJpCQKBDQ/q4ZRwmdvvuSXBGWFS/4kIik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753865160; c=relaxed/simple;
	bh=wXb9mb3IJA/sRlDOiaVm4qMN6vs2/7p445YfZx+J7zE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=JkqRzFlDkuFFC/pgIH4uTfmlGxxsYFHHiC2o+eNU6ikKlta+VkQtertz0WrxtguKn9Wtz7LkH5XMq9O5bvbYuHqSuxCikF8nQulSPCX5NbXLolfd1Y5MLGqQRW4Fndl9Q1AP0Mib0gVshyRABP7xRZ3S3liTg5ZUfzKbPULyrFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bzFWRwQJ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b78310b296so329811f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 01:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753865156; x=1754469956; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vouVbFy9H2IeEfXvCQei0Ugeqqqv+KVoaiQc9t39ZLw=;
        b=bzFWRwQJyztthkRC7vu9NDgBYokwB4cXpagl+uXMeu7iu42iijXgFFtufbZYjx9YzQ
         L3TytIjLHNvbDDBEKXN273AOyMNFk8u85VgJR/dswrRj/oRbAgChwZwZTZmyD5GAJ9Aq
         1MDEW6S4hQ7WRqyx2eZEzuAUCxq2oVNMFzd1AHshC4dUZymIGnHIUtsWiiMnrT62bUNY
         4aL+efQaDq5n8IlsEDT2KzcekNJUzrxfoMpNBTP2IpYTJ8vBfD8+5v4Z2IaETOv3Io6H
         FJAxlE1GG6945PFFmuols9dZMCU15T9egQUqH5oe3JwSd/bng1yTCw2U7qfGTkf2eeC5
         5pYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753865156; x=1754469956;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vouVbFy9H2IeEfXvCQei0Ugeqqqv+KVoaiQc9t39ZLw=;
        b=dZDByMXNp2kORCsIJBdlc5IGFecXQeqT90EugNOoX2mfn4z1ahGvNymFc+fa0PJw0V
         qfVRdB1jC69GlXf0ijfCifd59wJaRsM20gXL4a3RlVSXxOCVB8bKOuaRuPUEneNMHok/
         6QVjL/Feat3vFxkm4iDZJSjp6mWTl6ag7VqdwgMbqQxaLXaRS8uaneTjcNDuufFjLEKb
         MpPWX7OmcAq0MBe0UneaSV7Q9XAgy09tC4TNiOdL3lODLUnCGYzjbXw/iGZAIR4CHgEp
         o65mNq21dEeUyLN2JRVoEQ5WtY1TZz+Dtw55vipCcIcsPGSTYN3NflBf97rkVcL+y5Da
         SyqA==
X-Forwarded-Encrypted: i=1; AJvYcCXaUE7uFWGKXZQ3bliOMlQ3Nt1Wb+oF4YafhRVN8GGiOvhrSBaPJ9NOBARSCZ3t7schJh+dIT1gCGlAjoT/@vger.kernel.org
X-Gm-Message-State: AOJu0YwQFt1J2sDX2iB/Z5Xc7GZOLpu/JFCvBUXol/OjGpqjdBdEx/Rs
	ko0sfya3BZgohI+tm1XK5Ckomdp0JmhymRWYDyUIUuf5LVXYV2XGFMv1mnnD6HJhdlo=
X-Gm-Gg: ASbGncv4aNbN/P/1KFZZEANfcBIDsWMuXMCsPKTY0KHKKbWS3LT8rpa1gEL8p70CmO8
	dvp0417zAFfIRj+MgdkU7FJQq8VTZJwu4uylVVWGs3K70n/RVhhwrWrI25cpbzcrgjQMFX+YcmS
	bVBNe5T8KW9/lLLosHqkhlFjvugAB2i34lLIcSLlyrCFicbbK8W0oEMulROA7XA/+39kzQ+41hV
	RySJp3ZOD5J0bxKFa9Wcu4chYeaCPR/bNKR56g45770sHN4xrKb4G7L6Ins4PVj65Snn8OvqiAu
	6CImyGBoLbsQhtm0v/khxFlOr0IuXFU2zwOdLyJ0EIf/OJHZUwyC+8Fn9CAjTITMv6Av6GI/HIX
	b0z0rB75AaQH9+SlLoCLZIkj2CZcwDiv7X2CV6g==
X-Google-Smtp-Source: AGHT+IEsUJXHb9Fu+wIAFpOOr9CxkUbkz4FbUxP1vAkQqZyqMp+yCtAvMXAxm0CSLECgSmHegl1DYQ==
X-Received: by 2002:a5d:69d0:0:b0:3b7:899c:e88b with SMTP id ffacd0b85a97d-3b794fe4da0mr1639575f8f.11.1753865155466;
        Wed, 30 Jul 2025 01:45:55 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:2e51:f80e:a7b5:16f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589aefaa44sm9422155e9.20.2025.07.30.01.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 01:45:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Jul 2025 09:45:54 +0100
Message-Id: <DBP9B4ZMXOMK.1QLITVTW393YI@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: <jjohnson@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <jeff.johnson@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [question, bug] regularly disconnecting wifi on RB1 and RB2
 boards, ath10
X-Mailer: aerc 0.20.0
References: <Zgp0ym-MGzX2eSZdlkVYbgvjkJ0CzKItjaC5pafzQnj1AOZnVAqvCIZfYoK7nwDhUgOA0U8eNolNtaWXbExOAQ==@protonmail.internalid> <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org> <5df11ee4-d645-4be2-841f-715343f1b7a4@linaro.org> <CAFEp6-0zwy2JdFOvRQ5ghMwD-J6b7F5YcVKNf-5R=8XdEpGDSw@mail.gmail.com> <CAFEp6-1wO9xwisOAtv6D__nb3Uo=8_f9rHifi-JAQ0oPD+JSVg@mail.gmail.com> <DBKDAXJ0V9U0.10YYX5H5HAJBT@linaro.org>
In-Reply-To: <DBKDAXJ0V9U0.10YYX5H5HAJBT@linaro.org>

On Thu Jul 24, 2025 at 3:50 PM BST, Alexey Klimov wrote:
> Hi Loic,
>
> On Wed Jul 23, 2025 at 11:42 AM BST, Loic Poulain wrote:
>> Hi Alexey,
>>

[..]

>> Could you check if this change helps:
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c
>> b/drivers/net/wireless/ath/ath10k/mac.c
>> index c61b95a928da..4fa7dd62aeac 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -288,8 +288,10 @@ static int ath10k_send_key(struct ath10k_vif *arvif=
,
>>                 key->flags |=3D IEEE80211_KEY_FLAG_GENERATE_IV;
>>
>>         if (cmd =3D=3D DISABLE_KEY) {
>> -               arg.key_cipher =3D ar->wmi_key_cipher[WMI_CIPHER_NONE];
>> -               arg.key_data =3D NULL;
>> +               /*  Not all hardware supports key deletion operations. s=
o we
>> +                *  replace the key with a junk value to invalidate it.
>> +                */
>> +               memset(arg.key_data, 0, arg.key_len);
>>         }

So far looks good.

I didn't see any kind of GROUP_KEY_HANDSHAKE_TIMEOUT messages and long wifi
outages leaving the RB1, for instance, overnight.

I do observe some packet loss while pinging the board for a while --
around 0.1..0.6% packet loss but that might be because of my wifi network
and absence of external antenna and it is still much much better than
default behaviour.

Could you please add me to C/c when you're going to send it over?

Thank you for looking into this,
Alexey


