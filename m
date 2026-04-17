Return-Path: <linux-arm-msm+bounces-103549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM+NAs1R4mnx4QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 17:29:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B86EE41C9BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 17:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF36D3041ED1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A357B3264D0;
	Fri, 17 Apr 2026 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oi6Te+Y4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HydNxlpw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6293264C1
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439734; cv=none; b=tfW9fXoiECKGe5wFF05+xKgZiUpfFSQRph785GZHWCeVNzWyoC6mkklbUx+L6K1ORWpk9h8fl2ackQJ+/an0G8RGG6U003ZIA+MqDDWqu514p5UD0WWghKnxZGQ77G52FXd+RIoc6OFPcfu/fOB71bblOda3uXpBGlAjwU2QvtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439734; c=relaxed/simple;
	bh=i77yRE8WUhFEs7+CBpzlx+r5MC6ikp723zTT7FvNvsY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=o1FePCwCUG8/JlKsXNkVE3KCreHO/Pduq5pvfP8skRYgIw38DRRQZG+U5WEBVEc3eFNoXI2/nJd0MwXhAkytSRYfryqyJicGjD7QsMwniSH4SXwoOLgrr4HgWupae6XTJQKHcupTLHHRQ75sRT+MbnnNUDs50A2y+jeE52grtb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oi6Te+Y4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HydNxlpw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HABc4x1323334
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YaQtfdZufww/K73QQEA/A0d3XIh2ynwFA8tiiBqAF4Y=; b=Oi6Te+Y4gE+h0ub7
	y6aiT0wkH1YE3pSd7X7Ii27zAY28xopCKQ2iKgZRr2E6SRo8QkUVJ/+Ni5SRfIDX
	yU031UGE+uu+vU0DOnu/Q/N19ULH3dh7Opl0eGDK3cPr5Sn3vIIF8mla8L/BXsw/
	CPfJScm8mdfCWW4woWqKudKGRSeH66BjgSb2hEtGZvcEtMECVaTATqhnKtEgP1U9
	Qk/SjyAFQKKRNoXCb7zvwC8cT+aaQOV6Ly4SbRFObHEhfjIrw57aR+zqaF90BkAH
	AGqwmKriE3TxwqSy1Dh07XRxg1br9hsrYGqP0MTssygjLus7onGHP5mjHSOxPhxX
	0AEFaA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkdgy2akj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:28:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da8eb0553so943979a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776439731; x=1777044531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YaQtfdZufww/K73QQEA/A0d3XIh2ynwFA8tiiBqAF4Y=;
        b=HydNxlpwja+/pvZkZEbdMf/EwdroItGwZocSFOT74slwHFAznCuDZkwUUTFz2xvLii
         M4+3wLeTQ+yjPZZbP4/gba6wAsg1B2uGVC169a42TaRWAmJxt0ZPjPMMO13efbkSE6Mr
         Nq1UrCh1jSUEzmNTeNXaMd6gDOu2BqVmiBmlSmFFponlssszsNIez0fxAsmiq3wNU98M
         AJxPsyvElSQJ4p0Iouaf1scNMt1GjCY0FHl7SO2yGbzraeERBY/3q22AW9NPdt2FWGbf
         2kO+9WonmdkNlHVks+u6roGOvKAiv65kbyo8r3Z/NHL68cMoLXZox0fYX/H6kSyfeLav
         3jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439731; x=1777044531;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YaQtfdZufww/K73QQEA/A0d3XIh2ynwFA8tiiBqAF4Y=;
        b=cNF+tVaL0OGmwFD2/+uvXIpEUaLafsCkyVCtRQFAGhqNwTlJQgM6XrKcxkRCKJ1kXz
         gYbS+1fuSBYahaGeONVAmOo5hQ0PLPMmuwb/bLbOPUNo80P5XqDFnlMH+jeR3EstWZ3i
         k0LtFpgJ4cffx19kvrgADWDw+RuDOfHQGzRxz1Bzc+Ul7zI7HKpAv4dW2yaTTk0hR90T
         sQ+l7AZLaOKVYSKacMBF6uYxHEB4flcS9F0lPVeeUPAZpY+f7EwCDCDfuhAMAPa/0OWS
         4Rm9a5XNrmHBqeRHmIyRAgp7lk/f+b/IHVqu5W1xxNXpRWcSW9RrjrhRx6tNQ8dz4Wha
         VXBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NqPQr17KMdH9DcsAW9sy7KHOtu4VUQinQ3najbBT47kyeqN3yLb4nVGHX7eoyHwZ9ua08GAXV5PgAX1Mo@vger.kernel.org
X-Gm-Message-State: AOJu0YxU5O4xXHouuU+BVrHKd4ta3JVm4lw/TnNTTcnz633fQMHKqi4n
	snG5/yLRE4qPspCdroapXwlhEb313smyfHgp/8FGjxtcsIGwUJxBM510dyPXSl7YresyzLecDFA
	U5lZfnhGJDYcUhpd72DtWk8ngcntc2Opzhm8Fv+SKI+4u4l2W9h+hQXpDyTTqWFGwuWKz
X-Gm-Gg: AeBDieuWNDFJAUA464upVicFQDwih8pSTx6i2wEBE4WiL32ZLb9vMCcvT9/zL+kyP9+
	acCiHAwA4AgFIrZP+AhHKxAUNxPPezUogluKB9FacHX70aCUSTWPlqbQijvQ8sKSP+ctq+zTFnb
	VkMZSIxeL+vcpPdUQzIat+6qUN72ndGHgtSOi2TfI1pkifqslOfZMgEHy3XMgb66kZrnFFbBdsU
	oSJvZTBgdCJxEBOPJxx1B27rTwbLC43pHYZm0d1Dzx4+/Yf+A0E+qSRRcNvVCJ37i4XoTPViLo9
	Kd51TNA6a8KaGKCH/pEXO+rIcXfd9N1+Fmg7j/ZOZtJ4zX5Qiadsllw24+7AUDppzDwp2upiTHP
	AFQ4AKVAqL7GRXN2zcOgP4bYkIRDZQjtLCkN9s6wD+QJ6glq8KpDqi/yTft7Jk05i
X-Received: by 2002:a17:90b:3d02:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-361401ec4b4mr2683464a91.5.1776439730735;
        Fri, 17 Apr 2026 08:28:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3d02:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-361401ec4b4mr2683418a91.5.1776439730131;
        Fri, 17 Apr 2026 08:28:50 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a9fbsm3284378a91.11.2026.04.17.08.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:28:49 -0700 (PDT)
Message-ID: <7cd1a0ff-53be-7eb7-7de7-420dd1ae7cf4@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:58:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 06/11] media: iris: Fix VM count passed to firmware
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
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
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        stable@vger.kernel.org
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
 <20260414063325.f3yag6gnmaysddkp@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260414063325.f3yag6gnmaysddkp@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Vou7LampZsDrBlKyMjgnjJ7_ttlPfqFR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1NSBTYWx0ZWRfX7Zdh6z0z4BP8
 dpbHkvmSwJt6w0QAnCCzwQvHGc1LtW4fUoL7TrY3dRmW9kuO0JZtsmC9BpLgO8KDwRUrM3/1bQ4
 nPET2tGqX7lMe7Y7Wo/LPo1lO7Szb+LUVAtxfBMCLVGDnpOBcepVDohDcX5NhqLo9PvQ1kiZrtE
 NsqMqByhLw3pnyaz33adTgHKrUp4bQPCFymUUIIcybRZbt6k9uRnVER5Z7FEpv/NU1CYeX3ns7E
 F+NRRWF3cXVl57NU00S++gKz8MLcKUgISr31/OTOo72XV1hUA3Yg00/UW2ee301pjRW9dEuvPlW
 B4N6h8xPBBDGzydGkR4XqNGXH4d6odYt/vle1qjEOj37qzMWQl4Z3vG+PaYVnyBRk6o2rjWTnl6
 gW4T4YiWDFe4+YhHgO+bDrSQIIGTvWLTIt3J/4Dgbpq6MbTzSMcNuMcBKPu1E8sBMMErXYI0ft9
 NQTa6sb8U8OrjN2818w==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69e251b3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Xy_6AgtP5T3jK3p2aAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Vou7LampZsDrBlKyMjgnjJ7_ttlPfqFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170155
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103549-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B86EE41C9BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 12:03 PM, Mukesh Ojha wrote:
> On Tue, Apr 14, 2026 at 10:30:02AM +0530, Vishnu Reddy wrote:
>> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
>> the number of virtual machines (VMs) and internally adds 1 to it. Writing
>> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
>> remove this write to leave the register at its reset value of 0. This does
>> not affect other platforms as only Glymur firmware uses this register,
>> earlier platform firmwares ignore it.
>>
>> Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
>> Cc:stable@vger.kernel.org
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> If this is a fix, should be the first patch in the series., so that it
> can be applied independently.

Ack, I'll move it accordingly.

>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index 548e5f1727fd..bfd1e762c38e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>>   	iris_vpu_setup_ucregion_memory_map(core);
>>   
>>   	writel(ctrl_init, core->reg_base + CTRL_INIT);
>> -	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
>>   
>>   	while (!ctrl_status && count < max_tries) {
>>   		ctrl_status = readl(core->reg_base + CTRL_STATUS);
>>
>> -- 
>> 2.34.1
>>

