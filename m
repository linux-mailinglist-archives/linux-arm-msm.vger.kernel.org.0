Return-Path: <linux-arm-msm+bounces-110306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKwqOcSvGWqiyQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:24:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 957CB6049D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7978E3119C7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B176E3EE1E0;
	Fri, 29 May 2026 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xvtg33A3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMXSLN4m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4648D3EDAA7
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066870; cv=none; b=cW+TpvYQoLeZGxF0F2DUDrT1oio8VKLDRLPIRnAS7/ccJaTr1Og6vYqHlDSWgWNH6VbDSXKOD91CR6g032VAiHRn4LfnwVLKEICMwuABD2Oc57EC8JjXAVHwl6Bt4MBNtXBZvAqxVIqkiTICT0dNsLc1EsP6Zpj6NdbsBFaKDdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066870; c=relaxed/simple;
	bh=ekH8jL5GTEUDGVAvOS2ZIaVQwCZnxE8ZwtzE7+yiA7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4Z044POV3XDfxGDeKOcN7XpxhhyhGpoiFaLDYnihSc3OBprdFZ2m8QndzuNYZTKuIW8P99M2OdxsuycKKrRImD7cnkHPo2vMwr1kwImM3cyQQ+mte0Cnt36x3QDLohSeTAuUkkYk2lLj3XhXPjCCiBBpf65BQt/XdcN4/LXs8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xvtg33A3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMXSLN4m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKn5s1202000
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 15:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0DBIjTIgaaXjiGvnFuMwPeT2jOYan/1jCVFnVrf0W20=; b=Xvtg33A3ig+6aYFG
	oL8rJMr/IQKZvLMoyLnn0zZXciu8R5PCNt+FJ4h8h7q+e19LGgNKQfYe289MgRmy
	DFggJITACwYZqw/KacpmhoJ1jy15LK/X3G/BXim6nF8FddZA/9eJP/N/oINCoVyM
	oeWxrLL9qpCKke5Od+xGjJDKap2oeqZ4vFCteFxZA8XayB5vCSA9LMVGUL1G+seo
	4g3+3faCQM44ek8O7ZxNGGKSEgdz7TQRflOJpbfZD2zSGBd8c63tbps7IlwGQwNk
	w6V5S4timf1fGU7BMDTIyA5BVwsbIX/Kuv0vREq2sT4fas/QvGdopxIBX/CnBYVF
	FN1dIA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te2gp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 15:01:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso9004160b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 08:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780066868; x=1780671668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0DBIjTIgaaXjiGvnFuMwPeT2jOYan/1jCVFnVrf0W20=;
        b=iMXSLN4mzYaO3olUhJ9wk/KQWwPzt4xhlENn3BzCfbcyknZwu+V+tfFBrGMUq8ihqD
         lEUpoe0zByVojMURq3yTEMpHpuloZenCyycF7HZKJaHraL0v8hw/jHUj0lbSVVw2iYSK
         7QKw421j/hT8eg1snaMHmZDL3rmeJzDNH4Ld6e5r9oZcfhmV+/mq2VsFZZT+yZtmBEJw
         Oh9wJWyzeX5Iu/x0c5OxKPOHhp8s3Xl6+CxKb/5nxZpSK9ohHOUw3yOwH5ujEJ38Du/R
         YTf3ohbtYh0s73hcg9ufpYYx4WYzPoDd3dHbXRAmv4N0dJaqKPKFVcRTxAlWCAYNNDCk
         M7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066868; x=1780671668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DBIjTIgaaXjiGvnFuMwPeT2jOYan/1jCVFnVrf0W20=;
        b=erPd1w5mDl0yGbN1C58s2fGIbcgGuD1WrE+rgWC27aFZUmrDotZA3jr0xsMKe1CE98
         lc1+Tmfw4GNqo1m/6UKJmYJRnp8IBuodDY++P9xUrLW+lyaE5CB65ZD22ssQeZxOuNCl
         n73EiJDpsHaA63SrN+qwVHOgqFBmd7SB4fopr3YfbV8RZAv8OziZyi4Rc++zeXsjhZPW
         z0w0f23DCqyyxu3QNIEdD+ktZtfT+lFjGNH+kfneNslA2XRo5izcwICO+GzI0Twx3TpO
         +AhzSJP4LIsrBNO6kRJnytFjuaLoe49K1/BX7UgraY+Ggz3jcqEBNI9hiuECe6F4YSeg
         9mEA==
X-Forwarded-Encrypted: i=1; AFNElJ9cOVs/ErOPMARaxdSH3RNRXThDFdfeiJxpvfG4FZID9X0EDYCrY7TZIknGkmSnhwCnQn8sigaieyDwwQM6@vger.kernel.org
X-Gm-Message-State: AOJu0YwBzGppQWPTIWCOLo0zWmOKm7mdN/VBo8hUuxFSJ4bQbz3VpWrd
	PVtwdY7qlAUtLgF/HSBHx9ZhEoCm4GjudJfYVduDbyVwcAXz8JR9ZrQxdiojIMY9w8HGR4f5hI8
	AdGNXsysp2yHQwpmMCEmf0B/lwH/DJfnhek1Zl9OKRn4W+WBGtoKR+S3sQAbhdyw/coC0
X-Gm-Gg: Acq92OF5UbeU7dI/NrH+6hykIEL8eMDqLggx66AMwuvf7qOK+3uNWOX07ovwikHB4ks
	GitJ+MCrLcGLI94DL3wVLYAk0ZFXuQMQ+OW2w6hQyjvvrPWj6Xc4azY1C1j5QcDjSFpvCVB4qPV
	V5kqsjhHINEjvZWA8EmSX6473445V1CjLLI9IdnR2lWtF5vVMIHex+EXiXBgOlKZ0UuhsEf6whh
	qXuYd32dMEdFFS8j4gEmZq9YwfX8bU0I6R1nSNxrE1YtFyeI6QN7XmmHRV/NfTWxjnbz+gKYyEE
	HVXUV5Yxclj2zMOGHArOvonNUyas0MMzfNpUES8lg56/p3B6MXpLicz0RAttMZMGe1Zlk+YUrNv
	axtK1k4Y42skUCpu7OSNZTouGTFXHVskzaQysXVbSao9/VaKXF1w6Aw5Mzb9z0pg=
X-Received: by 2002:a05:6a00:440e:b0:82c:daa4:ce29 with SMTP id d2e1a72fcca58-84212c2fd94mr3681680b3a.47.1780066867465;
        Fri, 29 May 2026 08:01:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:440e:b0:82c:daa4:ce29 with SMTP id d2e1a72fcca58-84212c2fd94mr3681595b3a.47.1780066866769;
        Fri, 29 May 2026 08:01:06 -0700 (PDT)
Received: from [10.204.67.150] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b6797esm2739983b3a.26.2026.05.29.08.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 08:01:06 -0700 (PDT)
Message-ID: <21c17cac-2a1e-4b19-ab6d-ddca9132d725@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:30:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: qcom: camss: add support for QCM2390 camss
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
 <CAFEp6-1VAW-S2d3q3uN2n1weMOoSPXtX_k_6msQ-K_5A5mZVLQ@mail.gmail.com>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1VAW-S2d3q3uN2n1weMOoSPXtX_k_6msQ-K_5A5mZVLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: i69k9gkckzUTRTMP49KbFpX439fTPKq-
X-Proofpoint-GUID: i69k9gkckzUTRTMP49KbFpX439fTPKq-
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a19aa34 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iLf03rxdIeEfhWbO6WcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0OSBTYWx0ZWRfXwHbfTQpxT27Y
 9pJ424Mc9lwByliLmut+Zi5D0aI2RoeQF0s3vSaNdQOisOq/XgX0IQo3P8Ak3hQaRAS49LxCfHz
 bDniGkTgEQzxfdYzOL9Xymbr3wOGiWHzfnam0rDhRbL99CJ+Y8PeYs7BucZMz1KzkvrLlGjwHNq
 6hC8tv0KX0HB0ePcBbEXUxJvjvy/PwQhICDCfvtoMI4k5WQB3/XjobWFEpmq/5QM5nQVTrYYRqL
 C6hbemWO+/5h29xuLl2CCTuKXTma3bdhEVjW7Vpmk6kdHfAIfsx+kJBCLwu6g8VinJtKxmnW6UI
 Mj/iuXf5hU90KR2WldVMzg636PkR55AnE7PFZknjmHt/0v7cYNjOubqE5S5PcT9qDPMjnVc49vx
 89OkTP6XpMj5+PSCBqXg8maN0ZgvmIvjyHRVndgw3pctOgeriJFZ6C8tYSOhgdbpEfSM6cFhdK2
 L0DO5JbAgdze+azRFoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com,qti.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-110306-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 957CB6049D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/28/2026 5:55 PM, Loic Poulain wrote:
> On Tue, May 26, 2026 at 7:13 PM Nihal Kumar Gupta
> <nihal.gupta@oss.qualcomm.com> wrote:
>> From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
>>
>> Add CAMSS driver support for Shikra SoC. Add high level
>> resource definitions for 2 CSIPHY, 2 CSID and 2 VFE instances along
>> with the interconnect bandwidth votes for AHB, HF and SF MNOC paths.
>>
>> Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c |  2 ++
>>  drivers/media/platform/qcom/camss/camss-vfe.c            |  1 +
>>  drivers/media/platform/qcom/camss/camss.c                | 13 +++++++++++++
>>  drivers/media/platform/qcom/camss/camss.h                |  1 +
>>  4 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index dac8d2ecf79957dc05c5524dc439791ce097c785..62208f5c4f17bd6c9a8fe5613649920e6ee1a1f2 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -1130,6 +1130,7 @@ static bool csiphy_is_gen2(u32 version)
>>
>>         switch (version) {
>>         case CAMSS_2290:
>> +       case CAMSS_2390:
>>         case CAMSS_6150:
>>         case CAMSS_6350:
>>         case CAMSS_7280:
>> @@ -1222,6 +1223,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
>>                 regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
>>                 break;
>>         case CAMSS_2290:
>> +       case CAMSS_2390:
>>         case CAMSS_6150:
>>                 regs->lane_regs = &lane_regs_qcm2290[0];
>>                 regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 319d191589884777bced456867e5a2a4211a2770..b152f8d48e003d8eeb0cf19ad57419b25cdec087 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -342,6 +342,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>>                 break;
>>         case CAMSS_660:
>>         case CAMSS_2290:
>> +       case CAMSS_2390:
>>         case CAMSS_6150:
>>         case CAMSS_6350:
>>         case CAMSS_7280:
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..f67ecff53f15bd213dc7736d4e5fe880007d1ee7 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -5565,6 +5565,18 @@ static const struct camss_resources qcm2290_resources = {
>>         .vfe_num = ARRAY_SIZE(vfe_res_2290),
>>  };
>>
>> +static const struct camss_resources qcm2390_resources = {
>> +       .version = CAMSS_2390,
>> +       .csiphy_res = csiphy_res_2290,
>> +       .csid_res = csid_res_2290,
>> +       .vfe_res = vfe_res_2290,
>> +       .icc_res = icc_res_2290,
>> +       .icc_path_num = ARRAY_SIZE(icc_res_2290),
>> +       .csiphy_num = ARRAY_SIZE(csiphy_res_2290),
>> +       .csid_num = ARRAY_SIZE(csid_res_2290),
>> +       .vfe_num = ARRAY_SIZE(vfe_res_2290),
> So isn't it exactly the same as 2290? wouldn't it be easier to have
> the shikra simply fallback to qcm220 (via compatible string)?

ACK, We will simply add fallback to 2290 in dts.

>> +};
>> +
>>  static const struct camss_resources qcs8300_resources = {
>>         .version = CAMSS_8300,
>>         .pd_name = "top",
>> @@ -5752,6 +5764,7 @@ static const struct of_device_id camss_dt_match[] = {
>>         { .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
>>         { .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
>>         { .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>> +       { .compatible = "qcom,shikra-camss", .data = &qcm2390_resources },
>>         { .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
>>         { .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
>>         { .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
>> index 93d691c8ac63b2a47dbb234856b627d8911a1851..8ba8a38113dfc15849fa333d05b2c3853f3a7714 100644
>> --- a/drivers/media/platform/qcom/camss/camss.h
>> +++ b/drivers/media/platform/qcom/camss/camss.h
>> @@ -82,6 +82,7 @@ enum pm_domain {
>>  enum camss_version {
>>         CAMSS_660,
>>         CAMSS_2290,
>> +       CAMSS_2390,
>>         CAMSS_6150,
>>         CAMSS_6350,
>>         CAMSS_7280,
>>
>> --
>> 2.34.1
>>

