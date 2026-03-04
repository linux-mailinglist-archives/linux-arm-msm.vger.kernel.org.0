Return-Path: <linux-arm-msm+bounces-95256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I1hEZ3Dp2mYjgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 06:31:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B671FADC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 06:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D6DD3019CA0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 05:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583D2255F2C;
	Wed,  4 Mar 2026 05:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JpheuJzU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D763368BD;
	Wed,  4 Mar 2026 05:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772602246; cv=none; b=VpiE8HaVIvlwA7ANo1iw5d0fTUyR0hcmdWksEdkv7dOk0Hj8ZAW2hU0xcYBF0ff93tXlxu9rlXw1bEkl6y8E1qLpDolwiiMTAJhzfadu4jUmZrDIykkgOeST8ned1y3vl0ulCmaDeGlP1saCDqrNFwXc68i9F8xTykER4lC3f9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772602246; c=relaxed/simple;
	bh=/rLN56w8uUlj3sFhYQW0fMyM7bA+B17oorbnbOI2PhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FeBeISeKmhLUfGLqoO4PgzlRK388We+eFqfxuw5ScPbENmjHrux6HX9jPtaknm8LhMaKlEgN9svZrHxi7iCLoks+fuFYIguZKuPkxMMGMWp2Y8/VCjwkgstyfYDuobCCN7alBplLq80mcbhcRPV5tg5u3+1DAFzzjV3wFyCFmaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JpheuJzU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQQP945101;
	Wed, 4 Mar 2026 05:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YOuaX7LBlc5litvvO9Y3kt6761ose5ueQJ74K6FKaqk=; b=JpheuJzUrXdUwbMC
	si4VWDqFZTB6sfiYPbzKTkhfvzIil8xgLtd3Xp/QC0K2hIZ5Lo2EQgCIoYCFHVeV
	xQo7iwJTh8IE+AwmtmByBZwuITgNXE/fSIBCED5QZqCZA7bd2mt9A6LwoYd42hC9
	P/xtBCgj6CpALyEA5JutgQckCRE5xoyOmKt/vOJj2at4zL88OLbRNQHzQ2OtXkU2
	wtSRSavTdiPh1pSY59Bclkd1ll8VpTu6leoIn4rclanFZcFO7NyDGcSyLI2EF5Jc
	b947YRtLXNmizHPt8L2ZvbYCmMzIM5rgnDHfwsSBYLPIGgIWrDL5RfBcvgiWPxXT
	HshnFA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfbpcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 05:30:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 6245UXqY023420
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Mar 2026 05:30:33 GMT
Received: from [10.218.1.24] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Mar
 2026 21:30:29 -0800
Message-ID: <3875d403-c18b-46b2-8052-6139ea2a01b3@quicinc.com>
Date: Wed, 4 Mar 2026 11:00:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: Bjorn Andersson <andersson@kernel.org>
CC: <konrad.dybcio@oss.qualcomm.com>, <herbert@gondor.apana.org.au>,
        <thara.gopinath@gmail.com>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_neersoni@quicinc.com>
References: <20260220072818.2921517-1-quic_utiwari@quicinc.com>
 <gtqvktl4wmtetth7qz3zl4osnd4yebhjwjxw6nroelzflk55u2@xmamdznupxfa>
Content-Language: en-US
From: Udit Tiwari <quic_utiwari@quicinc.com>
In-Reply-To: <gtqvktl4wmtetth7qz3zl4osnd4yebhjwjxw6nroelzflk55u2@xmamdznupxfa>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA0MiBTYWx0ZWRfX29CW0NnbVeHr
 PwgjZfA0zwcQDsKXe4DI3uxkwA1CssB7CayTYHJ89AySJWVcvtl++RztfFOVlBepqvWy6KT7HmA
 UjndIQyhDWObJmuW0shp8XaBi4vaxTf6tGw3yHwByYse963cAJXix9CJSQ+3iuM1hyfMfwSl6zS
 ktcQQGaj6iD2Y2hPP0LHYMbnwtVB+645yziUiGv6d+ZP/a4IhmEUGYy0cNhkYrln23YoQZYKH6u
 37S+fkocsUaGaoC98Zk1t5acgRjEiqzpM11LwZldLteUKoW0HLJg6HfVQ+QDdBjc0B8FG5GPlws
 ql/4Y1QlAHQJiODpm3I/MJn/zDS75W6XWfiYi4086owERtjz7wEjPC5XpGNXs3cVCfRVYMAFHSX
 wf2ZFYFUuJkta3CeLRllODiHl0pJP3JQiMhwoJkoXbsx4gKQb5b64KDMMl5iHYZp0e5AwKuN72P
 8v64JIMk9n+YPjLsi7w==
X-Proofpoint-ORIG-GUID: Gzj64y9oTMNZNt1Hwz1h0PgGvc2NgJMb
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7c37a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YhpZ7qyB5-F-4TdAq1YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Gzj64y9oTMNZNt1Hwz1h0PgGvc2NgJMb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1011 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040042
X-Rspamd-Queue-Id: C6B671FADC1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gondor.apana.org.au,gmail.com,davemloft.net,vger.kernel.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	TAGGED_FROM(0.00)[bounces-95256-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:dkim,quicinc.com:email,quicinc.com:mid,qualcomm.com:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_utiwari@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Thanks for the review.
I’ll be posting a v8 soon with oss.qualcomm.com.

On 2/21/2026 5:09 AM, Bjorn Andersson wrote:
> On Fri, Feb 20, 2026 at 12:58:18PM +0530, quic_utiwari@quicinc.com wrote:
>> From: Udit Tiwari <quic_utiwari@quicinc.com>
>>
>> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
>> runtime power management (PM) and interconnect bandwidth control.
>> As a result, the hardware remains fully powered and clocks stay
>> enabled even when the device is idle. Additionally, static
>> interconnect bandwidth votes are held indefinitely, preventing the
>> system from reclaiming unused bandwidth.
>>
>> Address this by enabling runtime PM and dynamic interconnect
>> bandwidth scaling to allow the system to suspend the device when idle
>> and scale interconnect usage based on actual demand. Improve overall
>> system efficiency by reducing power usage and optimizing interconnect
>> resource allocation.
>>
>> Make the following changes as part of this integration:
> 
> "this integration" is internal lingo. In fact I think you can omit this
> whole paragraph, because the bullets here are expected.
> 
>>
>> - Add support for pm_runtime APIs to manage device power state
>>    transitions.
>> - Implement runtime_suspend() and runtime_resume() callbacks to gate
>>    clocks and vote for interconnect bandwidth only when needed.
>> - Replace devm_clk_get_optional_enabled() with devm_pm_clk_create() +
>>    pm_clk_add() and let the PM core manage device clocks during runtime
>>    PM and system sleep.
>> - Register dev_pm_ops with the platform driver to hook into the PM
>>    framework.
>>
>> Tested:
> 
> This isn't very useful to carry in the git history, please move this
> down below '---'.
> 
>>
>> - Verify that ICC votes drop to zero after probe and upon request
>>    completion.
>> - Confirm that runtime PM usage count increments during active
>>    requests and decrements afterward.
>> - Observe that the device correctly enters the suspended state when
>>    idle.
>>
>> Signed-off-by: Udit Tiwari <quic_utiwari@quicinc.com>
> 
> Please switch to oss.qualcomm.com
> 
>> ---
>> Changes in v7:
>> - Use ACQUIRE guard in probe to simplify runtime PM management and error paths.
>> - Drop redundant icc_enable() call in runtime resume path.
>> - Explicitly call pm_clk_suspend(dev) and pm_clk_resume(dev) within the
>>    custom runtime PM callbacks. Since custom callbacks are provided to handle
>>    interconnect scaling, the standard PM clock helpers must be invoked manually
>>    to ensure clocks are gated/ungated.
>>
>> Changes in v6:
>> - Adopt ACQUIRE(pm_runtime_active_try, ...) for scoped runtime PM management
>>    in qce_handle_queue(). This removes the need for manual put calls and
>>    goto labels in the error paths, as suggested by Konrad.
>> - Link to v6: https://lore.kernel.org/lkml/20260210061437.2293654-1-quic_utiwari@quicinc.com/
>>
>> Changes in v5:
>> - Drop Reported-by and Closes tags for kernel test robot W=1 warnings, as
>>    the issue was fixed within the same patch series.
>> - Fix a minor comment indentation/style issue.
>> - Link to v5: https://lore.kernel.org/lkml/20251120062443.2016084-1-quic_utiwari@quicinc.com/
>>
>> Changes in v4:
>> - Annotate runtime PM callbacks with __maybe_unused to silence W=1 warnings.
>> - Add Reported-by and Closes tags for kernel test robot warning.
>> - Link to v4: https://lore.kernel.org/lkml/20251117062737.3946074-1-quic_utiwari@quicinc.com/
>>
>> Changes in v3:
>> - Switch from manual clock management to PM clock helpers
>>    (devm_pm_clk_create() + pm_clk_add()); no direct clk_* enable/disable
>>    in runtime callbacks.
>> - Replace pm_runtime_get_sync() with pm_runtime_resume_and_get(); remove
>>    pm_runtime_put_noidle() on error.
>> - Define PM ops using helper macros and reuse runtime callbacks for system
>>    sleep via pm_runtime_force_suspend()/pm_runtime_force_resume().
>> - Link to v2: https://lore.kernel.org/lkml/20250826110917.3383061-1-quic_utiwari@quicinc.com/
>>
>> Changes in v2:
>> - Extend suspend/resume support to include runtime PM and ICC scaling.
>> - Register dev_pm_ops and implement runtime_suspend/resume callbacks.
>> - Link to v1: https://lore.kernel.org/lkml/20250606105808.2119280-1-quic_utiwari@quicinc.com/
>> ---
>>   drivers/crypto/qce/core.c | 87 +++++++++++++++++++++++++++++++++------
>>   1 file changed, 75 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
>> index b966f3365b7d..776a08340b08 100644
>> --- a/drivers/crypto/qce/core.c
>> +++ b/drivers/crypto/qce/core.c
>> @@ -12,6 +12,9 @@
>>   #include <linux/module.h>
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/pm_clock.h>
>>   #include <linux/types.h>
>>   #include <crypto/algapi.h>
>>   #include <crypto/internal/hash.h>
>> @@ -90,6 +93,11 @@ static int qce_handle_queue(struct qce_device *qce,
>>   	struct crypto_async_request *async_req, *backlog;
>>   	int ret = 0, err;
> 
> First use of ret is now an assignment, so please drop the unnecessary
> zero-initialization.
> 
>>   
>> +	ACQUIRE(pm_runtime_active_try, pm)(qce->dev);
>> +	ret = ACQUIRE_ERR(pm_runtime_active_auto_try, &pm);
> 
> Luckily, this - to me - incomprehensible construct got some useful
> wrappers in ef8057b07c72 ("PM: runtime: Wrapper macros for
> ACQUIRE()/ACQUIRE_ERR()"), merged back in November. So, you should
> instead use the form:
> 
> 	PM_RUNTIME_ACQUIRE(qce->dev, pm);
> 	if ((ret = PM_RUNTIME_ACQUIRE_ERR(&pm)))
> 		return ret;
> 	
> or (I don't think we really care about the specific error returned):
> 
> 	PM_RUNTIME_ACQUIRE(qce->dev, pm);
> 	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> 		return -Esome_specific_error;
> 
> 
> Although I presume that's PM_RUNTIME_ACQUIRE_AUTOSUSPEND() in your case.
> 
>> +	if (ret)
>> +		return ret;
>> +
>>   	scoped_guard(mutex, &qce->lock) {
>>   		if (req)
>>   			ret = crypto_enqueue_request(&qce->queue, req);
>> @@ -207,23 +215,34 @@ static int qce_crypto_probe(struct platform_device *pdev)
>>   	if (ret < 0)
>>   		return ret;
>>   
>> -	qce->core = devm_clk_get_optional_enabled(qce->dev, "core");
>> -	if (IS_ERR(qce->core))
>> -		return PTR_ERR(qce->core);
>> +	/* PM clock helpers: register device clocks */
>> +	ret = devm_pm_clk_create(dev);
>> +	if (ret)
>> +		return ret;
>>   
>> -	qce->iface = devm_clk_get_optional_enabled(qce->dev, "iface");
>> -	if (IS_ERR(qce->iface))
>> -		return PTR_ERR(qce->iface);
>> +	ret = pm_clk_add(dev, "core");
>> +	if (ret)
>> +		return ret;
>>   
>> -	qce->bus = devm_clk_get_optional_enabled(qce->dev, "bus");
>> -	if (IS_ERR(qce->bus))
>> -		return PTR_ERR(qce->bus);
>> +	ret = pm_clk_add(dev, "iface");
>> +	if (ret)
>> +		return ret;
>>   
>> -	qce->mem_path = devm_of_icc_get(qce->dev, "memory");
>> +	ret = pm_clk_add(dev, "bus");
>> +	if (ret)
>> +		return ret;
>> +
>> +	qce->mem_path = devm_of_icc_get(dev, "memory");
>>   	if (IS_ERR(qce->mem_path))
>>   		return PTR_ERR(qce->mem_path);
>>   
>> -	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
>> +	/* Enable runtime PM after clocks and ICC are acquired */
> 
> It wouldn't hurt to continue this sentence to include that you're doing
> it like that so that clocks and interconnect votes are applied by the
> resume callback (I assume that's your reason for the ordering at least).
> 
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ACQUIRE(pm_runtime_active_try, pm)(dev);
>> +	ret = ACQUIRE_ERR(pm_runtime_active_auto_try, &pm);
> 
> As above.
> 
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -245,9 +264,52 @@ static int qce_crypto_probe(struct platform_device *pdev)
>>   	qce->async_req_enqueue = qce_async_request_enqueue;
>>   	qce->async_req_done = qce_async_request_done;
>>   
>> -	return devm_qce_register_algs(qce);
>> +	ret = devm_qce_register_algs(qce);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Configure autosuspend after successful init */
>> +	pm_runtime_set_autosuspend_delay(dev, 100);
>> +	pm_runtime_use_autosuspend(dev);
>> +	pm_runtime_mark_last_busy(dev);
>> +
>> +	return 0;
>>   }
>>   
>> +static int __maybe_unused qce_runtime_suspend(struct device *dev)
>> +{
>> +	struct qce_device *qce = dev_get_drvdata(dev);
>> +
>> +	icc_disable(qce->mem_path);
>> +
>> +	return pm_clk_suspend(dev);
>> +}
>> +
>> +static int __maybe_unused qce_runtime_resume(struct device *dev)
>> +{
>> +	struct qce_device *qce = dev_get_drvdata(dev);
>> +	int ret = 0;
>> +
>> +	ret = pm_clk_resume(dev);
> 
> What is the reason to use pm_clk_add() if you need to manually
> enable/disable them anyways?

Regarding pm_clk_add(): the intent was to register the device clocks 
with the PM clock framework so the runtime PM callbacks could use 
pm_clk_suspend() / pm_clk_resume() instead of open-coding clock gating.

However, since this driver already needs explicit runtime PM callbacks 
anyway (for interconnect votes, etc.), and pm_clk_add() by itself 
doesn’t provide any “automatic” clock toggling, this doesn’t really buy 
us much. I’ll simplify the next revision by dropping the PM clock 
registration and handling the clocks directly in the runtime PM callbacks.

> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
> 
> icc_disable() will set the "enabled" flag on the internal interconnect
> data structures, which causes the vote to be skipped in aggregation.
> 
> So, not only does it look unbalanced with icc_disable() vs icc_set_bw()
> in suspend/resume, I don't think you have a bandwidth vote after the
> first suspend, unless you call icc_enable() here.

Thanks for the note about icc_disable() affecting the internal enabled 
flag and aggregation.

To address this, I see two options:

(1) Keep icc_disable() in runtime suspend, but then explicitly call 
icc_enable() in runtime resume before restoring the bandwidth vote 
(similar to what I did here: 
https://lore.kernel.org/lkml/20260210061437.2293654-1-quic_utiwari@quicinc.com/).

(2) Drop icc_disable() entirely and instead use icc_set_bw(path, 0, 0) 
in runtime suspend, restoring the BW in runtime resume.

Is option (2) the preferred approach for ICC consumers? My understanding 
is it avoids the “disabled path skipped during aggregation” issue and 
keeps the state machine balanced.

Udit
> 
>> +	if (ret)
> 
> Just put pm_clk_suspend(dev) here and return ret; below. Skip the goto.
> 
> Regards,
> Bjorn
> 
>> +		goto err_icc;
>> +
>> +	return 0;
>> +
>> +err_icc:
>> +	pm_clk_suspend(dev);
>> +	return ret;
>> +}
>> +
>> +static const struct dev_pm_ops qce_crypto_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(qce_runtime_suspend, qce_runtime_resume, NULL)
>> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
>> +};
>> +
>>   static const struct of_device_id qce_crypto_of_match[] = {
>>   	{ .compatible = "qcom,crypto-v5.1", },
>>   	{ .compatible = "qcom,crypto-v5.4", },
>> @@ -261,6 +323,7 @@ static struct platform_driver qce_crypto_driver = {
>>   	.driver = {
>>   		.name = KBUILD_MODNAME,
>>   		.of_match_table = qce_crypto_of_match,
>> +		.pm = &qce_crypto_pm_ops,
>>   	},
>>   };
>>   module_platform_driver(qce_crypto_driver);
>> -- 
>> 2.34.1
>>
>>

