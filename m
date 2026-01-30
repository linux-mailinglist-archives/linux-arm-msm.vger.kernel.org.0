Return-Path: <linux-arm-msm+bounces-91248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMFiJbhqfGn+MQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 09:24:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1237DB84EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 09:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D29B300D61A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 08:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434EB352946;
	Fri, 30 Jan 2026 08:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L2ikZ6xb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B79313267
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 08:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769761460; cv=none; b=RVgjJwp23CRcByPPYaLE6v4wAxvekjY3ecu8ahqlTf0ZW+KmjXQou/hhvJVVqK/Okm0lWFYqq1JesBJA5mBgHp0wKyuRUQZWop6ohlDHkNYvSAsMCz7ruF96WPxFdROUBa9TYpbCEiULQW4HKf0OT2yHlBBSiHN12fwEupnJpLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769761460; c=relaxed/simple;
	bh=yk/DQImrd6Y8tLPo5TGQWWzOQ0L6lo6eOALIFPe2x8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1m23dt8CUsezo/2jvV0x8QYOp/RdWjZYEan8TSeZbWHDzHGr33SxGqNV+k17ZYDtHW+x9cM9JEeoTBicgoNg57HekFULntRS3gOecH9jPEhqUHWy8A2jOYmCROlGaOUmB8NcrCMbCLkudL6/j0Ez1c33kESH21CRrtMlUaSPIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L2ikZ6xb; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso1388626f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769761457; x=1770366257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kSHfEKQ3xKgmT9AN7R0YJI5063g4zHXX2+tc+T6cmxk=;
        b=L2ikZ6xbikXxcmnl0Vpc5Ekg+J/HaNEUkbgwsAvZFN8ne8Z7tjDs5e0zdshcqssld2
         91bH63df8cYdKaDOmtha6q2EiFRBnUHTF6eFXWw5DanKNd5PZKsW1vxoduH/Vu3ukmem
         zp8SoTMNf7UXWgD8VBeSoOVAW60leiP/VNZC6LnR+OWHtPxrLEBItYet/NNMI+Nqqzaq
         mbur7GZa2KcSl02B4OTzMv9nub/+uSw0kGiQYRg3RI4NvjPe6Xm8cA1eJvQZ7MhmvPG3
         mxKghk81yTgSIURWaHCIz5/9BHp/bii+NTl2e8z7pILEzMUGYcIJQ+FFcScdh1lolprj
         b3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761457; x=1770366257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSHfEKQ3xKgmT9AN7R0YJI5063g4zHXX2+tc+T6cmxk=;
        b=tnCUaOmzjbaQ8ea/Zid2RMh7IYDtF/sY7Hc7N9VKViPYmQIuwZXycmftnMR4IMr5E8
         R9CVT96c10a0dujf2HmUSDnptjMArvPaiuvRmhr2MDhpz4JVRsnGTMDelMph+V9LUzUy
         D1hm9Iloi0ejOOC8947hOrH2Mvztn2+HgWx7RlXt16Jnq1m0rOZAwtNV3jegC+x3l04b
         ya/asYeeMPLCf4ZzD2kts03PxN1COf3n3cD1BEufgz2xQJiBfrAwB5jz+vNSoUnLU4aR
         l5ptOIv8uJ8rxA0MWwRBz8R1sfA5fyQ8GwA3YVBbWUdf9u4KPsDfojzti1H/mqLOxfd/
         TBvg==
X-Forwarded-Encrypted: i=1; AJvYcCUZAyvgFVR5MWtKTOZAkuXK26/L+qKuS6M1eNB2ceALn0igKaYt4/XL6/fWwqXaW4bsbua8cVUNA97GQu0l@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvp0MrTW9czYbn02925UWBXe3fhnLamzij+iCvzz0SkWZ5sbWN
	4Dj92WjKHkQKtB/YtWeDOCft9EZk039DSvgREQKVw9s4m4lKLdzwscoe8AYVb8FlC+0=
X-Gm-Gg: AZuq6aIjFry/aiv/wxP8NPcRm0k5zxuJ/9aDg+ywcSeYk3HKxUimk319qHW8f/HdzKa
	5sgcTUOzFR8DXNFSVzraed8N8Nz/4qtFCiLvUtlsAlg/KY2VjLhksTaibW0HnhGr7tNBHGcKPn8
	nfKNrGSmKKZj1rXNCMFoNO9DwwyUvCcJC5EmpWaYEfl9t2Rown/JL9imm0cetc60lZdMl59rOgH
	56yh/7raTxzvYUGigsbkEHwJGvquwyUuYtLNnJBkkbylCIlJZY/RVhrLnLaG/gNSnDXZ60VdN18
	f8kQt1htwgkIop+B7xf5xULLxtwG9j29NXpY1dVyjjEFsWMYd7J7BlheaViPpF7PqmVwbaVPgTn
	oCZcHaUZdcCSZNXTImh7R+XOdJj3O4vfPZjrSB0YaSKJK0GyJRdIR1vIid/NEtcfTnhDjZtgtgn
	VwvMoAA1sXuUYbDgu+9vAsKFM4PFA=
X-Received: by 2002:a05:6000:220c:b0:435:8f18:9539 with SMTP id ffacd0b85a97d-435f3a6cd84mr3201514f8f.9.1769761456834;
        Fri, 30 Jan 2026 00:24:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354d43sm21835959f8f.43.2026.01.30.00.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:24:16 -0800 (PST)
Date: Fri, 30 Jan 2026 11:24:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sunliming <sunliming@linux.dev>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
	simona@ffwll.ch, sean@poorly.run, marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <aXxqrD3ZzK_dTAmb@stanley.mountain>
References: <20260129024919.30449-1-sunliming@linux.dev>
 <aXsHSTHHP0eyI-Pk@stanley.mountain>
 <b62dc0de-b39c-7515-25d8-6e6817df3f17@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b62dc0de-b39c-7515-25d8-6e6817df3f17@linux.dev>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	TAGGED_FROM(0.00)[bounces-91248-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,linux.dev:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1237DB84EE
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 01:30:35PM +0800, sunliming wrote:
> 
> On 2026/1/29 15:07, Dan Carpenter wrote:
> > On Thu, Jan 29, 2026 at 10:49:19AM +0800,sunliming@linux.dev  wrote:
> > > From: sunliming<sunliming@kylinos.cn>
> > > 
> > > Fix below smatch warnings:
> > > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> > > warn: variable dereferenced before check 'ctx' (see line 159)
> > > 
> > > Reported-by: kernel test robot<lkp@intel.com>
> > > Reported-by: Dan Carpenter<error27@gmail.com>
> > > Closes:https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> > > Signed-off-by: sunliming<sunliming@kylinos.cn>
> > > ---
> 
> Previously, a maintainer suggested that the name should match the email
> address,
> 

Yes.  But normally people change their email address instead of their
name.

> but community patches have consistently used the name "sunliming" since
> then.
> 

Consistency is less important than being correct...  It's just a weird
thing to say.  Are there other non-community patches with a different
name?  It's fine if that's your legal name and we have made exceptions
for people who aren't able to share their real name because of stalking
or whatever...

regards,
dan carpenter


