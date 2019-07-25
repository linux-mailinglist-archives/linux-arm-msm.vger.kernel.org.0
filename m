Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02C167553D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 19:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728995AbfGYRSu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 13:18:50 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40504 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728291AbfGYRSt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 13:18:49 -0400
Received: by mail-pg1-f195.google.com with SMTP id w10so23373645pgj.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 10:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:cc:from:user-agent:date;
        bh=pKF4uTEG2V2736jXBsUmCSSZEQt/JQWcWxojg2SNHvQ=;
        b=YzYCDtwsX9ubBUiVtnqndDSs3hmpOz1P0CeQ2TgcZ8Gn4gowsx2EV6xe/gDciXbo2V
         cXdMt+RL/GjOKn65B/pUAoWDBBVtRu8cL07AYgSTHhJrpiSVUcvsdrZEvC/sw2oNtyHQ
         J06ebgNs46VM6Kb3iZgbNX/a4WxRa0QpnyGOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
         :user-agent:date;
        bh=pKF4uTEG2V2736jXBsUmCSSZEQt/JQWcWxojg2SNHvQ=;
        b=mjBu6oyWxeiHqSKCjuDgaKDE6kBgKI7Q26SXaXCVXSQ/xTDwzs3g+IoinulmzbP/AX
         LmrQYtn6LGvW6hHdaPtLag0ECpP3StE9w4owRlPi0jAR9BomdMbpq0+sbCe+P7zhBYaD
         v1zHcRUK8u+pelPWXa/xuIIXCeye2BZvMC4FHCsTmlxH6q3/PXskdL+Xa3rdQgWkpl8z
         K28sz6u/7IJh3kLigLl/HL9D5eWuU3PQCTGOaESSxvWRgYgSvnDUO2opUEmDE1UBVrZK
         BPu0DZIw4qFDljW2kB3WizCgCrNMfUe8a/qelJqtTL7JAksOverLIZZOPVju/u/cRTn0
         3PtA==
X-Gm-Message-State: APjAAAUmkXE0KgpCqt/9sqBeS5wCrr6Ty9L5+UvDTs5P+TbBgL05jvJU
        dn1M1V0fteazr1eLa/yww2Ub5g==
X-Google-Smtp-Source: APXvYqwyvvB59B3ughI+E3wp1WnBBj0Dam/Cxzjm5SQLtruxS4EDniq2hIg9r9i6o5dS5o9HEqeP6A==
X-Received: by 2002:a63:7245:: with SMTP id c5mr73569315pgn.11.1564075129171;
        Thu, 25 Jul 2019 10:18:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id l31sm88237663pgm.63.2019.07.25.10.18.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 10:18:48 -0700 (PDT)
Message-ID: <5d39e478.1c69fb81.53508.87c6@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1564073635-27998-1-git-send-email-jcrouse@codeaurora.org>
References: <1564073635-27998-1-git-send-email-jcrouse@codeaurora.org>
Subject: Re: [PATCH] drm/msm: Use generic bulk clock function
To:     Jordan Crouse <jcrouse@codeaurora.org>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Thu, 25 Jul 2019 10:18:47 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jordan Crouse (2019-07-25 09:53:55)
> Remove the homebrewed bulk clock get function and replace it with
> devm_clk_bulk_get_all().
>=20
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

