Return-Path: <linux-arm-msm+bounces-107512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOXVGDY7BWowTgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 05:02:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC98453D3C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 05:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CBFA3037999
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 03:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA391303A0D;
	Thu, 14 May 2026 03:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEVmWS7v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvTfUuL6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7F61E8826
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778727723; cv=none; b=KHlnujVOuIOKCMRZApGkT53erKb4KypPPHDbNuXG+7eRjfsuvWNzKDNtd+osSMFck+uymwTDPgQOceGoXukStzQBI9etEAMiXHvN8Wvbj8hHyXHnwbPPwCMbzdnPCov0VCaFb6hR5wy6IWWtMATc1ZLucMHZ7P/HEkrqOJzUVfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778727723; c=relaxed/simple;
	bh=JlGxCNFP5AqscuOf2R/v0doOmVWZhMUieAQXTabK+Fw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rKWhXwBrbQtJBiruqxETAdCz6NXQZjB5FCMbo677vI1Cvvhz6Ns6q92BRglsa7OHKZPR9FlNo+G13GLRQ5zuQxz3Y3bFocva6AiYZZOI5NMftwZwGfTRtYq71Rn9DSh5AHkrd+S30LXQcs8QN2WFno4CCCUh75zy2u9NT1T5710=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEVmWS7v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvTfUuL6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DH6Il93430151
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nuVaQCgOifhWXgFFXpvwYHL8FLwD6PE1wpppWoTe/so=; b=JEVmWS7vUSZVT0KI
	K/fr3Ry8MUhdCO6Z77tSjCd6mZGGA2kkkFU6fM/oAOZOvzMiW5OvFiVsL9pDuZq2
	OUJFE7pYjIcTLSr8ho6EAfN4g19KJS9gyfcX/LS8U299inTEx1yT0bG+OFFhPBm5
	oGFDdzj8z6i65QG1yIpBrco+/S+Wnpv9NDI1T7IYDbWzPeBHUTyuyzkpick/Fi0U
	SelUx51yNyoza6Ug/mDZvTMmObiel8IQnNpGw1R/VET8JuVQ/xzSKnkb3UTlafMR
	n8F+KG/Mf8O7xHh0m/qiXfPTaNQuZ9vxiAIcU7xrOQJafl3ax2vuLCicjHncZO6E
	Fvvgnw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmckcmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:02:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a6d84522so141351295ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778727720; x=1779332520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nuVaQCgOifhWXgFFXpvwYHL8FLwD6PE1wpppWoTe/so=;
        b=WvTfUuL6SBGb4kkgdhWzkpyLPI/8GWNd6kqC9d1ooAvIpvTe0OcIwId3IAzV7zXotD
         Ct7+MEUbZjgX8XoEyA/A3AbvGbzN5TNyxl7ZjArLwzcYAXd4rrez8ew+pJ3yiTfsqG4I
         SvFKKSsewnDABqfXzhREt7CthZ94eN2ajFwwlyd8sQ/sj3/TyZ5Xmk1puFtj8nIRMi+d
         Yl++vehePDJ6gXdaXGmgYwSkWRZY4HTlLVso7phE8FES4pwDZVfRuoOWQ4Y4NHHaYpHa
         i5e6lSigzE3eHS1FNzjoDcvsO8fJ9kCiGmG4s4NbcseK6PpZOCsOASOoXTDWTykdqD8R
         gGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778727720; x=1779332520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuVaQCgOifhWXgFFXpvwYHL8FLwD6PE1wpppWoTe/so=;
        b=GVgc2jk7Tc2DQ75fs6SSdi4WEt4lZoDhZHWA1jJhxAdRxXbi67UF+6yCT4hVru4CeH
         H5Y5ea+1cgDh6ZhBbaxinKSe1w/SsoL+t6Mf+GmtCFxtWRvQQIaLQ5O6idbZZ8V2Oeiy
         lD2pujRmk64wI0W3ZTcn9X9zpChga25HsEpw7EYHyiCWp0bZSqjcohXfccId6rMGQpRw
         TK4IFjc8GgW73qT7qfAvZ7bIUKCpAF4rysaec+eURbVfwBN2VXkbPGCaqwlAM5MLEzvp
         nG+oiE/mMARHiNHfVYXN5sKNsrTs1hskusW5iDEjyLwCeI1r8h2gBgy7ivOpcHZWMJ5j
         olHw==
X-Forwarded-Encrypted: i=1; AFNElJ9XC/vcc2Vpq5dSGeyxWBEawBzGgRyFGklz4KskAEhZ2D0XTS0KQ7/12My+ySR3WV0Iw72rgZhZqeKI6l9O@vger.kernel.org
X-Gm-Message-State: AOJu0YxFJoVPMYUTaZOQ4oNWghy8k0eiatc6Vl6s3YxlFKmcTsvx0LTb
	MBqsL8G/ghBIN7XrpuTMREzM9bo7R8YkRZ0EyRAw0MrRq68fcGr2CR/c3LAjs4wohB5faBZJjI2
	Wa/wIsLPK55G3vigjwZ25jXQNJlozy/JUQpSZ8ZMFR62h8JEHtbqro7YRsraQT2yrALvs
X-Gm-Gg: Acq92OEbBF/5uIp9TaXC9Y0JfbVXYGcwhFrDDE9+RtchQFuyLZVLin8X9BFbtSeD3BX
	eES4JR9W4xrQGPJWIj6qadbsmahD3nXcAexAcN7W19hDXxv/AOpkl831htxbR3M+4zLjTRCxW4D
	yW3+VVhHTgfS5kwl2OHLkcxjkof2q1L8xMzB9NnJcem3r2zLBIGVZbmRpAKVVW4PsLoaWVmv39A
	TKbnXbWtfgYld58EUdlywgytVPHao0LJWAnwDrVARfbRsxxCW7sXvkVIX9HvPMI42mivt/6bAbC
	6rtSCKleTPbH/9HN6D/lnMBqDBmgzv0YExFv1XG1kDaUajtKWHuvrOBZCeGXzRY+jbe7Vf1A26s
	HgEskGnGt1Co2UMAcaLQ5gCpbpWCILbf+P0IXv4XbSyq0AZNbRtYmJmwQa6HjiLKMLj3EuBP8zz
	Ixsi01/i2AwmL88tvkDEON64J9hP4=
X-Received: by 2002:a17:903:31d5:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2bd2718bf40mr48530865ad.4.1778727720347;
        Wed, 13 May 2026 20:02:00 -0700 (PDT)
X-Received: by 2002:a17:903:31d5:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2bd2718bf40mr48530515ad.4.1778727719721;
        Wed, 13 May 2026 20:01:59 -0700 (PDT)
Received: from [10.249.28.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11d6easm7082155ad.72.2026.05.13.20.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 20:01:59 -0700 (PDT)
Message-ID: <1160f00c-2d48-4470-aecd-2420b9c79058@oss.qualcomm.com>
Date: Thu, 14 May 2026 11:01:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 3/6] media: qcom: iris: Add B frames support for
 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-3-4954e3b4df84@oss.qualcomm.com>
 <vayghe665w66b2whefdstroyrleozjzfye4t5ckvjmju2rnftk@mxquiebncit5>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <vayghe665w66b2whefdstroyrleozjzfye4t5ckvjmju2rnftk@mxquiebncit5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JoJnYm_8yosIVcAFP4H7SBqHXrIdND_Q
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a053b29 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=kLwFXv0XdFo9VwVnQ6MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAyNyBTYWx0ZWRfXx1umz7wZ7QMX
 HQYO+8l767IOOV/gyLVdoN59c7wVFIK5M0WOUsvp45b75jmR7yTC3ivQnEGVSZO7xF67AKIEqfd
 YCsGChESjPliw+hiFL6N+cliZK/p00HkdJW1mhpnD3kRC9VEJ9hdqfDqo/muSvUTVguCjx6IY9M
 08v6zlNI6Q5qtGm35yLBp1uYzBWHByxYpHlbERY3newjsXs0T3pLV99Dp0/COPaUBG3B8yGH8OD
 x/7hZg0NGseFSFJdgGML0B/SHd8qMJi00HTYLuKSQTrGUp5ZsG2+aOt9HzwuDbn/yUxlDzaZmYi
 nUjZI4THuGiRr7ToWQ7Rgep+Bs1Bh5skuaKxD0NSNVuReKOKczTdZFoDNugk0Yjs1nrTawQc49F
 vyurm0J+XpLjVAnf2RxBaVwbHct7nBxDs/RjQFpUlL34633vRnihxdB7DeVvQVlhAS2cqpOGJHB
 DZRe3Nz7zgkbnfiEbYw==
X-Proofpoint-ORIG-GUID: JoJnYm_8yosIVcAFP4H7SBqHXrIdND_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140027
X-Rspamd-Queue-Id: BC98453D3C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107512-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2026/5/13 19:00, Dmitry Baryshkov wrote:
>> +int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>> +{
>> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
>> +	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
>> +	u32 b_frame = inst->fw_caps[B_FRAME].value;
>> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>> +	struct hfi_intra_period intra_period;
>> +
>> +	if (!gop_size || b_frame >= gop_size)
>> +		return -EINVAL;
> 
> The same comment. Maybe I misunderstand something, please correct me if
> I'm wrong. The definition of the GOP_SIZE capability allows 0 as a valid
> value. Here you are declining it. Why?
> 
>> +

GOP_SIZE
- Value 0: Behavior depends on the firmware implementation.In most 
cases, the firmware will treat it as an invalid value or fall back to a 
default value.
- Value 1: Explicitly means all I-frames.

The gen1 firmware does not support passing GOP size directly — it is 
determined by the number of P-frames and B-frames between I-frames. If 
the client passes a value of 0, it will cause the subsequent gop_size - 
1 calculation to produce a negative value.

-- 
Best Regards,
Wangao


