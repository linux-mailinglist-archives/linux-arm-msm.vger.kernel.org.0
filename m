Return-Path: <linux-arm-msm+bounces-95252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMdkMIO7p2nfjQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 05:56:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9D21FAC6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 05:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CE4C305D6DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 04:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1959837F8B5;
	Wed,  4 Mar 2026 04:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFGDBpuJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0095237E2EA
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 04:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772600189; cv=none; b=AJVawopRkdI8/QOPv46Yo4T/2daPRA7Juq8KPVvAwJScWswsRFKl3OSdVhA0ms03yP1/pObrPGmGgykK186DulmMCS6cicNv4g97McpSIY8K3fEg5KxrV9M6BVAmJYphBT1EJ0X8N7Jf6Ge1u4NNFvQ0uHraaVWFyrw3gpSEgk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772600189; c=relaxed/simple;
	bh=UvPE5KRZ6oJZo3zfJg7jfhskZOj8msyDuu72/RzPLkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMeTNuwulp9o6b6jooWbp+wBUGvrKkT5E4631RwfVqtDB2oZ71apwanRlvTMpoc+kS2eSRUaeXwDWm7XWat/7Ad4ryThlHm3G7l6p5cx6tSL3cin6QD7KAmbTjuFFVvL6VFg42Pn24vuKCtGMOW7yxIVhrz5/oAw9Vx4tMZln3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFGDBpuJ; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2be27fa54feso1635421eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 20:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772600187; x=1773204987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aTVcJPVpzFRvlrM5JfQCAuSEqp9bcj4wWHMuF6BWOGQ=;
        b=IFGDBpuJy/7IZ/5YUpIsVtURidmeCtrpsAAkxNrxiC6nf+MKT+z+CwQAphQ1m/oSAb
         sWytT6unxtI7JdcXS57SYoqGZeGnhoN7X58Z4a2e71dFLfS5UIGH/DKbndocTkWf6Ssn
         WUwoxDqlWGz8NOB3brMhem7NcYGTIs2Z+AoPxn3LRucOguAWS1wtRLFWW4O2eqIcucDK
         3IU74kZj1rWfrCtef6wTOXKg+mrK5VJtfYeA7S6awBAIDCpZZmHuYXcbcnulDdvXHCxN
         itnpBs4wOPjSke2b1/2bFoUTrTCYLzcBWgHsWmvdw34HHcWGyru1Wz6wFWGyqIqTDCkT
         6X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772600187; x=1773204987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTVcJPVpzFRvlrM5JfQCAuSEqp9bcj4wWHMuF6BWOGQ=;
        b=p6RSXPxN8i9thQuwSakDbB9DI0SbNMjBfw6Bx+OBAF8IsLhekbmytws5aZS+cb7hbL
         uPTAYgRoZUWeQ+4ka1QPk7BwxLGn+L74uNvm1Mphvjm/cIV1+ntjJQuUaFc+UmH9dQyk
         KUEQTBiRQJJ3sRcQtQNG2CxeUSYQfJq4lyYQyilbHSFSnigOxA3AtCvkLoXNezsRRYzO
         WbSKLDn1uJTrrywZROKJNki1eFDqnyRtbj2d8f4SxX9RlIF0thGZeEwjo2GElfNq/qDn
         6cbNASrtnkxDWEQ3X2pmiK0XrtSLxqn4fJfXWqlrurpJhu2kqmIWC3LiPVWEIOPXgFCp
         AHMA==
X-Forwarded-Encrypted: i=1; AJvYcCXgv5Rbw9fPk0nn8oqE1RPyKtdxeJ/y5lf9PGbTYXwQXJgynCIDPvJNQr5YNNmhBrs7W+MPeXY4iT38VwMJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxvS4XOR9V7jUWfwpwPaQAuDiBShhVxEBF5n8DP7r5GHDgULAJ+
	sHMCb+ViD251S/RIztV4IrTz8rzuWZ+m16V1f3xdBXUMiES7hDYkWsCZ
X-Gm-Gg: ATEYQzxiLsRLKrSjePwMGfP+yCRchbabFUloiPxFqx0+FbB+jyiTShOHZNbVPJ8+4xs
	woWMhBmW5woJT8P0TttL4YwSSmfAi548FYnqh96WGvzAptNGa0hqgNSBE10umJO2lZDUkl3+J4l
	byjAEUGeSkIzWBEzSIl0jZn5+RAwujN954f5vynQnhfJSz86GhRVnuEyVjI3ZdDciY6D0iU0YTU
	SMWLLI8VOhmhUn1SnnB8BjzNIC1RcTCsUJOSnVmTn1W5TyAFv50wSWp5VzRGtRjFBBnKdtt3Ac1
	865izVlASvB19v+kh/cxlkDVojzarA/1572U97Wjktc22ixQX60YpPzwvnK6Vu7xyl3nZx4ugMR
	rUn13M9rmEExcE9+7EYYNSqWzrQltoKfa7F/yUgjRZo5T9gWoTEIbK+pR+CmcKpN7bxqzTAQX32
	HJjuraBqf7E5z0b6ghMZi8X9+ylkQ4Y5ldd8aS8iMto6u0my2V4Ksonu/bbugSnvlL7TjodcE1Q
	tY=
X-Received: by 2002:a05:7300:dc8c:b0:2be:1803:7e11 with SMTP id 5a478bee46e88-2be311bd422mr242905eec.30.1772600186892;
        Tue, 03 Mar 2026 20:56:26 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a048:d9ec:d217:7d59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be12805b93sm7512637eec.15.2026.03.03.20.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:56:26 -0800 (PST)
Date: Tue, 3 Mar 2026 20:56:23 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: input: awinic,aw86927: Add Awinic
 AW86938
Message-ID: <aae7dQsFhJnQWTYM@google.com>
References: <20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com>
 <20260302-aw86938-driver-v4-2-92c865df9cca@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-aw86938-driver-v4-2-92c865df9cca@fairphone.com>
X-Rspamd-Queue-Id: 7E9D21FAC6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95252-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,fairphone.com:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:50:26AM +0100, Griffin Kroah-Hartman wrote:
> Add bindings for the Awinic AW86938 haptic chip which can be found in
> smartphones. These two chips require a similar devicetree configuration,
> but have a register layout that's not 100% compatible.
> Still, because chip model is fully detectable via ID register, these
> chips can be documnented in the same file.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

Applied, thank you.

-- 
Dmitry

