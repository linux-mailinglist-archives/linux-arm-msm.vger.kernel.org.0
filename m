Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 227ED1076EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 19:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfKVSHR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 13:07:17 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39716 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfKVSHR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 13:07:17 -0500
Received: by mail-pf1-f195.google.com with SMTP id x28so3833279pfo.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2019 10:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=QHcCLOTHDrwSpwTP8rFeltRMoHfX/0xc/q7sN/Rx9ro=;
        b=N/+JAA2o5L5PXyYbMc1Ds+tfIppGwLuENAvgZ2IibduBi162AeQKB8wpJv3y+3C+t7
         LUovV1cPCxYV0fUIg/Sa7BnzG+sjccvOPyLpm6XEY2eSlFtDxALPyHDpFwe9qWLi6Lcv
         hGuPBFaRQDON153lzs6nPlYifkwak7G4sVMUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=QHcCLOTHDrwSpwTP8rFeltRMoHfX/0xc/q7sN/Rx9ro=;
        b=jWcIQh8xuh6IwRYEVab0UHu1cVqrd8AYqq7ayNVow8iJik3eLSjEXTgijjPWpV4s5W
         EWK70sLn+uuMnxagQDLTrEbVY+I7/s5sx4e0GpV05VmMCd+qSYU9tAQR6M1yi71Im+eE
         B9ZTd4oAkFZ7cNjPYmaNIARSXmerGmYC91/G8fRCULzk21s6bXWp267FInbrQU7OcyRi
         n+unOxC0IrHnt9y2qb0my8mD5t8lhcxA0ZZDFDYi8FS5qIlvWjCj/j5xFrCLi7TdHYUg
         yPg8akuWfD6ulcdVDAgSw59m5Ie3GQnaGzBZrgFS7h5tpEJSPhZ3JRY4bY6expb9b3aq
         qQ0g==
X-Gm-Message-State: APjAAAV3NK15Z+yQAH3ViV3mI5+mEEQOZIAmXgM73wr5lMOSDxQIDV/a
        YKEr3r0iYWPvfJGVQSLOu4/KEA==
X-Google-Smtp-Source: APXvYqyHNTAjmGEhUHYEdxjMp82zyO+vvo+z6lJS77Es0eUHhRtq15UVwTA/TGgZdWVBJylLYFzoZw==
X-Received: by 2002:a63:a5b:: with SMTP id z27mr17799362pgk.416.1574446036741;
        Fri, 22 Nov 2019 10:07:16 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i22sm3480907pjx.1.2019.11.22.10.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 10:07:16 -0800 (PST)
Message-ID: <5dd823d4.1c69fb81.25a59.914e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016e937a6c00-b8cf45e5-aedf-4e03-bf23-47d7810a0b23-000000@us-west-2.amazonses.com>
References: <1574432266-20732-1-git-send-email-akashast@codeaurora.org> <0101016e937a6c00-b8cf45e5-aedf-4e03-bf23-47d7810a0b23-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH v6 5/5] tty: serial: qcom_geni_serial: Move loopback support to TIOCM_LOOP
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>, gregkh@linuxfoundation.org
User-Agent: alot/0.8.1
Date:   Fri, 22 Nov 2019 10:07:15 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2019-11-22 06:18:24)
> Remove code from the driver that create and maintain loopback sysfs node.
> Instead use the ioctl TIOCMSET with TIOCM_LOOP argument to set HW to
> loopback mode.
>=20
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

