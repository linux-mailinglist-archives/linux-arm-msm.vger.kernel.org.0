Return-Path: <linux-arm-msm+bounces-100995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD6yDDCSy2ngJAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:21:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F13366F51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B0CC315898B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757343ECBF0;
	Tue, 31 Mar 2026 09:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0O4wId5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZvW6ZgB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1973E0C62
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948434; cv=none; b=t2e18OhMYHBlSrABkAQ5HOACP1pqemBYCD61FoqjD98Nlx0fd3EdraEYTVUbXYMMZi6NQPpQaSClhimo7Q5VEthKlKI4yL07/IbuYlaeygtrwwg/wngQHIm1z171V8lyUgjtoVArv5/jb0qFK7Yki4v58BhJRFX4qWbGac4Xovc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948434; c=relaxed/simple;
	bh=vtbusTWBAZN0+tv+xdLiLYNSGEM44v+6/zZ942lU6fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjGVC2z62OMk4UCW3P9sItzdU9+myjvjDGZeWHcr7HK+tdMeTtSNYedWaNyrY3+br5p8z03hGUSCWRQVh3ir9Xz1h+OMFNVxGD9PdoHd7fJ7u7xB72Fu2FLDb3dMmxApsGkslYq/TWaMGM9ctmAza7Kei7DPdbPsdfzkSthwKvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0O4wId5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZvW6ZgB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V91kRC843037
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czg1fnXViivG4aLWv1gxU3aLJ7wHZddjLbsExCIXOLk=; b=D0O4wId5ofjlFYam
	ZXsBgH6D/rBOxH1EHfFMtztnFCET+OK3XjuQqxtkPHbEH5E4FYmLclekqJemKaL8
	1qRyURoxmXSAXQ+OjS+94DEQpwW5j7gPKlvBz3V/GxhCfvjnnVDgvgwrUJUB93Qf
	VD3qOKoblAUmgq5DBHJhwn4f/tbaWjtT21PaFmZZ+aiaCLTsbBcu0+CChtCn6lnj
	f+oOLeiN6fQYSgVb+iQna7lRoE3h782ypdpFoCyv0K6/6vG1N3KfTFYSpeKH0B2E
	iHCSubDncAqrNVGCiEH0r/2H25T5N1lEhxRw/17kjEit/ZHmvUc9gSzMOpgUSEI1
	PBHAiw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d86nt98jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:13:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b250d3699aso62445375ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948432; x=1775553232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=czg1fnXViivG4aLWv1gxU3aLJ7wHZddjLbsExCIXOLk=;
        b=VZvW6ZgBgj0UT9W3UBxQc0tR9JsrjCTkwqNWs3qJRIzDGIQhx631LwIVf+NcynqLpG
         +YPZOLvVU3TFApqMS9MfOVqQJnyp6UiHofkosjjfNwlffYvzfC8zHnzr74u3zGj1DNsw
         79FAfzhWTrjRrvGo1s3Hf/p9GsHxetcJloEb8Gza6yAD60VaCraYZMcE4iBwzXf8Lx85
         QxltqmZjGhc+W8zFU90iU9Akg9HA0YdNIZFXNXjl9wTcmzeOM+xL8GyyRxthMgph8537
         hb7hYwWzkPv0nQS9u/tlF8jKhWTs//C3OsFyINz8nXLotuz/sqdaCcCf3DR4REb7gTlJ
         mLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948432; x=1775553232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czg1fnXViivG4aLWv1gxU3aLJ7wHZddjLbsExCIXOLk=;
        b=ZLBo4tmqR8Rq5Ldl5mWskeU1fz0U2fj1Nujp+/4AiPdAAMX4PyUabO6iMfw5Sd7lmf
         RDgDflqRyjAuftw+ZSxj90W0SQuTI09iFe+ZqZ1bsVpqLPPKq5AbbSVDpoPk9rRgQH+5
         OL+B66EO9bzHELeC2DEN4RkRNAjHravQKqCI0zjJa5PcWpRj5pM4wk3idf35Va8c823F
         Sestg+FuKT9rngNF9v+eGlR2RCR3yYd3JAKdapFLndkc/jQQUlGIBE70NcNpFB8ikw5T
         8pJt4Q+9cZ2mOVIem+Zw4UCxeQbtGEGQTNXIAG4Dl87RSr1T+Vz3AS7EMRdEl6j7cRrc
         LHIQ==
X-Gm-Message-State: AOJu0YyaWQCweWT1WJL3skPpG3+v62SKBKTkVg3AOevy9GeUt0rPomTm
	PxFuqDwf4EviYykwJhanLAyyLxB4ZvwTu+5LfATVubRJ2Nb9di8jagcOiToYEJR1jQUfIeFHt6F
	sKMOOU26+nVr1Ay0r/GertnTUsDf7JAOPxv3cCgpDf7QTQfYVE/uYU5BCh3J33R0750gH
X-Gm-Gg: ATEYQzyV80XIskbuTWzZjvQc+1PN8riUvX6n4/DmA5EBN3jXYN2CNfFdhiDNL+6qBw3
	TQ0QWWXncsOD57U0YfVWXam2GE/uwTDYcgfH5+Z/VS2uTJ7FPA8t7BkSBgO7zHVn/Q3Y8Q9e8kx
	sIuoBTMg2K9UzQ6/cN5vxvDNG0sbrd+E+y9v6lHA+tk1AhPLB1n4f7svuL9cste/Cv18CQVSzd3
	OpzEJhZzThEl7ZYxTYxzCRtR59YVW+iPqOANJ3NGpjHR38EJBcCEjd2kI/oGPK/u2Q3pm40hO5G
	nZPYULOCvKoBW/pBfAxRfFmmkJAlcZWSQtVFrBp69FbZSIV9eVlU3ZCfZSbREhUShi3p65KHs+t
	V/NdskuJaSesrm2TIr60g29DkKbhbCO2inWCjTCCeOYLPXAzZRA==
X-Received: by 2002:a17:902:f542:b0:2b2:42da:25cd with SMTP id d9443c01a7336-2b242da32fcmr121443815ad.45.1774948431852;
        Tue, 31 Mar 2026 02:13:51 -0700 (PDT)
X-Received: by 2002:a17:902:f542:b0:2b2:42da:25cd with SMTP id d9443c01a7336-2b242da32fcmr121443495ad.45.1774948431330;
        Tue, 31 Mar 2026 02:13:51 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242765b9fsm126761135ad.43.2026.03.31.02.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:13:51 -0700 (PDT)
Message-ID: <81c503bc-0279-44be-9e79-a9c313aa884c@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:43:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] clk: qcom: Add Hawi TCSR clock controller driver
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-5-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-5-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PRQ5pn4QTlAllrn-qM99eI49CHM56-7h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfXzkO/fbTQJkWB
 EyT9QhWDHcN7uEhkHbwoYrrhzADE451wL034rQvQoBsN6SjxIwQRZNfqF1E0nb4EOL1B3//eIZY
 iVDQCC9E2P9shzLlFCdZ1PcKel5s/PyN8xLhsSu0Cuh4LEBF/rMEGaxuPtEQYqBMsq1f7g+oZLS
 uzRi9pDaVwhfxjpz76bYTe7KuKjf6TaLcs5KIeFlFkIYSnjBL5xSWUbu/m56q81LdVSFrXcfKuo
 vnivf8L631eAxwOmjopQCUalbuCxV7/9YFOeldaJ8pURcy8nI8Uj070+k8GfXk/6NYlGrXnpDKt
 x/sHQTTc63Hp3AnK1bKo+pRLFuY7Lhm7ftBtjFhIb2lQtUqUT0r1XT8aWE1OCfiOQUop9a8nEhK
 qxfZwffmTR2fe4xLzJqE259mnYQHjoXoYWydZoaLyYOSfbiI+bPeII/eEpMMj6o5F2hEaDcdZNy
 IxFK+Yjs/7qG5AVpVrQ==
X-Authority-Analysis: v=2.4 cv=IswTsb/g c=1 sm=1 tr=0 ts=69cb9050 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ofuwNcfXRJEBrn_tyCkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: PRQ5pn4QTlAllrn-qM99eI49CHM56-7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310086
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
	TAGGED_FROM(0.00)[bounces-100995-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64F13366F51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 6:05 AM, Vivek Aknurwar wrote:
> Add support for the TCSR clock controller found on Hawi SoCs.
> This controller provides reference clocks for various peripherals
> including PCIe, UFS, and USB.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |   7 ++
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/tcsrcc-hawi.c | 158 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 166 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


