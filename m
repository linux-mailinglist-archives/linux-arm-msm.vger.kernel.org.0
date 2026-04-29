Return-Path: <linux-arm-msm+bounces-105239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGu4Mn4j8mmOoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:27:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 767DA496DE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C395C3014522
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0371F364943;
	Wed, 29 Apr 2026 15:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHVjhNUF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4113837998B
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476090; cv=pass; b=U+lAp186gefc+12YjFNDgw8nEsxMepuWzg1OT/2L9aRqWkBP+uF4TRF2/V6xIhIFOM+y+KOGN/XcxasaRBGLx6xfzQ06+Ie5jI4qvmprFmExSpX1pO75rCKEHtc2fB0lklpdDIIRH6BLJfZq6H2/dxWj7qDZsDhs4KE1kG3ldN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476090; c=relaxed/simple;
	bh=F0LKnQYydEFVmmpjFG0F4ArdLOZrbz8l2Ink5YAL6Vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbnOpfFlgQPPSSlvnrQElwa6UQ/LqrF9W7DMr7HYBdo8sFvzg53gUaHjNTGUWJSltgn9ddGowAFfQvzbeIrUMvoCItO8Mq49LBwPhvt15Kg8puSTESlwu49SH9ifmjSqQGltjUBzElBV+wihql153NLq7uRJ23RThougUtSpUIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHVjhNUF; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6501725d888so10490128d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777476081; cv=none;
        d=google.com; s=arc-20240605;
        b=ILS5ggfLG4mohvnN1GVUvKcbDYQZe6nj8gwJ03rXmoqwERfGSVlu4A8AZ8W7XQd4Wj
         JuHZ6nxu3ogtRMzKXzmZlJEMSUoSbk50Oke50ciZAJ3aQpGkNAKGO28PSAFrKKtkP+jT
         3Aw3dBYkHbNOt2Pm8+Vx9f7r0yM3sgRxkUNyDEqLUHbytzPnTkMOV9hhWLteSdvJWXVi
         w8/pvGngH8Jgt0mJ55pvtiYJVaEb84h9fCe5YgIDrSNt3c7cVXbvy8b7USD+BKViqXo0
         aSP+5r2KBWt3xBbwQfE//LGgSaLIfCYMxv/akcXT9JYh4icWOhJltKoGVkcRugaJPZnj
         mMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CYcRgbXTHmNUItUJBfcu/cdStn3hD3SAzjFhApjzb6g=;
        fh=31lsqj7H99ahE+biSxHB/IGlQisNPURKCsYvtvyZDy4=;
        b=ITqzA1SmP+eYOddplYlftbe6UsdK8+K4UcbEG9LNWFnxYw/bZJ3VB9i1O8UkBUIMQX
         7EkEpC5Re2SfO2CJzjiNB50fc6vG0ApukL77RmR8yS6MScncg6/3LRpOqkbEVrZYpgXL
         +psK45zgliWPAVSQcYFrG5g8L2RV+MWmVfV6QNKaT/GnYX4+HNHauF1UxN12YZGtvjcC
         v+/AnGBYiPKEOZTUwWtpYzdv2SeAoGXiETPv3bfEwBFgt09CEVwRZwQsGLTEC0fk29Rt
         0C6FtzPAxcwsP1MhfmGNiwmUcDxRPyA8UzMkKRW8drjfzF2zhWlF+onu0LrJ7jaIMFQr
         v/vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777476081; x=1778080881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYcRgbXTHmNUItUJBfcu/cdStn3hD3SAzjFhApjzb6g=;
        b=EHVjhNUFqW3dlEmuycVkIWpsAoxpo61CBPu7XAMnt/+xzvfg/9TQXphN0UqDm7Uhd+
         0umiRpjcWOHO4q6SZkbdJbyL9al0YMMOL9y5JIu0aIe9h3uPy6PuWLrBH5c4dleRBwsK
         39imtFLJu2x+0FhBslMA0dPZkAlNbxjdjTDqhtjVez4RPhGPhmF5VCTaI1slkCf/V8bc
         FUeU2+8Yd5/kWIicvHzK/+qiR+93+8keCedQVPL6VLrfcVagCL5s24kAI+BpQe5GgWcs
         jNhY8vnwyFsT3LYcPwwDqHXIYq5hLGtWjIOuVUMb7TWW4PvF5i8wBMA4x5ZtINDmDccs
         4fqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476081; x=1778080881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CYcRgbXTHmNUItUJBfcu/cdStn3hD3SAzjFhApjzb6g=;
        b=QvMYGYPLkIA0mysMoOAy7/uxLMrlLADkGGHLqGrpvs+G9D7AXhLpqMFA/8TLJFuGCn
         qhfkCIIJdwdbvhqYHAa0sDvcEEXfjXBvu2mV5uGO+xwIwpGpTf0MrYcNbLzrwLz/pP5L
         6mgvUbWswIC9rS4KYQM/wKnz1D7AnaGSNsDj1/M7dU5adIyUdRxdU2jttPpNIYW7Bn3B
         RAwQUujSZHkCXDydvflJHSvRxXMM1lj44LPmlZt+sAFA6MJCETfcTsGTS20PAH5tkRvS
         Jmgu4v0G21aT4xB/PgekZ/vKn/+QQ65WYzZqegY6zKjc2w/76TdXdhA3GllJwYOz+dMp
         VmyA==
X-Forwarded-Encrypted: i=1; AFNElJ83MFQz6dW/exEqD+N6HhAclzeVoslzc/o8QCDHiC9F0Qoh+/ZmZuKH+ijpeevB/+ECHDhutn8Ic2q00aa3@vger.kernel.org
X-Gm-Message-State: AOJu0YwhHkmKl+j15ylyys/Z8ZGezXHhcoJQijzwCu+oNGdsZdmfNs3C
	tl91sJ3AVi1BUOQA/GgrRz372KQsZUIiD0k5K4AIVNyf7Yw83zYVdJU8xXizLENib0U3rBxg9pb
	r28zOxPk/z05x/W1vyyBg8TPIVJsJDx4=
X-Gm-Gg: AeBDietQghzCHgyJmZEIn3JNN3UXkkeZZ8of2ASdxZH3YCVEvSjzHzCov4FqQryWJJV
	ZrvnJfKXXsbcTEdRE+x0zf1uv+AF678dQP9nXw4jeJv8ejB0ZrPomgTj1hYu24SwOADcVloRVjp
	PKXI8u1MvQJaMNX3ASA0JkUG9h5NQFzoW4/p9Xg/OSC8cYZbeDZl9dDGISbKp6e7B83Rs0mLZ+x
	vphC+p5tXNlV58CBy+3YemFWe9LpWG2CaeoO17DYPFH3kHYGUZ/8y7cm+70tHOECV6gENEqlnZF
	4GSsbWc0W1YQw9LJ+eEgPo9ZgUhSGGQvrI9eoW2cBDfdtRwcOciN38qm/gFoqurfnTOOrjlYwhe
	HxxXN
X-Received: by 2002:a53:4211:0:b0:64a:cff3:8f4c with SMTP id
 956f58d0204a3-65beeecf3e9mr5086213d50.65.1777476080690; Wed, 29 Apr 2026
 08:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429123802.1310681-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260429123802.1310681-1-shuai.zhang@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 29 Apr 2026 11:21:09 -0400
X-Gm-Features: AVHnY4J4oK22A47FRROvHNLoScTG-JkEQRDEopdcMvPE6dQIUXQ3j_XdrBBGTSA
Message-ID: <CABBYNZLQcTa2528KGOXHProu7E2O7WQey=i20-VLxRAG2hFvHA@mail.gmail.com>
Subject: Re: [PATCH v5] Bluetooth: hci_qca: Convert timeout from jiffies to ms
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com, 
	wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com, stable@vger.kernel.org, 
	Paul Menzel <pmenzel@molgen.mpg.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 767DA496DE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-105239-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,mpg.de:email,mail.gmail.com:mid]

Hi Shuai,

On Wed, Apr 29, 2026 at 8:38=E2=80=AFAM Shuai Zhang
<shuai.zhang@oss.qualcomm.com> wrote:
>
> Since the timer uses jiffies as its unit rather than ms, the timeout valu=
e
> must be converted from ms to jiffies when configuring the timer. Otherwis=
e,
> the intended 8s timeout is incorrectly set to approximately 33s.
>
> Wake timer depends on commit c347ca17d62a
>
> Cc: stable@vger.kernel.org
> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump =
during SSR")
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
> Changes v5:
> - add depends on commit
> - Link to v4
>   https://lore.kernel.org/all/20260327082941.1396521-1-shuai.zhang@oss.qu=
alcomm.com/
>
> Changes v4:
> - add review-by signoff
> - Link to v3
>   https://lore.kernel.org/all/20251107033924.3707495-1-quic_shuaz@quicinc=
.com/
>
> Changes v3:
> - add Fixes tag
> - Link to v2
>   https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@quicinc=
.com/
>
> Changes v2:
> - Split timeout conversion into a separate patch.
> - Clarified commit messages and added test case description.
> - Link to v1
>   https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@quicinc=
.com/
> ---
>  drivers/bluetooth/hci_qca.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index cd1834246..89073adec 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1607,7 +1607,7 @@ static void qca_wait_for_dump_collection(struct hci=
_dev *hdev)
>         struct qca_data *qca =3D hu->priv;
>
>         wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
> -                           TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
> +                           TASK_UNINTERRUPTIBLE, msecs_to_jiffies(MEMDUM=
P_TIMEOUT_MS));

Well defining it as ms seems useless then, just do #define
MEMDUMP_TIMEOUT msecs_to_jiffies(<value in ms>).

>
>         clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>  }
> --
> 2.34.1
>


--=20
Luiz Augusto von Dentz

