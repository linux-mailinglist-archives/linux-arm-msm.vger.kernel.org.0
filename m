Return-Path: <linux-arm-msm+bounces-116721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mkt1Lg+US2p3VwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:39:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CF970FFA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:39:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VXgoB+ta;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O35SX4C0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116721-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116721-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B568B317D182
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610FC42A14C;
	Mon,  6 Jul 2026 09:23:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE06A4252B1
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:23:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329830; cv=none; b=jO/rzyvP4/WCO2DJER/xFPQxje8b5/n02997jzlZvfRDI5FgAlG6Wxq8uKg4IMYYU5gJEaRahiFaQKbsM2tLHRsy1hbPWStJikT3j6QBZSe2A9VmOilJeZL10SbJlM6QeNhIp33gV5kVD5jBYz0GlTYtEnWflDRl72OwU0TF3YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329830; c=relaxed/simple;
	bh=ta/083cJNwexlguKfK+EHKUcfFJeFqmXCag4fL8jt3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aoMIlzkQfwEia5/4GzQhoXo8XZs9oaXrgf6Ojy/Kn+wfkSVIm5kzvLvqrjwP+6rWs69YdE3bcKrR6t5crqHo4xC8LcmvCYbxE1CltyCGlvQfkQjH7ISHjV6jtgR1JWH4dPoP6hygLceTfa3hXEjDnGSl+Iw3QaaJZ4cYC87xxGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXgoB+ta; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O35SX4C0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694XOJ136235
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OImVgVIwtgnBedVYuc3BUAu5DOrIIVBJ0jcP9WGFxOk=; b=VXgoB+takwi9VbkD
	byz17TrsHT9KgWvlwC4YpUw7dgBiB4tLCkfd8x/fLV6lD/5gfA1+fZh6muWnqfYR
	IiFf6p6DSvCkWLQ3b6tmn6hN+I6anXp5CjF3V9xiORX/0kOQOSvBDM+VLskrvsYs
	z4bhYDAmYsWBpuF64QOc/iG18qviEasZYch0uVPfM56fxz2OYeK+haxpJAwq+TAf
	nyD1ofYhmP5u7ft1LeMwgg8itO88qFRGt0COKG4g/jlmKfiCxPEed+jb123MiXEB
	aO8aWvCBxaw7PEWU49gtKIMdc3C4aaYWeuFNYjm4873XqDBMqJvy9Lj59z+sFzyp
	FhytUw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64nmyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:23:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38096521198so4249496a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783329824; x=1783934624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OImVgVIwtgnBedVYuc3BUAu5DOrIIVBJ0jcP9WGFxOk=;
        b=O35SX4C00KTDU/nZ6lVon2B47QVJaNYdtHZvlZnh28yKDe8i5YZol37vcDY1CqhXsk
         UZE9biG5RSJctlH/VwY0HXKZf/0LkZs40IAxYOTcMgmJCt8ayInuaqilcYbA0BkAfegZ
         tPrzXaErxsltuLNso2Lat0Ejre1KzYBkTaIWMdU01P5zh2svq332g2dAh2kEXq3dmTve
         z7P8wU8t8AqP/NYhZiwmPm62ohZauf0L6vAQFcLtWFiPFRzk0H+2+qvcxj4F6YKC9trM
         ikXP0q22rVO3aK0+KrBmMmGVbSoa46yov7oN0/1/4IGKWxALOElQTWia49UCOrnR09XN
         I77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329824; x=1783934624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OImVgVIwtgnBedVYuc3BUAu5DOrIIVBJ0jcP9WGFxOk=;
        b=EH7FFFHJMwG0B5VakCTqfcqdtLkqxWGkQd/YbCcwUtZ8hV+0ZyG1n/ckxlndu3Xtnn
         vPOsVMx2YHtt/qVGuRvZFhglAWG47O5t33X8aNHTJapT89ij3Z3gxTQyYrytxdPkGnVP
         lzDu0JULfTBmW8KgPePbNijOUUy+lqA8qgXGo51W9mOTRiG2MLU7TlHNfnI6SBn01R+G
         tYnDODyIWsX/lceZDt7SnlTrHTVmLFU+V70Wj4+lcVmeOxSklBR5KJ0b1kBOur456yH6
         tiJsbN1/taSoLQ+zJfOsHI8t7wrN+0OmILUc6G1w/fWtVWJntTqmjDALBJwWfkjBVeBS
         6xZQ==
X-Gm-Message-State: AOJu0YxXUQPIu6e/HJS2n+9yRZ6dYL5HuRULCgyKsDxHX5f1P/uOIOh5
	0U5PWNMMCGoY2srPTO301MM7frhbvpPM3iXxfsiHDYTq/MgeyAJU/htbxjcRMygWpCXzIKu6uh6
	+FuIhnRDGU8Zpr/AeKJV6qQZG7K2nDfEhKj4kgDLsBYR26Lfwe/Uy0c+OiX+xUX9BJxDk
X-Gm-Gg: AfdE7cnhINRn6Yj+Zz2/dX2Xq1suf60e5j7KQXgz0OGrxQGqA8ABO9RWywOoWyf50BB
	MxKDTNUVqLaWEy1CTqRNn9jRrgaMlbiyyMOWiR45xA3eWIWaLYHTo8W7kJ2l96UGE4iJ7NqPS0v
	WIXcfSgaKTl4rC4TmJSylCGtka6BaCMJVsSs3M7ilTb5Ocrf4uARqK2Jn9GDWMtsDAYEzkw1JMj
	7a1tww5JmGi6noDt6am7YsV5ziR7j18Br7BHdCY//Q4csi0gntwGk0asbPFSvetEwcqiGpE7ZNi
	evLwZn0qjcd29WSgQU3moIZz9lCstdsg97Ww3Ft90OASNqivO4CEFoOC7TkPsaiCJLveLLqmJ/g
	MAWAyqRM0dDc+Z/TT5ESJoMI6VTGqqVkKKPgNIlmt
X-Received: by 2002:a17:90b:17c1:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-3829ef0523emr9218789a91.16.1783329823657;
        Mon, 06 Jul 2026 02:23:43 -0700 (PDT)
X-Received: by 2002:a17:90b:17c1:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-3829ef0523emr9218741a91.16.1783329822937;
        Mon, 06 Jul 2026 02:23:42 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae1333sm4619853a91.4.2026.07.06.02.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:23:42 -0700 (PDT)
Message-ID: <93513477-d606-4881-b5f2-0e04e3a4146d@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:53:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add LPM stats support for
 subsystems
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-3-0aa0ec1fa83e@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-3-0aa0ec1fa83e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfX52lRio03cYF1
 /WRjM1C0Ry8bcmha/Kgpr+JgElfUiPlGUuBkmlDJxrusnOvNEU7HyPiLAA0Mk1PFN6Qn408bwSh
 V+JCST+sXZKCTxK6qMXRlYLQyDhE1oOHjzOk8va+Tzykq8ixzE2hh6r56ZWSWvXP84vkjKjoZil
 yTV260+tC+l6LxfBYVRpuj8xBM/9l4OMBwK8wzjxG+dgG+zz7wrmxw3CL+EyeweSGvBDrHe/EVk
 GUOja1r2YNyecagZzp0oFeSM/hka+D1onNy+g23QiFCsaphOdYprHFTJJ4MtppcPNj4dTZobx+D
 kdy0kRzoaPGWDDxxKfEk68FpGBMKQyRYts0vgNU4Kxd0sf6NEgcAAQeuaqHvtv9EslbigKb4Jex
 bU1sbikRNx4moODPmwJ/AZJ8xQ28SKmU/BE0PAHa8HmQlgVL420w8PWHTiB5ihBWg8tmze24MYD
 acv2ODJtnGaaJXk67hw==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b7420 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=AHioofpCCd08mFT-JmcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: dakXQk4ncs69EOw25IcWSJmzcjrV0CiR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfX58CIS0/agxbt
 848aYqLU3ofjky/m5I4qL3XmEG+fQU/kEFSKdWAVs1xMGau4vybVcjaTQ3XeTlZM4C65zBSXkhj
 Uf5ho3EkhSMxBzhXByeV8yh+bFmAMSc=
X-Proofpoint-GUID: dakXQk4ncs69EOw25IcWSJmzcjrV0CiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116721-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2CF970FFA7



On 7/3/2026 4:43 PM, Sneh Mankad wrote:
> Add support to display subsystem level LPM stats for shikra.

Instead of,
arm64: dts: qcom: shikra: Add LPM stats support for subsystems

Below better explains,

arm64: dts: qcom: shikra: Update rpm-stats compatible to SoC specific

Generic qcom,rpm-stats only reads SoC level low power modes like vmin and vlow.

Shikra SoC specific compatible allows reading individual subsystem level low power mode stats
along with SoC level low power modes. Change it.

> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..53f40283a3b70bccdc510716b39251d377be7d24 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
>  		};
>  
>  		sram@4690000 {
> -			compatible = "qcom,rpm-stats";
> +			compatible = "qcom,shikra-rpm-stats";
>  			reg = <0x0 0x04690000 0x0 0x14000>;
>  		};
>  
> 


