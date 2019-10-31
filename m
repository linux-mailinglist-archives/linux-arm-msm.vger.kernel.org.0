Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFB5DEB980
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 23:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbfJaWDo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 18:03:44 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:33059 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727715AbfJaWDo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 18:03:44 -0400
Received: by mail-il1-f196.google.com with SMTP id s6so6893694iln.0;
        Thu, 31 Oct 2019 15:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sb1QxzuAyQh2HIKxWPJ8MqFymBdmLerlZldXam14EWk=;
        b=D/bB9NxUc/llN+2mf9ZU+YELVGZtW6NUdnpSIS0m0lbUm/IuoTOc+liMu3OOUkg0by
         /XssxHKuMKavniNF26XZrsBlc1MeX0TV4lNuHaDYykRCy95/QApfIV4AwE3tLMywxgmv
         WQb6QgUMjGRexK1kN9QhzXdnn/N0deLIDrkenFc+brlm1RpBjAxD1PxcTUKvjE+hgeuz
         1TEI4GQkizz+q6kJSvRekA/qucm71elvUsUm8A7Saolvc7MQl7WsfV0JIEKfXEZ2IY2s
         PH7QaHLMP9CIvGU0SW0TrLirWAxJnwsIR8eDpubdRGLpraumtM4ZhVXw1JUMZxScrqwu
         x/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sb1QxzuAyQh2HIKxWPJ8MqFymBdmLerlZldXam14EWk=;
        b=HGLTBfrzQIdTNUX0T4RYtW2uvRciEKelmV4hTykjDuOPwf5QS7AZz+s+otHXETBCa0
         0ld60sgE3pCId/Cgx6u7iX4RKXdEkiUUzklTq77qR9eoKMTWzW3Xcjb+5/g3taalIFiB
         bkWSgOFMPnCb0I02XC8no0R+DpTTQvxBpW3ZVgt29VPcBv76Dqy7cg43LV289EpB1ETG
         ZwxytAZ0toccjlmW/3VV8TNDtZjB9Svm2Nn3VaJAZ17YnKy+6XpEinSnV2lAmcG6pRCi
         ytOII7aTqQ2d4uJuCV7bXG3BFYYoeEuOfmJeUf+FrbB4PAVotIh+EPnK2r37Rdqnfp4n
         bfMA==
X-Gm-Message-State: APjAAAV1SFqy5/4UH2Kne82xHALINYRVKzQy5CFyDipbiznPpTMOR+WI
        S/b6dfxtWAGhJut7KxO5moHbY29YuvzHUeQeHiE=
X-Google-Smtp-Source: APXvYqw/dntoebDeFSNGndsXj4CSjqloFpHTg/ueKUrN5vQkZ5DcJK24HkUfI7B/jHqX+BqQnpcdRGiLNvG6ScF6vc4=
X-Received: by 2002:a92:1d51:: with SMTP id d78mr9177073ild.166.1572559423698;
 Thu, 31 Oct 2019 15:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191031184632.2938295-1-bjorn.andersson@linaro.org> <20191031184632.2938295-3-bjorn.andersson@linaro.org>
In-Reply-To: <20191031184632.2938295-3-bjorn.andersson@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 31 Oct 2019 16:03:32 -0600
Message-ID: <CAOCk7No0D2qyg-HFEcy_aog9eYOP2oSBPeVVfDAJ_90RCs=b1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Validate each segment
 during loading
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 31, 2019 at 12:48 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The code used to sync with the MBA after each segment loaded and this is
> still what's done downstream. So reduce the delta towards downstream by
> switching to a model where the content is iteratively validated.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Seems to be just fine on the Lenovo Miix 630

Reviewed-by: Jeffrey Hugo<jeffrey.l.hugo@gmail.com>
Tested-by: Jeffrey Hugo<jeffrey.l.hugo@gmail.com>
