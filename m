Return-Path: <linux-arm-msm+bounces-105672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOmwBAdm+GlpuAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 11:25:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A12BF4BAEC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 11:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96A87300598E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 09:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774D5378D77;
	Mon,  4 May 2026 09:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EwMpDJNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PgX5RlTx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C54D364923
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886723; cv=none; b=CQa+FHOcX91ApqoItn/AUqUXnOlHzifteGOes06MORJQg/U+rbre0aSXHcrAhxsmuLlJqPyv4uQLvWJTe+9Uz/g9ex9j0rqfSNV1Zyp2aGgUInZTZXHZqmYP+aS3rBgRY2g0el/YxNZEzX7RpqmzTIys1AcaX9WhQxS+BFvUiks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886723; c=relaxed/simple;
	bh=QXh8tpoCgxIgIRivtPfwf9N7Ak8nnu/99/ev/ItSxFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iYS9sfz4SimQtniGSRqQ1Nl3qcShnLvQjOvgkXZwe5mqSFvZJbGnwI7EDfNmDZEkViNfm7dOzR+kBM/D9Pq/RGva2dgizjuqgm1lmAVFMw3IDJXZBgIuiQ0QHkpaDw1gQ4qB7K8FXirWinK0LWL5FaRzvdjN4ArO7m9Bke5lmpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EwMpDJNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PgX5RlTx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fSwg2539178
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 09:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NuWaOvztEPnbaaknO2almKhoHkHjQ5+e988XXejF9fM=; b=EwMpDJNvlTRTPpps
	IIifzaLH68OW/kfIGuOnkK+Z8h1L9O5Vhi4rDnuI65D/Rm+qp3vkgfcQmeZVhyRn
	Sfp5TK4xJuuVRqTV0RG3GZF/s7Hwoc8tsu8urAry4WhUeNCw3YbsqlocuT9rBG2y
	BTCvwYJVZx649XHKrsyspuTvJxtvbk/2zNcZNqBQbNN5SFx2ye1J3VaoTMTvmBFl
	8vcDKtp/A/vLWR78OKmUwWMadB+q2n/Et8SYl7hk1qx3lWqAMTaanPVCE6ZzDPrz
	FV61YHeezdriZ+C95NuoD4UcgqtjtEHXm+HhMgiuvthhV056GqHziVVEBbaIFu2u
	WU8iKQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwxk1axgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 09:25:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca8a79f42so10217486d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 02:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777886720; x=1778491520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuWaOvztEPnbaaknO2almKhoHkHjQ5+e988XXejF9fM=;
        b=PgX5RlTxrvlS29ydwIugdYAA1mFcEy2UuoIHDxlKc3Y1R8/izu1cF3nxWjl8e3VAll
         A/qb7NNTtJB3u5P3u9qZY/gfe4DPnYRjEIemkyh3W2HSoQr6DmkQUrHEO5z27IlDHidT
         q0oFy4cNKNizL50wfHVSw3G/GNjP6fnbjoFfogempKVkNwT3/mQaJ2ZYcFF4Qj+QwLrx
         7R6VFYzrf9LBrtsH1LBUKhjOume+q0+1Eorm9CVj2hBKuecKerqDnC3COZXIApsKfGmr
         yC8Dt82Wg3sWcNwcmfWafS9bRDI2qiM9V5bfQ8p4lwjTRDXAGnD6LFA+34Wp1nOrK0Ec
         nqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886720; x=1778491520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuWaOvztEPnbaaknO2almKhoHkHjQ5+e988XXejF9fM=;
        b=f1uhsUcgWlZDPmpcIj+1DoGtA2ABvhI0NGhph/Xb9UEfM4D68+Ou3TqBv4tTGYvUHC
         tAIN2lfcIjtcQMNUddof2Q3mq3YBkUFpBGNDAOPLLxWZy+kkO7M8T6FOLijyWZvvl3kv
         ot9egMeYlMNYog7LyYsMvQj4LBIMpfKpzKKBd0ZFLmZYuNlXdx/9kYGAMq4BhnS5YG4H
         FZNvDdtLu31/+YQ85Atv0VNYOAQUQp8Rbi+vM7Ux4mxAIbdH45iAR9i/26wJMc6c/lDI
         4EO2gapl+kEpHR2NcGRbipksDe9w5EiJ/Z6iWY4eALMOgXtu1/P8KW8Q0OApGDEcU6lE
         L5Mw==
X-Gm-Message-State: AOJu0YyvVbqHIYpZkBvWRP8RsfbR0vRXzQmCZOVAOefiJr8NxPv4fHun
	ZmFy58yvqgHJlAsH2vKfWvzREkvxVMla68SsQ9rsY8tm+AHF8fwHPxR9q+isg98KKgBDWCCJ1iV
	pT/aGF+w6ezq/izUjjajlBdvjCkgM8D3lFmOtDmhnfM106IYi6hH2jaaaqCoAgbDqp+bw
X-Gm-Gg: AeBDietF7BpzG2aZC8g1OiL3zixq+3akYvToyvy/yrl4DjVzgHLjSHvTZyCEo1x93v8
	cj3nKjy3ddqTBAIRuMyMNADwEpjIWxHwxEjWQ7wImG5qXbY8lIxY6tP3BJJbZerTKSNucx92KBS
	Ewergp0g40k5qQ6wfKsBQJRs9dVnaS1VlnCVnxXc0xjaA5yZnFeTVib9drebcD97Aow8VrQFap2
	IlgFsNhMluGhGVCRv0rpjZRmGmlDMDjFdIy/3p/DjXcVVFg4PtG+q9eUdCF6glOQ5Kqfh7BzX7E
	r8mcGt/5PgGDvZaP26Jyf55SRkhTUnboli4PdlRH8cplSXRL9U1IQ7bMgP5sCQ4IVD4oOvXB0d1
	q1PMVxGhKgXYTqilx+D/9LrtvOAsO+/Od+2cNsGRlLRRDQwDam9SGd3QKQUF2+nVyaY7Yp3lenB
	azFOsrwk87Pmw+Fw==
X-Received: by 2002:a05:620a:1709:b0:8f1:9e59:2208 with SMTP id af79cd13be357-8fd17d49509mr960459285a.4.1777886720579;
        Mon, 04 May 2026 02:25:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1709:b0:8f1:9e59:2208 with SMTP id af79cd13be357-8fd17d49509mr960456085a.4.1777886720179;
        Mon, 04 May 2026 02:25:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b85e281cdsm3115053a12.3.2026.05.04.02.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:25:18 -0700 (PDT)
Message-ID: <9eb8e746-5191-40b8-9edd-1286e41cfbae@oss.qualcomm.com>
Date: Mon, 4 May 2026 11:25:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: slim7x: Add Embedded Controller node
To: Daniel J Blueman <daniel@quora.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260502063518.15153-1-daniel@quora.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260502063518.15153-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA5OSBTYWx0ZWRfX6JNY4u8Q1lna
 ru0R8riJWhnrTQWRCtQhtSnfpUdLqEdGN/eVBafJtPjCagnIHmyUVaHly+eXfwyk3+8hcC37yX9
 rhiMzU0q7jnBvnX7HKvCdNprF3FBF61U++oBVOZpVbKD/yMkLpPM9ntNyN61JZUyKv80p6ti13P
 A2PtYiy4U/NFedWx1D0GHaBCwZOvd2oTYBoCt/Tadfrc5jzNnZQECnlYa5EOdqfha2XMZivYlTg
 EnSf2rWh/odSMeQpX9VG4FYjE4RhZovBfAmdrc/nTR0DWF575Tb5Pp6DngHZCBFKIbxjfmo1UYH
 gTVeDSf2NLZjLYxsPnEqy3VZDBuK56EuJyOvLaZ7wH3BcuRg4qwA2SFuShXr/fsUVg9UGSiUNCb
 pNUTrpSf9GGg3LOiTcp098XBRY1FVzWA6zeZ57xSruzn5iUqCnvB8TsinmW5n/BFZGHEfymrsXA
 os49v8Rd13Kp+ur+yGA==
X-Proofpoint-GUID: 0SktLlgRBpMXUenK4oMTps9W5q86kcuZ
X-Authority-Analysis: v=2.4 cv=bb5bluPB c=1 sm=1 tr=0 ts=69f86601 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=t9ty7G3lAAAA:8 a=hdOfQ7PHE4ms6XNvABgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: 0SktLlgRBpMXUenK4oMTps9W5q86kcuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040099
X-Rspamd-Queue-Id: A12BF4BAEC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-105672-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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

On 5/2/26 8:35 AM, Daniel J Blueman wrote:
> The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm
> Hamoa Customer Reference Device (X1). Wire it up for fan control,
> thermal sensor and suspend behaviour.
> 
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> Changes in v2:
> - corrected DT compatible node

You still need to introduce one specific to your actual hardware,
even if the driver receives no changes at the moment.

This is a measure to enable retroactively enabling quirks for users
that update their kernel but not their DTB, so that if a year from
now it turns out that the yoga EC requires some special handling (but
other users of qcom,hamoa-crd-ec don't), we can easily quirk it out

i.e., the desired outcome here is something like:

compatible = "lenovo,yoga-slim7x-ec",
	     "qcom,hamoa-crd-ec";

(the first compatible is ignored by the driver matching code today,
the other ("fallback") one is matched on)

This will need an accompanying change, adding the new Lenovo
compatible to the dt-bindings file

Konrad

