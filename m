Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E5B6CCD6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 00:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjC1Wi0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 18:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjC1WiP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 18:38:15 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565C61BEF
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:10 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id a11so14173541lji.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680043088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOwWonrpE9Dkyy4Q/0LXCbY8zJnCltM/M3j75FmH7fw=;
        b=a7ZnX691SuT2RJykm2XbV+BlyKWG02pym4XibfWplMvBb4nTSxzJIuD7kKwt8/oUbl
         fZmxX4ILQZSUk5uJF7l9HM5XCyngGJJteZT2X6LOHFPjvMAvGLD5x4iiM0SHyPkpqNHU
         B8HO+e701eSARlMTByXmWlnLf0w/rv1qgCgsA8GsKM4eTtt5EF10PIDC8il7kyE8H2aH
         Rxo/W4EAKucYJ2FK4gH7kCD2BK0Ab/pAzIlkLNxlZypojJU1uNUTx9WkFXrVRKkMUfez
         h84Nu3nyxsKq+nGhMISCZ6dABqNxiEdLOeOfw9ToBtOoG/cHKcXpLujtxg+5IHEA34cV
         OsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680043088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOwWonrpE9Dkyy4Q/0LXCbY8zJnCltM/M3j75FmH7fw=;
        b=Zb5lXa3ZojF4okVoAYfyJiIAJFD/Sgwp2t6RAv9USJoj+Oo5yooZx+iyJa5/eq2347
         W+Z4v9n9k+DJrut0sECtlJRue6rP6+zJauNwrSuHpZ4LEk9ITf6zu9PwUnpNfYZR+p1i
         CD4z8ii4S03rFb3v/PQdIS4JVzWTsBAlN5eYcUWk4glZZQWpHwCzPdLXTJERaFO4R96l
         YtMK0PJejR3+avvoSwfOVIeyjXHK+6uYaImHTwvN6K23hzNNlDTwpR4iFBoQ8kZJnN22
         Tbzzmm8IfY9KDrrGfYjckaUPahIRMwbdVPFxrynCXCSLMxT/lCimpEFLYSVatj6r/Pq9
         JtJA==
X-Gm-Message-State: AAQBX9f+5kpnyjpjEGy9fomcyf2F68F1mXzVPKWnP8xbDQ/uS4Hyu45V
        s2pJmzgtMWh/OHtVBSAnDXQWVw==
X-Google-Smtp-Source: AKy350YBE11m41SRDzdOvavHBzk6Aq12RlAFgkaKcKonlKYiYOP6aknoWHMxpgUB9rOLDfqF4VKkdw==
X-Received: by 2002:a05:651c:153:b0:2a2:781d:2c5f with SMTP id c19-20020a05651c015300b002a2781d2c5fmr5335225ljd.39.1680043088731;
        Tue, 28 Mar 2023 15:38:08 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 15:38:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Leonard Lausen <leonard@lausen.nl>
Subject: Re: [PATCH v2] drm/msm/dpu: Add support for AR30 format
Date:   Wed, 29 Mar 2023 01:37:53 +0300
Message-Id: <168004255465.1060915.4281864962908827878.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
References: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 21 Mar 2023 02:58:04 +0000, Leonard Lausen wrote:
> Commit da7716a249b699978fb5 ("drm/msm/dpu: Add support for XR30 format") enabled
> support for the 10-bit XR30 color format but missed enabling support for the
> corresponding per-pixel alpha-blending AR30 color format.
> 
> Declaring only XR30 but not AR30 color format support can trigger bugs in
> userspace. KDE KWin compositor versions prior to 5.27.3 for example prefer
> 10-bit color formats, rendering a 1cm^2 black box around the cursor due to
> missing per-pixel alpha-blending.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Add support for AR30 format
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a8318110b987

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
