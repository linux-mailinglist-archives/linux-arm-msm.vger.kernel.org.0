Return-Path: <linux-arm-msm+bounces-117357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q9ljFmscTWoNvQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 17:34:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EF871D539
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 17:34:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nJqcL8bI;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117357-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117357-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C271331A8713
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 15:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247FF3F1AC9;
	Tue,  7 Jul 2026 15:18:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C60B3E9C2F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 15:18:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783437486; cv=pass; b=Sb7wnW4JbiACPcx8ZDtjI95SaxcnIyn1/bz+/uBmhmzH9fm++M+oANyYRQdvbOGWbZz5Wvg44uNRJnAyvTys0Q3eqPL7Y8HcWJJBQkUvWkKS5dXVEzb45+HuhMg7z43A/WKeDrSgYXtFN5/9oZdUNqKhuLsVjI5jVXtZAOrlvZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783437486; c=relaxed/simple;
	bh=JrLe0+91RvH+iwQVMtiHQWSAzagGN6ayCbcuR3ZTX4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k52TSHlrDdITU+mZSAaOPcRSqQgrTUH1dEJfx245yOiBcc5n44GL2HzWDRLgjQtD4haIo9mhDsSCc2gqpOIvI097n0hql+XEWUlcCzmtHQ2a+kZO2iG7p5hEEeUTcr6ZUQ+afiXFL4G0Jfspmty9hgK/eLQ0GeZcgtkx7ycZLrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJqcL8bI; arc=pass smtp.client-ip=74.125.224.48
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-667923d86a7so661197d50.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783437483; cv=none;
        d=google.com; s=arc-20260327;
        b=DXgrT14H6c1Sd8/PE3BBQ2svYx1CowaPjxND/ZeoZnQm7E2HmAd0uCqJ0yu2u2j2Yz
         y6sW1tAmNhIdwnbSLRE+xlB191BXE6RBBt8B6MMIwa1vqy6JB26sxJ4d2xVuVi0xWWsd
         V3yFlD0QIAPLKGluN3WeEpiJ/bZZehuXbIQoAt3gJPoaESbmHpm+1ENoD63b59tP7Bao
         G3UDBB08CZzowZyuFrBaEqi81jtRuqBlDYksNup3CrwCM8dG1bM+CgHxVHT8jfd8mMau
         fPZ8ZHbRH4XShNpaC+bvyneGt3lwmRbKbe4FEV4HJi/5QzN6TqYYDuvH9lOLsmYbIp/X
         AE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ZaCl6zujV03WJXHYNWe6umkNXdAYNDCuyNyxaJxU8w=;
        fh=n5xnW0XBf2Jh4zl+CSOXIlZyO0tFiBfx/xAL5+hgF+g=;
        b=hoEIhLIksv+zbfYq13YP8csNrCOZX18QRDd48scKNM0WcDsDwWXZwQzacreeG27Fbj
         UxVKgh3n3q8eaIXmumjlag4jkZQmUHMh/jqoyPng1F4srbUAta3kmesdvjNGTdABkd66
         kPbO8XNmBvY1wfKvKf7NiqaBMt+4ky+KXLQHtLsIv+WFzYRRwNHL9TDuFkzg5x7T5AJh
         6gaVssFzcxjZYc9RJmWIdjBlN3Vnhh1SI7DzOuPp6a9SWw5tARvYrWIpkwLP6YAtQ9oN
         MB66zU1DgDBM1rLPKNnkBzFVTuJxpluJWU/6iHBVhfxD5BOS2X9A6tiymr9qBizU1ZBN
         USDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783437483; x=1784042283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZaCl6zujV03WJXHYNWe6umkNXdAYNDCuyNyxaJxU8w=;
        b=nJqcL8bIJ0M7vh+oqWEITYKKm9tnzIoUsMhUEkAoPiMeL11tw4heCm20hAt0GfN51O
         tcP3nA6RQxTQCay70HhZveUB/NSAmjaKBYqaWZE71B42641YmETFNNzao7P0QycXTFfl
         NpyhG9gwMGyK3MOK63hUA5dsc8RMsWEzzD37CnCHx88aKWNGKbq+j913y7iL3c8B/1fR
         H7Ge++wQRD89PWl2gHiDW9jKeaLJt/xndA+M3YuS47Js1eit9JY2AlaY9PlcQEJxgkpO
         23QhkW+rUe5aKZeVfEDcvKEd+giCKkaJX4XaAmGPbDLINWjLm8p5Ug+XUZjyVFK2smzL
         iyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783437483; x=1784042283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ZaCl6zujV03WJXHYNWe6umkNXdAYNDCuyNyxaJxU8w=;
        b=XdIgqEN9SUPQzqviDA9u9kZ9tpdboiyIXjxJzgByZrvbsQHKeF9eWG9MArRJpZVTav
         mH/5OIA24fdxzD8JTXI+gbsEgtr/6965iWqLTJ2sllINYpKCU/7jb9aWqMv+nOsERID/
         UZ5CvJAbUT/l3grFF9PqoJ31nNClv2hLNm0dVATxJLSmno3jvzSPSTXkHd9u1m/WvYYo
         29x/kB+bL2FAHPBo/y2bVGQNeAezJMFQxqCnN/x8L/IskjQ/2Ypau2YY4GUu3KaG/blP
         3bXH9MFDquXI0wuOnQCn0uR+bddqjf/4B9CmtztWJGz9JQRn+qc0r8FigNDL2pVCGNMu
         qA2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpXZqRD/rK3GGrf0ZbOS1WKOt50oJyxlV/8XC5nTN8HXURJL2Uq+Es6BiIkdWYTzF8K3JncvlQ3qRmLOfZo@vger.kernel.org
X-Gm-Message-State: AOJu0YwlFM4jP2Cr/XfgReASC8iiRWq+gGEXPEl6FoHC5MjbcMyS1Os9
	4vL6Ko8SEZtCLT8PS9toqMw/c5RhB/fKow3zEL1pBPTR/fQLZqW767844e94WBrQosH/0yb8I1L
	piT8sy1AaPf8Iw5xtJo9Xvz7ESxJak5o=
X-Gm-Gg: AfdE7cnBngfOZLc+uVkrJZU8WtnUE9G6D4OyySggEvyhDXWgeDoH2DoWoqZ7sro8KOI
	wPMmF4cCBGXGqHOmFvcFR9SUtO2jIlvk8wAMfWasLVLFkrGYhrb4gdKHW4obh/JqAa0aTwn3z7i
	n9u8tsqR2rtdTqabHK82aWjlwASLXBG6VzucR4iRVbmedz5gB6sfebZt4iHkdDVaLt26py4233J
	ng4Qd99jkso94MA1jxtD2CuPdrJskfrL/7EhdSlZDCGP1t3TpJwUhWAt/yfNDcVl+OkmkflCbYF
	nC8Y9PWPXOPAj5Le9xx79grE62ClumC8DiOk0V6+NjbkcGHuPiTqLFG5no4=
X-Received: by 2002:a05:690e:1656:b0:664:b335:ed44 with SMTP id
 956f58d0204a3-66788de159dmr1968703d50.18.1783437482930; Tue, 07 Jul 2026
 08:18:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707093426.372897-1-xiuzhuo.shang@oss.qualcomm.com> <CABBYNZ+X-+ZJYz-V-_QSP5kCJpJJaBiyO=wMHD+Ut+b=639t2Q@mail.gmail.com>
In-Reply-To: <CABBYNZ+X-+ZJYz-V-_QSP5kCJpJJaBiyO=wMHD+Ut+b=639t2Q@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 7 Jul 2026 11:17:51 -0400
X-Gm-Features: AVVi8Cc5pPMYKvZIKRc8IN7tJ5gFRaYxX6Ggp4Pn3O5zGAdkHnGgjzgDwEvFzQ4
Message-ID: <CABBYNZLXZaY7KiUneNMg7PrsTJjPF99hPY3sq5a2pL0RC9Z4tg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:xiuzhuo.shang@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117357-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5EF871D539

Hi Xiuzhuo,

On Tue, Jul 7, 2026 at 10:09=E2=80=AFAM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Xiuzhuo,
>
> On Tue, Jul 7, 2026 at 5:34=E2=80=AFAM Xiuzhuo Shang
> <xiuzhuo.shang@oss.qualcomm.com> wrote:
> >
> > start_discovery_internal(), start_service_discovery() and stop_discover=
y()
> > queue a cmd_sync work item and only then move the discovery state machi=
ne
> > into its transient value (DISCOVERY_STARTING / DISCOVERY_STOPPING):
> >   err =3D hci_cmd_sync_queue(hdev, ..._sync, cmd, ..._complete);
> >   if (err < 0) { ... }
> >   hci_discovery_set_state(hdev, DISCOVERY_STARTING /* or STOPPING */);
> > The matching completion callbacks run on hdev->req_workqueue serialised
> > by hci_req_sync_lock, which is independent of hdev->lock. So once the
> > work has been queued, the worker can be scheduled, run the sync functio=
n
> > and invoke the completion before the caller has executed the trailing
> > hci_discovery_set_state(). The completion's success path writes the
> > terminal state (DISCOVERY_STOPPED for stop, DISCOVERY_FINDING for start=
);
> > the caller then overwrites it with the transient value, and the state
> > machine is wedged: every subsequent Start (Service) Discovery is
> > rejected by the DISCOVERY_STOPPED gate with MGMT_STATUS_BUSY (0x0a),
> > with no HCI traffic generated, until bluetoothd or the adapter is
> > restarted.
> > Fix it in three parts:
> >   1. In all three call sites move hci_discovery_set_state(STARTING /
> >      STOPPING) to before hci_cmd_sync_queue(). The transient state is
> >      therefore always published before any worker can run the
> >      completion. On queue-submit failure, roll back to
> >      DISCOVERY_STOPPED.
> >   2. In start_discovery_complete() and stop_discovery_complete(), wrap
> >      the terminal hci_discovery_set_state() call with
> >      hci_dev_lock() / hci_dev_unlock(). These callbacks run without
> >      hdev->lock; serialising the state write matches the pattern used
> >      by mgmt_set_powered_complete() and removes any residual ordering
> >      hazard against a concurrent mgmt path holding hdev->lock.
> >   3. Generalise the "ignore -ECANCELED" early return in both completion
> >      callbacks to "on any err < 0, also reset the transient state to
> >      STOPPED". With (1) in place the state observed at completion time
> >      is always known.
> >      For the stop path this also fixes a pre-existing wedge: when any
> >      sub-command issued from hci_stop_discovery_sync() returns an
> >      error, stop_discovery_complete() is invoked with err < 0. The
> >      existing "if (!err) set_state(STOPPED)" tail then skips the reset
> >      and the state machine sits in DISCOVERY_STOPPING forever.
>
> Needs the Fixes tag since we might want to backport.
>
> > Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
> > ---
> >  net/bluetooth/mgmt.c | 86 +++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 74 insertions(+), 12 deletions(-)
> >
> > diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> > index 733a4b70e10c..25ad9c10740d 100644
> > --- a/net/bluetooth/mgmt.c
> > +++ b/net/bluetooth/mgmt.c
> > @@ -5975,15 +5975,38 @@ static void start_discovery_complete(struct hci=
_dev *hdev, void *data, int err)
> >
> >         bt_dev_dbg(hdev, "err %d", err);
> >
> > -       if (err =3D=3D -ECANCELED || !mgmt_pending_valid(hdev, cmd))
> > +       if (err < 0) {

Sashiko flags the above check as an issue because it tests only for
negative errors, not HCI (positive) errors:

https://sashiko.dev/#/patchset/20260707093426.372897-1-xiuzhuo.shang%40oss.=
qualcomm.com

> > +               /* The queued start-discovery work failed before the no=
rmal
> > +                * completion path could advance the state machine. The
> > +                * caller already moved the state to DISCOVERY_STARTING
> > +                * (under hdev->lock, before queueing). Reset it here s=
o the
> > +                * gate in start_discovery_internal()/start_service_dis=
covery()
> > +                * does not wedge in STARTING and reject every future S=
tart
> > +                * (Service) Discovery with MGMT_STATUS_BUSY.
> > +                */
> > +               hci_dev_lock(hdev);
> > +               if (hdev->discovery.state =3D=3D DISCOVERY_STARTING)
> > +                       hci_discovery_set_state(hdev, DISCOVERY_STOPPED=
);
> > +               hci_dev_unlock(hdev);
> > +
> > +               if (err =3D=3D -ECANCELED)
> > +                       return;
> > +       }
> > +
> > +       if (!mgmt_pending_valid(hdev, cmd))
> >                 return;
> >
> >         mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_sta=
tus(err),
> >                           cmd->param, 1);
> >         mgmt_pending_free(cmd);
> >
> > -       hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED:
> > +       /* Serialise discovery.state writes against any concurrent mgmt=
 path
> > +        * holding hdev->lock; this callback runs on req_workqueue with=
out it.
> > +        */
> > +       hci_dev_lock(hdev);
> > +       hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED :
> >                                 DISCOVERY_FINDING);
> > +       hci_dev_unlock(hdev);
> >  }
> >
> >  static int start_discovery_sync(struct hci_dev *hdev, void *data)
> > @@ -6051,15 +6074,23 @@ static int start_discovery_internal(struct sock=
 *sk, struct hci_dev *hdev,
> >                 goto failed;
> >         }
> >
> > +       /* Publish the transient state BEFORE queueing the work. The
> > +        * completion callback runs on hdev->req_workqueue serialised b=
y
> > +        * hci_req_sync_lock, which is independent of hdev->lock; setti=
ng
> > +        * the state after the queue allowed the worker to win the race
> > +        * and have its terminal STOPPED/FINDING write overwritten by t=
his
> > +        * trailing STARTING write, wedging discovery in STARTING.
> > +        */
> > +       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
>
> Hmm, do we really need to do this if hdev lock is taken at
> start_discovery_sync? Because that should then synchronize the
> callback won't be able to change the state before it is set to
> DISCOVERY_STARTING.
>
> >         err =3D hci_cmd_sync_queue(hdev, start_discovery_sync, cmd,
> >                                  start_discovery_complete);
> >         if (err < 0) {
> > +               hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
> >                 mgmt_pending_remove(cmd);
> >                 goto failed;
> >         }
> >
> > -       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
> > -
> >  failed:
> >         hci_dev_unlock(hdev);
> >         return err;
> > @@ -6178,15 +6209,19 @@ static int start_service_discovery(struct sock =
*sk, struct hci_dev *hdev,
> >                 }
> >         }
> >
> > +       /* Publish the transient state BEFORE queueing; see the comment=
 in
> > +        * start_discovery_internal() for the race details.
> > +        */
> > +       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
>
> Ditto.
>
> >         err =3D hci_cmd_sync_queue(hdev, start_discovery_sync, cmd,
> >                                  start_discovery_complete);
> >         if (err < 0) {
> > +               hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
> >                 mgmt_pending_remove(cmd);
> >                 goto failed;
> >         }
> >
> > -       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
> > -
> >  failed:
> >         hci_dev_unlock(hdev);
> >         return err;
> > @@ -6196,17 +6231,40 @@ static void stop_discovery_complete(struct hci_=
dev *hdev, void *data, int err)
> >  {
> >         struct mgmt_pending_cmd *cmd =3D data;
> >
> > -       if (err =3D=3D -ECANCELED || !mgmt_pending_valid(hdev, cmd))
> > -               return;
> > -
> >         bt_dev_dbg(hdev, "err %d", err);
> >
> > +       if (err < 0) {
> > +               /* The queued stop-discovery work failed before the nor=
mal
> > +                * completion path could advance the state machine. The
> > +                * caller already moved the state to DISCOVERY_STOPPING
> > +                * (under hdev->lock, before queueing). Reset it here s=
o
> > +                * the gate does not wedge in STOPPING.
> > +                */
> > +               hci_dev_lock(hdev);
> > +               if (hdev->discovery.state =3D=3D DISCOVERY_STOPPING)
> > +                       hci_discovery_set_state(hdev, DISCOVERY_STOPPED=
);
> > +               hci_dev_unlock(hdev);
> > +
> > +               if (err =3D=3D -ECANCELED)
> > +                       return;
> > +       }
> > +
> > +       if (!mgmt_pending_valid(hdev, cmd))
> > +               return;
> > +
> >         mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_sta=
tus(err),
> >                           cmd->param, 1);
> >         mgmt_pending_free(cmd);
> >
> > -       if (!err)
> > +       if (!err) {
> > +               /* Serialise discovery.state writes against any concurr=
ent
> > +                * mgmt path holding hdev->lock; this callback runs on
> > +                * req_workqueue without it.
> > +                */
> > +               hci_dev_lock(hdev);
> >                 hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
> > +               hci_dev_unlock(hdev);
> > +       }
> >  }
> >
> >  static int stop_discovery_sync(struct hci_dev *hdev, void *data)
> > @@ -6248,15 +6306,19 @@ static int stop_discovery(struct sock *sk, stru=
ct hci_dev *hdev, void *data,
> >                 goto unlock;
> >         }
> >
> > +       /* Publish the transient state BEFORE queueing; see the comment=
 in
> > +        * start_discovery_internal() for the race details.
> > +        */
> > +       hci_discovery_set_state(hdev, DISCOVERY_STOPPING);
>
> Ditto.
>
> >         err =3D hci_cmd_sync_queue(hdev, stop_discovery_sync, cmd,
> >                                  stop_discovery_complete);
> >         if (err < 0) {
> > +               hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
> >                 mgmt_pending_remove(cmd);
> >                 goto unlock;
> >         }
> >
> > -       hci_discovery_set_state(hdev, DISCOVERY_STOPPING);
> > -
> >  unlock:
> >         hci_dev_unlock(hdev);
> >         return err;
> > --
> > 2.43.0
> >
>
>
> --
> Luiz Augusto von Dentz



--=20
Luiz Augusto von Dentz

