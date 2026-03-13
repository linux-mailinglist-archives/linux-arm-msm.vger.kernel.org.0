Return-Path: <linux-arm-msm+bounces-97474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP7QIpUEtGnjfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:35:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A06283173
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E0A7301BCDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8AD3939BF;
	Fri, 13 Mar 2026 12:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2LE2tGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjF2oGLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF973932CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405207; cv=none; b=glvrizt8sSPCvD0N+K452L9s4h53EzLYF0UhHhJDweVTlJUPOfmJP6cyWWWHYflyw3aiMRbJgRI4hL9RIwejNy/C1fhUJpD03r/tHdsI2QSAY3Qzs2Mxa2A933kW9iU2KNiF+w28I4lIra/Brvd/RRh4GR3S1sXvuRehr3DOKto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405207; c=relaxed/simple;
	bh=0Emjr5T+xCmI+Wpk+ng3/CK6Am8XEeesykcL3lCtcBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXc2zx5csxSZGHAwG/m84iu+i06LSpfFcgOzGIePxl4N2stQWbAC2KUxVNPcYJBrjzsOVplHGU1Nb0nS0HtRmJCU/2mRbU8oY4dp2be4CzSnQgic0ptd21GMP1MmC8kPmzAOMX3zVN8Pg31+Xcm44IcRAjgI2zIuBeEoTqoxIs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2LE2tGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjF2oGLf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8v6GT481304
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BDSd6M3ADucBUh7vaHNmBoAw2ElUft2U7rcIQs+bGmg=; b=N2LE2tGsId8fohuo
	cpgbtYagjGt1ueDsCHwFSzVhhDSG5ASaiHRm3AE3TXTbc4zyfJbGQlCGglenjJx+
	FFaZm518+/X6bIJ/+9R4Jur6nHWQFlF1su6J/r6zBrZnOm14W9JfgZeswk/90WjL
	XVsbLjl9fcqXCt4gDz1rYXb4O2EFt/AmS7ij365mmSoub+HLVW/GmIzLzCvyVd+n
	d+fFcAwG+EphWz3jrzcbcKH9k+ZR5Krge8GyedeixSzCRtFIpYXtLkdmX0ZOOF3/
	TmFfJqd/KmZ0Kc7JoAZztv0w+nX1dIDiVfUCY6pCfCpd3uMqzPKqnqho6lKfdI8L
	+q8uSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7rpbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:33:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8198fe16so135292285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773405204; x=1774010004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDSd6M3ADucBUh7vaHNmBoAw2ElUft2U7rcIQs+bGmg=;
        b=kjF2oGLfsP3ExIoe5QG5GlBJdcAXAN5bE6IuW52JeoqFUVPxGcx5pvkBGFB2M7Cvyw
         /WQuMCdghrmkTGK2VnvirJJMHNNQ7QCDJDssXWfNxBj1xiQWnFN/H7L4w1/LwrpsQVu8
         kRs8QrirU7sVQmhglZSWCiDFC0fMB/eb57qHqXjx95WmaSG8m8dhUxSTLU3IYyeKRnAx
         tv5RUWHcD6egl1SyDRyO8RSwQqET9BJai1S2mHPDh/VFaCxODzLpf+Ae6MskTjUVTN1K
         waire71yo/uJrF0ZeGIeDN4JsK+KNBE/mbNBPO2KNJrMFYdaO2BJ7a326ZE/FoRgWVxG
         dnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405204; x=1774010004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDSd6M3ADucBUh7vaHNmBoAw2ElUft2U7rcIQs+bGmg=;
        b=GYsP8fR+cMb2mj4LL+YB1lWM4ho2P3l9v2eIkJkYjN21vX/4l8eWw28yFLBw6As1e5
         A3txkqrYLRvzS9Rw2kZyu9x1mB7wRblSLk6n+2yWkDeZd5q/QCXRzcc8RpUTHlqMwwu8
         cse3h5UQ09wOR6jWaqlAl8aRFiuN2ZC1SjR/q4JJz4jIJ3coKUEHtkwLZnEmdkJImJSJ
         fGKjzvLPzTrPmfLM/+aDrGBpaqbQfmfW0Tvk6yhULWc0WiToCtQ+A8xj99Eo8Wx9C1pl
         LIudi1xWd3xIXnw3GrvpUFS+iqTfH2rldl0tqE+4uSxC/hUQ/SE/wFprEX40z/+oFlAj
         7W3w==
X-Forwarded-Encrypted: i=1; AJvYcCWuBZWHPKPoEjTi4OVEn8FAT2pT5CF9+4LUrHaa2D3rtWbBac/nY5R7oHYhaaK02UpP7ckejY79P6ELL5Fh@vger.kernel.org
X-Gm-Message-State: AOJu0YxX1ueZNY0DuwpHIKB+NHEiUU56fFRHvjRxR3OKBmJjvCIEpG4J
	lhaw4aEkirR0prafizB2X7m0fjLF7xOz/8CvxXFePWTnrAXEcZWOM6cywMWELGY47cuVmO18Svl
	a1GSjD2LL6aJnw3m24D1YPw7HtwQ7ngkHeHnIziqk0bXnxp2nWNhD9OlICVx6IPPm2GGz
X-Gm-Gg: ATEYQzz69hQ4INwL0f7uPI73ouBPJhYIsNnCa5Gy2xsyOJBRBeCqhx/gidGAXN9ZxGo
	jfqGe6s2xv8Fv2g3VUqNP7au04SvulWzmAwN4c7znkGZv4d6rXsjmh7k4E9R80C9Qp/SEV6TXvc
	QhYM+DPQacHluTgMTj+WfIZ7Hpp6o7NiVj6gTYZgKfRYT5llr8cZ319A4CKRrgq5JO+kGx0aGPZ
	tF798Z8IsL26vXS/krKDIUWLHxrfUwwgkXG4RmXErwFm4j/2+9zTza1L7BG2A+IZOf99ar7JIYp
	a0xkW208W6mtCbXUEeeRIFvlrFtVKzF/kexJJkRmtO/OcULXkMrmNM2fvjjImEJDhh0/AGLaHMW
	3CgEqKpU1d4IszOhOwpA+AuuqfcAipH5iQwrcG7J7sa6oEeFRLBJ1tcQ4dQ9ecrkf3ESOfDPswh
	+XlP8=
X-Received: by 2002:a05:620a:44d3:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cdb5bb356dmr351085985a.8.1773405203735;
        Fri, 13 Mar 2026 05:33:23 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cdb5bb356dmr351079285a.8.1773405203234;
        Fri, 13 Mar 2026 05:33:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d0b7722sm41877066b.66.2026.03.13.05.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:33:22 -0700 (PDT)
Message-ID: <4d5d0fe1-9aea-4ace-a369-275cbb728afa@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:33:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
To: Yedaya Katsman <yedaya.ka@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?Q?Kamil_Go=C5=82da?=
 <kamil.golda@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
 <20260312-panel-patches-v3-3-6ed8c006d0be@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-panel-patches-v3-3-6ed8c006d0be@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rq2bLriiKdH6SpSRexZqfjcqo0ojPtO1
X-Proofpoint-GUID: rq2bLriiKdH6SpSRexZqfjcqo0ojPtO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5OSBTYWx0ZWRfX3TN0EjWRH984
 JiFsx7qldFJbCJPxFmMR/qVKX78JCSX58QTZhXxDlHQw2GfdnqvKfLSnkWy0vpqArD6wLLiwR0v
 FVnuimbC9wIe8s77g/63j17UrQvyspy3hp0HNEqsBXIpnbE/1pYkTPHi28fkMJnTG5338LrJfI7
 QuFF60WO7bUsJyM5IZm4AEzXXjERBrz+w3y3yWy2PZNOE9ToKAdAxepMJKC7LedU3A8fJ/z9J9F
 qU8ngLJp5G1zpvTJf5U2VPG/HXh+fnfBigioSPr/v31O9DMMfQrlTvr4sqbYPK1fqEk+o1VMC9Z
 MBR0cjLJVuOjZXB6dh5SqJ2ksPEzk4+rImi3MYlUrMX6HYwQ48dPvUBPhaG9LwIKmKt3TgfXyOZ
 o4YksN1FhrcPqgCehgX1cLRdJxJMhfgUVqmTFaoPVAHO5GS3iVe59bRLkVlhLTrjzQBPlBNWupV
 rBWH08n0nIU7b8OViig==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b40414 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=sfOm8-O8AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bqK5-dEd6McJkE9xslgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97474-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E1A06283173
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 12:55 PM, Yedaya Katsman wrote:
> Enable the MDSS nodes and add supplies and bindings for the Samsung S6E8FCO
> DSI controller for the M1906F9 panel.
> 
> The ldo and iovcc gpio pins boot up with a current of 16 mA, but they work
> fine with 2mA, so I used that.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

