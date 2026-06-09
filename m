Return-Path: <linux-arm-msm+bounces-112139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id adxyMsT2J2qn6QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 13:19:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C84B965F6BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 13:19:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LQ5AHDgV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112139-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112139-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 211D9300B9CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 11:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7D43FADF6;
	Tue,  9 Jun 2026 11:05:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1B03F86E2
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 11:05:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003113; cv=none; b=qaNRGK/LiugOtuvW3KimgZPWeF7ZMKmIUQQRGoqK8vPo0AVPr78VLqAK1rMDmTl4Mj/s7DGYO72Rf4jV7ouHrNg8IDgnuYtlLvEtB/Hi7r6hPGbXw4u0sxPiQpAOeYBLwjcxsDzMSfEzC2Kh7u9ZFoL3Agn2lLKX3ydXmxbNxe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003113; c=relaxed/simple;
	bh=kjw1avFU8520DRpYQDxuY9SvIAlSgQxLqUBUN9Yb05w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4lB+TvGRnY9O6Xp/jv1vy/vo25xlAXQLh/vSTgYA8r7n6Oc61k4oldjj1lc6V+JHepXn+V/4BdxqjjmADQ7KLJC748GPYCgL1POOp2k7dKkn26QdPcedjkLoJ4qrK7+jFAVoIzo6ezwsdl634QmiSyd08LB26o+Nh7Vp1QfoqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQ5AHDgV; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so36654705ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 04:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781003111; x=1781607911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjw1avFU8520DRpYQDxuY9SvIAlSgQxLqUBUN9Yb05w=;
        b=LQ5AHDgVFf8+XKXrafeTgWm9/5qitbhWyjjGliRtULNeO5ecUkYAnuGsG9F2zKCd0V
         j4w75Tm7HeGs8e3IolTN+2HuSn9C3YALQ8fexMWxBfj8tu+Bf7IWVmiz/KsYs/ysN8Uy
         a3SHzXkazI5ymUOfafG8MBbcoCwjqpmYQtHCNB7eatZslq6viaGrfZR8xFmBWrOAHMuh
         oWRnahcdC+PILHKbyM4lXYK355AWNKfxEBTzMWoo9radY+hi2ue+15ubgEWjtM16pivy
         dXmIf3dE9AuSWa94/eWMPvrtbR0+XnhGHHDZR1jMlKnFSH9eB8pBfVCnBrBS+Ey2AYXm
         utww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781003111; x=1781607911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kjw1avFU8520DRpYQDxuY9SvIAlSgQxLqUBUN9Yb05w=;
        b=JO6s/5okTuOwcwNrPR+EIY1wdQizjAqIvupI5Fxu60DCOxapSnu35ri4cQaZZoyPwb
         ETj+WZLkOAu6FEv9pk2NItxcdEMuFt1XZBWRfwSDQsVf/RtNG5SW6ql7l8iE2NahtRV/
         6ZViD1q+cCUPKDK9P8XereKnoa1nb29Lk3oPC0ajSR6rir48wNcjFC9/3FJWrZLw8Lyi
         9ttQs3vNYVttFpYrdBRszw2RbfJWpG6SoES+5HUGEHu2Us3DQA9zA7iu5mDaHCbwRU5f
         2l6o4Id5zyeHNcweVquHN5Rg+AuZzJ0wUM8E30xpAH+zC9JxnVJcJYP/QD3+/xdpw2Ki
         a2Ug==
X-Forwarded-Encrypted: i=1; AFNElJ/rCYkhl1VOeZURY1kUfuhOCpr2ris+UlUnuB8XdK5thVpA7k98o6WYm9+2/AbjGFf3Oc/Mie3f/Hjvdcgz@vger.kernel.org
X-Gm-Message-State: AOJu0YxvrPNpr+Ogtzxg4/9gec79jBjw2w2oKjObMaN3leKZSMkojFiv
	cWlEJwwb9ajM3Zj1ch9F+ET7IxsMt6UirN5jKt/V07xykMwDJba7wOyx
X-Gm-Gg: Acq92OFu/SZl8GXYob6u2IDxE+yVWoFal6oSJMdOal0bTmw0IB/zySxeYwqgLeplSAI
	ZOAg5GdtXxKxwQQ0vmlKvk7n17YwuVWOBbFoUm4dCXIm2jzAcUhO9lk+6wbsmm7KbGYX0lDd0bh
	HAbgOy5GfpROOt/RgMwgmCpVPdvDDLVm6NMIVZw92q/Gx9XY4Vp+2r71gEJ5YM7az6WLksDl7Is
	chIjD4ZZ2nsMTUncDoN6hiLcgM/82x/q4XQMbQkAtCjmgQPPp7ViJs+wjMq56erZPQ9Ifju4ouL
	HLMRYV36Zoa6wME8vlN4lZoqJAMkPMTeaioqjtiG6BkoDYXN/J9cqc6pgiIuezS0Gmv1TFoYwKn
	7gy6XhWwsWZZuWNuM+a15AFC7ILAlGoqrd7VRRnciobqoERwTxxw06+kknFrjdf59gkzzUIZVvq
	27PyfTsPuFvxPUvuQIaM8nf6nTdbNFDlm1p9xsOgzts8/a5Dyy8V05JupcOA/0jKQq7ls3dNlUv
	LshwjN5uQ/c4J1AhU+6jVp9
X-Received: by 2002:a17:902:f645:b0:2c1:6259:cda8 with SMTP id d9443c01a7336-2c2a1c873a1mr29134585ad.25.1781003111332;
        Tue, 09 Jun 2026 04:05:11 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm211687815ad.22.2026.06.09.04.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:05:10 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	bentiss@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	harrison.vanderbyl@gmail.com,
	jikos@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add Microsoft Surface Pro 12in
Date: Tue,  9 Jun 2026 21:04:29 +1000
Message-ID: <20260609110429.11427-1-harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4ced3207-a132-4ec5-a0eb-79f75f5cb4bb@oss.qualcomm.com>
References: <4ced3207-a132-4ec5-a0eb-79f75f5cb4bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-112139-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:bentiss@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:harrison.vanderbyl@gmail.com,m:jikos@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,m:harrisonvanderbyl@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C84B965F6BC

On 6/9/26 11:30 AM, Konrad Dybcio wrote:
> Because we'd put the subnodes for devices under the 'status' line (DTC
> enforces that), please move the comment below as well

Will do,

> Or since it's @28, perhaps it's just nxp,nxp-nci-i2c and it could work
> for you ootb?

Unfortunately for me, the device/antenna is not present on the consumer version,
I was able to confirm this during a speaker replacement.

> Please align the <s (or is it my mail client playing tricks on me?)

The alignment changes depending on what text editor I copy paste this section into.
I have them aligned the same as the other device trees are aligned though.

