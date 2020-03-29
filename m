Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2846A196C6A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2020 12:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbgC2K11 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Mar 2020 06:27:27 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46030 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgC2K11 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Mar 2020 06:27:27 -0400
Received: by mail-lf1-f67.google.com with SMTP id v4so11416843lfo.12;
        Sun, 29 Mar 2020 03:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=f3MF2NNJAi4232pZYddjeL7pVm1fUChXOUZS+6fT5iE=;
        b=u/0FHKWybogy8QjgF5XOPOnq6ZQ++zbVLRSpEGOAD8nPhRH8j6BvrM6Oah/6z1wZdW
         cXW/UPpXVD9aAR9tAF6c4obpaaiM2nf4qbQO38L7Vz9TSeph2TpfButEUIY3Tdyu25pZ
         qEwwp+YfDTw6bYdIgzSDPNm1RRhURaEcFix/7BPokCr3mQHLKIjWyVzjUGef+4UxwtQN
         cl3mHgqtRhc87IIS9YDBxeUKLrNcDtIYxIivJm3jOVBYHK02maEllWHfgCAvQwZmFzmT
         vu93NXEdhRXh0OFKqQsULxejesCn4Hcj/BhYDpII8rA57l2Cpg3KVeLydlh2OkAIzRgx
         JIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=f3MF2NNJAi4232pZYddjeL7pVm1fUChXOUZS+6fT5iE=;
        b=rtp5jpRl3MYAtjmZRqOj/XRzbMTcKGdPMJiofhEeWPsB3nHUwl84Gn1HUGgsD1END3
         UXPnj2jJqi8IWxhnWjAm1AKCj8NMQw7YKnAurdx+YbBqG62GFrp7umfUrQqYe78I32dq
         pCfIKF967WzpsgXzq+9EZNBgMBu+eDOPA0wdfixxQxzSErf0eQqdfu9LH+x0/s3UVpdC
         oV1I63D1O5VNSrtQYrx5pdX67aVwnHDeDTrdxe9TKd8TU7mCxe1utw0WtdRTWIhcT8f4
         KTp6HZatfRkuF36To8KwiBWx+YvX85M1qsg1hmfoq+pIpvlXUZuep5rf95RRkmgGW8JV
         WMVA==
X-Gm-Message-State: AGi0PuYE3xUNLF8RjtlFIgicaLBefGJ+CVz56R+m0EVpooa95G/+S722
        EThGeJETBnIjEIkCrTV/q4k=
X-Google-Smtp-Source: APiQypLLAsw2f8SLVBZufs8bmyHwdQV0ZPvofG06Wa5VjHYfv4kHchwFrnk+SVdoLMHuhn893zG8ug==
X-Received: by 2002:a19:6406:: with SMTP id y6mr5000126lfb.125.1585477644797;
        Sun, 29 Mar 2020 03:27:24 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id j16sm1931138ljg.98.2020.03.29.03.27.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Mar 2020 03:27:23 -0700 (PDT)
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
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v5 0/2] Add USB DWC3 support for SC7180
In-Reply-To: <1585206368-685-1-git-send-email-sanm@codeaurora.org>
References: <1585206368-685-1-git-send-email-sanm@codeaurora.org>
Date:   Sun, 29 Mar 2020 13:27:18 +0300
Message-ID: <875zenfoc9.fsf@kernel.org>
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

Sandeep Maheswaram <sanm@codeaurora.org> writes:

> Converting dt binding to yaml.
> Adding compatible for SC7180 in dt bindings.
>
> Changes in v5:
> Addressed the comments from Stephen in yaml file.
>
> Changes in v4:
> Addressed the comments from Doug in yaml file.
>
> Changes in v3:
> Dropped the patch for adding the compatible in dwc3 driver from the serie=
s.
> Addressed the comments from Doug in yaml file.
>
> Changes in v2:
> Sorted the compatible in dwc3 driver.
> Converted dt binding to yaml.
> Added compatible in yaml.

now queued for v5.8

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6AeAYACgkQzL64meEa
mQZE8A//adSbSBMaJegP9rkwyzjwC90gjKyrrsGUqrP1dEc9oCNIs9MlmTRYnOrN
XEhJ8d8oXGMDZ+fxcVl0Vkvqxl0S6SVTHeL9fe8KsOTDsPWCDktJqwxs9haeYdul
YHis8uRjHKDfDJXsEqGEkllNrYMUxBumN/JPTvo138LIMcVhEDRk5TvtDWD1gGXO
pMk+q3a1p01ec35+wkjuiafAMaMsDNjBQ29r5ESTu7U5iGhgSecPT7XaTKh4RU63
rMsKKydGb47Jml0e6Ppz46bP7nw3vXAreSBekmK/AR/o8xREMhQddEwOtKdvxPcP
wmbQuqz+58XuH2QlSHYOp36glPyDxV+2m65KvqeG0mnaxJ99J5URAvSOp7pdccXH
9Kbfudi8OPoMBRM8D475epJUCYZYGEiAEY4rlVCg51dBYic74xYXecTwjvNC5tr5
wjSDxz/QrmeYNR5o8C2pBQEw811/NMfHrstiIIyU53/p51pxvi0EAm0ZbaY76jqG
zsoOGx/7sroJVvpK8xaHOxe9I7u7s0AO4oO1Hfx8x182W3G2VZ6KEvKUiCwmejq2
7qdB88yyX7EE76CKJDOpxItutjEP38dXPjmbIHX+Uq2Qde5RbfnWav+aNtSVXU1J
1IIW6Ap4ucNURLp6Ytx+aglapseOz+HkPS4yw3P/56ldfWckQyc=
=31p8
-----END PGP SIGNATURE-----
--=-=-=--
