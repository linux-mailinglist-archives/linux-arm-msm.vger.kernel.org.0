Return-Path: <linux-arm-msm+bounces-101258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOMKIoTYzGnnWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:34:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E061B376E0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D91753016EDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 08:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B1B3A4F34;
	Wed,  1 Apr 2026 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OeHfQI0I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QpM5bBwQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5EA37FF75
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 08:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775031912; cv=none; b=ZbbJgBsHa7ZRl1MU5RU64w704XMXtxx7Eu68R3mw2pEjLSRd4va4751V+labBzolzA+AMha6qN1PIExlPX3hGVLfK9WAvkcsY763vQlhww2xqFYCy0higqBICgyXZ/G+6g4HGkbcac+VQDPyGnJiWhs4LQbZypbg0P9oxvr/Kxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775031912; c=relaxed/simple;
	bh=zBLNUASxMAOkL/XnKotLcRpQh7sr78pb+Q1Ff0SugGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jnDlWZitusOgCxWmnivAJ7NiIC2bq7tX9eIvusQucaX8YDIPnuijKK6U0KNtOKvpmiYm4P6sFsV2zC8J4K3m+fSJGXpmPcRejXk9OWd5m+BIKdctBA2Rr9rxueAsNmNn1KkDv7smuqaLj3y2XjOOs2eJglW88HrquuGqG7BERvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OeHfQI0I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QpM5bBwQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317F1mj4106992
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 08:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YuYeNu5cgsav1el69xGkQ5bGwGpb2EMvegvkFeu2eoQ=; b=OeHfQI0InhDywEcK
	+ICxCGNLF2QFF0nCAp7q8kldwAftiXWOF1zJs7/oKNoE4F7yzYXyLSkjoi/Y/APT
	bDhavEICb0pF6+YEa8oYcXzOZaI2r2+mkMERprw7gOjyt+Cq5e7kmO3/CdHHdTt8
	ePrRpK8h495JKsLdIJMLXlOKhOQt3f1cdi0xykYHv9nCSYeqVTibD7DfaqM2oyjc
	xylSPxy23F4qGn+SC+EkYsDjTGkK2wZxzKAA5YjDWVvn9WvJygAkkJOpSqSZRCHp
	81McJaOLN3EED91t01J1mK0S+xqcm5FSy/E9yX+fjlee+lR9FlWmqAtzPcfIL+jv
	8GjoUw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt90948-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 08:25:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954b9b5da7so20640876d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 01:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775031909; x=1775636709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YuYeNu5cgsav1el69xGkQ5bGwGpb2EMvegvkFeu2eoQ=;
        b=QpM5bBwQLRhVy2n8DpZnzqiYB7+1OEdRLQQxmblZCBWn9OWqA3UOGDy5U7s5mqRpWI
         j06phH4G8jSASEQSZBRq+gcsZh/bs6RGuEUkHmCpbXEOCXaLlVjdnrzc0VOdUus35VdU
         G+gI6TAxWEZz7YRyIDfUPRYrzelHDYjkjiuqi13LN5qUiToUVWlnmnnbcGp1VR2HDqwx
         NeXMbQVEFJxZb6apeqHirQ+MPjppH+kIN1SpDLip8vPX3ZTDBSqtMDOxiGTBB58hKmh0
         qJeEs+EjY3XlUXb+mUunwYR8nkI6qXmCYkVoH2E5C5VJ/TTfzkP0g5w39/uMVhJfGxcZ
         q7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775031909; x=1775636709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YuYeNu5cgsav1el69xGkQ5bGwGpb2EMvegvkFeu2eoQ=;
        b=LrAhsC14ck9aRSoa1vwdnPvNHHr7y7OoTQCtGP/qQdXxwg9q9Vinq8U6SItZ0g9me0
         B+dkhcqZzvggU1k0unUXPNEYwGq9miVMsX/52+LmJL+6nwnuf3guaMFRvdz4hWGd6LA5
         h2kpW9wvGrYJQ6maFwiuryNqPnc519sVrZEFAFIbW+KqA+tilzgo5UUo2za5gKIhWjq4
         1ST8LLYavyUu+4X9L7u09xr325zte2wlv8vHbc9OIZu+JXuohOzeXhp6EWaJheNlVqiF
         HDnAHIQOgjlzDeuq5lQyje/27zVR3ySbEF5o4LPiVdO1/CwaQxB6CCGWiM9K/6Evv8V0
         7oCw==
X-Forwarded-Encrypted: i=1; AJvYcCUC5Qff2cJjwQtU3hCqsB4CcknLxyrH3RfQ9ikOy09BvsjcJ/yeNH4lbYF/MF+HFrxdw99lYG9SDm78o4NP@vger.kernel.org
X-Gm-Message-State: AOJu0YwgvozYcQ8Zw9ZPqzpwu5KlOiehT5EBEiZzii41Zq9Ie2VHvaWl
	oDrQMD/u2+1u8yhHMQdbY+ipf6EXnE6Z28h3Y6z/EQta68zAJJhw/ZTWJVn7i5KD78QnMhVbA3x
	5HVtAL8DBw3PpLNPEwfi4fYXRT3JYEHGX6mE+wXWfHqotT0LTdcTsUodWMVhYithHhVw1
X-Gm-Gg: ATEYQzzWB9SGABn0GXQwXPkVpIxIhY4jk08fmlKRkP331gpbBOTfx1i/q+ZMqEnNlFo
	9N+8ilRn7sCEF1p0PTCpJ6H1NPtmNVbw5z6DMGVmKuCiceLAj4/KtuWjiVVc2fVlUEDQtM3mtXk
	53L5D6sEje19bPhHVnz0xs9yQinPLLd8P6pUfzyLtd6euP65b8TDQiH7SRNkOs4V7dcMCSQ+Aea
	RQk9b6tUdzaBaKZzhDV444ukijl917WkbYTQ5RawaKeY2Gix94U6jyjLXY1TXojJF75nmIrRG2H
	oMHKXWvUVnjspLkz3+TmiJ1ijAgcYcHQBw/Qr9y7MsLts1Aip29gsxXy0MJj3TW94GJrl6bBC9L
	LXt9htjAMWyvuCUADW1KsjGNOwq8VG51/h29RppkVMmnToeCFi5AK8dno+CbpxHRMHF/Q1XevFg
	+/P90=
X-Received: by 2002:a05:622a:1818:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50d3bd5723bmr28651931cf.6.1775031909435;
        Wed, 01 Apr 2026 01:25:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1818:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50d3bd5723bmr28651721cf.6.1775031909052;
        Wed, 01 Apr 2026 01:25:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225193sm493699866b.57.2026.04.01.01.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:25:07 -0700 (PDT)
Message-ID: <25a0cd52-ea99-47a8-9965-18a1e6e0687b@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 10:25:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem: Update max processor count
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331162439.1922486-1-mukesh.ojha@oss.qualcomm.com>
 <dopgyc65xh2ei3oebltbzrog2jkpwzoz2fu4b4vmpsolmaziva@qtfbuipbeneo>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dopgyc65xh2ei3oebltbzrog2jkpwzoz2fu4b4vmpsolmaziva@qtfbuipbeneo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JQtM-ESBTziFFTKuVlpwHjolbO03OH70
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA3NSBTYWx0ZWRfXwA6TU+fRIJ9H
 dibNOeMuKNhjNo7EfIj+r2hihB+MhJuyu2+eDmJk3JY7DEtap0MRiHCScI/99WO/QU8UAwQVdyE
 rX5aImzhADmzbHVrKWqlOGEB4hiJgCcjPYJd/pu/KI/1b3eO6ZWMjr7UuKiScuT8zwasvVPW1UR
 9ocoBIhU97vEBKjTbbi1TN9/aU1oy64DnNbBZF/fre5pvNNWJh9mpkFdZIwzrxq3MstYhiFYXjq
 B0QcjoOYf/YbzFgODq+BrDdbcS8X3kNDxNO/WAC0k7DADxi6umdFn1J6gDcPRMyHW02ZQAp9hLj
 AXmZ1+MgeYWTVEifj5/UG9peML9LEtvzO3l6YU8u6oTSSBHtZF5oOx4SuuH2RQcj+bL4aQNg+Tj
 DMrdn21h1th74RDICo0P13yaD4oR+xdWF3VfREiTAAL2Ka5ui1yvLp9fxxkldLmrbiBDPJygGUt
 9wFt+nLfw4rQlUTmmUA==
X-Proofpoint-ORIG-GUID: JQtM-ESBTziFFTKuVlpwHjolbO03OH70
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69ccd666 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=okx5TKBA0Gz4VQ9yakUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-101258-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E061B376E0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 7:57 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 31, 2026 at 09:54:39PM +0530, Mukesh Ojha wrote:
>> Update max processor count to reflect the number of co-processors on
>> upcoming SoC.
>>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/smem.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
>> index d5c94b47f431..8daa25d16fdc 100644
>> --- a/drivers/soc/qcom/smem.c
>> +++ b/drivers/soc/qcom/smem.c
>> @@ -86,7 +86,7 @@
>>  #define SMEM_GLOBAL_HOST	0xfffe
>>  
>>  /* Max number of processors/hosts in a system */
>> -#define SMEM_HOST_COUNT		25
>> +#define SMEM_HOST_COUNT		30
> 
> Would it be possible to get rid of this constant at all?

I've seen a patch in pre-review to do just that. I'll poke the author.

Konrad

