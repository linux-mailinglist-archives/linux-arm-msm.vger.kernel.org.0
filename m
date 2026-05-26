Return-Path: <linux-arm-msm+bounces-109798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP1VMTWGFWpXWQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:38:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C5D5D4FD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F3BD3057E03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D297D3E0C66;
	Tue, 26 May 2026 11:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DdKpm/Ue";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hfiE5spx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863B93DFC84
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795295; cv=none; b=Es8TK+HMtk10RpKNKLC6j+M3XmCrnJqhtE1wmDLW0pzj4IaN84Zq96xKFvOWjHb1KBQYErEN1IjJ2FVPBZL7h6UrnKSa6gp8lNeTK1xS7nuNM+Ni8Cs6ObzmbwIzVG/CJj5UvtWdcLKyDrc3SW7lQ8NXlrF/kCeocLuTMtzdo/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795295; c=relaxed/simple;
	bh=ocxFYI38hxzb1ERZvNMOfcjBpfFa+PxSGRxdLDGrzLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iegLnLga0OtqECXzxjJidnUVWOV9YzoG372FPlwbm1wYD+YpwMwnVQ7xblc1NzfIjCPXg3vEJVC88v4E+1tFYcXRFp+cesWQkk+Xdg24DKjl4K4CK2im5vzsnlyPgriR0wK6MDb8Tv0en3OeixhJc97ce6OoaQ+zreD9CJpZlrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DdKpm/Ue; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hfiE5spx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779795292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VD+dmiG81dGo1mjueRmNr772xEYjIurIakGJoB8fU4s=;
	b=DdKpm/UezA3KpMPxgHlp1Sn9g6Plmp6vyALmeK7Ri6QRFhbU6voF0bN43I6wZnMVl7Ao7l
	ZpWSCSzFCljR+2N6Y82uwT3cy92SxTEqAS3yrwGihdb10KjsdLlM4TOMJxraQSYviRiAX7
	1ENHpaEmYJD2guIP3GbZo1J4JdEbI0s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-e-5dqH_DPfyyZmh2wNYlSA-1; Tue, 26 May 2026 07:34:50 -0400
X-MC-Unique: e-5dqH_DPfyyZmh2wNYlSA-1
X-Mimecast-MFC-AGG-ID: e-5dqH_DPfyyZmh2wNYlSA_1779795290
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-449dcfe8005so8264920f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779795289; x=1780400089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VD+dmiG81dGo1mjueRmNr772xEYjIurIakGJoB8fU4s=;
        b=hfiE5spxqeYdkg5VjqiRzAdEOmaal3cMZxcwaGdFLiJO9LZ0tFWSvuwEKG8fAi/Acd
         uLLF29L6irGvrhUSPvpbWfM2v1t2moxU4DkA07TAiZqh1DTa0Ud4VuDlY1bEoc4rVBry
         5mWqajx+YLcORBTxxnddteBCwgKwE1X+K6YahYn2Q5i0cPckb2ZuuatUfvEMVp7he3SD
         mbows/h2tdQiQ2jEqq1GJN85C73/Wip+qWWfrd81eOZJMyex3ZApisyzqzXuKT5aFk/3
         btEhOC9RF2sEQPcI5s2JOduYxlOeC5TMZyyEW/L0mdVs13mIahZb0tUqjkE4nQFvopx+
         5bNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795289; x=1780400089;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VD+dmiG81dGo1mjueRmNr772xEYjIurIakGJoB8fU4s=;
        b=U2gjafceyNYq5SXgtY6cqn1rlqyAylmbOCRPZyet/NGlZHgeM8OzztG+O9frlwOcQN
         FNh7px3qyxSWmO0ftmQKM12hgFE+TiE7xeNAxsXQdTtEYuS5ELyEBUGjd71nQbrNFXKb
         eTbZiPP7sHzKPLXDdUaA7s1Tu5KOM97vg8F+rQjRCzgTvPUYkfqdxeOHpXN6HPaCbwC4
         Agg8hoqTm4A606o1OEIWb0JOPcpHsnfE5usjkrBDhD6jMrTdefIgZDDVRSiSCq5pRoGE
         dg4zlRdaZEAJX1YrlyLTE4gbwGsRvphztSP6uTt2gcJUWNp/jf6UVScaUO4UI7jbrlhb
         WWvA==
X-Forwarded-Encrypted: i=1; AFNElJ9r/st4raUZ9Im/GAK9kQ8SYG0vRqHigW2zZ3+tLxTaJwNdqEQY41wENEUwRtJvdcSvmfbXhJN7/NjUahWV@vger.kernel.org
X-Gm-Message-State: AOJu0YwBps6CvfaX9qu7Qc7ODwEehtn1eOGbjJwHmVoMW4G4CiYpxq2b
	1LV6F5m507hf2OGBJRQl+9XZyhwJfGUn+/jKJkrZ8WZsNSDXcqXK1+ZboMmWJ8+NKoAO1npXXld
	SSnUcUDlKzE67HzKnx3O5ZhZX86iioARFDl3xylyAb42FbX0PeM/PU0Yz4851Wu94nb0=
X-Gm-Gg: Acq92OFqudK8brDdWYU4hWAkOmHOKfOQwAEqqPigmTqNvmgXR6BknXUDEYMEcAaky0O
	oi0VcpZx0GOITI0roJL7QwzFUDA4qgIsY0DY3hDqshfHxCA9L8tUHYRgNpY2YxaZiDRTNWAaL81
	qCjyaoN9WJWDMCK513h6Sa2tz6rcKvQ6WUDUyqESuh1ajQ4GD4JeJfpYdipAu1iL2MtTacuEkK6
	wGJgurDROWBSzOqvKvsZHJONUAWsf7bujzGwEC7PbYx5ezLdn3coYT0lYdOVcmO78GDRHyLbedM
	RxJPcWpqde2Em9lJ2La8QSNoGlTc3hFxCNlxJhVWb4JGIH814rycL79Xo/SNL9iypUs6POgKV+a
	zC+DIBRCREL+F/RezIZ5N40OccNlH7pyAiECNMPKkCuoKPEvDoJ/g7LBkhw==
X-Received: by 2002:a05:600c:4ecc:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-490424b3c7fmr275107525e9.11.1779795289591;
        Tue, 26 May 2026 04:34:49 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecc:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-490424b3c7fmr275106815e9.11.1779795289064;
        Tue, 26 May 2026 04:34:49 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526c926sm565711385e9.1.2026.05.26.04.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:34:48 -0700 (PDT)
Message-ID: <5a54d307-0b8c-468d-9183-6433f9daba56@redhat.com>
Date: Tue, 26 May 2026 13:34:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] net: mhi_net: Hold runtime PM during active data
 path operations
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 netdev@vger.kernel.org, mayank.rana@oss.qualcomm.com,
 quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
 <20260522-mhi_runtimepm-v2-3-fbebf41a82bb@oss.qualcomm.com>
 <CAFEp6-1sdQn11NKom6cfwtJvZX-CnPRpJeVzQ+99Sb4A4L-qaQ@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <CAFEp6-1sdQn11NKom6cfwtJvZX-CnPRpJeVzQ+99Sb4A4L-qaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,lunn.ch,davemloft.net,google.com,gmail.com,sipsolutions.net,lists.linux.dev,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-109798-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 68C5D5D4FD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 10:09 PM, Loic Poulain wrote:
> On Fri, May 22, 2026 at 12:01 PM Krishna Chaitanya Chundru
> <krishna.chundru@oss.qualcomm.com> wrote:
>>
>> The mhi_net driver does not coordinate with runtime PM, which allows the
>> underlying MHI controller to be runtime-suspended while transmit, receive,
>> or RX buffer refill operations are in progress. This can lead to stalled
>> transfers or failed queueing once runtime PM is enabled in the MHI core.
>>
>> Add runtime PM reference counting to the mhi_net data path to keep the
>> controller active for the duration of TX, RX, and buffer management
>> operations. Enable runtime PM during probe and take/release references
>> explicitly around these critical paths.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/net/mhi_net.c | 39 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
>> index ae169929a9d8..5d7f9ccdb17b 100644
>> --- a/drivers/net/mhi_net.c
>> +++ b/drivers/net/mhi_net.c
>> @@ -9,6 +9,7 @@
>>  #include <linux/mod_devicetable.h>
>>  #include <linux/module.h>
>>  #include <linux/netdevice.h>
>> +#include <linux/pm_runtime.h>
>>  #include <linux/skbuff.h>
>>  #include <linux/u64_stats_sync.h>
>>
>> @@ -76,11 +77,19 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>>         struct mhi_device *mdev = mhi_netdev->mdev;
>>         int err;
>>
>> +       err = pm_runtime_get(&mdev->dev);
>> +       if (err < 0 && err != -EINPROGRESS) {
>> +               dev_err(&mdev->dev, "pm_runtime_get failed %d\n", err);
>> +               pm_runtime_put_noidle(&mdev->dev);
>> +               goto exit_drop;
>> +       }
>> +
> 
> I am wondering what the value is in pushing this PM responsibility to
> each individual MHI client driver and requiring every MHI operation to
> be bracketed with runtime PM handling.
> 
> What does the client driver know here that the MHI core itself cannot
> handle centrally? It feels like ensuring the controller is
> runtime-active during transfer could be handled generically in the
> framework instead of duplicating the same logic in every client.

Indeed if *feel* like the MHI core should be able to put together all
the status needed to correctly track the PM.

Adding PM tracking to the NIC driver network data-path looks quite bad.

/P


