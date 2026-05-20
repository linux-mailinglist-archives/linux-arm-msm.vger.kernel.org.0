Return-Path: <linux-arm-msm+bounces-108871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIC6LNv4DWqq5AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 20:09:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6141E5956BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 20:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA763311B332
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D173F4124;
	Wed, 20 May 2026 17:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QM+UTv5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZeeR8inz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A553F23A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 17:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779299478; cv=none; b=BFAKhJot4iVw4PrV8yEl/nMQBuNwfazaIN/bFkLW74G2CEWoKDBy3yGJWC34mF9yRkXvlq8aRtVRRBBHu4K1i6fQnaJiS7rMb/AOnSuaQzbHIPQZt//eGxLkZWcoUoyeah381vnUq2G+DK9KpmZu/ZN2nbDO2pkn5zy/hAAp7Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779299478; c=relaxed/simple;
	bh=EDn9tZ5+fUuBBKe3xoJ2cTQEWFARqiy4G3gqZ26/v0s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sofpwt/DXIFOvJGDAZt0Cdk8Gf9VMqY179p1JgBEp0J+9JkvkFedkiAHKX8uDHcpnoSA7gQF1tukE/fJrGbNJ95uGh0Ss+jAHJRTHEyo85ftCrPRXUDrjfVIZyIjVcduKr32MnTd+OYm5IgczEimsMFEoKDkl3OnXNlG/8toGjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QM+UTv5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZeeR8inz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KGfMkM267052
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 17:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mc/+ti7MrgQz8y3VEqUCtk+lZgtdhsk+7nKCgcRoRzc=; b=QM+UTv5OhjXtuCSi
	KN1xd8tqFVIXPKAg5jpokGrnXAf0a1U4PUDSH3RX5ZcUSIfS/ljobzI66f/YMPd5
	OeW7owetPzdc/VIDYIMFX5XxBnVHgbg1qEhvVvggSHh2Dt/Ai4ugHZN/Td7jCcq9
	qyP882YaEvZp+IISYEfjT1pwzbZU9wdrEhAxs/IPN1KoC3Hi34gmT1kRn4vpCfso
	bFoTCdn+DayrQ9/LCEQJ/yNsLfAEbMpX8BsqZXr3sSIunXz2D9AyUARKzHRV8lI0
	3pkoMnRs95y7EPSnM6BdMWD7BEOab50OdNnC7yFkBK9+Zeqi1ejGSw4ewFaAHUWU
	uy/sAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxsyh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 17:51:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba3245a43dso53764725ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779299475; x=1779904275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mc/+ti7MrgQz8y3VEqUCtk+lZgtdhsk+7nKCgcRoRzc=;
        b=ZeeR8inzCduryRtM+EI6j79s1QmDbtHjB0q7DV6gz/oujudf8o+kyFtou5z9yi0BNd
         vTgkcqYwSK94MED1GspVtGAzunggJGNXXE9iecQaznKAkwrxNjql7PjvnG68+vLf40mv
         MS2bHv9ijHNxJK3epFR1c0u4FRVkINXRwhyH/10oWILkcTVb7yXFuBvByI/Sj8KOGsTB
         zN8lxpdCtUZZkcGVxyh8bo/Vp4KWFWgnBawKO6o1Vl7kbbjnRtTXw+XongU4vmppGtsP
         ViBXvKS3UgM5Dk34bojYxdJBkGR/5k0690AtYbRRU6aHx0aU5aqnLjn2wrG8BPrcMyQa
         VxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779299475; x=1779904275;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mc/+ti7MrgQz8y3VEqUCtk+lZgtdhsk+7nKCgcRoRzc=;
        b=eK6ZzfPz0Ba67/jJ28IRsPfCryE32/7sbQJ3G7iicgnjKUEtED/CzUGvwPWmFw9ndr
         KtbR85HXQ6xC0FSuvYg55My1+4NnIlEma6mnzm6MJO5lPcaGkThxvYEdj52tsGdRaCkH
         /QtJRqi8lKfX9N4y53EPVbz0FhcAZ/5ENTGPy/aoba5cSPiV3X40Xnozhs8ZC7BXTOYs
         lW6gxhlzgBTiO6K3DPv6t6+wNaWb6D6oMZTUvwwjVMWvJ4KP80CbtOqB/QoUq2N+CF6C
         b2CCartkviuhN9Ejsmxmi+4dFPwhY8xxSKzyMSFNkLWqtSukCfE90jQ943UyCIc6Ls3x
         F2ow==
X-Forwarded-Encrypted: i=1; AFNElJ+51rCiT8y76Hw/+NO1zIuAulr5xP4303/MkHTv3nB+eq4B6f8l0/PmsCbnymJeF4sZ0QdZbC3IChhkZPSB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0C4vw0Z4V248Vb3KRueyIGxRSfjR5tJqzOCXktDiMJQ765xm3
	tA//spzk3ljYLgjFucqyR1lOwkf+B8jYGrtTaumQDrqUivQf6D0CaCT1R7LeS2U6SVYgH1oU5s3
	aac2XID9GiBD147yLIdMB2Ty1qrYBf9MsYz0C0oDauXV83Vrf1VJWZ7MTdCmmxd0/+yvj
X-Gm-Gg: Acq92OGn0TiKqIaaXEyJrmVH+bQZIA1Ro3/ou+U2pK9wauzldFy2ihZXhBAYwGAnJPb
	IgqSE2Ow0NZP+s20YXronj65aDHBt9Z0sb0wDbqISiRIherkQP09DdzzUlmIFHzmlPOm0Clq5l4
	uG/loz3E9TvEi1svzu/c+nnCj1UIXmw/ZOiQBRhI7X4+feV2W0zAzDqPSE953T7WVHig4P4R7BG
	WPSPp05T2ywDdNRbjHw8PtinC87hrjPyLGmP2c1GXy5CssIuRtgIanAEpm1Val2OyCCU+2Tuu4c
	oj0KS4wg+rrcXwQZgF0jjIbbSvDOa4FEhzQ5lO3syWGlGRvDy9Ra0Rqwy+T81pmAR5xMyno2MdZ
	xi2TjTlMJl5UXEB/G8TEaEHK76P7CGN2Mu9amv68lM2ApxGnqti5mvq0kWczdpm461RsT6coLwR
	P/fIqmhqkngjdr/Rlc
X-Received: by 2002:a17:903:2ecb:b0:2bd:936c:8155 with SMTP id d9443c01a7336-2bd936c85b3mr230398805ad.13.1779299475116;
        Wed, 20 May 2026 10:51:15 -0700 (PDT)
X-Received: by 2002:a17:903:2ecb:b0:2bd:936c:8155 with SMTP id d9443c01a7336-2bd936c85b3mr230398345ad.13.1779299474561;
        Wed, 20 May 2026 10:51:14 -0700 (PDT)
Received: from ?IPV6:2405:201:c408:b079:35d3:6970:1f3c:72e2? ([2405:201:c408:b079:35d3:6970:1f3c:72e2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2dcsm225979395ad.13.2026.05.20.10.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 10:51:14 -0700 (PDT)
Message-ID: <b16ab4d5-40d0-4438-8fab-6cff3fa6845c@oss.qualcomm.com>
Date: Wed, 20 May 2026 23:21:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <CAMRc=Mde7Y3CQ3yi=U+999JyHTNacebiK8jJhHuYBGaqn59yYg@mail.gmail.com>
 <f604833d-b333-4514-91fa-3cf95f99f9e7@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f604833d-b333-4514-91fa-3cf95f99f9e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZhkfY8fPOuricHN37AqOt_409kaAf0tg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE3MiBTYWx0ZWRfX+KFYUh5v7LCX
 DtiSqIuclTCCADDRtLz828C/FBpOGBoT1KN4GBZgdaj72tq7dgyWTWYoe09u4DacacSgef/pEPw
 4PiO+C3Bfv1e0cS/rBmLpj+cSa9JcZzmcBUGMyli+t5TIjxX4e9p+raRyB7r6/nK4TvfHoi+kd2
 k+u6r9lSDD/yh111kiwy0cOPEU4kNjiCzyaK9FIDLH36tbqasJFN+qIM3+bCIdShzBFOk17yipm
 T7ZTDNho0pDejW7gqjXCGqSUq5m2HAV6H253n7jdzg8eCJzYmG7SwakbJIz6UxYsQZgZCSNagUQ
 37Fez6tl4twIRoYcsk8vw+oy/dR2E1xi/IDZbpmpjVo2ycWJLCu+WmnhOcbNzOFCYcuFn/g4uZt
 6YhtbE9WkQcDp3ph9Q/YFuMy0vactO5+TnJ/b55wdR+3ihW6HKOw7RwfKgXaXOy4iuDUnyv0l46
 nH8PEwf79XUIjAJEl2Q==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0df494 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=UQidBoyNrwidYc1BrrYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ZhkfY8fPOuricHN37AqOt_409kaAf0tg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200172
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	TAGGED_FROM(0.00)[bounces-108871-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6141E5956BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 18-05-2026 22:11, Shivendra Pratap wrote:
> 
> 
> On 18-05-2026 14:27, Bartosz Golaszewski wrote:
>> On Thu, 14 May 2026 16:25:49 +0200, Shivendra Pratap
>> <shivendra.pratap@oss.qualcomm.com> said:
>>> MFD core has no way to register a child device using an explicit 
>>> firmware
>>> node. This prevents drivers from registering child nodes when those 
>>> nodes
>>> do not define a compatible string. One such example is the PSCI
>>> "reboot-mode" node, which omits a compatible string as it describes
>>> boot-states provided by the underlying firmware.
>>>
>>> Extend struct mfd_cell with a callback that allows drivers to provide an
>>> explicit firmware node. The node is added to the MFD child device during
>>> registration when none is assigned by device tree, ACPI, or software
>>> matching.
>>>
>>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>> ---
>>>   drivers/mfd/mfd-core.c   | 30 ++++++++++++++++++++++++++++++
>>>   include/linux/mfd/core.h | 14 ++++++++++++++
>>>   2 files changed, 44 insertions(+)
>>>
>>> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
>>> index 
>>> 7aa32b90cf1eb7fa0a05bf3dc506e60a262c9850..cc2a2a924d6d3044e29a9f864b536ee325ed797b 100644
>>> --- a/drivers/mfd/mfd-core.c
>>> +++ b/drivers/mfd/mfd-core.c
>>> @@ -10,6 +10,7 @@
>>>   #include <linux/kernel.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/acpi.h>
>>> +#include <linux/fwnode.h>
>>>   #include <linux/list.h>
>>>   #include <linux/property.h>
>>>   #include <linux/mfd/core.h>
>>> @@ -148,6 +149,11 @@ static int mfd_match_of_node_to_dev(struct 
>>> platform_device *pdev,
>>>       return 0;
>>>   }
>>>
>>> +static void mfd_child_fwnode_put(void *data)
>>> +{
>>> +    fwnode_handle_put(data);
>>> +}
>>
>> Ah, this seems to answer my previous question, but...
>>
>>> +
>>>   static int mfd_add_device(struct device *parent, int id,
>>>                 const struct mfd_cell *cell,
>>>                 struct resource *mem_base,
>>> @@ -156,6 +162,7 @@ static int mfd_add_device(struct device *parent, 
>>> int id,
>>>       struct resource *res;
>>>       struct platform_device *pdev;
>>>       struct mfd_of_node_entry *of_entry, *tmp;
>>> +    struct fwnode_handle *fwnode;
>>>       bool disabled = false;
>>>       int ret = -ENOMEM;
>>>       int platform_id;
>>> @@ -224,6 +231,29 @@ static int mfd_add_device(struct device *parent, 
>>> int id,
>>>
>>>       mfd_acpi_add_device(cell, pdev);
>>>
>>> +    if (!pdev->dev.fwnode && cell->get_child_fwnode) {
>>> +        fwnode = cell->get_child_fwnode(parent);
>>> +        if (fwnode) {
>>> +            device_set_node(&pdev->dev, fwnode);
>>> +
>>> +            /*
>>> +             * platform_device_release() drops only of_node refs.
>>
>> Which is a separate problem we're discussing elsewhere. It should 
>> probably drop
>> the fwnode reference it holds, not the one of of_node.
>>
>>> +             * Track non-OF fwnodes explicitly so they are put on
>>> +             * all teardown paths.
>>> +             */
>>> +            if (!to_of_node(fwnode)) {
>>> +                ret = devm_add_action(&pdev->dev,
>>> +                              mfd_child_fwnode_put,
>>> +                              fwnode);
>>
>> What if the device never gets bound to the driver? The release will 
>> never be
>> called, this is why it's wrong to schedule devres actions for unbound 
>> devices
>> and one of the reasons for patch 1 in this series.
>>
>> What I suggest for now is: in tear-down path: see if the cell has the
>> get_child_fwnode() callback and - if so - drop the reference. Add a 
>> big, fat
>> comment saying that this must be removed if we decide to switch to 
>> dropping the
>> device's fwnode reference in platform driver core which may happen soon.
> 
> Ack. sure. lets me work it out.

Hi Lee,

While planning to address this for the next spin, it would be helpful if 
you could review and share any additional comments that should be taken 
care in next spin.

thanks,
Shivendra

