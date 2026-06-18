Return-Path: <linux-arm-msm+bounces-113696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uoLTNoqbM2q4EAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:17:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E2869E074
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:17:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UvtMUwOx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jnbnW6cH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113696-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113696-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC7FA3030F67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 07:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860833B774F;
	Thu, 18 Jun 2026 07:17:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F853313E1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 07:17:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781767042; cv=none; b=ndU3WpTQQ1TsGrVHd2oxVNzQNtFlKgPHDjnVPo6m5P/LDecvqd+HpNHnkhK5Zy0wAMIXYKuVFpOm/5gkjhamhPnrO1+/xePyVkTw4p3vTge7jUFeSEqLfYsY1vh7dE1GweceJFh9TjNHXtbQBLbEB1hV/wAcqG3kAgkQX3ZqEEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781767042; c=relaxed/simple;
	bh=8E5qzq+mZ2iFEEVvuk30mGz2SpkrQKNDsaBE7t3Hf5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eF6BwOuALPyZlRZCC/y+2MRKVFYTJWW0W1AjVIU6VOffrTIwXI+npZK4UprwlL/o5d/gbJLS2/erNGcW7cOtG0/Otc+qgdPen28Kn87SmMGHNdJx9oUfq5QKbBAqlup2k07+wha4Kz4d7dRnUdqCtxgSn7HpY/UHD/YgTrCGAwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvtMUwOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnbnW6cH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I5xnd73515517
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 07:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7cu/kThVOp61khadvlTa0ooRt2HujLje7priNd4Ua8=; b=UvtMUwOx+IBw1L42
	6Vx/3Jt9wIEbq1W3cy4jzghi9EIUr2I98o1Xip77t/5rGDmy+0rPIPGnnoOBxFy3
	qKwdu8vlJI9GNln/DNllB1BVC4bQneecQsvu5yga0JMalJHqFQl/DAxiFdn5/3Dv
	VxE/CgMDGRf3OboxAgtogVAfEC6aK5EMUvpczIzOV/6QYcGVhimzs8BhiA2NEU0F
	fxwQaWLSHz6oFLTc1SSzV7P71b03lf8Ds+BrWr8+R+rI1EjGDGRE9c4+j8zcUfGY
	V3E2bkE0kd7GkIzYmaHMk4atgy5EEwF1rjxTMsOthHZScdWFnvMZqxRNmHjVlyyW
	7cVCmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc21j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 07:17:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157db42dd8so171891185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 00:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781767039; x=1782371839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7cu/kThVOp61khadvlTa0ooRt2HujLje7priNd4Ua8=;
        b=jnbnW6cH1RgWV1PZ+30mJFAje1p8AIFn+pADGWPa7E/Z5Orkhe7I2cxQz9K7VxsScs
         OR813jxRuYthujfop5Et1V2D9FV1sfFmX61B9qcgcr1MZlJ1jdkh/0E/8OIMGnpYVeBy
         sG+FTnNL2ONH2xQouxQF09x9nPjCsLwhNJ4pyL/Rsb/QiSe/QLA/ftFdmePrtbYBSt+r
         zGylPLFF0/CcvdKLHGs3FwgFmzOP9tFfbREV285oV3Q561MmE+X0oTTMWhSSQIv3E8WJ
         wTvN1redhyvgWZINzrZhpHfBdGiJ0KwKcP5oSg0P3tp2x1ZVvuNwBNiiNlUS2ucp6oKf
         ssIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781767039; x=1782371839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7cu/kThVOp61khadvlTa0ooRt2HujLje7priNd4Ua8=;
        b=evPblws1Zp8vncRH4xZB/keC1fnFD/DyJ7bsfuUhVFaxVX8RVKJkgllnjFuHSCJZ/o
         vdtAEHSsgEHI+fJf7suwOuWnDi+S8A2appQ6FITjdbbfqKXc+UWMHN3e7jHd1q/PdXRc
         zP1AyWnog5/MBkpUUCG5dBkp6ED1x7Y9h/S8LUOOS8caB0CDtQ1lDHmeJc7dcdQgb3vb
         fyeMEz1fTd4lHKpAQf4sFj1B0q0ZRROL2+IIGAprCOyVouvtI3j8Qg8f9wqcoYGc+gcB
         tC3dC2AV8+5hQMozxI0irzRLxyfz7s55K7oVvz03h10ycpw5ftKUrrdKbTfCit4pkGc7
         wPKg==
X-Forwarded-Encrypted: i=1; AFNElJ+JNBVpFMOllUuiIZADJvsr8hrCKgDy66tgktCmUVRZ0uKDmI1GYNizbmQPb8bE4W3rbV5qUVuUw841FrKP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2y1fdhaSTrmKCXNlQcPrY9oY+ZfjpBKTBtQwNQfDPqegdjt4h
	ZUbYOI0YYQdyE8M95lSw7JEf3hX/Z+DPBjWjuIoVv6stvNEbuEaLPgqaCUoDVuL/R1ZPPurbeJ6
	UZVhxOExp/SDdyeNooVhmCZHhk1qsfVTG1TdJtjbsT6rdsTKbHBHEB8QT6cp6bwbCBFzv
X-Gm-Gg: Acq92OH82aZrHsgcleN1zTdA+q8o2r6PV62YCiA914QVD5urw/CfWzYjK5Zp9lVk8R0
	pBetHB5ahbWz4gpq5ZTzPPvzDZeTBmYoy1rRg0fAU1o9f4ibNBh0MKzQfnEtoCwQs8Cd4vbB8B7
	TKeMNO9IIZb6En6I+EdiUBSWcCz+QfXsDgf5Ss2sA8G645vmFap/RRIib9H4k7dwN9aoqWbjcPf
	lDFfmuswscXQsqhTwt9xq8CErdErnPLagp2vfdo6wkrUjl4ncQAB87cbUi67jd2GaXTFo2ZLN71
	qI82YdV8Gsxi/Fm+PqWLRFopf7mBTSw5+WWS4hs1aa/irIrmILL/9tOA905qzs8UHfkZjdJqgyI
	l0YXfbKBmqkRgwl8IJq2hHJ/uZFeZ4dcxozi2ZtVGPgOi1PVM9AuZs3sTpmxC/opfRYXwVyFEHA
	==
X-Received: by 2002:a05:620a:4722:b0:915:8502:f808 with SMTP id af79cd13be357-91f27600dc1mr350113285a.25.1781767039527;
        Thu, 18 Jun 2026 00:17:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4722:b0:915:8502:f808 with SMTP id af79cd13be357-91f27600dc1mr350109585a.25.1781767039081;
        Thu, 18 Jun 2026 00:17:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:5ac4:8c5e:b742:f9c9? ([2a05:6e02:1041:c10:5ac4:8c5e:b742:f9c9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm55095264f8f.25.2026.06.18.00.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 00:17:18 -0700 (PDT)
Message-ID: <61765401-3397-497d-a0ca-e9bf9d76cc6a@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 09:17:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <c32e263c-ba4e-4899-a935-e129de0f1269@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <c32e263c-ba4e-4899-a935-e129de0f1269@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a339b80 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kCrNj1x4bCXofucgv5AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KmK_8UpA4cLrZwoLAnOvVQ0MIPN3c7iY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA2NSBTYWx0ZWRfX8z0wlHZXLjhQ
 8WNWx2f7dUJ6+ku9pfRk/nbNv3R7hYJLxcgAYwcnL3my2EvknlYSp6wfDxc7Fotn2insnx22Y4U
 u27UsI2WYyZN4G3HqKWrG3d5R2u7hCk=
X-Proofpoint-ORIG-GUID: KmK_8UpA4cLrZwoLAnOvVQ0MIPN3c7iY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA2NSBTYWx0ZWRfXylP1sySQeBBT
 VRPjrLjUg8NFnszR/1LgzLLpEZgt21XYCefS3+NHggwYsCx8KqMjOAGbZiCqlxUb/01bti7smpE
 QFRVF5kCZA5sX6tKafMbGv193Yuuhjm5TFUOQlBeOublKjmNPwd5pX6M2r1WWZ+a4VRgzbtVIIW
 bq6GQFEHwAeMldWoygwC3a+16S1YpY6Tjasi1/gcnMXzsrmoW5LGKzQa8BhUZHIVqLjtsAw6b6D
 AAKq4F49YnyIvCsokywAPDxzh5+eUVszWOZWSaKodmN3AdvN51kwXOio86LO/kD8/V0Xh1yFIh2
 Tej33IgtnjqVHbu586SQdRiMNcnE/nFs3BnQ0735x4IFq3rrqr/MoJrctGBYSweWkiE+gW0aE0b
 U5iDDeLdyIF7EwkgfqTmwH7JK+d+eAOcJ4457Qa6R6sVS74AZa79lP8bQzqgknhPvS69WK/LS74
 h7Xh/to5WmXjXOiAikg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113696-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87E2869E074

On 6/16/26 06:21, Krzysztof Kozlowski wrote:
> On 15/06/2026 14:30, Daniel Lezcano wrote:
>> Hi Gaurav,
>>>>> thanks for review, shall i use driver data, which is basically pas
>>>>> data structure like below:
>>>>>
>>>>> static const struct qcom_pas_data {
>>>>>       .crash_reason_smem = 601,
>>>>>       .firmware_name = "cdsp.mdt",
>>>>>       .tmd_names = (const char *[]){"xyz", NULL},
>>>>>       .num_tmds = 1,
>>>>>
>>>>> Is something like above acceptable? and this will also help to filter
>>>>> tmd names as well?
>>>>
>>>>
>>>> How the thermal framework will bind the thermal zone with the TMD ?
>>>> (node pointer, id) ?
>>>>
>>>
>>> Hi Daniel,
>>>
>>> thanks for review.
>>>
>>> With id only, in this case instead of taking tmd names from device tree,
>>> qmi_tmd will take tmd name from pas_data(driver) and register with the
>>> cooling framework with id only. Please let us know if this looks fine.
>> May be I'm missing something but:
>>
>>    - The QMI TMD returns a list of names, not ids
>>    - The QMI TMD may return the list in different order than assumed
>>    - The cooling map index points to the name of the TMD in the DT
>>    - This name is used to match the name in the aformentionned list
>>    - The index in the list and the id in the DT can differ
>>
>> Krzysztof , I don't get why having the TMD names as properties is wrong,
>> they describes the existing TMDs on the system and the cooling maps
>> index points to the one to be connected with thermal zone.
> 
> 
> 'xxx-names' have a fixed meaning in DT by convention - assign
> identifiable strings to the 'xxx'. I miss the property 'tmd' in such
> case - its definition and meaning. Where is it?
> 
> But maybe you just want list of strings, so I am open to discuss it - I
> don't understand the need for this property and commit and property
> description tell me nothing.
> 
> Really, this commit message is basically non-existing. It explains what
> it did and provides that much explanation WHY:
> 
> "- tmd-names (thermal mitigation device names)"
> 
> Really? This is the explanation why this change is being made, why this
> property is needed?
> 
> So sure, describe the problem being solved and WHY this problem is being
> solved that way. Maybe it will fit DT.

Ok, I understand

Let me try to clarify.

When the QMI TMD protocol is initialized, the list of available TMDs 
provided by the service is requested. They are identified by a *string* 
not a numerical id.

We can not assume the list is always in the same order because the QMI 
TMD is a separate subsystem and the interface is the protocol. The 
protocol does not refer to any TMD with an index but its name. 
Hardcoding an index here is not possible.

The name identifies the TMD we connect to and in return we receive a 
handler to use when sending the QMI messages.

That is for the driver part.

I understand for the DT, it is possible to not give the tmd-names 
because the it can go into the driver's data structure.

But the thermal framework won't be able to associate a cooling device 
(one TMD) with a thermal zone because the cooling mapping must point to 
a cooling device in the DT.

Initially, Gaurav sent a description where each TMD was a child node of 
the remote proc node. And you rightfully told us it is no longer the way 
to go as stated in the documentation. And you suggested to replace the 
child nodes with an array with the tmd-names and add an index in the 
cooling map pointing to this array.

The thermal framework has been extended to support this new format and 
associate the cooling device with the thermal zone. This change is now 
upstream for v7.2 [1]

The resulting implementation is the driver gets the tmd-names array 
property. For each name, it connects to the QMI TMD and register the 
cooling device with the index corresponding to the name position on the 
tmd-names array.

On the other side, the thermal framework parses the cooling-map, gets 
the index and do the association (binding).

The tmd-names array property replaces the child nodes and allows to do 
the mapping between the string based identifier with a numerical id.

I hope that clarifies the approach.

   -- Daniel

[1] 
https://lore.kernel.org/all/20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com/

