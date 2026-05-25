Return-Path: <linux-arm-msm+bounces-109651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLCyIltDFGrVLQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:40:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 845A95CA9E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 781543000B96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C94E38228E;
	Mon, 25 May 2026 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnbHTBxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fLJ6a5Cz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DFD3264D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779712819; cv=none; b=BwvhkxH4YJLg8L5hsYH9mp7FZ0f2o0sc9DtJW8OUpym0gvIVZXtN4LNYFZgFUVwHKHgHLlZ0iXVe/1Kggw3IylD7rqUXF2eYYfVkSR18L377qVtclaQXJ8oZs+CmOthk8+5QR77aHGlYWNXclWasWnkGAvsZhb3NRb4nMtX/rto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779712819; c=relaxed/simple;
	bh=MmglVhlO6xRIyqHwjXuSIzMFaQCymWUXmP5JOhtQ+JE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mK7r6xBZt6GlzVPvHj4McacWPxxxKVnodDK7kW1c9g8LqK8W4Qvpv1qKYdBwIVVvboJ4e+1We/3XiDrvMnr2bSJZYC7i4oFT7GR1/u+FVW8f+XMw/yGEsh7bjCgp5D4K5XvqJqfCUcyA3lHpLch6O5OH15jt90y4lZLcTXlxFtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnbHTBxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fLJ6a5Cz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PBPpE93264052
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmglVhlO6xRIyqHwjXuSIzMFaQCymWUXmP5JOhtQ+JE=; b=CnbHTBxGNIfzUJ08
	j0kVrg06YgdpZTAj4LUN6Nzq4fIsVGZvtLuSPcFlPFvuRTtqby6areJRJ85RSo5o
	/S8F3Mmi5IQYhtXa1TIpdH2ro1Y6jZ847LkD9kNbFWPaUmh2e1SpFMYJ3IGyrARA
	pd5KqXEOviFl+SJr64kdLcc2wBfgZQ/cT5nEDEp0/T6diM9vNV6YCSCkabKuM9R7
	9qj+cAzmhVjsDnC7DhxMyDMUmEvMVxJoVUmfHn5HwAazetU+tu3EBq5i58hCQ2Fa
	Fe495Y6rjA3aDlh8YrGgi3YvwPkxkIh7ukh/JH5im2dwElNODNqAxLMW+rMlsHq4
	ASVgRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs075s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:40:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914cffbffc6so15209885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779712816; x=1780317616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MmglVhlO6xRIyqHwjXuSIzMFaQCymWUXmP5JOhtQ+JE=;
        b=fLJ6a5CzcFpeael5FP2GJ8ZbQr1mhTiK5yO9tVAr4HKxPJseb+8+80WlsY8uGlA35I
         Tmv3h8+xc/77r/J7tQh0FkwzgWfVeLlfXSx+VJYkvm7o2AKpTDDzuTsU7W9cFH32+dgO
         FGlLKUSCDFfMMCYl//+xLq1gUEIMAKJUyNAckEeORdnWOBhlGm6xRN45fD5LSg933rxI
         ojxorH6g0I8KjuHTYzIB3x5qtOJwY/F9NCTkF+9LcJUMC+KTXmCWQ4PD86p+hzSLsfes
         MYTVhWJjh6muCJnx+34VGe7m0Rs3xhnsTxTmur/nAQAJfMXeyfhx5GUzAGBdNU9HWxhb
         /zTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779712816; x=1780317616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmglVhlO6xRIyqHwjXuSIzMFaQCymWUXmP5JOhtQ+JE=;
        b=q8MYIm6tukzD1vQqtKRu7s4oJAPbKCGD7ssGebkBUEI0WzUAv3uw6VXza+UhfxL/pu
         10MFKo0ibRhV8pZugSKnro7x2JJXdtCu56BCHSYNuZzkN1j9vmGNH0NgL289wYWvEi0/
         qwXrxKwtolFs8Pdz/7OnHwBEJ2YPqtMd1aKHi72BZapeGrLML77Gixfah6sTuilFE7Kf
         xIvU+cn7rzuIEtf3SB7c6tEAulPtZg3EyrOwVn8XxkV+vAfYIQp+40nCXT+DcuCp463B
         CTOqM/Hn1qbETMXVpDL1fUp9ePdhS99+LeE7JcrPk84prekoZ+O2q43VMJdclxHPYlzx
         IlDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WxIDIfZMbmk6a182pKt6ga6+9d3DhQfXV3X8qGO/u6OgHaXDOKmxnX8bABZcKJQcsW9KvcmPG4A6QgHBO@vger.kernel.org
X-Gm-Message-State: AOJu0YyD24LVOKFHejUVVuC4bgSOdTiNnyIrIPLciHON9czOxNJKRggF
	xyfHJnJR7NQNEgQZBszYf/k/vEbuwp5fKX9I0HU1ykyDdv6UQbr0qxJYdsMnE0Pgn2YpxGXsKOR
	IJGo9GDnv0fhxztdC1uyyPHg5cKNJaG3jxUpNurAuT2xUc+hh0c9yHgInbUTxY/Q7E5Wy
X-Gm-Gg: Acq92OF/9m4/p+3qwfbrQppHa5rtitc5iZlNhhdb16gRovMdpTqtlk0ayrd6eVpXk3d
	su7WJPRbix6vOsFNMU7OczLk10IjyEoO2i4GorPt1R3c+gH98X2LKlwWYP/y1O7sq2hYQL6Y2ib
	lxz31vK/kTGprROEJrCCfX3sF0bhRpzMXLNCFv4br5vFmo+lAvnkUl8gKFvA7/cCh6hb3fvvm4K
	n/IS+dOSwnIGZmEExwJRbgU9Wr/9l11pcOMhtjYiNDVsQHUzrAmYqsnZ9vevhFATveyw4npYcZI
	N2Xn5QylZf752xdgIzGANw6fOr+DdmTCEeAu0U9+/cH0TTBpIXNe+5uHL626qFRv4muZ/B/Gynk
	+GWtz8D0OWsA2awiUHSRAgWeZrVUTAB6mVx4Ef+i+qqD9Pg==
X-Received: by 2002:a05:620a:468a:b0:8ee:a1d:bac6 with SMTP id af79cd13be357-914b49e9d14mr1374573085a.4.1779712816381;
        Mon, 25 May 2026 05:40:16 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:8ee:a1d:bac6 with SMTP id af79cd13be357-914b49e9d14mr1374569185a.4.1779712815873;
        Mon, 25 May 2026 05:40:15 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f603desm3917557a12.12.2026.05.25.05.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:40:14 -0700 (PDT)
Message-ID: <934e6039-4639-49bd-8cf9-a1674f86b8c8@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:40:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] soc: qcom: rpmh-rsc: Skip TCS init when RSC is
 managed by firmware
To: Graham O'Connor <graham.oconnor@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-2-graham.oconnor@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522060645.4399-2-graham.oconnor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a144331 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VOnKaOCXMBmNH4hAPL4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: TNsKMKp1ylI8cQ0Ph_StDHv_jX7BlEyE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMCBTYWx0ZWRfX1Lx9waD7DNrv
 SWvfh5BAA9hng+O8bQR7wyHpOT3O8Gc/jvqyjoGOEimjC+bAH3iFz+g+L61nXzAYj7ALkAAPPOJ
 UIElRE+fAfG7EQJrp9K09b4NPsKeh4T741HNQK8OnpqVMOT6rwMKWjWh+2+1nWV2hm8C3uRccC+
 tb8RirFzwECTW59OgjHuHACViME2kZOFV77pmZwANc/+gF04jTQgJ0lWrjiG4euReqvefuSGpve
 SaBPCSWwoQP38kfIBQkiY0/S6PrwIV7gf0lHIijM2QY5iJtdPSACko+J+fWVN7dfh/bpg9j3uho
 XZJ/sCLetRkCE5ozak/SSj4+Dh6Ib06qd7EV/NzQvWXMs18Ity78iVdWV7gdG/MxMwc44fPH52U
 Zfl456JG5ZoCL1lfMzwUUh84BBhAzKdVJGyBso54r7UufVLh4z5BuH0dJKzHqaKMMsZulGJi+Lu
 IktjMTsCvDURRkEzcVg==
X-Proofpoint-ORIG-GUID: TNsKMKp1ylI8cQ0Ph_StDHv_jX7BlEyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250130
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109651-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 845A95CA9E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 8:06 AM, Graham O'Connor wrote:
> On QCS6490-based platforms booting via UEFI, the RSC hardware solver
> is already active when the kernel takes over from the firmware. Calling
> rpmh_probe_tcs_config() in this state reinitializes the controller
> while the firmware is actively managing it, causing a security
> violation and system reset.

I don't think this has been an issue so far on other platforms..

Do you have some more details?

Konrad

