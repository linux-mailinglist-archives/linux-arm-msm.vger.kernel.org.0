Return-Path: <linux-arm-msm+bounces-108221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAIjKB0mC2pAEAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:45:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 046EE56F241
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B30D304C8A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CF145BD6C;
	Mon, 18 May 2026 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JG96G61W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKP/evWm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC652436365
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114999; cv=none; b=sxFdAcP272EyWgWUFOhN/B2m+FF01kt+Hmqu03qw9ZGghtxECqmd36Bj4FR1W1i8VXOQW4lGe+nBz+ktmfXzDkHBnHRLFsHOvov3ehJWk2mYxp1nq+PoJdlqelGJ6wu/+frb7zkveANsVay13BPTr3tP0RmAyOBNTEs+vYlALrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114999; c=relaxed/simple;
	bh=mrpjJ1xHCm6ZFYwwlJdMwjDopr2Sv4DPvW85D5MbBjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPK0j1G1OUHMr+PwugjnYB/tCTu63KvaA82S9UIQ3IfHzOF1GpF8hMF1fl5ig2L6JCl8dxYsYSHpZk7Nk9cupNtwKGT85NCQHG/xGiX7pmmHhYmUVNEuZoDCsBPLgNrCQDZBgQsZafAfUvolhVFt8fe3Bc776muHAEXV1ZCyBQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JG96G61W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKP/evWm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAp4YY2083413
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 14:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mrpjJ1xHCm6ZFYwwlJdMwjDopr2Sv4DPvW85D5MbBjc=; b=JG96G61WhRcPHfvc
	cPvSR6iIxeI+JicTQSeXwXnOKEmApx2Kb0APkcCCPRyjMahmGl4RPe1osyoWQ3KO
	SQTnQvvmANJPVYGfWK7FzkwScHBoKbUhFSKT6Piqhk6d7lOLn914X+9RZsQ0VJQN
	OGUzqvwEGjzFM42N7nkewCsvp7jAXUfnGW0yI2ogQrBtHmejPbkvkmK8LNt6fPz/
	pnRSNkWntmhiw1OM8Fxuk2j56X9FMH7JhMpVIjM3Zqb1nNadhqM72JFZdvDWbCTj
	P5lKsk0qG2elAwq75P5e1q81+zL9Q7WlF3tVLw/Opso1H9Dlg5hvoWMPpQEWioS2
	jWrHJA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81ch8vqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 14:36:36 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6314bbea08dso91289137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779114996; x=1779719796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrpjJ1xHCm6ZFYwwlJdMwjDopr2Sv4DPvW85D5MbBjc=;
        b=UKP/evWmZ8vB+fFXLFqhytIAe5eLyDRtB8SoQ9OhTWErOzfHPwlwlDu+V02pMgDTDI
         YMUjE+rq+uNVicDXGxHurjopFrCxIR/CRAPilyH4Ua2HE2PvktX/LP4pBAnA4go7x7mO
         X5AIpbHXBa9m9J2UtD5lbV9p2Wz7C0Li7RY2XcaLerAEmEu20F6Ulk/xVXmGW3OndDlO
         OCFj2G+HBz4E/CgcIaN0bAkF27KWSLJsfTgUWJMKJcdnvivRbNoLG2owJfPlB5Lox3yG
         Z4pWp/s0ZkKA/iU2Bv1lkmNYUuq3btXOFssaU5BtZ9nAn6wDc/3qrinRoCi8mmxGJJJu
         tBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114996; x=1779719796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrpjJ1xHCm6ZFYwwlJdMwjDopr2Sv4DPvW85D5MbBjc=;
        b=DcJSZMCAB+KMUeds2zweMAb8o/g/oDjZwstJOXhfhly3xd0EULKylw9wVd2Wo4SGbJ
         wnJ02bzs58extVK5WeBIVb16A2AkrJBSgYdydTeOzJzBIbEWNctqNYu1roQTL+93XZ6P
         IgGIpX7OswAWxOEPdV22XW5MF4HkMbgpo3vFHp/LEwOq62563DJv3a0Y1vJAo+imAOIa
         lkZcuFoR163vCI6CLQMIrcaO5oaLqCILImiscwfkXXAwXDgTxNV69wWHod3jVkbZ4rUA
         PBA+3idxTE4FKQxAPMNVk3BEgABid+EdeqRtmSU/4CN68qKUpY/o8RYh6UcFp4PNp4nH
         DfVA==
X-Gm-Message-State: AOJu0Yx3Q8cQ27hMQlGfL+ymo5KYIZVRrcYg5nk8xqk8wTczatP26o5M
	cwOFGFTjtfBbf3ElVHmDjCGK7ef+Hdc3dZxcalba3zNKn69OTwe1MB2E99S3sI7L5Gu1rXyKfgT
	NZ48Yc9f920f0Ye7Kdq8/vkLIeJkG8mz6XsCx77QFiPQSEVqq5cTXL5J6QRolYTXryd+5hx7wDC
	dj
X-Gm-Gg: Acq92OEPmqsIcYY3eFlSclF5BNkC+L1dcFUUe1Hx4Jgdb4W1wUELJcGjiD0Z6kfxCM3
	7UbCcvdVWXe/HW88MT0dvRPyhXyNdnJIiHz8JWqgJEtUt8rB4i8/i0mRXOqZ3X2UmWbpGmCT1kL
	eDfB2li/S7IH9932A1311L4rxsruZN10RSR3002uv2s5KwH+pbCj5i27T2nPXmqgdgHdSlDaGEI
	dGeqQaTXydsNafvR8UXwGYOGwKAGX0i4y+xP68Q8D0LCR2haIAXzmCVErt3VkHEIdNMqzeU6b83
	JDjPBXANKF2hZ7C+hQyYJSqCok2fz65tam/CEAZbZFJ8Pv5Cj0/dlhWJq1zGFIZLQkhWmcSFWt0
	4R4rk/Zg+DSJC8iwaAdd1AUcWa+HUWrVYKN1Bls4E3/KphH3gWU0QAPa6zmBH4LYnFNq68d/3Bc
	3uTxE=
X-Received: by 2002:a05:6102:951:b0:636:c122:8583 with SMTP id ada2fe7eead31-63a40cb117amr3123959137.7.1779114996257;
        Mon, 18 May 2026 07:36:36 -0700 (PDT)
X-Received: by 2002:a05:6102:951:b0:636:c122:8583 with SMTP id ada2fe7eead31-63a40cb117amr3123956137.7.1779114995789;
        Mon, 18 May 2026 07:36:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eb6320sm571591966b.59.2026.05.18.07.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:36:34 -0700 (PDT)
Message-ID: <56a54a34-1040-44ae-92e2-ce65a3d3acb5@oss.qualcomm.com>
Date: Mon, 18 May 2026 16:36:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] qcom_battmgr: Add batteryless DC-adapter MAINS
 support
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4MAM0SF c=1 sm=1 tr=0 ts=6a0b23f4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=kDyHj_zsKyADgF95HkcA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE0MiBTYWx0ZWRfXzOjtYHY+Y/ar
 nYbkYFsntruCGnZF+7EmobsHs0omI6uxy20pCCCwzmmUW3hZ0RNMOTirgVLJs8OpJ7fgA/8GBeq
 l9DTtLql6pyFsmTGm76zFHpf25/25uUFGHzCXPtmk0MXl/BbNgvAXD11ZvetSP7Arti/3SHl2x+
 JBdWTsDNI85SSG+a82IPcBfz8p/noI0h13j8nfFbN0sfnI/lZwUL7ZOpiBerdJaFjbivvAO5VcA
 /SrXTwHo94+fIq+BXTngeVTES/RR77PpN0uC1/Txp1L1ADwH6pfrXLz0Af5hFAMdsfPCP2aSGha
 fnyNe9vZvsMZLng78i7CeuwIe8Ox2AstM0sxPkBqxX9QDdTZ3ph373oiO4XNC7rZ5Eq93XD4jA6
 avyBsH02z4YEQJ2doYy3AJA4+7Cunh7NVBIm4cbDyMBtw0PW8vy/p09tLbgwgCZYhtjeRldqSsN
 zoE7O8K2hn2fwY2/ahw==
X-Proofpoint-ORIG-GUID: okBIRr8rVguSrUt8akmno2m1GMGcrOSI
X-Proofpoint-GUID: okBIRr8rVguSrUt8akmno2m1GMGcrOSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180142
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108221-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 046EE56F241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/26 3:49 PM, Rakesh Kota wrote:
> On batteryless boards powered by 12V DC adapters, registering the
> power supply as BATTERY causes userspace to incorrectly trigger
> battery power-saving sequences.

Does battman really offer no way of differentiating whether a battery
is *actually* present in such cases?

What boards are affected?

Konrad

