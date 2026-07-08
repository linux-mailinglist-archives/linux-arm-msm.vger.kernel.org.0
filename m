Return-Path: <linux-arm-msm+bounces-117646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5+P8IdBWTmq1KwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:55:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2264726FE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:55:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JOcVW4n8;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117646-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117646-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83F00304CE9E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 13:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48699399374;
	Wed,  8 Jul 2026 13:51:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F28E392C34
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:51:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518687; cv=pass; b=aY1H2tbZdg+hZe/kwLtWV7aV3EZ2UIo4ip5bJ+e/d/9lwArZQEv6TXi8AGHL9ZqXlTJke0G2RkKeF0GTjPF6LvO8wWkRNJybOuB01EYnnYyjb/dlV6JSuHK3w+sRtQuQUNhP/8C+jlst+rH9YbEwVfdIrKBCUTUPBRl0Hx4Tdgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518687; c=relaxed/simple;
	bh=JEw8HwFuQl+tAwqyru3dgnqdruNr5r2f0R67dLeVx6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdadUP22QHWtQAat/cyRw9A8OdltsLswpzmHx8XeV/DYQ+B7Zk03BiyuH8UMVtems5nDw0PPN48Sbyz4ydri9ZyO7vXcMmY/o/6GII2jCmxJmIoSkBaXVa8QqZFpQxHgmNf0DSYs2WkjV33Kmy3miq+j+xDr2OZsomlxzNFAz04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOcVW4n8; arc=pass smtp.client-ip=74.125.224.50
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-667b0ced2d3so297065d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783518674; cv=none;
        d=google.com; s=arc-20260327;
        b=gvsKpTGj8CkR7lTDX4hxOojhf9D5T+ikA5afb1c0Id5PLJo+Zv5bC7Ol31IipNmFmu
         DFcJPLLvTvDedGNTaiVzqCGromjWE841+pnwtEcqhy4i3mZcCxcTZ1h+wY6gK4jVBwZB
         BFTW99FdV7FiFAvN/o3l+1WlKIuVziupFeNmZK4doFInagVGsL/6BCu+D6qBQ6AvEcBj
         VkYh/FMrJROwDiuHeKE+gWp0hga3Usj0S6jtwIotSjJFyNy23dAoYAKDCZ05L+wuZ30K
         T4cmDDk9VtTa3prqEXlmRk9sEhuue+esoNCXlDJzmZD6Evyn+QyENLFrFHEfqp7sUisu
         tfUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZV3C4UpUpSJJxBdiVf23ZW56xvpWwW6MMX7CrWEfTZA=;
        fh=/JpGwb+C8OsJqrmI/ai66v/EAr41HUfPEdqvdUDk3KM=;
        b=QPYsgr4UYptxe5hskxpXnB0ec3w8EbycdQd/iMWLcGAXm23HT3GW9AkFHr+xbCO6NA
         +5v0e3OmhcoQz3W8CA30OhLaKgirR0eWuPcKiWfoAMvzJVdK27TGA4FioywaVWMHXpFY
         THTaOkd40gAIlwhLSc0KjRj5j8Cp1Bj6Y06P5f6M3kAPy9WKBoMT4Gn+IOkQpp3NT2Vf
         6J2QRq1EOk0Ak9KDclBhlQO5Qal9jU95mPB210J5tH8HK/qX3WjXgWMt7fgyWwYTQVIQ
         MmgseUKeA/2CfdDurKwE2Xm2CLQ0Ax4yB4XdoueumA94ibhKWjey2LfKrFHdxAXGOPHo
         oIeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783518674; x=1784123474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZV3C4UpUpSJJxBdiVf23ZW56xvpWwW6MMX7CrWEfTZA=;
        b=JOcVW4n8UerNhfWvNml/+fRPG4+3lkFIJdyUG0fWTMVeBlOfm9OOcRoH31tA/39Eqa
         R2awZjRVC8UVswq74M2P8360aU9HsQZXRn5LN5vYmDxPQkfQugQRwfc15mGOBtJqoVyg
         S8DhrABqwX4NnVEdbh2AdWKkwg1MJ7hmO+D27gtlIAjipGgMxqJjyQuBd1sB8zKU5US1
         tyXPO/IQ00DsAuLPvdD9SSXwtf1ZkoIcWfwT2zqIi4awDIgyhS/JQhABUHfbiqRSmzT5
         YNPOmSZCjMhS6dKEWGPoHXq8j1KpBbtEFkpIpCVaSr+4kMfOYvgj7He14AhFX9YaeILp
         6A8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783518674; x=1784123474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZV3C4UpUpSJJxBdiVf23ZW56xvpWwW6MMX7CrWEfTZA=;
        b=MiU+DYriEIMtZ/twOoyfsnPrlvGSR1SGbrTxf/7X1me5zqIZHnnRDqYIBTXgxKWSkx
         uM1laZJpbxkvS6BZNvx3jG4h2JVlaqz4OejHhzb9gs1FXG17XH7SJybbCTgsGE0jx8JP
         wR4Ejdeh7I0W6tyUkX9D2eLrAXAS7mpx2js23oxwo0aTFqyXQUoSL6+g0zo2QfjADBAm
         LNsi6XK9azEMwr2oDRSGIERZ8FX4YRcHELf2CniYgFYg0Ohs4NTnOl5y7PXnmfsDaJUZ
         Ynwq+C0GKpvNmdytUqcz0zHFVsCVtYbyGFdvF9zIiD/f4/W3OHPrgyaqzWuAtw1e0Y0f
         hBaQ==
X-Forwarded-Encrypted: i=1; AHgh+RqL3n38E9tp0hbNnTBw3Tbm5EeEMKMZXQW4G0ju7FjoIsvQqxDhIWQG/lzHQHbiny0E8KwEmqqKTPf6TNKe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv6tQcL1b8QkDWmHfrHnNK55Ih9dQuG8g5ti52I0V2THiLjCQL
	qHaBLmrXq8U9XO21BsrROL6B88RMgnrclLgjuXAgbh6RqvGQ6O22a2lPMG6wJpqstUcSLZj47yi
	DNWJSKssXFyPFlmDi9nQ4PB/uAKWiODs=
X-Gm-Gg: AfdE7cn7ORzYRORSZ2o8w8WBbaOKbF+elRaJqr+K7+S69ZbK1nHzmGI50l4CGuZRiRt
	HeE/2lTARGzIM8gUEWy/CLgnTTlK0hKO+gWSK+am0CVHZu/xuvQOwG0oB5dgf8AVZg9zjorApOt
	6Wgzp9UTnZp+2H90cPAKA24UTXuk4UJyVYqUePgbhmCOV9pg3+9y0Raoen5aLu0/BL7MDO7ElnQ
	a9lQOWkhtkfl2hRIkHu/bGXAZgfkQMmqIlUfvecoja4rwAGkJOHA6W9+aEXjKvvWgZbPVnkEkNC
	Sj9wN0KpyFuuWR1gSb1kA0QKfMbqd2i7vSmNz9czvSTyAziEytivog0s6mI=
X-Received: by 2002:a05:690e:4841:b0:667:6c44:ba95 with SMTP id
 956f58d0204a3-6679f153120mr1460876d50.62.1783518674078; Wed, 08 Jul 2026
 06:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708093822.3495633-1-xiuzhuo.shang@oss.qualcomm.com>
In-Reply-To: <20260708093822.3495633-1-xiuzhuo.shang@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 8 Jul 2026 09:51:02 -0400
X-Gm-Features: AVVi8CfaHmxTvZvtG2K6Ng3GQP2_U34HrbzGAz_wFxb8w03AATbevrrfs9zcCE4
Message-ID: <CABBYNZJ+Kw0RGE3sW4AWUTzHeAH0Z1UhBQwdkhtpQg5FKOUtCw@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: MGMT: Fix discovery state race against
 cmd_sync worker
To: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com, 
	wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiuzhuo.shang@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-117646-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2264726FE4

Hi Xiuzhuo,

On Wed, Jul 8, 2026 at 5:38=E2=80=AFAM Xiuzhuo Shang
<xiuzhuo.shang@oss.qualcomm.com> wrote:
>
> start_discovery_internal(), start_service_discovery() and stop_discovery(=
)
> queue a cmd_sync work item and only then move the discovery state machine
> into its transient value (DISCOVERY_STARTING / DISCOVERY_STOPPING):
>
>   err =3D hci_cmd_sync_queue(hdev, ..._sync, cmd, ..._complete);
>   if (err < 0) { ... }
>   hci_discovery_set_state(hdev, DISCOVERY_STARTING /* or STOPPING */);
>
> The matching completion callbacks run on hdev->req_workqueue serialised
> by hci_req_sync_lock, which is independent of hdev->lock. So once the
> work has been queued, the worker can be scheduled, run the sync function
> and invoke the completion before the caller has executed the trailing
> hci_discovery_set_state(). The completion's success path writes the
> terminal state (DISCOVERY_STOPPED for stop, DISCOVERY_FINDING for start);
> the caller then overwrites it with the transient value, and the state
> machine is wedged: every subsequent Start (Service) Discovery is
> rejected by the DISCOVERY_STOPPED gate with MGMT_STATUS_BUSY (0x0a),
> with no HCI traffic generated, until bluetoothd or the adapter is
> restarted.
>
> Fix it in three parts:
>
>   1. In all three call sites move hci_discovery_set_state(STARTING /
>      STOPPING) to before hci_cmd_sync_queue(). The transient state is
>      therefore always published before any worker can run the
>      completion. On queue-submit failure, roll back to
>      DISCOVERY_STOPPED.
>
>   2. In start_discovery_complete() and stop_discovery_complete(), wrap
>      the terminal hci_discovery_set_state() call with
>      hci_dev_lock() / hci_dev_unlock(). These callbacks run without
>      hdev->lock; serialising the state write matches the pattern used
>      by mgmt_set_powered_complete() and removes any residual ordering
>      hazard against a concurrent mgmt path holding hdev->lock.
>
>   3. Generalise the "ignore -ECANCELED" early return in both completion
>      callbacks to "on any non-zero err, also reset the transient state
>      to STOPPED". With (1) in place the state observed at completion
>      time is always known.
>
>      For the stop path this also fixes a pre-existing wedge: when any
>      sub-command issued from hci_stop_discovery_sync() returns an
>      error, stop_discovery_complete() is invoked with err !=3D 0. The
>      existing "if (!err) set_state(STOPPED)" tail then skips the reset
>      and the state machine sits in DISCOVERY_STOPPING forever.
>
> Fixes: abfeea476c68 ("Bluetooth: hci_sync: Convert MGMT_OP_START_DISCOVER=
Y")
> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
> ---
> Changes in v3:
>  - Replace inline patch title with lore.kernel.org URL in v2 link
>    reference to fix GitLint B1 line-length check.
>  - Link to v2:
>    https://lore.kernel.org/all/20260708062009.3047447-1-xiuzhuo.shang@oss=
.qualcomm.com/
>
> Changes in v2:
>  - Fix if (err < 0) to if (err) in both start_discovery_complete() and
>    stop_discovery_complete() to also catch positive HCI status codes,
>    flagged by Sashiko.
>  - Add Fixes: tag for commit abfeea476c68 as requested.
>  - Update commit message wording from "err < 0" to "non-zero err" to
>    match the code change.
>  - Link to v1:
>    https://lore.kernel.org/all/20260707093426.372897-1-xiuzhuo.shang@oss.=
qualcomm.com/
>
>  net/bluetooth/mgmt.c | 86 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 74 insertions(+), 12 deletions(-)
>
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index 733a4b70e10c..81c09c24a14b 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -5975,15 +5975,38 @@ static void start_discovery_complete(struct hci_d=
ev *hdev, void *data, int err)
>
>         bt_dev_dbg(hdev, "err %d", err);
>
> -       if (err =3D=3D -ECANCELED || !mgmt_pending_valid(hdev, cmd))
> +       if (err) {
> +               /* The queued start-discovery work failed before the norm=
al
> +                * completion path could advance the state machine. The
> +                * caller already moved the state to DISCOVERY_STARTING
> +                * (under hdev->lock, before queueing). Reset it here so =
the
> +                * gate in start_discovery_internal()/start_service_disco=
very()
> +                * does not wedge in STARTING and reject every future Sta=
rt
> +                * (Service) Discovery with MGMT_STATUS_BUSY.
> +                */
> +               hci_dev_lock(hdev);
> +               if (hdev->discovery.state =3D=3D DISCOVERY_STARTING)
> +                       hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
> +               hci_dev_unlock(hdev);
> +
> +               if (err =3D=3D -ECANCELED)
> +                       return;
> +       }
> +
> +       if (!mgmt_pending_valid(hdev, cmd))
>                 return;
>
>         mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_statu=
s(err),
>                           cmd->param, 1);
>         mgmt_pending_free(cmd);
>
> -       hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED:
> +       /* Serialise discovery.state writes against any concurrent mgmt p=
ath
> +        * holding hdev->lock; this callback runs on req_workqueue withou=
t it.
> +        */
> +       hci_dev_lock(hdev);
> +       hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED :
>                                 DISCOVERY_FINDING);
> +       hci_dev_unlock(hdev);
>  }
>
>  static int start_discovery_sync(struct hci_dev *hdev, void *data)
> @@ -6051,15 +6074,23 @@ static int start_discovery_internal(struct sock *=
sk, struct hci_dev *hdev,
>                 goto failed;
>         }
>
> +       /* Publish the transient state BEFORE queueing the work. The
> +        * completion callback runs on hdev->req_workqueue serialised by
> +        * hci_req_sync_lock, which is independent of hdev->lock; setting
> +        * the state after the queue allowed the worker to win the race
> +        * and have its terminal STOPPED/FINDING write overwritten by thi=
s
> +        * trailing STARTING write, wedging discovery in STARTING.
> +        */
> +       hci_discovery_set_state(hdev, DISCOVERY_STARTING);

I guess I will need to repeat myself, now that the callbacks do
acquire hdev lock the comments above are invalid, the callback will
attempt to hdev->lock making it wait the hci_dev_unlock bellow past
setting DISCOVERY_STARTING, so the change above is no longer needed.

>         err =3D hci_cmd_sync_queue(hdev, start_discovery_sync, cmd,
>                                  start_discovery_complete);
>         if (err < 0) {
> +               hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>                 mgmt_pending_remove(cmd);
>                 goto failed;
>         }
>
> -       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
> -
>  failed:
>         hci_dev_unlock(hdev);
>         return err;
> @@ -6178,15 +6209,19 @@ static int start_service_discovery(struct sock *s=
k, struct hci_dev *hdev,
>                 }
>         }
>
> +       /* Publish the transient state BEFORE queueing; see the comment i=
n
> +        * start_discovery_internal() for the race details.
> +        */
> +       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
> +
>         err =3D hci_cmd_sync_queue(hdev, start_discovery_sync, cmd,
>                                  start_discovery_complete);
>         if (err < 0) {
> +               hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>                 mgmt_pending_remove(cmd);
>                 goto failed;
>         }
>
> -       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
> -
>  failed:
>         hci_dev_unlock(hdev);
>         return err;
> @@ -6196,17 +6231,40 @@ static void stop_discovery_complete(struct hci_de=
v *hdev, void *data, int err)
>  {
>         struct mgmt_pending_cmd *cmd =3D data;
>
> -       if (err =3D=3D -ECANCELED || !mgmt_pending_valid(hdev, cmd))
> -               return;
> -
>         bt_dev_dbg(hdev, "err %d", err);
>
> +       if (err) {
> +               /* The queued stop-discovery work failed before the norma=
l
> +                * completion path could advance the state machine. The
> +                * caller already moved the state to DISCOVERY_STOPPING
> +                * (under hdev->lock, before queueing). Reset it here so
> +                * the gate does not wedge in STOPPING.
> +                */
> +               hci_dev_lock(hdev);
> +               if (hdev->discovery.state =3D=3D DISCOVERY_STOPPING)
> +                       hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
> +               hci_dev_unlock(hdev);
> +
> +               if (err =3D=3D -ECANCELED)
> +                       return;
> +       }
> +
> +       if (!mgmt_pending_valid(hdev, cmd))
> +               return;
> +
>         mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_statu=
s(err),
>                           cmd->param, 1);
>         mgmt_pending_free(cmd);
>
> -       if (!err)
> +       if (!err) {
> +               /* Serialise discovery.state writes against any concurren=
t
> +                * mgmt path holding hdev->lock; this callback runs on
> +                * req_workqueue without it.
> +                */
> +               hci_dev_lock(hdev);
>                 hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
> +               hci_dev_unlock(hdev);
> +       }
>  }
>
>  static int stop_discovery_sync(struct hci_dev *hdev, void *data)
> @@ -6248,15 +6306,19 @@ static int stop_discovery(struct sock *sk, struct=
 hci_dev *hdev, void *data,
>                 goto unlock;
>         }
>
> +       /* Publish the transient state BEFORE queueing; see the comment i=
n
> +        * start_discovery_internal() for the race details.
> +        */
> +       hci_discovery_set_state(hdev, DISCOVERY_STOPPING);
> +
>         err =3D hci_cmd_sync_queue(hdev, stop_discovery_sync, cmd,
>                                  stop_discovery_complete);
>         if (err < 0) {
> +               hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>                 mgmt_pending_remove(cmd);
>                 goto unlock;
>         }
>
> -       hci_discovery_set_state(hdev, DISCOVERY_STOPPING);
> -
>  unlock:
>         hci_dev_unlock(hdev);
>         return err;
> --
> 2.43.0
>


--=20
Luiz Augusto von Dentz

