Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13AD8309F5D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 00:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhAaXIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 Jan 2021 18:08:21 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:33444 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229852AbhAaXHD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 Jan 2021 18:07:03 -0500
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 30B2AC1BE0; Sun, 31 Jan 2021 23:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1612134370; bh=ZcNE+YqUbFE7ilb2fMS+PExd3K0uSxm8CKC9+sqOxqI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=uvMrcujV8rQrnfI7s6nm6b1D/zJcUE6lUEd4Hm4DBgu0JxZ/QSZjbP8oorF9lT3mP
         FYeFwv0F/V7KV5jtmuNl+sho9k0k3mos/7sUCz0vs2oZchxUw/OVE8wrejHinKh/Iz
         3o8ZqCW+9/hhOn3stJY0pHiHSn5UCx46n2F5wHoY=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (80-110-106-213.cgn.dynamic.surfer.at [80.110.106.213])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 29673C1BDD;
        Sun, 31 Jan 2021 23:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1612134362; bh=ZcNE+YqUbFE7ilb2fMS+PExd3K0uSxm8CKC9+sqOxqI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=P+jxQO2i9OTmHF2los3Da52AJ1CD+bg6SSnGdH4SsZ7unxE0cYr9VPx01GTKErHab
         aByOXK/nI9vwnyZ+Hqquf6uc3rFWN9KRL1aAdve6ef7FfzchB+GsRuZX0QT6yVTTGS
         YmiozrIwJnxsZ/30GSXRkXNPAajuYnuJqEATRi6o=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Rob Clark <robdclark@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Lee Jones <lee.jones@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Fix wait-for-commit for cmd panels
Date:   Mon, 01 Feb 2021 00:06:01 +0100
Message-ID: <2117852.HdQyuLfLX8@g550jk>
In-Reply-To: <20210127152442.533468-1-iskren.chernev@gmail.com>
References: <20210127152442.533468-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Iskren,

On Mittwoch, 27. J=E4nner 2021 16:24:40 CET Iskren Chernev wrote:
> Before the offending commit in msm_atomic_commit_tail wait_flush was
> called once per frame, after the commit was submitted. After it
> wait_flush is also called at the beginning to ensure previous
> potentially async commits are done.
>=20
> For cmd panels the source of wait_flush is a ping-pong irq notifying
> a completion. The completion needs to be notified with complete_all so
> multiple waiting parties (new async committers) can proceed.
>=20
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Fixes: 2d99ced787e3d ("drm/msm: async commit support")
> ---

I've tested this now on fairphone-fp2 and lge-nexus5-hammerhead, works grea=
t!

Tested-by: Luca Weiss <luca@z3ntu.xyz>

Regards
Luca


