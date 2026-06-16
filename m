Return-Path: <linux-arm-msm+bounces-113461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sGoVL4aiMWrOogUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 21:22:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CE9694F42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 21:22:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Gd01ltZQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113461-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113461-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A57D3193108
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 19:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163D43DD51F;
	Tue, 16 Jun 2026 19:22:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BD3344D88
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 19:22:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781637740; cv=none; b=dE1nOIeiLULWYFEruFPQ9bl8USXJLve2RB5e1lntA8EicemHCZbuKBxmdmZTaRhboiuQzOwavyqHz9rANN12XcHuEtCK/4TEyOB12IfZpRtkBDd/487UKjji6Yza5Vvj0k4/nGKAS8U8258yRtDAGpEn3QLQxzic8nxQ1/RKEmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781637740; c=relaxed/simple;
	bh=CzrTjRh8aVFApgaFvhsZxWUfS7HpvI2aH47+Qzw6otE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+2AiuXSBwNWdJN6znDx+tF3gzITAXSzGqs83cWaVwnB7v5Ps22YKyMPyhu6w7lZ4HnuS+oFhg+WPB0qoZ7hUQvhuK4q6bkvNvqzU+CfucCxJedrG9QyUY37hGerSf8NsE8Rf0VGVdVpzzEJDMiFbnJUSjyYOG4ixjUpY+gOALA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gd01ltZQ; arc=none smtp.client-ip=74.125.82.180
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304d8362a58so172288eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637738; x=1782242538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F9t9c6bYslGUW0YJ04TH35qJToA/FwEVp7/7In1g8XU=;
        b=Gd01ltZQDw2fa08Q1TvVEP5f0fxdrowwR4s/r5qxIbdH5xRBSf3xV3jF2TlOZ54+W3
         3HA37DDoaZxhja9UNL/pDj4eej5Dnusrcif4BTmBjTJTt55AGJJspTlPdggAxgHHQiYM
         Vot6ofEM+kaQWLuXEhV1JSSBk2j0UgyFNEGxFxCvPcVnt5kVzc70+2imT+9pOvZHUnoy
         e4yaS2gxcpWqxCqkWt0aDJpOChWnfOLuc079xsaigEZ5XZI9NIXUmrFVi+06IHQYOMzI
         M6XY1/Y/jEnSdMzsJh80aEhhT0Hs5pDdNzIr6GS3MiZtzLqTihTHh/smA1Nvq7Jk8hGQ
         Nc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637738; x=1782242538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9t9c6bYslGUW0YJ04TH35qJToA/FwEVp7/7In1g8XU=;
        b=EK9amRjVWn+ZGRiOGg/A4GwhqFIQ3mY8gkMcUeyynjo9BRfQVraDsjHRfC/hW2KW3R
         xRcQCjGpA1VNhsG3QSCdtM7PYugk7KfPHLuGXxaNVjeHO7sZpfHZ3RJaoSJJDEFGCvvd
         QxuqH1/emzAU9xYp7jn5zRaVvmBSQGlAVdmSUBmW284rXbX5l7KZLIJ+f2yLShyOQuDD
         NynN8+A+nhbpXzfv3MeAfhIhdST7pcZYHPO63J8Emu9OVah1k1FUeOFxwozXyFYB6MN+
         O+YEnhkxKcStYhUxjVnBdALTSSTEqF9SWrEX+cb0gH5gOrzfUCnGfBp+dFa8am2qc2/F
         6Rag==
X-Forwarded-Encrypted: i=1; AFNElJ8jbskcDcZ0mlguOy7gnw2HGY9MxSxcw3ffLKKVRNfKA8hrB0KYosrRZpo0B1uz8MPr3ogwPBK3LUsIofrH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgi0VahOxygOZJ/2jnjYMel9UAYA/IlMs905HbtwRTslRyIc19
	jZaRGh1WYG1KlPmtP2cmnI/zaJDrQmVBG/BUSJ1Qa2vCdTaKSAVXVeqD
X-Gm-Gg: AfdE7ckJjZNnuHQPrdo8sMUJzWbm1785BS/gwi+TDHnn9l3ykQT2/ULYKr/zGIkekcm
	QCS8Ajw/Q5dh/BZl4f2zBuRnoufhG789lUl2+7EsxlbWfm041brSMxf1czzWApJDYZqzxt4VBQB
	fvnGRFEDUQPKN4HnWqQkOCPona6mgGd279gT/Vob+EYJxk255msAf5IrtvouiaIo5lmEDZ7miDa
	P+vLOXo3py00vgLiYmu3LNNeCs2/yBHaP58t3Q6MqCREwBkODZztxvniQfjHv2r5SRymfjIVEnX
	H7eCAR6yMWp0y59jy/ZeyPXFBKBTAnjCuOyfX68TMyyx4SjMvNS0BCIWP/LTdc6/dvdUCsmEgD8
	4ruKWJWS05WQaN1wWhw9rfVrryrH8y9hyPZpB79A1Rl4kPsTOsfDnt7inseBlkvdECLvoFcv3sU
	6ldWAlO9dmLCY7ywysAM5/rkHbebha0c6BVxhxsiAfUkxnF1ObNmtMKFkYUaoIQn68ZSMHffbzQ
	g==
X-Received: by 2002:a05:7300:6d2b:b0:30a:e52f:9b99 with SMTP id 5a478bee46e88-30bce88dc80mr66631eec.0.1781637738011;
        Tue, 16 Jun 2026 12:22:18 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:cbae:d24:189c:2cb9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea447b4sm18650560eec.23.2026.06.16.12.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:22:17 -0700 (PDT)
Date: Tue, 16 Jun 2026 12:22:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	kernel@oss.qualcomm.com, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] input: misc: Add Qualcomm SPMI PMIC haptics driver
Message-ID: <ajGhUY5JpEQWfOfe@google.com>
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
 <eb693705-c0c3-427b-a924-5aa907fd65bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb693705-c0c3-427b-a924-5aa907fd65bb@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113461-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51CE9694F42

On Tue, Jun 16, 2026 at 12:25:55PM +0200, Konrad Dybcio wrote:
> On 6/16/26 12:08 PM, Fenglin Wu wrote:
> > Add an initial driver for the Qualcomm PMIH010x PMIC haptics module,
> > named as HAP530_HV. This module supports several play modes, including
> > DIRECT_PLAY, FIFO, PAT_MEM, and SWR, each with distinct data sourcing
> > and hardware data handling logic. Currently, the driver provides support
> > for two play modes using the input force-feedback framework: FF_CONSTANT
> > effect for DIRECT_PLAY mode and FF_PERIODIC effect with FF_CUSTOM
> > waveform for FIFO mode.
> > 
> > Assisted-by: Claude:claude-4-6-sonnet
> > Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static int cfg_write(struct qcom_haptics *h, u32 off, u32 val)
> 
> static inline

No, let compiler do its job and decide whether it should be inlined or
not.

Thanks.

-- 
Dmitry

