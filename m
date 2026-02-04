Return-Path: <linux-arm-msm+bounces-91843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEf4JFeGg2llowMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:48:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE4AEB247
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82133300E5E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 17:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451CC3A0EA3;
	Wed,  4 Feb 2026 17:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahUSvrxf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SesmB5hQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1985330672
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 17:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227280; cv=none; b=EPSCsxGN8QY+hKgWek5CVUAjglt3VQmDektXi8rm9qSiqru7/RE8lWr263I+M5iCWkjAWM7QOt/eXNajodhdCXmMvSIqMEkA+C+ok7/5HNvecDRtLALZnMezb/RknchA1s8aXwP8IdXHCOa/oVejIr+Ow4Rq833LIZSGpkRyIYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227280; c=relaxed/simple;
	bh=6/WPQt7BwJrOzLy6rmTjQFrAh9jb0HTaryIYwua5nFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixDrqOx3PL56W2zmh0j8cubdHGm+QUXiss1Eb/Mwi/VZjpkiW+gadycbDFyzYr7B4dwF3ZbcPQrqSRxfuGQg9qOMh9TZQF+CGwX8KQJFpKeAxJpVxbPwHG/nxvlOP8oF86N+5fuULh/NWabhTJ6FZq6ByGmt2rLwh8qb26qhw0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahUSvrxf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SesmB5hQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614E4pbg950744
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 17:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5KQzNQZgJIkrTfJA9o7+eF/3VJZBZemUAsh45mfBJmo=; b=ahUSvrxfHy2I6Zpg
	jyvkWEZrBcMJrHPgFXNQFdl1u65uAXhxb1Elfv0WHgLF9RZmKbdBPblKIAknZy1/
	AjwTRi8uluLRsullV4uP0e07KuE2StqkPlAtTUVkafDPIlrnaAAqeVw/acxud0u7
	vDrL8Tm9gNS+GiFk+Hs8BJQEqZGbvahXeP8+K93t3Rdi3DinfA1p+/ANyC+KwFBE
	3EzEEV60y4uBcvnPZYcTq+BjpTYMSl+0XxQLFu4XZaMV8UKCt/O6byjAS8uND9kx
	lMXr8G0bHuzGgiT7TkI45EVUZSpGhDdxdIBRreEufY54+xxt5il5bsdY4oleZQat
	Oo5Ibg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47ja0swq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 17:47:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81f48cec0ccso89551b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 09:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770227278; x=1770832078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5KQzNQZgJIkrTfJA9o7+eF/3VJZBZemUAsh45mfBJmo=;
        b=SesmB5hQni3CPyI/Qkud+/6jfnfWPxLDMsOqfKsomZy7+CT/N3a4d4hQ2ATB3APYpe
         oikBaIn6oZC7ZGNgDZ19xfmBzBoqeGZmpx//hK9gvtSl3GX9cu4vEAZ3P3FGITvCF2DA
         mv9+9TdEqz8yd3UBfNc97v2mWYgR+/h/4T22n+WD3+fz0gVApaYIDLKk70MlDOpX+Af2
         oHz5RF9fCP5f8upB9UWehGwUZ+S8eNh7nVZNc8zp4qWITvzckjCtixFz/u3enxAnuyeV
         f/nz/PD9jrcOzZf21LtWbbEbZn5Tm8cMN+vLf7QWAr6Nj6rJnHxTCGwiJS6zWtvDTTyI
         DLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227278; x=1770832078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KQzNQZgJIkrTfJA9o7+eF/3VJZBZemUAsh45mfBJmo=;
        b=bvM+gmb4oxxEEf5VpLfk+cDaYhgCoGj+MN26NXc7eojPEjenYLNbi3kxChYVcixIC/
         ugsaPzSnCRRSKU++TlmiFRdqNtf5w5McQn0MT1F0CF13jP5z8ptIwB9RR/Bqz4Ad9BSt
         CVpgRlJ3HJ0/Lc95VZm9Git8I+UdVyvG9DyFTpVmRElUTnUwXSIQOki2x6vb0ElO2WFO
         dqF+T993V0M1dJRJ59JNOvDDkaiUcTZIAKNE4Y6vbzO5N3Xmu5rMQjsi/6T4975WpdsE
         LhZSMruKChxaNJYD/mqGraQ5e+F0UvD8eFQ7MEUXefRcuR1Mo6pZeZguHMLUDPqbu0R7
         MsVA==
X-Forwarded-Encrypted: i=1; AJvYcCVQnwqcZSiw6Fkx+nEFT/GWh/T0xVlfvrSTMJgrG567fDSezbUTSBlWz9TpObOv6IBb/TqI/xamdpLifGvp@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf9htumFZxWmEbrltKwfwTyrPiey9kwXanHip69arTYoRf5dfo
	bexNNbAoS8h/h8hPIRuQedi3mGMjHruKlZY7+oqSoEWw2uP3oUfkdfjCmI6EYz1G194Mmtl1pL8
	cUGei0yaOayTgKg+PRcF3Rs14rHYUYxZEUHtxvb1DClwfxRLXqAog3ucL+Gj5cQYq7Qi6
X-Gm-Gg: AZuq6aLxEILVVJ813PfHTv0Rk1Dc3P6lxOLpMn9jSuemlfdS6h9km7H2AffJaJt0Jn2
	8DbazvSn2xJp8zitzGsjF7y2/F66Iuj97Dt9qSht+cMPzblgH1oL9Y+pZ3TFmq4BRj1zgux4cu+
	hyjmfXe8trhpAT66y5ApH/zS/jeKfP4HklaK2aXq6v4BI6gTtJp2BADa5KUdYZFxCWMSEEMl8/6
	KA31OmWQifNRs2erSpqfGVuvJz5oOwHICIe+qV/0yRPXBHPt24jE5Ml0VmOkQgaLDgIry+KtNVJ
	X1C05YuRjLf4rgfUreNCCwb9TWSt45pRfWgb85NaRcZOloQgYpmoL/jgQbx1fWopbuerNyp4ey4
	a3vbw92MzHjP8RtpafuxtzAN7zk3895iQJe2BQ9SgS/VR
X-Received: by 2002:a05:6a00:a226:b0:81f:46ba:1817 with SMTP id d2e1a72fcca58-8241c684c3bmr3724141b3a.66.1770227277988;
        Wed, 04 Feb 2026 09:47:57 -0800 (PST)
X-Received: by 2002:a05:6a00:a226:b0:81f:46ba:1817 with SMTP id d2e1a72fcca58-8241c684c3bmr3724119b3a.66.1770227277547;
        Wed, 04 Feb 2026 09:47:57 -0800 (PST)
Received: from [192.168.0.103] ([124.123.178.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d47dcd4sm3815619b3a.54.2026.02.04.09.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:47:57 -0800 (PST)
Message-ID: <faa4cfff-0d12-460f-9866-1ec124d0f5b5@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 23:17:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] clk: qcom: camcc-x1p42100: Add support for camera
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-5-b23de57df5ba@oss.qualcomm.com>
 <bftoltz5p6rbvuhsialcoiynrhymilwyfqlhlhuvfodelsz6ms@5w2vd4hkof7g>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <bftoltz5p6rbvuhsialcoiynrhymilwyfqlhlhuvfodelsz6ms@5w2vd4hkof7g>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bEje_XtpBTht0zi3zvknro-VrpFmC22H
X-Proofpoint-GUID: bEje_XtpBTht0zi3zvknro-VrpFmC22H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX+0+keuXRIHSW
 vPWoZTObFMOiqckysLnI7/w9zJCSZgtuwx2iQlbAQ++M/D8aE6pATgbvd3pGn1aiGhMJDnynYZL
 7UyjIiCoLK07f6Gv0XXWpDnx9ZcNTvMYYPZl6g+ai8lkmyHORSzMH4AdDCk93t+axvsLFsBH8KZ
 Uvio2tDw3EH1A1rpaQVEBxpwi2n3vR7pEr03x4SR+zzk8UJ0itJF1EU+ChM/u8brzOaTltQUG4T
 MgFVPBlRYctIotLv4YAMFAS4MVy1ogQYTxVPEYZGbxY3QoUNG8kpSgppTVAR4jEUv3X5yB7yoFG
 rkgiZZefnqxqG/gr07IhL+5a/tzoosmttSjThw2si6bzXUdAgfvhcd4en3QaNhDSLvwizhdOyss
 jNGxiyniw649MAQJX81ElREm2dymGeSHYoq2Nt3GDog7LicB0Bu8kWEdJBBRhpIw7SIn5Cs7ruE
 2d1E9jGLZC9cBgBx3iw==
X-Authority-Analysis: v=2.4 cv=a8E9NESF c=1 sm=1 tr=0 ts=6983864f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=2H5/5ZkxJs/wMzWGxXwROQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pI_CbpTJgPHuRsTpROIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91843-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DE4AEB247
X-Rspamd-Action: no action



On 1/29/2026 6:09 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 28, 2026 at 12:56:36AM +0530, Jagadeesh Kona wrote:
>> Add support for the camera clock controller for camera clients to
>> be able to request for camcc clocks on X1P42100 platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig          |   10 +
>>  drivers/clk/qcom/Makefile         |    1 +
>>  drivers/clk/qcom/camcc-x1p42100.c | 2223 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 2234 insertions(+)
> 
> Again, this one is pretty similar to the one working for X1E80100. Can
> they be merged?
> 
> 

Here also there is significant delta. Few PLLs, clocks and GDSC's are removed. There is delta in
frequency table for most RCG's and parent data structures also changed for few RCG's. Hence added
a separate driver for Purwa.

Thanks,
Jagadeesh

