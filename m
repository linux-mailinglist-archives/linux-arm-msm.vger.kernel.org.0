Return-Path: <linux-arm-msm+bounces-97001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHMiFC5wsWlVvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:37:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD824264AC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 805FB3078162
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7E131F9AE;
	Wed, 11 Mar 2026 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A96sFMvj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PRI8blNp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149FB31E846
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236109; cv=none; b=rkgkJWnfz/zbhxOx01SIcnt5JFUShyT4M29TQofp1Z9BB6+TMQUNgJ5O0CqH5mwqUkA8OE9tz9myZWJ7d4IQHsmPqJkRi+Nf7RD2wF8vKgl4Ui3WCuuzZEDjuaFfLZQU8KXEv9UPduCSPweXTE2yHLmz7e37TeWbAAhDo0U9oE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236109; c=relaxed/simple;
	bh=lzE2XvUzcPOWsfSI2pqHRV89PTXXp835ygfEUCxai3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLdG59q+PXCoCC9cigEY5XLZAvNDcrNyU09+XsKxVv7hbXd6kFYlFyuAIcLwwU2vUt2SWrLjIMMAGgJX9nN/+gbv/WDKKNYgC9JvRYa/XEYwkaUjsSo5iGHncFpFhRmbVMz/BE0dh38QJwvGCl2vCszCBVz8TC0+DdKRBAME7Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A96sFMvj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PRI8blNp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BBhik02677054
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LiZTOytwA8lD64Th+156iID1ku5sRj4eRSFMCPKUorE=; b=A96sFMvj0yVTWhES
	CHLhKDofbU06USkWwUI5DIIBO3ejnA5aR13VjJSrO9Vwo+PkUg7jC03j76JX2y1U
	LxO/fPC8k8UFDHOvYMEeKK2B+DAzDIa0VrJJ3vAMNLwQY1AGTvb/s69RksFSqap+
	NTIZRfYPIMfa7ZB6V315P8ZXhRl6jOfBx8h3RMOhYKtY/umgmIWWFEO3JUDVFmKI
	g6g8WYMTGAmQmkODefjXbIcPW8De+S+nzZkA4wKwsCjTgcrugsRPmccl3cTt2a3S
	pi/yLmsJvQaZGWFKNlJRYpmC0I2RenIM37LlCfqsOBARGIy4Tfm+WvRHGVTKpAgg
	389Edw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd1ha8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:35:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8ea43d4eso151866585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773236106; x=1773840906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LiZTOytwA8lD64Th+156iID1ku5sRj4eRSFMCPKUorE=;
        b=PRI8blNpc5l9kGmnModknsTCHcQI9YqW+MjSQTfnKHq7oZqzb2zahqEzaHKl+cl2cA
         c3YIds5H+ViJ49woq7Hgb/srP+WOxbizMSSZqwgZQ7mYQ2tqK8XmkBm2RYSinRGvRuB7
         fHQDJtDrrCfvZYcPe6gqY54WFPJ9R8Bm0r/a1qT0a2n7Bxy47C0EOQtn0Gp4MTNFM3kJ
         v6kQr02IRXMcBpzi+do4oKeibqACs/BFpri3N+63JVMyZXr2sbgMm6O1c5LekD3g48X9
         fh8l1jCxhJfRSzwUW6+ewQqeGu3Vv/b6JT82ebghjo7VbP2WXamZstX6NfHEzOF7wMlE
         8Y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773236106; x=1773840906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiZTOytwA8lD64Th+156iID1ku5sRj4eRSFMCPKUorE=;
        b=aoMNSlB/8+gYQYUhYMj/OyJoVjYpvUIT6PYtUiPtk+jGer2bl9hNpmMZDP1/zaMhPd
         RxdAKkY/ByYGTvK2aZ+SPGAKNN41LMiWFGJgBnWrElEzVIOk239kG6GpxfzpplPZiqbL
         TfRfNgcz8Hbtq6JcxBUeEaM6OR8vZLJEYYPmOcynOrWA7/NV0hnShFfAuc5EJaGJjp7K
         51BGScqV9Ok/ai5SMBmPok7Siii5mtnJyEEsxa1mXAj0A5nwuj1PFs6xerWvvkmplMkK
         vv8kjt1CypwHpJo0z4Bgmxq9d+kpxqWHz1JJypD6np73IZ0XccJsDKxw9il63onhbv0v
         kn3g==
X-Forwarded-Encrypted: i=1; AJvYcCXnMY5+5Mo5Vxhh+vInJ8R0KL1CApI+qjy0DI6zAitPtaTLf5Heng0S2l10lX34cooQjcd54PUt1n82if4T@vger.kernel.org
X-Gm-Message-State: AOJu0YwRXKSLbW3f/sz91Ai/pH04xFy1fm3UAYleUtx0Y+mbWunfbAYo
	a3GHWSTGcS51i3NDGfjarJfHuR+eYXW55aSBL7yissBpQ2iG0LgXqZ76WqaV+7+LC5bsmqQ4WfY
	7vAokNqK10CRCCEz4p5a2g2pMys1mXLfoiEVUEBOqW3A9RyVT9JBxXh6Tk68SBLSZnqGq
X-Gm-Gg: ATEYQzwPDCp96k34jQGa4WBaJvVsVIJur4FPNyAdls+rpOvV2I5xu7KylIYYN80hJQn
	l9WEQ4btOxNxm1ZHyVSRlI+AVUPHQKRG8md1X+VzsWriZc1brDh6y71yJqV9D/4TbLOTziH6oqV
	Q4YGkCRiGJNJ8sR4IQilCdXal1ZJ4MADFd3cdpJ4UtTlBxHBmanM8BnBBvlO/59RQoyz8fxmEI5
	gZfNfzZDHhr8KcSKEPvv7QSCmz82HNN6otdjxTW9tnF8jSKkEBiG5vGeO1LMwWM7upPbZTkPd0q
	FQQc7yvExKjMOcuzutZXVeL/+vFZ5BX47tWX/JEvTXw1gf49OQ29yQuGsOxMTO72/ezO4H/RbqC
	6cBi2sg8FRx+7+kOftnp/oe6t9RH6MEUdT4Tf2hdYv22Kn8Is8Qx+0Z8rv9AND34X0zUi3VhE4d
	ADu6g=
X-Received: by 2002:a05:620a:4690:b0:8cd:86a2:340c with SMTP id af79cd13be357-8cda1938562mr249671785a.1.1773236106288;
        Wed, 11 Mar 2026 06:35:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4690:b0:8cd:86a2:340c with SMTP id af79cd13be357-8cda1938562mr249667385a.1.1773236105745;
        Wed, 11 Mar 2026 06:35:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6631532db0dsm540937a12.32.2026.03.11.06.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:35:04 -0700 (PDT)
Message-ID: <d83ed736-3dc3-47bb-8760-0ede4a142626@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:35:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/13] soc: qcom: geni-se: Introduce helper API for
 attaching power domains
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
 <20260227061544.1785978-7-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227061544.1785978-7-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExNCBTYWx0ZWRfX+3yyUDMsymgT
 3bgmc9U2jY3m/NiDos4RzZdL5dcLWAA2RHxzhQ7HNy4VY6KHL6RgO9x3bFH3upXTuDX548iRBPN
 VkLJnI4Ww5UbQKgRPdr3a+gePtIoWr7w8bGdyhOZAmtJGcCU6Ukju8cyTHXMadeB7501Sh26d2R
 zQ/nGyW7DJDdq+u5U3k/m1qIFeuF0+FEixcpviXIHwHK+7f+TP2qmhv9fE9XjL5vdqjOAdwxFJe
 cFznjGKoMDTQyrSzNQfH2A4zP6bgculozDlkVUSmYnLo/gfV2+sAz/1azo05KuuTgfLE8hQ3PYn
 OadeX3bAMxPErmaJ2GlpAX1gZEPcvc0f5SbIY1WWPyvtpr3ttrZFVDCIpya6HolWwqcl0p5CJRv
 I3gy0E4Hhhm2BDdSTK/mCvQWzl8YiMiW+CbVSgKZVGzgz+DLxAnUAlim5ljEgR4dy3Gjl4N40Vh
 7Z6fBH77uRwG19H83KQ==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b16f8b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9pTQncvtRyGiLAFmc8cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hQBEHam3mrIkzfdAluJz0KlbT5W1Otxl
X-Proofpoint-ORIG-GUID: hQBEHam3mrIkzfdAluJz0KlbT5W1Otxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110114
X-Rspamd-Queue-Id: BD824264AC2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-97001-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/27/26 7:15 AM, Praveen Talari wrote:
> The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently handle
> the attachment of power domains. This often leads to duplicated code
> logic across different driver probe functions.
> 
> Introduce a new helper API, geni_se_domain_attach(), to centralize
> the logic for attaching "power" and "perf" domains to the GENI SE
> device.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

