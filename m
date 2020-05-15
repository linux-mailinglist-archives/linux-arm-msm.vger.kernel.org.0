Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE2C41D45E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 08:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgEOG3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 02:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726205AbgEOG3l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 02:29:41 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88AF0C061A0C;
        Thu, 14 May 2020 23:29:40 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a21so950152ljj.11;
        Thu, 14 May 2020 23:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Amf4MMj2VGQ1xYWqB5Hox97fpmf7o1e1Pv6Ynpzq9ZA=;
        b=jsC4kphUL2op1Q0Gul+GW8ZzHn+Fz0rAKVrK4mQufYYlRh7PR/cZXKwUGc+r5CpaSm
         nIMbq79+co4bXWG1LYPLwQiW+br8gexZXlEjaAoCTt822Fk+xsHEuBl1W9LzMtM7CNqv
         T0WXBCd1d87zMNTO4mimrV6MV1t5p5r4iy44ILOtUijNxieHe5oZ0DVXYZckx+pph1gQ
         JdYT8TK5ICJqyBnFUi9mOBYqsL5pL/Ma5VG/1wXFsF53hxNr7rQvu5JEQvSVvOcv9SDU
         9vMUAOBMN7b4VEpiDXUr92gtp3XjHEzMBlVDSXKcA+DJbPCOtX79VYLtl2hYgFYww1Ts
         8GoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=Amf4MMj2VGQ1xYWqB5Hox97fpmf7o1e1Pv6Ynpzq9ZA=;
        b=DPT2P5NEaacq7swaEsPep8WVSfUSViO5i9aQG+o3Be4rfu9TCwU+DmGw7vk3F2O4PZ
         G1Svn1pFhN8lGdSlgl16AwMtneJwzyiLryufMMa5I3E+YlJOtMnWXkI18begS7cNWmX2
         np+/ooMY0bwsjme5Yf73yHT+4IH4tt9kDVzZ6lyttR7xoRa0oMzeiqskckoVlRkbtmWe
         D0/m4KevG2PUgcPu5YzHeHBhGuWH18tLOTRqeR9MFOReXu7mMPcQA0S/yFrPG2wMUy8C
         Z1XLvdo6j6uJRJ2HZk2d8DwmKeqhDI9U/I6ThMQ9XksoYtKX+WV3Wxu3wcemN0B/0qDv
         m2Yg==
X-Gm-Message-State: AOAM533nxpA3wyVklbNCuR6iM9vvLETBHLgnNft9QZ8vchPXQvHHM7/E
        eKafBpiTTsbbm/rl/guYRow=
X-Google-Smtp-Source: ABdhPJyCsKXkodP4IvvysE0kpE+Bv7kllWtuMRULgUzrmOXWuUHVqaHLeOZ11THfL9Ig83wrRiHTyQ==
X-Received: by 2002:a2e:9605:: with SMTP id v5mr1263833ljh.102.1589524178897;
        Thu, 14 May 2020 23:29:38 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id u4sm834419lfu.81.2020.05.14.23.29.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 23:29:38 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3 driver
In-Reply-To: <090e48d7-7988-eea1-bf39-f6820578d354@linaro.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org> <1585718145-29537-3-git-send-email-sanm@codeaurora.org> <878shu4uwk.fsf@kernel.org> <875zcy4uuj.fsf@kernel.org> <20200514171352.GP4525@google.com> <abbc3f8c-c8c9-c189-735e-f8058dab3e40@linaro.org> <87tv0h3fpv.fsf@kernel.org> <090e48d7-7988-eea1-bf39-f6820578d354@linaro.org>
Date:   Fri, 15 May 2020 09:29:33 +0300
Message-ID: <87r1vl3e42.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Georgi Djakov <georgi.djakov@linaro.org> writes:
>>>>>> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>>>>>>> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>>>>>>> +{
>>>>>>> +	struct device *dev =3D qcom->dev;
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	if (!device_is_bound(&qcom->dwc3->dev))
>>>>>>> +		return -EPROBE_DEFER;
>>>>>>
>>>>>> this breaks allmodconfig. I'm dropping this series from my queue for
>>>>>> this merge window.
>>>>>
>>>>> Sorry, I meant this patch ;-)
>>>>
>>>> I guess that's due to INTERCONNECT being a module. There is currently a
>>>
>>> I believe it's because of this:
>>> ERROR: modpost: "device_is_bound" [drivers/usb/dwc3/dwc3-qcom.ko] undef=
ined!
>>>
>>>> discussion about this  with Viresh and Georgi in response to another
>>>> automated build failure. Viresh suggests changing CONFIG_INTERCONNECT
>>>> from tristate to bool, which seems sensible to me given that interconn=
ect
>>>> is a core subsystem.
>>>
>>> The problem you are talking about would arise when INTERCONNECT=3Dm and
>>> USB_DWC3_QCOM=3Dy and it definitely exists here and could be triggered =
with
>>> randconfig build. So i suggest to squash also the diff below.
>>>
>>> Thanks,
>>> Georgi
>>>
>>> ---8<---
>>> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
>>> index 206caa0ea1c6..6661788b1a76 100644
>>> --- a/drivers/usb/dwc3/Kconfig
>>> +++ b/drivers/usb/dwc3/Kconfig
>>> @@ -129,6 +129,7 @@ config USB_DWC3_QCOM
>>>  	tristate "Qualcomm Platform"
>>>  	depends on ARCH_QCOM || COMPILE_TEST
>>>  	depends on EXTCON || !EXTCON
>>> +	depends on INTERCONNECT || !INTERCONNECT
>>=20
>> I would prefer to see a patch adding EXPORT_SYMBOL_GPL() to device_is_bo=
und()
>
> Agree, but just to clarify, that these are two separate issues that need =
to
> be fixed. The device_is_bound() is the first one and USB_DWC3_QCOM=3Dy co=
mbined
> with INTERCONNECT=3Dm is the second one.

If INTERCONNECT=3Dm, QCOM3 shouldn't be y. I think the following is
enough:

	depends on INTERCONNECT=3Dy || INTERCONNECT=3DUSB_DWC3_QCOM

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6+Ns0ACgkQzL64meEa
mQbAXRAAx1nSiv+90Ab9qTZwL9hwRv7Z81MYwG4smKR+OwjyzOR7s9P7KX7OiRvx
nnoleEKaK596cmTgrFxejEKrs5ASfMh8d8r9nZyv+PALk+uIf5t/IdQ+GrzC9Odg
TaFHL1FsV63YsCL94rkhYNDlFZr9HcF0FslmbW8Edk5BrdMn7CJiihpGEj2woowc
o4R4iWfletBlWIDffYq/KnHZbNfai1NOPlS1Tqu+qLtH50UMUGYD42OehueZK8id
J9+BGUBJVx4fCHAN5KyWuOm0BKzd4c9uQJRP7Yr6jlK5Q3fG7xqlyvXC0a38eHhm
VuMCR2WATX2EhMD6zR+O+d7+od0pyaM+6pzLzVsJrj5v/235Ncwt3t8PUAESoNI/
6jvQ3TqVRfArjUU9lWIoez3t82CHbLpNW7XNgCo7aXE0YWqudek0HX1jShT86Oyg
tcdYc3EfBXQyRm893r7zD055MT75xwhfE7I+snc16b1xdPHIDvFZJo9/5Q6BmJq+
FSIBHqKOLP+s4lqAVKdmdxki1OKc8wY1K3LB8mT5ksAkaPmhqCBPJ8k8tf9ldxNC
eL+7W7Ja/cXZ5Uu/Gvv7wxP83sER6jXuGbbtxHU9GUAfVWN/0oHFa2OsXo9pxCPY
6fFr6/b0nBD+SWgIFt2ZaFgBisebVRrAVdck8I0mqcyJwbF2yMo=
=2Mnr
-----END PGP SIGNATURE-----
--=-=-=--
