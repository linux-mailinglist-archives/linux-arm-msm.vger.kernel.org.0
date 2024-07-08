Return-Path: <linux-arm-msm+bounces-25516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F004392A8C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 20:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C837B21702
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 18:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE7C147C71;
	Mon,  8 Jul 2024 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mgo15zhu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D2714388F;
	Mon,  8 Jul 2024 18:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720462314; cv=none; b=hmixB9lat5u1VGTQQcXmCa9z/f0tqF9S8Uy2+XOT6V2z4cLSkqjSgd5m7L2hDyrl9mDQyAGIg/k0pCdBMK21OOaq4FzG/3jhTYG4sVrKRmy7rPRvpE5yuqOYvGTRr8QE7ZI5K0SjHk25wCDvyj0eQt9rY/tZUsiWzxWAtig4+dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720462314; c=relaxed/simple;
	bh=v3c5CepbkkjKt6gptE+TJUk1F9DMb0UyjaEvOMi9Kpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t0+f5ytaNpaLfT9H6fNSuxuMxtq0PJR1OwqwIaZZNcuMvVphY7CYFxcQbXtoqbDDMpleHMxPeuTexxe0Hq4zkp0iQC2PJGdJqcBCghZDMysWtHPu8jAPN4JW7ivEQ8Hj7LAL0QJFJHt/HNcsx7mAD2IA06WCEylawSYxQhb0HCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mgo15zhu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468AMIbf022158;
	Mon, 8 Jul 2024 18:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRv0YX0tDp29skyu4SDzayb7EgtbAAvR4vc2HCkWIAs=; b=Mgo15zhuyRWUblmy
	nBE+Ad4RTiBlolUEFhS0r2PWU+8bCIv5mVlZRHFcYSIUAfR+zX4vRoRBqMtnOamt
	i/yy3siE6S7ogitUs3hW7pimqONUw//teXYc/PxxiwmKXXXX0KOllpG+cUm2c2bi
	816H0b4iBXRxmFNfJt52v/3LtXNdHRuahxflQuQCFm7rHISaARCTIhw9fFrAu+lO
	tmGT/M0rV6pucd3Uv4MRo1b+9mpcS1e5qrf0UezbzkhwTxwCa2effDoL38FIzVP3
	DsJ/IXW/fyKAR/Lb9djrI/K/IKqv1nuktbikAnaLsv7S2pEnmzmM0bWGFiMXAq3H
	HU3kOQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406we8vfeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 18:11:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 468IBmDw023223
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 18:11:48 GMT
Received: from [10.47.206.1] (10.49.16.6) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 11:11:47 -0700
Message-ID: <da84b5e1-ae11-42e1-8b93-8d93df1862ad@quicinc.com>
Date: Mon, 8 Jul 2024 11:10:05 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spmi: pmic-arb: use correct node when adding irq domain
To: Bjorn Andersson <andersson@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Dan
 Carpenter <dan.carpenter@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240703221157.3640361-1-quic_collinsd@quicinc.com>
 <wbdccdzncuje5ynof6y27e22dqipqho5j4qtqczlctu7bqhp6z@5qatffxbjykx>
Content-Language: en-US
From: David Collins <quic_collinsd@quicinc.com>
In-Reply-To: <wbdccdzncuje5ynof6y27e22dqipqho5j4qtqczlctu7bqhp6z@5qatffxbjykx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OZM6kLUoItK5cuPCoyHwKuTIP6tJalB8
X-Proofpoint-ORIG-GUID: OZM6kLUoItK5cuPCoyHwKuTIP6tJalB8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_09,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080136

On 7/3/24 19:30, Bjorn Andersson wrote:
> On Wed, Jul 03, 2024 at 03:11:57PM GMT, David Collins wrote:
>> Pass a pointer to the SPMI bus subnode instead of the top-
>> level PMIC arbiter node when calling irq_domain_add_tree().
>> This ensures that consumer IRQ mappings can be found
>> successfully at runtime.
>>
>> Here is an example of a consumer device probe deferral that
>> happens without this fix in place:
>>
>> [   18.197271] platform c42d000.spmi:qcom,pmk8550@0:pon_hlos@1300:pwrkey:
>>   deferred probe pending: pm8941-pwrkey: IRQ index 0 not found
>> [   18.197275] platform c42d000.spmi:qcom,pmk8550@0:pon_hlos@1300:resin:
>>   deferred probe pending: pm8941-pwrkey: IRQ index 0 not found
>>
>> Fixes: 02922ccbb330 ("spmi: pmic-arb: Register controller for bus instead of arbiter")
>> Fixes: 979987371739 ("spmi: pmic-arb: Add multi bus support")
>> Signed-off-by: David Collins <quic_collinsd@quicinc.com>
> 
> Not sure if Stephen was waiting for some fixes tags, but otherwise this
> was already proposed and reviewed here:
> 
> https://lore.kernel.org/all/20240522-topic-spmi_multi_master_irqfix-v2-1-7ec92a862b9f@linaro.org/

Thanks Bjorn for the link to this previous patch.  I was unaware that it
had been sent out.  I ran into this bug when testing with the recent
pmic-arb multi-bus support series.  I searched to see if it been
submitted before and couldn't find mention of it, so I sent out my fix
for it.

It would be great if Konrad's version of the fix (with Fixes tag(s)
added) or mine could be picked up.  That will ensure that client IRQ
usage isn't broken on targets specifying spmi-pmic-arb SPMI bus subnode
devices in DT.

Thanks,
David


> FWIW:
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> 
> Regards,
> Bjorn
> 
>> ---
>>  drivers/spmi/spmi-pmic-arb.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
>> index 791cdc160c51..e6a4bf3abb1f 100644
>> --- a/drivers/spmi/spmi-pmic-arb.c
>> +++ b/drivers/spmi/spmi-pmic-arb.c
>> @@ -1737,8 +1737,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>>  
>>  	dev_dbg(&pdev->dev, "adding irq domain for bus %d\n", bus_index);
>>  
>> -	bus->domain = irq_domain_add_tree(dev->of_node,
>> -					  &pmic_arb_irq_domain_ops, bus);
>> +	bus->domain = irq_domain_add_tree(node, &pmic_arb_irq_domain_ops, bus);
>>  	if (!bus->domain) {
>>  		dev_err(&pdev->dev, "unable to create irq_domain\n");
>>  		return -ENOMEM;


