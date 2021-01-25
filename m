Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250573049D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 21:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732354AbhAZFWo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:22:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730299AbhAYPpG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 10:45:06 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1116CC061355
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 07:18:49 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id q3so3342996oog.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 07:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tqHsUUcTKe2jpNesKI4Ls70gHgXQSHomQormGTtd+iw=;
        b=imItcls200JtD5a68DthH3lsLf4uMZWQ91vTV4g7TYBg/St0bmxyqGgdbR2rjn+iIn
         15IkSULWWDrZXcQisDmEKjoemcLL+w95s//mDlWuqpn1ypwxq18OsLoIHX0HT+7fnFBr
         gHfE+lEYIN24Q9D9WVpXPXNpVAUg4x06GLOOSCxEdKzQgDNUvqlA9INcdgIqp+3SN48t
         poqxp3XiVOn8u5prL2a86r9pykxuSIRUX6rqn25vYQ+ze2XDzkZIcwfhKgERUdL7a2RP
         i9m7zEA33fA7c7FxLWieFyPQBNFvXBOchQ0DN2rc1uL5FLu2bF83xmYA+emTYMDrPDHn
         6Lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tqHsUUcTKe2jpNesKI4Ls70gHgXQSHomQormGTtd+iw=;
        b=hl7bIOEU4m4TFVkm8gdL6fRdkxAICSewtY12vJLL+eyJ/9oYOLGewH27mjAIZmOk+D
         Mt+P56JAI3zHGgZRMvRt3VPjO1z0bFfNNK4e70UhyQ4bkBkKdpeCXbVlyoEi3CXLH0in
         SXgqulI8A+65MnrDTDQNh98SmSZL5aM0CF/WwXPIR7XHUVHqznr5y/w8uP3W+JwwXGiQ
         thKQuBfVhS8d6ZvVFZNihxcy15WoYYnR5DkzyJxV8U6RFfVGpRWkn1iaV0/Eoc2+97jw
         vkm+za3wVclF48Voh9HuglVO99HlD4AA2n5g9pDVkG1Fx08NmOp8oMgCUxNAdqDPflMr
         fKKA==
X-Gm-Message-State: AOAM530vyF8a/EKnTwHrndcy0nt3rWfFDk7hNyHgV0z5a6IuLi6xPuyj
        tIBqP4LuRCbR/uy6sE/t7Y4v1A==
X-Google-Smtp-Source: ABdhPJxhWtj7ijUayPT4NSsxAYdvO1VOqHaRxL5y+7iV9e5hW3l/lC2sNftCU/43hxqEuvMuSgiwdQ==
X-Received: by 2002:a05:6820:22c:: with SMTP id j12mr815447oob.65.1611587928383;
        Mon, 25 Jan 2021 07:18:48 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m7sm3524169otq.33.2021.01.25.07.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 07:18:47 -0800 (PST)
Date:   Mon, 25 Jan 2021 09:18:45 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        agross@kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: venus: core: Add sdm660 DT compatible and
 resource struct
Message-ID: <YA7hVQVTXT554cKN@builder.lan>
References: <20210115185252.333562-1-angelogioacchino.delregno@somainline.org>
 <20210115185252.333562-2-angelogioacchino.delregno@somainline.org>
 <2dc8a95f-110f-526f-18a8-6393e508c3a6@linaro.org>
 <eabc91cc-de96-08ef-756c-87fe43d6fadc@somainline.org>
 <cfc1998f-8d9b-5237-f286-7fdc69874b30@xs4all.nl>
 <40c38734-a69d-2314-c342-244ee5a0e6b1@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40c38734-a69d-2314-c342-244ee5a0e6b1@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 Jan 08:51 CST 2021, AngeloGioacchino Del Regno wrote:

> Il 25/01/21 11:40, Hans Verkuil ha scritto:
> > On 18/01/2021 18:45, AngeloGioacchino Del Regno wrote:
> > > Il 18/01/21 18:21, Stanimir Varbanov ha scritto:
> > > > > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
[..]
> > > > > +	.fwname = "qcom/venus-4.4/venus.mdt",
[..]
> > This patch can't be merged unless there is a corresponding firmware available
> > in linux-firmware. Is the current 4.2 firmware in linux-firmware signed by
> > Qualcomm? Can they provided 4.4 firmware as well?
> > 
> 
> If there is such issue, then maybe we should do "something" about it: I
> would then propose to remove all references to fwname and just get this
> done in DT, where every qcom board already specifies its own path for
> its own firmware.
> 

We have the same problem with production devices on e.g. SDM845, where
the firmware referenced by fw_name and present in linux-firmware won't
work on any real devices.

As such, providing means for specifying the firmware name in DT would be
a very reasonable thing, and in line with how we handle this in other
subsystems (using the firmware-name property, containing the full
relative path).

Regards,
Bjorn
