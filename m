Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D24A81D2D3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 12:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgENKtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 06:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbgENKtX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 06:49:23 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A19C061A0C;
        Thu, 14 May 2020 03:49:21 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id a9so2205663lfb.8;
        Thu, 14 May 2020 03:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ihBtKopP3k1Y1JCaSjxHNdvYIfEueCdWieJSz6SvBN4=;
        b=cdbYIJYI4NcPSHfXQP07wl2UNIDAxSzXgr70FR6ySmwbSMRzx8KwYUedNTajATJy/V
         WKHUAcz8fGKYFbQKBnpHjKNb5/BtjeFwc7j+qHSH+r6CZ6GMYgkrBDx1kpCWi97NidTH
         rLPuqm07AeGkf/mjPYIMXanP0sJaGaY55Q81xIGQR/wNjOFkEdtTmIDay2rhpGrrjMmN
         qviYV4EAXvXUo1D24t+bER/5c0QLaxujdOwoxc9iwoSUSYb9Z592o6ZrpEA1Fna6UdNq
         BynEx9iqLFaPGBtBzpj5xjiWel2Ikw31NmXP/eyJrdimO2kr0qUWqZZNfNQmo+0neqix
         rrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=ihBtKopP3k1Y1JCaSjxHNdvYIfEueCdWieJSz6SvBN4=;
        b=n2kWgQbgVDxbKo2s+6TawAIoVPHUg+SxZlnzuZ0zEYcHnyIeABr27R1Ko5wfpqR5vs
         61jymtHBOuIo5g2NiVezufWLIU7LQKDD1kDvDqI1ip+1vaF9bpwRSSHEouFcb3NLbbqQ
         9yWAKH3oFxo+SytwYsvK9lycwtnsx4ynP5Kli/negXx3aAR1k1kJvx7Po/PK2p/3610M
         yctMvXAZmo2SpE4qmtOn5vL42qpSN4ghC5JE/WMLpFHhxmGs9rjcU5icJ9YtbMm4O07x
         yC4B3f33SyNOdekxewc2IUrZvf3GqyZ20LB4nfA4UEKcKCX7xcQamZiGYOBK/oa8D9J+
         Q0AA==
X-Gm-Message-State: AOAM53208ZE6+byIRp6ZIyD0L8Cm+P/GAo8k+E9/4oszC6MGPe+EOazl
        GKplIoOmnj13lcj9WRN8tyg=
X-Google-Smtp-Source: ABdhPJzemH7406zwPBPhxjJ/sOFlUJLUa/CJWeWsI8Bjd4BU54bVJGKrYv8rSvofcAhwn7pE2K814w==
X-Received: by 2002:ac2:4945:: with SMTP id o5mr2888415lfi.21.1589453360383;
        Thu, 14 May 2020 03:49:20 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id v4sm1276524ljj.104.2020.05.14.03.49.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 03:49:19 -0700 (PDT)
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
Subject: Re: [PATCH v7 0/4] ADD interconnect support for Qualcomm DWC3 driver
In-Reply-To: <a119cf75-8bda-f380-8249-173fa426279c@codeaurora.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org> <20200429183542.GS4525@google.com> <a119cf75-8bda-f380-8249-173fa426279c@codeaurora.org>
Date:   Thu, 14 May 2020 13:49:15 +0300
Message-ID: <87eerm4wr8.fsf@kernel.org>
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
> Any update about landing this series.

in my tree now

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl69IisACgkQzL64meEa
mQbu6A//fIS1BToxj09T/BzusfhWqlmhP82ZlNUi/d/TwchOeTjRexbJ1nYm+i+F
+DelctoeEuZhzYlQr91ZgliYidtTH26NRBAna9Lld6pDlJg31YS8NxB1s9KNNaz5
9s2HKUt//5ZRzvxhhZZgIvv84iE7cXviVzSzbZ/cU5PjKXJ1E8zsvrbQ9biWP7P6
AMNP+MbwSBDH2EYz3JyjqmlsBO3oEnJ7IyZDJnMcfXiCIscf7AKYaQY6WOrEj5WH
ioJFm/GmfJ6Nh77DAtYNjHitz45tFzWGxRbjhUKqIbCnnVMOmwJ8zJNqYH8LDk8X
ZfEdCU3FcDO98D0izBf0PdAfypa1MFul4bLBaPNKahDjKJKQq6fKvHNMF71ORflI
HoCy9nm0czUSAIC6i1BZjmEK9yNkMmyKpXGC3YBDw1aQbzrV4uIjZqGRfnzpAzvY
ng03LpR1BDemQiw869vPmVkX2Y86PaFFnigKaMS2wBN6QBtt6XGePGqf5i3PYmYa
yEMWBJgRptHAkimChB8EJd02DLeXczae3i85qPFA56Tl9OvMpldIhjD7y47kFKW3
AseQQAFult5iMM0xIZIXgRXG1JDKajMMqHTz6j7sh/OxnHcrOaSA5mi+XPHp4F94
z+e8VD3UHm7iHKzOIttpyeTf6l9bP4wczMPup4YhwcaB0xOMY6U=
=/l/R
-----END PGP SIGNATURE-----
--=-=-=--
