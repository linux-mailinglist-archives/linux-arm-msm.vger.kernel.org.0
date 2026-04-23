Return-Path: <linux-arm-msm+bounces-104222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCkrFPfY6WmglQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:31:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C202244E911
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6504630073E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B526F3DE43B;
	Thu, 23 Apr 2026 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYIOUhFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxvTIt8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6663F3612E7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776933078; cv=none; b=RGcbctQGLST9bHWqrxHBQkCqpyvbMN6ghX4kfFWJiz6lWta+x2U+IPamjxZ/JVfYk+EzaJqeyHNv4Ct6gJt2WmForMOnpB/XS9nJpys8TDbXQGc2byQMoX14Exg5f5BXvtpTMnzNwZQ4NX8XQZMV5StSuKm0h1oSLy7c/JbV82Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776933078; c=relaxed/simple;
	bh=lBmOK4eZJ8NrHjfkfe7zSAgJJi6DL6t5htHWOy+87hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vi96ChvPD6aDDtDjhoGkAAPD3o6NQcKX67RZL46mickrXw60Mo8KkOzsJhRQwtPjm6eZ1Lkw/BINpdfGlGFuY2KgKMqnp9pzs/SErTGvT6UvsV032K26ab5XIUDDo4nyemznJLjJnJbEmgBV7Mg/ffveCsCE9Ilyw8q7GPyxdrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYIOUhFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxvTIt8F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3AaeX2956039
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsaHclOtgL9XWUK5PCgmoPoDrTaZEdbkamKHFbrfq0I=; b=QYIOUhFZM2ysYAo6
	dYa2j17DRAzejDZKM9wsOg0ygHcwdJVX4G5LbXtQUkW9Jtpx4P9erqblKaCHUz4s
	xCSRSjCba5Lo8U+8ccE6/l/iXgPrrKgunbMaNllvmXenPU3rij6UbPB6kKsdGGYH
	w6VOuwKL3HjwAGEDzK9UBBXvl+d1yEffDgS2Fr2qkLHfPblpU9mAGdRdCiLR3gOW
	AGPX1RNidflFaJ9iHf7RZ/2e3zE8UjWLh6TvaELPHE3ZcpCJGV9KVEj+MX8BPh75
	O1gXbmUfCddsZLzDtFlnVLNYZbIuUYYZ80i8vE0rRqgHw3kneCeX48y3V2UCzlfe
	h75jVA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q30pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:31:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e425c261so7717745a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776933075; x=1777537875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wsaHclOtgL9XWUK5PCgmoPoDrTaZEdbkamKHFbrfq0I=;
        b=kxvTIt8FTUwlr41jwQxk9xdSscJhqInuFtcDDpsmex4w7SWpGri6KkEm7uO7W0dxZZ
         yGTJ1wAniAkHiesG3PY/X5XgzjmsL3QFFi+ffKFOYaxGCCpVFfcPLCkA/6edOE6FWRRb
         jDSDCI+CEWRQJDeJ/xNWzLr2yLCG7W4XjqLm5F5/CXzIduV/6UvVdOFXBqWal7l7eaeL
         cYycx6d07UKLq7nyCsip8dYfC3+65WaNCxUET+vFJWp/o9wobbhX4oJFAf7P+LGBmF5K
         SvhdfrCdz7CRFp8Hw9yg2JlqK92rDrAnNR9HSw9HbOk9l+PkGVw84brqFPIsb/FEKXh8
         7eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776933075; x=1777537875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsaHclOtgL9XWUK5PCgmoPoDrTaZEdbkamKHFbrfq0I=;
        b=Q04FlQnUkOcPTmKmJRwC7yYKn0hEbolk/3Vi+vyivXNh8wgf91pz7Xeh1u6p5B23Gt
         Rh5Q5owmnOnCGd3uJjRmiMw/jvM1gWHyIQLfg3dYTBhMl9Dbq2sUD5lHzz9JM0P86hCM
         CNqQEAQUzNjlcWG9DSU33M1SNriincHAKVhmmRBXnuUIXh1leMnGOgpEuQ+80KsO1Jgc
         a1gZC9HyI4Hbw79JV479WEbXDWW8RXbksCdaorljPsy5qcQvKp/51fpPNfFiNLz0G4x+
         K70oaYlYDNqJ5vZ4uxCBlpPYhQS8TLocgqnmUytvz03CPh8LP+KZtLxXL8TpCv4LuVMx
         ErIA==
X-Gm-Message-State: AOJu0Yywkx9yP7D8uujnNfZ/oDHbAMeh0auZgnxyrqMnIsCssb4oq/Be
	ITcozqG4IhyJUTY0iGlZWLnkOhQucoXf0WDbpOhy9/Nssnzpt2RAknQHquTcRxYMf6aSznx5A1e
	dkAZAeozIBSgJQkPuciWnxg2+6ldZkbII4Bq7WOGPjf++lxlWsjkAREsU4EZYd0dg7RnP
X-Gm-Gg: AeBDietMERnmqPxwM1nSiy4Mze4v8SVu5s6u7l5Ex7uMLxGeIa490P+rpwTO5ZHSFOC
	n3eRp8lq/NMpNEVs4lfAwBxgsbmvIMcHRzI5KA9y6pfkjLwK7qMFxZSu65kL1dzBNphrALSexfx
	zN2rGBj8XZy6llxIkMeH8oEJeVUcmFmj5nypbnuYci1kVuxa3ckBD0xHUQHMjCSvkwQWc4+meGI
	aIVl4pTBQxApEZWi/cEJF3iqHQnj+xb13sXBbhzkJRXLFxgDK3cVzwFuoDJs1RG6RUH9sXPVdgf
	btKgExTOZRebYDpE6eT2/NkyDzt/H/1wvn0OA/0lYhqpUvS8QjPoa5xlQBbTu6ejrs96kxqr6Cy
	t8lKMGa4u6qjI4BLLqWYzNJsWVFB50/oww0YGE9VSz0btdLAx0vxeQd9rQDU/
X-Received: by 2002:a17:90b:164a:b0:35b:96bb:47ba with SMTP id 98e67ed59e1d1-361404c0ca8mr25344740a91.26.1776933075332;
        Thu, 23 Apr 2026 01:31:15 -0700 (PDT)
X-Received: by 2002:a17:90b:164a:b0:35b:96bb:47ba with SMTP id 98e67ed59e1d1-361404c0ca8mr25344689a91.26.1776933074843;
        Thu, 23 Apr 2026 01:31:14 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fb7118esm9676930a91.4.2026.04.23.01.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 01:31:14 -0700 (PDT)
Message-ID: <3d0dc6fe-f8b0-4d7e-8be5-68e1c3f47b8e@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:01:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add memory-region for audio
 PD
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260419-talosaudio-v2-1-3a3b5dd67dd4@oss.qualcomm.com>
 <a50ad3be-a4d4-42d7-8680-0e7fdf01443f@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <a50ad3be-a4d4-42d7-8680-0e7fdf01443f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e9d8d4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SvBIBT611XFeX68nN2kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 4tmxhGgVhdlrWcVXbqdg56bl1TwwfFmK
X-Proofpoint-ORIG-GUID: 4tmxhGgVhdlrWcVXbqdg56bl1TwwfFmK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA4MiBTYWx0ZWRfXxWf3Jri/wTl2
 Ju9OgbjY/poD0Iwye2iqAUzU/RYTi1WbhBgRO4Yw8fYV7uJixwWtat4tF35lEg+GUiXOZETFFCD
 X85kXPg+oRSfaGyoEbDJmLx2WEK+GWLR2AtfyRnRwJLnDYn97eLjWGOc04Fzf7Y3BbSBb9EnLlR
 4ITqGO6hPfGwkO+eirslvBjKsvYFhYvr3VC6grXwSNJex/zW6pj0L5FB0MkxIOOmFtzpt24yGhK
 WPE2KGNFbVXNAWg19OqIpdyU/JSgCJhXgtWWAjoBFWEVIK5TP7mZEHtqcAWeD+JnCQBI8fm8e+p
 tmxerX/5zyyolDyHh/q3FC7Uic9R4ZF2Kr9pDZYCyKZn3aJ18iFlaUw9KBN82WhG0TNETZspZzS
 Pt8VeAms5AOKaN35BZe8Y0xt0JsbsVpZLr4PFXcQcdWVsq9iKqudMubZnji0hjSK/C5aFUNU58N
 d33Xp+dMTRMpcdbfnmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104222-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,5.211.11.8:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[5.211.3.56:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C202244E911
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22-04-2026 17:39, Konrad Dybcio wrote:
> On 4/19/26 9:41 AM, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Reserve memory region for audio PD dynamic loading and remote heap
>> requirements. Add the required VMID list for memory ownership
>> transfers.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Fixed VMID list alignment.
>> - Link to v1: https://lore.kernel.org/r/20260418-talosaudio-v1-1-585ab22faaf4@oss.qualcomm.com
>> ---
>>  arch/arm64/boot/dts/qcom/talos.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>> index ff5afbfce2a4..f71b327c7ddf 100644
>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>> @@ -11,6 +11,7 @@
>>  #include <dt-bindings/clock/qcom,qcs615-videocc.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>  #include <dt-bindings/dma/qcom-gpi.h>
>> +#include <dt-bindings/firmware/qcom,scm.h>
>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>>  #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>> @@ -657,6 +658,11 @@ pil_gpu_mem: pil-gpu@97715000 {
>>  			reg = <0x0 0x97715000 0x0 0x2000>;
>>  			no-map;
>>  		};
>> +
>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@97717000 {
>> +			reg = <0x0 0x97717000 0x0 0x800000>;
>> +			no-map;
>> +		};
> 
> Is this for the QLI-QCS615 memory map, or LA-SM6150? I think it's
> right for the latter, but I'm not super sure.
> 
> Plus, like we talked in another thread, I'm not sure this matters (dep
> on whether UEFI reserves it?)
Yes, there is not entry in memory maps, this needs to be moved to
dynamic address range, like it is shared for kodiak, I'll fix it in next
spin.

> 
> Konrad


