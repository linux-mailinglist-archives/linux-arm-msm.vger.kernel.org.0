Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDBE7A4E8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Sep 2023 18:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbjIRQTC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Sep 2023 12:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjIRQSp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Sep 2023 12:18:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9B72D7E
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Sep 2023 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695052472;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mOhdBYOOnOw2Xv4QV/a0Y13rP1z4QA5P773/OFzDxDo=;
        b=Z7rRXsXU7iqwLrmt5iuJCb0VhxAKLHkodpmnocLpEnalKmr2/o/Tt4MWtF5ZC06ZYg5fJX
        +7DAJOsmZ4BeM0WvIQGhJrZNnfrbHNZGZd0U4zyszT/u8cneTjzWDvE3cDZdJKgXNsOnL5
        QT4yAcmO0rFgATpU3b3V5XFYMmrbwEc=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-bUNHcaMcNMmy7UNwjPDg_Q-1; Mon, 18 Sep 2023 11:54:28 -0400
X-MC-Unique: bUNHcaMcNMmy7UNwjPDg_Q-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-59beb3a8291so58269867b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Sep 2023 08:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052468; x=1695657268;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOhdBYOOnOw2Xv4QV/a0Y13rP1z4QA5P773/OFzDxDo=;
        b=amYJKAPZGgL04ceXW3gPKv/pTuCJsElS3jLzKJVAuuDjenI9o+7LbvFOcwfK0dW2rt
         kNNgJMRCH8YEjiCOXzSEK03HkM0rmMAvqLUmOXbH8UnruZEuovZU4ttfuPteE6uuDuwu
         t8sa3SJURQy8fwdpSyjq8+q7prnexe/EZE8RQyKiXITPJ157j40oWapegzGh4J6m7HH+
         0Bl7Fwba4oRJilYtOjQA7BjI5Z9iIMi+HUva7FG/XC4hHOyuazPe8KorlgqRnT8bxT+Z
         q5Kr/IksQ2/orVWXPob7BnIGtPKy0TPFX2hAAx4f982u60xTyTEfZwKp0kNepkye4124
         5Kqg==
X-Gm-Message-State: AOJu0Yxs8ECTYuzA9F7444qYztY3Z/XJSw+62iRsf9XpOPJiV1+Exi9c
        skNky18E9bd3V0+EXDIkEnMnLWNdaFvgmOomCNnUPnq0z5b8Zip8OwVKv0t8kyFhTwnAzjMPOme
        drM1Md1CWU4C0zvCvzXlpGmstvQ==
X-Received: by 2002:a0d:d892:0:b0:58f:ae13:462b with SMTP id a140-20020a0dd892000000b0058fae13462bmr9906405ywe.4.1695052468199;
        Mon, 18 Sep 2023 08:54:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ+PPa37KkghWX0FxlMbPyu/VGLHVykUnMpS9N8b28iqb6GVc4LQaBkI7nwKXvPf5Ws77YcA==
X-Received: by 2002:a0d:d892:0:b0:58f:ae13:462b with SMTP id a140-20020a0dd892000000b0058fae13462bmr9906390ywe.4.1695052467962;
        Mon, 18 Sep 2023 08:54:27 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id v26-20020a81b71a000000b0059c0629d59csm2339594ywh.115.2023.09.18.08.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 08:54:27 -0700 (PDT)
Date:   Mon, 18 Sep 2023 11:54:25 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Nikunj Kela <quic_nkela@quicinc.com>, cristian.marussi@arm.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Add qcom hvc/shmem transport support
Message-ID: <ZQhysWhFtR68iVMa@brian-x1>
References: <20230718160833.36397-1-quic_nkela@quicinc.com>
 <20230911194359.27547-1-quic_nkela@quicinc.com>
 <0efe305e-031b-bdf5-0268-ca1c6d562653@quicinc.com>
 <20230918151552.n3jvw2qqi5tmyfbb@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918151552.n3jvw2qqi5tmyfbb@bogus>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 18, 2023 at 04:15:52PM +0100, Sudeep Holla wrote:
> On Mon, Sep 18, 2023 at 08:01:26AM -0700, Nikunj Kela wrote:
> > Gentle Ping!
> > 
> 
> I will take a look at this later this week. That said, I am unable be
> gauge the urgency based on you ping here. You have shown the same urgency
> last time for a feature that I queued promptly just to know that it was
> abandon within couple of days. So I don't want to rush here simply based
> on the number of pings here. I need to understand that it is really that
> important. For now, I am thinking of skipping even v6.7 just to allow
> some time for Qcom to make up its mind and be absolutely sure this is what
> they *really* want this time.

Hi Sudeep,

Red Hat is interested in this patch set. Qualcomm is moving one of their
automotive platforms over to use SCMI and this will appear in that
product.

Brian

