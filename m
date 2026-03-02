Return-Path: <linux-arm-msm+bounces-94890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNpKLK5ypWlsBQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:21:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A41D75F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D07AC30515F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6133C35F8D2;
	Mon,  2 Mar 2026 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVD770rw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7aPUqP6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A8A361665
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772450395; cv=none; b=Cwo84zWCvVLoEeCTMCOSLLE+Ta70MOT4eBA/kIWf4pSQgyBdmgtd53VGev9WNxs8N8hCky36ApZNOxG1SRYlwrLz7UeaZd0BOAf5mcbeUlkEkWYQxy13WpupJkOYI/O7q3kbEVVveb4NZ7Uzio6pGnQxQeDYCWMrqoPRLAPxP6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772450395; c=relaxed/simple;
	bh=mwdKK8Li2PhbEu9LQrkeBE5zeJItXOqwr/dGqzecllI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2Tjzm3onuPF++7X3uQdCzda1A3h+6Bwb9iEicqxZGK7FKnf/KwhO5xjnEl+dUQ513oBx1qTzWLIg1iMrsZaL8kKo63lo/VaNEuW7VSvhw1XOlLBknd7VVWPPpiiMshWs6ZL3ommiYxiJuc1Gpo4mG9Pl3oalf5db97DGkYFy48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVD770rw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7aPUqP6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229EnP33630795
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 11:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85tAm8hhBC6vY4ZhaA5ddoVW9bVjRl+sUKNYU4RRO7k=; b=NVD770rwKYD9VwJ5
	kRpb5NgdGs6ujJSsMNw2zYbLw3SREJx50AMmhHB3p8o32L3RI1/HMGpJGsKnlF4q
	wpKdP5ZJK9nr6urLHNlYParF0Vfzn77rKQIPQHMLmz91Mg18zS+mpBV2yC8DBZQm
	SA7Bk2arnmrA5NZ452R5PbYYB+DlIIH1y3X0TjGx+Dt3UkneETobT5W66WpdFcmr
	c9k6zbSg+DaFE+/E8tp5cNiqcamH8ad0FeCm9Hxc9nhVoD72t6cw1/zN7zLEdJ1X
	ZMBzsr6lyXrNtf2Fs3prgFBvVS9zzwGYZZolkTuPy+J226hX7JqYKUHuPCBZPHj5
	ZdV5hg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhreat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 11:19:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so412181285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772450392; x=1773055192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=85tAm8hhBC6vY4ZhaA5ddoVW9bVjRl+sUKNYU4RRO7k=;
        b=f7aPUqP6KMBAKu/iA6iPtsgnFc30PcZyBJBSDvG2J9rEO8S1EgDfLti/li8LW99mnR
         YLLDdO6YMEDYGzaRA1ZNLDulNiqXpPc2Yk5Z9BYHq8aCmiLgLzihRK667iM4ec/Y0x09
         uxcOneaYcAdcATS/Yh05Rz2zZ1ND/IK/8VjCoNHHsNJ7WeLNdPguQ2sseieoEYp0YiKU
         WMkqxlTPNVDt7V1ZIjAJAQNSsMNq72Acm02GaUkcmSJfO6Vy93GUV9+QYXwex8/eUiCN
         QR0dft4K4PQuVsUrpFjRMsKRuZsICRFUWwn41QdwOaVfPZU+R3YOaqv/lcS0buM59SvQ
         lW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450392; x=1773055192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85tAm8hhBC6vY4ZhaA5ddoVW9bVjRl+sUKNYU4RRO7k=;
        b=un+Wfga5J3O9cchssg2dQFEu81E+4vB7NQz5S81/ygMokdkEKf8b0csrW3ThYgp47k
         EmJgQlK2p1+wWAbuW0D3gp2hMCOjT4yLwQ1K4DaLz6g+daaIT7b/dkp7j9+ov94BIaod
         3ouwgvc/IyNNmkPRYWzxRhofiwBkk2z6JG5O3TjHc3hnj40TC3Lh3mUzTGMddWd0nQN/
         PKJzL6y39zAGg3S43Bs/XoUW1OUf19+urGK7uQeTSVKFejd59+ulo/Pd/gU9zYA2GNC5
         OQhN5qVElmujUTt+sSWQHq7S3Yj0xDmtChT71ksR4QWoiumgc0D4BU7G/O9uGezXDwBX
         +/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVmJb+KHwgUXBa8ds0+9RCxzfklXd/WhcYU59cg0uuUci4Y3B708w6Z56bQNC4ulf5AHG2aEB6vcILCO0wL@vger.kernel.org
X-Gm-Message-State: AOJu0YwBY0ZJSpArpk6ffNxmFQnIHDheLRs9wfd7KRz8bCls3lHC9MRE
	Zl5JNdTbcJthAzg9IgeuqzYIJ50szhTfFkNywx0vyGiBOUfhCTw2FR/NDdKtcMUu5evMi6wxHiG
	X5nm2sk7ur4il1RH0prmmD2+pZWJ0Jy/caZtbH7wsdvrqt1t/eTUepB/EM3qhJhQEUUks
X-Gm-Gg: ATEYQzwT+v8qUGO4Iy3P389PrNrAG38lkOnafPMOtlCMGD508cV1JIfy6NCi94xhEDv
	8YNlrYr4lI9UTkUjeHcO9AnHEVywjewkjBZp3Q6QFFq95E1wfON6N+BakTvAvAT/t/SMI9aeQK+
	4IO9jkiyfUW700PskyPt+piCO6UHkrsyN1CKbH683r5fRjlk1XMTdjotk9tvppLvaNV/MrAQiTh
	jQuqD9msUA2vol2SfBTQ8g6jdq9fd/kpaOh+UlY3q42mHVufdZ9Zw7r8LknVxqECxrHGVZnSWyp
	QQYL4+ayVyZoCMzH9P6cU+57ek8DDzMcYhLAGJjr9soGKCi0gIT46iBNyqE+Yc1pktjnTdoPl+e
	UOZ95N3ct2IA2LgflWKU03PBr0wz+NtKqHhh4hKkIDVkTccnuFcWScKhYSnx95Bk8+TaCK4qL1k
	T24K8=
X-Received: by 2002:a05:620a:190b:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8cbc8daba6bmr1161591285a.2.1772450392474;
        Mon, 02 Mar 2026 03:19:52 -0800 (PST)
X-Received: by 2002:a05:620a:190b:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8cbc8daba6bmr1161589285a.2.1772450392029;
        Mon, 02 Mar 2026 03:19:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66003d5ca55sm1927759a12.28.2026.03.02.03.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:19:51 -0800 (PST)
Message-ID: <05ff4122-1a8b-4728-81ac-33a7ca542461@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:19:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CMA allocation fails with default 128M on X1E80100 (Lenovo
 21N1CT01WW) for ath12k
To: =?UTF-8?B?UmVuw6kgTcOpcm91?= <eldeinformatica@pm.me>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <7pJkV7xouk-7S77gIvCwPj5EAAVe0JWdkD5Dc4Q7Y77_gPr5m7jMA2om7AyEN6RKBmEyFbIDJceHFstXFuzPJWPNhqafLXOu2O0uCDZEFcY=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7pJkV7xouk-7S77gIvCwPj5EAAVe0JWdkD5Dc4Q7Y77_gPr5m7jMA2om7AyEN6RKBmEyFbIDJceHFstXFuzPJWPNhqafLXOu2O0uCDZEFcY=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -AUZx3apchBAVqKEvBEfbV2ilznJmRVg
X-Proofpoint-GUID: -AUZx3apchBAVqKEvBEfbV2ilznJmRVg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5NCBTYWx0ZWRfX4o/mksm8V49N
 pS7xMbr/cLMFSv8Ljtn6nt7RYRb+rVWuafrZSCly+cyOlHc3FQ/UAG+7wiAOv40Nhgdv2sWmC4D
 QUP9tebyGH1xyqVwpHJa8yQoykKO0ffXEV/TmQRe3vJhsnxxOJMLed+ahOLvQkKSu7NEmVMt+AO
 jFh13skxu7RSSi1X+XVn4sThl22KPlTvKG/vSHkOymbIna/n1PCyVUuqnjIGK+UHuNRQhibsJIe
 eUwSS+5gtdvoNDW+u1fI8VG7BNkeWeMeHfWyiouCMRAMOs1egTBLQ5G90+e1Tgsuwh6loXUa7Kh
 xIuP7lrYMDDrZ3vIh5TA+V42lzc/yIassjfMBpxH5qe3uiw+2GNIQfm10hKm0Bytb4vU3fusPIF
 WZhALXCPPdJGYZozudxOQs2qjWQQo/waCqnMpi9PyHSFzScevTg4ifIGJTKcDqysD3dwfrBaMS8
 jqNsz4nLToY6ywZkAwA==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a57259 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=XaNSQNG2WT23jTI37ZAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94890-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 199A41D75F0
X-Rspamd-Action: no action

On 2/28/26 10:29 AM, René Mérou wrote:
> Hi,
> I'm experiencing CMA allocation failures with the ath12k WiFi driver on my new Lenovo 21N1CT01WW (Snapdragon X1E80100).
> 
> Error in dmesg
>   cma: __cma_alloc: reserved: alloc failed, req-size: 257 pages, ret: -16
>   cma: => 1042 free of 32768 total pages
> 
> System details
>     Kernel: 6.17.0-8-qcom-x1e (Ubuntu)
>     Default CMA size: 128M (set by the distribution for this hardware)
>     WiFi chip: ath12k_pci (Qualcomm WCN685x)
> 
> What I found
>     With the default 128M CMA, the allocation of 257 pages (~1MB) fails
>     After increasing CMA to 256M (by adding cma=256M to the kernel command line), the error disappears and WiFi works correctly
> 
> My questions
>     Is 128M expected to be sufficient for ath12k on this platform?
>     Could the driver be optimized to need less contiguous memory?
>     Should the default CMA size be increased to 256M for X1E80100 devices?

The default value in the arm64 defconfig is CONFIG_CMA_SIZE_MBYTES=32,
although most laptop DTs individually add a 128M zone under /reserved-memory

We should probably enlarge this value in either of those places, although I
don't know whether changing the defconfig is going to be welcomed..

Konrad


