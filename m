Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B51C2DA009
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 20:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730901AbgLNTNL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 14:13:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440689AbgLNTJy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 14:09:54 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF4DBC061793
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 11:09:12 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id lb18so6843725pjb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 11:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=ZCP/0ALRf/HgY5HNdEO0pZvvTMdTEjn1hLLqNGJAjEw=;
        b=PoQnS5ivLbf92FW8pxyu1OlIVP8VmhHgtspuvvrDYXshHO+jp1Xy7faTEYmFyZMfM2
         E2TMYQOrmQzb6Gi77EVxK8wi63JIVb5LTnWWgu4drrLG/nsTCnvMczxX9+3ROiaV9CTB
         erde9dRy+VxbgONB64SZykaOjx55UK44uJsV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=ZCP/0ALRf/HgY5HNdEO0pZvvTMdTEjn1hLLqNGJAjEw=;
        b=Xon6Lz6sW3bJ8GB2VF5DUpl0ZoGH4JXbDJBVY9vb/3pWYePK9JaF1jvJpsmru7e6Vg
         xTSniqb1baUkyQ/tq6AryxYSMw8zFaU7QjtI/ExZP9Cm9cWv6a9F8/AEuEXtzFusCalP
         9fyYXK3n36ZxXr0hnB0cw3dTqtI0AlKncF0pEq+uZbabSVqy6uo4JGwJBiq/CzQXFvIi
         k1rmqw/TQbhvIXI7QwACPugHFw+pX3z55J8O7yITEhiG+29t8XCWIT6oYymfuK/uogIk
         TQKMpBywVFbsxR7Ldf7cs3pSgME0HTht6IKJTW9/62brR/snkVXd+SONf0uCJO3gicAT
         k7kQ==
X-Gm-Message-State: AOAM532NLqpPbWuIlothtGG3PJWfeLl0s5QMV1PgybXNW0g7YF5v2Ne7
        xKoZPmnIdwuRQIakv1ZCzPkWGgvtQFUOdwUcxBIwxjKxIY3QYjeRMf1PPrlX2yS14JuBKCbZcew
        yGF38HRrcamP6wKSa
X-Google-Smtp-Source: ABdhPJzxpxqQpk42267htubPx4KoBTXYBJh8D3JH+3Y+lqOVl9xIdjj0RKmNFQHcV3Xr52BApUJvCA==
X-Received: by 2002:a17:90a:f683:: with SMTP id cl3mr26833050pjb.136.1607972951894;
        Mon, 14 Dec 2020 11:09:11 -0800 (PST)
Received: from [10.136.50.213] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id y19sm20621855pfp.211.2020.12.14.11.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 11:09:10 -0800 (PST)
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by
 empty dma-ranges
To:     Arnd Bergmann <arnd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bharat Gooty <bharat.gooty@broadcom.com>
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
 <20201016090833.1892-2-thunder.leizhen@huawei.com>
 <20201128045328.2411772-1-f.fainelli@gmail.com>
 <CAK8P3a1_5RgcPz+bgo1bbUBk8NTJd=1-Y5-=CsQYkFgLfTE3_A@mail.gmail.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <9c6c6b7e-8c39-8c49-5c87-9b560c027841@broadcom.com>
Date:   Mon, 14 Dec 2020 11:09:07 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1_5RgcPz+bgo1bbUBk8NTJd=1-Y5-=CsQYkFgLfTE3_A@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000a39b2705b6716028"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--000000000000a39b2705b6716028
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US

+ Bharat

On 11/28/2020 1:58 AM, Arnd Bergmann wrote:
> On Sat, Nov 28, 2020 at 5:53 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> On Fri, 16 Oct 2020 17:08:32 +0800, Zhen Lei <thunder.leizhen@huawei.com> wrote:
>>> The scripts/dtc/checks.c requires that the node have empty "dma-ranges"
>>> property must have the same "#address-cells" and "#size-cells" values as
>>> the parent node. Otherwise, the following warnings is reported:
>>>
>>> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
>>> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
>>> its #address-cells (1) differs from / (2)
>>> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
>>> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
>>> its #size-cells (1) differs from / (2)
>>>
>>> Arnd Bergmann figured out why it's necessary:
>>> Also note that the #address-cells=<1> means that any device under
>>> this bus is assumed to only support 32-bit addressing, and DMA will
>>> have to go through a slow swiotlb in the absence of an IOMMU.
>>>
>>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>> ---
>>
>> Applied to devicetree-arm64/next, thanks!
> 
> The notification may have gone missing, but I had merged it into v5.10-fixes
> already, and as of today, it's in mainline, so you can drop it from your
> next branch, or just leave it in if you want to avoid taking things out of
> your tree.
> 
>       Arnd
> 

It looks like this patch might have caused a regression on Stingray USB.
Bharat, could you please confirm?

The fix would be to properly define the dma-ranges to be 32-bit (0x0 ~
0xffffffff) since IOMMU is disabled on this device and the device's DMA
engine is on a 32-bit bus.

Thanks,

Ray





-- 
This electronic communication and the information and any files transmitted 
with it, or attached to it, are confidential and are intended solely for 
the use of the individual or entity to whom it is addressed and may contain 
information that is confidential, legally privileged, protected by privacy 
laws, or otherwise restricted from disclosure to anyone else. If you are 
not the intended recipient or the person responsible for delivering the 
e-mail to the intended recipient, you are hereby notified that any use, 
copying, distributing, dissemination, forwarding, printing, or copying of 
this e-mail is strictly prohibited. If you received this e-mail in error, 
please return the e-mail to the sender, delete it from your computer, and 
destroy any printed copy of it.

--000000000000a39b2705b6716028
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
Gp3tsmw0Vz7IMJs6DQIm7T8CfIzeId1IIHcH02MbpO7m1Btzyz625FoBWF8CAwEAAaOCAcswggHH
MA4GA1UdDwEB/wQEAwIFoDCBngYIKwYBBQUHAQEEgZEwgY4wTQYIKwYBBQUHMAKGQWh0dHA6Ly9z
ZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzcGVyc29uYWxzaWduMnNoYTJnM29jc3AuY3J0
MD0GCCsGAQUFBzABhjFodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vZ3NwZXJzb25hbHNpZ24y
c2hhMmczME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3
dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEQGA1UdHwQ9MDswOaA3oDWG
M2h0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hhMmczLmNybDAfBgNV
HREEGDAWgRRyYXkuanVpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSME
GDAWgBRpcoJiMWeVRIV3kYDEBDZJnXsLYTAdBgNVHQ4EFgQUvUTLkCwFvnpejW/KGvdaDA31b+sw
DQYJKoZIhvcNAQELBQADggEBACMny/9Y1OPK7qwiBKBMt478eBgXnTlJ0J0HNebYcxN/l7fKIKMb
/eX/AQKIDsHeshmV2ekPU4yY/04veXx3QTgmE1bb4ksKEFEbU0LXlVPrnlgNn8M75cPymegn/2yU
r1+htd2eve3obmKc5Lrl0GP+4m72XxAOL687Aw5vRa4Lf294s+x4d+VRwUjoFTj9zyLhexWQuJv/
yX1HjSkrlIsRwi6DN0/ieL04O9aD1UNPlCC6akGnv4tgwlESh51M564qhonlfSW6La+L/aTIuQc0
88lq8s/VMBBGdc7176/v5TbNwEC/c5QYbp2n76rAmKKjhjwWmBk64yLT7CoIxk0xggJvMIICawIB
ATBtMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQDEypH
bG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMCDCUMagLNLily51ao1jAN
BglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgx+QaytdDWoTC52d9HjmB872m687S5xrw
HArfh97wIDUwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMjE0
MTkwOTEyWjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIB
MA0GCSqGSIb3DQEBAQUABIIBAJJQkXzzenr/ZpV3b4nZquRxIXgxu6twNtf+q3LCjfR8hAmxUEaW
4dfB0E4zHDIp/1wXaWQpskcyoXrTd8/eo6eqM/9C7oSQyQWxUddZPFs0JXafdVnjZGeC4kK0mMi+
C/WoEVIZVAKEuTWuR6ydDPGGh8kAgGSfwp1RhS0+DjqsUScN5Gpze4Hma3BF7Zmbe+LtPPahGk4x
OoCSERw3ijkVVqLOzMv6tpiU92Zn/YNUfRB7y7nHFGRf9ehkwz5IOygJv6oZm0Q8Y2X5Vlrh5i1Q
nLDzcX6JtDyqJXZc+Kz5dHLarUk+nvNWvCRc/RY/OKZ0cfkPUh2hP2UuVh2u3YY=
--000000000000a39b2705b6716028--
