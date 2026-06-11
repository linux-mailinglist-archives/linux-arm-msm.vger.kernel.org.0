Return-Path: <linux-arm-msm+bounces-112742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fNRrA/GdKmrktgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:37:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7153671688
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:37:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O8A4zmwQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iSrCheF1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112742-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112742-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FB42301D01D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D8E3E7174;
	Thu, 11 Jun 2026 11:37:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FB63B9DB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177823; cv=none; b=NfnDS4kuM0P6wTi56KO09jWpb4hGaC9AXhPmRYgcT+YqHKEea8uCp4M9fvU++xqbkl17apYCWD/6zslVlyHua0djCpCENytXbRNhhgYGehTtuWbtWr+AWcfqZzBu1vzo3BlynbEvd340s3T7bINlU7X82/otV/hVq0HQC5PyB44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177823; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EpSBeCUjXn+r1lLGSTJLiRa1UBtMqpF6tiffmtJkC0huo9V/jh/YapZVE2CSvPAwOBXZJLhajQUIrzgJpzBxLrPQdtf26dOjz8Q4RGL1FbRlH817WcGJDv0mwX49/q9C7UpaD0GOtHT4/BTKpg7H260J/g5TfgyJ+4+dEcIC2TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8A4zmwQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSrCheF1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA088a319144
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=O8A4zmwQkCIJbpoo
	siDproRCMHs59CW2RqYoOsNvM/4WqHMKKow4gu+8wb7KACgFJpYDYG7H7jEQYW1r
	FBVzzUIqr0RvxKcevBxAm+P9gnW3jiLs4/TmhbEtbVMeWAo4xNaXyPXd3vmZMUSY
	8IkXjYoWtS8re6PB9VdtZ1v2OwM1i6qfER6c1zalv36JX1spdol6kp5MrhMUfcma
	3tKS6kcKc1oelZwwyNSCfX0bf34GRLWxAa4PyuVIdQhcTVNrHbMqN7zfY+6X/a21
	48AW/YPx4XFD61TB1NrvACilJf02TyVlsjCpO0soPK/Cc4VexkY1vXv4uhaYLpfb
	VuoQyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk7j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91550f68e7cso185726885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177821; x=1781782621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=iSrCheF1emv5hMXXgouVN7tbcQQe867ShizF7ghSf8vofEVqxZyD/XOOqQajqzFQhW
         0GOQe46xaR0ET5iplK2HP0yyex08t9inafQL+/e5r95aphwWaH2BvhxtF06TBqPdT/QC
         YKcq1Kd8P4e0V2sqInR7v8aliJzgLDsT/qUNTA70WC2OCXqfZZBn1+nsAeGof1k6dDgs
         9zQ5hY3Zj74J51iHDsrlnRtlPx5jcjRwHVnkIYa7ZETq3yG5ygkH9JYAPLTRgisopg1+
         9/XbV4FGeo94giBuvHiDj4R0cci7By79HHfJEYuf5dehnoza4RCoKsLK1gE1rvYNm9cC
         ipwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177821; x=1781782621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=LDMHV4h8+FCT8bbVGomExh9a0/j2ZT9Tv6UGWhEHJlgGzoKNb0lb3t+SkYWUHZy611
         WL4qYXL/mnqakAZR48+EnpRs7xBiOwY/mp79Ol2en6gDuCdQqbSGt4q3z0S0t9FtiXuh
         KxKmeNrG4T4QIemv+Goo8sqw/IC0rk48W9YEAat2SP0E6LrOLmPEEoHvWmJhDyzqkz2M
         5MLwWGXVR8XW5Q+KgGxFmwXZFtep3eCLPFBSfYqg6jRvoPgVL0zDgDCEI5mdvgumVGMp
         MyemepZXH+YDQ+HgA4myownrBt6wpMbMouUoyHwDW976o1ukrePizaCeqjCBaTmvnb6o
         LmDg==
X-Forwarded-Encrypted: i=1; AFNElJ/yLIU+6v6bxLL5fmXl58aiiUAQycMb1yB1NK2xsz3uH3Ouz+xR/Z/1E3g7b750UH/qWjN2gOonEU3s4JrR@vger.kernel.org
X-Gm-Message-State: AOJu0YybApyJ5HfWOffs1oaLX0P0NbQg78g+A+yuLAaFZ5DEZlcyOGbE
	0LKjmd9HQmYPCFzKbAV7b3kPefSf4LrxA6kFk7eMHB4f9s6NINALBhcwxecwaijJ7BVAtag1ww6
	0Nz9hpfmunyxeNxntDRr/0Wn7YXBvcD4S5GgsDrHaMUM4sHsTCjQXwaFT53XHGl4kvbxi
X-Gm-Gg: Acq92OFBUw5YLD79L89wOLQ3U571FnIWludlU/cRMWBtGxnf5Ap/CrOW8pDoPsrw2Hz
	20SfHj1XyJ+k86KFkKp1oW0Pf93bKICr4TNbrkNQ40hVoTENfrPfj9kOlbcIrqMtLPu9AQowEFX
	s90YoIajy510Q6b9flBn6empM/E7x9A8ru/0eK80c8zOUlV4E1uTYagZs1FJt6n07LG5GP/R0em
	enezwqJUrdjLVCo+zxc6bq8L03opAheMyfUYaAt2QBct/nhB/RGM4Agr5NwiSP9HlGHbxMHtNIC
	LudwUVlhd9vkMNxXbW2KfjDQ7iHFcEEPrD+4bxbvfFA460u8E/+um3I9ohn3ZX0elCTLP6yEWL0
	RR6IKhkcb6JbIMekKpM0QqT78Ub47FvYMHTJzMTR+ORQ29FWUldu8nSbu
X-Received: by 2002:a05:620a:4553:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9160acc6f24mr193368485a.4.1781177821100;
        Thu, 11 Jun 2026 04:37:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9160acc6f24mr193364885a.4.1781177820650;
        Thu, 11 Jun 2026 04:37:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f147e2sm53745066b.7.2026.06.11.04.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:36:59 -0700 (PDT)
Message-ID: <36162ade-51a8-4229-9134-144b452e3a29@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:36:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/18] arm64: dts: qcom: sm8650: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-12-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-12-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4yOLpM30sNoBTRH91jdnwSqGkJTtKVXi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX2sQ86qXIfxGt
 oxvtX08Y/zQoHGyVUxQPH64Ym0Wj9qDjNgudqVQizN/TbCpG7oeGlbsUnotwoXZgQwU7tG4yw9P
 u6JWnTuQbPyg7pVqSuAlCs3qGJzSzuM=
X-Proofpoint-ORIG-GUID: 4yOLpM30sNoBTRH91jdnwSqGkJTtKVXi
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a9ddd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfXxujA5MsrVhEv
 c0/e1A+V3iPY1nW4XjFhgTuPui6MOhfF2RmyajHH0PfAHgr3ngIcNSycjNN/qKHZQKVzYWOzq0U
 EMziETxcLDWYnmfSPDrO1KEloXgDfU94SY8Sjq+bP5/UXhI2U9ENqd71/8SiBen0/NvmZfSXfvo
 gWMNA3oMKIk2FrLxeKi897a6m01VOJOQ24FF0E8yLOk3CzWLBHb1xVg+dfYZvl97+2R9K0BdtjB
 yfGfnNCA7hpXsEFlnYVJtJDJbcqnTaF5JWK3kiOS/p99XuWqhkHAPKUJ85G7Quzv9LP/MM0fO7B
 OsvZMPZ9bsJyZB3lwlRz1ZvkgxNWQrJ6yuweW1TLzWAtJ5AwF6HKn42d4mIXY0qZUHRVxFiaOqw
 hfwsH74Vr7DIyXQMG4zJLfQ7X8j68wfn2LTGg90Nc+o/bcvZLS9DvyWQ8c5WiIKBFmolH1CB425
 2veYf18U734yqvxU4kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112742-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7153671688

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

