Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7454CFDB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2019 17:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727711AbfJHPdQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 11:33:16 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42856 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbfJHPdP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 11:33:15 -0400
Received: by mail-pf1-f196.google.com with SMTP id q12so10963579pff.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2019 08:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=30tHV2fpMdwSf4U9d4O4ZBn5WVVTESOFWc1UPoBwGi8=;
        b=knQcBoppV5bduwoeAAh2N6H08y+Fapq4qcw2DwVm/+4fWjhia/XOwvbIfxUvsaPHyu
         bDlRXFz85p4aSyGuHU2fvB6DGhxq9ZAlFxFeMw6vMyx1qcSXfJqbOfJwDYg1FjQl78SO
         8r9CpjooqD0ruv0isbzS8slaNlH1LCWLcwqz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=30tHV2fpMdwSf4U9d4O4ZBn5WVVTESOFWc1UPoBwGi8=;
        b=BsbhcVUAwjdpYCIis0qbASss3d5h1zTuFJADJVpQfGYlReWqfR2yIoS6UJAaDMJcvJ
         ws+Gq/RlH8ZY544EGrfXkIONDNn0sE4AtM7pwI4IVRKO+VQMLVycfTQjT7v210Dshq+f
         AhAs2fFD9cF3295yD1BxGEWW66q+59phDPk5zrSvKFo3MeqBCF2w+jKgyRSFXTj6oM1t
         BDGAZHj+DcR/ItwX8tdMdA9YAlk/KvTbbhiYl0EBbnc+RcZdwJ9koZDvBP4zVLmq4spY
         nu0RRx2WLTghndN8BkELkm5tGCgLAyfqXH6S6m9lVc29GDeY8R25Kc+hTEKpJy8oEzvh
         tRSw==
X-Gm-Message-State: APjAAAWGdBJEEqvL5DAgye9sxf5iWdOvN28duaq3bt0oDDrdGLW6lDcm
        FianR/3PsoZIgPJZDpMMxw98EA==
X-Google-Smtp-Source: APXvYqzfKLqTly8R2+nDMVxfUG+KWXR3xS9hfzkJraMvIXpnmKxWsB7m7FC37LNAiazfLFw7OxTyig==
X-Received: by 2002:a17:90a:f8f:: with SMTP id 15mr2489698pjz.58.1570548793160;
        Tue, 08 Oct 2019 08:33:13 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a8sm21062501pfa.182.2019.10.08.08.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 08:33:12 -0700 (PDT)
Message-ID: <5d9cac38.1c69fb81.682ec.053a@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1570480662-25252-1-git-send-email-mnalajal@codeaurora.org>
References: <1570480662-25252-1-git-send-email-mnalajal@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Murali Nalajala <mnalajal@codeaurora.org>,
        gregkh@linuxfoundation.org, rafael@kernel.org
Cc:     mnalajal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH v2] base: soc: Handle custom soc information sysfs entries
User-Agent: alot/0.8.1
Date:   Tue, 08 Oct 2019 08:33:11 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Murali Nalajala (2019-10-07 13:37:42)
> Soc framework exposed sysfs entries are not sufficient for some
> of the h/w platforms. Currently there is no interface where soc
> drivers can expose further information about their SoCs via soc
> framework. This change address this limitation where clients can
> pass their custom entries as attribute group and soc framework
> would expose them as sysfs properties.
>=20
> Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

