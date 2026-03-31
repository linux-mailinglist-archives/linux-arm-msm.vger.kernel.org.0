Return-Path: <linux-arm-msm+bounces-101055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JfhHNkzLy2lsLwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 15:25:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA1936A39D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 15:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11C5B3044A6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115333E4C93;
	Tue, 31 Mar 2026 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YKDlbfPN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8957721257B
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963241; cv=none; b=OdVoSMpeFhzhg8UysSqkS3iRgXdFkuhGipTNGRghpbIZkUvl2lJM1Xsx873NzGMvqi9/NepY9aS8GyYgbYviuEK97beNdh2IZIBOSUBRUTSgBRR8JlEPemb943KPT6F6JDFXTBuuwhimACCUsoFN9v12eFTYBt4zcmchyRsmrDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963241; c=relaxed/simple;
	bh=FHCG1eyKPTFyYzgTJ8AuOuQbuY4G/koxwDmMSh7hUqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8D0m8KtRt0SmpSmWZEL1nYf2QrQvgXStsxpi3XExjnX2tizY4YXEc4Zzle7ztRb9h4WEMzu0KNjyb217ZN9ZpyvX0YvweKisea4FW9VVKLtz2YWdVNkDmNpTXc6K3sZRDnO/CHWxD9WzXOhWivyQkV5aUA9Q62jilsmperpwP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YKDlbfPN; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2b2137bafso187044e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774963238; x=1775568038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Fd2h35A9jrPAd01iGaIxV/0FHNMxJJdX6ssgg+Eiwc=;
        b=YKDlbfPNBYT/RzZYT0AEy6bhZdIHIaPWEUMKgdo8Qw1uLVnbYcmnuAON9e+9NWXl3I
         TVPzZwo4e539EPFMnU/Uuj98yNLXnYyDgisFZdhnDkqPTZOnEFcVmMjpsAhFp/+0ASi9
         o8RE7rGXKvak62nMUm1uWGjH1iXRdSk7qVMoIK2jDBf+OE4RPcuMoXTETfgkONUqmftO
         Tmh0k3LcKw1nb4dMHiy5uK/sRPBlBL6WjR0oIIKOLhDas5M9iRdJ2983ZszUmwCIc2kx
         Li8dilXnUx738GWXm8oyn6cjrWcrjMUBeBwy4Kttf1qg1b508IJ5I1L2PK29FsCDitpY
         8D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774963238; x=1775568038;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Fd2h35A9jrPAd01iGaIxV/0FHNMxJJdX6ssgg+Eiwc=;
        b=qqE0FsjGEvY16/Eqwfqy4Bi1GAhWj7swbYnOX91KOLx0EELERpa+BTgKrcjCe0ijqr
         Z2Ttll9z/W+E1G5z4YKwdZDjParB3GvPuYTLTocns+ZEt4b9O2n+3ekT3qZcoJMy+f3r
         zF8rx6UBLoPUwxFZz9uICwxcboRkZYic5XejG7/h1lTSzc3Awxsm1HDgCT4K9nEIVf0v
         0Sgn/2D2bCIR0Yo+HXa5TybjSj+I2cIOcLRBkcTszZC9tfWth3YWSeCDXgmxbWBq9uw6
         hGhy5WYfrXkVQ2uxrcaY7r1J5xbwGJn+x3Ntxh8Kn8HAok8jzYbn/s+GRxLeTKc2r8AL
         h/Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXwR8IgxD8B/dwiSnoTA3vlJKhsH1mkba8E/rAc/WrxV4c29VOgmyc2u9Yy9LzNDtANOBNXIlZOYDZo40u+@vger.kernel.org
X-Gm-Message-State: AOJu0YwQs+AVkOO9IjT6bRY5YWqCSiszqbjze9D1Rvo5pqnkYnfyAASw
	ATakPxjiy3VHc/9wFM+IDqOIjXwXhizFQgoTv0ztA+U2WkJdCVJFgNo+SurEXmPRKPwBO6+s9MN
	dkq0c
X-Gm-Gg: ATEYQzzThr+rdk93/4R2iHoZAx//GmW3coYmTXBgoR9V7DaaBNTGhif+/McboVay30D
	5fYOwl36hvhOwbj5MCmyomXoBmlwLfEAx7zGAmmLTJmbG2+OROwA+XlE4TIw3xCRjCI63ZrbRyC
	AZMdPvszG+NfdgpcITIbsP+W+Eu8Nsry/Z7uhyYdUyDSV/156fhVNjLwYCG6djwuFUrjt4oSh71
	clZSIq3DcEdp6SyG61T2gJjSelCtdpG1QjACU06IGXSoXkVMZHkKbSdnQ00DzNWAA2GIJagYKGl
	ma4Dg2L8UcCVOZD+Gfv4GFTyrQyzIFtCdUKkvfn9WMi0IgBz7CnmPLefm945o6iN03Mo20swDCX
	TlHjXOPHSn5hxbUrME5+JAKJ8NnABrKDJsucK9znhdauk7jSLMoq+M9r3SQZrsbpk5oXdgJIyeT
	/+N72gNg3Uthln+c9xPgNmUB4B35XDaQztg5kE02+TkOcJBSgA20eq9YTTAEl3Kbsq/nGbxeLcZ
	E3BQg==
X-Received: by 2002:a05:6512:3b9f:b0:5a2:8516:a52a with SMTP id 2adb3069b0e04-5a2ab5fcfcamr2769606e87.2.1774963237655;
        Tue, 31 Mar 2026 06:20:37 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b140a4d3sm2395494e87.34.2026.03.31.06.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 06:20:37 -0700 (PDT)
Message-ID: <bc4579ce-294b-4553-8166-55cf4888c6a7@linaro.org>
Date: Tue, 31 Mar 2026 16:20:36 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: qcom: camss: Add SM6350 support
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <20260216-sm6350-camss-v4-2-b9df35f87edb@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260216-sm6350-camss-v4-2-b9df35f87edb@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101055-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid,fairphone.com:email]
X-Rspamd-Queue-Id: 4CA1936A39D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/16/26 10:54, Luca Weiss wrote:
> Add the necessary support for CAMSS on the SM6350 SoC.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

