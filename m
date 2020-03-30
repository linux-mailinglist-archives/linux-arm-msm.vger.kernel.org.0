Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 015CF197651
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 10:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729589AbgC3ITU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 04:19:20 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37673 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729576AbgC3ITT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 04:19:19 -0400
Received: by mail-lj1-f196.google.com with SMTP id r24so17100488ljd.4;
        Mon, 30 Mar 2020 01:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=7n6GKoIcVfWJLp8foyknsOYnUKfjIInXxnS+tducqOE=;
        b=HhDC5Dg6KPSi7DJz7mZelWU9zeuSfMPhxUXFE05xnHykmAZ674UTIgvEE+NGUBpfbF
         vZAy5u7zgn6W7/qyLmPqqAGzqa5O92Jkax3jcCM06hygUe3yjnLUCUKRhu2eDE8gMLLC
         coJ4IWNkKzXHLXAHKfCMOjRDkl0Ruf2+D6CsMZJS8n/ZaKtqSCAx4J4Uyc7hg4Lov2s/
         bW/ibDGIWlsNI4NQWhwmFlF4Cq+XKwjpF0sX68Hq2UIFdeVOPMYiBknyXYhcMTlUoYYP
         8F2Gvu9epY/QMjjrrru/ZSfWyaSJBi2YOhFzfI4QJp8osuOtkSXYj5SFcHEBXExViSPg
         U0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=7n6GKoIcVfWJLp8foyknsOYnUKfjIInXxnS+tducqOE=;
        b=uPBG5uA3A2PRj/J8Ig2cOqwRcfiQ5iWAyw+9vCSEmPBt0rHuyt707RQELPd/uP5WqT
         VGW6AGGF7ayFg9B+NDjvb8HSwQJrC4E1T+/9JQpm9k416YzvCpOMdv+aQ065tRtr3cA9
         3EqXLglSRDvjJ1M6N8MlIlHDi2ffZabI9jfqOvpfk6+Skwh9zgwtW50kZ9iYWXLUK8Le
         AJi/zGFT6X2eVdZXyBN1q6jGe37f79vxM89cSzVqJY1562ICS7kjDSIrx3MUHW9H5P2R
         PDLvYU9OcJ/CplnVt9UVCwBYy/ZSrSvyAJTiLgpRVW/RrCOxGB1S1haGqCtt1gaGhwIm
         IkKw==
X-Gm-Message-State: AGi0PuaI/e0hgdURDlw2023zAR++xpuO5TT+xMfEDwxXsI1Rwn0zywil
        twJu8Vh6/88YZnydtGhRBNQ=
X-Google-Smtp-Source: APiQypL5gFfQjKxdK0m1NUzUNdcTeHnsHwajmRP3HoujZtbQC+x6XUBiCnKtZlfVN0l9gZNQXEpPXg==
X-Received: by 2002:a2e:9acd:: with SMTP id p13mr6121558ljj.131.1585556356654;
        Mon, 30 Mar 2020 01:19:16 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id t1sm6445168ljo.94.2020.03.30.01.19.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 01:19:15 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
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
In-Reply-To: <20200329171756.GA199755@google.com>
References: <1585302203-11008-1-git-send-email-sanm@codeaurora.org> <1585302203-11008-3-git-send-email-sanm@codeaurora.org> <20200329171756.GA199755@google.com>
Date:   Mon, 30 Mar 2020 11:19:11 +0300
Message-ID: <87h7y62r28.fsf@kernel.org>
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
>> Add interconnect support in dwc3-qcom driver to vote for bus
>> bandwidth.
>>=20
>> This requires for two different paths - from USB master to
>> DDR slave. The other is from APPS master to USB slave.
>>=20
>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>>  drivers/usb/dwc3/dwc3-qcom.c | 128 ++++++++++++++++++++++++++++++++++++=
++++++-
>>  1 file changed, 126 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index 1dfd024..7e85fe6 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>>
>> ...
>>
>> +/* To disable an interconnect, we just set its bandwidth to 0 */
>> +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
>> +{
>> +	int ret;
>> +
>> +	ret =3D icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D icc_set_bw(qcom->apps_usb_icc_path, 0, 0);
>> +	if (ret)
>> +		goto err_reenable_memory_path;
>> +
>> +	return 0;
>> +
>> +	/* Re-enable things in the event of an error */
>> +err_reenable_memory_path:
>> +	ret =3D dwc3_qcom_interconnect_enable(qcom);
>
> This overwrites the error that led to the execution of this code path.
> The function should return original error, not the result of the
> _interconnect_enable() call.
>
> I saw Felipe queued the patch for v5.8. I think the main options to fix t=
his
> are:
>
> - a v6 of this patch to replace v5 in Felipe's tree (which IIUC will be r=
ebased
>   anyway once there is a v5.7-rc)
> - send the fix as a separate patch
> - Felipe amends the patch in his tree
>
> Felipe, what would work best for you?

Let's go for a v6, which commits should I drop? I can't find anything
related to $subject in my queue:

$ git --no-pager log --oneline HEAD ^linus/master -- drivers/usb/dwc3/dwc3-=
qcom.c
201c26c08db4 usb: dwc3: qcom: Replace <linux/clk-provider.h> by <linux/of_c=
lk.h>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6Bq38ACgkQzL64meEa
mQbEeRAAvPDxpFbHJrTEdnNciIvj9jlgCFNwT07cC4jdy6SDizMAf5ktl3burtvp
jMXU4DTnrNW5hMcU/Rp24gdyT0VhbYJs+L7sUQh1nE+h1wC41p0eUP51Kkj6O7nu
yaEhbkp/LtUlwn3YX8yfkhVfeuvA2slpMD2yStj4cH/g+8J+RnyF6s27fgGJk9TX
j6i/2nyuRI4F2BVdmjwz3OPwzoBKCWqw+iHSuYsWOS/L2Rr8wTRwpZSn7azcIu+X
jmk4KlzOkywcep7taCnM/EL4oIRCwkUDL+MNgNpiipAki61J4tVqP/dapmzVvEZ1
Ns45sqKG89rif1g9zQA2/XZOc0HvW/rE/A/Frz+R3OTQ1Y5cSvawU1hs6QiwDBcK
Ep4hnVn4U4LoBKSUU8pnybljgDNfD5D8nVNRWtRidUc0r/xok2iTJvQIYqv5IVop
GPpxjb2bh5Vv4E9vdDW4iDlOUZ95kvqxNKTICfez7xGWzeLXMOfBoqEImEBJgCCn
JXvDpM4sDzA41vXMPv0fz6b75QujVvo8nqhJlsMS6P1/bZ/166M0dWu3RW77mrJj
lNo+J1fL8O19kxm67is6U0jKx2fnVLvQoqk5Oekd7k+nG5Fcj8H0Lr3KUZeDlomy
ZujbTfC7Qr49Frtm8VVYyucavB3r1gO3gg/S685T6DuPl0iRZ4M=
=Wl6K
-----END PGP SIGNATURE-----
--=-=-=--
