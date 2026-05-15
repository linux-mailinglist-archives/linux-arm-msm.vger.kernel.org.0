Return-Path: <linux-arm-msm+bounces-107778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MuLFMD4BmpUpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:43:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A367354D8F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B9DE31BA321
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4802D3CD8C2;
	Fri, 15 May 2026 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlXQuR6o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I89QUfBj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8193A2E18
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840692; cv=none; b=lW+mdKrpBxZeWJTQER91wooTmyafFF5cZPKIr2h4eAIhpPdOhl8UP3BkoBUyfGZ8I12Suo9+lHXVt94oNyZJYkpxm1PiMkJjgMrKZn9bUfdI4EWOSd/3J8EqeHaoBTU622/QyuhhbOERKIbwxhNmOFfK8YMNLxcRj5uqWUCLSG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840692; c=relaxed/simple;
	bh=unPGu6uS7YezciIq5jZHbFweXvFH7W8eGLAwSyl9WIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6J3NnCgrKFclzWiplgQDDQUSAXw3hyHA8oPBD+zY5BTQFVg8Yn9ciU31al3kX0rxPphz24zxtldPJWXxAhIOAkdKoVJ9KHh4CcnrIlqrREI1/HnzyUZywkOKvO05BNlmEBSUryLkK2jN+PCf8jPyQfMr0/wBtjQ6/23mSAE7IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlXQuR6o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I89QUfBj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F51nsD3795527
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnHqlOBnwCvxABsvz6RGyziXmPIuF99UYE4ADmlewwY=; b=MlXQuR6oOnVSOxk+
	VMWL0RjEW2SX3bYM9mKD9YjAPdmACEfJFzVePALzdOWDMXfulaGE2t4bwa0y6bQW
	ivSz8jZnRvNeNywYYL0XLj56jZIuObITLbi/4DwnbMnyvI3pQ1TYkunG2S9+TxQ/
	hZ6emTJJe63LjgRoPzX8oMa+e508I6W8GgHQcTPJL9uHirg+dnZqkb9KozBQYweA
	ScQ1/D9Ranevdw4coQuBVng5Pu1FaSItCha9UPZbTXSDafM7lRr+TjT8ZehsDrox
	gK1BHR1MQfWTKGmY1oGay8G2eJQWQlzrqRKqz+MlVHPS3HUpczvT7LV72NHuZHpl
	fqruFg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stsd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:24:48 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9568c79b893so392738241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840688; x=1779445488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fnHqlOBnwCvxABsvz6RGyziXmPIuF99UYE4ADmlewwY=;
        b=I89QUfBjPCa5/VoZ4vTSzMGZnA178CnUY3jaU9a211W8D4og1P3FBQN/SF/QVKFYo/
         fRfYVdXmHdZEEoMy68WkYCoI2vTMUnbDpZwnorx8mcmb9WOyJTcZjsYkwWNLq+Qk1Qsj
         8G7Aa33YA3s8dqN3sPs93h4Fc9FExtn/sH9URtsnZKCFnS5Q3LqIptI5ovMHIVqPuhe+
         XFMon8OQ0TsfbPz0dqyG84ZF5DtROL3sye6/bquE5uW7RGesjA2934SjLl/s56Qyem66
         5MaBzNuZ9xUArGEBvYzAqazqO3/PcTMfH6Bb7ScKoM1g5fq+C2eXcYAjnmTEJRRNBvwO
         ZTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840688; x=1779445488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnHqlOBnwCvxABsvz6RGyziXmPIuF99UYE4ADmlewwY=;
        b=OnVlQwyV57vPB576xax9XVH7T+CN/v7trF9ylZ2z0GS+CQaKb94igXFLvncc5KZ6N0
         1JXZrI0D59ud/MzXiOjy4EREKvc3MtWJwT3VGrQvRn6CQnhG7Lb/1Y27ophkb+KVfK/V
         13emVkpUx8jISYxtR2MFO9jrgdFFKJoZ6FgaMQ88uyt7zuctOJ+Qau4y4VJWUvAgzKRw
         kbLv3SHp/HgJCHu1Lt/cCT4gEi4EwjwU1UWzcCK0aBXuHS3aO5CSSqdYxX6cKRBTlqUV
         6CnYlRC/uu65BxeiGaysqdoyKLq8s3ROFs5UP+MTV+8Wc6TOVIDZPX5jggzpE91o7ETa
         n0bg==
X-Gm-Message-State: AOJu0YyUFj9vVV8k3q5tRiEgjzU6XuC69k3DVEht6EqT1nLiRxXpbJC+
	6ix80/1X/dlasc/FiHLll6NCC7hoYLS2uOPAw9+8DIha3z+XGUQqQft9SocqNWhjmhVPJY2Z5Tp
	h2yTuAngoy2CRF73yPJhE53iUAKmVlFcctgEPsGnY2urQZTGXX93ZHeyZEQ0KpGOnupjM
X-Gm-Gg: Acq92OH1/W/L0+hrQ/pWCjYJB21Bqbgt7tdBLvUB20YzJTpIUHLmpRGR8Og5dXI+S90
	iA6NMA6jfNWnj8zIQ7X63yCQzOjKaPDw8qiGGVIr4VWbuiIOL6D+oFkG+9j/tJhXkAE+FDlWhcI
	axl4Ttzaexrcnyn3LjgZgjY7bWCWgQIJ4uPlLOpBAVbJnfx77HvYoU1hPhK+r+72YM7L5su0uvC
	wlpwAWRsl9jb8E2MzCKm6MbZ8Adtvb0iZ/ORCAY0tykZDCYTcQFqJ4cCJ5FiHPLxwY0WGqg0We7
	ASL8bvVXD0oVJYYDr2AH95gWVDDKD/EpJ+zKqbuOovPkRT0FAe5Cu5yTzBjuyK0ftXw2bhiEPLq
	zAIruyzJSg+lpaUPATHEANlNYQeXjDKETaIAgj8WCn25u3jga1TK2A2hJsjfv7FWLVh/cvbnjzN
	rvnTV4y4PolmCc4Q==
X-Received: by 2002:a05:6102:669:b0:634:8685:d331 with SMTP id ada2fe7eead31-63a3f59319dmr398411137.6.1778840688121;
        Fri, 15 May 2026 03:24:48 -0700 (PDT)
X-Received: by 2002:a05:6102:669:b0:634:8685:d331 with SMTP id ada2fe7eead31-63a3f59319dmr398403137.6.1778840687727;
        Fri, 15 May 2026 03:24:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c24178sm208202666b.15.2026.05.15.03.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:24:44 -0700 (PDT)
Message-ID: <e942c86a-d56b-48cd-a344-d154322bcd70@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:24:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable ice support
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
 <20260515-shikra_ice_ufs-v1-2-b1b6ced70559@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_ice_ufs-v1-2-b1b6ced70559@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNCBTYWx0ZWRfX2dg6HMIpVduL
 idSlTa3E/SHqjFM1jcgDm6bIdz9L1m4/Fd4v9rHnzey1sspeilcoBCTvm29qChtN2EDJxoI3IjF
 nS32LbRqx/cKA0UA0nKBubBwyp62PnZZdSvoVSMelIx38uRhtlw7fjDOrqkq53DyTlta216jPRw
 +dcmb/nXYQsa8qA9+9Xq+wFLLL5fO90BXf+9aXokklnfxCljqhogY16///KS4bjk01ZimDO1/zG
 PmfoYVrYMeqfxrdTMAgcIvFMFLflXQWWpXGl6CwfRSQgRpKxZ8XVfu9p4GIbwTRpagBdNUxZPGI
 RcJyOeeB7aBVZUE/ahTI1q6DPtcXEbxexwzTwOLH6fpe8DKNZBvEd4jugpBrkTHrqL8TXaa6OWB
 3hix4tv0+0gmDFY+5EBweypf+TOefXEE9qBKwTCd5r1Fhk5e/5FhEVWwvPiIJNGGgiN+3C+e5tc
 iRnNEuapa7tNP+qYOmw==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06f470 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kIEpkeg7eEVi8S8yTT8A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: XoVP_y1W4-WXT5cpjduPZ7X7SASEYpBM
X-Proofpoint-ORIG-GUID: XoVP_y1W4-WXT5cpjduPZ7X7SASEYpBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150104
X-Rspamd-Queue-Id: A367354D8F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107778-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/26 10:30 PM, Kuldeep Singh wrote:
> Add UFS inline crypto engine(ICE) support for shikra.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

