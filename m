Return-Path: <linux-arm-msm+bounces-97990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEyEEeM4uGmpagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:07:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C67D229DD14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BD3C302EF8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 17:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5743CFF7B;
	Mon, 16 Mar 2026 17:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PpJVhDc0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NlAsuBo0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B983CFF61
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773680842; cv=none; b=SWXXKL7zaHUFwkTWdZEGyjn3IW6Jgc3PR+7wHvQocLcXunr/eKcV1fWcmvoVXxjfb+utJtHSRjUp42qTgxD3oB0s9/J4wXIu/YHJ7itVTozK3wywnwe3zDnUgwd097UuF6NFdhAS4eRF8g39IKudvsEgNiTY+cm6PFz/3RKwA7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773680842; c=relaxed/simple;
	bh=3Mogh2U0/iA6Ose2HBYTR0xZeYXsqplF/lZI95BMgXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cKXUVehIqS2y0LHjRGm1DjUODZ6/1/65wRN5EHDQdWZh0zWOo3HpxGD9z521QRPPizlDTfuNU4GjYqJfdLZrD/bdNOWmF4i7EgRipyeupzX+LMagtCtBuOlNlFmR9vmWiLhu8Bu53vfxi90QidLWlfkRWSzqLKAtCLcIOJ3NQMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PpJVhDc0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NlAsuBo0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GF4V8K795536
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDEvxOZLlq6f31hKlp51kGtXwhLqo+UTN8SDiRaUXi0=; b=PpJVhDc0gQs3b6i6
	ZR1lE0tgnjfugzPTJ+feZb5ty2PZloJrIoHci6DLhH9O1ytzb3XF5J/9mB2AhDpg
	Hcpbt2b6FnnhrtelKCrOP2zmch2iiPGJtVLZf2mAi2sEFEB8S/rGeKkrbiVwhWPx
	ZSLSbFb4LQ37Dk72Ij2ny7lAObCL9ZyvZILGFUOFXQl8NXNqAmFXRVex2z14FaPs
	t8oGnLaBTZV3QqqtyH65kHD7gy8biGDVgkxXSYCaRpeenYUT+CvHipd2cesplN26
	wbHYmhb+Zs/GzGaRpLSd4R6aCD3dKlvg+XsG7BOO1z7erDx9HAQoPr/1/OlOeZVE
	e/63FQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm6d0fg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:07:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b056b2f0cfso17900035ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773680840; x=1774285640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDEvxOZLlq6f31hKlp51kGtXwhLqo+UTN8SDiRaUXi0=;
        b=NlAsuBo0Uy5e7y3tipr0G7Jb5e68MsHomkfShkEnNvn/Qnq1nBw5QihgB0vnJDaqdZ
         +LcseYi10F9tn7pDM531swj5oJWFTtM/E0L9gXp2HWc6UToUu7RjikqjtpulsL+xS+oD
         2ivg+ymWsqmPW1xRpN9zIjJkFmRzww7Cw0f2yqZq8z+GHwx/m8LdSO0kkd0KECjYmDSP
         2hNDcDmTLqQinTBwL6DVxiCMZ6ZQhNuhsd2Uy7dkGGqUWE2HQf3E2vW1oO3QLgI+tiiL
         U+h2VOboQS/tz+kOmPm4YSEOVrUAuxj7NI0lZmxZzT0NI+S1msH/f8qV5T43YOVPWb7W
         HmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773680840; x=1774285640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDEvxOZLlq6f31hKlp51kGtXwhLqo+UTN8SDiRaUXi0=;
        b=Q9iwf4S4+z5w9xgzll0KH0AfasvJJUdq9Lk73fNGmextJsVUbN68+g2Z/GNAbt19nB
         WKaE3LfkbJ6rjeQj5e7fg+kqrQqmI+Q4/q7xcNJq7vvCWbxWttccBBuSnagQ+ftDX/ve
         hyyVCerCrgLco2fhOsy2BkN6n0nDAbrpK10R+aFw61iQqxPCI8Z9vL7fc1EzZCjMWdFx
         JwC8sebhnzN54iPIIHClg9tYIgaXhkJJRAjb2m9GUSZw5xx9oHK+qS313ZffOTVStfbU
         e6gsXySebcu+Hy+bBk6qajrlPYyNziE+xEz9nqEvm+o9WaQBgIo7oQorMhMnX8LBOnHn
         AhJA==
X-Gm-Message-State: AOJu0Yw7G2Ryt04lWRZcXLDd4sfuHWe2LWWMtV9jevBkf3QI2NU40e/3
	NU7Yive/Ccg+bk2hCfSauCwvXd4x3XrJ4GUNg22YoKnXUJ9qay2tvVYUpF6R3J9gLzbED8DSoha
	RiUGt96ES0Dk01dZl+0AfCojIssFfdWteIKQ9Ukqibr+BdhDe//DOfgRPV/lDZA1FUzOV
X-Gm-Gg: ATEYQzy4QQ90vOaQHc9pJP+2nsslRqkEyCrlIEfRgGwBIabaBFcPAXJHumXFYOoo/JK
	pY8UYEWi9KV8Mr7rurdFaDEzGBf/tEkgHSFwy1sSQLP+cS5StydaueNaiEGyiWVZ6ZBiYWCqflp
	s3SCirwJJYPtACfDZYmQylzit7/HrOwRdXnkp35D3ER9UoDvcKISEB1k6tu2JbkBAwwLemmkyMl
	tI32xDaKKCQvUR27QiJhb6EugrC701NYyP3+IS86pcpZFgG8FrN2DI6Yuus54CqRoE8hoqDlghy
	NrW6Lgx62lPnBj1Stc7AYp4WYoCsdCawFe3WeYU/yWFWFqjO2ug4phMNxGo8l6whXVaWv5MI0wt
	3XmAxAteMnBwJQOrwVJ94r+mwrpcK/3s8YZSqy1cTAA==
X-Received: by 2002:a17:902:d54b:b0:2ae:8288:9122 with SMTP id d9443c01a7336-2aeca94050dmr155868495ad.5.1773680839815;
        Mon, 16 Mar 2026 10:07:19 -0700 (PDT)
X-Received: by 2002:a17:902:d54b:b0:2ae:8288:9122 with SMTP id d9443c01a7336-2aeca94050dmr155867825ad.5.1773680839040;
        Mon, 16 Mar 2026 10:07:19 -0700 (PDT)
Received: from [192.168.1.8] ([101.0.62.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8233e1sm112823905ad.71.2026.03.16.10.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 10:07:18 -0700 (PDT)
Message-ID: <417e71b5-1956-4841-bfb7-4116d20f3dc5@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 22:37:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
 <6eb3a173-c364-431f-93e4-7bbb7a32431e@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <6eb3a173-c364-431f-93e4-7bbb7a32431e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c7+mgB9l c=1 sm=1 tr=0 ts=69b838c8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=+2ldRcY3HLWus9HqRSG52w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=tYnmyoo4TD5ZbBYe2wsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: MA5kSiNW84IYdLZIeOlUQvGKGxKaF5-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfXze5o3tgxxfoj
 3cbPlSJmqS8bXZ0P90RwVYo2vwqU2OR5npXR07i8bDsPjYj7XJLbOC6TJR1q94PO0iP2WZgsd/r
 EtWMf+r68i0jFDTww/2t/k7vJRmQx5IF2Yja3MA1zc8xQHxnoM6Nbfum9PoXkc8aSWz4u/bOTLl
 oDUckB2XLv7Tscajal6m0BxFTwM1Sh6yf+4W4MExrqfKizaz9S/zsFk1Xb7eS8iupu46ReTfDQM
 qlJSjmxm08K5ube44l0sZ7+SuThiRVt7OI+El/A9okcsgrOFu4n34BfERU4UNueMzdLj2sjyFqB
 AkN2gK3PVnxyeLxfW5btcO8DdL9E7LXO1j7cT8fvpvNoAb4H+qTczh1Dv9lWaXVF3o2WmpfXUx2
 IlDoePyPC/YKLnxZLza3mInWCpisqAQsUyC7zWTUf1dfCSWtpHFqcryDztqJAmGxyeIF3v9YuOt
 Z8nSvvGAuFXj+kulkRg==
X-Proofpoint-GUID: MA5kSiNW84IYdLZIeOlUQvGKGxKaF5-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160133
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97990-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C67D229DD14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/16/2026 3:57 PM, Konrad Dybcio wrote:
> On 3/13/26 11:29 AM, Anvesh Jain P wrote:
>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>> reference boards. It handles fan control, temperature sensors, access
>> to EC state changes and supports reporting suspend entry/exit to the
>> EC.
>>
>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> + * ------------------------------------------------------------------------------
>> + * | Offset		| Name		| Description				|
>> + * ------------------------------------------------------------------------------
>> + * | 0x00		| Byte count	| Number of bytes in response		|
>> + * |			|		| (exluding byte count)			|
>> + * ------------------------------------------------------------------------------
>> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
>> + * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
>> + * |			|		| Bit 5-6: Reserved			|
>> + * |			|		| Bit 7: Data Valid/Invalid		|
>> + * |			|		|	 (Valid - 1, Invalid - 0)	|
>> + * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
>> + * |			|		|	    (0 present, 1 absent)	|
> 						     ^ huh??
> 
> I see that it's not currently used, but I think flipping these
> bits would make it easier to comprehend down the line
> 
> [...]
> 

Thanks for taking time to review the series

The 0=present encoding was taken directly from the EC firmware spec, but
on closer inspection this appears to be a typo in the spec — the correct
behavior is 1=present, 0=absent. Will update the comment in v5.

>> +	default:
>> +		dev_dbg(dev, "Unknown EC event: %d\n", val);
> 
> Maybe dev_notice(), this would be good to log
>

Agreed, will switch to dev_notice for unknown EC events in v5.

>> +		break;
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	u8 control = enable ? 1 : 0;
>> +	int ret;
>> +
>> +	ret = i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, control);
>> +
>> +	return ret;
> 
> return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !!enable);
> 
> [...]
> 

Agreed, will simplify in v5

>> +static int qcom_ec_resume(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	int ret;
>> +
>> +	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD, EC_MODERN_STANDBY_ENTER);
>> +
>> +	return ret;
> 
> In a pattern like this, unless you have some error checking/logging to
> do, you can just return directly
> 
> [...]
> 

Agreed, will simplify in v5.

>> +	ret = qcom_ec_read_fw_version(dev);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to read ec firmware version\n");
> 
> "EC"
> 
> [...]
> 

Agreed, will fix in v5

>> +	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
>> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
>> +		char name[EC_FAN_NAME_SIZE];
>> +
>> +		snprintf(name, EC_FAN_NAME_SIZE, "qcom_ec_fan_%d", i);
>> +		ec_cdev->fan_id = i + 1;
>> +		ec_cdev->parent_dev = dev;
>> +
>> +		ec_cdev->cdev = thermal_cooling_device_register(name, ec_cdev,
>> +								&qcom_ec_thermal_ops);
>> +		if (IS_ERR(ec_cdev->cdev)) {
>> +			dev_err_probe(dev, PTR_ERR(cdev),
>> +				      "Thermal cooling device registration failed\n");
>> +			ret = -EINVAL;
>> +			goto unroll_cooling_dev;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +unroll_cooling_dev:
> 
> For those cases, one would usually add add a devres-managed version of
> the helper (devm_foo_bar()), removing the need to repeat this in the 
> driver remove callback as well
> 
> Konrad
Agreed, will switch to devm_thermal_of_cooling_device_register in v5

-- 
Best Regards,
Anvesh


