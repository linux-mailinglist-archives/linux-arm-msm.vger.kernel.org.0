Return-Path: <linux-arm-msm+bounces-92931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP7/Dz4Bk2lr0wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:36:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5DE143098
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B725E301176A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162292C0299;
	Mon, 16 Feb 2026 11:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hap2aoH5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fm/pK5mp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13732D739D
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771241747; cv=none; b=rqTS0gHBMRvzei6GX1s28uE2OBfzEXHhHaSSciqP10PSa9dDQLCjjBYo7M35aB7wdfm4iVkdjMVUyG6kA84EqYaQpS+hMP7zilR/PDiTjbscHuv+aoIXPjEhJ5Oc/QEIx6atTHUIq1cC8Vkx4O/amD6iXUZ0TmN5tKPPo+r0hb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771241747; c=relaxed/simple;
	bh=nYJt3nonSAkhxW4kfykdt0no87GQsz/ae6dVsT8TU+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTD7rbubpu3jNO/wcxd38/+0KXn5IeMqIM+C1raZlVNSxQhx3oBqSlhUPA0hf3qYVByl0yL4C2YCEWeMaLpX2JT2n1hycUSXjl40Hssec0ldOXvM6O2zF3mBfTxTt75C372Lpe2Zgd+39KW7GhzBD0Gd1nQtTnMw0TS2tRD3jAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hap2aoH5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fm/pK5mp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GARVVD3022652
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZtakdhJxC8jVGSmY8GuKwT5x4ByVuAh4q4rzyIts8c=; b=Hap2aoH5ZNKAzJm8
	ON6FVm7QvJ6w9zzvIrprnxz8NNWlzgrW8slenGwUkqBJGX10uBJpsJd1ISQK6shq
	MXDMBn8kwh4+DjyZfJcPGIJjYrfBMV1pK5LyOXKWVJMct7eubxawdsxjKeJEVF3k
	6/RNubfdWOEC23vl5491C3TtmhvArtweXWS0HMJmCZOX9DaHt4VDmOypOJ5P3gbh
	bo77kgf5ujv6vc01OPsioGiQONkhrqtOGK+GvTBoQQphtHbHpPClWre+8pfryffE
	bQv9TaCFT1NVMrG9ZQGG/qyqyRnI0x1OOVQ2xZNCNkAlQXB7+fByOS2felJfWIlb
	Z4+qxw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4smd11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:35:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89496f5086dso23779056d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771241744; x=1771846544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZtakdhJxC8jVGSmY8GuKwT5x4ByVuAh4q4rzyIts8c=;
        b=Fm/pK5mpIG+XFwM1T3FEGNKOpQiXSwWqthrXco4NlJUApFLCaKuT1LpMNvmwFP45mK
         PQeFmyrB4De6QPY5k4L9NhmE0ypJ8Qapy3om5XDhXCi895gsfUAQTMAB9xxL9eYYHQBB
         Udg66m+E0VsnEwwFXdLVbbGirsMX9bGXaxOghbrsDGPkoYGwBUMiv2abHOD52Wpeyosa
         Z+57W5SvDK6bvw6hsDseTe1OCXtCFdxFFrK7qOIyk/QlUtFKk4r51AwhmfUHK5h1QfjD
         +v/y73m7hpyQ+vjsL1To2isojcdNHUfGTPD82yZNiAVG4GK8v2rQifmwLU8WssnLgnfO
         qDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771241744; x=1771846544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZtakdhJxC8jVGSmY8GuKwT5x4ByVuAh4q4rzyIts8c=;
        b=ZDdi0UarKPNqUpT6pMqxJo3JSx2E8hmpb/Uvgj3+3mKvXaKhrNT/S3e/30fMXfbt+b
         r2l2OY9hFQv9fWQXkiVF5bbvvM8NdMWf6Fww4MHgHoUhG9Xtxr7sYaXwo3HaF+ISKwyz
         oCbZo+FOLla8qgs1f1RO0rIhGdvX/zmXFDl91TOsBeguDdlrOPCMUYGukJe+gVxfCRHP
         GQnGiRU1yimhzs+uJSIGLHWmTdSfCw/iFypaFMDmyhuvX535b4Zf1u/HMuTq7/oJ5vwM
         cyciTZp/P/Pw/0DD4lODjlQFcLc80QN+kixj4KFW683PpOLcOvJ44NdhangyLntdlLKx
         Qejg==
X-Gm-Message-State: AOJu0YyHjqBl/atG1Z956wHnp2sl16qO7uARGszOqU6tOw/x285t52+P
	gb5vhJscG6OfEFAWfcJ41EJHY84gfi4NcO4nRVgEM/d96ujpAWZysAFz9ltB3z8V4xlBEzIP6Yu
	AjTtotbZ0jjxkWZsXhHGR/ws/pYVQ8aVD7bCHSaweroHXPMV5yZ6gZVN8tl2ipjG0bczf
X-Gm-Gg: AZuq6aLemeLd5prkcyGF/8E0UBa4FrlNLxGKfX8AKealx3r34wxJBeo8ZJH+tlbdSxh
	hDw9rSviTJ4SVbhslj9pULU7oyf+hd8P+ZD3lqR5n9/ZRthQ6Jt3SxRrEQ/ENIkEox5UENJ3J1T
	GJKN/x2NdYHqJn3/haJtM5FOmySGD/+cQtOGhtBb7hpPYEUARWCExNlS2IE4hbNEg/sI3cySvVM
	By//kkM5gzkl+N5aGgcWGjel7gs4eV4/v0lupVuh/pT1i0ketbN1qOT6rlIbbl5ozsDrYxJZ/Yj
	FIACdhIImv38zPDJ6HuKGwrDolW7Cc/2al0bRvPx1uM4vvNoxf0DKOtxL82+TV86K7FNO6XXEun
	E17SEtOvWJyA3fpxgkY8xeEjjFPVzJ9K0qeDZN0c78U5yVFZZtm0FcW/0ccpI1QXCZvPyVQhNka
	eViyQ=
X-Received: by 2002:a05:6214:8004:b0:895:4afd:5dea with SMTP id 6a1803df08f44-89734625af4mr108762406d6.0.1771241744241;
        Mon, 16 Feb 2026 03:35:44 -0800 (PST)
X-Received: by 2002:a05:6214:8004:b0:895:4afd:5dea with SMTP id 6a1803df08f44-89734625af4mr108762126d6.0.1771241743800;
        Mon, 16 Feb 2026 03:35:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7626bfesm242054766b.44.2026.02.16.03.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:35:43 -0800 (PST)
Message-ID: <e204b43f-ebef-41a0-a5fb-158d58d9bec8@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:35:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qrb2210-arduino-imola: describe DSI
 / DP bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Riccardo Mereu <r.mereu@arduino.cc>,
        Martino Facchin <m.facchin@arduino.cc>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20260213-uno-q-anx7625-v2-1-c23359616528@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260213-uno-q-anx7625-v2-1-c23359616528@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NyBTYWx0ZWRfX0UfFPo+pWVkQ
 7KHGMQjTQAINcOlEMkNr7LH3TGq3g8p+Se034wqAAafZT3/M2vApbPjGFpPWemo2fAgnje8d6gZ
 HVTlIPG26nQuhqQaMmFfLiByfoCDrqtzjZMRk4HjWzuUae4ZkbgV5+voFB4vt/fsyER0D19eLdl
 9x2HzwazvBVxoDUS09pSH6sTLSH3Mml81wAdMU7uCEyVav//tKqc4Hl7BxWelvO9zTN1t3WMA3j
 y4Z5NmNB1gNeRz7s2g7dsHwR6SsXYf7KjXZiBJOOLSj/Bd+HsziVUoQ+VYB8sjH28eQNZtovJZW
 BSLizCz7S7w3ZQXerRciXCfUgB4KKOvh6Vo1ASae3mo63nD3B8HBI2hGi18yLnzubpb8OckQw7z
 fZk4W+VqoUIm63syyV9TsuSj8D0g7qrAsAs0AxS/yH2bmcAtsRqg+XOVM9BpgDcU18LncBAXzWN
 IfCXZ/lJ9aS1wrcd5gg==
X-Proofpoint-GUID: QW9-H7BpCtzBncmZqUeD0s9Bzv3dOla4
X-Proofpoint-ORIG-GUID: QW9-H7BpCtzBncmZqUeD0s9Bzv3dOla4
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=69930110 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ZvGL6e6JV_seYosCAm4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92931-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arduino.cc:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF5DE143098
X-Rspamd-Action: no action

On 2/13/26 6:25 PM, Dmitry Baryshkov wrote:
> Aruino Uno-Q uses Analogix ANX7625 DSI-to-DP bridge to convert DSI
> signals to the connected USB-C DisplayPort dongles. Decribe the chip,
> USB-C connector and routing of USB and display signals.
> 
> Co-developed-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
> Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

