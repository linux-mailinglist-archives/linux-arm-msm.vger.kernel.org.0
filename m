Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C28A439D92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 19:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbhJYR3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 13:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233555AbhJYR3T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 13:29:19 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B88DC061767
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 10:26:57 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id t7so11624279pgl.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 10:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to;
        bh=OmG6xBntmMGXxhxyRVsLhNyobSMCMLSy44S6T9/BLCI=;
        b=M4+zk3tL83QLdghoCbDMnC1YCaQaY+H/gSNns+zWcQng5flC84EW1VPIDuQtcu6o40
         F/3fY+knz43Kj7F9oL7j9xOa87+6ZL/VsV+SpYrT/ReT/ObtrdG8XD1dswjURmvbyB90
         Uz1oRkYfWcBZnoL4YLMbTyTzxaLjDRuAMCGIeeVW+Z8Rk6LfMWzFkvtc7KEYlmH00S60
         jgNHVBf1D+QCN5sRPTyAJhPHUL3CoTS6TSZpsIh4LqhbXKIJ2E/+Nm2VJv9cedt4wnY8
         x48O3j0lrunDr6MZ+SlWX0i2Yfrj5DiHWbb5EQo4VYbevmn4MDdP4g1te7qyQ65Fq00U
         CXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=OmG6xBntmMGXxhxyRVsLhNyobSMCMLSy44S6T9/BLCI=;
        b=2hAqp1CFb8j0CwBtDy9OGtKkOATLfcNRbHYPaf6VdEsbcwyy6p6x+9Orz8+ug6JSoh
         ypF6aFBfT2miY22WAuXiVKLkXzZ5yb3MhnDLoxcGQ8pDVkKIKSuxnhAdBBvHNvalSPQ/
         sDBrxT9IL1vZ7xvyFNKXUZgjB96jQWEjFU3E/RBFVO9iC3SuAEAR9/zgArbaXQJcGSAQ
         HsUYbjvyUC0FSAZ8xunaZFOn/dWyYfWRLPhSsdID/HgvhunwuAmKBefIxKBrhTkQ+8LX
         LQ8T1ATiDaV2X1jid0czlHRSFiJiFiqiv3qnot+kHDrbn/oxiJ/tkAzcYXTRnUyp6sDR
         KSCQ==
X-Gm-Message-State: AOAM530lvxC3yoJoHCW/5L3/vzX/wOVElndtoFxZb3EH4gysIHql1dKH
        kXncHj8wLWZt7DKzYQR+iwHP4w==
X-Google-Smtp-Source: ABdhPJx52C7cZMgJJOavM1gVwcnwrSqtTXQXoGASpvY0Mkr4M2PmHJnKo7TiUrPRa2HTmIs1WNrW+A==
X-Received: by 2002:a63:df06:: with SMTP id u6mr14963526pgg.148.1635182816928;
        Mon, 25 Oct 2021 10:26:56 -0700 (PDT)
Received: from [192.168.254.17] ([50.39.160.154])
        by smtp.gmail.com with ESMTPSA id s25sm681700pfg.18.2021.10.25.10.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 10:26:56 -0700 (PDT)
Message-ID: <62da1abe-5864-7bb4-34e5-5d1251b66230@linaro.org>
Date:   Mon, 25 Oct 2021 10:26:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] media: venus: Synchronize probe() between venus_core and
 enc/dec
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211025144345.267107-1-tadeusz.struk@linaro.org>
 <72f8dd7a-66c7-fb50-db23-f98ba753af1d@nexus-software.ie>
 <bba3acc1-cfa1-0c53-75de-f4ffa0a2bc9e@linaro.org>
 <00b817a4-f1ac-6a94-5f1e-836d8d313406@linaro.org>
 <25da5210-8e1f-7183-a8e7-8584f8dd2cef@linaro.org>
 <fac70dcc-2dcc-6c1f-2f71-6936deedb091@linaro.org>
From:   Tadeusz Struk <tadeusz.struk@linaro.org>
In-Reply-To: <fac70dcc-2dcc-6c1f-2f71-6936deedb091@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jls6XvNBOfmN4HbnIy7wI2Ih"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jls6XvNBOfmN4HbnIy7wI2Ih
Content-Type: multipart/mixed; boundary="------------PwvP3wcX0N0zche0sL7en6G2";
 protected-headers="v1"
From: Tadeusz Struk <tadeusz.struk@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones
 <lee.jones@linaro.org>, Amit Pundir <amit.pundir@linaro.org>,
 John Stultz <john.stultz@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <62da1abe-5864-7bb4-34e5-5d1251b66230@linaro.org>
Subject: Re: [PATCH] media: venus: Synchronize probe() between venus_core and
 enc/dec
References: <20211025144345.267107-1-tadeusz.struk@linaro.org>
 <72f8dd7a-66c7-fb50-db23-f98ba753af1d@nexus-software.ie>
 <bba3acc1-cfa1-0c53-75de-f4ffa0a2bc9e@linaro.org>
 <00b817a4-f1ac-6a94-5f1e-836d8d313406@linaro.org>
 <25da5210-8e1f-7183-a8e7-8584f8dd2cef@linaro.org>
 <fac70dcc-2dcc-6c1f-2f71-6936deedb091@linaro.org>
In-Reply-To: <fac70dcc-2dcc-6c1f-2f71-6936deedb091@linaro.org>

--------------PwvP3wcX0N0zche0sL7en6G2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMjUvMjEgMTA6MTcsIEJyeWFuIE8nRG9ub2dodWUgd3JvdGU6DQo+PiBhZ3JlZSwg
YnV0IEkgZG9uJ3QgZGVwZW5kIG9uIG9mX3BsYXRmb3JtX3BvcHVsYXRlKCkuIFRoZSBvcmRl
cmluZyBiZXR3ZWVuIHRoZQ0KPj4gdGhyZWUgcHJvYmUgZnVuY3Rpb25zIGlzIGVuZm9yY2Vk
IGJ5IHRoZSBuZXcgc3luYyBtdXRleC4NCj4gDQo+IFRoYXQgZXhwbGFuYXRpb24gd29ya3Mg
Zm9yIG1lLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEJyeWFuIE8nRG9ub2dodWUgPGJyeWFuLm9k
b25vZ2h1ZUBsaW5hcm8ub3JnPg0KDQpUaGFua3MgQnJpYW4sIEkgYXBwcmVjaWF0ZSB0aGF0
Lg0K

--------------PwvP3wcX0N0zche0sL7en6G2--

--------------jls6XvNBOfmN4HbnIy7wI2Ih
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEb3ghm5bfkfSeegvwo0472xuDAo4FAmF26N8FAwAAAAAACgkQo0472xuDAo7L
5w/+KIcA1wadY+Phvhpq85VfXfFE8WsuJvxyBFsf8zmxvPdAMH2ncjkx5IW0VReecFYKZhc9Lgrg
WppOz9m3lWM50mCDpVhSpoGy8HA6SPwRAXM0M06H1PHlbktOyM/J6fVRuzQKRKxBAiqm+dukibvx
6nVKLI20mdUt9uBA2yirgpV3WyNw8FVgMYc8cBZ0aCmkaVfDndlm3eJjrEanAiV9ximqQ89ZAVJO
FvtH8d/HNvAHR0mQ3SWvHUSq4D+SlfiG2toPP9Wnf0PbYDnNLjJIt4+Dzgf+hEF606Vq/e/xtI5K
UTELdC0sZ0kgDiaUDGvPGE09CyHl1Rd9YnLK0RnnEsoH5+VrzqmITXkcH/sQoC+jKMOdufriURC7
5nmbJqD4qJzWB7Pg018zdRXiH81zCyEKhNDkD/U8MZi4m6H0EtGoKcyCGe4XALjrIng1AbsCc6rR
VYcVg3IpxAmT4T25fhDrx4EnEX2zlWxoYGVDz3ZLCDFU0+fFLReyKBJfOydqiH6GfZQxEFstcPjf
oYK4XmgKD7ix0C4uy7XpspCeZZOd9BGEKTL7lKymRlX8S8gCzJDwYmraDSaUq4ZbOTZjejjm3xcK
Yhi5VmDk16wWZwco1Snq3Abv0z0rA81V0DWmvPIjXkUvG5LCSZiUDjY2GqoaS2BUt2gPosEJ2dMH
8cY=
=v5Ur
-----END PGP SIGNATURE-----

--------------jls6XvNBOfmN4HbnIy7wI2Ih--
