Return-Path: <linux-arm-msm+bounces-113027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xbz7LFAiLmoYqAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 05:38:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FAA680484
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 05:38:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hqmU9Rqj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bwhqh97H;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113027-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113027-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA65E3028B2D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 03:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63A428643C;
	Sun, 14 Jun 2026 03:38:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494431EF091
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 03:38:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781408332; cv=none; b=HO9f74RaoDGroTlhDVjA6jdBaQxKhRpc2FamU4Y0UayuaaKC/GwdIpsOxjlhQvLEnWJFFHbnaDO0twvjlq9bHq+RWs2IRAte7fkfpW+OE5634opJDSIvWM4dbo/GZ33yzaMN2cdIOEjqwWBo1/X48VU3rXgZCNKVDv0hvqHD0AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781408332; c=relaxed/simple;
	bh=WLiWxTnhzrQgPu7cNyodDOXgCHLzQQEe2vLlFVSwvqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bk+bJk2Vb1AJtybs6qcSoxTRvlqr6X7BdEkX2SasoEve/LzK2vg6Nhm1Wj+SXeKNT7xOyng465ZpyqPwE/TJV+qf+l/e1ArByaEsf4oGHr2AqAC8GRj/XHkKoKYZR4+bOWg+rDmjgn8dLo+FCuReTaWFuLbvKlaQnB3HmdRFgWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqmU9Rqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bwhqh97H; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E2rxlc504081
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 03:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwSZ0vKlQfQiOlii2mBhbv7y7KAwnruxesTxj6LLNZw=; b=hqmU9RqjIYtYVAKt
	35G3C6DE2qi+zkwOqQAjcrgESITOW8NyTkj7bl7U/8PntyYLtC/v2TW9B/M//sPB
	Tpm6ZoCFadAhlDwHdYOKcqaIX5QH4axia/11lASzhs6W34/iJqjZoAQ669/hS0YW
	KAYksgufdtFoiqfUMbtCqqV7ktNHAleHQAy2YRg9lsxSj9IhtLcZP6JBlUbXuM5L
	9f1H6uf9JuPGtptlfHSM7wRFy7jNuqo1zpPUcABIsMfm/5ezV+1OcVB/wN2DHE4e
	6gXccBWHE8Qjzs2MLs+uL+ik0mgkvnonHFBaGpAzmJX2/CbXQvH0CPzteoxyg2pm
	vL0NlA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wtm6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 03:38:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c318546dso2977995ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 20:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781408329; x=1782013129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HwSZ0vKlQfQiOlii2mBhbv7y7KAwnruxesTxj6LLNZw=;
        b=Bwhqh97HSuuMG4+GIdC5EjKS6pma0Q9IEUEnk4XRPu8bmQEpTQipVE3XOr1Gotq16o
         ehVovTPy0zlRJ+8lcPAnh6FpOCWDntZpMHOQKl4V7FnO6F2flBCF/GmQ1yv80f9nuaOX
         MgCt19L/81wrFNut8ndnRLLHnSvTLFmONXGAO9YFeSHBvvL2LqgkKfc7WAP86asZpOKw
         vhtS+D+pYyF6P1w6CeRINlemG3H4Cll27O9XZqpuEOTYRzCmpzCI5lYSz6Hh/d9EDy16
         GQeTo4QP6xOHSkmZjPrbg90EZZMSxpaKXy4qEoY1hKt4mNblNM8pH/p9uIq05jPl2s3Q
         AWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781408329; x=1782013129;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwSZ0vKlQfQiOlii2mBhbv7y7KAwnruxesTxj6LLNZw=;
        b=NKpxH/amS9gqp3Q883mBYpXiRRhkC415UPgzlMP/pJrMU3giYc6A/uwcWg4Zz6GawN
         I8xvQjZ1YQ7QywGQCCx+z06WxGL3W/WlykUqvjsHGr4lfk44UBUnuzEVS7/o+ohDvvY9
         xfUsN7Tudlw0lAeEJXmhAo55BulMMxV/1zK/hiukNwIVib9KGG/RZQ6XzPRCsqRfBvUl
         gn64NcrcqGVe+eGieRM2w0Wjya1P0UTSIqOHW4agVVMT/TLWXrkJ5otfB+IPLxSgB3Qd
         2SYi4L4NwMb/8a6+iPZvr27mE8/9leXEpIoV44ujXJFSUsFbyL0BAu20BK057aaQGK5W
         jChg==
X-Forwarded-Encrypted: i=1; AFNElJ9DUIsDFurdDjqUd40/1yF8+Gl147UpGTyiSErp/56UPPGAeMW7SSnJZRQqKAU+iNnSHbdMRWqRPQfKawmL@vger.kernel.org
X-Gm-Message-State: AOJu0YwYrDTi+lrerBhdRRAK1v41GdUQcF2ym6PwlzQvLGAvxJPIIafn
	T+RAqijfSou8uWnAAzOXDuvgIyYr4u6+1wDgkLc8/Ox2GmvGUuve7FMjO5GSudEWdESm9lNPIUs
	AbXzBsKly9v6A+szz9pVpsTVTQpI6xZqaqgzjhQ5qKDzP226esh7pqNYhvTBBhC2yN0BQ
X-Gm-Gg: Acq92OGMvsvtI6z0Xc6PQDNzTJMbobHGDEunvt/WyKqyMyDCVqRv/Mbjb04/KxBRCbL
	BQ+12Xpqpu/n0LrYzMXQB4zt15MqMB/ws9RzmGiEdz6G7AOc3yYYXUyC4lOVG1u198Cy2tz4yZq
	BZ2qlPBe4p74D5P8//1PeL0399LZpOXaKCs5kyxn+ra5KdExYdiiRFyH2zUOmbTzFvEVfQ5Y9GB
	gRv0BxbAChKvI4zOmi/ZeZdgBl0bvPV9vWKdkZEur2p0GG7w+ush50bDm4YUw1t/i5D/j27N3pZ
	IUotcx/ppoz7qbNT7UmyjbncwgGoboYB7PbSQQySeDpnp2kMTOu63GlX36Z++9LXL58nH4lFa5F
	8ITEFnqtn/O7q7CZvZJMFyR0U1N5MFKPZdTf9AvdZT2++Fw==
X-Received: by 2002:a05:6a21:6d90:b0:3b5:52b6:f641 with SMTP id adf61e73a8af0-3b78420cc46mr4683342637.4.1781408328869;
        Sat, 13 Jun 2026 20:38:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d90:b0:3b5:52b6:f641 with SMTP id adf61e73a8af0-3b78420cc46mr4683313637.4.1781408328271;
        Sat, 13 Jun 2026 20:38:48 -0700 (PDT)
Received: from [10.239.132.150] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519f896sm5703024a12.23.2026.06.13.20.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 20:38:47 -0700 (PDT)
Message-ID: <cdf6db72-244a-4e18-bfc2-4ad52f9b8777@oss.qualcomm.com>
Date: Sun, 14 Jun 2026 11:38:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <ahBG6jKYdSAboWjs@linaro.org>
 <6df4c351-7287-4fb9-8af8-83b5deabfa07@oss.qualcomm.com>
 <aip7feoTn0ncwzL7@linaro.org>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aip7feoTn0ncwzL7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LniYznLOVjzdXjj31Aq8DNlv_X-eTQ-0
X-Proofpoint-GUID: LniYznLOVjzdXjj31Aq8DNlv_X-eTQ-0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDAzMSBTYWx0ZWRfX8PRkC2E9ssE1
 OwDV/3H9UE9VR89lwikuMuoRkBg1EvdmUlhQalSzF0DROez+gqA2qcsJatOYt//qvjElnFnha8b
 0pdY5g1QlOc+Eq2PePQ2XECU7qD99KQ=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2e2249 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bdzlAc8VpKKGP06_0pAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDAzMSBTYWx0ZWRfXyQjDAm2OXwPy
 r7dXbrVRYgBZ17vU011tsY35tFpoptIocvmUk+pvKL4VDje4Wg1f5O7ErUkmmQmJsHeQyyitix2
 xyZx/CzZrdAkIoY0DdZaeYpgrq4sfcWoHBxeR4c9fEG6lVfD4YLoP6vlXgRb+Dvo9MgP2NTWgQ+
 b81Nw8AAhagpAU2riwxxxtFUwNQ8dggWlGAfc7GvRHnd0Vf3Usm7wZH6an04jxgLULT23q8gdE+
 /4XQaZBRF05Ad3MQxyjimAnudJhrC3sXvBAyzTBzP4oc2T6sVPmJPuq73S7ukVqpJitqtt3j88O
 pT0rJe8P8f000MbLwXxT2ISeKxVL5xxKfwXt0IFiPGS1LHaEzZUTbTIyJvawRDfY9p2ofCFbJFa
 pvOg6PvNxp/Axx3G8DLVDz908FzvJgoyNNwko8O/o6oBWVeTf04eO3ofY25Khs9WZhptd+taldv
 dlODoXGbznirsSYYnLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140031
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113027-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gokul.krishnakumar@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aiqun.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aiqun.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7FAA680484

On 6/11/2026 5:10 PM, Stephan Gerhold wrote:
> On Thu, Jun 11, 2026 at 11:10:25AM +0800, Aiqun(Maria) Yu wrote:
>> On 5/22/2026 8:07 PM, Stephan Gerhold wrote:
>>> On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
>>>> Subsystems can be brought out of reset by entities such as bootloaders.
>>>> As the irq enablement could be later than subsystem bring up, the state
>>>> of subsystem should be checked by reading SMP2P bits.
>>>>
>>>> A new qcom_pas_attach() function is introduced. if a crash state is
>>>> detected for the subsystem, rproc_report_crash() is called. If the ready
>>>> state is detected, it will be marked as "attached", otherwise it could
>>>> be the early boot feature is not supported by other entities. In this
>>>> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
>>>> can load the firmware and start the remoteproc.
>>>>
>>>> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>
>>> Unfortunately, removing the ping-pong functionality that was present in
>>> previous patch versions makes the whole mechanism a lot more fragile.
>>> I'm not entirely sure if this has changed in SMP2P v2 or more recent
>>> firmware versions, but in my experience the SMP2P "ready" bit does not
>>> tell you if the remoteproc is actually running. The problem is that the
>>> "ready" bit is asserted by the remoteproc when the firmware is ready,
>>> but it is not cleared when you shutdown or forcibly stop the remoteproc.
>>>
>>> If this is still the case, you can easily reproduce that with the
>>> following test:
>>>
>>>  1. Start the system as usual and let it attach the remoteproc
>>>  2. Manually stop the remoteproc in sysfs (echo stop > state)
>>>  3. modprobe -r qcom_q6v5_pas
>>>  4. modprobe qcom_q6v5_pas
>>>  5. If the "ready" bit is still set, the driver will try attaching the
>>>     remoteproc, but it's actually not running. No recovery will happen.
>>>
>>> In this situation, it is very difficult to detect the correct remoteproc
>>> state without relying on an additional query mechanism like the
>>> ping-pong feature.
>>
>> This a valid use case and concern. We had a discussion with Bjorn, and
>> want to take this scenario into consideration of the separate robustness
>> improvement series[1].
>> Stephan could you agree to have the basic function in this series can be
>> go in firstly.
>>
>> [1]
>> https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/
>>
>>>
>>> You can make it a bit more reliable if you also check the status of the
>>> "stop-ack" bit. This would tell you if the remoteproc was cleanly
>>> stopped with the SMP2P "stop" mechanism. However, that will typically
>>> still not fix the case above since nowadays remoteprocs are typically
>>> stopped via the QMI qcom_sysmon and the "stop-ack" is not set in that
>>> case. I believe this might set the separate "shutdown-ack" bit though
>>> that is described for some SoCs, I never finished testing that.
>>>
>>> And even if you check both "stop-ack" and "shutdown-ack", that doesn't
>>> tell you if the remoteproc was forcibly killed using
>>> qcom_scm_pas_shutdown() without gracefully stopping it first. The ideal
>>> solution would be querying the PAS API to tell us if the remoteproc is
>>> actively running, but the last time I checked I was unfortunately not
>>> able to find a documented call that would tell us that.
>>
>> It is a state currently kernel don't know whether the remoteproc is
>> offline or crashed when ready==1 && error==0 && ping-pong==0 scenario.
>> If it is re-modprob, the software don't have any data and only the
>> firmware can tell us whether if it is active or not per my understanding.
>>
>> Maybe let's have this scenario and solution discussion in the other
>> series I mentioned before.
>>
> 
> If you add a new feature upstream, you must make sure that it is
> reasonably robust and reliable. The other series is about generic
> limitations in the remoteproc subsystem, so I don't think you should
> move QC-specific parts over there as well (personally, I would have
> probably kept all of it in one series to make it easier to understand,
> but that's subjective).
> 
> With the current firmware design, it's hard - probably impossible - to
> make the status detection perfectably reliable. I would therefore choose
> some reasonable compromise to start with. Given that Shawn (and actually
> me as well) would like to have attach working without firmware support
> for the ping-pong functionality, I think it would be reasonable to start
> with the basic detection scheme discussed above, i.e.
> 
>   ready==1 && handover==1 && fatal==0 && stop-ack==0 && shutdown-ack==0

Ready==1 and fatal==0 is already checked in current patchset.
I am not sure about handover state, may need double check.
stop-ack/shutdown-ack can be added per my understanding.
> 
> The ping-pong functionality could be added later for platforms that
> support it. It would be good to have the interrupts already defined in
> the device tree, so you can tweak the driver without making DT changes
> later.
> 
> Thanks,
> Stephan


-- 
Thx and BRs,
Aiqun(Maria) Yu

