Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4492022E5DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 08:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgG0G05 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 02:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbgG0G04 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 02:26:56 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3EC2C0619D4
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2020 23:26:54 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k1so8617434pjt.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2020 23:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SvwHT3zjyXrrBuntHjIVAEV0M2NnXn0+m3b0NtDYJoE=;
        b=ejdZFEQvh05oUlpaaf9ORS5njhfQig6+GWZ5iAPvih6BwIK+yozIcqu5gDr5y2tL56
         ADgJc78zCBS2EW98C0yjIxuIsjhx09ehgqbbeHbAwoyMpOQVXTQH1nMrTOPbKRHgt8O9
         sEQlDf+2CMo4G6gOuRpnv5VESD2+VrOWa7LgfpsijoI1HeDvVons3C2Y9+dsPMLZ1Oz3
         Bdws0mCecBLhZm6sHQMYNW4/SJu9hk164lbUn1lN17jQ742Assa0ed2lVhx7uFglNVLw
         cZMgphZV/5Ax8e+K6npZ4GuvFErEUH7JIESgfsRAUz25GtLadeKzdGjt153zNVy4+pwE
         fIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SvwHT3zjyXrrBuntHjIVAEV0M2NnXn0+m3b0NtDYJoE=;
        b=DW4ZQUXRkV4eO5N76pnSJ1Ik5goiV8lR9C2qiXoZj0ytCDF6WvWcniCFSwAF5fp7Bq
         mmHySCW5crn1UbwrCdrKbpqC9WMwGNo2sFxqNgr7So6pWA1wTSeX9lTAFaG8k8A2mfvQ
         rU+bA1RFojMthzb0v4VCKCWPj5RvaAlumlkCEkfJA6m7bQn7dl8uDh7rSSUj8/JHvxqX
         zyq7YrbxkeGJXUa3XlPSMDhyg3zzBa3i7tTsUDsp9eqNriMISrQYpn8/7EdUW+LdoB8C
         g0wN8PRWPg0QztIo1ytgzM9C9Uz3euS1nreoTIPXx4bMVPLlbqECiLAp3dnoAi5Xp4Ij
         egOw==
X-Gm-Message-State: AOAM530nIYnkYOWh8U3X2SK/wjlx8T4x7AU+VIKRUoEQ61eCCb/+Xq2D
        Q+aG2bwp8GoniNdPa+M90yqvDw==
X-Google-Smtp-Source: ABdhPJxzOwp68yM0wuFfeb8opsYwXxFrJEEJC31OdMJvY+oua+KBvMHJty3QtAaz4JwNX0GSAm9idQ==
X-Received: by 2002:a17:902:aa82:: with SMTP id d2mr17236160plr.336.1595831214315;
        Sun, 26 Jul 2020 23:26:54 -0700 (PDT)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g23sm3090336pfo.95.2020.07.26.23.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 23:26:53 -0700 (PDT)
Date:   Sun, 26 Jul 2020 23:27:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        iommu@lists.linux-foundation.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 04/13] iommu/arm-smmu-qcom: Add implementation for
 the adreno GPU SMMU
Message-ID: <20200727062703.GB3521288@ripper>
References: <20200720154047.3611092-1-jcrouse@codeaurora.org>
 <20200720154047.3611092-5-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720154047.3611092-5-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 Jul 08:40 PDT 2020, Jordan Crouse wrote:
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
[..]
> +static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
> +		struct device *dev, int start, int count)
> +{
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +
> +	/*
> +	 * Assign context bank 0 to the GPU device so the GPU hardware can
> +	 * switch pagetables
> +	 */
> +	if (qcom_adreno_smmu_is_gpu_device(dev)) {
> +		if (start > 0 || test_bit(0, smmu->context_map))
> +			return -ENOSPC;
> +
> +		set_bit(0, smmu->context_map);
> +		return 0;
> +	}
> +
> +	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);

If we end up here before the GPU device shows up this is going to
steal the first context bank, causing the subsequent allocation for the
GPU to always fail.

As such I think it would be appropriate for you to adjust "start" to
never be 0 here. And I think it would be appropriate to write this
function as:

	if (gpu) {
		start = 0;
		count = 1;
	} else {
		if (start == 0)
			start = 1;
	}

	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);

Regards,
Bjorn
