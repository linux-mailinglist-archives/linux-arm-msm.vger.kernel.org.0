Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08172F429D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 04:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbhAMDnQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 22:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbhAMDnP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 22:43:15 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868E0C061794
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 19:42:34 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id m10so993902lji.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 19:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:references:in-reply-to:mime-version:thread-index:date
         :message-id:subject:to:cc;
        bh=DDu89Hw4nMbSjqOu+bYs5lgY2e9wnRfXsj2jkpqOcLo=;
        b=DUt5sKTeAnW3Vx0KqRSIpYjG1TE5TkHbKkOXRLzp7L8F75atWhVpKDCrPba13gilbC
         cmqX4ZujR8ZzcCQ0RrcobbsoH5mMABSJ3JvucKrVV6ce9OX7lItui1MIE+QUvZ43W7sX
         jQuYYv7N9suofw22ENAX1igh6urGhhkoGLpUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:references:in-reply-to:mime-version
         :thread-index:date:message-id:subject:to:cc;
        bh=DDu89Hw4nMbSjqOu+bYs5lgY2e9wnRfXsj2jkpqOcLo=;
        b=ofJf1FE/lJliQssST1uHCsvEoo/JgSFybIxGg202G+/yzXUIrydr5/dGU8820xWys4
         Y3luTohXXlO5GAwoz6QJ48BZ3bFAq8WaLuBPfYJXPQEa6U1/TDpEZDh9GXK1ioJpXHE8
         /bM/lzWOj+wScjwm0fIdtV8fiEQh21O5H0d2qUWkJQxc5NJxyXWFb6wevxbG1ijsycBo
         LAfCrWuTABPtGEDrNZZDUIKmSa+g2Y8g4mDTF4w+HS6+eWrS6itb3Nh++UoH/eq3akGD
         IQOHEnbJp6pJCHbbOti1LnUyD+3yHIqXvrxmEiPi6aKFah5QINUDD1ECdyYpi6z76cA/
         KiEA==
X-Gm-Message-State: AOAM531M4D1p9CKmazSG2gLu9K2JIxot9Ixla9TrfQpepTYq2C2EOdUq
        HMWO96sPs6C5TjY4KQb8vicoAVXcrQP+PZQveMQbvE80cy9T5rx3J44l0muPnT4xrbLRxP6Fsyp
        fUhUi+Y0e7b7D8Asv2XPj/Fq+YOv4tHSN
X-Google-Smtp-Source: ABdhPJz/9p+Jo7pPqEMN9WU5cLjsxTRkyhjHgsDxaRqqaieIN1ZN2xsUyhVUbm3GUDC3Lr+Noyqs2pzZ63JvR1k3sOM=
X-Received: by 2002:a2e:87cb:: with SMTP id v11mr35622ljj.218.1610509351435;
 Tue, 12 Jan 2021 19:42:31 -0800 (PST)
From:   Bharat Gooty <bharat.gooty@broadcom.com>
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
 <20201016090833.1892-2-thunder.leizhen@huawei.com> <20201128045328.2411772-1-f.fainelli@gmail.com>
 <CAK8P3a1_5RgcPz+bgo1bbUBk8NTJd=1-Y5-=CsQYkFgLfTE3_A@mail.gmail.com>
 <9c6c6b7e-8c39-8c49-5c87-9b560c027841@broadcom.com> <CAK8P3a2XYk8D80XARrpUSBHk1yye3KHXOdaQge4HNSZZOC=xKw@mail.gmail.com>
 <CACvutz9v+TBUbrCo3X-u5ebbs04nR0y0yQN3qWfSAyZVy9RM2g@mail.gmail.com>
 <c38cf11a-ed1d-d150-52fb-e3b4a0a30712@gmail.com> <CAK8P3a1TViQopQNFE4+Dtac0v2CneGiy22WYu5BuYv8HX2r8Lg@mail.gmail.com>
 <18112862-a42e-95b1-39a3-2e414667f39b@broadcom.com> <CAK8P3a2+EfOKAo3HLb+_qd-gnqWD55dyW0juSw1TM8jHKiZYoQ@mail.gmail.com>
 <8aaa7bb9-a81e-cd0e-8e67-360515313748@broadcom.com>
In-Reply-To: <8aaa7bb9-a81e-cd0e-8e67-360515313748@broadcom.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJYRwz9pX5Jyucm5rMpslCh5CnEKgGJZVBeAXR0S0UA+QcFwQHWxQyrA0A9aRsBP+20OgJY+tGwAUXdy2oCZFV8YgIHX276AswAQI+oeQmyEA==
Date:   Wed, 13 Jan 2021 09:12:28 +0530
Message-ID: <3fc2b0174965ec6b911ab4bd73da1525@mail.gmail.com>
Subject: RE: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by
 empty dma-ranges
To:     Ray Jui <ray.jui@broadcom.com>, Arnd Bergmann <arnd@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Scott Branden <sbranden@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Bharat Gooty <bharat.gooty@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000d103a305b8bfed50"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--000000000000d103a305b8bfed50
Content-Type: text/plain; charset="UTF-8"

Hello Ray,

I had cross checked with Design and integration team.
Yes we can set the "dma-rages" to 40 bit DMA ranges. Tested, it is working.

Thanks,
-Bharat

-----Original Message-----
From: Ray Jui <ray.jui@broadcom.com>
Sent: Wednesday, January 13, 2021 2:28 AM
To: Arnd Bergmann <arnd@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>; Bharat Gooty
<bharat.gooty@broadcom.com>; devicetree <devicetree@vger.kernel.org>;
linux-kernel <linux-kernel@vger.kernel.org>; Arnd Bergmann <arnd@arndb.de>;
Scott Branden <sbranden@broadcom.com>; Ray Jui <rjui@broadcom.com>;
linux-arm-msm <linux-arm-msm@vger.kernel.org>; Andy Gross
<agross@kernel.org>; Bjorn Andersson <bjorn.andersson@linaro.org>; Rob
Herring <robh+dt@kernel.org>; bcm-kernel-feedback-list
<bcm-kernel-feedback-list@broadcom.com>; Zhen Lei
<thunder.leizhen@huawei.com>; linux-arm-kernel
<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused
by empty dma-ranges



On 1/12/2021 12:40 PM, Arnd Bergmann wrote:
> On Tue, Jan 12, 2021 at 7:28 PM Ray Jui <ray.jui@broadcom.com> wrote:
>> On 2020-12-15 7:49 a.m., Arnd Bergmann wrote:
>>> On Tue, Dec 15, 2020 at 4:41 PM Florian Fainelli <f.fainelli@gmail.com>
>>> wrote:
>>>>
>>>> On 12/15/2020 5:19 AM, Bharat Gooty wrote:
>>>>> Since the IOMMU is disabled and DMA engine is on 32-bit bus, We can
>>>>> not
>>>>> give the complete DDR for the USB DMA.
>>>>> So restricting the usable DAM size to 4GB.
>>>>
>>>> Thanks, can you make this a proper patch submission along with a Fixes:
>>>> tag that is:
>>>>
>>>> Fixes: 2013a4b684b6 ("arm64: dts: broadcom: clear the warnings caused
>>>> by
>>>> empty dma-ranges")
>>>
>>> Yes, that would be helpful, though I would appreciate a better
>>> description
>>> that explains what is actually going on: is it the device or the bus
>>> that
>>> has the 32-bit limitation, and if it is indeed a bug in the device, why
>>> do
>>> you pretend that this is a 64-bit device on a 32-bit bus instead (this
>>> could also use a comment in the dts file)?
>>>
>>>         Arnd
>>>
>>
>> Sorry for the delay in reply. Bharat finally got time to do some
>> investigation to confirm the following:
>>
>> These USB controllers indeed can address 64-bit. However, on the bus
>> internally, only 40-bits are connected to the interconnect of CCN. As a
>> result, the 'dma-ranges' should be modified to address 40-bit in size.
>
> a 40-bit range is effectively the same as a 64-bit range though, so I
> think you'll still need a driver quirk if the device cannot use the whole
> 40
> bit addressing but is limited to 32 bits because of a bug in its dma
> engine.
>

Bharat can correct me if I'm wrong, but I don't think we have a bug in
the USB DMA engine that causes it can only address 32-bit. I believe we
can set dma-ranges size to 40-bit here.

The dma-range property is though required to be specified, instead of
leaving it as empty, with the use of IOMMU. That seems to be a v5.10
specific behavior as I described below.

Thanks,

Ray

>> We also have a somewhat related question, is it true that since v5.10,
>> defining of 'dma-ranges' on the bus node where its child device node has
>> implication of IOMMU usage (through 'iommus' or 'iommu-map') is now
>> mandatory? My understanding is that the 'dma-ranges' in this scheme will
>> define the IOVA address to system address mapping required by all
>> devices on that bus. Please help to confirm if my understanding is
>> correct
>
> I have not actually seen that change. In general, you should always
> have a dma-ranges property in the parent of a DMA master, I think
> we just never enforced that and fall back to a 32-bit mask by default.
>
>       Arnd
>

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

--000000000000d103a305b8bfed50
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQQgYJKoZIhvcNAQcCoIIQMzCCEC8CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg2XMIIE6DCCA9CgAwIBAgIOSBtqCRO9gCTKXSLwFPMwDQYJKoZIhvcNAQELBQAwTDEgMB4GA1UE
CxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMT
Ckdsb2JhbFNpZ24wHhcNMTYwNjE1MDAwMDAwWhcNMjQwNjE1MDAwMDAwWjBdMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEzMDEGA1UEAxMqR2xvYmFsU2lnbiBQZXJzb25h
bFNpZ24gMiBDQSAtIFNIQTI1NiAtIEczMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
tpZok2X9LAHsYqMNVL+Ly6RDkaKar7GD8rVtb9nw6tzPFnvXGeOEA4X5xh9wjx9sScVpGR5wkTg1
fgJIXTlrGESmaqXIdPRd9YQ+Yx9xRIIIPu3Jp/bpbiZBKYDJSbr/2Xago7sb9nnfSyjTSnucUcIP
ZVChn6hKneVGBI2DT9yyyD3PmCEJmEzA8Y96qT83JmVH2GaPSSbCw0C+Zj1s/zqtKUbwE5zh8uuZ
p4vC019QbaIOb8cGlzgvTqGORwK0gwDYpOO6QQdg5d03WvIHwTunnJdoLrfvqUg2vOlpqJmqR+nH
9lHS+bEstsVJtZieU1Pa+3LzfA/4cT7XA/pnwwIDAQABo4IBtTCCAbEwDgYDVR0PAQH/BAQDAgEG
MGoGA1UdJQRjMGEGCCsGAQUFBwMCBggrBgEFBQcDBAYIKwYBBQUHAwkGCisGAQQBgjcUAgIGCisG
AQQBgjcKAwQGCSsGAQQBgjcVBgYKKwYBBAGCNwoDDAYIKwYBBQUHAwcGCCsGAQUFBwMRMBIGA1Ud
EwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFGlygmIxZ5VEhXeRgMQENkmdewthMB8GA1UdIwQYMBaA
FI/wS3+oLkUkrk1Q+mOai97i3Ru8MD4GCCsGAQUFBwEBBDIwMDAuBggrBgEFBQcwAYYiaHR0cDov
L29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3RyMzA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3Js
Lmdsb2JhbHNpZ24uY29tL3Jvb3QtcjMuY3JsMGcGA1UdIARgMF4wCwYJKwYBBAGgMgEoMAwGCisG
AQQBoDIBKAowQQYJKwYBBAGgMgFfMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNp
Z24uY29tL3JlcG9zaXRvcnkvMA0GCSqGSIb3DQEBCwUAA4IBAQConc0yzHxn4gtQ16VccKNm4iXv
6rS2UzBuhxI3XDPiwihW45O9RZXzWNgVcUzz5IKJFL7+pcxHvesGVII+5r++9eqI9XnEKCILjHr2
DgvjKq5Jmg6bwifybLYbVUoBthnhaFB0WLwSRRhPrt5eGxMw51UmNICi/hSKBKsHhGFSEaJQALZy
4HL0EWduE6ILYAjX6BSXRDtHFeUPddb46f5Hf5rzITGLsn9BIpoOVrgS878O4JnfUWQi29yBfn75
HajifFvPC+uqn+rcVnvrpLgsLOYG/64kWX/FRH8+mhVe+mcSX3xsUpcxK9q9vLTVtroU/yJUmEC4
OcH5dQsbHBqjMIIDXzCCAkegAwIBAgILBAAAAAABIVhTCKIwDQYJKoZIhvcNAQELBQAwTDEgMB4G
A1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNV
BAMTCkdsb2JhbFNpZ24wHhcNMDkwMzE4MTAwMDAwWhcNMjkwMzE4MTAwMDAwWjBMMSAwHgYDVQQL
ExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMK
R2xvYmFsU2lnbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMwldpB5BngiFvXAg7aE
yiie/QV2EcWtiHL8RgJDx7KKnQRfJMsuS+FggkbhUqsMgUdwbN1k0ev1LKMPgj0MK66X17YUhhB5
uzsTgHeMCOFJ0mpiLx9e+pZo34knlTifBtc+ycsmWQ1z3rDI6SYOgxXG71uL0gRgykmmKPZpO/bL
yCiR5Z2KYVc3rHQU3HTgOu5yLy6c+9C7v/U9AOEGM+iCK65TpjoWc4zdQQ4gOsC0p6Hpsk+QLjJg
6VfLuQSSaGjlOCZgdbKfd/+RFO+uIEn8rUAVSNECMWEZXriX7613t2Saer9fwRPvm2L7DWzgVGkW
qQPabumDk3F2xmmFghcCAwEAAaNCMEAwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8w
HQYDVR0OBBYEFI/wS3+oLkUkrk1Q+mOai97i3Ru8MA0GCSqGSIb3DQEBCwUAA4IBAQBLQNvAUKr+
yAzv95ZURUm7lgAJQayzE4aGKAczymvmdLm6AC2upArT9fHxD4q/c2dKg8dEe3jgr25sbwMpjjM5
RcOO5LlXbKr8EpbsU8Yt5CRsuZRj+9xTaGdWPoO4zzUhw8lo/s7awlOqzJCK6fBdRoyV3XpYKBov
Hd7NADdBj+1EbddTKJd+82cEHhXXipa0095MJ6RMG3NzdvQXmcIfeg7jLQitChws/zyrVQ4PkX42
68NXSb7hLi18YIvDQVETI53O9zJrlAGomecsMx86OyXShkDOOyyGeMlhLxS67ttVb9+E7gUJTb0o
2HLO02JQZR7rkpeDMdmztcpHWD9fMIIFRDCCBCygAwIBAgIMQr/MPsTd0Ocob24DMA0GCSqGSIb3
DQEBCwUAMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQD
EypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMwHhcNMjAwOTIxMTQy
MjE2WhcNMjIwOTIyMTQyMjE2WjCBjjELMAkGA1UEBhMCSU4xEjAQBgNVBAgTCUthcm5hdGFrYTES
MBAGA1UEBxMJQmFuZ2Fsb3JlMRYwFAYDVQQKEw1Ccm9hZGNvbSBJbmMuMRUwEwYDVQQDEwxCaGFy
YXQgR29vdHkxKDAmBgkqhkiG9w0BCQEWGWJoYXJhdC5nb290eUBicm9hZGNvbS5jb20wggEiMA0G
CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDQ8V9MUtZkD6CvlCUgJ3kDr/ct+/GV34dw8zYGdBNS
WpH4W/w3Efhf6+prXaNcfY/0UaWZZM+AzEgCe68fF822mwmOtxwVAORh2FmVPe+gpmcaom+E6cia
p16UL8xN84j44KxL0JywmSAqpWCLjiYntkvirIsJyTcNLAHu8QpV/zhYZGDfcBGyilXjahQMpLYT
Q5Xqp2EGmKzI0Ack2F3IpWO5KzVVCLT3rT3Wc0eDv59EVVIJP0thqi+81g3OmC6adyDJMiMFg3I0
2usUSY3s5hIFtUAwSOKvJGOqbREJaD6Ji66FzB5cWL+vX1JJ2Bk5SX46l9ckKAGfie9QhI7VAgMB
AAGjggHQMIIBzDAOBgNVHQ8BAf8EBAMCBaAwgZ4GCCsGAQUFBwEBBIGRMIGOME0GCCsGAQUFBzAC
hkFodHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc3BlcnNvbmFsc2lnbjJzaGEy
ZzNvY3NwLmNydDA9BggrBgEFBQcwAYYxaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL2dzcGVy
c29uYWxzaWduMnNoYTJnMzBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYm
aHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBEBgNVHR8E
PTA7MDmgN6A1hjNodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzcGVyc29uYWxzaWduMnNoYTJn
My5jcmwwJAYDVR0RBB0wG4EZYmhhcmF0Lmdvb3R5QGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggr
BgEFBQcDBDAfBgNVHSMEGDAWgBRpcoJiMWeVRIV3kYDEBDZJnXsLYTAdBgNVHQ4EFgQUWZnxgHSV
1uoaXkUSmhSfFm3cC78wDQYJKoZIhvcNAQELBQADggEBADqiR0ywCb3rt7Xq60Kp94UTQ2MWXYio
sSPdrruj5GK7TPxHyiayFqdTR/65hWVh+tG4EZuU+efYC2AE4QoliICEaEBlu3C++2yUL0Fp5cNh
ROwJzkZqD4Pz9a8Q+qZj0TAAn42ZcfrsFXKU7TqDSpGyhJroSfJGAfTdPn5UqhvMu/j3JJM71NKe
uBKTzXWF5Y8kCuy2LKlD/lYKCBR8UxrktY8ODJAqcKNvOaxU3jEU146mmGk1kzwMADnJGt3zIM4R
35zQpiwNvfwDyswRQHIPLh6mztV9fkchlIHa81AsQVpUa8v4OIbFs9PrfjTB33XcR9VFHXJKdPM6
dNLjJRYxggJvMIICawIBATBtMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMTMwMQYDVQQDEypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMC
DEK/zD7E3dDnKG9uAzANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgfP5rpQBuCmNL
OWA3Ih57rPwLWNhMhITMBCDJVLGBjxowGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG
9w0BCQUxDxcNMjEwMTEzMDM0MjMxWjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglg
hkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0B
AQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAKBiw4XcYHinaCTUPkI9FNs1uBRMbBfo
ePyD8tvCN6h5IFwxZRilLzhuWzEGCUf/4L5SO3nsqoLq/Mr0OW1dugzgKVLsryBvf8oJDk9SxmbA
OmFDXengZdIPa36kQyIjYzIUdQCNrL5uYoUOjaoTAJVXNTBr1FWQZnIcjYrojUm/soQAUTbU+9rf
52gKmccB5WDjcB2eFJEsSWn7vSop+PeDXyvMVw/knAJH5kVLhqswjkCO10hsLe1VCDeKRUoZZsyW
uj+hs1rxts0CCe2mJjhv7RyCbMl+wX51CWCrxXhMhmz3b9dnWzJf3JVnZu43D7DqhEGPrdp3OVN2
8xlTnRw=
--000000000000d103a305b8bfed50--
