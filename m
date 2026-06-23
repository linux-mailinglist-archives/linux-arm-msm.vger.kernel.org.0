Return-Path: <linux-arm-msm+bounces-114162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8FraFKdhOmpu7gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:36:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE1C6B6516
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:36:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pM37HVtD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ff2SJ802;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114162-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114162-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DFFE3085236
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCF93A987B;
	Tue, 23 Jun 2026 10:36:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0918C3BCD3B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:36:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210963; cv=none; b=PAhl/9Dz5JlC9H3CJroS4AsFlnIj494JvZR1HGEtv9BxnD89C8/ongPdDTlxV2B3bJhNEkqpYY+E3vxPQ726wuwPv1LspfaRcFSdq1zE9yV7YWLM0p9hhOB59P0evHoIn9mOLN9Hptl7u2VK+nfr3CHF9gA1A6bG2MBYU84NWpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210963; c=relaxed/simple;
	bh=Ypjsb7ffJ3S8Nz8NiWmWk48MTEZVL19ewMrVARd79ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsOWIzZm2PBhpOepWPB82Ow1sFltI8o7KqQaVOtK2BnmZdNfYwEGSFzp00CgvLFoRJg6B30arEmWkG0irjZPgfG4VDDjP8YJ20/fiUyCO6sHTVL8ReqrfVz4gAQB9Yy0R8sFaejBazF/NTjwc4KHzHKfvJ2sYjwrkKVgvbHNKCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pM37HVtD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ff2SJ802; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8UxW33244161
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SvcgX2Mx7MHm/zXyDT7p8L5HhhnE84M1CKNqnPq4tA4=; b=pM37HVtD4mBBcS42
	4uJ76/x9uB/65PmcWZ9Q+lGRITQLzL+mX8OxlAIRQ2FvG4cOu3JVUiSWgiac5KCb
	e7UVkGwnO2nU2Y+rcqv2KqARDn2LYmeBIwxNTNNcx7s19Clglc0aj3r/Qq84JqX/
	R48GbaR7KZ4qksyZJEaz4IJpzM+oeiDzW+zpx08/z/hix4v0cNJZ6hwEsvcTfAq+
	gv+/j0xvOdDZh6eyYy+tMHxqWY6uCo6TbfxpSe/yQ4fpYczDKqvYYT93fjgLNkNx
	QNbU/o6fQfEDR7kKuAQ2a2k//jrnyS9nXxl6KldiXYmGqsjuSY02s5kDXQwCLQlK
	iZ+rPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyghwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:35:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517bdeceb54so2083081cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782210956; x=1782815756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvcgX2Mx7MHm/zXyDT7p8L5HhhnE84M1CKNqnPq4tA4=;
        b=ff2SJ802yoHWHmF3CQ0TV9IiA+1TiwrBfhfPGEeqD+uJvFi/m0pHvBTm7NdUzqGz3J
         bfgroN6pEQVBY5+E3F8ZhhIj4QLw5GquK5gnmuyNCwnSbOTkm16jjNfb3yXkeK+B/ZLY
         hNlPn3XImhZlLfvclZDMRaG25emn180cQViPxQZeyDeyBULDoAz3OJL520IWINQHkmFf
         PuPNvp5PbFY/QIBBsBPVqbnpqcVWKcDaIBP6NJmTG6ZJpFoXPxoH2PEbEQ6mXcQIAcgD
         MCqSwWeGGoegRyBqZoutgzbXChWlBupRP7zoN2XJxRwEv41yIuYaJ7sdK+UQagfsX1mE
         Nhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210956; x=1782815756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvcgX2Mx7MHm/zXyDT7p8L5HhhnE84M1CKNqnPq4tA4=;
        b=a+LFlViBGTj7TVraRY5x0VLXlBAhNcs6TVejHcLrKyAwGiywNIZWMxe7xEXgNvVads
         4hMJMAQdciu4XPSV/7+YzNiplu7EGB606mjX6eCRjWxVVJWpB3qVlPC1z1PWsunLhhMp
         xAjXMAA/LblxVbaPwTSlOI8OL5J1+jX1M1gzc6kn3znHmHAkCdNghgSk88uFljFKbfRS
         5+LHKrn6Zfdx9RwEfYMC93u7OtsNS2s/8Na+iQs91wxgp+U+lqT+cj0AC6nsPIVGR3IR
         FmVjAdu3kDUNPeMSFBM/S2yRwC5LCwwBagwWi4Gz7GwWzxMKBWoFj4+0Qj8DbKTmZUHm
         VQYg==
X-Forwarded-Encrypted: i=1; AFNElJ/BC+X3JUirURRzupegTFW1xYQUHd3T/JL7JzfEGuvZGulCS2wEXzE2ZnWFMwH4iKqrxfHxefRIrDhspCPU@vger.kernel.org
X-Gm-Message-State: AOJu0YymTUPhTl+pOsd5P364LeV6B9NYx7aOAPIMHdh+lMdWOeJqm/eH
	ONY/lEckP6ce9n6LHK9NoW27wrJApuHEsGrzUVTiJ7u9s6wA5DXtVrZzGHr0VysSrpQ6Q7IH690
	W2sh7zHzTQJrsnts7iYzESGkyFNxdQyjL2XF81rRp/dgVvyzESALwJhzHheppdWBzZH1U
X-Gm-Gg: AfdE7ckmwzr4eUKixCCHXTgfEltpdF8EXmyh2gm4UJK4VQlqG7LTXytYqevfnMS1Bso
	if/z9aPzW33wM9Ic2dCqZB+R3H8N8jY2Cit/nfXSQ49aHZ4gpn1Eo+MD0UGCbCOx1anVfU4xgY/
	W9BA3z/6mXzzK4o0JKkN/VIdYQ4y5Tq5KskgxGz1yedpMOZCDqIGHkEX3ocdnNkpPM1OCq2tn9y
	7StxfBOIOwcWG7YBr6mIymdW1H1DJMJgUAzneiqfxvrZcCmp92ixcfptgV2yRmTLoXczQtDceTg
	5kzIrRkoqiEZk0R5dNhWyVyek4CLgwrhJsWdy5Pqslva8NS0quuKioEALqnRjXcmFfgGHu5hum+
	O2fRLjwZXOg8Vhn0iEAc6bQPbH2nw2D77tjQ=
X-Received: by 2002:a05:620a:2b86:b0:916:10f6:765e with SMTP id af79cd13be357-921864c4a67mr1410030085a.6.1782210955855;
        Tue, 23 Jun 2026 03:35:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2b86:b0:916:10f6:765e with SMTP id af79cd13be357-921864c4a67mr1410027685a.6.1782210955461;
        Tue, 23 Jun 2026 03:35:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c61610bacsm505609466b.58.2026.06.23.03.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:35:53 -0700 (PDT)
Message-ID: <a87ecadb-9512-4516-b82f-1855ca3d3bda@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:35:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, broonie@kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623071708.2822269-2-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623071708.2822269-2-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4NiBTYWx0ZWRfX0RcopdzY8gVM
 lHeI6eDl6h/qYszZH82ZqsmVFO4bF5aXqYVcZEcD3yJx7L5t5z3zwsM5520vsZQ8BV2oAGFkLxe
 FNNmuG0DcQwO0G+na3WhYFU9/vwB6qwHwtlLz3GsZGwpidb80qzgSgkt+weWtdSIhM9TXnViczP
 /yrF/tRR3cwmplU/kKaAsWKSMP/FUyk5wdk1BMrWh0dZ6gGPQktmK3kCPGdOx9Eg1DweBJij8gV
 4nrIplsKA9lOf6Dn/tsvH5CH5R2xbeyuxjYw3zNGL1SHNeqgvgM5W7BVom8Gnds+mdWyDvoF/2b
 nUDRCBoeFyFzZ6Z6hwIdK0VMq3T+HH5DoPgrG3eLGUcSnXoUVvvgxO2fenMf06+88yoyOlBtbBc
 AkcS6AuHOfxH6OoqoCQ0MtYyXRSdFQ==
X-Proofpoint-GUID: ZF70IpNdqi-11gnUR-Dm8E2NrHYW8x98
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a618c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=t2ZNzEmchGV416yE2bcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4NiBTYWx0ZWRfX4VnY7HlfuQWW
 nOprIiPVlc+P/RRcnfrN4yRCzr6najjQUWqCbR8y35oHT4sQE+Uz1bge8MAiebqlnq1/lFY3gED
 yLvmzsjGZzdee3XG9D5u6+R2B8EOq94=
X-Proofpoint-ORIG-GUID: ZF70IpNdqi-11gnUR-Dm8E2NrHYW8x98
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114162-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
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
X-Rspamd-Queue-Id: 9BE1C6B6516

On 6/23/26 9:17 AM, Ajay Kumar Nandam wrote:
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
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

[...]


>  static void wsa_macro_remove(struct platform_device *pdev)
>  {
> -	struct wsa_macro *wsa = dev_get_drvdata(&pdev->dev);
> -
> -	clk_disable_unprepare(wsa->macro);
> -	clk_disable_unprepare(wsa->dcodec);
> -	clk_disable_unprepare(wsa->mclk);
> -	clk_disable_unprepare(wsa->npl);
> -	clk_disable_unprepare(wsa->fsgen);
>  }

Can we just drop the now-empty function?

Konrad

