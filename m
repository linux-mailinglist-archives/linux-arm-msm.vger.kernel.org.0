Return-Path: <linux-arm-msm+bounces-115125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oX6qJgl+Qmrt8QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:15:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AA86DBDC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:15:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mGAf+QEB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L8ZqI4hL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115125-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115125-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D2F7316684E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CED374A0F;
	Mon, 29 Jun 2026 14:08:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0A0375F97
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:08:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742092; cv=none; b=H2cyI/nlSDuIjFto52PVrOLBl7pa75D+ebn0zmaYje+YYEt+lLY5Rxnu3Fw27w6LldZP6LG/dRMgSipZ8arH6Lr2ai7haxhxL8WJg1IYt1Aqw8zIHwI9aMK6DXjx38v/HjV5ScPXusdDhUVxZdpsJHd7TEix1m2sjZmBdmfuVJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742092; c=relaxed/simple;
	bh=dURMrnEE+8FNs3YuqCUX3g5zorhiCWR/1suAQkUacBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/7aRNmuzWe69dZGJh/8YhQ7jnnJdhL50BUYSeclu2mytyPyO6n+6ShLtnMcyOBVV4HRBwuZ5p8bgUeJS7G/jmVlNyqPf5Xq4TzC6toR6xiUdqbq5bZOtCAR3lZ713MDeoLu0pW+avWsWQBVfPYDBpsFFWvgIn5WEBP4chuCItA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGAf+QEB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8ZqI4hL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKTV2656156
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29BbeCyRbqbccdqjchaSDPUWm7nWe/b0cApw/MAp8LI=; b=mGAf+QEB/iir+kCh
	P3E5qXLKQFPxq+r4EGx8J9emeMdynqNE2UsDG6rqIYtivg7o4773EPFkD0gxpU7G
	6sTK+8uUUaV3Ygy6qCZtPz4rBnMTRJnoD0evLk5zGY20YA3xy66z0+dz57N/OPka
	Zkbsr74mf5JSjjo3+k/YSoQt2YHdQBuLXN+xnydoU9wfe4cnXd6r07SK5Lu1da7p
	DvdQxODAGB40uSIltSiCRgRD0+mza3ua+62dbeCzZJXP/vQO221WBBWCZxnhOZEx
	SLuEXEP575Q7Ud9SnWpDjPtSGuYkgMmFOwnPWhQ2ZTaL8aDnxHJBwicEzP95/vGs
	n08y2Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7h5ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:08:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37c9127e316so2275669a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742087; x=1783346887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=29BbeCyRbqbccdqjchaSDPUWm7nWe/b0cApw/MAp8LI=;
        b=L8ZqI4hLvIcV7bdg22E7D/94d2ar2yap+6ueBJcn4S7xtS8Bf2w72sdLsXLkR94yJ5
         HUm02J8/ed6YmZs9Ac9ME8H9MMg9/nsDUfEhIWx7PUA/rcq0e0d8lI4r9AFKN0uXBjyK
         D7dQRKfdR5KArqa5hnooAp4O7v0LyUQHboUh7pbmSJExuByf6tUsgnrVCjcbcoBM0EdM
         X8mNTIWjMG5++RKVWoyXmWcYiLCVFfGn8qln4FegsSme1jy70I0q0dRe3RtPpxIOq6Jp
         ab8+15DTtv9m3QD1KkVmA6aOc0HC3yNyYK1J8Miv9xw6T3VwvRrF53R0UyATMLEBTNDg
         jMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742087; x=1783346887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29BbeCyRbqbccdqjchaSDPUWm7nWe/b0cApw/MAp8LI=;
        b=TTnAmgJbUsp++EIGns53UATPnLcKMIsFnQzeQcHdfGpCfd0feVZAzqt0gaH4jdxKPl
         cWekdDq1H29/e9yHv4o5nwv99ZEWdgMOIwpNhXp3aqgxPi1YU+WC9vzMCIyDwaCzr1C3
         zUGFSi9/Br/0tqPZMk2/V5IKkGz7nEGVUeF/EMPzlYsWmKKRGdy6NkmqUNj5cptnjr1B
         7d8nF8DBv333r2C5jXbrV7Yxd2Vkpx1sizFgLKpBsxnPqg7huZPsw3x9BePjoJDFQt33
         /av/S6HKEVc5FMMv74F13D15n17Yk9LhsAYJowi+5p7ni0n+kS10Or+9AdCqcF050D9/
         H7Aw==
X-Gm-Message-State: AOJu0Yx7fWtTN0IqwixgO8U4s+1upTDQ1o8BCqiU/7n4OjDswjkytRsj
	9YKzh85QmVqPlHBm+GMhAElBX5nnggBnPQYjnQZIdsG+0vPQcwVjov9nIQ8Q+KlLJapNs2/diUI
	h4ur9EWdxqS9fotmQmaGCvQMJ+DeUnEAPY+flonyQFexNXxAFcvaWA4OZKU6JYWo4MBPF
X-Gm-Gg: AfdE7clIotRGL57big6rlLrTWT44qf0j7p/dEUNOD4jW2JWUbIsyUd/AQ75JNJLishJ
	USWI/1weUOHifU9t1qiyqeMc9rwWRszwFMWhAKwBLKhVqXLMcPO2kUbNZ9sWfpXOo+z7PfO+wfo
	nOFrxu9U5v4kw7ZoYBjS42pJWZ9TKs0HGV4P7iJqy4D3mrE3cAiQcl9q1jcsLdxF34J8o/JKT+3
	VPnzGYC0qY0NzfBusjveXXdu7cFo3o/rwRZcIXTRlNDZG03G3uOM9UkvwfmIvlpSwsqVX57aOTv
	skziDrNvK/U4NmpPgOKWrYayeULwbhMMclhAP3ETdFNeLMPbGbPQH/q8MhxSAvNXEMr3OtXzvDB
	Qll2x4Yleyvz0Nfov+r71yiVFvlJV6J+jDn80YhObnlTAkcYHXmZOwkNdrvEJqYUnDip2GhHvTA
	==
X-Received: by 2002:a17:90a:d007:b0:36d:8e49:d8 with SMTP id 98e67ed59e1d1-37dfa1cf815mr13778697a91.15.1782742087294;
        Mon, 29 Jun 2026 07:08:07 -0700 (PDT)
X-Received: by 2002:a17:90a:d007:b0:36d:8e49:d8 with SMTP id 98e67ed59e1d1-37dfa1cf815mr13778685a91.15.1782742086832;
        Mon, 29 Jun 2026 07:08:06 -0700 (PDT)
Received: from ?IPV6:2401:4900:1f29:f628:449f:9d99:35eb:4741? ([2401:4900:1f29:f628:449f:9d99:35eb:4741])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3b657b3sm9224552a91.15.2026.06.29.07.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:08:06 -0700 (PDT)
Message-ID: <767b5d6a-ed4c-4cd3-bcbf-44c4f24325af@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 19:38:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: Register cooling devices
 with their name
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede
 <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629-fix_cooling_device_register-v1-1-c6e518b0bbd4@oss.qualcomm.com>
 <b0d0c7ff-fe41-47d9-bd53-89b111823c2c@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <b0d0c7ff-fe41-47d9-bd53-89b111823c2c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExNyBTYWx0ZWRfXxAcNJe7wGeKp
 YI+djr2zrmWVB8p+sMIodVhNWuLaZdQjWkga5/Z2IHYmtk8OrbHMRT9lnUQuyCaR7SBRSukPlQX
 GokC9Yaer6Qby/louJKmReVo98oXLnH70iEmVnQpCrPWXqk1uWt7m44469NWCbdUP4fs7iNxxwH
 8iAGhga/Kq1Sz7B5tMFifnI+bHCNHJ9/izTNPuHpHx7ryc+AEx2IdAYh+zOmgno8IEisyrjQDa9
 uYb6w+C+Cko7ObjQX1NsvUxbTYenG8Hnmfw0wSMIFRgNN0vHRJQGiO3bksRA9BX16faf47YGMB+
 7PL9Uvq/D/d6th2L3eilUBt+WQrwq89sfHYPw9OCqDNBds3fwZ22/SYeo7C0bh4FUT57N6D5Ks+
 /ZLnmX9QVqSY4ggFLo6VlDb95RHhIPJVfPEWtT/wnG3MS0Dd39u8PqIIIaxWefQai5/RUV/k8YD
 4g1sDRehQMHOyKUuClA==
X-Proofpoint-GUID: 6vCAzRNn7O6ZprtnolsDLa_v_WAzb8ou
X-Proofpoint-ORIG-GUID: 6vCAzRNn7O6ZprtnolsDLa_v_WAzb8ou
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExNyBTYWx0ZWRfX6jjqxxgJ5lAe
 sf56chXPkFddM72c6NhgOGRPjNDR29+iY+iHuJqG0WKAHOxk59uXdi39n2wnZWhqNwCv3/bLt9T
 Uu91niV7TF/qlLx2Ul6Fs91w4wzAi/I=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a427c48 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=sTVR4Ors8kAh6zT4N6oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115125-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:bryan.odonoghue@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:maccraft123mc@gmail.com,m:linux-arm-msm@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.intel.com,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9AA86DBDC0



On 6/29/2026 4:51 PM, Konrad Dybcio wrote:
> On 6/29/26 11:16 AM, Anvesh Jain P wrote:
>> Each fan is registered as a thermal cooling device using
>> devm_thermal_of_cooling_device_register(). When the thermal core gained
>> cooling device ID support, the helper's prototype changed: its second
>> argument became a 'u32 cdev_id' and its third a 'const char *type',
>> replacing the previous 'struct device_node *np'.
>>
>> The resulting semantic conflict between the EC driver and the reworked
>> thermal helper was resolved while merging the drivers-x86 tree into
>> linux-next by passing NULL as the 'type' argument, dropping the per-fan
>> 'name' string. As a result every fan is registered as a cooling device
>> with an empty name.
>>
>> Pass 'name' as the 'type' argument so the cooling devices are registered
>> with their intended "qcom_ec_fan_<n>" names.
>>
>> Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/platform/arm64/qcom-hamoa-ec.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index 45829f2786b7..12196d56b60e 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -391,7 +391,7 @@ static int qcom_ec_probe(struct i2c_client *client)
>>  		ec_cdev->fan_id = i + 1;
>>  		ec_cdev->parent_dev = dev;
>>  
>> -		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, NULL, ec_cdev,
> 
> This seems to have been altered to use:
> 
> devm_thermal_of_child_cooling_device_register()
> 
> apparently as part of:
> 
> f31c00c377cc ("Merge tag 'platform-drivers-x86-v7.2-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86")
> 
> Konrad

You're right, thanks. That merge switched to
devm_thermal_of_child_cooling_device_register(dev, NULL, name, ...),
which already passes 'name'. The issue no longer exists in current
linux-next, so I'll drop this patch.

-- 
Best Regards,
Anvesh


