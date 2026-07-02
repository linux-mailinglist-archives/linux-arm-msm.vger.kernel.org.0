Return-Path: <linux-arm-msm+bounces-115900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hRRpBP85RmrnMAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:14:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB0E6F5B53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:14:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lXVZj7d8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115900-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115900-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D69831EA548
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D3447DD46;
	Thu,  2 Jul 2026 09:47:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923B53ACF05
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:47:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985676; cv=none; b=UnEPGkKjk+apCgUYTsrxhlTCYLG0n8VCxK7gFcs+wUVAGoLQ+ramMSVEcy5NQnDWqlldCAQNvNloXtDtU7T++GZJn8hFVURQQJhcvTJ0Q/F7x9Bi9mhWCF8GeaKNvFjmbjVCXFQAz4tBOyoy6R+QA4T5kuBeKfeivGjjZyzz++4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985676; c=relaxed/simple;
	bh=9xkgADxig1nteEnnL37Uw/84IpqN6J6cohOB6iGfCpg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FmEH6x7SGyCzdgZhONRHmKaNnp6IXA8iBZtLATTKNKkz2OUVWb6WNU484v5Mi95pcIIpuOrWFYb5usmlL9xyF8VsPCEEZMNTDdmc5XtZnHFPapT8GB/zO5iuzMyRfSvR3Wk7CzWOm69+cqD74WkMs1gju2dxymoCsaIK0MfznW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXVZj7d8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8101F00A3E
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782985675;
	bh=6gRpk1GxZIu5GEbQCzZcSaAF5VibfGv5x9KgaFiEnmM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lXVZj7d81y6tyHovhYP2eN7T9DvwUfB2sNI9fXQm+TvfpElZsxy1jHdhDnpScoHrK
	 ugFODlKKyFa8GENsz4IImwFiSKNSzQN+2mFOGShNWu8Mlp5qXO2bovQS6urjjXipJP
	 jv299kDfeiFLoWfwgqaSYivTn0ocZ5JXCSXX4Th3MKZnfO15qybeoqcj0IkV3SMt3P
	 YioLrS0N0PtShhiWyvbw6UES7rnlKRO9UCTNtSp2EP+VZKgL3wNvQG6VbmKyyf4EJY
	 FK4ZocK2Tb04Kg/UPgnOo1Pw6+dQczvtryUBnCDKMsWblPLvd4ZWGXWDjP6PZxyrGx
	 /bIDNr1LfhR/Q==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39b011ae0b4so14097701fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:47:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RquMwMNncs5H3zH6jjMb7hcruV73RVuC1umLr+EysP1eJyK5qR12uyf12jxbmE6qIJIP8/RiwIZ1RVWUqk2@vger.kernel.org
X-Gm-Message-State: AOJu0YyKrJ/MN5W+TQqq457PigRw/bfNfuRChAzpd70+LrvXWIpbhLvS
	IMZ3XOBGeiQGHPWrhT/mMddaA0z+442eMl0y38MuagPBex3zZOiAYPQLyFl3lg3z30vxhIVUT6k
	faxF4/AVVXwuYXjjNZqXh6phE7fSY+AGw18zx/gTF5g==
X-Received: by 2002:ac2:51a3:0:b0:5ae:b5a9:6e86 with SMTP id
 2adb3069b0e04-5aec742dd66mr918873e87.52.1782985674249; Thu, 02 Jul 2026
 02:47:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Jul 2026 04:47:51 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Jul 2026 04:47:51 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260702081026.c7rzopcn7vypggjq@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
 <20260701-qcom-scm-code-shrink-v1-1-02f5ce02c95a@oss.qualcomm.com> <20260702081026.c7rzopcn7vypggjq@hu-mojha-hyd.qualcomm.com>
Date: Thu, 2 Jul 2026 04:47:51 -0500
X-Gmail-Original-Message-ID: <CAMRc=McyjCSZjDax_67vStkZsKKVhLD-=BRwL9XmSHnV38TU4g@mail.gmail.com>
X-Gm-Features: AVVi8CesZ6lSHee2QXhJ7oYJnl6phBOyjdzttOadPsHb5dYUacEGiuifi1e9fnQ
Message-ID: <CAMRc=McyjCSZjDax_67vStkZsKKVhLD-=BRwL9XmSHnV38TU4g@mail.gmail.com>
Subject: Re: [PATCH 1/4] firmware: qcom: tzmem: guard against IS_ERR() in the
 cleanup handler
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115900-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DB0E6F5B53

On Thu, 2 Jul 2026 10:10:26 +0200, Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> said:
> On Wed, Jul 01, 2026 at 03:38:55PM +0200, Bartosz Golaszewski wrote:
>> We currently only silently skip NULL-pointers in the cleanup handler for
>> tzmem. It's possible that we get passed a pointer holding an ERR_PTR()
>> value so skip it too.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> ---
>>  include/linux/firmware/qcom/qcom_tzmem.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
>> index 23173e0c3dddd154dd56dc3dcb56bd20ada0520a..b5520178bf6f53b86b530571a3be9f302225f022 100644
>> --- a/include/linux/firmware/qcom/qcom_tzmem.h
>> +++ b/include/linux/firmware/qcom/qcom_tzmem.h
>> @@ -58,7 +58,7 @@ devm_qcom_tzmem_pool_new(struct device *dev,
>>  void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp);
>>  void qcom_tzmem_free(void *ptr);
>>
>> -DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
>> +DEFINE_FREE(qcom_tzmem, void *, if (!IS_ERR_OR_NULL(_T)) qcom_tzmem_free(_T))
>
> Is this really required? Are we trying to address an issue which
> does not exist today?
>

It becomes needed in patch 2/4 where in qcom_scm_pas_get_rsc_table() the
pointer returned by _qcom_scm_pas_get_rsc_table() can contain ERR_PTR() so
this patch preempts a possible problem.

Bart

