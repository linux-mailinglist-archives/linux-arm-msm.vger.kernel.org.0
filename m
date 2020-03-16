Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCD151871B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 18:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732193AbgCPR5k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 13:57:40 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36270 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730437AbgCPR5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 13:57:39 -0400
Received: by mail-pj1-f65.google.com with SMTP id nu11so5866539pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 10:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=y2Kd4TE6UO55m6P+gqiknz16qTQ+UJhgoGPrT0zGvfc=;
        b=UeVDrQE395mmEkElu79pTTFh+bwZ/PBoqyZNZfqMpjrEs3+R7+ittS0/ZEJSOX/aXQ
         eUsZegOIunpxfZffe6Dt/HoK9AHmP1I0yWNc4pewzczh7CPSS31yD94roMfMbStZ8zlb
         oM0Std+omZCX4OL/A3GvBdXcA7R89KAz3nT80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=y2Kd4TE6UO55m6P+gqiknz16qTQ+UJhgoGPrT0zGvfc=;
        b=ISVZXyfDoKrJK3Tw9BJ3xsXItj1IyLIylDugoK4LyANiywomtji+DNjW9ZH8e+oZV4
         CwXsdgHpxDO6LVIYKx4bNI17jmoF6EUgO8JbccCQKLI4koHeWPRF2CEn7RU0cq+nyQH5
         Hs0319ppmlZb9lZRAVzSf1tkzmZ2FFSOL/bpXk/e+baTwaCQdrqKTwmWMuMJCLZPZNBb
         Arr5913x3paX4/5zbbZzzMhzvWZVr/43/5LptodSq108GRMGMVY+F+P0F4VXo+1sn7HS
         nibayD0eorbzIq8KnsGPZL6nXQcs7s1jYqHACSu0C7sTfCgHliewNWPdxXhMOXgmUtBJ
         hw1w==
X-Gm-Message-State: ANhLgQ3xL1iS2omvCx3uv84EhfUT27iDXjG9AAzbZttRj+bAvcbvLdck
        h1KeHlNZzw558ms51LvLVf+KmQ==
X-Google-Smtp-Source: ADFU+vtGkAGPzfs2Lcaw+Lf1d/gFf4IoLaEFY2uZqdkv9gwTNEfdgFe9USJ5kxzL18VQKskc/oqGxw==
X-Received: by 2002:a17:90a:d103:: with SMTP id l3mr752589pju.116.1584381456977;
        Mon, 16 Mar 2020 10:57:36 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 5sm538423pfw.98.2020.03.16.10.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 10:57:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200313134635.1.Icf54c533065306b02b880c46dfd401d8db34e213@changeid>
References: <20200313134635.1.Icf54c533065306b02b880c46dfd401d8db34e213@changeid>
Subject: Re: [PATCH 1/2] tty: serial: qcom_geni_serial: No need to stop tx/rx on UART shutdown
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, ryandcase@chromium.org,
        bjorn.andersson@linaro.org, akashast@codeaurora.org,
        skakit@codeaurora.org, rojay@codeaurora.org,
        mgautam@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Doug Anderson <dianders@google.com>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Jiri Slaby <jslaby@suse.com>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        gregkh@linuxfoundation.org
Date:   Mon, 16 Mar 2020 10:57:35 -0700
Message-ID: <158438145518.88485.3909168358047756949@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-03-13 13:46:51)
> On a board using qcom_geni_serial I found that I could no longer
> interact with kdb if I got a crash after the "agetty" running on the
> same serial port was killed.  This meant that various classes of
> crashes that happened at reboot time were undebuggable.
>=20
> Reading through the code, I couldn't figure out why qcom_geni_serial
> felt the need to run so much code at port shutdown time.  All we need
> to do is disable the interrupt.
>=20
> After I make this change then a hardcoded kgdb_breakpoint in some late
> shutdown code now allows me to interact with the debugger.  I also
> could freely close / re-open the port without problems.
>=20
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver sup=
port for GENI based QUP")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Matches what is described in Documentation/driver-api/serial/driver.rst

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
