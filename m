Return-Path: <linux-arm-msm+bounces-111326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KuThMc+DImpLZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 10:07:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14E64643C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 10:07:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NOk328+N;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iNqzFBgS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111326-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111326-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D00E730D9514
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 07:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAFC4508F2;
	Fri,  5 Jun 2026 07:47:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE94B47ECCE
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 07:47:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645622; cv=none; b=UtyPp3JTprvhc/kAuPVwgW5NJNuwlzZVZNl6GwxZDBH6hYTu4WQAhQg0kQMiVcTu7+t95u2V02zrthGyr5Qfi7GO9ZoJzrZfp8iS5AIi2Ib2XjmElwRx5+Yty1AAn87zKy/oW4q6FzdQAmhJ9+7mUyhgMLp8v7S9PL6+FFtoImI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645622; c=relaxed/simple;
	bh=YmUCBab2PB7a1Ft4+8MUszAWy7h4DNcu3/1kIXnZQhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WasjlY0CAmwUccTaxecsM4YpHAv+l4VqQnun65/C429iV3Rpt4oCVvfQe+uUdkGZ4+Z4X6WxhTS/n83F2okEPYyVeARGhC3XtatGpJic21xe74lI9bIgJoemXUCyOWGtIk8AA/iiHIqi0lwxqpC5ybKfR1cLYYYRvJ2kzIGsroM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NOk328+N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNqzFBgS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655750hU3528845
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 07:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zy7UIGAcdB7bApBTj2vxSF+W7ahUfjS+snn+WWc6QaU=; b=NOk328+NlAVTyI2F
	CSFMFSJO6kvlqTAOtAdBeKiTDbtc3gBFweJ06DwjWa9SyPdLBqCrORdVLqjCyTGj
	XOjjmFYRR/rgZI+s0uxuTbafHUpKOg23IjQfOoVApJ6MTGjkKNMZMROKKAlVqHPk
	2ZJ3dUi8srA4iW0s9FNmiKgal/MHyg+f7ztyhjFGrZfQ/xvzq1RwQilb40b3fZG7
	+sn2wdEvz2p0nMz6siEKS7yxI32i2BMvlZ0tymykeLRCht8o/pZB4aiNEBll5A/O
	loLjToEISS2ABoLbwPKnx4BnhFZuPGs2qtCyX8p6cKugBBnj4enK0cQBzpFIw7Tz
	ug9uUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksrp84gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 07:46:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2beff6b6e74so18119765ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 00:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780645619; x=1781250419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zy7UIGAcdB7bApBTj2vxSF+W7ahUfjS+snn+WWc6QaU=;
        b=iNqzFBgSvWLV6gC+89Mb8rCwwsQm/x71n8Njj608IjbaxB/36k9URleC1+E/i0LIhQ
         QklyppSblu9uopXcBqgX21jzex519o7q+JinK2u2DvK7KUcOw/0JXz4PC2Vu81m7rO7B
         EU4Fbzp05vKNVRsDwA3qLscS+fTVJUtDGs+TtTUPhHcHwgu6ORxDL5kpUzDm/HRw4RWe
         NxvfUPiy1G5Y3eB/Kl42BRx73je9cimKjspAjQVyH+B5L/vSiZcDQoHWrWEDwn47Wsht
         tHYRN+2+uiirQh3NojTivebQa+F3YhNFbJOR9h5MQnE+dIevHU4ATpg9m7IV55USils8
         UCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780645619; x=1781250419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zy7UIGAcdB7bApBTj2vxSF+W7ahUfjS+snn+WWc6QaU=;
        b=ZsQKSJQ99cM3qCy8085HEzx4pejobKouoqGLfxOLnqEVbovKKw9zebepbu3Fm1e91B
         PpIFGyt2z4y2CkLxULBCqnc22r50c/1LNZ5RIOHQ3qjFrBjqcS4w5skjlaWocjouuY01
         l3hkbUCtT63zCvCVfgKzwfEe+vpC/4PDb7GfFUmVTd/ZmTKcMBCL/pmIRvo41nMJvWom
         6noWN2xmQmFRZIvsbW5MgKF8KtVcXoetRfPjy52glJ5+uM0g9qz5iYNKWiQk8UGKSHqS
         1GiYdPptYxlk8vb41bq/P0xOiJqpMLq/TDokmMcx2arsccAhLb1Q9MOWOVThTYHgSoAK
         peSg==
X-Forwarded-Encrypted: i=1; AFNElJ+lNpGc05PUUg024jbQpwwGhftEqiJgzUbbXtUBMsqdZFyqH1lqhOGCu5QgfqB1aYrCisTUZ0RRCEN92BVY@vger.kernel.org
X-Gm-Message-State: AOJu0YwQYABKo3PJX/oX58K28IqnrQJ54f67HkgnhkABAHQEx4yJEfr8
	ZFvP2c+cFVMr8ImFwCoCuPzoGbMkyQ/5ph/bxS3TGIWOSEE2lM3rxtKUDsaz/PAlQBScpNa8PVc
	1rfF2sa86zc6AYeeR0+/cT0B7yBiMLN0Ye0U9Pdp9Z9pixQ+V9XRBRdihBigO+RPxcGX6
X-Gm-Gg: Acq92OGHa053f7CpZdRcmmxZIh++2Xm0ACFsBLAPEzvpn98+khwmZKWflXDaAMWYdL9
	u7lrOkZqY9i0gJT+4G1JW1v4sYyOlauPUuYUD+gy+vpznG4v53DZjLh/c4vwJX0MTWIs0W/K7AI
	LYxKFAmQpwqr8O4IHlcwFj7JSLAxpFiyu7v0PZ32CccGlPaQkz+bRmbLRxgj+7NwNj9JukcgiSd
	H8CpU3/weTkUGFkhBIuieiDt3lssAjEIlcvDyah/RNCPIxBabxYTbUFVr81RynkpWG+n7iG5mvP
	si1Er54eAzIe/6jrq6K1kwJhbodeHDt5zj+cCl+jthrEJl/MLsrmO8wWCqGtXynWu+WPuxXoo+d
	qQErbrX3xqo17zH/wc6tDRcRkNKtVEAamzMpdJ/cQaK50mGRYlYYMxpo3rw==
X-Received: by 2002:a17:903:24d:b0:2bf:e5c:d90b with SMTP id d9443c01a7336-2c1e8338ac3mr23644125ad.32.1780645619308;
        Fri, 05 Jun 2026 00:46:59 -0700 (PDT)
X-Received: by 2002:a17:903:24d:b0:2bf:e5c:d90b with SMTP id d9443c01a7336-2c1e8338ac3mr23643805ad.32.1780645618803;
        Fri, 05 Jun 2026 00:46:58 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f88473sm91340025ad.25.2026.06.05.00.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 00:46:58 -0700 (PDT)
Message-ID: <c52f5cdf-8795-4dcb-917d-f2a790559f74@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 15:46:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spmi: pmic-arb: Fix OF node leak in
 spmi_pmic_arb_register_buses()
To: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260604-spmi-bus-register-fix-v1-1-136adda83a92@oss.qualcomm.com>
 <b417d35d-68f8-4900-9a83-16c66983fdbf@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <b417d35d-68f8-4900-9a83-16c66983fdbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2yyIKBDgHPoZcwwsFOPbPvK-HANlxpPp
X-Proofpoint-ORIG-GUID: 2yyIKBDgHPoZcwwsFOPbPvK-HANlxpPp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA3NCBTYWx0ZWRfX1Lw2QVR0CCnU
 22rGrkD7CCnBF78LiiHrnhKuTCp0mOWSN5Vu9KfNVRLXEfDse4ADt4oxGkmg7tLkxTt2ef59kXk
 mOmtRbtyzXbf2pFQUfFaZYfmb78j4+IpuK19FLRcqNNx9gsVSUjaO//d9D8zKdhkqoUw2KddJ/s
 YqT4eKdFjfPxXJ5Jx/h3OQ/KtIArJS4YzdFtOpBPGzMVEd1djxiDq/JJiCzhOGinqWYCZUkLrqf
 IunFBPPT9XN5tKdfZm2PpyiiMBmK3jBfAujV5AYIHISNYSKhoppOEQqtXoGCW+umqpO6n/FUOH5
 8yrH7lHleUC+SM24qeA5nN3f7+e9eLf5/sGhL9yvPDl8MRhzo1hX1dfiAb9h7lEkPBBkjTKi2i3
 7t3cZfTB3ZXsJ1KdWZp/+qktgTZjYGvBV7IoESkX1zt5s4dwPElZ1SPTjorLXiA79dzji4bQzuM
 VJmLB+fLGNxhqek1rpA==
X-Authority-Analysis: v=2.4 cv=bJEm5v+Z c=1 sm=1 tr=0 ts=6a227ef3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=61nUwns-zGUAMgZhLmcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111326-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:sboyd@kernel.org,m:neil.armstrong@linaro.org,m:abelvesa@kernel.org,m:gregkh@linuxfoundation.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC14E64643C


On 6/5/2026 2:15 PM, Jie Gan wrote:
>
>
> On 6/5/2026 1:46 PM, Fenglin Wu wrote:
>> Call of_node_put(child) to reduce its reference count when
>> bailing out from the for_each_available_child_of_node() loop
>> upon an error in bus registration.
>>
>> Also, return 0 directly if there are no errors in bus
>> registration.
>>
>> Fixes: 979987371739 ("spmi: pmic-arb: Add multi bus support")
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/spmi/spmi-pmic-arb.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
>> index 2e2cb4774103..26e804ad95a1 100644
>> --- a/drivers/spmi/spmi-pmic-arb.c
>> +++ b/drivers/spmi/spmi-pmic-arb.c
>> @@ -2055,12 +2055,14 @@ static int 
>> spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
>>       for_each_available_child_of_node_scoped(node, child) {
>>           if (of_node_name_eq(child, "spmi")) {
>>               ret = spmi_pmic_arb_bus_init(pdev, child, pmic_arb);
>> -            if (ret)
>> +            if (ret) {
>> +                of_node_put(child);
>
> We dont need of_node_put here. The 
> for_each_available_child_of_node_scoped will handle the refcnt 
> automatically.
>
> Thanks,
> Jie

Ahh, thanks for pointing out. Just trying to send a patch which was 
applied in our downstream code base. I didn't notice this was fixed on 
the tip.

Anyway, still need to fix the minor one on the "ret" value 
initialization. Will resend.

>
>>                   return ret;
>> +            }
>>           }
>>       }
>>   -    return ret;
>> +    return 0;
>>   }
>>     static void spmi_pmic_arb_deregister_buses(struct spmi_pmic_arb 
>> *pmic_arb)
>>
>> ---
>> base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
>> change-id: 20260604-spmi-bus-register-fix-dfdb94bf834e
>>
>> Best regards,
>> -- 
>> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>

