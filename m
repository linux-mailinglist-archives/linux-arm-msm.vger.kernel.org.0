Return-Path: <linux-arm-msm+bounces-115015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BIIVJYZZQmrZ5AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:39:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD9D6D9877
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:39:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Rcn1jUN8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JDkttjFn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115015-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115015-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32E74301DD29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2D53B95FA;
	Mon, 29 Jun 2026 11:36:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F333B8BD1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:36:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733001; cv=none; b=XIoo4u7tXfTD8Pd/chxUl23RCZ9D5nB8qui/S1RVhOtAjyVtRUmiJuyO2B7j81rAdMNFh8ho0UCgZyHlHgXn5Ugvp9JJxFiGx7SLS4h1rvkmNd/v7gvjQDKKQ8PvKDsLRuM9jVv52mjuTqzRlXTuK2BkDw3eZO/jY7O/FwGIn+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733001; c=relaxed/simple;
	bh=y2/GUC616dyG9ca9cuwDD56ballSDJtk6O9dWyXXJAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zl1MddwNlVuSmUl9BbXQN98Wbz/ISAsJRxHmcjr0zhRfAH9XmN9gxZWZnAUGTB0fYj9+YT+eWaQ5L4J+jruhjkUuB2KLxYJnf0+GO8eVAiS8yCrpgglWNVz9MHtuWAaE5y+6O+IvdTcS4O976Tyd4YgZSr+e48XzNMvZe1qzgv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rcn1jUN8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDkttjFn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASube2640837
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgSpQ7qTt2HK2IViHcPA7HBNhCTaHXWp3o8qDUqdAmw=; b=Rcn1jUN80pxVLwv8
	GQYYRA5QkkF6rvfyfIHZZBeQKFgK6MpF1vyUSjeHvW4ztEorR0o/YaD6mOS8GUBL
	ePq5kfgAxMsZILftczk/ldp5IEM7bU+KkjfchooSUHbZfpVzzRpTan3OrFcdeQJd
	6BbwjovCwh9A1Zm4QTDnap6gY1bjwTAqim+8Gx4zjoJ8PXf0Ip8kx5RYuCQPyOfx
	U0Ziy/U1KdUrW2k1dnnVqSmAI8W/2S30YQT+HWW5zYLSMtMjPz8T6cYVHlXVcDmo
	PWDALLCVJ6tFAnKS9aJI2nT5MsxqmGFUyoRnoW0p/IQfhQfT/S73F7yJ8tA7sHFg
	p2Iafg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s0rm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:36:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5cce9948so8423185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732998; x=1783337798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgSpQ7qTt2HK2IViHcPA7HBNhCTaHXWp3o8qDUqdAmw=;
        b=JDkttjFnaKpg2LHGKngoP0duqIWU04+tufSrvqZf1KS9pmPgmtIwNcytz8VolRXc6M
         Gxd6qENFiQtUm6cWNTkUVO0xiqlFeiusrkdakpQfg5GMjsOrCJHdFNaiyGBbPQBmyCem
         T/y4qoh1h4DAhEAcmFJ64dn4f6q80PxPRbIoWTlGValtguQU4B/fXyZWNKNqLNSbLIFX
         06WexpaIsvQCmlrA4AKG7K4ekEC8hhVgkq5e64QBUvNj4RxIc4XzVcZGZLSlUOjDJ1u+
         yEJB8j1R5mV+SoV9KmitX51hMaCJM56nSumRniJxMqR9SwZT8yIg9qOBBI4H517s6VDp
         pXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732998; x=1783337798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgSpQ7qTt2HK2IViHcPA7HBNhCTaHXWp3o8qDUqdAmw=;
        b=sMsjUHoEc12VOzUnHTT+zly0KeAVhuYMT4NeHsulNMZWoLVv/ycfB2reCX2BKZaCg7
         MydNUgRYWkyXNccMf+3es8XOs7ewggH3Ti68dNaPY6Manjh8gEUuQpFViTliS7os3Xed
         xOYXMJXdoYQkLWcpEtfmON73bGFIodI7vzTvE0Iwg2OMT1XOgY0H2yVHEZP4ze1YSXO7
         G4/DNa2wvy7Ut1AIgw93NpzMkVg7u0qc9+3BRv30lzris21iPA+jLfqH3ONB1tdhGRyM
         cEe98HkvxBC+LVnI12KnZ9nyEsDDdg11+1BsPo6NWlWlNiT6aj6WoqHCtsmbO2W/B4eh
         uGyQ==
X-Gm-Message-State: AOJu0YwG05m/96RX0X/pD9Ff6jfuuF1UIU6VwHHVebfpUbfNzSLFoNG8
	okBi+ZuufrXE96l0dCzyDZuUqlKNtCJ4JzBi2U1DSrV3yzwATdvUJRgmBavvwNwFv5I1pZD4EA/
	hltuYtDVkJA2fW6kyUiQFcHU6vIRJfmSAgvVUYVgHs63RBSClWcIwWABmmXFxeFqohC9K
X-Gm-Gg: AfdE7cmLEV1kkSZxLNHkBSIzL1Z1X3bgAZ3+/mF/yDnqsfxur/g7pBf92VmmSbwtFOb
	ZPTnXQpHN2pHa+tIuHS2Ivi3WPyrd51lrb76kYFzZWYYs4tWNYwlTtuXjz8dTdErJ9nXLpc8H0P
	nYvvplc336tSdJ7nYIAqNm11u+FcMSfZ00J9jmaPvpA/hmIDBd9Jkl+Ewxi5cOwJ3Yq40PLqthl
	jn0PoJRkjw2dE3W7NFItAH+67p0UQ9OaKcwyEPkYwqOhwwYCnT0L/IjPMdKIXAfCXMFjn+KPGO1
	SK5GCGQRk8cS3RA8GRaPkOVqwmoKdmVzm1ji4wf1HR/HNi6f+JLy2BFrKHVQCyNSw9Y2LGG9aAx
	6IRZQ+Cn2bjX0UB3j4fc9Af6hq2VhOs7rzcA=
X-Received: by 2002:a05:620a:2614:b0:915:6433:2599 with SMTP id af79cd13be357-9293b75c8a9mr1509018585a.1.1782732998174;
        Mon, 29 Jun 2026 04:36:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2614:b0:915:6433:2599 with SMTP id af79cd13be357-9293b75c8a9mr1509015285a.1.1782732997629;
        Mon, 29 Jun 2026 04:36:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12227a4cb4sm524597666b.47.2026.06.29.04.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:36:36 -0700 (PDT)
Message-ID: <0e7a5719-9271-498c-bc0d-5fa76341ede7@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:36:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm64: dts: qcom: kodiak: Add EL2 overlay
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
 <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NSBTYWx0ZWRfXyD11ibswfDfd
 vRPUngF5pm2Hwvj0Rw7qLoCiO3rWjZHlaOJwKcM3fY1JMgoc6cIfI0kzaCU9pbEO8u6t1fnCv/E
 4IgVCHS8aUjacJAHKmF3G9ReWaw+Uko=
X-Proofpoint-ORIG-GUID: ECEytktwk-lY4K8sj6yXJrAazwum7VyV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NSBTYWx0ZWRfX2BzAVnAD/9J3
 Qz2kT8GMvJcGQm2a+3UfbYL2h+4nZYgyht6AgJo+lGQ8eoClX4dpetpcCftiZLsYbb/+40fVl8X
 a8/K3NPUOPCTLYAkE5Y2WdEbJOJJtcvsoQzqgKmsv+x+ohBeRv458jD5ZBfFKvC/64He/JIG+Gj
 8HyejZhfjguFp+u0+BravjrWndWx7euLL5DoVzm6R2p8A254xyHLjZWoju4bmi/1emfbHorBe2E
 BM/FVbnKo23R0XoYVIAbki8EMSRflk8J/ODkpowLd/KFXckQMc3UrZ6R5wvoqtuYGXS6WirsL0/
 YAeYcksg1j/qAUDUn3BUaSJAdErYQpzh+hJ4JR9CJ6dw8VaC9kqXf/QEmFNc3fNR5Om34+IH9ML
 tPjQPdFwFTmICE7T2Tx7mXlSHja31clTiCzyuPB9lvAi4md1ZW7anH5iyGVLMRM8zM2htxGxqK2
 2PCT8LRdl4iW6fTEbgw==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a4258c7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=cECbqmLR6XDCp-6X3FIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ECEytktwk-lY4K8sj6yXJrAazwum7VyV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115015-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:miaoqing.pan@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AD9D6D9877

On 6/25/26 3:14 AM, Miaoqing Pan wrote:
> 
> 
> On 6/24/2026 2:39 PM, Mukesh Ojha wrote:
>> All the existing variants Kodiak boards are using Gunyah hypervisor
>> which means that, so far, Linux-based OS could only boot in EL1 on those
>> devices.  However, it is possible for us to boot Linux at EL2 on these
>> devices [1].

[...]

> Is it necessary to redefine |wlan_ce_mem|? Can we consider updating |qcs6490-rb3gen2.dts|?
> I have verified that with the following changes, *NON-KVM works fine*, and |wlan_ce_mem| is only used by the WCN6750 firmware.

Is there a good reason non-chrome devices never defined that region in
the first place?

My guess-understanding is that UEFI allocates a region for it on
Qualcomm platforms already, and if unspecified, we reserve memory
again, wherever the allocator decides to

is that roughly right?

Konrad

