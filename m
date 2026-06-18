Return-Path: <linux-arm-msm+bounces-113792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AE2TJkcJNGr3LgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 17:05:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ECC6A11B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 17:05:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PddyXCmo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113792-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113792-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C906830E5C8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0A8279907;
	Thu, 18 Jun 2026 14:59:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36FF3DBD41
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 14:59:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781794785; cv=none; b=jUp1i428a+LZCPmi1u6P/xTCS5TRGXiMAX6fpVNGq24AG5z7abr+OZ2oMAW2Tb6oAdEyFNs2FCLh3pxlOl1T7n3XMWXrH7mk/tdQ1Mlg8gqXZ+6S4oObw7G+4A+KDAy/flfnvorhGm3nbeUi6+kVX33jbPS6tQlwVOutNEgDQGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781794785; c=relaxed/simple;
	bh=ohY7bb0kh92g6C2NfTVSoNXg0kcZoVBjk9evkK2s9rM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IeBMcw1TKaP0fRxh84BpMZtNyG1F2tslYok0PDeG6fbhMmMIUG6OtE6nBxYPcnUnjJ9tLSellw2vn9JTLoTYTySLi6ByZa7zBkhW0wJ0kVj/oY2VWxhQjv3o8bhE8guy0PXJ9Eg5y1q2JiPL7j7h6k+mK+4pIzqkwULofwOnlD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PddyXCmo; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45fd464d51fso672601f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 07:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781794782; x=1782399582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FzucqwHZo+slbYBGADmmQASUp/rGJyNeP3ZJNzy0TE=;
        b=PddyXCmoQJl4pSuQtFkLYEzvzTRZINzoHemNylX5881RPJCuuzSFJyLtWBMUhzPfeu
         kN+LQ828xTnMgMrm0xLF27FNLYGYKNv1shpS3Q2MPHo5rBAWp9v97t4dg8Z6SSZB9C4X
         LS7nCpgMCdYa0/PuTFKB0ssfSVSM/GFGk+Q07hNADoDeelRWXqcdfJiPxMhkzgNnHlm3
         I4L+mAK+NV49dTHSyeYng3c2Vf8bQ3FoirbstJqqmF1y2KDd34XPzx0vuLUUz3C17xiE
         lcwMxynaqaYMtLjaljwBuBApfMgxBHE6WpaPkOCc/zNBPyWLmz8VjY1DA8X43FpnODVF
         Eu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781794782; x=1782399582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9FzucqwHZo+slbYBGADmmQASUp/rGJyNeP3ZJNzy0TE=;
        b=hPRiCnXmFXJLe47tI66xEHOuV5Zk8KGIg2iZ4HJkntBIZkjSpWmsGRcPtfnVHdzIgy
         REFxdxHGoAu0BYcy7uHsAN7ry/AOWFUhnU4EB5FQeJrXNCRAR02H8Cug+8xbSeZoCJN6
         pmQuzReKHm3z0P7XcBBpMGUG9ynHbAuRYDfuMJfMZoOs/U4D4amR/Fxxv2Di/DaXZqSI
         Mjs8dKKUxcMz05GlGH832B5tvvaC3HwLHPiLJH2V9OucBrLDG1NfwesSlAYCqPAJzoHk
         afruTjTAfLgk7YZbae8VXrFjz1DSiGaAOx/K0V9CfM7fBy071DHr5iyzug9wsdkp1lgR
         KI4g==
X-Forwarded-Encrypted: i=1; AFNElJ/z/1Eh4Gi4InmH/0QCOgITM3lh4T+8c3iyubFQMVqFIY7DtQ3PWrtn8CyeaaQY3c0wp2MWi7PA8Fsnm8eZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxUcN+uNOi5FCMWtpYYcPkJqbeT+SbsxToyp9N19jkyoSg2HjwQ
	zr8OPJLJ6tTm6zSd6/NtO5opv3eio2CmDiNuwVvPBrbfnXiGGsg4TTzkYYlaHD8V
X-Gm-Gg: AfdE7cmEgHiBt2tfnMzEcRt9R1tcmABVdeH0xaz3mppktRUVLOUM3Y4+AypoBOffAi5
	lKxtyfT1CwNZgx9SQi2lsnnEXr91PXQ5QICx34JC2s3iFOpQHIQTNZYbAlJ4c+IWz3sAq2tCq2f
	lmHFreIZ9fSqqVXm+C+bdN2dqCt2OgmNWb9H0lm/VhNC4EsDQywCpR9aA64kPI4PSkkzYIhS432
	UD6oo3F94zoBbS18WlRmVNGUZXr8/1TtZvKHw2D7lAZJHLu0g1I/qs1Oku61ZMafKQT95mp3BLK
	T4LcIdLWM97UQttOnT4+phWnA+P+eLRLJu6J5X7K1JqcfnaiyGAGu3E/TXeaokT1zzYurFCwgkY
	jadtQPPQC7I/wg1zpWz/V2I8PIPyxZj8+gVgk4yFYG2bXEF25UbNzvrodaE16BHcZV+4zMb5Wyi
	UhspC8lwlx5I16PetzDsPUClDMy1sIFlZbvrEV2HSRG6NYPywk/A==
X-Received: by 2002:a05:6000:240f:b0:45f:f142:d56f with SMTP id ffacd0b85a97d-463ab7f925bmr6881625f8f.12.1781794781864;
        Thu, 18 Jun 2026 07:59:41 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4620b1083e3sm20845830f8f.20.2026.06.18.07.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 07:59:41 -0700 (PDT)
Date: Thu, 18 Jun 2026 15:59:39 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Subject: Re: [PATCH next] drivers/rpmsg: Fix copy of channel->name into open
 request
Message-ID: <20260618155939.6cdbdbac@pumpkin>
In-Reply-To: <79c1dda2-153e-4b7a-ad18-c72db1cf4a00@oss.qualcomm.com>
References: <20260608095523.2606-33-david.laight.linux@gmail.com>
	<79c1dda2-153e-4b7a-ad18-c72db1cf4a00@oss.qualcomm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113792-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:kees@kernel.org,m:linux-hardening@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:arnd@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,pumpkin:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39ECC6A11B0

On Thu, 18 Jun 2026 15:24:17 +0200
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 6/8/26 11:55 AM, david.laight.linux@gmail.com wrote:
> > From: David Laight <david.laight.linux@gmail.com>
> > 
> > Nothing obvious ensures that the name is less than GLINK_CMD_OPEN (32)  
> 						     ^ GLINK_NAME_SIZE

I was writing a lot of commit messages, most with -m 'text'.

> [...]
> 
> > @@ -481,8 +481,7 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
> >  				    struct glink_channel *channel)
> >  {
> >  	DEFINE_RAW_FLEX(struct glink_msg, req, data, GLINK_NAME_SIZE);
> > -	int name_len = strlen(channel->name) + 1;
> > -	int req_len = ALIGN(sizeof(*req) + name_len, 8);
> > +	int name_len, req_len;
> >  	int ret;
> >  	unsigned long flags;
> >  
> > @@ -498,14 +497,20 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
> >  
> >  	channel->lcid = ret;
> >  
> > +	name_len = strscpy_pad(req->data, channel->name, GLINK_NAME_SIZE);
> > +	if (name_len < 0)
> > +		name_len = GLINK_NAME_SIZE;
> > +	else
> > +		name_len++;  
> 
> Should we perhaps do something along the lines of:
> 
> WARN_ON(strlen(name) > GLINK_NAME_SIZE)
> 
> to prevent silent clipping?

strscpy() tells you whether the copy got truncated.
No point calling strlen() again.
But I'm not really sure it is worth it.
Any length check of user-supplied names should be much earlier,
this is just ensuring this code doesn't overwrite its own stack.
(and ensuring stale stack doesn't get sent as padding).

	David

> 
> Konrad


