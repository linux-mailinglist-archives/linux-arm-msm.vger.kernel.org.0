Return-Path: <linux-arm-msm+bounces-112231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rZP+AIQ1KGrNAAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:47:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96162661F4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:47:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OWfcRjln;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PLlQ3wKx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112231-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112231-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7171D305BDDE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499CA481AB9;
	Tue,  9 Jun 2026 15:39:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240F348A2C1
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:39:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019567; cv=none; b=iTJ1SL4ESW0mD4LE1YTn3wnvlYDni1cB+Qv3YXOFd20tea4/XtC6WIOcn7P1ARCQ6pwKrYUpP8POjXKKcfMTNkoTiU30nRsdxmzLrJ5YMFoCk6xLbLSkTEpmp82qjDo6+qcmLuZwaDczr/3yV3rCdSgwMTsMLH4f7Q/Ro1OS2GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019567; c=relaxed/simple;
	bh=fgOk7XNvoC+u0MAplMmtgtp2T5pEkQWDQ4VLBekrl0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k61scgGHCrZUzBxigNXBZVUq4eRqk9QDcc21+ZP77zaM0pB1tz2G2NQme2ZxAd4rlG157S2e3EDxOVzC020FM7KmrnRCJBcGHVXFOFuzDahnItzYBmgpMjdG6HpKbUj8fGIH0ujYtfi1w7LuqqLTpkHAO4kSvWZDAEmBfNVYPqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWfcRjln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLlQ3wKx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClIeh2251583
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q+18VXdPn92dSS/R99BoxzgkupqNoz7YMkCeENIzjJQ=; b=OWfcRjlnu5uSsEZB
	LcCnGnaorNqUJRueNjxa2AySkMDV7QGM/lXFNa9P40HNg4wtf1bM1yBgmuNR/m25
	Zl9pSAUI62vpYwmEYcpUMkXCGSJ7+FN/HHT8cF6vaPPhgLUJOvb/eVpPfC8XIADH
	ID9bym+bTtkbQt5GQYtivJcgUnbh7LUe4oFCU885zMUOzcoysiDIDWKIEtpyXUbs
	0AQGaAe9z/yO7yK1+RA3hFQNFUnbR1xFjXeidWjwVsmH34Qooe9bSyfZaWmkAJQr
	RD/tTDT2svcXTvnP5L/+zrN5K79PHlRKLidttYOmtCMJKL7l4plGoC6Wzwoo4nht
	0YmMkg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgj7yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:39:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91550f68e7cso149070885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019563; x=1781624363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+18VXdPn92dSS/R99BoxzgkupqNoz7YMkCeENIzjJQ=;
        b=PLlQ3wKx54NOiMEE33d4J1fqMc0osLk66LCo0fqeSYJ5vBw+o93BvL1gGQm5aK4/QT
         hwB2DrXKxUEV4KhqI4VfQ+JLMQSPsAYt2amO/OQonNV2b/c7TwqvlyXsvI2jrXGJ5E8j
         Iqp1u6J3WqdbmPO7M+t1rpkYd34DopWfqkG1qgQ55Ul8cDcXmBmO0pKxSoCjt4nfu0Ei
         19icalejoSJuEejQ+4/2YKaL1Vo0e7OnipstXAXrJ9aMgDFdPlWEIBP0Ld/kt1E0BxZX
         jsRCDoSpBdOQrC3SnG2+0ojoA8zElJ2Rosx4gOvDfk7+T0U4NzAFBvfuKQadmOapPRi5
         FJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019563; x=1781624363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+18VXdPn92dSS/R99BoxzgkupqNoz7YMkCeENIzjJQ=;
        b=f9cpkXCgkjPKU/xKZ3b1+Gfo8cPLT2fHCDpBxzt+2LnktZzL+/C49kp084sB5cNfJY
         eMT70gqB2DfLKGx4poJDnx/O4LkTEv0htjf1bPeow0ic3MJuR07+x72PE9ZfvDHTZmBg
         lLEPnQUAY27F0GwUCCebxT3/natwNnhzmFVC3QhVMzrMQIXtWqIOZ929zETtlAN/DpKk
         xfSDMKfxznjew7f5k/PV58SexTxlhB+0MqeFZD+NrkeAjcvwc9YoSM6Pw+TGI8Ivl9Ra
         RQYdfdhwoFDogaXF7EuwWyV6EFw6lNJMrh5PxasuGgfVi3vqQw6CCw/VWcETZzlAMALh
         n1Ow==
X-Forwarded-Encrypted: i=1; AFNElJ83qh35p3fKYLisI+ElyukZnNj21ctx8n7GaEcP63bt09gYz6YQBMQX6kEZT1BS2j/nAWz1ILhXArwDEYuD@vger.kernel.org
X-Gm-Message-State: AOJu0YwmVkpVFOfkYf6PQLKpgymPICUA6DomuqY3XVF9bKrwNRaQ4diL
	ki2VL5f3JZGFYqEJAn58eYD7SPBLktfJg2ulXA5Db6QQ+jH9ElHaMqjtBsw0K/HJYSf9QFAV/2B
	xjPtbW+Mr6x6RrWT6Skl9mAJmtEFyfPe1yYf5JicF7Wumyr+JRbb6/QUPpeqQ7o7ErrF0
X-Gm-Gg: Acq92OF72XNfO2wAFEEROwFozthx/EzGH7h/a4iEF/UsLsVGlGr1CjQj3+7q94c3CZ7
	1kW19FftpdcLk1H4ULwNUoixOCazlpTi0L0Da1QhDG6V52qeJ+Rv0u0qDUkh5ejnX1+dpqkTIpj
	XJbp1jdaBs1QeSPKEwtnLJoAS9lvoiuImjcA4EW46uw2VK1zSWuu7L+8CvzOCLBOWA/XKK0P/ct
	KNEbucD1fxpDa3xIhbC6yCJc5pIbRGvM9pDoUPQaCjf0uixarSmVE08cHPhoxWniabH/5S4F1GL
	EXcZKUxlT26R5flE2H5Qm5eHA0fRh77zUALEH+1kQI3C0rzcKRz2n79GYBhg+cJbbdl9RQfVIPm
	ubr8RtKYDzNbjKPp319XTX6XSvj3WCbLk9KKZ1wL38A4uI56tpsAT0ISz
X-Received: by 2002:a05:620a:44cb:b0:915:7c1a:1388 with SMTP id af79cd13be357-915a9daebfbmr2099812285a.5.1781019563286;
        Tue, 09 Jun 2026 08:39:23 -0700 (PDT)
X-Received: by 2002:a05:620a:44cb:b0:915:7c1a:1388 with SMTP id af79cd13be357-915a9daebfbmr2099806985a.5.1781019562688;
        Tue, 09 Jun 2026 08:39:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6595c722sm8851981a12.22.2026.06.09.08.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:39:21 -0700 (PDT)
Message-ID: <21e09872-af97-419c-9009-8d84af2d4ad0@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 17:39:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/24] dt-bindings/dts: qcom: Fix PDC OS Direct
 Resource Voter region window size
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0OCBTYWx0ZWRfX0Zji8W9Atua3
 G0ABjq4mtn7Gzslk2cBuk8qCBrWaHBTNgQuW6wDX56piIWgS2v5W0CQpIX7XZVhVBb3PDkPAxaR
 noNfJe+WX0Zp0UtBQlXJhxiOqG4sqnjO3SVbY3rDVQOicGirHv8UcvQgAX7AiSZIslWxEMytbR1
 mYx6Ne20uTGC+wvYMkbGyUNkjGp0VCMzW/t7Sfr2KmYesecXRph7vnYKHWlOEcQz8IYFF8J8SSi
 tmyY7PyCu+0H5yVJwZUuQeHW12jSeMdbdn7fx5owzTK9B0R5EVrdZbxpkYJaXJCLK/0dj7QJrAX
 iRLKXUZ1TXCwxYLgP8ME1qOixW49A5Sl3FqONQPuHdSSvkuRtcPTL4VpO5D31RFuZNVQGwcfvVO
 dHsnmnTZzaSLbDfXf3nvTYIWx9iYZOAqZsf7rixMMja/hM8H13Y5RVE2N2K/TFQ1P7LCmHGZaJF
 0RKG6y4SNChjTBN0N8g==
X-Proofpoint-ORIG-GUID: -okXTZuUxqY7NcLQComUmAFneeU7apsL
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a2833ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=04ycsxgslHV-TqkOUZcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: -okXTZuUxqY7NcLQComUmAFneeU7apsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112231-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96162661F4D

On 5/27/26 11:43 AM, Mukesh Ojha wrote:
> The Qualcomm PDC (Power Domain Controller) hardware exposes multiple
> Direct Resource Voter (DRV) regions, each 0x10000 bytes in size, where
> each region serves a specific system client like TZ, HYP, OS etc. Linux
> only needs access to the OS DRV region.
> 
> Despite this, most platform DTS files described the PDC reg window as
> 0x30000 bytes three DRV regions which was wider than necessary and
> matched the driver's QCOM_PDC_SIZE ioremap clamp introduced as a
> workaround for early sm8150 DTs that under-reported the window.
> 
> v1 of this series [1] addressed this in two parts: driver cleanup
> (tightening the ioremap clamp to 0x10000, refactoring version-specific
> interrupt enable paths, etc.) and DT corrections. The driver portion
> will be send separately depending on this series. This v2 sends the
> remaining DT-only portion.
> 
> Patch 1 corrects the binding example, which still showed the old 0x30000
> window and would mislead anyone writing a new PDC node.
> 
> Patches 2-24 correct the PDC reg size to 0x10000 across 23 platforms:
> sdm845, sdm670, sc7180, sc7280, sc8180x, sm8150, sc8280xp, sm8250,
> sm8350, sm8450, sm8550, sm8650, sm4450, x1e80100, sm6350, sar2130p,
> talos, monaco, lemans, sdx75, milos, qdu1000 and eliza.
> 
> The net result is that every PDC node in the tree now describes exactly
> one register region of 0x10000 bytes — the OS DRV region that the
> driver actually maps.

For the series:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

