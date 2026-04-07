Return-Path: <linux-arm-msm+bounces-102128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBFpAebe1GnzyAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:39:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 748E53AD02A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88AED304524C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210252F28E3;
	Tue,  7 Apr 2026 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSqxaE5q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/oq53ck"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F1C3A9D9C
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558321; cv=none; b=BkAIs9qUTxojf2Bqhe5E2Ban77p7x/bu1yduuaFaiENyYm3JTVa3kSmROh6PNN8U7ltAp6yhRDo6oh0rQBFi6dD6yLbJp7TvhXJBXF4rKQKOkmA9XYaYNseOEnbcPrhpPDG63vZWbE7MMNr7fbkwaICq0fJw0TC2whobhuHvZos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558321; c=relaxed/simple;
	bh=HdXSkosonXwRt8EKMFBT4Dl8Ut0JRx6ooOJSJZ5hKCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxNHnnIfvsnoSwCIn5lIveQflkY4SWuhBBHRQI0rIe5MR20Mn1QOPD6f8nI0tTq33uD+z7tkSGVCtusM7aFTxypAaQUA19+cm6yiymbDEG0WLIilw8jcsoH/KpiUm28al5YD3LsYuqblwWEeV20GTDneQdVeloVXIL+BPaAQjsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSqxaE5q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/oq53ck; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376ITHk3536841
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMQSditiu6biUTQUGCeaE4++hNauDjMmd1RU0N0xQ3I=; b=XSqxaE5qNMlGt3Du
	0i7W0ViLhUoTLaSjZvfRe9IUlf8APpcZ3m1EJsNAjy4B9cLBnHurX1LXIH+GdimN
	dz6+/4IcFGLMTxPA0AWIuhGToSCvmSkj/vGqDgtuKIhmXcbmFGI2oJyUn3g4GX7f
	9eFfLcz2EXdwxrhFrQU6FyLUSTJIr8CLWtRlcYl0FgV2EZq3A1CyzRZRkLWJ9FrY
	/XhAgjvHLKgaACIyy1Vmwxqa1Xu7GotJ2it0p61djnz/zIjOUBizivpRch01x1VM
	zd8MVKxVGQb0RMQ5JCBQu9kxaOPDbXQygBSyoEBPrlBpyRGJUgbT+isbXZQ6kGVg
	33pbKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra2b0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:38:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb485c686cso170103885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558317; x=1776163117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eMQSditiu6biUTQUGCeaE4++hNauDjMmd1RU0N0xQ3I=;
        b=J/oq53ckb1Z7dWarFe/C7e6lLNEmC7q+e1BeVNwoJIQlCqVc03BMCzxWJHzv+skrSu
         QGJmOozeErsNiCplAYNnmGPLt7tD/+QVeAh7AieSMLKCtkb14jvoLIUS4AImbt0ikO3C
         7IoR58rlAvhIFUZf1N9cN86mEoIQ6c7C8aQ2wvNSssN+kTM/H18Ge3JlzJWWMB7AjoY1
         4ysTykfnbq1VKLbnH6Q0ndvToIbe5kQIjlPZCTkTLVbJHur3n7zEIIX+iGAdjAoCUlaX
         7Y6Bwv0z5WU7EAdI9L+Vn/atsrMMNid2f4BTEriP75UDI0VH8As+wQVTL+LCfRCv0NXd
         rmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558317; x=1776163117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMQSditiu6biUTQUGCeaE4++hNauDjMmd1RU0N0xQ3I=;
        b=W2g4mMoe4YoqjIElmoW2OEjg+vgloS9NdJkbPC9/+RrTMeKt1v/4mu0Lg1TdlUcGT3
         74byvMZoAomUmfKMLhIRkwq6ctV7dNMIre5L4KFDWOwhF8lNeTyLir730l0BzUJhRHDv
         qvYI2lun9vFoTmSbCIMuzzPaj9/22WgkxN0srJ/SMb2uu1XZ8hZRP4Ib0NgML5ymAbtS
         GFqq8sYOHILcKx0tj4nfV55DvtUI3+7zT2+geZPt2/ykuq/4fWy/6AmUgwIDaAJgGD3K
         FLp4kCcbLNiQAUbCuoaI/MKfLAhQmhf7aRe8zCeT3hRbo4xsbQiQ4N58Ag8jex9Rpd4H
         NBdA==
X-Gm-Message-State: AOJu0Yy30xi8D2k8Iwz74iiVwRtPSRzkpXoYTOAiO2iPH7wCeWK07Wx9
	Vb/6L9R3J5rX8FGiM+FloyiSFQpdY3ys5xWryViF0SRB/pzUjLbYF44bw3W4x5uijsWINXjklMo
	NrbW+FVxyCz0l8tyjie3OxhKJbpoKlwmcliHM9FdQB71UQHV0rUyoR2jwcLVsWjja+28E
X-Gm-Gg: AeBDiev+FTxClpjDHq0fFSYbqinAi5XNQqqZ5MfMLl0gkp3T2AYB5JsTtCvq8R5vvAS
	daBEy+2T5YOwjAGUXi7lmjZXWvueD5+JANoKvjRrEa2frYYAa+v4YLcVvpYBsMgky4h469kMIzL
	w5ivRlKn2DVDnaMxfMBN3/qnqBid0rbFkdPU5yWINBzDfHOF633+4ytQnw55JzI0pVH4WInpGGF
	/WNmoSgyLpYYMO55qf5ms/MrC4oI0QtfumXvSEND2nqka7qdiPT8vLPrSmIOFfKu/kjEt36ABxE
	00waepdN9HYzetWv7Fsd0xt48yTK5QcX/BirPAm/421dgKVNAzWfUFQsbMCe09rOHuGWxLKJfNN
	C88zPAcyTdAuDlLlFpYN2R1Jz5CcHCpBJK4MVQJARJDDLwgeUXx81RFpZKzPv4nECQtZBGhVhaO
	CbdGk=
X-Received: by 2002:a05:622a:258f:b0:509:e68:22cb with SMTP id d75a77b69052e-50d62cd9f4dmr183427761cf.5.1775558316841;
        Tue, 07 Apr 2026 03:38:36 -0700 (PDT)
X-Received: by 2002:a05:622a:258f:b0:509:e68:22cb with SMTP id d75a77b69052e-50d62cd9f4dmr183427571cf.5.1775558316457;
        Tue, 07 Apr 2026 03:38:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99f80esm543484366b.18.2026.04.07.03.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:38:34 -0700 (PDT)
Message-ID: <31291320-cef7-4043-965e-8170d9a861ae@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:38:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260403-can-spi-kodiak-dtsi-v1-1-4055e67dd3fc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-can-spi-kodiak-dtsi-v1-1-4055e67dd3fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pq9Kv7qp94ZzwLqVxXyCG-nYycXt73Cx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OCBTYWx0ZWRfX2KSsX4rF9iXh
 tMaidFXb4nADmE5pXQNUK844wdx6AVZXoMKazW7Nbqvl/p+1a23Mnl5lPIP+ZpayQjpYC150Qjm
 DCkM7nuXn8r8A5KhPpaxCsLqN1lv8pGBndj/vo9mdWNOxJcrLqHw+l9K7K0gHmdUDTq0wwfZWc7
 /IE8dk0WXgbfH+tfhxMqv9JfTlM+LRzI+jAcBguJ4fc6AZjWKzHT1IuvfKRPTsP9xqAtBa46F/5
 FyGoyydCsj06+RY7XtBtUBQfw+jJeDR9WnUY3PuQy+whaM97kPdEdW2EBkomTMpty3F5dfPHn8w
 JkA9mAgl76AEVH3cFNOWg0TkO5F4lYAhy7Z/sAHtLu/cm+9h8ktjCqhUx/ZjpFtUgjVYmWPb9vw
 hsYcw0Cjy49arcZ/xc2Zenl/6dBDlkWN7HG/PnhTSGFcepYb4MD+RIwHTciHkMPsAJ0/+WjEc6q
 aMzz+TNX95wApPe8WEg==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d4dead cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FBG4kKiRHSUkxbZCjDMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: pq9Kv7qp94ZzwLqVxXyCG-nYycXt73Cx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102128-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 748E53AD02A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 8:40 AM, Viken Dadhaniya wrote:
> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
> The controller is connected via SPI3 and uses a 40 MHz oscillator.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


