Return-Path: <linux-arm-msm+bounces-95085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDZKGd6vpmn9SgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:54:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D701EC237
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F10C301BD72
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 09:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493A438C2DF;
	Tue,  3 Mar 2026 09:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zCqrT36t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE7838D00F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531671; cv=none; b=dwRIB3EL1sOb0M0da3y/2HxRYLQkiKopBF95RqnpabCFZQMt5+RpYKvQ47iea3pB8tFXo46BZ+RPDAoeQ9rs90h/1wlBufzX7EEEJL5uunU3BccHxGq7zuoETGA71lh+nZxs+19whe2UMQg0MorJdVGBPZwtNF7QP7B+ibrCvaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531671; c=relaxed/simple;
	bh=leDnw+mECy7vi94Aqd8LcK/T7CGiXLcANMo2LYyAIEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8jO5XGaOZBb7sTyuWJzsRVCLT6YeKyrsdhJcm7B6WTIxSvZpP67GDF6/NPK7vN1PQOzolKfH9eceSWXQ+T8lcf9QNbNEasNfgjd9EskzZ6eI4J1Ss50KW+XfGp8vu6+TPsVS6LnDYq0AH2+5sHFob1Rttgr/Q3lSBYU/tigKvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zCqrT36t; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9362ddbee2so751783566b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 01:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531668; x=1773136468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27oC09m77hNLsnkhv1Pbx9jiMQy5tTJyTeXXhi6YTpc=;
        b=zCqrT36tL/fjCY1BXYwzIAAWClzk9SDYJGcYC9fV5tewRQcbIsYpqlLE52NQCYE6xL
         qhEvd4+pXYkNT/ByToBfa7tLq0L9asCuCuApovXMmxvBXijenTBmoaQ8E04kDrrJf7qp
         efxtVUdnj2D3rfcpDzZANVdo4frl3jhoBYAbYSgsHAn3uQuiDgXU6u+TdXr2s4bwx4zx
         Re/p/WUO2xWzxUmpAaUZASGFFzVccTZAEDOvPg9lzQcJB3iKS5kF8yjkuE4PgJ/tEkvq
         U6zRtRhrBTRQWajb+iKGf46tIyk7eiLCiat3ozTZbOGuMj1zx2jwoGZMe2JXnQhakrls
         No2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531668; x=1773136468;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27oC09m77hNLsnkhv1Pbx9jiMQy5tTJyTeXXhi6YTpc=;
        b=eajM8CEA7X9eMpV2CyslJdLix+xUs935lsthSJbHO/HKAHhuJs9TfsMhqHVZNqehTj
         muXpW4m/7duRYQFZsn/kb07VvDv8HEigYsj/y4AUSArhbf9w93An15pglHVAvfCOkAx1
         9joV4zL1eDU0M0QYOQoe3HYEh70BWT9Ph8iuT9d/hoDQtOJKaxX0hmqXrsP9xNZEc2XZ
         9fBRq4w1O4NwtvdA4BBdbrh63jwlnJGTu9MQs0aJhhFnQDn7hazWp8Jb9PsV5bhjla++
         71+TS/ce9DzutxUKqr+lhbCdrT7lpvV9xl28tkLPlXneD4XL847XL9nHvvJy130vHfer
         wzSA==
X-Forwarded-Encrypted: i=1; AJvYcCXidusDMzRH54aielYnJseK+TXb0CnRNfcbrrHdThGDU0FTicnnqpO+NR4mgrMFDDRFIB1MyGp6ZAIt3vjD@vger.kernel.org
X-Gm-Message-State: AOJu0YzxLcz75HCx1hwb4RkoWosF3ibb6KG1KiV8HJ6p9YJa/4TgsJM4
	k5Q/S7gBvbQUehikphdVoe6U4BiPHSB0/FIgPYOI9KwfX1jo5mL19mplRTZcoe4pLnM=
X-Gm-Gg: ATEYQzzozJWBBwYK+vsAxlxMEX1Uq9TJkxo/l30rGBYQrcQyJQ8Ahnm49pc2wSn2xo8
	M14wCXng+nRWDm9yjhYI13cLOlmDdmqnkjB8eL5JNFqKJ69ju5XjhUSTFD1fQ4MxUvbUgtJGL+U
	L2rpmnovNrd3/wlHk7rmA39oj1U9MG4M6Eq4yr+0sblT9ECyGgGHWP/OMQJGSTExIctq/OrZ0ap
	bqFccgomIB7HxT6YNEMGRQpLAdDHF2yif3QCw1KgrBOTqXYeE0gDzgjQKr59ajN0I7rwbQw+Dv1
	/h1jKPG7Gk8FpH8N6iD4WDZ/S60QftkXaLmD5feCUHpl5A+RFQ97qj3+Tid3HDSfJs0GQKDoFeO
	qVRj4jIhpJdOi1DXjhHyVbjQdQhmbD1SfmaGf5pvLFh7l7ldWXK13BUTDMz+AbWZULK1p+K4v4f
	vLxogKAFLcv0AUL1vzr+y4zQn7mNGBRyxPCWf7DEQdz2COH33YhxXH/pBkMiIcv9LI
X-Received: by 2002:a17:906:9fc8:b0:b88:4c99:bc0e with SMTP id a640c23a62f3a-b93763d2329mr1003398866b.26.1772531668056;
        Tue, 03 Mar 2026 01:54:28 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae94441sm570860966b.50.2026.03.03.01.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:54:27 -0800 (PST)
Message-ID: <200485c3-6f6b-4c92-a631-b5fcf3dfe1b8@linaro.org>
Date: Tue, 3 Mar 2026 09:54:25 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 4/9] media: qcom: camss: Initialize lanes after
 lane configuration is available
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
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
 <20260301-qcom-cphy-v4-4-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-4-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 69D701EC237
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95085-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
>   Move the lane initialization to a later stage where the
> configuration structures are available.

You should specify which later phase in the commit log @ next rev.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

