Return-Path: <linux-arm-msm+bounces-117318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xBpWLx/7TGrPswEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:11:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 168AF71BB84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:11:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L7lEwIfh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SnkZa80a;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117318-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117318-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F3F93013D4A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 13:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5B23FB07A;
	Tue,  7 Jul 2026 13:07:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B803126BF
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 13:07:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429657; cv=none; b=Sitr6jjarASIF5AhhbdexTbA78FjMnTpNLQIPWz6zliPnhmEZ4Rm8PwaY+bGx7t0nUf2tv7Wn5hctAFQ/Mqta2M0UHvKTaOCWD8fdkYDDbt3QVlbz7wBhfK495ERar2US/jgp8gur5V8au9xWDMoY921W3UarbdmjsoktWwcyIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429657; c=relaxed/simple;
	bh=KpdPVz19HVrlkW48+Oy2TNpS9/8iY6PDbSnX4WVderw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dUmSfbjYkW/qVrpVR2+RUrYP2XgiTgGV4l1FeD9wbPWABwtZfKsMceB2NAa/oxqV2C0PqKnWwN8/9SjsmjLjXZv7P6atQAVDL7ulQYISi01HI2ztGXFpF1ffBbzfOtcYg7NubWbEldbMhoF431I1pV7ASEpvFA5lm5vEqE1eIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7lEwIfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnkZa80a; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C9MiB3740935
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 13:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnXcQ3o0MMmuZU0mxgw/WDOefXkSOTgmXJB6YAntbRk=; b=L7lEwIfhmrJlWiNo
	1bnUAJMzW/LSGvniuGqYWeTH+CRlhdbiiwMOfmYghtgPHbaud1U60yXSpGBgrTwO
	+zJywcpSoeIQxfF7kb1NPliFdM9z663U9mRl0bVJ2M09b2R0l5K71RhzBOHZ8F/a
	AjKXzUTkpg9zq28puAcPT6U5NkZg/h8HOs8/B6Akgo8FvAqDrueyHe++jUNJAt5z
	SLHVNsNV/IniHraf8Q6Qk/Lv/V4WxvEx5pL7TGLWjd2eclnwa1kGiFhgEozYs3xx
	c+6yrUu2RwKh6refVw23EN5lrymswM2TSZcA3q0OOQw9tiMO9OmI0uYxhNkknl2z
	a3T8Xg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a9k18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:07:35 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73843d3623dso678525137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783429654; x=1784034454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnXcQ3o0MMmuZU0mxgw/WDOefXkSOTgmXJB6YAntbRk=;
        b=SnkZa80aLx9t2+3CNmFEbv3Gv+lVKFBL2x7/1xlJPL/pqi45rsE/V9FOXj+XUqC4FS
         7EEZWK4dI251/Y5ZZ9demVu3tc9KSxBwI4WNIvzmOU/ucnBL3NJ8AUDzzdyXKuq/CKue
         ctuNJKI7toV5Y5Ywj3IppW4MdIeQHownxQ2MEnSilIDwtFjwl13wiTnUmYEiWDA0/kFw
         g9nuEHizlZYQ58C/LxwU3ypp9fc05b190F07Z6gEJ3DTx9RAcwmKKZzGCLzhtdd4N/kZ
         zDSst2iWDOmVdMaMIecGO6OzQEfduqEt4GZhMVST5cKmRLTq7cXeIRXx3oyXUlWswAU+
         RArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429654; x=1784034454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnXcQ3o0MMmuZU0mxgw/WDOefXkSOTgmXJB6YAntbRk=;
        b=h95iju4abbtCwt846NQpuJ28zwmSChLolt60Nu11fwsRBtAkXqNFOR5MuTSZglBoZJ
         deRU10A8vQfYjpwIqysYdT3eisfGverkZ3SGDG1mH1CqfMJNfNTPikdZvJpKp3FtvlpD
         6HFuv3xiYc27PRJzhziNujuXIgbqF72L5Q/690ZbPIzunHLmxOMrUWooyegmCjDi7k9p
         BZw85ilPmw2rR6CYePwHzCXcrFhdpr/U1+WdU2UPMtqlIb4KlJMuupnTYYhyvF9w82dU
         6DqdPqqsao1i6zTYBhD93AtUZ7ZcOUU8fg81f3P+w6lSTB2u85b2ekjHFpNCl2lsyiAh
         3exQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxCu4LSnlrfjM9Mp9SsRYCfrwDK0WmT/XlsekziC7zxKTuygiXYW7JetLXFzaXpu1gkLIg4vCjmTMCBxz+@vger.kernel.org
X-Gm-Message-State: AOJu0YwMhgkZilwllsk1WjaOOHgK4QOh3dlf3rJk9EiuThDCHyqMAe2u
	XOg8wpdd/Fk+of9yuyzIlzAtMaYmUkPF4W1IdjbcTskE6Fg/LnPFNuxW+gEDPb6qmGo2Tl2Ilj7
	6ZgB/JCTKDHOT5qK9Usvba5tWosUzN29sdz/IK39mAG/JzSVgQjyrXo70MjXA+tLZgi5p
X-Gm-Gg: AfdE7clF4yBSPxC8Y0ulwWQPZB68onlGRA/9MwmutIB+bPtEGcf3jaE654rrxudfE2V
	7NRZNAIAz0O06qq/JHCA1clhwGJZKqFC3MmyM1Asfd/rNo14r/atM4keeFfmfdDxY9S3Y8GBGk1
	G3jzVqQcDDcSw52tnWwNeoSNIxWy5QyoJBQgR4hltM2bVgUD2RO9TdlJGC70+6ta5xNZPkM7/sz
	8YHvvFqTNh695NQKpZeHdKZ8q1JwLU3G8TVTxffv+JC3GPwLf1/GxAgzfF2KKukx7nu/q/2xBXJ
	+CadZYkv5G4jYh23cUjmnIZh2EtB0/xvML5MKsKJ/NMCZGiugeEGgE/brhTUN0njogGWM5mKz/9
	vWeJCynnLIJs/tn+9U2b6REauj7Rz3ThGdHDj0Io=
X-Received: by 2002:a05:6102:290c:b0:737:1ca6:84d1 with SMTP id ada2fe7eead31-744b7c5e3e3mr2503001137.24.1783429654279;
        Tue, 07 Jul 2026 06:07:34 -0700 (PDT)
X-Received: by 2002:a05:6102:290c:b0:737:1ca6:84d1 with SMTP id ada2fe7eead31-744b7c5e3e3mr2502943137.24.1783429653657;
        Tue, 07 Jul 2026 06:07:33 -0700 (PDT)
Received: from [10.219.56.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm3703700e87.32.2026.07.07.06.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:07:32 -0700 (PDT)
Message-ID: <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 18:37:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
 <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YcIzBTJRlkFQxvK1XM5ua8MfE_XH0j5h
X-Proofpoint-ORIG-GUID: YcIzBTJRlkFQxvK1XM5ua8MfE_XH0j5h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyNyBTYWx0ZWRfX1aeHzqH7s/Qk
 XlnLmNdOo3XoJJhU2NddZPCU8JnSxrBfBocOKzof3tZ4EZTXxkOo1DxA3y1GV84daEl7J3djBBs
 Cm8YJ/6rlwna8zU0lyhkN/iOMhTiXiY=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cfa17 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-8xGkPWzXzLllqT0I9MA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyNyBTYWx0ZWRfX1pTeFI4XiKyQ
 rka8Gxj1bCXyc/px2CgmmVo9AZ0gz+dr/3PZ+okqJKUYHhKmFFO+EWlaCa8V9DFOiW4PZahqb7Z
 XjLChjTlnWCKhUq41g/SZmUoErTWs0/Qz8w2UbyUB+QmRJvYodXTcdhkwXyWfWOxOcwLbs0gN67
 uTCj8RhPYOpxaydprlwWjFJVZDKcXWV2iECQ/VctGKxdAIOa4CYMdreNv/uouP4PAHAkW6OnKno
 k4+isp4vzZHkBsNSLISWSXY3sGBnd74moqBI69/5E8107Rvfud+V6EdwEzROMWR3oUvYegaMpAm
 jHOxe+uDeGYaqZqGEUrOnX/T5xxL5VWpkIKH5iH9Z+R0TC/SO1pFn1T0HeGLYoZIbUo4XdSydz/
 b0SUDx/WrCMUxmJ/rV+YqTV+96IXDWvAtzhcR3Xg0Gzre4r9MoVc7uhDqyy2oc7ZrVfWnaU9qcC
 Zsdh89sPkMWlzoacfrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117318-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 168AF71BB84



On 7/6/2026 11:12 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>> are accessible. Without this vote, the SMMU may become unreachable,
>> leading to intermittent probe failures and runtime issues.
>>
>> Add the required interconnect to ensure reliable register access.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 90e50c245c0c..721526f023dd 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
>>   
>>   			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>   			dma-coherent;
>> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> 
> Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and

Added QCOM_ICC_TAG_ALWAYS, to hold the vote in SLEEP bucket as well
preventing gem_noc going to sleep when icc_set_bw is being called.

> then drop the extra suspend/resume play?

Not sure if I understood it correctly.
Did you mean the extra suspend/resume play in arm_smmu_runtime_suspend
or in arm_smmu_device_shutdown() path?

Thanks & regards,
Bibek

> 
>>   		};
>>   
>>   		gfx_0_tbu: tbu@3dd9000 {
>>
>> -- 
>> 2.34.1
>>
> 


