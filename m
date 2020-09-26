Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C19A2799B3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgIZNa3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIZNa2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:30:28 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB17C0613CE;
        Sat, 26 Sep 2020 06:30:28 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id j2so5332533eds.9;
        Sat, 26 Sep 2020 06:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Pw2334Ivc2sWGxKj6eRmrpO/w0k8YeD1ECz1yaBwKM=;
        b=cGAh4Ont+DoM3qARhbK0GVmTkj8k+DDAP2v5Em62a0B45Q9Pw/fm9jh9ld5x2As9S2
         5Cbs7wR6tjqrVbZUiq+gSOD95jOlv5TIe45aIYmn5YZ75VW+C5eTrrLI8A+lno+Pm/h/
         3SpDwkdiq3mzKo0/tPqEL6/68uY/MBigHY97Z6hrkcOeEaW2RfIwMvdBNoZlM1W06ckb
         OQocu2c4RSctMXGS7JSnM7oa3b9pQo5Gy7Kt8Hh8ugpzwwQ5fB7dt9UulIkWc9b+a0ZY
         dK3pE8xBMVCmC6LeafX7F2PR3PRL4PiwWPtnl609kq0SNIXdFpXMJ1P/FrjB+oI7cbe4
         ICCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Pw2334Ivc2sWGxKj6eRmrpO/w0k8YeD1ECz1yaBwKM=;
        b=FHOryDXOYb+2DJ1QPHM6gJmv4nzTaaEUv42Qtef4zOwYjgmbUUxbuIm5zbo3bU+Myz
         zEh/oe33nh4uo/rt6yYIjewJS2q0rVmxp3Qa6lEhAJD7zp5sqjH4+JbjL3lLKeH/Cj1x
         OcF2xSr1UiFv46881ksgw8mtI8B+5yWNRRR8ErKWm0ugNt/RfcV+tjg3aofzKhcEVmf0
         20GpkIYfB4qAl3RMn+Ue0XZniIh1Hs8l8/KfYy6GwCvCmRCEGuXTC19BFq5Typ2A5BtP
         Ob0ICadqyLzE8qUsi/p2mcZplIUuoFKvR9yGyvdmghpxX7jtAAQc+ETwdViPNzx0LgjP
         uZAg==
X-Gm-Message-State: AOAM533ilMOoIptcrggz2g214dl3Ip3ISuf9ku22o8V8tkjVq24bBilx
        TFcacXqFyq4nvaLtXD0A8YA72v2kZFQ0BIaz4gY=
X-Google-Smtp-Source: ABdhPJwEFgGC9+NcyZACNpuLewPRD+gZnAVwdbxXRrWww9MPlC6QhGwohdZ0Gmw0WPAGn7Xm/dala7z43Yl0Tlh6mlY=
X-Received: by 2002:a50:d4ce:: with SMTP id e14mr6842020edj.126.1601127027236;
 Sat, 26 Sep 2020 06:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200926130306.13843-1-kholk11@gmail.com> <20200926130306.13843-6-kholk11@gmail.com>
In-Reply-To: <20200926130306.13843-6-kholk11@gmail.com>
From:   Martin Botka <martin.botka1@gmail.com>
Date:   Sat, 26 Sep 2020 15:30:15 +0200
Message-ID: <CADQ2G_E+5cwVKX8PCtveC8Q+8y-hp5M4PAKteZCTNS-c-3-BTA@mail.gmail.com>
Subject: Re: [PATCH 5/5] dt-bindings: clock: Add QCOM SDM630 and SDM660
 graphics clock bindings
To:     kholk11@gmail.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, marijns95@gmail.com,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tested on Xperia 10
Tested-by: Martin Botka <martin.botka1@gmail.com>
