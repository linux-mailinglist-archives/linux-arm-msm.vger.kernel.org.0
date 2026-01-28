Return-Path: <linux-arm-msm+bounces-90937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMvSGVvieWm50gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:18:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D63E09F59B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3DEE300CCBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D242DF12F;
	Wed, 28 Jan 2026 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKfkAlOd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dnUq/Wbe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CB03EBF1C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595480; cv=none; b=gqLPCbfAZ+FN1bly9RfGLT/l6dN4g3T1GuDcpi5eQG6gc2Fm4E22U/Nl12276xZdyU4t4UtQWdYLs40K9x8vWAOAqeV78Ea1zomP4ldgeMZo1PRdxmszLPaSSu0MwUDFaK3HrUouhjYxX0y8TkJkIeLiebPuONlXsKqLI9R0IlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595480; c=relaxed/simple;
	bh=O/9goh1xSkb+EelmdQyLMFXz3I6q3HEZ87LSkbwQDO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UMWKvw/WrUzR8wy8Dc2rXr+5fhPs7A2fNRj9rokKhmwYCemoZYByS1mo1p+MYPa0pytjm5tKT7/uoOaKfTf/LnG7CXJw8odyELG6kZmPSBoGX4LgfxZgQR/cocSMg+p7k8CbgWKohvYi62Yv5c6SnlufUD68gEBUM/kmG4LhZ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKfkAlOd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnUq/Wbe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S927W93920918
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tf6LbgXp6mx4YhJ03WWvmUBkFvoGm+ZEEuhHUmxDhQ0=; b=YKfkAlOdB4K4dkw/
	jQj0bvXGC+96ZvYcX3PmCzj4SDFe8SQ/jvEqUzlYKTZwZvcvlyfdK00EMm1CmGCA
	klByM14Dab+YvGD1C4W5iXLTS+70AAXqLnLaudSt6LGMq07ubvZbipzOBzgoA0vJ
	p4wHG/YWAT2HJPWF5OrwlQfuM43No8KwOI+WXS58nh5Fu8BEqp2OWPAaOgldN/aC
	gphSPvDsV8Co7dl+1STUPlbHTz3ZLrzUl5fypa78TrAG2lFUvdWzKyewI92f1gnH
	W4V+7aVHWRKpD0tmAkp9u3aVfYbxa5eL7fBZfI6RfLX+5seAAp2wu37ofc7MFkGE
	Yb99eQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by211aw3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:17:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-502a477885dso11253841cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769595478; x=1770200278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tf6LbgXp6mx4YhJ03WWvmUBkFvoGm+ZEEuhHUmxDhQ0=;
        b=dnUq/WbeUeZtANB1olq16br0OvRG2eKrXLFaK3X/9nrBi8yKWoQ35jlG8O9PPRUKDP
         Tf6bQDxElr9rk539dxj6G0As29/Ijw6izHm3F+3h65MKxB/AGURgsefpj/NGKTAblvAR
         iEzHET/weAXbQApe0lU3Y9p6UgYVwT5gXX1NAgl7rpeYbu9mbUutit415JIPm7AXHNKR
         Tpd8SdBlOkzEQ3+tN+sp6d0N1787UOhOgVD0MsRr2EjBbg2daSM8+f3ssl9b88g3znQR
         oKjMonyqxaI52eor3WslB4Kp9Hs5xYNMtgXBDnROoiqrwal8/BzTh4YE09AeCaPDLh1c
         MXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769595478; x=1770200278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tf6LbgXp6mx4YhJ03WWvmUBkFvoGm+ZEEuhHUmxDhQ0=;
        b=d+tC8sWGJY+5yNwD3ZsuP6I0NVclXmmoN2TBQkWjDv1w/lBmLH8nPdODC42ZoFXgyw
         4gfYk6Q+kzbkCH7svqMK21BUS/q76L6D1V9pOl581StBdhZab74YDuaEardvXDOqCmGT
         ZxevErzu3cnlVUX0aRGBSwg7MvP6rYN++XXodN6sO+T4PzUT1aK+Yrb8BclFw35xBSLP
         ne9yQAVbTh9e7YUcphfgZFfL14ajwXMtfxf6aRXl4TOLtJVIS88wFobMYP+lfjH7y0If
         fVMeQ6a0lU2O+yamNx3B/CNOcNoqqdFNvxJYYPxUb0zBSlN9owMmx99f6gAmyDeUHOTN
         gd2A==
X-Forwarded-Encrypted: i=1; AJvYcCWnJZXVl4l681vCA1baAjmJx6TacFajPG/ml5baBZEgsYc5gTcw73rO7zel3nJbtTmOYoiE8aXmrVsfDbjp@vger.kernel.org
X-Gm-Message-State: AOJu0YxMgJ8iM8rIh+SfYjV+zad8WRkqdIOGcGUfSV7qPH270HPBjvWy
	ZInek6wc/kQ8skTI5oL8jxARG12OdrW05gy0IEndm+NSLO6TlLyvseAeMflVUIK30rJd1P8hTcx
	uXAiw1F35LjWcSZaK+1Gqi8y3YGduDDtMbyrbVZhnFTKU+a9i0De8OJ60TUUgPvsk6g0i
X-Gm-Gg: AZuq6aIpsbK+oxz/K35PDlHN18t6nOMxuyK7DO+J30VepiT1De4+Sae489bvt37CBOW
	NTugMxPROkeMJ7BunG+dUpT1YDewFoiVwdT8/BKgqJn3oZzeEaKMJVmoZWlBJ42fDJZOWqZqZCl
	wKoQvLeDS4P4Sgc3rPanUIwynKgWQK+hES+v6pUmoGGXY5iJdNplO+WSlcGBWVEaKAvHKWRV7QS
	2G6ESA82UYWwyyUf82ziAt9uB8uWrREVpmyx25uInui9yh9iuhqdCPTSTM1cQgGd61sB1E5074n
	M6jeayuIibfMgCpKDnj9+GTfqoSw/g8YdDxRm15Cm5VPBVKpLOJH2ejsKy/CTqUng6Mem+4DDTS
	rbSQXMoqol7ydt5q38M9fPLaQOpgxO0IOepHsgvQT2L7DinwlmDGxPUT23IzZrXq66qI=
X-Received: by 2002:a05:620a:2982:b0:8c7:eb2:1c3a with SMTP id af79cd13be357-8c714b45365mr125364085a.1.1769595477535;
        Wed, 28 Jan 2026 02:17:57 -0800 (PST)
X-Received: by 2002:a05:620a:2982:b0:8c7:eb2:1c3a with SMTP id af79cd13be357-8c714b45365mr125361085a.1.1769595477011;
        Wed, 28 Jan 2026 02:17:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf185214sm111600266b.45.2026.01.28.02.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:17:55 -0800 (PST)
Message-ID: <76763847-e5f2-484a-9ff6-dab5906bdaaa@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:17:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] clk: qcom: camcc-x1p42100: Add support for camera
 clock controller
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-5-b23de57df5ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-5-b23de57df5ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4MyBTYWx0ZWRfX6Tg4H+PRgul1
 pAmJnPRGyxJjj18Ps0kt48dOWf1SSW2R/518Ia+a/nq2YsSImxDEuRNl7iBfPzkYIVWzSvWS2CN
 akv6LbBuYjjF3THDbjyKKmlkmax8/15OR6VZhZ/vCxfaPjjg4Wi4OzzLgE2Ra12LInUkgqYPpJQ
 MAm+ShQjPlWPdI3F0xX3yDtktMRdP+lEBSCUPGVaBbnqumty05jkVBlAX706/ZUFQoAEwP+5Y+V
 B3n5miAoqAANvlvYv09B20uCNuikzNis6zEi/E4Qb+McPWvIfRoiM66rgYSoRquN6HP8xY4RheM
 e6Em1D18OvCJoswyAIPcOmlUaooOE5GKf3KHKPKUtAoPEj8okYnohFtNqXb/t6oPRJzftV84j++
 uBXvweIsG/yCti3IrZ9gzkpOdaEGoFZXYCfhMce/0MCXFSUvQEUGhmELX2scnqQTapJDEZIJmaF
 HJFc0jnjzZPjCqdQfuQ==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=6979e256 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zb7rluFiWWGZWzxfGAMA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: vDW37Urr0CnWtM0alyjM5hrY3-RJg5i5
X-Proofpoint-ORIG-GUID: vDW37Urr0CnWtM0alyjM5hrY3-RJg5i5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90937-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: D63E09F59B
X-Rspamd-Action: no action

On 1/27/26 8:26 PM, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on X1P42100 platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

[...]

> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>

I have mixed feelings.
 
Purwa lacks sfe_0, pll7, pll8, ife_1 clocks and all their supporting
infrastructure. All other clocks seem to indeed be common.

Perhaps it's not that bad given it's a strict subset and they have
a shared DT

The driver itself looks OK

So

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

