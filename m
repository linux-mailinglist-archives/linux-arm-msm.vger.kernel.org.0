Return-Path: <linux-arm-msm+bounces-108540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANkZHPh9DGoSiQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:12:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E995812F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32AEC309FED4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A765C3AFCEA;
	Tue, 19 May 2026 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHXNz3Sw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BG/n4KUi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC213AFCF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202997; cv=none; b=BlG/QgspUQ9hbsj7ehj1tHBpqI1hUwBtTLcsuNmN5OjDAf85+8b9W/+U53x4gol8ckhDq7+EIaXhdMpJWZ5PYekywf1Y41nwlOKBSZ3aDq54ov+docY0KzYKOP9veo5Qsjwf9XN87nh3YMRt7C4hK2mthuHshlUvS1ifW8U14QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202997; c=relaxed/simple;
	bh=goujWWgxDAtQW0ZT93RntvBrZJtIcLJ/PvUYvvYOj1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XSrEr80ljk4FKxrvWz0qkL0s9II6yAO2xQMia7Gy7A8TIKiMQEaUx+IVLDHcoM5G21yrg+Ev0Njazi+4tW5iWIa35GtDqbFLbRVqriNLRKbmbBHzDT4ha6OM6TIQT1QOELxJFkZVHSIqYqzAOz3cbku6TdqQTxG8bML2wKvd/eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHXNz3Sw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BG/n4KUi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExJkQ2983959
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 15:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mHGL90YYCdoIftFeeZBzlNxa7STv1/CtE4HjA6UIQ9U=; b=WHXNz3SwSJSCYQ+s
	7IhJEqNVgCyByrk3m3ETi1RAAK8rw37mdOM5zyT/qdbXSe5NCyc0T4fdWaMPh+CZ
	8+IE3Apt/t5mK8p0cz6Ju1z+KQlfxDjBSBKUMS9f92VJFdqE1MJLkXHluW/EaTYD
	Tki68w+zlgF4uKRtCOw667m0TBKZLfnFzI7REiGveDjs2AHqx9cN96OllftkB8/9
	PhCsnaTRdIXx+yc/OYpSixmMrEo+geli3WaiT7gmW/D/Goe1Ej4d7F71olOjXIlG
	9RPT32szx9qWe2/NQ+BXPE413GJXqCoqDWckhFkKsX2+jVmcGOLaO+k/7Kc06LJZ
	SefC2Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t00u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 15:03:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc7f9b2213so28178865ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779202995; x=1779807795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mHGL90YYCdoIftFeeZBzlNxa7STv1/CtE4HjA6UIQ9U=;
        b=BG/n4KUi6+5JdhFFbCxhJkxsGpSO1gkSq3rIxGxP4Am/JVXLTz+jRTX/7ZmyzW9w/u
         N5HO3Cs+SJAIZl/1Ri/CjcNoZmTQ+mEf2VLXt+jPhXZXUNdhiaM3yD04nmdo2UsN8ygA
         toxXdMv6payCLvRnXR+ZDsquHi4SRYYqz824J3BGcwITbFJpVVM0zGTyjk2TeAyLzXi7
         0PIljtkkLCKuGTG24pDHGER1d75PNxBqbnPbS+Mw3l1rn5mvpxNJs2X1pbNNSc5vIKG8
         jHHXGWQuyuGQRFkXjnUSvMJVGV1dc0s5YoCpSdkPI2rRDprvYw2uSJySLbU5BgNMhtb6
         Hp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202995; x=1779807795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHGL90YYCdoIftFeeZBzlNxa7STv1/CtE4HjA6UIQ9U=;
        b=Vn/q6veK0mh052phyuPJf7MG9fOtemFD/xxEcQzsEjrFKlRac8wH1tSudmM/kjmd0P
         PQ1CAWu3J777y0xUe5zui7zI3usmRji2KtehQxe1QqbxZPJGq4z7NQAgh1LnXvrhp3Ym
         NVmDZv3pj1SIF66nF2g5vBdS6LxWT1JDyQd4dNqf4bFSmbcyPVQC0RU2WCCxzGrfyRSs
         qU8B6Cy+itoECPXUoS7TjB+Iojd5qbTpy2CHxflCGZKRXNw90W7kP7nfudas3T67IAU+
         SRcelhtRdC4Q7F3VcE22mNQrtQ29SB96yPJSf2Wyxz9F2luyIyxkXckidXv4qYhW6ZrR
         55Hg==
X-Forwarded-Encrypted: i=1; AFNElJ8DQ1+ryebwIIFkzAbrxZbEP01mKT5amFmfh0jLCyWgRr5sMD+0sjHxYYaR+I7aLHflOP7lcax0VmWZP2Hz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy71IrFD14MJOhGw3vq+LP7YWU5ac2dQNJeMxN1mFRLqV+KhVHy
	BL71enwZrc/jiQsvSG9DM4ExDGwmTxb5J3yfsCFFzwpph7mEq6Vdn9vHrYOQuWQ2j3TBgYXdJ8w
	8w8HbZIX/yvvsHWVv1SqMoHxq+xR8ZPNluArVtwFZHUOwTB9Xi5xK8bKszr11QrkeRd0Z
X-Gm-Gg: Acq92OEKGh60yR2zAz8LiAJaP0efPalZ9Lag/ZU3/glc4xh6sKjrZJr7RniyCQhRCQH
	UuQsL3x5+P89TC047gbWSgZ2YopX7pzj82LgNCpsq8pJh54j6FIOJkAWgsTECnesp9SF4ME+Di3
	iIwAw0squHuYDJS3ib/BIpfu3IvkjShssen41SoGtrv6UOo5YTKIfS/hheDo/zLM7OPrqGMyjDL
	/1guWpbKARpFua+fvzgFgBxxZPkARWZkSCR4guIy6vZqUvmPGw61oK1B2yVNn5OorE5/gyiXope
	5ins05hrNAZIKC1xIbXuWi9JVBr+JilCKSjCJgAGgJrexVL5ix3uba82Lgx3kBBSJJ+D0z9adXh
	Mt/9z9WwKLtuQHZPQt6rVfS7KrcTCSqERSGqZxZk+Qc4wqnUv
X-Received: by 2002:a17:903:280c:b0:2ba:6bd7:8efc with SMTP id d9443c01a7336-2bd7e991520mr120248585ad.40.1779202994496;
        Tue, 19 May 2026 08:03:14 -0700 (PDT)
X-Received: by 2002:a17:903:280c:b0:2ba:6bd7:8efc with SMTP id d9443c01a7336-2bd7e991520mr120248025ad.40.1779202993930;
        Tue, 19 May 2026 08:03:13 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fbc05sm185598545ad.57.2026.05.19.08.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:03:13 -0700 (PDT)
Message-ID: <fd67b063-a986-4d34-99e6-fe55e72d0187@oss.qualcomm.com>
Date: Tue, 19 May 2026 20:33:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
 <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0c7bb3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Mpj9RaW3nZ1247zTz0QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: B-vvYQge8BMFvdHag9Vfe3k8yJzbFhIW
X-Proofpoint-GUID: B-vvYQge8BMFvdHag9Vfe3k8yJzbFhIW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE0OCBTYWx0ZWRfX05MqLAKqMhJC
 5XcReS0CN9+aj0MGTwv7iQj0vjI1UMqrmEX9SIAAwVHINVR9zSdfpXLrEOJBI43SZZe1ytg4NiW
 trSJQWfEdRls5KSG6TnTUT8tFmuKiD2ZKo7L46wmnP2gJtT5owfhV1kv9mWTxDb9GIuqz/vaV9a
 oVZDj1UUFgMN4txG9NkFYAn3QS1Q6GklDwytCcQ2QHzmaxLiLkel5mvefosv/NqMKnwIThXAhsW
 TsZcSf15yLHLzwGiwiPogdAyjalx+MCbHZFCCjtyQcr8NVsRlFgU/++lHYnEuJ/3FsT2LfMEFgO
 3eJScCiyUeFo5ZWUfxCXSssRpP+thjjvGt8hDxCVhdXQLV9jrR0ef4EBBjhGl8iMfbheC7nhqiT
 BpbWzfoAZa5KKAKVhi3YiGuDDuo73QWNPrkVJYK1JDGtJrrgF4wjpxSX4/9qoTF2nkTzdoi4tqF
 d3ISu1m10HszKnLpruQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190148
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-108540-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 11E995812F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/14/2026 12:48 AM, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 12:17:31AM +0530, Komal Bajaj wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
>> for the Qualcomm Shikra SoC.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pas.c | 51 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index da27d1d3c9da..4d43201b9ada 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -1457,6 +1457,54 @@ static const struct qcom_pas_data sc7280_wpss_resource = {
>>   	.ssctl_id = 0x19,
>>   };
>>   
>> +static const struct qcom_pas_data shikra_cdsp_resource = {
>> +	.crash_reason_smem = 601,
>> +	.firmware_name = "cdsp.mbn",
>> +	.pas_id = 18,
>> +	.minidump_id = 7,
>> +	.auto_boot = false,
> Why? It should be true for CDSP.

Missed this, will mark it as true in next series.

>
>> +	.proxy_pd_names = (char *[]){
>> +		"cx",
>> +		NULL
>> +	},
> Hmm, SM6115 didn't have proxy votes here. Is it requried?


If we refer to sm6115 remoteproc-specific DT entries, there is a 
power-domain entry (CX only). So we would need to fix this by adding a
proxy_pd entry for the sm6115 CDSP PAS resource. Would you prefer this 
to be done as part of this series?

In newer Qualcomm targets, the corresponding CDSP PAS entries include a 
proxy_pd vote for the power-domain in DT [1][2].
Therefore, it should be safe to add proxy votes in Shikra’s CDSP PAS 
data as well.

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sm8550.dtsi?h=next-20260518#n6002
[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/remoteproc/qcom_q6v5_pas.c?h=next-20260518#n1406


>
>> +	.load_state = "cdsp",
>> +	.ssr_name = "cdsp",
>> +	.sysmon_name = "cdsp",
>> +	.ssctl_id = 0x17,
>> +	.smem_host_id = 5,
>> +	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
> This makes no sense without region_assign_count

Ack, Would address this in next revision. it would be NOP in this case 
without region_assign_count and region_assign_idx.

>> +};
>> +
>> +static const struct qcom_pas_data shikra_lpaicp_resource = {
>> +	.crash_reason_smem = 682,
>> +	.firmware_name = "lpaicp.mbn",
>> +	.dtb_firmware_name = "lpaicp_dtb.mbn",
>> +	.pas_id = 0x56,
>> +	.dtb_pas_id = 0x57,
>> +	.minidump_id = 0,
>> +	.auto_boot = true,
>> +	.ssr_name = "lpaicp",
>> +	.sysmon_name = "lpaicp",
>> +};
>> +
>> +static const struct qcom_pas_data shikra_mpss_resource = {
>> +	.crash_reason_smem = 421,
>> +	.firmware_name = "qdsp6sw.mbn",
> Why is it not modem.mbn?

Previously, for testing, we used pil-squasher to combine the split 
images into a single mbn, typically named modem.mbn.
However, in official Qualcomm releases, the modem firmware is provided 
as qdsp6sw.mbn. Since Shikra now has proper released binaries, switch to 
using qdsp6sw.mbn as the firmware name.

>> +	.pas_id = 4,
>> +	.minidump_id = 3,
>> +	.auto_boot = false,
>> +	.decrypt_shutdown = true,
>> +	.proxy_pd_names = (char *[]){
>> +		"cx",
>> +		NULL
>> +	},
>> +	.load_state = "modem",
>> +	.ssr_name = "mpss",
>> +	.sysmon_name = "modem",
>> +	.ssctl_id = 0x12,
>> +	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
> Again, this doesn't make sense without region_assign_count. At which

Ack, I'll address it in next revision.

> point you can use sc8180x_mpss_resource instead.

minidump_id is required for Shikra. (decrypt_shutdown is not applicable 
and will be removed in the next revision.)
For minidump_id, we still need to use shikra_mpss_resource instead of 
sc8180x_mpss_resource. <?>

>> +};
>> +
>>   static const struct qcom_pas_data sm8650_cdsp_resource = {
>>   	.crash_reason_smem = 601,
>>   	.firmware_name = "cdsp.mdt",
>> @@ -1571,6 +1619,9 @@ static const struct of_device_id qcom_pas_of_match[] = {
>>   	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
>>   	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource },
>>   	{ .compatible = "qcom,sdx75-mpss-pas", .data = &sm8650_mpss_resource },
>> +	{ .compatible = "qcom,shikra-cdsp-pas", .data = &shikra_cdsp_resource },
>> +	{ .compatible = "qcom,shikra-lpaicp-pas", .data = &shikra_lpaicp_resource },
>> +	{ .compatible = "qcom,shikra-mpss-pas", .data = &shikra_mpss_resource },
>>   	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init },
>>   	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init },
>>   	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource },
>>
>> -- 
>> 2.34.1
>>


