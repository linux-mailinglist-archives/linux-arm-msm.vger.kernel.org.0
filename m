Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453A11E211D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 13:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388900AbgEZLnV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 07:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388510AbgEZLnU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 07:43:20 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60090C03E97E;
        Tue, 26 May 2020 04:43:20 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e4so1596125ljn.4;
        Tue, 26 May 2020 04:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=sCpXcTRl3vsWBtClDzeRm+UY+tVeAJjr3BKAo83yXgg=;
        b=i7JdQYGOxWV80uCxES3u/NXyzKpjHyQZiq4wLGq0wuPOqfrt9TOW4ee6kULNc2yn2F
         5IZTOmy++lMyYCnZqqMaMotraN7ejj62aidN2STBdBR7wG6rdzwtizyDH6PgnlpTeMf6
         0Alu0OGTVENkkP/5dkRsJrjxC8QdWG3iQ5XNtHWyPXZQWzTLjv91Io/gQTs9e2GKk87V
         G60EjY/zxAjAacCKLmuVEOF63Hzk/AuUfXlerRFqoJ//0j12AXwGS6ttCM2vS16VP/MV
         LHhsmuozrrNTvvkdwFcS/YxUkHJJtBEI2LhzEcGD64qENU8IUNlF0S+kd9zzqQzUkdYJ
         flpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=sCpXcTRl3vsWBtClDzeRm+UY+tVeAJjr3BKAo83yXgg=;
        b=Kb0oV1qsz0bXfrmzU+gSeywi/locpNDa5SshA6f8CzwnSv4fUoIYRCQ2l3Y34bRA65
         7fzjzMMg/wmOictaSCQjRsg80cKa2FNEmfZrDKCRXUR6y/dzdIL8Ss6siDTppqYEqNVM
         3X5UgJe5TsmjesfWo2r+mDpaexFcNI14Xpq8NkKTXyZf1bYRehaquxex5EgcWtLXBl3s
         iXZ9JAd2AmQ46MKOLX/HmPvTrZqmekoAuKJtciy+4PKoPbhB63nUCVZHqnjxJ4cDIrhY
         4Zcyf2fCpROh5k8BosFSvfcDXjrSPu0vIfSK7Lr6aVoB2K/xo9JSCyq5oF6mDzYwRslj
         OYyA==
X-Gm-Message-State: AOAM532Ev6bWQf+pP5rmvxlFAuu9QadfP8x16zc100s2NAf34/L7V0xP
        FGNuffqWQHkXGSeJ2xJ+FL21Lz4F5iI=
X-Google-Smtp-Source: ABdhPJwB6hEoJNRdH7dBEep1lhwCwmRGm9m89aDzlD2NRcwbnA7TRDxS2lA424olfMemXwlDP3eGnw==
X-Received: by 2002:a05:651c:303:: with SMTP id a3mr440332ljp.414.1590493398773;
        Tue, 26 May 2020 04:43:18 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id x28sm5544167ljd.53.2020.05.26.04.43.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 04:43:18 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>,
        "Sandeep Maheswaram \(Temp\)" <sanm@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
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
In-Reply-To: <0723aee9-9ea4-dab5-e083-3cf3858a8f96@linaro.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org> <1585718145-29537-3-git-send-email-sanm@codeaurora.org> <878shu4uwk.fsf@kernel.org> <875zcy4uuj.fsf@kernel.org> <20200514171352.GP4525@google.com> <abbc3f8c-c8c9-c189-735e-f8058dab3e40@linaro.org> <87tv0h3fpv.fsf@kernel.org> <090e48d7-7988-eea1-bf39-f6820578d354@linaro.org> <87r1vl3e42.fsf@kernel.org> <20200518183512.GE2165@builder.lan> <b20775ba-7870-b0ca-7c65-d72a08fdacb2@codeaurora.org> <0723aee9-9ea4-dab5-e083-3cf3858a8f96@linaro.org>
Date:   Tue, 26 May 2020 14:43:12 +0300
Message-ID: <871rn63orz.fsf@kernel.org>
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
> On 26.05.20 14:04, Sandeep Maheswaram (Temp) wrote:
>> Hi Felipe,
>>=20
>> Please let me know how to go forward with this patch

(don't top-post!)

> Please just add a patch to fix the allmodconfig error. Felipe has
> suggested to introduce a separate patch which exports the
> device_is_bound() function. This export should precede the addition
> of interconnect support.
>
> Also regarding the "depends on INTERCONNECT || !INTERCONNECT" change,
> no "depends on" would be needed, as we just made the interconnect
> framework bool.

y'all have lost the current merge window, I guess. I'm not sure Greg
will take last minute changes to drivers base and I have already sent
him my pull request for v5.8. On the plus side, this gives you the
chance to run hundreds of randbuilds with your patches.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7NANEACgkQzL64meEa
mQZVaxAAsCP/6euxWFKWIpRzRkpKGetdAmxpRbOwuu89BRmDwQExLzTdCPRmnR+k
VSN02V1/5oMVKXrBVCVLtRj2Cd1ug+zu8guQodJ0z9P1u8se+I+MKGRHhjDMjnIE
U2h47FVxsXrUUJ0M7SJaaIGwSR2eqK3c44d75tiUrYyB/aGdJO8JJJywmP/6nyYN
ZhSdQV4XICMOJAXDnxcVQ7j24jHA10X6F7hvnBZBdgYMXxdVnXaSWaMxxR+JiziO
eGXr15rItk8sEGk+Nz0EfB4NThfjo5YmFuCxfk6/rWi+8FgQJLmV+2k12ngbMf6C
Cly8Z/J+WoJaaxkccMW1wG2h8xoEadLBjceSWDbRa8cBcoICzdoQfMMCDaROfGSB
7u+0YvsCyw+xIan9qLpOriAVCsKcX5yU6Bx/0ufNzv/7HorpzS3tM6nXbBCC23GB
XQsy5Da59ajQUhzXPRD7YqHXfY3xYSB1Y0F2G3rxt+aPZD2HJJb2eLjpqxOxkWZo
7jWEy2PA21dSb7UvXUXGakYAyEF2Q33HcL/V+7eMeWqNkoO7aE2wv1tswcjO18XB
WLesjA8lScj/MyHB2r/xu5cD8WV2MaByiY/MLTHsgfVX0xydbBQyiiay/fLlHR/1
1XIKU3j/s/byeXTLE+EwirvTUumKH5apjOgTEoB2S0qXCX6fgAg=
=dJ4W
-----END PGP SIGNATURE-----
--=-=-=--
