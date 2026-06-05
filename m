Return-Path: <linux-arm-msm+bounces-111458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6y6GDaBLI2rToAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 00:20:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A51F64B9C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 00:20:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=v9qFIcGf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111458-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111458-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B51A301829C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 22:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4C835E1B8;
	Fri,  5 Jun 2026 22:20:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF0A314D06
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 22:20:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698013; cv=none; b=BnE4XOulW7SRN+emKgpD8cL5gu+jri2swv4WdJmB+0Flx6F0LJZHtLkSB8irBBfIxfbIGv/QqKMI3jxDjOcQ+q3WuGSwpwI3zCV9JUOomjoaGadXp3F8eQfMcsf77C1UzZkfwe5EGUbtlR6euZ3dvgiPvL31Littasai7QA7ro0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698013; c=relaxed/simple;
	bh=/fJR9ObIjB90E/QkVHybSi2y1A5XCak5hCNjolyBIsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDDmren0mqJX9wkQeUNH+O9Vb7oraJE7a2PPF+4hfRI3ZIJOK2FIfiE3Tl555cQeXtWL9D4nwFIxZE05sneelw2DH4FSBLVGZ2VI3TsO1ZJytD9ip06kIxTHMrhDQjGCRU5jVNM2ck2HlRVokbOctcynPLub8w8aU4NdD+wVi40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v9qFIcGf; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so1653381f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 15:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780698011; x=1781302811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/HB8G1yTQPOAvgzKZeKYVge98Lt9ZnLKHPu1l7zZb4=;
        b=v9qFIcGf3AzlWTMlJODbm2DBzIdu3pdSB9KlLvoOgaTA8nN64Jb61RDdKdVCLNgnlM
         aCDmRUI/U0Ee5CwyRPjMDWUvAliXoPY3dLNnLzswOQGKmxsaS9bWrwleM9TzZt5WfgV3
         cmJc5xsjyi4QT9RQC03L2Boxtr1yu/xacJ36vkGXcKV30BA4oRpCHJojx/pNdDyrP7Nq
         NTKAv9ZXSJB4H5gPlX0xc4QfP5CTwI83/Fy0A+5V9skGxkDCHOjRjPOm9gmxz5LRWKUw
         OoAqeGVMiO7VRAt3p+7mhdL4VMqOps2D+kBzKZQH/ijRjkXOSV28ciC4NvxcZlkfK9Jy
         lc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698011; x=1781302811;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/HB8G1yTQPOAvgzKZeKYVge98Lt9ZnLKHPu1l7zZb4=;
        b=Gz5vjOtE+yUj30kQVY80hO001q4wUiVYuJijIOstzKkJdysCNYHYcdhf/v0UJflK07
         ixz/vvlC0aC4bHYooHueKS4dz52nGEsogJ0CHJkkNicm8Cph1xh8gxi9mDS1VGFK4iMV
         H/sv31gyJFMI7ywa8KZYkwivJ8LG4PIVeUFEAaLLhLlun29GFeiLUF0cQlbSqQ2q3aPK
         03JXsWS8d9lx0F1BBkWB8unQE2HZH2VY8tEqdLRcBtFcACRloX7qcejh0uNN73qiDQnP
         boL3gcGx4pIM8RvZJsVLCQE1d6rexKZcxz6EfdX8uxYQUDOoT+7UpRXkDAPUWhVpb3Wh
         zKEw==
X-Forwarded-Encrypted: i=1; AFNElJ9ucIi2quwPp3gftnQasR4VmCc9kG3OD9/cSX98aOBULhtoQmi43A9qpPM9hdOog+95k+l+iL8J3XBOac6j@vger.kernel.org
X-Gm-Message-State: AOJu0YxUlMdm14a/hXeum7r89MMVLXKJUbJUmTNyxDDh5VA/rkZmwFV1
	gTIkwQkefotJCo2ohW5Zrw0caI6d22P/PtD6IEqaRgZj3FZRP710Q6tkwpP+rkoDjVE=
X-Gm-Gg: Acq92OFf5IbQRwzLg2Ys7Kjvuje4SGGw0KFbx8UONyHFUrwOjEHnvsUPa17djjC2/7n
	JT3BKVbGFv7M/Jv6Izg2zCx2ZqJ+Go7kA6yhliETyqv3LQXwy2L/4ZLD3M5SnN5fFlf8A56OHqi
	kvlfeUr5uqiJdO63v05rPBZlZxiucu48SRKvL571KkLEJQe8UGFBUBMlNovbvgc2kteglKHzSTp
	LDNx5fnRDf5bqa9Yh4hv5YVMGr22xoLnhxTHXxoe9qG2yUSiC4nbPHB2gJDH9Gsixrz/cPJ9jIj
	qcWs1AmK0gxDzgLcKG5S/FEA7y2dAq3/RQnRVvJgr/+WLQc4W1G1kAoi3Wo6yqK4kwQo7kBc8Tf
	zyLe08DE8Wz0LTdsiz3g9DUw2sD9kNXQNTECTkGn9gR2mRDp6zeql4dHeyLuSHotDAAOPEZeO7e
	elZmxAlQZ1/7XlJpC/qlCDL0EJe1hbp0U1B1+ryJdrKYfg
X-Received: by 2002:adf:e743:0:b0:45e:f1c5:709 with SMTP id ffacd0b85a97d-4603076cb46mr6547079f8f.37.1780698010560;
        Fri, 05 Jun 2026 15:20:10 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.32.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d40sm28849253f8f.26.2026.06.05.15.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 15:20:09 -0700 (PDT)
Message-ID: <87ed4bcc-aa66-4a1f-becc-7fce1fe795c1@linaro.org>
Date: Fri, 5 Jun 2026 23:20:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI
 CSI-2 C-PHY init
To: Michael Srba <Michael.Srba@seznam.cz>, Bryan O'Donoghue <bod@kernel.org>,
 Frank Li <Frank.li@nxp.com>, David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-5-e50de0b557a8@ixit.cz>
 <8azU3NvUdGCvWCxLb0gz7FWkTGFL4k_xiBUPp170jiYIQjwHyRqynP_oLG4pjFkIRSY_bo91FQh9ECYlXdXrsw==@protonmail.internalid>
 <aiCiVe_LRA4DXTCL@lizhi-Precision-Tower-5810>
 <8b9f8754-48da-4b61-84b8-3688520c7f63@kernel.org>
 <c7f35621-2bdb-4e66-ac8a-6c7fc6f80f1c@seznam.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <c7f35621-2bdb-4e66-ac8a-6c7fc6f80f1c@seznam.cz>
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
	TAGGED_FROM(0.00)[bounces-111458-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Michael.Srba@seznam.cz,m:bod@kernel.org,m:Frank.li@nxp.com,m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[seznam.cz,kernel.org,nxp.com,ixit.cz];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,linux.intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A51F64B9C3

On 05/06/2026 15:47, Michael Srba wrote:
>> So, hex values from downstream in this case are acceptable.
>>
>> OTOH vendors can and should enumerate their registers in an upstream 
>> submission.
> I thought this was the policy indeed, but this made me wonder if ALL the 
> magic numbers
> in that file were added by volunteers. And weirdly I found this:
> https://github.com/torvalds/linux/ 
> commit/7803b63a1640a0a39e3ebad487b33cb2d26e778b
> and possibly some other commits look like they were made by people on 
> Qualcomm's
> payroll. This specifically is QUIC, and idk how much documentation 
> access they have,
> but at minimum I assume they had access to the CTRLn register names? 
> (fwiw it's entirely
> plausible that the registers don't actually *have* better names).
> 
> I didn't follow the relevant ML discussions, but it seems to me like 
> they should've
> been told to document the registers?

"That money was just resting in my account"

There's alot of technical debt to digest, which I think should be solved 
in the new PHY API driver.

- Move to new driver
- Start enumerating registers correctly
- Transition to QMP PHY levels of lane config instead of long lists
   of "mission mode" writes.

If you ever rent a car in Ireland and get lost, you might ask a local 
"how do I get to Tip from here" and we'd scratch our heads under a flat 
cap and say something like "ah well shure, I wouldn't start from here" ;)

---
bod

