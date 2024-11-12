Return-Path: <linux-arm-msm+bounces-37633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A3D9C5DAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 17:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 492B0B4675D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 15:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB68200C99;
	Tue, 12 Nov 2024 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PD201mb+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF75200B88;
	Tue, 12 Nov 2024 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731425306; cv=none; b=RBPE92GJnf1uFH/2bqGHcQ4N30XldAja7DOkr0P2gwS5AbPlHtMxtOmsYbXgJobZhbPetq76Cze1hGg+z6hOAFij/lEnh6XueDC+H7ySoPRUbYLreEtsV34cmlBdk6Law346MVngVWd6LO4rftu+ySxfuO9cR8DePPonKIgFfs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731425306; c=relaxed/simple;
	bh=06B/5dHzmYo8ngAYwiLFmDVK9ypYG7My4Hwdf/m1UbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WbTSqSQhgTdy+uTUPUFNj943ls4AiSGvBnPXO7+HhUDZz9Ves4r29uDLiDHNDlgOSgIjis7Ep0ssrMkjkvVddVw70pGnaz5gjVGDmNggrs8RZfMWQvzVwMLv7oEln7KWJvru2bc711j4n5oL+ry5TJYQ0OhD8qmyhAZ4smRGLiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PD201mb+; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9e71401844so733175466b.3;
        Tue, 12 Nov 2024 07:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731425303; x=1732030103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ayot+HwfR74CXO2T1cgPWYEBdAmHU6mQcSK5AjZEZ+g=;
        b=PD201mb+SmoVYDnu0JZYLx/azc+SRT9by7mXKZ1QC91rb/82/sX0viFy4TcaPs3p2O
         /qRI3W56F58/Yjr+cQB177NUiaA6bHQzrdIXGgVtfMYr4eWAMzEaN9IX2hzm2G/AJ2KF
         /UpHJYsqHbEZjIoy6nmbZjTlfSpO/+vy1+7fH3BR06syUEEWgqNB2tTE35vEutrNfaSg
         N6b8kouZvU09Qi0eNYXJZOzBN4vw5F3vaUvQGrGv8iYwkxbUqJcOcQfmOZo6BheyloVt
         cq22cvheE6BH2NWoKXCBfWea3RUrGiBBTzIFOwYDBuffs46u6TOCsmr3qicn56YLtLOo
         h/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731425303; x=1732030103;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ayot+HwfR74CXO2T1cgPWYEBdAmHU6mQcSK5AjZEZ+g=;
        b=kZLwaOsQAH8nvmCC9F2Z9Fe4/tuxnmr/Qizzb+pXgpWpz4pglMN9FKJ04HYNbuMia/
         qsJhbxYTbgRFoo1y/rUHaHxFUlLJydu6Z68LYrfIEiQYIxk/UKlT8DK4v3bb1UtUbdzj
         EJNa6wMqu1BOVli50A+lzlOjzqrKWM5et7tV7HPTAMmIzs26GtmUn8MBqilagNCYgfVk
         ZNvEde2/H6qRAfJEQl161oaW1BM62JHLDZqBO7J3odS4uuRMLEENBU+enki7bR91xZ4i
         dmrrFB6rf/mLR43HibZt14XU8WBUqlYlaw1HIkIUb2eGyNhjzJCISPYlRJIZ6I6Foarx
         Jx2A==
X-Forwarded-Encrypted: i=1; AJvYcCU1niB2Xk6V39TyVPaNRUNvynKsZVVBxEFfP6tbA6db7sMTnufBCre45V4GaSu7BjLsntxGVpIw0dHCXfDw@vger.kernel.org, AJvYcCWr/bHgpyZ8fw+WYKQ3lLvhNjOlxOmYcX8Hrxj7GASK0P/qbTFb6IlapvDjbV+DY2RNtObUe0mLzMxiKfyh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc3uYJfhRUyb/ockfJ6p+WgVauKRvcfekyrJ/miWfsB4L23520
	uvKU05wfP+0Mkji3gyD3sTcAM0D1/YCEEZt3w0K2qXHxWgEGC5Q3reU9FALH
X-Google-Smtp-Source: AGHT+IFk9HNfnlRuALtk4W7HEqbT7NEtlHSMqk6UkHeiuxG0PmCJQrKfLmHIBaR/9yR7cq9nw587NA==
X-Received: by 2002:a17:906:d552:b0:a9e:c4df:e3c5 with SMTP id a640c23a62f3a-a9ef0010e3cmr1550741766b.54.1731425302490;
        Tue, 12 Nov 2024 07:28:22 -0800 (PST)
Received: from [87.246.220.203] (netpanel-87-246-220-203.pol.akademiki.lublin.pl. [87.246.220.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a18b15sm730254166b.18.2024.11.12.07.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 07:28:21 -0800 (PST)
Message-ID: <34bc44c2-e1d2-4610-8a87-f20078592e7e@gmail.com>
Date: Tue, 12 Nov 2024 16:28:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a5xx: Fix dereference of pointer pdev before null
 check on pdev
To: Colin Ian King <colin.i.king@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241112132005.469357-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
Autocrypt: addr=konradybcio@gmail.com; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzSVLb25yYWQgRHli
 Y2lvIDxrb25yYWR5YmNpb0BnbWFpbC5jb20+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQW
 AgMBAh4BAheAFiEEU24if9oCL2zdAAQVR4cBcg5dfFgFAmQ5btACGQEACgkQR4cBcg5dfFhw
 JBAAp7+SFJq0oGQ21dulLrJZx1s1RfNi35SKegi+ueLOezipsfD9s2weu37/xE+PQ9ONDm39
 Uq+plABz8grTgy19N5RZnY2gQNcN335fQWq31wk6OEhr3E04hBx94eejKI9ynXJUXOddwjCm
 blrqUnAhWCq0lM2Dsj1d1qUKF2wSTiQW4aNkc6izUgmGuY26WNfD52T5RHvGi8XtCNAKI1yK
 cCTmRY0zXIdR3bp+FnJHetjwy1ScbDiruhnaad31plRy4a+CxNeplUjWecufnWYCR3xFypNE
 TZm+z23CgUVmYQPNZZGO4h0SaRxnHhsewtlC9+DSaKm+7RzfbNbGRg6kxL2YG9PEqA64LAQI
 Vl0zkuF8xyGFcPioJ5Bg9UaN8M81xPuPwrN+Sb/PXgC/RKQ59hXI6fNAHoP9XwAAus5j0oRg
 BJb/+pXX9PQGtmIKJMp9l337VuCkXk/iaZ6HNWDumdeiUDA7m3vUHWVvsF5Xna+suUOSXPZ9
 kwlbfHvfFpbuqr/VNN6qRpipx0vSvuDo5Ar4PoCuNDcHkmSlxMqqp8GG9oDi4cnl0XzirQpQ
 /rve1X50GUA7nVNagxQzvjRyZlcldVKHNIQXOR+XqEAwIGLRwqYo+iUOBZXFKHAS5EFooBJj
 7QuEwSEWg7QYvOdXZOcmZGzGQa0Iq22KJgddx+DOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <20241112132005.469357-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/24 14:20, Colin Ian King wrote:
> The pointer config is dereferencing pointer pdev before pdev is null
> checked, this could lead to a potential null pointer dereference on pdev.
> Fix this by only assinging config after pdev has been null checked.
> 
> Fixes: 736a93273656 ("drm/msm/a5xx: really check for A510 in a5xx_gpu_init")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

I'd rather drop this check, the only call chain is rather
safe here

Konrad

