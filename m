Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD1117CF256
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 10:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbjJSIVT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 04:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235109AbjJSIVS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 04:21:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622B610F
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 01:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697703630;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6JocWFvICwQAu51spYQ9UkYkn/vFA+DgKSrhAcOeN84=;
        b=HPqAOsmeq6IymvWkm9YEcOzKvts+k3fgyvU6aGKjgQ1PvOFIGWheWXO0hYVK7xDqzsbx++
        WxHUrmj+NxySPYefvdhav69BQFsvufrJbcAYeZkMQbk1n7CLT1NAHl8Ps2h4Ho1ZJFYQWq
        0yCqG1PMgj/jA2k4EfHIgDzJNTvFHCs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-BtAuQ-ZCM2SR2IbtlPM--g-1; Thu, 19 Oct 2023 04:20:28 -0400
X-MC-Unique: BtAuQ-ZCM2SR2IbtlPM--g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9a62adedadbso573317266b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 01:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697703627; x=1698308427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JocWFvICwQAu51spYQ9UkYkn/vFA+DgKSrhAcOeN84=;
        b=IKUTpEPZ54FzDIrlbGn0Gc1N3QaPmpU0dtF736A7FE33RpSTwOj856U5sSU+ZhfD/x
         x8zUoShgpqua4ysMK9zWXyY2oFaZI9el9659Q7/ShheG3ObN1Ihke0GSCpndH0o9bFAn
         lsCPbcnyMWeERzUZlDVvXJPLrYjOp19/ZWkPP5BJDgdnG+BhC/Nkh5ufBO7p5sokhYW4
         FSDkUiu1bQhTzuixRFuoL0QK48ILNxZXSyA08gHTOrjk95Bp2Ql3V7irQUILQ7HBZ0U+
         8stTVlLNmsRM2h6c0Juhg2e4w30MKwBo+4I+JMZCfkX7qKqAHWpIC2eWlVeFaDLbbaMW
         87lg==
X-Gm-Message-State: AOJu0YwNITyyk+sUp8JMGtFykZxw8tqBp/Kmbqgc4npTgK8lfZS8uCLE
        FHK2IWnmZQftNU7ePxT1+D9KF0DSLJZ98oSNO/uTJLfPcvAJvnCJ3K1XUOaKh8G4QnHF3Zl6TDi
        lbPROLp72adM2lbUXodHYy3JmrQ==
X-Received: by 2002:a17:907:7b89:b0:9c5:844f:a7f4 with SMTP id ne9-20020a1709077b8900b009c5844fa7f4mr1416933ejc.35.1697703627229;
        Thu, 19 Oct 2023 01:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTnMKXbHzCyh0CpWl8FqNt59EDAGlNA5Kw8X7mQsKbdb09VixEWWMGkJGLb9zHxDpsNDg2ag==
X-Received: by 2002:a17:907:7b89:b0:9c5:844f:a7f4 with SMTP id ne9-20020a1709077b8900b009c5844fa7f4mr1416904ejc.35.1697703626942;
        Thu, 19 Oct 2023 01:20:26 -0700 (PDT)
Received: from localhost ([193.32.126.216])
        by smtp.gmail.com with ESMTPSA id rn1-20020a170906d92100b0099d45ed589csm3040281ejb.125.2023.10.19.01.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:20:26 -0700 (PDT)
Date:   Thu, 19 Oct 2023 10:20:25 +0200
From:   Maxime Ripard <mripard@redhat.com>
To:     Vignesh Raman <vignesh.raman@collabora.com>
Cc:     helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
        david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
        guilherme.gallo@collabora.com, daniels@collabora.com,
        gustavo.padovan@collabora.com, emma@anholt.net,
        robdclark@gmail.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        virtualization@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 9/9] drm: ci: Update xfails
Message-ID: <clpne3ctm2aptl6whv4nxqsjcrqfggkdckocusxjksjirvflsm@6dppwwlqg4bt>
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
 <20231019070650.61159-10-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019070650.61159-10-vignesh.raman@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Oct 19, 2023 at 12:36:50PM +0530, Vignesh Raman wrote:
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> new file mode 100644
> index 000000000000..8b12e97d59f3
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> @@ -0,0 +1,9 @@
> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1013138
> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1012894
> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1013011
> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1013055
> +kms_cursor_legacy@cursor-vs-flip-atomic-transitions
> +kms_force_connector_basic@force-edid
> +kms_force_connector_basic@prune-stale-modes
> +kms_prop_blob@invalid-set-prop
> +kms_prop_blob@invalid-set-prop-any

We agreed recently to provide more context to flakes going forward, see:
https://lore.kernel.org/dri-devel/ax6tspeffujmk2vpvh6rwclqkkavpezvcubra25vs2ev7f5njs@2rpnycg2rgnj/

I'll send a doc update to make that formal (and discuss it at XDC if needed)

Maxime

