Return-Path: <linux-arm-msm+bounces-95098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IZ6CDH6zpmk8TAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:10:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9B31EC6D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E508A305B4BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 10:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9652B3947AE;
	Tue,  3 Mar 2026 10:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DHf2qfDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BE139448A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 10:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532506; cv=none; b=P5VaVBK3+FYEpripIDImiuB8CTQFsCxvkGIdR4bp+0IU62z6OdDsgKj1+bCT5NRYBzbjEkP2FE4nbsdrw8M4/9G8AccGLXPuUnQ5pfBKoZwn0NqnDOEvAP0azUKzvBxc5TMJCaOUv6+hiK7kHPfTwlVPK3GchnOVjS9uTCUGeFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532506; c=relaxed/simple;
	bh=h+2GcRJgSIlqWkyAemob1F5MDWMzyrig/NBRlRV2B5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8NxgBkdm9S3YOPN0yDLS2OtAvQzbWUGQBkeP3wepjcbM7V1nT02/IUTsLUbBHyiFQDrZavBcmHbKA95Jjcqcqh0yG8jLNLUB14/eGNAxWN1aTI5twChSrJHkOyInmwAtSU1OEE+EmOKa+rPtY553xmqqmex8zAoTorPbw32WlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DHf2qfDA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so64985685e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 02:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772532503; x=1773137303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MyO8nnua/YSeSGPvcxsWXY2ujou9FaamDCdW2t1bD3o=;
        b=DHf2qfDANg36y9Rwv3qwwWio2pnPckeigVi8u6BZQKPwn8J8qJ5bjfTKr6Xv2RLOtx
         CdRz4E6vmfS6asTI8Eto2wSJuRwvR3ywe5SDxsJsf3eGikyRGb7l6Pe8eezu8UAY6pBO
         ZLxEZnQY35HeJnY2Plb5oUnMnKsDCY0vzABgBTxiJ7BZuTJFw3pFdlYfoLjfltXhOl8M
         7B0uw0ucufdTD3qw6qDgEvOP93dLVmCymPlSmsbabvLXSfLAKp+86hPdIa1T00DajGgm
         fxK+hU6u45AQsUS/LPE+6fGDJZNpcfjLK2kCdUmol4CJwuZWNsWZA/yuM4PvUhrZf3CC
         gSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532503; x=1773137303;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyO8nnua/YSeSGPvcxsWXY2ujou9FaamDCdW2t1bD3o=;
        b=Cx0lyfQAceQg9JeWY9EQl6NXC5w6mxqpkd5YuJ2/l3UtNK4MH8nDfDptf2h7RdUPqF
         JiY9k4Xtl2gHIWMQX4Iuch8ENJCJgr51UmD8xgzMaCoJadsFWjXZRieAKTdzMV9vVRrd
         DMipW5gQ9SLgpE++NVu4pbChXc5lHc+MVH594dxioLYrTqFBjbKNtHZYvidhfYshqCcO
         TSe68L6row5gQZ3ZLmpkvr9Mo7/iOQChpnNCyVCsFfdztkZ4CZJ9R2gARWjE8hWGKcZa
         IyKmuQ5bPvi1dtDdZTsCAgsGDfSjiW6nOiHLytLyQsHzLE7fm2A+yEJ262xF6oMkcNM0
         Odvw==
X-Forwarded-Encrypted: i=1; AJvYcCVgdeY10vZX/kF3X3htAdHIvRah0yUXeTMyZOyAL3a01DbDB/ntD9aBeYM/Bn93cMsf/BRzCv52GZlgl64z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2wDKcKgWmCv/yAXDGCSFW++1s7DcC6ThAf/vWLehLrONOUQ1T
	DnkgUSx0gWVTA/IF9XlbcoHQRpqasScq2tIfl77rJAjB4k+HmPbOaMlZxB2+jgctQD4=
X-Gm-Gg: ATEYQzzteELmrbylpalBIZOxrvjopjmXz7xyzeCAEnV53hggoV0azIzuZtwDkJ1UFOU
	RNKIm6GYZtT/B5js3FsHx8UT9mttX9ox66w1Bd9G0KtzN6refBjrNX7iCQK5Gmb61JE3vJljpoq
	LVJyQI8CXt1nBzFUBzssjhU2Q6Jl+EgkwXgC8LBPP4GZA5hA6R5+fSSgSmgQ5a1zjCggos8FRvl
	Qmb0okYVcVS0ulTHugKH7bB2IKX+dlZfNk/zCPOZoAzsNjekk2tgxvvfb5JZromQwLcKx29ntyd
	y9plyXHisX9qToacEs5/9NR7e/GoxzJmoViLNN9iCcQTn6lIrLAjYnCuT/9YcNLtG6IW1q6wdCt
	ZeaVxItUHcs9ooLnDt9cpeU33YXhfC85kjAMRL7BBGMh8ILGuHr9VCjgjwb/M22mzG7gmzhctZQ
	GrpbE6pqXBefqVwOMbplfFO0J7AP2lupoE1qQCclc3jtcKGxalMUZ0wS6yYCQcKdQV
X-Received: by 2002:a05:600c:1989:b0:483:71f9:37f3 with SMTP id 5b1f17b1804b1-483c9bb663amr273676705e9.1.1772532503534;
        Tue, 03 Mar 2026 02:08:23 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48512628e2asm31393555e9.1.2026.03.03.02.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:08:23 -0800 (PST)
Message-ID: <be4abbc8-414a-429d-baff-48c829378a31@linaro.org>
Date: Tue, 3 Mar 2026 10:08:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
 <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
 <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BC9B31EC6D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95098-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 03/03/2026 10:00, David Heidelberg wrote:
> We don't have any documentation how these lanes are set. I think it's 
> good to see two working variants, someone may need it to demystify it 
> one day and the history may comes handy. Also both variants works for us.

OK sure that adds up keep it progressive so.

---
bod

