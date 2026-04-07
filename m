Return-Path: <linux-arm-msm+bounces-102216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wC1IH0dR1Wkf4wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 20:47:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D66963B306B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 20:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCF06302EEE6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 18:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5B633263A;
	Tue,  7 Apr 2026 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOTHBGpm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcNPMznJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA5622083
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587642; cv=none; b=awkJifpCKvkAFU5qHurpPiMyIKoTltIZZyEQ4JFzWl6vHLmGtsEy6ExyFuJuEMWo/ERHZcN7fkLK5WQJgu9vn3aJpX1hIPxgIreeN5xH/AjFFT7DUgHwgn4O1GowkQz1whCnyrjbIDrX2DYX0n8XVwcYNj3Mtzi5p0VfsiyQm/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587642; c=relaxed/simple;
	bh=BUTI2FI5DAeRrl2AB6Ysms6i3ByyTsOJvc/eQBCfqzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hThuv8dZCeLGO7sAz9ZaMqW1r3yIIxcgH80uDCr5+B8EA1XuG7DiTuYtvehORPLHJYChSJyJxLk4hssy0gsFS9UJKey81g4YgO6o5T2DofXbEL8Re2yh/5Dohw9Z9TzoYuOauf6ZE/324kQCRQdBNxjjCm+JFwVc3HpT4ZU6AfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOTHBGpm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcNPMznJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CtJHj1404170
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 18:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kV/sZvlksbOGct8Rbamewlp0csnui5SJDj5GeVVHGDw=; b=DOTHBGpmPssIoIOa
	h6gThNeMlPvNjfV1eMQfISNlTeMif+D5ReGkikiPJCz807PH4kq4RlU9IGUezN9M
	fxnHTNJsS2yCAVKgphxKa16TAjp15+xwJqzMCe3dwEHVq26mg9eUxaTL4uoxiwcC
	98WcBeOWoSVbLaab+MtpcNrQxxw7PqKuBTfosBYGNnnXCDPEQUAbAfR+XYLmszCM
	QU1tEp7MxEyYMuiDJ1pqb8UDrCQDsbkB3lSI6cuI+hJw6wVUmckbwCQbqr24+BeR
	NQxC+VlXI7AF2b1zsxXQneSCSWuJKvHsal62OWAVSviOZprdk9DILPSAk5AyQ74+
	YBodwA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8c84b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 18:47:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242f76113so63199945ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775587638; x=1776192438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kV/sZvlksbOGct8Rbamewlp0csnui5SJDj5GeVVHGDw=;
        b=HcNPMznJNQ/hhUWnW+/9MFJ776GR0Z1iaeBn3eKZVQ4CJ8jOgWKQU6m6UrV90Jcsjq
         H35uOhVr6b/Rtot4twZevw5Lq2Qjeuh+EsjhuwWKfRlL/iJ8x/GHNuLkT36KW1l41OLG
         Vz3dgjrUe7RJONVsf/jTUUmnnMQTt4itoHv+fpVofNYXmdCfuIsqerGOZv8ucMDSmspE
         fsBN4nSjNX09vztMGtzytAZFD3SU8tFL72AXmtgf1Aygp8g6QPmGcHTyX+v3IY5F08lH
         n5IXVso5/g7pi8d9D4TR3U0kSoiHfYw8YMrZdT60ZUolg3s+6bgfWhC6LVOfaz6ZvXZl
         xoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775587638; x=1776192438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV/sZvlksbOGct8Rbamewlp0csnui5SJDj5GeVVHGDw=;
        b=J/Zeganr4y6tdAzbP1A93J0x0SwlDW5rlKiasmjvi4YRiS0XEEHE/wJkV1cqyEzd8k
         eXausYrurRVYpav9YIAnCAetvvjKn9HHhBl32/FRnkUL1j5nZk8iM2MQOe0ZPhT4ZIP7
         /IzJtqF68Yw1BahHXerRxqrqXWCDU2vQIiJg1aOXJ2v7awa0BFO+DVGojOF17ExFvyVM
         jcD3rUCRLT5fcOj6AewLLZZPcwakUg7MbUVA2i4JnUzYt+m7q+ph8ZoAH9hVbtWSoYtI
         acedQgZKcewz38m5fM2UuLwX7m2bx3T7OEiDbjygAGqMwJHt0WSalOHPRMx1puw9U8/h
         hPRw==
X-Gm-Message-State: AOJu0YwnBtS5QBlq5pJxPPNmcfI7sUv2bQlc/YaUxCTw9x96aK+o5FwN
	FIG2TIJpit59M+s4vHCaOvLJ3l92U/8QMypWqrkUVAviYB2QfWWrp2WuhulVK37kOOkZQzdPv9R
	gOf8TlOg7JRdTt2RQ3RWvDj/ccv+spdmR7zBNluP3aMJhXVqON2A2vhJ7+5/GKzxY+QzF
X-Gm-Gg: AeBDietxV/VdVgDzErH4ifw2SScezA6k1fcVAWx8WsFEe5rimZ7m3VfnoYsFE4ReuU0
	8Hi/Q1f6s63LH652LELLH0FCXO6z06clv5qEmVhi3UlDb+lPnZgtnpDczYC/RgqTKwnWrZk2uv9
	s7e+uzQutAtOHLwqv7fXT6VdTQGFRRyeo/SEHNDRwTa7DnnMTl+dO5RaVHxsUaTz0n54WhICPgU
	6YzvlYNxwCoLAYQrcSw9yB1q8wy4dvHpZCeZEklx4HXk4QsPouwrniRYhbldiQffCux6MeleIx7
	o+erM0+Qxe0d8IyiY78UTAjc180I10b8az+NR+epnGoDNqf+yWfSWA9ejaocBoo02sJztM9mda7
	9DbeO+9Od1g39JWBzqfjzJgszNf3kOfVhiD/5OfflzRaLx2XE9EtcDKA=
X-Received: by 2002:a17:902:e54a:b0:2b2:9f45:2266 with SMTP id d9443c01a7336-2b29f454708mr99925595ad.21.1775587638237;
        Tue, 07 Apr 2026 11:47:18 -0700 (PDT)
X-Received: by 2002:a17:902:e54a:b0:2b2:9f45:2266 with SMTP id d9443c01a7336-2b29f454708mr99925255ad.21.1775587637752;
        Tue, 07 Apr 2026 11:47:17 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.176.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27473583dsm179498565ad.9.2026.04.07.11.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 11:47:17 -0700 (PDT)
Message-ID: <ec528927-36d7-4bec-b550-94c13c8f316c@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:17:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom-qce: Add Qualcomm Eliza QCE
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
 <20260407-crypto-qcom-eliza-v1-1-40f61a1454a2@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260407-crypto-qcom-eliza-v1-1-40f61a1454a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QaKGCv6WHEVKychqgD7LVFtT4QmrNsij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE3MCBTYWx0ZWRfX2sKW+CZKm8S4
 BdpLrQTxXUrSViQ/qtDSfJixE54rK2txZcEX/ghsU6igpQhlSzHYPO/UwhAb5/IRYX8kHntHxmC
 gdCAD/meyXAQpQb73B/n2wpMQTuJAO0wOSjs+fm5PDXZWK4NwQgRRC3yfEkXvN7r8kuPHhYxG7A
 VHFS4a/X50juyznSXO6M8rYX2/5BwVx+XlNH1wJxrZY8X0F5goOVfu98okJvRyyk8ao13GO+N31
 7azKrIV0xHwK5tOZ+aWXYOwnVRQQ+336Kj0fyhCt1kOpwsXvG6g0j5faDLjGir9PeynqU8Zk8Kl
 AkxkW8UXK/OdloHtW4Q1dfLtg4JT78VUzR/JP9IxNwFvGIjErEDpJe4izPER+qGhx2mitykmdI6
 GV8rgXK2EMyKArfEZXfFCuDXvI2aU0RaUqG4we3DNDjcQLWYM85rWiNXERhBwFUBs7qdQKw8z6K
 N0066KgyjJfsCPPr9nA==
X-Proofpoint-GUID: QaKGCv6WHEVKychqgD7LVFtT4QmrNsij
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d55137 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=zb/CHAQdlIs4C5+TDoMSQA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Xf1yJYGQRHwPKPLo8RgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070170
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102216-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D66963B306B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/2026 7:21 PM, Krzysztof Kozlowski wrote:
> Document the QCE crypto engine on Qualcomm Eliza SoC, fully compatible
> with earlier generations.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


