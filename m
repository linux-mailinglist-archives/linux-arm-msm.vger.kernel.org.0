Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE970147417
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 23:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729505AbgAWWzT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 17:55:19 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41448 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729259AbgAWWzT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 17:55:19 -0500
Received: by mail-lf1-f65.google.com with SMTP id m30so3570678lfp.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 14:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RvfS7+Fsc/eieI6rBQof74MincBvvBD6LwXZdidYyBU=;
        b=YYLLczpgQOlnXOLDv9csihbQn/ZgD2WlgEYBHaHRdjKx5jpKdyDfOIAnJF3cacZIZ4
         XbTvtmZ6TFJInnwglMMY1JvFSvkXTeZVaWWfa6k5uqO5AL+KoYg6m2clDBwRj0W37QMh
         2FRuAAV4AkTDaT1s4pP0s85aSMcd3qlTQpQsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RvfS7+Fsc/eieI6rBQof74MincBvvBD6LwXZdidYyBU=;
        b=VU6685IJ7+rmKolEea8eUGbmUchu+0NGWMMhOkbyQcedOUeCRDwtESKuiYjsv3WbAN
         vPuR+w7NF0++lzh36H4ERT6L16wHSHJLDA9pL4Xl+hsqhWacYLwr3G8FbSr4Qeo6jqL8
         VfS35wRouxqnfr0Iy2EZEnoZj4cDY+kBr2XfwRu52ahbziG8+NPmACaQSjzmh4A2iBpb
         plUSoJJPxxifDx6RH8EoCx7IkAD2P71NLbc70YH9a5ewG2bI1wZD2kjdiMTWIk4yaf/H
         Oa6Coq0Zt8hLnrxSibBtJYHeX0IPW4z7Xs/Wc4L17LFegdfkGA4lsqrmLXu8TlV4mw7n
         znsQ==
X-Gm-Message-State: APjAAAW4hLP5v1T8IfH6aOOIP7SSGV6UHrqrQNH3v2iiK/kDCYsFv8Xp
        wwszjZgYS380I+gY/fPV7JYGokBdHP0=
X-Google-Smtp-Source: APXvYqzqdwRrRAqkn1Wi/sIRtbY2yEUIuC3P2/5sSQFRVRn1UuDH3ikThYlUS6+Ri5qxm2mYdpsR0g==
X-Received: by 2002:a19:3f07:: with SMTP id m7mr37468lfa.61.1579820116834;
        Thu, 23 Jan 2020 14:55:16 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id j16sm2023639ljh.35.2020.01.23.14.55.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2020 14:55:16 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id f24so3601897lfh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 14:55:15 -0800 (PST)
X-Received: by 2002:a19:c205:: with SMTP id l5mr31538lfc.159.1579820115268;
 Thu, 23 Jan 2020 14:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20200123131236.1078-1-sibis@codeaurora.org> <20200123131236.1078-3-sibis@codeaurora.org>
In-Reply-To: <20200123131236.1078-3-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 23 Jan 2020 14:54:39 -0800
X-Gmail-Original-Message-ID: <CAE=gft7H6-jAfPAqeU74D1VPS81vLPgQ6w+JO09C4w1bzwYduw@mail.gmail.com>
Message-ID: <CAE=gft7H6-jAfPAqeU74D1VPS81vLPgQ6w+JO09C4w1bzwYduw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: q6v5-mss: Improve readability of reset_assert
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ohad Ben Cohen <ohad@wizery.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 23, 2020 at 5:13 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Define AXI_GATING_VALID_OVERRIDE and fixup comments to improve readability
> of Q6 modem reset sequence on SC7180 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Very nice, thank you!

Reviewed-by: Evan Green <evgreen@chromium.org>
