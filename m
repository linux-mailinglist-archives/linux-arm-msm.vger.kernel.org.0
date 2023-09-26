Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE8D7AE64A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 08:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbjIZGzg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Sep 2023 02:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbjIZGzf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Sep 2023 02:55:35 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07D511D
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 23:55:27 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-59f7f46b326so41192447b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 23:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695711327; x=1696316127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHSkNGK03t5d9rG+f10qQXua3Wp3jtHQqzKshE119FY=;
        b=mypcl9B6J1Cs0PkTManL/as8PTIqMef9XvLWO6qrachl1UJwrEOOmiDcTEgdmWBsPm
         GU/y2uYvgxYhT8uIzrrKDCYp/I7vDpdh+8IxJP3e7nTVYv9thPH/xqvBCHY0kS57VUzA
         nkzu/kCi1EwnWBUY1pZ8BxEb9RhFzJt91g7QdfsTlrj4quIPIEIcC0jYnGNXjO3fbeB7
         HzbK94muvO7LOREahc6LuH7E8RSKvtufn1zxPi2uqJdFhL/ulRWkcC2BbQKBxdykxu47
         evSIAm/pcAdas0xnhIgsoK/M0WmekrUTMfh0N+zYNTuTNMSM8GyuWlYwf1d2ju7Iswie
         9tJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695711327; x=1696316127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHSkNGK03t5d9rG+f10qQXua3Wp3jtHQqzKshE119FY=;
        b=MvhxA099UyJP0SLGMTIn4Ku5qkeEmIkvZgK3169TMcm1fLsQj4q8fUlTg6lXDspp4k
         eTluXzOCni54ihOPh3+RQWgqb1HVNm+q11cYV0F+3Bcu0aGxkxoaU2eDt5+aXGMQfapb
         r6qNq15FV0uXJ8Bp0CWq8GLvfh7rW/aw7b8eoBveOgqoiQkAuEn8gvQm6j5SN5xPYjsM
         35Kbe0LEvGDtcvE3snC8Laxijvxz0udWeoYZR6wt2RFjHMUcpfio/MYgkodo7nuRiUKH
         3B03HRp2tyuEgwvpmtYhzdnbLb59HmMnJISyMtbx006/48fChLvo7u5fZxqkKVGYCD0x
         BDNg==
X-Gm-Message-State: AOJu0YwxTnu8ujWpu9OBeFJ/CI2D45wYhAYOfz/sRqGOUDPgzxk2tYSN
        6lfEzhQpXePB76cA2jFp1p8GMw03PPAtAc5K0qJmhg==
X-Google-Smtp-Source: AGHT+IHoO7TBziPA5htbsuH2VXUX9yGcO/aIOtLwPZZVCJAErZgDwgIkJ3nSHIbU3VSV/WI7WX5/gfB00KELiu+FW9A=
X-Received: by 2002:a81:4f92:0:b0:592:60e9:97cf with SMTP id
 d140-20020a814f92000000b0059260e997cfmr8225904ywb.12.1695711326765; Mon, 25
 Sep 2023 23:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230925212713.1975800-1-robh@kernel.org>
In-Reply-To: <20230925212713.1975800-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Sep 2023 08:55:09 +0200
Message-ID: <CACRpkdYSvgUsuMS+-=LXmCtH0bLF=EMguuvWwZ7VjUfnx+uyaQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Add missing additionalProperties on
 child node schemas
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 25, 2023 at 11:27=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:

> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij
