Return-Path: <linux-arm-msm+bounces-112019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KOLAH8+8J2pZ1QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:12:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A5E65D12E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:12:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Uo1iqkfX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pzxintu2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112019-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112019-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 842C33019089
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72833C09F5;
	Tue,  9 Jun 2026 07:12:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B6E34678C
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 07:12:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989128; cv=none; b=IOQuY7Rvcy3RLCCE0zL65cRMZB9bidQWxSYpNJJQn5X39INyQx3CLBNsbPQqeWRc8stmPAG6MwAjpT7Sg8JPbOIkZOyhFaDmOLLzeKaobY5HDwmo1EXsS+oTbhLtBGEFVcRwOfGSgHzyXIv3ZdISOOf05GfVEKVSksqkqmsCAk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989128; c=relaxed/simple;
	bh=Di9Uy9wM6dm4NQAVkyjXVPUSJhqJc5J0i9cLaf1DGxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HzdAO+SuA3NBQa/qKznblUAuXOwn9LUsnux6OqG+pUEh8mbgX/zfboWKyLArINHM4s+zAlNrBIHdavGZm0IQi8ZcR2JZj/5oR9d/xmIGL56EJu/S9o1PiwfM2tWEPA2dlUcA7QLduDtivbfbr+/CDe3/X1NuPU/NzE/ILy4PKGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uo1iqkfX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pzxintu2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6596GAhv1736456
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 07:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XSEYIwz5RHp2qgsZn++HUntrNJgTOGYlGnqOYr4W1c=; b=Uo1iqkfXK2krkuOZ
	xCHzlZr7I9Odrfr0rheDc+2GIjlxkt7HIUBkU7iJY5u/waARSBfZ2iowbIsrVvuF
	Om+edxovn6edbLZC59gOL6dr5rR+Rr3QCAQrMKklfANf4NUEhZkxz51Li8QEaLTu
	iwJB3/4IskH2kQt6S9xZGkfQZn3i9YhOi33z94cwFqj8DYHLTgx588iR/oRQpH82
	ouaXziYvqVljb00eMh1mP1tY+6vzvWN8bG15VL2i+huCSd6xjnRVAe83xy0OHrjD
	r6nHBy+WmNkjTCTV95Fbu7ZAQn1PUW4oWV27pBcBBb5ptxLuEXr2IX0oRVfc7rRz
	7Y63tg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds87tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:12:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf243973c2so36479575ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 00:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780989126; x=1781593926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/XSEYIwz5RHp2qgsZn++HUntrNJgTOGYlGnqOYr4W1c=;
        b=Pzxintu2W49u+m+NfNkI/MOfpJaZB2cNrcvFD1JJzTQRMw3Cm0nkGSfON8gq3AXu6c
         HVeaWgsQLEyecg/uCpRJjZVyrUuDp8dORb3RClfxhe2BTHWt3FsUkwY4yImJUfQkKgFi
         Bw8ZAq/QVj6ApxzAVxTNxBRlsNx655FoWIKREAb9PO0brMMXtuOdhBtURVrgdK8nLX8H
         vD3Eg1WRNReos0Nkfx49gQpxPNx2R/ltthWsPRm3rAEFoOsmnALP/VyPvwSUWNugkqvj
         VPUvWbRKTPP3GFNvS1j1qR3D5BcfkLqS0fTDURCY80m5VfgAH+ffA/WGs37TT5SHXqHQ
         N4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780989126; x=1781593926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XSEYIwz5RHp2qgsZn++HUntrNJgTOGYlGnqOYr4W1c=;
        b=sT9Ljjd0irMJLWvLVzSzuXCMRja7L1OmpcPFotaDSpIn+bFZ73OyQh0DBFJmtVFTW7
         3oUO1pE4smWceK7cariVUWSGdlrJCdexkgc9+jT0vEpVTpNvv+hO8dQbJoP3f2ixWI+D
         uUhcqntTDQWwti/qDtD+6qO7uFvvzto5LRvO0mfNDsK8YiVxwYumaHgrYwXr8hdv/Wj1
         1OdtEXU+uemZijNgRawR3s/hC2hClctaOT4xGjBKSPwdC77SHNE0lF+5QppRUJ5fFIHi
         luZcendEhn3L3+xArmoTmjvLwtuysNyfnvbBX24bw8NCl/uEACiqUNNFsSVtikt+A2z5
         /M1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9kS4pP2da/+r+k9MbyeOZVSkxHFjhWaQIIWtCLJA2a/09pUKsw+DFoC/YRWgZEzve7V0J/6rK0dCbCG/DF@vger.kernel.org
X-Gm-Message-State: AOJu0YzxWnaIzurzQ3DhUAL+qLaxh31Kk/jlvfbBaB1RW3qtAL84W05m
	i2iYoNv4BVXshjvtTAMwoznB9UUmdiIklGFM4LV6cmfBEGlhgAWGWRTh+PXWxU/vXfmKoaLjcUC
	+sIdBYttx7qQF8KAW+kuwaxMRXkgpvceNcXJ7/1wuig8uONY9PcPh1v2slRLsaf9M8JDl
X-Gm-Gg: Acq92OHbaM5tW1wmTjdL1ihyGjkAjccVjJaPfzcJSKHvxMdiWo7YmrKqTPZ4VxzPoDz
	c8sPEu2y8EDSrSF1HDq+YwNa3KjHvavkkPJnkqTb2vD9nVXEe2UWN6VyTF+nXUIrERINVkPP51R
	+WLm75n1nL1L/GMevLyeJiG8udB7Li4igb3mu6F/2l42FowCBsfvG6WjtsG5TYdroviFnmgF7s0
	+UlyP4dkxvb3inMGt4WkcKSRilbcrlx55nixr9C04Yre1mJ/qn3uYwTN9l0ekpuUvH75ZYxIQls
	CVLGQyxBPzb0DzJccSL6jNFAhguJFrTiHMZdsF/9QRtpvnzzC0xoAs+2PSwDAvid7V0kL4DZ4ve
	BOj7+CIQRLnL3E3cqiWEMhwaSoBWS7VjIjlx0VR6GEy8sxGk8xjrZ+TLrCIrdIud63xA=
X-Received: by 2002:a17:903:1aed:b0:2c2:245a:3364 with SMTP id d9443c01a7336-2c2245a35e2mr142421015ad.32.1780989125612;
        Tue, 09 Jun 2026 00:12:05 -0700 (PDT)
X-Received: by 2002:a17:903:1aed:b0:2c2:245a:3364 with SMTP id d9443c01a7336-2c2245a35e2mr142420525ad.32.1780989125021;
        Tue, 09 Jun 2026 00:12:05 -0700 (PDT)
Received: from [10.92.193.107] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d69csm200849265ad.2.2026.06.09.00.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 00:12:04 -0700 (PDT)
Message-ID: <9e3f3f9a-e176-4f34-b9e1-1eb90751c096@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 12:41:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-1-75356d1b7f94@oss.qualcomm.com>
 <177921242050.3254832.4034348981825996968.robh@kernel.org>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <177921242050.3254832.4034348981825996968.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PTwvyalS12P3Jiff8MMcCDHojtxo1YGH
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27bcc6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: PTwvyalS12P3Jiff8MMcCDHojtxo1YGH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2NiBTYWx0ZWRfX4EzSp+zrrP+X
 Mo9cG4V+vd8vDDYS4m5p7w8BFu8YmtMxNge3D20dDMxad8Zut8ecTcArbIRmYxM9U3dESy1fnur
 YG+zSVKPqjx0mKprUcppsbzKCXrbPCLRYwyQ6ySI3YPX7vmsmx6WtW7srjEoGjhlnREN1kN+KPp
 tw2opJRCD17Xw5u3ONxZ0CwSO+eO+LN5ooytBVQ5OOuY/UYx9gV1ZzR1dBBGYkPqE7oLWr4Svn7
 sTkRM3u6WjgQN8Vmt4eC0+bBmZe6BnzeeAHprdr871GgSUyzzy1/IOmX7y25IkI/Kw5zKM9PuhX
 t361NOfinKPmkKXgsL2IumGHUoP91wxANjd6f0H4Izan9Of/s189SPDmTxiytflkGgBeSGnmgQo
 +qmf2yzxcF+GpofJoyJPdb+Uv3WVV4mRxGYxAWLjqVBoeiN4jO6wCRsCXr+QksUv1up+UBmZLoF
 4iIzaeaKlsMeX5WXcQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112019-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77A5E65D12E

Hi Rob,

On 5/19/2026 11:10 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 19 May 2026 16:19:49 +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>> based power monitoring and limiting capabilities for various domains.
>>
>> Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   .../bindings/power/limits/qcom,spel.yaml           | 47 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  6 +++
>>   2 files changed, 53 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/limits/qcom,spel.example.dtb: power-controller@ef3b000 (qcom,spel): '#power-domain-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
> 
> doc reference errors (make refcheckdocs):

Ack, Will move node name to power-limits instead of power-controller

Thanks,
Manaf

> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260519-qcom_spel_driver_upstream-v1-1-75356d1b7f94@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 


