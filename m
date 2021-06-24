Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC233B3461
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 19:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhFXRLw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 13:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbhFXRLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 13:11:44 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 844A3C0617AF
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 10:09:22 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id i13so2864728ilu.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 10:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=ANhbTggsY3NFhRZExKMwUmb3VzJqye8XLvWVXSvNBkQ=;
        b=p95plxgcKdT8+TUJCmcKdAyJL6L8C+j3muAeTI6tbvEOMwKUFZvBH22Z3GEGxdnUZH
         d9XkDasjcz/bUj2n1PkWxPPQL/Sxtf1a7ckN43IkWwU4a9v6DYeOi9Tg8DPYHl700hH/
         xlmv54Ir2NUVB8zwaX1UsxTzP5GUW3mdywmszCeflzWKbXzDgkMNhx+qVsi3FklHnD5x
         fSDWvxz3POXOJ/0yZM+F2G99rPMTFJK+bPA5TWYu0VJpvpEjmQwRSgXLB6dx+kXpC0Uz
         JX+JhI0lSB7VkwJTdkbApCrUx6TGzp99N5mAm/d0lil4hmexz93RFAPSpMzmwkjNchKB
         rXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=ANhbTggsY3NFhRZExKMwUmb3VzJqye8XLvWVXSvNBkQ=;
        b=lGB49UkYl/miV8Smd970JYzrbQZItUJhHTsYIup2mxuABdYE3Xngpjw9zJErHCtk3l
         sEm8gm8eUWnXP4Qi1m47KHCxFOBLdwWxyszJzLOESb4+Z6MUvud+zhNZVyhrou4bbV+O
         Z8XAXVRmOWLqR7VRmp1IyqOahoChaNz7Lcr3F8UY83M8mUbq+63fh3TU+Q10FCNgXaEE
         66jlOqZ1eLmiwtsOTHsDvMqXdbbButJ1YCRtBh8bwEKN6jimV9SMzc2WDyKu3ZCZ94uR
         7eFUbzBVPdVJyN+QjmSeORSk1OEhPS6yvZ0IzI0XAFA2n8bPROTw/B3GVqlwUfhPKxim
         QV4w==
X-Gm-Message-State: AOAM533E22Fvg9XnhYWKjTQQvLoGNucNyHeI5j0RMtpHgiL9vBmrUU38
        SXAL0qPyztdRikJsv6vRWxTVWXJI+JWLaouxvMo=
X-Google-Smtp-Source: ABdhPJzkYUuO368jts0QgMQyJe9SHzg0U698qd8KdfojEfYsXnHtwMfPGxVHmw7fwQ64+IhHRhAEJH5nusdeW4BWzcA=
X-Received: by 2002:a05:6e02:524:: with SMTP id h4mr4098121ils.255.1624554560853;
 Thu, 24 Jun 2021 10:09:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6638:3aa:0:0:0:0 with HTTP; Thu, 24 Jun 2021 10:09:20
 -0700 (PDT)
Reply-To: tutywoolgar021@gmail.com
In-Reply-To: <CADB47+4Wa3T59Vq_==GTXEfHrX5x-2vQFxaTBO0dTdyAweCVpw@mail.gmail.com>
References: <CADB47+4Wa3T59Vq_==GTXEfHrX5x-2vQFxaTBO0dTdyAweCVpw@mail.gmail.com>
From:   tuty woolgar <faridaamadoubas@gmail.com>
Date:   Thu, 24 Jun 2021 17:09:20 +0000
Message-ID: <CADB47+607zNBfYFb4bj0nUhuuYgAdwT=G_wJ9-EeV0ESHe56Jg@mail.gmail.com>
Subject: greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

My greetings to you my friend i hope you are fine and good please respond
back to me thanks,
