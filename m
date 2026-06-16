Return-Path: <linux-arm-msm+bounces-113483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zJ4LCwm9MWqQpgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:15:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0AE695633
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:15:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q2oPYf+j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hbXPXAjZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113483-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113483-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C281309408A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 21:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1028838C427;
	Tue, 16 Jun 2026 21:15:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB543A9618
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:15:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644514; cv=none; b=WGJUN+3dTY/RNdX6D/QM5ilPR9eebqAk+8vWK60yyKNsT7gES2NRTiJxuCHRY8DVpzNLzZeLEs5BhUUZIvaMEgQ1nLO1bUU+FZIidAV1Js3bd3LwnIoW++p1dxxq0VqXQevq1C2Z6hfsznmiWNo9LkLi8HDQfwaoaCxod0aUktQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644514; c=relaxed/simple;
	bh=9cJfNH0ziEviy5OuCjK7Bi9q3ur/HL+ImJl5v/T282c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFQ4f7KNtqCXFiO/5eqojiGXj6PelPu8EOips9kbN1JoAOQwA7vN0pEic/KQguB2CNF73graXO01ead1eaa2bjWHejDB/eI69EocLQwAzaHMR6L8ntOO5csqKVDThngBwRxn4DoanhWIhCqLqw79A3KwgzcT2dgNU2qofVTwRcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2oPYf+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbXPXAjZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOls3140338
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgOZGAVRtcof+wGB0xB9WSeFloGw8arPsNKl8QzdnwA=; b=Q2oPYf+jo1OvqJTw
	32YbeVDpke0fD6J3kNMfzmSzeD788D6pocq05EmXvXt0Rd/og22w3ueg/tKQpMza
	IzGGHORUG35ejfjyPofnYwOQVNW4XY4vLATf+Ce05VjNd6J6/Hy/K89MSUsgsUum
	xlHDXDlX4aZ+t74kQ6McsFoQpP9FfcOJXv58eGmkFPEd/CRfDeUsPU6fJFyXQnWn
	QZ7zfvvUDKXW6QCc7qD9bFcLrNs63W4bm6Q6rC2lX8BHbGbwjjBRh7zWnnDZXG72
	rAbzAXhzKbx7O8L375+oRJ1XOHnQXl9cTFmpCxeY+XAoVkJQSbR8v/YUByIwA2li
	+zGIOA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ysv01n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:15:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso6536799c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781644511; x=1782249311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgOZGAVRtcof+wGB0xB9WSeFloGw8arPsNKl8QzdnwA=;
        b=hbXPXAjZqAQzemdQEN/KroCrXEJpPebp4Zd2V7FRlwgJ0gP9BChlkGHRgZhERY0KSQ
         yvDe2Ie3uTiclf0tLFp6lXv1fpg8U/19Ds6s43FgD3Tsy7PHjKFccfgomaKl8l+kdetn
         S/OC6Zjgyg7CvhsauAMVGYYF3ninUuwcTb6GykSb5053F4B0Oqb10zdd/mCa6bqYom9N
         sXJ0hAcQmRnLPMILiCpOn3UOhkmnTwo4MNnOcYsKX0rmAIriUWeCL6q37oKM73TukXPR
         07GGgMOaHQPoqrUVIfqZhNj9fZBg+gMt9GFl7E9nIsb+BTfVufE3rcvdD8zHL8t2bYRz
         LgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644511; x=1782249311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgOZGAVRtcof+wGB0xB9WSeFloGw8arPsNKl8QzdnwA=;
        b=Zw4tEs8KBzIhtyHCpoR8tcrQQ1igEwd7qVDGeIXQvh8VbDOQIypfKyL7/kI4hBsUwT
         giN7LY+EvNcuKGEcSMshq9x67LvX+M71bUhdaFDRuKa07Vy1/rkdIyRFYtlkXIcmKM6o
         VG6vxwXpS8QoF1PHlCrMkd5Vd9JkaArCFs9gLxNBByGMYbrXADeA4eI6tS+/UqvxJUNo
         yuHGkba2MpIznZ27UqZ5YIJo9XPdUtSiJqjFKcAjnj585XxEifiNCQ76bjEkd4wPqcor
         Rr1zfhqLV0JtNCwD+kn/OZIubF5HYU6BWW6hv3Nq+n0npJ+SlADj3WQqnFssT1AC0QMa
         10Ug==
X-Forwarded-Encrypted: i=1; AFNElJ99dDxp7PDtgSsXA0bRfIcO1Nj/WgrAWxJkDRVwIV+UjFRyCN8Myj4pUzISnlRcTYe1HzTtEIXMf/iSzGPR@vger.kernel.org
X-Gm-Message-State: AOJu0YxBFqIBa9oKxisUslcrQb1g1b0UJAZg/Rgfx3viG6LDoC//JIsb
	mMzgnLzEyeNIhfV22Ft5pZqK+g0ut2cBO9SRwOFK6uYo6V8blQhIG/IPfRqNM8bg8vL+GFimk19
	n3djUJAJvOGhnGveZwdEgSBFLGTi0P3BT1+bW9HojonUsox1X28/yN1B5xt4CQ717bKsW
X-Gm-Gg: Acq92OE/xc8EX2/flxNumURjQvYHWKplN4+XsDeTpR4kRTHcONNSDMxgd8he2nonjTJ
	p4nj1nrBzOVg4FTXmwtcFAukI0tvtCAUIWhBz/am64gnceWxz97SBMojDec2DgNqyjhpnGEk5mW
	+JjgvjR3f96QIN9wgp/PkdJdNQMR2nFa/KzYMm5YdNSkQDRhIRyrGiiLuAdP9BRoHAIS/+exv35
	uLQcR4EXteNCfMKmaPIA9W1oMug+Y4LByC/Rh1en+oGgzcS6G0wC2P/zXeaPMy5xBe0Agu8e1az
	QzMWuuRYm5MEpMI7WBSYztgK/uxP406YHVw/EdJOEQFkEikHHGgA9C2sDrNPffnjy3Yv5WB0aeU
	X2WGKWJKa7ez1ohPGXT8yZFTvy1ixej2g7mPehFGrtYIl8Bo+qPMAL7MHN3Dy/iu6x6IzyJjL+6
	nvvvwx7uD7Is4vIQ==
X-Received: by 2002:a05:7022:6b98:b0:12d:d972:b969 with SMTP id a92af1059eb24-1398f696275mr381899c88.24.1781644511496;
        Tue, 16 Jun 2026 14:15:11 -0700 (PDT)
X-Received: by 2002:a05:7022:6b98:b0:12d:d972:b969 with SMTP id a92af1059eb24-1398f696275mr381871c88.24.1781644510903;
        Tue, 16 Jun 2026 14:15:10 -0700 (PDT)
Received: from [10.71.190.32] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b97570asm14029259c88.12.2026.06.16.14.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 14:15:10 -0700 (PDT)
Message-ID: <eb50b45d-ad04-4da7-8cfa-6e1abb1ffba4@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:14:59 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_ffa: Fix NULL dereference in
 ffa_partition_info_get()
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
References: <20260611-ffa_partition_nullptr_fix-v1-1-ec2b7ef7e130@oss.qualcomm.com>
 <20260612-fat-energetic-hummingbird-8ddc62@sudeepholla>
Content-Language: en-US
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
In-Reply-To: <20260612-fat-energetic-hummingbird-8ddc62@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Xjh6WrubGkUh6y6XDI5tYKvUEyYeAQ8h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIxNSBTYWx0ZWRfX6S72JOqYtsuu
 mgHa4YDp+hLmmlbQKuOR7KIEv/3u4tmft/ZiIHnRu7HGg+vykFLmiPwEh79tde0DBPU8JsKDSA+
 +v+uAhAzFmwQpF7XX7jKzY7f/A3bfgE=
X-Proofpoint-ORIG-GUID: Xjh6WrubGkUh6y6XDI5tYKvUEyYeAQ8h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIxNSBTYWx0ZWRfX2LgZmwES5T5m
 CLjOLkZixJoZ5Ilp46CCRZy/w7c5B+S2RRV4se6FlGZsvhoY5UwSHQx/KJ0w9laET+SLxB89Dju
 qZ2rnNzoVVM45hNc1R6fC1003m6LULUt1iqrlM+8rI6o7fYSjJ83y+VmDnE6Q1yQSlviwVtlRn1
 UzPNgk7mQr6K1g0upDbu3Plm+MjyJPPTEZRF+IA4C0Gdm3UAnZrOxdQb2rkXnwxzffTy6/0USRm
 tN0N3I5fOzv3BIKXG1Cpj9VG3xS9PjwzAQlbmwtUKTshzxZaXt5KrqxCG8NnCZb7QzfvXB6kBgU
 30PwvuisI07Qxukw8UVllKyPw5AcgcXzaEvuoaQM+N9Pc+ywOVmzYfdzPsm8RDQEiWi/BFS4TXp
 BFICAw+FkoSDQpKQOZSFazZaIGfaHgZHLiJCm38d2ROaTiZCY1EFXAstOh+yacv+SSd3P/pfv7W
 nIb/EqdhA0MQwd8N/LA==
X-Authority-Analysis: v=2.4 cv=JJcLdcKb c=1 sm=1 tr=0 ts=6a31bce0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=l2X_Lv62_SrtoPT5pgEA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160215
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113483-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[unnathi.chalicheemala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:jens.wiklander@linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:kernel@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:satya.prabhala@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[unnathi.chalicheemala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD0AE695633

On 6/12/2026 3:55 AM, Sudeep Holla wrote:
> 
>> Per the FF-A spec, the all-zeros UUID is the defined wildcard that
>> instructs the SPMC to return information for all partitions. Map NULL
>> and empty string to uuid_null rather than crashing in uuid_parse(),
>> preserving the intended "return all partitions" semantics for callers
>> that pass NULL.
>>
> 
> Agreed on the spec part but not w.r.t the interface. Where is the driver
> using this call and why is it sending null or wants to extract all the
> partition information ?
> 

A developer wanting all partitions might reasonably pass the all-zeros string
"00000000-0000-0000-0000-000000000000"? 

>> Fixes: d0c0bce83122 ("firmware: arm_ffa: Setup in-kernel users of FFA partitions")
>> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
>> ---
>>  drivers/firmware/arm_ffa/driver.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
>> index b9f17fda7243..dd500fb81b79 100644
>> --- a/drivers/firmware/arm_ffa/driver.c
>> +++ b/drivers/firmware/arm_ffa/driver.c
>> @@ -1129,7 +1129,9 @@ static int ffa_partition_info_get(const char *uuid_str,
>>  	uuid_t uuid;
>>  	struct ffa_partition_info *pbuf;
>>  
>> -	if (uuid_parse(uuid_str, &uuid)) {
>> +	if (!uuid_str || uuid_str[0] == '\0') {
>> +		uuid = uuid_null;
> 
> I object to make it uuid_null. Below check is enough to check NULL
> dereference.
> 
> -       if (uuid_parse(uuid_str, &uuid)) {
> +       if (!uuid_str || uuid_parse(uuid_str, &uuid)) {
> 
> 
> I don't think we need to service NULL as valid argument via this interface
> as the callee driver needs to pass its partition UUID here.
> 
I agree with you, NULL doesn't seem like a valid use case.

Will send another version with your suggestion, thank you for the review.

Regards,
Unnathi


