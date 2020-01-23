Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8E714740F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 23:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729154AbgAWWyY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 17:54:24 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46795 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729259AbgAWWyV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 17:54:21 -0500
Received: by mail-lf1-f67.google.com with SMTP id z26so3551802lfg.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 14:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4i0xRegMdNqxOxG+y1FBl3qD0d4qg24N4qcbY2rQ3vQ=;
        b=h6fTyk31IwwLg8KNhheI3woUC/D2zkf8XziVhs7JXsImTaRLC2DXm9BJAE6u+BMgjK
         73MNy0gWxtpbOyDwxzvluEvf+NqpO/USzFZ726Oz2yVqZNBJk/Lpps9OfFcYEj6AfB9L
         o1Gs5eQMBdoRwGanZpLB0BWUuybs52+Nj83ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4i0xRegMdNqxOxG+y1FBl3qD0d4qg24N4qcbY2rQ3vQ=;
        b=mS8AKHBLfi2xaV2Azq4ooDQEhQWlykscsfy/WB72Ql2B0ebOMHCEml6PnJmz1xKJ9W
         xaBgx3IBccBBcGealTZgC9Nvdzb6NNbQklABCCayOWOdo4ocBXufzOWIJ6M/ZZ5HJx79
         A6iAAuq6+ShSKcr4juEBi1TPzZJ1+iRzbY0bX1p8yFMJPg21jZgeSxyFkrpXZUyk1YH4
         XcZZWlLdVnUApO9xglpnw67CK0XhLzw1vtSP/HA2AL3rKJ1ZuJVYhO//p8FCtJH3aa2P
         0zJUQQDTzxRgE266NATpcIN2D+BAcQg/KRbWWb7G7MafImE3fekUAQ67ji0JSbYbu/Qp
         4RLQ==
X-Gm-Message-State: APjAAAUhSr64p1O3IUfqa7U2Upy/BetgqtyRd2X/XYbfF44WHX/3IPQy
        cA+k5Vooy/nDVFtSjUFXM23r29DsoHk=
X-Google-Smtp-Source: APXvYqwy+2f5Bbzm48UA9BV1C6423p5XkMvIcvxRCFWqa3AAicMGL8eXqfo2prgS8Vs2Pcpw0l5NeQ==
X-Received: by 2002:a19:3f07:: with SMTP id m7mr36305lfa.61.1579820059253;
        Thu, 23 Jan 2020 14:54:19 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id l16sm1515235lfh.74.2020.01.23.14.54.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2020 14:54:18 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id z18so3609917lfe.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 14:54:17 -0800 (PST)
X-Received: by 2002:a05:6512:2035:: with SMTP id s21mr31943lfs.99.1579820057323;
 Thu, 23 Jan 2020 14:54:17 -0800 (PST)
MIME-Version: 1.0
References: <20200123131236.1078-1-sibis@codeaurora.org> <20200123131236.1078-2-sibis@codeaurora.org>
In-Reply-To: <20200123131236.1078-2-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 23 Jan 2020 14:53:41 -0800
X-Gmail-Original-Message-ID: <CAE=gft7sztBTs4mhF2X0eKnjJNBBRxXP5VOr4rsAw=SOYDi4jg@mail.gmail.com>
Message-ID: <CAE=gft7sztBTs4mhF2X0eKnjJNBBRxXP5VOr4rsAw=SOYDi4jg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc: qcom: q6v5-mss: Use regmap_read_poll_timeout
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
> Replace the loop for HALT_ACK detection with regmap_read_poll_timeout.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
