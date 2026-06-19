Return-Path: <linux-arm-msm+bounces-113850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LZzaBZtRNWpDswYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 16:26:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 650CD6A666C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 16:26:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UFfiNbII;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D3wm9oOw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113850-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113850-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B090300FED1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 14:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF3A395ADE;
	Fri, 19 Jun 2026 14:26:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBF21E5B63
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 14:26:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781879185; cv=none; b=OHOsAj1fpPitvHsj5i9IAM951I99oH/MA3JQg5hsAO2dObtulC01h+HX2JMn5LdTQGiYYwBx/OEHH6lUO0wH/kOirDCiv9MX6QOqmrtClCs0Jk9ZUNgOluURj329uAKYy/CHBWSHdyG92pT1RVg8Z2RThW25wjCnBW3LkyzMrvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781879185; c=relaxed/simple;
	bh=egm6cUnjrRwhkBM2NOmjdLhTnnx59v551kQr0aIjwNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L8O1IMn9RiZzlyb4hfcJRsgOtaGiYoFstJmhTsAUD6VNFKspeYlc8ElB4zZlmqJ9cennPTifQ/oRWJla5f8qLLZW6LLc2G57kenPeWaW8whVg9SFSGfkfUJDMtuFKEpdC71wAVbP9zEdDCGz7eDds/Lld8Fs3DqlnraDxJdcWfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UFfiNbII; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3wm9oOw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JD9u6j209948
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 14:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BwcgIm8EDE/CcWVJa59n/Ut1MbMx3b1rb55Z5ug4nTk=; b=UFfiNbII9rEySUc0
	nSUAAB837eoTdL9VywEX47cPcFmvMcpjY5S0hfOophXaCUPvdbUHMRa3y99cn9gf
	lWqY7T3JpjwmhiHTRfzsx3Dt5pWCpE+GwPlb534vQi/fUa7ap/VUSRHm4dyB/T/T
	A5XU9gfYof0hBbvVNerkjpp3MjFsJTdiqd5ZowN82OX3dqd2UT845L8PONrEn3WZ
	Ju7JO7jrGKWzO8MzT1rZICX8wRCv6WLPhbODAlJgIr8WNUi6NNZ/t6YKZXDwU8rz
	Cap2cRPtsiFdEomLTC9gZhXtL8gnKJXs4j4pr90xCLAd5QUcSJS6beV7XNuCM+y2
	PrbYdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evy72hh1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 14:26:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-920eff1439cso14266685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 07:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781879183; x=1782483983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BwcgIm8EDE/CcWVJa59n/Ut1MbMx3b1rb55Z5ug4nTk=;
        b=D3wm9oOw2NSRwkkvm8GsEhcSo0fneBswdLbvn/AE6XPF7q4oyvaDQal+y+ajAsE0DK
         RpFin41/n7We9SAgr+rJo/V3tQlpejMZSO3DfRgM1cui6z6spytSUEZqCWUsRAty7iVn
         sf3uVaBq7Z1wx64KjeLGDsJHndJgYwLmgdn89qSJyBQkvV896d1o009rquPSmQfPYW9f
         1VYqKFTZY7UJBXdOjDfF155bcWJ7advCVEQW9A8FwYP2KWj1vVNgY/1nTAXJPAFCmf9b
         9un+Wh1EW9Su5+/ZCPZh9wXR/eci3/zi6QKIz6CeBRmLJyZzZSMCxUaHnsBf22T3RzdN
         q7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781879183; x=1782483983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwcgIm8EDE/CcWVJa59n/Ut1MbMx3b1rb55Z5ug4nTk=;
        b=r5vk4yDjm92FtA/TgWvJTb2kHAcFIJZO99HuHYjswKIdWQx6DQKbXa7R0Gkx8tGX2k
         cIIuApclkgVSDZQZuCWRJ6Um4ijYV/PWEOixeC2jo8b074NLQ0WQ/n4miy6popGoEGdi
         uV4AmmAxdc4HGzjKpFHHyjXHndMl3DcaVyV1CP42/MF5KP/AYvHJblFVo8rH9bU5vJx1
         cCZTPh2HBY4f0FEjYx8X2aD7fEf4vW4NVSsvYAPsSZtzEWhxgTRdDzx4Zow9AzjVOAxs
         y5OJlKVLpSx86ZQZbF9/pJDmEQTCtlBSl2RCtf36xc+RRiyn2ci/sHWx8Yksc7NiJLVW
         fOnw==
X-Gm-Message-State: AOJu0Yy0voVfLGyXUjeNiv3fNSRA8aE6nZbAE9odlZDdq5yPKUAoxy0y
	ka0QkqUY1IpS1fcbQKcBC37QxgQ6ZxufRZgOsRD7NLcPhDAH962oIlge4tZiYhha2TdvCYkbmIn
	SILLjgrly+A8Fdx7idbQmiKHsidd5MbImTzOJXdpPlzuYHjsYOZvfodkedwd2kcVQFAcL
X-Gm-Gg: AfdE7ckRQMTwGSeu3p/T6yTHbr83mt8RxeRg/gV/7STg24dBDOR5h60yUWnCoqhLb4y
	cFB40pNmJWFP2q/K/dyGw8IhHhwaY2lvVb7HfT2OvjYPHjiwx1o3JfWL04DPBJGHBLBEalC97aN
	0sx8ZD5JPcXTWupoyzspUqGKI/zCtCE2liKeMM/6wGnG6D8WAF+3rWJtqjgSTOJv1/WyvvyrF9T
	9itn/aWpfs/BQhbVQ6+Jryb6KUXelRIBBzhfOdVmX2pvl+vdNIPBH6w+6LznBXvCi1cbvqoJmk7
	Yb+AcbBtKWWVwsHTUtWDtzzGZSXcszRK7+FG9+UU+teBVtCGL7WmVZppjOZRxZqUqUlKCKBH65n
	kdjZK+FCzLo/r4aWi2qZofM/Mft+HTRLo6sk=
X-Received: by 2002:a05:620a:43aa:b0:915:86a4:667b with SMTP id af79cd13be357-9208d2fd9ecmr289401785a.6.1781879182768;
        Fri, 19 Jun 2026 07:26:22 -0700 (PDT)
X-Received: by 2002:a05:620a:43aa:b0:915:86a4:667b with SMTP id af79cd13be357-9208d2fd9ecmr289397885a.6.1781879182203;
        Fri, 19 Jun 2026 07:26:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-696edc75eb7sm939137a12.2.2026.06.19.07.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 07:26:20 -0700 (PDT)
Message-ID: <789ca358-35e5-4280-b759-c50bef0419a9@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 16:26:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
 <20260617-ipq9650_refgen-v4-3-c505ea6c6661@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617-ipq9650_refgen-v4-3-c505ea6c6661@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEzNSBTYWx0ZWRfX6FV9iYQ4hTNm
 vp4SB8MPHyixCRZ75stYJZZwkZmb6/xFv/LfNYbWN/wOWrSkP7neiooDrGUC8GmQ2Ns1hMYBs0z
 A79/3vZDeBK6YOS4rBGD63PiaEpx95vdFBCQUJ0n9pBzun1cXIgjXbJAzuLC7fHE+csMnnMoiTD
 ZK+tju+ty3mxXDPd9QT2NYxcrB7Wa4B3mIV9KgPUUYwb29QdeggtVZC9Z9faRYP8fad+bPZZHfV
 HbNMQWOQsQlBIRC51QytR2N+7Bqc+M3cUAuUkeHSwh5szx3YZNSx3vIvTuSwnBwa22dfU1XFABa
 8VHYaOEeJ+Ehn5GdvhwRKhBCacSPXlS8kosv51hdip2bKxipEu7iXAmJJSYBWwN95vhq6UGTvmK
 7AgSV5poVNJbHKC29vEhQDQemMA8deiHgfXtPWeiZVe9k3WYGcROiu3rbNxM2kZIybmzvbF/0X9
 LS6GEMN9RjKX59gQRNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEzNSBTYWx0ZWRfX1r1sxcpZhHiB
 +HqzWjr+1qMcwd7DcbxS6f3BNGkcvtgZjkMvJ55Xs6tUOmcsxonpUky7MNRYA4Fnjbw6XGmeab9
 XKEQX//6/15J/oD978j5bHu6jB+0CRA=
X-Authority-Analysis: v=2.4 cv=I75Vgtgg c=1 sm=1 tr=0 ts=6a35518f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TzvEKcyx141kUWjotGMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: qkP9PEIJ3YYr6UqCKiZK0ZmMEAZw5EC1
X-Proofpoint-GUID: qkP9PEIJ3YYr6UqCKiZK0ZmMEAZw5EC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113850-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 650CD6A666C

On 6/17/26 7:38 PM, Kathiravan Thirumoorthy wrote:
> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
> PCIe and USB, UNIPHY PHYs. For the other SoCs, clock for this block is
> enabled on power up but that's not the case for IPQ9650 and we have to
> enable those clocks explicitly to bring up the PHYs properly.
> 
> Also, add the get_status() callback to report the regulator status to
> the userspace.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

