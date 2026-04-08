Return-Path: <linux-arm-msm+bounces-102301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEzuJJok1mnCBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:49:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 332493BA1B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 414AD3002B18
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E720F3B38A0;
	Wed,  8 Apr 2026 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZNOmQxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fTCvE0E3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D692E7179
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641751; cv=none; b=XnTq6g6P6d85UaS97nrzUUzOFzrmQR9HCNCG0nC9u+ZrCSG0oOFIYEkSd8NxBHpUgE5rnL+3dzVcL5RCsqVwMiY9mwcKLtdDcUuisJueJBeTfpVAx+LMb8choK+JhbdV/lt+WzXcANueKI1KnFCOhRykvn+1X5v/GSzNms6A0gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641751; c=relaxed/simple;
	bh=rRtBr6F3yEu4yEpn8TTBzkvk/47V7L5nppA0sLfN7Fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MkgSjyI39EUmlDMHnb11ZATM38esZfPX6B45KJP+/0TCrJc41BtdGcRUwITUeQbEHEsVfmIhmiGG5wAOWklqrxVUGZucHFVSOS9CMXIOuq2Qs5RWsLiwgZVfLHPr/2i1haNJeyPdhHUC+n++ochXHyTwYA6hnnsJBnTJDaflXrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZNOmQxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTCvE0E3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385WDxG1006023
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0EattPZiljGg2YeOHkGtyokv1NfgAftzs+SnnNamVo=; b=bZNOmQxbVA59PEBQ
	DvuUvffkKaQ1QSIvoWhaISuxuZUXhk02Z0mJWLCJIwTN8ZzTeyeTOL5zBJ/ASgEH
	4WCx9qIdClG5NF/8DIo5x5zHZkAfkv7pkpIJ3HiAZVLQJeYsLKJnklKxqkejZqwE
	PPLBYMqPPKoSKL8jMQ4BUYydLQTeFhXCRSYvABrFEfxrIk+Bc8ZPlruJmY75ajhH
	9d1Ox8Ghto+OxprFZx8UbRDE02RCKjSFPcnFc1y2dL1Gf6r3Ek1gTbh2bU5iFegb
	J9BlEsOwxQFHIQqepKosAKQwd2zYPDLwXdT2NKgfndknBrl1rz2R6S8A7KIUxweJ
	z71Z3w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tpanmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:49:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35449510446so6404533a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775641739; x=1776246539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0EattPZiljGg2YeOHkGtyokv1NfgAftzs+SnnNamVo=;
        b=fTCvE0E38Vsyp327pyuQKZndCncm0fnkinnUlmcTrr9HUWZ4mm4XR2hDhRcRmbdtzA
         ZGfvwkqak5vKRROM8HI51hlbxCn59zUKugJ3rG+mWD1GQt5id8ixbFU2zuj++7fpt8R6
         vt2o+/S4OfWeJFFvO9Oa/ZwDb10NNOy+wBPYt82svUw3FFYcqbmWHxMpbPolj+/q0HmR
         IiE2yt8g/cYsP8RH0U4uAPW/1xRnWlgUrXY8ZwAFyt91lFzFgGv/+2sz8CXMsA4575Js
         0AKGb6ahqWyBqd73FOgqYqPGO4VLMN4q/6FKxdVwsp0nNXM/MZXzxHz10UWBs/Qe2t3t
         xMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641739; x=1776246539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0EattPZiljGg2YeOHkGtyokv1NfgAftzs+SnnNamVo=;
        b=ACLyGHc70RfwH1QauaPT2BPmEmglNOr+beoC7VqJQhrdr9n36SlvG9+qCoVql2PzRn
         LRbZUD/Ovu+4UWNYSbQMzgHsjIKGbzJF4CAPoUU3FGJ+ojXlACa4A9b4UAUx9BN8XPah
         fQxRNCnDXNYZ9iImbvs/KoHFJBZjDbh3EjF8G/fEyfJ96detyJgFjgjpeCmWcqmw4jAi
         hOkRInJOkpErCoZLB36/pR6lbh425mhrCxVPRcIZbNUswO/cQz1vm7c8X8gnPQkw6KWV
         AIMEJdzaon7oq2FbyDpTh+TaUk/jgijcWuQ0CTq58MtIxztpRsYFgY/kUiqLMKU5zzCg
         +5MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuLZlM1Pti38AnJsEqSfWIN0sDsxqHWHx1zrHJy2diuKqmWX3ueX9AOI+s28V6HiGHAPh5z07haEqGfohc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9UXbDUkTICj1CTHOjspzNP3kYgmyIeXu4MiSTm2NAUKVjs6j
	+UdvA5kFwME41G52Ho7v8wXxK0V8r8byCF7nUO4ZEY8ph8+GUIvRfSIKPBr2VlEUBBegTtQpen/
	em7Ri2l3wEGFZyrD6Y6Bl74koPEbAcNzERT26CvWDYJaOEH8iSJFwZB2mUOmtefORlzaaKmJ8pI
	QX
X-Gm-Gg: AeBDievZCqqRA2J0jwZONtpXkVs8kkeoImSUKFGRgX/ogj8IOyiIyen9QuTNvg49O7Z
	YjDn4ftebbMjyxSfhpYFHi1GdG27p+cJWms6q6+uacojQZRdX0IJq7HX/z4GgBRblTOnouOfSx8
	b09wAe+JLkwMQ2AuMRD/CIwnX8oiogjvwF+C2bgojSXBHHFGDPKhU+ms4+a7vnV7kO9bUdAZJwU
	KWqbaqUAqQ7JJ+XiDIxML6rY88QhdQQrXmHC2xOr0qsx6NexEuz59sOFU6lr+Ft6LecTljK3x/i
	uqdSd+iTDY2XE8z7HUxbycrsFqhmqcz7pupJtPqHbDvnGhO9qFXxJOQPTBNHu+mZF1pT6xKylbn
	tHDYm1Yyt243E3TT5/9dLLafdZNwuw/541s87legBCFs1VHB8CNzCV0Q2XVlvLCnfxuZA439rro
	qES4CRvls=
X-Received: by 2002:a17:90b:268c:b0:35b:9896:cbd0 with SMTP id 98e67ed59e1d1-35de69d7e15mr20332280a91.25.1775641739166;
        Wed, 08 Apr 2026 02:48:59 -0700 (PDT)
X-Received: by 2002:a17:90b:268c:b0:35b:9896:cbd0 with SMTP id 98e67ed59e1d1-35de69d7e15mr20332258a91.25.1775641738687;
        Wed, 08 Apr 2026 02:48:58 -0700 (PDT)
Received: from [10.133.33.34] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe623d94sm25936037a91.7.2026.04.08.02.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:48:58 -0700 (PDT)
Message-ID: <f74edff9-81cc-4d47-a2d0-e4bae3231881@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:48:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: talos: Add GPR node, audio
 services, and MI2S1 TLMM pins
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260324060405.3098891-1-le.qi@oss.qualcomm.com>
 <20260324060405.3098891-2-le.qi@oss.qualcomm.com> <acqAf9fCi8GPxjkM@baldur>
Content-Language: en-US
From: Le Qi <le.qi@oss.qualcomm.com>
In-Reply-To: <acqAf9fCi8GPxjkM@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 87zl2HD5xCxbgtrAOjpjepuIjM0rgaMv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4OSBTYWx0ZWRfX+TrXNrZN+MnZ
 4+rXxAAoYP3cljVJYk4uWUlGmC+rsD8j4WrwVPvLS6STjgfc4JSA3x/pcR3xEni0W1fypZrPuKm
 MOoP6AVjFm4eHz9a71Yr74kd7xRzGdDK1n4+XoJ+RVvnbNnVU3aE2SYZV04trKijtEEHT+4gfv+
 ZjSZX6VonB/Glc084UMCrDh2Qj8C6hH0OzObRdV/J7D/mTInDkxTjojX0Gw9UDwUtJ1LZigfTmL
 Wq0uUGWnbizWwbeU0QTG7WyAzZKkUtTLEom1kYW9M9gy4it29nYK1kA9Bk7PU+okNM9g5/jlD8N
 ml7aOMLnjsrQ54JwgNKWTah56m3gKtEP+IhCMymI9bB8F9C9zTXYBtlUJtUIRfIvBwMMcjbI0dJ
 pE8i+wnUfH1SSYQXQ3MtYpU2HOZUe3s+37KrrquQ8mCUtwYiEJIMY+gzgjXtyshrjPnI7YZ1mqL
 /JDl3M23ExbIP84z0Hw==
X-Proofpoint-ORIG-GUID: 87zl2HD5xCxbgtrAOjpjepuIjM0rgaMv
X-Authority-Analysis: v=2.4 cv=DNS/JSNb c=1 sm=1 tr=0 ts=69d6248c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ChDje6Agw_Lkia0viD0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102301-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.6:email,0.0.0.1:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[le.qi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.47.77.96:email,0.0.0.2:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 332493BA1B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/2026 9:57 PM, Bjorn Andersson wrote:
> On Tue, Mar 24, 2026 at 02:04:04PM +0800, Le Qi wrote:
>> This patch adds the Generic Pack Router (GPR) node together with
> 
> Please avoid phrases such as "This patch". Start your commit message
> with a description of the problem or purpose of the patch.
> 
>> Audio Process Manager (APM) and Proxy Resource Manager (PRM)
>> audio service nodes to the Talos device tree description.
>>
>> It also introduces MI2S1 pinctrl states for data0, data1, sck,
>> and ws lines, grouped into a single entry at the SoC-level DTSI
>> for better reuse and clarity.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/talos.dtsi | 54 +++++++++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>> index f69a40fb8e28..cd451a112573 100644
>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>> @@ -19,6 +19,7 @@
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>   #include <dt-bindings/power/qcom,rpmhpd.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/soc/qcom,gpr.h>
> 
> Keep includes sorted alphabetically.
> 
Will modify in next patch, thanks.

> Regards,
> Bjorn
> 
>>   
>>   / {
>>   	interrupt-parent = <&intc>;
>> @@ -1553,6 +1554,20 @@ tlmm: pinctrl@3100000 {
>>   			#interrupt-cells = <2>;
>>   			wakeup-parent = <&pdc>;
>>   
>> +			mi2s1_pins: mi2s1-state {
>> +				pins = "gpio108", "gpio109", "gpio110", "gpio111";
>> +				function = "mi2s_1";
>> +				drive-strength = <8>;
>> +				bias-disable;
>> +			};
>> +
>> +			mi2s_mclk: mi2s-mclk-state {
>> +					pins = "gpio122";
>> +					function = "mclk2";
>> +					drive-strength = <8>;
>> +					bias-disable;
>> +			};
>> +
>>   			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
>>   				pins = "gpio4", "gpio5";
>>   				function = "qup0";
>> @@ -4696,6 +4711,45 @@ compute-cb@6 {
>>   						dma-coherent;
>>   					};
>>   				};
>> +
>> +				gpr: gpr {
>> +					compatible = "qcom,gpr";
>> +					qcom,glink-channels = "adsp_apps";
>> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
>> +					qcom,intents = <512 20>;
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					q6apm: service@1 {
>> +						compatible = "qcom,q6apm";
>> +						reg = <GPR_APM_MODULE_IID>;
>> +						#sound-dai-cells = <0>;
>> +						qcom,protection-domain = "avs/audio",
>> +									 "msm/adsp/audio_pd";
>> +
>> +						q6apmbedai: bedais {
>> +							compatible = "qcom,q6apm-lpass-dais";
>> +							#sound-dai-cells = <1>;
>> +						};
>> +
>> +						q6apmdai: dais {
>> +							compatible = "qcom,q6apm-dais";
>> +							iommus = <&apps_smmu 0x1721 0x0>;
>> +						};
>> +					};
>> +
>> +					q6prm: service@2 {
>> +						compatible = "qcom,q6prm";
>> +						reg = <GPR_PRM_MODULE_IID>;
>> +						qcom,protection-domain = "avs/audio",
>> +									 "msm/adsp/audio_pd";
>> +
>> +						q6prmcc: clock-controller {
>> +							compatible = "qcom,q6prm-lpass-clocks";
>> +							#clock-cells = <2>;
>> +						};
>> +					};
>> +				};
>>   			};
>>   		};
>>   
>> -- 
>> 2.34.1
>>


-- 
Thx and BRs,
Le Qi

