Return-Path: <linux-arm-msm+bounces-96633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KlLOWYjsGlhgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:57:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD14251188
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D93130D4E03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D7E3B2FE6;
	Tue, 10 Mar 2026 12:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLB7o+QS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ejcu0kIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAA63B0AF8
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145711; cv=none; b=sL31gtV8HbN7av9hpwBDhCGKCrd7H+mj0gE9l6+v7ZAV2bmnsF2FmpNlpt7K3SXRbSS6LmncNMibfSsbKYNzbj+uk0CJMmZUNaHD2JZN7At8Z15r+TiLQOzCVuRIDRomqqrmC4qEmgLqnboXrCTSNJiv98rmHJFe2AHF2yg6CD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145711; c=relaxed/simple;
	bh=W8K8DT9RRhwKV1rFdpcjXSpr21vlkIa4gpW5h3LPOBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqaOk7DmcssVe8umPdQgoHLWfActEoDICF14Ai8LWrlXlvgqiyuKZjbWH9Bs9f4MTNvdDi4dQwjmKEBR4GeL+sNrR8tVf1aTvuHMRLHRQoF8Bt+bsjM1rWDJaG1KgOyY+tlFUhisGaXjytLOc5lRmrzZr9tjn/8VF3HUF+Qmt1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLB7o+QS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ejcu0kIf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ABHjAm3244087
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fbj26tjaW0oauXAAKR/Dz/Bgp18J/CRra/i+8EEiKQA=; b=DLB7o+QS8r4JskxZ
	92z7o9VwiRdqJpa2StsgudD7PDbNrzTACFhbBaaLaRsc3uZZp+tI6aZyVShL2EW5
	LnnbG7PSlk4ROE/2UTEgT3rKiM8Q4/apsvwiXjxrVjGduINvyjtZJEE214vWw0eh
	zd1UbQTyuBlyRcjM4ZFFEiEzDpNexdQsGCfRrJPlpuwMcnxFwrrwknpPu7gJVfwT
	tz59E9jJWLQCVLtFz3cPjWHNPTzF4q3YvyykTgEGxXW94WCp4OiOVfiTCpH0/inA
	U7W5EbfkeYaIUU7ELmFe6rWbqBAJOQZEjRGWXAiEDcwcDJhCWdu9w0HRt/w1dwRs
	OeJklw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja287pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:28:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8dc8b434so126748985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145709; x=1773750509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fbj26tjaW0oauXAAKR/Dz/Bgp18J/CRra/i+8EEiKQA=;
        b=Ejcu0kIf7/9MjkgpsbTB3OeqS899qg24stHlkynheh2JpzrvGhg+BGFZO1xmbPcTGI
         wyoFz4YjCUHGvWWfiPC89pLeO+haRZkg2zRq3YyIuNhyt8ju+x3oP/YhzK3/XPYnxkz/
         PA2MlAWY7FfftEvgzWzTx+BfDSRmwG+IHq9xuGzmpA4js7KNqY4zOZLAqSjOv9gCRm4W
         Dx7I59KnB/an6gjGrrBMlwGyG8THn8bTB5qiexgT2AJRpsfZlrY8mlaEb4AaSHACntkx
         KU5NaQdkwS32lySJfhTObdZj+EsIits/so/P052iib/CP+7Bs8t+3xSfC6JsUmayFFu+
         BARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145709; x=1773750509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fbj26tjaW0oauXAAKR/Dz/Bgp18J/CRra/i+8EEiKQA=;
        b=VpJCwMlnpkpmm1q/qS3+kJ2CKdzJaAsMFvuiaDfk+ZDVGqTjFHasHqrGWZ9mwZxzbT
         gCrZAypshkw/cBF9QE6kaLp/Xq5amovrhDZGDBEcQG0g1uSRNuZiF9B31Xy6a95bmIwJ
         H6CVbKSLtCad9l7MXRdC2OIgtDn3ZDzUfcB1oxeigjO7Wp0KBDDO4vOseZLVSCWLmLKE
         6EamwrFaKUBlGWYoprUbc9CbjNn6PdYEmPU0ZjOX0CXpYzesBEbF/BsfIc7poILeQQKW
         Hwz4xhXWIKFolMrShc6vMLkhCnaZXcdk5u7FEire3lujHtqdjbTqMlq9GB8D2Rmp+IQN
         PeHA==
X-Forwarded-Encrypted: i=1; AJvYcCU5qmVK782dNjCf4Fpn9f+S2rYvKVRlTR7/zkfhQnHpQM+cRSPOK8eS7vucjY1TI457SbNwqXW/j8WleGXT@vger.kernel.org
X-Gm-Message-State: AOJu0YxY5jj9DDzsr1Ae0DWry+Ye7zs++MqDKlxsng5AO2R7SeTRj08I
	DuWYU6u71Ge4CRGlXx5awG9PJMysEGnX3+bDp4XQg2RDqf9GC6gOhEESX44wRnd9NwVIljjO+7r
	ijHBwhDZ2/cXsL7EevLu+KunRAF8SjFlvOov5/9oMiVD2oueGPqvEkZDLglx2I4rnntY0
X-Gm-Gg: ATEYQzzcmXjzdOH/Zw4kcvFv1vrZge7pEtiz6AlZ/V/49MuD2j4djKlC5XYdbd073d+
	n3j1t7fb5LdjZ+iqaQLbYtdfp2SEf53JjXdDZaDUI5qjaWR5+4oBx2yBhmR8k3+/h+KiZRh1MGI
	R3B3LUr+fW9qS40Qm5+Cx8c6wSlJtwORa7dwEv3Ndy54+tuUqTGuR+p/UhASqLninnht9stX4S+
	DkO1ElHEf4mb4lF8Zow8wTrnHiGn87OsL/7AjQHjzOrjrggovGN16zTYNLfqDDH0Be7V3E4LKpB
	ViLtZvN0Q+OMrbvSx/LOVVEJ99C5ocz/8y1AjFIKmaMUJ7wFfi19HFOAYltHsMss6LFV90DN3Xs
	2JVfyuSWnkJAiJ+kfjQiGcdSBT/xS1NVk1qF2enN2BUqAScCDSI9JxMhE98zNbQyEbmcG/3izmn
	10GjU=
X-Received: by 2002:a05:620a:1a17:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cd6d43bc63mr1485245385a.6.1773145709183;
        Tue, 10 Mar 2026 05:28:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cd6d43bc63mr1485242385a.6.1773145708729;
        Tue, 10 Mar 2026 05:28:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f18b009sm477024266b.59.2026.03.10.05.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:28:27 -0700 (PDT)
Message-ID: <d9a1f44f-6e0c-406c-9e88-471f197e0490@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:28:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos: Add LPASS LPI pinctrl node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
 <20260306-milos-pinctrl-lpi-v1-4-086946dbb855@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-4-086946dbb855@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b00e6d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=B07o7Mun2X3wBQy5X0wA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 4_1LFrkS23v0hQHSkWXsrb8u8dJbCb-W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwOCBTYWx0ZWRfX/hFYezs5KOOS
 d/PUd5NvVhXVOZbwyaTVrcXf0Wv5+fic0juTFHwujA8WRMHCeB7ylmKqwaXEznoIIc2jk+Zraib
 m9hfaw8ZXisLXMROFes0MVuxiNpVhJQu0U2okftPAGnwmJzqMSkmZoJLrw0yS2XGlka+FhDlBNw
 dP26hN4euRXsb7DCbeNk1xN52dM/v0vq9siMQc7tA6OC9Ni5iNrH7nopAXDuFgAUccvYEVgZQkV
 DLr685AjNJKxa3lfA0AhCg4AmxV9/W4WVfS5FOj0OC2czc7vGR2aW9EQQFT9RwNXvZ7YejcOKbf
 nlsX/Xai2HupuUyw4O0fX+pEowEe+VwG05Ho2piGe6eIZJMVHLX692LiGKpu+O6LMmFuKDi/24P
 EKhE9HrXJMrkBnElXIu4bh6IghBBhMGKceDEyo/bOb3zAmtaQxZfgDfpjf2Q9EEk9Z7Jn3pxn19
 Cfj4VTZIktS13vbDmSA==
X-Proofpoint-GUID: 4_1LFrkS23v0hQHSkWXsrb8u8dJbCb-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100108
X-Rspamd-Queue-Id: CCD14251188
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96633-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,fairphone.com:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 3:22 PM, Luca Weiss wrote:
> Add a node for the LPASS LPI pinctrl found on the Milos SoC and define a
> few pinctrl states that will be used in the future.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

