Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE4B94833A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 14:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbfFQMzn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 08:55:43 -0400
Received: from mga17.intel.com ([192.55.52.151]:3200 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbfFQMzm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 08:55:42 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jun 2019 05:55:42 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2019 05:55:39 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>, alokc@codeaurora.org,
        agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND v4 0/4] I2C: DWC3 USB: Add support for ACPI based AArch64 Laptops
In-Reply-To: <20190617125105.6186-1-lee.jones@linaro.org>
References: <20190617125105.6186-1-lee.jones@linaro.org>
Date:   Mon, 17 Jun 2019 15:55:35 +0300
Message-ID: <87lfy0gym0.fsf@linux.intel.com>
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

Lee Jones <lee.jones@linaro.org> writes:

> This patch-set ensures the kernel is bootable on the newly released
> AArch64 based Laptops using ACPI configuration tables.  The Pinctrl
> changes have been accepted, leaving only I2C (keyboard, touchpad,
> touchscreen, fingerprint, etc, HID device) and USB (root filesystem,
> camera, networking, etc) enablement.
>
> RESEND: Stripped I2C patches as they have also been merged into
>         their respective subsystem.
>
> v4:
>  * Collecting Acks
>  * Adding Andy Gross' new email
>  * Removing applied Pinctrl patches
>
> Lee Jones (4):
>   soc: qcom: geni: Add support for ACPI
>   usb: dwc3: qcom: Add support for booting with ACPI
>   usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
>   usb: dwc3: qcom: Improve error handling

pushed to testing/next

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0HjccACgkQzL64meEa
mQZhsA/9GPXGmz10q8n644hKI3owpJviGwOTfR0L0fAavSjDtLvI3avmcYMZ1a+h
oYvJDVOAZNvc97WMt8JeF1Dc9rfutyq+jtmkpRwTAZ1Xy8cg+9nu1GLSaajLu/OU
kECtbgtUXf76/srOfseNyRk8aFnEW6YZXviTW0q1L6ayYhtxHibF8y1Z3ltKl8Wq
xgFLb1EeffqtNfQze/6Fg7y20XfPA2VeeJGqy+e3IFN6p4GJsRtGhLtJUObxmclR
vSaelq0UrPylodnFK+5GhcPHhXwYZKA28JNlZmw91kplKCvLHR32goJsfTY6fq4W
xTZvHn54vnQ6xoNgxQCtzpFa4A9m5Eqabsq2HzrRzha/HbzCj5kKnFIhHxLV+N4a
CGtDJzcB9nZbuspSsjTGrumTtKPKedrmwHkbxD9sWW/mMwTbavqu0MAiRqBkm/eU
v1lGqBNjIvMX+246KG/iCLvfYZjANYM84cLxz//ODfKjS67WKrIgqCFHXGflEpd0
DBjFHGtIX2JJKtCFOcSkzyxyPo4qiRvdM5wP+MStR2YNa9e+DZrd+DgRV1HlkOBR
A/r4yTd8mqlCCw7F1gkP689+zCQUhZn4SASDwWeuXtqaQigXDFYuA8gMMbVbBG/Z
ieiHtc8WmhlI11GgO5Qbj6ucJHNuzKhJcpKMeMf5d6jR1nNACdo=
=yt0c
-----END PGP SIGNATURE-----
--=-=-=--
