Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E762115843
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2019 21:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfLFUpY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 15:45:24 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40693 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbfLFUpY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 15:45:24 -0500
Received: by mail-lj1-f193.google.com with SMTP id s22so9048631ljs.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 12:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zMYyDKhp6K7/5SuIEY9a+3PPHyckatVY1BJEQOFbYPw=;
        b=kLQzpX2iLT3Cw3LYn9w2xUhbQcZ1mnSOxrIeil8QWxuKB6jMDdBwqMcFQCjopElDvB
         9xVPY7OFh1i2ZL3ZJ1/IwfRSv+r6pliXLzcDbGK1wuAftk4uOBp0N6z4sVbWHKY7TjUM
         FDR3SKEII8ZT9AUEOqqRtcygJcuT9RKG0JZMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zMYyDKhp6K7/5SuIEY9a+3PPHyckatVY1BJEQOFbYPw=;
        b=XNnwXbxwWeBWU8EasG6MGqDpan+kmCfal3N0m5PQDCiUHOx4T2HQ+zKTyMFcPjtu5D
         RcvYEnhCiU8O4rAtlwhGmudwFJvMZR1/pJrA1p6qLuqAPRWHy5dYGJvg9y7AylCcG79n
         jlFOtIKnQlDdPQeNVuIRcBUBlI9UhDTaXMASMnKXnU0NHcyRGfisX2Cejk6z2fbE2rRb
         Vhrf3ADy+krRyh5pzmWzX/VM+A/vmm5im/1qv1XwiXAtQMGgWyjDiSOPui5y6pVBQcUU
         psztJZ/PEbNAMo4vdX03BUcrzG9zhFfyzcAimlkmGu3VHpEKPaVuoddByxzIQBhhxkJt
         yqFg==
X-Gm-Message-State: APjAAAXTFRgLKFlitco/x3M5am8Fy0aPDQRv6UN1UyhToLPSMaKfc0RQ
        c5qVdXi5lARFdV+vdXF73PIYu3YRU3s=
X-Google-Smtp-Source: APXvYqzMYHAcsMCmL11M4yQ5qzaf3DYTZbuQMZYIyp6/5VAI81H0y4yfIEjR3F7HSgdHpuLvL7+v/Q==
X-Received: by 2002:a2e:9194:: with SMTP id f20mr9786263ljg.154.1575665121948;
        Fri, 06 Dec 2019 12:45:21 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id m13sm7153787lfk.94.2019.12.06.12.45.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2019 12:45:21 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id l18so6270950lfc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 12:45:21 -0800 (PST)
X-Received: by 2002:a19:ec14:: with SMTP id b20mr5175962lfa.63.1575665120607;
 Fri, 06 Dec 2019 12:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20191128134839.27606-1-georgi.djakov@linaro.org> <20191128134839.27606-2-georgi.djakov@linaro.org>
In-Reply-To: <20191128134839.27606-2-georgi.djakov@linaro.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 6 Dec 2019 12:44:44 -0800
X-Gmail-Original-Message-ID: <CAE=gft7WHWohbRLk-ungR54p_LUQz5TLeWsT1PtMVRza9M5H7w@mail.gmail.com>
Message-ID: <CAE=gft7WHWohbRLk-ungR54p_LUQz5TLeWsT1PtMVRza9M5H7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] interconnect: qcom: Use the standard aggregate function
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Dai <daidavid1@codeaurora.org>, masneyb@onstation.org,
        Sibi Sankar <sibis@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 28, 2019 at 5:48 AM Georgi Djakov <georgi.djakov@linaro.org> wrote:
>
> Now we have a common function for standard aggregation, so let's use it,
> instead of duplicating the code.
>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
