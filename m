Return-Path: <linux-arm-msm+bounces-49462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22426A45A25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 10:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 150FB1654F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D44258CE2;
	Wed, 26 Feb 2025 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tOt7FKBy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300EF215189
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 09:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740562295; cv=none; b=B/lI/dYm6prZF2uPWzyRzszPkedsW1qi/kQxSmZ8C0VfdmS6Gwic2tMCZTA99GHuwjYZ75PsWBufTughKPVykIcXf+GW7fO5Pt3vPqqFlNAvfXSxxFl9zHL8jFm1teKVa6Kwl0DKPGyxH60+vJKUb0ajJfxRywPBJnn6gbMdfqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740562295; c=relaxed/simple;
	bh=zSnFh/V954vG228E4AT3oDsfE5dsUPzc5tASUg1o6qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbP9Ft+cAy3amPesmCIJ6demQIKlvylUd2A10cFFzCCjBGeTBtBkMhk12VB1sTaDkuYUwwLniYC6T4vCxnWrFujajcY+pMmbir/YYb7/UrY9IRBHBGdWuAwYCQqusm+kc9idBhx1xJSW/vasE2vw5HC5P+dH5CEBbs1bh1CCumQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tOt7FKBy; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso10894540a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 01:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740562292; x=1741167092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7HLSyA6mw5885Yw/vt1qQCOh4p9cGkmIlOUNwXfUDY=;
        b=tOt7FKByCkKf0E0aQ3zW4McoHvqK9QDVsUSGhNSwoiRGn5tHKPumTAZBZjyTZfb5g/
         XgTFuCjg2n7MGaVHxvU7gxTimaxoTeKqqyoFWFilYhA9DCunUZnUkm4kxkVATnkjpqEl
         hd+ctLup1C2RyIvvGGsVbVdHxSnMwcYqzfSnSatynApeeNBSAfX5WKv1vAvXTmDZbBa6
         EfzRuGxYOONBjQLvsPi8Isxy5ebkLGmG94bIF3hH8WbdE9p90vXfqLpS9xWNQutEv4tF
         uJVRlk9zakZuebFx7oYRhgvHkhrTiGRaOk7wSeAj7qZ+8sZQwLWNxYK50/SPiqC+KWPT
         F0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740562292; x=1741167092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7HLSyA6mw5885Yw/vt1qQCOh4p9cGkmIlOUNwXfUDY=;
        b=chm5llHLU/Q578dZFqxl4iR0LGk3uHtSDPf8c2ImvlPJ9vOKC+FcjbcHVwxv5pgZkP
         fnl2ElMU1+PWbOCkVY65PIRZEt2s9rwI7SXzbd90IawAQ+aJATJSReZiJ6BzLDb6VR70
         idtXy+IEoRujMTd5Wib7IwIDfWctNKW/tKhcUWW1MPZv9TAdEq6CQmoiQwRUbsknUJ3X
         WNrLmWBu/6XyERkt6pL9JdFsyf3/U/hk1YyvUdA3NDKdL/h0OAoqyKxQTPwBP5f2ekkL
         JqN129mM44UVzjRMKMqRqv5RFDma0Dogt6wJ0LubNgJ2wsHacpOgBTYClNK1bRVoFr1z
         u8vA==
X-Forwarded-Encrypted: i=1; AJvYcCUYYuLeruu1dVQTHAm/ICv/4DuBGBYbCBV9ZWfYsoY0kjmXUyx/00kUSy1qHfsvKfXr5knsRMC0FK8Xrxwh@vger.kernel.org
X-Gm-Message-State: AOJu0YzXp3RzPE3lkxJV6Z8M8QGhJniQgZXTyqraSuy37HBSfgG+Vu7d
	VTIIttrF3z0KRRNs+3PxF0YGRc8gYKpsAt5uxyZBb4J7LmXGFNFptvInRGmpnvk=
X-Gm-Gg: ASbGncuoNBXwL/S9ImaCrafoSCsu7zWQ/ERrwiXjqRrnc/OYchU56xE4ifoNpufcb9a
	V2IJH87kgfierxUzV1flDVvWkxQJAo738oONUJEX7CaWtFpe3TxEzPL5jx4bcVkNfpUptOULRTy
	/tlVz3XKoyB+qOuxLim4M8K4y3tpi36q29l6b3DkBip2LagBsI+m8qRIul1OUevkXc/HGW+aYqp
	7GkjPhFMhTj6aKdX/rYzFN3BPVEEH7QRd6YKcRdJSgWGqhrJ2FLWZtMc1PT1R5W7QGMXRzL0zjA
	qMrAvofGBxivgnQ6B02ckHd19eVZFv4=
X-Google-Smtp-Source: AGHT+IHOlwVgMQ+XjHmskbWK3r145DW/sQyZFjaekImQ2FOuF7PWx//irvpWADdBWiQERIVywycnfQ==
X-Received: by 2002:a17:906:f58d:b0:abb:6259:477e with SMTP id a640c23a62f3a-abc09e37f41mr2064332066b.55.1740562292322;
        Wed, 26 Feb 2025 01:31:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed2010f74sm288418966b.121.2025.02.26.01.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 01:31:31 -0800 (PST)
Date: Wed, 26 Feb 2025 12:31:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, dmitry.baryshkov@linaro.org,
	maz@kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z77W-fKBUqAALZKJ@hovoldconsulting.com>

On Wed, Feb 26, 2025 at 09:55:21AM +0100, Johan Hovold wrote:
> On Wed, Feb 26, 2025 at 09:12:23AM +0100, Johan Hovold wrote:
> > On Wed, Feb 26, 2025 at 08:13:38AM +0530, Sibi Sankar wrote:
> 
> > >  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> > >  			     u8 describe_id, u32 message_id, u32 valid_size,
> > >  			     u32 domain, void __iomem **p_addr,
> > > -			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
> > > +			     struct scmi_fc_db_info **p_db, u32 *rate_limit,
> > > +			     bool skip_check)
> > 
> > This does not look like it will scale.
> 
> After taking a closer look, perhaps it needs to be done along these
> lines.
> 
> But calling the parameter 'force' or similar as Dan suggested should
> make it more readable.
> 
> > 
> > >  {
> > >  	int ret;
> > >  	u32 flags;
> > > @@ -1919,7 +1920,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> > >  
> > >  	/* Check if the MSG_ID supports fastchannel */
> > >  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> > > -	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
> > > +	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes) && !skip_check)
> > 
> > Why can't you just make sure that the bit is set in attributes as I
> > suggested? That seems like it should allow for a minimal implementation
> > of this.
> 
> My idea here was that you could come up with some way of abstracting
> this so that you did not have to update every call site. Not sure how
> feasible that is.
> 

I'm having a hard time finding your email.

Why does the scmi_proto_helpers_ops struct even exist?  We could just
call all these functions directly.  Do we have plans to actually create
different implementations?

If we got rid of the scmi_proto_helpers_ops struct then we could just
rename scmi_common_fastchannel_init() to __scmi_common_fastchannel_init()
and create a default wrapper around it and a _forced() wrapper.

Some other potentially stupid ideas in the spirit of brainstorming are
that we could add a quirks parameter which takes a flag instead of a
bool.  Or we could add a quirks flag to the scmi_protocol_handle struct.

regards,
dan carpenter


