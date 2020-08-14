Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D69E244FC7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Aug 2020 00:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgHNWPC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Aug 2020 18:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgHNWPC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Aug 2020 18:15:02 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0420EC061387
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2020 15:14:59 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id t10so11443731ejs.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2020 15:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=I1P9jSvj8KsgaDMEv65UiEF9Z+hJk+AMaAtGqjiPwHk=;
        b=cpmo8Z7L00clOxaEygKbxnGwKvrxuJvVUvlujmlizi9+0bQBNLRlbFUu7fecqHsIpn
         f3+bVXFK+H8VK1ymJV4wxOKKu2kF55hLWv6RlN5rOcQlaSJAxZ+CkC+R3bhG1aMmrxLi
         GMQjLUGc5oDee3BjY6uYJ5Ofz8E7kHHM2uZ0pOUDrHH0D/OAK0prvli+7kFsEgfT4zMa
         wixUAL0T/iH1UygkhlTk8ewnTmUybC72NlAQlOY+EnoC+xuARx/Mz8JlHUZPH+/vj+ia
         vPF+M1G3bJ7J4nCtD7kLwJ3wIyCUTAi8P+VGqEl3xCVxObsC9OR6Zb7CicL/92e79rT9
         /J6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=I1P9jSvj8KsgaDMEv65UiEF9Z+hJk+AMaAtGqjiPwHk=;
        b=jZpqnJp3PXgyd8MqQIbSX6EJ31PSypAXdLlrTxZ2W3o9+J7Zl+RAVhGZPCTYFa0raw
         IAYmOnqbv4bjTtuwQX6zAirXKZp1hZnNyPR5GVO8H+BCXHfdcsrGd+P18AptffW53++k
         ZRtxYDSbXZveuRYc3k7VMVAAW+M8zgfaFQM0iTaBChESMxFJi8WYN+LTNk02wkNVulvp
         ByiVJOU2zQG9/4xRHmJYIfMqvdXodneIn/U7mA+SfD/3hwb0TLJy2nhDjtUKK/XCv0YZ
         T2KPuM8LVE2Lo69ks3JTOa5Yennul1Z2lbGt+VHYfmsD0md2lu0rWaIU0ptqqeJU3kt/
         7Yyg==
X-Gm-Message-State: AOAM533uAghyKYIP4N4yYsw9gR5QtC3GXCSiCYS/aqGAsCkV73RxofLb
        esU0BFMo6djqsmcjO9S9Mf9SKs9FFHJ3bNnJ2cw=
X-Received: by 2002:a17:906:3445:: with SMTP id d5mt3766889ejb.348.1597443298656;
 Fri, 14 Aug 2020 15:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200814152201.254010-1-konradybcio@gmail.com>
In-Reply-To: <20200814152201.254010-1-konradybcio@gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Sat, 15 Aug 2020 00:14:22 +0200
Message-ID: <CAMS8qEVHGE9Q9WO5-FfM0yWccjKA=Ayo3204ncYbg5KdVHBCFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] [-next] mmc: host: msm: Add optional full power cycle property.
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-mmc@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As I mentioned in the next email, please ignore this patch. The whole
idea is incorrect and does not solve the problem.

Konrad
