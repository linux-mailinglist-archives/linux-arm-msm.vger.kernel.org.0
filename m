Return-Path: <linux-arm-msm+bounces-99208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEoiFhwdwWlaQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:59:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CACAB2F0B29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:59:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DB1F30338BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21742390237;
	Mon, 23 Mar 2026 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iT3Bb0kP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="l9hM7TMK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62413859CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263232; cv=none; b=rlyRvf8079+eYMgyxySSig7xrH4+TQcKK4ibW1mIWO+LQIQvv9hLXbkEfElXMbg/WAsfDGb8xbhS9MMEkeMKnB4KnV6MTT2hy+oWzIdmZUqNKkKoCk/qSxvg2VYLE6Cc+0sKMz00KD09t4SKp8Aj/nUjCbv5XwhfML01zPWF0Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263232; c=relaxed/simple;
	bh=w5gAVks6i4eCJL/XLHWcDKk0c+PivOriZ11Uu861GzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaAjuxzwJonNG8/mCUNXPhEvkOFR81KAwGCMXniPHHQm4xmgPjqlhJ7aMEWqJhBOefrMnuhbTOIixROnmlfNp/KsrLsHZT/0xz4E4KYCzy8fMkcesvzQ6LHo2RX2M1Dcr1Ant1np4UsL6x/Q6X5OhaTO1rMUdUizcOUn+uIGwUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iT3Bb0kP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=l9hM7TMK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774263229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yx4+4+l1arorWkWKWlQ/lP/rEQyJg55LIMd4QQKC0Oc=;
	b=iT3Bb0kPWzChvrsuBXrqMxSa2Wy53U2b7NhgzMkBL9eAVcWfKC4FGN5YsfWplSp6cZx7Hk
	mbQDuOid0ATwZE28JGJcodUwCzHYHILFW12d9qwzyKu2ByshLGH9GgfQNKgPDJBQxCECls
	J0O3Nf5lGz3EYibjThPvXAIO1fhAWn4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-Tewpd-_DMM-EzpNnwOsFaw-1; Mon, 23 Mar 2026 06:53:48 -0400
X-MC-Unique: Tewpd-_DMM-EzpNnwOsFaw-1
X-Mimecast-MFC-AGG-ID: Tewpd-_DMM-EzpNnwOsFaw_1774263228
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a0013d87bso109074476d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774263228; x=1774868028; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yx4+4+l1arorWkWKWlQ/lP/rEQyJg55LIMd4QQKC0Oc=;
        b=l9hM7TMK8EYwd2M/K85sY5UDbIbqSUa+RyvyPo7+rVgJxyIAmoK7BWekhtu9vCEr33
         SJYl19IWRt+CS1r1G8O1PxPDXAIe9nozmsXmxkzaX62ciYA+qJefdqWhMsiZafKpzauR
         /Gt44p8KZEiwA07N5kQB+KJRYQ5DnXkie8bNQg16lUeq9umk+3CYlBgruqNXZQmg/7sL
         b/TUKzUrEkypnLqA56BBIp5BzkSrrCIpn4wdL+ZVAYcc8N+IyqsvD8N2kfEO8xl8EY7d
         4dzDN5tY+VJp4jNRuKeLQNY76Kb/0EDav6GQP+Z/3ShiJf40yMfhpPu5N+EQWQQWw7+Q
         6Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263228; x=1774868028;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yx4+4+l1arorWkWKWlQ/lP/rEQyJg55LIMd4QQKC0Oc=;
        b=gqi0z/aX2jAR1X8fq/bxRPcDCPvvHh330MMu1AispB93qvHYDb9MXQ0Ub1J3LFnDqe
         M0KTxbTHesy8YnaoBpMkawKt3PLoFezhl+6rop58XqU8/zAWFXuoW8CLvUVQgMxy+RwH
         0HAagakQqxV+p8Kt+QA5QdVoJWmwodk739K3JQ5bBUyWTUJuMWBOLJFpcsuVZo5jyxqd
         oCM280aTbpVUYqEkaYqt2H0XY1TfK8N7FeqK+Eb+wKLvydC5+ZpsPa8rUfJTd6FyAMfl
         /Pm97VDgLgzaNibNWhibyc/fViMvfhMsw2F8s1xsTpAUKIhHF5Eh6bcpgyVAdL/qZ8OY
         ySEg==
X-Forwarded-Encrypted: i=1; AJvYcCVEduKLzs92nbojChQpisA3eQdyqMM/dY+ScL70fzYr/BE6Ol7RMswLlMFP7mQx7/JRyPUMT/dgf8aPVFDO@vger.kernel.org
X-Gm-Message-State: AOJu0YwP90nENDUvDPIae6KxVHSULUo6bXTyc5/TyIPTAnH9Ut+cadpV
	fVUqe+AiDPXqfqo7sVucy6yqawoREL85UMv0LQzodqj5rYKgsx5Vc/BRJ4pMjx/YYVrsa6a0PoN
	lT4hGRK0fT991WtfOuND3SrXSe3pvVIf6KGkZ9L+RY9oNsGpZcO0tEFkAl58/kcmmz3E=
X-Gm-Gg: ATEYQzxgNKGteh3sZfIEMwFQ4CEGuh1kQ299H4B0cDthuW8/JmG80jjWjER56ZY9Tjn
	M6tN7qHS5bwmDXKm2cE8EvKhhxn0QU8jNgomz7WHb9eXWIWxVtn3TkT3H+Zb8XN6kDnLaN9PDBg
	dTbxkkwEIlSJfekGJ+mWIhNLjoCI+XzZpdoy4KLG1WXekDYCjhBiJO3OC6Mnutit1tbtA6f3VaT
	itTzC6IuFCPWECQgLTNqxjGS2FndWrbhg50nnjTouMPNzDwlBi2XC5eiZTElFb8Zw+lf0r7xs7t
	If8WQr4m7DB1MiFXukv4+PVoD8ylSGHRsym1zNR0/ULoWPtlk7dmHtF+1S1q7JFYWGRp8YirXWB
	ulD2gbi5wWojEzZ0bh2VgeD/kf8FzeFRLhmQK5++Rfo5gkvPlCC+ZstHI
X-Received: by 2002:a05:6214:601b:b0:89c:5f6e:451f with SMTP id 6a1803df08f44-89c85a0fd6fmr173905686d6.26.1774263228108;
        Mon, 23 Mar 2026 03:53:48 -0700 (PDT)
X-Received: by 2002:a05:6214:601b:b0:89c:5f6e:451f with SMTP id 6a1803df08f44-89c85a0fd6fmr173905356d6.26.1774263227651;
        Mon, 23 Mar 2026 03:53:47 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8533573asm85089416d6.24.2026.03.23.03.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:53:46 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:53:44 -0400
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
Subject: Re: [PATCH 5/9] interconnect: qcom: define OCMEM bus resource
Message-ID: <acEbuBCsF-fxnNpB@redhat.com>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-5-7892b8d5f2ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-msm8974-icc-v1-5-7892b8d5f2ea@oss.qualcomm.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99208-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: CACAB2F0B29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 03:17:21AM +0200, Dmitry Baryshkov wrote:
> Some of the platforms (MSM8974, MSM8x26) require voting on the OCMEM
> clock. Add new resource for that clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


