Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5696CF56E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 21:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730043AbfKHTN0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 14:13:26 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45209 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390383AbfKHTHf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 14:07:35 -0500
Received: by mail-pl1-f195.google.com with SMTP id y24so4486562plr.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2019 11:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=kikk2WY5kfcxGjTzJAhY6RUjMX79xyo2nvmOqI9NKHM=;
        b=JFDvfMdZ5Y0xxtanpVxlYiQHlNVk+Z9yQ83f74eGrenWkdufHlpK8NqhFqwY1ff20M
         buoDVI3VxY5kZG4l5Ob1JEvmUj+eb5L0Ma02ASUUGACaYD6gU/TLztfHmscpQsj8xP+R
         MsYzNvmY8GqYQonkW8iFXop4RnW+pIJHoGoMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=kikk2WY5kfcxGjTzJAhY6RUjMX79xyo2nvmOqI9NKHM=;
        b=HXb5y/e8JtrNLS9hJCPXH4N+ojm5LhuP2UPgKMbQgESFE3lkV8c8Za9wAm2QWzAdf1
         pZBjjeXxEmXrIRIvQRmCMJqs+MeVt3tBsnJIj8tF94IoA3lL35eki3OCNW7HhT2eNfZs
         ZBxlnDMdsEZ/XxZB3hhrtxmJdzk104JQr7ylzUEQ3w162p2AFnoPRB9t8OigcyEGwRbw
         HpvDX+S51DH9Bq9MEt6hQ9CA9eWyKlOD8nX1/h+KkihetGeW/SmVgrbS0Lfu4bp+9/Nb
         Z2O8Lm4fipyhuY73zYoDby6g8DFApnyF8R+QoP6s0UDchO8mkc/AOgef9VihAgKEfTie
         gzhw==
X-Gm-Message-State: APjAAAWSqNObRvANykQK2KDy/L+5Ey/cR12IzQkrUCoiYmYQuEzBYmka
        l0+jD+Qh3STp9qZkVILDQgu4Yg==
X-Google-Smtp-Source: APXvYqxoH5Z0CCe1PUE3xdaqaiDsVPjDsTLej5DIBq/bQpgGRGi2K8JEAyDFmgRNW/c+v8ue+O5XoA==
X-Received: by 2002:a17:902:8f81:: with SMTP id z1mr11544949plo.319.1573240054508;
        Fri, 08 Nov 2019 11:07:34 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d4sm7368030pjs.9.2019.11.08.11.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 11:07:34 -0800 (PST)
Message-ID: <5dc5bcf6.1c69fb81.f3fb6.2bf3@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191108092824.9773-12-rnayak@codeaurora.org>
References: <20191108092824.9773-1-rnayak@codeaurora.org> <20191108092824.9773-12-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v5 11/13] arm64: dts: qcom: sc7180-idp: Add RPMh regulators
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 11:07:33 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-11-08 01:28:22)
> From: Kiran Gunda <kgunda@codeaurora.org>
>=20
> Add the rpmh regulators for the sc7180 idp platform. This platform
> consists of PMIC PM6150 and PM6150l
>=20
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

