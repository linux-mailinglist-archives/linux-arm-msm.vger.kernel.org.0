Return-Path: <linux-arm-msm+bounces-118458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yoQKHntgUmoqPAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:25:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E06C3741F84
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:25:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lRmXonB4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JfESZJXi;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118458-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118458-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F11BD3005AEF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 15:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1533C33F8BC;
	Sat, 11 Jul 2026 15:25:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC6D2DB78C
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 15:25:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783783544; cv=none; b=iOcCgDDiADR9BcNGbQKVTPAq4yr4LO6jzMnJGZeOjac9SecYMoHqUHfg9ho3WWf1qyCe6mHq9RxuwohZ5npBLXkmm+qv7/Mnp/sBnS+Wx7b2/EBjV9DYthRhIRwl4GpeqAocuS0ETgrnj7CqsoLj9GCyRpfVxVqIsqsvZ53qgf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783783544; c=relaxed/simple;
	bh=rJLA6cH5k8wkYSbeqVGi+qmnb45xgquJNUTKvf9Ltfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQCMSmCRzJXyoCJc/pJTxJkrrbRjSkYArYoSphBUfs6heaXvsPBZYMBci59kKJXjPCwux5R56VwgCJVOj+OAHMi4PCK9OoudL6aQzgQIYdiuLRtf1ORz+kaInVq6nTRLY9rwjNHRP9ZkzdYs0t1K6/m5ZyAnrqEjwnkzkWyeQ4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRmXonB4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JfESZJXi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEODx44113142
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 15:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vHMuzOF/E7LJXY5/0s8/KcxzKly0C3RXJvgtavb1Eo=; b=lRmXonB4GBUKFvyI
	QADBqdivzcKi5e8q6cbs+f9PtLTlh3E2bPM+rybMxa0NFcjxHlAMu+QuDhJ/+sZV
	5IuiPfMH4OqreAm3dW1+JH9+0t93sHNgo0qXQ8ifkBzoGy31ibB3c5jjpTbkp5EQ
	gCxecWgqP7tNklYbVRugUqf00rTnvMbxeoh+18gelRYruWjE2Kin8ncqOe/+/T4C
	oMRqvvJd6HrfQtI0OV5giYj8McSlo+Y3oSRgEfkhGzOaKGGguIbZwo+sxa8Gv8nF
	G5u/HPg7alYS+M/g49VNbVFX5TojmfQ1mRUSdAG5PexdBl0gysLgtgwQcIIdCf+Y
	i1g/Cg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9hh38q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 15:25:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a9764f0so22325141cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783783541; x=1784388341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+vHMuzOF/E7LJXY5/0s8/KcxzKly0C3RXJvgtavb1Eo=;
        b=JfESZJXi9Eco/KpIEh6PyIzDBJAxgFkjMA9rnLBE71Lht/hnMcoBB0GuwSBRfeXZXW
         WYQ4Sxajqw9+7lsOzXDbVZULR6B13QXtEbs+PdiYKfW/hWwDcSHtr1onZOHlOzAx+dBL
         muzDWkZGjkYGsvWa+pOb4oNqNTxKVONwncZ4FgJB219m2dkxQM8D4BOja4E3JVjf7JGS
         SgUpq0jIkoedU7OaTTMqxXEjw4uH8e0zwj0LVK8wjsk/uKd4mE6ocV80hvHJPAHrTQe4
         kcu3l6XswjVJ4TGinowzaMPzdABWZg0V9Lok0o2Q3d6Vcq2eUMr7YUlXcq8rPl+k+RqI
         OIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783783541; x=1784388341;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vHMuzOF/E7LJXY5/0s8/KcxzKly0C3RXJvgtavb1Eo=;
        b=ZfabaVh2XYOXEqLHFGyE7uwQJjukovhQjf68dh6wTpG1nxbTaKeRvFKUdwzOo6xZv0
         hh5Sa0IgVIo75DF+ut2NjOBq0yRPeKdYdXIPPPMuNih32uVlmuGuKZWHEMgDKhAFA4+x
         qJJcxIFlqWHgisx6rpQfKf1YXBfPGbC3M10VnFpXGyOqQRnP4BHQE5etavxrmgTof1QC
         6ts4TyetORDoS0YuxHAdbdOlA79OYkIMyQT5Eow8fDy7h9twWe3ccK6PtNkpQADfKs7F
         T9ZchIHBs5B+CQs+YbFKrtu9b7+LAmh6N7UAetrwksYd/EUAKWkEd+sC8e+cX9jB3727
         RFVQ==
X-Gm-Message-State: AOJu0YxUuyb6NjJs1LxK3sl0alXEHXNMw/YyaA9Ku/j/XwjoUq8FQDkA
	so8yq2gUqznD6CZqIfw8N1hyQr4+lalKyZ2ypNSMppAGjDIBq1l3SEU0bHnQ9jRikuYK3YU0Hpx
	G08gZveKizHyBn57HGU+7fsoKyM4JrGFTBKFLK3rAcMksKXGu8dQURnuwOfVJ5GMKI8f6
X-Gm-Gg: AfdE7cmGUr3UkI6IAYLuD+Oo0Mr62rBrJmPY9NRosR0loevlORuUukdNbWxHbpAE+m1
	Qte59mczrAI9FMV/3rNAesnFUxD0SrmagBbRdjBEFIKgisytiDDXqturGevjbz/K03c9a3o0LA9
	9Sxo8VDRA+6Y0CUAQKVQ2Z49zVZ+9zL5Oph9zewilOFrlWrPJoE23VU05x0T3KEeqx9y79TkY4f
	rv/Bqg2tK6Vl9F2/Ums6epRFl/JhMRWrG4+mZvPKZyKiqvp83btuxxqIvsmjmq/EBbIwqELFP3k
	+rlYGpycmnG0k7vjDNufvDvZgQZPeiiTtgPcRufOWNMGjAu61in0PJqrQ2DtB7YgasZY2qo9vi6
	4o1GaO0NdhplcrH2jZi36TVqWEjwZh7JEYNk5onEd
X-Received: by 2002:a05:622a:104:b0:51b:9873:e379 with SMTP id d75a77b69052e-51cbf23072fmr30304081cf.36.1783783541152;
        Sat, 11 Jul 2026 08:25:41 -0700 (PDT)
X-Received: by 2002:a05:622a:104:b0:51b:9873:e379 with SMTP id d75a77b69052e-51cbf23072fmr30303791cf.36.1783783540689;
        Sat, 11 Jul 2026 08:25:40 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73b161sm200528975e9.9.2026.07.11.08.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 08:25:39 -0700 (PDT)
Message-ID: <8e8a5244-6df3-47d8-a8bf-f1a367e46b34@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 17:25:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] soc: qcom: Make important drivers default
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
 <20260711-qcom-soc-kconfig-v2-3-4a907e064281@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260711-qcom-soc-kconfig-v2-3-4a907e064281@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: su6YxwwoHho4wyiKCgK1QdW9-3J0XSBU
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a526075 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=oiTh_mz6bHpUs43kViQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: su6YxwwoHho4wyiKCgK1QdW9-3J0XSBU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE1NCBTYWx0ZWRfX76K0yquG78Bg
 F4VNj9yDdB3rsWF40dbs+6JT29sOpwLB9BT5Vg0QhzpD4Eh7FcXx0bfyOcsBMdU6rzira3YgNc9
 xQdGryumJsEiFhzGF9Utssh2rVigJ6YnPStqGIFGRdMngquC+MAznX1DNqQ6E6IstIxN8MIaPI2
 S6XQveQ5qmLWjciu08M5U67fnDoOTig4SWSdck+uRAN+cQovNqB11MqloFAz327o10jIANV1/0f
 Zu4I+ZbvgNWLXY+xjRcNnNyEMUvUJZYJ9OhEZ9bFvs3S2xaf0SHDei/UeGRXKTkwtussLLLC/dR
 wVHaWeE5GU5VV5M1F1rQVHaoX/EuISyERSnNaeaQmYvwmTh0CNaMKqithpjLxIKPqEQKl9rscdJ
 /7W4ypp1+DyC94WBR92Uh/cG1IBePV3uNxFPYaVxalL+S4QKLJy5jZGsIbzmFZ2xfZYJ/ipzd13
 Yy1OUb91Pet9roeeReQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE1NCBTYWx0ZWRfX03GwYKXt/zJC
 83OAVYYyAHiSmtZ6lrKc7OLakM71W+/6XdX8nAdTHGni0la7TjfhBJdG+/zqALTfiIAdMJyg9SF
 aeOdS/ugIGz4e1yn6W8aV14d2G+hUpk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110154
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118458-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-pm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E06C3741F84

On 11/07/2026 15:25, Krzysztof Kozlowski wrote:
> Kernel configuration should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Switch most of the Qualcomm SoC drivers to a default 'yes' or
> 'module' for ARCH_QCOM, to match existing defconfig usage.
> 
> This has no impact on arm64 defconfig, arm qcom_defconfig and arm
> multi_v7_defconfig.

Oh, that's stale message...


> 
> multi:
> +#define CONFIG_QCOM_PDR_HELPERS_MODULE 1
> +#define CONFIG_QCOM_PBS_MODULE 1
> +#define CONFIG_QCOM_AOSS_QMP 1
> +#define CONFIG_QCOM_APR_MODULE 1
> +#define CONFIG_QCOM_LLCC_MODULE 1
> 
> qcom:
> +#define CONFIG_QCOM_PDR_HELPERS_MODULE 1
> +#define CONFIG_QCOM_PBS_MODULE 1
> +#define CONFIG_QCOM_AOSS_QMP 1
> +#define CONFIG_QCOM_APR_MODULE 1
> +#define CONFIG_QCOM_SPM 1
> +#define CONFIG_QCOM_LLCC_MODULE 1
> 

and that I forgot to reformat.

I see this was already applied, so let me know if I should fix it.


Best regards,
Krzysztof

