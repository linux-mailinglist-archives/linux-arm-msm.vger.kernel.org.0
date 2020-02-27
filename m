Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E641729BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 21:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729510AbgB0Uyz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 15:54:55 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:34287 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729463AbgB0Uyz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 15:54:55 -0500
Received: by mail-ua1-f68.google.com with SMTP id 1so188273uao.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 12:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ktzdl5eoKPEHfEuFryFzhZR7Y8sf35Stxv0I9TC3om8=;
        b=S7ZikkXjTCFqfTODdrBIRR4bjKV6vzJmi95TuJOiGc6qU7zDytV2WPccOPkdOwJZ/j
         xli5qKpWBUJ5DazclKwIIfQ8qQMD4fHsNAqdGsEEL4fe3MO0gOR/KmwhvFgRCgvvNvHb
         vijRWYbIUdJ6HmZd/RojRMwFkBppkvmsy5rbTLnwbctZAx6wUY1nJDyxeEApFNEB55Xb
         U/d0YaxRhAe8wd8cADEZdNzur4hfxn5jgLkmh8HD1TUN6quVjk+WYUszsrJcPsODuhpU
         y/6+8DOFTaL7D7XPV1o3rvMBHvAFVRiFIRT2SaijXF4iUNgMsMRkGs0kHJjdl+cTFTSs
         f0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ktzdl5eoKPEHfEuFryFzhZR7Y8sf35Stxv0I9TC3om8=;
        b=G8NCvfR5h2j9hWrjQOh+jSKz5Ia5Q/Zv0+hM8U3eFBT4yTfUmtE5aOKHIA/WwfWxic
         89mQ72E5KXFZt8gV5XqCTcLMO6MUqtUQhqHaaHT/z/ZYE1AjeMBTRUW7FkbTl9Ydj6/p
         WVOrgueOn2bEsIRPeYKDsX2KLh2NhWvBQnoEw140TcX9MQOPI59geLtHz+5exy/XDa/9
         mVtDbf+w2/lZv9msLyuZ4VDZbaOE1ddAEagMKxwwI7WSOXtQceZnv08NHNEhlKrmqv5M
         FDFdY/GTdA7aXDVKJOZSmEvDtB/Rl6H+aqbeUrR+UrcyzV5h8OU7X6Yq/yTc6mqIVlSz
         ohZw==
X-Gm-Message-State: ANhLgQ0MDpCTWlxtMyI9TpHMVXTb7kAjzCCpI6l6YW44ESEcswQSq/Gj
        W28tZ84pYSS5x4Es81hrfDz6/6T+ahgTZgpqgYl8YA==
X-Google-Smtp-Source: ADFU+vt5Eu/0Gf/mJjQWTqW8ukh7kOFSPWFoB1kOcBU0Lbg1MDkcSsM3OxPy3w+OIQUMQkvfoeEVgnNZxUT2k13A3Vg=
X-Received: by 2002:ab0:6605:: with SMTP id r5mr363174uam.0.1582836893873;
 Thu, 27 Feb 2020 12:54:53 -0800 (PST)
MIME-Version: 1.0
References: <1581434955-11087-1-git-send-email-vbadigan@codeaurora.org> <1582545470-11530-1-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1582545470-11530-1-git-send-email-vbadigan@codeaurora.org>
From:   Doug Anderson <dianders@google.com>
Date:   Thu, 27 Feb 2020 12:54:41 -0800
Message-ID: <CAD=FV=WjSC7h0Q1aQpF74KDpgjOPSKrUR5gBo1ZsFn_o4m5TyQ@mail.gmail.com>
Subject: Re: [PATCH V3] dt-bindings: mmc: sdhci-msm: Add CQE reg map
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>, cang@codeaurora.org,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Feb 24, 2020 at 3:58 AM Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> CQE feature has been enabled on sdhci-msm. Add CQE reg map
> and reg names that need to be supplied for supporting CQE feature.
>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
> Changes since V2:
>         - Dropped _mem suffix to reg names.
>
> Changes since V1:
>         - Updated description for more clarity & Fixed typos.
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I assume you'll have a follow-up fixing the driver since commit
a4080225f51d ("mmc: cqhci: support for command queue enabled host")
refers to "cqhci_mem".


Also something to keep in mind for future patches (no action needed
for this patch): most maintainers frown on making v2 of a patch
"In-Reply-To" v1 of a patch.  I notice that your v3 was in-reply-to v2
and v2 was in-reply-to v1.  You probably don't want to do this.  One
such reference to people not liking it [1] specifically said "they
should not be replies to old versions of that patch; otherwise the
threading looks really weird and confusing."

[1] https://lore.kernel.org/r/CAJWu+oocs3T8orMNt6AmdVgWONzZg0vD=E8EdvzE9rOi_XatUw@mail.gmail.com


-Doug
