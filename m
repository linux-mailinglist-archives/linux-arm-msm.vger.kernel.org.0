Return-Path: <linux-arm-msm+bounces-110960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NfIBJdcgIGoSwQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:40:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F5A637987
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:40:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=WoOVKHkc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110960-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110960-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9D8C30356C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 12:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472AD3D413A;
	Wed,  3 Jun 2026 12:22:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B157C1E505
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 12:22:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489337; cv=none; b=PCOc51Gy1X+H5lsnVfVW/uaQo2LihYjhPgE6sWfkG1H3yy2qiVy1pbNqrQReYDvaQyYIgjTHN8xJzOiO5W+cm6PlmnYhyN4clhg+PAF8oywsW5MHRyH1jeVB+B9E5hk16GQKr5akq2kScGefarZ7TtlK+dC/aCVrIPmT0T0GQ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489337; c=relaxed/simple;
	bh=Oj1OP5B0k7dqDDl5yO9rCbKPUffT1+gV4fG7tK/igTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c27osvQfxOf7YGx+8jskud/zQS6V9gXe7e2AWIulzwUgD507fl0Wk2K+f2KhI2pGc54f5bTbx8+DZSSswpqabMfmp12M7iDiuoi4hm+40JQOOLf8DDnqPR/LxTDOIzHTXjw4VM/jGDvv5Joqqf5MvRNh2PIcKRFlyWN4aMnnvXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WoOVKHkc; arc=none smtp.client-ip=209.85.208.41
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68bd167797dso308923a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780489334; x=1781094134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LR+NPsTQNV2+0FxZsktMoZucngyJOnTRFU/6OwaVMIY=;
        b=WoOVKHkcQGpRVrTCg87fLUidTriCeQ6ESGeQoToDmsC0AwOL5K2gX6HIK2K+yzUD6u
         mhklh5fiVrTXQrv0zTOZC9KtMFc5WXnuidsNtkppqoffSXJytFsIURmPvuw+FHEn3KFP
         +yucxIjO9ZxN4sce+1G6YzEBFwbTBn0pKC+a/h3O0IwSG/TQ+5KdW8/Sni8lIxtKSes+
         gTV5Ud1znpur+lJAcUhuj55TmYcBBW1xrwPULBTOyBWKPUqJcfWxwXXOi0kTmloZ0a4B
         dftnovvabnl6GRocCFMP4dcQqdDCTnGlwUcrnnrLT2LkrI3F34a3LuI/C6xdhV4nUbXG
         S3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489334; x=1781094134;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LR+NPsTQNV2+0FxZsktMoZucngyJOnTRFU/6OwaVMIY=;
        b=maydKlqKT1MFEwbLL6uXYuHnA/Nh6CuP+bsuk7ycirH89+M5pkumKJjNzKdOFd+hC6
         i49xABwKNX+jiFG5MQAkIGGyCjdS0n1pzh9wyzWCWCFsD2cS0bz4E5tH6CjemVYz5Gab
         hTjmxlev9h1X+0jJc5ra4ZcGCG01bM7EH7nuHn5imGWPDE1gwHfJneamVgkERdKlLBvb
         JtkMEDI/+szHFpuyYelX6v1gBOol55c8rm+zHDFkOnWxfdqWgV/QT+Kagdq0lD2IU1bd
         oyOGxAKVGeTEXoKGGjrhW4Ep+iTUiXsG4CK/yWOYpq3WBOm8oR9jlkN25BFq5Vldi8o2
         4+ng==
X-Forwarded-Encrypted: i=1; AFNElJ/7BH2+1XbwYhvCYMIHRlppz+ny/++LLG0r/yHdX3jLZ3sOnJnpzwYK/ZDy6IjXdpK1j1xRv2yMIKngi2JD@vger.kernel.org
X-Gm-Message-State: AOJu0YwGNRp4LrZhDcOZPbkgYXaSFnBbz70i+EVSXYgXPdQcp8JMu9HW
	nuZHKjaKPCPSEjdYg/ypxZOUMH6VdHUDN1D0G0CPhWAHg/wK+u+xH3jUptiNHKBsBGc=
X-Gm-Gg: Acq92OE0ibXFWJjOuu9GhzRH3T0hu86nCVmUm8mwh8eBVtZIvKLThA+ADsifCyQB/qo
	0XZsg8OeUNY2U14fBMADgKhCFcUV4eNQ/5tWcQPGOv4pdu2vNgkSkOMBMoFzv1rPt6F6PE8ZubE
	uLD4ZU6m5kou5dqqfMs8qbBtmBmKBJ1rZUGaOoOfEghwC+tT4DQa/Ct6wX9brhyqpEERZJ38JGU
	aoACu+ulaPHktmgLbsZx1J2i7N4n1PnJbtWUEugmBFodfdUEOFQCYbEH4zSxyCyMl6f9jC/i/jb
	VEQFtMXj41bqMUsCNcLyNdQRdTiQEARLeZ6h/tu6lRC7ejQ+ou3Su/5CeseWqWpwKleYFMtGAC7
	dFWaTXgvwR/SKWek2btVbxuHzLG7o9YXq3e9CSsq9PE8Sg7pmQAMNuOMG6ic9FIFt8Pb0SuIz7i
	cNMXa9iNLGh7G7XH6jpqN5pygj4CPuAA6ogn5J4Ta2OuBvPA==
X-Received: by 2002:a05:6402:348e:b0:689:816a:5367 with SMTP id 4fb4d7f45d1cf-68e6be91165mr1508878a12.0.1780489333977;
        Wed, 03 Jun 2026 05:22:13 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851786sm1064884a12.17.2026.06.03.05.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:22:12 -0700 (PDT)
Message-ID: <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
Date: Wed, 3 Jun 2026 13:22:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110960-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11F5A637987

On 03/06/2026 13:10, Dmitry Baryshkov wrote:
>> Documentation shows clock lane at lane 7.
>>
>> Truthfully it makes no sense that the clock lane would genuinely be locked
>> to lane 7 but the documentation does seem to suggest it.
>>
>> Yes in fact I agree. clock-lanes can be reintroduced if someone can show
>> hardware that supports/depends on it.
> Konrad and I checked, Hamoa supports using other lanes as a clock lane.

Are you sure about that ?

ipcat I thought designated lane 7 specifically as clk-lane i.e. named it 
CLK_LN of some description.

---
bod

