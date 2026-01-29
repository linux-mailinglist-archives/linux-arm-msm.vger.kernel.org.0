Return-Path: <linux-arm-msm+bounces-91121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iC86O20Ie2kJAwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:12:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BD2AC77F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BBD5307778E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED02376BC9;
	Thu, 29 Jan 2026 07:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q/i/dJGq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA537998C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 07:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769670479; cv=none; b=fgWJoSGqj+JqpuiogoKCXfFbyVQZkfTzTiGB6cv5rD6blV+TRbRLe+WtC3bGHqALYlnWBukCHJ4uPONwsMHbAerx/pTOdrHXBNwl9Jddr46Se9bqTO8bxvBqd6FDj81yKBrv6GOKPUjUVoqGnFnnxns+foy6CujNG/r2uUNA7wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769670479; c=relaxed/simple;
	bh=YykfV+88BbxTsZZ3agATcqZzPFxmTE4bNHPoar/dOeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stlId55154a28j3j+nJKFdusPueMja+SqtHKldymrKIlziHmIn5cTdyS5TwSXZQXVZZjHpsP5vWBL9Jv0akVIGPnWcU6hOrSpV4GWQie9z5mluzAQmNRc+Mm19nkuhSSAcXOgjy5iSVojwhREj7jVV1dt0P18tPLDO8Eb/r3X6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q/i/dJGq; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4359228b7c6so457177f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 23:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769670477; x=1770275277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nLKZ/+6JwT2YBvhO87EM+NlzTMpXl06Qt/e59HknqH0=;
        b=Q/i/dJGqIkE5YfyKNR56nQnDcQ4QhP8IHXNf3f/XnKapHc1PaVJO0/oKrltP0f6ViH
         liyzGx6Jb1tATkKGmsNVeypMDR1SDxGm+UqsIGo4oThwhI0/wYCxjS8+9A5ElpURbHGw
         5qwt77Ir25QS9Ss4lcuecMpJQJ/qbak4wpLJxmXRRqsRQBbS6i/fkVxc2H4g4EQsEW40
         RwsUBHbA25j2Ioiw9JJTiwYeJHDkU2TJN6wf70YM0Yh45hqvFGlYTrsa7hge/IjMbEzj
         r88M8HXoA01x0pwmf6AY13ZBPIOpczcnbd/lwVDDt6PJvjVZn4MJ2Co/faZ5PY1MumiB
         oaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769670477; x=1770275277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLKZ/+6JwT2YBvhO87EM+NlzTMpXl06Qt/e59HknqH0=;
        b=J2l0L5GZcBkBefpKTS5dCtvzEHdRKyomEhUH6c3vsI2HZ6MrOmuKnVcyrzRStjWt6Z
         0oauPDMOc9hT9Ka3tNoYCXSgjLOuSxTZjCxRZC4/lpwVRdTYCjBbT3anSAXJh5V5YoO8
         r2pkP9cZ7L0iRbTrlySjlHbFXUuwTDesTzr5C0o3F7o0bSemdJwYq+OKdrXB34ptYkh3
         e4v+9Nw6ELgG4idWXnie2B2xjgj8RyiFwHQmFisTpKj8zi+oVns2OIkY9LxIfDIaqVNP
         SysNWeo5Gn9O3Cfs4BcLD6EY6SksoRjTA9x90jKpgJf05aNJNzgB9tfOQ4bJk+oDdkDl
         TuAA==
X-Forwarded-Encrypted: i=1; AJvYcCUZOgWBTfF7OBrvRd8FvG8wxyAj7Rg8DhLGU2KCbaT5iEl+BAi658/7Q/LDXFuFsGaPXEK/kU7vIW3bicRR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/eDSvocvKIpclPv/LDSH9c+DDdQWUHO0P94QVweosjN8vSNf7
	qJJVc2/epz7Boc1XzLTUm7RdvpOj70TiIskluOUm8cPr5mY5owmsvSrR4qtc/pdHhKU=
X-Gm-Gg: AZuq6aJslD+8cgZijzXKn1JZA+POgh9HKRhEj/nJ1aAb8wRBvEDfMJWPagvBM3hVI+m
	pTVPOdXqSU2/yvpDuM2EZkrkGws52heHXyq5haw1XCXJ7V1r/Xr8vp6XfCFsO95siOA3My5ciOW
	XCFgC65glJs7L6fiK9QlAi61ZpP+Cbo2hkVes0VIf5F1i0AKsC6BepCcQuxHpWPDY2cu2hCZtjp
	dkNtsU/dYcobN4UTsrTs7CyVapl/eQzSZ6KhtkdeE8x+M4vYFetbW/31UpCpcdY+55PIOkXWph7
	Vk8nfxqAolUP6sJDaB0Pz5NFWhtynH41goJb0F/HZPRJfzC6viWL/NNleFBWGyI2Kr7uU9gSflr
	6axDZEm+owZ1AkVbozqsIdpsmz0o3UYYe1WQeJRMfbdJaflpfpwP4iz+z92j1vdz7s30iSr8fq+
	S7WHXgrYbqJiC2Kln/
X-Received: by 2002:a5d:5f54:0:b0:435:94c4:649c with SMTP id ffacd0b85a97d-435dd0b678dmr11429356f8f.30.1769670476703;
        Wed, 28 Jan 2026 23:07:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cf16sm13036791f8f.22.2026.01.28.23.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:07:56 -0800 (PST)
Date: Thu, 29 Jan 2026 10:07:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sunliming@linux.dev
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
	simona@ffwll.ch, sean@poorly.run, marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <aXsHSTHHP0eyI-Pk@stanley.mountain>
References: <20260129024919.30449-1-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129024919.30449-1-sunliming@linux.dev>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	TAGGED_FROM(0.00)[bounces-91121-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,stanley.mountain:mid,intel.com:email,linux.dev:email,kylinos.cn:email]
X-Rspamd-Queue-Id: 51BD2AC77F
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 10:49:19AM +0800, sunliming@linux.dev wrote:
> From: sunliming <sunliming@kylinos.cn>
> 
> Fix below smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> warn: variable dereferenced before check 'ctx' (see line 159)
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---

Could you capitalize your name?  It's supposed to be a bit formal like
signing a legal document.

This isn't a RESEND, it's a v2.  A RESEND means we accidentally ignored
your email so now you have to send the exact same email again.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter


