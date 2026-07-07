Return-Path: <linux-arm-msm+bounces-117344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PycJGOkKTWpauAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 16:19:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A68BB71C7E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 16:19:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="igV8La/b";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117344-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117344-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80B4231CDEEF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 14:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18181175A89;
	Tue,  7 Jul 2026 14:09:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AA5313E29
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 14:09:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433363; cv=pass; b=l+Gc3ldWs2Nm9nuzeg47g/ubozj/QfAgKc3c6+VStk6/KH8bR3PSuge0nGDNOnj3pFCJXCX2Okp0dyuwfhfuc88EnQ1JLxnHQHRsQbBhOd9nUf1nGhUVFeLl+r3DVl7CP6oK7Ft3boQvvdfeHqKCklIjlCjXYQmJmggJs+sohPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433363; c=relaxed/simple;
	bh=4Gk/T7gcb9Frs7VwcGVHH2iC1ABibfBUNLCg4sA29Ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPUY9PAhTqGjOGSI7EF99FGrlPvjtY0GH510Me/YI+eeoVTPjt1iKOliTzHRuKbQn/XMys6FplGMrssWyZ/tidOJY2Ewvf+nxrlhwNUMwQX8wHb2hUODK9jxoJO5m+nU3zx1cgqItYhBOY+QW1m6FqACdFbtWNUAu7HVgq16sTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igV8La/b; arc=pass smtp.client-ip=74.125.224.48
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-664ce3000e6so3550197d50.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783433360; cv=none;
        d=google.com; s=arc-20260327;
        b=bvIWDsS3QE710urRAzc+7A+tLqsG8qW96b+oJxuEpADXPI9/Sf/ZTF5wVOTvhhU0Mu
         /x4zvddFeOEZg/FYYvUzatrCoXn5yMDcQ7vh3i84vnyBcr0F1yQ17eCvI/JWNjbjJDTJ
         rkcWiO6dfsmVyYIetK+Wd3pKRtM0uNyIG9Va9GNqQ2eJd7g6Wm87leu+FCIaMuTXP9ES
         /23OW7lT31mkEIxn91qiWp3gUiBoat1qx36mgA1VzSSaH9MbH+uX7A/Fskl3NbJ9Zshs
         ocZJE9fQuQ3SPBRWmWXcfhGQSjJDT8xxGBNAnsZnC2pEgx9KNk1wbbaxzmdUfjqrsESJ
         WBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AdoCQ4ZX5BtlQtLCqarU4DocdJVuupPvE5g+WnHkPbY=;
        fh=A2cj0DJNfZ3fW3+GtmQ2Ks6B/s+JXJ8uoK2RMH4OBkE=;
        b=q1fwys4VAmjP9gfzkaFsv2Umb1Fs8Gr/qtWyBflwDk+9ect2KhLm8y+gLzwLF9SzKl
         0JybFyQWgrMSj3x/i38pf+WMP2MWSAWuFNKP5obUjZ1rCk2zYqKMWMnrWSec0Wileg7V
         kAGwWX2vDBHr07MjFAUNkVb+dR8psgEH5PioPZazheMotp7vYM4H+7sq9YDFUqt3du9S
         mFBd3zXTprKv9rWLPFLyauBlaAGC5W7y3p2HagHbYoA3vP+HbG/2tUFZCBo6tBLZrecc
         s0d3wVocO+11ylE+dCG9MCAVw9GFObREDQCWujYyInwu2ddCK0x1L+Wz4oVzOOFB1rxH
         L0OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783433360; x=1784038160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AdoCQ4ZX5BtlQtLCqarU4DocdJVuupPvE5g+WnHkPbY=;
        b=igV8La/bD7l0S3iQ8CEZJyztpRYbJ8r69cKY2/4pp+PjZeuN6BII0gPCZMBTlMmW+8
         s2R03uC3fiNd2DLLh/QPhA1kxWhyMqnpe/GpXmv+ZLwGQnLKVTk50yXr5NXKFNsX9Ayj
         lrKlpt+pVhHSd54FDMYlJxg4UNlqZqrJTRm9Vl/UYXAvaIchRrmMtWfQvBUYBqBLBSHG
         IVzBnAqo8Dv1eFNoTgzUhSYd28M292oCcD56GEx90tr1WokrXJuxav1H6kNO0BweQH7m
         sIJqyVuoy427zWAjlSs0n54QPqMMYRj4yX1v2Webr6SVFX+/qgEVNxWtOOOsATvZ1xPS
         8vgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783433360; x=1784038160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdoCQ4ZX5BtlQtLCqarU4DocdJVuupPvE5g+WnHkPbY=;
        b=ZSyVaXrSdUPExm5EMB6TljjgUtOkCaZ3GZGfGJYobqOy4FMTknH3xd6XS/HvHU0jK8
         POpiyovwRXzKGFQXnsuNiOxxkDamk7Rq6mXQIkitHITA96UAG+yZerSC0MBhs0GL1UPN
         1VNl9tOS8Ce35DMUXs0kODml8pgM+XFvpqrIcTS1S3eQf+12+9R+GKB2Igx/Z2PzYBdW
         7rEXXa2AKJMinnYh4fzN0MSbo3pq1MMgMM9QAD1Ra51jKk/byJLJE0FAzIrtkwyHqMKz
         yxOWopaQEEmvru5YcbSVIMb9gOQK7Rn1Hx8h9l9qSwx74GQima+qPJhP43sJnYIG6td2
         V5sQ==
X-Forwarded-Encrypted: i=1; AHgh+RqD+WAVmybWjBrR4MPRm4XljsvE1bTz0JNkkQuiEeFHSK4nTLpKaHVuRmoUj6SP1C23vMbEJSs7wmAvUgbp@vger.kernel.org
X-Gm-Message-State: AOJu0YydXLFrwHdNBmSh+ZcHdraEYpF7//RVxs9bTIWPQ19EEvdQlQ3D
	lRmllbWaanXP94miG03Vxp0x8ap1RVpVek/OtCsqliwBZ2ag7tqwi00XxMOPTWlbams7O2FWSnI
	qWRKsV4sL9tkwMu8n1qyBoit/GRAfuCE=
X-Gm-Gg: AfdE7cn+/VhPyQpIoq4umCsNy1bzY6DLgvX+Vu30zIr8LRFk0J5pGZXbVhntZd0gz08
	960yv2yjXn57UJVj1C1uRVJIIFuDSS2RNmuR5bbbM7eJYvA9dDAKat2Nju2HjGebzivr2y1pPHD
	08udij4zNkBGmwtnF35kcyhX8OdBcogb0mBaY+1TGBPjZ1QkKP7lu5L0IfRXp+my02yF4tLd8vD
	9rqDTMcYIDEKoAWCtFNzEvD30wBXNkN1r85R7qeiWyhxJcVXzmvIG07AHebqch3VIbAjKefm3cK
	U8+OOP2Ej7mxGOK6ZBdkZ5w6ACMaiTfInCJRa+ZpMyLuryYCB3hDl58LE/I=
X-Received: by 2002:a05:690e:1c08:b0:667:7750:14cb with SMTP id
 956f58d0204a3-6677f7ec627mr3586743d50.0.1783433359929; Tue, 07 Jul 2026
 07:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707093426.372897-1-xiuzhuo.shang@oss.qualcomm.com>
In-Reply-To: <20260707093426.372897-1-xiuzhuo.shang@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 7 Jul 2026 10:09:07 -0400
X-Gm-Features: AVVi8CdhspMrbH2pvJNN8ASf_Zebyq0dNRZdvHpxPbku9FW2X3yUDminqy4JhvU
Message-ID: <CABBYNZ+X-+ZJYz-V-_QSP5kCJpJJaBiyO=wMHD+Ut+b=639t2Q@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: MGMT: Fix discovery state race against
 cmd_sync worker
To: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org, 
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xiuzhuo.shang@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117344-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A68BB71C7E1

Hi Xiuzhuo,

On Tue, Jul 7, 2026 at 5:34=E2=80=AFAM Xiuzhuo Shang
<xiuzhuo.shang@oss.qualcomm.com> wrote:
>
> start_discovery_internal(), start_service_discovery() and stop_discovery(=
)
> queue a cmd_sync work item and only then move the discovery state machine
> into its transient value (DISCOVERY_STARTING / DISCOVERY_STOPPING):
>   err =3D hci_cmd_sync_queue(hdev, ..._sync, cmd, ..._complete);
>   if (err < 0) { ... }
>   hci_discovery_set_state(hdev, DISCOVERY_STARTING /* or STOPPING */);
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
> Fix it in three parts:
>   1. In all three call sites move hci_discovery_set_state(STARTING /
>      STOPPING) to before hci_cmd_sync_queue(). The transient state is
>      therefore always published before any worker can run the
>      completion. On queue-submit failure, roll back to
>      DISCOVERY_STOPPED.
>   2. In start_discovery_complete() and stop_discovery_complete(), wrap
>      the terminal hci_discovery_set_state() call with
>      hci_dev_lock() / hci_dev_unlock(). These callbacks run without
>      hdev->lock; serialising the state write matches the pattern used
>      by mgmt_set_powered_complete() and removes any residual ordering
>      hazard against a concurrent mgmt path holding hdev->lock.
>   3. Generalise the "ignore -ECANCELED" early return in both completion
>      callbacks to "on any err < 0, also reset the transient state to
>      STOPPED". With (1) in place the state observed at completion time
>      is always known.
>      For the stop path this also fixes a pre-existing wedge: when any
>      sub-command issued from hci_stop_discovery_sync() returns an
>      error, stop_discovery_complete() is invoked with err < 0. The
>      existing "if (!err) set_state(STOPPED)" tail then skips the reset
>      and the state machine sits in DISCOVERY_STOPPING forever.

Needs the Fixes tag since we might want to backport.

> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
> ---
>  net/bluetooth/mgmt.c | 86 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 74 insertions(+), 12 deletions(-)
>
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index 733a4b70e10c..25ad9c10740d 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -5975,15 +5975,38 @@ static void start_discovery_complete(struct hci_d=
ev *hdev, void *data, int err)
>
>         bt_dev_dbg(hdev, "err %d", err);
>
> -       if (err =3D=3D -ECANCELED || !mgmt_pending_valid(hdev, cmd))
> +       if (err < 0) {
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

Hmm, do we really need to do this if hdev lock is taken at
start_discovery_sync? Because that should then synchronize the
callback won't be able to change the state before it is set to
DISCOVERY_STARTING.

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

Ditto.

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
> +       if (err < 0) {
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

Ditto.

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

