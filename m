Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06ECB7E074C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Nov 2023 18:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377296AbjKCRSa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 13:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377493AbjKCRS0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 13:18:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AEFDD55
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 10:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699031863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=h+xYoZa1D29Tc8qHBnu/MR8dpq7wRlwns0nY5ywIXUg=;
        b=QfCO7dVZ/Sa1yYd4Ak+96xtnIjuyGkkqPUnpQqpMVdP9A8kCH9vtAZDwMHQHF2pi7oop+K
        ykTcA1VlT29/N4YUzcg+8lD9uWgKBW2MJ4rGs7SxXy2v3g+cWwNYjSTVXEbQ1dkPBDdtZq
        XYsp8O1dS3kpP2//046S/qvll/iP4YI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-Hl13eCqGNh25ooiRU0E_mQ-1; Fri, 03 Nov 2023 13:17:41 -0400
X-MC-Unique: Hl13eCqGNh25ooiRU0E_mQ-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41e172143c3so51692701cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Nov 2023 10:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699031860; x=1699636660;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+xYoZa1D29Tc8qHBnu/MR8dpq7wRlwns0nY5ywIXUg=;
        b=WoF5L6U5XM/hKYFsxh/K6k0HxIMdyk87tIt/GPRImwCfQ7WyMaYFdhflJDaVYvkZss
         PQXepvaeQgxEkuC+d4cgkin3N7PCtPcUelkOPcUSdmqQB2aWwNVKKUqS0Xtn1vbn5PVy
         8BNCVSUdjdmX2XUlzGBVFbrFSCih9ytA+qpmmlsz2yxHfD26M8brEswsNiDN09tmnPmz
         wdhYGeiBiuSi73Kq0Ib4fbXAcenOWCgwBmjzaLkNIe6xr3/n4co3lNQxJi0Z4E/tyo4z
         qzZm+EDSbM+82QQswqCO68Oxa8+u2s1tinnFe1XvBmKFq6uDdgUENUufjiyZwm7U5S6Q
         Vw1g==
X-Gm-Message-State: AOJu0YwsO3iqUljRxYNMVKhmKEf52s05YnuSQoXLY4qGzMupPk7ygPZ4
        C8Vm2QBXvQ159JiOmuRFB6rbZO67ZAgxFtH1XK80B6hpDjK5blnYaMgRd/0xIaNiCzIY+e4dyJT
        p+VXdZEPDwEA+isI6LZN8MnDHkEo455csTPADX2VRXyTJp0DDVmf5tmFJkbcwZCi9qjQK8+JEr7
        M5FIbIvloq
X-Received: by 2002:ad4:4d93:0:b0:66d:13b5:ca16 with SMTP id cv19-20020ad44d93000000b0066d13b5ca16mr5311692qvb.27.1699031860323;
        Fri, 03 Nov 2023 10:17:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQxuIidyqR6xqOyrXi/5TRad6o/L+KcRV61P1oV+qMdX//0nKx8FWryvEAHjDCyyc15SKmtg==
X-Received: by 2002:ad4:4d93:0:b0:66d:13b5:ca16 with SMTP id cv19-20020ad44d93000000b0066d13b5ca16mr5311669qvb.27.1699031859970;
        Fri, 03 Nov 2023 10:17:39 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id f7-20020a0cc307000000b0064f4e0b2089sm921522qvi.33.2023.11.03.10.17.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 10:17:39 -0700 (PDT)
Date:   Fri, 3 Nov 2023 13:17:38 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     linux-arm-msm@vger.kernel.org
Subject: External display on the x13s?
Message-ID: <ZUUrMm1Q/PI5xv6a@brian-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I have Fedora 39 running on my x13s (with some minor tweaks to the grub
BLS boot entry) and it has working GPU, sound, battery status, etc. I
see the external display port in the DTS, however it's not working for
me. I have pd-mapper and qrtr installed. Does anyone have any
suggestions for enabling that? dmesg doesn't give any useful
information.

Brian

