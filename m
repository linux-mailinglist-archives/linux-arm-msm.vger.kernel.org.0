Return-Path: <linux-arm-msm+bounces-113146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BhYEMUnKL2qvGQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:47:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77E6852B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:47:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UhC+qQcL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113146-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113146-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2036E3034579
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04B03DB63F;
	Mon, 15 Jun 2026 09:46:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BDF3C37A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:45:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516761; cv=pass; b=mliBGHBo8oE94woOB+J2zaH4vkOv57e5+mZTh+XZCt5k9mpxBCNRIPGpTnPskpvVnG7ELW0X9UY7AingLg8+aQuYLQSlsrrRQeLsGv3jKsmdx1YuBzfj77ROIgFfL3L8ErBMJD4vhC6ALrvrrc+AIE7UMU+paKN9sT4WM4VtjS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516761; c=relaxed/simple;
	bh=+0PpjdZOtlZVdHY09clHhkAlxOivu8V467n0BMiBkJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWR50ejZCOS55NWtfqHyRqoWBmfYbSScbhD4yaQeXBX5JmmhH0WHkv33copzxs6BIRci6gAqfU9KXBORbBLZ+VFJ1odTESmLdMSLZU3Q/4l+lIVxuKFoO83XFr5CcfabCAMhv3W2NwuNt7tS1D8CKYfMqMYw5Mgbquy/RuU1vTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhC+qQcL; arc=pass smtp.client-ip=209.85.221.169
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59eb57ed4cbso1133184e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 02:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781516758; cv=none;
        d=google.com; s=arc-20240605;
        b=Qh4e9++56Y/JYwnqS1T3n9KPNpdhX2mgSxmC2rje9MVRVFW2lxhMSLbcQMzcO0fmNs
         TYe2Hb4so/ZFGxcytPiW4XeggKWR4tINXS2mY/tVNjkn0MMpiWp9DP2Nnm3fGCL0YLO+
         YVunxHzxY9klb6ZJ+6Rnfk5pfPq49qpSKFYjR8NhOWofFKFd4y3m7EDMEyAicnA+U3OT
         dS5nHLcJaiE2fJZieZRNIGBdAKE0M4Uc5SUM1E/lKTnQ2HI7uoYNRMIrc+EpecMmBLgz
         pGoYjyCHHwnoFYmzZvfq7LMyhToaWXVP/fxoWz7hcnxGxouB5uKR3jIUSvE+jj2WKZ1c
         5qKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nYEPbdWhREgm72MPD718fjlljpJlC4uJ1ZbrV25kB0g=;
        fh=gH6TjShctf8JpfkJMWc5M3CmMkb/auscIxykcnh0klY=;
        b=SyIqZh4m0VZ9oi1kQGhTK6q4N1RqXmN1ZvW0i63j7vB1/jQpVTZqq/cLG28uAavVpd
         D4Qnl9zGpOwPKR/djc9VHcG9o+WaIN9t5iDycbKFpFefWm4PPrdeikYdV/IcPttDDdI2
         DG4pNHwrvmfu05lyRVcgQi/o3H2UPkEDOniPS6lAlIvZklLn64oHa+FqrpQ+C2AShzjf
         Ih7RglK1h5zUe2otts5TRbR38I6L7DAOJN8Ifbt+/tyyYd45a/fGsFw2T4YmF6+APg3y
         1sjnUqF4uzoegQOCPaUuncKOFQdz6l63YuKzpcxjD2WdNw8WAZqYPG8xFklEbJVjbXDR
         ZjbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516758; x=1782121558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYEPbdWhREgm72MPD718fjlljpJlC4uJ1ZbrV25kB0g=;
        b=UhC+qQcLvH1X+Q2fpETrQa2DKBBtEGi33ijiEnb9QoFlWbeCr3jglJXkw9NzAqaP2r
         8UCq7/ImMn/a4nicNOfS76K5M5VzL2Zwfu8ITQ5OsnzK+8vcMLTrx6JT18tr+2TTz/j9
         9lodcVl/FX44HlYSy3X5uX+kLvbZRScjsHWke4jGdaxMBl4MgUWSxijcNW3O5z7+nvMQ
         PUmp0JTzPMzA0m0UfaQ8LyIXqYyUnQlKZiUWCfXOtTVJq8oAwvtTDZ6zpJJDdkQCsP/I
         7J5U3TKftmRjkuNjHUjpQl5dxdVRf6Gt8leIFoWtI6gk284cHOJY0ykUEgMmLsw/ycWE
         1v4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516758; x=1782121558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nYEPbdWhREgm72MPD718fjlljpJlC4uJ1ZbrV25kB0g=;
        b=plvkc2O3ac83+PB7Vq2CM2i+bQZIw7eErvCA++3XPMjj86KCAi1djLP1pjoIPml2pO
         TN9zpb0r8Glwh69YELYSEhTFV1BRQAN4+A3MPi5FC0JXoZOyWDD4TcVjNYcvMTCzo+oe
         N2GTjqzSCCiEdCFqRa/JZcx9IA3q1gtXIDj8LAWcKtKjI3hOgiq+UuJ+RLE4Wb1HauT4
         uuivSf/WeFnGczwJmN/cdoZgyd5g55Hnm4mcqAK4lHPvw9FWhDId8dtIZy4IEyhfKlsN
         vCJsBkpGeKWk+p8Bl8d+cl3NRdTkLbWsJobeBsJ2qiLnQlkSmNGSFCO2hfxXNeVOI5Ir
         Cfxg==
X-Forwarded-Encrypted: i=1; AFNElJ/9ELuxM4fluvJvMh5yVtmxhHBVfz0wNsSRGEGg83BWXW51L/GfE/2fPYxhEVUzx56NsAusyl6Q/tTMCYAW@vger.kernel.org
X-Gm-Message-State: AOJu0YyaUmamakKSLBZik5yvwTRVbClMGWjPN2WfDzoyae1rbb1JDVPA
	2hUn288VHtPNHWm57CxVgi/z06AgsY0BOiVxTEHEW3VhnQ+x/YNwEWvR5jDA7c3CEa2aAzauZzz
	ZMitTpzuVJSnxME+OjU4/GDC7f0dAp8E=
X-Gm-Gg: Acq92OE4In9mdtQop5Z6qmyMKzNd6VLO74hyonVNxCBlmRXCExCxTPlnj8dVPvkInD2
	J/7slEiu10CI4jkHCkyBrr3bgJWq9OqfeSY8iSMo5nKRLcQAbB1tEpkRORD1yIAXW29WZIjRx5O
	SFRtkd+y5FECKdmrSx32jsydJlcGhz9pUhwKm21/nMn6+peWF7xubPd9qpcs4Jzw/r7zU4kVGTZ
	+/hYSIUS6bU+S3GTAxiwxSfGfe3UKg4lpoiKjV0MbNrX0Vcw+EyZusyecXyPYRcHQKtFGKtWFYf
	a1QeBzQD
X-Received: by 2002:a05:6102:5707:b0:6cf:37fe:2cb with SMTP id
 ada2fe7eead31-71e88e0816dmr6614649137.27.1781516758273; Mon, 15 Jun 2026
 02:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603011333.3306102-1-qingtao.cao.au@gmail.com>
 <20260603011333.3306102-2-qingtao.cao.au@gmail.com> <0d3e4046-42d5-4f91-be85-8681215e84b4@oss.qualcomm.com>
 <CAPcThSE7wY7Zm=H5npSdCqnEFv0VEMP=3x8UkyJqwfqyEscBsg@mail.gmail.com> <cadb7c5d-d856-4217-9c02-98ba37713897@oss.qualcomm.com>
In-Reply-To: <cadb7c5d-d856-4217-9c02-98ba37713897@oss.qualcomm.com>
From: Qingtao Cao <qingtao.cao.au@gmail.com>
Date: Mon, 15 Jun 2026 19:45:46 +1000
X-Gm-Features: AVVi8CckJ1lCxpYrUd1VTz8eVNyssy9HrHtsI7IzkAAEjS2Kc7y0CraAYBtWLfI
Message-ID: <CAPcThSFP6RkBhXt_GVpSbRKzFmb9hzMYPY8R-tjv-iYhZVThnA@mail.gmail.com>
Subject: Re: [v1 PATCH 1/1] bus: mhi: core: fix sys error handling latency
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: mani@kernel.org, kees@kernel.org, linux-arm-msm@vger.kernel.org, 
	mhi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Vivek Pernamitta <quic_vpernami@quicinc.com>, Qingtao Cao <qcao@digi.com>
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
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-113146-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:mani@kernel.org,m:kees@kernel.org,m:linux-arm-msm@vger.kernel.org,m:mhi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:quic_vpernami@quicinc.com,m:qcao@digi.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[qingtaocaoau@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingtaocaoau@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D77E6852B0

Yes indeed, this is exactly what the original commit,
44b1eba44dc537edf076f131f1eeee7544d0e04f, by Loic Poulain on 2021 Jun
21 was about:

    On graceful power-down/disable transition, when an MHI reset is
    performed, the MHI device loses its context, including interrupt
    configuration. However, the current implementation is waiting for
    event(irq) driven state change to confirm reset has been completed,
    which never happens, and causes reset timeout, leading to unexpected
    high latency of the mhi_power_down procedure (up to 45 seconds).

    Fix that by moving to the recently introduced poll_reg_field method,
    waiting for the reset bit to be cleared, in the same way as the
    power_on procedure.

Thanks,
Qingtao

On Mon, Jun 15, 2026 at 2:07=E2=80=AFPM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
>
>
> On 6/11/2026 4:29 AM, Qingtao Cao wrote:
> > Hello Krishna,
> >
> > Thanks for your reply!
> >
> > I am using an old 5.17.0 kernel and Sierra Wireless EM9291, the MHI
> > pci_generic.c driver was modified a bit to support it,
> > which is very similar to EM919x and the modem_sierra_em919x_config
> > descriptor was reused for it (thus the timeout_ms
> > =3D 24000ms, or 24s applies)
> >
> > Without the proposed change, the AT!RESET handling will finish after
> > timeout in 24 seconds, whereas with the change,
> > the handling can finish in about 11 seconds
> >
> > I was inspired by another earlier commit to fix MHI_STATE_RESET handlin=
g in
> > mhi_pm_disable_transition().
> >
> > Warm regards,
> > Qingtao
>
> Looks like device is clearing reset state, but we are not getting any msi
> to trigger mhi state event. As MSI is not expected to send msi from the
> device after clearing MHI RESET.
>
> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>
> - Krishna Chaitanya.
>
> > On Wed, Jun 10, 2026 at 10:40=E2=80=AFPM Krishna Chaitanya Chundru <
> > krishna.chundru@oss.qualcomm.com> wrote:
> >
> >>
> >> On 6/3/2026 6:36 AM, Qingtao Cao wrote:
> >>> Bring forward the idea to fix the power down latency in
> >>> mhi_pm_disable_transition() further to mhi_pm_sys_error_transition()
> >>> so that the transition into system error (triggered by AT!RESET)
> >>> won't have to return only after the timeout of up to 24 seconds
> >> Hi,
> >>
> >> Generally we should not see this delay, as device is actually clearing
> >> reset. can you give more details what is the device you are using and
> >> kernel you
> >> are using etc.
> >>
> >> - Krishna Chaitanya.
> >>> Signed-off-by: Qingtao Cao <qingtao.cao.au@gmail.com>
> >>> ---
> >>>  drivers/bus/mhi/host/pm.c | 14 +++-----------
> >>>  1 file changed, 3 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> >>> index f799503c8f36..9d29f1591a45 100644
> >>> --- a/drivers/bus/mhi/host/pm.c
> >>> +++ b/drivers/bus/mhi/host/pm.c
> >>> @@ -651,21 +651,13 @@ static void mhi_pm_sys_error_transition(struct
> >> mhi_controller *mhi_cntrl)
> >>>       /* Trigger MHI RESET so that the device will not access host
> >> memory */
> >>>       if (reset_device) {
> >>> -             u32 in_reset =3D -1;
> >>> -             unsigned long timeout =3D
> >> msecs_to_jiffies(mhi_cntrl->timeout_ms);
> >>> -
> >>>               dev_dbg(dev, "Triggering MHI Reset in device\n");
> >>>               mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
> >>>
> >>>               /* Wait for the reset bit to be cleared by the device *=
/
> >>> -             ret =3D wait_event_timeout(mhi_cntrl->state_event,
> >>> -                                      mhi_read_reg_field(mhi_cntrl,
> >>> -
> >>  mhi_cntrl->regs,
> >>> -                                                         MHICTRL,
> >>> -
> >>  MHICTRL_RESET_MASK,
> >>> -                                                         &in_reset) =
||
> >>> -                                     !in_reset, timeout);
> >>> -             if (!ret || in_reset) {
> >>> +             ret =3D mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs,
> >> MHICTRL,
> >>> +                              MHICTRL_RESET_MASK, 0, 25000,
> >> mhi_cntrl->timeout_ms);
> >>> +             if (ret) {
> >>>                       dev_err(dev, "Device failed to exit MHI Reset
> >> state\n");
> >>>                       write_lock_irq(&mhi_cntrl->pm_lock);
> >>>                       cur_state =3D mhi_tryset_pm_state(mhi_cntrl,
> >>
>

