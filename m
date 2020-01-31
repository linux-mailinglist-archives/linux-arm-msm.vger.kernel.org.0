Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE07714E64B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 01:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbgAaADA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 19:03:00 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42810 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbgAaAC7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 19:02:59 -0500
Received: by mail-wr1-f67.google.com with SMTP id k11so6385173wrd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 16:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=uvb7UjEoJ5QUo55mMIeV2X7P8y9RLioRyMnghzSVrBk=;
        b=CxlznEqw9in4pGeFI7tiEkzvUBjjWH4ADeBPph8G4+G9QoHFQIJpjSfkOWvoW8WmES
         bO53NJg/itV1GXV6G1yDZaoJifzMxdIbQ0wmIZIrxg+0qfokN/yScPANJDpTfiYXHCP0
         VfNqWMyA5ZH6AI7fP9FDpdvUrFP1BlPUqjKbnX7z4kOScVC9S2PYgtG0SZdLk1zt4mlZ
         qbbFtJUU7oesuCNJ1/a/WEQhVtZmiHwYOpaZQyxhOMQQvZPIOyUem+cP6jJRZVfZ7pqa
         v8E1I660ZqgFJlEUdtNXhUzypivyNkoXWANhh9KC2NBUAXZeuegEtQCG+n3497o2pVyA
         iIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=uvb7UjEoJ5QUo55mMIeV2X7P8y9RLioRyMnghzSVrBk=;
        b=SLSDHWM8sRY/KRcwjv+WpOb2Jxslqk1s3yKX/2YY0D6YAKDQlLUcvx04SQfs5FGI2l
         6AOpbL33Z3yzMOZUGPzxXvYAFRROxlF8mV890Rzixlw1tnebtl/0Q237Fojx+TutUIuB
         PAhVDUIVhjoyc8NJl998u57OGu3fsGdIP6SNmGfNzbfJkynYX3vG5h7W2L9bms4yxpRn
         oQJ7pBS3gl+Ubt4Ccpr6P5WQ+ey/3Ln5DYHJfwR4AJXMncFOM7gzgJQpk5UlFdSdG9/Q
         Pgq5dpkZaHLdddgTTgAJxFbX76/MAPv1EtbLVN3ILzx0mwIqU2rtxOXAw0VxBYkmQVBp
         Q2mA==
X-Gm-Message-State: APjAAAW601ID37F+GYUs92D6ObN6eKRdSaXazAk0mPsVNXYgvXE7x+6p
        2Qp/kSTM3WLmwuij7sYSBJfb4g==
X-Google-Smtp-Source: APXvYqwPQPgXUHuMLzMgsVSYsqPcB8oArAwwWFAqxt/Aw9EdJlzgNWxKIbSrHog58z2yHs7ryG8BfQ==
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr7812645wrw.289.1580428976708;
        Thu, 30 Jan 2020 16:02:56 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id g2sm9292932wrw.76.2020.01.30.16.02.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2020 16:02:56 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Nathan Chancellor <natechancellor@gmail.com>,
        Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] power: avs: qcom-cpr: Avoid clang -Wsometimes-uninitialized in cpr_scale
In-Reply-To: <20200130014130.51313-1-natechancellor@gmail.com>
References: <20200130014130.51313-1-natechancellor@gmail.com>
Date:   Thu, 30 Jan 2020 16:02:53 -0800
Message-ID: <7hk158xzki.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Nathan Chancellor <natechancellor@gmail.com> writes:

> Clang warns (trimmed for brevity):
>
> ../drivers/power/avs/qcom-cpr.c:570:13: warning: variable 'reg_mask' is
> used uninitialized whenever 'if' condition is false
> [-Wsometimes-uninitialized]
>
> ../drivers/power/avs/qcom-cpr.c:520:13: warning: variable 'new_uV' is
> used uninitialized whenever 'if' condition is false
> [-Wsometimes-uninitialized]
>
> Due to the fact that Clang's static analysis happens before any
> optimization passes are taken into account, it cannot see that both
> branches in the if statement must be taken because dir cannot be
> something other than UP or DOWN due to the check at the top of this
> function. Change the else if condition to else to fix this false
> positive.
>
> Fixes: bf6910abf548 ("power: avs: Add support for CPR (Core Power Reduction)")
> Link: https://github.com/ClangBuiltLinux/linux/issues/840
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

Rafael, feel free to queue directly.

Kevin
