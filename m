Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593991D4572
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 07:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgEOFzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 01:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725899AbgEOFzB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 01:55:01 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 860F6C061A0C;
        Thu, 14 May 2020 22:54:59 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e25so895024ljg.5;
        Thu, 14 May 2020 22:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=RZ6EyBiNrwZtXyvbzHCxFWgyIztslexb29jI2BW7Kv0=;
        b=J642fWQQ1SNn1dH498G050WOzQk4Vmf5Nxc5W9Iq3SQrLIOkl8GuhWcB2TVAuRRYzH
         H72A/F6xd9rzl1ii8rFFRY48JXWFREqGhSPRbbDffux5ncAbJak25hm3x7zmPyP/pdTY
         0wq+C/dlirs1x+TBcgwdS8IVmkazSiMnJLinvIKL81IXqSoifXm30fW442eCGv9fo4zi
         NTax+cWKRg9HzYhglJpAyCh0unG4fmsck+oAZIpyqD5GN2zKZZJDc/BQCe8mUSuK9Dqr
         pRIbyF2eOMn6zjbd96CFnFSoymklXeY+CtsC1uZ1U8r7zzwm2/D7U4nv+fMfaXcgBQe7
         QvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=RZ6EyBiNrwZtXyvbzHCxFWgyIztslexb29jI2BW7Kv0=;
        b=b7D89LfRSOjzGgU9ZUnOtibzKL7zUy6bc/JYWriB3zROLkpn9k1Wg7KVVp4PBIBHMX
         vuWyqPwt469KpSqn9JIcRCljfv8DeB9PQEHvAxlyD3XlLLD6lSZ6+shzgATjbRLmjRv3
         +4/kOte+GpSf4sIZqRPp4+NAcF85o/LY7iz76FFWrYG7JgZPjxlqTuNsmqitD7ufCyVn
         VTPi0uq54GbfEvDGJdQpAi7A/KsJsi0S2m3gsKfDmQg8BqVbCAYWQrCRYUHR7cREdywC
         QPhgyFfKGf27+cMLR4gdh3vsZfwdqNfUU4xmtWlDPyTK2dRPA7L5W4ccM0pnAXnmasGr
         j/2A==
X-Gm-Message-State: AOAM530f8b3yEPYkmWa0hxZgB3xs8ze6QhLiUvk8aFqY21AJf2Pg+vYX
        eyQOwuowWYxZT75nLyDS+No=
X-Google-Smtp-Source: ABdhPJxOWv3f4QvWrJ0m2csW2F4aF1Z6XWWyIZmlmQHg7Hkz3rOnTzh5JrM8HMpKiq5b/De+de2MMQ==
X-Received: by 2002:a2e:954b:: with SMTP id t11mr1119092ljh.98.1589522097882;
        Thu, 14 May 2020 22:54:57 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id m15sm570156lji.21.2020.05.14.22.54.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 22:54:56 -0700 (PDT)
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
In-Reply-To: <abbc3f8c-c8c9-c189-735e-f8058dab3e40@linaro.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org> <1585718145-29537-3-git-send-email-sanm@codeaurora.org> <878shu4uwk.fsf@kernel.org> <875zcy4uuj.fsf@kernel.org> <20200514171352.GP4525@google.com> <abbc3f8c-c8c9-c189-735e-f8058dab3e40@linaro.org>
Date:   Fri, 15 May 2020 08:54:52 +0300
Message-ID: <87tv0h3fpv.fsf@kernel.org>
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
> On 5/14/20 20:13, Matthias Kaehlcke wrote:
>> On Thu, May 14, 2020 at 02:30:28PM +0300, Felipe Balbi wrote:
>>> Felipe Balbi <balbi@kernel.org> writes:
>>>
>>>> Hi,
>>>>
>>>> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>>>>> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>>>>> +{
>>>>> +	struct device *dev =3D qcom->dev;
>>>>> +	int ret;
>>>>> +
>>>>> +	if (!device_is_bound(&qcom->dwc3->dev))
>>>>> +		return -EPROBE_DEFER;
>>>>
>>>> this breaks allmodconfig. I'm dropping this series from my queue for
>>>> this merge window.
>>>
>>> Sorry, I meant this patch ;-)
>>=20
>> I guess that's due to INTERCONNECT being a module. There is currently a
>
> I believe it's because of this:
> ERROR: modpost: "device_is_bound" [drivers/usb/dwc3/dwc3-qcom.ko] undefin=
ed!
>
>> discussion about this  with Viresh and Georgi in response to another
>> automated build failure. Viresh suggests changing CONFIG_INTERCONNECT
>> from tristate to bool, which seems sensible to me given that interconnect
>> is a core subsystem.
>
> The problem you are talking about would arise when INTERCONNECT=3Dm and
> USB_DWC3_QCOM=3Dy and it definitely exists here and could be triggered wi=
th
> randconfig build. So i suggest to squash also the diff below.
>
> Thanks,
> Georgi
>
> ---8<---
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 206caa0ea1c6..6661788b1a76 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -129,6 +129,7 @@ config USB_DWC3_QCOM
>  	tristate "Qualcomm Platform"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on EXTCON || !EXTCON
> +	depends on INTERCONNECT || !INTERCONNECT

I would prefer to see a patch adding EXPORT_SYMBOL_GPL() to device_is_bound=
()

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6+LqwACgkQzL64meEa
mQZBeg//fCQv3kTlgIEG58i2znWQ4FsluvuUsxpT6c2Pvumr98MxZU6KQYo+914F
8anWhvq67+Nn52KaibXXnbff7jcc1wY6o/soN8EKEhVtGLJZ2K5o0YJJsj71gvf6
Ktphgmj6UDlkYa+dJdITSSKIxAFqPfwVBiC59RqA1TCKqZsVMiEfPXgmxVyxzML0
aNIcN8BEB994PM0N0nNfDCw01auhVyzkffeEywCrSRbQ/AigPGxr8KaN0hg1suLJ
1XQ6X+texaRV1Z/Mu5ivIQs76oumM15LHCHOCP3+bNH7ShQdCXoDcAJYR3IYcDQX
gSZjGAevnOEaNo9wAS2MgmZ32DnoWadekMxBICmORFlcdDjWspdqCQylUqvsyjX8
dNZcqqv5vFCVJX2vJ5wfeH16PemC+ex0GW6zI6Q1DzsjOIipJg6RsGLyVzT6JPbU
F2r+EAqCSGute04Ne2lYiCwTvdIKNj+Xudm2YxDKGeSMlj+jYboGmJMuk83Ebogf
B7MaoCWhXOlcfBrUL+9qdp9N5hBU26kGwmuoNXahnpxgKZGQUGZUmC4c6ko7YksJ
of+dSkLvbvyP71CrJAgiKyr8pBQbPgim/wxIBDxtQDZKQ9pwUx86Y/cWJT6lPSvZ
NkiXDlO/gQoq2jnPSstmuQUa8gnoCdylvsrreuAaAY/UuXimiP4=
=oYkY
-----END PGP SIGNATURE-----
--=-=-=--
