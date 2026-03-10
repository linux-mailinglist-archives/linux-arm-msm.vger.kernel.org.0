Return-Path: <linux-arm-msm+bounces-96632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NvdNOcisGlhgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:55:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 282ED251032
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8245368DAF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282E93AD525;
	Tue, 10 Mar 2026 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZMHgcQs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JseJ6QNU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879413AC0D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145663; cv=none; b=MFiJ382pcCoD0s9qD4LOXuS0aP3wuyKg1V2AhO3JVWLw1m9023h1gndbAdBQLqqB1RUFz/JCGWSzpOREXF9EOORuGoFu5MKVXySuLFYTp2LMgr6f1WndvTH0ccnMw7FCU1RURJ9/Ytn0OZY/Ds/qCtRzyxxiqke/03S3h6wPNvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145663; c=relaxed/simple;
	bh=8Upy1cHORXDNFQ63wTwBurOgO3zyTLSCnEIJO3Ampf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ts+JOMdJSrinuAA9ZwyQlYvH50jpgn+fR20NObf0sd+1kvKdGV1ow3RNHuIK1gHuaU45XkFfNbhq61QMyFmrAIO0eoll947sdPI6N0h/xLIbujFJi1qs7Q/+dpRwFHMMF9h7e/0TLT/G8Fjmg/7FZPC/CQwQb7yVTxNinlB+eLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZMHgcQs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JseJ6QNU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AB4BlV1442677
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/UGlNQn23sYU5tLZJ79XsnEcLyxrZm0JZwaMD0J1PA=; b=LZMHgcQsjuODNi6T
	tua1ZEJtrvSzgj1XR6TUb24ExqCyLLdZQtiBSKWVLiIDXw8U6AHk0eOc0o3tz+Vp
	+7m+NlHnludGjjNOOWR6+gylCYc9LfRsXGoKcuVinaHYgAwZ+d9zVlTbVB6ibcTR
	HuJgGxwT1w8BlbjORaUe2bV0r2evfQn+fxOXuYXdXiGyKEXT/l8YkL/cqe87Wmi6
	KCWKfAiMUtyS3T661X+5ylPCy3Wp4n/X0byIX9aav3svy9mNBuznItQSM435hmiG
	b+ONH2pz9B6ZZEl1yicNcVvEbkHeGO0tnssUw0AB5P6a2n7S6W5KM5fhe/YGqln8
	UhUeKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8802eyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:27:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd93c91075so64055785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145659; x=1773750459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/UGlNQn23sYU5tLZJ79XsnEcLyxrZm0JZwaMD0J1PA=;
        b=JseJ6QNUBD5flhODwgRFgaDxyAJQeKjAll5Ctf2l03oN/T3XjWNov2x5Rko/ma6lB5
         R5jbxQJ9SqnjJWXztfH+8jHSq98EbjRAWMjr/Uv36yEpIaX7a5KygfJDOhQdwti9I/pB
         L2ZOofMrpVFK0TKe889uPQydnzaFBUnk1GdiH+TBCLhHSZR7Yt90z58710zefdBOsXMD
         JKU07IY+Myjo5vii0R8LSM/lPDWe8qc2K7PorLKscEqFt9qjOZ5NhEUxdSSPz9/JeBka
         CN+JS5NFJN1HRZA1SYIlKJX7N4z3m6pz5hdy7M0TboN9VrjRzBgT3Lv0yu5FRQdBsnwE
         w6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145659; x=1773750459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/UGlNQn23sYU5tLZJ79XsnEcLyxrZm0JZwaMD0J1PA=;
        b=m3AwHtFk+OaVHGSYvcL+ojVoNhX3ZMiFaGfvDYKcaU8VujI/LDxEHxkLu6mJnY9Omz
         eEroTKpLLniowU/LRqlXBkvCUW9cw9MgSnSX3ksRYJvVXPSC9A0MLkox9ZkZKyuzbJ4n
         UXot8NpFGqoiXzA9NnK6nVkisi0Ob74Xj68NZDfwLr/kvlSYdGgKwYrvB54NnKIhTZjE
         EQGEI5bESH1t74jdPwzMVDGaUh3BihmglCTxmmmgberzk1t1eFLWxFHivP5FwKlC5rGr
         JZAQOSx5JTpIS8AMD8xKs0vbIZ2yQvh5i7vo7cbdN1Khz4S0+usKgxpSE/jyb0RTL+8E
         iWOg==
X-Forwarded-Encrypted: i=1; AJvYcCXPElbyG1Oq3UDz2QSRxc5eEVKZZ6hWTsDG13WjI4yxVhHnmUjpTDJD7q1r0dt7a4A01KyihLbb6Xpk/USN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn6tWafY+mRXfxUkxpDAyZ31fqw90BhK6TqoxGskYc6NCBNzFl
	yba/OA3/U5PWaBQghcdfWwFTduiEcQui4t4oKHhqSQww9XApR1XIVCTdAgL86z1YIsDvbe4So8S
	to58oNQ67CxhmkUTT6M8HsBJfH6D0EPpx4FH9Au6qwGsEOY1LnbR8Bbfulf+4hUFA0Ymm
X-Gm-Gg: ATEYQzxRcj0G7Q82J+NF0j48Y/T4IXmquZ85ieq2yjZkMRzXumks3NW10zAj2iWvlHl
	dLr+h5P1nShO3Anq0lWYyWDk4FviZ6JdZ474Wlk5ZZADch0GP4PNoQK+94MFlxco3QnuaQzxk3p
	c6qkK6MnpAitgauBVOq2WyaLmmySzTFjOByegpPrwXjgPlaBe7ZXxLb43/gV8Il/70Cr0kLdCAj
	d4QRontGvB3BaiQOdcDifDSrvB3+JhObhDK5xewIgLIkMZnol9gFCCAHa4/XiHK1JQP0cn0KZ8I
	AQZ1SMr+XRvsihAsUMw7/5yO/HnmVpPV3BV3qLuJZBFbLGFRJszyo0ef+hazZl8NDEFJiEah9nS
	cpfxdJeg6G7d6EWcE5SkfoGkLWhC0Ql3sxOLn9bS+XqghZYAWNh8UB0unUqSXAo/gDxnjMic+Sf
	9odZE=
X-Received: by 2002:a05:620a:1914:b0:8cd:8751:2b19 with SMTP id af79cd13be357-8cd87512f16mr725002085a.7.1773145658844;
        Tue, 10 Mar 2026 05:27:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1914:b0:8cd:8751:2b19 with SMTP id af79cd13be357-8cd87512f16mr724999385a.7.1773145658398;
        Tue, 10 Mar 2026 05:27:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f15c23fsm482138966b.49.2026.03.10.05.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:27:37 -0700 (PDT)
Message-ID: <257549d4-b582-4b40-86aa-62a2ab68037e@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:27:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pinctrl: qcom: Add Milos LPASS LPI TLMM
To: Linus Walleij <linusw@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
 <20260306-milos-pinctrl-lpi-v1-2-086946dbb855@fairphone.com>
 <CAD++jL=6Ns=OUfE4YAuNzbvYxd4fc5BqiWjWWFCs2OaALdBnfg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAD++jL=6Ns=OUfE4YAuNzbvYxd4fc5BqiWjWWFCs2OaALdBnfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwOCBTYWx0ZWRfX07aFpzd8OVgw
 1rTCEXgm+QvkAoIXe3hBjrEg4HXIKm9E3Y8Ha/BvbPf+XmBGqjh4uc6jtnPiY5xQ4dXPmB6bJ80
 Bt9iaWG5htkzBOKevB5dVwXu49iD8M6KS6tDxO0yWrMzLwuubX+8QpF70ZX92LOc0ijAtWWP+R/
 nuBD9O4gYi0mwuwK+8C6oa2d1tH4lUSS82TbgKLrprEVU+4g/EQQgIoSdO9TPLVk2wO8xeknZRD
 r8YmNUebW6JY+1IFbwmU0fbNi8rvJ2fd846/HKcgSxuk/bu2stNRzB4FuXtC1IaELgqIouUUCNb
 mswoZSOqMKFF/esqW8ItpB4d1Sg6U39CZmyTcpJs84dUznkYSgFI0vQmZkr7QfCZUIg0Uk0VJD7
 vj1bB+543c8j4zwvqGE3wjYMP+wZvibZv6t5hobkRF0uMOhEyKN4xJhE+FTILhlnWwffG+6XFNA
 fhDdCiEpiJ7TXeAvZLg==
X-Proofpoint-GUID: vCBjV2wZwMGrCETGWtfjJah0x_NFveEN
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69b00e3b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=yMsay90vpbKVJel7XqsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: vCBjV2wZwMGrCETGWtfjJah0x_NFveEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100108
X-Rspamd-Queue-Id: 282ED251032
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96632-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,fairphone.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Action: no action

On 3/10/26 12:28 PM, Linus Walleij wrote:
> On Fri, Mar 6, 2026 at 3:22 PM Luca Weiss <luca.weiss@fairphone.com> wrote:
> 
>> Add a driver for the pin controller in the Low Power Audio SubSystem
>> (LPASS) on the Milos SoC.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> 
> Patch applied to the pinctrl tree.

fwiw:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


