Return-Path: <linux-arm-msm+bounces-104288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNxyOlT66WnkpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:54:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB23450F2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30F573007ADA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7787837C11D;
	Thu, 23 Apr 2026 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShiLzXhS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cE8nQJ9I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BAC386552
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776941445; cv=none; b=KTKRYNlc4Vyb5i8FA6bKedtWVCfnt/GKcWM9qPSbfuh8TWygeXoCfSFJSvstOBj1AMBLYPwosztOx0Q0mYSijkIQ7I31z29HKMmhRmcGOtDZkS0HhdwyPP14uSUHZ36OZTVzMiWKsj0DktQTD8W6JatAknhGQ+xYT2mOTzylQXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776941445; c=relaxed/simple;
	bh=nkOIIAnHM4RJg0tdASPd6fhmwrrhx4LjfS12wYZ/uJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJUuKt31gUcZqE/KjhUU6BsKlxjXcGYzL5mR2sKaaksYgAEkxOTv69wJC2euT2DVjdJ5+qg5QHvQz+4WywwBJEMxTKhxxZ9+nZHVOy7LIRkZcKDbsLgyEO6SGyP429XFuofYO60Z7n0MRcEO0677bLAEogTCHaWwfB0x8YsPZRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShiLzXhS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cE8nQJ9I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N94kfe2319475
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CQkK1WwgrYNlSykIKJaV0buIA9BdQ6BgAacr+0tewkM=; b=ShiLzXhSI4Gyrmxu
	tkjRVjqE9lu+tnLs8YwEzxfMi616tYTl4Tcqa8DOndf0j3EBMYf3lFCjIDM+evFo
	GOzC8wYfaEiGKpQHGB/4G7qDq6LGm0PviG96G8QynbSdnRJOuxdc/tH4UkZlgf8K
	3x3vZrUlanSwCSeYCwY0yeHEJzr9w9rTASbQmGGcOLiuaNoXHSYGG7gsHfUEq9UR
	1o/74rt/xoemOPwijvhco5xXl+jED8BkHgXQb7FjxX6Zzs2/29/kLFvWJZHM3Lyq
	+Zm0rDjtniGXRMiRA3dZFLjWz39or66ZR15HP14dwGodHw/FcydwpLr/q1R6jX1I
	9gkOBg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqgfsrd16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:50:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so125155885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776941442; x=1777546242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQkK1WwgrYNlSykIKJaV0buIA9BdQ6BgAacr+0tewkM=;
        b=cE8nQJ9Ihn4cHrJ9zSLb2f30EBjo1CuuIeiQPKCRUdDCNP4MEAPu0gqQMDMxdORpjX
         XPWhRE78VmSiPnrd6TGdx1MxF5SJdiVxBBOs5L+PUqJU6ZaxYJsJt4Eu0jguPpN4UUbR
         SCwbiWp+X4i2e/YCY2RdkGo4mv5f55uJ0xNlvGrUhslduqK97PsIvGj5n9LmYDhml7Wr
         oBlfZzSlXRNAobVPShNhpdFG+HgWE2HygYcU7feEvhJr1zn2fRvCxNWknbs4b5Dd6cNf
         +WFhSqp/zVkiixiLQ/68iMaSSt4Ooti5bTJn5IWHItDzOWvTfakDRWlGKhe1H7uO4e/C
         aRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776941442; x=1777546242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQkK1WwgrYNlSykIKJaV0buIA9BdQ6BgAacr+0tewkM=;
        b=G9sbQxEPuX8D9Jh4TGR9xaF7t3cKbLBLv0TuGvIgjC4Rl3Ac38rTA7cl35qYMOBVh8
         Y9gjzZUKU0Gv7BZUP8LLYAwtRs9uPcB6olU2B+GY2g5dkX4sDqbBR0IhNCcjzyOn8Alm
         UWppkaYC6Eiv6twdlN5izkcdGsjPU3bKgwH4VFYJQhKh9dz46+6lFrCxWYH9ioCJcuKr
         jo+X1j0NkU93l4G8TVSRoD1oOSWCWThmpVLn8muMVEPAiMC9ABNKV0xqAJIYxaY3XAf3
         bCILvp0rH2oUNIfVBXqZPIECN0ubBuSJhvq8vevsqOzprnSS7W+aG41KyFYNnFx/fJw8
         8alQ==
X-Gm-Message-State: AOJu0Yw4hZ6l3U6uuM1JATJuPK5Ewct+pTZmpkEzFUcnDZs6ims7CmV6
	tZctXac22Fl7AQnOcdEVKNRa1RTxG1YRAcogoJ5Di91CsMmevpVSMDOZXleDtKFtD63bp0YDap5
	XBHU9DnykzxL+H0/Y8ZkrTNoQIwuvzXOZOasnRKsrW6lSY554eZNRNndMmByhbkotuK9X
X-Gm-Gg: AeBDies8BcslEUbph+t9D76DBdNo5O7urHPLVi41RX0t/V/szg5d0N/jJMNkgWX6Il0
	61MS3mg1Ug2do9zMMzaRHEzk/ziHPF0q2hsj/Rito+sjSPuI3docarx4t7kS5jdFUyCvD/jp2KX
	dWi0RqfxAANsM3npDcYwgXDWR+eVQVDX7tgZPW2fMMmxSCBR0mOm3Bs6H49VyfG3kqwsa+QPrfE
	tJVmKStkqGe6ElAY6EvGKdUDtAsIsxzm1Q0WNoevgHvuZy0uwkB3HIxTMPipseL8aV5E6YIW1UN
	fghDlPe/oAtEGdi7hqnVjI7pnQfXCHRhDgrix7N5P3Fw6NWbIOnv4Ww3ot36Ek5Ht5wckutcBg8
	PbgtgdKGPFvEZIyyGSleOOrne07U/vyi+6HBQPNmd4MNtBCOXTWbpIlWbZvihZv2mXCijP1ZRhZ
	F6+Z98x7fxnCykwQ==
X-Received: by 2002:ac8:57c9:0:b0:50e:5f36:1daf with SMTP id d75a77b69052e-50e5f362870mr173524671cf.8.1776941442545;
        Thu, 23 Apr 2026 03:50:42 -0700 (PDT)
X-Received: by 2002:ac8:57c9:0:b0:50e:5f36:1daf with SMTP id d75a77b69052e-50e5f362870mr173524401cf.8.1776941442124;
        Thu, 23 Apr 2026 03:50:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe874sm3614970a12.6.2026.04.23.03.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 03:50:40 -0700 (PDT)
Message-ID: <8ae4ef39-bd69-485d-a392-11bf188127c1@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 12:50:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] interconnect: qcom: x1e80100: enable QoS
 configuration
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
 <20260422-x1e80100_qos-v1-2-bcc2afe4cc78@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-x1e80100_qos-v1-2-bcc2afe4cc78@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cgj_N8pVGNqB6u2C8QDFqLQjaksp06-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEwNSBTYWx0ZWRfX5Z3NB+3qv7pA
 5RKyGAx9Y646W088Wu/dr7jIKtYD/V/hYZXPT0RP/e7lFwa2l+zpWmUkkVe7i0TUv1ldFU4J1vn
 orI1m7JUbrfeezFxFoX8sGBjGce/9BnUZRbZdx9h2SIrJ7N3vPrV8fQjXxcPVsqrN6x8UNtOfLb
 ChpfdBxt/CGmJuQgxbf6axAbzfPOFb3uzqEHHSAGDgyAaVlDtpGkOTC0leIs+uaN+2QCyL7HQC6
 hT3v06MYSyiL6IQjEd+nF9S3evezxc1UjoqgbYnEVf3ITenzZUs1ZgLKZ7wcrDF3oDBCkgplm5Z
 SrzJgSrYlG9YXeM2Iob9JNBPoaXHaWqkBEY6MdwdtCvmCgg3GpszPM1Z2PyuQy2FpTbfbPytbzw
 4QYc5ApwP2J++w5MQCbG9Ox29Oos0GSbcPNJFaUZGbCJyZNZPv3QTWdlBfgzLcz8CgFA4dcBNVD
 Bx3I8EHj9BmAepRzKtw==
X-Authority-Analysis: v=2.4 cv=AvbeGu9P c=1 sm=1 tr=0 ts=69e9f983 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MkUb1pzjx9tL84Tx2moA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: cgj_N8pVGNqB6u2C8QDFqLQjaksp06-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104288-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5FB23450F2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 4:05 AM, Raviteja Laggyshetty wrote:
> Enable QoS configuration for master ports with predefined priority
> and urgency forwarding.
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

