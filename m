Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1CDB98C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 23:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387479AbfITVHb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 17:07:31 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46826 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387431AbfITVHb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 17:07:31 -0400
Received: by mail-pf1-f195.google.com with SMTP id q5so5290616pfg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2019 14:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=lPIgzmO/aPJJEw9pL/CRSzhyVtzs0JpO8UpzUFEOaBQ=;
        b=b2M0SMWw96aMNTsOlmWo8NW6A6GBgxj00yVxoie2lvcFcImFjACQ5a6NVxXmBr1fZ3
         KcXfxvujifhSx74q2XGy3QX2C1PtePSqzBOgzegWIMspO1BvCQI3jqQ1F9mHe79PHfyw
         kXiu5/W/2czx7NlzaTVvv774NlIsaW+Tu0Bto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=lPIgzmO/aPJJEw9pL/CRSzhyVtzs0JpO8UpzUFEOaBQ=;
        b=U6qYApDWndD05DJxIQ+I7Yzm7K8DNmJrMNreMfPF7xK1MIheUXx3sK2ZKT56YtyTJB
         S0O7kvniJi72G9XrDTuAxfPEXlOmDivFOKF4JPcTLJbt78cAaTYUp7tYxfGs7+3uL+jH
         hHlLcebR4yXjqMoPTZVHSoK4ja2enBKbed1AS7pv+Bml+oerY8GL92OuapvV23ZFI83A
         Rl2T0Vtq0ZVd/mn5P7rMPmig2mWgJ9WabqFWj824vwcyv/+fXEcYKrSyBZQXlj4q8cSm
         nUH4gw4lZls+loRDBRRgNh7rmZsJek+RRD7J9gxG+fq4ZRvAKqt2RIsc13fgKZesEl9U
         nytg==
X-Gm-Message-State: APjAAAUfZd4eqyZ1VgTQb0mtr3OFuN/5fpRsMTFh4QAu5jxeDv0mmP8r
        vaVYKnf9dkCfjTebO13suSyMrVnEyUE=
X-Google-Smtp-Source: APXvYqyAWN51mb5bwvg5tMBgXdaWqe6d1zPHJiWwX3nmpCkKnqqQBzcRed7PrS5FMAE8YAwI65K7Cg==
X-Received: by 2002:a62:e21a:: with SMTP id a26mr20135657pfi.80.1569013649984;
        Fri, 20 Sep 2019 14:07:29 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a11sm3742571pfg.94.2019.09.20.14.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 14:07:29 -0700 (PDT)
Message-ID: <5d853f91.1c69fb81.a630b.98dd@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3ed0de38b57fda1995d0f231cbcec38c16387a2a.1568966170.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1568966170.git.saiprakash.ranjan@codeaurora.org> <3ed0de38b57fda1995d0f231cbcec38c16387a2a.1568966170.git.saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Will Deacon <will@kernel.org>, bjorn.andersson@linaro.org,
        iommu@lists.linux-foundation.org
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv7 3/3] iommu: arm-smmu-impl: Add sdm845 implementation hook
User-Agent: alot/0.8.1
Date:   Fri, 20 Sep 2019 14:07:28 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-09-20 01:04:29)
> From: Vivek Gautam <vivek.gautam@codeaurora.org>
>=20
> Add reset hook for sdm845 based platforms to turn off
> the wait-for-safe sequence.
>=20
> Understanding how wait-for-safe logic affects USB and UFS performance
> on MTP845 and DB845 boards:
>=20
> Qcom's implementation of arm,mmu-500 adds a WAIT-FOR-SAFE logic
> to address under-performance issues in real-time clients, such as
> Display, and Camera.
> On receiving an invalidation requests, the SMMU forwards SAFE request
> to these clients and waits for SAFE ack signal from real-time clients.
> The SAFE signal from such clients is used to qualify the start of
> invalidation.
> This logic is controlled by chicken bits, one for each - MDP (display),
> IFE0, and IFE1 (camera), that can be accessed only from secure software
> on sdm845.
>=20
> This configuration, however, degrades the performance of non-real time
> clients, such as USB, and UFS etc. This happens because, with wait-for-sa=
fe
> logic enabled the hardware tries to throttle non-real time clients while
> waiting for SAFE ack signals from real-time clients.
>=20
> On mtp845 and db845 devices, with wait-for-safe logic enabled by the
> bootloaders we see degraded performance of USB and UFS when kernel
> enables the smmu stage-1 translations for these clients.
> Turn off this wait-for-safe logic from the kernel gets us back the perf
> of USB and UFS devices until we re-visit this when we start seeing perf
> issues on display/camera on upstream supported SDM845 platforms.
> The bootloaders on these boards implement secure monitor callbacks to
> handle a specific command - QCOM_SCM_SVC_SMMU_PROGRAM with which the
> logic can be toggled.
>=20
> There are other boards such as cheza whose bootloaders don't enable this
> logic. Such boards don't implement callbacks to handle the specific SCM
> call so disabling this logic for such boards will be a no-op.
>=20
> This change is inspired by the downstream change from Patrick Daly
> to address performance issues with display and camera by handling
> this wait-for-safe within separte io-pagetable ops to do TLB
> maintenance. So a big thanks to him for the change and for all the
> offline discussions.
>=20
> Without this change the UFS reads are pretty slow:
> $ time dd if=3D/dev/sda of=3D/dev/zero bs=3D1048576 count=3D10 conv=3Dsync
> 10+0 records in
> 10+0 records out
> 10485760 bytes (10.0MB) copied, 22.394903 seconds, 457.2KB/s
> real    0m 22.39s
> user    0m 0.00s
> sys     0m 0.01s
>=20
> With this change they are back to rock!
> $ time dd if=3D/dev/sda of=3D/dev/zero bs=3D1048576 count=3D300 conv=3Dsy=
nc
> 300+0 records in
> 300+0 records out
> 314572800 bytes (300.0MB) copied, 1.030541 seconds, 291.1MB/s
> real    0m 1.03s
> user    0m 0.00s
> sys     0m 0.54s
>=20
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

