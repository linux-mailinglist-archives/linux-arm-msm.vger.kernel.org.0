Return-Path: <linux-arm-msm+bounces-118653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aH2SOiyUVGoMnwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:30:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8CB74827D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:30:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UwQx2fsQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HGH5SiUd;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118653-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118653-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DD22302BBB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3244499A4;
	Mon, 13 Jul 2026 07:26:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42165362137
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:26:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927561; cv=none; b=nTbICwzPzrXCedBmESmO7apZB2GweST21s1t42g2J7j8g7r1xy7cyj1GOnxOwrrLkKK75BBD1uJCJbmDOuXyjZMJRGFimSpSlIkhhtmV56MamTe9j5QNapt7+p/QzPCtkvWkMiVHVJZTTiEP9gy8tRm+ceBtN61GxoTaH+vnc1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927561; c=relaxed/simple;
	bh=xSsUd4+F9JAMqsOfTXvQ0ET3ZBW9Mja2/20RZUJBw48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqyexKmU2DzyZXaBEH3nD/hH/QAEIPOZHVeVNUoKxENrLG4BR4KQoTEccnBmphfY9aYZte2VCMHqjOI4vyBIAHffKMG/eeSFgf4L0Zw/gDINsa04mZXfXAmmWzr/lYjXByhdVVjjpA+tHA4G+LSHg4KuqDWMpqCBnXuGo2K7geE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwQx2fsQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HGH5SiUd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NwGA472836
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhrdjE8+DdQexYgxMjUrXviF+vvjNB/D7Kmvlckb+5k=; b=UwQx2fsQGXdXQFOc
	/VdZH38tEgCj+u46WkNuQLxexnPhJhGVaFfKb1R/IF5/kxN9rEgdM5buIrd22dAg
	2lCchT7IRWSZ1Hq8kLubu6xb5FdrfiSrJH/CKuCPpxveySIdqp/DkW7KwgUFDhhD
	DqoCtfnBA7AyAbOnO50zOycIRXnckUo1dT+KLMV6DZ7BXhtdjnZXOSX7EPNcpEzr
	/0hAYszojz2Ve5vqeYYKL7KUl6wXc7EcqcFOA/FIgC2Rg3/mfzaDPH1rdLmosRCj
	k6aaVnnm1f7kbwloPaasoELdOZs5BlHbbWWWyqxny2SPKAPoNGqZOuPWBOQavdni
	o+XNtQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9n12k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:25:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c804e38c65so59456515ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927558; x=1784532358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhrdjE8+DdQexYgxMjUrXviF+vvjNB/D7Kmvlckb+5k=;
        b=HGH5SiUd/k6CdGW2VvxR71IsS9wiQd6196fPe3Ed3VFJ5P9SM9328fID6Mjho4K+Xv
         YZ/M69VWHQNYdjcPuC7EyIGr3w7Vg7pfLIJbwPxrQqHfHdIiy2IwKswDYE0x5HUF444U
         nNE9yxJCWNwr7GzxJdON8FwQNaBwqaeqBa47NRHPEBbd7XfapAC91gAL/n6xNILImfBn
         rwr8sbLS4cwEiAN3+Imkk3KdQt2s8fnezf14CwAMAHG/4vMcNJdlmGVsJP13xlVlTt5f
         GtUuQQG1/S6NoaaaJObWaj0AZhmPn37cJatYLQqcdjp+YKPcLMXejQh06ARROvZgAFFW
         SDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927558; x=1784532358;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhrdjE8+DdQexYgxMjUrXviF+vvjNB/D7Kmvlckb+5k=;
        b=Wa1/prH7we+dXXp9WMzMJymZiM7lYqMIgcAueBVM8TQCv1hpUdIsLzqBV05D4ix6Yk
         2ZsudG1l7F62qvNhrV5E7wBgT4ZHKu/3fnLX2+9sxWUTpC3pA68MywGQc0qhwueIyFEP
         zhKreg5Gigx4O+f4DCNtJJyyTT7yL7L0MkL3gu+blqldSxUnRDIZOCkj6nOTSjhLSZZW
         PJR6bMiWnODpLEh16mUTlRRI89bvoprdNgy3MRoSjxhGbfEc57uYrvYSFaSujgma+4PC
         6868U3bT2NQtYftnsT3xlY+1zdXKAOuV9PN1kizOEqiIZtAM3GiGv6yEhpr1YSFHwENB
         /GrA==
X-Forwarded-Encrypted: i=1; AHgh+RpD2ijYsoHisp102pcWPOtsPB97UXqcrII6DaEMNog7EClyaJiZmlx1lTdIQZ1x+LHiHDNuNe739Gt6LGkH@vger.kernel.org
X-Gm-Message-State: AOJu0YyaqFt43og4ftzsXl0+d4g95OtUsQtiX+T0QbqtZdkLtu3uaeiM
	/dJa4FUktbFrgBoW727lcLWXhPb3L+t6XdjdnovdiLoR1Wak99voqSa2C1ZJOZLYVwMIfsEo9mZ
	6pTixbF1PhNB+g5aUmVfu/8yK9Ea/nqlOZAuTRJTYiB8M1jcXJeSrB9cbNmK3ydumAnIq
X-Gm-Gg: AfdE7ck+X8ATV937U4dtbEMr7VJnhLh3wNx4HDHGxtXdvAgug3aAKKyCdHGa16gxfTA
	gocuWa7P4ZtLSlUDr6Fjf0bPAaTQXtfP4kwvr6TSKc88pubONQS2HcXXf7G0ve8BboC8wiohruN
	+0v1ondiRY0/+kWW0c2xmoLooeXZUK5a3LZiUiviL1qWIV4Ov8cTsnZIqaujMLjtRNdcEyxB1eW
	Zij5J0HSWrzP512onEAK6AseO084YPooW71Wbu6UTYo+VHmSFVDpaB646/tnkwQDU+7zeTEhJ+W
	JTCmO8f7B9p3R4Jquf0DN6xwYqMV+HoYeulaLNV1dzPKrHM5L8K1h8QaaK/lky5PTy9zXV/rNIl
	kzlkvwMKNvnp9oCYLlqp/GbcO7m45ZJT57debsXxaqhc=
X-Received: by 2002:a17:902:ef06:b0:2cc:777f:d67d with SMTP id d9443c01a7336-2ce9ee16c76mr80260185ad.30.1783927558175;
        Mon, 13 Jul 2026 00:25:58 -0700 (PDT)
X-Received: by 2002:a17:902:ef06:b0:2cc:777f:d67d with SMTP id d9443c01a7336-2ce9ee16c76mr80259955ad.30.1783927557662;
        Mon, 13 Jul 2026 00:25:57 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdf5sm94513175ad.73.2026.07.13.00.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:25:57 -0700 (PDT)
Message-ID: <a05e7dcc-7d8b-4db0-bd51-754184afb7c1@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:55:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-4-3a78362c4741@oss.qualcomm.com>
 <n45ii7ekxeefuxw2ydwzsx7lqlfczbgg6obrzmzpytl2fin7j5@vbhmrptcjvcb>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <n45ii7ekxeefuxw2ydwzsx7lqlfczbgg6obrzmzpytl2fin7j5@vbhmrptcjvcb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NSBTYWx0ZWRfXzkJPXTSwWA1T
 uKjucaAjcaDtCcrBz7ONhVFJ2fCfk+2OLZHCzvtfHT6e2rHx0Ag00zxzMxB8Y25Zb8EoQxMmUt9
 2p0jMVhciEgWzeZprELCkxwn7ttmkfA=
X-Proofpoint-GUID: FiGgFotIaqldlsK2SAXJVYTtURnC9MEx
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a549307 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_CfiQXmXAg0GS1E_7KUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NSBTYWx0ZWRfX/vp0BFXYHDMU
 Vy+593MHHZtCuaOl4GrE+3Ytwg8OJcP0KRjvPdJh+7/MNH1YWQugUpITj1iShLDII6zsouCuOji
 +8aDsQefbx7WT72Ii2RouvC3oVpRYZBmP4RiJSJq6ZVgcuEjX+l4TJRVjvycnpg49ciTmtuGyNe
 8vUrLR2LFojThVCMN09C8jNHaytJcTAtOUncZZ1fjZ/h1IFCp1a0KbE4puE91VDBOIitEQ9dEAp
 5iEv3WA035Ze9Yg0doEHjtJKoDONJi8XrIm1AT/OAEqgF+6nj8flIxNZRlij4ml3qIbFTsJvYtP
 cbv/FuaUR3ocLv92e7/SpLPRneaMq9dqHAt+0FfwcpXmiKWu+9dQr7IEDHg5wbNSiImsSj/kM2q
 d7Ofnjlm0bg6SrATETyN+EvSAbKtdVlpSq3K+2jrrb6eB8unLJbxytADslyJhPfbu3vKtnsB7CM
 3yIh1SLkcdBYBQwQlyA==
X-Proofpoint-ORIG-GUID: FiGgFotIaqldlsK2SAXJVYTtURnC9MEx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118653-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mhi@lists.linux.dev,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C8CB74827D


On 7/9/2026 11:49 AM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 04:07:38PM +0530, Kishore Batta wrote:
>> The Sahara driver currently selects a firmware image table based on the
>> attached device, but it does not recognize QDU100 devices that expose the
>> protocol on the SAHARA MHI channel. As a result, the host cannot associate
>> QDU100 devices with the correct firmware namespace during image transfer.
>>
>> Extend the probe time variant selection to match the SAHARA MHI channel and
>> associate it with the QDU100 firmware folder. Add a firmware lookup
>> fallback for cases where an image does not have an explicit entry in the
>> device's firmware table. This allows required images to be provisioned by
>> the platform.
>>
>> This change only affects devices matched on the SAHARA MHI channel and
>> does not change behavior for existing AIC100 and AIC200 devices.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/clients/sahara/sahara.c | 27 +++++++++++++++--
>>   drivers/bus/mhi/host/pci_generic.c           | 45 ++++++++++++++++++++++++++++
>>   2 files changed, 70 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> index e339c67e236af271645ca81cc517efd9eead87e4..9adbd84859073d8024ba2a5fcfa33897439d6759 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -189,6 +189,7 @@ static bool is_streaming(struct sahara_context *context)
>>   
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>> +	char *fw_path;
>>   	int ret;
>>   
>>   	if (image_id == context->active_image_id)
>> @@ -201,8 +202,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   	}
>>   
>>   	if (image_id >= context->table_size || !context->image_table[image_id]) {
>> -		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
>> -		return -EINVAL;
>> +		if (!context->fw_folder) {
>> +			dev_err(&context->mhi_dev->dev,
>> +				"Request for unknown image: %u (no fw folder)\n", image_id);
>> +			return -EINVAL;
>> +		}
>> +
>> +		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/%u",
>> +				    context->fw_folder, image_id);
>> +		if (!fw_path)
>> +			return -ENOMEM;
>> +
>> +		ret = firmware_request_nowarn(&context->firmware,
>> +					      fw_path,
>> +					      &context->mhi_dev->dev);
>> +		kfree(fw_path);
>> +		if (ret) {
>> +			dev_err(&context->mhi_dev->dev,
>> +				"request for unknown image: %d\n", image_id);
>> +			return -EINVAL;
>> +		}
>> +		context->active_image_id = image_id;
>> +		return 0;
>>   	}
>>   
>>   	/*
>> @@ -870,8 +891,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>>   
>>   static const struct mhi_device_id sahara_mhi_match_table[] = {
>>   	{ .chan = "QAIC_SAHARA", },
>> +	{ .chan = "SAHARA"},
>>   	{},
>>   };
>> +MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
>>   
> This change should belong to a separate patch.

There was a review comment from Jeff(v4, patch 3) to move to this change 
to the patch which adds QDU100 support so that it doesn't break bisect. 
Please let me know if i need to move it to a separate patch altogether ?

>
>>   static struct mhi_driver sahara_mhi_driver = {
>>   	.id_table = sahara_mhi_match_table,
>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>> index 391ab146f501c6ce1c81f6138f7c491a49c2f264..82e41632afc555a53dec3d8395558ae039b33bbd 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -300,6 +300,43 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>>   	.reset_on_remove = true,
>>   };
>>   
>> +static const char * const qdu100_image_table[] = {
>> +	[5] = "qcom/qdu100/uefi.elf",
>> +	[8] = "qcom/qdu100/qdsp6sw.mbn",
>> +	[16] = "qcom/qdu100/efs1.bin",
>> +	[17] = "qcom/qdu100/efs2.bin",
>> +	[20] = "qcom/qdu100/efs3.bin",
>> +	[23] = "qcom/qdu100/aop.mbn",
>> +	[25] = "qcom/qdu100/tz.mbn",
>> +	[29] = "qcom/qdu100/zeros_1sector.bin",
>> +	[33] = "qcom/qdu100/hypvm.mbn",
>> +	[34] = "qcom/qdu100/mdmddr.mbn",
>> +	[36] = "qcom/qdu100/multi_image_qti.mbn",
>> +	[37] = "qcom/qdu100/multi_image.mbn",
>> +	[38] = "qcom/qdu100/xbl_config.elf",
>> +	[39] = "qcom/qdu100/abl_userdebug.elf",
>> +	[40] = "qcom/qdu100/zeros_1sector.bin",
>> +	[41] = "qcom/qdu100/devcfg.mbn",
>> +	[42] = "qcom/qdu100/zeros_1sector.bin",
>> +	[45] = "qcom/qdu100/tools_l.elf",
>> +	[46] = "qcom/qdu100/Quantum.elf",
>> +	[47] = "qcom/qdu100/quest.elf",
>> +	[48] = "qcom/qdu100/xbl_ramdump.elf",
>> +	[49] = "qcom/qdu100/shrm.elf",
>> +	[50] = "qcom/qdu100/cpucp.elf",
>> +	[51] = "qcom/qdu100/aop_devcfg.mbn",
>> +	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
>> +	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
>> +	[54] = "qcom/qdu100/qupv3fw.elf",
>> +};
>> +
>> +static const struct mhi_sahara_fw_table qdu100_sahara_fw = {
>> +	.image_table = qdu100_image_table,
>> +	.table_size = ARRAY_SIZE(qdu100_image_table),
>> +	.fw_folder = "qdu100",
>> +	.non_streaming = false,
>> +};
>> +
>>   static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
>>   	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 2048, 1),
>>   	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 2048, 2),
>> @@ -1399,6 +1436,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   
>>   	pci_set_drvdata(pdev, mhi_pdev);
>>   
>> +	/*
>> +	 * Provide Sahara firmware mapping. Sahara consumes it via
>> +	 * mhi_dev->mhi_cntrl->sahara_fw at probe time.
>> +	 */
>> +	if (info == &mhi_qcom_qdu100_info ||
>> +	    (info->name && !strcmp(info->name, "qcom-qdu100")))
>> +		mhi_cntrl->sahara_fw = &qdu100_sahara_fw;
>> +
> Why are you adding QAIC MHI controller config in pci_generic driver? This driver
> only handles Modem devices.
>
> - Mani
>

