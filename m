Return-Path: <linux-arm-msm+bounces-103066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJlQLur13WlolgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:08:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DD53F6F44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA7F8300FF83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCE338D007;
	Tue, 14 Apr 2026 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TySy27fE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+Pov0nc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C2338C426
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154088; cv=none; b=S4ha0JBzeilMIoiFZ7qm3gPjbUmQGva+R1HyK2ZPKTL7RtiUGH39LBfOcgjThpxPqTRD4QlcRa9lucK+6+zp2P8RwtuQgGPTNeCPWtxeoEFtb7C7RaoZMjWrJClqWOw0azkZ4kHL447VF+pvhoOQc/bjEdsVNTAWy5xHfLkrO8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154088; c=relaxed/simple;
	bh=+na2rETZY3PhgUgP2f4aP6B+WxxI3R8eOMpOE0i2NN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEklaaRkr6r/gT0BYM6lwdwnTu3s+fIyDFuxlyqzJ/euNiZo/QWEPSHRBkdlZeAMLMlO0/UeA3jH+Sf3dRlP/fZqJlH5wtAEXiF+0hNtD/AHojfgfzNO/BpeB28QinUZZqM9fxj7XFNWYAS9wMoeagr6CSbs+ViZywoH8kYXC1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TySy27fE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+Pov0nc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6VNm83157277
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Or8e6KVvqN5oLm2ttfPCRCtO9ggnyvfWSveduUn6uCQ=; b=TySy27fEX0oJEA5P
	1yGIg6jqDVxYj4yWvcPAjAAr5FFMxkrguuexME0GvhJvCGbNf6AXcjVqu8KaFEZb
	CD0QRpJyokuZcneIS91Azo0VZu3+vDbuxzYzzSpbb5jWB2GNwnS9DTqTdiNt88lW
	Wcc0gODe3myzJV2yDkcU/rI0WAlA2ZUtVsf7DF8DqMD8+4wVjmOg+0CFsKLtWEmZ
	nekXuDSK/Eae6NGcy5RxOCgDpkBzeQD7Bfryuwb7Q6W5oGcVGoHNZtuwTjvDUPBw
	4cTPoTU1kRDm9iFo9/zEmhyzCdh0chPd9hnpJ2GGWC6f5fxQuIM/KrNbndIVHxTI
	KQgTDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86b9pdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:08:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfe29579d5so106106585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776154085; x=1776758885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Or8e6KVvqN5oLm2ttfPCRCtO9ggnyvfWSveduUn6uCQ=;
        b=X+Pov0ncPtujRuy5DaUAzgLNC3lVEg07QZTt/fqGUKHKhLlZNJn9PKGt/nFQWz7Dmo
         oz448hK6QlAY/9ND3g9UClZvTeJw6/wW0iwLGg88KGT5tlgFbo9D/SSP6qoxv0HSdIjD
         0u4nz/AKBQ0VrrKlCC+9XHxzyx5LV+g7UQVzUXCB0um6QC/1Zg0yh5eraXVTTok7s8WH
         Y5U4AUkzgwlzWvaOxnkoIMcIU6Jb3eXhnrkJiwLyDOdz2GhZ3GLPhRYolXoEcZRsuKDT
         bFrnHHHVbGaRehWGwCeAVqV0yNRyzdnkMzwpsQ8fjysZPCcfqrNEp7Jr+BAnj2Z/+4J0
         m0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776154085; x=1776758885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Or8e6KVvqN5oLm2ttfPCRCtO9ggnyvfWSveduUn6uCQ=;
        b=g7/vvSSd4rOV0imr3sv0GDNauA4qGf1HXuo6QLi3qB4MZxBqql/NEz7hrbYRaOoUaO
         1hO7BAae7bbrFMBVuIbE3mGJ41vu7OLnvb78mGOED3mY8GRHO3eOisD/pwccxIZWMgL0
         I5/IsHWWTDyywlc4bfqIz9a0SbUI6epzpEvl0x1aOVb9yjX5dFG59Q7J/845P8T6Gv9t
         NBy3Cg/dQRqGfRjQ/DrzBWcvX8Uud/7wpHnIuIELmRZalKXbM7FtoU44dfaMcFcQDKfU
         Cvz1fYU0WMmve1L1grXWXzpK2S7wyYQtYq3rmw6Y4SRvnow/tl2XqnCoVHpkoZY7JX+q
         pFRw==
X-Forwarded-Encrypted: i=1; AFNElJ+TMVXaQxXew0HBED4mgRy7HdHwDBRqgaN5LxeFzRXXRl0zUAwseZE1W90qMznTE7BHIdhhDQsFGhXf5WEv@vger.kernel.org
X-Gm-Message-State: AOJu0YwyMAKojTs/NzMJ7kirtQwcIg4iZrY/XSaRKtiqLVbTlY321qEx
	4AlZjarsU8uKIyiVIOLdiPcm9j7YLpMJjQYElSIAJfM8AY24E0pGifSDwAWeh0kStq76kAEoH6D
	gZpGO8V1pfrADyGrxjDyw3ltjQgFiDLAyyoQDDYGmDs85EJ+jnZB8YUFo1+5E2I/XNSb/
X-Gm-Gg: AeBDies6DfWFcpJIR+Vm1bowO8BWjq1zCGeQOp81IQUPjet6aFlppgiPpn0tMBSjORQ
	H2lWhQ+jqcmD20jNT321IvQDrgx2mAs+NhZe8TBLBJ+5rPX70mvear6yBXDTX3UCBoGQmEkDd1F
	OsDQRBQ+zV8dENF7DlbPuJhwMEBR7o6Pv6NhOJW+nQICvG9zXiif4iXwz25O2fAW5JgO1Gl8gbS
	wH2FLXTcAuNMVsuYPIrD4/sEIgLL13zfxDa2SDBmEaD5i4uZBE1vRTyXd4szlhzQfbzt8R6fxqW
	RhqphV4lYmSl3rrucZqYEOL7ZDtSjt9ct9LKltIhi56iGs5tZSTaUXVNeRvD4Yeeq6WLaq8Hh9B
	ibdbzcf4D3sdQ/hV1nXgB1ARSQudKuoLHKKX0nYB090YFspV98B0/rhcmfzuwhBZj/IKGbSvlkq
	l+s/n82if7Zcfehg==
X-Received: by 2002:a05:620a:410a:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8ddeb1cfaf4mr1620678185a.4.1776154085214;
        Tue, 14 Apr 2026 01:08:05 -0700 (PDT)
X-Received: by 2002:a05:620a:410a:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8ddeb1cfaf4mr1620675885a.4.1776154084770;
        Tue, 14 Apr 2026 01:08:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670eb258a99sm1899153a12.15.2026.04.14.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:08:04 -0700 (PDT)
Message-ID: <677f1d1d-a1fe-42ec-9e82-c9e504873c98@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:08:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] clk: qcom: clk-rpm: add msm8960 compatible
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-4-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-4-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NSBTYWx0ZWRfX3PrFkTNtMGoP
 AEG1UAAkE99yc+BuRR5hYIt5abIfbLUHfv93W3L0Y0Qvh9YpAz+SkV3H2vCMilQuHcuIXiDxkn7
 o8LKs/CKJMcavVMpV9O8yujTyHxTGlwQQqEH1dQZvETFKALKO8a986BRz5vii3PJlAHgEuJifz7
 6hsPIarEMVAkPJJyW2XepmiXmkOQlyJIc9NxwUcjRvCuQQzcuxZCWZHiwwxWvsIWhJdBMroxGOD
 57JoIiUAXbL+v2YTJ+s4AGMrmpYJ0IALLeactvPDrWxttMJe/q2fVoYoT2htpoOxm0PSuVJDtHZ
 mZCNOoxV4lgrGyQHVe2QKL7kOFvuEc8NbeAK2EGZVmtdJMVwR0/+XM5jyDIO0dP+FX7bdzM1oh/
 92b0+Kr578g6cZJJNqgDwExDA2V2Wwhj0yzOeENZDs/VnbVYuF4nY+6ne+ne3+bUrYelfhuNP6e
 YQqPcyv1GMoEbtxQXcA==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69ddf5e5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=5PoCL-xiRuW4qANWJgcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: 12B-V9HvsKWJbg0e2OyFTi1WrY2OGDcy
X-Proofpoint-GUID: 12B-V9HvsKWJbg0e2OyFTi1WrY2OGDcy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103066-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[qualcomm.com:server fail,oss.qualcomm.com:server fail,smankusors.com:server fail];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[qualcomm.com:server fail,oss.qualcomm.com:server fail,smankusors.com:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53DD53F6F44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add support for the "qcom,rpmcc-msm8960" compatible string to the
> RPM clock driver.
> 
> msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> rpm_clk_apq8064 for this compatible.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

This suggests a fallback compatible could be fitting

Konrad

