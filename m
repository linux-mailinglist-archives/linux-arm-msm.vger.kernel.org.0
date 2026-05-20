Return-Path: <linux-arm-msm+bounces-108893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /ayZFqwxDmou8AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 00:11:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEA259BCE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 00:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A767307835E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 22:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8993B6C13;
	Wed, 20 May 2026 22:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WomUS9xZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE24393DDC
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 22:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779315075; cv=none; b=pS3DjEDYYy9brMFINtgKN3Gm8mIxxqHkYteQMCPj3uRNWJ1CtDHNzqLgOQixFc0uPuR299NGxU0WwtpDobAJa7wFSwuNdvCypauVFpFABv0etL1//H5p1DHbSqZ5sdqKiGQSfMHO7adbepAnyDypA1lBMXd4lCvopEDfAVLWmQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779315075; c=relaxed/simple;
	bh=37M9PUOfQy2p5QSRWIOQGsVGmX9OOYtVM7BVMxAeCXI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cEGrFUJoIIe/LA08EmxpJ9dESZPbSqVKpHwCOCVeGeyP6c2H4LKvA4sWbBmFj6w+R1SQcPJiICPaK7mXQDe4apO/3ZfDwE6Ix8E0zt5YUrAVtua4N1o9gCowxcHShN6/8sqpuVDRNbiECV+FthHQzSaLkjs1EXRMJ947KOxg0M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WomUS9xZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ad135063so43858885e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779315071; x=1779919871; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XztvXw0EM5mypFKKLP+bYDI+RT7mLsUytHlSi+Ua1b0=;
        b=WomUS9xZcBabBoucqci2fo+RdWAZF7GBLCOzGByDrdGtnYgNI3Z2QEO4AyVX316eku
         1MYsmIGNyKe7rfbax36szSYq260l0FNRzD88vXhqapUEaaaZV0EVJTVo5+dc9uv5vEBu
         jo2/Q7tYJMRTHbNPgUh+DVbVTo8FFJxdXIryMnONLeiZnlUUmOJXAUMLcekblogx3wJQ
         92F/O0QC9Wvp35EXyFThjSzc9p/6fvoRwjcuZ80kNrtWjT1Xtn+Lu2JXKhogpTVQ8feG
         EmncWb238VB5RDVJyWjKxup4l3d7gqoslY+NPJ9vRGUiWMSQYaPfiR632zXA48MTmUzg
         ij0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779315071; x=1779919871;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XztvXw0EM5mypFKKLP+bYDI+RT7mLsUytHlSi+Ua1b0=;
        b=D9mIL88QV2RD8IqtcfbdCB2bL0QaAK7GLakwYkb3KBEyBlBMh2rFPaVGHs1e7D4eJD
         P21J002gfwYKchYpBohOlbQyuYfvbseo9TSn0xNWzasG+M6keychkgkuqk80UsCAue8R
         3k+4+LC4+FxNtLRF8pAr8qnr0Vulbrj/tJyZoeRz8t7EPBCJE1M3eF0HfnQEHrSNPfPq
         sD46HV/2tHuJ0/hSWrd05EngYPh64a0zSzxY1RKoWZuanqpGHNRd9giXnQ1CbWa7FHqn
         cKcqZkMyizZsA5wbODrU0nGb19eMc3mxRShFVPrOt5vhKrtD5yNMiVfyrNRG1k63aJpB
         njwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n8o89n6YX09hkJ+vjCqLu7xwua8Gn42I0ExFP9VNn3TQBgh0/f+cUO3q54VtFZpmT+kZlX9wZnxCXkvAB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0vERCAg91M4mGcpZUrLYHVP8O7q2WNQwPln5FhrPx9TrylEZp
	7m9w74jxf5tnfTHdD2fW5qgrEkL7DFVcRJcnMJVyrPHHEb9aetr0rYIiGYbVzHOU1gE=
X-Gm-Gg: Acq92OE4pVra+ynRa81KVRwAdT8wSrVJhWXR/KCzb1Bs7ntZ6DIY0D4rpEqxduyM59b
	mLzlEr/RNttfwmovjeKD8pmNcMnsb6516MuVqCtWDS9WAGHk1R2mQd6KI4hRwWJb+1rhJ16EaxD
	1yJy3pN5R73qzuIZsWs446BVpoZfFUrmFcoJDo4amZ9mKAvcNK/sk91a9Xom4c3oQoVh/ObrGq2
	PLMV66gPCRXRZxal6ktlvOUS1ngfJk8kFPGHrLIZgUpxzn8UmnclL23oaX/vCAXFxkBJqS8rWhk
	1h0JgwoD74lvqG8Kl285H3cWACoYtF8Mj7hmmgFCe7BZv+NA6qFjaqPC4yhWuTwGugMx8hHEk9S
	5wvg5joSizAy0jVSFQhFQif/khvaXl1a9/F9jDa60IqMy6r7UBjTdNQ1sLoP3ijir51+RUYWzAS
	RTXQIHknzzDYAWXXZ6gPFYBcV3qOtMEznvBN85f1WiQgAipEfVj6SzofjkxEZsSkQQNQHb24poJ
	nGnk66PR4j/RQ==
X-Received: by 2002:a05:600c:42d1:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-49036089466mr1297995e9.21.1779315071295;
        Wed, 20 May 2026 15:11:11 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033cdcc01sm23507635e9.0.2026.05.20.15.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 15:11:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 23:11:09 +0100
Message-Id: <DINUJUCEDNXP.2BDISX62IPSQ2@linaro.org>
Cc: <srini@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <krzysztof.kozlowski@oss.qualcomm.com>,
 <mohammad.rafi.shaik@oss.qualcomm.com>, <alexey.klimov@linaro.org>,
 <ravi.hothi@oss.qualcomm.com>, <mathieu.poirier@linaro.org>,
 <verhaegen@google.com>, <andersson@kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/6] ASoC: qcom: q6apm: add watermark event support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260519131527.4002526-6-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260519131527.4002526-6-srinivas.kandagatla@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108893-lists,linux-arm-msm=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,google.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexey.klimov@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 0DEA259BCE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue May 19, 2026 at 2:15 PM BST, Srinivas Kandagatla wrote:
> Push-pull shared memory modules can report watermark events when the DSP
> read/write index reaches configured circular buffer levels.
>
> Add support for registering watermark levels with the shared memory modul=
e
> and route the resulting module event to q6apm clients using a new
> APM_CLIENT_EVENT_WATERMARK_EVENT event.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 36 ++++++++++++++++++++++
>  sound/soc/qcom/qdsp6/audioreach.h | 50 +++++++++++++++++++++++++++++++
>  sound/soc/qcom/qdsp6/q6apm.c      | 19 ++++++++++++
>  sound/soc/qcom/qdsp6/q6apm.h      |  2 ++
>  4 files changed, 107 insertions(+)
>
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/aud=
ioreach.c
> index c984b12409dd..e6e9eb2e85aa 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -1118,6 +1118,42 @@ static int audioreach_pcm_set_media_format(struct =
q6apm_graph *graph,
>  	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>  }
> =20
> +int audioreach_shmem_register_event(struct q6apm_graph *graph, int bytes=
, int num_levels)
> +{
> +	struct apm_module_register_events *event;
> +	struct event_cfg_sh_mem_pull_push_mode_watermark_t *level;
> +	int i, payload_size;
> +	struct gpr_pkt *pkt __free(kfree) =3D NULL;
> +	void *p;
> +
> +	if (num_levels <=3D 0 || bytes <=3D 0)
> +		return -EINVAL;
> +
> +	payload_size =3D sizeof(*event) + sizeof(*level) + num_levels * sizeof(=
uint32_t);
> +
> +	pkt =3D audioreach_alloc_cmd_pkt(payload_size, APM_CMD_REGISTER_MODULE_=
EVENTS, 0,
> +				     graph->port->id, graph->shm_iid);
> +	if (IS_ERR(pkt))
> +		return PTR_ERR(pkt);
> +
> +	p =3D (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
> +
> +	event =3D p;
> +	event->module_instance_id =3D graph->shm_iid;
> +	event->event_id =3D EVENT_ID_SH_MEM_PULL_PUSH_MODE_WATERMARK;
> +	event->is_register =3D 1;
> +	event->event_config_payload_size =3D sizeof(*level) + num_levels * size=
of(uint32_t);
> +	p +=3D sizeof(*event);
> +	level =3D p;
> +	level->num_water_mark_levels =3D num_levels;
> +
> +	for (i =3D 0; i < num_levels; i++)
> +		level->level[i] =3D (i + 1) * bytes;

Let's hope that compilers optimize this to avoid multiplication, anyway
it shouln't be a hot path, although I don't really know.

- don't you need a check like num_levels<=3DARRAY_SIZE(level->level) before
this loop? Looking at the code it seems that it relies on pkt which is
allocated using audioreach_alloc_cmd_pkt() taking payload_size into
account. Looks okay but I wanted to double check.

- level->level[] is of u32 types. Can level->level[i] =3D (i + 1) * bytes
overflow?

[..]
> +struct event_cfg_sh_mem_pull_push_mode_watermark_t {
> +	uint32_t num_water_mark_levels;
> +	uint32_t level[];
> +} __packed;
[..]

Best regards,
Alexey

