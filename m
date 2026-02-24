Return-Path: <linux-arm-msm+bounces-93991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPTEC4+jnWlrQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:11:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A2E1876AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADA64307EFC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065C239B4BB;
	Tue, 24 Feb 2026 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTeYAujU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeluuhqY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A3B39A7EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771938692; cv=none; b=Qa2voGidd7f+gSuNrlGZxoeJ+JO+uKDZVFzuy9OAHfNKFAkm9ghl8UKxkfDB3vSWotucM22+aRAkAhtJVSf7HtT6ij8dDOC5/E95ECOCIpfbb0yQBUGicDZwqJWftmMnUbGRrx3ODyeeE0s8PPetOHKOVNPrxtIIduqv7YJhgwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771938692; c=relaxed/simple;
	bh=5/v5Xp78XnewIM51iXNvJnQY0vBU+NQ9r5u59KIbwKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IQ3QXbdL2DeTG85DjcLosf0f8L/sOfXjD/ZYx+PvoJJD2HR0cW6Uv7wj9IcsJT4r2oUGDbhO3OEPcXsmzw7O4iwaVJOofJUkRDPgSyrYuJ734Mvoik8B/rG+B77iGMpyv7kZvPY+LFfDQp9owRjXwIAh7s1o3+DoEdp0umgYVag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTeYAujU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeluuhqY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFf3G3324928
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cjngXEdqfIAyu7nqU+xeCnLIq5BCNNcDHXVaNjueOZo=; b=MTeYAujUxQ4haPgP
	XQwz+8Zo8XoseQZ402orR3ErbgrCkTl5z+LQKYUVnoU01/1KL9dYyMWi5U/SWZ5w
	HbVQWgkc9B6oQybe+VXaciBZK1x2ZkZ9lhygEPyxaly22uFcIfaiQW+VRlKycf+j
	ZoIl+8gVs1+DVBXPiO8Re0XHX//iC1BASgWJA2elvfNi3UCPAN5rnJW4Z4RD4W9j
	QoxUUc0GKvzBlsTY1skxuFRMnb6HYswRBr+UwMlDxnju+nh3/6g+AumSiP6E2guX
	h/cSakjURdwin6LV/mw53hrZcTPSy2I7yv7O4oqBhIa4RMObLOzbAw2mWnEeUtPR
	bC9qgQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y49nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:11:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so7519757385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771938689; x=1772543489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cjngXEdqfIAyu7nqU+xeCnLIq5BCNNcDHXVaNjueOZo=;
        b=aeluuhqY1fqZiAtDj309m5PKm90D3LRnbzUqZ5hd5+D+8ity9PWei7suG/pcPColil
         Il79ePxHTPMG3RaqQaGqGMQI6lctr1FeTDe/WZDMwkJJSSrwwogI4okDVQZW2zq6dvuV
         NacKngCBStH3I+j4e7hbo/QWfynaLOHaJygei8ghfyaA+7Yke56KK0tg1IBBrwDAuyVj
         p/hQxzrc0zlwzo/9JpodBBU0rc5NiRgEOxfwXiIzHtEV9ygzEoGAV5puExkPWuXJWPJx
         tL+rm9WMe8xI+qJURJlgYhIUbmKos6Tb30rBF016D4CzKrpImfyoA5JpH+mrFsaYKqyX
         afVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771938689; x=1772543489;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjngXEdqfIAyu7nqU+xeCnLIq5BCNNcDHXVaNjueOZo=;
        b=tEvsIJYk2D604lkaJVuoUVY8jn/mU3AtUgVRjnihrCeWE9XWjlhmt4mACyoMvEAT+U
         594jijrt1itgIPwc4QKc62T2ohts0ZYMp34C5sxI3zrsYsXq0+BrDR610y3aykC+RlxS
         1dunPOGx08iqeBvuurCY5ps/M9KCIONEHmk9eB5X8GFqcGlG2eZ+T3fd1DJXGcsxlhtr
         iWWdKecOGOtJpuvLEaBAibMNeARJ8BkBeHO6GMzlw/CG0vphJpevRyQJBI5QY3SutOxn
         7Sb175KPvmke7T4ewYqTVpx5+cm1AKP6Bp5EnFohePLhxJHDpjH6XoozoxwNoKWPkaEG
         qdkA==
X-Gm-Message-State: AOJu0YzDpCdw0vgEcyXhMyxtK6gLI/chi4gEmmBZKn+ALiAqXjG/8n+r
	aYYl4B2brq7fJi5B81PMRtHzcB0jB7K4LoA/OeVwd+brU0pcmmsmDHtS5HQgBjfOVRzQTmkK8XH
	HilsSspdE2G76OIR0efJQB3z4z3XddiDwOMQhuwW9NA0+BYfg7JrHlrxVVSgvXpMgON0g
X-Gm-Gg: AZuq6aJw1+QJG0DBnnB9fON1jU0lmuIlr3ur24YNZXnaH1/gFi07AhKRvODeU/Xy9pH
	SkjIRf5iKP3q1+EgcRz3NiMzUdcFJv7nO2QNd6YzKW3aVK5h+KR1SPLfASWx3bg/j8R1ivWyACg
	Hgd2ZBQkJ9OfH77fv8TeltROScWfUADP+lv+hoLxLLdfyCG54QsXdUvmUfuOwNIURy52XkeJHuZ
	sidR4syLLG+Oc4WAQ/FC3sgSOF+kkkWeTloWs53o0R9L6vDw+LVnkAdBk/C5eAHcvFTKLJSFYbJ
	SeyO4HUWNyny2inOg6glq0VFa5IOBdC3R16vNtINvyRm/itLNPasVeO3/UfExNxrMWSm0Z/tfTB
	oy7h4nqQoiprUp1+NDhtWy80vJh3IPUZEs2VxIFDC11MlQ+c9Qg==
X-Received: by 2002:a05:620a:2981:b0:8ca:2baa:6656 with SMTP id af79cd13be357-8cb8ca7facemr1563597285a.55.1771938688605;
        Tue, 24 Feb 2026 05:11:28 -0800 (PST)
X-Received: by 2002:a05:620a:2981:b0:8ca:2baa:6656 with SMTP id af79cd13be357-8cb8ca7facemr1563593685a.55.1771938688166;
        Tue, 24 Feb 2026 05:11:28 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b8791a0esm64078285e9.0.2026.02.24.05.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 05:11:27 -0800 (PST)
Message-ID: <2b397563-ebfa-41f5-b473-6f99f1cbba36@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 14:11:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Introduce Eliza Soc base dtsi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260224-eliza-base-dt-v1-0-54e8e3a5fe43@oss.qualcomm.com>
 <20260224-eliza-base-dt-v1-2-54e8e3a5fe43@oss.qualcomm.com>
 <521fcb9d-6538-430a-910e-0e4e9df2c693@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <521fcb9d-6538-430a-910e-0e4e9df2c693@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwNyBTYWx0ZWRfX3MQOWQtN01vB
 ZBO1igKbmSzWYv7LvOT0Em3ngP5tXjBtvs6I01pNeTGD2J73mfmsBSfUNAUFxQ5K9Zil+11P4Dt
 5NTvX8Sn/yhI0c10nsL0XLpuejU0uLd80UdyARr7ykXogR2x+S4tLdpS0CuyXBeALdS3q63MkDR
 eZoV/QUTtQr7aB099jbjheCejZCnoSQo0ad9E71mFcS6ciK46SbCSOBrxJo/FwdPEpWEkAwd2VZ
 URiTy8LZ5TgJ3xAjGAh1oeyIwcdq6Fzot3oztKW2EXhFiqWRfjrhBavITy8dkM3jYVOIEPtgd87
 6Ghsey4WbsuvVeVMoc2F9gRaALVRUQJ7HzPMsem+CT0vy9uXdvtFpNPsOUrwzfdAPDh1OmjltQz
 v+J9tfn6kkJ3r42gwKSUFIpFzYTbOagFBEhRoCP0Sg5xNqGO9wT0wUCUCSC6Q9aw8Adfz79Oxez
 PpAR2GeVGlrvtaq8+lA==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699da381 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kxLv_fV6qISX6Qd6vYcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JtupKT9AyulSmkY6Dt7vfVHBQozi2y7j
X-Proofpoint-ORIG-GUID: JtupKT9AyulSmkY6Dt7vfVHBQozi2y7j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93991-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7A2E1876AE
X-Rspamd-Action: no action

On 24/02/2026 14:06, Konrad Dybcio wrote:
> On 2/24/26 1:13 PM, Abel Vesa wrote:
>> Introduce the initial support for the Qualcomm Eliza SoC.
>> It is a high-tier SoC designed for mobile platforms.
>>
>> The initial submission enables support for:
>> - CPU nodes with cpufreq and cpuidle support
>> - Global Clock Controller (GCC)
>> - Resource State Coordinator (RSC) with clock controller & genpd provider
>> - Interrupt controller
>> - Power Domain Controller (PDC)
>> - Vendor specific SMMU
>> - SPMI bus arbiter
>> - Top Control and Status Register (TCSR)
>> - Top Level Mode Multiplexer (TLMM)
>> - Debug UART
>> - Reserved memory nodes
>> - Interconnect providers
>> - System timer
>> - UFS
>>
>> Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		cpu-map {
>> +			cluster0 {
>> +				core0 {
>> +					cpu = <&cpu0>;
> 
> The values of the MPIDR register (also present in 'reg' of CPU nodes)
> suggest all these CPUs form a single logical cluster
> 
> [...]
> 
>> +		l3: l3-cache {
>> +			compatible = "cache";
>> +			cache-level = <3>;
>> +			cache-unified;
>> +		};
> 
> So far this has been defined as a child of one of the L2 caches, any
> reason for a change?

Look at Monaco and Talos, so you already have exceptions/differences.

The point is that it does not make much sense to be the child of l2.
It's not a child of L2 in the hardware. There is no parent-child
relationship there. You should rather bring argument why claiming L3
cache is a child of L2 because it is rather odd design...

Best regards,
Krzysztof

