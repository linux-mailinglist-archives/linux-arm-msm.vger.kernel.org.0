Return-Path: <linux-arm-msm+bounces-95615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLHOBYFxqWnH7AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 13:05:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E30211376
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 13:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12C6B307A127
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 11:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432F53988EC;
	Thu,  5 Mar 2026 11:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1Ah8Krf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zw3tP/dU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A09396D26
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772711829; cv=none; b=pX/FIzhFnuT6KbWBO5srCgN2YCjS3p//mzbCIYmt2wvacCFmpAde0bkw+5sd1gidnUR+YZ8pwHq2ndZOiEp+Z5a9ORrBK+sqRsKzMPJYpY1vwanlxyNvvfVKQm8vdcMbmMqS1lGMajOoGqGcAqdqXBNMtM45aXaNS7pLfKCeJlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772711829; c=relaxed/simple;
	bh=ywQR8RudpyjuQ4ua9m98nW27zxDvWYAOmFcOPd1cmuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOT2ZSvYaXaX3QvJPwcKhRMAaCTZGibju2aZsZcNYQZ4nAnmEKIFCsIJoqZsUXTjTU4Bobv/2zg8LGTichl8YhRG+LyFNFtakNnSpttgRyK1CUCmij0IhZ/UwMJE8/k32iQza0RPeSDb/TCyoKYbF3cARfwjE5H35ClM07n/gyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1Ah8Krf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zw3tP/dU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFmFf1783521
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 11:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oMWGh0Yr/4YojcEUszF8lrbKoqjtdVISzX+uaKBAjlo=; b=n1Ah8Krf1gXp4q+6
	g/cxD1bGyzwXDDudc3lu/vYT4xKZWu2lZTGBHNNFJQ4Zes9FNXk+YXGllLLWWiGE
	vVjF0r31vVkjxCrOqJy+Q7i47bb6L5Hzms6OHnBuYkjGVTJA7cFjFNv70sGGrazP
	n37wZ48ssVRMvgFwpy2Nvq9nGfrq+MS1CBFJNPb7Z3KaDTh1VZzQxBoDTryYzej/
	bVgt++Ec5IEGCB35wUrQmw0kIUwZa0glUkgzLTrOMd4qwFnnQioMfn1/fKqH8VVc
	F+st49R0lCLOQHjHNU2mWpk2sm07y0vIn+j2H1JlC22VxchsgjONRBsbvd3OwTuX
	ifSFaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk1jyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 11:57:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb485c686cso544624785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 03:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772711826; x=1773316626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMWGh0Yr/4YojcEUszF8lrbKoqjtdVISzX+uaKBAjlo=;
        b=Zw3tP/dUlRki4wzvk1X/Y3KEc0S0Pzv1KN83PR1PB496gVSeMzuOuY8Y6l/Wpw1Oad
         wtJs5i/NUlsz7HVo2+H8oNsNcu2CJGfQNwlFZVJIZInwhj+G/oFgPM0ss2ZA2RGhbmUf
         Ooee/03dPOfKu47x3CNkN3vwv5DGCpjDSM/kpF60zuGnseGUr53U1UY6b5dFS0KHZv4R
         AasoQ72qvC+N+e9k4tMRKvDy1yg+52hsAZoru+ehUNedTveeVa6DRHTuzrVClNX1c+6t
         QAtbsSeyiBQgV1NuLB2l/hJA1TsDNjKDYP1XcKlUu260AUXFK0599mTDxjRlLeE3nXA7
         NQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772711826; x=1773316626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMWGh0Yr/4YojcEUszF8lrbKoqjtdVISzX+uaKBAjlo=;
        b=llfoRs1hB+pSWy6n6HFOBXDX06dUqw+3VMbXHKOt2vyy54wkJ+rbuOn5LjN0B6yw3U
         9m0nXkpgT0tYN70wudplBsXlQZsw4rYaI9JIcXxFla6LVNJp61O5yiLQS8RBgV1NLMio
         kQxgYIwkRiy4NpbKPBha8HbUKIBUWB9Uj9p8Af5aIo7sjBd1KNKSqKSYwIFLfHWAGxGZ
         k89zt160YQVnUVnHvCQ4kVtZnpl1d06t5X4DZrVfysgx5ypRM5QoTIn+1fMxtNgIB1rQ
         7K/CL3yrXvR+hXu3yY3j4zxMamqTlOJEcOz3YLUbbEze4o+r5KxiJY9jP5i8kD0OGEK3
         Y5EA==
X-Forwarded-Encrypted: i=1; AJvYcCVv3Qam3WWfCw1q7cGe5XFg8WJqG0zIj3sF5IFHRNWNDllVacXTckj0SNCYDCAvJGqcdhUpX7/XA10GKZF1@vger.kernel.org
X-Gm-Message-State: AOJu0YyzTTYqeJfxLulaAGM1ZWJSy8Sxmt876t8HcEalzeVPH6HvNMf+
	KkfZV/XzRmD2kcIcxdj5Pc4MWBVdFkuvnLXAPGSezMqNMKLuW7YT5Vc3NHF1reb+JIKwMsglZ34
	YjdD0bQG6dAaDs+bPkhYUqZPXz8zQEpuzy2qfotYVw/RhLsApablC0r0D9FeRLSIr86/pCldnKX
	/N
X-Gm-Gg: ATEYQzwVVIyl4/JQBczCTmWKPJez+GwkyuuFOkbiuoebb8C4+98ASZZm8mVMRzyD7eU
	RvTgwIEeUSB4aUrt/HZWlCrwqJ9de3cydHrdyyMR6+cb5nSPtsQJnNDs2nAfZ7QQwBZWLjKT57A
	LfoZB8a7mDhahd/crTtEWZEazVRO3Zc5aa9f4ioNCX4h7fv2cG0JoOKETKGT59jEWzYulAk4ATc
	9wT06kcKfRQjPFCv+T1xbMM1fEOWsp4ZdevO51j46K8QR0B8lWshzEINRocHN/3JQQ1AQVzPmVa
	h/gC0fL2IQP+7oE/QPO1eZrErx7pvZjmy7mxOGPToBBia55odtmjbNgtesbY3sWZknwCJfg2ofe
	5PN5FlQf3DWYoaZanRYwnRvfreOFbyFaycILcM7cH0BPzW3KoXgVkCBvAIuIo9rAiG9sKHadylR
	vKR8g=
X-Received: by 2002:a05:620a:318f:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cd5adbad4dmr523868285a.0.1772711826300;
        Thu, 05 Mar 2026 03:57:06 -0800 (PST)
X-Received: by 2002:a05:620a:318f:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cd5adbad4dmr523865885a.0.1772711825797;
        Thu, 05 Mar 2026 03:57:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9410131465sm68249966b.42.2026.03.05.03.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 03:57:04 -0800 (PST)
Message-ID: <c37b0fd4-afc6-49cc-a133-7f8334a16cb6@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 12:57:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] clk: qcom: videocc-x1p42100: Add support for video
 clock controller
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-3-dbbd2d258bd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304-purwa-videocc-camcc-v2-3-dbbd2d258bd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uUvh-j7va4A5qS049NL96DzbUYnongIz
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a96f93 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rAeN3jnYVyXTJrfZgKIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: uUvh-j7va4A5qS049NL96DzbUYnongIz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA5NyBTYWx0ZWRfX+9TjxRaeK3PF
 k/TXDCV9X4aymEQ3XwDjIPP/jXIaa9Kx6EmcpOwSc1IBG6qB6gsq6vULozYrf40xGKIjyVDyMNE
 4SikL4RYbCCOUzudn8hxA7U23eK8BpIrtZ/B452uYj57yawAPsc2OyDcDdjqUGZfQXZfdfK1rHc
 wLP6PtzzjYmV/DuMQbTyaaqqfSzaq5a4dpiCd8TJxDzit+mVMqkP1XDnZbGy54B/GtoNn3CDgws
 7XufjvpYY7n2nTRxm71rMauvdLQb540efupWEJvudaO4FNEa2Oa17Uj4YsS59oj1b4VWYQ7RxDI
 c8cUNwlNBzCTwofYFhGdyjL/P4Z23ZQFbE4Y9GLG/iZf1xXnxInyRh/WtCKOGlEFtdSeVZsZGgc
 Ecmw5t9S6Mbwdak7v6TFJY7bjbevpue4OPfCWCDLTgeeY8qe9zwn+Mh7/s8CZLsAH78FS57iPkj
 mSRQyPsYyFxWDgeXbiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050097
X-Rspamd-Queue-Id: 86E30211376
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-95615-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/4/26 6:40 PM, Jagadeesh Kona wrote:
> Add support for the video clock controller for video clients to be
> able to request for videocc clocks on X1P42100 platform. Although
> X1P42100 is derived from X1E80100, the video clock controller differs
> significantly. The BSE clocks are newly added, several cdiv clocks have
> been removed, and most RCG frequency tables have been updated. Initial
> PLL configurations also require changes, hence introduce a separate
> videocc driver for X1P42100 platform.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

