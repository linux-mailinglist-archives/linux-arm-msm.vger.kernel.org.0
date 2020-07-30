Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E00233883
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 20:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbgG3Sim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 14:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgG3Sim (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 14:38:42 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E40C061574;
        Thu, 30 Jul 2020 11:38:41 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id l4so28899570ejd.13;
        Thu, 30 Jul 2020 11:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=k300jlz7TJKTIPgAN5WfLt8mQVo5Ag09AL0277oqBzA=;
        b=aaVnyEB4pqa62TrDBNnN9yAl3DHVKTn1xeTbCpKo/nmJO+kfgdLJahUpQmRCDe7Dm6
         QkS5kSn0cqjO/G5Ovps50NYNR6CT8U53T/VeklDDdtTQqxMyd4sYRv/54zVZZNBHBeau
         hXkyz944BsVAg3UaWds9eL5aqZVeWOPxyvE/5RPXvGlSEtvmMWDdxrrV82rl1nRJzkv1
         vub3/gHugoPJ58JY0OIQKiIQc/Nzv6thxMQCBQ4RA3mP8CyI7F6w/LoFOq8hEG02JXB8
         W2y7tRCfCNAiZT79FG+XLdtztqYmsS9AT8iEZ/vrOGaT7Ue/L5PjomFVnlGc9oPVfO/r
         l2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=k300jlz7TJKTIPgAN5WfLt8mQVo5Ag09AL0277oqBzA=;
        b=F94w+PSGoThWR8Ma729pnKpkXKH8w1sJzjXFHJ0oh69Xr9O6kyyKQwcgPwaP3r1AOB
         ZU5LCHUPd/z9H0aHxbtWs/KYzr3Whhg3Tc+h0Hkx83Sp2GucQPTMJQq8MEojFstybl8c
         WsQWSxAb3KKVuzd8JS/p49UpiXQ3sa89a/Y9mOL4fdCn5Y4Y6+CKUYL3+MvtQh0BzXok
         RNSQZCK00bS1je6gyLyHrUAA1tUwCu6rqeSLkzraMTjM4w4TukKSM+3XK7AQ1Wh73c9U
         OeX2IovPYMFJxaLbkPX0oa6Duhen6jXJDuFt4yDsNlM//LG/FBvZij/Jyw6cIHnrJoKB
         J3jQ==
X-Gm-Message-State: AOAM531/ULTm0JeTYmw+/pVyMIPk3d4JzAzbKVUH8IeeDnMR/Tf9HUms
        BjuzEw/Iil03F8O0MzJSM8SFTRF0Qv9/oLU9JpM=
X-Google-Smtp-Source: ABdhPJy7AEQe1n+FA0S0bWIEfvPkeP85KFWnVYqUpehnBDqrXpJzxQ3ecbfhWawaCp9/siW/leV4dISdkd6DgnTqLoM=
X-Received: by 2002:a17:906:c143:: with SMTP id dp3mr422623ejc.504.1596134320289;
 Thu, 30 Jul 2020 11:38:40 -0700 (PDT)
MIME-Version: 1.0
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Thu, 30 Jul 2020 20:38:04 +0200
Message-ID: <CAMS8qEXFXxt61bhHa_d+Mf9dJ0qqvkWnrq+8w13dVAuK6Q84Cg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: pm660: Fix missing pound sign in interrupt-cells
To:     =?UTF-8?Q?=C5=81ukasz_Patron?= <priv.luk@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tested-by: Konrad Dybcio <konradybcio@gmail.com>

Konrad
