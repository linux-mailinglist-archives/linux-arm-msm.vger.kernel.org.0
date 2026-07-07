Return-Path: <linux-arm-msm+bounces-117082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fGToG15hTGowjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 04:15:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FCD716C2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 04:15:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pPt3COnI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="EOISY/f0";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117082-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117082-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 639B8302C913
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 02:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0481ABED9;
	Tue,  7 Jul 2026 02:15:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F68221546
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 02:15:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783390551; cv=none; b=CQWW1zHym3AyEJp98yp0gAA7IIOjLYL6ued+AI77icVt6vuGZt+RWcbdf1oLY90RQj1QRk56MBD/9O4PTG8kvlL/bs4chi59tPTkXQxg2kAsgsJzP9cs8DIr5gv52UK3aU0pt9GEbK+kj8uyBu+kHXCO2mfiKv15SfCYu3hVg04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783390551; c=relaxed/simple;
	bh=Bjn54ZUW34SNRnEwg2ElNY0d6raSsJDb2udOML5/kNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e/4gtFpiT4pOZv1yhZZr2I/haLbODr7efvB4S1JqTnoqGJAbKY9QuIf0fhFE2048PLciYQ1C7o3rCMt3qICF5COHfiB09XFnAUTrFhqhL8DyF7/bSgGwLv4O0HxhpQFijsUt3DMjQ6C0iqLAP8Gzx2FpQprK09lOLH9NTb4ORDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPt3COnI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOISY/f0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEL8Q1639953
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 02:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/S7rIucDxKPuRZHRHeHkcqkXwmrFQkHAWC9DJ06eh1Q=; b=pPt3COnIvSeysidr
	GoXJO16VwqTy0xAGVExenMUR4vaJ71Ccvm1rlYv3zlK2m7uGl07JyXqQNS3NOdkt
	b8RPd1QfBBN8r9LFd/7uH/ZhPkO6X6SlyIAAOaLNqHMZNEdJBbE7Kic7UOt7He/1
	nZ2ytVwvKBh6OCXrAVMxW4bzV7HUt4vUFtslGyGiaeeXqqg+Dt457edn67qjmR0X
	D4ntVRIfzKpqPjTKy2zr6KaUsLGoHdaAHPM34IGd8+N9/WcsvUkmyFl9j8zaOGuF
	yQ1B2u5ZNj7hk2jWm1b43kDuiSQorZqxhQ7WARkC1vDij4AeHXeA97HqRPLRHlNW
	my4GbQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r3nak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:15:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381e93bfcacso7886586a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 19:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783390548; x=1783995348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/S7rIucDxKPuRZHRHeHkcqkXwmrFQkHAWC9DJ06eh1Q=;
        b=EOISY/f0hUEf3ZHf4iEtDszJs17aW1/klDIpfx56107fq+xHGB7Kig/yhXxfMm/+tK
         bc/fwvcrsdhzMjZofGatWxhYN1GeMPbtkiB8+h4Kl0jRsaygopNKE3cbcvVEDjF/Njb8
         HIRbZeOITerTavu6Qm02Unc+HmIxnYCFfTDLD4abIxjawgNiC7bbRiLFwU4zliEn9/7q
         m++WtuQLYJJLf7UAQmdTYA/j2B8EzOujKImlF5tSSZuzAe9GqvseugLJSAcP3A8iqpaN
         ENqkeSaDOpUDNho5bAbpizJAMOxn0DFIyQqD3kQrY0WdcCTc0h0VZ0Kt08RnCwsOpMNv
         zqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783390548; x=1783995348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/S7rIucDxKPuRZHRHeHkcqkXwmrFQkHAWC9DJ06eh1Q=;
        b=FK7Z9XgzHeWJec6FbfCIhDlcriIe54Nd/G979SWXqmhz/WhvpnQavA/+GACuNqwFw7
         F3KCeE254rlhe2mwTyi0HbbW2u+0/pYw77O8ARtuAh9mNczxBCW9nwzCQwzUZMMW8w7V
         bTRhS790uRO1F+sKNJNuxzTLS1Vtgv+x2/ee/JppdjoMnRjTftlDRyJuPpM/yMmqtk65
         0dBstl0h2tvFj0wb7dJzpoep+D+cFIr0rSeSqiVGKE1B4NqrWC+BoaszabV9BxkNhgMV
         vYX6EOSDkIF3P6sM66uY1dbN4mJc0oLSIrnRn07LFqH0pZkWFraZostHHDPRl2O610bB
         DwrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRntspmylKTk7tFMlFfWfqpDC1pgoexpl7NK7bd2rYXaHDUFMqgh3HMxyLtY9mNp309b/zpZrOD4dwVTBE@vger.kernel.org
X-Gm-Message-State: AOJu0YyReTjIwjCDsEEofhCvexVzmhbVGhx2Vp4Chgl7tPOYRR8ub/Fh
	nphOT8gNXBefiDtZ3Ej0nnpMiZ8wEMJcY9/JJhKTU0p4oSqlV9o/KDM69kXoMdmdSNmd6eetB86
	hACSZVBJi7vBS8vXTKqJh9GCP0/1oaWwkEi27Dq+wQedSTOheTkIR9Y1n89dNKASFPcwd9sWThC
	W0
X-Gm-Gg: AfdE7cmur+yZh743EUrmev4IEABpkezvmFesdR26Xd1eGvZXuMjX71VXGH3fbkr+x1g
	htH83cL0EiozkCAG3WSZ1kQexO6gqQY1BtEZIDwN6r9C1Hj/7x3O+Qe9xp9EagnKh1FsecR65fp
	SMEL8kVFsKF9XSKIleEjgLeig5v4i1st3ygltT1tuEJq1t7NyjuVJmAvQvUCj8qT/vY4m1oLWuo
	4cQ7MIX8r75Kx3GPUgUkbtPcdMh1U0cnEJbKUbj/0JbiEILXiFNHIf6e91W6FsQPlLbKxYnEfnW
	hu7R/w4tnO01a4oOZNY5dnaqOInJLP9R00TtpDsiQ7A1sxUQeIxwQmDpJrEd24ay6I4waUsv4YM
	LsG3KEEVJRQ4VRWsif1ZkQSVWQwr7iD1l+w1oYKphbA==
X-Received: by 2002:a05:6a20:5491:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3c08ed1f10amr4146394637.23.1783390548044;
        Mon, 06 Jul 2026 19:15:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:5491:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3c08ed1f10amr4146347637.23.1783390547600;
        Mon, 06 Jul 2026 19:15:47 -0700 (PDT)
Received: from [192.168.50.84] ([76.176.60.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a92eccsm2175748eec.23.2026.07.06.19.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 19:15:47 -0700 (PDT)
Message-ID: <46af10c8-8400-4131-ac87-b3f17350bb65@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 19:15:15 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 3/5] arm64: dts: qcom: Add device tree for Nord
 SA8797P SoC
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
 <eb197cd7-c1cb-4edb-951c-dba08864ec74@quicinc.com>
Content-Language: en-US
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
In-Reply-To: <eb197cd7-c1cb-4edb-951c-dba08864ec74@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDAxOSBTYWx0ZWRfX9FFWcMTaQhhN
 Ldx3uaYQLAiSvz19rn8QGeMSoHeP7sZNWIWbSrgbX5CXD7I+r9ewHjwRfKssqNusb3V2GoivCAC
 dTQ6EoYkT7vo+VMlm31Yhf+M15vQT0h+dMPJ8ozskpGIjko3jaL/8SoVYrvzQXyF6mCXlsNWbFR
 GhqkvwI5DXAYbn6td+lyeYnvVPV5miAAi+94T9ZjwV5Ne7NKoHrH2fvPLva+H4isoMzntQ+T0cF
 se8RyYS37jWCjN7qAT1kLJ7sRApHaY7S6lsidCwTuaBn8+XtxFU4/aaG8wxTorABG1bl93Bz5wj
 qgro+w6KFO9uF4a0iSJS5Pyc9SG97m1FJXMABAf5zrJBE6c1R0EZ9bZgBTBODW4zVXo8E06HX/i
 dMhfP2oYIaUi/8z5olREcqClB7Llnw7ou6k74nVkzolvG0xRcNw1lX1JXsp+4FP1H07hp9gaMzP
 89Bx8QHPJtZejH94SkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDAxOSBTYWx0ZWRfXyxLOOpcOlvCm
 WGqqyzCQ/0TVfx8GoO4VTAzDJ+b4L64ABAP3NC67RteNjlzg3LajODzgTpJg/COXes/vVeouS3U
 BrjPSK51J83tdAH7qGvB1+0fLm9Q+fc=
X-Proofpoint-GUID: _hu-aB62cpcVhEuU8Qmzhh5IdAWxxYSf
X-Proofpoint-ORIG-GUID: _hu-aB62cpcVhEuU8Qmzhh5IdAWxxYSf
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c6155 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=0ISbvMpsx/t7i6H15JfNAA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=fFv3aZm-RBs7SO91p5wA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070019
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117082-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pavan.kondeti@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deepti.jaggi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepti.jaggi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8FCD716C2B



On 7/6/2026 6:57 AM, Pavan Kondeti wrote:
> On Tue, May 26, 2026 at 01:12:58PM +0800, Shawn Guo wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/scmi-common.dtsi b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
>> new file mode 100644
>> index 000000000000..0c7ffe9e415c
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
>> @@ -0,0 +1,1918 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +&firmware {
>> +	scmi0: scmi-0 {
>> +		compatible = "qcom,scmi-smc";
>> +		arm,smc-id = <0xc6008012>;
>> +		shmem = <&shmem0>;
>> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
>> +		interrupt-names = "a2p";
> 
> I believe this interrupt source is GearVM firmware via Gunyah's
> doorbell, correct? How do we know that scmi0 instance's interrupt 
> is GIC_SPI#963? Are these assumed to be constant/fixed through out
> the life time of this SoC?

Yes, this interrupt is a Gunyah Rx doorbell VIRQ for SCMI a2p completion
from GearVM to Linux. It is allocated by Gunyah RM from the platform's virtual
IRQ range and patched into the DTB by Linux bootloader at boot stage.
 
> 
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		arm,max-msg = <10>;
>> +		arm,max-msg-size = <256>;
>> +		arm,max-rx-timeout-ms = <3000>;
>> +
>> +		status = "disabled";
>> +
>> +		scmi0_pd: protocol@11 {
>> +			reg = <0x11>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		scmi0_dvfs: protocol@13 {
>> +			reg = <0x13>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		scmi0_rst: protocol@16 {
>> +			reg = <0x16>;
>> +			#reset-cells = <1>;
>> +		};
>> +	};
>> +

Thanks,
Deepti


