Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A926613475
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 12:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbiJaLXG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 07:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbiJaLXG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 07:23:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53377E03C
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 04:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667215331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=R3s940xgEPR1CURw7WAm+YgalLb7F1R1G/ZzPBXuNeQ=;
        b=cRv0lpfNf8Wl+TU3HMUaA30jEVM+rvLwwgCTpu6LEUpsevAfOk/9G67ZbSNGLAjyHfKsOd
        AKBSWa8YV14mvPTXMXzRda+wvXQEGaZlS0oGxHKo4aMynrPcgM9fVsOX91/kLTfkOcKO6F
        ck1US8crVqYwPXb5viKkaUO9y0e1ufM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-dHYvex0HM-aVXvrKK4GZ3w-1; Mon, 31 Oct 2022 07:22:10 -0400
X-MC-Unique: dHYvex0HM-aVXvrKK4GZ3w-1
Received: by mail-qt1-f198.google.com with SMTP id 22-20020ac85756000000b0039cf0d41e2cso7430924qtx.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 04:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3s940xgEPR1CURw7WAm+YgalLb7F1R1G/ZzPBXuNeQ=;
        b=liEY3MvA+lyf3I4jh8+9N01d3rldF4aAPqVgoSoXFqf2GWKqgTJc32CE63eDeuo8tM
         oDvgiIxBp92GPCkpmfo5spNPD0GLA/GXXRAgJ2IwGAD4pzFM8Y8kvzAP6pIf5dUlXhPn
         R1luxqDn+KWeswgdRDXJAy9zONw5fzOqIRLPugp/wEXIQ/VZA5ImcQq3xYUg0jgIYjzp
         KPo9JKZGmDA4Mfu0zvALvS+1+ink6le9SgTaQMA/VZcEZ+LlGz1aNN2emxhkJ/GLuSol
         pjpdyRzjTpN/gTz2SlU9IHuDoudodTCOqDSENPH6F1Q4xcVmxjRfE/QgyrCUCyGmgoo5
         AAaQ==
X-Gm-Message-State: ACrzQf01iNZw0A9AgpbcUlP9RGH0ZJTFbYftGz3hdCiwC0SCPdVKiX84
        qfNUVymPNxAUWXr2CJShZqZY6vwtn/l1tGcn1QzUMzWbLT0diK+MYQL2vSNSFjbq+AoRQNLoBry
        i6pTD0vuHUKMtrk2Mh7fhBrNbaA==
X-Received: by 2002:ac8:4e93:0:b0:39c:ca5b:33a4 with SMTP id 19-20020ac84e93000000b0039cca5b33a4mr10155132qtp.264.1667215329894;
        Mon, 31 Oct 2022 04:22:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6af+fqJqwU5y5JTc65YnZhRaZwFZJ803iMIIM2mj2X3PhlPBE5hhaKUgtAlC5q6tQte9oqeA==
X-Received: by 2002:ac8:4e93:0:b0:39c:ca5b:33a4 with SMTP id 19-20020ac84e93000000b0039cca5b33a4mr10155113qtp.264.1667215329709;
        Mon, 31 Oct 2022 04:22:09 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id a1-20020ac81081000000b003a4b88b886esm3422093qtj.96.2022.10.31.04.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:22:09 -0700 (PDT)
Date:   Mon, 31 Oct 2022 07:22:08 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Shazad Hussain <quic_shazhuss@quicinc.com>
Cc:     andersson@kernel.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: qcom: gcc-sc8280xp: add cxo as parent for
 gcc_ufs_ref_clkref_clk
Message-ID: <Y1+v4M2/IVLAOjHJ@x1>
References: <20221030142333.31019-1-quic_shazhuss@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221030142333.31019-1-quic_shazhuss@quicinc.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 30, 2022 at 07:53:33PM +0530, Shazad Hussain wrote:
> Since 'commit f3aa975e230e ("arm64: dts: qcom: sc8280xp: correct ref
> clock for ufs_mem_phy")' we need to explicitly make cxo as parent to
> gcc_ufs_ref_clkref_clk to have an independent vote from ufs_mem_phy.
> 
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>

I verified that the QDrive3 still boots normally with this patch.

Tested-by: Brian Masney <bmasney@redhat.com>

