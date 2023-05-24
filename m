Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13EFD70FCE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 19:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbjEXRmm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 13:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbjEXRml (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 13:42:41 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3CBE5E
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:42:29 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-625482282e0so91166d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684950149; x=1687542149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Xad8XQzT/EPDQLWCF9hW+e8DHp/sy9XMO4KserFr8E=;
        b=V+icCz8Wkib87kWDCS02h4LhRjsobBVVm1jhD52MjTvZmMBlrKW78D/7dLXkzzi12q
         6XXNonAITz3cc8q0J+zQ1M+Qste3MQhp/Bv7b324jyGSWhLTHIvgo/IozK/brYE4+mhO
         XQVs4A8fNuBbryXY4ncKCfTMncEVlMS2ozRaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684950149; x=1687542149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Xad8XQzT/EPDQLWCF9hW+e8DHp/sy9XMO4KserFr8E=;
        b=ZuIZ0V3K0Ib9OQOqZHMv8tQDM8+6yiJUEFIy+DSIEkGCXGLkXEWOtdyyVBewtiJwsh
         cSIvQdf6BYMw76AsNXZ9svEesNbEFWSxdcBcKolRxmFJk3eNfP6YtqQRIsJqTAZl5kOg
         X6Pqy+3DswP7TQoJzQKMcjrMzNInxoMtgnHVLxRw0ihfIbszUhn0CwuawPFN+dHZkLAD
         LJ39E/wIGH5XLgKKaQRD5ANj7Qaik/O11790WX/N6zdg+qGaWGHGzsrepCBNx8Or1VWW
         Uwe3wcVZOezuKPqwtkCquiKyWybsDKQNpXao9ztyXy0JPYCU22Vjbv/npJ2OWYRGYTc2
         pE6w==
X-Gm-Message-State: AC+VfDwXuUlAbUygYdpXo4XoTzqAHLxbDt6/EBX++U9C+cuN0BMss2V5
        j6QuWYgS9i8BlGd/cKawuvpqcuCwex9taP3l7t6orA==
X-Google-Smtp-Source: ACHHUZ7VuoEl/eBzhNV09bqyw11BoMXJFgg/WXWeo6+8EEukNTKi78vrfyLQnNkdab7TTr1fcrkG9J5e3zT0+Gm80uo=
X-Received: by 2002:a05:6214:c6c:b0:623:8494:9946 with SMTP id
 t12-20020a0562140c6c00b0062384949946mr26307431qvj.45.1684950149123; Wed, 24
 May 2023 10:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230524122901.53659-1-heikki.krogerus@linux.intel.com> <20230524122901.53659-3-heikki.krogerus@linux.intel.com>
In-Reply-To: <20230524122901.53659-3-heikki.krogerus@linux.intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Wed, 24 May 2023 10:42:18 -0700
Message-ID: <CACeCKaendr7Z8xE44uQw-QZ66wMdV-jd8SQ+ZPUeOdVpkq8ZHw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] usb: typec: mux: Remove alt mode parameters from
 the API
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Heikki,

On Wed, May 24, 2023 at 5:29=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> The alt mode descriptor parameters are not used anymore.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Prashant Malani <pmalani@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Bjorn Andersson <andersson@kernel.org>

For cros-ec-typec:
Acked-by: Prashant Malani <pmalani@chromium.org>

Thanks,

-Prashant
