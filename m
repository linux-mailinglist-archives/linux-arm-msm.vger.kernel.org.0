Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256AE30EA82
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 03:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234233AbhBDC5p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 21:57:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233081AbhBDC5o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 21:57:44 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE11C061786
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 18:57:04 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id b9so2486367ejy.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 18:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Egk49XsGXGnJFbpv9uvhCKcjGbaMRyctgXpOwYMKtJE=;
        b=GXA8On2usIVOHnyCKFlnF+TRjC0ivjIz4/QUlcvVtEPYwbn1J384mTw8X0gzA6mbih
         Nwq3M70YWZHTfe8edtvnSFOv25qhrmWJblhJ5AkLM1i6GNJketub/q4orBSJiSdEdHGF
         L2W1uI7W4HxK+dbqmsOYSiejnmnHAXQyrxlap8PxVG79l4VS1nb3tImyjfYiBkCTktT9
         jl0Tq0qUcZYHsAGk+PT0ZesKX7mvm3E/8UczsXPXKGAw3l66KYnJX/m6BSf8ZRDzKYGs
         5CUgtiZ8cfl3jlfdLGH/Bot6SCdVce+8eZMtbbY0mvjx0C8XI/LJqWNvtxD29oMnWf+X
         JFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Egk49XsGXGnJFbpv9uvhCKcjGbaMRyctgXpOwYMKtJE=;
        b=RBJTKygLFnHJCrSbKFI2jPl+MT+P0v29fDs7eU/7jefnIYqvaaIavjCp6pLzXR/g5S
         HOgY2iZeTN+nmIzWnWlj58FtACWmTJONiAM2S1Hsb/ZVK1q043BCjklbKBxiHr2GT8HS
         YEDHSZNz+m68dMLWVAFDZtd69eHxoGaKIMb7u2/k+i9iZlmhZZyKl5sWa15ZTOe+vGka
         pY+F3KILjZgF9zMgcnFd23cvR2GMDEqEwLsM+1kaQiaVA6aqkj1C35p640/neZ4d3JCJ
         d25fyXE3CgOFU9zohHAsAJlF5FNCC+f+LxpxplPAMsqDRxW0NbQ9Eg8mSFTGfmB9Idhk
         b/Lw==
X-Gm-Message-State: AOAM5320Y4vDGJQrKH5MFdvcj4Dz4PkXnV29nbeAOD4fHw1jF86Ao80C
        IJZReT9b66B4c5E5GFHmpr54RpSKDLE4KeA+CC8zOg==
X-Google-Smtp-Source: ABdhPJzM4cxeJrGXXL6GD8UzfSUB8d6CGKIOZE5CFaNW0ERSL4HW4DggFbLXU+F2PHIV8nQvqrrVqTlv7EchftTi890=
X-Received: by 2002:a17:906:a28a:: with SMTP id i10mr6039245ejz.422.1612407422774;
 Wed, 03 Feb 2021 18:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20210203163407.9222-1-benl@squareup.com> <20210203163407.9222-3-benl@squareup.com>
In-Reply-To: <20210203163407.9222-3-benl@squareup.com>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Thu, 4 Feb 2021 10:56:51 +0800
Message-ID: <CABymUCO22hzg-K+ws2ZfvsqAcuNq6iKvRv1dch5M4pPOcQZKpg@mail.gmail.com>
Subject: Re: [PATCH 2/2] interconnect: qcom: msm8939: remove rpm-ids from
 non-RPM nodes
To:     Benjamin Li <benl@squareup.com>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        square <square@linaro.org>, kernel@squareup.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

'Benjamin Li' via square <square@linaro.org> =E4=BA=8E2021=E5=B9=B42=E6=9C=
=884=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=8812:34=E5=86=99=E9=81=93=
=EF=BC=9A
>
> Changes corresponding to commit c497f9322af9 ("interconnect: qcom: msm891=
6:
> Remove rpm-ids from non-RPM nodes") to remove this log spam on 8939:
>
> [    1.901376] qcom_icc_rpm_smd_send slv 24 error -6
> [    2.005977] qcom_icc_rpm_smd_send mas 20 error -6
> [    2.010250] qcom_icc_rpm_smd_send slv 20 error -6
> [    2.014684] qcom_icc_rpm_smd_send slv 106 error -6
> [    2.019338] qcom_icc_rpm_smd_send slv 107 error -6
> [    2.024615] qcom_icc_rpm_smd_send slv 29 error -6
> [    2.028782] qcom_icc_rpm_smd_send mas 3 error -6
> [    2.034657] qcom_icc_rpm_smd_send mas 100 error -6
> (plus another slv 131 that's hidden by the mas 100 failure)
>
> Signed-off-by: Benjamin Li <benl@squareup.com>
> ---

Ben,

Suggest to add comments to address the issue you fixed as commit
c497f9322af does, at least a short version. So that people do not
have to look into c497f9322af again.

Regards,
Jun
