Return-Path: <linux-arm-msm+bounces-104529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENw8LLzq7GmvdgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 18:24:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB0B466E03
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 18:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 501863003834
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 16:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4723537D9;
	Sat, 25 Apr 2026 16:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRm0M6hu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBsyBRqa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4656934F495
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777134262; cv=none; b=VcxWZuHMathvFQJKN0cIMZMEgA3LPHBHtfRnsbJcGv5sqrEyiDICqVax2twFeGhdSHaqqTlJYPuyPzSPmm0t1K6kzrzHwunx2IzIuLoexU6rOyCtg35ZwiCQd6iAt7YcFXkol9ju304KzOInH42X2wxWI/VEEZgcviTF6EkOkwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777134262; c=relaxed/simple;
	bh=VWy9Kg9mDTOQDkQpdKD/lfret98JGppo3qXkI9nfpyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=secg+3Q0/8Q1BrGO7VHQ4JGw31CQ+Rb4QuyShQiqVAP6sPrvMif9YJlOTql5PWt++4T+85M3LO9E0ioGRWHnwb/Sh81GfyC2Qja5/f0tMnfz8mKaw0J8ez6HScgMsPtPBSGXg8dn606epSCG5yF8FX1iabt19awBJU7IVslM9xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRm0M6hu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBsyBRqa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63PGODSp3318020
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 16:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZzgVikKVem+yKBm9PKQ2pL0LAqojwaDKUW5/SZUQuA=; b=jRm0M6huFizUvkHb
	tZYUdtnmtE2LQE1macTNCd8MjeOQ/jmrtd8i6rVmUi2ynura1X+uSDuMpGOGtMhc
	qK+4Epc530EwLltrtpZ0OZegKQJwLQ8ucfGJAMIAXH/w8N9lElP/thldjCiAKKdp
	nguBbfbmJVWsR/x7LoIYwmAVybriET0q/I2TX6msC3i9vUg0DdJaVAUfFT2VCZLr
	PFHDJlvZEzn7VaskC5AjzbXpDtwuSMAZtXetypupMBydu2h2lZDHID1O51lAde+2
	qUcKbkRcOgG8RBVF+2m+kSHOf392hF0uzxm0p2k+bApZAkdA8cnPpye3Jjmmggra
	BAsXHQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkx9b64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 16:24:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3595485abbbso10762732a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 09:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777134259; x=1777739059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZzgVikKVem+yKBm9PKQ2pL0LAqojwaDKUW5/SZUQuA=;
        b=LBsyBRqav61Jw7tJF4ytIpWxfYy9uMO6z4eV63appUIxi+YI+JHQqnhM95LrV4R+aa
         fLasUwE5DuJmCTIB7AISJP7kdiLx2j2DBwMyJLC5Mgidq/O+DQDnZVQOG8QwjaCVI6TH
         zoFa04tMpDVPrS1zsXL9UlWyTEXPNt7ltAdEC3xNJEhZ5EDPDJh0q1omxkvDX7KkITY8
         dTiMdWHw1It4bAx7r0WKEyLVM7sp9guU1O9QlrZExO4TmO5+2ui3neARUAEUuXNfBBIi
         htB1/IcPzUY8IJjjCtXWnreTaiNwYk+dRoBd+ZsiisUaE0DtlKHxzkZcdjCgsGiGt3Ws
         F+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777134259; x=1777739059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZzgVikKVem+yKBm9PKQ2pL0LAqojwaDKUW5/SZUQuA=;
        b=tUiEGdmjgqKaV2bIDoexaOz+UFv9HWNIMk/WrWkUgeVralG6jVGU11QR3GVofZDTx9
         mtyaLLDUNhbKda2VctiVkzJZuJD9rU77CIxUkZbwPoxbQFIepmxvy3c/Lp+M2XJIQRxu
         vosDtQ50m3RA6uNNG43xD6W8KAxZgc11upO5ZJTPHwtuHg5/0epOHHBaUbMu/YJ7o0Ph
         59lWC4CN3Cun5Y7EEObIjn9Vo1sTADSPLttdhOIhxKLjUPT2z/k9NqOYIi5XnC0RhYEv
         AGO+nHHra6x4djxttAdkN2/zi/jmsDcSMHneGrJLpC0iF2EFCvSgjM7NfO/K1ZR4nBGW
         9yHw==
X-Forwarded-Encrypted: i=1; AFNElJ9ec29JucdPi8HF/wk6yAIQBylHOqUh7V+1sFiKYpYeEzfKBVeQmqlLHTCikN3KEUO74ytUM4ZKP96j79Uv@vger.kernel.org
X-Gm-Message-State: AOJu0YzFRWYDkOm+2ZVEluNbtnTSkb8gjFjr+wgvm59JhGTbWe4Rlooj
	gvhHgzQEnA3TbXzgSrt2oiaTd2YQQFhu29bYZ4EERsyF+MkZ6JoQ6Na3xOpu1Rw1RgyCxDCwrxQ
	YXA69NsvVAWf2ZvTQY+BYg9+/C6EwP4NJpj+WTKPltRDuiTsjp7f70hRhf0G9HGaDQcx/
X-Gm-Gg: AeBDieuoOxq0yjVign+0ljjLfsn/xEfwKsCnvsFHnN8Sg6rkWXl1jDdyx7yi41hLYGm
	lVVP39EkEOePCePdJuoriQb8gYaR/gph6kMHxaJ3vx0jZLgT8Ufd6s/xhpqzibAkMVdffcUGeY/
	7ex2VAEwCEm7f6OUetmrpsIZz+XywwJ602dZe53jS76U45KeMBgsvcjmFx6QqA99rQmPTG+AIqh
	7KZcR6gsY/GHENc22WvR6A10EXqNUsN2CfMQMEzv1fiQIb0t3FtH5ZAJqlcbZsccPU2iGlKocut
	vhnGpEb8H2cMMFyQmAz2sAwEi/2mSsJKh0SsvXElXLn7zkekwKARAB4GelnVgJL9CgNnUYf15ow
	Tiqmv3zAeyb+mBMcvB+P2z/lbZdTLF43UVnLJMUclWzJblWARvTZglbZW9XUMMGw4MQ==
X-Received: by 2002:a17:90b:5543:b0:35f:bddd:3860 with SMTP id 98e67ed59e1d1-361403b18f5mr36788721a91.6.1777134259135;
        Sat, 25 Apr 2026 09:24:19 -0700 (PDT)
X-Received: by 2002:a17:90b:5543:b0:35f:bddd:3860 with SMTP id 98e67ed59e1d1-361403b18f5mr36788694a91.6.1777134258606;
        Sat, 25 Apr 2026 09:24:18 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141990bb6sm27919380a91.17.2026.04.25.09.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 09:24:17 -0700 (PDT)
Message-ID: <6d5516ab-f693-e605-77ad-e3f7d0bf579e@oss.qualcomm.com>
Date: Sat, 25 Apr 2026 21:53:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/13] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-4-0296bccb9f4e@oss.qualcomm.com>
 <a9cacc9d-c7da-4803-8950-97511f8d927a@kernel.org>
 <b89eabd9-3d0d-0128-eb56-99ab2ead2257@oss.qualcomm.com>
 <0d68b3a6-576c-4073-9df0-802f909e439f@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <0d68b3a6-576c-4073-9df0-802f909e439f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PxyQ77t9O5wfFnCC2m1CiqLMctO_iSWP
X-Proofpoint-ORIG-GUID: PxyQ77t9O5wfFnCC2m1CiqLMctO_iSWP
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69eceab4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=gkiTcqCCC2T/77GpOVv7Jg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Hbe3yhC3yqVD2gJYGagA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDE2OSBTYWx0ZWRfX73arEbTU5ud+
 0M1AeKmwDqXhz6JfqttgD5RTY7PiznQGAyU7V9H1AKM6hse/wzdE6NwaGfHAYmWHXdaTW1VOGPH
 WKRGYc2v3MwYw/wlhnAFry3x+JEJO76ug41mIMp3EnBMzT1ucWwlUwRFvaVPb7urkpd99d9C3b/
 ZRE7fe/azz1DPV7JZC5OSP+z2ZL1gFNNzHEkTdt/uR5UQRL/qGbvaI4dA6Z92kjWKK38Bqyxp5C
 OhCwhgl5Iw0jishaTBHceDxZD3ce4wSd6AkowJG0fFRgHcBLRJzArxcAHfStEXSUFUCMEuuTS1S
 hahWzd4oTZ2CpwpSk8VOB9iFYHa4zXt2KZmR/tT7155N3ydRDSXZka5M3GtLeT0N2kMNjqxaMmb
 WwxH+g28xkJr19YYXzSrta7HcqpGc5u/K2GJpMvGap1z0NV2DLHLe1gYzyNqjKE31V4DuuVRebG
 2z+4L9s4zrKs0u4lh6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250169
X-Rspamd-Queue-Id: 9CB0B466E03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104529-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,linuxfoundation.org,nvidia.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/25/2026 4:10 PM, Krzysztof Kozlowski wrote:
> On 25/04/2026 11:56, Vishnu Reddy wrote:
>> On 4/24/2026 10:39 PM, Krzysztof Kozlowski wrote:
>>> On 23/04/2026 15:29, Vishnu Reddy wrote:
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - dma-coherent
>>>> +  - interconnects
>>>> +  - interconnect-names
>>>> +  - interrupts
>>>> +  - iommus
>>>> +  - memory-region
>>>> +  - power-domains
>>>> +  - power-domain-names
>>>> +  - resets
>>>> +  - reset-names
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>> I think I commented around here but probably not specific enough. You
>>> miss here either reference to venus or usage of additionalProperties
>>> instead of unevaluatedProperties.
>>>
>>> If you intend not to use qcom,venus-common.yaml, then explain WHY in
>>> commit msg and switch to additionalProperties: false.
>>>
>>> Otherwise, you miss $ref.
>>>
>>> Rest looked good.
>> Iris glymur platform have more clocks and power domains, which exceed
>> the maxItems limits defined in qcom,venus-common.yaml. Inheriting from
>> it would cause dt-schema validation failures, so I have chosen not to
>> reference it.
> Instead, you should extend the common schema. It's already flexible, so
> what is the problem here?
>
> You then need to duplicate all of the common properties...

Ack, I'm fine to update qcom,venus-common.yaml to relax the maxItems
constraints for clocks and power domains, so that the Glymur Iris binding
can properly inherit from it.

>
> Best regards,
> Krzysztof

