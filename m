Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE6359F75B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 02:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfH1Acl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 20:32:41 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34520 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbfH1Ack (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 20:32:40 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so400938pgc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2019 17:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=H1hpO1CVjR+1P7gJ4YBZBqtb8Z3qt/H30KSvH+SzNw8=;
        b=JvJAkS9OzGQpIeYwSbeptRg3NdQcLKcumVdpKVP9avlhSzxiXvyfFleNvF+HlQYQch
         9ypsn3wvcTj3cip/axPGNfe26mI0ydwvXzrGUMJJfVz95yGxNzbDR9WqLf8QBmp0hgsU
         W3dWOlAwZQoe1lpP7Ab7gC08AdXa4Fd6L+h7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=H1hpO1CVjR+1P7gJ4YBZBqtb8Z3qt/H30KSvH+SzNw8=;
        b=sIQ3L/c3TjNRvE8Vb/1iy+1vP9ekglLxkvfd9Ww3A4dQ8gl4gtZ6YLRu8XrZEgB59+
         k5wLv9+k2SkpazuYH5wBlSqj+vWoLMEzTn+EdA3HE0feoNRbyE3x6aLtTLDICAziWLS4
         yTJIUjoUVqfGHWERqvUAKJ9lQjU9aQw/N27EixJcr3hk5K4GooDc20Pw3FYkbDUrcWlI
         nwhtr/aBxPuJbm5ULkN6Z/wbKHECkixQi805riTTvvjRCEiWF8R9K0SdoW7R7dk2R1Bk
         LQu7FpWPqadolTGtVIobEVNJ7dawabtR9+CWEXlyDuj/DDBKKv4VtzCvVCYaEAvMuMF6
         ODsg==
X-Gm-Message-State: APjAAAWe/8lChfDv7tGnyFe/07N/bawpi3tBO+8A10tb8d3F5LVdGb7Q
        ONLLgPl3i/BhzkGf3vbN46FQ4w==
X-Google-Smtp-Source: APXvYqzmeI2dhLfxbIvSYUhmX5dGOTt6kvO9wOXplWe7L5GZv7fw/KRT8d6v7JboyjmHKF11/xrmfw==
X-Received: by 2002:a17:90a:e38e:: with SMTP id b14mr1441690pjz.125.1566952360100;
        Tue, 27 Aug 2019 17:32:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e129sm525680pfa.92.2019.08.27.17.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 17:32:39 -0700 (PDT)
Message-ID: <5d65cba7.1c69fb81.a9cde.25a1@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f32c05c08669a9a886935149ac40423cd7001dfb.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org> <f32c05c08669a9a886935149ac40423cd7001dfb.1566907161.git.amit.kucheria@linaro.org>
Cc:     devicetree@vger.kernel.org
Subject: Re: [PATCH v2 06/15] arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        marc.w.gonzalez@free.fr, masneyb@onstation.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 27 Aug 2019 17:32:38 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-08-27 05:14:02)
> msm8916 uses sensors 0, 1, 2, 4 and 5. Sensor 3 is NOT used. Fixup the
> device tree so that the correct sensor ID is used and as a result we can
> actually check the temperature for the cpu2_3 sensor.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

