Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2496438AE85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 14:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239509AbhETMkc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 08:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbhETMkV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 08:40:21 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D080C04C3D8
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 04:55:01 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id b7so4726997plg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FssKbDFPY84FqxgRVczPOQqjaBhVLv/zqtosL172dAg=;
        b=Ozji9B7yvpIIIu5G7KIaK5nxYDL6KtsKb7UayXC0ku2+yWb86BDep+IyAO3Llj/WiS
         eDsolB/vooHciUlnNSx2KjS8u0H9ow6pUNXew+nE8jRfuzFsejV/Qsh0BUpTX9rVu4tx
         CtSPIGWq/dnguqy0H7oGb4aG0wdM+oNlAj3qiNUWL3I+tHE8/x3ynjJ7ddzVwRkPFXHq
         /5obJC6dXSbEyJ4WcBh8YT2hxZtoasYW8Kp/D2PCqBOOPEywsIXdtTssqXTBXgsxMClk
         KNM13psztzO2HrdKg7hYrvWcnxzKZDWFV6anMJuku1CObBqcS6rHxFKucTjmK91nOCFY
         XLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FssKbDFPY84FqxgRVczPOQqjaBhVLv/zqtosL172dAg=;
        b=FAFmRQ2KBFhulgvXEKGl5UXSGTStTXKkCa0wu5QNbuEdopd81hYDR5FNT4DjPoe3Z2
         8h7KolsmFcEI75ORZ37GZ/DXO52Tdj1DN0MmfFtZu859ohaGC8N4ReaF+a1RQF/MpgTo
         hh3svAc5ek4teWT/aXt2ZlL2P9bVLcHhxjsRkgbPGquRA/NH9q5NbLPsN7FC6x+pU5Js
         X/7yexAfTalYP6Dj5NyYc+6kEmlVqi7c+jfg9oBi5PwGwptO6TgPz2UQ5Zh/e7I63rsE
         kaSgaVRk4S9aTV2m1DOedKIKkiRIzglR+BUgNIBdk6kXkga/KpkjcjicVj+2cokKjLSG
         8kTg==
X-Gm-Message-State: AOAM531YiY2DX9I+FvAEwtRWvpmghk/lGZBzMjEnxuix96oRWSx2bQnx
        RWFk1MLhJ9qzMt46DKsSbTZQJ25qLEnf0nFkTidi0A==
X-Google-Smtp-Source: ABdhPJzZhJPDqB5Bu92WJSnbUI2ZhtvlXOs8/Jk5M3ss5oQPFYlNS1TEf+8BglgT/2Rg0R8wB000YuCnqz05Of3sKsY=
X-Received: by 2002:a17:902:8693:b029:f3:b47e:6a08 with SMTP id
 g19-20020a1709028693b02900f3b47e6a08mr5362284plo.69.1621511700665; Thu, 20
 May 2021 04:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-8-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-8-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 20 May 2021 13:54:49 +0200
Message-ID: <CAG3jFyt7vG4jQux76+g9r=ohJzhqBDE7g3A1LiwK_pUv2VBbzg@mail.gmail.com>
Subject: Re: [PATCH 07/17] media: camss: csid-170: support more than one lite vfe
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Change the IS_LITE condition so that it returns true for the second lite
> vfe found on titan 480 hardware (8250), which will have id == 3.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
> index 3958bacd7b97..af134ded241d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
> @@ -21,7 +21,7 @@
>   * interface support. As a result of that it has an
>   * alternate register layout.
>   */
> -#define IS_LITE                (csid->id == 2 ? 1 : 0)
> +#define IS_LITE                (csid->id >= 2 ? 1 : 0)
>
>  #define CSID_HW_VERSION                0x0
>  #define                HW_VERSION_STEPPING     0

Reviewed-by: Robert Foss <robert.foss@linaro.org>
