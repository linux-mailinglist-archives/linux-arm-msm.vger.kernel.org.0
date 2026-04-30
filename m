Return-Path: <linux-arm-msm+bounces-105381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHI8DK5q82lf2gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:43:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C40C4A4319
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C51E3023330
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 14:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24E042EEB4;
	Thu, 30 Apr 2026 14:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5oCZ+se";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhEsC3ay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C21C413247
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560234; cv=none; b=gsrg/KD66ill/Pe6H7KMIhB48d2UX+Kzy2PdLFfFidbOilHhx3Wz51qagPQ57W5UElid0MLKJZwDLmoyXS+y/kgOYHOhUxjJOqsUha936DWGt8dUBO5WJNUObAY0iAyMZftAAHurEN8XzShHPSYyc6nQfSMyIRsOFdI3xK27v70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560234; c=relaxed/simple;
	bh=BAE81AilO+ylrqk8/Sqpm5QVFqCuyzhzvMPUTfHnNI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqVxWQujTevXcyrgZGWDk+7ayFlsQzCNHCmSqRr26LX56yd1KjAamj0S+pkcpfiWH53XPz9nt00mvNh7+MJFBbDpjp/CdEAuxBj83N1671tnC1cF0y1kWBbTWmhcG+zgKiktF7GwuPwRnCTkik9glBNFzLLDMn7faJujGQor7lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5oCZ+se; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhEsC3ay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UDMvRW563955
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xEj5Rqc2GBPQPwxRAuab5eo3kQcNlGLJdSGzsFMROCo=; b=m5oCZ+seERhKZQmB
	JaWGoX5yWKVShEkLFD7vgXvsVEVNQRcx7Zl19PIckfKSQeYLjPyQbJzDO1TML7nA
	TbnxOmTUyFsxIU5dAiOhVKlVRQpdf2yPcaSLQR4gzCecPDSjicViWzh8tV35Q68O
	0NAJAGmVyiuoJgG1edDb2b+5v/eeZP5HKlDlhBzh4ydeyldjJ2YkQBgH/JVBweiM
	CoV3npILGAbxco9IQ5k4LOpVF1A/NWLxnbyuxvhkjWM6im+dE6HrMuamMoSKWBZR
	YK7qgz4jT6QtOWYcD33Dk7nPnz07vUsWvWXdvyrzQWq25UAyFiRy/T6RL78Kbxij
	LLdtJQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv7wurek5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:43:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50df4c130dbso25576211cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777560231; x=1778165031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xEj5Rqc2GBPQPwxRAuab5eo3kQcNlGLJdSGzsFMROCo=;
        b=KhEsC3aySiOAJKJJPqzI49nGDDiSdcAZCegI3wc6iJ7tziOKz+GGTaBFTLI0oW3XSn
         UynGFKTonL06qAqF4e2NCi3mYE+CcZ0KEK+iKP8KjWEYaC3UxMjqxLTgQsruZg5zwET8
         PX693vnFmOBOpYTe4yWTEcCPQiBfE+uTOcNndScIn/ok46lwqDVFg6CTiU5eG9jXDYFJ
         nIAewf3owMW6LsWS+5G+YahJ6L+sbEkp7aq/mEVPOHfcfnkD64oSlysgMHlbZHLKysJO
         ZRoNmBv3xr+ZhNn2sq/h7NqhXQDizxD9gApUlhJM9+VYziIpGoAXeZu+6jV8A4bswydu
         4xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777560231; x=1778165031;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEj5Rqc2GBPQPwxRAuab5eo3kQcNlGLJdSGzsFMROCo=;
        b=Tqld+oSiN0DuYCBZaEFzYuImfL83dJNgGyz0z6PlyM/sQLnvfkvAXIYq8hK7thZvWo
         isZKBp1d8d/fIkuWfy3cWKterK7sdO4dkpDAWbz5C1AE9I2uj3x8v24lItvzrfgQjKI6
         n+mKmE2jtJT7H0JPN3ur3P8rc7o5f9nh1wYYOrry22d2TuzA1MRrxlm3+AEogSxrho2J
         FdqlkR0dKn+XMpa/hko1OvUNxCpnoaFEvv3tTirC3sBTr1FnYjjIpcoRT24niScETHry
         BdASS3VXwkA1LLtoJvNmtU7114qVv2661H3Eqg/FXz0d88ZiHjGZR2HjJPS5677M1hAP
         RtDA==
X-Forwarded-Encrypted: i=1; AFNElJ+/F4EtZ1owTgyjCo2fVBK7cyIAzuYSH/1Ydmtaho2nP/hvq0dXzGM4mvmWHY/IyeraPbKkGMOEdcpOELEc@vger.kernel.org
X-Gm-Message-State: AOJu0YyLY55CJlrdajeWbVX/O20XgshrprhtRVWYljHiMqr3UQ4BOrCp
	6BDh7TdcN+YWGjsPnWYV+Rb0aVQr/55/ITeiAVCmnP2r90sZ/Nln1tEFR5+rZYOrMvc55YS5CVS
	C4+wGVoSfA/xJahRvX7YOOOWKJjvLL3R46Iw5Vnrv7EoG4NvvxJ6iwblLzyWR4leQetO8
X-Gm-Gg: AeBDiesWr+nG6prl1R6oQghMHol0Y1oXOoX25PQQ0I3HnwG7JXH46tpVxZdjJ4vzdVE
	sZ7nHi9WQt31ohyTYYgXujoCqzsZQkSE8CuuJzM13MzNLEHLe4TDpAZEjNC+wYJ41NjXd4fh+vw
	0CJDFNPHxkWVyLiX5npwEMHhDigvCTNT39wXoz2H1Cu8kpKZRYI58DpF/d6N/+QLus8Mr5RrVXz
	aK/dzqf7z8ybHepfJt8TNO68v8A8uWFlsD/JbPFqBqqJK8W0BKhx7mahscns9529H34W1HgphIQ
	r+pr07ZYfxkR2iISIFTaLy4/W5eKJiU1zl0h2VTixFZyiLYnPZwrMw3cfBFfStVfBr19E722SgA
	YBscDWn+iaFQlzextJrB0I8WttcAtDq7zTsA4nMX3qH7riGG2/arjA39BY5c=
X-Received: by 2002:a05:622a:50f:b0:50d:ea1f:f99f with SMTP id d75a77b69052e-5102d209409mr32600951cf.31.1777560231219;
        Thu, 30 Apr 2026 07:43:51 -0700 (PDT)
X-Received: by 2002:a05:622a:50f:b0:50d:ea1f:f99f with SMTP id d75a77b69052e-5102d209409mr32600331cf.31.1777560230671;
        Thu, 30 Apr 2026 07:43:50 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm13748705f8f.28.2026.04.30.07.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:43:49 -0700 (PDT)
Message-ID: <159a7288-6a8a-40a1-8614-4fd30efb8969@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 16:43:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: Constify qcom_cc_driver_data and list of
 critical CBCR registers
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
 <a0a9fb8d-c109-4120-8780-8f9c21027b89@linaro.org>
 <828d2935-e881-443f-b0e7-eb68466ecd30@oss.qualcomm.com>
 <c2ef2e56-c8ec-417e-9771-f2e6746aa201@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <c2ef2e56-c8ec-417e-9771-f2e6746aa201@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE1MSBTYWx0ZWRfXxWYbmw11jkFc
 o4cGVwkzDacDi/31zNAhAslxJPJzhIU6h2a2a+wIqPcu6nBXU15tp3XZHXK+Cb658EMS+pdR7tA
 wIlirzBoqoleh9ZmzguI2sfuZLbfTR39k/BHX8fdCp4tXvNYBhV6HWggPEXbRNhOGW1Rrm1ik7r
 yqiCy5f+eJo4hAyyLXKoxfnYVk6ic1R8+4f7DdfKOD5mHB8+QBs46gfbPop7bkLwSwpfCyhujCt
 ke8T6/ZfBeHUO0E6OSK/qkiwzjmC3bj2HegEUMPdFMrmpC+/4IZkEmHgdhI6vuzBXvBsXQ5uw87
 p46Y3y1jii/ASRUs3++JAdaK3WP4XYDOXGzN73KoELD8D0uJWz/F7ekr2et7O1IgUflenhLwFLH
 FY1qJZOoWVK8+OlYWeq6thLNa4Uak1sRDifhMq5fC6urQEihElcFYO2bvRhRhBaCiJeOL5JBZk+
 NgNnqOb8KtJwM//yejg==
X-Proofpoint-ORIG-GUID: C3BFTrHPAHZVQwudfHfcKAFPOlQTv59u
X-Proofpoint-GUID: C3BFTrHPAHZVQwudfHfcKAFPOlQTv59u
X-Authority-Analysis: v=2.4 cv=GMk41ONK c=1 sm=1 tr=0 ts=69f36aa8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FyuGjayXr35bo7Q-RsMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300151
X-Rspamd-Queue-Id: 9C40C4A4319
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105381-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]

On 30/04/2026 16:36, Vladimir Zapolskiy wrote:
> On 4/30/26 17:05, Krzysztof Kozlowski wrote:
>> On 30/04/2026 15:03, Vladimir Zapolskiy wrote:
>>> On 4/29/26 20:09, Krzysztof Kozlowski wrote:
>>>> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
>>>> are already treated by common.c code as pointers to const, so constify
>>>> few remaining pieces.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> 1. Constify also nw_gcc_nord_critical_cbcrs (Sashiko)
>>>> 2. Add rb tag
>>>> ---
>>>>    drivers/clk/qcom/gcc-nord.c     | 2 +-
>>>>    drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
>>>>    drivers/clk/qcom/negcc-nord.c   | 2 +-
>>>>    drivers/clk/qcom/nwgcc-nord.c   | 4 ++--
>>>>    drivers/clk/qcom/segcc-nord.c   | 2 +-
>>>>    5 files changed, 7 insertions(+), 7 deletions(-)
>>>
>>> What's about constifying video_cc_sm8550_driver_data from videocc-sm8550.c?
>>
>>
>> It's on my exception list, not sure what would be the benefit in practice.
>>
> 
> The benefit is just the same as the one described in the commit message,
> having such a peculiar exception left makes the commit message statement
> "constify few remaining pieces" imprecise, and if it's done deliberately,
> then it should be explained why it's done so in the commit message.


What do you mean? The code is obvious that it cannot be done. We do not
have to explain absolutely obvious C code.


Best regards,
Krzysztof

