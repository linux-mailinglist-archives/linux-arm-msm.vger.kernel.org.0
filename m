Return-Path: <linux-arm-msm+bounces-25613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F48992B695
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 13:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5560F282327
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 11:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B14D1581EB;
	Tue,  9 Jul 2024 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KjNeS0jE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7C51586D0
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720523711; cv=none; b=JLp9tJ3V2WLvMVEonEX+qAXkBMHZVxkcAC3UG82EqIz6EoR4tIPPR08s9UguUvVsRRNxiRVtxWmOZ50KfXElwvD0+lHee1M2sZMFAgz2SmRM6JkiWm13ARzYu+zxzsTNiAU3Vm3VxelLFTbuWwq7et3Si+0qShmJiYBH6M6UPvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720523711; c=relaxed/simple;
	bh=yQ9NM+l1zVqq0j7T77l/b9HGHEwF0xiqRl64ejpWhBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ec2aHVfdbxt2TLPwiF5ey+zNfzTpcYF9DRvOKCUq5FZ/9QgUJXQhHbJzvKYXecKfHY4kwVMhkJ7cg+yDOkTxVBE9UFGcuQoCjSrNjgnc+T81riUORXonBpERr0UjFWAjbVE/s/1eCTKCVxO1KSNn9DXIF3jk/9/UKuy81AL3c38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KjNeS0jE; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-64b5617ba47so40441207b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 04:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720523708; x=1721128508; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1xs0HKvjIXU9N0dl5ke31NoTuxcyqc28H/Jk8DSGVHw=;
        b=KjNeS0jEhFg1AgPLy5il0ZcjuzYFPO+xHYlWzssXh9rWQhTbaswDUs8bEeLd5WVxFb
         JxKyPED0Z1HRSWl4+MxU619nOteTstGGwO8H8VZHoeilUydHU6DAktmaiVnhiR4b68YN
         WVQ5RFONPmMOkIeBCBPOi91M28eJVBai/4OvVbW9e4zgwE2PAD1y+axc0YFd1vyIJeg5
         PcgcHgM8UNnQ/Q3cTKgObReaz+TR3iVDNcvLXMATTNwOu/Pu1GzkVJFWZOz32m99G0zq
         E7RMhkmy8ekaFJeRgU2tI1pEeOPh7LxpByUnH78r/psPoGlN1a8oLB7AZ18HVmEhnnsY
         3jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720523708; x=1721128508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xs0HKvjIXU9N0dl5ke31NoTuxcyqc28H/Jk8DSGVHw=;
        b=rEQscsRFa8mKnMPn4wiVoQPoPv1/hexCOb397KuPHXGHp3KvGqbEMeaMQqcA0V6MFI
         UQpGmwd420tE2ibggVkfX17C094LYT69YU4FTzR/oml6jCWMGFjiAmr4pUePIVUEMYTe
         hD+t8ffieE7Tuj6M85q68ANrIh0brCgUqgm8TLlUZGf6nhNxgBP8IinD3azgJZt944Sw
         YCSoOd/lGxF5dG7K4EljEzVlYkFq+FbUl5swFiizFhR+/EonV1HzYXJ3b6mTtgM4avwX
         mz7ay/u2iMOsBtChC1MW7nduQc0Q1IqcZCC+ou2MAwihA3qXE8xpNwCAECdn3tKGvQeU
         DjjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKundNkYKQL8XZY3FXzG/Iczg7rw2FayDOdW+Ohqp3P6C765+Kh0a5IISdHLLzW9VotPEEqnzVJvlgTxwrMZTUxnBjqgNxWTwt2kJ/sA==
X-Gm-Message-State: AOJu0YxXHZzFMZaA8phOPaH7ZuCNDo6OZOcaNyygR2wHj+PAO7OrPuuE
	MHV3BHUWCpfTmC4qQ5bnjlAH0sNAYV/Yk3oudzXa0swkebm6WiRAgIA4wwIOkUjFVQmnVDrhlTP
	gX+PMXd+FQJ3Jvw2qnHVhCk43jWJQreh9hRhqLQ==
X-Google-Smtp-Source: AGHT+IEe3nga3KVXtHrrwMw0LhHVXjdHyDPZ5uKUnuXkRHUYNX06lcrnyme+JwGrKLNVy4VLF2PrLdXqWcdfOSeg4IQ=
X-Received: by 2002:a81:5b42:0:b0:64a:6eda:fc60 with SMTP id
 00721157ae682-658ee69ac4cmr26076237b3.4.1720523708479; Tue, 09 Jul 2024
 04:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625-avoid_mxc_retention-v2-1-af9c2f549a5f@quicinc.com>
In-Reply-To: <20240625-avoid_mxc_retention-v2-1-af9c2f549a5f@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 9 Jul 2024 13:14:32 +0200
Message-ID: <CAPDyKFpid-LEqqSXBHYRc6CKdHpmT+FnS3xrCTt7Z0RhcCSfCg@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: qcom: rpmhpd: Skip retention level for Power Domains
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_jkona@quicinc.com, 
	quic_imrashai@quicinc.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Jun 2024 at 06:33, Taniya Das <quic_tdas@quicinc.com> wrote:
>
> In the cases where the power domain connected to logics is allowed to
> transition from a level(L)-->power collapse(0)-->retention(1) or
> vice versa retention(1)-->power collapse(0)-->level(L)  will cause the
> logic to lose the configurations. The ARC does not support retention
> to collapse transition on MxC rails.
>
> The targets from SM8450 onwards the PLL logics of clock controllers are
> connected to MxC rails and the recommended configurations are carried
> out during the clock controller probes. The MxC transition as mentioned
> above should be skipped to ensure the PLL settings are intact across
> clock controller power on & off.
>
> On older targets that do not split MX into MxA and MxC does not collapse
> the logic and it is parked always at RETENTION, thus this issue is never
> observed on those targets.
>
> Cc: stable@vger.kernel.org # v5.17
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> [Changes in v2]: Incorporate the comments in the commit text.
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index de9121ef4216..d2cb4271a1ca 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -40,6 +40,7 @@
>   * @addr:              Resource address as looped up using resource name from
>   *                     cmd-db
>   * @state_synced:      Indicator that sync_state has been invoked for the rpmhpd resource
> + * @skip_retention_level: Indicate that retention level should not be used for the power domain
>   */
>  struct rpmhpd {
>         struct device   *dev;
> @@ -56,6 +57,7 @@ struct rpmhpd {
>         const char      *res_name;
>         u32             addr;
>         bool            state_synced;
> +       bool            skip_retention_level;
>  };
>
>  struct rpmhpd_desc {
> @@ -173,6 +175,7 @@ static struct rpmhpd mxc = {
>         .pd = { .name = "mxc", },
>         .peer = &mxc_ao,
>         .res_name = "mxc.lvl",
> +       .skip_retention_level = true,
>  };
>
>  static struct rpmhpd mxc_ao = {
> @@ -180,6 +183,7 @@ static struct rpmhpd mxc_ao = {
>         .active_only = true,
>         .peer = &mxc,
>         .res_name = "mxc.lvl",
> +       .skip_retention_level = true,
>  };
>
>  static struct rpmhpd nsp = {
> @@ -819,6 +823,9 @@ static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
>                 return -EINVAL;
>
>         for (i = 0; i < rpmhpd->level_count; i++) {
> +               if (rpmhpd->skip_retention_level && buf[i] == RPMH_REGULATOR_LEVEL_RETENTION)
> +                       continue;
> +
>                 rpmhpd->level[i] = buf[i];
>
>                 /* Remember the first corner with non-zero level */
>
> ---
> base-commit: 62c97045b8f720c2eac807a5f38e26c9ed512371
> change-id: 20240625-avoid_mxc_retention-b095a761d981
>
> Best regards,
> --
> Taniya Das <quic_tdas@quicinc.com>
>

