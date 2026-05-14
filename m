Return-Path: <linux-arm-msm+bounces-107601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIWKIILMBWocbgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:22:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AF354244E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1AEE301D205
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551ED3E0231;
	Thu, 14 May 2026 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPqA/9tZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBkK3FB3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA139A045
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764925; cv=none; b=Xr7f/IpMFauY+xgtqJgAhxBwpkQBfui62cCc4wTPjJgSnpn9Oumffs+JMYNHubG9XYWFcTk2iHUT5fAregfJ0E8xju2ZcLzVcB1Te4C53TYwVHwFR4puDhYvkTDdcKwCfpn+UcpzYqG/qxWR/B9aPDB89Uj7P2Y/AVoRmoKBSWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764925; c=relaxed/simple;
	bh=bNRPHmgQjciXF+FTQCi2BqEOotAq9dF0V3DH2FPFDDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6GWLB8367YPuZallEpK944ys22wQeJ28VhN/lQPGKnrzlIHE4OJvIgT/qB6AkIkMux/9wRMxvOZ6h3oYiwLN/gCV4TqkAhnqARg4TUKYX3qSGC1V9jpiCMkKfYWRd8A7zhrCswrBq4takCQgUbbcYxodPxvkQB0orH6SXFmGKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPqA/9tZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBkK3FB3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBerHn2239471
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7pvMXUwz6BD2dXWrjN9UdcJP372MyTgcXC7YJhQfJjU=; b=PPqA/9tZwW27lyDS
	V8zuUK628KB70pjrJoX43JD5788mlrTobvNMj/HoWU21eAMEKIngfg7MPzoSLVoZ
	I4q0KZq8T3bU3iErWhWIEYwvcF3TKiqSksdFZwoXn2CRtF7xCUx8sYjiiyEZRqcn
	ZTRHTwwtCJLRrUZ3W9Ioc8iWSeDTz8jwmugtFhSVIckuoizYWg6/zWwSYYCNTE9j
	onOrWxNdmdz0ZbqiwtAFZSYnsWiBgyZb10JbaOaee2gzKtvaNjqGYPPfy6h2Vxzt
	1AmCVH8CE6bZUxxg5XwfpGYPXgSlVMyTUA6TIpqi7i8x57Il8nexgidCaXfKE8Sv
	mqw1YQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bhw41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:21:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3662990c03fso5609967a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778764918; x=1779369718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7pvMXUwz6BD2dXWrjN9UdcJP372MyTgcXC7YJhQfJjU=;
        b=iBkK3FB3f9hota23aJqddXGr3QoncDhm4oqRgBsMRqoSve8YXqPU+Xkw9l9TxCxaUA
         T4BFG3djs/Mx4esO0fwcC81D8aO1sYVl0u6Pfx7ROltiQ2uQ7IdlUstW0h8v86DbW4Ex
         SPKqW311ODRVwj876wG54MsFFvHEItU320DjhK2HRS/tl7DcMeevKtTWlEtuwDuuR9RP
         x1CUFet01XY1gsBxLQ2Q1ajt0eYcpaCyS343OTPr8Y893GORD/WXk36p6SKQAefsq2pL
         gNyKUHH21rpq2GGfdKC8w+xPsxyjtWW7bhw3ZI9mfhdRX7t5QHOh5qs70hQIpHxrxuvN
         ocDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764918; x=1779369718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7pvMXUwz6BD2dXWrjN9UdcJP372MyTgcXC7YJhQfJjU=;
        b=H4zjPUpOZAqUMcrALS88MKx8NkN46oTta+WGfH/uWVYtDT7l8dSQ5mPNm/NEPmrvTx
         i7zyteaGsvtDjzcMFtJPgfkDm50V5/kOIlxWCIblhqrguyU4vDd4gpWp+9BECp8VAbvE
         7AgXy4qU04RlLVSNADuTL3zdzB+8NJEKCJ6ZAOWRHcx6DciM0XSdFLsu+zkOM+50t5Vh
         uOByfSXL86vT6S+G0nIt3xIl/JhBoj4qIb0+dpChRs/dGMuCZr0c7KOBqEvZ7FAvU1Cd
         rbLWe/N+hzHbAcNHrmz4D8qUZhRWcbKppuHN7+oeepCrtXLePhunuAYx7Zd3QkFR8w2m
         NM+w==
X-Forwarded-Encrypted: i=1; AFNElJ91lkA+F1pK17+gbR08ji1A0iaWuqZ71DMoOuBWT8LOZJyJqFfkZPzjwQafdmBuRHRNJAGD93Iqovjy7Jmy@vger.kernel.org
X-Gm-Message-State: AOJu0YxL0QensMCWGLRChOTIFH0V80ZaqwnWIgbfhnOiLzEFpMGTbeIs
	LlhyhBZ4JT1TpmoQfToxx4r3VnkCKPGjGiYpoJBKROSLTtU5T1dsy+24szxFnQVvoKMlwDbsCs4
	KyrBnFRFBjUksTPkOSzF7csrj3s7GpWC8A9Ci1j9fcJ0GkOvhovLsorveYSbHaqmzwe3a
X-Gm-Gg: Acq92OE0MncHLxGGgAk8J5DpH8J4P4xbZJuG1w9AM4qMULd8Libm/XtHeX5oxTK0MUk
	dmeDIpiYWP+SMAg8Du7J79Mcv/ObKyhspYIrCjPErXkLH31DmBnCFavsNN+RLCKMZid+9UxTfgL
	bJg/qHaZDDSiNcKFt5zzxybCh7y4bkrn9v9kKRbzs57zw8M/Aj2pXBJJvHpHgVgxXXViNmtxiYF
	olWNt0zcqOaCYxcaWrKnJNVm4zRnpmPY3YucHTEhNn8w8wB865H/NJrBgnhqHWAo0e80scb6Q6Z
	u5vpBWYjZXvYanFUUUUqBoFuu7MIQZMoB/GmTSvpAvKRdyBREtIYONGFylgGCLhu4pB5Ytp5Ugp
	L46GQizcOcf/lnwWliWS6buVrFmXOG6EYvqp89B05bQPm+kt8UwuJCVcs40iXeG3RugDyXO5usN
	OtewODtk0EzGsWC780h74IdFYydCpNYLDqVdFVzYh8
X-Received: by 2002:a17:90a:82:b0:369:3c3d:f899 with SMTP id 98e67ed59e1d1-3693c3e0547mr1013197a91.2.1778764918391;
        Thu, 14 May 2026 06:21:58 -0700 (PDT)
X-Received: by 2002:a17:90a:82:b0:369:3c3d:f899 with SMTP id 98e67ed59e1d1-3693c3e0547mr1013178a91.2.1778764917844;
        Thu, 14 May 2026 06:21:57 -0700 (PDT)
Received: from [10.190.200.212] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692a94205asm975092a91.7.2026.05.14.06.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 06:21:57 -0700 (PDT)
Message-ID: <0867695e-d1f2-46ff-80d7-564b7d646e93@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:51:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add psci reboot-mode edl
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260505-glymur_reboot_mode-v1-1-59fe3e9a6868@oss.qualcomm.com>
 <af_49utiHCPDlbEd@baldur>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <af_49utiHCPDlbEd@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: h9Bx79lLSss3bx3Z-smpYEF9FpMpcOJh
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a05cc77 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NZaXKhJlTt4XDMuIunoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzNCBTYWx0ZWRfX+aU4RcE0n0Y6
 /J776+wYUV8bpdVJKK9FOLPNQHTxdCeHRVLk9Wh41qL0MWV6YKA6neZaf4/8tvK3jQf1WJIGZAG
 Hg1rld3JywHKeJiG9M7eZI3hH+PyPeYozW/5hypR3CoEIjVwIemL986Ll2SWfzNMx/Sbh/eb7tN
 MyFglbyI+jLsj6TpQStBrQ1qDIno5I0mM0HL/+S34sF8M6KEk6Q08P6bNOGXJBW3yeW00caf7Ig
 wqB3swjk/BCi10WI75IURdS/2e3YGemnuPmMXM6ZPDdSqZc/i7cXF3KGKCnnKzefUMS+7aniTQo
 zOZCxGVY/Fx5yE0Ma2IHw3FwcwlcK2Wa4778PBcPv11aXN9rvfyakywu/YARUrlP4QRz0I6FRBF
 oaINDuTcikvnUsGej/oQO8zAIqnB+y58OkAqFA8JZun8/cphbKg/7QqXwRCR31bkeQIlG8KZB4L
 eRSi16mRd1/hO1zsrug==
X-Proofpoint-GUID: h9Bx79lLSss3bx3Z-smpYEF9FpMpcOJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140134
X-Rspamd-Queue-Id: 12AF354244E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107601-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/10/2026 8:58 AM, Bjorn Andersson wrote:
> On Tue, May 05, 2026 at 07:07:27PM +0530, Pankaj Patil wrote:
>> Add PSCI SYSTEM_RESET2 reboot-modes for glymur to be invoked by the psci
> 
> "Glymur"
> 
>> reboot-mode driver.
> 
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> states that you should start your commit message by describing the
> "problem" your patch is addressing. This commit message fully assumes
> that the reader already knows everything about this topic and why this
> should be added.
> 
>>
>> The following modes are defined:
>> - edl: reboot into emergency download mode for image loading via
>> the Firehose protocol.
> 
> I presume that would be the Sahara protocol, but you don't need to be
> specific about how that implementation works. It's sufficient to say
> that "edl" reboots the device into "emergency download mode (EDL)".
> 
Sure,
Will update
>>
>> Support for these modes is dependent on the psci firmware
> 
> What are the implications of that?
> 

Without the firmware support, device will reboot instead of switching to edl mode

>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 6 ++++++
>>  arch/arm64/boot/dts/qcom/glymur.dtsi     | 2 +-
>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> index 2852d257ac8c..397519e95ca1 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> @@ -560,6 +560,12 @@ &pon_resin {
>>  	status = "okay";
>>  };
>>  
>> +&psci {
>> +	reboot-mode {
>> +		mode-edl = <0x80000000 0x1>;
> 
> Does the statement about "psci firmware" somehow relate to the fact that
> this is defined in the crd.dtsi?
>

Will add in the soc dtsi

>> +	};
>> +};
>> +
>>  &tlmm {
>>  	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
>>  			       <10 2>, /* OOB UART */
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77..7f426efe40ab 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -382,7 +382,7 @@ pmu {
>>  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>>  	};
>>  
>> -	psci {
>> +	psci: psci {
>>  		compatible = "arm,psci-1.0";
>>  		method = "smc";
>>  
>>
>> ---
>> base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
>> change-id: 20260407-glymur_reboot_mode-4441770e6a8a
>> prerequisite-message-id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
> 
> As far as I can tell from the discussion, that's not settled yet.
> Not sure what you want me to do with this patch then...
> 
> Regards,
> Bjorn

Shivendra will be picking up this patch in next revision of psci reset series,
I should've sent as RFC

> 
>> prerequisite-patch-id: 70829f19896a982ef4ac19fa82bf571b9eb6defa
>> prerequisite-patch-id: 600337ba5717c51204c4f426acb28bd6287e56ec
>> prerequisite-patch-id: e7a6e85c94e35b71c9813c322e811a270233c854
>> prerequisite-patch-id: 7bb3e4b151f32129e8ce5d3c1015150cbd741d13
>> prerequisite-patch-id: a61561c5070b9485399a840ff48252842393f01a
>> prerequisite-patch-id: c7f5c86cf5f88c6d5dd576565bcce25ee3848b19
>> prerequisite-patch-id: e4d851cd0a6dfb96d62e4c9d3ebfa1422b9571a6
>> prerequisite-patch-id: e6ffbbec586e6c4b508bd366615e33928a910190
>> prerequisite-patch-id: 8ae267aee51f48992d2232f18dc5795b08fd8e54
>> prerequisite-patch-id: 10b585e49a96767c3324c9e3c623a4716a641fda
>> prerequisite-patch-id: 5abbfae8b6577899e0423b36b4690adf1046cac2
>> prerequisite-patch-id: edb89ac23b7a3d5ade9b9cc1e1a77ee4d1a663cf
>> prerequisite-patch-id: 555f1b64be3631d6286f2f1e140dc38c6935d646
>>
>> Best regards,
>> -- 
>> Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>


