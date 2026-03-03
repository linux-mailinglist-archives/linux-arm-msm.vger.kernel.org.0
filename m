Return-Path: <linux-arm-msm+bounces-95084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDDFE4ivpmn9SgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:53:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E96E91EC1F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC4233050401
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 09:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E5F38F254;
	Tue,  3 Mar 2026 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXYm5B5N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA5138CFE2
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531590; cv=none; b=DdPb9lHkE1woGsYOz3Ms+1mggUQWvgSWMLfkNsLRWZevMGVdejekzxnlUWtr16c1QG+NyIFrmEpJOMIOjE7cIYqJ2QNDXAtbdt5s9SoQ3k3i6EoehRORpF7pRjAczZ52rVnZuGAoVmoHWVtH0t87HPCPdEhHtBil1ZYDxyvVTc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531590; c=relaxed/simple;
	bh=IUoIPHZUV2R9A+Mx4Btcjsw5YBqWJfm9lzBZp+H74IY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VyLpnZoVyVfkJmzcvBTdir5bNQ7s8+/n4HhilMt+MwuWkj373kOMQVu5joTdpxcsiwy/uVERwsCkWpmVs/Gui4/pm647dVr2iRqORaOMDa5UBRcuUd7T2at1Aj5hIwVanzQGDljAai5JgDE8IweK19AfOkIr0HB0U3ZrJQTvwW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kXYm5B5N; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4807068eacbso44782915e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 01:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531587; x=1773136387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OtvdeG7knrqNuYWeOBqbghOe0MSRWj5nZRbFtfFtwLg=;
        b=kXYm5B5NpkUwI2XY6iv6fkKNvYKqx5OaSg90cAa+15SBPzwIdkNXytXNyzIKs5TQam
         AKFTKibCPE+UaIu4ubQVozfFhuZZz2jYXh8eSJGiEdPZrLFS3uwDItBe0+SLxN5P73z+
         LOBNCYCoEYHB6zaXgwDzZOZIV+2jV8LSpw4I0TyQp79Fl47CLXzBRJeoRaDB1Pb02TqK
         UnlFvUlF4l+GsXGeJAHomFu1qmpRQJGwblvoLDAWr1xkuGQQ0/HDg2ZTZd63lgeqhyQ5
         PXXMT80WS2iI90Jjbt03/Q8shkdGIp5Q32HJYkhZxKxiNW4mgNCEHXJQDxoQQvjx1EyO
         dyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531587; x=1773136387;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtvdeG7knrqNuYWeOBqbghOe0MSRWj5nZRbFtfFtwLg=;
        b=PWw0YJtuUZ2G08euxQs+qWuk3hnygcy28VJpOZkE1Xwy+/jAIjGXT64J0YHlMMvNFi
         D40BTWoeAlSQL5KIglqiJelyZmbxwZMsUxVmOUTipBUMJTKItksiUfVtslCwkAlPo5t4
         g/7lzlN/mUi1+nji1dx5uM8pp4CgFdCCcz2N5BYCtKzUdNfiMKfa0CJJFT6T9WxgYiKh
         V+xuZim8R6//U+nANo29Yezn3jSvrMEqGWnBvU3GRn/4JSK7NAYrmr72TPtp5zrRbmKN
         RtMXIdQxqM7iV2lFlMINbzuEE/EmbJ5SARhJhZZUzsCtmJi3Xj+YXnAshHriRT1e37Hf
         h6pg==
X-Forwarded-Encrypted: i=1; AJvYcCVftX+9oiwSPUSRbaEDwelmJOEArVwYUNPg7YY0Eof3qaSfl3oErDnV+kUaC3yE3C6kIl96hqFSs1Qa3Rm4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd5UDve9yl2P6AKlPAQJo7P2NXYWhIeBeq8Gr2KFsGcXlriQwx
	chF07aTim0GQwB10YHgJg/3Xo5xd4e2S/sde3BTN1gVa4vmm2jr2aaFl4REdppb2l2k=
X-Gm-Gg: ATEYQzw9yBdOUP/AWPMDRwVIgGakFjjbrk1boWpgwivHAlWlXoHYbhfYsOMmKZgXqPR
	Cf6yIxAzWCVoN1UneAMXt7nClXXprnhXgvIxQouMnirzoRTkfcNd6r33ehiriLeRB6LW/Pnhx2j
	X3+9qZXzQWTkMFtC/j+37jVqifRMgZ8UEo73XeZ/Qv8Uvw8At+3GhU7qKOmUbvLAOeZmt7uOzh6
	6T+cPAurnMpHCq8NovXEXnUzdAskWGkanqYPtnBDG9lPozNpNltp/mHD5j2JJIk0LfUuN08XvHo
	JLGL+DWatF2oSS6XUus7f/HpGbdF33So+WWEgjih8IjBF3CSPYMEWtNiCHmz870Wh8o6n5JMD0g
	QiTxbKI0ldTZWSpvoH7fM2wWDrdktvubFCWm62xKe1alI9opTUgN7Ld7BcqHdkOhJ7oCQPeZc+5
	chQ+rVrlsiCdUJQt6XJy66yopETndlezELqxxgSxtiNLma0DScKWVl2EuExL/15ZqZ
X-Received: by 2002:a05:600c:8b11:b0:483:6f7c:19f4 with SMTP id 5b1f17b1804b1-483c9c0b6c4mr264389115e9.30.1772531587016;
        Tue, 03 Mar 2026 01:53:07 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b7713csm308367735e9.11.2026.03.03.01.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:53:06 -0800 (PST)
Message-ID: <3834ecc4-02d4-42ab-9a4c-075874d27b17@linaro.org>
Date: Tue, 3 Mar 2026 09:53:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 3/9] media: qcom: camss: Prepare CSID for C-PHY
 support
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
 <20260301-qcom-cphy-v4-3-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-3-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E96E91EC1F4
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
	TAGGED_FROM(0.00)[bounces-95084-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Action: no action

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> +	bool cphy;

Same comment as before, you should have an enum not a bool.

---
bod

