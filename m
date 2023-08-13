Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 088F277A490
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Aug 2023 03:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjHMB7t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Aug 2023 21:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjHMB7s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Aug 2023 21:59:48 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B261716
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Aug 2023 18:59:51 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-565334377d0so2452239a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Aug 2023 18:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20221208.gappssmtp.com; s=20221208; t=1691891991; x=1692496791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/CZUr4BOJ9A4g/EJQv8nU92G8B2uTxt26ZdHAnXEYE=;
        b=aju+GZQHRpAdyNoxsn8XjpHFaGx99Nac8OJpnJv7FLjEt/hK5UCfwSWuIMHUYYlreV
         TazrcadpFr7Y85Smp3TlAmqGKiV7L2vmJ75VWlzCnfuTBSWy9ug3uZC2vytQVrHRPDkA
         ymWdhmlCUhRns28plQ3nkiVwt3Z7z+JpM535sPfVX2tHJVhBbsUzPQjV1pxpN9mGfWPB
         L0eHjk758FaPVvLRegbFW/Y2IY6uRVxgEIGzRzBay+c/GgAq0YyJh7wP3zZTtWNj7GmJ
         XmvUx9KwFGaxm9rR0Gisd7PtpocRzjyJU2HsOP7vNgEmt9MybTLU1EN0k63EApvAtggc
         7E1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691891991; x=1692496791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/CZUr4BOJ9A4g/EJQv8nU92G8B2uTxt26ZdHAnXEYE=;
        b=Cn/AFAPM3T0v4akGJMSstU3A2ym2YAyTMuHPeySbz2OGH6cfs7fp/WeFYk24nyn7T7
         +dxsdOp9MOsp7gxRqLL4sfzU+pn1jtfL2IoYu08LS3VPQ30K6z9j2vkGxkauE1D7x6Qo
         dMpsygIaBLpnmtLEV6XxpwDa/+gk5kGf/NZkezGCVJr6kWesvcaxXIjgScbnDegTvl+z
         c5svM7NjL8Fd0GJ48jslweICvUx5TM7XOe0MZ4jNEI+jxCCexFFDfUkvvHuwFnQ0grLl
         r48miK0y/5oYZrOFokImA5yfHKlO8nobfs5NUCg7Zx33zpkjgRwFscTjb/7CF5d2BP79
         Elww==
X-Gm-Message-State: AOJu0YxscNMDEouJkHy1IGUM6emz+s547JsxXnc8mx0qh6sElPo6YkOj
        dt373ZoMu0dW/oZRsM5EFBJ9pw==
X-Google-Smtp-Source: AGHT+IGZT3lRbxWdL/X9cnKcEexajsiBHi3p3oFjfhI3xk2LEh/pfewN4xIUNkXnJoHSXccsgbK9TQ==
X-Received: by 2002:a17:90a:e651:b0:268:13c4:b800 with SMTP id ep17-20020a17090ae65100b0026813c4b800mr5485381pjb.21.1691891990780;
        Sat, 12 Aug 2023 18:59:50 -0700 (PDT)
Received: from hermes.local (204-195-127-207.wavecable.com. [204.195.127.207])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090a4d8800b00267ae12b80bsm7268411pjh.34.2023.08.12.18.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 18:59:50 -0700 (PDT)
Date:   Sat, 12 Aug 2023 18:59:48 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>,
        Alex Elder <elder@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] soc: qcom: aoss: Add debugfs interface for
 sending messages
Message-ID: <20230812185948.29f1d53b@hermes.local>
In-Reply-To: <20230811233228.GT1428172@hu-bjorande-lv.qualcomm.com>
References: <20230811205839.727373-1-quic_bjorande@quicinc.com>
        <20230811205839.727373-3-quic_bjorande@quicinc.com>
        <d212e5a7-e9e5-4297-85fb-030818f7c647@lunn.ch>
        <20230811233228.GT1428172@hu-bjorande-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 11 Aug 2023 16:32:28 -0700
Bjorn Andersson <quic_bjorande@quicinc.com> wrote:

> On Fri, Aug 11, 2023 at 11:01:50PM +0200, Andrew Lunn wrote:
> > > +static ssize_t qmp_debugfs_write(struct file *file, const char __user *userstr,
> > > +				 size_t len, loff_t *pos)
> > > +{
> > > +	struct qmp *qmp = file->private_data;
> > > +	char buf[QMP_MSG_LEN];
> > > +	int ret;
> > > +
> > > +	if (!len || len >= QMP_MSG_LEN)
> > > +		return -EINVAL;
> > > +
> > > +	if (copy_from_user(buf, userstr, len))
> > > +		return -EFAULT;
> > > +	buf[len] = '\0';
> > > +
> > > +	ret = qmp_send(qmp, buf);
> > > +	if (ret < 0)
> > > +		return ret;  
> > 
> > Sorry, but you still appear to be sending binary blobs from userspace
> > to the firmware. This is not liked.
> >   
> 
> As mentioned in the cover letter, I do recognize your concern here. I
> don't see it as a realistic way to work around the kernel for reasons of
> being proprietary - given that we don't have debugfs mounted in the vast
> majority of product.

Anyone who cares about security, and has things like kernel lockdown turned on
is going to be scared by this. If you allow API to tell firmware to do any arbitrary thing
it means you could be telling firmware "please read this area of kernel memory for me"
