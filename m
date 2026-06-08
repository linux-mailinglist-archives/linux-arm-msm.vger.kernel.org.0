Return-Path: <linux-arm-msm+bounces-111745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J+aQNEN8Jmr9XAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:24:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45371653FDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:24:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fuBA0Zxy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UtDF2tQX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111745-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111745-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DFDD301486E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0593A3955D0;
	Mon,  8 Jun 2026 08:23:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22283947AE
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:23:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907034; cv=none; b=SSPbZBFpcoHaWPR+YWVIEMQmRAfQN+F4XXQyMyLRY3dL6VUYoShhcnooEQx9CsWjlzK2FWpjymOZM4AcA2fcYvsIKdrvgblnJvToy5pt4mLphx//ur8XbHfct66cgutwWWXpr7kGCyX92eqY9siIzpT6p1RiKAMEMj6/Ow9VWdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907034; c=relaxed/simple;
	bh=xCS/sMMivgXC5mwRXTDN44lODP1gadE8iSt7cUsbOyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQI5U7rUxUCnSH4bEJd9DqCn2fS0gIfrlnWJcX6dpUqzMdoxHc5c2aNbyD6BvXBNQ8d4U80RVmYbYi9KUKOGTDMthK+FEEdQDbFm52/+n0UE6Ck+J1ZI3TpUVitXgelca65Zqn6TkHSApgTAGaHTtN8RuzJsmAUGDWS589c3dyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuBA0Zxy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtDF2tQX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Plqx2733126
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7lQ4E93ZSohECX6PMGG4MtXMe2iUMpkyysStQXJYr8Q=; b=fuBA0ZxyKmUs1VX4
	6OaL1b2K447HWqeTnA2PNuSe8YgTD9vlw/3OojWh+njfaWz9rMuNCImtuvmv87JS
	VyZI48xDGpFgpy15HF7vVOhJeA+BpH3UtZDRMqh8gekl5qgTvavz/o5/8TuW6xjR
	CSP0X6tuuWQh57+aQblZhlr9pDzcePn4utWPZb0PznIi4UsVkvlbTGjdFNmY8bAX
	ToyTapW5aBzXj1uEeH6DP2rUe+eLS8q4btjpCjGZuvdV3jPhJEbGvW9ek/wx9Q+u
	gpU1R2ucZeJ818dy1D9D9MyKGZl8cFIkEyxhTDrgOIArJy8xT8Wf1Y51uBnXk6fC
	Hqvbqw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6vxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:23:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d99629fd6so6979892a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780907032; x=1781511832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lQ4E93ZSohECX6PMGG4MtXMe2iUMpkyysStQXJYr8Q=;
        b=UtDF2tQXPTX9JTM2a8WVx+QFM9FRSy+wnF2TnCqCefd+vjXpx5AhRk61NR+vcvyOr0
         EI6VnwfyFSYoRDcvbeS9w4Ukr6vX5vo/mGrXb3e5j1WXrPnLSl1t+zdTxVEYZV/ghQbb
         hy3vjagAvM/fAwv6iWR690OTj1cfU0Yj2ozrgPldx9CHzP5j88wjveQ5Acefe6pXfC8d
         76EmEMmk8qnGLtSL6+V3SWjUBcIudo8LKjVPAl8+3D08S1GVReub/t8TBsRZ8PsB7n/s
         kRMtxe5kG5jWdySGP3vB6DSmVATzYL6/tXlWVxVvsrX1kZLb/XFzIkqCxzDZ1j+Vu4Pu
         O6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907032; x=1781511832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lQ4E93ZSohECX6PMGG4MtXMe2iUMpkyysStQXJYr8Q=;
        b=azKCo3E84XoBDjZ0UbEWjsIgC2zpHbYwkEf2hxaQ4rJIKJ/R+lLP5A1sWg16le0ekB
         o8dB3Q+FFeafE4C8S+1XDA0Pzt7Odsh6UCb4xQyTisoae2G6Mj3435ulFMxuAMlm4vF0
         nR3QOi6tQe6AMjPaz9aTcAEn9p7saf+lVC5jJNLX9xgccyeZBEtQIiDfnMjGGhiJybBg
         Csl9hmVdm2U4eFRZT+FVkAW70FpHUg9jVhp5rwYWlZmyApMYrP5lv1wGeDgOpFkUfdvh
         xbA4tg6LtNVKoptrXVOslgo95I4+uRo657/vD+lMPaWMeBQ0H5hircV4HILXlN7GrKcv
         jJHg==
X-Forwarded-Encrypted: i=1; AFNElJ9qdo2AXQVJKKTX/hfLDruahyDfPqYZndCLh3gtxzp/KD/mDaJGnYBzHTCpkm8Juvqu/Dw6dDwBroYjgl3C@vger.kernel.org
X-Gm-Message-State: AOJu0YxPkuM5Vl24v/8C1j7r9u2ExnlDwjObxz7cuLRORvKf0DLf8LKw
	AtJN1/aBLx3Odrn+fOs1jddXsxVObr4RQs7paVzzupnU5KexQh/vtpFgb8caIoiUZoQbY6TLfS5
	eaqIIQ9hOH4fJ+RJqmLERUmH/Etst8kJHJlSOCd3s1tq7dzdl8YnnUi9KFS95qDkr4+7l
X-Gm-Gg: Acq92OGC+BMnJlJvY4ywUEGhE4htKhHb83AgW6jXhl26ys77b/qjBOvBq7aC2M2cNRa
	WfMhuUmUMbf0FMOogVOrYnVu2XHEPqQ5Vl0b9ygAbOawOzwLnLREje8uXKd5Ya8dqRHP0MzX5C3
	lk5uIOUYoz6Bn11CRiwKxLqnKNVLFEGcv7d189orZcnUcJN57zoitkYd+cWmZTnzTXWBQTPjKlT
	GNov9n3AnWC3rPtPe5kdjEoOB7Uqu8SHy07ZwEvD5kEDrSlWTStB9HKvG7lk2i2JyPz4yND2opB
	1VTuKQkn1V95Vs3RUI3W6TQ5m+X082CAl7OL/dxoPpZe4qDovARKfAeJPfhxaYqm/zKDTO2zJSn
	c01zunzjJQyqnz/yVT5s5mRYYwnvL9RQ+XcKA/lB2Uk5XNkowyL/Qw3GkEl47nyLeUQ==
X-Received: by 2002:a17:90b:2742:b0:36b:4d63:4a96 with SMTP id 98e67ed59e1d1-370eeb1bec5mr15699157a91.1.1780907031818;
        Mon, 08 Jun 2026 01:23:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2742:b0:36b:4d63:4a96 with SMTP id 98e67ed59e1d1-370eeb1bec5mr15699133a91.1.1780907031357;
        Mon, 08 Jun 2026 01:23:51 -0700 (PDT)
Received: from [10.217.198.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f710ee4f3sm15849306a91.13.2026.06.08.01.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:23:50 -0700 (PDT)
Message-ID: <41cd662a-31ff-470b-9e77-af5655f210c4@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 13:53:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: Remove the
 little/big_cpu_sleep_0 idle states
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522-ml_cpuidle-v1-0-fd311cf33fb4@oss.qualcomm.com>
 <20260522-ml_cpuidle-v1-1-fd311cf33fb4@oss.qualcomm.com>
 <qlraiygk7tcq5xvdxwp5ijfffhmn4akza237lij4xf65fmc3dj@33yozanoe4rk>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <qlraiygk7tcq5xvdxwp5ijfffhmn4akza237lij4xf65fmc3dj@33yozanoe4rk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a267c18 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=A8xlVPZPMDKzmvWz11YA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: oVbYQWyDxnTn2oX_XR_lnWXAVb2ylddi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3NyBTYWx0ZWRfXylhsYMJziDIo
 BMi/0CUg92oXg8Uvplt5SKmd6g9phiP14kfETUhbH8ILCqI8T9qro5jFAClngVwzHbEAbRNVln6
 y7KFQUjNiKMz1zyBgyYucwr/HEzmjW28X7M2bmQX7FN31r9KD3duhsTjOsXgWfGkJgVBObRSIq8
 sV/zQQaWqOQfr24OMRz0D1eri241aJH/MxaIkl07BjbFietaoM52OaqRvEZz/snRDIa/052ZHHB
 W+nKA3lAo5uLboAGcRXR6fTu/c39F21aGlI2Tb4fvzwLToWiaiqyjqUiQViaXraWz5aXFVl9TBE
 8nouJn4ffJAh9goqLvkcpDLWWCLTORHrRO918+xMRQ7V0AQK2UCqzW+FZ/N/FiEdzc2mxNMSls3
 MoiviG+ySZXa/0FuDuzFRy/92pRBjUoGxhfXMem1bOqt4Ge1Ji28bAzzUWK1R9M/84Pr/BEJQEd
 pphlMWl2Fc7p1oWmmmA==
X-Proofpoint-GUID: oVbYQWyDxnTn2oX_XR_lnWXAVb2ylddi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111745-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[navya.malempati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[navya.malempati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45371653FDC



On 6/8/2026 12:54 AM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 04:40:13PM +0530, Navya Malempati wrote:
>> Firmware supports both CPU power collapse (little/big_cpu_sleep_0) and
>> CPU PLL/rail power collapse (little/big_cpu_sleep_1) idle states.
>> However, CPU power collapse modes are often not utilized in favor of
>> performance, so remove the CPU power collapse modes for monaco,
> 
> They are not used now. Will they be used if the cpuidle governor is
> changed? If they are valid from the hardware point of view, why do you
> want to remove them?
> 

Even though they are valid from hardware and can be used, they do not 
seem to be benefiting power/performance, hence removing them. This is 
irrespective of cpuidle governor menu/teo making use of them.

Thanks,
Navya

