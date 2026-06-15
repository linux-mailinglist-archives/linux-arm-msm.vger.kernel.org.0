Return-Path: <linux-arm-msm+bounces-113067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lMSaAXx6L2o+BQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 06:07:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43988683338
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 06:07:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MWh7m8mA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=I+XmdOmE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113067-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113067-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A71A63007342
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 04:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD962E7385;
	Mon, 15 Jun 2026 04:07:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1A42D9780
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 04:07:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781496439; cv=none; b=qgPyTG8AtmAW3s7KTjhXXa/dWu8bph8X3pRiaYkHy5Fe60abEs+HN+Bhu6jktDPuCtfXB8D17xv9w7bh+vGvQ1ntM/iJjyVHuQg6pQnOz946RrmJZO4lUXSHg4vmjfZ1iNHhKACduqEyDyBgGob0hAv7lY4K7xcbUpPdiYVRwhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781496439; c=relaxed/simple;
	bh=uIOnfKo2h7zAEA64UfE4jeAAFtzp7e2deMojPvKaOLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVy9eReq4yzJwDUTnvzNMhMihxpDM5CXmOH3P4Cs0WuAx4+PsQA3I+oZ4oFm8xWFM+1s0yuIyMCU3PzIZ3Y6knyxTyrSm3xA6me1xcXBh76ykxjCy4aTaQpyxdLXQoQAr/c+I7xRmb4JyhHrtW8CDDjEDN1I9IwZNBzjwW6Sttk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWh7m8mA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+XmdOmE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kABF3307899
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 04:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dzTkqC16zOHCuTnK0OQk33CLzFmITZjYwvMS5SR0uBQ=; b=MWh7m8mA0GbNtmGC
	5fbPgKSbrMvi7kUDE/U7BbWQh9Ipb0EZxGck48CJ1v/2Hc789Ty0meElxJapV+ux
	bCFDSVLmkcSI5k87Lw0K849cbZVmjHfXvtNU8x70Y8JTu6Ii1j2WXZDUP/XAlgX2
	wrPg9Sv1KD+VQKyOJcrb64RkkymAPixrQCrxv9ZIC0oNgl3HpLKjnJgV4CdWhvnw
	H+fs58aWvmJIPfKviJxiH8Ce4UgLyBI4EGBx4YUwMEuD2r8iW2lOv0ilX7094fe2
	Np60bWF+IT9bv14prNtiOkC9S/GQvOr2mw+8o/AYm5oiHR2sXaRaQtKanpKxui0F
	iIcITw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6wf67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 04:07:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b934a336eso2317768a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781496436; x=1782101236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dzTkqC16zOHCuTnK0OQk33CLzFmITZjYwvMS5SR0uBQ=;
        b=I+XmdOmEaYcy2/WN+/RiG7VObnfAo1f2RGEUbLn7NkyD1Sa88DZFmLkPLm4eiJAbus
         2fvWqC7Hh5QeJSdMEgs8n2CGEjf6jIYjRNxak1oEteodLgnX7ztxxdOBH5PjCUD6HFIN
         swG9JEIojmJBGOZauBHq6jdhqanGBj7UVsvfH917WWg+TEOy9msYCoPACyprfVm7yyZa
         meEAON4wEMc4edlOJICf8VTF+wCzr+f+K80uT7KkiJD2WqZ06y/RgV612sgjedlHsgHH
         ANDMe7RhELRELU+iKPS9sWeHnMhFacbUQ705piL9Qd/gXyeWGDZTkqd87zysxn7CWmY4
         Peyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781496436; x=1782101236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzTkqC16zOHCuTnK0OQk33CLzFmITZjYwvMS5SR0uBQ=;
        b=ScdzIDy42N9ItiutZtMSe6VtNSKensYBha96vgseAEg5P14v2MhgHCBxDC1f2lfd/i
         WPdy1sq0K2XzywY4VXlaO1GUg9axybC2Xrm2b1EZDoyDepnChWAFsnLlhGmGV/w+UZj4
         05kzxExQaHuAawAaJmB+wGtaukj6EmGKx4YOVJGKNzXYs4Bpnx5oG58dbUcCtFEFq06s
         IzLLKX7yFrx21y+aaNIwJw0G4CpszkqUCJquUD5BKcDbkfJu9FVT9Cxn41DDq73UmHIe
         9aaOvzrnOUkEDoiRVhZ3iHUjFp8/qpbKZgBnIeIwl7h0YoebCmKlLZZ3/AjRa02nfO66
         JC8w==
X-Forwarded-Encrypted: i=1; AFNElJ8qcyc33U4sDTl4h8ELyvtODGwib0RGsKqrXzpt/OfRb5TsZhM8715ICCqQ7K3rlNf8Z0Wo35H7NwpcbahW@vger.kernel.org
X-Gm-Message-State: AOJu0YxT3dUwoXqBrDtEE9TJVAO7gxIOElZmq+UyCAkrqDYnAhVZ5mcz
	fan1OIwf84pxLW0kmIEBehVX4x9RMFh9uv9JulLOJIYVyP8vIhzsbHqk5RTPPFXngORkep6j+bc
	NIESKTm1F/NkawKIy6S80gSdn2eUu6dqPqb4SkMpMvCeVtmG6xYZkEIjxmA4C/UcBvC9X
X-Gm-Gg: Acq92OG32Qflkvz48ieNqS7ZVGPVJM8hJ1pH3aWxPDbJ1gn9xeWD9g+lquIzcynOw37
	pKgjwqz3NfSd5B0ZCEzd/Uzm03NEYKZylYojfaUnOKZ9RD5FtK5RV9MYDX+bKgXA8cphUpoiZzf
	mNBQ6+E4J3u/CZDBVtFlGq3+CPwW6BhFCZnLBsDmELM/IK8SutXcI1QF+NZ0mzKf8MXiUvK6xws
	7KcN8HGLkgN1X5L6EkHc069bhHTCvwxiKvnTKTge2no5nfER5JLzk2RGj+U3jyhNR+fqp6jc3jf
	i9r8KRJGohvASEteIZLJokY5sDmfaIv/qaBuDtbH804JpAw7ehLbIVOYE3NKgCEjBJia9H606eH
	iFMRKLQK/sdwEV+c4fHBZLLCkzwQyeAEQ1Q7Zd0vKJcYLHcPlvFZf5A==
X-Received: by 2002:a17:90b:1cc5:b0:36b:8baa:a683 with SMTP id 98e67ed59e1d1-37c2bd08184mr9382386a91.19.1781496436343;
        Sun, 14 Jun 2026 21:07:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc5:b0:36b:8baa:a683 with SMTP id 98e67ed59e1d1-37c2bd08184mr9382349a91.19.1781496435840;
        Sun, 14 Jun 2026 21:07:15 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1f07d77dsm8730067a91.6.2026.06.14.21.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 21:07:15 -0700 (PDT)
Message-ID: <cadb7c5d-d856-4217-9c02-98ba37713897@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 09:37:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 PATCH 1/1] bus: mhi: core: fix sys error handling latency
To: Qingtao Cao <qingtao.cao.au@gmail.com>
Cc: mani@kernel.org, kees@kernel.org, linux-arm-msm@vger.kernel.org,
        mhi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Qingtao Cao <qcao@digi.com>
References: <20260603011333.3306102-1-qingtao.cao.au@gmail.com>
 <20260603011333.3306102-2-qingtao.cao.au@gmail.com>
 <0d3e4046-42d5-4f91-be85-8681215e84b4@oss.qualcomm.com>
 <CAPcThSE7wY7Zm=H5npSdCqnEFv0VEMP=3x8UkyJqwfqyEscBsg@mail.gmail.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <CAPcThSE7wY7Zm=H5npSdCqnEFv0VEMP=3x8UkyJqwfqyEscBsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAzOSBTYWx0ZWRfXySq8HjQjLZ1x
 MjAOyxBc7vmmvifxREPKMgu2eaEb0eDbhNpENFTdVVOe3EngSLhK9VHvGnh9FCYyY2Z0D4AwdKZ
 CsbfgEJE+6cLeA+NFUxwyr9CKSxld3Y=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2f7a75 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=ArX4OyIvYgtutL6DSBwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: OV644Wf-PeIK2odrWqvAz7R3tde79ilJ
X-Proofpoint-ORIG-GUID: OV644Wf-PeIK2odrWqvAz7R3tde79ilJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAzOSBTYWx0ZWRfX35sb9o8fY1pI
 5/+rjbSsdf/KaMB7Lj8AJGS/hCgdQxIHJPPAaoDyMcESWT/EF+Lw1W3b9US+rLpngHzLvlQ9RnK
 JeeCTyeqfk+EQbx0JD1xGZaIyT0iKv9rsOG0vnqhg5fJZK2ALbaHaJ9mMavU+hL+OHI2IKDtjwx
 qb/ohK4VXIbJfOC3wS+IHqiFplAa0MxEysUaD7/Y40IF8hmCsv65n8INEv3KzpQzRm0hBHIPckm
 DBt8isyqvzhcZ9gAjpmH2f45SkiOBkU7ql6SMZtmuAZryewB1QUwLHkAVNy8i421MNXuAMDGAJ8
 8sawjVLBv7Yw4gBTMFpYZuRRKCOfF85+aCAoTfjldEW3UQ+Fc8T5i6QtOd+iRtkS7t1tEK/2txJ
 5cMUgxW8LM8OWLLgOdC3lIVgHKMJsbK8bohuz5Sxsfs/qzZF21QOOmKRwurinxym7L/SWq02JTe
 UhWj2UwKz7fVfTaFylg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150039
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113067-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:qingtao.cao.au@gmail.com,m:mani@kernel.org,m:kees@kernel.org,m:linux-arm-msm@vger.kernel.org,m:mhi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:quic_vpernami@quicinc.com,m:qcao@digi.com,m:qingtaocaoau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43988683338



On 6/11/2026 4:29 AM, Qingtao Cao wrote:
> Hello Krishna,
>
> Thanks for your reply!
>
> I am using an old 5.17.0 kernel and Sierra Wireless EM9291, the MHI
> pci_generic.c driver was modified a bit to support it,
> which is very similar to EM919x and the modem_sierra_em919x_config
> descriptor was reused for it (thus the timeout_ms
> = 24000ms, or 24s applies)
>
> Without the proposed change, the AT!RESET handling will finish after
> timeout in 24 seconds, whereas with the change,
> the handling can finish in about 11 seconds
>
> I was inspired by another earlier commit to fix MHI_STATE_RESET handling in
> mhi_pm_disable_transition().
>
> Warm regards,
> Qingtao

Looks like device is clearing reset state, but we are not getting any msi
to trigger mhi state event. As MSI is not expected to send msi from the
device after clearing MHI RESET.

Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.

> On Wed, Jun 10, 2026 at 10:40 PM Krishna Chaitanya Chundru <
> krishna.chundru@oss.qualcomm.com> wrote:
>
>>
>> On 6/3/2026 6:36 AM, Qingtao Cao wrote:
>>> Bring forward the idea to fix the power down latency in
>>> mhi_pm_disable_transition() further to mhi_pm_sys_error_transition()
>>> so that the transition into system error (triggered by AT!RESET)
>>> won't have to return only after the timeout of up to 24 seconds
>> Hi,
>>
>> Generally we should not see this delay, as device is actually clearing
>> reset. can you give more details what is the device you are using and
>> kernel you
>> are using etc.
>>
>> - Krishna Chaitanya.
>>> Signed-off-by: Qingtao Cao <qingtao.cao.au@gmail.com>
>>> ---
>>>  drivers/bus/mhi/host/pm.c | 14 +++-----------
>>>  1 file changed, 3 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>>> index f799503c8f36..9d29f1591a45 100644
>>> --- a/drivers/bus/mhi/host/pm.c
>>> +++ b/drivers/bus/mhi/host/pm.c
>>> @@ -651,21 +651,13 @@ static void mhi_pm_sys_error_transition(struct
>> mhi_controller *mhi_cntrl)
>>>       /* Trigger MHI RESET so that the device will not access host
>> memory */
>>>       if (reset_device) {
>>> -             u32 in_reset = -1;
>>> -             unsigned long timeout =
>> msecs_to_jiffies(mhi_cntrl->timeout_ms);
>>> -
>>>               dev_dbg(dev, "Triggering MHI Reset in device\n");
>>>               mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
>>>
>>>               /* Wait for the reset bit to be cleared by the device */
>>> -             ret = wait_event_timeout(mhi_cntrl->state_event,
>>> -                                      mhi_read_reg_field(mhi_cntrl,
>>> -
>>  mhi_cntrl->regs,
>>> -                                                         MHICTRL,
>>> -
>>  MHICTRL_RESET_MASK,
>>> -                                                         &in_reset) ||
>>> -                                     !in_reset, timeout);
>>> -             if (!ret || in_reset) {
>>> +             ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs,
>> MHICTRL,
>>> +                              MHICTRL_RESET_MASK, 0, 25000,
>> mhi_cntrl->timeout_ms);
>>> +             if (ret) {
>>>                       dev_err(dev, "Device failed to exit MHI Reset
>> state\n");
>>>                       write_lock_irq(&mhi_cntrl->pm_lock);
>>>                       cur_state = mhi_tryset_pm_state(mhi_cntrl,
>>


