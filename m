Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DBA3D2F80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 00:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhGVV2h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 17:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbhGVV2g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 17:28:36 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801A3C061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 15:09:10 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id w8-20020a0568302808b02904ce2c1a843eso174038otu.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 15:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=VxPtTyDnbKdFhgXCCn4QqHsoTqz/m8J6bRqsRz2hob4=;
        b=RhsyBT3smW09/d+mV3cAkLf8mUDcgRa98ny9KBq64hFaYy7eBfpEtsyTW2X2U1o7Wu
         jG1ugSygYSUEJHrC+UZ24sEC2pxjv+I9KR06a2FA5rR9jrrby73yrF+C73AjmSh7AFnD
         hDBB7hmgU9yXAWQUV4k3jv+vFOZdZ5yMxWQ7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=VxPtTyDnbKdFhgXCCn4QqHsoTqz/m8J6bRqsRz2hob4=;
        b=XRPEqS6oktlriaPtiIEtnknLGAmBeNGL5d1mEkSdThtFYuZSi+C0LWMelRQROtS9ZW
         aokBaFUF/ERjqbf7yLobKEsVOKEWZHWQzGh5ULM9U/xE1p76v8jmKKuuEp79z240Rzk9
         Lc2r18316S5q9KHPmB73qh3qlMbMPIZVl37yXnFqyyKUEezFZQUTfy2ykZgG/N83qiXW
         1NfQD7t82djc1I4Ufe7ToEPmLcfsOdyKScj3A5L0jgdbmbJ/hVmW67ewN1cwq8MCymHF
         gO5m7PahQaO6QFejtLgrR1HaonRKUuF/pCgeVRtlQdkJkk6Ig6oTBN1sGYR+LfSFI3qf
         U/ZA==
X-Gm-Message-State: AOAM532OOUsn+qYBRu6b8Z6JWQcWe2aiSU0qPEZh9dkDnQ17dnkaxEZ/
        IfePR/Agi0UQ46RUVn0Uf1Wz263wZZFfrRfbY2rfwg==
X-Google-Smtp-Source: ABdhPJwSAou744IO5xsHJaf7ML4r6JmUg3v1Hqcu4+7d/Wc1m7Yo0TQLNIT2sJkRNe9bEISqELAFMOuQ62sNMkX6qNA=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr1225563otf.25.1626991749618;
 Thu, 22 Jul 2021 15:09:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 22:09:09 +0000
MIME-Version: 1.0
In-Reply-To: <4a97d331d7a60cb4756899d98f81ca4f@codeaurora.org>
References: <1626909581-2887-1-git-send-email-maitreye@codeaurora.org>
 <CAE-0n50zCC9m9Wr6WUvM=mfaQ7GXVEjHNC_T2RfN1=9Y1U_qsg@mail.gmail.com> <4a97d331d7a60cb4756899d98f81ca4f@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 22:09:09 +0000
Message-ID: <CAE-0n522OEz8YwKRb8VZtSbwAdjXReEPCwvL8N7kWycGSrbvxw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: add logs across DP driver for ease of debugging
To:     maitreye@codeaurora.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        abhinavk@codeaurora.org, khsieh@codeaurora.org,
        seanpaul@chromium.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting maitreye@codeaurora.org (2021-07-22 14:33:43)
> Thank you Stephen.
>
> On 2021-07-22 13:31, Stephen Boyd wrote:
> > Quoting maitreye (2021-07-21 16:19:40)
> >> From: Maitreyee Rao <maitreye@codeaurora.org>
> >>
> >> Add trace points across the MSM DP driver to help debug
> >> interop issues.
> >>
> >> Changes in v4:
> >>  - Changed goto statement and used if else-if
> >
> > I think drm likes to see all the changelog here to see patch evolution.
> >
> Yes, I will fix this
> >>
> >> Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
> >> ---
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c
> >> b/drivers/gpu/drm/msm/dp/dp_link.c
> >> index be986da..8c98ab7 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> >> @@ -1036,43 +1036,28 @@ int dp_link_process_request(struct dp_link
> >> *dp_link)
> >>
> >>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
> >>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> >> -               return ret;
> >>         }
> >> -
> >> -       ret = dp_link_process_ds_port_status_change(link);
> >> -       if (!ret) {
> >> +       else if (!(ret = dp_link_process_ds_port_status_change(link)))
> >> {
> >>                 dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
> >> -               return ret;
> >>         }
> >> -
> >> -       ret = dp_link_process_link_training_request(link);
> >> -       if (!ret) {
> >> +       else if (!(ret = dp_link_process_link_training_request(link)))
> >> {
> >>                 dp_link->sink_request |= DP_TEST_LINK_TRAINING;
> >> -               return ret;
> >>         }
> >> -
> >> -       ret = dp_link_process_phy_test_pattern_request(link);
> >> -       if (!ret) {
> >> +       else if (!(ret =
> >> dp_link_process_phy_test_pattern_request(link))) {
> >>                 dp_link->sink_request |=
> >> DP_TEST_LINK_PHY_TEST_PATTERN;
> >> -               return ret;
> >> -       }
> >> -
> >> -       ret = dp_link_process_link_status_update(link);
> >> -       if (!ret) {
> >> +       }
> >> +       else if (!(ret = dp_link_process_link_status_update(link))) {
> >
> > The kernel coding style is to leave the brackets on the same line
> >
> >       if (condition) {
> >
> >       } else if (conditon) {
> >
> >       }
> >
> > See Documentation/process/coding-style.rst
> >
> Yes, I will fix this
>
> > Also, the if (!(ret = dp_link_...)) style is really hard to read. Maybe
> > apply this patch before?
> >
> > ----8<----
> > diff --git a/drivers/gpu/drm/msm/dp/dp_link.c
> > b/drivers/gpu/drm/msm/dp/dp_link.c
> > index 1195044a7a3b..408cddd90f0f 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_link.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> > @@ -1027,41 +1027,22 @@ int dp_link_process_request(struct dp_link
> > *dp_link)
> >
> >       if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
> >               dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> > -             return ret;
> > -     }
> > -
> > -     ret = dp_link_process_ds_port_status_change(link);
> > -     if (!ret) {
> > +     } else if (!dp_link_process_ds_port_status_change(link)) {
> >               dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
> > -             return ret;
> > -     }
> > -
> > -     ret = dp_link_process_link_training_request(link);
> > -     if (!ret) {
> > +     } else if (!dp_link_process_link_training_request(link)) {
> >               dp_link->sink_request |= DP_TEST_LINK_TRAINING;
> > -             return ret;
> > -     }
> > -
> > -     ret = dp_link_process_phy_test_pattern_request(link);
> > -     if (!ret) {
> > +     } else if (!dp_link_process_phy_test_pattern_request(link)) {
> >               dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
> > -             return ret;
> > -     }
> > -
> > -     ret = dp_link_process_link_status_update(link);
> > -     if (!ret) {
> > +     } else if (!dp_link_process_link_status_update(link)) {
> >               dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
> > -             return ret;
> > -     }
> > -
> > -     if (dp_link_is_video_pattern_requested(link)) {
> > -             ret = 0;
> > -             dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
> > -     }
> > +     } else {
> > +             if (dp_link_is_video_pattern_requested(link))
> > +                     dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
> >
> > -     if (dp_link_is_audio_pattern_requested(link)) {
> > -             dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
> > -             return -EINVAL;
> > +             if (dp_link_is_audio_pattern_requested(link)) {
> > +                     dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
> > +                     ret = -EINVAL;
> > +             }
> >       }
> >
> >       return ret;
> The reason I did this was to preserve the value of ret as the caller of
> the function checks it. Some functions return -EINVAl like in here:
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/dp/dp_link.c#L972
> , so to check that it would be necessary to get the ret value.

ret is overwritten multiple times. The logic seems to be if ret is
not-zero, reassign it, until we get to the end. How about this

----8<----
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 1195044a7a3b..e59138566c0a 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1027,41 +1027,27 @@ int dp_link_process_request(struct dp_link *dp_link)

 	if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
 		dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
-		return ret;
-	}
-
-	ret = dp_link_process_ds_port_status_change(link);
-	if (!ret) {
+	} else if (!dp_link_process_ds_port_status_change(link)) {
 		dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
-		return ret;
-	}
-
-	ret = dp_link_process_link_training_request(link);
-	if (!ret) {
+	} else if (!dp_link_process_link_training_request(link)) {
 		dp_link->sink_request |= DP_TEST_LINK_TRAINING;
-		return ret;
-	}
-
-	ret = dp_link_process_phy_test_pattern_request(link);
-	if (!ret) {
+	} else if (!dp_link_process_phy_test_pattern_request(link)) {
 		dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
-		return ret;
-	}
-
-	ret = dp_link_process_link_status_update(link);
-	if (!ret) {
-		dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
-		return ret;
-	}
-
-	if (dp_link_is_video_pattern_requested(link)) {
-		ret = 0;
-		dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
-	}
-
-	if (dp_link_is_audio_pattern_requested(link)) {
-		dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
-		return -EINVAL;
+	} else {
+		ret = dp_link_process_link_status_update(link);
+		if (!ret) {
+			dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
+		} else {
+			if (dp_link_is_video_pattern_requested(link)) {
+				ret = 0;
+				dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
+			}
+
+			if (dp_link_is_audio_pattern_requested(link)) {
+				dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
+				ret = -EINVAL;
+			}
+		}
 	}

 	return ret;
