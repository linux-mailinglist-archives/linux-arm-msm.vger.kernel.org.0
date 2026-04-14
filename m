Return-Path: <linux-arm-msm+bounces-103141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ENiBflK3mkzqAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:11:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C1C3FAE57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 41907300C01C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B13E3E7174;
	Tue, 14 Apr 2026 14:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnP120yy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmASR2zE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DB6342C9E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175850; cv=none; b=TsmDNXBhofjwqeWnx8SqbJ6p2JjqcTPj47YG2q5iizDDxIEG4Z549Vgf30frzXPyHlkGoOtewXgPXtXE/5jhU0vKIW3NNlrjRvkVbzhzbjSBkT7r3mls1jP72amlZHNxiiWAexBmuIoQqltkghJbsm6+8HVHkx31E0niYx0Z1Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175850; c=relaxed/simple;
	bh=wRoc8vqU+Do3/rxWz0CWoGTRrOvwHOWj/Ks+NtJU8Ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9B5Exob0FtYvyNR0YQcOAb94t9nvPDO1Hcu4XnSNC9xPR2FnbV3csYwMCFDzAcOz1eYvX5EOb+ODAm5sVMv2y9eDjTkLIjh+UZW70Hn9tj3+/CfKrQpsyabYKivS1cobsm7fYX+CIfL/7/eU03s/+W9GfIAn0vRuV6pa0t1IiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnP120yy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmASR2zE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBc6Xv2633413
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YKQ7jg3Wkyd4r57T9ATozmR1799CYsFYrJoZVTakFlw=; b=MnP120yyUxKXxWyH
	Uh/UFCnxVbwpuQevgHOeQ1ng4S5LscTrPexdQoyTfxEc8c6TwZAhfvJPI8jdhvXi
	sH/l1Gx6Y36NwVnx1ZcZWTEq0MOYAeyAWW78zAFvKQSbFiAvwYFYqS2/pEmFRrGo
	8MwYLWDDbRpC6z22vEgWUTkWElTjf5141BN2lJ3XtFx9qUQ5dupkMaGkrikOrgwN
	wc38C/F1pTrSTlFCwG2hSqgZIysNph9xp/P8fqEYmTF1VSFnzUOQB2ZZmYHnFXj4
	5O8QRHL8Hh3DWLsWoPp9Ak+K5HsHf9BgJjIxLjB8oiPFEPdLQ0PWNPm8XDhkXHYf
	X6gcSw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86cb0hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:10:48 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9511f903b16so196424241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776175847; x=1776780647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKQ7jg3Wkyd4r57T9ATozmR1799CYsFYrJoZVTakFlw=;
        b=VmASR2zEiHQ0+WL2ynSjRboQO1zE8bY8zyak7ZdhGURr/SIgXMo+5y97o/4knY0t0o
         4eiGSqnv9AHcwHqg0UjFv06Dy9XLYBlRRqWhN/2uoKpDB7pr1M31P3382ymBgqLHLuaB
         /pEwH3u4tK+eUQYGRfcZcbzSqBmxYsmXAwSCnb3cJJYGbaRVsLKBoEyvvEDGxYk0qdrU
         CvETrsmQVd3RZy+eCzvFNAbG059zdCQGzlllLYWgvUDBzHcdfjoxTBiy9neGGdVox0Dr
         8tTjiAgo+iYcLW9c+uFY9rbBAyKpgkCgZVuK5FAB3JrwKH6/NIoUAbbMxgX2lxKKNcqX
         GTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175847; x=1776780647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKQ7jg3Wkyd4r57T9ATozmR1799CYsFYrJoZVTakFlw=;
        b=kS1Ben9ed4ybwcLqZXX1O/Q8XZ9kBC+mL3Z0A7NjBvbqloq2zYilb4bCmHg/AKwMBm
         3Qcwr1tH1ozbiOXrx0kcQOj++9MECjrBMXDo2wHjyHMtWDPRDCew+uZ1d/yHCImC1iL4
         emUa78OnyIFnzJPDpMkAQqwp1+RN1HBZvHE7MUqx4QOHONkN9wDeb3PTm9EQiyumIykd
         Cggf7khxxF65rLh4zcFxXc8yJYZNjB20zVtRrBJAcsK7/Kwmq5eSf8OwfcYr+YrkyEvt
         DwTeKGJfQWFxrcFQFaG8iUvA2xsitkkhIursDI3CMaBnvuwXXpHXbFwz+KgMsxO4u83X
         cs0A==
X-Forwarded-Encrypted: i=1; AFNElJ8ZpAXOaxsnZYBes8BTh/cu1GlUcTPWJ++K8w+82mCtzwrIlYDIGdy7zr7KPAztH/Zc1GZ0pGarYyKLyO7f@vger.kernel.org
X-Gm-Message-State: AOJu0YwAlP1NpTJm9PQDx6d7v+If9yvEyO0+nP82VwIVrgXHPqOG/gDc
	QpNnwBWurAqG6nh7Ytgkx15CAMU9P82Nan8phq8mqqQAMbgpdqgRZK5u8NhVAa9Pi6s38gHn50s
	28jN/hH6Y4Ao1J6l8oCw7Nt+d9Aiq8sXEMkdvZu72Fhxa5I4nYKiT13mOpdsXncMFHcgx
X-Gm-Gg: AeBDievD4rt2REYyKzfkFOmZnyQBlD4NKSNGuehFVnAceEXt4D3qTUqv9xAGVkZket7
	rDdJdZmw7yUr9sPi+V5bLtC46NPyPIFVt3Pm+QN0vy2NdlplBnNlKWxyd8MQTnVyKlCbUZklV+T
	JdKbs3vHAk2yJCfJ3//2Cf2dxHjs8dHtU/71PFbT7th9yvMLQLEN0XIFKhw98kjfasm3944jJLc
	6+yh6+RT/GPvYqdgrHM/sO/VchlzjUYi4lQYSXutycYWHV8l2OxRHGGgz0YkGzz1Mub67V28wgC
	Ug9JDmXWWCqgQi03dgEAGnJkImfIjvmBtkhHuNa92t0tL9JmTQUALabhnZb5MsaXq0hwTZe3jw/
	kSEa3FXOILWRzbX5h5TOE4sz9GSyBKH20/Y5vflGzkbqgEvnymJDbwOX1pXMVtLnRlYQ5KFj+pn
	pjedLSkpi+OxfRSw==
X-Received: by 2002:a05:6122:84b:b0:56f:5b59:5226 with SMTP id 71dfb90a1353d-56f5b59611emr1679941e0c.3.1776175847423;
        Tue, 14 Apr 2026 07:10:47 -0700 (PDT)
X-Received: by 2002:a05:6122:84b:b0:56f:5b59:5226 with SMTP id 71dfb90a1353d-56f5b59611emr1679918e0c.3.1776175846929;
        Tue, 14 Apr 2026 07:10:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd88c9sm417722266b.23.2026.04.14.07.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:10:45 -0700 (PDT)
Message-ID: <ad4f1000-cdfa-4c21-be9e-87cd65f2739d@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:10:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: dts: qcom: glymur: Add iris video node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-11-7d3d1cf57b16@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-11-7d3d1cf57b16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UUmMq4dr7KRmyva1quKiPXasD84ngenE
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de4ae8 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xYufHl49NKEuV1FEiosA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzMyBTYWx0ZWRfX411ZBBNIekvx
 tp3Fuu7AESD7SolyfG2W7hPzFIdtWKhxU/EIdSzqbrX2ATXdXc6R5iStmEQg7vPeCPQDoWZnwl5
 cgBpIdApmxMd366vVRoul5E2DqZ5Vjb6OcKsH9GciMsijK49ccepzO2/kSyeQLrlygI57/j4AIV
 U99nOM7YhTGs+MQ3qRdAcR8qbWpVmXKwk8Bz7vuwcYM+9ToTVJ/jAsWrEtjaoeK0n7LZpA8yOCJ
 x9UNxQqGyBfIPDIo+zXUIx7xWoQR/5RuFmXpvp6ov9cHQuTn/kTfSoMueaIrhn7zBY+QT8XLRQQ
 L2VRGKNcEP5FiQyK2VZbaArbGTsiIOQg5Q8AtXGmm+euYXbRI0Oxe/oIAUhLWlKU06S5EnUptF3
 0UHfeVF7HbMCyTK6Alkm5z3ngXTh5v3B1cG4FP/EZqf2bITthUkcwh4uhj8Pc3lOfZrgBwcY/2N
 CQjxdKhMjwMKsHRSNkA==
X-Proofpoint-GUID: UUmMq4dr7KRmyva1quKiPXasD84ngenE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140133
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103141-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94C1C3FAE57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 7:00 AM, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous plaforms, thus different
> clocks and resets.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---

[...]

> +			iommus = <&apps_smmu 0x1940 0x0>,
> +				 <&apps_smmu 0x1943 0x0>,
> +				 <&apps_smmu 0x1944 0x0>,
> +				 <&apps_smmu 0x19e0 0x0>;
> +
> +			iommu-map = <IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;

Shouldn't (almost?) all iommus entries be instead bound to a function in
iommu-map?

Konrad

