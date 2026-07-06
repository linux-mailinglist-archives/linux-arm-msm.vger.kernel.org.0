Return-Path: <linux-arm-msm+bounces-116708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iODANZR0S2ryRgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:25:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD3970E94C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:25:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pZK49CXW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JmTxKnt+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116708-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116708-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE9DB3061056
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EF24CA267;
	Mon,  6 Jul 2026 08:59:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B403F8226
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:59:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328381; cv=none; b=BY5Y5iyJhmTCmRyaFJ9/XFvs06acDa0OTubdfy4sjTnqAzu8D0qLFWifhO/slmbQHutwG8j6YFkDjd5hmDS1iOxXamv3bwCof+ulxqDoKuOgY9ppNkU0IT4TGVdgwmh868jMlfmlFjXrVmXXxlJV0yALxC3d1FyogbwHj3cyQqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328381; c=relaxed/simple;
	bh=gyxOXMMbk++wVl7V69/3mnQLURjaC9RM/JwO65/GSoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FK+Te7VCY9bH/J6sWGtzjdqo+Ug4d4fDe2zXVWWsxYFw3L77KfpVXFa7oEBqRNgc1V+cU0YZg0RHvVYxIhhBEaF2EYu0nqvF/qpCrrl94lkaYtjhBvOcRUo/lYZ9a3T+Qi4qekaGo0NoKftS8IPcPWbot76k0GCWF7OHgbJZ95g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZK49CXW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmTxKnt+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668N2QP4072458
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gyxOXMMbk++wVl7V69/3mnQLURjaC9RM/JwO65/GSoA=; b=pZK49CXWT62Lcuy4
	Bu+DDwFjHtdU53bRO7cjCi1hK/epxPJSjbJ0PI9VM4CjdiqUziN731mrAvxsYnCM
	W8P9n92zyDuL7pNL012LpgTA3wNyXLIHj6waerABuZz0Yi11oEYIYIyNjRfet0nl
	8HemN1JCkIeuPKZfae8UtFZgJhzOgo6S+5IPYhcHtfHn4sEeChYygtjBL97jpCLK
	6OgHBgPzGtojMUybBRdF4KStjZ4mEHUEwzJXcDWaF1xuU6OSUnVaS+iFSKni+/1M
	tfwPmgWOdomKTouW7FdVvJO4HIwLvczAcWLA5PK/7mXGGQoIyiAlcmfyslogcOWX
	Z7wORw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t884q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:59:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478a1ec69fso4129841b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328365; x=1783933165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gyxOXMMbk++wVl7V69/3mnQLURjaC9RM/JwO65/GSoA=;
        b=JmTxKnt+6dkRh7T3qfNrWItxvDj/cgcvnQs1vp2Hn+vk/vRIC0yKofEP1Syjiw7tap
         l5uVmj6rlmmCRyQ3V3A7DuhKpTg3ADRaEYASW9p/GyRYNzh2Tsw+QC5fU510fMC46Zob
         PaslPkBisqS4Wv1cq79YxA/+HqT0FF5Wl1uv/U5UxNxNtCgu/5p+S24ZdbFr8Juy/4Lm
         9O9UqSm3UG9EYMAGGgorOrfzn6j25ZfGKLdQmCNjw6D4rI9W7YoNH2vnyY4bF6R2Un/8
         IW1AOx0V78Xp1J/FIUGRXH3g+TKA+n6wdIoxeBsbr1xXXunINbf8ZpYjra14K9VJ/VcD
         QbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328365; x=1783933165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyxOXMMbk++wVl7V69/3mnQLURjaC9RM/JwO65/GSoA=;
        b=WuXh0NguWZco46pq3KAllAWVLYqrQ1B3GMhA5gfGbMlUcHehN3IkEnrIqwZwnohNqd
         HLFhTBY6BzSBkIQdUk5vbFHjAH4tiwhKxP5hv/LfKxK3/g4m59vSJmXOeVhBZt6WspOK
         DPRct1wp1GFwTjX82mbw3tqg/bnRzjqz1ZHTSZvyNuOaZEyniFkuckG7YCxyWedA5J/1
         Ta5d7QbzSu2Wd3av+xyeogbIKaKKaAVyO0Ga7MYfatveMs08oLtNrPL+4eoJ8+1+VK78
         qyT/nuICckBmUK9oHjK54Xx+w/qzhzJZSim8Ym4Ho580DWi48DtrrbdrGCbL/pg0kF+S
         zDpw==
X-Gm-Message-State: AOJu0YyE+hHVwsdSNBWKvt8M3aoXYg6U/3GasXrR8jAxejv5eO5+/B+N
	d3F2Azz/VG2+weL+wqMSpj3LDDJpbZkKdx8q8IbId4i02XfXO6Zhycc8q57YJaT+cXyplMMCWdf
	klDDjlFY2jbuXoKS58/Al/Klxdsl3bseLtyG63Bh4pACAfTWhLSeY7uBmaiUhWRFFnEmG
X-Gm-Gg: AfdE7clwKxGlseFT++gABKmDDB1xUg6BLn1H6Yc72vmuS+83t2pSvd9gVjheSJ1A9Lg
	c7kENHVcAC8CV1b4jUuk/OuNgfbHk4iGxNqXvnDu1M16F6jI5GfHObUNDxSjxekhmGAA+qbqRhd
	6cS/7xjuH87M4z/jzXw7dRBsLC1hibjilsQFeugVNEve4xBCu+XkQLCB6oF4gZqTQT8nFuMlpcj
	woKIlUs1rS6sSxw1zSLFKOSNi/clnZwWLhN/JRWum+IRcw5AMQw+t3h0vrW/KGdjhJ2PnYA9/N0
	ekPNNBOUQ55uhwlfZ8EPDLOV0+8mxpJH1HQ7NeLxZduPfuxtXCsP0VBKpyWsXF+UxLqUjPZtCee
	epSEBon7JVHkfdG1fCYaoBeAtb2NpgtyV/hWsu30cuLvLW4ZcpfNtZYoJh4ZZv2yRSQsjM4lLzu
	WlMfhNEQ==
X-Received: by 2002:a05:6a00:aa0a:b0:845:4928:8655 with SMTP id d2e1a72fcca58-847f6f0ad41mr8501289b3a.39.1783328364318;
        Mon, 06 Jul 2026 01:59:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa0a:b0:845:4928:8655 with SMTP id d2e1a72fcca58-847f6f0ad41mr8501213b3a.39.1783328362871;
        Mon, 06 Jul 2026 01:59:22 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbd07csm3418527b3a.54.2026.07.06.01.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:59:22 -0700 (PDT)
Message-ID: <0585ee18-5bd3-424b-93b1-eb841c26b63d@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 16:59:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: glink: Split protocol start out of native_probe
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com
References: <20260618-rpmsg-glink-split-protocol-start-v1-1-c4f93986cdb4@oss.qualcomm.com>
 <43293037-99bd-457a-b190-31fb24625b1c@oss.qualcomm.com>
Content-Language: en-US
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
In-Reply-To: <43293037-99bd-457a-b190-31fb24625b1c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX7vJOL2XImUQL
 0SEHCaUfzOd4jMcHUsZzuqT9Yi8X6pQunuMBKcMjZF+BKL/jumIDsmob7eBiABSmC8C+Str1nYB
 0+vfwe+T24eeNHs2rJNBGPlUZcpM0O0=
X-Proofpoint-GUID: Xoz6wL3BK35Wd419JuyKYefHXhxOHqbQ
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b6e6e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7emMc0f38C9vq9mhEe4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Xoz6wL3BK35Wd419JuyKYefHXhxOHqbQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX0lvWDJy6fxMF
 nwCmaOVlh1OL2AMprv0K+Zlx+X2Bz1UWKDkd1MilS4dz9aiCdOAYbyfBr9bm8Iz4PcUFbhOblTu
 E9k8JJykEGwhskhQwSy18cAjhQvoN2AohdIQc+glCXVaj1Z9PQfPb5I79zvIEA0+1CH+jcKai3r
 Ria3CukouwdwmTFTFZTy8Ynk0nrmfgY9RlYNb03FhRDFK0fO9bf9bCW4yv529B5kF+LzS/jUfAJ
 ibMGY1wxO0bkh4t+NwOKSGNmKhybaR472SAcbK052WZRDJtz2HVPzPfUzfg1DR5PU3Wsd62Ccpx
 3ejVkwaz/zhrJs6ExYLKpFmUQLtV99qKp6lzuMEiF0mESr2Lf3pAnTwe9+lAntHrJLrmR3CNRBt
 V8KhcPAfzQzp8x+bGxZQ2teXunIN6d5y6qPjMrSFlrKGWWdZvEtGci0RdXPGORf2hHoCxmDQ2PO
 71cX0BdtnanCZRktsHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116708-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chris.lew@oss.qualcomm.com,m:tony.truong@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DD3970E94C

On 6/29/2026 8:47 PM, Konrad Dybcio wrote:

> On 6/19/26 7:01 AM, Chunkai Deng wrote:
>> The SMEM and RPM transports request their receive interrupt with
>> IRQF_NO_AUTOEN and enable it only after qcom_glink_native_probe()
>> returns. Since native_probe() sends the initial version command, the
>> remote may ACK before the local IRQ is enabled, stalling the version
>> handshake on a fast remote.
>>
>> Split the protocol start (qcom_glink_send_version() and
>> qcom_glink_create_chrdev()) into a new qcom_glink_native_start().
>> Transports now enable their IRQ first, then call native_start(), so the
>> version ACK is guaranteed to be serviced.
>>
>> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
>> ---
> Would it not be simpler to just move the devm_request_irq a bit down
> and remove the NO_AUTOEN flag then?

Thanks for the suggestion.
I analyzed and verified it locally,but I'd personally still lean towards
keeping the current change as-is. My reasoning:

(1) The IRQ must be live before the version handshake — that's the core
point that can't change. The version command is sent from native_start(),
so we need to request/enable the IRQ first and only then call
native_start(). That ordering is only possible with the version send
kept out of native_probe(), so the split needs to stay.

(2) Dropping IRQF_NO_AUTOEN does make the structure a little simpler,
and functionally it's equivalent, but I'd lean towards keeping the
request-disabled + explicit enable_irq() form. It makes the ordering
constraint visible at the call site: the IRQ is requested up front,
and enable_irq() marks the exact point where the handler becomes safe
to run(glink assigned) and where we want RX servicing to begin. Folding
that into an implicit auto-enable hides that intent, and I think the
explicit form is easier to maintain.

That said, if you'd prefer the simpler form, I'm happy to do the IRQ
cleanup as a separate follow-up patch on top of this fix rather than
mixing the refactor into the race fix.

Best regards,
Chunkai Deng



