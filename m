Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDC1179ACD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 22:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387905AbgCDVV7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 16:21:59 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45746 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgCDVV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 16:21:59 -0500
Received: by mail-pf1-f195.google.com with SMTP id 2so1594856pfg.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2020 13:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=8NHt2u1Odi1sTAbIxzHtP/yeJUTD5DFnU/KItPM3ljg=;
        b=XLNUFzp7y3HaOKVjXaLfh5lEnmPG/smFCciNkihcc1WIvT68eoHMtMgHPa2QtybPFN
         UScU8BW/PGirxc+d/af21Ay1wLbOuCIVSxOF3hx3NuRJI9nXzmaLPEKhFOjBAdW1c1nK
         5V6/b2JkGOXfocvg3SVUxWyuFFZ7PLkq1exYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=8NHt2u1Odi1sTAbIxzHtP/yeJUTD5DFnU/KItPM3ljg=;
        b=DIZG6ZpG1uMW2ubIEHcK2sIosFn5OkOQUg18tWvop/COEfxPKsDQ3CZ42kCBwzfGtV
         dNzfqk5qQv5TGzdlrtXxwN9ly+ojMHXWk0A9QrqgANlQv+uzg0moKjDMU6wKe/ugi6b9
         AWTpbv5eeIGgl1scE7ErofSLzTA6SEglcJMbaQLbMGvyGyncfQkVC9+aFiR659QvQ63U
         1WnbuExDFR7tLBIjHuJJ91y/cpf+XpEGgR1ttd3dZR4vQp2RZ00zB2Cq9G5uRD99iv5H
         gVlysDK9/ZzrH49BaXEWTveh0S+9n5rtoI9Atk3ser/Jiso1Mi3+3+BwS1ezKM9O4mDU
         wdZw==
X-Gm-Message-State: ANhLgQ0Sjn12tQ3QLYM/dXbaiDC7WlDzIp2RSUNtvPh5PNxVRn+/mkIn
        ARHyQn2YoccrFsAu8r9SdkSyQA==
X-Google-Smtp-Source: ADFU+vvVksMIvscwJ60U1wNHvcXkdywaFwvp9amWgt7M25BGgkzXqzfMpjX+sg+A+d00rVzlySrLDw==
X-Received: by 2002:aa7:914b:: with SMTP id 11mr5065657pfi.69.1583356918146;
        Wed, 04 Mar 2020 13:21:58 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 129sm24711920pgf.10.2020.03.04.13.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 13:21:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200304105638.1.I9ea0d337fcb927f52a28b20613b2377b6249c222@changeid>
References: <20200304105638.1.I9ea0d337fcb927f52a28b20613b2377b6249c222@changeid>
Subject: Re: [PATCH] arm64: dts: sc7180: Add unit name to soc node
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Wed, 04 Mar 2020 13:21:56 -0800
Message-ID: <158335691640.7173.2382800196583275089@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-03-04 10:56:56)
> This is just like commit a1875bf98290 ("arm64: dts: qcom: sdm845: Add
> unit name to soc node") but for sc7180.
>=20
> For reference, the warning being fixed was:
>   Warning (unit_address_vs_reg): /soc:
>   node has a reg or ranges property, but no unit name
>=20
> Fixes: 90db71e48070 ("arm64: dts: sc7180: Add minimal dts/dtsi files for =
SC7180 soc")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
