Return-Path: <linux-arm-msm+bounces-9301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD08B84543A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 10:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E11D81C24CDD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 09:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2589115B11A;
	Thu,  1 Feb 2024 09:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TytMi2Tl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437FE15B119
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706780259; cv=none; b=s+A+Uvizi2XegwwIckTzoOaYgNcHy/+wMhSnhhHKFNVhzIKnqZ2txrBp6C0J5DxWqGjyzrfC1MIG1pNCTGPIubD9s+WRWXWIm+dqh2ovR3pswBrsRZZ0RTuPbaVQcbPnemXOFI5+u/1dy/c5RTIM2GPDf5AQhYCFiNMSkKIgBUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706780259; c=relaxed/simple;
	bh=JiGsiOIfkxOO+ZW8crFwwZJB+hkJn8asjEtGEv1scio=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=goFpd1TA0Xi0/K6rxRa0KUH+QUZsnZ+FeOEZEK2TkLeH2SyPzkZ/Qb1lRVI0Sijf/qeedShCLK6mpRJ2LBxqqa4w6rlyqv9/DYNsqtnHVvAA+2CZilUlV4ZWiQOtIRoGKuf2zcOPKj/8RMI7YzAsJSMde0J8ix0HPm3ljyHNpxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TytMi2Tl; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5112cb7ae27so1285666e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Feb 2024 01:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706780255; x=1707385055; darn=vger.kernel.org;
        h=organization:autocrypt:content-language:cc:to:reply-to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiGsiOIfkxOO+ZW8crFwwZJB+hkJn8asjEtGEv1scio=;
        b=TytMi2TlveRPo4p0fcQZPNXemRXQ0hoaoQWzIhW6DnjWHwkRiicnYG01l7FtJZfsFt
         j67t5zxMZ+cSbRyDlSiMdcfFUUOU+SFK2EtWzYI476u51N+2dOmUlYfuOx0FGlgNJJG1
         W41UUcDuMcVL80LO9On8JQtC+YazmjtWr66emznx50sAkOYgxm2YgC2TarOSoGn1y3K5
         /B1UPyLZ4ThU/Z5FX98ruXtRwzh+IOpmK8JtjmM6SZQ6Egpf2Tyunbv4oK1vofrIsoDw
         2b9ugFzvEkaxkxt3LstFHzQv2AzHjS8Ix8RsHIS228CNec91LnadTV0X62dgBBKvEw6U
         NOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706780255; x=1707385055;
        h=organization:autocrypt:content-language:cc:to:reply-to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JiGsiOIfkxOO+ZW8crFwwZJB+hkJn8asjEtGEv1scio=;
        b=hdgt+ZEaOGC3KJdi1bA2MPyyxz57MaQ1lKodyjWVlo+SiIK/QF9Ko3kQ1eEe/HxPaW
         J3a7UzaN0ACen8eEXVJQe0beQIzJmAOv62Kujz4sBqe05nYUPLOZv6LM+KP+hhe4TQEf
         0K6RFY+rXWrF0Bq/ld9469lGpnTTFqVy80f8eA6aHhtADCjnrsIG7MoHmSezRufLfEpy
         Ebk18O4jyaOGKi4MC9AQVDjLMf/gqCG5rnW8HnchW5lW7Hy0FmbGJ40TANgh+vtNHKyZ
         c3m8Gx/fGHPcJJ8ce4RvLTVjQgih/HOF/zsSedJUDssdseDBRUFXU5tK0NaFee5bqLkj
         VLig==
X-Gm-Message-State: AOJu0YxIYn2qRwh/dk7hPKBuEZzAfTEtbPrmu/i2Z+dHdGwB0xcJiZ5l
	GFaWHLNGT9isZcqpDojYVMFPhpLQq19eHyM2es7uNw6Fx14JOVDNBBwSOAxOycz81a0GPOOWG4b
	5adTOfQ==
X-Google-Smtp-Source: AGHT+IG+NwDp5I9Ts+zjohlQmxNP7wUbsWrI/V69WOcl28iPADhqfI3HJMy2nseEzAJlLx+SkWdW1g==
X-Received: by 2002:a19:9112:0:b0:511:1531:76aa with SMTP id t18-20020a199112000000b00511153176aamr1345012lfd.64.1706780255163;
        Thu, 01 Feb 2024 01:37:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:dc50:59dd:9613:b7b1? ([2a01:e0a:982:cbb0:dc50:59dd:9613:b7b1])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c314800b0040efc845cb6sm3919049wmo.7.2024.02.01.01.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 01:37:34 -0800 (PST)
Message-ID: <efe74937-bd6e-43eb-a2e3-9e52deb92946@linaro.org>
Date: Thu, 1 Feb 2024 10:37:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Add Audio topology firmware for Qualcomm SM8550 HDK
 platform
Reply-To: neil.armstrong@linaro.org
To: linux-firmware@kernel.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RQ1s1Zb1YC93YUVuP2pYEJsQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RQ1s1Zb1YC93YUVuP2pYEJsQ
Content-Type: multipart/mixed; boundary="------------hKEEdOvYsbkIw0bMLxDGRqDQ";
 protected-headers="v1"
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
To: linux-firmware@kernel.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
Message-ID: <efe74937-bd6e-43eb-a2e3-9e52deb92946@linaro.org>
Subject: [GIT PULL] Add Audio topology firmware for Qualcomm SM8550 HDK
 platform

--------------hKEEdOvYsbkIw0bMLxDGRqDQ
Content-Type: multipart/mixed; boundary="------------GVYF8Pn6QIiYpYxNASZOQB5q"

--------------GVYF8Pn6QIiYpYxNASZOQB5q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAxYTk1MThjNzNjNGI1NDg1NGM5
Y2Q4ZjQxNmZkM2I4ZjhlMzQ1NmU3Og0KDQogICBNZXJnZSBicmFuY2ggJ21saW1vbmNpL2Ft
ZC0yMDI0LTAxLTMwLjInIGludG8gJ21haW4nICgyMDI0LTAxLTMwIDE1OjU1OjMwICswMDAw
KQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICAgaHR0
cHM6Ly9naXQuY29kZWxpbmFyby5vcmcvbmVpbC5hcm1zdHJvbmcvbGludXgtZmlybXdhcmUu
Z2l0IHNtODU1MC1oZGstYXVkaW8tZncNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIDNiZTJlMTY1ZTUyOTlmMDE2MjAwM2Q0YzVlYWEyODMyZGE0YzMwYmM6DQoNCiAgIHFj
b206IEFkZCBBdWRpbyBmaXJtd2FyZSBmb3IgU004NTUwIEhESyAoMjAyNC0wMS0zMCAxNzoz
NjowMyArMDEwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KTmVpbCBBcm1zdHJvbmcgKDEpOg0KICAgICAg
IHFjb206IEFkZCBBdWRpbyBmaXJtd2FyZSBmb3IgU004NTUwIEhESw0KDQogIFdIRU5DRSAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KICBxY29tL3NtODU1MC9TTTg1NTAt
SERLLXRwbGcuYmluIHwgQmluIDAgLT4gMjQyOTYgYnl0ZXMNCiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQ0KICBjcmVhdGUgbW9kZSAxMDA2NDQgcWNvbS9zbTg1NTAvU004
NTUwLUhESy10cGxnLmJpbg0K
--------------GVYF8Pn6QIiYpYxNASZOQB5q
Content-Type: application/pgp-keys; name="OpenPGP_0x169AB7B1A4CFF8AE.asc"
Content-Disposition: attachment; filename="OpenPGP_0x169AB7B1A4CFF8AE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTW
xuRx8WWPGTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURT
LmS2id5wWi3lqVH4BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGG
FlfIML3sfqnIvMAxIMZrvcl9qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ET
gzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik80TZcE6f8M76Xa6yU8VcNko94Ck7iB4v
j70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEBAAHNJE5laWwgQXJtc3Ryb25n
IDxzdXBlcm5hQG5hLXByb2QuY29tPsLAeAQTAQoAIgIbIwYLCQgHAwIGFQgCCQoL
BBYCAwECHgECF4AFAlcM7XkACgkQFpq3saTP+K6OtggAs8WPVG9TvQ401g7/cBYc
Yj5fmfFQB/Ztp8SLzZJ1gkIcOgtPRyMI1XFTlylOHe20NEwFYIJEer6akVS64GaX
HpwUJOGu4Spz4W6MGdmsssdy/dWEODWCZrHhb87b+hhU1BS2imu0QibWDWsfnM0q
0213Wlk86uqzAuMpvchGPmYcVSmqvCIx24sqS0fLJh9A4/bG5+RfBwtbYTmebMrx
jkAEnd11xc12y72YeK+3jjKxtyG9Ta11tN4ceCU27T6h0qRx0x+Y2Jx4we80a/ex
qkQstSUZk17OxgBLJDyw/KbL1mcaol5ALZ6wj4vozEY+ykaIXv3DtJ+R/APC01Nv
hMLAkgQTAQIAJQIbIwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AFAk1ZB9sCGQEA
IQkQFpq3saTP+K4WIQSJ7D0FhEYhdFDyKEgWmrexpM/4rphYCAC9f2uK2PppvbqU
3hXP44ytscATjQDJ0KqOty75Se6ykWLor105FZsNdBWU6tQ8mYLpjm23foAXBJ0W
7zY8nWecN2YHB1rT/DL4LgTf4Zrg+FeyYIzULXzjGJ0SVOOU+irrU6FW0MEtuTPX
KwaTGqaxoogDWD891x5MuF4xWVeS6AAFPiz9yh77tNCpmJt6sUYO6z9sDmKBUiw5
5hMuK75QfcDBfWSHDDBxMBvrNMEecSEEl7xjolUwkjISjWsWAypIXTGOFo4LPRXn
O/a3YrRurmWJPZRVsIBUThtVtLXh68V+Yt6wuzvOR3d9O6pDbWkWPTSFHDT8I+EC
b2QGesTzwsCPBBMBAgAiBQJNWQbPAhsjBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIX
gAAhCRAWmrexpM/4rhYhBInsPQWERiF0UPIoSBaat7Gkz/iunfAIAOHpoFmFawkY
J08eQ4o44NZRy55YBY7tMyjadTehmnwrliejT1EY2HySEr8BL0r74vlLhcxiIuot
5KessWxh4mTHXgcQQRu5T8ASd+tBOXPNVaaOU/kOdso4m2nePn1Z/f2hDROZjcRz
YCy5Ti+Lcyjl3TPIaZjh9iXz0XRaTfGP1c1SJy2iS366Se7fhTDPPWg85vzrNSf/
ZhVIPhVyuugZV7Lp1ph8LU9Err21uXVDmx+CfJ8ElaSdszx6vj5itmwUJk3z7xUg
eID45qa1C71j2Ij43pEH7kWt58KZRRYpD9kfqLsxZn4yUpioV9nWUJgT/Y83q8LR
gOqydiDYf97NHVN1cGVybmEgPHN1cGVybmFAbmEtcHJvZC5jb20+wsB4BBMBAgAi
BQJNWQcCAhsjBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRAWmrexpM/4roFF
B/0aSUHX1grjtS1OxaIghietSU2nVsOA+qoH/QWRKYBUfK+Qc1VXGRThRUQ9+rW7
Qlaaaj5dqQuLf5A4GeJy1cVDAma/ejabcxHxC6+BCc4Re6DrwWR0jg560qZ81Uwz
wB0MJRwwF3PQsB5+cfN4wcvQwzUYaXDJKYUipIOi0MBPsYjB9z+rj7rjIKGXehGc
OblFGgwrRr3kIJwemkFTRZUpkJVGUwHV3F/+4UnrCcRMsbxZ7K0kRxDktnjZYpdK
UYynySjL0IrPE2MZ6rKbX8lhZIXUibT0DzQue56niuj2F6kHMmNTBLkBnFlEndM1
3tprzQO2QelqB3OnL6MDQ1CgzSVOZWlsIEFybXN0cm9uZyA8YXJtLm5laWxAbmEt
cHJvZC5jb20+wsB4BBMBAgAiBQJNWQcUAhsjBgsJCAcDAgYVCAIJCgsEFgIDAQIe
AQIXgAAKCRAWmrexpM/4rtrsCACN6apETK7ZUKtXnPpOkD/K/qViI7ZSc5MRRNef
ARiknQ2xhknrqFi1bwWQ51maXabZSvDapiDs8bWJtOpZijAJbP44kJ8hlxMie9TX
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
+ZaLA63j3T4B
=3DEiBM
-----END PGP PUBLIC KEY BLOCK-----

--------------GVYF8Pn6QIiYpYxNASZOQB5q--

--------------hKEEdOvYsbkIw0bMLxDGRqDQ--

--------------RQ1s1Zb1YC93YUVuP2pYEJsQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmW7Zl0FAwAAAAAACgkQd9zb2sjISdFo
VA/7BuyD69jb7v6xMSylFpWvqVHnLOfElst6bQ7+Amj/GqV2HiYDuu19D6XFmXmhFIijbB9VSVEr
E0d0KR6BTJnRzqtVLVxKTxzSA9ccLzJSVbs7Z6G7Du+D2O06Dc/ZYqacBlWUWQCCNUcu5YOAcE5d
ihEy2P3w9bitxyINsHA04Tvtm+l40vRvXzc0VlVYgPUk5HkC6dlJSW6egnPnXtj0xikLuafj1ebH
yQJKgAfQTjmezIlkWXJmibIMINFR7qHi0YZbU13wS+GNX402ZsWr/hpyFnycQDbxK8RzYqSG8p/8
Fsjl1izK7pcT+UHdncxHiE17++zsJF4jGh88Bb/P+dpIl/mB6SQwAMfa8GcE6uKbcCm4XmI/ZrcZ
L8TDYcpImTSX5SaN16N85Au/XB9IMW0LyZNJ2HUkrV5+3NUYMP1yktJXZeYXXy6xJMPiCdD0nfWI
rdp1pztA7X1DvG/wA7uNa7kY4wZly5xmaFK/xHbrG+jsYYcdqPGay1SHZn0652XafG61UMZLCpew
yq4A04uAU+tDvOJ3Hxedh69SKreXTveJZ0PsiAtClMyPmvqMoc3Lg7232bawPxbyzibJTCjF4mjz
cXIiF5DKfGZZxl7GzOMsSO7LyMPdPdf4MmytdP2WS47Q4yCEEJuZ4FPbKKEk9mlHAB9XSG2nvMfI
4Ts=
=br9h
-----END PGP SIGNATURE-----

--------------RQ1s1Zb1YC93YUVuP2pYEJsQ--

