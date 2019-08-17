Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA32690CAC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2019 06:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbfHQEDf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Aug 2019 00:03:35 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42037 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbfHQEDf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Aug 2019 00:03:35 -0400
Received: by mail-pl1-f193.google.com with SMTP id y1so3216273plp.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2019 21:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=pXBlTpO2GjUBQ6jSlgDI9YWY/1MbzSJdSmD+5A3FCkw=;
        b=PtNGh7vdCiqdD4hRdr+Xk39n62axtunyuxtDDhHVeiRibm/5+qNv7A0Qq5H0fQrvFb
         dK1to8T3Hzk4lk1FgmxzaeHrs0J8Vrw3AA0+NUUBJhxrZ7keL3WoPRDblDOzVtLBvHRN
         NLaK0cMstfNtFwF9dRVjl5PnxkN9j3QyjgI3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=pXBlTpO2GjUBQ6jSlgDI9YWY/1MbzSJdSmD+5A3FCkw=;
        b=ddunwKL1qTrCVU/gZK2SD4VxIVNrYw80tgNczhleDY/ZxJLVhRH8Bfo/dHVtn2/Hs6
         3fGi1nGt0lZTEYOFDKt8xeyubKn5I0SCQaVvhQYwC7WILHn66PolWmaqJrHqx1ToCjAZ
         YYHCXFkm2VUvQiJYbCx+cPC7Pc/+vHcBZjr0hc8dWz/E/UFKu3A/Pcgl8jiI75h91wdw
         uZvebZ0wklxc30K4cIyadmtnsnUp56Jmaw6xareunrYYdSqaXQc4xSpV0fOA/I31sJVr
         cU+BaVN7yJKk1kZTdGu/DnRlFRYMqJXeE8wIdK11Qo7iFFtFWXZgttcx7JgiXHAgUMIR
         GQzg==
X-Gm-Message-State: APjAAAXeLYGGreCoD6ht+SYCz1wpmrIfWcqPbSi83abfKgbmAruHXNDl
        Zmy2a/1njZ7vJ0EKnT23vFkCqA==
X-Google-Smtp-Source: APXvYqwK84XyJsvkHeRp3YZ8xSrSKr9P+aAKUhjZ/tpZXI4A6mRuv4TX1+/8f9hDVYtb92wTY6DJLw==
X-Received: by 2002:a17:902:2888:: with SMTP id f8mr12244041plb.26.1566014614940;
        Fri, 16 Aug 2019 21:03:34 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z16sm7101782pgi.8.2019.08.16.21.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 21:03:34 -0700 (PDT)
Message-ID: <5d577c96.1c69fb81.48f7f.43b5@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0f2027f458f8b7f17acb024cf47082052f416805.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org> <0f2027f458f8b7f17acb024cf47082052f416805.1564091601.git.amit.kucheria@linaro.org>
Subject: Re: [PATCH 03/15] drivers: thermal: tsens: Add __func__ identifier to debug statements
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-pm@vger.kernel.org
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, andy.gross@linaro.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Fri, 16 Aug 2019 21:03:33 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-07-25 15:18:38)
> Printing the function name when enabling debugging makes logs easier to
> read.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

