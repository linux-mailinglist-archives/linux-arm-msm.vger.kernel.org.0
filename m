Return-Path: <linux-arm-msm+bounces-103515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OA3hM3AD4mna0QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:54:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 986CC419A54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 047CA301ED9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950A13B3C11;
	Fri, 17 Apr 2026 09:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyF7QI+l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1VHrUGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C613AF654
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776419666; cv=none; b=BBGSc07YKPdJ4jeyR1RAJISqZEbPDHiXal/hFQQqNLQrgtfddp0ne5cWkNUvkHmttyR8V5DwXhYN9+GxJNJW4VhI5tZ1chVljHC/K5wInEGZ8eKePOxmjBlaXB0LSVEyGbt0imDAptJ0oYyApQKNlzueWZ3qxyVxdC0wJA9fb54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776419666; c=relaxed/simple;
	bh=zY1uJ0AaPChwbCkJzKQs7C36HEuyLGmvoneiqqT47+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HIXpULxMS6RBJVhZyjCOJ4kIbXVAjgw5bGNEHTmNznsKTgz1SciQXB04yx/ZolCXK5B6QFnYY0Kg3F1v1Yv+kOoLQtLeNHCVctNSsDnAm+CEYUz3dFm1NkHP8ASBZ8Ze1VQlsZ/Ee6BQEGFpZ6rBGGooeUWec7+k0HP3LGsxvHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyF7QI+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1VHrUGm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H7AXmu3438220
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TSqyZYtczbrMJAR9r8mAgtofBSnvKj7JQnZ8roG/Yxc=; b=KyF7QI+lyqmHgPTu
	v406XyggDMMwAB2+uUEPfBGpFn9/O5Yu1PozWD1AQ/GII6rXED6DS9Lmn0iHXy/O
	Afx1tuvUlOXoXl21LgEJtmSZjigkLQ9WcqgZYNnaZ5Ebc5CMxQc1en3SVvRnfZZn
	pmzeOHdTKUxup6DcLMzplas9ptesSk+ybXOW8PMgqIdOOMz70MjO4hzO87ncrRhy
	rGdLSl7YolSYAfdZfvIgKiyw88kVpEoo2V7inuD8TTRAHLtf/adRH6ZpjbCTTx4y
	5lkd0jSQyBZIG5w56iJ4w1NgLDLMPFJ2pXQH/IhyfbbsCXe4vbeFmSozadjTXEZp
	dqWcPg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88rqy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:54:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2523e0299so13519275ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 02:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776419663; x=1777024463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TSqyZYtczbrMJAR9r8mAgtofBSnvKj7JQnZ8roG/Yxc=;
        b=d1VHrUGmHMHxZfysGI4Ah2lpC+L9QRXMXSCs7FGO0LebxKwSZ2bTaxifRul8AKP8Wo
         WDkD3f0IBE1CR9yVWgZWl6Ce+8AXatkHE1F4Auo3UCieVxHwZ0pScg7+rIrMT1dTQzMX
         O4795CEu30OMRdDtkyL9j0E1cr0f81098ehhcRrtIrG5b3vcAiOYFH1WhCRN1CMd940S
         D8vdfkPSwgOlE7RmR1ZsSVciExWboV0JVL/uJj6noz/FNaXiahAXUPYqLKsQmluHlo2x
         pbGl2khzcx6zjUpawyUysoCAscpz7GOEHKaG80HU+Iwls2ATxRxeqPI173Az/ZqbYxDe
         gIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776419663; x=1777024463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSqyZYtczbrMJAR9r8mAgtofBSnvKj7JQnZ8roG/Yxc=;
        b=iHwsCNAUoLkZLdcwnuPdM/6GUmbZz0WpeyE0bf3VeLmi4L3ENyDrXrG3MmNEfkqMx6
         S3uuCT+o+O4/1KkA43/QiRsppRwLR72VsJRcXoZPvT2CH0lTdzmini/BsqoHGAgts2ZG
         +GE0H5OT/N7aGSxCg10DWZK/a/RPUajtyFVuDMzNvrUGJbHQTo/111isZ9b7cX79KKal
         9O15trLyfglDBGlaaLnDJ2exbOGUgnJajy/LRmVqIFk4Un1tFUPaQruY6GMa9h3zHYYO
         JG+TVGxcFRVe15bwdZQc11RFc8KXXoZWL9I+/uYy1+otLzFSkl+MNmtn94AK3xkEAKrF
         9yTg==
X-Forwarded-Encrypted: i=1; AFNElJ+Oiwu4QLtLNu6tEP29SFbE3wuWCwUA8u7YKCqTmPEx9wYgDpycSa1fp0/UErA23tY3lL1Kjd2aRnrKOtTD@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ+Lwurxba51WO+0/CDXe8gKVvF0/2KIWPo/gN/3FCNrzTg7sX
	FX8mrABw6siipYRIBv3RCHVtgX3VbOPvT0xiwOrRsfDSvaJGgWIoKUoeTNTPaEdczHJRlIRxD6I
	YGWvMdZ2vfwidV3ter7NZm4qLrBKTnbN9lF6RIAqNUNkWMiS8GzmAhZTjjmzwODtrSnWd
X-Gm-Gg: AeBDiesq0m71AN0UARYOlnxPbvIGmi7Hrv5E2Vhcxa8OQudi8Xt02cD7IierBs3eTxU
	BpXWVDcd/DvjE/+pZEW5bJhznt/Qa1vKQ654etD4bDTtt/Iyi9Nq5qSOFVF4Dk4NKAnCBJ3fbn7
	ezhbwIC2QaBCPvdHdz1E4ftRNONU81FbrgWjm2Thvg0R6xZERubhr2TTqfxj5lF8zrWRFKLQu4O
	XD6RFWh7l1F+6qjD/HFwDFq2qYE8fKf/Pl1AnRC08uUcg2hUn5Tvvil3bFQQwB67v8XcKWNmvL7
	Gafbt4Wf00NZnrSSd9Z6cgNo0q+vp/VcFXx6bk4gkS/Gn8MyF1Qup4cPQCC9lDYrJ5O7uZVvqkW
	zHxM2MaY6bYMU36shC58UGCjp2Tu7U2jxj2pgirnmCms93ocwwyClWSdDzF2Hbg==
X-Received: by 2002:a17:903:1ac6:b0:2b0:c90f:44b2 with SMTP id d9443c01a7336-2b5f9e8252bmr23808305ad.12.1776419662882;
        Fri, 17 Apr 2026 02:54:22 -0700 (PDT)
X-Received: by 2002:a17:903:1ac6:b0:2b0:c90f:44b2 with SMTP id d9443c01a7336-2b5f9e8252bmr23808055ad.12.1776419662459;
        Fri, 17 Apr 2026 02:54:22 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm15911585ad.54.2026.04.17.02.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 02:54:22 -0700 (PDT)
Message-ID: <3b65a6c0-bbe4-4b57-aea1-f4070ca1db99@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 15:24:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom-qce: Document the Glymur
 crypto engine
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
 <20260416-glymur_crypto_enablement-v1-1-75e768c1417c@oss.qualcomm.com>
 <20260417-portable-proud-dragonfly-6bdd9a@quoll>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260417-portable-proud-dragonfly-6bdd9a@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L-dYpztBniCcKkDQN6hYSawPQE9TOeP7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA5OCBTYWx0ZWRfXzXxyRcOgNh/o
 ES3y4Bvo62JHg4vFaGtmsBGkSzychaPV2G++TKIDdcDKGMstL3uFq7TegNGWdYlRawTEaNYAT1u
 fHT11H0iFoaX6eYcXYWeYlP64GzJRMMZfaqVXIKpRVy5RAeqQgoA+WclLKAbya4bXOy16GnQX5t
 pk7DDRYFXJnU26jAlO60EcQFrMas+ZYRi/l37NmtnNTUT20obSaLeJoYxon8IK+LfRMDg1GFh32
 C7wYDa3sd5/5EEDInadt+ZKC5ZB5sJU8CInrBc5Ke6IKRKYZsr4i8AVBC+eUZcIq4UAx/aL2NIH
 hdKgApwT7403mEWbNBAnWHCUqNVgYFyj+bxblT2cexo1xiC0E0QMrCAGhSGshcCODXVuT/ku6E2
 rQApdeogYXGwbEixNa35JP5y7t1RQ3E/QaTg5yjzNLEC0zKcAJ7n+D5okgBkHWk1bUipGdmql/P
 fZ+yiQvD8TLsASwmWAA==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e2034f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CM-kEsVbLXR1AP68oKIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: L-dYpztBniCcKkDQN6hYSawPQE9TOeP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-103515-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 986CC419A54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/2026 3:17 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 16, 2026 at 06:37:20PM +0530, Harshal Dev wrote:
>> Document the crypto engine on Glymur platform.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
> 
> Poor commit msg, but none of previous patches were doing it better, so:

Noted, I'll try to do better next time.

Regards,
Harshal

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 


