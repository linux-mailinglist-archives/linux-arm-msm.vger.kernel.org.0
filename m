Return-Path: <linux-arm-msm+bounces-92277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L/ZMYHZiWlUCQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:56:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3BF10F3CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2510A30065D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 11:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77A5371054;
	Mon,  9 Feb 2026 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wdo/cyrK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gCxjwglR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49FE36F427
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770637171; cv=none; b=G2clc4jo0AFBNfUp8WEyZHJGnAZoDwNtY/xi9Izr/X4mnptKtohJMm4l4sPdp5hSmAlEp7djyTymXU3jkct4eHNDbiyUAHICXlCwqrlwQWjjWpR0o2wLRJYlc7ADpxdrQyz3+3PdKE1d/WHwGpWvmAPnSwxoU7/aZf9uxunk4oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770637171; c=relaxed/simple;
	bh=4J0kNZ9S/ZTgiC5YszwNYtfKvNYRZjPTyzQ08poZYsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIDVfESeNzYlzR74cdOMtStEFcYnSZC0YU77OGRR2bQi8flprLuhp7e1eC6AWhy0yVCGdV+QlsgSBKO7VPJEmk8P4j1dJRut6ZFjJuqyK6QY11y2BwYp/cReHzYNQ8kn5NqO5QHy3bNfIxYvhacazQc94baNIRcW5IR/W5kPG/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wdo/cyrK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gCxjwglR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619Akj3d3699944
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 11:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	28W+az1QyWC0xTm0GQ3A847j978F1wlTyJyBCXmKqPw=; b=Wdo/cyrKFjn+c0Wr
	UMu/obnvcz4bDWbGrKTBUevHGfQ/1BKuK6giViQfBY2uvI0QMUwS9VYCwmgv833e
	a/u+23Sj5XgQbiDdORZsestoKUlqnch6imEQ/2Hd21WNeN+00fEoiYj4C3Tx6eKW
	UhEfbQR20Na6oC/PoCxbRpTK/KLjj3U16kFo83nLXGVhYruwDJrpn1NxEV3RU0I6
	+3F8wbKrevN/vQjd1VxvSwz6M11wiwIbIIUEzGRe32vTGEidGX64RkoLiJ02tMp2
	7gkPjy6v3LFiyrXKvsZjKH615lMIeTVzI1X4RGsWbQjHFaTu/vHNQY0T120qloEa
	lVTmpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7e4m852r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 11:39:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c533f07450so135801985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 03:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770637170; x=1771241970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=28W+az1QyWC0xTm0GQ3A847j978F1wlTyJyBCXmKqPw=;
        b=gCxjwglRXfhA/I6FsWHAFNjxg4uGD39RwiUt3egqXA6pu8B1fCdnp9gDkpxN0rf1/R
         Qi6fmtdHI4fXeyrzM0gpTCp1Ik6FXuogcXINZEiI8KHeCDKFPzY0Vh+bjkIDSAicCx8s
         r/vu1jZk495NpuWD5KhvN5YP/ZFIUV5PwQgAGad3Gy9wBl640qfki65GInCTLjfNqdFk
         UNCsban8Es2LJwkO1xZAPpH28TRcysIA0a/HTKlThBp1uRyO0fudfvy6Tr7Erjk03wGv
         a5PznTk2exVjqxK6b+cvFIox6aFIrXgGIJu2eODE4GNSslciiNHR8IQvCjYf0eKppk2N
         +S3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637170; x=1771241970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28W+az1QyWC0xTm0GQ3A847j978F1wlTyJyBCXmKqPw=;
        b=Oup5KsGz7EzW10KsSJ0VUJMSjgC/cULmoG5EmuDTCXll1DhNW4qq8RN9O2RNr1H5W9
         k77drd/G4Q5VGRtSj3zQf9Ftxk9fgHHoxYLOmQZVo3gGMotI9bJjGsmPouBGtuqAqPC9
         aLhhIPJ19BA2KsKDZPgwdVo8ee5MRU3ZcW0NqBt0VYfocjr8gNIu0RYd/xtDUHDw0HDx
         ABc6Z7iKxMvM+4aARHMShdTp53vkaEc7JaqYpDn+LT6CrmhHvd7xksBriBB1n6qKDv8A
         x/j4Lq3PyXi99ldekHlQeoUSwcd9FewT2LJNgjbRfcdk2Wh9qbNT3z0UD8+zOP+u1Ea6
         LyBA==
X-Forwarded-Encrypted: i=1; AJvYcCVaTtAAFaKPOV1faboXbInwiqm2KQBvGXiju2e/VqqFTAYN8SHQfn+tcTF0cNXxLZjfo7Lv+5VfH1vz/nIW@vger.kernel.org
X-Gm-Message-State: AOJu0YxgPmdQEvyg+cldctgFV+Utqr7BbVhbwcCg8SeBXmo7h/H0vT+V
	Qgq/E5YqQiSk6rw6sTYihNMt/CA3YUBp7VMXpNwG5eZwjQeBTXlr7u9lZ5eVyELoqcA8LIrVk8h
	Wq1ATUjkbSsGWP1QCenRCX6ndNzanMH7+1g8CLNza1+Kxy7iczEpT5KtcCFp95+5UpWeM
X-Gm-Gg: AZuq6aKrIGQPRt96CLaT2eFSRUdDJau6b2G7NVnB0XMHP2i4IbKD6unA3ykwd+rzZ9t
	PB4nFR+7Il5vpVs2Z3LTeLdsyXjb54NZbwE5Z+bzdYHam0o00dukLTRJDqbThBMUOxVP+rzq1M8
	3vByY+t9Qs0vO1MslQFKB+kR3xpbpynujPeTU0kGH/i03wZSHH6o5TUOpdQcldf5Q97tUbDHD5s
	wpi96abewqcg8Sjs62ampWxjpzSj5HOOy5zOB2sFu4nOImqgq7adEwNsE7XWoTsfkiOHF8GMdzV
	Guubc26imEAoS1KVOA78bFK0ET9jd49Eu44+K+2b9T7CYle15zAWqTtE+y2TuiRuiyLjk+GrCrX
	37EUINo49ie7r9wt+70hEXViT60wk+T1Q/2/N3R/iiFhCRepEmVqcKF1jbPUBlhQLww8=
X-Received: by 2002:a05:620a:25cf:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8caf1acac31mr1159031485a.9.1770637169785;
        Mon, 09 Feb 2026 03:39:29 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8caf1acac31mr1159029885a.9.1770637169356;
        Mon, 09 Feb 2026 03:39:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7dd397sm379194566b.27.2026.02.09.03.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 03:39:28 -0800 (PST)
Message-ID: <5f8e2fe0-02d4-4373-9895-d4f98f1a1fcf@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 12:39:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hhZdHio8W18gvChyEhH456lccg5lzsZw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA5NyBTYWx0ZWRfX5s0YeFYL5E8H
 rDCGH6ZZrAgqYOEWsqFrxWoFOLZYGjVBFm+ISjOPvc7J8Cbmg6GCt2m8lDQser42arw/oxDhYYT
 UvNTzS0C40BLlSqLn8YGGab/7exhmRTQVdH4FtsBsCNS2nSpsTGvf/nkdoQJWr/bfLeejq5BUsU
 ebAhRbCnXwSZCkKunVkojjWDIR6wzqlxHWIvp02ajPeXTNQXLF4sKl3JFgKHBg7jw5F+tlKTqyK
 gX6nMEaxXihuAjLmrWDg+NQLTxqIvvwaMilSjz5oDXMHr73PlYGcQO084Pw+19dwMgBaFZWNdTt
 fssjS7xYYfeKZV99gXxWK7D+zhNVYZeZ4cN2XEdbqF80gYy7aTub3Ev14R+lYAGy32dRmrR+JYU
 GzVBWaESE899+I0lE5GQsS+JbYPi7eW0rNp3TlhVwAD9gTBdTCPDnveBavfCu3oKXYU2OMYpgYg
 SLQx4ndLo457fE6gKgQ==
X-Proofpoint-ORIG-GUID: hhZdHio8W18gvChyEhH456lccg5lzsZw
X-Authority-Analysis: v=2.4 cv=WecBqkhX c=1 sm=1 tr=0 ts=6989c772 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=nukjtOj3hmPST429q9MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92277-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C3BF10F3CE
X-Rspamd-Action: no action

On 2/9/26 12:34 PM, Dikshita Agarwal wrote:
> 
> 
> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>>> opt‑in by specifying a Gen2 image through the Device Tree
>>> 'firmware-name' property.
>>>
>>> Based on this property and the availability of the referenced
>>> firmware binary, the driver selects the appropriate HFI generation and
>>> updates its platform data accordingly. Boards that do not
>>> specify a Gen2 firmware, or where the firmware is not present,
>>> automatically fall back to Gen1.
>>>
>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +int iris_update_platform_data(struct iris_core *core)
>>> +{
>>> +	const char *fwname = NULL;
>>> +	const struct firmware *fw;
>>> +	int ret;
>>> +
>>> +	if (of_device_is_compatible(core->dev->of_node, "qcom,sc7280-venus")) {
>>> +		ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
>>> +					    &fwname);
>>> +		if (ret)
>>> +			return 0;
>>> +
>>> +		if (strstr(fwname, "gen2")) {
>>> +			ret = request_firmware(&fw, fwname, core->dev);
>>> +			if (ret) {
>>> +				dev_err(core->dev, "Specified firmware is not present\n");
>>> +				return ret;
>>
>> This is fragile - if someone names names their gen1 firmware something like
>> "myproduct_gen2_vidfw.mbn", it's going to match..
>>
>> Could we instead do something like the explicit format checks in
>> venus/hfi_msgs.c : sys_get_prop_image_version(), based on the **contents**
>> of the binary?
>>
> 
> I agree that checking for "gen2" as a substring in the firmware name is not
> reliable. Unfortunately, we cannot
> usevenus/hfi_msgs.c:sys_get_prop_image_version() (or any Gen1 HFI query) to
> probe the contents of the binary here, because Gen1 vs Gen2 have
> incompatible HFI protocols—probing a Gen2 image with Gen1 HFI (or
> vice‑versa) isn’t viable in this path.
> 
> To avoid accidental matches, I can switch to an exact filename match
> instead. That way, only the specific Gen2 image (for example
> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
> want to use Gen2 can opt in by naming the firmware accordingly.

Can we do strstr for QC_IMAGE_VERSION_STRING on fw->data and rely on that?

Konrad

