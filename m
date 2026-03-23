Return-Path: <linux-arm-msm+bounces-99209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFc3KgEewWmTQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:03:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2065C2F0C40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 119C4304114E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E3332D7C7;
	Mon, 23 Mar 2026 10:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hadzqw3/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TfPCTOBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3386233F58F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263390; cv=none; b=R7WFIwZHifnJfM5UnSoxq6dP7oAJvI1GrliIB9KID/5XzGghqAHd+9L1akavzMkZnKm169kozDZ+JF2Sr/oVllgbCpY0GLpg8bIV0APE5G8UoN2NIGk4yLV7ccVJ4RiF7T/H7suGq5gShgxuWfm5sWKMqF3gUp5qpzwS9+k4A5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263390; c=relaxed/simple;
	bh=3ND2U9WUVzc8Lv0ev2KT23OqMrD2HAyt6A+/DGBkYww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnu/foEB+DuCG0O9BjsKgdM1nupmus+a4Ca/3x5fmCuZ3l9s0lQAWMEP25LPgBPy5aEoDAKgzFmQXUUpaqs2OmUOJm1xUmWOLfczTkmjDTmYCV8d6D6oVj3fJLiJRed9SwdMAzohjXznuIHnPJpkAHIGdAovfxAMmbadN1fgAFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hadzqw3/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TfPCTOBc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774263388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W8PnNxrF6RAnd6AXtVYuBoGbmL+cIw2K+KfBdA2DfjA=;
	b=hadzqw3/jjkxgnsb4TvN5BvIIsa7DIv4aNA/NS72r+FbBux1Tu87qFKppTAlqQVBh1yBtn
	kglmFG2SaoaalSFL3WDTVnbj+3fxoEHVBbR2284JOosFURavC/8RsiY3BfCx6CzYW36yhL
	oaeNoduIFfdTekccRbLiiauZ6KpeQvs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-A2BSDkUuNUKsXpbcd9U6wQ-1; Mon, 23 Mar 2026 06:56:27 -0400
X-MC-Unique: A2BSDkUuNUKsXpbcd9U6wQ-1
X-Mimecast-MFC-AGG-ID: A2BSDkUuNUKsXpbcd9U6wQ_1774263386
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50937cf66b5so91139721cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774263386; x=1774868186; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8PnNxrF6RAnd6AXtVYuBoGbmL+cIw2K+KfBdA2DfjA=;
        b=TfPCTOBczF5n11yj5pmZvoODQk9L6EqoLGgK5asQwc4iiVwPI+3Dfn0QxQBX9Gp5ec
         AKR/kYPP0ME/HkQtv0km4uvIA+e+DQtkiHdiyKhaNZVdUIp6kaz0PRyOy/hNlpBD+Dcg
         NGY7jAphea3pqkLKuaMdLkin0ng7SxCMVMggZ4CT2zlS3pNd8Jc96QpvDFYzcH6wZVJT
         3kmxijnRnY+r7vRU9UOST4Muv8Ma13BLELAQ44jeqYimnelmb2E9vlEL/V3g60rYmSM1
         reG+3hHvc/Lpn5haclr5RnABLEMPAcfF0lXgsNtpirfwRlxeZDp51qhtFtz3r2TtUFKd
         hoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263386; x=1774868186;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W8PnNxrF6RAnd6AXtVYuBoGbmL+cIw2K+KfBdA2DfjA=;
        b=s95+HK0ri/uq6Mp2aCgcCbKYxaRxKqEk2MPp62zQJ+xSIyBSfKLZt69CrfzP7BjQ/Q
         0DdcMcGu5HH553b9wt2a3L9dSkZzh2ODnHjuUBCWawZA67aPvkhRvdo7WxCvBmPoU+qQ
         W1n9mxJTRd88od59J/ZnXPVQQYFX4Ge0MTBG0fnSc9ZommAdVeCMhyUabYo7nJawWG3P
         qYCwwmjqAzJfxGXeVgWaZ2b2sH0qfALl3YL/09mx7jQGjH4nma6UF3RvDcMjQChVNPpG
         zNP6BH6Bym9NKPRmzldWLvRaRvdYPPf5OGLSMS072DL7U1U0HnQNZLx2vokDaGqgv6rC
         i5+w==
X-Forwarded-Encrypted: i=1; AJvYcCUm9hHRRTNF6+YGMSuRuWeB2lir91es9ZxeCTpUeI8zkHxd26C4roA9Al7FCM6AJ++AAEtodAhQ6MwLQmFn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ulcsuti1MUkIW3zmv0XdBrwCMcHLdTtbHbBHqBXl6BwUv60A
	QrKObeM1KnAcSMvILOUw2B/oi7uiFzx3LKAZQ+MEQbLLJ8DKKML0HNB9agx5xAX2qww1ipQaN8Y
	TiB8Pu54e1Lz48FEyzITmgTUoFnhOXzdnsWwwbWBTtx1dCPkbGAHj0EbSGfugObprhrc=
X-Gm-Gg: ATEYQzycipCpLax7xvbkJDJf4+8f+nxzffN+FLAVei2hcrn22L2u+o3hlBdVJ+90xaM
	cYr/itXUWeOPCSakSEq4fmnj0g/yKow2cLSndAVmikWx0RF6x/vfrb7jOdMNiMiW/nIcrKKK1nk
	MT92YStNHPHJ9or968AqHvjkOdztYUTpzgrt/Ls0Dpo/Uh/KSjOtxZWCL7J2YvBW8EVlu/DFeP8
	bR+aHWoHwum8tFOfIB5zOU+vA7l0VipXN3igPu/4pByEn1jwiNvYpCTEF4DL6COON7gPgIbE4H5
	5lcavl/wHCm+MReMYfJctqdj1+mxr/UxSmGyPXQZLOEn027zhZFeJNKTnhyVjRC30KlTTIv7fxy
	dV+uufAUWdoRdu7XzmqeIuFb6xMfb0VXcJoDQ51H5Mr7D9ugvHnpmovxz
X-Received: by 2002:a05:622a:1e8b:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50b374268bdmr206504841cf.24.1774263386466;
        Mon, 23 Mar 2026 03:56:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1e8b:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50b374268bdmr206504631cf.24.1774263386125;
        Mon, 23 Mar 2026 03:56:26 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e350b6sm83525921cf.14.2026.03.23.03.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:56:25 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:56:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] interconnect: qcom: let platforms declare their
 bugginess
Message-ID: <acEcV9wwfx0UjOQa@redhat.com>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-6-7892b8d5f2ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-msm8974-icc-v1-6-7892b8d5f2ea@oss.qualcomm.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99209-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2065C2F0C40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 03:17:22AM +0200, Dmitry Baryshkov wrote:
> On MSM8974 programming some of the RPM resources results in the
> "resource does not exist" messages from the firmware. This occurs even
> with the downstream bus driver, which happily ignores the errors. My
> assumption is that these resources existed in the earlier firmware
> revisions but were later switched to be programmed differently (for the
> later platforms corresponding nodes use qos.ap_owned, which prevents
> those resources from being programmed.
> 
> In preparation for conversion of the MSM8974 driver (which doesn't have
> QoS code yet) to the main icc-rpm set of helpers, let the driver declare
> that those -ENXIO errors must be ignored (for now). Later, when the QoS
> programming is sorted out (and more interconnects are added to the DT),
> this quirk might be removed.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

When I wrote the msm8974 icc driver, I spent a fair bit of time trying
to make it so that we didn't have to ignore those errors. As you
mentioned, the downstream msm bus code gives the same errors. That
downstream code was the only reference material that I had access to
when I wrote this driver.


