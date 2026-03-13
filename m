Return-Path: <linux-arm-msm+bounces-97529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADymNrsctGlLhQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:18:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A0F284C96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C0003268D3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB5F3976B6;
	Fri, 13 Mar 2026 14:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmOXagPF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frwlslwm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76536322B6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773411243; cv=none; b=gqlQ060XkYDGcwN33p1ZJycyKwQ98HfNj3QZE3HPqvBKFCF3hvQp7S9nDt0tu71HdZ2A/gtKBzp06X0WZxvoaJsCYuHA9aOpQ3ZcX/x4On9X5lim1ij6SH4ynLpMTx2hhqG9eS+uofUfhrR+wwuFGptCP1SuIyLWiaeCa61tXz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773411243; c=relaxed/simple;
	bh=2Ax6mEoBmIIINq7jKCbWHwBPcWYjG4Z6TEjYdt9ZADA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmT4ap3M49rT1/K3/wwZbs4UTUNAYfEN7r7mPKnaHlJBxILjrWvjB0K2I5qMq5hWGli5GXV+rlZFbhDmM0XcmPYJDxI+W1NYyHCTjoR0zYZhou4QYaallRmkhrLR0yNEoe+iGPjxRmhpyCiyIjvRZk/4TWx0CM4jc4RURPcHcOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmOXagPF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frwlslwm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8vQVv482058
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6MkXKrmgHZEgqEUoaPglu+nEPsg2SnNw3eYI/5+7A20=; b=dmOXagPFgDc19zEQ
	I1ngbGcpsA/rJ3dxQEUqfQBGXf6KBmN8+/BQpNkn1RMkkguWcDF2UIUITYySjm4R
	TgJcDKkqBT7KbJz02P+SYgE119LxFikSH9C3z8FDpGGuZjs9lqN2Stg3OrpH2XxE
	UVklkl1aE1HQmd7Jc6XIw++fFs+uzwDfGPhrI8SLF3G7cpFoZ2wk5EF+0BhJhbk8
	6ar9FEVOw27OVbhPMd2Chwk8rmQr0ZwjNR9fQlHNOzgFgEwlHHoMSCtrdTStVk1D
	6uCsiSil4CaJGGpQMcwZ1Nk2mUR0PIGxH5xCsBLOBiuInsG8gAyDSjbMB1d4I28+
	sYmonA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7s223-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:14:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aec6c572fbso106855075ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773411240; x=1774016040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6MkXKrmgHZEgqEUoaPglu+nEPsg2SnNw3eYI/5+7A20=;
        b=frwlslwm3ZlR0nJ/INtWnYB8PLFnX8NUWMoK7/4vjDmZTbgC7HYzY6O0onR7UwTk3b
         VOYLE4uAfLmsoTfBv0m08QahdE4BAFM8KblysNaIchc4i0IyUXUwf3lZfE9juOMo4iR1
         CwO21XZ3QGIOaJiCOMzqZEfwQxCtE5UMIewq6YBcuc1isJ59PsYtMkUr6YonAC30e2Cu
         qgA8WQAbjhIYydQ7cpAcEbjS/RSRTAwod8vPSo4s2EWx8DmTaSVqkmI2kVP5SfhugvFE
         +Oy5Cu537kdIvKc/KGIzBMa7nUzknjEmIhibDq5A9bVCAL7tNiAhbk1lmGe4p5RcCpkc
         sCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411240; x=1774016040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MkXKrmgHZEgqEUoaPglu+nEPsg2SnNw3eYI/5+7A20=;
        b=MQHDE+RtiMKoHQxqnGbrCFGdmsXDcQNZL/7owkQzwOttRmWgrISPPB3WLFkKUMkmH+
         g/8sOuxvZlOZKgBYZSjdHTIQAg6qmJ7y52d5bg53gNFsXU8S0ZQwaMafBnmElu2EC1Ak
         C7x2pYITlT5Dyjw12p16OSfBM3BpMLqZMzx5sa8ZnZtVRmBakKlPeNzetfoVMYXHPQQ/
         qTQjAWQ3pnpmfJcwD/90rU++8v27dzTNlqVQnqDsM1Nxk9Wj+kskWNAs2FtB0QZRdKlF
         Zc2hoVMeBWxdLXQGLKaiuQ5KTfPeDjPyD6V3QK4/vzbZ3GM4xKgBsHVy7GX1JjfT9auR
         Togw==
X-Gm-Message-State: AOJu0Yyq0BQB7GWRL+YRz7supypUYyAzHMb02czTNINZFZWHE17/THrS
	w5LVXwN6q2DLaJZiuzsg83kjw9G9t02xJzpTpJQIlmf2RxQSYDmxecdRdQtgD9KV7AbpsMRmpMO
	teIGKb+iHoHje9Ty9xcz08E7UTGbaT4Zmy3PKGDKXYq+uWK1OuuCxLmga3gUYVu8WMsKn
X-Gm-Gg: ATEYQzzrVLmhBX9I+j84isvHJJ2en/AeEQQykNhpuk+BqMtXWcl7pJSzey+Yc73Oamc
	vzw6f3zygO4Fnb0uFqTYNg1Zqj1smK6Ns4NXckK9/3N2QughbdarV9JzrvXuFvyUx60TbaWz9Ko
	/2mCCWQ/Z7270mPlV13sjKIwTUGzAB4iimJ+MlFkpGYNJ7+K/mQgqN5nR62cJjzoLA3dDbRYa7Q
	3B7ns9h+/zk72wpC2HKTGNAj2J9PSNN1vHQFMulZHaFHKcjlPjjUAoHKEgvGGk6IvFSuIh+G+HI
	oBEiyoH0pO/aDmWmf9kxwND9rksYWAht+KtsLDDNGRAXgscip5nzKV8T3lsEmvMmj09sQYLMTQ3
	0+wQV/0UFCl737KXBU6ne+f7ERrgq4FTEoQdx8dVS4rE=
X-Received: by 2002:a17:902:ffce:b0:2ae:d3fb:bc08 with SMTP id d9443c01a7336-2aed3fbbe29mr12260735ad.26.1773411240304;
        Fri, 13 Mar 2026 07:14:00 -0700 (PDT)
X-Received: by 2002:a17:902:ffce:b0:2ae:d3fb:bc08 with SMTP id d9443c01a7336-2aed3fbbe29mr12260555ad.26.1773411239885;
        Fri, 13 Mar 2026 07:13:59 -0700 (PDT)
Received: from [192.168.1.8] ([101.0.62.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56c2b9sm30155405ad.18.2026.03.13.07.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 07:13:59 -0700 (PDT)
Message-ID: <b734c3bd-c54e-4463-a93f-0a9b89f2d7d6@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 19:43:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
 <9241da21-6b02-434d-a746-6bccc25a335d@linaro.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <9241da21-6b02-434d-a746-6bccc25a335d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YHNzHQeL0T6wuBROW8-RoIPNdK0yeCy8
X-Proofpoint-GUID: YHNzHQeL0T6wuBROW8-RoIPNdK0yeCy8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExMyBTYWx0ZWRfX00teeMVHHyLO
 m9VlgnE8YJ2bHdQTtLz94S/OAs7MaA49JzK0127Cp6Iqyhv6WDlyWKA818zdFNB/vxaj65idIL2
 1rf29GVIWpPqYgQQn37N+5GD8Sr3LbIJ2sD2erC8MAz8n0N1si+oPoEQhU6i7M8uxdDIcFOL1xU
 Q1GQqEKBwdnpUUF/iaEl1vwn1p5CIjZL7dSjzVd0Cr5Al2vRmesP+3QH07JHLWK46fYbuIQ3YU/
 bR00oFpqnDH0fwYMQFMFtg545e8iIE136PB86N1sdGEu6tP53f4oQ6Mv0ua5CGhZV1rjUjJ9z6s
 RVVIxBQT645Uyo0H1TFSRkrein93MqSlTR+P8p9pET7JzNc0rlnAKfufg8QT5K/oMVUrVCjJA3F
 /IC/DWnWxzrtt1e0ihKiGMAS4sUkCrNklM83cm+3F+2XQ4aeeSrf0VUTR0rohrUDx7AlOPAFAOa
 yvBA0Sc+FtDEN+zTitw==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b41ba9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=EhmMhbG5NVnfTD3xWHIiWQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=kLZw7Tj2Bp1Qn3bclxgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130113
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97529-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88A0F284C96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 5:47 PM, Bryan O'Donoghue wrote:
> On 13/03/2026 10:29, Anvesh Jain P wrote:
>> + * Read Response:
>> + *
>> ----------------------------------------------------------------------
>> + * | Offset    | Name        | Description                |
>> + *
>> ----------------------------------------------------------------------
>> + * | 0x00    | Byte count    | Number of bytes in response        |
>> + * |        |        | (exluding byte count)            |
> 
> Great to see this documented in the code.
> 
> Please run checkpatch and take heed of what it says.
> 
> 0002-platform-arm64-Add-driver-for-EC-found-on-Qualcomm-r.patch has no
> obvious style problems and is ready for submission.
> 0002-platform-arm64-Add-driver-for-EC-found-on-Qualcomm-r.patch:184:
> exluding ==> excluding, exuding
> 0002-platform-arm64-Add-driver-for-EC-found-on-Qualcomm-r.patch:224:
> exluding ==> excluding, exuding
> total: 0 errors, 0 warnings, 0 checks, 28 lines checked

Thanks for the review! Confirmed the typo — will fix both occurrences in
the next revision of the patch series.

> 
> ---
> bod

Best regards,
Anvesh

