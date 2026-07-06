Return-Path: <linux-arm-msm+bounces-116772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JiRWJviWS2p9WAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:52:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF87C7101C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:52:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XsySMgQX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QSXxLaAo;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116772-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116772-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEBE73054690
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5C941F7C8;
	Mon,  6 Jul 2026 11:41:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991BD3BE17D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:41:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338072; cv=none; b=A+KKGmWJ9Na96aYMcifXtFpSqQ6P53ULeGEkQcLpsDjCcehCqRYR5++v0EZvtTvgvRsLO0Egw2Jp5EBWwugJRMIefn+CCYPSNQf6VDzt4/ELBKm+nQpfaeX4M8ebTRMqhAFgZvOYPAbks15S4FBOA7QxPccjXL4kS6COqGF2jzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338072; c=relaxed/simple;
	bh=M2ww3vjExAjNaQO3jQvVY5phe/1Oft9gRD5oC/hyYXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGNUHPXLuO1C/UqnjEAkjuisczywwAuQ6cttnlZy3czlKtAvwm0m/ZaAVlaagItVs0+3YOS5zfTKg+4+vAlJ6w9TdbdMws9GrjvDz6rhCl4TU0VYh+OK+slGLGMN897uomWzRz904XbKIyETjjCIrfROKj5p/inNAl5S+HSudFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XsySMgQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSXxLaAo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxIem366850
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 11:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyWL2bmNSCp8kUWSmxLKw8OK4EFDlj3sVJl+0VzDp88=; b=XsySMgQXvfPgt0+a
	HXtcu1zM2rla/ZW5eTCxaMB6FICW13P1fwym0A/MsfBjDjqUGgXD1EHFUEySuOk2
	2z6rHOSeFOjg0Nyyc6VHixBwF+xqtTVaCt3ADnTB1IzhmU/aQqOPwenB2//RiLUm
	B+kOKlkYz6F03GNs7m211bs4Pr22Yuq9DZfFgJDYUjFMnF4mWSST9/zOrRBcEb9q
	n6vKECdJiMTwf5jgm2LcODgoUDnUe4767AbVeb1xNK1d92+uBCFBvMe85oFat7y7
	xZR2l3W1G+EwqCXOK7NjSKq0MIxTJb8OcGXxyUAjh0LR+gEqcXBvSvMPiveVOXbl
	yRJtqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urp7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:41:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c298a1b20so6242711cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783338070; x=1783942870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyWL2bmNSCp8kUWSmxLKw8OK4EFDlj3sVJl+0VzDp88=;
        b=QSXxLaAot8Tf5U7R380npQth5nkmb/kPxXs8BUh8o9/n9AC1W1AlU0yM2dAV/WvZOZ
         h8XD55XD9NyoBT0awlUWqhsQ4s+74SOfm5v7nIt5uzBCgA8btqi9cvbZqqB5r7Rv1lla
         HEEoUmzmjlbDJjWbSQapi7LYM9TjOKgNVphu4ZY5vKQEAToL4Lm/l7UYO9UGOOJEYVjt
         +OFx0OF+2nDSQC5y5OypiPx7ZuBToacdWB73UDZ5zIZQMvDCTU/g1L5R/4JpIMQMMFbp
         sp6ZyfMVZefBZNp6DQBaLh8Z09qZWTrxD7xj3DEthNF+EXujlEoL8Svc4tFOVrskKJdW
         NL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783338070; x=1783942870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyWL2bmNSCp8kUWSmxLKw8OK4EFDlj3sVJl+0VzDp88=;
        b=jt8Ihue3DKFQg+ZSzsxMMLDlFUme8XIFCitmJttSuHhV+rG1jw7W7QrH19TWFpnNgT
         dk0UpuW3TC2oSCtxFtQMkrRxnIKwU700d6CZVhGjXIdymZWLB75SQhBgig6A6NCYh7zD
         UZzIxzIWOn1OmEHUhaLxX/UgF/8rAhnmKeEENiY2MbvBucdExXDSoSA7bxpiXlT7Ybxy
         zOn8dGSKYKGJVDsgXNz7IH+XsRrIHAhq1i7RSuTw2WbHiWUUMLUBKhWFjBIAPYbhoHFm
         W418khVZEkUwegrRqbFY8DtHaKYsVg0anZxhyVYT34vi+FNuc/l+i0swoZIcIq6hPTgW
         8kPw==
X-Forwarded-Encrypted: i=1; AHgh+RrYkTB9/9OIUngAV4NPFulqMWE2Z/uywoOw+1D/WlX/DDICS4d0aUgB2ts2XmcuUcwKpRm1/+4GFq7LNw+M@vger.kernel.org
X-Gm-Message-State: AOJu0YwHHDF7AMl34tY2zZhQRn1nVrkiil+iUOyZfBGZ7jfkazXRJ67K
	h3Rgir5K5Z0tZG+SsFRiaZEsTGoN1Lw+ydrHHS8QHJi4U0VhKWXj7CiC3vZ6TmYEvDmdzTTk3sX
	OcBZ5mPMDx1iTJpZ8NwVlXLI+GHpd42JU7jUpi/hHePcGvkZq/DG05lxF1BpgVCrV4/rw
X-Gm-Gg: AfdE7cnBo19MP1NfuR9DkwXG6325gWdo7AVhQSkZZiniLwMO4+ybA9fDbhYKz2WUdQ6
	dN5gn/WpkqrJCxyHOvScVKeyKtntH+7v6WvstKycslynIogRSbjW35xNA74Tk2x4ybR0KpuPB01
	29N1A33ITa1Jk1uk0b26Yj9uR7XixWdVHN5MK/OhCCYXbwcu7YI7HfY5Sgj0f97GHciJ4jsz53q
	lPech8Sxmhi/VwyuRIhdBo6sDd14QnF7VFaQ0AqwkIfmUWBREWNwnnTrLPVXP8tmVPY9i5skI7u
	6mBE2TYAfVUwaG4llg4/yU8jfdnM7hyWiE8HqiNxA0ITU5XF20aBy0WB2ryjdm1LRF6c0Kj9d4c
	h5DOxddgr0EdSCO4UkxX/wgn7cFLXV/LAZiY=
X-Received: by 2002:a05:622a:208:b0:50e:6311:7380 with SMTP id d75a77b69052e-51c4be99299mr82578331cf.6.1783338069795;
        Mon, 06 Jul 2026 04:41:09 -0700 (PDT)
X-Received: by 2002:a05:622a:208:b0:50e:6311:7380 with SMTP id d75a77b69052e-51c4be99299mr82578061cf.6.1783338069294;
        Mon, 06 Jul 2026 04:41:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cf68f5sm4059006a12.13.2026.07.06.04.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:41:08 -0700 (PDT)
Message-ID: <4f865aaf-a400-4dc6-acaa-80dc22a36af7@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:41:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -eax59-FBZ25fGj4CVh1TLK-ZT3dwcT9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExOCBTYWx0ZWRfX8Zm/SAjesH7h
 Ez/zYZFLwRhBb48CFimjE+DsI153EB5z3yGpV3EmlLdPoxEfoSMTyYYVEHOX2tgvru5K0sousMN
 uX9MnQOON/GhZPKkQoLB6j4eJe7co0c=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b9456 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=QdFQMySKPoxOC9Zsaq0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExOCBTYWx0ZWRfX4R1UWkqWnA1Q
 HdWW7hBKE/CqrH6Svh8k97wrz2GtZg2EKOR2pbslWrBoZomW/rSeC3L8ayMQ40o9K2ZkLxloRKe
 8+70qQD6WMOz4P7Gnjmh3yu6BybgHFHl/G50ibEtRwTNI+JbOOgGe9UhbDAIDe3RW4E3J5JVGWZ
 wIDSP3HA8Bzar3cicz9+sRVkj21RBixVSmbhtHQIwc7D5iJ3nlbQyAAlbP184tonOXGDo9L121K
 aygn2AKLmPIez4WkXwdG50ACS7CRm7/u8oBej1UZTq9hstt1hlmpzCsVnf1kIM/EtSPLXLKs33Y
 30PQ1CprDT0T1P6zF04NOWClsPMcGt27FoZrNkXBadVsDZsEPixYP+DoA5cJfQEK92mbLHliiFO
 vh/14wJ8oF9rXvHwWKS/PAtV2W46zxrAv767HV4hhL0uKUK6vqlz0Hs0aWD2GO20+Gzg/oMz79u
 K6YuBHDHwOpS018ohiw==
X-Proofpoint-ORIG-GUID: -eax59-FBZ25fGj4CVh1TLK-ZT3dwcT9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116772-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:aniket.randive@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF87C7101C4

On 7/5/26 3:57 PM, Aniket Randive wrote:
> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
> regardless of message length or bus frequency, causing unnecessary
> delays on error paths.
> 
> Compute the timeout dynamically from message length and bus frequency
> with a 10x safety margin over the theoretical wire time and a 300ms
> floor. For GPI multi-descriptor transfers, use the maximum message
> length across all queued messages as the per-completion timeout.

What's the reason for a 0.3 s floor?

Why a 10x safety margin specifically?

[...]

> +static unsigned long geni_i2c_xfer_timeout(struct geni_i2c_dev *gi2c, size_t len)
> +{
> +	size_t bit_cnt = len * 9;
> +	size_t bit_usec = (bit_cnt * USEC_PER_SEC) / gi2c->clk_freq_out;

mult_frac()

Konrad

