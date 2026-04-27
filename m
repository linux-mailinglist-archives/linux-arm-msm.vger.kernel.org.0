Return-Path: <linux-arm-msm+bounces-104633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL+nEEMM72kq4wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:12:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9301946E26D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4CF9300A62F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E872AD35;
	Mon, 27 Apr 2026 07:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rolhe6lq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fijaf8/9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41C82949E0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273553; cv=none; b=GXxJT1WAG+fbWIPKMOFq3dNpaa81Pv2HPD8iU74k+Pjprz/xbmMlHit6x5GAjSeoZA8pjeq9OVwhmeNvcVGQoCukC9VhFWnaxLxUCcBEvLZHKBoP1HjgYA7/OtYQbVqWWHaQ5w8GjczcHhTv2VUbkMJPyjMkyi07OXqUCsdVc9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273553; c=relaxed/simple;
	bh=bpSrUfXImM+X2RbY3hQnzCWoZBm4VEMsmPD8EHvE3y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7PRbEX6PujYqwb/FhSDH+KmQJCVMeAgh42bhxFpVHU3RnHZsuW1uG4SFCHT9/WgIOkQY/cu8EQmdEDaxakO25xk3Nfsedp/Xag3hJHvX4XfUkQ6kSG2+p85+V1iotx8L37J5H/Q604D1w+CJWv0+NqRxo4TTgaACI1mdiVpvZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rolhe6lq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fijaf8/9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKPg2R234642
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ro662M2s1G2lcIeobE07C3kzRYvi/ggcGdxqc7Hzit0=; b=Rolhe6lqgOjgH9NG
	X1XT5/x5f92yCRjVs377otcCqYHQwpBnJOuIXx0+I3wDjaRcLO3hqlWJ+faFKHp/
	Lg1TibQY9PTtWNHATUTe7mbrUD8acRxS/9yeMUjZf8hq9ENIrehpXdyAHZvkpjyT
	S9RgkUn9Z1zv+0Gpn+g9L/g+Nm1FoL5dFJuwGXe7j2Xx5Uxr73+A5GD/GoT9+qN3
	feYpxguXUY+g1Qk1cAafNku6zuvCRiitJ3De1odBMvWQ06DfgjsFvljBvRDkHhmx
	xWip6NTifLNuRnrMmynxwPJwYyiq7XUzDwjsihM0SDuJlKQHNRUsy+IbutBTLhrE
	HVcr5Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9cq8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:05:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ff051e189so33393461cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273550; x=1777878350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ro662M2s1G2lcIeobE07C3kzRYvi/ggcGdxqc7Hzit0=;
        b=fijaf8/9kppwNLGE7ygjMxEAzxa/SC8kxYU6Z2iA2zTxaURT98DqiIVMMAy2uGemhk
         j0dD5dgJKXEV4fQv7c9M4NNnCU7cqLdAoCKrgxL/o1P0uKJgE0GUwhgptvfROiLK1GTk
         DbasdyTIn+G+VVgbRf1VZ0vU6aUacNhEo13ka0Lz+eN3yS/uh/zUx1biUXTaNy+Ei+yD
         mmkMoV/OXFb9t288CQAmZ+SwZ8GqXZAtOxbBky6iqGZotGgcmeQogKQebshWvzFfKKfm
         QOOAoB1051mNzzdTTrynQ8B1fMEdtTr4O8hyaI7dxABfTdRkhu7cN/Zk3+o8j3mIjybY
         TJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273550; x=1777878350;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ro662M2s1G2lcIeobE07C3kzRYvi/ggcGdxqc7Hzit0=;
        b=YvZbuKZLXCu95vlBk0JgUt1/8+eE9VKclHU/ysvfSY8DHecntyyugGu0kgFE9gxW2X
         KKofpIChiKK+Lo4viCILtYjZ3846g9Kt7T7lZlfA4ePwWr6A6Yc4eknm26quoF+S/P5P
         I97I4qhgju5LqSZ8WVqc6Lr2oKcPba74XaJmKKkNAkaqQqFQo5DFrPBywUy0lOzrKw1K
         5bie1YItDV03dmmiCm9G4TzpIiNG7phSFzoDfD60obiLmjpi7/1+QgzcdYSxGi620Pqs
         tDg+hQ4EVH3xZgE3p8KZZIWydpyCRkfHa4TZVCYgzdGop4gq7IhJtQaS+MKxwadObTXn
         9JSA==
X-Forwarded-Encrypted: i=1; AFNElJ+rZYAJP8JnbOiW9/uU4A3u/+DMIPP0z5AnN4asz2fPx8NqPHFZNT2WZq1oauwOIuPmZXjkNdlwjFbIhD1S@vger.kernel.org
X-Gm-Message-State: AOJu0YywuHMatojACmkyiY+Th66atzvt4w2An72PriA9KXNxGYgL6Z6m
	nUjX4oKNhPXKHRbBYtlhf9UyS9Y6dvzsJPH3Ob1MlmqcXYPvcEMjL5ZgFsAJPysvKtKd5A4Dmgu
	osMs5vE4nRQSePO+6SpNnq10fLNzjqwUECCObJHnMFe2ISXiaa7F+CswzpoO/R6hhvM2Z
X-Gm-Gg: AeBDieunSoSNr76Kl77Ub2ubEIp347HvYsckdW0oUBlCFJd37x9C93RP99DAZP05lx0
	Q2ZhRV9M7t7Ot92+FhGgsAAcG6Gs5NB5in7add2Jy7JehpBOIGExRQZaDn+SQ7hVSMMkx+FR3Qi
	JJgc4V16wTEIYjfZH7a5FSr0zkp0PSgSH6YZ9eUA5FXE7KJNGCT93TOistSoQPaTwRkMgMQp9ue
	bV7OrJN4SRIe1nFyf925Nbe+lPLc9dcfmVB4DTblHeKJpzWtSGDQg9Z9IZTP/x9Cn6Yap2bL0sL
	Je7+Qrf+o1q0M5ht00GDsAOwAX0JMC2uWcPipQUVP1y9B15y2WbpcGYpN49Pqdal+OJs6zUEkKV
	zohIozkX6CNrtduciMOKH8/gxYowA+WHg1cKU7bcXM02Fe8pdbWOOLCJCKIh1iv9pqv4QxSU2HS
	hByzBpbyhT4oSH1jk1dp7x
X-Received: by 2002:a05:622a:1809:b0:50b:5336:1d20 with SMTP id d75a77b69052e-50e36eb097bmr593780211cf.53.1777273550271;
        Mon, 27 Apr 2026 00:05:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1809:b0:50b:5336:1d20 with SMTP id d75a77b69052e-50e36eb097bmr593779851cf.53.1777273549863;
        Mon, 27 Apr 2026 00:05:49 -0700 (PDT)
Received: from [172.60.9.66] (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0fdsm8011531e87.13.2026.04.27.00.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 00:05:48 -0700 (PDT)
Message-ID: <20c47489-500c-4418-b734-e87d36277639@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 09:05:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: Unify user-visible "Qualcomm" name
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260427070127.18471-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260427070127.18471-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vKkH40wiqDn7-fpUvMTSQmimhPQxKmnh
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ef0acf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=nnYKl1aPHK5ktf5uHVwi7Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=NwLMpufPYXkEYjmL-asA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3NCBTYWx0ZWRfX032Cl20FWk9k
 onm9fCxPML4++fRR8C3KjJ5iWjWqv7M5R7UsRjJxsYId1JPQkQKBQi45IeneDD8T1tI+V12uZGy
 eAnKPFEx7PD5W+MUxpTgLvjfj6bk+86OCyPUhzghL3YEXnX6oqUIwD3hwSKeuFJJKnMiW+ofUoq
 oPqlMiMsV9g7ptUB95R4VnpotmFNFc7C+PW2kL+XcFuC5wo+9CmH1cp3xDTwTn5BE/hKyLLr/US
 V97yVEm+u8SjucwruS6RmmZtydhjTQimeMhQktHzWzxj72/NWOoGCA7pZ+1WwdOMkzFIDS+vqYi
 hGSUADvMUI28XSzo4L9uYxCfXmiWT6qGDhLI9ivlwPbbeJEZ20tt8MsLtNxc+SWbBlwhHaFaiVm
 lAy4KnGqI8r2qByYq8TGDCPJ6/w9KZUEUWpA1qKiq9V+JWjCxCl2mRIy98bKnqktCkPs6el234I
 EYmAiON7Wg6Uif5Y9Tg==
X-Proofpoint-ORIG-GUID: vKkH40wiqDn7-fpUvMTSQmimhPQxKmnh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270074
X-Rspamd-Queue-Id: 9301946E26D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104633-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,oss.qualcomm.com,gmail.com,sipsolutions.net,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 27/04/2026 09:01, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> And "Qualcomm Technologies" has even variations over the tree:
> Qualcomm Technologies
> Qualcomm Technologies Inc.
> Qualcomm Technologies, Inc.
> 

Apologies, this is a duplicate - counting mistake.

Best regards,
Krzysztof

