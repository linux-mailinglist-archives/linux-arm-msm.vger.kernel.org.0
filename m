Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC091D2E57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 13:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgENLag (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 07:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgENLag (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 07:30:36 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F17C061A0C;
        Thu, 14 May 2020 04:30:35 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id o14so3114219ljp.4;
        Thu, 14 May 2020 04:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ah//zqGVr2uq0yxwfS0temU7octJ3zdlPot3c86bBKg=;
        b=ZWiahqDG1NmV5BZmHPba70NLT3jWoiGhVL8LiWzNM5EhW7iB8gMGIHJWV5rCTG8rSo
         HQJAj/lGM8deoncy8mlMupsfxwUzmZfcH7LSJB4TBSc5VzKIqmp9ASkktLIpfvCVNc3A
         BoMwqKygagvsl3T0XOfD4ktdNoyypTKBqlGaj+q0h9E0RS2FYPE/MZptMW8/G1zMOSQW
         HVAoWBCuHRgv0LAKY8q86/wb7mFb7ezeOtSWtnkM57R2R6U0QTqBIQpwkwljLayq4+jk
         pfTZPKz/kEOk9lEBP50dMvgmYYWd9kRdtTbQY2kjDY48W1NzTDBvZQGOhiLt3kCT8Jp6
         i9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=ah//zqGVr2uq0yxwfS0temU7octJ3zdlPot3c86bBKg=;
        b=koOyuQU/wwm2FhIT6rroXW1il2D/fegpTtMkuxpKgHU+yClv9vji5dI+CgMs/OX86d
         Fc3y2zVxP7icLfiPAiowYKxaRQm5WXYA6Jw1tRN89WZzbj40k2UJFeCw+Qk/8XwO2MU9
         PH+2KIQPJIUNbiOYmh3B6yHL8dqUJL1nxuU69F7J5x8U9Q4krHORUJe+nu6RCcC3jVO/
         MZPHcqZFQr+AOuwJyHbBnjQw+5MtvrHH3L3+sSyfaqp3PVuIC3mjJ8mfPedsakuPRVIc
         z85p1xxvZu6/LwFBouuJCjkF5/zyMS30l2if9t4YuS2gQiqbM3PkppfNEETemn3KpVmf
         Efog==
X-Gm-Message-State: AOAM5315o8hDrmT/oEty2sXiBLL1JpbFe5lFr8fhXUYp6YNL+rBJ7rZq
        Y9s4lC16jd9ESp/cU8wPAK4=
X-Google-Smtp-Source: ABdhPJzBPTrOoPSmDrxxlZaojs5Gyl65qbnn/VHe5j3S87HnxSM5SrSaFP8FYBZdlRTpPyemwx7bpg==
X-Received: by 2002:a2e:a313:: with SMTP id l19mr2474879lje.133.1589455834002;
        Thu, 14 May 2020 04:30:34 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id l26sm1340749ljc.49.2020.05.14.04.30.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 04:30:33 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3 driver
In-Reply-To: <878shu4uwk.fsf@kernel.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org> <1585718145-29537-3-git-send-email-sanm@codeaurora.org> <878shu4uwk.fsf@kernel.org>
Date:   Thu, 14 May 2020 14:30:28 +0300
Message-ID: <875zcy4uuj.fsf@kernel.org>
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

Felipe Balbi <balbi@kernel.org> writes:

> Hi,
>
> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>> +{
>> +	struct device *dev =3D qcom->dev;
>> +	int ret;
>> +
>> +	if (!device_is_bound(&qcom->dwc3->dev))
>> +		return -EPROBE_DEFER;
>
> this breaks allmodconfig. I'm dropping this series from my queue for
> this merge window.

Sorry, I meant this patch ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl69K9QACgkQzL64meEa
mQZ7vhAArWjaK6Aj1DN1EzYA0n/cMOhFyrbXdSjFMQVnz2FVLtseCEoKC6OdSMLx
jGEzTYRjI+78Ypm8agyAVxlEvWvpG9z7NNNTA8yDIevNKQ47q5M/XWRsI2ueElV1
LG6mt2SdK5RH1Id4BQAIZ36/IG/CIlQiml4EJYUtT0RjNhCmP7kI73bN4bp8EH3u
8TGjNwFfguoI0RjJLXbOSIkTvYUbMFv/X3Ap5qk7sne3BBBMZkNGepGG5t8HGWHa
uFgM1IXpgVQ3Wnua5nlSjk/PYjm+Vkm/z4Tj646+cUZHyhlZNpwSlMDtrPT9euAS
7cWU4zVE2ve74Jpu2CJbVuHEpVmNSoh4zlnqDHpth8AEfiSndn4AlzkHd7ZLY1lA
ZEXGRu8aylz4/fIQMlxA1J2NiV+81zi8awOD4D4/ERBJrf5Fx5s41ChUXXynbmrx
OSube67GvjjMZdCG1gjZatIIex8pj0DMM91bDAEPvZIbr/Z1G5FwrNnoIaJpE3Xi
DT9N6CGkz+PvOpME7y/CLpOlfqYe1Js/+RkzRJ80Qwy/G1V5n7McOKSU4o7AOmZk
m40we7nmSzN+Q1KmAh0EzjtfLhrUWGMcuwRcI+p5jc40G/4dm6ySKVv9b5z+l+No
1yahDWmAwNgIDBJtRvET0vbw5F7oaCqzy+p+lKq7s/8UnxLVJNQ=
=mQ/l
-----END PGP SIGNATURE-----
--=-=-=--
