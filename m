Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38D087D94B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Oct 2023 12:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235083AbjJ0KHP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 06:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbjJ0KHO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 06:07:14 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BBCC192
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 03:07:11 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9a6190af24aso300653666b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 03:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1698401230; x=1699006030; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2ttGxsEpCovYo5WGBI/2wLRWRua0I9N3WCMj8o9qdk=;
        b=lBmY1PeYgZfGZHhF2ipQeifDPJfHLIZueGkvb1MqXm55J+e6PLu5WRwxrfCYj4Z+WT
         R8Z8LTQm7nmaHSF+TF7NPXQW/xsOKL/cJSN7sjj+l2mOWeI3Zn9xcET+a6f9E605Uq45
         wY9ivoR9cFfTvJvD58GDUMCi9/d8X4QqxG7wN2YlmzYo3F66oO/rvNZ2vmsH9E/egQz7
         9U1I0fP0VVequ70rYdnKpTuUg0gWctPjqKUP4yrf3abfWu8XKIhSNWXkve2cQFtccv1g
         BCZNWRQ1TG6J3sJvYj8Gk/FZiz1sn5fpx3hdIohc/gg1A2NGR3y9K435/Bwq4V+QbiOo
         V0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698401230; x=1699006030;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W2ttGxsEpCovYo5WGBI/2wLRWRua0I9N3WCMj8o9qdk=;
        b=md6eoZu8rJYNtFld2U/Sg3uKYWBVAHavDZ1EDfqX7H5NJ3p1CCeX+KG5n5EqO//O+t
         8sS1Bolgdyv0nS5DWjBT/1sOvfOqQ3UwF2562WBrfKpv9QRKRVs5rIDTf+EfDSS4E9m1
         VZods4O+TKrM1TykDSMD5W+/a+zzutbhHXCHO9Of6+aWcBUwtlw1ka0EkVE0Jjw1J3IQ
         n0iHjuscXzj7Wl6L+J6ss8zJ6Omf8y+WvsS4RjkoXPG/Nherz80urmMPI8GEw5YTWLYx
         Qdrt4jDpdt/TlTXp9ZdNPaRK/C4eD3AXLNhigWsszIMVihHIPwUpx3x8/7QzwkYRGuda
         VQoQ==
X-Gm-Message-State: AOJu0YzM+I5RddajsVcuJRYRdTMsIJKZTd/eihmin9WSPUv7U8Lqt5+4
        /KRtzxngC3XynauqEBMrF4nnvg==
X-Google-Smtp-Source: AGHT+IHwXW32IKOGavGwueMqyskdd7p7jS6bw8H7bAFEFW4DJTD6sjtVirXz5fvBiW1yOPC8GSFVTQ==
X-Received: by 2002:a17:906:fe4c:b0:9be:2991:81fa with SMTP id wz12-20020a170906fe4c00b009be299181famr1956326ejb.39.1698401229965;
        Fri, 27 Oct 2023 03:07:09 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id c16-20020a1709060fd000b0099cb349d570sm949317ejk.185.2023.10.27.03.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 03:07:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 27 Oct 2023 12:07:09 +0200
Message-Id: <CWJ4ZLEZCKQC.2STOBNUU06B2P@fairphone.com>
Cc:     "Jeff Johnson" <quic_jjohnson@quicinc.com>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: Defer on rproc_get failure
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Kalle Valo" <kvalo@kernel.org>
X-Mailer: aerc 0.15.2
References: <20231027-ath11k-rproc-defer-v1-1-f6b6a812cd18@fairphone.com>
 <87lebowjyf.fsf@kernel.org>
In-Reply-To: <87lebowjyf.fsf@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri Oct 27, 2023 at 10:25 AM CEST, Kalle Valo wrote:
> Luca Weiss <luca.weiss@fairphone.com> writes:
>
> > If we already have gotten the rproc_handle (meaning the "qcom,rproc"
> > property is defined in the devicetree), it's a valid state that the
> > remoteproc module hasn't probed yet so we should defer probing instead
> > of just failing to probe.
> >
> > This resolves a race condition when the ath11k driver probes and fails
> > before the wpss remoteproc driver has probed, like the following:
> >
> >   [    6.232360] ath11k 17a10040.wifi: failed to get rproc
> >   [    6.232366] ath11k 17a10040.wifi: failed to get rproc: -22
> >   [    6.232478] ath11k: probe of 17a10040.wifi failed with error -22
> >        ...
> >   [    6.252415] remoteproc remoteproc2: 8a00000.remoteproc is availabl=
e
> >   [    6.252776] remoteproc remoteproc2: powering up 8a00000.remoteproc
> >   [    6.252781] remoteproc remoteproc2: Booting fw image qcom/qcm6490/=
fairphone5/wpss.mdt, size 7188
> >
> > So, defer the probe if we hit that so we can retry later once the wpss
> > remoteproc is available.
> >
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> Did you test this on a real device? If yes, what ath11k hardware and firm=
ware
> did you use? We use Tested-on tag to document that:
>
> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatche=
s#tested-on_tag

Hi,

Yes I tested this on qcm6490-fairphone-fp5 including some extra patches
for wpss-pas remoteproc support (nothing special, just adding it to the
existing PAS driver) and wifi enablement in dts.

I built this line from info from the dmesg, hope it's okay:

Tested-on: wcn6750 hw1.0 AHB WLAN.MSL.1.0.1-01264-QCAMSLSWPLZ-1.37886.3


And thinking about it, a Fixes tag would also be appropriate for this
patch.
The code was moved to a different file in commit ba929d6fe31a ("ath11k:
Remove rproc references from common core layer") but I think this tag
should be correct.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")

>
> I can add that in the pending branch if you provide the info.

Thanks!

Regards
Luca
