Return-Path: <linux-arm-msm+bounces-109211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAtgCE8iEGqsUAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:30:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD55B1371
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80EF33016CC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094313B8D78;
	Fri, 22 May 2026 09:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aL0fYQzk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AHQfrWao"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6D3A71B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442169; cv=none; b=LpDQzjVZXljZJ2o5MROLQAaJ4yVQLgyGrSFLSB85xCrW7T70JUf9kZ1rjvF9g5H1Lsy2nN+l8visn6EWabup26dVZmobXMv6qw1CJvV9L5TOgdCoztpTBGASVjuZ0595G/Bne2T78o7m0bojaAo/+lr122qjvsmilv7xMjkEPIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442169; c=relaxed/simple;
	bh=HyipYEQjC0KSlMPog+3ry2pd7JXrK6HPvK8qsQUOufk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvIWUhm4hTe4WF6vvlevH9Y26cUvDBLk/sQbndBpAjRxfftz/ubyeOAWMH3GIyrHHjXofev8IJQ9en/OCuYd2TV3lhH/hMpOi2pcc8Ijwp2QblHQ2kxiPClm2daLmbPuNLC75v4XHWmPb2oxY0WFPbiyMt7DnoKHrDaDllX6VPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aL0fYQzk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHQfrWao; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6UYs71959980
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Scedxuusc0uxfD2QhmQPprVEqTr7vKMbjt0LXoZAcOU=; b=aL0fYQzk8w5eGQVj
	1L+UqXVCOK9ANtbGmrsH7LgdqW0PtqDgI9Kp9u2j/Pzyvh35Of8E8sERMLiEnxdt
	5cC9uFVK2ibNHm/fMkeNf+ehyG2dxBRsRYtyJudurhAUpvJfMOfWH4KlbQnIo/nz
	X9Vv1OnBjrm1SBlCStlCVqo+P4Kh5Ls3wwnsAkpYB6QS6k6shRZXsyy7FdPn22vo
	1nkkx3WD6vJw4glyyFPz7kCCjwzUe90MY0IIr6QzYMrZpvfnDDulN/Lx1im9NdE+
	ASPYrxetMqtDsJMFo47pm+Fklkp70jwfWeBIQUXvQbUPdg9kRWj5DKmrKmYAiTFj
	mJRYrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxerum6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:29:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba86e35aa1so117982715ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442166; x=1780046966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Scedxuusc0uxfD2QhmQPprVEqTr7vKMbjt0LXoZAcOU=;
        b=AHQfrWaoLpjFG0ocY917zTKx1FWGX+vBPd1+UqZETUZzG7u+MrLZ+rHJPKCCccWiWo
         LsyFXEZmrgCJKxc6CUrXdl2WbIiLZPPrlbNCX5PsDUzJdnYqzBgz/4P/3ntQdtXuzva/
         maRZwaC5MAHpXTHwwbrRGOBx+MLa2uyEYjvY3jB0h5WGIv//8Hc81a/isrsIqwio6K7C
         7NvAdM+zSmcXbUt0BTPgEfUtcFT7ghwh3XlO61ErG9EJKEWopSHuDXtJSAdSc5dTHWsD
         oSYYsp3okc7cekSQ+tjHvII11hLyiBSxpy+xfArNxJXZF4VHqd4y5ApR5ndG8zJA0B32
         xClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442166; x=1780046966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Scedxuusc0uxfD2QhmQPprVEqTr7vKMbjt0LXoZAcOU=;
        b=rECj08gpDl7ZNKFpSBrQdd06AxLNTwlGUAaUMbCr3QlS7Wbw1ssie/J7F2uwGRR6YL
         DXrb0ws5qAds6CksCxzqAQBXy28K5hk5HBNw5VTJJPGmERSm35DYYbMQMHJk1kNRdDaM
         nqP3S/DkgSzA6mJ0vuCx+FNffvZSZaL/t8TkZC7XY6Z7HOihMf/R6E8Fgp8k8SU5XriB
         JqBT7bMRkmQ/nJm1DIwbNqbh9MnhwHuhYhcqtGIUWgseAgMdgnplOpO3mP4Myzx5US9V
         u/fmBHmS96tchL49dOfS7IiOFxWnAhU/+/MWsYLxwMxE1lSx3xVW0fQoX/98c7WtXiwa
         fi0g==
X-Forwarded-Encrypted: i=1; AFNElJ9XPdYHdG2OuJW7nKVlo6wNaqNfL4kGdPE3I/Mst3BrClANVhEXXA7hO9JALBW7VteDrDpchPLq8cvfdGFB@vger.kernel.org
X-Gm-Message-State: AOJu0YyhFnFJhThnDLat8ZRvWxxP9xLMnLCswiicDhOa4CaQfUC5jtcC
	eQFgwq4Nyy5WMaOPqsTXiyH6y06U1Kw4Hj5fMgrvvC5UuZeGuJaCqPjBxN8UzDEVSvPOkM99z0t
	W/07GPcrU3A0dnsmMJq+8McY9xxGhA6MKZrADyTYBdI1bY8B7bYRZ5pABDqOOmtfPOhRf
X-Gm-Gg: Acq92OG7VAZN1CSd3TYbs0T5XgcaefLIB3loS2C/yPbo1MhAAezCri6dMA5W590DUMi
	nzDTyU1HqQC4Mx2XWdjto7UJLuFKAW51dq+BDbNxzeLFf9PjtedjgzvI1AQksugYb3J064RWAVb
	tqyIxy/ax/VhCqNu1woQ5reAPBakHOwB6jFNnDt8nc4rxB6A2KY27BjEhhBuewpaeomzDEM8p0P
	WY0CJ26fQdVpPPskSdHRQr1QNbj1NGYqDEBrTDTBTooQM4+IMTMU3QsPI3q71o729RU/zAUhKcW
	FcyVYQo1wP0TUtibt4O5+vFyEj2APXp2WnPuiLMoc5vG+71ezBeboh3/JTIc0TB5EfxjiaRB2vr
	dza5t9FQAcWzcSN8nqlJSVNvqu/eSGJa2YGZyqupZbODz7Fkf
X-Received: by 2002:a17:903:41cf:b0:2be:39bd:8dd8 with SMTP id d9443c01a7336-2beb063f20emr31885085ad.33.1779442166515;
        Fri, 22 May 2026 02:29:26 -0700 (PDT)
X-Received: by 2002:a17:903:41cf:b0:2be:39bd:8dd8 with SMTP id d9443c01a7336-2beb063f20emr31884605ad.33.1779442166061;
        Fri, 22 May 2026 02:29:26 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm15693955ad.83.2026.05.22.02.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:29:25 -0700 (PDT)
Message-ID: <bc00db6e-f943-40e9-86c4-480d533a8656@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:59:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com>
 <20260521-shikra-cpufreq-scaling-v3-1-883c13d1e514@oss.qualcomm.com>
 <20260522-juicy-seal-of-wind-a2fc50@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260522-juicy-seal-of-wind-a2fc50@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MyBTYWx0ZWRfX0NKUYkvhamv+
 jgmBg4+qI2mTcgnmXPyJ+JyVIegbQcllh234qMt9p/acsBvJ1koL8O4WyC+qJ0bsZ5ySu+QqjGF
 EIXPYepF99uomKgx3YoHBFKJVNYay3POdmEeMcrPLdW1FR9hnObEIcBdqMp/sZqN1mjsotADVKV
 obI3RJnqgEfN1tb82n6mHiswTuiQDL9TFnEeoGvGAM0y8oDmtx8Rppk6nEZiR6Bo1/8a0DHAgOG
 z0eo8rJGiBge5SqJqEYjtRjOw895blnIYe9GmvgdObu628tfYD8gP1C0cVG57RNQwCk2Gz4gnd7
 OBuFGyZUv1dU3GgMn1b8BV8VflWGTKU4UdXKUP3nUN1yThHG/smhvHoTElvGUAhUJOnauU+aTp0
 mMFwi4zPeTPuMo1XkaBoymU00GYr/2C4TPOBbpH6n//sgmB+egrykLoMPb2UeyeO/9Ap7SGWsHT
 W2FVk+/0nfZ9OuGIQJw==
X-Proofpoint-GUID: cptFCZD033d19ZyM97JFT8qqx7OHmYJd
X-Proofpoint-ORIG-GUID: cptFCZD033d19ZyM97JFT8qqx7OHmYJd
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a1021f7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=lsxlwQEPlIojZXG5zssA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109211-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E1FD55B1371
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 22-05-2026 12:04 pm, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 07:36:04PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
>> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
>> Shikra specific bindings to represent this constrained EPSS variant.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/cpufreq/qcom,shikra-epss.yaml         | 96 ++++++++++++++++++++++
>>   1 file changed, 96 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml b/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8543fd00d82acdbb3422bde462417118aa4c49d1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml
>> @@ -0,0 +1,96 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/cpufreq/qcom,shikra-epss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: CPUFREQ HW for Qualcomm Shikra SoC
> 
> Qualcomm Shikra SoC EPSS
> 
>> +
>> +maintainers:
>> +  - Imran Shaik <imran.shaik@oss.qualcomm.com>
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +  CPUFREQ HW is a hardware engine used by some Qualcomm SoCs to manage
> 
> EPSS is a ....
> 
>> +  frequency in hardware. It is capable of controlling frequency for
>> +  multiple clusters.
>> +
>> +  The Qualcomm Shikra CPUFREQ HW supports up to 12 frequency lookup table
> 
> here as well, like I mentioned last time. cpufreq is linuxism and I
> asked you about name of actual device.
> 

Sure, will drop CPUFREQ and use EPSS as you mentioned, and post next series.

Thanks,
Imran

> With above:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 


