Return-Path: <linux-arm-msm+bounces-103328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FNJC/NO4Gm0egAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 04:52:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0269409C1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 04:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11167306A81B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 02:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92A02750FB;
	Thu, 16 Apr 2026 02:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AN2sT/lz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MfUF98r0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749702494D8
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 02:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776307946; cv=none; b=c66s7jlEPuqbRE053NyuMNYs9p5BWuHMzLQ15wR47AbwM5ebbzzwgVD/NZw60haKfXsNVE+a0HobaoluQrUQ69LlhgCvQ1MFBCDCstDs9c68/uhym2P/XewJ7L3sugj91VVD9YGFJrT90LPh6sysjlV8VQXFhgYRlS039pbSnBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776307946; c=relaxed/simple;
	bh=MIayYeKGsp0+wHyOm8gvKUDw3yj7EhYZIQu5YXn8d4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFZWu2xp8ud/MsFRQutA0HwZ0vIy2ycOUfmdYaNjGXugkaPE9FuhE8PQc2HCjmcFjtkiBj7VOooIJj30aA3NHwjB/OEXdns2q1T6k1cWK/eRlTk5kWftzMom/rABxf9AWoNozZsaRKAZ2K6MKY11lTLAN88Li6CDVcQB4EcA4Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AN2sT/lz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MfUF98r0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G0ojTh3734203
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 02:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MM/4qGZSMye1GhW1lzkr3nXABQCTmZg+bPiPmHLZyAg=; b=AN2sT/lzBbm0oGJ2
	vetKWU5LaXuFdmtAH5ycxVyn5M81wA3EGW7WBjCJbGl4/t9q9Azq0wc1nVFy8Jur
	Iu6IBO8LwjSa+5dMj7E0dT3WMNj/6nLY4bYoJlfxVCJJDK9UGkN+mlR9jnO3TktV
	yYnE4gn0HbtQQo2xUm3REGh/sFK1mdnOHEHryJC0eZ00FndGflnl53/tq+c1n3Nk
	9aDq9Mgvfzgj5V2CpeEGUnbRkTggKOfgWki/1+6Mz9z+J57sP3Iq1taUdqixTanm
	XQB4db3kV1nrf41sfAhI/E5yATgWKHQ4Mq5mzzCHv+xdcn3iWpFMyysp5NI+/xNJ
	sFtspQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcqwj3ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 02:52:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2eba42b8dso39751615ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 19:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776307943; x=1776912743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MM/4qGZSMye1GhW1lzkr3nXABQCTmZg+bPiPmHLZyAg=;
        b=MfUF98r0ckXUXwL8qcL6u0gY9Z8lddWSdWGSjMiFqaGk5luoFAjicc1dLg9Gtg5NHb
         JuOyEHOaDtbd2L72Xx+PtJqkVwAzfH8e3GZ71kvE8Zr+KJm2iTA61JVERz8bv+26qIil
         3dx+eGROcxvsmndPTQzMh3Fv9kE444QrEvLLRAHUIyBgZkIyCpFGf4q3edEOb9JjspkJ
         CmaRRmSkroMUyNnkBqFO9rjfu16LEP4OIAnSzm2GYIGooLFib17kfEYNtpIpxAaO0MK6
         VzSu9rQE54RyJXvk0oeBm7HFMOf6jdDRxwg+PwzQ+xwY/57TZSCqTuUQFm4SlkZfNIXy
         +6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776307943; x=1776912743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MM/4qGZSMye1GhW1lzkr3nXABQCTmZg+bPiPmHLZyAg=;
        b=ivbr56Tra3sagvf7WJO9EPXQ8DMK+SY5oEFLa5vPe5wbvGJfsxbozmttQhwP8ONCTa
         ijKGnHcRj3nPVXnJNbCKQ2oy5wERTBRom6oiprSfMw3sg5h1LJbmm980gABdP/Kfdrzt
         H/kWjDv6KtWGzr4W9tXT2WTzgB7IQNFuU+yNPa40ZLLs+6r8iNGjuL9GLSZ5AHvFhB59
         2Em3RrpEvfa4JtMR6LTYx3ocnN0UN5309hma11Bv72SNAgenkhac1+Wan57sgCxFGNpX
         YXsdwGXrpDvvTVKt8sF3qEy3ccNBaJ4PKPKOu8CTYMRTabtmcTq5EmHTedemplo626+D
         FW6g==
X-Forwarded-Encrypted: i=1; AFNElJ+T+kvM8p1FboRJA3kEyhJZISiOlUfiZ0He962s1Y7H0pq7qoJfzy5CCySTC5IBfIwicEehy3bW/F+rOfw7@vger.kernel.org
X-Gm-Message-State: AOJu0YxKl4gqNLlscv+zzlTpXM3KUm/ZRusszkE+Aw+ZIhe7bM+y4RYY
	dGl62fY7Gd9zn/2b3asPgqC5IayeW8MUoxf+EORXo1P3is30OI3kbG/NHaMNFqRkSCtQmw7Byfo
	qhFgrVXxxT1hdn3Ro8qpFIPx53pF6Xm7ENIAelmtm8zzzUzD9VgRKzpo45K79vVKdUsDc
X-Gm-Gg: AeBDiesKnfSLWXar7foyYpdUdfhx/l/epTig6FI/QNBDTLLe1qvwg3LD3pbe4XMhP59
	mlG9luu058VA7GMIDsR8YzbsvkPzrrXiCIrDceczheWW1i6dZewAJuoZAzPzXY/1eo/kGRJJG1R
	S3mTJRUBe8zCTr7cDK2E9BgVy5wIN+FYsC2EwvGuAcllPrEEFqFZox2nJ3Lsg+KK/M4/Wht02pt
	doXMA/qPVhu31sQC3y5rbXOghO6XpDlO/1RIpgln4X3Ux+8g299v+7jgy1OK/TiNGhPYkinFfwY
	F+m6+MPeojfEmq4ZPmbBql2VVRLRkV7bd1i1bob5F2cF2S39f0O+jDwgjnwImi8gOrkLFocuvH3
	Q4l+VNWKCEcMChjPKgi4oG3U0yWZkq/TyrM+mO/Oq8FPy8rtDI1Sb+2mE4If0BPDeWi0RDb0fkG
	woeJoLPsDMFQm3vebm
X-Received: by 2002:a17:902:ea0a:b0:2b4:6106:cc65 with SMTP id d9443c01a7336-2b46106cdcfmr144733095ad.44.1776307942137;
        Wed, 15 Apr 2026 19:52:22 -0700 (PDT)
X-Received: by 2002:a17:902:ea0a:b0:2b4:6106:cc65 with SMTP id d9443c01a7336-2b46106cdcfmr144732515ad.44.1776307941487;
        Wed, 15 Apr 2026 19:52:21 -0700 (PDT)
Received: from [10.133.33.143] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47826e306sm36720735ad.46.2026.04.15.19.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 19:52:21 -0700 (PDT)
Message-ID: <e9720deb-d46c-4556-b69d-1dec00cc7892@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:52:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: Check glink->edge in
 glink_subdev_stop()
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
 <20260409-rproc-attach-issue-v1-2-088a1c348e7a@oss.qualcomm.com>
 <adkF7EY1KVRNO01o@linaro.org>
 <c6a9936b-9f44-4bea-93a1-17d145e64eec@oss.qualcomm.com>
 <ad36erdhcvnIvFMH@linaro.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <ad36erdhcvnIvFMH@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SD7X61zC_Qp5uygVgzVotuRF80CFIrt8
X-Proofpoint-GUID: SD7X61zC_Qp5uygVgzVotuRF80CFIrt8
X-Authority-Analysis: v=2.4 cv=XOIAjwhE c=1 sm=1 tr=0 ts=69e04ee7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0U6zEqSkkI0Ln9L63JMA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAyNSBTYWx0ZWRfXy2F+lz9Ldqhz
 I8qJJsfhXjcMbfZYxh+N9RWIMrdTxIHHRh7QS4N/UhsdziuzGgpVx5EP6Bzoyx1PKV/0e25W0mS
 yhjaTd39RPyAiBRRxIu5MhHfST7XLyaI6lBsD+qqcGlZzXUmCRnja+0i5tHpyifAetGbeg6+MxU
 5UZ5DGKEwWHyW0xN7sqHdVnZk0rwQn+wGeRcMfqOYsT9DifBEy4WIsZczwV2ZsyhceK8J+rWOGw
 EFlutWJyMu0MwKF/7AQHCz8VY8VRT9FuHDEmyJxuBKKYYCo0tMe/yhe3mwUyZ4F+k+njUzV6tP+
 TbymKQek5bdbkpZcOXl8eyLbS1NISGXS0hvn94KNdkvdRdeWv2IzLRiXbTB/5uxtjqQB2nLLGZ4
 knZTFo91+YKvtcC+c2zE64twNUGH4FNDJT5izvJhLH74lxTzB7Amq6Y+uS7Z2bBgpr0tfHCAHfr
 tBkCof22G/pRq9BAt9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160025
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103328-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D0269409C1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 4:27 PM, Stephan Gerhold wrote:
> On Tue, Apr 14, 2026 at 11:23:50AM +0800, Jingyi Wang wrote:
>> On 4/10/2026 10:15 PM, Stephan Gerhold wrote:
>>> On Thu, Apr 09, 2026 at 01:46:22AM -0700, Jingyi Wang wrote:
>>>> For rproc that doing attach, glink_subdev_start() is called only when
>>>> attach successfully. If rproc_report_crash() is called in the attach
>>>> function, rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() could
>>>> be called and cause NULL pointer dereference:
>>>>
>>>>    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
>>>>    Mem abort info:
>>>>    ...
>>>>    pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
>>>>    lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
>>>>    ...
>>>>    Call trace:
>>>>     qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
>>>>     glink_subdev_stop+0x1c/0x30 [qcom_common]
>>>>     rproc_stop+0x58/0x17c
>>>>     rproc_trigger_recovery+0xb0/0x150
>>>>     rproc_crash_handler_work+0xa4/0xc4
>>>>     process_scheduled_works+0x18c/0x2d8
>>>>     worker_thread+0x144/0x280
>>>>     kthread+0x124/0x138
>>>>     ret_from_fork+0x10/0x20
>>>>    Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
>>>>    ---[ end trace 0000000000000000 ]---
>>>>
>>>> Add NULL pointer check in the glink_subdev_stop() to make sure
>>>> qcom_glink_smem_unregister() will not be called if glink_subdev_start()
>>>> is not called.
>>>>
>>>
>>> You mention the actual root problem here: Why is glink_subdev_stop()
>>> called if glink_subdev_start() wasn't called?
>>>
>>> The call to rproc_start_subdevices() in __rproc_attach() makes sure that
>>> all subdevices are in consistent state when exiting the function (either
>>> prepared+started or stopped+unprepared). Only if all subdevices were
>>> started successfully, the rproc->state is changed to RPROC_ATTACHED.
>>>
>>> In your case, attaching the rproc failed so the rproc->state should be
>>> still RPROC_DETACHED. All subdevices should be stopped+unprepared. We
>>> shouldn't stop/unprepare any subdevices again in this state, they all
>>> might crash like glink does here.
>>>
>>> We know that subdevices are already stopped+unprepared in RPROC_DETACHED
>>> state, so I think you just need to skip rproc_stop_subdevices() and
>>> rproc_unprepare_subdevices() inside rproc_stop() in this case, see diff
>>> below.
>>>
>>> @@ -1708,8 +1709,9 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>>>    	if (!rproc->ops->stop)
>>>    		return -EINVAL;
>>> -	/* Stop any subdevices for the remote processor */
>>> -	rproc_stop_subdevices(rproc, crashed);
>>> +	/* Stop any subdevices for the remote processor if it was attached */
>>> +	if (rproc->state != RPROC_DETACHED)
>>> +		rproc_stop_subdevices(rproc, crashed);
>>>    	/* the installed resource table is no longer accessible */
>>>    	ret = rproc_reset_rsc_table_on_stop(rproc);
>>> @@ -1726,7 +1728,8 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>>>    		return ret;
>>>    	}
>>> -	rproc_unprepare_subdevices(rproc);
>>> +	if (rproc->state != RPROC_DETACHED)
>>> +		rproc_unprepare_subdevices(rproc);
>>>    	rproc->state = RPROC_OFFLINE;
>>
>> In this case, rproc_crash_handler_work()->rproc_trigger_recovery()->
>> rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() is called,
>> "rproc->state = RPROC_CRASHED" is set in the rproc_crash_handler_work
>> before rproc_boot_recovery is called, so checking RPROC_DETACHED can
>> not work for this case.
>>
> 
> You're right, I forgot about that. I think we need a more generic
> solution for this though. rproc_stop_subdevices() should not be called
> without a prior call to rproc_start_subdevices().
> 
> I think there are a couple of options for this:
> 
>   - Add a bool "subdevs_started" to struct rproc and manage that
>     separately from the rproc->state.
> 
>   - Track the rproc state before the crash separately (something like
>     rproc->state_before_crash) and check that in the stop path.
> 
>   - Add a new state RPROC_CRASHED_DETACHED to make sure the states are
>     unique.
> 
>   - ...
> 

Sure, I think a bool like subdevs_started will be better for maintain?

> Does the same issue also exist in qcom_pas_stop() of "[PATCH v5 4/5]
> remoteproc: qcom: pas: Add late attach support for subsystems" [1]?
> There you check for pas->rproc->state != RPROC_ATTACHED, wouldn't this
> also fail for the RPROC_CRASHED case?
> 

I tested calling rproc_report_crash directly during qcom_pas_attach but
did not see issue, handover_issued is set only if attach is success
so "handover = qcom_q6v5_unprepare(&pas->q6v5);" will return false and
"qcom_pas_handover(&pas->q6v5);" will not be called.

Thanks,
Jingyi

> Thanks,
> Stephan
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com/


