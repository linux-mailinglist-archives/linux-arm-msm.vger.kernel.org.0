Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98CF5FE83A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 23:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbfKOWpN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 17:45:13 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44132 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbfKOWpN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 17:45:13 -0500
Received: by mail-pl1-f195.google.com with SMTP id az9so5636586plb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 14:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=7Lv3OlOPwc1itG1VgoAiwhDXhnQEj1MoRWBeTDRndG4=;
        b=Nkqj7y10JNCu5K6kPudtI3lXHEwaZBSWUhX29HR/Abt8O2VfHSQU5mdiEVOiigMCw6
         zsEj8MCsojhqm3YwGiyADl9ZPM0yX8rquJ1Z0q9RlkRg3Jr8td15JaCbE8CpRk/HgDm3
         +tploRipqGjbIXjj7nLILijQjuVP6SsHpOJ5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=7Lv3OlOPwc1itG1VgoAiwhDXhnQEj1MoRWBeTDRndG4=;
        b=pIfwvMwpH1jTrv7Cm+8r4DuZlVdkpqUlMhfG4GdU4QMaxY7EExnv5dhrxyn0EKaJkh
         hQiIO24PePxoo5rc7xj3AXtd6M1x9s5VRujq9zi+ZArcjh4OceFQMNJUeL5Eg8AlbEeK
         fkS/p2OIUjLmL/HcWJBWb/o+1DuaYEvcQWdtYNbHy4xSR2OyUq3F7R95pqYiBZrKHGzw
         ERXOZ7MBzxgT6C9hBxtUZLmT3zvN0HxZ1b2778Q4sY9qwPlnM743XCFtwKxiX1VK2cLP
         Xu70E9FY33r2EYe19SMF0XoS0EFj08hvnzBIMZFbfgXe3hjgERuqH54Ik3PzRfwMMAU8
         Uu0A==
X-Gm-Message-State: APjAAAW2iNfnsA29GJGnnWoxBByfD727qLlNJSXDv4L/efijopy21iPo
        vSs2b7ZlHmMl1xgHswCXrPKl7jIRue8=
X-Google-Smtp-Source: APXvYqxKvvQFWUoIX8E+lfiE355scZNy4BpKhjdSk1Emyyc0LcYlxCPxZKzrkbThPxbIN4SfSJj3Zw==
X-Received: by 2002:a17:90a:f496:: with SMTP id bx22mr22379458pjb.126.1573857912758;
        Fri, 15 Nov 2019 14:45:12 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k4sm11900933pfa.25.2019.11.15.14.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 14:45:12 -0800 (PST)
Message-ID: <5dcf2a78.1c69fb81.f690a.481c@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573593774-12539-5-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org> <1573593774-12539-5-git-send-email-eberman@codeaurora.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH v2 04/18] firmware: qcom_scm: Apply consistent naming scheme to command IDs
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 14:45:11 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2019-11-12 13:22:40)
> Create a consistent naming scheme for command IDs. The scheme is
> QCOM_SCM_##svc_##cmd. Remove unused macros QCOM_SCM_FLAG_HLOS,
> QCOM_SCM_FLAG_COLDBOOT_MC, QCOM_SCM_FLAG_WARMBOOT_MC,
> QCOM_SCM_CMD_CORE_HOTPLUGGED, and QCOM_SCM_BOOT_ADDR_MC.
>=20
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---

Would be nice to state that the object file is the same before and after
this patch is applied, confirmed by compiling the file before and after
and diffing the output.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

