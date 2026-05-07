Return-Path: <linux-arm-msm+bounces-106232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJmnOQcQ/GlYKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 06:07:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8DB4E2C85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 06:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BA8F30182B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 04:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA36831A7E4;
	Thu,  7 May 2026 04:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbEJCL1L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4UUC3TG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C66318EE6
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 04:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778126833; cv=none; b=NukvQ2xxFAgzsXt+L4Vbtfuz4nFUfbJBZbUV6MycaSzBZaG/x4zYezk/YOUTT2pH9zCkvz5ndWpDWOpVQab/SEvOfBTnHw78/yZyINMqRfzrRIrseY6xbSFSLeYPoHu7nZiesxNilcwo5UEq6ypopo5GvDQpcGLSeVxV9h7qWQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778126833; c=relaxed/simple;
	bh=sNpRljKh48TCfPL2/UrM/b+t3VU3zIREMfmXy6ftg+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3/QbZnyXLYVm/a/D8t0EGoyMOSB2Dp5apTrzgdjkMIZ1ZCtzRO+lCnXLXToodaecdB78Cxws//pI49uwtiBjzYStb4omLncGRAly5Zmh/O9iflTn5PwT1NP8EfM7z1/vgbM/TQJlcAt9VI8DfZ8Bv8jT8P+Tdp3NrAxV0GcLGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbEJCL1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4UUC3TG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6472LcU03464899
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 04:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNpRljKh48TCfPL2/UrM/b+t3VU3zIREMfmXy6ftg+c=; b=SbEJCL1LH2Z8Lw68
	SyrhLlpoQ19ZnYPYNioM2sG1O466UcgZJJDx06ynZQxEkQHebBmVdLyRpVqUsoEy
	rkiQTBR+B5SCUootUFTQ2bTmwQSzZum4k1K5Jqy/2SMIffhq9aqLG924MPzra9uV
	kwAhhs2LqnM2WKPEhQAe9gAAeEGg7Vx2zlmNab2CRn6c97wZl3sbKZC43/wdnjE4
	5BKvbp8rxLOv4EE0mS5UMfMoKb7hfE6g8trc8b/SJHrsIaW1BXB7VsRDVdtKaxpX
	9UGSy1frL5fZiRL3P8zjKxDZhsw7vB0htmnk9S+SAx0UpdFKk6z9ivKJad+Op9hp
	Nc+OFQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn096s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 04:07:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7989b7cdd0so438992a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 21:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778126831; x=1778731631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNpRljKh48TCfPL2/UrM/b+t3VU3zIREMfmXy6ftg+c=;
        b=b4UUC3TGs42yGHSLbCoEc+Z6C5SfAEnyK8+BYvilc6BrhGsUjIqX/uT0SXsFIGC4Ou
         l2HiQEuD46p+PHiqS/aqprWfiltQd6+Q+lTMgt3ltZqpisB8xIetWS3VX00DRhxrRNHn
         aDjJbMX88NLnaoTwTGhuC2lCOAVJcFk7OBLCPghPemI+MHFBZuH4rTVJFQoc3tAV+MtU
         TDdkea+bcY+D/1VBwr87LOJ7EVVrNV7AHpRnPTWUpy6c26gCmP/RAegRPMPXzCDc618O
         YIZUEPezOJ2+GNFMquRtANJZtXwmwFz0REEnLh1MYeKY3M5dxmtnRmu98iGT8/07xik1
         wU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778126831; x=1778731631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNpRljKh48TCfPL2/UrM/b+t3VU3zIREMfmXy6ftg+c=;
        b=QK1PkSpRuyYIdnhb60QV1plS1oVRg++1yzL+XRvuJ9EHz+cX3qnoeAELIXUc9NE7u7
         zXkTRT/kwVxeswzKZ8pkEst/t9LPoX+j4di2/gEtFLArcQ8cOgmgUG8F/aOSYoZYoWrF
         LeHNNeFvmbth6Meu0HD/yarnZaIRbKXhoAjXXXTRvfF3JQTejrVrtC6rUESc4JT4l4nC
         IYWMyCpinnS7IEuVhA7jBHyr4nxioYLT1azSqA8xcuIYMQrFEWb9MaEo/sFP3QORornC
         axrKsgKeObzTxVP+Fiixkk1ubwMynyz9YVFigvPlfFnEZBERJp51ZRSdU3fLMQDcFsf9
         H3Iw==
X-Gm-Message-State: AOJu0YxlMtOCB6ho2ZoNx94TXg8hd16Uq46tMkQR/gFSG0wSxxu8wfpp
	e0Kft6nIN1+W0Ib3XScasjcF7Tr1F1rsGrXA/FKfj1yE4kyA7f5XGiklVpsW189uBCJ+F60uilH
	BWYAiAAdVhMRWnE5rQri4ZIGrGvinu/xgekanpacj8kjvFq9vv4sA9wmjR3i7X9vV0KC3
X-Gm-Gg: AeBDiesa0JcBAA/6DwgCKmNaGHHdltpB6FY7t7vyH44HsWxqVMQfF73O3mOGK9Gl283
	q/JkIpENCgUNvnir+whFrtVk9YWeH8nDEe4xDkfVTujFvTzYcKeWSRFffUVU0eRWvmOeP2c5Z3B
	o0uEUJTmG3naImGB+0728Da6Rc9XL5WzqlNIhvSoSU6C9HB4MFUsaTAsU3fcigjnnvUkKWB59a/
	ebBYTpfrEml4Tm/YbxPFesdPqOxx0zsATl6WkyP78pfdIbejpAqFn2IDHqD+C2OrJ1z10A1EhZ+
	rv0jBEqyQtRhdGGgNTzs8Wu2N+gVJrzzFD++V44oW/wME8XrVKSfG4bwFaPm8JjIRY7GG9hxjXH
	uFZTDl3+zWX03OMBitC7aLNRzgMrmyR/Tdu4pxXPk/8NxHPK9AgkON2XRRxT2
X-Received: by 2002:a05:6a00:2347:b0:839:f1c0:13ce with SMTP id d2e1a72fcca58-83a5df4b7d7mr5906171b3a.40.1778126831259;
        Wed, 06 May 2026 21:07:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:2347:b0:839:f1c0:13ce with SMTP id d2e1a72fcca58-83a5df4b7d7mr5906147b3a.40.1778126830771;
        Wed, 06 May 2026 21:07:10 -0700 (PDT)
Received: from [10.218.34.110] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf67fsm7219120b3a.47.2026.05.06.21.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 21:07:10 -0700 (PDT)
Message-ID: <1e294832-724d-451c-87ef-794f9debd905@oss.qualcomm.com>
Date: Thu, 7 May 2026 09:37:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Unconditionally mark gpio as wakeup enable
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260430-enable_wakeup_capable_gpios-v1-1-5de39bf06094@oss.qualcomm.com>
 <03cd1bbc-6d8e-4819-8cb5-a46a7d58b1b9@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <03cd1bbc-6d8e-4819-8cb5-a46a7d58b1b9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAzNyBTYWx0ZWRfX/I9K3XfKVIlg
 suMIztEke2EOYYJBzKtrp5ps7VcSUrp09R961bWkjo2fv2t1MmSyqm2YGdqiN9JZbltz/m5MNZG
 gtpeaUB8gPnZIuolzVsHyQBAqrBTxsXK6wx3byG/xRyniITzHg8YrAxMjyUT0gR3XiAXSEtg06X
 tDFm5ZC6jOwartn3iInrR5hI46H3Ggt4VjsX3RrqOh/CuMYRMVO+bCIcZVMP19lojnO1WsXMfPs
 N9DjS31NOGAUq/eWXkIy4gtIIA4vEFah0f5w6hpjD8JG4AsLxh+rOeZSCvi5ZRLg7dJytpsSM9i
 EsZ5oYQG4XBJlyhwRRKQGH6GG7S/mO1F0+ebqI56c7BGiTd/3OKj6ut+LXEtkHrA8U7NaZwXclz
 LKXW9DFal5vtRkR3Yxyh8rT/tF8BL898KtUICLzkdGeCUM1LTOuNV7njhY9gUcQlR7Gl13aXqyi
 Bp+2mfXeEnt8vDL9+vQ==
X-Proofpoint-ORIG-GUID: e5M0qLPgQRzWeSYM91WZBnxyhdeb3W2P
X-Proofpoint-GUID: e5M0qLPgQRzWeSYM91WZBnxyhdeb3W2P
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc0fef cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=43YHA6yz2nHLIAHiA8wA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070037
X-Rspamd-Queue-Id: 4F8DB4E2C85
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106232-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 05-May-26 4:13 PM, Konrad Dybcio wrote:
> On 4/30/26 7:54 AM, Sneh Mankad wrote:
>> The wakeup enable bit needs to be set irrespective of the SoC using PDC or
>> MPM as wakeup capable irqchip to allow the GPIO interrupts to be forwarded
>> to parent irqchip.
>>
>> This is set only for PDC irqchip using additional check skip_wake_irqs
>> making it impossible for MPM irqchip to detect the GPIO interrupt during
>> SoC low power mode since for MPM irqchip the skip_wake_irqs is always
>> false.
> This describes the impact, but not the reason why this happens. Please
> expand on that.
>
> Konrad

Ok Konrad, I will post v3 with proper reasoning mentioned.

Thanks,

Sneh


