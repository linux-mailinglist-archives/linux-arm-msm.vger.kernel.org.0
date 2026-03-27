Return-Path: <linux-arm-msm+bounces-100396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLeLMcjHxmm8OQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:09:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6952348D12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 82B9D300A250
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFAF378D9F;
	Fri, 27 Mar 2026 17:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sz2m6yt5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF353F99F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774634047; cv=pass; b=R560vQSYZmVyZW22QBWTduamWf5Y8g/Aqp9/EH92wS6c3OzBFyd/Gpxjvie6H3wYYNhCrmdhUPLRN6AusSu/oRYIVHCx+OT28j+Ys3V6Z0jAmKOGIJEXM7ORh7GyHkyvH3W+UBpKz1pkekmyLmw4phY718QNvR5L7MMAv40gn3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774634047; c=relaxed/simple;
	bh=LmFOfz1O/NDV2XSAtVLTWjg01qByY+ybHZMlf9JXSJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/IlDzLWMS6duUbrIEBkmGn1/VXTqn2Muae84PtDa1T2I6Phe+T51qHspJDV2AsYDaksWf42msisOweQS0xGY3pzMVjg4MWm5pWpxftd/B9gkSOwBc3p6XDY04aidOHAXVfgZl1k/epg1QqpSYMU1fSam73pb5Q9uXG3RdFGhZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sz2m6yt5; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6500040f172so620317d50.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774634045; cv=none;
        d=google.com; s=arc-20240605;
        b=HDNo8pn0F93Os2lZE/a3muOCrnVph8Vp+hvGdDGrzVMv24FgxTv+yMT8XVkQX/Xxsb
         720qWTd5q9nyxSHKy037nZtbMf07bfI5zU+4Dad3NexbESqUObF6dr0vryZfeJtbGKso
         PBJfAT41Rnf0rfwy4pRI35RQBJ1s+NCbxPRLieAhCdHlACG/HkYkTCo8/2yx2Jt9ngvN
         pPbwX8vb8YyBPTmiKDCr3reemteh/vZoiQ1S9Zhp5mSOyQSPDmYfL2rPWcsq3SFveA2s
         xp5S8YVFg69y9nroEYaXImHJIAUGXeunbOwljFRtN8dNcm9sWtisjvLIOGryUKz/cb2R
         miPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o5jvKAEq5Gk2SlSedePjyJ1o9p5DlRTHGGledO1XifM=;
        fh=gkCLIV1NPoen96ckWF9PkkCfh6bUCyavr+EdE7CEdWs=;
        b=fUkdpXsBA1pDFAZZYtQIfny1qlJNGKcecytLpinsERtMxp5YUyx2JB/t2+ZoABJWEN
         4fMQlAUChONOpliQmBhQtE2xtdII1iBwsnnzsDmEehtL17gfPXH9yQPEOmeS7UNQne5N
         cLQPkdSerajDrYGcCuR4fGocarrmZYNwRTdjE6uGNXXq2dmiFiZ8N6/eI4dJIgRsJtg0
         pPuJ/gquyGUrUNFgVscUoDcM0f9jAvLazZ7DvA0PpL5t9KzRei7/R60KQgQhA4hKr22A
         3GdHMTtBqIOkeHgB8FsXGUFuxhtoxW0Z/DNzq0LKH+2WxyIir+LsSQQ7TyiZuOmh8zTq
         KB0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774634045; x=1775238845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5jvKAEq5Gk2SlSedePjyJ1o9p5DlRTHGGledO1XifM=;
        b=sz2m6yt5CeNweQ1Vrop/sSc3euTWq7UUgI9DoqfPDpa4YsmPhecfKp/OEYkhmj8PBw
         zVYuOjN4lHxqhYD5Ws12HgqtTvHmbhQ6fCxZlFFwAZN1Ddvgp8zydrBRwo/2SWNCRlf5
         VBY9pGGF5zxyDlepL8UmoYU8DoFqztUOIDDoZql35cnrTmISwEoa6z4pmq1D7oes2Rdc
         dTx6k9131jR9YUkCqIXM3RLn/dx2/4AJmaL6nwCQiBwKDK03c8u51/f+U+V0Ed4I38Pi
         o5I73z2/54hiyZKfgX0kiHC8KQoJkJ9NAM9nLVdJZuzPqso7SzR2cVATQToMsZzowvmy
         7Row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774634045; x=1775238845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o5jvKAEq5Gk2SlSedePjyJ1o9p5DlRTHGGledO1XifM=;
        b=gY4oQt+1EjFEpCS4DxKn7rOw425W2bdnVnSiQ0hcJiw/9tI2iSsAhGL/VEZXopWJXi
         19D52QqYAa8QWfm6xGcLHzZ+2cqKQ9QRcXC+d8WyoNtkyzlqZZFDLCuwtX6gFl8NrbA5
         9t6+D/Lw5uuvCmxK8L3WukHEmCpLewQd4IrwWmgjVXJzh+2M0HNFtAyqqFD/0M81aOoi
         TglUHcl5y9kA2zZvNgROUZvrp4Sh4sU0qq6oYwPRJ79H8M4KpNmMiTqMLxG9SPFSYR90
         qTWpNI6IF9PS1qGfIVQ6E1jjBV2d4LaUXBiEY86gFlmgJlXhESXo2/ncwMQgv2ki53ew
         n3iw==
X-Forwarded-Encrypted: i=1; AJvYcCUPOQetD3HOghk3fVkcrtBxR246fNnIoAOUKwrnlxakIZLYzwyYNx5lDsw3/lTAXMGcnWXb6KI3gc04tDeX@vger.kernel.org
X-Gm-Message-State: AOJu0YxgrCMf3sl8mUfbxyXVxYoGkyKLsqu3g4RDcJ4rNUN9GCR3DWz+
	pVU8JcBCCMbECcfwMv7bLUl0YmPRkhjJe66uUTnXzQidK+rM/ztb4EGslGggX5oAgOnsbHx7rvu
	ee//Edlvb8XHezVNiYxTdeyc/us/LE5A=
X-Gm-Gg: ATEYQzwsrkY3udddo1KPlSpNTjilHi1PJxNDIkg7bTbJSJHBnOBdlQwxahg+vfLUAZ0
	75s5XdWkfhZz2wDZ8RCGGtS4s6pcakxEKzUHT3KAwfNi86fEoz+8ydsnD9UrRJmYHKNCAGQl20A
	ly6LZiCf3nofCKIH4uMMd94WFouMNuAmdJ/vqlUVS3azDx/tgKCTiGkA96xl2W0SlM+Ef2wi2D1
	bZW13pjj1v5Gex3RU3goWvyYnBTKXWlm3jvXfNgLlqoQGeeDqFY4LqfPPNdgCrQk8j64S2h/fJv
	vviCANKJwgDtP7eRWRhcFr9lcI8O0YwtBR54DvVemVpWh/+YGkbLD9dKj4wRxw6TQufAjw==
X-Received: by 2002:a05:690e:16a1:b0:64e:8cde:814d with SMTP id
 956f58d0204a3-64ff71edc43mr3636436d50.17.1774634044730; Fri, 27 Mar 2026
 10:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327082941.1396521-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260327082941.1396521-1-shuai.zhang@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 27 Mar 2026 13:53:53 -0400
X-Gm-Features: AQROBzABUNBAq4NDI41MlQecMK1c72cnfWT1jZSJzoRfaj-V1aWkzICh_EWxFMw
Message-ID: <CABBYNZKY_-QgsenfU4hpyQ1+87rXDS13wFueN2nX6Wojy4BgHQ@mail.gmail.com>
Subject: Re: [PATCH v4] Bluetooth: hci_qca: Convert timeout from jiffies to ms
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com, 
	wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com, Shuai Zhang <quic_shuaz@quicinc.com>, 
	stable@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100396-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sashiko.dev:url,linaro.org:email,quicinc.com:email,mpg.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C6952348D12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Shuai,

On Fri, Mar 27, 2026 at 4:30=E2=80=AFAM Shuai Zhang
<shuai.zhang@oss.qualcomm.com> wrote:
>
> From: Shuai Zhang <quic_shuaz@quicinc.com>
>
> Since the timer uses jiffies as its unit rather than ms, the timeout valu=
e
> must be converted from ms to jiffies when configuring the timer. Otherwis=
e,
> the intended 8s timeout is incorrectly set to approximately 33s.
>
> Cc: stable@vger.kernel.org
> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump =
during SSR")
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
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
>
>  drivers/bluetooth/hci_qca.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 228a754a9..d66af13ab 100644
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
>
>         clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>  }
> --
> 2.34.1
>

https://sashiko.dev/#/patchset/20260327082941.1396521-1-shuai.zhang%40oss.q=
ualcomm.com

Comments seem valid to me.

--=20
Luiz Augusto von Dentz

