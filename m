Return-Path: <linux-arm-msm+bounces-102713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8J1BCB422WkjnggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 19:40:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2673DB23F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 19:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23CA1300A764
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 17:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0DB3DC4DF;
	Fri, 10 Apr 2026 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyk6oZWb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CB039EF0B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 17:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775842843; cv=pass; b=fKWL68jykLDe+NDAJDtsUVYG7KPFamEmKkNHAVZ2DiXMeODA+FZCNxhb+2aRCrC8EL/bjC/8VKFgFCgVS1Q/+2XxqFWrx2oBjW59rYysuCxjM1xZTPh+olBeMBnxWCLTTfFY/evXvgCXZi1+UhDaYuGOeIJZEVx8DZf7VCm+PeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775842843; c=relaxed/simple;
	bh=EB+hFHu4o8mR5IB8DxbDE45H1JTJFvQueNfIGjdGdOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HtX6Q5S5yYg3DJECfy4TPp2EaPOtSLFNLmvuPkp0b1qc7Jwmn3UzxIoZXNMtHMuLLo819KLVF3Wmm1HqOh1hp6J50tthTujDN5pRDxY93dFlEtKLfzrnkQ0Tw6KJtAo0eV3jNSluFmO8P+0uUPoeS7Egc/SOX9ItJTgKkEYtlDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyk6oZWb; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9c62fc8debso370596966b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775842840; cv=none;
        d=google.com; s=arc-20240605;
        b=UOzB9bhpuyrMx4W17qGYBpgSOwXlgeaQP1nPwXEreBZVSH9fCJKDJwvLMs3CcvOCau
         q/Nh+/4iO/uQx+6NUdr4x3Iu8UkQTprptWUZZV7hvktTNjpkVUMWMcHcvflGmOVFWhXu
         dkmVmntwZjyXphRBnC7MXVp79W1kpDVqbiycBJDrmTPtbgSeWO6ePqk0WN5VWZGDinCu
         A/BowUJm8pY6U7fmJXC1mg87eBKabVf+04g9OVJs0VYboECddX7NfCnyczY5ZBUVd+1h
         YdlGe+yO2fS+Ir8dvJu+ew63K31ujsPUkBawWhMSjO2xri8RiK24FrMiMCXYZ0QYIoLu
         LG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dN6OHHDaiTfVdHomxkKXHWudndDr0TAk+XE4EiflmuI=;
        fh=qfpLNkYiny6oIclnUJzHZQm6ukxGrtZQyPrsjjYY5ps=;
        b=RLMZX7xVvuODhhzHI+XWwiPwfBb42OScFabhbA2GPHflsRDglOz5I96mOQVtw90N0d
         dU//CUr3wck12ZGWjZtA+Ot7V90kJzA1gjsq+LkKtYswiEHMZa9Y1aUOvv+JnAV5p1qd
         Qg+qGvh8T7BFgAvIWOUWx1KO2L6qjXNfIklheNKWcev1B5XPlX/Z2mnTNFrF1/hRiYqL
         h1vGw+PS6/v7zI6SKToXVJuZJpU147/fxuy8/zOaIUAP2bT0Ux4ud0ygHTLPyBj6jP4e
         5qvTJXZ+4lM66W8CGrRZ0zKuR2C1tD0YGBM46FOmAojhbCzOO1Yo7Ir/Ifj/e9azq7IU
         W0DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775842840; x=1776447640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dN6OHHDaiTfVdHomxkKXHWudndDr0TAk+XE4EiflmuI=;
        b=lyk6oZWbtyGzOzCJkXEAP+xRBcdymw/pLvvCJvJCkU076Bx9aby2Y6xsh3bnqZsWdP
         FEfqCc4EcgjSGvTFRGZgY1OuzCBwW2Zpu5lcGAlGo9Yq+VKlg6sxcScmOu+WXE0jnVra
         SoJRwKT8uPs3o7TEFsrc8p4gHacUnivZJYwBbsCQ6sb/97VK6ENzOBZvNfVeOB1O/8Jw
         eCNiFrjWTi4hNZU65mX6G0HZANqtmIs8yZ74RpajXgIvxGLvMLIai71hFUZk0Lx6nkbe
         zuLHBYOfq+me42TGxV/+nnjuxD5Gj45TCtqVGe7vMxC0APC5lPPB7FdTJjjxEPic/V44
         yxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775842840; x=1776447640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dN6OHHDaiTfVdHomxkKXHWudndDr0TAk+XE4EiflmuI=;
        b=MYFMT6sGV0xGMrL3jG7oDMjzRGv7+iuxkYNE8QDCUaJui/wfSA4upVDVF67cv6ccBt
         1zhkumppxRSsn35fkbuYU/aDhMEql1M21OpcXfeug8Z8GHxMgyU7tsplFXGyiYt2du3m
         kvB9bKD6PO2T30TWTvi7b8deRr6rk4kcOj34RdgdWCvy3He3+E6nU/noPKJ70dAbNMlJ
         bXrOPPQAmDjouNpXn5SpmN5usmDkbaeDsQCSr6GxNVrofvoZcuNGQN4x8gxYKhzZ/UZK
         0en7H/zHMfRA9mA9kSQwItggeSp6ftUXPVftPVC2QWbuLfgrgadcXld105SUNwLIfi5m
         /lbw==
X-Gm-Message-State: AOJu0YyZNnEGRrmBk4SWetPK3eJs1lPhAfllJb/tEktdTI4Yeugz4it/
	fNoFtDaIdKHY/6DXM62cNK4Q864uEOPt4IJNlYJVGSdsLixR7KBVpOqjSLwGfuTzCHg3vs096oV
	vAEYg7fr/4YEyAUgqirzTa3bPnYgT0n0=
X-Gm-Gg: AeBDievh98iKY2uUg9Ynu7+Mi95fjlJfpy3b6/qSxSfmiYe3onAWsqmQk2ikcTeNTXO
	hIbyqkPIP/THIckhjPrnlHDC22hmYO+9FjI+lL3fXqLwwaW4iVLbJgkUWOKec8pOKl7wG59qbIv
	Z/ZFXHYYtuyBFFrb2DYuWil0KrWrVkVE4T9u/0HUYXuqi6bP3jTgJYH/jYQ6yk2YEdwDcaAluGR
	66ruwBUJon905DlCePdhh1h6AjpA2cyrD6TcP+rcHqOb3JOkwsI+dG/LSQabaigiKQojEQpT4K+
	aKoVyKBLb3QZ37cfmNAtw+fMDaKzyi2y90FV3AP1UeIN7fhcnha04TvZIM78JRbn9s/oPMD+80N
	v9AESMei5sbf9z9yf
X-Received: by 2002:a17:906:eece:b0:b9c:350b:f849 with SMTP id
 a640c23a62f3a-b9d7297e205mr254084166b.24.1775842840105; Fri, 10 Apr 2026
 10:40:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401220643.12802-1-rosenp@gmail.com> <b772c81c-3628-45c5-ab11-a0737a94b812@oss.qualcomm.com>
In-Reply-To: <b772c81c-3628-45c5-ab11-a0737a94b812@oss.qualcomm.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 10 Apr 2026 10:40:28 -0700
X-Gm-Features: AQROBzAGbFQNHO1NpZGhgy_hzsDylIa-uvfdzOOR1DS2GBgDZwb6wKvs4Zz0Xlg
Message-ID: <CAKxU2N96X31nsB-Vyt-Sm1rQMTo8cuZG+UDN=37av8c_5n-EcQ@mail.gmail.com>
Subject: Re: [PATCHv2] accel/qaic: kcalloc + kzalloc to kzalloc
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, 
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:QUALCOMM CLOUD AI (QAIC) DRIVER" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102713-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 6D2673DB23F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 10:01=E2=80=AFAM Jeff Hugo <jeff.hugo@oss.qualcomm.=
com> wrote:
>
> For future reference, $SUBJECT should have a space between "PATCH" and
> the version. git format-patch will do it correctly for you if you use
> the -v option.
>
> On 4/1/2026 4:06 PM, Rosen Penev wrote:
> > Consolidate the two-element allocation into a single allocation using a
> > flexible array member. This reduces memory fragmentation and simplifies
> > the error path by eliminating the need to check for allocation failure
> > between the two allocations.
> >
> > Add __counted_by for runtime bounds checking.
>
> This reword addresses my "why" comment on v1.  However I don't see that
> you responded to my question about how this was validated. I don't
> require a v3 of this patch, nor do I really want one. I want you to
> reply to this message and detail what validation you performed on this
> patch.
None. This is a straightforward conversion to a flexible array member
(and future devm_kzalloc_flex).
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   v2: use macro for number of elements. reword commit message.
>
> Also for future reference, a blank line to separate the change log from
> the patch diff here makes the change log easier to find and read.
>
> >   drivers/accel/qaic/qaic.h     | 4 ++--
> >   drivers/accel/qaic/qaic_drv.c | 8 +++-----
> >   2 files changed, 5 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> > index fa7a8155658c..e237020f6aa9 100644
> > --- a/drivers/accel/qaic/qaic.h
> > +++ b/drivers/accel/qaic/qaic.h
> > @@ -152,8 +152,6 @@ struct qaic_device {
> >       struct list_head        cntl_xfer_list;
> >       /* Synchronizes MHI control device transactions and its xfer list=
 */
> >       struct mutex            cntl_mutex;
> > -     /* Array of DBC struct of this device */
> > -     struct dma_bridge_chan  *dbc;
> >       /* Work queue for tasks related to MHI control device */
> >       struct workqueue_struct *cntl_wq;
> >       /* Synchronizes all the users of device during cleanup */
> > @@ -206,6 +204,8 @@ struct qaic_device {
> >       void                    *ssr_mhi_buf;
> >       /* DBC which is under SSR. Sentinel U32_MAX would mean that no SS=
R in progress */
> >       u32                     ssr_dbc;
> > +     /* Array of DBC struct of this device */
> > +     struct dma_bridge_chan  dbc[] __counted_by(num_dbc);
> >   };
> >
> >   struct qaic_drm_device {
> > diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_dr=
v.c
> > index 63fb8c7b4abc..1dda8dfea5a4 100644
> > --- a/drivers/accel/qaic/qaic_drv.c
> > +++ b/drivers/accel/qaic/qaic_drv.c
> > @@ -43,6 +43,7 @@ MODULE_IMPORT_NS("DMA_BUF");
> >   #define QAIC_DESC                   "Qualcomm Cloud AI Accelerators"
> >   #define CNTL_MAJOR                  5
> >   #define CNTL_MINOR                  0
> > +#define DBC_NUM                              16
> >
> >   struct qaic_device_config {
> >       /* Indicates the AIC family the device belongs to */
> > @@ -405,15 +406,12 @@ static struct qaic_device *create_qdev(struct pci=
_dev *pdev,
> >       struct drm_device *drm;
> >       int i, ret;
> >
> > -     qdev =3D devm_kzalloc(dev, sizeof(*qdev), GFP_KERNEL);
> > +     qdev =3D devm_kzalloc(dev, struct_size(qdev, dbc, DBC_NUM), GFP_K=
ERNEL);
> >       if (!qdev)
> >               return NULL;
> >
> > +     qdev->num_dbc =3D DBC_NUM;
> >       qdev->dev_state =3D QAIC_OFFLINE;
> > -     qdev->num_dbc =3D 16;
> > -     qdev->dbc =3D devm_kcalloc(dev, qdev->num_dbc, sizeof(*qdev->dbc)=
, GFP_KERNEL);
> > -     if (!qdev->dbc)
> > -             return NULL;
> >
> >       qddev =3D devm_drm_dev_alloc(&pdev->dev, &qaic_accel_driver, stru=
ct qaic_drm_device, drm);
> >       if (IS_ERR(qddev))
> > --
> > 2.53.0
> >
>

