Return-Path: <linux-arm-msm+bounces-91570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK+bAFlJgWnNFQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 02:03:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7343ED336F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 02:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F629301A170
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 01:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A5720E334;
	Tue,  3 Feb 2026 01:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4TTZCmi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C742C4369A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 01:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770080596; cv=none; b=WQOMkjqL8Zx46+8y5PDd6DAXxJe74B++0UGJ/qlLhw2QoS9xH+hKS0+2FwBzcqMwgGpFnEDwplsTaX2KAHmZRrGMFkRKfN2Gw58NQvuHOCnm/v/BqA3N1l4AEsa90ha45GywbeqcCM4ZSvzqTmoUNKRIktpkQZred+XzLJ6BCTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770080596; c=relaxed/simple;
	bh=OPkQDVKI9hLiMmF3foIYgDEoUTaWIv2KJG43+nRXSRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KtAt3LUDo+UxKpjAOWZBloVEiYqJqV8Cn0Z8Y5dQK/jlx5SbIK2CEJ/ntA1ESA5NCyXDbBoSqFESGxOltc9too1zCbHcLzwKeCY04aGA0HYPFdtTfHrMAbSrxGHlosO6PeS09uDRFBtA53gdm7c6SMmyR2XCKn2pTne67iKeS3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4TTZCmi; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8887ac841e2so45930156d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 17:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770080593; x=1770685393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4HDdB99E4CdIl4ZvDTOk2E5hND83PuSdUEsGJyDFfRE=;
        b=A4TTZCmiMYOLtMg2gfDl4HwqPZfAuRoxjqNQGudqDTL+vwhLm+8Wyykehv0s63WO9Z
         M9u9pB+c1mUUj07D/LVDvcWRDBvUAP29whPqnaCbVQ4EHK+aDSkpBvMiy1cTGuXz/LkW
         Ou7L2m9AdUt79EvZ+LbCaHzIcYJgoFOI24OP2K3zsZBueIhXwmKEL1sVKuDZeJ/R5WvH
         eNstFJjGZViS5WoJpoO0rvy+ASXNXBOi08JZwHp5C4d1aaIMaTboRV3V3rbWVk9NPYdL
         auC2fI6ODcDiwYDXRRRppw0/vRUZ/IRm+SObSsYVtAujz53QHGQuwY4R6ZecojVCTrMX
         eZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770080593; x=1770685393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HDdB99E4CdIl4ZvDTOk2E5hND83PuSdUEsGJyDFfRE=;
        b=eqeBWwYpafjlv3Pac0hLzlnSIoG2Uon7gZqMIkokHeRzrL+9QEby78DDX+SUKFjgzl
         xcEfKDNGY3wo3Nw+PSMf9n6C1TjedMOhTVwWi6GR1JMmBWcKq5DdH/5396rb473LcyCU
         kto3qVYXbtN/FzGCZYUV6Hz5i9p6uoifAyV7nppPtsKDStJVziwdCkuEkjRNhQl6hqp7
         a/iVGC1YtaLRm6kg0kUtaFLlumnDchqwHLhscGqPiOoWpWe8PNweEeBt128GJ7BjRyWH
         WUD1XQQbkdSXWZrX5giFoGApNJwpjDEF805DPz/L+ytTJrZr2GpYr+Xlovd1wiSIIgl/
         pzJw==
X-Forwarded-Encrypted: i=1; AJvYcCVPqgzxB7HNyKL7B1677qWd59kfp68X4OzIb3enuibceKLa+tZbGD7AUqc5ZREMuGpAfg+J8UUXPQvBSIKa@vger.kernel.org
X-Gm-Message-State: AOJu0YySaTnKQaGL2I5hkPy4o30h+BajQ1Anh5W7hxWiur2+8gnAP8bj
	/IwbYfzRLIaFIZej47m3Y1lWq5P68YFctRb5ghelup/Fn/FcOizklUZ0
X-Gm-Gg: AZuq6aIMfrVdwXLtCV23YWcIlzOg0+E6k3NBXwF9WYRcgboo18W2j7EB2nhe9KtRHyS
	iOvDi2OzObsXYZLgzB9lbfvQvwp9Y4u+C3HF0vDCoNMESCpVd6BxsVA9G6qNKTybuNqdh3ivuYH
	mZn2P4bOIvXBAwghJn/PPNduUc3emXmGnhwxTAvLaSA0L30+xSrJ9HBuCLM/V3hu8pS/GdwOD5i
	qLdLrnWX3C94lewf43RGvuCWINrcXULm5n/ljLZR4+snxUPRf5bAiYpGMS/XO4IsTm6hfT6FdJk
	LjqsVXUz6OzreSzKhiWCyhagVxN9jIWajD9BW6ZqQNq7bNmNUuk8y1kkgYaf8e+kL8Cru+1bbhp
	xPwMfkItzygPM2HJcPtn9CUAtPwnd/I1Tw0VhnuUTv5se7tR2OlgsK4KYqZ2CIn4vdoMx7ER94b
	LzjTYlJMC059nIoHMepkW+SiEHLzBMD8xGsjH4XC3aGJtnd13lvU/iINkWbtwTp84wjpr/UeJQZ
	raonWafHHisYQ==
X-Received: by 2002:a05:6214:e49:b0:894:48f7:9919 with SMTP id 6a1803df08f44-894ea10065amr196085236d6.56.1770080592742;
        Mon, 02 Feb 2026 17:03:12 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d376e0d8sm123753126d6.53.2026.02.02.17.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 17:03:12 -0800 (PST)
Date: Mon, 2 Feb 2026 20:03:47 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm/gmu: Add SDM670
 compatible
Message-ID: <aYFJcxOXWpuuC41I@rdacayan>
References: <20240806214452.16406-7-mailingradian@gmail.com>
 <20240806214452.16406-8-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806214452.16406-8-mailingradian@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91570-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,quicinc.com,linaro.org,poorly.run,somainline.org,kernel.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 7343ED336F
X-Rspamd-Action: no action

On Tue, Aug 06, 2024 at 05:44:55PM -0400, Richard Acayan wrote:
> The Snapdragon 670 has a GMU. Add its compatible.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Ping, the contents of this patch seem worth including in the bindings
but I haven't gotten a response to this patch.

