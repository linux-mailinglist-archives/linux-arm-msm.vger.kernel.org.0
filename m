Return-Path: <linux-arm-msm+bounces-113442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GomgEbVhMWpPiQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:46:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A962690A4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:46:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LD6KhlVl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113442-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113442-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EACF30A09F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3539738F930;
	Tue, 16 Jun 2026 14:37:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C803D330678
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:37:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620658; cv=none; b=HYLPWp6LvQsw6WP8uOluW/MEVrTLme8HfupkkjkATTlER9Rs1Zl0bsduDr6sjwpbyAMtB2ZB6E8oKLDQe5M2bmCoBMNNfH7OdEMFWbSaL/L2FWkNyVODMXm15sQUEHryvw7QWZo8XZsireLpnosuFsjhYmLCHOPhZWJal8KWt6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620658; c=relaxed/simple;
	bh=FfugnIQHm5unZ1sPR1Y/dZuhbcMyf+Hu3CPQK9MdeHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtkMPRtboAE1co51NgXqcDsmpQ5jI446ddYnFXzyHPywdH44Y3f01q7IrcUnEnZk4WpvLqMYWpsjDpAKZ3ukXQJ+g0o8w5E80gCeWbnWZIiSokWO8IDUXiICRpZLmOht4S9U6OArEwGH/OgkyHYnL7HWlzpo1TUTd9H7d8rmgI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LD6KhlVl; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so39164775e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781620655; x=1782225455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=j5+URZt3Wu1iRceLE2DPySkKJNC2rK90kTRHgoMPIB8=;
        b=LD6KhlVlHlwayDjDAR7n7v6Y4dplTfNFAimIfTXZLXetf3revKu7W/sGFuDAe9JAb9
         Z6SfCwrYCI50699JAjL10HwWrGQhnZ2jan8dh0jyVGY6CLpixBZL0ZN3UvGb/0R5ooD2
         8trGIoCX3YFzOHSj64taYDS62KbPiA0flRYHVZx6jxewInu9F53dLj69nfM2YzriQdRU
         BVSO222j71YZ5hirvvWlC1sH2d7u8S8YXJW+Y1Qtx8vVlihOe2VO+vU2uI6OYbiKKCWo
         StAyqvtj+Cf0BhWWvCaeekXK7Y9P2Gd+2CluXmt9WfmWKZ1RVjuAQU2EgjMWrZUXSUcd
         qTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620655; x=1782225455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5+URZt3Wu1iRceLE2DPySkKJNC2rK90kTRHgoMPIB8=;
        b=iGbW0Hjtkn7Hcr3Ch8pYDjHB3TpEJ5ZY1guGl3XoWoSi6EzO88PLKCVnVYy4tu6Psp
         0u4zcZH8zVhPstKJ72NdgWuc721BX77Mf8DftiT3EkrKMiTqvoX1hri+IfyRjgwIfJva
         RPwfj9rKwTID0rZuhoFh1398FGRl/dxRtuwmmqiu8mUQuRCcQSX+iiX7oXPJ3WCMPM3M
         59queFPwNdebZYuzh+VCmOu8jBx0TNU8acth5UBqzhTSRkbTCJAG5XA6JhulgDl5dy4R
         wopvhUi0zw7CbKvrRHEoZ2GzVgeoD4CHiMn3fMFGewuXVCSB6eHcvms2KTnC3b4PmmKt
         khqw==
X-Forwarded-Encrypted: i=1; AFNElJ+mByhT6IviB/e87isC8yUOj7h+JlkhnMv9qn8JShwMDByB/4Ll03fe9me9iMGIXbL3xKJWHt93YNXMs1ko@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3qDvvirxWdMwWAIQj7191Gf8glkbr4QBPMtFjzJoXvLwkeF4N
	lYNn9juB1IW9AJ4SucBwtas2GVu4x9zodHVGawdADdseCoo6E1OyQxdn
X-Gm-Gg: Acq92OEhzm7J39kNidyXmcRjwCaMpDvBQoHhu+++UYmmYpO1p0vN0u6jK5YHMmKOFJ4
	Ny1H1vNjqW9grUJYl3/h/6pZ7TQtDSs+tJtUucmVpT/mwkmGSZofecjO3U04JzOK5KpuxL35Y7U
	oYcSTq9Dcm1JocZctb5afPp0QfSb6HhpHUlJZR8C4CTQweLhQ1c3f9YnHBuh7ckyGFlvTCNsi/M
	wYoT+FOU7sYFZ9TjfNyg69JIYFIDNMLvMAtVylmgEn55Ajgcqxvyv5f/LnnE2J2hytpCogGcsxk
	1Givf0wycCoD2PhYqTftqYTCLQ2fO8agFpoz8iidJphremKZ4sDDpNGCOq3xB+wrGZZxCY88Qmf
	Xgfk0vkeCGu37F7KQPE07h5EoPi6mhbMpc1GhDQ6b/uycQNGuGn6mJNpf/cSXjt34sJQqTDkzIU
	31jt1oMb3zqAlfDQHiknXjnkfIXNH4RbhXaL1cxHsP7baoPjl4vBMzVrEfIrYEnAeX9dkIv/tBj
	9XAkWI/5cLH6cplNsZ49PNQKn99IQ==
X-Received: by 2002:a05:600c:3543:b0:492:3071:1db7 with SMTP id 5b1f17b1804b1-49230711dc1mr53184075e9.28.1781620655013;
        Tue, 16 Jun 2026 07:37:35 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-461eaa0d1c7sm1813947f8f.7.2026.06.16.07.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:37:34 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <18c34b11-04eb-4e01-aad2-8c18fbe26efa@gmail.com>
Date: Tue, 16 Jun 2026 15:37:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
 Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113442-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A962690A4B

Hi Fenglin,

On 6/16/26 11:08, Fenglin Wu wrote:

> +config INPUT_QCOM_SPMI_HAPTICS
> +	tristate "Qualcomm SPMI PMIC haptics support"
> +	depends on INPUT && MFD_SPMI_PMIC

The dependency on INPUT is unnecessary, all config options in this
Kconfig file already depend on INPUT due to an 'if INPUT..endif' in
drivers/input/Kconfig

(Yes, a few of the other config options in this file also have this
duplicate dependency on INPUT due to an explicit 'depends on'
attribute, but this file is in need of a cleanup.)

- Julian Braha

