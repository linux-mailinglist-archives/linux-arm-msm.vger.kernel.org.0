Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5789F1F69D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 16:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbgFKOWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 10:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728023AbgFKOWF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 10:22:05 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4F0C08C5C2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 07:22:04 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id er17so2689610qvb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 07:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6hofwZ2yoq+7/to2SRh9W0Ap352IbY6yV3Ps2K/UGwM=;
        b=qSLm4oSN+A21Re/2nMPJMW8aZ5Q7dCftm4PQzoefUzMZWAwSBnjxtVi/Ja8cXFP/yK
         O9FgyZ9MkiIjtBPMDsH1jp5b/hZkmuIsSl/I7CKvouY+Se7Al2I8IEbf2wjHFiutAixj
         5k4iw2jjI4DL6lgDsbLm5P46+kelUl1feOz060OleLvqwU40vwCcWmAbOMhSTBRu/Rd2
         PKqVYxNfQwYMThXlCqd4JJy15JzMVoV6ffDZwaGUvFJwNxP363Va6Hh967fY05zu9c5v
         EvJNqrZJgBKgX1Zp0u+sSi8zY5Ba0WlKIYzR84KSvuirDcVWJqe0dz0Y3ZZmoWMYFW8Q
         G4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6hofwZ2yoq+7/to2SRh9W0Ap352IbY6yV3Ps2K/UGwM=;
        b=B6ILubqlRl/I/1f1Bz8a04RTNd7lvnvcZN6qDYlryR4Y/xhXj0wSe4Hlq0sfdGE2sY
         72ahrd01Iildj9XCrGhaV5/4JoXM8OiVaAxPh8siM0yuwinkR8fcrqZSxvCczKZtk3eW
         xMw6IBD1SXAfYZ/fpinsa42QIy0+mMdLbueziff2iFfa0uarnj/zBLuAEUpF5+GLEzpR
         QuaTijdBqDscrjgNR1nxLuAzQG484kiiWlpTTITdLqkdTcnNXRPDR8zJuUDmA165Cqgk
         xMaFHapF+JOtKKMwTPvCyXCNxqSHAFP7mu2rhwMgF87CI+EM4+IbBcWGCVJdFr7+b6Z4
         kOMw==
X-Gm-Message-State: AOAM5325V2r8JC+/uEoKHP5/4enuV2IDzl/utu+shSpdo/TtCydK3zq+
        39bVbaNIwEmKbTESqqTaGL7Eqg==
X-Google-Smtp-Source: ABdhPJwGOSpGGhKMmhV826+EGCU6GbpY9XfCjPivDsjrdzlrcdi5DJLEQ8Q7H3z/c1Nk48C3JvSz4A==
X-Received: by 2002:a0c:f949:: with SMTP id i9mr7996106qvo.75.1591885323292;
        Thu, 11 Jun 2020 07:22:03 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id w13sm2363770qkb.91.2020.06.11.07.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 07:22:02 -0700 (PDT)
Message-ID: <f07c4aab69d2b333c0e36c50c526c0a85322e708.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 0/1] Add LTR controls
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Dikshita Agarwal <dikshita@codeaurora.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com,
        boris.brezillon@collabora.com, ribalda@kernel.org,
        paul.kocialkowski@bootlin.com, posciak@chromium.org,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        majja@codeaurora.org
Date:   Thu, 11 Jun 2020 10:22:00 -0400
In-Reply-To: <1591871121-25420-1-git-send-email-dikshita@codeaurora.org>
References: <1591871121-25420-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Le jeudi 11 juin 2020 à 15:55 +0530, Dikshita Agarwal a écrit :
> LTR (Long Term Reference) frames are the frames that are encoded sometime in the past
> and stored in the DPB buffer list to be used as reference to encode future frames.
> One usage of LTR encoding is to reduce error propagation for video transmission
> in packet lossy networks.  For example, encoder may want to specify some key frames as
> LTR pictures and use them as reference frames for encoding. With extra protection
> selectively on these LTR frames or synchronization with the receiver of reception of
> the LTR frames during transmission, decoder can receive reference frames more reliably
> than other non-reference frames. As a result, transmission error can be effectively
> restricted within certain frames rather than propagated to future frames.
> 
> We are introducing below V4l2 Controls for this feature
> 1. V4L2_CID_MPEG_VIDEO_LTRCOUNT
>     a. This is used to query or configure the number of LTR frames.
>        This is a static control and is controlled by the client.
>     b. The LTR index varies from 0 to the max LTR-1.
>     c. If LTR Count is more than max supported LTR count (max LTR) by driver, it will be rejected.
>     d. Auto Marking : If LTR count is non zero,
>         1) first LTR count frames would be mark as LTR automatically after
>       	   every IDR frame (inclusive).
>         2) For multilayer encoding: first LTR count base layer reference frames starting after
>            every IDR frame (inclusive) in encoding order would be marked as LTR frames by the encoder.
>         3) Auto marking of LTR due to IDR should consider following conditions:
>             1. The frame is not already set to be marked as LTR.
>             2. The frame is part of the base layer in the hierarchical layer case.
>             3. The number of frames currently marked as LTR is less than the maximum LTR frame index plus 1.
>     e. Encoder needs to handle explicit Mark/Use command when encoder is still doing "auto" marking

Perhaps we are missing a LONG_TERM_REFERENCE_MODE ? I bet some encoder
can select by themself long term references and even some encoders may
not let the user decide.

(not huge han of LTR acronyme, but that could be fine too, assuming you
add more _).

> 
> 2. V4L2_CID_MPEG_VIDEO_MARKLTRFRAME :
>     a. This signals to mark the current frame as LTR frame. It is a dynamic control and also provide the LTR index to be used.
>     b. the LTR index provided by this control should never exceed the max LTR-1. Else it will be rejected.

The "current" frame seems a bit loose. Perhaps you wanted to use buffer
flags ? A bit like what we have to signal TOP/BOTTOM fields in
alternate interlacing.

> 
> 3. V4L2_CID_MPEG_VIDEO_USELTRFRAME :
>     a. This specifies the LTR frame(s) to be used for encoding the current frame. This is a dynamic control.
>     b. LTR Use Bitmap : this consists of bits [0, 15]. A total of N LSB bits of this field are valid,
>        where N is the maximum number of LTRs supported. All the other bits are invalid and should be rejected.
>        The LSB corresponds to the LTR index 0. Bit N-1 from the LSB corresponds to the LTR index max LTR-1.

Note, I haven't captured very well the userspace control flow, perhaps
this could be enhanced through writing some documentation.

As per all other generic encoder controls, we need to make sure it will
be usable and flexible enough for multiple HW blocks, as it can be
tedious to extend later otherwise. It is important that along with this
RFC you provide some comparisons with with other HW / SW APIs in order
to help justify the design decisions. I also think there should be 
link made V4L2_CID_MPEG_VIDEO_GOP_* , number of B-Frames etc.

regards,
Nicolas

> 
> Dikshita Agarwal (1):
>   media: v4l2-ctrls:  add control for ltr
> 
>  drivers/media/v4l2-core/v4l2-ctrls.c | 6 ++++++
>  include/uapi/linux/v4l2-controls.h   | 4 ++++
>  2 files changed, 10 insertions(+)
> 

