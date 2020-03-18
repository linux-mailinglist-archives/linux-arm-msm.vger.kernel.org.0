Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E71A18A179
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 18:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgCRRYY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 13:24:24 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:52933 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgCRRYY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 13:24:24 -0400
Received: by mail-pj1-f66.google.com with SMTP id ng8so1629283pjb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2020 10:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=FjWwh8LO5KXjOVLWH8k5j8wZ6Ak2lErqrO6W1eN8/UY=;
        b=EUoZTb0MRZa6UglrqgLn1tMNjQlLSMxH8zEFEAuFDVSCVlz0pkAuCnOsOLlat/f4s7
         5Mx9ni1VXdejqYP/1jX0bqN5fxdlijMQI06zwNeuIfpx4PkDVWEL/3DLGJ3X+qGUQEHc
         fYnZot3k5fWZ5tPg9rsalw+uUxKaO4pWjwCvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=FjWwh8LO5KXjOVLWH8k5j8wZ6Ak2lErqrO6W1eN8/UY=;
        b=fPNU1UcyxaEqitp7V6UA+9UfNovWq4jCJ4OENZ0krRm3UOPV5oBGHDBQGswUzEdXZT
         MnKBJi4Qd43Km82aHe5R5vdDPe738h03WQlcsIrl0HL8jTtT1fzK4DD4B5qGvGvIDlOq
         jntz5DoUf76ZBS7ysrvDDIePC8BLSJTOOH5qg10vpcNrn54PsnLm0lFvrfMvwkDLE7Zm
         JPc0moxLQJS0U8c4rz+Jf/+8FRB8RX6UzglDgh8ryLYBFcX4U/abIRk9xQWUiNK8cU9w
         7rhgch1teQkIRAVsazdOFvcNQ0Sm9vP3Q3C8xsQ65q8Q6x13KbXsOgQdUTOxmy5WW6v5
         teXw==
X-Gm-Message-State: ANhLgQ2Mml4AvguVEb/jXWeUmNVBEhHT/UfQ2NUuetlfnC/6ZfH/VZLy
        dvI4Hj2Piyr775WawiOXyIh8Mw==
X-Google-Smtp-Source: ADFU+vu3fODPJ39ECRURXTPSbPdrHu6AK7pdBYqoOgXlEtTlfqbqUn60Ytai6Fr1MV4kDF25BLERSQ==
X-Received: by 2002:a17:902:9a08:: with SMTP id v8mr4435900plp.251.1584552262019;
        Wed, 18 Mar 2020 10:24:22 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x70sm6619101pgd.37.2020.03.18.10.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:24:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cd0f3d35ca0fc2944fd97e030a28318ff82dd5c1.1584516925.git.amit.kucheria@linaro.org>
References: <cd0f3d35ca0fc2944fd97e030a28318ff82dd5c1.1584516925.git.amit.kucheria@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: cpus: Add kryo468 compatible
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        bjorn.andersson@linaro.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org
Date:   Wed, 18 Mar 2020 10:24:20 -0700
Message-ID: <158455226052.152100.7707912714966412244@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2020-03-18 02:08:16)
> Kryo468 is found in sc7180, so add it to the list of cpu compatibles
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
