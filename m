Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 228C8772824
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 16:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbjHGOsd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 10:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbjHGOsc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 10:48:32 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7912F10CB
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 07:48:31 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso6129616a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Aug 2023 07:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691419710; x=1692024510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g5TONaCzenbE58exEYn4kekq6odZjjesIxjsYL+WXEk=;
        b=LAGX7jbG6F4fq0qqXNzbtH86Na7x01qv3FacE1USHXDEuPJpTPvENMIlED/2GBOsJh
         6Altx05H7uymr/LpYE47VAUyns0iHv6/eW9j+xnJkl/WLNPzU18B/VX5CZdpu0+KGAbo
         g5ymBhw+YfaA3o56MEAbZZ3bint0HoWQ94wAejTZCBnAiEeVeIo1JfaRwdq6uof2OraY
         0YtT+Ksc/EgkkHyUS9A2ZhBRbnJJgn67c9lJo7TWxXutCMBQlVi87Hew6c1UnLG/+p5G
         2SWr/80LrE3N9Cp7fu8ZdgYJuQ6uc1cwSa5Q5aa+Ap96J6eNodixg8bEBlI8qqEEZ6bO
         yPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691419710; x=1692024510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5TONaCzenbE58exEYn4kekq6odZjjesIxjsYL+WXEk=;
        b=GVh8Rs/88mdMdZUSNwGEGvOb6KDnsAhBd2r/fb0FCcotZ/lffInXeyL8bq2F2Ed6SS
         o3B87PJEjcb92TDVdhAn7W3YPI2ZhCC9G1ASmuYgVGZVhjJmFIbgvqyI+csZT02vycDs
         JqEHb6/4nP+k9/BQncIIs7iA6B12vxMzW6c/JMEkIRAkN6jNQSXW0NC80jDMuHOm07uA
         viJNSu25s/wj8Eyp00/poxq4lJHx/3s4D3JRkhqRXF/t6To9XNL2wYAMmqIqCmYB5N/w
         JG82UkQiWWlzlwSRTuOC27o/Oaa1ayZR/OjNyt9gmJaqd7ayT5VZN3IoiXuEzd1LiHJG
         VdZQ==
X-Gm-Message-State: AOJu0YxEGlSwQsXA79vpC3liXQinw7yIu0TjzdcpcziZMpOJjfDTfPH6
        9etXue40cWO8CIMdQvI2gkD7C9T0dsFFHDS8xeM=
X-Google-Smtp-Source: AGHT+IEcB9lOnU5D7LUku7kKOfGjfkNp21TKAM5wlwjqT1tboFCW53K/DMPnWxEHWTDQKAQwNEvonA==
X-Received: by 2002:a05:6402:54:b0:523:366b:9cb4 with SMTP id f20-20020a056402005400b00523366b9cb4mr3454238edu.1.1691419710016;
        Mon, 07 Aug 2023 07:48:30 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id bq1-20020a056402214100b005222c6fb512sm5355657edb.1.2023.08.07.07.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 07:48:29 -0700 (PDT)
Date:   Mon, 7 Aug 2023 17:48:23 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v5] accel/qaic: tighten integer overflow checking in
 map_user_pages()
Message-ID: <e42f15f4-d1a7-4e4d-8efe-e7636634278b@kadam.mountain>
References: <e6cbc8a3-c2ae-46be-a731-494470c0a21c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6cbc8a3-c2ae-46be-a731-494470c0a21c@moroto.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 07, 2023 at 05:09:34PM +0300, Dan Carpenter wrote:
> +	remaining = in_trans->size - resources->xferred_dma_size;
> +	total = in_trans->size + offset_in_page(xfer_start_addr);
> +	if (total >= SIZE_MAX)

Btw, I wrote it >= instead of > to silence some idiotic static analysis.
On a 64bit system U64_MAX can't be greater than SIZE_MAX so Gcc will
complain.

However this test only affect 32bit systems and > and >= SIZE_MAX on a
32bit system are effecitively the same.  Neither one is ever going to
happen.

regards,
dan carpenter

