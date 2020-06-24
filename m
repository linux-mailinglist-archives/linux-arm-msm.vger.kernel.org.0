Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1632075FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 16:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403781AbgFXOp2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 10:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389583AbgFXOp1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 10:45:27 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39699C061573;
        Wed, 24 Jun 2020 07:45:27 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id m21so1672703eds.13;
        Wed, 24 Jun 2020 07:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lIqE2NUHHN1jnUVxaUmChf7C6YexvjrFTau9YkSeGiI=;
        b=K9pv2nHlMVvSHQxXmeTLh5YhPo9Sh8Wa0zWK8/oJRYyq/CxzmT6VibZSbU2AJfOJoD
         YLLAaqK232+a5+4euM+JfWcfO/W3Bu+vexN4cJJAr2VQU1V0DrrUSecC//LcB9Hos5io
         ey63LchdWVEMuDX5ydsGrtLiHsbW2sLirb9GmhBOj7a9Fay5YE+Vz/PjkHm3gStQzG/K
         rFNDqack3cRru/QmKslBSZniphwZHwtDn22yQWkQ8ft8cNEKKhiNmOlB26Xpp5k3zt2H
         AAC8EfonHmBHH4tt7EEbIzzP3S8qG1fIujJPqJtg8hUi25fxyPsNjVLMczj9rKCBii0y
         apWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lIqE2NUHHN1jnUVxaUmChf7C6YexvjrFTau9YkSeGiI=;
        b=rhgrIldcMbHil8S+YvBAlZbJw/PzzES4AljkRE439zM0X08ttzAXNFJntEa4UeCdj8
         1s1oL21ZNwFjzctYaMxy5MwHzoszpp51t9JG/14/VSdLG8S78OJ5TTwv5CyvsuEkNkDL
         h8xQmbcbwcCB13hwknMs2tHislkoPuzRy0wa0XwvrAciZ1Wp/PENzvkxfxpLV8pjlUhc
         IT40apqt/ta8ZDKrsq04hc6XpL8H8e9M/eFAusb4k3X7Ucwpasi7qDeCl33aAp6a23gN
         QyV2y98JrS18aCDAo0qpt3Qq5iBZLb74bGun+3eYrcXe9RCjcGlf7RMzTzuAG6tICO2x
         FUxw==
X-Gm-Message-State: AOAM5335vb7jt4IzEgIq56oVEORz70VX4oxHDpaK3Odjq6/ZgE5+7r7C
        3ngeHDMGVDy3OOUhU94g4LRh3xcY/NXBtPf5NnQ=
X-Google-Smtp-Source: ABdhPJzKndG7kjOCV6qRQ1De7msGegvxr+SwDBcGbUH2E5WIx6mrl3d5FCmeYs2bOfsAruUh15NvQ6YhfaxPpkA0kao=
X-Received: by 2002:a50:e08c:: with SMTP id f12mr27130963edl.233.1593009925988;
 Wed, 24 Jun 2020 07:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-13-konradybcio@gmail.com> <20200623232705.GR128451@builder.lan>
In-Reply-To: <20200623232705.GR128451@builder.lan>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Wed, 24 Jun 2020 16:44:50 +0200
Message-ID: <CAMS8qEVzThnfonhczz_X_idXQr28EzhwbCW6T9UhZKb_dDfSuA@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] arm64: dts: qcom: Add support for Sony Xperia Z5
 (SoMC Sumire-RoW)
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>This does worry me...

Yeah, sadly the only way to get SMP on every msm8916/39 and
*some* 92/94 mobile devices is to use something along this: [1]

But for now, 1 core is enough. We will worry when more peripherals
are brought up.

[1] https://github.com/msm8916-mainline/linux/commit/1b12cb1f8e718175bcff5734cdb3903e83d8aa89

Regards
Konrad
