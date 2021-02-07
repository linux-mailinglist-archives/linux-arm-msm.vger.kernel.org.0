Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44D83120E0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Feb 2021 03:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbhBGCYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Feb 2021 21:24:40 -0500
Received: from mail-pg1-f169.google.com ([209.85.215.169]:41687 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhBGCYj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Feb 2021 21:24:39 -0500
Received: by mail-pg1-f169.google.com with SMTP id t11so4288420pgu.8;
        Sat, 06 Feb 2021 18:24:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DV9HHj90/6CU2obG3fOkTfyceXYyBSjTuvrMdoSYT4c=;
        b=iFvJ7bz/qRVsOZ33D9VbVw483HO+57AL+eyl8ykEpYGpwR3MxD3TsC+PesBsv4n5cx
         TQBHuoUcB6tB4ZRvRcKun4ooCgBqayzsbFBPk/z/R+fdHyS9rOdCkLdxBawWn7HHs/QY
         O+StKcOyl39yofzsgbfUsEhicUec7LunrHkLfQA9qjxGEvqfG4Ah9IPXqwuyIKOxqhCx
         aBrbOmG0UN8sk+AIHK5plE2F+3gAJp8dfP7QJjdb5lBW9ulRZxR9qz1rrsN2Qm4XAV/t
         bPyxRfIgmNUT5BQQ1QxsizesmjPz9nWYDCE2LaS/Kfa2RXFBPsBPN670yN/zDWIMspzT
         OCHQ==
X-Gm-Message-State: AOAM530RHMtFvMhJlFWhAldCIqLRjDLe+eE2Kn6wjTr4Lpo2/+cdzGFQ
        bTmBeHll9xK/jCcReAyVLrVaHPBlyrc=
X-Google-Smtp-Source: ABdhPJwtnw8SZQ2wx4sc+xxcjWnCOja9n0ib3wtDBNghEuUST9w/8PrNn78lYbXSNr7Is/+5IHj/4Q==
X-Received: by 2002:a62:ab16:0:b029:1bd:9bdc:2459 with SMTP id p22-20020a62ab160000b02901bd9bdc2459mr11980992pff.19.1612664638483;
        Sat, 06 Feb 2021 18:23:58 -0800 (PST)
Received: from ?IPv6:2601:647:4000:d7:7d2:d17b:df07:7747? ([2601:647:4000:d7:7d2:d17b:df07:7747])
        by smtp.gmail.com with ESMTPSA id c15sm7748482pjc.9.2021.02.06.18.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Feb 2021 18:23:57 -0800 (PST)
Subject: Re: [RFC PATCH v1 1/2] block: bsg: resume scsi device before
 accessing
To:     Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, stern@rowland.harvard.edu,
        "Bao D . Nguyen" <nguyenb@codeaurora.org>,
        FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>,
        Jens Axboe <axboe@kernel.dk>,
        "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <c04a11a590628c2497cef113b0dfea781de90416.1611719814.git.asutoshd@codeaurora.org>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <f83e890d-61b9-e428-6289-b7268fbe7e01@acm.org>
Date:   Sat, 6 Feb 2021 18:23:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c04a11a590628c2497cef113b0dfea781de90416.1611719814.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/26/21 8:00 PM, Asutosh Das wrote:
> Resumes the scsi device before accessing it.
> 
> Change-Id: I2929af60f2a92c89704a582fcdb285d35b429fde
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>

No Change-Id tags in upstream patches please.

Thanks,

Bart.
