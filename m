Return-Path: <linux-arm-msm+bounces-103462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7a//NPuu4WkdwwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 05:54:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4210E416B87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 05:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 031A33018424
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 03:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F20A344020;
	Fri, 17 Apr 2026 03:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcP7UIzP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F79A13C9C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 03:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776398072; cv=none; b=WVd+eOE15gusMfTe3mKHBAu8Mtr7VZRu2Xt1YtcvkKho9qPmmCIXRJiYldb4QI8z6bLltJBkyhvB8Qsstvgm1r9zY2LJZlX/TzOVGuQuQ3uhP7qWqkpsdrsqbuLO644VqaFWeyhBiwmm9Uau595mc17zdLr9sQm26vved2GuAH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776398072; c=relaxed/simple;
	bh=rRlIET16o4l0EUCKUlrOSd0jb3qH4PRvPkGH7HWoFv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aapZEHuKsxSeEjPAaZOe0zcZWpl5NYHK8t8UV/SlCncrDNV01BRCQEUuAcwiXgSzu2CIlHZUsZxuqdoO8ICJdiDy7AA3V/KU6tieh0qWy1BCrhr2kW2/NN+0vUfDjkFsEGTnQywfSZB009tJiCfb2tRk0yO45D7ANgjLw4srgNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcP7UIzP; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c9f6b78ca4so31841085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 20:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776398070; x=1777002870; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H5nrjef/FNz3f6JHFm8YF5SJcuEuUksqxelV8c7Plq0=;
        b=QcP7UIzP5AZiqluOH2uGfieSI7PZqRK5AoMcx8Np7P9x1TSNUMt0ek4M8K+wIWpxqf
         Mj+e2NWU2QPDTJQsg+3En88u+diXpArO7wXc7ZHqLXdwCrJhwW9BhJ0N7cU/L4AvNaNN
         pN4aJjdvXk2PbsiBrHnMMYpfcycpRFLKaYOxziAgl8n9MlojzbrnKMdK8l+6ab457YPI
         Z0rzS+AT5EmjiPCQlefD85tRjczjalEdMoRxjMhH3iglGZHbJKDvjRozw5QKmcKC1Jsy
         s8BPNpZEVC1QnTF5P+JpPZsRy9xaNi3mWRqI6ZdJ0MKW8dBi1psAPxtdcLIqXvGps2Q6
         WgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776398070; x=1777002870;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5nrjef/FNz3f6JHFm8YF5SJcuEuUksqxelV8c7Plq0=;
        b=DojZRiemtVVr+G1ChSQp0pT1Ajsikt6W0xCJV9xgpoAyBlj17QD2ed/VMj/vwpNUxt
         WSFkZl2dIYpRDLJaoXxgGOOo44ucCS6Rj1oVpJIMg2ugtpQSTF4us9ezMs9gAIFkInKT
         r6MPMA1O1FgoIacSmLUaSlIXDkBl9al+sI2P/eTK9r7KOZL4KzN3HtwsGooLzNWDnAq0
         QZyWZgkfwBKTfQ3h4NCDQ9OFDHOpmWFMkbr/bvqK2sk4NgP9QOuXBMfIen6GUGKuFb2p
         LPSk8LOXWuoX6WDyWOv8DtPiQtVfe2FV2g2p0D8wujCuQNTnJFC1n8S4IsNTwwLDbTe7
         1KFg==
X-Forwarded-Encrypted: i=1; AFNElJ+lAIV77Z7gPZkKAp00k9BOzBctaAZAn4vpVuyYlb82eSwUaZlW3QOd2UQgM1fEON4Z5+wVeE8suRZq2lJr@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ2W6+cYEDsfIYsWvaMqaQxoT8HjLezNpXfLHu5Xk2on6OzGM7
	N0L6wxKnoceOGFQXdRiWGHNKgxGCZ5qMKvpZeK+7utzJyIPygOTkQ3mZ
X-Gm-Gg: AeBDievo9EAZPPO+bG3JptXkS6B2ukN4rYA9G1FBeJwu1ZSpzTYBrIlEki84WebzBvz
	JjxrqvhLpZxfYWyW/5jfqRMSyB0R8mAKksA+QlXoUISU6Oy38lQkVpXzc3JY6GpkLdIXDtGwSYo
	OXavAUdpKAMdTvjdyE8Q+dUjfItPkMYefw1gyELjmfSz22PywoS6s+oMVxhwVPGH0v6XLQlyHO/
	zKt0keL/8sa6g2kzRH1V/ykT4H9U8cypILFluNE9IariVp5iXX5MQLbDK78YTHioG44OnRQ6Cmk
	FHLln1KnQJK6WYEjUw72mEHtiW5GJ/mHUh9SmepXl4zScYB7O4QwZ+KJgGhzoH8HgZbLp9zdgue
	2ViXj0DKi7KgUKgw2pA1d1lBTjYK4WFE2Q4VTN1pOPC/8Rso+MY0SXevdj7z/Vj8Az17Whv74Ls
	Ji4ZEkSyjwLNRVRZ4uFfN2IA0I1RtB4O7gkOccHxcvn6MsdWHD
X-Received: by 2002:a05:620a:7083:b0:8c9:fb69:e708 with SMTP id af79cd13be357-8e78fd216d0mr145680285a.25.1776398069972;
        Thu, 16 Apr 2026 20:54:29 -0700 (PDT)
Received: from [192.168.2.25] ([184.146.175.99])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d64cbbdbsm22553685a.12.2026.04.16.20.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 20:54:29 -0700 (PDT)
Message-ID: <4fd08215-c9f4-493f-ac49-141e9a486b02@gmail.com>
Date: Thu, 16 Apr 2026 23:54:17 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:136.0) Gecko/20100101
 Thunderbird/136.0
Subject: Re: [PATCH v8 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 andersson@kernel.org
References: <20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com>
 <20260415112530.4083240-5-ekansh.gupta@oss.qualcomm.com>
 <8dc8c094-63ab-4f9c-867a-96b615dff2cf@gmail.com>
 <90c2f6d5-21cd-4ba1-86e4-458100c8f830@oss.qualcomm.com>
Content-Language: en-CA, en-US
From: Luben Tuikov <ltuikov89@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <90c2f6d5-21cd-4ba1-86e4-458100c8f830@oss.qualcomm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------u6hXa02bmrzTrAKCf5rbNvPB"
X-Spamd-Result: default: False [-4.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103462-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	HAS_ATTACHMENT(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltuikov89@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4210E416B87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------u6hXa02bmrzTrAKCf5rbNvPB
Content-Type: multipart/mixed; boundary="------------q7nzm1aCz6wjRQL5UEw8NoVY";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 andersson@kernel.org
Message-ID: <4fd08215-c9f4-493f-ac49-141e9a486b02@gmail.com>
Subject: Re: [PATCH v8 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
References: <20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com>
 <20260415112530.4083240-5-ekansh.gupta@oss.qualcomm.com>
 <8dc8c094-63ab-4f9c-867a-96b615dff2cf@gmail.com>
 <90c2f6d5-21cd-4ba1-86e4-458100c8f830@oss.qualcomm.com>
In-Reply-To: <90c2f6d5-21cd-4ba1-86e4-458100c8f830@oss.qualcomm.com>

--------------q7nzm1aCz6wjRQL5UEw8NoVY
Content-Type: multipart/mixed; boundary="------------0hdEhfg1Mjy6CiCPDwuTIK8u"

--------------0hdEhfg1Mjy6CiCPDwuTIK8u
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2026-04-16 09:58, Ekansh Gupta wrote:
> On 16-04-2026 13:47, Luben Tuikov wrote:
>> Hi Ekansh,
>>
>> Good work. A couple of notes below:
--cut--->>> +static inline int fastrpc_wait_for_response(struct fastrpc_i=
nvoke_ctx *ctx,
>>> +					    u32 kernel)
>>
>> What is "kernel" and why is it a u32 when it is used as a "bool"? Perh=
aps a better name can be had?
> This reflects kernel message. As of now, just propagated the same that
> is used across the driver, maybe can address this as a separate patch.

I can see that its origin is internal to the driver, as a boolean. Perhap=
s "kernel_message" or "kmessage" or something descriptive like that. I th=
ink it's more important that it is a "message", rather than "kernel messa=
ge".

Yes, a separate patch indeed makes sense for this.

--cut--->>> +static int fastrpc_wait_for_completion(struct fastrpc_invoke=
_ctx *ctx,
>>> +				       u32 kernel)
>>> +{
>>> +	int err;
>>> +
>>> +	do {
>>> +		if (ctx->is_polled) {
>>> +			err =3D poll_for_remote_response(ctx);
>>> +			/* If polling timed out, move to normal response mode */
>>> +			if (err)
>>> +				ctx->is_polled =3D false;
>>> +		} else {
>>> +			err =3D fastrpc_wait_for_response(ctx, kernel);
>>> +			if (err)
>>> +				return err;
>>> +		}
>>> +	} while (!ctx->is_work_done);
>>
>> Perhaps you want to also check "err" here to make the exit condition m=
ore explicit. (The invariant in do-while loops is generally directly dete=
rmined by something within the loop and generally not implicit.)
> The reason to not keep "err" check is because the call should fallback
> to normal response(fastrpc_wait_for_response()) in case
> poll_for_remote_response() fails.
>>
>> Is it possible that in poll_for_remote_response() you get 0 as a poll =
result and val is not equal to FASTRCPC_POLL_RESPONSE? In such a case, th=
is may hang. (Is a hang desired here?)
> That's actually a good point, let me try making it more robust, this
> condition might get encountered in case normal response is sent instead=

> of poll memory update.

Right. We want to avoid this dependency. If the device hangs for whatever=
 reason (defective device, cosmic ray, etc.) this should not result in a =
process or a kernel execution context hanging.

>> Is it possible that if polling is enabled, then you want to poll only =
once, and if unsuccessful, or successful but "!work_done", then transitio=
n to fastrpc_wait_for_response() and return, without looping? (since poll=
ing is looping after all...)
> This is correct, the intention is the poll until it returns, continue i=
f
> successful and fallback to normal response if unsuccessful.

Right. So this was obvious by reading the contents of the do-while loop. =
If you prefer, you can remove the do-while loop, or at least take out the=
 poll_for_remote_response() out, and only leave the fastrpc_wait_for_resp=
onse() inside the loop, and decide how many time intervals you want to wa=
it. If that is once, then you don't need the do-while loop. (Effectively,=
 you've waited once in the poll and 2nd time in the fast_wait_for_respons=
e().)

We just want to avoid hangs.

> Thanks, Luben, for taking the time to review this change and for
> providing insightful comments.

Yes, no problem. Good work and thank you for your work and contribution!
> [1]
> https://lore.kernel.org/all/wipphezpxtuuxtwhpwamsmvhwgwuesexmy5ev5pcqb6=
5vov5kz@vuzzyyqnu7ci/
Ah, thank you for this reference.
--=20
Regards,
Luben
--------------0hdEhfg1Mjy6CiCPDwuTIK8u
Content-Type: application/pgp-keys; name="OpenPGP_0x4C15479431A334AF.asc"
Content-Disposition: attachment; filename="OpenPGP_0x4C15479431A334AF.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1A
PnbnnRHNIkx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoA
QRYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlT
MqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfyJwktF7REl1yt7IU2Sye1qmQMfJxdt9JM
bMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSPcCE8uGe7FWo8C+nTSyWPXKTx
9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJl
OiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKoaMDzO9eG
z69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA=3D=3D
=3DqCaZ
-----END PGP PUBLIC KEY BLOCK-----

--------------0hdEhfg1Mjy6CiCPDwuTIK8u--

--------------q7nzm1aCz6wjRQL5UEw8NoVY--

--------------u6hXa02bmrzTrAKCf5rbNvPB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCaeGu6gUDAAAAAAAKCRBMFUeUMaM0r8Uw
AQCj0T0Np+w+vi9aTASsrtwXtdly3Jx3m+hcYafBMLCqjwD/cgjN4ZlugPcnrjYw28n1jlreTfj7
JnhDdObDz82HrQI=
=iqZA
-----END PGP SIGNATURE-----

--------------u6hXa02bmrzTrAKCf5rbNvPB--

