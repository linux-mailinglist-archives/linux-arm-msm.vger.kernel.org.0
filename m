Return-Path: <linux-arm-msm+bounces-110739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RyoZAQuLHmrjkwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:49:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 95365629E8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F18363006695
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB72A3B3BEC;
	Tue,  2 Jun 2026 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCe3oWOn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajZBnv5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AF83A8FE8
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780386566; cv=none; b=oSbrMJSpjbu25ySaMDYS05/NCKPMa4uPLF6fgIc5DyGj3IFSBcVzgsURZrZvpy+P0EHH116/MYrh+sKR6QsNWzQ6Prkwmnv6TXM+mt6lmsbPVFnteCAMl6ORln7AvgEG4B6Vd9FHvER+YQiTYhwRUHbNZMC/rSE+Z/KRPcz5/xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780386566; c=relaxed/simple;
	bh=MBYrlWGRXUhaChKy3GOMO8jIKccnmzMEQbiqE/azJzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EewZvFxcj8JB00ONyDVLBBFVi4FG8Z4fLFV4jzOfawdMIVV37NiRwHEv2yG7hqgNkozdZOPf1hllnC273A6lrcT2hvbt/mca9AG/2WZb+HhKfQ8HKPK2MJ9F52GmN2YH9yi+AUg0ofX8v2hXMfCjWESfQG/bZwdkwwL23Zv1P6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCe3oWOn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajZBnv5L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6527gS0A3302622
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 07:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YDdEChdOuz5vhEBHofl90s3kNaFQdp9Q/jmTxWEH9Y8=; b=hCe3oWOnqcgVGRAJ
	+9IhOdG/zNmP0uBHEFnV47ire3nAm5RQYKytuot9eQqsLCg/nbEEJMSMdhL96/Ze
	i984VghdAbeaa3FQ6GdKVPRaBjmL3zcRWmz6hCHEz9nBtK/nuJSi9RzybcKqef0Q
	THbj5dq4jK9lFStY0xZeFttexOFkFireeLGzELITAfmz7JQu+opP2l0QznO+KSOu
	vKISd+DOMhigXFI8dScEzlfxC50tSw39kKtyZr4OzhpyB2WC8eLg7DkArifVmizl
	6z1oCW6VWXn2pVmD/hWh/n9cOVr3CrWE4hNy8H7oH8cZn1AKrzxEQ83kem9ig959
	ufusfw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu18g0x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 07:49:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0532a6588so28158125ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780386563; x=1780991363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YDdEChdOuz5vhEBHofl90s3kNaFQdp9Q/jmTxWEH9Y8=;
        b=ajZBnv5LYMviMbKN4mGfxhuu/Jqh6qPR3butO3qB8/W94LX4bsXBe9olyoYj3k1E3R
         RLEUR3Mw0IGVz9h0YiPxtVsZ/0FLi9w5frzl8cBkvTUDfSN0hswJU8RNS+pm9HqU2TTT
         e1qDaUzvoawsx/L6qYa5LWIjQ/LjjOIQI1vE3P7chh1lDZXAZu3QPh+iEiWnkSHEu8sn
         Ij6ST5H+MLIyZn3bmUPQ/xtozq4DrBpJRKK9+MKMEGpjHlrZuJP38vKU9YSI71qd4pcr
         nbtNTTFtZrK4o+3yFe0BVJR52IFoBlpio9Gu+PhQckobwTPnRsTYTuFNUBjazNdyiPgm
         n3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780386563; x=1780991363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDdEChdOuz5vhEBHofl90s3kNaFQdp9Q/jmTxWEH9Y8=;
        b=WORuODyfQ4J7JJ/2exyF4Ao3LcgUtOjxnAdm84dAWwoQfsXj9DEpsnQwnPvBjOXRP9
         u3CsDU4pW1BoASa2fzN+Ha7Dsv0KlNE5isbJ7g9jsDQDWTJAFhRYgt/04l2eCl8HCiXL
         omxtmUWaVTTwp4jnU/slkT/Aqp73jhHaNikxx8wt7IzPnD2G78OWCWuZEpBhUWws4lj6
         c5+yyHVvgPAVKJcOepMZZKRZGHT/lCj+WUSpXmttIN1VDWUt8Wop9Ibet10TdsZ1wWsr
         O4DyOubFqbAW7b8vYZYOjRn1GVpcdm/ESSdCvQpCu+GC7/VmwwjEwipeAOMjRN35p1U2
         qyew==
X-Forwarded-Encrypted: i=1; AFNElJ/idohZFRsfRh4z8U+Fv0mHlrQkj10dpD7pS6s90xkkCA58sfVbkw8IcBH4fwww/8Ht/knqt1GuWzs1zNhe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1RWxAIs9C/lmyPWLxk1tZ/plGzeBF+0EvVg+3DzDEwg8BUkjN
	i7Pjs1hvTiEacsr31KNwV7ltDfgoTYKDk4IEHfOszURVVrGWQgq2blfp22Zi/+MTSWBMagPI9eI
	IOwCSfnunIu7TvTXLp6+UYa2Ph0jBLByxSvO1Ji5nvKYaVWb29HxBVbX0Z4sMJJJ8wbCO
X-Gm-Gg: Acq92OHHrJI7VQMz/kS2OCw61igXQPNvc4rI/jGHPTQeaJs6LERUyjI20o6Szr+umwu
	lW/kCUQ0t+XQmru9mkNMWz7EeySNuRA/jqGLpQ1xSMknZrg9pzVVPRtfhomjkGz5I/feL3KpMWC
	2i2/MVW7mjTLevdybJ63fHY4LPulhIE+ZD9yFSk9xk9+vQXEwpMSuc3Mzc3zoBbZf0sL7NfERnH
	VBS/gi+mlfBr4SZJPtVq7pQMCsdvJWGBrTyoyVtt/h1OClDQ0o8jHYPM7FlGr8ys78s2VQ3nNCW
	klPzNBoEdMChIk6INqaY8R4OeCyQxL5SgcDA+aBszN18c672zLHQ3ZXNXbBxMi7Nmy3KLC76gz6
	nK4wrnUtvSmDRyPKy60ZkGE9gj5HKKM7JAj72oDgBDn0WQbQXN97b8fcjX37lWAhaMdDZRaWQPu
	DmaO56dY9fRFZqLnR9lLlcZDoYwA==
X-Received: by 2002:a17:903:2d1:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c0e5eef815mr76947505ad.20.1780386563325;
        Tue, 02 Jun 2026 00:49:23 -0700 (PDT)
X-Received: by 2002:a17:903:2d1:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c0e5eef815mr76946845ad.20.1780386562337;
        Tue, 02 Jun 2026 00:49:22 -0700 (PDT)
Received: from [10.133.33.72] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm128255215ad.52.2026.06.02.00.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 00:49:21 -0700 (PDT)
Message-ID: <b51b8057-47c9-429a-b209-e56cddbe9ca7@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 15:49:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, shengchao.guo@oss.qualcomm.com
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <ahBG6jKYdSAboWjs@linaro.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <ahBG6jKYdSAboWjs@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a1e8b04 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sGMcLsgT0xZ_I58ti9EA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3MCBTYWx0ZWRfX7+5g2oqXt1UB
 7hIQSBwp6EQqf2cCkM463JjbNrW1zD2/RXmsLHzkvOY9RLPPOW5k/qoO3rLpENHXvB18G671Hbf
 fzowORFD8IRno6drqsoWCuiwwwRNnPtPjV/8YRLeLmRg8kvgYYWSTj2H9j0xn95pW2HZZhWyyNQ
 tg4xzpMsItBz36j10tAiwvzN0qM/FpIOegeIw3o+IIkw27tIpRSjMCk7Lcmos/Y+JunpUDTC3kY
 x9Z8ne01bgkRoGP0g12vWkBMWQvPpr3Zi16FyWjnRi5STWEkGFsl5zGKZlRa6HQp44m41FE8fHp
 FeehYSkH5FUY5+FjmTzLB4WSmsVseRNGqBXrbr0bZIKa5OahRTKkYeUVWV1RodqVTfbfLYrzDny
 Rudd7nh5a2nbMymAY4Ng+8B69BhJ/krvULrKBBYZvxsy0iapZfKCJOOwBQ+i1794u7iq9zqp5vk
 +9Y08x9zy5I5UJMtTPQ==
X-Proofpoint-GUID: 9Vgw6MPHFhNl-ZNn1rQGrjmESlfgUPpe
X-Proofpoint-ORIG-GUID: 9Vgw6MPHFhNl-ZNn1rQGrjmESlfgUPpe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-110739-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95365629E8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/2026 8:07 PM, Stephan Gerhold wrote:
> On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
>> Subsystems can be brought out of reset by entities such as bootloaders.
>> As the irq enablement could be later than subsystem bring up, the state
>> of subsystem should be checked by reading SMP2P bits.
>>
>> A new qcom_pas_attach() function is introduced. if a crash state is
>> detected for the subsystem, rproc_report_crash() is called. If the ready
>> state is detected, it will be marked as "attached", otherwise it could
>> be the early boot feature is not supported by other entities. In this
>> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
>> can load the firmware and start the remoteproc.
>>
>> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Unfortunately, removing the ping-pong functionality that was present in
> previous patch versions makes the whole mechanism a lot more fragile.
> I'm not entirely sure if this has changed in SMP2P v2 or more recent
> firmware versions, but in my experience the SMP2P "ready" bit does not
> tell you if the remoteproc is actually running. The problem is that the
> "ready" bit is asserted by the remoteproc when the firmware is ready,
> but it is not cleared when you shutdown or forcibly stop the remoteproc.
> 
> If this is still the case, you can easily reproduce that with the
> following test:
> 
>   1. Start the system as usual and let it attach the remoteproc
>   2. Manually stop the remoteproc in sysfs (echo stop > state)
>   3. modprobe -r qcom_q6v5_pas
>   4. modprobe qcom_q6v5_pas
>   5. If the "ready" bit is still set, the driver will try attaching the
>      remoteproc, but it's actually not running. No recovery will happen.
> 
> In this situation, it is very difficult to detect the correct remoteproc
> state without relying on an additional query mechanism like the
> ping-pong feature.
> 

Indeed, I did a local test on Kaanapali, ready bit is not cleared and
it will be taken as attached wrongly.
+Bjorn, do you think this would be a valid case for adding ping-pong back?

I have another concern that, if we add ping-pong test, when ping-pong
failed, shall we take remoteproc as crashed or offline?

> You can make it a bit more reliable if you also check the status of the
> "stop-ack" bit. This would tell you if the remoteproc was cleanly
> stopped with the SMP2P "stop" mechanism. However, that will typically
> still not fix the case above since nowadays remoteprocs are typically
> stopped via the QMI qcom_sysmon and the "stop-ack" is not set in that
> case. I believe this might set the separate "shutdown-ack" bit though
> that is described for some SoCs, I never finished testing that.
> 
> And even if you check both "stop-ack" and "shutdown-ack", that doesn't
> tell you if the remoteproc was forcibly killed using
> sha() without gracefully stopping it first. The ideal
> solution would be querying the PAS API to tell us if the remoteproc is
> actively running, but the last time I checked I was unfortunately not
> able to find a documented call that would tell us that.


I also didn't find PAS API that can tell this, I guess this is why "ready bit"
detect is introduced.

Thanks,
Jingyi

> 
> Thanks,
> Stephan


