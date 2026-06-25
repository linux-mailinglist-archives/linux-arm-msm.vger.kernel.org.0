Return-Path: <linux-arm-msm+bounces-114528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IbjdLLIePWoZxQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:27:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D96D6C5903
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:27:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gnQVGdaE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NibFjbqV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114528-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114528-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED40E307B363
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378003E00B0;
	Thu, 25 Jun 2026 12:19:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A213E00AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:19:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389968; cv=none; b=SbKGKWHplo27cHom8f1cEbJdoVDyL0gc1LExtO1Xs2TDtQBZ+WqA7B4KwIHDzVdrtyeSQjOOym2MY00wQM/B92Z5nsJShUu8YUu7gmAyp+hw6qCSMDv4nxbhjjooQur8jwrGt4fpHnwFQ+QMYE6twNXu/XQ89nG6i23f1+io4Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389968; c=relaxed/simple;
	bh=Mz8OpHT1duaXDpyujl4q+fOZ5QNzT5vnTX8I3Qr+vi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DYJomZOzZGWuok8E+zULpy/LGtaRi1pzNL+LUhvvQ2pU3Jf2F1ngadjF+5ytVlTqtRBZAX7DLohG241SAv10sLFkAN6X/TENP4uSHJgA8ir5vGNCrNejHGgZzZ6mUtfpXlVfvUn93qk/MaC3gFf1wPt/IVtQxVbaJDqDoKDq6ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnQVGdaE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NibFjbqV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jxOe1371533
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q5HypoovyYvP0zHEoJJ3u328Zashj4UEqpuWiF8wzV4=; b=gnQVGdaENlFp0652
	Bgn/j+CWF23qfJ9vOSjoas7QvhupePAGN4cdpKqBQgT/sNzs2V36Ps6tAhLoeBxv
	JBU6xcqjSbtTMB1gfxxW/f7ALypk5vzzwGncsxbNBdPy+SwKjBuO/pJRBFubbi93
	lUAhEvfWPkitlOMz5IAkl1/qVLu2bNfTqI2y5VLzCy9puGisBXfFYyU8aoYklkTK
	lZrKW4rbLOMeBBVh2GR8zO8eiJik6b4K51wleks+qDIUo3jqg0IbIOM+R1iiNBUK
	HqXkz96Ws/92AcZeX0jU7NiR8bShdO/aiSCu3RZfoYcSIFsPbS8gbJsQDyOH93H6
	ePAxlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ymv14m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:19:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915737aaf0bso19155685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782389965; x=1782994765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5HypoovyYvP0zHEoJJ3u328Zashj4UEqpuWiF8wzV4=;
        b=NibFjbqVYt65OuQLWstVv6KYzu2+yCQvCeso2UCItY7vDKeU2EYhbTrD/bgH3sDLIG
         jkoqZcy9qaAsiNWitjhSzmLoki297FMTi7kmj/fYKaMpmzEGK+NFnoBp6/3c/4/EC2RT
         RPmveFnyrRgafM3gtyC5fs4g2TMNbm6w6e7D5yVRStzzbNA2Eksid6+4f0yd8pgwhPbA
         OAD4Noeq+yBUJSayRm7owQ7bgrcf/wkSv2KW1WJ1/BBF78GrL8OBTAbU9nadgfSSf+qE
         yysAsqG5dqWAODtbEDqnRMx/MpAqGTssJOpbQXtq8W+eG+Ut2R2vcXizh08vhyeOLhq8
         0Eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389965; x=1782994765;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5HypoovyYvP0zHEoJJ3u328Zashj4UEqpuWiF8wzV4=;
        b=bUJQC/VS/er6OTRF/LViYZ+WOp9wqa3BRpN+6V+0yaPLicyvdLjjzEg6UHOhWNTJ/G
         V/KSQ8GHzbwYE6Hct6Y/BPf9tIDdP5oz2EitagK5u6dgB469+7+bDnCMV4Y/JRMQxSGm
         0JIjG7uY+iPwZR0igdZ3PlPwdbx1DPi05YzfQoXYNG0l+j9mWSHwb4SdYQX6qCftZ6pm
         SXRsaVgNHYu6zTRN8sb4OePSitqQ1dkwYvC4RdMyqpHEjVC+e1RV3pMD0gh6TfG22941
         CzWBD2ITT/IrvklxA7ch15rBhQy0PlyLfqa5Y/3Fvqtxvn962E5XJWNBGOLTRyDv4QJP
         QtuA==
X-Forwarded-Encrypted: i=1; AFNElJ/hzqKa9l+o7GIN6Vs554aGzSIWLgVGKGOg1Q4JggioLYxy1iNs7c/Py/SRMJD1yWzUaNgFOLEGsxhcWQGM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc2luTItFkLSSrVb90NB/9sAub5w+qXh0OBdtCf8VrG8dF6cCo
	kJDcbog49rU9jMDzng/okV5K40hByiYFVUALWDg1RyRLMD4g3vMhTNfd5AgPBZ5itv266cqfyAQ
	YSnAnKmjzH+/weYO+vOtfFpU9rCV2G1DuCxrURUMOLR0kjLHmqu1NOF0Ghf1/BddPCSHH
X-Gm-Gg: AfdE7clN0YlVc1KgrGav1mkXmwoWjfWeAtywNOkiOA+7wOaJhN+ktwwaPwZ77ehjcpW
	u6BmfUsclcYcymPRhTDOCbWf2bJu61EqupM7g6Biaaqjde9G3rG6NlT83L8nI4cEMOllMc2Vq8a
	sr03ksVqTntTcXRCNFo+y31UeUbsSQXQwmgxThe6uai48fN9zwsf5Q3Yy+RFS6YST15UeeopvHv
	JZ3C4S5IA0yuRor20dnYjfJSEXFaI9SVYv5wPS9ahp+bi2cuOmYcvNK2/eoYODeGNSPHm+ekXFr
	7vYtF77Ee1LpQ/OvL4aOIxdnPyx1kUBNmRKHzEi0Kufslq4yoWaszbspWysmLfZcfgLc03N+HUg
	nH9Kqn6FzJntrox1LdJ6T7i6FDeeYQLyV7fg=
X-Received: by 2002:a05:620a:4693:b0:926:e8e6:3c28 with SMTP id af79cd13be357-9293e3bc2famr201293085a.7.1782389964881;
        Thu, 25 Jun 2026 05:19:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:926:e8e6:3c28 with SMTP id af79cd13be357-9293e3bc2famr201288485a.7.1782389964264;
        Thu, 25 Jun 2026 05:19:24 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05f9csm171615166b.31.2026.06.25.05.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:19:23 -0700 (PDT)
Message-ID: <b790c13d-0a4e-48c9-b8e1-743481c5e6b6@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:19:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: qcom: common: introduce qcom_cc_sync_state()
To: Brian Masney <bmasney@redhat.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-2-15f82c64d95c@redhat.com>
 <21bbffb7-ce99-4c38-a5cc-6a3f3c7f48eb@oss.qualcomm.com>
 <aj0TQuaPWmSlLwIw@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aj0TQuaPWmSlLwIw@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DqBmPm/+ c=1 sm=1 tr=0 ts=6a3d1cce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gxl3bz0cAAAA:8 a=20KFwNOVAAAA:8 a=_b-nc2vJREEiSiBs9swA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX2zydXvv1yzOl
 qQC1O6AnMz7qUxY9iumTq/5GARJra5crCeEKncoTpAl/l/HazxzOge3wFPkyb43nG/auHkfzjoa
 RhdpCSRS4MeSNpasnGhGdRz137Q7UTI=
X-Proofpoint-ORIG-GUID: YnwGyfqU6SasJNq3iK0xSL1CU8zd0Cvf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfXxhTUTo9spyxg
 yb7FaoDem6Kms/hknrc3EQNaofmI5l4bNXRMmuC3Zk2QtEOIQWE4k4w0Gp5BpJCtrQ9/LHE5Vx8
 guLxNl9wbeVOTTMK7APw7kVXO6QKreVoqYjD/QdvVLG4nEeuzFHYuQwTRlumzcYkJydrD3SveU3
 ibQXbHIWqeYVoVIyZJMd9tsle/iqfcyDqSJBSJHEvhuO53nyEhqFF/5p+fphZscUmx4MIY1tBTl
 /OF/59xwU7a5v2HKxyGePX6/VMPFPTVejmwMzHR6IUj/6cbGE0OHqfOh+cwsJ4UJ9xU4gs0lJ4U
 634pGxfCgpJR9W6nsim1St/3seb0+RSPw9WrPobOQuA2lhBmEmI1jLVqxhRJ5+400QHPn1Q4sB+
 +kAuZg21dbfpf1tCUTbx/IWh2aiKH7sbQrRN42pCcVoY24h9oL9itJ/caIKbzxNr1eZ/NqGHhun
 arkBF7aA7WZl0HVePJw==
X-Proofpoint-GUID: YnwGyfqU6SasJNq3iK0xSL1CU8zd0Cvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114528-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oldschoolsolutions.biz:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D96D6C5903

On 6/25/26 1:38 PM, Brian Masney wrote:
> Hi Konrad,
> 
> On Thu, Jun 25, 2026 at 11:44:12AM +0200, Konrad Dybcio wrote:
>> On 6/16/26 11:09 PM, Brian Masney wrote:
>>> Several qcom clk providers currently have a sync_state helper set to
>>> icc_sync_state(). With an upcoming change to the clk framework, if
>>> sync_state is not defined for the device, then the clk framework sets it
>>> to clk_sync_state().
>>>
>>> Clk providers that require their own sync_state will need to call the
>>> framework level clk_sync_state(). Let's introduce a new common helper
>>> qcom_cc_sync_state() that calls icc_sync_state() and clk_sync_state().
>>>
>>> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>> Signed-off-by: Brian Masney <bmasney@redhat.com>
>>> ---
>>>  drivers/clk/qcom/common.c | 9 +++++++++
>>>  drivers/clk/qcom/common.h | 1 +
>>>  2 files changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>>> index eec369d2173b..31382c49c948 100644
>>> --- a/drivers/clk/qcom/common.c
>>> +++ b/drivers/clk/qcom/common.c
>>> @@ -3,12 +3,14 @@
>>>   * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
>>>   */
>>>  
>>> +#include <linux/clk.h>
>>>  #include <linux/export.h>
>>>  #include <linux/module.h>
>>>  #include <linux/regmap.h>
>>>  #include <linux/platform_device.h>
>>>  #include <linux/clk-provider.h>
>>>  #include <linux/interconnect-clk.h>
>>> +#include <linux/interconnect-provider.h>
>>>  #include <linux/pm_runtime.h>
>>>  #include <linux/reset-controller.h>
>>>  #include <linux/of.h>
>>> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>>>  }
>>>  EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
>>>  
>>> +void qcom_cc_sync_state(struct device *dev)
>>> +{
>>> +	icc_sync_state(dev);
>>
>> As mentioned before, we really need to test for (qcom_cc_desc)->icc_hws
>> here
>>
>> If icc_sync_state() is called without an interconnect provider
>> being registered, the framework state gets messed up:
>>
>> --- drivers/interconnect/core.c
>> void icc_sync_state(struct device *dev)
>> {
>> 	struct icc_provider *p;
>> 	struct icc_node *n;
>> 	static int count; // function-static variable
>>
>> 	count++; // called for every clock controller in this revision
>>
>> 	if (count < providers_count) // kaboom
>> 		return;
>>
>> 	// actual sync_state never happens anymore
>>
>> Presumably one would pass this through drvdata, but be careful as
>> some drivers use it for other purposes today
> 
> My next version of this series that I haven't posted yet allows chaining
> the sync_state callbacks at the driver core level. It doesn't require
> any of the QC clk driver changes, and will allow us to play nicely with
> the pmdomain subsystem, and any others the move to sync_state in the
> future.
> 
> I think I see the confusion between us the last few rounds of review. In
> this series, I added qcom_cc_sync_state() and converted 6 drivers over to
> use it. (I excluded clk-cbf-8996.c since it is separate.) Only the 6
> drivers today that called icc_sync_state() now call qcom_cc_sync_state() ->
> icc_sync_state(). So from my vantage point it is the same overall
> functionality.
> 
> I didn't look at this from the perspective of qcom_cc_sync_state() would
> be common infrastructure, and a newly added driver in the future that may
> not interact with the ICC framework may use this. Is this correct?

Aaah right, my mistake. I assumed that adding that binding
qcom_cc_sync_state to all qcom clock drivers was the next step.

Konrad

