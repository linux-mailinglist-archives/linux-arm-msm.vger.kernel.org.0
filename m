Return-Path: <linux-arm-msm+bounces-110969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZESjKNImIGqMxgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:06:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9F0637D97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:06:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=i1VrJ7h8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110969-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110969-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B993319B48D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 12:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597E0480946;
	Wed,  3 Jun 2026 12:57:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2C7480335
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 12:57:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491470; cv=none; b=ePNIWamTX1q+fZ9pFfkeDgl5bgl5jFBpe5TCBnqB8aKwuRa3OXbb6WK2p762pEiCo+8/4hRKvl3wffZPW7eAnlKkNPCoDobAOf57tuH0eXULNWqdXdLip5iV1D0Ri33yN0s3f3Gyiguhoo6zXCG3gXQOaJP82FHbUPkzXCH2oo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491470; c=relaxed/simple;
	bh=vUeXSaHLUxfrAP6wWj0TpMgOgk9qoWtX5OmAgms/TCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zxv0+s1RpyPA/zathwzCcwyxSIpkhIixpjzJnITcgT08F0aApe5hE9a3rywk/utV2YX6Bg3Yl8aMsiRQqeVlqV+NBVwETGHsrIhVamrxyPs+HGxxhEwHjKCNRuuO+fHGUHBur15J4GKlc5zmKfmGbPOGJ1ycDAcCxXXsfPmrMHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i1VrJ7h8; arc=none smtp.client-ip=209.85.208.51
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68d232ed3f9so5471716a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780491467; x=1781096267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AA8bcGrflv3zc6PRP3K/cb0tnkGVq1FBamekCJeKaGA=;
        b=i1VrJ7h80fV7fSOBlXAnfdJuY+2fsGyyf/tJ0+12SfuTR/gMcK17mObitwToDy01fU
         Ei2Omm8OTgi78nLT9S2pkawz7CVhjmQBfknrM4slQC2vGgfjr//yal6FSG/86aOB+Oub
         Gj22c0DfOBfcxv+81899+FcaWybl7jwULfWw0E2ndxzzzHcNF093Ef5sa1Jk9W9p26uC
         D8GGxUuRVUmAaCcc8SzYfo9CneC6prHxoRCTm7Qu+Is1H3mlHN2vA0C3gNHpenuoHuDP
         w4H0NNTWwh0VW3ZjH1R1E+GP91KsOVhAcaXkItkWWQ+KbRidt3GYsRpKufSPgYiGCLpy
         oF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491467; x=1781096267;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AA8bcGrflv3zc6PRP3K/cb0tnkGVq1FBamekCJeKaGA=;
        b=b2/tFABrueQTGiou+xV+0cKYoSFlWmKQt1N1f+PmCMEmDzWszwU+Ah/9AwLXxdh5IH
         1CJ3KZSEn3u4vaNXYhXNW355uORl/hnxnn8c8LJ+BNacsp0sGBaStukeE+emGQMWa2qP
         923F6BDnCZ+xgC/IiXuioRGytzF+fYzag5ICt+etVvBXX82V53HmGXrxxbpEU1uYOiKa
         jgALHf5Uvm5zoG2R75YUOIMoq08/NY7+YI2YCXKh3AVQx/4iKgVuKWk4gLeKPyYy0mCU
         6V87IUaJpips9UzEJUr/cftUopnagBOtluVL3QX+7bbxYO7G7myJDT102uSMBHPbZPpn
         oqaw==
X-Forwarded-Encrypted: i=1; AFNElJ8psXwiYgqBUWsoj4RlABg/m5Iy2cjfjCyjszVweADvIXGgW3+NyGfP6pu5weOHprG3IL2RY99EGfK6UUFB@vger.kernel.org
X-Gm-Message-State: AOJu0YwAV2XzGBo3HC1ybgRBd1BBRDw9pQx+hHY69zk/m2liID/9+Z9N
	2Vb2qLlqyLc3JBZCjnDSV7pe1quhA/h47i6h72Ix7jn67lFLKcMNZ1FLpchdvbf0b3Q=
X-Gm-Gg: Acq92OHf4O7nYC65azEszngiAB9NRIomMMZeIcwNa7/dLZ6sjY7xRtg+urSMlS20BIK
	jXxx/NlhlhKzHl5bfzapKe/N4OW0s5yg4jKPT3GhL/3xi18mHg5fIdtpcq/appB+HiJIlSDFeUQ
	pJCmMQC90j75bin9pD9gR+KoU/V/zNgaqVKfy82PJR0+m0d3pO6L5aoBRJ9tkViPc7tvsDvfLaV
	hSgyfHU8fQ0OeZaKLCrF7HaO+tJyqx1txQH+qu7zpJNJTSOzYpdSy88zrHz2EC+wV+xHKyXV11r
	/IpcNH7ITeeuRoodVo6vL+8Viafiz1d7PYnkdUvtz7ukwehP7y6acu3kltnkcu7UMifJ+5uyVjN
	w68Yl5ZX3iLpoLjWD1tFsjK1WYuVPcnmeDZUjcFwu+bWB8hi6nkRCT8WVeKH//8KfBPH5u4B00R
	HIoEVLXRcSCPDswcDtXg0oxmbvW8MJ4hvG34Vysf5VGvEmHg==
X-Received: by 2002:a05:6402:5242:b0:684:32ec:2332 with SMTP id 4fb4d7f45d1cf-68e6f4b5a53mr1709091a12.2.1780491467112;
        Wed, 03 Jun 2026 05:57:47 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851786sm1107720a12.17.2026.06.03.05.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:57:46 -0700 (PDT)
Message-ID: <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
Date: Wed, 3 Jun 2026 13:57:44 +0100
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
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110969-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F9F0637D97

On 03/06/2026 13:40, Dmitry Baryshkov wrote:
>> Are you sure about that ?
> Yes.
> 
>> ipcat I thought designated lane 7 specifically as clk-lane i.e. named it
>> CLK_LN of some description.
> Split configurations explicitly use other lanes for clocks. E.g. check
> the RB5 Navigation schematics, CAM0B connector.

Can you please check:

CSI_3PHASE_COMMON.CSI_COMMON_CTRL5

0 LN0_PWRDN_B Lane 0
...
7 LNCK_PWRDN_B Clock Lane

... just a badly name field

CSI_2PHASE_CTRL10

Bit[2] = IS_CLKLANE

Right so CSI_2PHASE_CTRL10 controls lane mode, indeed. Thanks for checking.

---
bod

