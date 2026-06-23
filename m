Return-Path: <linux-arm-msm+bounces-114234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vQySFDejOmpnCQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:16:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D4A6B83CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:16:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="M/o2AN2H";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114234-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114234-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D497A305BF3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81543D8900;
	Tue, 23 Jun 2026 15:15:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885573D6491
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 15:15:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782227755; cv=pass; b=MVaMKz+JtizmftNUFfrpXhhrFGHwAlPrUeFJ5RKKdwh4LOjx3flO6iLDudEp5BTKj6XFcA8SR937oWwnb5qzwl93KTSoXdNktQvx/5VMU1uoPE3RUZaXqRre9cIp+GOspPeM2NCmuWYjDgEUFTHehdspwZQEDNXc6hGdYShHHGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782227755; c=relaxed/simple;
	bh=9FHNVmWcJBcG98C8NkFiK/TrxJ6VxfRitXrENJYTlIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UO2GwxqXKW6hP1RFZ81N4V0ahL6gbMrX3NKNk8OPyRPTOf9VOjN2tTdupj5Jo/fQn7iLKERUczEgtLaFKhDjD7i9hPaf5zH51PBrt9YGeqGijRIOFTNRr3swpUelDxKxa9t5FWKGWAJ0Ws/Og2u+ZXiQ/mT6lEZNklhBiKWCBQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/o2AN2H; arc=pass smtp.client-ip=74.125.224.46
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-662b95934dcso6150257d50.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782227752; cv=none;
        d=google.com; s=arc-20240605;
        b=MbrZU1chl1BBMeQqFjbVuTAA5iiBcVwJDe/lJPs3x0Yr+p3FEUbV4IHxkZRQ2EAkXl
         mbQS9RWSPV029wYMs10Cz4LiaZPNkTXT4i24VlqO+YsB+BYcA4YPNdO+eQRdZUARi7Ds
         13GPjDQHQsYvvMUts8n22llkhad9s6JviUSEchc3M9SpMwUh0zg7zTrIeM0yOE32nv1H
         Y6ZogHWhtSqTEXDAScpYQSdaa3flF/S0NUk+O4HQ1E9AiSBPJD1VWHXydMGBBXtCaXzJ
         fRR093c+OIu33lYq/M/Vm5duJRKT+6WsLP7YW8EvqAIHiK6uAOuQ1ndmNIrocgikF+X4
         bttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CXverWsEjFyfFL+7lJTDmK4Q98NaeiAYyXjXANHv5oI=;
        fh=jP43lrRg7gguafbUEkDh8j6S4iZcPqlY/ERnrw+inH4=;
        b=YXZeY1TcAVP12O/PJLCPSPcy6F6QmJL0aRleG/ianoEOPv2qDuJtZOPdjqELPN82Yy
         wPPta8mDcUnCLf8ed24pOC62gnFzQirdcnn2tGTkebIDEQ/vnxjv3auskl34IhECBWUK
         214SuF8OgX2YY1/w00iXTcgA8ciGVpVEXGErFIlE1V654bhr4fjnMI6Dgy/TSH4P/CVP
         SuA1gdEDh/1CM4VFM8u7Cc8TxGcp19/PvB04bLnY6JBgGB3Gl4NJpw7n5MjPq79K7w8n
         TtZcpAthaeggUvBm4qXNnfAG2/KEqLMu03RLDllLJ8CxfdA9DHDyzFJChvI7uvfvlcj0
         u+pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782227752; x=1782832552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXverWsEjFyfFL+7lJTDmK4Q98NaeiAYyXjXANHv5oI=;
        b=M/o2AN2HGaSflj57EugfluUQ6dnsrt8ZbMkq/JFCBDYw5B57L29isU+LVNBCvJE8zf
         SElTZECdEhPfbxfyjSCvrlIVXtBfk+4uc42JPCDBaR0u7j8diShUFVrugAHcPCwmODKs
         Lfh57IUlG4Nv2OGg22NHJ/WFYrM8/TY5BHiICB3Velu9Fzs5b9+LAZAXuyHZqPP764F6
         eVmN6B06ZjfigevAwNB6IJsb5+l89uRaZbZ/4RbUpJ+yTYdKM4kDi0ESJABz7bntoi44
         R23/2AUHGPp5eQirmSc+S+hSfKzuRIpUcfYoycN0xxCkCFS7p8yRymELxOwf9bRg8LCx
         XmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782227752; x=1782832552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CXverWsEjFyfFL+7lJTDmK4Q98NaeiAYyXjXANHv5oI=;
        b=aHItqSxU8DKvFx0V8SYfkRGhVAd8MHc58eJ0TkAB/UNaZLDcxbEHqAfgHD4VmamWO1
         rJqG5C6d3xcn1lkiiZDOi3TS8uP6tqqpdZOJMDofHJl9oKTC0jYL0FL1kdiutpkzAReH
         62nyebVY4nvWxmWGST40WIfCg8FPOayYWvvk2Nr/flvihHkXZMBsPYUjn9qLffNa/gVR
         zIXLLxuyrjNvQLPmNWguEK9azHOznM+X/z7VVaP9WSJatPavXQN/U3ah72Ia5lt2dEri
         SMaOfcTtSwG1gmW3Bi5Vo+M0cLn8k2mlHhHfxgm5tT49S2MUqKPhXiJ9HuCCEIb31vdJ
         lULQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2sNQSAii0yiL527i07G2Ppq1kngEz4ipNyNn7+0KiOH0QZT3aELQotVwzJDG18/5kVchJfcTT4riHXaE6@vger.kernel.org
X-Gm-Message-State: AOJu0YwQZe021EFHa2naITwm3JXF6QJtocKpcIeTW52M9pCg1Ai6GV4q
	piUvxJ40F20F1EzEIsxo53qiUaf/1lRGFR6EeWefsjyDjiVhgx8JmINNXRyawA4zbHonsYiBcmz
	Ha4GKQfq2LmoqWAv6zs+ormcr8rGe6Sw=
X-Gm-Gg: AfdE7cnsIMVECIG5TDi6jWc5PN2Fr0IX2aLwj+H9XiIRz0SMol9/lSEQ8jRZ9M7Ce4q
	P5Fie/fQdWAG0eDwvz3brhT/lD7NlhjoXyA1hfOiD3bluDvarLfzdIl4FVXdaS1fvTtUJu0tOvh
	InRHOccZTHgN5bktFUay5SGleD6YYgjaVaq+e0GIqjh9W9Qjww3Yj0cDoCNlEoQSMn30CkLTgA0
	UHSAYQwhZrIsRvVhTZ5ou+21Xb9OSbH+btV5fmMHpS/OrcF2JVO28PWwE/y2WdEE5xYSGCS5nUF
	Xbmj+2jU3AFRUHthf4YUCthbBdT4OiX2JBxZu83x09xCLCklR1sFcd9GJgtiCPCGWtqPyw==
X-Received: by 2002:a05:690e:1685:b0:661:1669:b784 with SMTP id
 956f58d0204a3-66359e1b367mr2989515d50.10.1782227752366; Tue, 23 Jun 2026
 08:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com> <20260622-bt_bugfix-v1-12-11f936d84e72@oss.qualcomm.com>
In-Reply-To: <20260622-bt_bugfix-v1-12-11f936d84e72@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 23 Jun 2026 11:15:40 -0400
X-Gm-Features: AVVi8CdjPC23MT8XtfsB0gA2x6V-ssAXhEUBUmsu09uEhc_AAYJZ5Stoac-Nuzg
Message-ID: <CABBYNZKx3+08Ajisy7-sHi0TZJNrbgzBzdszcKfiZUiNOdhByA@mail.gmail.com>
Subject: Re: [PATCH 12/13] Bluetooth: btqca: Fix undetected error HCI status
 in qca_send_reset()
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Ben Young Tae Kim <ytkim@qca.qualcomm.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Matthias Kaehlcke <mka@chromium.org>, 
	Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114234-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zijun.hu@oss.qualcomm.com,m:marcel@holtmann.org,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[holtmann.org,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org,icloud.com,vger.kernel.org,intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4D4A6B83CC

Hi Zijun,

On Mon, Jun 22, 2026 at 10:52=E2=80=AFAM Zijun Hu <zijun.hu@oss.qualcomm.co=
m> wrote:
>
> qca_send_reset() uses __hci_cmd_sync() which returns an skb but never
> reads the HCI status byte from skb->data[0], so a non-zero error status
> returned by the controller is silently ignored.
>
> Fix by replacing qca_send_reset() with __hci_reset_sync() which
> properly extracts and converts the HCI status byte to a negative errno.
>
> Fixes: 83e81961ff7e ("Bluetooth: btqca: Introduce generic QCA ROME suppor=
t")
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 22 ++--------------------
>  1 file changed, 2 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 04ebe290bc78..875216e15603 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -190,25 +190,6 @@ static int qca_send_patch_config_cmd(struct hci_dev =
*hdev)
>         return err;
>  }
>
> -static int qca_send_reset(struct hci_dev *hdev)
> -{
> -       struct sk_buff *skb;
> -       int err;
> -
> -       bt_dev_dbg(hdev, "QCA HCI_RESET");
> -
> -       skb =3D __hci_cmd_sync(hdev, HCI_OP_RESET, 0, NULL, HCI_INIT_TIME=
OUT);
> -       if (IS_ERR(skb)) {
> -               err =3D PTR_ERR(skb);
> -               bt_dev_err(hdev, "QCA Reset failed (%d)", err);
> -               return err;
> -       }
> -
> -       kfree_skb(skb);
> -
> -       return 0;
> -}
> -
>  static int qca_read_fw_board_id(struct hci_dev *hdev, u16 *bid)
>  {
>         u8 cmd;
> @@ -990,7 +971,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baud=
rate,
>         }
>
>         /* Perform HCI reset */
> -       err =3D qca_send_reset(hdev);
> +       bt_dev_dbg(hdev, "QCA HCI_RESET");
> +       err =3D __hci_reset_sync(hdev);

So All the fuss about the reset is just to use it here? Actually the
distinction between -err and status is rather important. The first
means the command didn't run (timeout, cancel, etc), or it did run but
returned a status !=3D 0. If you want to capture both then you must use
if (err). And yes there are parts of the code that test for < 0, but
that is either a bug or they are intentionally ignoring the reset
status as it is probably a non-recoverable error at that point.

>         if (err < 0) {
>                 bt_dev_err(hdev, "QCA Failed to run HCI_RESET (%d)", err)=
;
>                 return err;
>
> --
> 2.34.1
>


--=20
Luiz Augusto von Dentz

