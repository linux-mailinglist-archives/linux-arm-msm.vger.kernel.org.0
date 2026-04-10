Return-Path: <linux-arm-msm+bounces-102615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCSFFL632GnnhAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:41:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE58A3D4404
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E5DD30059AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1C6351C09;
	Fri, 10 Apr 2026 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtD4IXMD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqjpbgRz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC9932FA18
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810492; cv=none; b=QMXBXFsmyTpdcNMrBxxh+i2QevX3sSvnZgFcEZyqahP7uSAV3KfzGPHCjCfw+YpilErJCrWq+svfZLlGtHxB0DAcrOv0W9eEYG8VyYvxhzAEHI8/wFXzBZ1vFXuxSwhGY4L3Q+Jrue1qmTMYfmMDod3gnAumu40IBldLox8/hmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810492; c=relaxed/simple;
	bh=L55gQgV2VqfRHB3kgV15oShwGxLR3LWbJNhDSOa9we4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+bM7MHduEFlxaITI1V3wEe4YKvnY22CmhZJKZWNp/5pVSsgOFYboG1LVbw2zI8vt0dHAmN24NYCnfzNE+j3BqwYGcmfgXhWizNZuTT3e+23bdWp1/cxnxQsyI3tiU2u4vnNXtwNZKkWhg64hcqzx9X+myHCGB/WfHpsFZJTKl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtD4IXMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqjpbgRz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5o2OD707656
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	07i6b9jm14fpmcPVX0s4Eck0s/m4kny2C6giuEzHva0=; b=TtD4IXMDLgZYhDRa
	UUlOr0qDYNY11Cjr77XiujvX5Vty7SuEemZJNEKOmZubrVD3CGqhch3VsZ+cW7Og
	N5QkZcq42Zd2hHMxAPX9RlfMSWuThBkjtUGF8C6TSBh6XW5a3nXBz+rDe9OYCNS5
	hybv5LRFQne/9PTrpmKScVT3Mx9OAiJhjrSa0bVH6jVMmWO4CmxeV7IUrOwaJ3PW
	4tbeJTA6t2j8Wit6TtBrsfgpCw40ETWt7fPKaIHTBY8jsWliA8wF23Sk46Eirdyz
	+miTUGg0qKDU8pEXs4HEBzh9cCY7/OlOftYvcUL+64ncOC2vCJ4EmIzKhKr/NcIH
	C0CMAw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj0kjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:41:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354bc535546so1895826a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 01:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775810490; x=1776415290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=07i6b9jm14fpmcPVX0s4Eck0s/m4kny2C6giuEzHva0=;
        b=jqjpbgRzwSOcZSevMPIuvA9OTlzV1lnPDzEekEbuTYyz4c8V4m3CD2R0TY1nTEZkV5
         Mf20onOa/slIlblvkS6DwrQrVgcMJCYSplrAbmqOSlQ/CImeb/7VgaAkteBMBltPLq/Z
         5jXTUzhgoTgaFwxz3H5tAGjokChrIHac0tXsXT1qCxEH2RyJMn+rb/7t9EUhbJULJqQ0
         IYBeIAZgRzFRviYef2w8l6E8yAgHsmFvZQBmskAWu/3xuyF23VZBPQI1G+dOZLVhG99l
         xNDNOVE/lEkgTlO6hGYJ3I0nKw952pf6JiVS/bjOqRNOqa1cneEYPvjVA5iY8l7s7xU+
         Cfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775810490; x=1776415290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07i6b9jm14fpmcPVX0s4Eck0s/m4kny2C6giuEzHva0=;
        b=tH4kYYXvdWIAAnwHyghh4TeZEmFVAcGTp94YxJbwQvFpRXNMDws3CLHPdIdPkk1HY8
         JaAUlPSfOWgo5IgcRYLzK4wctfwylMtTWUCKMA9NYJG7pIEL9su94GJSfWu9ABJJXE/i
         vNfkyUWwmAwORnK9sSFRqsrv21LuEcQpQziOETSu9i01hiC/1PU0w6WB6VK2nSu6bKjo
         ii4XHAaabVEt7hYz+SdBCwef6XHAWdtcN0BEk2BQxucWScYLDF9ywKiblp8eg5ufMrkb
         Z3IT6Cz84dLm5Isv7qlvq4Gk3YcuHaZad/ILBPELX8CvzZIRx+bsO/dOkTAtV0ecDL6F
         sFmw==
X-Gm-Message-State: AOJu0Yx5ojpye6p9NVf1jt9G+JkfbHbDQcu0SGXg+29Y2P2iz5HG/lez
	CctIrABD6GqnJKG83VkfSj2wb3By8WLyGEbqDln47AtkyyG0mo+wlyXdTukIbtapgrPkI0MKtWx
	byA8IaOtdLlHuGIadxSB7ruwY03dUBG5YvsnlE95O3P9+n2lYaKclWwkKyWAvy/lR93tg
X-Gm-Gg: AeBDietXphu58E/ARsEDqxVgJVYhak4EK+9sQJy0rCsSsnPO1bPKcZPBC/8tr9neN5x
	vI8dLvidamiFQJfSvlNH3gEFr6DS32Pjczyfvjyhb50JO8gm+Ct0eR6ukeIeAAhYDqRuCefMP80
	JwlPXc8TSw4llVVz4ILEOYcIrg6nLyffYBEbPOenMYNbwzDMTDCQZed4ZolVEOdrUamb2STk+Jh
	9sybVzHiftuNnSuYsb8acwSOypHczAamEXWsxtBszogZvGNRlZm0Fny4bTERS9zHIcsQsIz1aaA
	smC5dt+FniYrlX7PYtn+e1/Fl/4UeCFKiTfyeiwAoyBHYzM+BaxnRVSR8aNfG4jX8hiTopOaJ5m
	an8O1XCwJLOFEhotQCMM0WiTa2EuQ7MjgXNcdPiWGHGz2wrYxo+mxXFv/16COSWSJppI=
X-Received: by 2002:a17:90b:53c3:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-35e4281194fmr2857159a91.22.1775810489774;
        Fri, 10 Apr 2026 01:41:29 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-35e4281194fmr2857123a91.22.1775810489251;
        Fri, 10 Apr 2026 01:41:29 -0700 (PDT)
Received: from [10.152.203.161] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e4133743bsm2458206a91.15.2026.04.10.01.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:41:28 -0700 (PDT)
Message-ID: <9d99f3ad-e2ec-4a17-ab07-3d379dc28d55@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 14:11:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5210: add the bootph-all property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-add_bootph-v1-1-cb2b5093f7d7@oss.qualcomm.com>
 <8fe36a5e-1ebc-4c5f-9c3b-3c50ebd2274e@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <8fe36a5e-1ebc-4c5f-9c3b-3c50ebd2274e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dyqP4xTViIUal1LJx8VGatVxQYxhF96j
X-Proofpoint-GUID: dyqP4xTViIUal1LJx8VGatVxQYxhF96j
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d8b7ba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lIHZG7vxoDUjMCuUgwYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4MCBTYWx0ZWRfXxTUiZybc/tSW
 MgXsy0g3vb9eNg+o2YQltSLBTMZDDTPp7L534QgBn5nL2VeJ9yj4cnMZt06LY1jueAylNSeTVpD
 bXR4bLM3FANBgzCUtUEaLnXnr22pD3D3PgOp0ci0wEUkPL/KSHjjrPBlBD6mN6X2xCOlydBDhU1
 bSoR2wuY60+rLzPXX+SfG4RYmiznrUBH4b44Vwu2j4URPPuDsLvZXgNyWWNqTSSLh3qcNo4vYXs
 9KFqy/mmcmAmqeK9Ky1hekL8lHvs7z3mpxXUocHBDxsHwDm5gm0+EsqXnXuzuzbGdB41DAknfNS
 DjnSUxnx8WltYXyIrBLrnzO1Btv7YnDG5/IlL8Ry7+tF8cvzGP9+rv/YCWV9QfWAOpWIFQU6Vdk
 NUZ8Aeul3Y3C3kNarLh5dvAuzFleFhmDikZcTIP1ugnuBeIb5HB5KWGWGbnhtnuGcWFKFDbkt6l
 mbN0Z47W+UBWFlITLlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102615-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE58A3D4404
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/9/2026 3:33 PM, Krzysztof Kozlowski wrote:
> On 09/04/2026 11:28, Kathiravan Thirumoorthy wrote:
>> Add the bootph-all property to the nodes which are utilized by the
>> bootloaders.
> Uh oh, so it started for qcom too? I really don't like how these bootph
> properties spread all over, so please provide arguments - which pure
> upstream bootloaders exactly and why exactly these nodes.

This is needed for U-Boot SPL for IPQ5210 [1].

[1] - 
https://lore.kernel.org/u-boot/20260408091136.2794546-1-varadarajan.narayanan@oss.qualcomm.com/

>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  5 +++++
>>   arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 10 ++++++++++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
>> index 941f866ecfe9..56dbc506da78 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
>> @@ -17,6 +17,7 @@ aliases {
>>   
>>   	chosen {
>>   		stdout-path = "serial0";
>> +		bootph-all;
> Since when do we add bootph-all to chosen? Which broken bootloader
> ignores chosen?
>
> This really makes me wonder that you do all this for some downstream forks.

U-Boot doesn't need it, but U-Boot SPL needs it.

>>   	};
>>   };
>>   
>> @@ -41,6 +42,7 @@ qup_uart1_default_state: qup-uart1-default-state {
>>   		function = "qup_se1";
>>   		drive-strength = <6>;
>>   		bias-pull-down;
>> +		bootph-all;
>>   	};
> And that's a pin, not a device. What is the point of marking it? The
> device needing this pin will have phandle which must pull the node.

This is because of the fdtgrep tool's limitations, which removes these 
nodes in the final DTB if this property is not present.

> Best regards,
> Krzysztof

