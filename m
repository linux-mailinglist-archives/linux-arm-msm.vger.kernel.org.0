Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7394C1135C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 20:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbfLDTgS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 14:36:18 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41998 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbfLDTgR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 14:36:17 -0500
Received: by mail-oi1-f196.google.com with SMTP id j22so337965oij.9;
        Wed, 04 Dec 2019 11:36:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4l/JtwjXT1qBF416IXv0Ieqm2uxNXQ8tl4ay1L+NPDw=;
        b=LW73LAQFfDiK4SOItykcM2bw5lvrfKW2sCQlh3mkdStsDutkGWLTvdcdZbcBohHnyr
         0ywTA/nHRoOwkVOf9hAqp23y1WVzSUNrvWpaL3NXh2rxHFk2x/gvQZBANCqhC17Vv1gF
         SuQhBEkCenZH9tQJ5sXzMVWLXJYLmeblOB47z8b1S3mv/gW65yaDqM+vSsK7ngtUme+O
         GD0zF71qNo5GC6G7iO/wbbIpmjsey5YD+OqJB8NMO9aQmKudwrtJHp1VP5LmuimYWTqb
         f4TeOJRPaGKqmXVen4/aVCWrOrE9xKbIXAaXqTDErN6d07dH34Mbpwh59EKF04yFcjEC
         BPGQ==
X-Gm-Message-State: APjAAAVgnbR3bg8G6RAyNyc56PK6XI/CwfVFT96CUJrve98jHF1I9L0A
        /88EkG71l2EuHSkiUpmh8A==
X-Google-Smtp-Source: APXvYqwbYbRZksHTtKqsDfJTwU2S/KsK6vdSez9yw9Sp1yFW45VcbvaETJUBHHTwFZidWzmuVFrCmg==
X-Received: by 2002:a05:6808:b26:: with SMTP id t6mr3792135oij.123.1575488176840;
        Wed, 04 Dec 2019 11:36:16 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m68sm2634826oig.50.2019.12.04.11.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 11:36:16 -0800 (PST)
Date:   Wed, 4 Dec 2019 13:36:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: drm/msm/gpu: document second
 interconnect
Message-ID: <20191204193615.GA20880@bogus>
References: <20191122012645.7430-1-masneyb@onstation.org>
 <20191122012645.7430-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122012645.7430-2-masneyb@onstation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 21 Nov 2019 20:26:42 -0500, Brian Masney wrote:
> Some A3xx and all A4xx Adreno GPUs do not have GMEM inside the GPU core
> and must use the On Chip MEMory (OCMEM) in order to be functional.
> There's a separate interconnect path that needs to be setup to OCMEM.
> Let's document this second interconnect path that's available. Since
> there's now two available interconnects, let's add the
> interconnect-names property.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
