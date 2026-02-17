Return-Path: <linux-arm-msm+bounces-93177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4APkMtZnlGlFDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:06:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 330D614C5CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CDC8302DF49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847AB354AF5;
	Tue, 17 Feb 2026 13:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsCFdrWo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AB4335077;
	Tue, 17 Feb 2026 13:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333547; cv=none; b=TftISWTLb6mu8gqo3ub0Vu85Q5RdDF6qJLDdfUPZL1cf84O1rZPjE087/zn4dy2TnyWSamC4ISn+K8/UUd0XB2tS2up4a4+UA5dnsFelDA2GBpccnwmbNL+4Pm/SNyJL7EG14KP6xb2+NkkH1YxX4N7ZCHiHqZC4m9lc8KjLCy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333547; c=relaxed/simple;
	bh=YncLtiDZMDpaKzOMgaNUhFWgiWcHTE5/iqvNFpH2lU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1l+MR00ESG10eSed2qAzpGS4mYoqFk9iQ9AX23zeyAyCAtQ2xNwnCYROHviwerjjIEYAO+CcMktlMsbrMBJInQQidx790oc3DLwKY9DCMJJL7kS5ZNLlfo4+DMkubUENAjiLL+77Vuc+2kp8c0nysDodvp+adH0xwkpmLFUKgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsCFdrWo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE885C4CEF7;
	Tue, 17 Feb 2026 13:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771333547;
	bh=YncLtiDZMDpaKzOMgaNUhFWgiWcHTE5/iqvNFpH2lU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsCFdrWo9EgQbwmiUI2JC1d1sVYqNuQHQ1/bcHlY055CMZjF1hmGvgoV8cJ9XAX33
	 kFg2zfehK+N61S5bNfn7EWMNHvkkv2BXwjGfJgw9gmmiDor8gKIM0h7DmVhaWHs9w1
	 DsLLd3kOeZJJmfju/Q9MqWpR/BJrCajFmF550jZRQ6nlUY4C2I+gpl+3AahkU18xQ8
	 444I0w3oni7G24HHzXeO/eE0dnfUPH7J4eEJKOb4M7YXrQunFUp/sLJTtzcxCA5ZvA
	 AelTRZLIZPEnnim1ojcvHzTvmj/MfIOj6ZPumng2EBk55eMxsVUn+Ji6acqIDCXS8W
	 uVgt0H1lO4nTQ==
Date: Tue, 17 Feb 2026 18:35:39 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Subject: Re: [PATCH] Revert "drm/msm/dpu: try reserving the DSPP-less LM
 first"
Message-ID: <hcsh6ql2ylidw4ruszd5hea6zjpquzkacdkr7pbifppi3gpnbg@btdlt4m6znpl>
References: <20260214-revert-dspp-less-v1-1-be0d636a2a6e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260214-revert-dspp-less-v1-1-be0d636a2a6e@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93177-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,packett.cool];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 330D614C5CE
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 01:02:59AM +0200, Dmitry Baryshkov wrote:
> This reverts commit 42f62cd79578 ("drm/msm/dpu: try reserving the
> DSPP-less LM first"). It seems on later DPUs using higher LMs require
> some additional setup or conflicts with the hardware defaults. Val (and
> other developers) reported blue screen on Hamoa (X1E80100) laptops.
> Revert the offending commit until we understand, what is the issue.
> 
> Fixes: 42f62cd79578 ("drm/msm/dpu: try reserving the DSPP-less LM first")
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://lore.kernel.org/r/33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Manivannan Sadhasivam <mani@kernel.org> # T14s

- Mani

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 52 +++++++++-------------------------
>  1 file changed, 14 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 451a4fcf3e65..7e77d88f8959 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -350,26 +350,28 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>  	return true;
>  }
>  
> -static bool dpu_rm_find_lms(struct dpu_rm *rm,
> -			    struct dpu_global_state *global_state,
> -			    uint32_t crtc_id, bool skip_dspp,
> -			    struct msm_display_topology *topology,
> -			    int *lm_idx, int *pp_idx, int *dspp_idx)
> +static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> +			       struct dpu_global_state *global_state,
> +			       uint32_t crtc_id,
> +			       struct msm_display_topology *topology)
>  
>  {
> +	int lm_idx[MAX_BLOCKS];
> +	int pp_idx[MAX_BLOCKS];
> +	int dspp_idx[MAX_BLOCKS] = {0};
>  	int i, lm_count = 0;
>  
> +	if (!topology->num_lm) {
> +		DPU_ERROR("zero LMs in topology\n");
> +		return -EINVAL;
> +	}
> +
>  	/* Find a primary mixer */
>  	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
>  			lm_count < topology->num_lm; i++) {
>  		if (!rm->mixer_blks[i])
>  			continue;
>  
> -		if (skip_dspp && to_dpu_hw_mixer(rm->mixer_blks[i])->cap->dspp) {
> -			DPU_DEBUG("Skipping LM_%d, skipping LMs with DSPPs\n", i);
> -			continue;
> -		}
> -
>  		/*
>  		 * Reset lm_count to an even index. This will drop the previous
>  		 * primary mixer if failed to find its peer.
> @@ -408,38 +410,12 @@ static bool dpu_rm_find_lms(struct dpu_rm *rm,
>  		}
>  	}
>  
> -	return lm_count == topology->num_lm;
> -}
> -
> -static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> -			       struct dpu_global_state *global_state,
> -			       uint32_t crtc_id,
> -			       struct msm_display_topology *topology)
> -
> -{
> -	int lm_idx[MAX_BLOCKS];
> -	int pp_idx[MAX_BLOCKS];
> -	int dspp_idx[MAX_BLOCKS] = {0};
> -	int i;
> -	bool found;
> -
> -	if (!topology->num_lm) {
> -		DPU_ERROR("zero LMs in topology\n");
> -		return -EINVAL;
> -	}
> -
> -	/* Try using non-DSPP LM blocks first */
> -	found = dpu_rm_find_lms(rm, global_state, crtc_id, !topology->num_dspp,
> -				topology, lm_idx, pp_idx, dspp_idx);
> -	if (!found && !topology->num_dspp)
> -		found = dpu_rm_find_lms(rm, global_state, crtc_id, false,
> -					topology, lm_idx, pp_idx, dspp_idx);
> -	if (!found) {
> +	if (lm_count != topology->num_lm) {
>  		DPU_DEBUG("unable to find appropriate mixers\n");
>  		return -ENAVAIL;
>  	}
>  
> -	for (i = 0; i < topology->num_lm; i++) {
> +	for (i = 0; i < lm_count; i++) {
>  		global_state->mixer_to_crtc_id[lm_idx[i]] = crtc_id;
>  		global_state->pingpong_to_crtc_id[pp_idx[i]] = crtc_id;
>  		global_state->dspp_to_crtc_id[dspp_idx[i]] =
> 
> ---
> base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
> change-id: 20260214-revert-dspp-less-8426dee24b92
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 

-- 
மணிவண்ணன் சதாசிவம்

