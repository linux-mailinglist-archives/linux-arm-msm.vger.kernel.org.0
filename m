Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0B419869E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 23:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgC3Vfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 17:35:51 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:32842 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728778AbgC3Vfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 17:35:51 -0400
Received: by mail-lj1-f194.google.com with SMTP id f20so19820652ljm.0;
        Mon, 30 Mar 2020 14:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=WSt+AV7Um/5j64JardkiDA0adpMNTurHI5wI61uphv0=;
        b=HIvQu3phGCWVkZ9DCay3XYK3Kfyn2+4cKzw8ERzWrog/cBnDNuZxBVUxKyh2yIw0Uq
         6b0JMiAOWxwVtl76ZbYi6ZLUCEtFkVfR2EHPUSs/6MKx9GNz3ao52n4CPLVWb7Rax/V1
         oZjrjmIBWLpuJlNhX6dctbGqG2nSKx0gjeEFAzXWOU+liFtk2Vo6WKJVVEb6zoAD0O73
         t8CVriQLM6iIMTDt7rRY6GJkLK6EBXTVlpp5Al6+zrkQJNQyrsvc18aPf4k/zYtoXaUJ
         DG/VTLjSCJgWGTCBrz+G7VgFRTK9/ANArqe4dZV/VXnOyTU3p0x8tWQlQYbTAd1Md/Gz
         vdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=WSt+AV7Um/5j64JardkiDA0adpMNTurHI5wI61uphv0=;
        b=uPFL5iOREZEWlCbRPOyVwTUaDmXd+ipMAzKLNraOewayVf/DJooHcQQTtlul5cqmYv
         3cd7Wee/kI01uSYbNVk5ViVwnUq0H4ivgFApzC5AiigjSNyVrlNsg8lu41zE7BNK0Z9P
         zNl0n9VDnIW1qqBA1oWtsaTL05qFjsUT6YeRG8Hh3gxqiA5L7aj9XSkP5OahcwS8fzDi
         jRb1M5eDMseuN3uV/sVt2T3bY0q/UGK8UV1BUUjDtqbz+HTcdGl//9R/LF9EPXPQB07l
         ilM9iHY55XW3hv0VtFn7o9K4ECmsjWVK+aos/RXKA/qUiYPjKXzUiXNGWb8Lpj5zv7Fa
         7u2w==
X-Gm-Message-State: AGi0PuaZrhRJKlDd3hck1FWraww8StosDfCiB04E5sFDg8xwRcULjrFE
        CX4TIYGngogM+6GRZXYm3VM=
X-Google-Smtp-Source: APiQypK4zOFj7xjPNhBxV8d6hcKJ84vdq3BXLMd1kyZXNCG2zm7Q6Cm8uv46OaF0KLIsL7sjDV2RCw==
X-Received: by 2002:a2e:9252:: with SMTP id v18mr5750072ljg.114.1585604146990;
        Mon, 30 Mar 2020 14:35:46 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id p7sm7388655ljg.5.2020.03.30.14.35.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 14:35:46 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Matthias Kaehlcke <mka@chromium.org>
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
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v6 2/4] usb: dwc3: qcom: Add interconnect support in dwc3 driver
In-Reply-To: <20200330155038.GC199755@google.com>
References: <1585302203-11008-1-git-send-email-sanm@codeaurora.org> <1585302203-11008-3-git-send-email-sanm@codeaurora.org> <20200329171756.GA199755@google.com> <87h7y62r28.fsf@kernel.org> <20200330155038.GC199755@google.com>
Date:   Tue, 31 Mar 2020 00:35:41 +0300
Message-ID: <87zhbx1q6q.fsf@kernel.org>
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

Matthias Kaehlcke <mka@chromium.org> writes:
>> Matthias Kaehlcke <mka@chromium.org> writes:
>> >> Add interconnect support in dwc3-qcom driver to vote for bus
>> >> bandwidth.
>> >>=20
>> >> This requires for two different paths - from USB master to
>> >> DDR slave. The other is from APPS master to USB slave.
>> >>=20
>> >> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>> >> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
>> >> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> >> ---
>> >>  drivers/usb/dwc3/dwc3-qcom.c | 128 +++++++++++++++++++++++++++++++++=
+++++++++-
>> >>  1 file changed, 126 insertions(+), 2 deletions(-)
>> >>=20
>> >> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qco=
m.c
>> >> index 1dfd024..7e85fe6 100644
>> >> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> >> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> >>
>> >> ...
>> >>
>> >> +/* To disable an interconnect, we just set its bandwidth to 0 */
>> >> +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
>> >> +{
>> >> +	int ret;
>> >> +
>> >> +	ret =3D icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
>> >> +	if (ret)
>> >> +		return ret;
>> >> +
>> >> +	ret =3D icc_set_bw(qcom->apps_usb_icc_path, 0, 0);
>> >> +	if (ret)
>> >> +		goto err_reenable_memory_path;
>> >> +
>> >> +	return 0;
>> >> +
>> >> +	/* Re-enable things in the event of an error */
>> >> +err_reenable_memory_path:
>> >> +	ret =3D dwc3_qcom_interconnect_enable(qcom);
>> >
>> > This overwrites the error that led to the execution of this code path.
>> > The function should return original error, not the result of the
>> > _interconnect_enable() call.
>> >
>> > I saw Felipe queued the patch for v5.8. I think the main options to fi=
x this
>> > are:
>> >
>> > - a v6 of this patch to replace v5 in Felipe's tree (which IIUC will b=
e rebased
>> >   anyway once there is a v5.7-rc)
>> > - send the fix as a separate patch
>> > - Felipe amends the patch in his tree
>> >
>> > Felipe, what would work best for you?
>>=20
>> Let's go for a v6, which commits should I drop? I can't find anything
>> related to $subject in my queue:
>>=20
>> $ git --no-pager log --oneline HEAD ^linus/master -- drivers/usb/dwc3/dw=
c3-qcom.c
>> 201c26c08db4 usb: dwc3: qcom: Replace <linux/clk-provider.h> by <linux/o=
f_clk.h>
>
> I thought I saw a "queued for v5.8" message from you, but can't find that=
 back.
> I guess I saw the "queued" message for the "Add USB DWC3 support for SC71=
80"
> series and thought it was for this one. Sorry for the confusion.

no worries :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6CZi0ACgkQzL64meEa
mQY+7g/+KJ/u05ouSFK7ldMY2YfeD/JN7oamyhJSMtVd+EDFXyzVBYcSRD4m+P2c
l0L8DLKvPTfQ609Gc0B4RBra2tg1H7m2vGdKPbGIDxWXQoMyIXFYp7E7b8+UjJ87
MNSwuzqyvC8ZFOd0ILPecBxUjFzdzEPhbHr2W6jdyfT5kIl4wcAxchcTGnus8ujb
KlwUWUjyuGyX5r7axrdjXe55MS2aouKtYQLojXtwhVyegGS0xlJtVF5+so2l89v9
GAgDe9Srw9eNfg/pmNHjK+PwRjkKLFnGiT/m4jPCb5roRWmX8P83JnA3rp+DCjpF
+plyrINP+MjoWH+rl1eifOSmTktORDFzyHEdfx2O38XYxHMjD1ap6OhOEc2WveY9
f0G/eRN7DctjpxFwp6IBDywhUgSo5YH/L3q2ojaG0AfBgxD42hCdTU7OWFepvhab
DFldPJwBjqbVupLSMEzOmgvM9wnBuqzXERzcEncl19f7Sh1vx6NFqY+5/iABFJKQ
0hhWlQ+DRrGWKxam9ft0ddEtco+Nla2IOVr2vk63DysSKkGEbQeU8a4BxJ9kY/Jo
hZCMdci6ePlYa63VCrZ+u1F6+DSRQ9lvPxjnUmy4T7InCL1dOezT6WttAgB1DO1T
oX1o6+tY1DlUOemO6Mlg0ueBWg59hZYTeg2NSVbal5VoMzO9BSk=
=lyM0
-----END PGP SIGNATURE-----
--=-=-=--
