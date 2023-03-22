Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 718136C4B75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 14:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjCVNPP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 09:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbjCVNPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 09:15:15 -0400
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940985C110
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 06:15:07 -0700 (PDT)
Received: (qmail 5468 invoked by uid 990); 22 Mar 2023 13:15:05 -0000
Authentication-Results: devico.uberspace.de;
        auth=pass (plain)
MIME-Version: 1.0
Date:   Wed, 22 Mar 2023 13:15:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From:   "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <6e41758333fd0084a93fcae93df1589e8d60d139@lausen.nl>
TLS-Required: No
Subject: Re: [PATCH v2] drm/msm/dpu: Add support for AR30 format
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
In-Reply-To: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
References: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
X-Rspamd-Bar: -
X-Rspamd-Report: BAYES_HAM(-1.395246) MIME_GOOD(-0.1)
X-Rspamd-Score: -1.495246
Received: from unknown (HELO unkown) (::1)
        by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA; Wed, 22 Mar 2023 14:15:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=lausen.nl; s=uberspace;
        h=from;
        bh=AEQY0DcdG8KWL7TDzHCMKPYORxGJzOAPBuX1xZq+Ejw=;
        b=QOiW0KrQviA8D6sBjmdu2zJV4pi3hCA72EThHI3mU3FpDIxfmr/VT9F3SyUhLNHVP29TcCtRyg
        RXpR7odyqfemS8gOCQXgP1jcb0mIVmFU+x6qpSSbs7UWmwjjqwBCt5UeH47lyMS3rR0hK+xr9Cp4
        daGCmtMESlirb43eiI9km/hEoHs4oGM6DOkZFDNTUlThtiW6GCzGO7gwiA15sOYWSkKCciTEsfXJ
        8xpLZvfB+v1BuBGTtmxP/9QgZpphfiAz2ntvxiQsNCFjHwwCaux71m89P+oHl5Cal8PP/le7Th6e
        qrnyFaR6op+oWRiKL+YSgy6LgmD37d9ogRYn6Fe2xXUq94l6Xp9qrd3yP0y+LanY16N15UT25EgS
        CmH9/9acvrt8Yc9uCgbr2L72pWpWGCKS1MBZcQC9bhALmMeueil0dmSruvk8Vn3S4M5SjJj4VDwj
        /nMi8yHBFKXipPqheWfHGR5Y8xCFbyCw3rIxcEaVy/+bhhNS8sBcqxdei8RJsy99HrvVA/wJJAmj
        t7igw8S3V1bZNRHy9s5cjYLGQMFZPf/DDMySrjQk+wTv8RH8n8ZAHp/z9IxTIHPi342BrobSAYYJ
        8C0fo3g+zw+kh41eucwb+QcFoVNVvNMJoP6Vez84k1/PauIDgcUbIEeU0GRnjpVkG3HZOJrxfSnl
        Q=
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
        MSGID_FROM_MTA_HEADER,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V2 adds missing AR30 swizzles in dpu_format_map_ubwc to avoid the followi=
ng errors:

[drm:dpu_get_dpu_format_ext:1044] [dpu error]unsupported fmt: AR30 modifi=
er 0x500000000000001
msm_dpu ae01000.display-controller: [drm:msm_framebuffer_init] *ERROR* un=
supported pixel format: AR30
