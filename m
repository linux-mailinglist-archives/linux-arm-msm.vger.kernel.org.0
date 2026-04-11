Return-Path: <linux-arm-msm+bounces-102829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNhJEFrg2mnA6wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 01:59:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F913E1FED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 01:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7318B301BCEC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 23:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A912330D29;
	Sat, 11 Apr 2026 23:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4jcmqz1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yk6Iah2p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE4B1FC8
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 23:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775951922; cv=none; b=ferazH9EEH4KZZMkWLwjUaNTfA2GsHiEnSMuJ1rPDt11DYUgLwxgeeRJXhbypqhnvvGxUGdhmV5tDga0kmkcKmt+dsDPTIiypf68C3fOyLJztlPXxhWmjHDCgetndFciHnnl0X6LGDZ1DW5oOtbAg6YTbjmTpSK+WD30s4lDRjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775951922; c=relaxed/simple;
	bh=D/SwsgWmA3K3d2W9Rkc+VQSM8Pvn+c0S4NxjbPMuM18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FInMyl/mXuImdZ8ojvwj4coq/zkL1cay371VvTHjB4+jOgnknR3aJbRA9BEz6UhCv56ZxD79jWTKs1vbCfMwfUssjjeg7H/P1PjWDFa15/6b1heYtAJ4bYMcuxgNSMdhwvLHHFKzQRFHzlFbByl7cGA+XIp/pTtxB4VAnFGu2Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4jcmqz1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yk6Iah2p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BLqbQH2680811
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 23:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BbmBFdbUixMvWxkzC4XDqzQU
	R2bby+BxKze839a2Pfo=; b=S4jcmqz1abyFpsUcRPgnFZy55o8/Z6ncbQMTGa9X
	N41wPyiSJ770I5HB2IHnuLIo0COzSIOiXRVm6R3qmsQ27gbTWn+YGKNQ1Vg9+0ni
	lgBfuM07n4GFfBviGKLEvikasLbBhxFSGU4KxyC3UTEbIGnwSskWQXuqZrkyJSda
	SeaWiQtHno5O6l08bCfvtkuK0BerOBXem8x89atWnjtrXJ/84GF4mAcVrutjnt7t
	CS3zqmsK102e7pw8ft4RkzPoH7R2H3USxvhud32O33sughF1zRSEPtUNnUCIH2f/
	Vkd6C57rwD/+RFyCFMuNa/lnV3URy/zLafSgv757E5/G0w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevthhua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 23:58:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca154e2b5so8357286d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 16:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775951917; x=1776556717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BbmBFdbUixMvWxkzC4XDqzQUR2bby+BxKze839a2Pfo=;
        b=Yk6Iah2p7WeIf8NuO3q9Q0nm2LtA0SwHtDUntp44rq/yh7JgUNu0ynz4dN4VkZ7X82
         y/Plf5nSPThevRhU1yr+rWlOAmT2aVucJHj6ufupWNq4ySBP993x+KAL1wpBsIZeFAdP
         X3E9Imq576yK2ZsrfLGQxSBNspUSq0Et6W+zy85bHhs94CYw+4ayP9X9UZzVl2CCMDMQ
         ORHsFnSC3znJ7RLHCRa4iFjQGmaHOaQPx5AvxFf38OKjSJNisJu7p6TMTk9vzL2HkpfC
         1H0oAefnvuna5YYmcb5KmfUziIwiWNIPaduDLDz+vA8WfwrE8w/WChmtRRHOWB7HiyyD
         zYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775951917; x=1776556717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbmBFdbUixMvWxkzC4XDqzQUR2bby+BxKze839a2Pfo=;
        b=gyWjDAoJLP79+bCOiheJw33286uTmjtqPvc+LG5+az/hJkeR/HI0ej/WHxBPFxvV3B
         TvITiqm3TIGSsGzFAWeA3YvJ5fqwbPaqI5SqewP3korjgd/fowl8UwzSZYdnARYp1RIH
         kdlvF5tRC6Jm8k18RdYr2OGsobL3IRzHCfVxQNRs4KuO3AwKAX9FgMpI7+li+bH0lM8V
         kRkHljNnVCXA22rL7uC/HrABTD7GkhdgWOtsz9Y8ocgQ67nACmtU61O1tEZPMZOChLoh
         qDBgnV5KqSQgfeUg7CdeJzPgDO+7fKy2epL+WOge3w7DagCB+i18DKLJoOlEAd7e8fOO
         kypQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxi1GXOVbZciUSOgcBSyQFRQ/lwsY/hjyLI9zrHpccopGomFoPdy7LomI/z92tvWJ9NMMxOW8bxLmXAem1@vger.kernel.org
X-Gm-Message-State: AOJu0YyXfYYQd7hqzHRhTyxsYwAaq5Q6dYiddynEoOk11uc8n5p6LzXk
	REtPQyCh8/keW8+GQCBIgRrIaa1Ssybq15VvCOhHW3pdQvRnwkfc8vbnwdRAKSjWYd5l//Rq5Dd
	1ew5tQXSqRa87Kpnc6oMZhUA3Hdq1quDCujWZQMwpUz8RTvnJDoWu2gbyyqtc15mjpVzq
X-Gm-Gg: AeBDieu6ll4pLHUMe6igRxYrYnA55Wd4JIBwAn7s9zT95zBn878urw1nfZtviIFku1/
	HpyIEqXh6L5fyImnpBn7qxLtdgkb/uHr5Mg8fIzRLSkaRAoNdvBddIn7Nb9M6Rvx2f4nkYu8by1
	dYPtnl1nOjHl78rdMpKVgLt48oBpRQuQN0hl0IQCeMm7U6uNM4JFgk/W569VGc9yxuQIR8UCi3m
	IzAkDKGWPCOmg47yP3DWRvkcKLUOQ7PMwCXaB+oyCNNKyHyacJ0XjCAa0JB0o5Q6l09/rV7LrHw
	z5gpOGjo6uSW2YU/dmnBFEJqGHq716c9+aQ+ln3Ux4mQ4BW+mG3lRc0QmwhDlEgbI05zIgG6CHh
	dBBnNGVtJalVZZsrETFlGQ1LQY4AGgzrdcaArRYmDT5fX2fDqhhwpjXWT74Xhe74eelBdEEctfW
	saNiZklmWiUwe7k+cPF3KdmZeO7Fjg+OnSgq4=
X-Received: by 2002:a05:622a:4009:b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50dd5ba3bd7mr121267181cf.42.1775951917301;
        Sat, 11 Apr 2026 16:58:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4009:b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50dd5ba3bd7mr121267021cf.42.1775951916774;
        Sat, 11 Apr 2026 16:58:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefcb1asm1707059e87.69.2026.04.11.16.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 16:58:34 -0700 (PDT)
Date: Sun, 12 Apr 2026 02:58:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 21/39] drm/msm/dp: Add support for MST channel slot
 allocation
Message-ID: <o6n2h7q2q2r6yd3wpyfvd4napu3pixx6ni3o7r32yht2eyuc3a@renxw53ugvtt>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-21-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-21-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dae02e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=L8C09zN3Hve-ZzQWPfoA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EFg6uAw8MVdn4f3ylsZolLF6IT2rK2qR
X-Proofpoint-ORIG-GUID: EFg6uAw8MVdn4f3ylsZolLF6IT2rK2qR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDIxOSBTYWx0ZWRfX6ka2za7+H3QF
 /ZI/hic2wcAWc+qDashGsFPBMKgE8AJt4XilVgZsO96Yq16rP1HFHymWZwfSA0cR9Ej6jbC4Zhz
 vHgSGhiE5Ct3NhfOlib81e5RjNjJHoZeH9lY+QVbKbL0QNoop9A+y5S2uzyg7VnKzpX7JXen67h
 /PGeMkn36VC13DOG9Vw7AYoLZYuiUe0fe+vfkKe96l9aEWxCQQYagk+dHCwv6x0sibi5WXfa+P3
 DVmX2EvvEKI4hMXPlpUTt9Y3FpZfyxeABOnINpTn/dllXfvKYnATSFfEWYG2CQrZO/5Qh3TkkNf
 iogp0dmDTMBMdL6lKUEbMmLvfKTFazqRRJo+9xbV+4+SkgeYISwWx1AF4y7XQlIvwmThjoSKOL+
 O/ereZk/LbRxQI6jJ1nLGCWaA0bnrT75TwCNwWHtP/6DY5l8o4bPQ+OIrTQw3ndW16aesgLJrSM
 z8l5vm+twGj9qr98ZIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110219
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102829-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D3F913E1FED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:56PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> DP MST streams share 64 MTP slots in a time-multiplexed manner. This patch

Documentation/process/submitting-patches.rst, "This patch".

> adds support for calculating the rate governor, slot allocation, and slot
> reservation in the DP controller.
> 
> Each MST stream can reserve its slots by calling
> dp_display_set_stream_info() from its bridge callbacks.

-ENOSUCHFUNCTION

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 207 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   7 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  28 +++--
>  drivers/gpu/drm/msm/dp/dp_display.h |   5 +-
>  drivers/gpu/drm/msm/dp/dp_panel.h   |   1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  10 ++
>  6 files changed, 247 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 98316892eccd..e64f81bc8c36 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -73,6 +73,7 @@
>  #define MR_LINK_PRBS7 0x100
>  #define MR_LINK_CUSTOM80 0x200
>  #define MR_LINK_TRAINING4  0x40
> +#define DP_MAX_TIME_SLOTS 64
>  
>  enum {
>  	DP_TRAINING_NONE,
> @@ -109,6 +110,11 @@ struct msm_dp_vc_tu_mapping_table {
>  	u8 tu_size_minus1;
>  };
>  
> +struct msm_dp_mst_ch_slot_info {
> +	u32 start_slot;
> +	u32 tot_slots;
> +};
> +
>  struct msm_dp_ctrl_private {
>  	struct msm_dp_ctrl msm_dp_ctrl;
>  	struct drm_device *drm_dev;
> @@ -144,6 +150,8 @@ struct msm_dp_ctrl_private {
>  	bool link_clks_on;
>  	bool stream_clks_on[DP_STREAM_MAX];
>  	bool mst_active;
> +
> +	struct msm_dp_mst_ch_slot_info mst_ch_info[DP_STREAM_MAX];
>  };
>  
>  static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
> @@ -268,6 +276,73 @@ static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable
>  	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>  }
>  
> +static void msm_dp_ctrl_mst_channel_alloc(struct msm_dp_ctrl_private *ctrl,
> +					  enum msm_dp_stream_id stream_id, u32 ch_start_slot,
> +					  u32 tot_slot_cnt)
> +{
> +	u32 i, slot;
> +	u32  slot_reg_1, slot_reg_2;

Fold these two lines.

> +	u32 reg_off = 0;
> +	int const num_slots_per_reg = 32;
> +
> +	if (ch_start_slot > DP_MAX_TIME_SLOTS ||
> +	    (ch_start_slot + tot_slot_cnt > DP_MAX_TIME_SLOTS)) {
> +		DRM_ERROR("invalid slots start %d, tot %d\n",
> +			  ch_start_slot, tot_slot_cnt);
> +		return;
> +	}
> +
> +	drm_dbg_dp(ctrl->drm_dev, "stream_id %d, start_slot %d, tot_slot %d\n",
> +		   stream_id, ch_start_slot, tot_slot_cnt);
> +
> +	if (stream_id == DP_STREAM_1)
> +		reg_off = REG_DP_DP1_TIMESLOT_1_32 - REG_DP_DP0_TIMESLOT_1_32;
> +
> +	slot_reg_1 = 0;
> +	slot_reg_2 = 0;
> +
> +	if (ch_start_slot && tot_slot_cnt) {
> +		ch_start_slot--;
> +		for (i = 0; i < tot_slot_cnt; i++) {
> +			if (ch_start_slot < num_slots_per_reg) {
> +				slot_reg_1 |= BIT(ch_start_slot);
> +			} else {
> +				slot = ch_start_slot - num_slots_per_reg;
> +				slot_reg_2 |= BIT(slot);
> +			}
> +			ch_start_slot++;

If it is a counter, it's no longer a starting slot. And I think I wrote
this before. Please replace the loop with the math.

> +		}
> +	}
> +
> +	drm_dbg_dp(ctrl->drm_dev, "stream_id:%d slot_reg_1:%d, slot_reg_2:%d\n", stream_id,
> +		   slot_reg_1, slot_reg_2);
> +
> +	msm_dp_write_link(ctrl, stream_id, stream_id > DP_STREAM_1 ?
> +			  REG_DP_MSTLINK_TIMESLOT_1_32 : REG_DP_DP0_TIMESLOT_1_32 + reg_off,
> +			  slot_reg_1);
> +	msm_dp_write_link(ctrl, stream_id, stream_id > DP_STREAM_1 ?
> +			  REG_DP_MSTLINK_TIMESLOT_33_63 : REG_DP_DP0_TIMESLOT_33_63 + reg_off,
> +			  slot_reg_2);
> +}
> +
> +static void msm_dp_ctrl_update_rg(struct msm_dp_ctrl_private *ctrl,
> +				  enum msm_dp_stream_id stream_id, u32 x_int, u32 y_frac_enum)
> +{
> +	u32 rg, reg_off = 0;
> +
> +	rg = y_frac_enum;
> +	rg |= (x_int << 16);
> +
> +	drm_dbg_dp(ctrl->drm_dev, "stream_id: %d x_int:%d y_frac_enum:%d rg:%d\n",
> +		   stream_id, x_int, y_frac_enum, rg);
> +
> +	if (stream_id == DP_STREAM_1)
> +		reg_off = REG_DP_DP1_RG - REG_DP_DP0_RG;
> +
> +	msm_dp_write_link(ctrl, stream_id, stream_id > 1 ?
> +			     REG_DP_MSTLINK_DP_RG : REG_DP_DP0_RG + reg_off, rg);
> +}
> +
>  /*
>   * NOTE: resetting DP controller will also clear any pending HPD related interrupts
>   */
> @@ -2615,6 +2690,103 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>  			  nvid);
>  }
>  
> +/* TODO: comments here. */

Well, TODO, please.

> +static void msm_dp_ctrl_mst_calculate_rg(struct msm_dp_ctrl_private *ctrl,
> +					 struct msm_dp_panel *panel,
> +					 u32 *p_x_int, u32 *p_y_frac_enum)
> +{
> +	u64 min_slot_cnt, max_slot_cnt;
> +	u64 raw_target_sc, target_sc_fixp;
> +	u64 ts_denom, ts_enum, ts_int;
> +	u64 pclk = panel->msm_dp_mode.drm_mode.clock;
> +	u64 lclk = 0;
> +	u64 lanes = ctrl->link->link_params.num_lanes;
> +	u64 bpp = panel->msm_dp_mode.bpp;
> +	u64 pbn = panel->pbn;
> +	u64 numerator, denominator, temp, temp1, temp2;
> +	u32 x_int = 0, y_frac_enum = 0;
> +	u64 target_strm_sym, ts_int_fixp, ts_frac_fixp, y_frac_enum_fixp;
> +
> +	lclk = ctrl->link->link_params.rate;
> +
> +	/* min_slot_cnt */
> +	numerator = pclk * bpp * 64 * 1000;
> +	denominator = lclk * lanes * 8 * 1000;
> +	min_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
> +
> +	/* max_slot_cnt */
> +	numerator = pbn * 54 * 1000;
> +	denominator = lclk * lanes;
> +	max_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
> +
> +	/* raw_target_sc */
> +	numerator = max_slot_cnt + min_slot_cnt;
> +	denominator = drm_fixp_from_fraction(2, 1);
> +	raw_target_sc = drm_fixp_div(numerator, denominator);
> +
> +	/* target_sc */
> +	temp = drm_fixp_from_fraction(256 * lanes, 1);
> +	numerator = drm_fixp_mul(raw_target_sc, temp);
> +	denominator = drm_fixp_from_fraction(256 * lanes, 1);
> +	target_sc_fixp = drm_fixp_div(numerator, denominator);
> +
> +	ts_enum = 256 * lanes;
> +	ts_denom = drm_fixp_from_fraction(256 * lanes, 1);
> +	ts_int = drm_fixp2int(target_sc_fixp);
> +
> +	temp = drm_fixp2int_ceil(raw_target_sc);
> +	if (temp != ts_int) {
> +		temp = drm_fixp_from_fraction(ts_int, 1);
> +		temp1 = raw_target_sc - temp;
> +		temp2 = drm_fixp_mul(temp1, ts_denom);
> +		ts_enum = drm_fixp2int(temp2);
> +	}
> +
> +	/* target_strm_sym */
> +	ts_int_fixp = drm_fixp_from_fraction(ts_int, 1);
> +	ts_frac_fixp = drm_fixp_from_fraction(ts_enum, drm_fixp2int(ts_denom));
> +	temp = ts_int_fixp + ts_frac_fixp;
> +	temp1 = drm_fixp_from_fraction(lanes, 1);
> +	target_strm_sym = drm_fixp_mul(temp, temp1);
> +
> +	/* x_int */
> +	x_int = drm_fixp2int(target_strm_sym);
> +
> +	/* y_enum_frac */
> +	temp = drm_fixp_from_fraction(x_int, 1);
> +	temp1 = target_strm_sym - temp;
> +	temp2 = drm_fixp_from_fraction(256, 1);
> +	y_frac_enum_fixp = drm_fixp_mul(temp1, temp2);
> +
> +	temp1 = drm_fixp2int(y_frac_enum_fixp);
> +	temp2 = drm_fixp2int_ceil(y_frac_enum_fixp);
> +
> +	y_frac_enum = (u32)((temp1 == temp2) ? temp1 : temp1 + 1);
> +
> +	*p_x_int = x_int;
> +	*p_y_frac_enum = y_frac_enum;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "MST lane_cnt:%llu, rate:%llu x_int:%d, y_frac:%d\n",
> +		   lanes, lclk, x_int, y_frac_enum);
> +}
> +
> +static void msm_dp_ctrl_mst_stream_setup(struct msm_dp_ctrl_private *ctrl,
> +					 struct msm_dp_panel *panel)
> +{
> +	u32 x_int, y_frac_enum;
> +
> +	if (!ctrl->mst_active)
> +		return;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "MST stream channel allocation\n");
> +
> +	msm_dp_ctrl_mst_stream_channel_slot_setup(&ctrl->msm_dp_ctrl);
> +
> +	msm_dp_ctrl_mst_calculate_rg(ctrl, panel, &x_int, &y_frac_enum);
> +
> +	msm_dp_ctrl_update_rg(ctrl, panel->stream_id, x_int, y_frac_enum);
> +}
> +
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
>  {
>  	int ret = 0;
> @@ -2701,6 +2873,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  	if (!ctrl->mst_active)
>  		msm_dp_ctrl_setup_tr_unit(ctrl);
>  
> +	msm_dp_ctrl_mst_stream_setup(ctrl, msm_dp_panel);
> +
>  	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  
>  	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl);
> @@ -2757,6 +2931,39 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
>  			phy, phy->init_count, phy->power_count);
>  }
>  
> +void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
> +				      enum msm_dp_stream_id stream_id,
> +				      u32 start_slot, u32 tot_slots)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +
> +	if (!msm_dp_ctrl || stream_id >= DP_STREAM_MAX) {
> +		DRM_ERROR("invalid input\n");
> +		return;
> +	}
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	ctrl->mst_ch_info[stream_id].start_slot = start_slot;
> +	ctrl->mst_ch_info[stream_id].tot_slots = tot_slots;
> +}
> +
> +void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +	int i;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	if (!ctrl->mst_active)
> +		return;
> +
> +	for (i = DP_STREAM_0; i < ctrl->num_pixel_clks; i++) {
> +		msm_dp_ctrl_mst_channel_alloc(ctrl, i, ctrl->mst_ch_info[i].start_slot,
> +					      ctrl->mst_ch_info[i].tot_slots);
> +	}
> +}
> +
>  irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index f82fd96e412a..c59338199399 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -17,7 +17,8 @@ struct msm_dp_ctrl {
>  struct phy;
>  
>  int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl,
> +			  struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
> @@ -52,4 +53,8 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
>  int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
> +				      enum msm_dp_stream_id stream_id,
> +				      u32 start_slot, u32 tot_slots);
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 80bb5fc4003f..e0bf4dffa6af 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -763,11 +763,13 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>  	return 0;
>  }
>  
> -int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display,
> -				   struct msm_dp_panel *panel, enum msm_dp_stream_id stream_id)
> +int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
> +				   enum msm_dp_stream_id stream_id, u32 start_slot,
> +				   u32 num_slots, u32 pbn)
>  {
>  	int rc = 0;
>  	struct msm_dp_display_private *dp;
> +	const int max_slots = 64;
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> @@ -776,7 +778,16 @@ int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display,
>  		return -EINVAL;
>  	}
>  
> +	if (start_slot + num_slots > max_slots) {
> +		DRM_ERROR("invalid channel info received. start:%d, slots:%d\n",
> +			  start_slot, num_slots);
> +		return -EINVAL;
> +	}
> +
> +	msm_dp_ctrl_set_mst_channel_info(dp->ctrl, stream_id, start_slot, num_slots);
> +
>  	panel->stream_id = stream_id;
> +	panel->pbn = pbn;
>  	msm_dp_panel_set_pixel_base(panel, dp->pixel_base[stream_id]);
>  
>  	return rc;
> @@ -1525,7 +1536,7 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0);
> +	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0, 0);

Hmm.

>  
>  	rc = msm_dp_display_enable(dp);
>  	if (rc)
> @@ -1540,14 +1551,15 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
>  	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
>  }
>  
> -void msm_dp_display_atomic_disable(struct msm_dp *dp)
> +void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
>  {
> -	struct msm_dp_display_private *msm_dp_display;
> +	struct msm_dp_display_private *dp;
>  
> -	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
> -	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
> +	msm_dp_ctrl_push_idle(dp->ctrl);
> +	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl);
> +	msm_dp_ctrl_mst_send_act(dp->ctrl);
>  }
>  
>  static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index fdbe6e4871d9..0ccdddb223c8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -43,7 +43,8 @@ void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
>  enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
>  					       const struct drm_display_info *info,
>  					       const struct drm_display_mode *mode);
> -int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display,
> -				   struct msm_dp_panel *panel, enum msm_dp_stream_id stream_id);
> +int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
> +				   enum msm_dp_stream_id stream_id,
> +				   u32 start_slot, u32 num_slots, u32 pbn);
>  
>  #endif /* _DP_DISPLAY_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 4873c55bd693..8e7374de90eb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -50,6 +50,7 @@ struct msm_dp_panel {
>  	u32 hw_revision;
>  
>  	enum msm_dp_stream_id stream_id;
> +	u32 pbn;
>  
>  	u32 max_bw_code;
>  };
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 87eaaefa014d..835a55446868 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -338,7 +338,13 @@
>  #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
>  
>  /* DP MST registers */
> +
> +#define REG_DP_MSTLINK_DP_RG			(0X0000011C)
>  #define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
> +#define REG_DP_DP0_TIMESLOT_1_32		(0x00000404)
> +#define REG_DP_DP0_TIMESLOT_33_63		(0x00000408)
> +#define REG_DP_DP1_TIMESLOT_1_32		(0x0000040C)
> +#define REG_DP_DP1_TIMESLOT_33_63		(0x00000410)
>  #define REG_DP1_SOFTWARE_MVID			(0x00000414)
>  #define REG_DP1_SOFTWARE_NVID			(0x00000418)
>  #define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
> @@ -347,8 +353,12 @@
>  #define MMSS_DP1_SDP_CFG			(0x000004E0)
>  #define MMSS_DP1_SDP_CFG2			(0x000004E4)
>  #define MMSS_DP1_SDP_CFG3			(0x000004E8)
> +#define REG_DP_DP0_RG				(0x000004F8)
> +#define REG_DP_DP1_RG				(0x000004FC)
>  
>  #define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
> +#define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
> +#define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003C)
>  #define REG_MSTLINK_SOFTWARE_MVID		(0x00000040)
>  #define REG_MSTLINK_SOFTWARE_NVID		(0x00000044)
>  #define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

