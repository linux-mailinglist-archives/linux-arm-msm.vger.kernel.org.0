Return-Path: <linux-arm-msm+bounces-90496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KPQFSM6d2mMdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:55:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ED08645C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5ADF3073DD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 09:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53A932E13A;
	Mon, 26 Jan 2026 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOOd5YW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bx6vw5rm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7064032D43C
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421064; cv=none; b=HLu62qeeIaXlmg3GNCuwDHxf8t4EPhpQ3z1w8n3WSkLAj7aI8zBQko7MsYxsAqYyKlbSVNUtFkvzy84UwQZVnmQCH4JA00ACNV2Rtv6cNRSc8t8/FRDzy/px1cybIHxmU8cCdMwyS9/CwBu1IUWP8QqS2YAHjh4JhsQr60OCQWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421064; c=relaxed/simple;
	bh=sSozEWyPD9E8tRmAxWkBSVSKT+7zVIdFfdbbV+uIE8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cdMgXvhVfYVOPHn3b3BEAZnjZq4Z5WwdfIpEU9F4+eAHtkVIwa8dv8SZlMuNZEdrtfUZfWiJjvPB78t5dvM+DU3MtvpzdFX6MjGuof8tWKuxflfrzwlLSQyNVveszWkueQQDlLpFqFcgl6QnLKBua0V+XyYcuzhAohQfU29MQZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOOd5YW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bx6vw5rm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q92AnU1258051
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 09:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+0Z4ecieM++BnFcQ9BBCwF1hAvC96nTLpNXFYvDDz2M=; b=QOOd5YW9qAS1lfir
	JeNu4Tcw3fdSJICNH863peGS2F9av1PWwMW4H0cIngxAEPflfwQqtXFIOxc0NWxo
	OEV5p5Ya+oKPD0LG7NcSo6F43rNDERTZS2DhmXI1lJxAjUbNU8u/Gr3PCUuAKVft
	huGPdv/bEmprwyjO9rICxNKKMKubShr3cKVx3m02ryf1ULUxFFfh3JrCrFy9lZQ5
	3feDKm3jbTZ+GaypCGSLixqXRuyUHUlg5K2CpwN/iRsW7/e8UvIYHBRyteQ9qHTY
	vIruQ/RY6yyMqR8yWauapbrhTQNPGvKfn1dDlUC9dzRfxK6CDwUD/t1xE+zXyimu
	5Ca6tA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwtybjua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 09:51:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b137e066so128704785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 01:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769421061; x=1770025861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+0Z4ecieM++BnFcQ9BBCwF1hAvC96nTLpNXFYvDDz2M=;
        b=bx6vw5rmfE8jkPyftZTwUjzGELMjQuKi169YpCYyt2ftelPBBTjtxPPubVGdMFBbmj
         QwACb9LMpI2S9Ex7/uPvD26mxgUUD08gYWXtmFP58uQsb9UgxO0PjDaQz2TX66NDvxS2
         Oy6sTcovf9TyVq86Sl7W/5je39FsHTS61UFQsyoTEd/36McRzQCni6trj10OA+eg+anI
         DTFblIGUVQBl/RLMschKJaiIut/L4BrT8N8QzdJrMwDuKZ5pfkBCR0NEHZYy0/zeL5/R
         DhZIBL7iUUYmjVY98WRttsTjyfEmjkoN6N36AZ6WzBfcTkzKS7TbTipnZMIL0DaeOZ2C
         NHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421061; x=1770025861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0Z4ecieM++BnFcQ9BBCwF1hAvC96nTLpNXFYvDDz2M=;
        b=AegyVUL887B4t3erEpQkZExpxqCee8MBe5xT0vzQF1l15xnN994tf4dBhc8Bs22Ung
         fWIrWAvu5zI5OjUIuMJZDMkaba/IyFo5QOmNYBp69OCZgYlhm3kaYPIzcB4eVjR/7FsP
         KjZniAGGB1zXqlO0nKSsh3nF43eBVGrGHaMJPIH2b0qFzMlBko5gjks2ikJmH127uqE4
         K2tK73dSBzTU+OR4gog8mOkysIxURQu0iG6VL/5oBBN8RuS0G45Q/1AYU3afL5b20YON
         aWzS5gAJ/pRgUvXoDdncvrGZaa6iHVwE3o5Da6SVQyawLVF7lXIK8cSWXQ1eNHmBQtiS
         YC+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVESg57f1MhLPgxxjS8CX7hGZiCbBYnXZnqjcSAoRg8FrTSQ2fTxS3ReR6m0Mirqu3nES/Trg5bVgHJjAKH@vger.kernel.org
X-Gm-Message-State: AOJu0YyFuPu3YK3XdXqK+O+WHdjFEoZMm30ZoIoGfwXwPvh4BOqPa7KU
	viyEKPTlc7TrcY4rSe5mLsu0hN3pILg/0C8w3yClOaLLoVCHWfp+JpG3OH50tt7zeM75AHrZ7Jr
	tEfQqx0lJBwRBe8BoTqXIrbQwMAvY+kHXaz+Flod2Jy4Xhk4uTetCObe/Nj05eKKxBKu1
X-Gm-Gg: AZuq6aJRHJOwZXx3K2qdz41BPrbIu1+vUA7n7PaYWtXQ3Z6sg7VV26FPXU8aS0ueim2
	3gWMAAn41BIHIYrMS9puoXRw9QeF9sAZWL5oaJW3UFc+NjwjMBXVmINSIkOTzH3PCw260jfoQh0
	4G/gE6/TjE3aaeqgSWYfoGtlx2Y0Zmb1ylyaSgmDGKiYd5Y4bQ3o/Hri2zjPp63NYtfBv5Ikhya
	Ijb3xhGW7Mk9K3OhSQvmiNqUJ+2n5xKOJIMJ1kvcPrcxiaP9z+kC0nR7uc/c3czM1T3E9pVQXUT
	33tcDzWXtnT/5Y2eumhzsn61kmvCzW4kcCKxIIakyOZtUdAWqYXVg1nrJpGrGsqS0NXHpEN5pOj
	C/rDj5YKShoz4Ift+WdE0JcHdsNODAUQGGItYVb8AUforXBwMKiexPA+hkjsOwcK7QgU=
X-Received: by 2002:a05:620a:2546:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c6f9621f2cmr351183385a.6.1769421060710;
        Mon, 26 Jan 2026 01:51:00 -0800 (PST)
X-Received: by 2002:a05:620a:2546:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c6f9621f2cmr351181585a.6.1769421060179;
        Mon, 26 Jan 2026 01:51:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8877581a03sm465896966b.43.2026.01.26.01.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 01:50:59 -0800 (PST)
Message-ID: <b9fb16db-8a16-420c-bb55-850c39301f1d@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 10:50:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: iris: introduce SM8350 and SC8280XP support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XUkEX7jcXCH6V6EQYs33RNqUmOHgTekc
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=69773905 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_HA5okAFcYk4mzHm3zUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: XUkEX7jcXCH6V6EQYs33RNqUmOHgTekc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4MyBTYWx0ZWRfX/OFqFAlFm/gl
 X0oDmE75zsuq1szNMEJl0ZEp89451MuMT4jeeukFajQYG2h1xGN1sIYSXGDj5kFJ6Cw2zs808R6
 +hKUFHLBx+jAf7lOOjjaguBUKh6lw3vluZjr91GpskusPsitQeZ/dCidEm/0727fYf0P4bTI1DO
 Ojongg/nYH3nDUbXeB0kaQL38933GXczIQQXPZ/zJKnAutfsooHKo97I7jrfulhGTfKnfbbZYAg
 rfR+dF1CV/d5VeYROSOPIXF5qWkmbsYzq5ICbizzFpqF34XaVibT6DDiHtCAZYR8mo5b24f0bT/
 qEX3K/mrlkgib8cZWrVX5q7qR6IhePjycfyUUHpj6FXUe+W4wX0vJRpcLgFFCcChpxT70YYxinA
 GYG+0w9tPSUZaL4NAQTqpvSh1SeuM83m13mnmUPfXJOnEpY4KrYCglhbvViFJmOji041dHbRVn+
 +c5VeKRpatgsgQah8Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260083
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90496-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9ED08645C
X-Rspamd-Action: no action

On 1/25/26 4:32 PM, Dmitry Baryshkov wrote:
> SM8350 and SC8280XP have an updated version of the Iris2 core also
> present on the SM8250 and SC7280 platforms. Add necessary platform data
> to utilize the core on those two platforms.
> 
> The iris_platform_gen1.c is now compiled unconditionally, even if Venus
> driver is enabled, but SM8250 and SC7280 are still disabled in
> iris_dt_match.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +static void iris_set_sm8350_preset_registers(struct iris_core *core)
> +{
> +	u32 val;
> +
> +	val = readl(core->reg_base + 0xb0088);
> +	val &= ~0x11;
> +	writel(val, core->reg_base + 0xb0088);

Can we "open-source" what this write does?

Konrad

