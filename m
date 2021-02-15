Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286E731B726
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Feb 2021 11:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbhBOK1z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Feb 2021 05:27:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhBOK1a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Feb 2021 05:27:30 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6723AC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 02:26:50 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id m1so8818405wml.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 02:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V3M/xiqC8wV/3y9yM6WJrdsmEi1wT28KwJ+diusuGyE=;
        b=jWG7bLz+T1/EUxodu4l9HMpKg7v6tgRITknDTZbLkGgl+ZXymPK+ipJvYAvVwWdNCe
         lHbFNEXpxyGcomfDlP6ihC0SSO7MMSIKFdLOklsh7FDM4xmvjIv4w2HkTwd4zxzmiIZd
         6hvUB6uvH6TSPMf7SyTBxd8wWKMA5RbYkZ/bR5dIv1lZ+ustBpK7ZAz5NdWVrRs8Hrwi
         5VBY7KplDF2Y2I3sTGcvyBlRRVpuaaD2aZEnceichN/YP9KZUhSRJ0/LE7AGZkjGFbaq
         UK7pFDAEOy69AdsobcIDZDEEV+FTBg1n79i08LujIUAjYHnHSLQtqynUMMIJZ1LJxUst
         TY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V3M/xiqC8wV/3y9yM6WJrdsmEi1wT28KwJ+diusuGyE=;
        b=eCO1ZXfluNdBdNijZI2sHsmcvm7JAK5cz5ACsYbOECt4cpo3wCi5jvuncqV8OmrSZz
         xnViGD1tfPGrnhklIYtz0UelNNEvtyPICC7av98nA7gBBBaSGUOrsxoDWnE3B5QxeSUy
         Ekmg926i8mkp9wc3hYJlDMq5u/et5LsvRaNQtv04xlhydMkmBj1hBKzOW9ISpxYgD1+g
         BL3U8/k/IJLXx70D5rROH0dIvGQG6BdDDYoO07/40uNjFy2gQ3pUi7kfUL1mtr3xi4pB
         oaZVhKnQ8xJ7bnX9DCyetJJ/uYOk/PG4i0A12RKfG+b7ecRnktFhSW9FiQCd0Up3ZX1V
         ESlw==
X-Gm-Message-State: AOAM533Hqlb/aTc9CHYXhC17lCwGx/W/aATJaZGz2Qy0qFcoVJEFz07h
        EOhGjIfW/ktgm8T37LkxrKuGV4/Ssdb8l5bubcOk2Q==
X-Google-Smtp-Source: ABdhPJxsAjvcE+uYtuJqM2TlAiSIbcNkuW6sJZJAOd/JN52Hk6NPuR78ITJ3OQz+VJXpVDOnlwVVFLak5p2/ImqKlFA=
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr13758695wmc.131.1613384809179;
 Mon, 15 Feb 2021 02:26:49 -0800 (PST)
MIME-Version: 1.0
References: <20210213112829.26834-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20210213112829.26834-1-saiprakash.ranjan@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Mon, 15 Feb 2021 10:26:38 +0000
Message-ID: <CAJ9a7VgwxXgs+Zrb2LgX=E7i1+0wpqiL6gOyktPF7_0eojeVNw@mail.gmail.com>
Subject: Re: [PATCHv2] coresight: etm4x: Add ETM PID for Cortex-A78
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Coresight ML <coresight@lists.linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Mike Leach <mike.leach@linaro.org>

On Sat, 13 Feb 2021 at 11:28, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Add ETM PID for Cortex-A78 to the list of supported ETMs.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>
> Changes in v2:
>  * Rebased on top of coresight/next from kernel.org coresight repo.
>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 15016f757828..a5b13a7779c3 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1951,6 +1951,7 @@ static const struct amba_id etm4_ids[] = {
>         CS_AMBA_UCI_ID(0x000bbd05, uci_id_etm4),/* Cortex-A55 */
>         CS_AMBA_UCI_ID(0x000bbd0a, uci_id_etm4),/* Cortex-A75 */
>         CS_AMBA_UCI_ID(0x000bbd0c, uci_id_etm4),/* Neoverse N1 */
> +       CS_AMBA_UCI_ID(0x000bbd41, uci_id_etm4),/* Cortex-A78 */
>         CS_AMBA_UCI_ID(0x000f0205, uci_id_etm4),/* Qualcomm Kryo */
>         CS_AMBA_UCI_ID(0x000f0211, uci_id_etm4),/* Qualcomm Kryo */
>         CS_AMBA_UCI_ID(0x000bb802, uci_id_etm4),/* Qualcomm Kryo 385 Cortex-A55 */
>
> base-commit: 06c18e28c402ecfb842df8e22a19a097c35ffca9
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
