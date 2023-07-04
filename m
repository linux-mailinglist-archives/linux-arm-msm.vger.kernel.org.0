Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC88C746C57
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 10:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbjGDItI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 04:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbjGDIs7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 04:48:59 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3703E42
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 01:48:44 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3142970df44so3672361f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 01:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688460523; x=1691052523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f6YOwXLm+1hJya88jiZQ5u2PUvGz6DQZ0Xib4QcnZYk=;
        b=X/eFpPIu9v9z5x9Xi4PWBH8nDYyQ8AuoTlOeeIStjQo9fjJMbOdSgeo2C6OXcfn7/i
         y0WznCIrriOGeAVTM+lOmplmrLIZm14T0xkcLyeiymVAiV2nQDalxBkkp9rXbX10/pgv
         OrH6HkpKxaQTSBt/AVj5shbdUiZW0GW227sPzdDojSC/mHvi6R529B3eHPzHdR5hvit8
         X8RmeyquIWQAx2S3t4IQqKQ3DSWjzP8ReBgEDrMFvA7l49DEA3f2FKC9IVou3gc/TWHQ
         OfmCEVwy8cdklhVlin2D0OJbZfWA5ZIMrVP3MchtYToVZKwEzrMvHJCI9mvZF4Nb4aMm
         fz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688460523; x=1691052523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6YOwXLm+1hJya88jiZQ5u2PUvGz6DQZ0Xib4QcnZYk=;
        b=dID0gn6GBBz+iyTlo341gjFd8FfycnKPIC6NmT6BOAZJbgqe2eiR5zHh8xdwHHb+1w
         v/OCVV/q5P9v9YfqpVuMhmledVxwN3haBlvlbXY4/+NodXSLViOBe6EmDm+OmzxQU72i
         p1rMwg3Y+GPqwN9er+YdFt3rwsxwHyBvtS9UrShjvelsBzEJVArDIaDDEtf6cfwrbufE
         7LSe8yeCgAJw3v7sbN1s9Tw3eC3AMk80i17Y8qKa+OCVMLoCxc7zOXiLBuTkc4Eh5r0t
         yXT1KngtQyQL0hP7UX19MMyC7WqMKojSrXgruJEvzrrXjkzTnvfetOHQG1eLE5wVtmUS
         XrUA==
X-Gm-Message-State: ABy/qLb0C6G4mjNp4R/JlTApY5nMdZh82rf6T5x3D1udTm4qAW09Dpfd
        WQoyrtfNGRQYQeCD5xoahHoLdg==
X-Google-Smtp-Source: APBJJlHIxOV9dndynkfl4sClPYXQ9Jj7TscatAL2py7KSBsv//PuPwpcqjmk0a6BsvffZZHAvCfTPw==
X-Received: by 2002:a5d:6e56:0:b0:314:dea:f1f8 with SMTP id j22-20020a5d6e56000000b003140deaf1f8mr9638778wrz.11.1688460523347;
        Tue, 04 Jul 2023 01:48:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j15-20020adff00f000000b00314315071bbsm7085181wro.38.2023.07.04.01.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 01:48:40 -0700 (PDT)
Date:   Tue, 4 Jul 2023 11:48:38 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Cc:     Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Carl Vanderlip <quic_carlv@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
Message-ID: <571cd06a-c488-4e46-af0d-183943fbbd7d@kadam.mountain>
References: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
 <1d79cddc-0afb-08c2-8aac-8f3b7761d210@quicinc.com>
 <5fecc4c3-7a99-4329-d56c-b6a4f56c990c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fecc4c3-7a99-4329-d56c-b6a4f56c990c@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 04, 2023 at 12:04:01PM +0530, Pranjal Ramajor Asha Kanojiya wrote:
> > > -??????? if (user_len + trans_hdr->len > user_msg->len) {
> > > +??????? if (trans_hdr->len < sizeof(trans_hdr) ||
> > > +??????????? size_add(user_len, trans_hdr->len) > user_msg->len) {
> Since the size of characters per line is 100 now. Can we rearrange this if
> condition and have them in one line. Similarity at other places in this
> patch series.

Style is subjective so I can't say for sure that my style is better but
obviously it is.  ;)  Those are two separate conditions so I put them on
two lines.  If it were something very related like if (x < 0 || x >= 10)
then I would have put it on one line.

regards,
dan carpenter

