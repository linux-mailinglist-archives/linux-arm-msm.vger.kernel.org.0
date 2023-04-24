Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3430E6ED06D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Apr 2023 16:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbjDXOjv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Apr 2023 10:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231588AbjDXOju (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Apr 2023 10:39:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF8F49D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Apr 2023 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682347142;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BigudKcOA1SWNAOg8hWRkq+6kqvUQ8WQtVHc52aXCFk=;
        b=QdlHiYhZTLpqw49T+hhMgSsurWxT/MDTOLh8N2V9LB8T3If1qI5chWQ/j13V39UQjD957Q
        WbV7csIHADxzuks6I9WXI0G2kM3r6YLIJkK/lj37QP2yZfhsxXBrEQWuQe4fiMfi7PjZwD
        eW5tDa8ouImHLQ8JlIxu7dnpbGVJsP8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-nApYBCw4Mh2JZOnbJ2R4iw-1; Mon, 24 Apr 2023 10:39:00 -0400
X-MC-Unique: nApYBCw4Mh2JZOnbJ2R4iw-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6a5f1bc4b26so4089997a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Apr 2023 07:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682347140; x=1684939140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BigudKcOA1SWNAOg8hWRkq+6kqvUQ8WQtVHc52aXCFk=;
        b=XKG4leNKp+7TeeNaXCsvfugvQJYgjwCLJF46Ij4ZK5Fev/KWZHt/dmkh85ZNtRtcXg
         8hNhVr3XW4lU82VKbSuAknWCMSMmh5HKO3fzD4gNZdBPvLJ3jCeN2FE7GFUyXcK6R+0k
         7hoY41yzq9khikNZaU5UcmgSbLET9bvVXsbdfJOwUZzWm9nw8NORvuCcnc655upgeZDZ
         qXaCcRNxxZLjbELrPQm0YUembTe1t8NqlridhpX8E7vTwPVJrCzwxiyta8ZXxCgC575F
         Gb/VFuJ1xqASevVAVqe9L5JWXiQ895luzc2Wjz9eSowMp/KCgcoAWinLa8iocKsKBX0H
         NjDQ==
X-Gm-Message-State: AAQBX9f17in4bdM7DOWStg/eV+AEiR9MGpTLqDi5DS/j4T3wSXTUGBAH
        U3zyFq2kWByZBnGfE8APibGMb27Poi7zhufiwBWz38mkYmwdMfxwviBCqRA9F47pd2w+zG+B4bS
        +uOYrnKJDuG5H3JqiPgGxDFNkzQ==
X-Received: by 2002:a05:6830:1603:b0:6a5:f6f6:4ebf with SMTP id g3-20020a056830160300b006a5f6f64ebfmr7763128otr.37.1682347140016;
        Mon, 24 Apr 2023 07:39:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350a4cPtmKSKYUPwFELwY06yqIRsIWSQ/yGP+ZB1JxXAGRtizSylDhCPYxVdKzDUhmtvHwVE2aw==
X-Received: by 2002:a05:6830:1603:b0:6a5:f6f6:4ebf with SMTP id g3-20020a056830160300b006a5f6f64ebfmr7763119otr.37.1682347139827;
        Mon, 24 Apr 2023 07:38:59 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id z18-20020a05683010d200b006a32ba92994sm349236oto.23.2023.04.24.07.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 07:38:59 -0700 (PDT)
Date:   Mon, 24 Apr 2023 09:38:57 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: sa8155p-adp: Make -cells decimal
Message-ID: <20230424143857.373kjvi42c7acsbp@halaney-x13s>
References: <20230421205512.339850-1-ahalaney@redhat.com>
 <20230421205512.339850-2-ahalaney@redhat.com>
 <abd106b1-6650-6a7c-1c8b-3609e47b0161@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abd106b1-6650-6a7c-1c8b-3609e47b0161@linaro.org>
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 24, 2023 at 09:21:45AM +0200, Krzysztof Kozlowski wrote:
> On 21/04/2023 22:55, Andrew Halaney wrote:
> > The property logically makes sense in decimal, and is the standard used
> > elsewhere.
> > 
> > Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> > 
> > Changes since v2:
> >     * Collect tags
> > Changes since v1:
> >     * New patch (Konrad)
> 
> Doing such changes per one board will be a lot of churn...
> 

Agreed, are you suggesting I drop this patch (and if we do this sort of
cleanup to do it in bulk)? Sorry, not entirely sure I am picking up what
that comment is implying.

Personally, I'd prefer to keeping that patch as this series is trying to
clean up the particular ethernet node.. but if the purpose of the series
was just to clean -cells up then I'd go with the bulk approach.

So as is, I'm going to leave it like so unless you have specific advice
against doing so.

Thanks,
Andrew

