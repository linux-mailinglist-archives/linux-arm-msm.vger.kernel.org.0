Return-Path: <linux-arm-msm+bounces-108296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jHGRNKqNC2p2JQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 00:07:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94854574453
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 00:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 066BB301E77A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170A43A2556;
	Mon, 18 May 2026 22:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xhczwa/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E20B3A1E80
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142056; cv=none; b=pLBrhZqlxlRmwihqDkHZRF0DlZdRraTwFWPozs/YxMBxoTMsVr9tMsw5eQUb8Adrxd74w+zNff9JdCtdCE2XhGNJp6VrYsxcENuCtpmb5Jp2uJEiFPgdVZvBUX6PjvNfqzpxHM5kBqF3G4qHaJ6CTKPSGZ/4hsJK+Co9WLOdNX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142056; c=relaxed/simple;
	bh=BB1Y6UYNt+5fsI+CPTJ1sVHNClySS/lhkvDIVefPULg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7TP+72a7JEVra0kQNoW7w2JfnH1s/CQenZswMvGV8+sMT2wAko0DikLrmh6EahFJqwC2R8p12f6cobPLywb0VtBf13GuMwxqU09ctISeuxRXgjJWaVvouHz8sKnpKu6ew7Y53BdSt5puarQkYo98hCC6I6sQ7/iDFnlGWqU25I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xhczwa/K; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so12959805e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 15:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779142052; x=1779746852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sGR8lYC7RwoehcYqlTGMusvCrV6UmoJY2p/GFIP4wIE=;
        b=xhczwa/KBcv5kBpNw7gFMObagcrY8MkXyYLJqUb1ILcYZ7VZGJXPP8iLWqnAdpGRv2
         uRyubucV3vQAvYP5Z615H7ZTFS8EnNDsZAvNJMfOu0TQfZfkmRZZZogi5J1HpaDzRL8Q
         IGMC8Uh/kF5WKRfg7eccVKsOvxC1N2cQF5gDuwX7FUh8Tg2EBiPo6faO4L6Vx7hM5reC
         dLNrnaARNnHzmVIg+d0D7N+arK6NrDYGtyyeYKQkRnFaLs2ibUxo5vN3SPohnIB5zuFr
         qSAlb3nSTADqaqM+G+/Y+ifPhTGZB8bwh+z6uexlDRFbGHmIgeVhuIEf2VVH1LSLiHVk
         j+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142052; x=1779746852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGR8lYC7RwoehcYqlTGMusvCrV6UmoJY2p/GFIP4wIE=;
        b=hGwPvJfB1BVeJBkWfENNTfX2B0aEOEwPoe1pOesKQ0dtGJXzC9xXkt7pVD5yc0Pwgc
         kMzjP+RsdKm91d0ep3d1Gh9zomSl+il2S6NL5mnU9FeKFS1lQHKhcHbu+xchWWIDEjcY
         pF3gfNenS2TAG5aBKis+w2YKsi/eRgNi0IdFBfE9OSAmH0Uk+zMofbo/kTnQIVeXKcWM
         t5UfaRrWduyoFPHF/nGcDMoj6DqeakbAfoC8Vyw/LAylLcD1MpExQLptxdz6tTfjdscz
         VNZebcMTS1bxN91RjIyfSZkvMUPQfLynVe2u+3lW5rMUF9lsvuxnX9VPPBxJyKIxC57G
         gQAw==
X-Gm-Message-State: AOJu0Yxk6+abjQww7FP00TmRfQtWqzrmu2m2RcVYPB8xxn0MeoDOiBME
	e1PNKuANB8ooPFx2RgR3govLEWhjuFFV3h6Y8LDG984UOuWYQSeqJbC8ZH3HNzwaw8k=
X-Gm-Gg: Acq92OHudslhEOGrq1W2DT1Xvg+Wxj5ydj1gjf0mSFudI9052n5X8XZ3Be7gsYwX6gH
	WxRWgNZGnCMiUEO8s9O1EFsRnry8zpclJkM0Sn/AEGptzFfLpARyGnxNtSKrxtlXDXQIT0xRCik
	ji+TfKBgLdp9UKyOp5p9JaMmzwx8dm9bL4FYRXZtDpTa15lmUQSfasMZxfdXYivSxAyaHKg9T2q
	Scz8I0ehsPrmPS/bBZrFg2EeSL4leVS59LqR2KODkWcN5AvaiUqLEbxJoOsG6Qqr5uAGuAALWj3
	WgSql5aSiuV0x10EuD+iJcZjXHwgP0jTelJfWZtZ0loCd9+YTvgrgcDBXx32IZMQCWzikaqHaR8
	UMzAA1mnbfBGfW4ZEbyzJIxPk3dPo4crvQpl+xiAQS0tpJYAoSJCH3JpVquEX3VK/Tv22v7UGEJ
	843h25M3nEPhFxvECcQZXlhhmEnT/coILT
X-Received: by 2002:a05:600c:8184:b0:488:ffb1:494c with SMTP id 5b1f17b1804b1-48fe60ed790mr252457835e9.12.1779142052380;
        Mon, 18 May 2026 15:07:32 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.40.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fcasm261653215e9.5.2026.05.18.15.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 15:07:31 -0700 (PDT)
Message-ID: <d15b138d-8c6b-430b-bfc3-f410b05e4835@linaro.org>
Date: Mon, 18 May 2026 23:07:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] usb: typec: add Qualcomm PMI8998 role-switch driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 taygoth <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>
References: <cover.1779127507.git.taygoth@gmail.com>
 <6fedbcd344505b63de72037f69ea94f916255f03.1779127507.git.taygoth@gmail.com>
 <zm7buc6djok2743bs6ghvlr3bpc4lld4qpgs3ggwjsy45f4l75@kua4xtj6b3wd>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <zm7buc6djok2743bs6ghvlr3bpc4lld4qpgs3ggwjsy45f4l75@kua4xtj6b3wd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108296-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org,fairphone.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 94854574453
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/05/2026 22:45, Dmitry Baryshkov wrote:
>> No software TCPM state machine is used because the hardware handles
>> the Type-C protocol natively, and the PMI8998 interrupt topology does
>> not expose the granular per-event signals the TCPM code path expects.
>> Power Delivery is not implemented in this driver; the PMI8998 PDPHY
>> block at offset 0x1700 (register-identical to PM8150B) can be wired
>> up by a separate driver later if PD negotiation is required.
> I think TCPM / PD-PHY is (more or less) a sensible requirement. Without
> it you can't negotiate higher power modes or AltModes support (which
> means no DP).

If the PDPHY is register compatible  as stated then the PD part is very 
close.

Looking at the pmi8998 STATUS_REG_4

- VBUS_STATUS
- ORIENTATION
- ATTACHED

are all driven. So I believe it would be possible to bring the pmi8998 
into - along side the pmi8998 logic.

@Maxim have you looked at that as an option ?

I believe Casey and Luca? both worked on that.

For preference I think we should try to land pmi8998 into the existing 
TCPM logic though, as another TypeC port handler within the existing logic.

The important signals above, appear to be driven.

---
bod

