Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD391314FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 16:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgAFPl1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 10:41:27 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44072 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgAFPl1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 10:41:27 -0500
Received: by mail-ot1-f65.google.com with SMTP id h9so69580979otj.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 07:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y8IES6HISTG+SdOPlL+1G6OGCXcHhR1Kwx+d1psOx6E=;
        b=A/hQN42GUKYCj6DWTcALCb3Epd4jbXz/PYMJb4OKp8wIQbjEOxyNB7R5uPpYJPhC7f
         hy+rR7T5tI36+3wt1EVElgbCyq+4D0woDFrf3qBxdTSapKbIuphv9B3JBKfRd7Cz/+nm
         0G4rYmcLPrjWAgdIsx9+pnmvBz3ithjZMlqyT2gXQflEQRexiGljUv2bmwBiaIsHp7nt
         0VTjCpwrCMYPI9Q7du29VXaYm0KPf5aHCehJXeiwI6Z4wowt5vZEXvU9AeKVmBxaegxV
         lfX4pPvl6FfhsJ1G5tB4IvTPVTkEMs1L9oiSQbgp53NxCKhkRYhEIWHocGzeOHiEXtMZ
         bwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y8IES6HISTG+SdOPlL+1G6OGCXcHhR1Kwx+d1psOx6E=;
        b=pP9fBK2UoTN0dQx2Ksyoq0V8d/wEEpz8YgjQi9dKFaRuqqndxFHnAkbn/jQnR76h+O
         waeTZo+lOg8aAkDs1Zm+j38aG6iInTI+UzM4vaF/asXs8NjE/y70/iYoFT1jERf4LT99
         sUg6lzzGDHxxwHS8UsrU99VS/4MPkse3IErsJyVcJtFGAFXDWtgG3mppuGfTQARkWkGl
         33KDCy/gZuKvxVL4QdFuxMVKhOHBdOA3iQyuIJKkEryJ/3uiHJgAihwVuieeBo0uGQTL
         o8pzFC7Y9YZlZ5Bx761fE7M1hxW2KpXSxJpv53dZ1y7YNkxoM2Mjt5NvsW6LwtDaovzB
         ZUkw==
X-Gm-Message-State: APjAAAW1mTe0mLUEWyT4pTymuh+YjX8YU3sAZBeI/AgIKD9QNqRHeHlG
        BVNc1jeokQp1y39XqrHmwVl/Mw9donpOgOhbqOU3wA==
X-Google-Smtp-Source: APXvYqxMxBRuvziTvwFtCccSGtHvp5npctpcaeHtCXswJJIeuVXES6EGhCN6IlHP/1ZGo2I6xEgQbQGoNvu8QrkEies=
X-Received: by 2002:a9d:3b09:: with SMTP id z9mr117482768otb.195.1578325286854;
 Mon, 06 Jan 2020 07:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20200106153325.1281420-1-robert.marko@sartura.hr> <99688b30-b3d6-e1c7-7a4c-9ff2e7b3cd38@phrozen.org>
In-Reply-To: <99688b30-b3d6-e1c7-7a4c-9ff2e7b3cd38@phrozen.org>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Mon, 6 Jan 2020 16:41:16 +0100
Message-ID: <CA+HBbNGPiUyWDQ7Jw-3_YVoqkfTqstyUmfH3B0nUM7kTRb5KnQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] phy: add driver for Qualcomm IPQ40xx USB PHY
To:     John Crispin <john@phrozen.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 6, 2020 at 4:34 PM John Crispin <john@phrozen.org> wrote:
>
> On 06/01/2020 16:33, Robert Marko wrote:
> > +
> > +#define PHY_CTRL0_VAL        0xA4600015
> > +#define PHY_CTRL1_VAL        0x09500000
> > +#define PHY_CTRL2_VAL        0x00058180
> > +#define PHY_CTRL3_VAL        0x6DB6DCD6
> > +#define PHY_CTRL4_VAL        0x836DB6DB
> > +#define PHY_MISC_VAL 0x3803FB0C
> > +#define PHY_IPG_VAL  0x47323232
>
> This patch was previously nak'ed as the magic values are considered
> black box FW blobs
>         John
Ok, I was not able to find any info why it was not merged as only
feedback on it was ACK.
