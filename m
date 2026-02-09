Return-Path: <linux-arm-msm+bounces-92325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN5BD2/2iWl7FAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:59:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF03E11158B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEF84300E624
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 14:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A0337C112;
	Mon,  9 Feb 2026 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioMmyrKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEA237C10D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649184; cv=none; b=W3IqnzV/QHvGxSUJ75HDkvQ9nGpO/5fnx01mHo50x/v0CJRoqkmWKlpcA73IAcqoBlvyrg9V9AaXeRJucKt13w0A/0G5SVUeNiTq3vr8+P7NW86zdTYL+Q+igzhnLM5CA0PpgPjP58skG/wz5pAxVHr114+hyx3RXg2PCf3ERm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649184; c=relaxed/simple;
	bh=DDbQySwtY8GnVjkf5RDP5/xDtisakVvfL2uYOituzWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOPxJ2m06aBvyTjd7MpK80m7V3lT5IKWlMtAqj4L+0bqXyeg/T7M/BobgO4YSNNi4Wrbqw16xTfg9bvI2Af+YOLEisJ8DQUMCqiWLdNh0blfeDk6MNXpAYqPI7ydE0rr3yricTaoSlxsZ3KPc7EITuqoF2SHzWVLg2L4Q2GKqBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioMmyrKf; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b6b0500e06so4363781eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 06:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770649183; x=1771253983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=or/TyMMcDi3QCF02Finwtjs3ACbwOGSvS0XrkKNuUkQ=;
        b=ioMmyrKfaGKgoCEbo91HtdX6Tv6+f4SO2xAc0CvVqi9Pq342rOe5hOXkNjvKtnu+ma
         QKEqN+ir8/VjIS1RB4SVi4FQ12563/owQqCYq6IY7lR4cVxyOn+GGbR8cWiS16ll1hte
         glb4SEM/iBEZG+IoXNjhwWcIuMibvQZ436hMHmTOYvP0ibEkYNfj3p9EixoDD+9/CeFl
         6P/1tGKtnYhz+RvDTap+wB4RL4ucaKgSlLOdBqr8JTa6HTNc1ETwlYSKEvQqLsaD0R9q
         IrmArc3jMcCdb/6nN4yZydLTTCnPtykDMDi3lT3PXqoEF02U1wF6Mu9m6fPnukXLVuNq
         EEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770649183; x=1771253983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=or/TyMMcDi3QCF02Finwtjs3ACbwOGSvS0XrkKNuUkQ=;
        b=WMzS1eLnTrKE8ppnP7zQxYIysPN3pkR1bDNfJ/X6+Do6mMxHV/l7dWnSz7u0eCd1wb
         lSQBLsHa4IypwsHrQbpjr348T2m1bO6N2LDyEbiOT5BAoyYG1x7TQ3ubNetrHA3q23o7
         hWOIyDjPYkcNj91JsNHIr6AhT0E28bmV1PT9Q3/xEK3OrIefl1tXeGRrGU7dF8fa7DPQ
         7HC2XYVei640Lu6kOaGyoaiuTJt+4AjCc7oFMx4RXQHzrD1O+90bMl1vnXozAmzKDuZB
         M9qEufrfv/pRamulXb5npFEB627G6w3JTpPguhFiMF7JanmjvZsvv3UpeoliHHgiuhpd
         BBEg==
X-Forwarded-Encrypted: i=1; AJvYcCX+rvjf5dqGrG+g4KiZxiLlTR9DVc/ErPDMpHQAg5mvacjXgiebInL5UbIxmwjrZuE9ndxLJCuq1f6fHdaX@vger.kernel.org
X-Gm-Message-State: AOJu0YyQn/RDwZciP7YHtEuIYHFIlfBTq9tLW51fs9h/DxZXLZqD2E7D
	yhDN10hc0te2qr3rbEKPacdhCDWj8wW2YHvrTUVg52EYw0SV8xoQmX8PYT3Ibw==
X-Gm-Gg: AZuq6aLPfM7r3NRX7rafHdvP39AXmP6emasqVK1SVaO3wj9yKHSv3Vfkv3SbeiVHWou
	ms6PcadRemcD1cL7/iLNQjNQ2jbipzd9TY9pbH1j0wTzfCMeVLrbMeoO8SwOhq3cRU39zCuZW+9
	2eNm+uMoxe16S23rkejzGC0+6K1rRTcCHwQyR8iq9HH0ov0E7L+taQHY7oLI23x3w9TOjlfQQGG
	cPH9wK4F/3ONKsWmnacf9ZeyIeECk8xih4gh88uQ3L7FWQNamvyRMi6ZjTCIdn2M/+NQA7AGcmg
	67rdG8Ntg7xgs89nzNbrxY9jrnADdZM9n9M6CanJ+r1nR6+LNYjKvUikKtZrUePCYp0vAx4yW4p
	dzIyzzZxo9DsK0ffPIv/APYQ68NIhwsdJNF7kpHGzkpgNGouCiRgh6enLbD2MPRhKAV545lt6xr
	acg9rThVQhaHRLQGcAF1pkOXlTCS6Xg1absNq27Wrb2PeUT3lAMw==
X-Received: by 2002:a05:693c:6319:b0:2ba:37a2:4aff with SMTP id 5a478bee46e88-2ba37a258f9mr1540224eec.14.1770649182911;
        Mon, 09 Feb 2026 06:59:42 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d70d:15:1011:7b14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c3daf7sm7817736eec.20.2026.02.09.06.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:59:42 -0800 (PST)
Date: Mon, 9 Feb 2026 06:59:39 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Input: aw86938 - add driver for Awinic AW86938
Message-ID: <aYn13PdUF9MXhmE_@google.com>
References: <20260209-aw86938-driver-v3-0-5c79cff30492@fairphone.com>
 <20260209-aw86938-driver-v3-2-5c79cff30492@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-aw86938-driver-v3-2-5c79cff30492@fairphone.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92325-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EF03E11158B
X-Rspamd-Action: no action

Hi Griffin,

On Mon, Feb 09, 2026 at 01:59:46PM +0100, Griffin Kroah-Hartman wrote:
> @@ -377,7 +390,7 @@ static int aw86927_play_sine(struct aw86927_data *haptics)
>  		return err;
>  
>  	/* set gain to value lower than 0x80 to avoid distorted playback */
> -	err = regmap_write(haptics->regmap, AW86927_PLAYCFG2_REG, 0x7c);
> +	err = regmap_write(haptics->regmap, AW86927_PLAYCFG2_REG, 0x45);
>  	if (err)
>  		return err;
>  

Sorry, just noticed this: does this really belong to this patch or maybe
it needs be split?

Thanks.

-- 
Dmitry

