Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04FD3746C1D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 10:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbjGDIiz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 04:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbjGDIiZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 04:38:25 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B27139
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 01:38:24 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so64188015e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688459902; x=1691051902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w0V57ruCKT8g2KRYl0872Ggc1PX88R6CmL+ReT3+2E4=;
        b=KuahYV1kenec4FVH+QBP0nW573m7azVy/U+M4uh/82HcqTd/trNzBoKgYdN5fuSU+G
         YnBgOYzF3iW4e5JN5b+S1DhNYgy377h+Wv5X4d1dtUcjhlv59ttycBNm65DPWVggUgAv
         L1lSgB/kAxfFM/EknQEj+uB/V48Tl6Pds9yHBGblTCYw0C8wiUrzevSM1uNWvhGSGbAW
         3s5QftmSU4xelg85k1isrCKW3DX/lO4QsO/qjUUgH5zUyaAomLdjMgmQxVA02+4bHN9m
         WjD5JEZI47QESaCd5kwvISRtXyv4dtgS5+sL+IekaTCZ9O7ZMLzPYG8PxPgaMOn1/x/6
         cQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688459902; x=1691051902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0V57ruCKT8g2KRYl0872Ggc1PX88R6CmL+ReT3+2E4=;
        b=G50/kyTpuKOPJoBKdbv6Xu7lkqcGvCkKGiQzxp1Ylb6OiOKb1vGch7Z4G1JAp2D0hM
         T3sqW09xpIUzq8FVDwWagziEcb2ioKA2L0mOG5rvMSc/EnZDA+faE/9K7VwwKn90QCPO
         sdYLr5tBVNg573Fpb0KP4DjMcKWKVcE2yjrZiR//i7O2jy+6oTX+DrJ95vyzBrd1wDx/
         N7U1pYSt8qRAM+50QLUrM/xGoF9ouFfrVzqy1D3ndZXOiMBzCsh+hENxm+qwsocSCCxg
         hUFlDNjLSstMy68odaW9+7I9823ciknRumArvamttvsYcm1+9WH9eP6lRYO0AelffyJF
         zXpA==
X-Gm-Message-State: AC+VfDzsF+gUYfKb/bUyuWOC5szwpRK2WJ08jUZ4atMelg6XQrTE9Ndh
        EVHsI1WLtebfPmbH2+grWjdpMw==
X-Google-Smtp-Source: ACHHUZ4CtBHTSIgBrWtDhVrUr9H6mVr1KJO7Mgb9kq8KYJhSeCz39PgYzNfD0ZElomNA3TYakMGWlg==
X-Received: by 2002:a7b:cc87:0:b0:3fb:a917:b769 with SMTP id p7-20020a7bcc87000000b003fba917b769mr11141017wma.21.1688459902605;
        Tue, 04 Jul 2023 01:38:22 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c228400b003fbc216b137sm13093446wmf.3.2023.07.04.01.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 01:38:20 -0700 (PDT)
Date:   Tue, 4 Jul 2023 11:38:17 +0300
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
Message-ID: <fb5f0a0c-c46f-4eec-bfcc-50b4be44c0a7@kadam.mountain>
References: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
 <1d79cddc-0afb-08c2-8aac-8f3b7761d210@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d79cddc-0afb-08c2-8aac-8f3b7761d210@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 04, 2023 at 11:57:51AM +0530, Pranjal Ramajor Asha Kanojiya wrote:
> > diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> > index 5c57f7b4494e..a51b1594dcfa 100644
> > --- a/drivers/accel/qaic/qaic_control.c
> > +++ b/drivers/accel/qaic/qaic_control.c
> > @@ -748,7 +748,8 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
> >   	int ret;
> >   	int i;
> > -	if (!user_msg->count) {
> > +	if (!user_msg->count ||
> > +	    user_msg->len < sizeof(*trans_hdr)) {
> >   		ret = -EINVAL;
> >   		goto out;
> >   	}
> > @@ -765,12 +766,13 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
> >   	}
> >   	for (i = 0; i < user_msg->count; ++i) {
> > -		if (user_len >= user_msg->len) {
> > +		if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
> If I understand correctly this check is added to verify if we are left with
> trans_hdr size of data. In that case '>' comparison operator should be used.

That was there in the original code and I thought about changing it but
I don't like changing things which aren't necessary and == is also
invalid so I decided to leave it.

> 
> >   			ret = -EINVAL;
> >   			break;
> >   		}
> >   		trans_hdr = (struct qaic_manage_trans_hdr *)(user_msg->data + user_len);
> > -		if (user_len + trans_hdr->len > user_msg->len) {
> > +		if (trans_hdr->len < sizeof(trans_hdr) ||
> > +		    size_add(user_len, trans_hdr->len) > user_msg->len) {

If we change to > then the == will be caught by this check.  So it
doesn't affect runtime either way.

regards,
dan carpenter

