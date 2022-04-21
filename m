Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 965E650A67F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 19:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390536AbiDURDZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 13:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390521AbiDURDR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 13:03:17 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4075C4991E
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 10:00:21 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id g9so5141151pgc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 10:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g/8FEaYQkq+lxLgr6M4Us6Wu0VOlD5eJM4zQXwRwI4E=;
        b=JiMXiHFZnKzBdTsBMid8YTRBmOEvAzI/BORgqxA26W196NeybHwSYWuz0UGNfXq8pl
         N0E3v+z0KkXtN9pfg7PCcpLbjtt/wEjN8Fne/ZPLeqFk5nHUD5OqDAqSjJbTQ/LXkUjU
         ojPw9HaBCB6rDMYE7N6WR/EslIzl0IN7DrVzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g/8FEaYQkq+lxLgr6M4Us6Wu0VOlD5eJM4zQXwRwI4E=;
        b=HDQIWmD4Aw30rEA58Nos9+TMbIpam/6lcstYz41+QrpTYTM/4u36TAsMG2eiqNhDJM
         PTOm8nI5+ZuDRnruapI6WIixbIO3AyhqECbblEM5O23FEHruDTevcMJHhBHADi6HzrzP
         fhlYiZ0lxQ6z9ZkOMuXHcRRFb5gA2DkjOUoAj96xyd7UXn154u42BKdKiMQ8A/1Ceflo
         UrzcJgXqjRKOyYekh2vQVFHHLN8ix4Dumx0sOStifYnLIPcDCSAlRbG0DykS4YmWgFdI
         Do2OZ5v3t+EgCSqDzZ5WfEfOJgB7v0Uc7Qb0rCmuQu3plJNhrK4ZFAxtcl/sZud3q42Y
         Q2+A==
X-Gm-Message-State: AOAM533c7Cd9IweBo4BXGD22I4ppZ1iYk1xNNaqJvNVpexWyp3IASQ9b
        dJvTN3HhQyjQAB4Aeh6TBDG/Lw==
X-Google-Smtp-Source: ABdhPJw0hzxN+V/lqZosNUDtXUopMEv4BHmL12lNcPx9EiYPpoczfL2OPi65/DtDMd/5VGqWaP1qeA==
X-Received: by 2002:a62:3083:0:b0:505:f7ac:c4a6 with SMTP id w125-20020a623083000000b00505f7acc4a6mr577520pfw.66.1650560420685;
        Thu, 21 Apr 2022 10:00:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d426:5807:a72:7b27])
        by smtp.gmail.com with UTF8SMTPSA id 3-20020a17090a190300b001cd4989ff60sm3389695pjg.39.2022.04.21.10.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 10:00:20 -0700 (PDT)
Date:   Thu, 21 Apr 2022 10:00:18 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v9 06/12] arm64: dts: qcom: sc7280: Add max98360a codec
 for CRD 1.0 and 2.0
Message-ID: <YmGNoifz9k7msMKu@google.com>
References: <1650552459-21077-1-git-send-email-quic_srivasam@quicinc.com>
 <1650552459-21077-7-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1650552459-21077-7-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 21, 2022 at 08:17:33PM +0530, Srinivasa Rao Mandadapu wrote:

> Subject: arm64: dts: qcom: sc7280: Add max98360a codec for CRD 1.0 and 2.0

nit: and the IDP boards?

> Add max98360a codec node for audio use case on revision 3 and
> 4 (aka CRD 1.0 and 2.0) boards.
> Add amp_en node for max98360a codec pin control.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
