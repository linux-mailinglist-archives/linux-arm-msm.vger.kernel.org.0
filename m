Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E3A2425B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 08:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgHLG6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 02:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgHLG6K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 02:58:10 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9497C06174A;
        Tue, 11 Aug 2020 23:58:09 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v4so1066249ljd.0;
        Tue, 11 Aug 2020 23:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=JDo/BACFUxJcnbPKuRjxysz+ibKnzqeL4/IU1qfe/OU=;
        b=mz3OVwjODnqn65vdacVrQiFPA1vOaCAoYiB5WT6oEvEd8L8Sncni3/5D68IOlz+wTW
         HdE/UzuLQnU7UK9TUNBXbidbYiXgREpSJYrREgKn+CguVrUFT0pzK0DPQ6mYlkasmdDN
         BGxcpOZnQIBfdkcyc2lfXiq7ZNF5gWDgDlToFroW1rCbei4t90jCT5q/qO1RPDKneC58
         QMJHSL/vAmCs7geoIDSh8nXGj7xFZFgJl9s7xc10WmohgX+GBozBVThWQlahkx29S++7
         gO8DDZm9Yq2xCRtxh/2+93S0cektm0qmwB54UouGs9Nv50jYSyf13idwSRRL/XDb/7ry
         rUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=JDo/BACFUxJcnbPKuRjxysz+ibKnzqeL4/IU1qfe/OU=;
        b=sAFD5aFHkxJQSL0ORSMatdKa1c3ji9VBPgcDczqG5NNSnjkvJRUzKQEfINTddC9UVx
         ATbofgPPwC8ASkvrm0xPcgithZoUJUX9CO0z1roa8wYkqEbn0vgypQBzaYLKbgWkKOIn
         lpnCTtb+UA5LCFeZh7ibhlZ+BVTe5I0C7O9cp70Tr0+OHDuF/e66FPddN2zMb/IrQ1hQ
         sQHU+w//r6Eqz4OZz5B5JJ3inZga9DHpn4KHs4+xw0WBLSWeAcQ3RkE2w/BwDM/uE8pT
         EjQp7z/x0oFIOovFCjmZPhjECCVzKi/JXc9WaHx6WCMldKInosg0MfNTZcFMLosrx8nJ
         fcNA==
X-Gm-Message-State: AOAM531ax39K39AX7DiCyRvc0kqSMnVq7EYS42lSLsap/UkP23+oEXuR
        E5SWYqe/0STT6zkmJuQubQMBGTJ2ROg=
X-Google-Smtp-Source: ABdhPJx+BrV4abo+2L2SpPIELjzqPN1tFHwc9ZdV9OZvI8hh2TNoDpuM4R8+7/Do3EaLSNt66fHsxQ==
X-Received: by 2002:a2e:85d3:: with SMTP id h19mr5005266ljj.363.1597215488366;
        Tue, 11 Aug 2020 23:58:08 -0700 (PDT)
Received: from saruman ([194.34.132.58])
        by smtp.gmail.com with ESMTPSA id k12sm238314ljh.95.2020.08.11.23.58.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Aug 2020 23:58:07 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     "Sandeep Maheswaram \(Temp\)" <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
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
Subject: Re: [PATCH v11 1/2] usb: dwc3: qcom: Add interconnect support in dwc3 driver
In-Reply-To: <cd5c6c99-d8ee-da59-1abf-e64e5f7f6f8f@codeaurora.org>
References: <1595869597-26049-1-git-send-email-sanm@codeaurora.org> <1595869597-26049-2-git-send-email-sanm@codeaurora.org> <20200727192050.GD3191083@google.com> <cd5c6c99-d8ee-da59-1abf-e64e5f7f6f8f@codeaurora.org>
Date:   Wed, 12 Aug 2020 09:57:56 +0300
Message-ID: <87v9honyff.fsf@kernel.org>
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

"Sandeep Maheswaram (Temp)" <sanm@codeaurora.org> writes:

> Hi Felipe,
>
> On 7/28/2020 12:50 AM, Matthias Kaehlcke wrote:
>> On Mon, Jul 27, 2020 at 10:36:36PM +0530, Sandeep Maheswaram wrote:
>>> Add interconnect support in dwc3-qcom driver to vote for bus
>>> bandwidth.
>>>
>>> This requires for two different paths - from USB to
>>> DDR. The other is from APPS to USB.
>>>
>>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>>> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Please ack if you are ok with this patch.

What's the plan to get this upstream? Should I take dwc3-qcom patch and
ignore the rest? Is there a hard-dependency on something else?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8zkvYACgkQzL64meEa
mQbfthAArA2X5kasW3EQ1RHkC0s8Kj6X9CHWtuc7UnHOJu2ulKa5ARoXPQN8p1fd
mY/t/GcAZzZDppRMumqRnFEqTzNlpMMjnW9drd2F6mwo5+posxbLnaeSRf+xDS5D
/08z/fpkE5t6HVPqU/WihWTVuprRcxWVxmToP1YxYvXwfOEU/6cJfgCi2CsXp0nm
BM7FVGkMaU6aMfB/Alp34QvT81VxTr7Ex3NJpiyHvJRsp1AT1hzTxlX7BUjj15gZ
Qp4l/6w7OG8kqQISj/08k7ljq990ldyc+P1oHpXxF8AAUUonZHnWLzWKgpMTcfNN
ZpqrmdHWQrtduSz8eMCOA8Sho/kM+XGkPor/p8UGV+PtArIQ392n/+/fNcWwkh8x
yvxieFM5LoTIIEpMX9FxxMtGS0HI/n0X/AziPonfpykW1EjwvxXAutBVN7tCq+Jk
m4aLWJzTAvCkqzZm2BvInrLJvYpRNWkHvh149FEVDENh4rTWpO9lhpOjHvmJ/2M+
pwakvMKM2KsmKNaxTW+uVWaNe10hQZ97LN66FcaqP7omOSoXeYaC8V2vjlUSEvEH
PVOE797mwB+vU3yiS5DyZXBinpbucGTZ7yw8Z0A6Ud/vNWAdTBEX3sBFOu8mjBSF
z4Ji6yAJe14TzrCZSblilGQ+vOkhlAauiOTDt200wHiJgMKU7NQ=
=km0q
-----END PGP SIGNATURE-----
--=-=-=--
