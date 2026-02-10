Return-Path: <linux-arm-msm+bounces-92410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHypNkDOimkUOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:20:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 106B211754A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BBBD3008455
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 06:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAEF2D193F;
	Tue, 10 Feb 2026 06:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VG40HT/Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7322E7164
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 06:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770704444; cv=none; b=h49lR4ADGEej6czldFYkaGac9Z796hurs9wZvuP8nmJInmErXUGpT9C5ZIgclyNtoZemUrmUbWbWJzetoPPBP9NE4I6pw2VukiN/aBHX05UL/bPOrYgTY+V7/JicwOCYR2DCNZtGsTGjBAwo/dzFFfjHYNDbS7Z8Xp0GDgi0oXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770704444; c=relaxed/simple;
	bh=SEYG66B8ZtLuXgv2nsuhGS6fllKN1d8ENv7O1dAcJEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzL4qGUjqrbb+pXr5ZCG+Sx/L4NHVd7+W0nX6t3pwAlbMnOShsrad7ejs1FE/k1CUtLS86lEHBAOzq3Vm6fJawbDBMfghw853PIdizcHukMaoYGJZH72Azu0Xzi385ETh8X/QkqVJGDmxbtqno++mKDSzERh3n/ScHU/8KfL4wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VG40HT/Y; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1270adc5121so554182c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 22:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770704442; x=1771309242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AgWuwLpuwK0cTRarzf0Yohoxjvezc1aQian77BUVRlU=;
        b=VG40HT/Yo1xVlgykPCpuUNQAlmLtgOtlXBKB7lm53NlxtZ5B1aHn2wkMlZeg8+j+Od
         KcSNK+XfPXbv3wiCtz4cLFaCWstozCP9mesd413mVV5icmozgLBHbS29oFNQA5uTnkbw
         Mlw5I8r4cKDxfqrTGAMYM4/cWMwhA7yudYNtd8y7KZm73QaJ5M/i/pEElMTAMo7Bqwwj
         sAmJCg78yA28Y620ukaiODgphsMPaWy1bIc1VE3RT/ekw7qxjIRQ9c1igEukUZFDZm9w
         2DDTrtH3nK4SJHUUpZpzpnpckBAR5GUq16ElEffRIB/WsSaA+TqYzy5Y5wOcNyXTKlnE
         yDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770704442; x=1771309242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgWuwLpuwK0cTRarzf0Yohoxjvezc1aQian77BUVRlU=;
        b=ns67rc/tHYB2ijukmF6Fajb+baduwmNspyxks92Xrn5qxQzZvysCoypBC+atQZZ6qC
         yAr8ICVLd2tdfOVjcaWeL94vUEc7WTSN55+pPp/z/z2UijB28CXLhLWBxFvPHis9yuYR
         Fi/n//s9wBPlEb4BubUi0BDixeSrDO+kCE+Q+n44u/+oiE6mMvurq3po39PxxH7NHdP/
         gaRJec5aKjL0Hw0vywck6DsQpkC27qdE2A5k2jBg5LY8sk0jUQqRQxqnOl4lDc6bBYmP
         ezRVFmFw7Q3HmUr2kT1y/cWDS4NCb+UHhcyGGzItnfMFyyR345jxcj2uitoBDw8a6uhT
         z6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq1vWxkxslopEaKJ7pkp23tGmS6FNvA/uIQQlO8LF6I5MxJ1TwlBdDuOQeVMHtJJlAQl8A1Fq2JGL4vNhK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8HlD1f+EkrGfIbDdTdPK5ALEZojhQqAscFMoBra8AewQS5AnV
	RabKn0iBbPStRUf7NoPLOlEMRPQC/e7YOaGGFCLFN6XpOMOiofpHdjY/
X-Gm-Gg: AZuq6aL5LKqjzwOUQjEMA2EYiEOrABzwfNr/I96wpP+W4OqSd3IOJHJIbYygnHAuQh2
	bVHy/2jDiNgmx7eLVaA/sy+VY/kvKDlL5FaA85wN3ylr0UoSvHOPL2Xt69OHkd2Gv61UljBlVZY
	6pRz4htcPPWj5KaHRgVQFEJ9pG6BdkOeYqU0g7muBC0AVUT+gNb4xw8fZsp4D39FDBQmPOCZOeP
	PS7KGHv7ephIkA+hp/MU1wpHmjUNLUXDeacDDdCNgDvCNhfP6JLYnOYrnL+hOG/+m7sAEwSQisU
	D/nl3Kmr9Qw49SRMpJllqqJkE8vDHtKUWkykvP0BX11axkFQXH3yMRLrFh1cvFqm+oL36Xtdv8U
	yhHo2dxd28P+2trFW9sOAcOO7lLfEiWWhGAbVTBWvbFJYWjSfTETYhp4HcPDl7IvfO8uhD1Uats
	uCgVvMymkHPIxySTDAM1aL+rqo23ipVYcMgKwfw4hLUoOGqVuVnWLa9HTrJKOXbmvE
X-Received: by 2002:a05:7022:2523:b0:119:e56b:98c1 with SMTP id a92af1059eb24-1270405d980mr5709422c88.40.1770704442142;
        Mon, 09 Feb 2026 22:20:42 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:616e:78a2:cc03:4be3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba89ae14c9sm887685eec.29.2026.02.09.22.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 22:20:41 -0800 (PST)
Date: Mon, 9 Feb 2026 22:20:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: input: qcom,pm8941-pwrkey: Document
 PMM8654AU
Message-ID: <aYrOMvIJdiaGHw9k@google.com>
References: <20260209-add_pwrkey_and_resin-v2-0-f944d87b9a93@oss.qualcomm.com>
 <20260209-add_pwrkey_and_resin-v2-2-f944d87b9a93@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-add_pwrkey_and_resin-v2-2-f944d87b9a93@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92410-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 106B211754A
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 06:53:37PM +0530, Rakesh Kota wrote:
> Add compatible strings for PMM8654AU power key and resin support.
> These blocks are compatible with PMK8350, so use that as the
> fallback.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>

Applied, thank you.

-- 
Dmitry

