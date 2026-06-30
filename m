Return-Path: <linux-arm-msm+bounces-115389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P5MRA++wQ2rifAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:05:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EA36E3F73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:05:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WhEGOjzC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WLbyOUcW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115389-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115389-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2E523178F5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC4A403156;
	Tue, 30 Jun 2026 11:37:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0EB3C9894
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:37:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819474; cv=none; b=CjkEL8U+IaW2pqPTMoxBhGGa4/XTYDtW5ASS7jMSfjXAya59HjKWsrhzQ/SBKTeqgd+wIozF9QE4+c7AsQv18f1B6L0H5KZQxVdMcHeoQ/RFYnQB9CgNd5m8mc9KDf9xcgcM9lWCjQEKIq0S12WjwF8ikyTgjbuif34Rt4neUsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819474; c=relaxed/simple;
	bh=OKGjc8evu6WM2M0aJPIG4/RO+8j2OSSLHHk7Qjexh4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gX8AtuS4DBZnfp52w+ZH8g6bgQoDFPMlW33/jc3yu9ONES4Vh6Tb1GSPcknqvU0j9ITSIsJnmv5VDQRXd20iaR9L0kw8PGKbmLxJ/wxIPvrUKG9lgZQVQ4pdrfMdZsyH3DcQrLEfn4ulLgWApQlLagxr3X2V0QFD/txsa4UiMrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhEGOjzC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLbyOUcW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mtRr1522265
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ey0sj4w86zYCDfrgPE3RBr/Qcb1sUI5QXivW3R/r9f4=; b=WhEGOjzCXvtcXV/w
	IgQOJjPeTqkzQPi8/c5B8wBXpqb1Q0QJcXWwglPAlin0qKEaTaPjddan50eOftsu
	OaMbZV9rA+B7ikWoAkC8l4Q1BS8h3bhx3LKixFk7i2RyHjtLyMuQ9odmjPs56R0D
	mPNHumnrEFpTV7S7bJ3diur9t35vjaE/B4TVkne0GSwFriWLfeazU2ADWDQb1wVq
	uU6OB52oXpOLWBxuCYyPRWGvJpUWNMo/lcrtIzsyYt70M8+P5agjR+UIHLSA8C1e
	XZ7hxyfFHzXrlHHj0OB0/sRPTj9xP7sa7B7/BrK7vOxoptGrR67X3jRchhK+Numb
	Qoe5Mg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw934vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:37:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c08e9c344so3868771cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782819472; x=1783424272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ey0sj4w86zYCDfrgPE3RBr/Qcb1sUI5QXivW3R/r9f4=;
        b=WLbyOUcWmBYfaLqLvQTVWKgAcjORcqHVRzc0XDWB/ehODsIvyyFjmhxPL7l2rNa+sA
         l0BzWqrdCkHWlbsNTfbJ1jaFY6m7JVuLcwH5pCkNQsW9NFXQvlW5cCV/7uDzJUVl5eor
         /qHy9FddDZYSaKGDAGJoTH6JlKS73q4gWXxAoDeTW/0nlPIIVPvS7UZMGn+P7MK07JB+
         dKVU0JAJMbWVUfuDL+vwzCF6FIaxfw5x27PeZRJR1QRsjUUR7OMzHYt6BdB3xC/qrrrZ
         brsrbs7J+n01NN/sZQcvy+3AgmLPgnTR1o/yLVuxrKbB5cmN1nigYSBK3Q0WSEQb5AXx
         7qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819472; x=1783424272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ey0sj4w86zYCDfrgPE3RBr/Qcb1sUI5QXivW3R/r9f4=;
        b=TeOKVFJqr2W2plvZT3/Z1fmCxsdB6sQGHxWGGek6dYC37J1eeZZOP5i9PrRV/lW62q
         pnHBZ+zAXtE0sy0GBnIH0YiUAtOBRNLrph8e1pWaJCL9LLthpW5ceNTRO/g3FEOm+tL8
         fGorGlNuOM+kiVjnb1YebIMg12Ys8WhO8Qd6euLnpadUgigGS0SmblgZLLxRnnYMI0xF
         UciBX2tNUZGNQOrmJIqujIuZDz9MkQqCME6az8w2af6rFu7NNZzwMK6HhuYNbo2aJEG8
         SHXEBjz6ltTPwY0rjlUEc5b4TDH/qSheRe8iWAhQWadapwtWfWi4GNi6BR98fSuhw1tc
         9fdw==
X-Forwarded-Encrypted: i=1; AFNElJ+rlRtVeBZT7u9bfcU0kGxR2dPw4Th1CMmdcdOTDjPRwsicTGwBpyz3uEOXIxpU2kc4DbIofMgG7dRbtMOe@vger.kernel.org
X-Gm-Message-State: AOJu0YxbHx3yLijAv8dJVmL/r1qYjTicn9VKd/KZqWdx0rYZ43BWf5NV
	Vm2UCKd6oT3/RrKh+78oYhdIf1fg2D0hf+eduULlVvvgi39Om06pmWhCycl39+ccIDPreZwIjpz
	xvmyYLguJSjpMlQQvuvVeiiaQ+QBg9X/03HZn+8b+ufyf1cgYOyDuyOzHxL+qP0NBX+o6
X-Gm-Gg: AfdE7clk8syxUgoHzJRiCKJZSr+CpbcsiLqtiTGN4VHrILhC3Ih66voHMbD/uN6YFp4
	m5rcE/xvW5juHWezivJQya76rF10vBlFeE504hNj1fYNpLRRqIrBoLHZBEkOMO9iszr1FXIsb6e
	gndJHc4O87yF6lew51XGnhygt4gEi0lA4EKNMZ8VAV19tHeua0lbNO27tr/ZA/DahP1Qg+rW37V
	SqPaEL/vN1XrLHH5O1YeM5gdz6vZQG9BtQAGZhrDdP0PS5/DWtacycnBaHOZJt7YyN1+F5eV1rn
	lsKacxc6r4ZFPC6W1rsZPPXl7l2GeCtER5iyd3nV0pLMZG90+KkGdDQfWgrKQRrRbvkf5A6XxCA
	obYwxVi5T53tCcP79O+92pP/GffTt6az7zv4=
X-Received: by 2002:a05:622a:11d4:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-51c105fd0f5mr32201311cf.1.1782819471780;
        Tue, 30 Jun 2026 04:37:51 -0700 (PDT)
X-Received: by 2002:a05:622a:11d4:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-51c105fd0f5mr32201051cf.1.1782819471326;
        Tue, 30 Jun 2026 04:37:51 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f47394sm108948566b.43.2026.06.30.04.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:37:50 -0700 (PDT)
Message-ID: <ecfdafa9-cd81-4f97-bd0b-59ee6dfed112@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:37:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
 <20260629-xo-sd-codec-v7-b4-v7-1-fb37ce457c42@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-xo-sd-codec-v7-b4-v7-1-fb37ce457c42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwNiBTYWx0ZWRfXzUQDFjdGgxDm
 iR+rfgaCXEsWdEraveR+uZuWHBO1qCmb8ZoxjLZkv/W/D+pOOe4zCB2E+zA5wNUKDT8wCEZbgp8
 Dp4xH8ezlEhz+ZvfAHOyq257rkZShw0=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a43aa90 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t2ZNzEmchGV416yE2bcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: bPaObrjYq4m8JPSL_cMetiRTLlJLOroI
X-Proofpoint-ORIG-GUID: bPaObrjYq4m8JPSL_cMetiRTLlJLOroI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwNiBTYWx0ZWRfX3qEnZDXTdfj4
 npgvkLq1gUJLzZpRQp+tjBe43tl4LREpMXtzC6oT3BfOtYDKi7XUoRcvjDMlBJ4s2rTBM8dRkRG
 fYTinsgrH6YHVbFDskPjzET0yijXWoFgUS/CGoUnXlgOX8maIhKPCx02Ff8CQMnd3PNpMJCB6xy
 r5eyIx+EnYdqYQ0AgP7fNsOq3Pir7CaiGyl4IkoUhlnLXEdDEfGYr71SH0Hy5wIzOMkZ+gfNy0R
 6hcRwwrUdEYvt16VYMAZ3VI/ZyXDFhpcvjxvWDZAhvWDNMJqUkPCaqX5/cXCg1ACG+KHM5yK364
 7VBdn/9Yl5snqOUj/oHtaQEt9nH9uGbUoePNZ7ALC5tH/ZLLA9Yj9h1wHIAHFObYviFcMqFzn90
 usncBZnrYwDLIWKmVhMfiD9V4sO7YqukFXNxbwa59eTjCITj8SnpLYqWe7Q6HhHgn1d5aTSgc/w
 A/6+NenOcJAROdv9tGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115389-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93EA36E3F73

On 6/29/26 12:05 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS WSA macro codec driver to runtime PM clock management by
> using the PM clock framework.
> 
> Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
> helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
> from SWR clock enable until disable so autosuspend does not gate clocks
> while SWR is still prepared.
> 
> Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
> after idle while still avoiding suspend/resume churn on short gaps.
> 
> Add a PM_CLK dependency to SND_SOC_LPASS_WSA_MACRO since this patch
> introduces PM clock APIs.
> 
> Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe and
> by restoring regcache state if pm_clk_resume()/regcache_sync() fails.
> 
> Suggested-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

I think this is good now

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

