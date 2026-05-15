Return-Path: <linux-arm-msm+bounces-107773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MjvEOnzBmohpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:22:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9DF54D3E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07FB2300751F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB26344D9B;
	Fri, 15 May 2026 10:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cthiAe9H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6uanPE7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CBB39B4A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840191; cv=none; b=Nr3YluXbur9oeEUcTCQdEzSB9bz0WNLWJDFzLel3CQtfOUNqjTSF5o6pkty1pY0AsZ/INuHYI23+7nAA6vVZb0nlhu6FjV19Ax8+X8eGk3WqrKLGcWXGSh9Y0+Pbqd2QFaKcrCJ6Eo7c9o2YP0BiWm5Zyo/OlM4+4uvmjWSE5eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840191; c=relaxed/simple;
	bh=5RNLJN8AJzw6fjVfWgwivKLRztqBGW/eZA9V93wHR3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVGxbaey1LVKadhxvqZlOFQHkqtCknYFOelw3DEOevaiM7K6+xu1Iv9HjONGXVA9WA121kSQMsaUK6lB5DsZtFfSdLpS4kCE6nyONSVD8R7RVDfKkeRhM2tottjlqu3bJ/tSd95bnWHV9WHf5TjKttHVPAOifq+khb6RJ4ScuXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cthiAe9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6uanPE7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F584um3197601
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0TiXhLV4sh1qI46Qb5IcN4GJDJ3oGJtOcbBibb9xI8c=; b=cthiAe9Hc3MuezbM
	bMIx762YbUKazFo0bRNHi6I6NeSASHsLqced0RpNxre2eqACHlTFUGUplrXDX4AT
	yA2UR5fUTJV+Lty+/nuKqEumJQ0iHyiERlDlqWu3/ktDAZfLDrwyTF5ZJMJR6VDt
	na89+kK94py/ncnUsREcYp1FT2ufe7Pj2j9qpVbVyf8S2OteWRY3SExGFYk0sTyp
	hLi9iYdaeXGyK90oN1e+o3BHKAUyJ1SQlTuOMXBVUGxCF962qbladMJEyLA1spLW
	0XlJPHQ0gZzsxJ5OrcImgTfEIGwphVsciGNbIMVY7/1SLJLm7kYxHWEiwXr4x0+x
	B0S6vA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qasqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:16:27 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94de248f59eso389504241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840187; x=1779444987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0TiXhLV4sh1qI46Qb5IcN4GJDJ3oGJtOcbBibb9xI8c=;
        b=J6uanPE7kyPzE7FSAPSDm0ySZ4rTIV8K7iS1sIwO8PMy/lYMebId2OAjlPfLxIkgBB
         U9uZnkSJlMU3A0k2/tsHaILXGX3mhCXVFyDwTIgD/LeA+MHsY7KZwgJiTSsSG5sPnKFC
         7EP2NUmhcGeALbdGGDrOFnMWXjkyGaeMDwFrgZB3c5IfcmJy5uwTapqABjZYzSHhpx4k
         dl4R/PJa5hcbpFnIsE129eidnlUa+ZbBcsgnKw0heRUHlnmEFO2uhY4biazcUTdsCgpw
         hY/D6mqTlEkwglpOfdRJcYtw7JOGWbGf99grfjZmGdIcH5ZvlfpBYnnjSZCyAK4WeF+e
         Qvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840187; x=1779444987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0TiXhLV4sh1qI46Qb5IcN4GJDJ3oGJtOcbBibb9xI8c=;
        b=XoPzCozZ9LEmJ7sqHyKYNWWGyRmRgg6k8hOMJ2EKgV8OeKW+WF9BrkiFHbecGoKxEg
         JhDTqrFfF4AGVAtPs/Aw5wSYbNvpKsJLRlfHQ/XpH5l44+B6Br3IwgFWfEKKtgl5vq6l
         5M8P4Ml2FelYzucXaPqqqMJpHVQ8HqH9BPjjsdexmlmmS3o1y0w67UqdQIEaxKCC0Ozp
         l/0SQBSTYfKq7JmY1Lw5mXP+C/ac+H1J/hsan9Lq/7MJ68bHb/tCECFJZF3V5s10JpKz
         48DUpGRcbpvoLgiBkoqKVaS83ylfHdhod3CExqMnFhoZltdOpm3waOzsAa2yYaD/hQfS
         ChmQ==
X-Gm-Message-State: AOJu0YxAvFuAeTtQr+/IiYHpK5hPvCh/bAIEDs3ufqXhGmDUUNpK4Msr
	9Cp8QWDgGIzWhe+JmdJoINXpHZY4zvkCavzSHVxdO1nkWeLFG2BkB0OhtrpCZtf2QqBlWydPR4b
	4mkmuqdUgiZeSUf6MbPHCtaG18pEq8/61Be/Q4ETeMV0VJ68MMxU12TrEawF1/Lo17kbo
X-Gm-Gg: Acq92OEMfvdA3ZqIth4hB9M10pku+VjS3NCK+2W0Ur7naBGpQwddANv7of342CnKfVF
	4FhtUHZAzjD7zUqbkzQSbNatQkfWnDLrShCTdAyxaK5BcbkiV0eWbObWpjK+bI0O+xGL0+qQZSn
	qZJO1dwEVeotcSBEC/YWUnJqkMiu8tHp1z3R6pYrFL66YpsgFi42q0KI753jlkhH7QNKbNCqAA8
	ETnloSdegIA5mXwsuLeLl6LEGk9vXtl/dpC3tLV621Y0KV4eeLAvYaUJNWHTN/cx8WmlxWegbpU
	jND0KLlZ7Nb4alLU77qeq/8IvbJSEz41Xi97TljMeWrqLT/VgvRlkMv5R+x1jz/PYY7+oA43Fiu
	/zWU2WSq0WNUeboOIZdk6w6MPELcK43RPN5ugBy6zRWPvtGbXRNQnte+iq/eWDyLPbylOuvk2sH
	pygnctIofSXdPbZg==
X-Received: by 2002:a67:ef86:0:b0:602:b87a:3524 with SMTP id ada2fe7eead31-63a3ffa8809mr406959137.8.1778840187286;
        Fri, 15 May 2026 03:16:27 -0700 (PDT)
X-Received: by 2002:a67:ef86:0:b0:602:b87a:3524 with SMTP id ada2fe7eead31-63a3ffa8809mr406951137.8.1778840186863;
        Fri, 15 May 2026 03:16:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ebfd40sm203360666b.61.2026.05.15.03.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:16:26 -0700 (PDT)
Message-ID: <39b2311b-b3e3-42a7-a97c-fa190c9dabfb@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:16:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add reg and clocks for
 QoS configuration
To: Xilin Wu <sophon@radxa.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-qos-v1-0-15135858cd98@radxa.com>
 <20260507-sc8280xp-qos-v1-3-15135858cd98@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-qos-v1-3-15135858cd98@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EENOWLDSH7S5HBF1g3TKD4QKefgR8NED
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06f27b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=7vROA1eCcShV3ZceFmgA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwMyBTYWx0ZWRfXzt5EO9SRqfsn
 PrqQNy1WIDyK89OcnZ37efTfrMY9YcT4xxvXWPDiCMhYIH09ieV+i0NXGDm4oeyd/naMpD9LlAc
 GPI/NsvsuSLZ1/0igE/HqGhzW8IkAu1pOONWxiKyqKPn1DGPbhBVr7Tgy95JZ8QGgYIz7BL/8pj
 47BWF9LHUSpqyjIW5mVhxDOZ4EAFF80qBzGV6DuBnfRt8Jpe+KjdN8HIS2xwIidMcvH+BOYhlJR
 1ysrQyD20eCWO5NdmIMYl/98WXvVgUbc6jZnplFbZ7JKzfijQY20UcARMe72010FJOfM9NMFcqt
 EG86sFECw8ztbEbMrddMeEQo3tU24qQMC5NObO5gHe0zAzG8MT/y/puYZaTz8sTYGRfN/5yTtCV
 9bzbXP4KOPsyho01UEYDJjZ40BbzjQw8lohEzPCHJLfAerlgqUXDsOgv1qx04syC832JB5hAf5U
 VW0jWo0jwrQ0kXG8Q+A==
X-Proofpoint-ORIG-GUID: EENOWLDSH7S5HBF1g3TKD4QKefgR8NED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150103
X-Rspamd-Queue-Id: DE9DF54D3E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107773-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 4:25 PM, Xilin Wu wrote:
> Add register ranges for the SC8280XP interconnect providers so the driver
> can program the NoC QoS registers.
> 
> Move the real NoC providers under soc@0, keep clk_virt and mc_virt as
> virtual top-level providers, and add the clocks required for QoS
> programming on aggre1_noc and aggre2_noc.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

This looks good to me

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

+Odelu please check if the clocks are correct

Konrad

