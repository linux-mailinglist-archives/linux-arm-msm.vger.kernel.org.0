Return-Path: <linux-arm-msm+bounces-90403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BMpLiihdGmd8AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 11:38:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA217D433
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 11:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12E963002D2D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 10:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785A82D4801;
	Sat, 24 Jan 2026 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owB/dEXl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCqv7qHS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E11F2D0C7B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769251105; cv=none; b=Ql1+Wt0GR9PUycEwi/dVT5SOd7hatsV4WXP0Kj//Goecu77AiGOEqXwUnb41EdcuADficpiffu8+TQvOGbE96a7T6T3nNM86DR6kejh8jpqDHEy2V/P1a+08EBp9dMsMDzniEoQtndmTVB/rX4yX3zN+q+S4WBYTN24fiAG0Kdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769251105; c=relaxed/simple;
	bh=meCPGOEBebHX544YaS09Yi/qU6DHzkeG1c+Of/FBSvg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZA1uRMdmChcg8Mz1Ni0gGoKyQwSdwjlDJhz1Phu4yJYEdlDWEtGsrV1Iq0GXnripygB2SZAHFYhKAunWtTWlxivbDagB6enU7uVYDfDmIukR1IfNfoRbcyOQoYe5xd+5pHv7h8Tto7EfO8MmPi/Ogz75VsMpg5GEQpMDCPmKndQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owB/dEXl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCqv7qHS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60O4dMLV1659336
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 10:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3J7xNQPfpRsnFYqFLGHAgQpWibMHp3cy/N6JarG//vo=; b=owB/dEXl6EG1sQhl
	Dbwb6ZPggUxUHdR3egfMzWaliYdi1G0mYwZ0AXf3ckuVvGBxTO/PiFG6hUB7wO1A
	xXVYhBm5zqciqMKuNV7hLLeZJP5rWV4AddvoalvFZrB7UTpeYHwftrNF32DetIlX
	ZtfY948XxqfPaZEg07+znEvfk56HaFyQ/MRwIxqHGOIdbfiTpjCnbRCwarpjiCOD
	KAlNfGVJPi6d5JsRv9FtQZ/Mjj2Sw/LVMIfxcF0QcHT/AnHD9uOKyb+Iwe3ddtTX
	5npIla2m6l5XgTyFNTuTcDqWf/kH5d3CjjH2o8pqlUD00bLcwb2jLo0CNZi5CjME
	D9i/Rw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dgedd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 10:38:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8231f407512so1369040b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 02:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769251103; x=1769855903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3J7xNQPfpRsnFYqFLGHAgQpWibMHp3cy/N6JarG//vo=;
        b=fCqv7qHSyviasHg1Mt4AyAZDymnMHNfPmgjqpTy14CtYERkdk4xQ7goOJxE+3MoEWM
         zvKlMy4o0VkMV8zuuRtx2a8Zu0Zr4oNPJqy7Zd8KRSFMUS5ywl2T9aESRuq7XDogW8Bw
         Pi8vLP/POFWlWLiMzpV6YlOCkdv0uwWxHtPS702lsYhCmawHSFJvan8swfWRzGI1CnHj
         gWfQjwLHqUvKceWajedy0qklSZZ7XBHCjSpURSq+AiM+xjzviU38BMufj+HgFrowUiSb
         jYJ7IpTx1DlO0hidtK+m+gTWCSpNKr6QqKgO/0RW64X1hKWw/VIN90Rq5Oc1SpiDOhrn
         Z5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769251103; x=1769855903;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3J7xNQPfpRsnFYqFLGHAgQpWibMHp3cy/N6JarG//vo=;
        b=VqhmTKo9Jch8uHWC+daiHUgg42zB2P/NgDf9aIsXcrDD85l/YMiCFZGkxKNzHCIOZ+
         zuwdkhc8RN7RaK8C3pQobMuCC7USOX4LmmEKQPfzoHfqzDJhnbzj0UjdV2iGea3kqx1p
         5Y9lf9B2mmYweFz5J482rARI+SmwWMqKvQtFFfVNR9d2iDKI8Vg/haxu10hO+9mOlmD2
         mBMyPD2BSt3qQoBYJdL1c5Jnld+6+rTKNYGtkRLTXv++fjRG81dqIVzB1RytxWSsFLRy
         zk1Y0z4AMWQxBoapYndMOVRqVgzsNSAknwcUTTyacoajgViScdgWAFAcsN34RphDSros
         k6qA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ04PEEvL1+bErqusuAt//ThMNQQvHFJfT5jjBsF+JHXzIWJPSKO/BcN5aEHcWbt+5G8jGfgO2InVl+sgW@vger.kernel.org
X-Gm-Message-State: AOJu0YzOZOlzU8NqTyR7qKysBe/ZMSknT+Dkv/kueWE8GF9iplziQguN
	yyoiYhd+Booyj/4UtWcM20goKbtol/jagE5/lZUhM+Q1QFPOsVqe4ywUKffWeuObY5g16wrej6T
	T/oS+fnl4rUkRRhIAXjC77DcTV6Q8/8prgoTJfqxsgtc8+JuAVXTUTQq1otSPHTQcIYtE
X-Gm-Gg: AZuq6aJEqvycuLqU3KUveI6K3uksASbRRfX8FYwMjX7E5HdPZ11XGR3o0Z33uQCFJn3
	mZnvxExMF6fiAQfOEFubhO1ZD71SAyPcKhmgfczyHUDEefO4M6w2+8LTqzBkw3Z85v660Sl1ASJ
	xex06URkqlFYvAEqi/1xCgjVOI6Vkum2jxQe2xB1vKeTSabqO/rY/gYIlilWZitQMmrYpI5eTgn
	jLW8ErM21yqgQM31CVRSg/ds/b5+BfzvMkjPXD8k95bU5H5GCzWaAz9B0U3xrzR3Cw7d2cZXG0N
	ln72EGCU3P4xwH6sf6h2pwEJ3lcCfsOsFZn5mW3NvTVLjeG4W4tHgYgaWIUU8wAJ2RuTyyhKjCq
	qqEXwVI4yx2eJco4x9JSedPNrIuycfgQmQajV0d+p9BJe
X-Received: by 2002:a05:6a00:3e05:b0:823:1392:ba5d with SMTP id d2e1a72fcca58-82317e15240mr5785356b3a.38.1769251102685;
        Sat, 24 Jan 2026 02:38:22 -0800 (PST)
X-Received: by 2002:a05:6a00:3e05:b0:823:1392:ba5d with SMTP id d2e1a72fcca58-82317e15240mr5785339b3a.38.1769251102181;
        Sat, 24 Jan 2026 02:38:22 -0800 (PST)
Received: from [10.218.16.150] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318671e1csm4495631b3a.27.2026.01.24.02.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jan 2026 02:38:21 -0800 (PST)
Message-ID: <9e9b9faf-7c5d-2e83-a8ac-37afeffd81d4@oss.qualcomm.com>
Date: Sat, 24 Jan 2026 16:08:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v19 00/10] Implement PSCI reboot mode driver for PSCI
 resets
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <2dcd9e3a-0a40-0dfb-29b8-99b70b73a59a@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2dcd9e3a-0a40-0dfb-29b8-99b70b73a59a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDA4NCBTYWx0ZWRfX+lbkddYpymJ/
 JSXNPdHgyD6seuS+l6ZaZWwfv7qriL86/iw4tMaYYWWcLe433QAhpAtPBRGRqo8Kz3l5NPdLB6W
 c9RD9lC8bVoPq/FxCeLkHSdAIh5ZSp9ReoruhxLsitx+n6m4D5O51MY7SdqhtNgUVTsdNBttxGJ
 yKnrCvl19sN2lj303GLuYPpRFhyS+C4CD28eewB3mHabKV6Em3UpTMsy2iqk+AYF14YC5i1Xmlg
 dIr4j1xUf5umwYwNIHO1TXOIhX/YK1FvRXsFmNk4MCCAR8bPm/lbp20gbvv9ADIEYGP9TQ5x00V
 k+/D3woQvhSX984RJwKquWAIRUmHsTNbm9//2Jp59RH62nU4IJL0Jb9cbWlKHivpa3xA6KKODia
 RK6TzMMNx45tjeXiSW1AmPfnjrMfjusVxhgMXQ/W/r/3gXryntAANikGyRettEOlsH5HpInhNiE
 jR+1tAnizeldLaVWDew==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=6974a11f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r0sTgVGAZfIT8Xa8ZzUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: qwVjX_-kpRxJN1Xjpf3PEL1Hku8PO6mb
X-Proofpoint-GUID: qwVjX_-kpRxJN1Xjpf3PEL1Hku8PO6mb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240084
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
	FREEMAIL_CC(0.00)[broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.infradead.org,quicinc.com,arndb.de,arm.com,rock-chips.com,gmail.com,ettus.com];
	TAGGED_FROM(0.00)[bounces-90403-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EA217D433
X-Rspamd-Action: no action



On 1/6/2026 4:38 PM, Shivendra Pratap wrote:
> 
> 
> On 12/28/2025 10:50 PM, Shivendra Pratap wrote:
>> Userspace should be able to initiate device reboots using the various
>> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
>> patch series introduces psci-reboot-mode driver that registers with
>> reboot-mode framework to provide this functionality.
>>
>> The PSCI system reset calls takes two arguments: reset_type and cookie.
>> It defines predefined reset types, such as warm and cold reset, and
>> vendor-specific reset types which are SoC vendor specific. To support
>> these requirements, the reboot-mode framework is enhanced in two key
>> ways:
>> 1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
>> arguments (reset_type and cookie) by encoding them into a single 64-bit
>> magic value.
>> 2. Predefined modes: Add support for predefined reboot modes in the
>> framework.
>>
>> With these enhancements, the patch series enables:
>>  - Warm reset and cold reset as predefined reboot modes.
>>  - Vendor-specific resets exposed as tunables, configurable via the
>>    SoC-specific device tree.
>>
>> Together, these changes allow userspace to trigger all above PSCI resets
>> from userspace.
>>
> 
> Hi Lorenzo,
> 
> Is this patch series now converging towards the design changes you
> proposed in v17? We’d like to conclude the design so we can move it
> towards closure.

Hi Lorenzo,

Can you please review if the design aligns with your proposed changes?

thanks,
Shivendra

