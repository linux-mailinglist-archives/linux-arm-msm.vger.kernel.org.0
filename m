Return-Path: <linux-arm-msm+bounces-113526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T2CyFm9uMmqDzwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:52:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B60698213
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:52:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pZtnU48U;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=adKl+VKW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113526-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113526-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 786803281E0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 09:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB443E51D6;
	Wed, 17 Jun 2026 09:37:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7951A3E4C6A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:37:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689048; cv=none; b=nhRFVlHxMcvKgH/3U5e+RG8jAW1VDKD0jInlkNg0M3xo9FeKwVbXfVR3FVD3tg0L8oJX0EQanEcLSF600kDwpwX/f/M4fqn/YB1464UEDFTmhN6yibmSbqwASuQGSqUKvKHhBosuL94H2hd+Ny6QbHRWeQATF5BKc11faGoBiQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689048; c=relaxed/simple;
	bh=IB6dX8SYiaGhkj6r/5uY4W+ONZ0hIflMNwbNBhpmTwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OTJgBAwmrXLfkksqw53QcS4Y201ziOcQYON18vU1TXdTrcyEsCVVyWbmm9gDvhXWmwgQSZ11ZFg2LyVomU5V6Q5rv/cEU3ooqfpxB1cfgg/gvpFukgzR3vTQ7wnRUr8LmL0WXQRy2+XCp23sCRqyLnlpolDwqKuDYegLYnXxT+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZtnU48U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adKl+VKW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V6ER2291358
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j5wLSZZ3MeJeiXqoiAePOrkWdu1M+tiBUI6AGF+g4no=; b=pZtnU48UluGG0aXu
	Zv1QYMVllQc7n7CQcjHEd0UlHltbd1l/BgFxwVnVGianLooUp9Ffta6ERwluQqeD
	k3gI526XqyU2j/Yfuwk3Kl6T/TugGSziYFBwvS5K8Eqd7IlR8feW6Tt5CPO9HzI7
	3UJeavRnoJAlyPoplF1nbdV1kKjOmpkvsuONQxNNee324GZkUEggImFPzZsw09jo
	bdhDw2xKL0rkpLGWETHrZYoCbk1oWqeleh+YU8NMaX/VY38/QAi3YQTrcl0+Q5Cr
	avH7UtgMJdVX9bI585ZQr6QbNUr80uC8/jn3I0S45BpLb+GSd5L+672qgmCgEOB0
	oEKoJQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevjh1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:37:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6bf305403so6218185ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 02:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781689033; x=1782293833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5wLSZZ3MeJeiXqoiAePOrkWdu1M+tiBUI6AGF+g4no=;
        b=adKl+VKWc3TvKvbSnG3Bt2X4TSgOwHnlg+W56Z75c8fsJQuDNL/+u7FmA6oMteNQaY
         N/xq21MJGxIS7GG1KJYLToN0dl6BPlEtu+CeDg6xY0YA6ftJhyPHiiHYLNwZ0BO+rig8
         sM47he/Ry7Xlass5RlHFptaq6XEszbiuayYVzpNxutfD6tCyM2qS7NNfJiv0ts/h3SKx
         f2Hhj8YtBfSYzcC5K2y11wPYsjohE086A3mrlM0MTobFDahRyRI/F+xn6HrIf2HCCsmZ
         hLNMTNop4RNHvRR59AfagZzHCn/zflXcG3sQNjqaQ48BXEboTdt7pFjZZ/VONmrC33Kr
         8vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689033; x=1782293833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5wLSZZ3MeJeiXqoiAePOrkWdu1M+tiBUI6AGF+g4no=;
        b=qCw7Q/otcH95N/fwx21OKGa3bssawMifZ00trsuZXSGkZLV/CtWuZFwDDpAp2m+9eb
         V6TiDu09xYGXMdBfJWur2Arbo7PJ4KVzZ6PsWa2RaFmC2aTGmGwac4KP81AAIavsl4cR
         3II1PRlVON3CNRPaSSjy9jnJyxt5dbnPaII00PTdMP5vCiw0nfAb46xegyCHq89GkUPb
         Q98xUFhizepmDd0WPOK8l9fas9zOmCfBmka42fdUN90BesybaGUlxsN2MCZkjGuldhmJ
         oFE7TkKFbQ8LWlaIqyvECXjnI3ku6lT6A7iuXGwrpCyC7BpvUdRBUlmbzMwcCl/FuRpz
         2UEg==
X-Forwarded-Encrypted: i=1; AFNElJ/yKmPVkeEltmqfgpC6QpT2aAVu173NWshXdZlpt4fHTm79EHlX82wMWVoPPktjLpE18wLIUIyG1/VBr7yd@vger.kernel.org
X-Gm-Message-State: AOJu0YxhOLZhu/fjuuNs+WtaK2NmOhze9go31jaQ0PsDL+6AzTFrsmTz
	fwARKxUSNf+JFLWsgGS29IfeRBcc0HrYFib3BJJBJf9yI2hwwfcU5XvKxU7Mjobfe13wS7dpEsq
	eg2AfgWRl5cmKjhssKkeOxpmWjQqfcST/nnMyE9PEkYS/hIJg6akFv7W2slPUsHBOvDzx
X-Gm-Gg: AfdE7cmGNLWn6vFkfJj1Sf5X7dxMBK4ZT5lFnFY1p9QvpKPnmqGisS66wr8nCJYgFnO
	4w3C/Zah9gCIgZAR4XGkl/qIg1DpXfy1//CO4KaWVnVtzDPSDV9yeo2wvjHR6y3Edz+LUKM7hvy
	SzyKYElaSyrUu4cpkhNzIWo3EDKPXJcbHv6u3ptorymTEy0EauAo96mkrFcK6XtxNJ7vyvNp4nG
	qi3Q69NLW7+BWu5Gut38C8RkE+g2e5L91q3BDGfBtUK4ASYXBqHwJeRY3wZ/zL3MRE7RlMNttUv
	HiEYbKu3iPqDkb9R7S6alBU2bzAnea5fAfcLXcfoIaKe2KaFmIPEeiHQN1rGK5OgEg6OO83UQrb
	mZRvzV5NVt6pURno3hWSJpJ3l0DMuFW2qUN6HtQSRNSx0XgNWrFkdx2FnZNOlu3vRNS5duEXBV6
	yQC1XsAA==
X-Received: by 2002:a17:903:2b03:b0:2c6:afa8:c181 with SMTP id d9443c01a7336-2c6bc0b11a9mr31050345ad.1.1781689032565;
        Wed, 17 Jun 2026 02:37:12 -0700 (PDT)
X-Received: by 2002:a17:903:2b03:b0:2c6:afa8:c181 with SMTP id d9443c01a7336-2c6bc0b11a9mr31049875ad.1.1781689031977;
        Wed, 17 Jun 2026 02:37:11 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac7fbsm168941325ad.42.2026.06.17.02.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:37:11 -0700 (PDT)
Message-ID: <b8adacd3-a8ab-4f54-b169-bf6b919e6fa9@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 17:37:06 +0800
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
        "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <aip7feoTn0ncwzL7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfXyb902UfPOCfA
 DXb8zWRVUW5KkUdQKD/SDBuau23dKXDgPgSjG9pEDXxA9p7wHp30LTmTTFqEqSlQ/Oxa0rZvT5J
 eZRer6YQqKC7oaCENsLKgqF8TaZbeB+3V525wGwMPMNpZCcpFF242fmLdPGJArGFKwFCzUjP3xg
 TkqIJnjdT0chbW4QbObsn7QbpXcNmP/n/PSg8KYqzCJ88Pzya0Zp0/tBH+plVjbvmtEhZbVwSo1
 w5aeXcz1OHugfn70vYoe2pNLw8iju54em0y1wpodWVIClguTNmhtbHygMjjCj+QnjiScBHqxgqJ
 0koyJ5xBH2+iCIn4Z3Bv/YtSn9f+t8NyCGY/j+a5Mbx+eC1C0qHsG73G/d5bveH1ZtLRlHJVW+X
 J49b32XpAsu0Ej4NRDJYmyiwnLJ8nSRLRajrp2YcaKA+fF/gc+LqdvFcNPt0rCpzHyGX8E898Dy
 YMD+ZoiuztmEbg4mdEg==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a326aca cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bdzlAc8VpKKGP06_0pAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: vSwsEUgUZ7FmCAQWKYcI2P8oclaEp6cy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfX4uyGOqzW5BOY
 PrgWzwNsgROsJq4gRwVyIQz598wDrh8xvoYqLB4w1x07i7gnqi8ZPGe8VRFXr1dy82wcR413u3h
 dhZNddrcbxCFhimGGwkERGcxFJ9AGS8=
X-Proofpoint-ORIG-GUID: vSwsEUgUZ7FmCAQWKYcI2P8oclaEp6cy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113526-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:aiqun.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gokul.krishnakumar@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08B60698213



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
>>>   1. Start the system as usual and let it attach the remoteproc
>>>   2. Manually stop the remoteproc in sysfs (echo stop > state)
>>>   3. modprobe -r qcom_q6v5_pas
>>>   4. modprobe qcom_q6v5_pas
>>>   5. If the "ready" bit is still set, the driver will try attaching the
>>>      remoteproc, but it's actually not running. No recovery will happen.
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
>    ready==1 && handover==1 && fatal==0 && stop-ack==0 && shutdown-ack==0
> 

Hi Stephan,

We did local test, checking stop-ack==0 && shutdown-ack==0 should be able to
cover graceful shutdown cases.

Would it be redundant to additionally check the handover state here? In our
observations, the ready and handover bits are usually set together. Meanwhile,
handover irq is not a necessary condition for pas start.

Thanks,
Jingyi


> The ping-pong functionality could be added later for platforms that
> support it. It would be good to have the interrupts already defined in
> the device tree, so you can tweak the driver without making DT changes
> later.
> 
> Thanks,
> Stephan


