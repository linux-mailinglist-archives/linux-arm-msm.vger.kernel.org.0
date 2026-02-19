Return-Path: <linux-arm-msm+bounces-93351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH2tHfDVlmmVowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:20:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C762C15D4F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03254301AB94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 09:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3FB2FB965;
	Thu, 19 Feb 2026 09:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+YeuFv5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcuHbkQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71920324705
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771492803; cv=none; b=tsGN1yxxubVF7MetjfanbZ93mdA7mioNUnEJgFCxjsev+6UQm78EunmzE3FScAI2z3ZWilMeaMNN6ycKCfif/O4JIst9JLMtj3uatiaJv57bxO4yPMqQf26hGqMwe4dxdC9CDXcKEcAIPw6w0BjcPeU6zPFjPBG1YxQg6OeYWkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771492803; c=relaxed/simple;
	bh=kisVfgvpDR5taz707UhZIUsAYFSg3p8Ww2QDn94jDMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBcKddG0AIQXbRiSgWLB9KtJn+urfUFJiIhJhhwu9is72HIdZhPeVxXJunVyECvNJ0thVP+eJsJrOmHSKdcoOwEeFCRkeVk2emZM34Fo9Zh2+DrOB6LwzcO1zFr3m82jd9ZJK9uNRwh7+tdMogPB0T5VC17WEFhXeZ5IdDArZRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+YeuFv5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcuHbkQF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61INpfb12883689
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUa3BE0u4BFm+LYlkvToA5YziCF+XeAij7ya4biirpo=; b=Z+YeuFv550VWb/jG
	XcxhMlkDybmHfcO11v6yPd2ruS6jpI7dQqcLZc7W2XpDMpgqKUZPhVnBVA1Z74v/
	CB1zs51vO1Y8e01Pzpld0PzMrHvCwRX7LTzloAi74z36nLEdT8p2Z/bfUtSm2cG5
	GXz6E5ecH6LHSdT6X6cjZTMeLTATaXLs2a7Yf+HkTmZSsJZWSgzgMVj1NARmZs23
	+p5fwFsV3S04J3+JjjDiRr3hCoVT9K6tTfaKO1wMaa3ErzdeO+Pd3Zs9TXAn+Mgq
	vyUlxvy0Aftc0Tn9ioEgj6XloFUr5QycjCcrYYre/aGTIbRshOEorDDuI+aNEFcw
	G3R14Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqfg91gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:20:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5034247408dso7644951cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 01:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771492801; x=1772097601; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUa3BE0u4BFm+LYlkvToA5YziCF+XeAij7ya4biirpo=;
        b=gcuHbkQFndN9CRmIqO4p+5Aq+pTXiHXKBF0Ub1N7upjdLkEIMK7cghbuLgjEF2tw1M
         7kPK9clT2cG9aiCWxr82z4irWyehwpK3TpvV4uq/j8Bk+wH97LkI49bNe+Qf+31S0Mnt
         AdLiJA7WvTmgStLEfHRXnX6sW/NmS53dLqBbPUmuGxwqpEjBdotIww9VgfIFEhQbOzUQ
         UUenbi2nellzArFUE7PsPL6OZYeW+zvZshqzcHzrV3f6ya7UCqfmie8YYoqBErC5Y3tQ
         Bck/Ef77oyjT050cKWrX9qOm9etFzF2gASAQUQBvOQmIxyPt/f6899IOc1igYGxDmUWz
         0Vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771492801; x=1772097601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUa3BE0u4BFm+LYlkvToA5YziCF+XeAij7ya4biirpo=;
        b=IAsGH8bqrj/4e31jPm3f2nwap26uGXdScV3U/8ktgh+qDpPcUB9OUSMOw8io4sUwDc
         L+JiQE5GZTC5CNW+ag3QwUbIja4MLAxIaEKB1Ny+BO1f9GMZMxKHZ++6Sz+yh+N2yhJT
         zD2dv4FX/xoUcKBGks/hMikLrwznq+/eP7js8TGszrtA0S5WpoGQ+plA4xy1x9MqCgaH
         5LbgE8skx8xZ0R1KbzRj1OQLU+rAoKdCO1BS2d739AiYznu0kp2udma5n1KvbFREkS4n
         5hED/OrR3Ca25N1B21Gg/cCBi8oKcWFmK5NwLJoYklraDdbjCDb1LrEQE4AAVitCI/wZ
         cSeQ==
X-Gm-Message-State: AOJu0Yw/Ydk1TEFbW/PUNzRzl4C5dOksTYqCYVtwPTi+/HLEmKyyMROy
	FK202rNcCzh6iACq7pNeS4whJN62xCHV82V0z7KDTPQOqGIHYXopTYTRSBB0Ke6z2jDxuHJR6kn
	1EP4tSTGk+UTBZgWTXybpVLc3kJYZOER1IG9hDv51FRBArUnz+9NPsEFLNCnSz8TGKUts
X-Gm-Gg: AZuq6aL3ksrtLthfPUAIZIJE22qoZk2hxbg2WqKohBxzw5KszVyiQBN2reDrx/M7YjB
	Mdlo20H87pWEODUqiywKaaSJWtLm5ohQhqSZqb3Zk+xCZIm35K/QTZFGwko5RBvyK+WSwkT1ph+
	fL3EmRAuaQzTrXW0JjjK9MAB+MEblsXinNNjKnDLCqNBR1JdlgNP/QVEtR4v1iLDICXp6ns7lwk
	jYylE4BY/ufuyS5QviSGnOl4YUnxri+ObG+YPObj3u72inK7u4etu2gn5HriuBNbqjvH+XLQdCh
	78KTYfPEA7wOeoCHEhProQA62BoZ65rm4Ap/P4HpuR1nmijlYopi6oOES6/ysHlbxznRU6XYD0I
	3pwjCauYl440DEAhC94b+rO+Xq97FbjLVbvi5UzanzqTk30jZnPChai0KQxw7J1aRRBpxH7OTL8
	on25g=
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr1975688285a.4.1771492800859;
        Thu, 19 Feb 2026 01:20:00 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr1975685985a.4.1771492800345;
        Thu, 19 Feb 2026 01:20:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f102dsm537077466b.26.2026.02.19.01.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 01:19:59 -0800 (PST)
Message-ID: <c50de0e8-282e-4e1d-a8de-10dd047b9c30@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 10:19:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8550: Drop redundant VSYNC pin
 state
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
 <20260218-qcom-dts-redundant-pins-v1-4-2799b8a4184e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260218-qcom-dts-redundant-pins-v1-4-2799b8a4184e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z8oHCYWnuEYcRNA-bUu9DE5Wq6ept3QN
X-Proofpoint-ORIG-GUID: z8oHCYWnuEYcRNA-bUu9DE5Wq6ept3QN
X-Authority-Analysis: v=2.4 cv=A6hh/qWG c=1 sm=1 tr=0 ts=6996d5c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=NMe5sQuIffPLTvoV0ecA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA4NCBTYWx0ZWRfX5UgPkgRL+QJQ
 kPK9sO+ffLMoVA/NRXKMGrY1aRunWyWDY3RECeDnbYvmg1CzHkqVPn7fcVDg3Q0hnucbV2+7f4I
 g0wF+M6GSXwK4A1Yghs+DR/LUGe3U0qD0BVjZYPciF5G3Nmhu0MxWeS8zvXiCs1e9qDvAOu38Ay
 +KD3E6/eHG8RcpAEGSBdykQBsjbRTU67idBAWce/s8wp+J7w8cJD+wUYhMuvHZvOV9KQLk6Ywuc
 FcyHXT+goXlXvnCOR/ksBDSYbYsqJD4BNH7+ZVxvIaDq8TnB6t3mzUQsDjWWwINHNTmCa0JAzMh
 FbDb+nRzIWD+pruou90eyVd8emAbqhEzDLma9yGXMfS53PvuSTLd/I7D01UBjjtJu/8wds+F7hG
 TopuGNvjjWoMmiqC/SR35s6BD9hVLF+xFusw5dTGiGFJxdpIT+eO+mmWCn0EKZSsG7CpAH3j4AY
 xBzKWJS33WITjHUNxGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93351-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C762C15D4F0
X-Rspamd-Action: no action

On 2/18/26 6:24 PM, Krzysztof Kozlowski wrote:
> The active and suspend pin state of VSYNC is exactly the same, so just
> use one node for both states.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

