Return-Path: <linux-arm-msm+bounces-102148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG9/Iunp1GkjywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:26:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 886BE3ADAC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AE36B30131AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DA43AE180;
	Tue,  7 Apr 2026 11:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7sXjeCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OLVCvFRJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5833AD50E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561172; cv=none; b=VO3ts0xQt4LmavBQJk3MPoN7tNftZP/TApJdb1kUcN1GXB7GKw11KaiQhqWn35rCzhVfVnPriRvKYhx4Mlg+GtRoMvvsM4y+EWiYuyOrXZNR88Z33njgbzu5+bctGYB1DZBZTqr0Fu1Z/Vn7tGrzy+VGYr/xeSkab01I6RchpoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561172; c=relaxed/simple;
	bh=TREj4zSRns/I55iGHi5fR98mVeIf0b6KlGroZkFaPaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mj4wSlMMNuzOjMFqZsKHrItwAvVh6UATdGyWlCkwx0g+vOt/TRXYN0gnRCJ5KJ0vc/EK/PvQ9prN6r4z67m9qLfPUcQ2OD8IcGvKnyJxwenrRnRG14bXRNk7WvXwLhaIzPs4nWCFaEYIKCStteeVLDdALVXRHtjXsRY7PjpEViE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7sXjeCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OLVCvFRJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376tmUi4009044
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	REKQESoHGSr2uVq0msHkBfzv1Re/UPMULOTkZTykn2A=; b=f7sXjeCp3uRHccFH
	1+ZVj2Pr+ACXfk+4EEs/ZxzAq3EoEzgm2U8gHoFwYAt+QLKmWf5gqw6SxkkrdWXW
	nNpYT+/d3TV7a/Z+quUmYA37jXEXS625YmX78f6RkFYimUETYdGD7WmmyooGjLyI
	DIcTdym6Qn79i3mj60bLUXGLpsz5Rss+vLVI7ncaXVBeZuc3CX9wRdiNg5uIZHjw
	VhrFR4iUw2Rj8wLdAui+cZMedqM0+TppbZbLzFpTQHayNRFqhD8VH4WAT6zJZPoB
	zlHHhap1oadRbu6Ol0NBIj9C6vAHxh6IkXbk5Lqbk++xcZmwZHBVIhJ8zLcusNQs
	ApRJFg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrkte8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:26:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7691378914so2197093a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561168; x=1776165968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=REKQESoHGSr2uVq0msHkBfzv1Re/UPMULOTkZTykn2A=;
        b=OLVCvFRJ+dATNIjkRYFeAJLVXTd1Z29YpqugDLqkzxpFhMygjOODEIq1fHlrP7I1oM
         pNw6pujpY6QQQm7k568BLzckbS5/dRLcpV9vOok8su9x4zVGuZRqHeLVSs/ReQ32RMW4
         8hE90htVm+StkILjX2fzZWAXvwKZ6aPBKyREwlHauYVWr4fUtvJ9p8C1soSFyRMe1w7A
         hBrT2JczAfqK/2pDsg90dWtNNcCaBWEr+Z+IwJLivpqVLCgw3BBNnAYHMpDDH5qmqME5
         KG7LEenk3/m4A+rjEK2iADtwl9MUs2pzJY9F7B93nhzCH0kDaqGbhvU8OiwzX+u4z0Ll
         mycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561168; x=1776165968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REKQESoHGSr2uVq0msHkBfzv1Re/UPMULOTkZTykn2A=;
        b=qJEBqctlWyGviX7n0SkMRdJuzd0CC7k0+Y5FqBgJSsJCXBS1tvgibxkONXgSZclm5L
         5zvR7na9cjuOJejq1I/oPkj+RcYTUvD+i6LNe85ieuC0CHej1HgoNA4HShUTh1eFP/9/
         3gnaYWdDjaASk2EMjs3HUJQtDdRgoOXP1uYYbULV+INQE0JvUAY36te3h0jMBYWqLgys
         FXgI0GS6Mv4Ka68pwFlJ4J2rq0kzpFx134O2+jN/6w2OwDo5Eq7Mn29sWEnDlVMmwUQ7
         M7vOS0pNxJ7PTNKA31egwbzJmBArZ2hpNzTF3joeXR23ntDpxdBwqIvCcMsl6bcds0l0
         dYxQ==
X-Gm-Message-State: AOJu0Yw5XFbjqxOu7KP3jb6O/3CUN7YI0tXvNx5lUL1L+rCyIZnerAgx
	tdlDw0sGx/8HDmssmTodvrUGe7K7GEAbW4q6O7zWIM7nim76smjzPj5hAX0wri9b5nHRYGBER98
	hZZJYZkkPZZsgxjqXTaR3qOGjPRSqJ+cgAtGz2mACJ1dZwYVXN1Gs2J4+8HeCCDu6oGSoDlus8C
	Jn
X-Gm-Gg: AeBDieuf3eAik7nUB1DXyhte16S8WkHhKz4rn4+mnydDfVi25WxtczrBO9rJavyZNxE
	C7c1xs9zU2z9b1ZuR8GjEyHBkBcLg73asKljHXe72YUG/wuN1xIOIBS2su6/hxf6VJGIIr/7Z4u
	Dz8FlPkiuelaRBzBpX2nnIAO7f4/0cB84zK5ebdU2oinIflVdcOnzGw+pFo42zv8L852kZ4r9mD
	YuJaSc/aSy9+H6e/FQ4WPhBfLg2VoRsb0GD129UScOT7gtQTLB1xr6mX+hpdlAJ4IqcqhEosmB8
	+v4DDN2568qoLPBK/zNPM0rFaXzczmd91O7SjgO1NweDcdEWKLMs+qzYN4cVYB6lvfO2YRRHkrV
	oROwZfYAYw8MTMbJlF/Ar4nrvlQlfzpprbBjYf9Nxbd/1rXaJ+xV+
X-Received: by 2002:a05:6a20:6a26:b0:398:dde7:2dcd with SMTP id adf61e73a8af0-39f2ee61d62mr17989478637.21.1775561168386;
        Tue, 07 Apr 2026 04:26:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a26:b0:398:dde7:2dcd with SMTP id adf61e73a8af0-39f2ee61d62mr17989444637.21.1775561167862;
        Tue, 07 Apr 2026 04:26:07 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9cbdfsm22309861b3a.53.2026.04.07.04.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:26:07 -0700 (PDT)
Message-ID: <4cc079a6-0945-4314-982d-2dfe70226ab4@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 16:56:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Add iface clock for ice
 sdhc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
 <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
 <8ea92c00-56ca-47cd-95aa-dbf49ecf4118@oss.qualcomm.com>
 <a2e2df62-42f7-464d-8833-8eabc7d92ecb@oss.qualcomm.com>
 <a940926f-901d-4907-b029-e4c6fc62625f@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <a940926f-901d-4907-b029-e4c6fc62625f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4e9d1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=a3xcrG_bGF9vyDdvPo4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: cpoo9RysDfdnLboZERZeOG_8bz8ftGN1
X-Proofpoint-GUID: cpoo9RysDfdnLboZERZeOG_8bz8ftGN1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNyBTYWx0ZWRfXxi3MyUJ8mhrc
 jRbsLs13M5/5KVmlCtArm7XYQPlTn8tXDOGB6sMUVHdQP2HFboODMfwJ/COQtADn5fXuRhprufe
 0igLu7DwG/GUo4rXzqxKrofLiJYBccbY9LE4O/IsQ5cAhk8oeZpIlqIr0XT5yBB6cZumJel6cfA
 iaOcU/k9i+JXk+f94/PYdrltFg9DCBw+vBwN0ntSnsG8Co+uJ4JdIHW+XaNZpS4tYtDRfx2aTzk
 m3ZWxSzqpYgLuZ2QtvAVKCAAvaazgxnFw9fPBZXSfZQvpGII80JJDFkTu0C11Z0zNMzEO1AFftr
 6EF+KdahlaOE+lIxDI8qE8uZ43fPTPadlJeO5pRfhidAV7s4+EC7qW/f+hNobjEki7FSzM+qz6e
 j6DRhLzcuoamAcKKve3pfPDuzlrX66khx3VNL9k6ac80mAfsu37ONEnqB8CAY8TTUwvDggIx+H1
 kTTIDzJJ+WkLQOOpswQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[7c8000:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102148-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 886BE3ADAC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/2026 4:48 PM, Konrad Dybcio wrote:
> On 4/7/26 1:09 PM, Kuldeep Singh wrote:
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index dda4697a61b7..5e6b659e8719 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> @@ -1082,7 +1082,8 @@ sdhc_ice: crypto@7c8000 {
>>>>  			compatible = "qcom,sc7280-inline-crypto-engine",
>>>>  				     "qcom,inline-crypto-engine";
>>>>  			reg = <0x0 0x007c8000 0x0 0x18000>;
>>>> -			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
>>>> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>>>> +			clock-names = "core", "iface";
>>>
>>> nit: one a line would be preferred, please fix that up as you seemingly
>>> need a v2 anyway
>>
>> Hi Konrad, Didn't get your comment completely.
>>
>> Do I need to send v2 to just fix clock entries in 2 lines?
>> Or some other comment to address and send v2 for that?
>> I don't see any other comment on patchset to address.
> 
> I didn't see your reply to Dmitry's initial comment about the DT bindings
> requiring an update.

Here's my reply to Dmitry's comment.

https://lore.kernel.org/linux-arm-msm/f05ac643-1ec4-4700-aace-c1a9d0cd9e07@oss.qualcomm.com/

Bindings are updated with maxItems:2 in dependent patch series.

-- 
Regards
Kuldeep


