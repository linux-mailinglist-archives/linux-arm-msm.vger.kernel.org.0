Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2814D152198
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 21:53:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbgBDUxS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 15:53:18 -0500
Received: from mail-lf1-f50.google.com ([209.85.167.50]:39827 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727493AbgBDUxS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 15:53:18 -0500
Received: by mail-lf1-f50.google.com with SMTP id t23so13194638lfk.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 12:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sbz0NUtHrX5+9NCsIDjLoROPzOMAU3z/LAiNTsiqUwg=;
        b=sWGJ+dSvvG9wR5X2wfuBksFQwQ1k25rl4PoAGW6Nps+GvZgn9DNv/c9hWCi1pooqpu
         UTO1G7fAFOaZxR1wRCykcXsF9vfPFRpfRclIPkP0AM1ZUNLcH54PJeMOsP/T6yXdjK7U
         vsyMZHM6IdxshvjEHx84YdlFOE07VSRLyB5B1Y/6LXkVD8Ll1K4xM1oC6nqYIDNmqfPG
         UisvXMHp1x3bMAv6AgwMHVMqwxVtfQ8V84+joKMBZJaRdKdSLFALGa9ur7+3Vib19Wg6
         h9HXZJx6IOC5DfXq1FARoy+Zc2MRCZP+GV31VVpkW71G6W/ZmmM2vpx5D36IxWVkptwo
         V6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sbz0NUtHrX5+9NCsIDjLoROPzOMAU3z/LAiNTsiqUwg=;
        b=ZXmLsae0JN0jTFcKW5RjOQ64DU9hNP1MnJDWKOVgn4ESLFdaai3TOPWBLcVds+g+SB
         KLokg/geAKV6AoOobR66lpxvWqAfmXbr00yWVWA/zCSCUnUpX+YrcMF9louyYcmyHE97
         nwX1oe/zDoJIO1BMNu5S59sVrGYuSFvtkm//5Mrx2bsdN1JsCygyqvHZoUEMao5k6VVN
         jbMVYidKJ52RDejSkJtF5Bl3Brn9L/wiHyh4wzgI3WCC/D4MTK6vD0H/HHh4+LgH9iiV
         Uh4yUvhp9VpBtLiDrRRWGIl8fqn3CZ9dAEOKWjB9ARV7QpfuzfPlgydqhp5NPBhp1fCQ
         cPNA==
X-Gm-Message-State: APjAAAW5zn1cFQA/KpIOKR/DbEfObTwOuNDlxqc1DGvKN4zf1/RocRJC
        vEIVcTIPaItTI1bhyPRanmwYPIz6eU1E/+TZaXryIQ==
X-Google-Smtp-Source: APXvYqyk4OpeIu64Tg6Fe/5AKMjkzII/My9BHyYTGERDiPWWOItOV4ENUVCRLLVVu3ZLXvwnpG8fcGNPOaN/ndDek84=
X-Received: by 2002:a19:dc1e:: with SMTP id t30mr15812680lfg.34.1580849595879;
 Tue, 04 Feb 2020 12:53:15 -0800 (PST)
MIME-Version: 1.0
References: <1577782737-32068-1-git-send-email-okukatla@codeaurora.org> <1577782737-32068-4-git-send-email-okukatla@codeaurora.org>
In-Reply-To: <1577782737-32068-4-git-send-email-okukatla@codeaurora.org>
From:   Evan Green <evgreen@google.com>
Date:   Tue, 4 Feb 2020 12:52:39 -0800
Message-ID: <CAE=gft7Ypxp6yokyqc3fzG+JaVv_eRjNaYoiiHAFTpjo0hVVRQ@mail.gmail.com>
Subject: Re: [V2, 3/3] arm64: dts: sc7180: Add interconnect provider DT nodes
To:     Odelu Kukatla <okukatla@codeaurora.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        David Dai <daidavid1@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        sboyd@kernel.org, Lina Iyer <ilina@codeaurora.org>,
        Sean Sweeney <seansw@qti.qualcomm.com>,
        Alex Elder <elder@linaro.org>, linux-pm@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 31, 2019 at 1:00 AM Odelu Kukatla <okukatla@codeaurora.org> wrote:
>
> Add the DT nodes for the network-on-chip interconnect buses found
> on sc7180-based platforms.
> ---

Hi Odelu,
Are you going to spin this series?
-Evan
