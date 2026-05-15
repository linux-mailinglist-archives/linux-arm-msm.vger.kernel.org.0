Return-Path: <linux-arm-msm+bounces-107761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sETSKUjsBmqCowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:50:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E6654CBC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEAAA30D383F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E6843CEEB;
	Fri, 15 May 2026 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFteFIgp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Imw7X/1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071E240FDAC
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837751; cv=none; b=Ik3PpqOFpLqLhNEOVoYSWRC/OM0jypnFJlm37u00YgZZmWHeTmwOZ5KqKf6sasialrmANRpm4WhfeH3uDc8jHELQ2np6H9FK2G5eRQn/tpyWj0Z1CxQPMMdPxV1i3uckGnDllIfokAOm8XuGySI5kL0uvVnDgwPGTolkhSxFsT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837751; c=relaxed/simple;
	bh=lk0yUUbpT8/U39ivTcsC1egqSJRZIo+BJJ5eGnvW12g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vb1XCWWrvgiY7xmfQsvSoE7Q1dzRc2Z86j80GrXtR/Jwbe6HWzpJb9AYd1lwHaoNMh5GKrA2VF2C3ZbE514hLsGXk4HdpLSkfK0f1Eya2KQpoE23rga4egf/98RSvtYy4AAAO1qEG2iFOjdJMUPzuF2aYbAMDmcMh2Wx9NZb6Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFteFIgp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Imw7X/1d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5Ym5M3795642
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lk0yUUbpT8/U39ivTcsC1egqSJRZIo+BJJ5eGnvW12g=; b=VFteFIgpWTy97Kvi
	MNJD2q+DW11IkDrK+Fv8PrQ9HSJDkcsMwH+aKYt1WY6asyg/UqBiiHbTHjhcMifa
	xD9xbhv92Zpd35M4ZW7kjWYopS4sx8r3vBHuBLc1bblcY9RxMtii4K8dQ/KM4yxV
	XG5sPJVkQpBu8XOEL8dImJTI/xJFjcYicfGxiqljemPPHji5v4O9FwakD627F8IJ
	S7qLbubheLqJf4xid8O95o2czAoOZ/eL2Ih6wIBQZoGWjFOOiSAIUyy9Gaxa+j6o
	dP0FVXoGu2BO82hoBXJBXG2jXZGAxAjtvADCw5KCFfTZcjoZc0Q8bHUnE+u7s+P1
	LmlZdA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stm4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:35:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6314a8f1befso363331137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778837748; x=1779442548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lk0yUUbpT8/U39ivTcsC1egqSJRZIo+BJJ5eGnvW12g=;
        b=Imw7X/1dMYs0f2aHoq8c02ceorRdMbQMzpuJQdmUyg5J3fLjLTFoUKQjWTRP6lSqm1
         ih6NW01O9us00jth7hkzFOySqhlMZe8YAOLJc5vCGf2XXVNXVNgDWHaYDgKlh4jPNek3
         h7Np3rwWYQPElPSMfwr9yBRGugm4Sj35Rz71E8Gmp59be4dXPiEDbChaW4gQJUnobz3g
         wVzyVgNpZGo9FxH2pT5AfFo8GIFiNZvF86qwKvriw0fo+g3jdGv3943UTlZnxu6U0MnZ
         2pJtE1xATveBLsWyX2MUHnGNv4pP89/lOTUrxNX5/vpfsQLMxaBCL9Cw6w8DB5QeVxop
         sB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837748; x=1779442548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lk0yUUbpT8/U39ivTcsC1egqSJRZIo+BJJ5eGnvW12g=;
        b=JPxVDH3048Bxdo0ZX6e4WMimZVsXd/akkHo06XN3hc4V0Jt373GC3FBw2+PgUsjv/l
         V7/TuDhY404eez2LDEyqQvG0nvNqPLQNacTyhdHJ+JTY2CoQga43g2ZmnTXXkV+/Gank
         HUFyLScGWVV4kVn2UK+L8rr+UgRG6iqal+Nslil6ctVDfF+TTohwzQYVJshPHQtwD0CN
         0NT5mhASJ8sV6bMbD2RExEPcgst7v67FVd0M2vMDMPpa8bjBdtAeh0fhTELK+sESxSxb
         CiWiOXfUcz8YovVcdNgbVJpmoRh0zGBBsAO0lfPb1S59RNfvecvcUV+KKBh/rR3etlxn
         49fg==
X-Gm-Message-State: AOJu0Yzr0w2Gb44ASinL/40YWsd4syuW9UTU+I2UY7rozNdK+UrtSn3k
	71Pl3nPbIglkCotOek30d1zJisUL8y17f2vNYkvgQkXAwyt+UKIMGRlsoWuVv6su1gxujRyDssz
	nygkNY3VxLH2nWCrH+8zugfWcpwle08YP8OmHqSWcjbXmXCOkDLo7TxbVbTKigPjnB4Qb
X-Gm-Gg: Acq92OG0BOaT/DOelolAT0cW3zjc2dP09/P8GJBqX+D0v/0iSqbG3kq5c2qCyYUhUwG
	HWOXyVA/qgvFGfz0bUW6jr8BCZA8kajfTBqUS0q0XOkv9tDVK3xcNesWP5qjmqbvhwK90oVEhS+
	5AxESJ85OQaIvpBZRglYjdQMh1qhjLbtYyocqUFZakcqXs85CH8hTRRx/sqKuCvdbovN9owoY3t
	mTixPIdJt4IbJLsezQucqXKm1GjRJFlCFLLRm+OkxqxK8xfY/gNo7+ZxJHD+XexlQKoYQszCOkG
	D0JB62UVTstV5TTeBnesVJRp9YQtwKFlGOjPZeiHKk9JVlKpDSlL59rM155RljSpch91C9l44sJ
	icJhMUbwGfYaFajIWTqOua4eUkdNfb8G0izXhkbQMJix8kuB2IwnPdZPNM2P9nybiIEfCW9FinP
	WWhhk=
X-Received: by 2002:a05:6102:21d6:b0:637:25ea:99c8 with SMTP id ada2fe7eead31-63a3cc0c981mr429436137.1.1778837748372;
        Fri, 15 May 2026 02:35:48 -0700 (PDT)
X-Received: by 2002:a05:6102:21d6:b0:637:25ea:99c8 with SMTP id ada2fe7eead31-63a3cc0c981mr429413137.1.1778837747869;
        Fri, 15 May 2026 02:35:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e5eef9sm195347866b.51.2026.05.15.02.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:35:46 -0700 (PDT)
Message-ID: <af2a9994-44b1-4945-9c04-4f31c1ff60f9@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:35:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
To: MINETTE Alexandre <contact@alex-min.fr>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
 <20260427-mainline-send-v1-sending-v2-8-dcaa9178007b@alex-min.fr>
 <97969bf9-8eb2-4498-90bd-9973fb2bd638@oss.qualcomm.com>
 <edbaf71e-6a47-4294-a8c6-6b356bc336ed@app.fastmail.com>
 <fdca4d01-eb6b-49a6-86e1-b6d582af4ba8@oss.qualcomm.com>
 <bb8353fe-29f6-4902-9c7f-67ef61676f2b@oss.qualcomm.com>
 <1eb77056-0716-49d3-b45f-d51ee5b70618@app.fastmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1eb77056-0716-49d3-b45f-d51ee5b70618@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5NSBTYWx0ZWRfX4cE5pglZjx3d
 8cd50t4851Z0O1dLLL/mnaCrFPLJLWU8JZ28Tu2YUf3/Or1xeZ6UhgmaIEqw56tFZc/GkUmSCz7
 CObLQ5jnWYf5E92ADR92vbcVAnbr3rqaWcbgC1+0Of2Z8HWL1FSkL5o+NEkGsSqCmPUKGaVMqwK
 sXcS8cKOZ9dqC0BnGqujp9uFXbUww37gtNqfJP2ex4S+pS5anoFdfkNCCB2PqbdWFUzz11mdcac
 1TKwYgEVS5xa+do7CIzemO0mHfKSP7j2cKLF0KQag7QxaTEuTyfCDQKSCqZtdwIeEDZeaE0AxQu
 7/Q/tQshqY6kPgrfYM1JwH1Pr3ALjviUQtIF18TQyohkvTzs7w2qhHTyuj8+eKuzGuDLuXOwG7q
 XK7Cb1hpC2YtjhSODG4sDVPk9Cw2zZuYi6s8QIRYWjGU7ry0H/n1+UrqnZqwtEyD83BeI5I44DY
 xvx3uAiMAhOPSn1gmlw==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06e8f4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NJkuH3xNc77H-X9ZbZMA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 8ArrDaWD_Lt86e3BtbIWMGpUbQ-nAh3L
X-Proofpoint-ORIG-GUID: 8ArrDaWD_Lt86e3BtbIWMGpUbQ-nAh3L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150095
X-Rspamd-Queue-Id: 08E6654CBC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107761-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/26 10:23 PM, MINETTE Alexandre wrote:
> Ah yes, I see. I tried GSBI for both the MUIC/extcon bus and the LED bus,
> but it does not work on my GT-I9505: USB does not enumerate with the MUIC
> on GSBI2, and the LED on GSBI3 times out when setting brightness (-110, with no visble changes).
> So I think these should stay as i2c-gpio like downstream.

Alright, thanks for confirming

Konrad

