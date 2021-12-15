Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69AB7475514
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 10:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241138AbhLOJXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 04:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241130AbhLOJXV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 04:23:21 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62EE7C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 01:23:21 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id k4so15911159plx.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 01:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jg374ikfEXKm7P46q3/8thcqHOhklArXb41uNlTfmtY=;
        b=nuF2A5Lm8y26+J4pkQM+F1ncA/ImpF4CAlWJ2HmvwN2qmR/QTG7JiF4PR8EOkON1zg
         /PYTPF6xuWzvvD5FppbpfgPeULNg9RQ83G/xqkfzQeyCuMG1EJsuZFsFOxObTEdSlFNI
         au2ptMCPBKPA0zcr32VNgussDa+dqtfHB5rMcEgweNpPpLg1sr+uOsjxEDnK/BZ6im2K
         20HYeYm//qWh2qkGTz9z3hiN3j+QjkvEeN3DpL3kynMDYBR5eKbe+vEKn/an85RpAiDw
         i7XI8W4iwTOFnjnZ54+4D14EWrs4js76kBRwcaK46YB7635sSdcfOfcQsFZLLEjrk5qE
         vcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jg374ikfEXKm7P46q3/8thcqHOhklArXb41uNlTfmtY=;
        b=IQyDDpST505pByXCqmUxlOeYmqh75LIDypv/OI/k9ee/LU1ZLOySykdzfruu8FzB77
         wLSkfO6UW5AJzl52yq4lMLbXqQluwSXxF5xccusFd6O1wXg9XrKxqLCtTNAl1liujnJ4
         D9/Hau4wWsEZptAP2FvolIon83mrvp71LH5diP2+SrbHZY75hQqJxiENLe+6ZfLm/Sm2
         sErpqHnCXGdARgwfLFuzoqm7g2r3uZW/xA2Y4mZTP1l6T9z6yPGYGikL0tmbYdtL9zk1
         F/Hk0/e5UB5WT6EmOPlFY2ift+HL9cpe2KuOeNX27KD8/m/63Nx07VaANU4LqtSVYf3U
         bLcw==
X-Gm-Message-State: AOAM531mkCX3q76UlD2SsEmJvz72Q3uRPzj4DBCcW5arqYZ57UdlO1eT
        b6OAoaCQu1O8RtPSiksSI9PeX1eFbf/JTA2PAQrBVg==
X-Google-Smtp-Source: ABdhPJwpC/xjAp6NtBgoBg3OdZ2SroUCL8lQESAaARr7BkTU+xTzd78CleerANgYxwYUDsaqAemJ6c/NahlBEihuqAM=
X-Received: by 2002:a17:90a:690d:: with SMTP id r13mr10855843pjj.40.1639560200856;
 Wed, 15 Dec 2021 01:23:20 -0800 (PST)
MIME-Version: 1.0
References: <20211214134630.2214840-1-bryan.odonoghue@linaro.org> <20211214134630.2214840-3-bryan.odonoghue@linaro.org>
In-Reply-To: <20211214134630.2214840-3-bryan.odonoghue@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 15 Dec 2021 10:34:54 +0100
Message-ID: <CAMZdPi-0jwFr7m-i8esxSARZLmn72af4WWtD87=Hkc91DRioKA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] wcn36xx: Fix physical location of beacon filter comment
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        benl@squareup.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Dec 2021 at 14:44, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> The comment in the header with respect to beacon filtering makes a
> reference to "the structure above" and "the structure below" which would be
> informative if the comment appeared in the right place but, it does not.
>
> Fix the comment location so that it a least makes sense w/r/t the physical
> location statements.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
