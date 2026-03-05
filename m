Return-Path: <linux-arm-msm+bounces-95645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIHSK0qKqWki+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 14:51:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D914212C38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 14:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFB8C30FEE6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 13:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64FF3A6406;
	Thu,  5 Mar 2026 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVzYgefu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AEF3A63F7
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772718501; cv=none; b=Rmc7itB+3wenOMIOpfZjrwckm9eS1o1MxoVnZMrRZkBNYhj0jMEM+5hY5QoyrWmcRjVqFn0BElhbB6cjxY4Z7q6g2WzrImGLoqMaeWeHIUJhWMcolBT1CX2scXNvIKrg36qKfryimmbi0VfjhA5KS/rPNg9nkw4Rp/AHbVwr7Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772718501; c=relaxed/simple;
	bh=Y/U6dzr8HYlcVBpXU4s6771KLXs28Td3POcYpRPGCJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJnNOOKHZ8TDaJOkNW9e4yeWnIbyiqSFgt30FGO1JssTXxAI5P6oa8Sm31c8U3ujx1fkI4M1j9Ma63/Ltk+j5XQl0V7ZuIq+DtEjZLHDVIwJEwbCvpEMSpRmJL5u1gMiVwFDZmEokmrZz92yeMhHJo0AvmT6vr8IBey5p0kGWHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVzYgefu; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-503347dea84so86412351cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 05:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772718498; x=1773323298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMO5RCduv8sVFWa2cW8ITVOFRe4ocA/ZvzJGrJ1mPoo=;
        b=GVzYgefu1RfwzovModpfyW+4bBhj66JC88XpnT1AIRfwCzQvD5/g3ht/99AoCJ2ZOb
         GgrOD5Wd0EaLgsHAE3cvQYHP1S4AwXwk/rwl/AklP5b5oNwJ6ml7C4ww6GyVQd/9LJtv
         zftdGHUgFBT9rvfYZ6jfKshZ7d0vvbMBbKYPCUik6e7Y1IZLYAQB0vBboypYB2ogpJHU
         GwHTdHIj+A/MWEra2F/ojUJFJ5XP1BpydGbxXsnFmLmnU5Hb4ahucCARh/IgkuUVFprN
         ArkzabX+vtqhYOYHZ+IyNF+hauJpaZrBhhmEX5zOXwmcT65vLkGQxK1KEV8+oFOGSfYs
         V4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772718498; x=1773323298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMO5RCduv8sVFWa2cW8ITVOFRe4ocA/ZvzJGrJ1mPoo=;
        b=g+FxAXxIkWL88UVGpx/JYhf8rScamMVJytlZjXK3Z7APOzRy4KppKsiSqoB2/icjIZ
         vPg2+RRcG0OYV+RY5lOnYZ50ZimVyHkPfz2AVTfg6HnwovEpPKtx2RrYESbQhMBZKkWU
         hbLA7s7dX+esRSjj9LUtycQDmNQmTZp1jeQstcOSZTKQ7mrZjdv/oWiOamHKNF5jAp2v
         8mE0aSUXkHhV/bmfEfgmtk9tLlqrGLCJNcmON+n26XOLdA9/3hl5t9QIvbUmRYB1gRV0
         y6Qoa4r848t/qZGoVpM/TrSHcadr3Jz9mP+7wShtF/Sgj5dCmFILCZOdGXrbyFTdDcKS
         7VNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFFGjVElvNCYSGWmSmHc7hIlPoF/TlPFR6lZtCqQN8wyzaiqzO87+BHpFxwy8tLjVTQuF9vx0GQ5I4rVn2@vger.kernel.org
X-Gm-Message-State: AOJu0YzW33xW6juPn+Lip93y79DR/inhBw7xU5wopWrVJh2tCTdHVlTI
	a+28gYHnSfrQaFsj4G9tWAuVHQADEojqOE0E2g23EIOa2eo5mKsIfAEx
X-Gm-Gg: ATEYQzxHV4FUsiHkZ0FCRuar+HwURvUlHTFK/XzqWjOrSyjILBLR5HkJvehhxp7K5d9
	E/y59095IvJQavnRP04HgEw7uTjdz7gZrTnk86vb6NftVnYxCtsu58jOoe9d7/lL8MRvHkghrUS
	bCU9eapzJqSz3zzlGSkmQwfBuMq49JlXTVPAf/1TdKZFDOH50Xz7o1tuocRZYMWib1OAgoQznPi
	04A+y8wtd6CjA/HWy/076rdkLlDjRb4PUgow7cKQnNWrYcpRIoc2tlsj1IFGo9wLoX0a8yXGtHN
	tiZu+a7KKvXgkecvcDgt42J/zGQu6tvz6ym/K5ksWS2NXlpmYsPBVRsjI+pwkfH9wjf5Sg9F1bD
	88x8dzD1vhBCYpMb+TdcLnfgEgouO5CJ/PS0mruKoePFVZvBsxzuIERmskJgjj2mZnqVt56dPco
	dXXBg57MiYgIFUvTOVQhE0wMRpRGeQIrEIf+aV
X-Received: by 2002:a05:622a:144:b0:505:d647:645b with SMTP id d75a77b69052e-508db35a613mr71690511cf.42.1772718497953;
        Thu, 05 Mar 2026 05:48:17 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899f8ad5b8asm119142016d6.0.2026.03.05.05.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:48:17 -0800 (PST)
Date: Thu, 5 Mar 2026 08:48:48 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	srini@kernel.org
Subject: Re: [PATCH v3 00/14] ASoC: qcom: q6dsp: few fixes and enhancements
Message-ID: <aamJwMvex4aF6eah@rdacayan>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
X-Rspamd-Queue-Id: 3D914212C38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95645-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:06:58PM +0000, Srinivas Kandagatla wrote:
> This patchset contains few fixes for the bugs hit during testing with
> Monza EVK platform
> - around array out of bounds access on dai ids which keep extending but
>   the drivers seems to have hardcoded some numbers, fix this and clean
> the mess up
> - fix few issues discovered while trying to shut down dsp.
> - flooding rpmsg with write requests due to not resetting queue pointer,
>   fix this resetting the pointer in trigger stop.
> - possible multiple graph opens which can result in open failures.
> 
> Apart from this few new enhancements to the dsp side
> - add new LPI MI2S and senary dai entries

Is the LPI MI2S on Q6AFE? I don't see the AFE port ID.

It sounds different from INT_MI2S so I can rebase my patches to depend
on this series.

