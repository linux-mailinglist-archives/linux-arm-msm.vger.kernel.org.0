Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9B61D3551
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 17:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgENPjP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 11:39:15 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:43089 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbgENPjO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 11:39:14 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mtxxk-1jEQof0Du8-00uHps for <linux-arm-msm@vger.kernel.org>; Thu, 14 May
 2020 17:39:13 +0200
Received: by mail-qk1-f182.google.com with SMTP id y22so3418965qki.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 08:39:12 -0700 (PDT)
X-Gm-Message-State: AOAM532iVdkHjKiR/q844vKsbmHsx3Hj5Ql7h1qXarb8BjSCOAdxnwPD
        46f2K0WX9o+fBO/8zWkG/LKyRY9XFvLD6Cj9J8k=
X-Google-Smtp-Source: ABdhPJz2o7raWnxXBssGaBCg6CiOw8+vkSEFJ0EmJwTUKbPf6BgjQmgnIURtzRs/mVFm6s1Off1dhreOumUJgEJsAJI=
X-Received: by 2002:a37:c96:: with SMTP id 144mr5476252qkm.138.1589470751965;
 Thu, 14 May 2020 08:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200429052932.GA2627045@builder.lan> <CAOCOHw4GmTYiXrd3z9B-YHq3wcwLYXg4y=nkJWhLCDw9G08KqQ@mail.gmail.com>
In-Reply-To: <CAOCOHw4GmTYiXrd3z9B-YHq3wcwLYXg4y=nkJWhLCDw9G08KqQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 14 May 2020 17:38:55 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0D3dkDynhsGaMYnDzS-ypE_t_tY9Pq89jjdj-kXNigoA@mail.gmail.com>
Message-ID: <CAK8P3a0D3dkDynhsGaMYnDzS-ypE_t_tY9Pq89jjdj-kXNigoA@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT fixes for v5.7
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LAKML <linux-arm-kernel@lists.infradead.org>,
        Andy Gross <agross@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4yIxTT/DRoE4JGEGGuAR6CG7N1qvREwbRy8B+lblKp6SB0o+iKR
 ZbyLjaV1C914DzJurI21xNBGIKEH0+Cx9GJKabk7rmtkKqlrzwE+azquCHnZgHIqxgMPMMn
 UUVbLEgDlA3asKyx2oCm5b3wjBlQEUCPqXdheLGrhV0tCn0EdXAedBg/gIp8PGlg7BR1gfL
 Fu2H7EKxknqZPw41RB2zg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:l47ETW0ouK4=:5NWRNyVyTWsPn1vhiAFBhT
 pn4Wl/9iG/N+6Te+9v5F9nYjAqb09lIysmvS/ZqI8IPtbQPGa35AUzoX1vD3VFx1lkIwG3Rwn
 yXiAbkEb1h7GNn6CcJ6oP16pAdXlhUEzY2h2Yk0ftHA4HZLnocKPXqZj5cGlbaefjydszMl4A
 swwR8av3JOZu1NI0vZc3GMoIGxnMEGisaBXuh7qYPC7DAA6p85a/ROT6wykHxepuwxTker7bn
 vI49OJA98rWprK0cMYxwddlvYV5CdeSqizsdBdSG7vzpnWLBqAQR2uLPWduazoXZarDrFeZzY
 zZdlD7SbGNp7c468nd0aANg/oIqU/kAouOHoo0coC3A4c7tUvxW8SPKtt5JNQ5Z91EhvahZ/Q
 2W2Zi58AR6ANO3bhFGVTD8D5gzpjHr65ogUcsCz4Yl/eSSCxtYXB7Ny9LoiDawt8pojjEyFRK
 Tw/Pp2HJdlYROmOBbZaFF9xSzxabYjxPpGpjvnkNT+qP/31195Bz7gPNYSJwedm174sqz4MJ8
 jphFBWrwW8t9AXBSjJ/s6NqkT9OwSU4a+LEhTmmIYLwSbxJqzmkrB0x083/EhZPpH/9kGig6Y
 l5+DxUbX2LkFb2dC4+5ZrPHqNrK4e7qIBN7XIJJ/epYAGBQTXynbsJPtjZ6Pyg7RgEKDuyhks
 K7AzArJf5R92aKuEZePsg4u0vi6Yal/O3WN6SYWfKPa687A8N19AO3LjdTHs7zVSWrowWICus
 wgdlmYF6dNM7LZnjuiVs1DTq3Jgy6TEexQDlSU39w7bte4A4oUkKekjXPW5eBjt3xrIPqN2ok
 1zFyXjgl9hlWAoJwf3oaY/RYQ2MaAYvFFM2CWl0PeEIg+i8VxM=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 4:02 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Arnd, Olof?
>

I finally pulled it in last night, sorry for the delay. I think my git
push came too late
for today's linux-next, but the branch was successfully build tested
along with the
other fixes we got for v5.7, so I plan to forward it all tomorrow.

     Arnd
