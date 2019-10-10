Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26192D1FE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 07:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732735AbfJJFEG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 01:04:06 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40490 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfJJFEG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 01:04:06 -0400
Received: by mail-pg1-f195.google.com with SMTP id d26so2864994pgl.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 22:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=RDcgYyHGE7Ugaco0qkuIi9HynTd/fxe2Ca020N/JEPg=;
        b=Zmt7MuwX3mgqOtO1SLFiulXF3/JFoK87LeyjYNh8GzlLx5Peho4Bfp083Cv/wJtq/p
         qnNtMYUTITHeIv/R9giQdM6XXx/g4bBwXMGW8Y7lGhTERwMu18oYccSNphKgRGHRwzvM
         CsD5zrNHrYDnYRquheyibQcOKC0RePR1BdPoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=RDcgYyHGE7Ugaco0qkuIi9HynTd/fxe2Ca020N/JEPg=;
        b=hLNR/3C8OdHMCftEbcnEoGYm8oFZSIJQGOfZgptYgv/rFhpQ9bZGLtirQvvoAZQeet
         LDOFXd+wTm6/LtDwtkyQP8BU+RMoRLKRYxfRkAwD75u4u3r+73y3IDx6J9D1h8N75pnH
         /NrcNpAj1RG/K+TQpBTbPilKe0qxcs81ebD70H1Ei5yDLR4rshZLNl9UtEXj/zJ+617R
         Q4fNLpyAyX7FGQEAK31a4jxd3s668nGH6UbcaTwOOHhZn/vpX7GJLWByCXCEJmdyfn61
         SvRBhc+mel3aPXhGbtOFLwUs67KnFx6nfFXdPW3tPs4eOhIh4foMSP72chQdr+ObTmec
         efNQ==
X-Gm-Message-State: APjAAAV/946fk2hwYe9Ed5Mxarg+Uq+T0ps/bGfvwdKTWIvk5JJZ7F9n
        EX16hEb/kmbwGi23No53ZFqITw==
X-Google-Smtp-Source: APXvYqw9/raUa8lawyg+DLKK8BYDVbYecdV9aYm7AXYeJETU44FJ3FlHZKqeiYmyuHb821nDWHBGsw==
X-Received: by 2002:a63:4624:: with SMTP id t36mr6066126pga.376.1570683844943;
        Wed, 09 Oct 2019 22:04:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p68sm4911397pfp.9.2019.10.09.22.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 22:04:04 -0700 (PDT)
Message-ID: <5d9ebbc4.1c69fb81.b45e2.25ce@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191009013345.17192-1-clew@codeaurora.org>
References: <20191009013345.17192-1-clew@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Chris Lew <clew@codeaurora.org>, bjorn.andersson@linaro.org,
        ohad@wizery.com
Cc:     aneela@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Lew <clew@codeaurora.org>
Subject: Re: [PATCH] rpmsg: glink: Remove channel decouple from rpdev release
User-Agent: alot/0.8.1
Date:   Wed, 09 Oct 2019 22:04:02 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Chris Lew (2019-10-08 18:33:45)
> If a channel is being rapidly restarted and the kobj release worker is
> busy, there is a chance the the rpdev_release function will run after
> the channel struct itself has been released.
>=20
> There should not be a need to decouple the channel from rpdev in the
> rpdev release since that should only happen from the channel close
> commands.
>=20
> Signed-off-by: Chris Lew <clew@codeaurora.org>

Fixes tag? The whole thing sounds broken and probably is still racy in
the face of SMP given that channel->rpdev is tested for "published" or
not. Can you describe the race that you're closing more?

