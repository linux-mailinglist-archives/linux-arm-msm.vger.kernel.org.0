Return-Path: <linux-arm-msm+bounces-113607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V2CGCDN/MmqP0wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:04:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B0662698C82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:04:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=buHvTJXr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dBSwxZBQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113607-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113607-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A52B6304B355
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981CC3C0A0C;
	Wed, 17 Jun 2026 10:59:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C039EF34
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:59:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693990; cv=none; b=kgsFyyL5JXm8ENCI/EhE7y6lJZHA7EwR73y3Cfw1iOAOIn3VfGtZgxJS1qCs4hv25kTcjsAXeR26rUE3r9a1RJG034v/RtFdNEJbfUt9dPPkqth4+K7R498RTYl/1KJ3JXtcJihvHp32+SZhE+petyInItg8BESUIWIVchqZnE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693990; c=relaxed/simple;
	bh=XBkfdZqma9YJXH4WQfN/4BdC4I4nvOEcDzN0FNhnRUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUaH/m4O7BO0eQ1ODsGX2IWDp6y9ArrjQ5ByCGi+DEO+yFlDhJvLvuP1jVcBJWT8XqVUDs/jH21W8qQy4tn7UTWsWWbgNRihxktQWeyPEDQKxJkKtxDe20zKOFao5dCKorBX5QcvE+glthd1PGqsWgtMhCy7JFpfNiDxaOl9uVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=buHvTJXr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBSwxZBQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Ufb91654405
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	28m5qJHxJ5Tg+COf1JCEhZftnpMn24hnH5Aw1jUzrv0=; b=buHvTJXrJICsoivI
	+YU2p6u+FK/5qV5gnZWGkCfUAuZ8NL8/jkvh5D+L3SdKsj2dd89wOXOPikNgXs0e
	c/TAqM8lDKffSD/Sesd+dpgFL/oAnrHapOHIqFqOHXoxDX9s7wtvZfdpQ2/5XuVh
	N3dTRzaZwD0W5kiB4rAdsPkL7CUCd06l2AL8vJBg82DbsLfPznyKC1fm0Yp7mLzN
	BNlVgmMzsXitpe1j+C20zY8GAppmBpMVIGBbISOJfGBlH8Vsbxw/LgqpXSzbkj+L
	OHCtyLR1dQ6YQy1eFHtfRfM925NgYLO8hSlHGB9KT0nra+B78xbNiknYI88T/nWy
	OXpV5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer2q20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:59:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-917fd2bafdbso96670385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781693987; x=1782298787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=28m5qJHxJ5Tg+COf1JCEhZftnpMn24hnH5Aw1jUzrv0=;
        b=dBSwxZBQeqy6OpitOeJt622C7lk2LLqGyh6x1pwXo7wmxXN83npLqicJUtE3Ht2yAy
         UdL3tX+x3QrgDY0sIhRAKUhz4Zh7p2TZr0/MOKEI03bddmC09kow/m16z2ODwnlJ662x
         YhUaEDL/CdM/swS56MIxFQ8pPhvHzS5q4aSEluMudMB2u1c67I3T18AoldwPrZ9a/6XF
         pKyZY+AiSLfFV1ETbhm3KWGwDsSJGaj0OJc3TVOvIw3gCoYAiC4L6B3Rl+KMYJSbeOtY
         MhcVWiELGYzAxTvEdfhMM35pvYFdCzXDJmSn7xMPU64V3lgdV4c2IhVCDlTkT8V9QpQN
         YMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781693987; x=1782298787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28m5qJHxJ5Tg+COf1JCEhZftnpMn24hnH5Aw1jUzrv0=;
        b=q+MTXW8V34jvRPYfbkJmXDQjEDgD7PWGcWyBxP/9bATt8+Lzd+2RNESVsy0dxpO2cb
         1xJEUIOznLuhdsmk6l5MYGuAZH+vpXvvMex4/BtTCri2A8nbXKeAnwDBm90jpAzQHvDG
         ADMNJ57bJo/kQ3L3M75mhlJQLZVzVI+rZi6m97KObxrCqYS68gO5A7cJ0CA+D88Tuohv
         +/gFulIqkdlNydAvwpEDB1D7D93zcxw3Aa0zwNMj0t3vXRShzJVYQ970G9OFoVHfJprD
         PI90n7y5buptNIq4EaxCCAhu8iYOaZqcUQS50oqxtNBNRmMER+lKAdCPDIovqH6NjUgI
         O6aA==
X-Gm-Message-State: AOJu0YzN+q1btWNGRAkGjtw4NrEXlUIlTYxs1kuhVPfV00bkgCQ0Mcdw
	9V2SkyO1PFMUCdPq8FvaSS4b/JmPdr6FenC7cdp3r/U+JJqRKrgPVtWsnsPm9IRM/aHaovUwV9P
	Bx+Di0mQQbTuk8BVn8zfaVrht+nq4NNZJjNMcsL6Rrew++0QdtXu+E9hXfpMUSG2EjfTE
X-Gm-Gg: Acq92OHD2UoOyxSGMaygLLuFgdQkuV1Iwia/EeG8B/NaJI/RV6eHMcBScsF7p76+mky
	vQz206I5wh/wUKn3xI4bondPJs/Fcv4Sxvc1zQhkIPpl2TZTZOjrf00kIQKUIs2g0hNWBJEpdF0
	tEjdEElQvQv8gr0RCaWK5g6fLGg7GqKr7MS2P6YxDR6TnmLJk3a41QIp/SAfgAus8+stN0foAPB
	CAIv+MRtaAGhoUS4ke/tcrM/kITi1ovpUii7JG6wZvQ7DydvaRf+IOFPQyHVF6y2QU/oJzdcybQ
	g91Yt23S4zu7hexn5lKwAwoFn5WEwljK8GACC3fmizpG7ZgCLwgevDgOnYQAMcCekeuOF+fspMP
	oll53Bkm0pMdV9RVIn6a224s8UID7asaj0z4=
X-Received: by 2002:a05:620a:bce:b0:8cf:d953:b4ec with SMTP id af79cd13be357-91d8acdc2e3mr362783485a.3.1781693987624;
        Wed, 17 Jun 2026 03:59:47 -0700 (PDT)
X-Received: by 2002:a05:620a:bce:b0:8cf:d953:b4ec with SMTP id af79cd13be357-91d8acdc2e3mr362779785a.3.1781693987028;
        Wed, 17 Jun 2026 03:59:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8341840sm791241866b.43.2026.06.17.03.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:59:46 -0700 (PDT)
Message-ID: <ff8c29a7-9b45-4ec6-b10b-4df93f37ba92@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:59:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] spi: qcom-geni: Use resources helper APIs in
 runtime PM functions
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
 <20260604-enable-spi-on-sa8255p-v3-3-43984eac4c67@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-enable-spi-on-sa8255p-v3-3-43984eac4c67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w8ieJNd_wfbbWWBt1T3jA044demFWhg2
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a327e24 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KDfMXkAB15iQ4YLeNhcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: w8ieJNd_wfbbWWBt1T3jA044demFWhg2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfXx9M+50vCk2p2
 D02jP34JCvwF1K889lzmlPWqVhmnfMnOjJNTVtWKia2pZatUeJa9/AMEldBVxuDakFCzl3i8dd2
 vfUI1meK9r4uI9+X0BR2mtVta70XAY0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX7xG8ODo2wZrA
 5RjaJmBqutQeBVJKeiZv/yCaomZt0LdsSPiG7KLzVnc489clctyD4n0BmjCGd82vXIgre6GJahh
 pfQSKSKF02mIG4jabgdeshzhS2dZ3PF/XUlCE/2gt23irAHc1vsrDMP3O7mcMtZLjXrDLGTx5Mz
 zvylNob7LemxciJ4U1R1q/3bVFggA/W2yGjI2hf4Lj3dzA0BgjnLvwp9kaPYPq8kzGDPBe6pFcd
 GVKciLwfCWrxhZuwcZLk3dK22CNp/gewPj1mn2eIUzQVP1dkwiaSt/luUZZeSNLHtwDSPkwTiLE
 F9Ivb+GMnhx2caNkO9ICOVGkJbeTgoN48ecat9qri61yZMcsc6WweimoBNyElbR4e0K/EbNZ8wK
 vYgAffDc5C6PMYKvOFkGR8iiTL1+iibedvYgBeERgzSY013U4+4v/suyNVe9YdmHUGycyEGFFB5
 A94qWIP0dL3/WspsGvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113607-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0662698C82

On 6/4/26 8:50 AM, Praveen Talari wrote:
> To manage GENI serial engine resources during runtime power management,
> drivers currently need to call functions for ICC, clock, and
> SE resource operations in both suspend and resume paths, resulting in
> code duplication across drivers.
> 
> The new geni_se_resources_activate() and geni_se_resources_deactivate()
> helper APIs addresses this issue by providing a streamlined method to
> enable or disable all resources based, thereby eliminating redundancy
> across drivers.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

