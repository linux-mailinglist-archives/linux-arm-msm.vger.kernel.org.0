Return-Path: <linux-arm-msm+bounces-114372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SyxuHuP/O2p4iAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 18:03:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8FB6BFE12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 18:03:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lz9bvbjO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P9rGj5Ss;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114372-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114372-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 402E5302E0DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815263DB315;
	Wed, 24 Jun 2026 15:56:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF883DABE3
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 15:56:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782316578; cv=none; b=S1erlnXyGGCag3Be9M3FoKAV8tI4I7/llDo7QaKV1PK6WPiC/nRJVqZDZv/P9F4qOPey0G6JtRh6y73VA0q7lQso+mHVxJGrZSAlWneXC6dZH7KlwByGyxOyzQmn9DJd3UsLTB+xQt8XBFLktKUcMtTr+xIRK5GWChtlA0pAgbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782316578; c=relaxed/simple;
	bh=OIfIzrv8cXjwoKNsROTB/WmCpERrX7Jeow982/fvBB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cebak+0uH3zm79oThjyh1KWN9YsMls4/JWqbtoptVLRhUgY1TIHPcHkpb/MqD71pvtFPJvZ7ztIsx+j7AyCKhOqXix+rS1dSqd571AuHKxQkE5uPFTRQ6Aq1GKpYl3hOPomYekt3e+1ORs0HtGDm1QxBNu3uEWtUNByP+QJPQBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lz9bvbjO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9rGj5Ss; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OFfXVK3214744
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 15:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9bR2ocqQMdp4hN0L3M5pIvBrJtLBQ9RYBOAWa7t2h1g=; b=lz9bvbjOkMHK0fQH
	Xei8RRt14kG6/Iv720DXi/HJzzyo37lfYpLVZZxEtcy6WQH91J/jdMXqWEC6fzgo
	JFIFU2IaCvSIHzIUdphe+qIO0273F56Ram0LvWOzV5XsUpRnglT6KQkWB318PydR
	tWwKuoPJQ237N3ZyTXLZTV8w9WHkaAK9UwkxppH6boguf6GcYDFCHL8f4ifZZMYx
	dQfb1Jn53l6J9GlMUyQarr7WCHkdvJ379xPFv6JHdYesQF26YQYzs83fDozL1k6q
	q/qXUifddppRT2zEUGZP5j87/Me+lkVN2na35gUdMKllpA8IQjYjPYUHYC2Mibzp
	7JgIIQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfb2a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 15:56:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-72a42fa7ba3so377262137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782316576; x=1782921376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9bR2ocqQMdp4hN0L3M5pIvBrJtLBQ9RYBOAWa7t2h1g=;
        b=P9rGj5SsZH4CL831fL8NWsTJwelZ/g3SDDx6bfdbtSAsvxnNxKqJREkQM9PRGaqvrp
         4da7oKsZPyLnpHmf3kOnDCUoFOO9F8n8aThqb7Rudt7hHu4Sqih5GdivZgVZpGXEmahm
         VSUw6k7yiWwk0+RqUczugjCk7lKTODB0slKHNPPF0O6rdCKQYhR2ScIEbaC4Lj2A/o/8
         BqvyPRZ4EfDzYYD3MsD55HfuLDno/yE6wAE5VOAQXH8a3ZWVSOh/8m4g2kPjKMyVq938
         sY6K1fFh8Te+rahQPQWS5kYxoO4SqDCMTbbGdDDsMY9B1osQPBKK+JiXPzyfbl7zUexl
         PNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782316576; x=1782921376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bR2ocqQMdp4hN0L3M5pIvBrJtLBQ9RYBOAWa7t2h1g=;
        b=r1tA5QKpM4WitCBJZvHJIWXlgTJtEayPkWWlTwhdVGSbCvtvfWDgLhMlMRRZW/AJ4j
         3+qoABcHU1+l3Ij0Mq4TERGS/j2RTac1m5AbckbMUn9uuX7FZwBMo4tsxkq/DikeQSUK
         uVbmv2lc/4z8xC9pfXQaZb7GAJJAcbsKcoHJ7SUTauoUOfs0LpVROmq58Q1pnDBy9gCQ
         lhW7iBmXEG4kCvyZLNiPNIh/met9aWuWA+S4Bwk+xR6nANGn5KTJhq/yrc2B0o9STjF2
         6aHCk5SVdZofJNI/NrYrxblkOCMUrMioBrJtAn9yTKNrgNxYL8IGILTuQbY1DG6ycGNn
         V2jA==
X-Forwarded-Encrypted: i=1; AHgh+RofI8zMg1CeR13yRuCvPoTvyEJ8I4cEUdi+XjV3KlIR1/aKT+taFruD0gV9BfnwR3NYy6V2WMb7Ia0i1o2F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5yo81eRED/bvw4KpPFCGsgO1vlUxYzEIjECYKI3IXQNiAGycz
	900P6KGAtCz8wu9sP3cGRVIHHr8zBC/DDpK9W8vQCQfJcIxhCWyMQQJeDG9QPmx3N8yVbPpQljF
	wFryL1amebyW+Ggimox026JvlZHmtB3BVbU4x9Dn8GFIRF0NzxYf1lLX/DFh6J6p+epKH
X-Gm-Gg: AfdE7ckMujSOg0AL8ljVCngVU+s3oMbIbA6RWsc4z+UkqKlWTBck0dAbf+Sy11Mii9S
	SKBoLw4E01jVfI/edQEfvQLd7R35w//Cu6dtziW7QQef9VKELsCrcTnSPCDZABg9DqPucvKcJUE
	Y+1Xd8wBn8OWtfUi/Jg17gQBeOiluYtzmKxS8PVtKZAh+IFxSb9AwxK+B6La6OjJQuaNrNy8T+P
	Xt4DxVsUbfP33WmnBMR/kUTw9qMETZov4WaGyh/+ZwLuxRAhuP3Z8lld/tEn+8zY2XqLOScfuv7
	QkpIjVholLveo+2OcBw/zyJyYXGDq7wsQaOaWJyWYUXQo89cV9vLOAmkb1HzGVj8Y9XcNfalWqa
	5p2S4NZdu2HVgVdzpmwhzZa69jMMtSxpUKv14M703TQyvSqM0du/LImPd4OD8XFFgli53SRA=
X-Received: by 2002:a05:6102:292b:b0:631:af51:7d8e with SMTP id ada2fe7eead31-731162122femr2076152137.17.1782316575665;
        Wed, 24 Jun 2026 08:56:15 -0700 (PDT)
X-Received: by 2002:a05:6102:292b:b0:631:af51:7d8e with SMTP id ada2fe7eead31-731162122femr2076134137.17.1782316575223;
        Wed, 24 Jun 2026 08:56:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:fce5:aedd:3ea4:36f? ([2a05:6e02:1041:c10:fce5:aedd:3ea4:36f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm8495036f8f.6.2026.06.24.08.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 08:56:14 -0700 (PDT)
Message-ID: <ae0ec05e-607b-4022-a006-2eb1a283144d@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 17:56:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <c32e263c-ba4e-4899-a935-e129de0f1269@kernel.org>
 <61765401-3397-497d-a0ca-e9bf9d76cc6a@oss.qualcomm.com>
 <5b0f1f39-ddaa-4a2e-ab29-34aacc9ff672@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <5b0f1f39-ddaa-4a2e-ab29-34aacc9ff672@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3bfe20 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Zihj0RZBmKQ52BXb7y4A:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: xb7_EX3Vm-9gvVBmzRomjeXmqBqJa3qS
X-Proofpoint-ORIG-GUID: xb7_EX3Vm-9gvVBmzRomjeXmqBqJa3qS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEzNCBTYWx0ZWRfXwK+7k7us1CjN
 j3/P7jeeihn4S5JZJjUAJXCNjXd210uwdjWaj445Hd7O0BLLKV6zynMZr7JYcW4XAOEwQOulx5l
 BrIsdkS/uTDnU4aMEN4du+wKiewrhGo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEzNCBTYWx0ZWRfX64MAtLhyzj3L
 4EjYU6CAcef4mzL7wA9tY1ACXaCopwfHqHaSJMpNyA+A1sTCxrtbePbpHwm09TBBArQXz/bQp5+
 bPIvywMU1elKzQDzjNBLYLnDmbB6ONnNQ618Qa4Vl0bLrPhF5t2P560aJTaWfDctDa/0OwuACjz
 iHfyFucTtNaqNKEJs/asvOoexRekU4LZJ9idqbxk0VcftEnCQzI9EshuttB6YU2Zg85igtCVLKo
 H87FYASyR32EJK/kNbwsA1VGoclmeSHT8TaiX8zyFtucdvt0cbvpNQlh2RSi4qiwutP93Zl4fbd
 yNEEjf+JOihNj+5El4a31guiuYuJNwjDlP6P3LpYC+NXf7ReSDQqeu8HqvDAjzWsUh9mZ57fNf7
 T/Vg2c4DjAwoIAH67z8Rk6RPInEJ2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114372-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB8FB6BFE12

On 6/24/26 12:42, Krzysztof Kozlowski wrote:

[ ... ]

> Therefore I still do not see the need of tmd-names. You know the name of
> cooling device, because you have strict one-to-one mapping.


There is one remote proc with one or multiple cooling devices attached.

We describe those in the remoteproc node with the tmd-names.

Anyway, we should be able to list the tmd names in the driver itself if 
we ensure a consistency with the index by defining them in a shared 
header eg. include/dt-bindings/firmware/qcom,cdsp.h

#define HAMOA_TMD_CDSP_SW 0
#define HAMOA_TMD_CDSP_HW 1
#define HAMOA_TMD_CP0UV_RESTRICTION_COLD 2

In the driver:

struct tmd_name {
	const char *name;
	int id;
	bool disabled;
};

static struct tmd_name tmd_names[] = {
	{ .name = "cdsp_sw", HAMOA_TMD_CDSP_SW },
	{ .name = "cdsp_hw", HAMOA_TMD_CDSP_HW, .disabled = true },
	{ .name = "cpuv_restriction_cold", HAMOA_TMD_CP0UV_RESTRICTION_COLD, 
.disabled = true },
};

...
	for (int i = 0; i < ARRAY_SIZE(tmd_names); i++) {

		if (tmd_names[i].disabled)
			continue;
		devm_cooling_of_device_register(rprocdev,
			tmd_names[i].name, tmd_names[i].id, ...);
	}


In the device tree:

	cooling-maps = <&rproc HAMOA_TMD_CDSP_SW min max>;

I think that is somehow what Konrad and Dmitry were suggesting

Does it sound better ?

