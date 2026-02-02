Return-Path: <linux-arm-msm+bounces-91509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMvUCz+7gGl3AgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 15:57:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A81CDB72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 15:57:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F832300EBE5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 14:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3943C372B52;
	Mon,  2 Feb 2026 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGzS2n3x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kQrdi8g5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5CF19C540
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044041; cv=none; b=sStyj6+i5+vaf/yhP3oAHMEfeiCYAEaQBiYhEgHyfbiAocGjancBW2sSRbOa+tddPuLw6gJ8HGzamkEkyM8Uh5GRy3PowbK2D7jwcYd9J12y7RSTU+zjQtsXmhD3yL+8g9/jHRRqm7cJXaJ8ZSRuExDMbf1VAyyP1fc/Pc2ddIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044041; c=relaxed/simple;
	bh=UqeDK4RsfAzKZ1rg6NnKveKlrERd9ILP3xgumZ/4wr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6cbBvwrm64r0cDcYT7WV9vA9Lsyie+hhnBEVxxz0X8tdR1C8haWSBY4zqiWjA4I1qls27VqjksHrDIUJXpjJhia3jb5El1uY03loKB9F+erkdf1xvuT3bXzViHTKrUtoXPUx2OdbSSciafNFMIQ2AgHM07wG3Rw0wQdgEQOsXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGzS2n3x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQrdi8g5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612AvwIB2262031
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 14:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsknitCYb9UiikAxJqZ9uv2e+Vzn8UiuNyv88IZxQ/Q=; b=VGzS2n3xh3AWYRCz
	74VKX9bgR8mA1WDUITCcmoc6e+RqAyg7PQ8OXOseItw0+WXB0vFhvSthIIRQ41O3
	V0hNtCcA5yVKvrfFmseiiWfFPGB6tKux5I4yL6d1ZMc9Uw9+KC2YRirSdQ7fdJg6
	Etc3uNPcnMXJ9K/lpN29LEjtAiuGXuBe1UWlWEJGmZLN9C8EKbgP3m5ZMbG7jzhl
	xx+AUZxM3UWj4eUyr60Nh/hYVP8Saq+HVmyCyZwcgRBESEpl/eG1DL9NywTppfS1
	ZDJJSuqd0+hntCaWiEvra55oST9NkkbpMYOcgxOtyx7JCzSCQagsgNqB6qfsHvV4
	I1ByIw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tmtgkr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 14:53:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88887682068so13869126d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770044038; x=1770648838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jsknitCYb9UiikAxJqZ9uv2e+Vzn8UiuNyv88IZxQ/Q=;
        b=kQrdi8g5mXF/FMODWzUXqMBradhW3wTezdIgwjakwgOXAJCdtonRRT8l4PuPJFU+BE
         79iU1u43HUUYD/Sadw21dWDCCF7pPI9USgDR5MZLjnY7zWLCTJeGvX2J212bo4zlM+S/
         /KP4wG5rl3BfPnbiiE7qGhrCbNZvTAUNgVzFiblP7QW9I6OEQOBu2vaYregIolITOyAs
         PZT4j8U/0g4vxdifzD7oVzbrV2soOEyGg4wnmwVQh/aXmEBexumlIClmcXh5la7mv8it
         tUyCQnD+bUFgNjTsYav7uXfHFQxDk/8O70GVQPxrPf2NtIAOxZWqBChBiZLASWkW9yiD
         WlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044038; x=1770648838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsknitCYb9UiikAxJqZ9uv2e+Vzn8UiuNyv88IZxQ/Q=;
        b=q2YWoHiXuqw2vmH+Me/QvWIs3yyRetqdk3CPohGfyjFStnTrTv2aho9BO3VGrW8H5d
         eHWWNAsuHmtLiYr1P9hWG6qFdTiy5/cTZ1t9M1gFqP3mqfU8M1tMM/QIlZSsRpGrLxWn
         oRCnmaxW+vM1n3/7ImFZJ9BGaIn98fWk7sKUfrxrqirykasbKRvZITKwCskFoRYb/9yv
         f4c+6lxzUV9Twdp7bmhzQ2rftqnu69pt2JEhb9SSqXXmTr+7Laqqhf1RoYrK0LRQeo7m
         D7NiTXLMSh63Luok+rxDXBoKxpuKviswtiwJrZpj2i9sAL/vPazHRhY8XS4186oOGq7G
         2QzA==
X-Forwarded-Encrypted: i=1; AJvYcCUEt90f9+drI61LV8tiEBE5chgDyWj1cCGMt7XPWzB1B4JsUGPg6nnw4whi3DB5s7bu6xTAiAK8YmGU8Fpm@vger.kernel.org
X-Gm-Message-State: AOJu0YyJHppWzjSs8RFhSZfGgBmOLoUGnNsuhbkqxYtcG4W1z97IbZBk
	/IbYFPkMaT++HIjVCNkY15LXStLq31Atpizi6mu4bXGcSn1sjlVe+2MfwVZltddkcETj3WDXFYE
	JgTtsrfHZNH/q+3ZiqOFf8PJlMP3fjzOtaJjDohq2WADiWZjc8Hc4EqIlxD7Ab2Jd2H4X
X-Gm-Gg: AZuq6aKYi5toCegmji8vqHfZMqDbH0nh3W4iPpqA1EgXzW8kLjviF44FJlwQce8bO3v
	rvmFPvYZtuePjAVqn/OVuPmRj8drdM2XtiSw+/A0Y5sjrx/UExCX2BqIIBpQ4+m3gvW0tntCfZz
	sP9AzyAACJjBsvgA6AJREuwVk4kmsampt0JEf5+LbmQTs7+0wcMQgUbeIi8UUTrXA2w+p9ubFmb
	0G3svlNy8kXgsETbPLj4A13DiIPVs96gkw+dmsJmqnOU16tksfccn8Ea9EAYWeI6YiQyYarpzOR
	Svx9XYyy2j3NaA1PxlpO90fy67YzbShYlGfz+ilOej0j7TJ7H2SQZ1UjI3m6aEkM2YwAOeNkcOn
	EQoXeMbFOskDjS3ryXu+W5ijP7xc3o+Liqy42qp2/RKaaYUuc/uiDLpDpKkoN5w6b/B0=
X-Received: by 2002:ac8:5889:0:b0:501:4504:6f80 with SMTP id d75a77b69052e-505d2288f8bmr124104411cf.9.1770044038178;
        Mon, 02 Feb 2026 06:53:58 -0800 (PST)
X-Received: by 2002:ac8:5889:0:b0:501:4504:6f80 with SMTP id d75a77b69052e-505d2288f8bmr124104051cf.9.1770044037676;
        Mon, 02 Feb 2026 06:53:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481b5asm3638004e87.19.2026.02.02.06.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 06:53:56 -0800 (PST)
Message-ID: <6e5924f2-a9e0-45db-8a79-b328ebd12a0d@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 15:53:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm
 platforms
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-13-praveen.talari@oss.qualcomm.com>
 <8e410852-37f2-452b-b851-19b7c4222727@oss.qualcomm.com>
 <e9d3c0b8-2abd-47a5-b594-83f0288d95ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e9d3c0b8-2abd-47a5-b594-83f0288d95ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Xb6EDY55 c=1 sm=1 tr=0 ts=6980ba86 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Hn_5opO5PlqZgVx7yE0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 0wypVxzFo9Ktnqae8ydi1Zkqf84FalBy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDExNyBTYWx0ZWRfX1eKInlatRp9t
 qhuIxK+Ka95tE8P/ufVA9CXZXZInz4kQFvDzCD/c33nbuP1+UrNwUYpaUamyDzqJyXIRi/Ts4Zf
 PxX8cTKXMFhevrDC69leJvzT3ojBAOgdOjJlmU8Pov3ZvBc+bnZEdUdZXzjvQa/Cvm9MrxQqfB/
 apJzTtwYlxXGciULJ8Uo6zlgESa82/8/b6fhMEayZodgDlijseRx3mzFtLg9jVlgbVIBx4elER2
 mPJNy8v6QXm+1uVISRa43poGiTWlEcnQ/Unyz8LVy5NLmJG/kXgrhkyXaolEB1nIJi5/3oTSG4R
 yJ+MlFkjwQxKTtB9gr8aCzvdMLHnJnab9c6xzQmPF39v754Q9xX5W5F0UnhtPmjg/PRobfAaoxn
 /wgizEa0adYiTJrb+Sg71WefMGu+i9xuCCydJu3elzg26KeiI/4Wiz6y7K7vq6K1PxuKyR6MSFh
 krQkn3nrZe+FaqerOkg==
X-Proofpoint-GUID: 0wypVxzFo9Ktnqae8ydi1Zkqf84FalBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91509-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54A81CDB72
X-Rspamd-Action: no action

On 1/30/26 5:44 PM, Praveen Talari wrote:
> Hi Konrad,
> 
> On 1/30/2026 6:04 PM, Konrad Dybcio wrote:
>>> +static const struct geni_i2c_desc sa8255p_geni_i2c = {
>>> +    .resources_init = geni_se_domain_attach,
>>> +    .set_rate = geni_se_set_perf_opp,
>> This means, on SCMI devices you won't don't the vote on the POWER
>> domain (or PERF for that matter) and switch the GPIOs to a _suspend
>> state - is that by design?
> 
> With PD_FLAG_DEV_LINK_ON enabled, every pm_runtime_get_sync() or pm_runtime_put_sync() on the device triggers a corresponding genpd on/off transition. These transitions are translated into SCMI power‑domain commands, allowing the firmware (GearVM) to perform the actual enable/disable sequencing.

Does that handle the >1 pd case too? If so, then all good

Konrad

