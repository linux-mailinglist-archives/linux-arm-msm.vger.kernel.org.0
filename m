Return-Path: <linux-arm-msm+bounces-90723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIp3N7yaeGk9rQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:00:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A879347B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCDAE3004D23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84918308F30;
	Tue, 27 Jan 2026 11:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="fBgcHO1V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591C530ACE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769511611; cv=none; b=TA43dVoR0s6yybJ4nHmzQXOivI3UoPeXDW30edsXd5Aao/fvvBfdv36jtYvDX0wzH4OGER84jdIRGAmIo0MOvyQNGeVcmzDq9ZojDpeUsGbI77KxbUs8bvxx64wLjWlhb1nwYVJc7I9fmVnRQND6t/+nLRDcZXi6U5wJgSz7eJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769511611; c=relaxed/simple;
	bh=D2kCyHPXntn8wdED0IAgyw6iFFBcex6Ww+f+RPNqHgY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GY3QPs3yokqi9H/0iLTaaXswIygKA30+tC04B4PJAlLM+Q9BkHKEPiqTiPuy5Cr7UtPOmga/98h2AMcALqt8vxkmzxfOwHnNdyOC50OcPgr5quB3v1kz5Szg7dSjlCcGLzWZVEHJcyfag+Ve15QLIjG+ihUaJ4hbM/hvzXAyTDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=fBgcHO1V; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <ff0c70f3-62aa-43f5-a437-62aae5b84e9c@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1769511597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lhlzQCmgNkMJSHlIA4zS8Ozat5WOiAUqTpQUdu6tdPg=;
	b=fBgcHO1V1BXCKJAg1hwxThPkBmXKxdbZOYWnPjpE0ilDfaAEz2l5Q6Cs/heMeMadL0apc+
	iPDIWcbIDaKX4tO7aGa88vFTYAd2uaJwxLAQAz3yiGw1NulmJt+sjanoLiHoi7cpC+s1nh
	wS0oZs0wUp8+7+NYfdebj+SC88RpzQc9rxDTJDQi9s/kV7TcxjsYPi5gjkHxlxzVWIuuaf
	q4tCRy6YWLmxljpeDeJiXlQJB96QGuxo9EfC8NFcZ72PkWY/4Q3oi6hPl/f2lQKUumV1i/
	BA9iC3gfLQF1M5cMrknXqcWQV8i40AtQpOtyiTj6nUoH6iVA5Je2Plj3FFbeHA==
Date: Tue, 27 Jan 2026 07:59:34 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
Subject: Re: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
 <33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool>
 <whko2yur7tgutr4qhlbqfrvpcdg7hkyw66koicqvpvfhk55c7z@saj2uxrduv4z>
Content-Language: en-US
In-Reply-To: <whko2yur7tgutr4qhlbqfrvpcdg7hkyw66koicqvpvfhk55c7z@saj2uxrduv4z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-90723-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,packett.cool:mid,packett.cool:dkim]
X-Rspamd-Queue-Id: 76A879347B
X-Rspamd-Action: no action


On 1/27/26 7:34 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 06:43:32AM -0300, Val Packett wrote:
>> this has massively broken things on my x1e device (latitude-7455):
>> [..]
>> Reverted only this commit and it's back to normal, so I'm pretty sure it's
>> this.
> Interesting. Could you please capture the dri-state (only the last part,
> resource mapping) with the external monitor attached and with this
> commit reverted?

Just reverted:

crtc[106]: crtc-0 [..]
         mode: "2560x1600": 60 280710 2560 2608 2640 2720 1600 1603 1609 
1720 0x48 0x9
         lm[0]=0
         ctl[0]=0
         dspp[0]=0
         lm[1]=1
         ctl[1]=0
         dspp[1]=1
crtc[107]: crtc-1 [..]
         mode: "3840x2560": 60 631750 3840 3888 3920 4000 2560 2563 2573 
2633 0x48 0x9
         lm[0]=2
         ctl[0]=1
         lm[1]=3
         ctl[1]=1
resource mapping: pingpong=106 106 107 107 # # - - # # - - - mixer=106 
106 107 107 # # - - ctl=106 107 # # # # - - dspp=# # # # - - - - dsc=# # 
# # - - - - cdm=# sspp=# # # # - - - - # # # # # # - - cwb=- - - -

> Also, could you please run another check:
>   - revert this commit
>   - comment out LM_2, LM_3 in the catalog
>   - try the resulting kernel with the external monitor

Commented out:

crtc[106]: crtc-0 [..]
         mode: "2560x1600": 60 280710 2560 2608 2640 2720 1600 1603 1609 
1720 0x48 0x9
         lm[0]=0
         ctl[0]=0
         dspp[0]=0
         lm[1]=1
         ctl[1]=0
         dspp[1]=1
crtc[107]: crtc-1 [..]
         mode: "3840x2560": 60 631750 3840 3888 3920 4000 2560 2563 2573 
2633 0x48 0x9
         lm[0]=4
         ctl[0]=1
         lm[1]=5
         ctl[1]=1
resource mapping:
         pingpong=106 106 # # 107 107 - - # # - - -
         mixer=106 106 - - 107 107 - -
         ctl=106 107 # # # # - -
         dspp=# # # # - - - -
         dsc=# # # # - - - -
         cdm=#
         sspp=# # # # - - - - # # # # # # - -
         cwb=- - - -

Not sure why the dspp= line in resource mapping doesn't show any numbers 
when a crtc has dspp[0]= and dspp[1]= o.0

But with LM 4+5, gamma control doesn't affect the external monitor.


~val


