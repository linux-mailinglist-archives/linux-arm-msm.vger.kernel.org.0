Return-Path: <linux-arm-msm+bounces-115578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iEW+KNuuRGraywoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 08:08:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D90376EA197
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 08:08:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CYIfQ9ls;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CXdH9xyF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115578-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115578-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 904D13005D0F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 06:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C88539E9AD;
	Wed,  1 Jul 2026 06:08:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD34539EB5B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 06:08:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782886103; cv=none; b=CvDZ1jqp7vyJfoJfqMgQfcoRs+6g/XtdHSkf0oYhclM3pd0DyK3usACYeSRKRSPWCC5xTC5i7E2scuMM2MGmGM/4ZwqqGObyPk2MpTGXx80xkOkx+KctEVtbkz42S8n2YcJX4DGxrD05c6wmlOyODPvOUPnCQPpkJCVea4MGY4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782886103; c=relaxed/simple;
	bh=vBuWnvtzMvrDmeyEogrGTe7W0secwvLtSQTRM8HkCP4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UzmNHJmrqWnpe3vZ2JqRvaRzCqBiiGzI38276mIJkf+K4RIdw0XYJmXDcwTC+LiJ6t63PGBqALvGsLQOciC/zhGUWEKzbTURs/B1yMfoP/qd86ZUPgg7VaKfP+OjVzP6zrCp4J/8Lg0WyO1uEqQir1SVyop4K+NDVP7PTIyHKuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYIfQ9ls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXdH9xyF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lIiL138708
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 06:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ofou19QbyrdcTBD9IzbCWECuazAfQMESoAqczJbChhE=; b=CYIfQ9lsAw5/cTEO
	1n201Gl1zCy4ZOigz9S+E8V8B9IIR1fzed/x8bMvFM384f1/7dJNGI0tZFHeOnaY
	SqaLjvRpllfLIV1FV9h9jtMys5RRqdEw5FeLPw4mbII8Xa0eXQgkE79U2sJugKVB
	+NkQSFCvP6J0t7Lnptj6rBPmFupWVunwbrulFySwvHvQ4kkHEnjJlzGcatoq1hvh
	fAejf1G+9zv6bxGhte/E3huia80acteUMFn2RzLhcC4EepXBNfOPGwCHUsIqyZeW
	n19guOlhI56/wisx0CtpDiyVTbp96u14nL0nAw9vGVBGNVYjXvWJwtGYf8qMcR4X
	I75low==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw29a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:08:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847ac21582cso394806b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 23:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782886099; x=1783490899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ofou19QbyrdcTBD9IzbCWECuazAfQMESoAqczJbChhE=;
        b=CXdH9xyFYoGxO30ha7edjh7HRQac0OXalggiQE0ddTUxSYZrL6mNg/DTxmtBlMsiU+
         C5IU6rB066uq7bZpDdJEOJH6xbVwVm0TY9GwioFpL3Zq888/W7bSFBq1qw1LqXKIXQ/0
         dfi25ZTO2bFUBbRh/J+947kyYhTx0huFYhEa/LgjOQwOIlg6bf2neh4kaOPSC/6aVBLx
         kYk9vAuG98dbeyOVaWdNFLxKE1TZCML47OY46TOVi2SLcQm/T33cps5kQVyH4FAXCqEP
         5XmyLk3p9uFFvegbm4cLLvLQ1iEZvM6e487f2SUl1MP/Ol8rJlV7dmyruhgl+5Q+9oU3
         UQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782886099; x=1783490899;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ofou19QbyrdcTBD9IzbCWECuazAfQMESoAqczJbChhE=;
        b=DlV3D9vTbUppH+RNxvmERMp+SwsnLouVULxagBsCsc3gdHxVIdQ3sOlLksFT7wSvQ8
         nJwiM2F6BVVHx9JUgm86+xM7OriSOxGfnfdkSiEgt+GlbSdzSdHnRvTJK+2V4VgfUvcQ
         ++Aj5iB6ZM/o+t5bhdY758GIYhz1YsYuiw6MyemexYgleip8SoW5JLgZbXbtHQCrrQWe
         uBxvDbtTAwGYl3+Hj7UI0u/Ra2c9aF7FrHtDia0xHP6uEX6b/1hp+wK771Dkwu9nFKFn
         iVbQILpCLX1OiCsNE2QTsf5N/ZRn+NQyYYmCdYU89v04H/EWXWkaBWIwB0YC4XbDwtvq
         95Tw==
X-Forwarded-Encrypted: i=1; AHgh+RqnRqU+AMStoM9/b/vUu9g+/naQYSk91ox/PX3OTwhn95hGtHilR5A5Ut743bFpAV8MLSsgTpTmeZcGGeN3@vger.kernel.org
X-Gm-Message-State: AOJu0Yya95ElNdNxf25uPhC8SIBQ4F4B6TDcj7bXQJp8Yn43YWFY239y
	Sc3fqi6zCW4bN5RNLTUsanSfd+3Gb3OfQ0idP+tneGjg4qt0RLfXX8TYAg8p94W2TS/6gLFbcCj
	E+mQp27LP+GeeQN7ub4mQYTBclKZA8MA6JF4MofKap7wUf/4OtLqIazN3P7g+bd/y0jls
X-Gm-Gg: AfdE7cnt+ANUj0E/ObUUTHTG3uR+HR2L15mTdr9OLVcREL/FQHDuYETG+aM72Gn+VfQ
	iVZzNXDzkTWma7yfKJ3yMDZVaGHJ+xFVrYuCxVUoQyxk0PX/CnlJ3VE3GGs2hJvSkIh6FZV083g
	EH+nT+po/Vhgwve5rpGS0mdtOm0k4DMdOgHa4oGcdPyd4v3aupPA9FHLif4nDgC5ipWNQGtffSo
	VBx+r3xPd8edMdybHQIiNM08TS82qW4zblIjtYPtfjQi+oechxuZYPPHJzdDB/D9chD6xINyFHz
	H4icdgr/sPaW8XRdDlESsgzus7vul4XnUU32WHF7xr7/Ctt8iAhlYRNNRpcFpGVqWentCnc9q/m
	hcik+slI3ucvWZ1OslgZ/Q4oooPH6y6pVaSVfIwPKRKwo2mZ8c6sOZndAn5mmG568pDEdY4jGh0
	lLC95/M1M=
X-Received: by 2002:a05:6a00:4f82:b0:847:6ff4:da97 with SMTP id d2e1a72fcca58-847c0a2353cmr178433b3a.61.1782886098578;
        Tue, 30 Jun 2026 23:08:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f82:b0:847:6ff4:da97 with SMTP id d2e1a72fcca58-847c0a2353cmr178414b3a.61.1782886098098;
        Tue, 30 Jun 2026 23:08:18 -0700 (PDT)
Received: from [10.133.33.239] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fcfacafsm3318955b3a.0.2026.06.30.23.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 23:08:17 -0700 (PDT)
Message-ID: <ad5b766c-acde-4056-9328-f95f945d2f11@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 14:04:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/7] Provide support for Trigger Generation Unit
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <48c6abce-c492-46a6-84ef-3074983e817c@oss.qualcomm.com>
 <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>
 <2026062959-distaste-launder-e253@gregkh>
 <c09d70e1-edd6-41a8-8ab3-db353bb6f8eb@oss.qualcomm.com>
 <ce9a2121-8f7e-4ac2-8795-5ee602966e74@arm.com>
 <e7d83356-c9cc-4324-a65e-fda3bd27af76@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e7d83356-c9cc-4324-a65e-fda3bd27af76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44aed3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7OR0-vqQ_RDJhF54Gb0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: H6YwRFSFZ8ePyN8SCD4c0ZBxbMop0vLU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2MSBTYWx0ZWRfX4cFI7dDGKhOi
 L7INHBrTnauiM1jYOaVq9X8yHqw1sMFnZ1o8NTLD5EVNDJr4/fEbVHhR3YQoGDsqcfbhB/PHcgu
 ZJsrdLjG7dgrDKJalZJyrJUFgIJL9lw=
X-Proofpoint-GUID: H6YwRFSFZ8ePyN8SCD4c0ZBxbMop0vLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2MSBTYWx0ZWRfX76VSidbD2ySz
 aquQftT14cKDZ7n573Gmqw0SfkDHuGfuS+qZk3HlZxPp+wQBCLQZzXnhHew98QBPifMOUXwuFP6
 bB6n0f3Jd6xXqS4dVYwEKahUpYfuWC71dMDNomTvwd6yFMR//GQ7sBJyEElj9s4L5nb53AwFwlB
 oTwpmMLBxGATHL/eOxgyMmWodT2bWBoM5vLN800Womna7I5BCf1fd+094IxGMbppJ2JF0+UQwt/
 l1rhMUyQAep1tvGkmrU00ZuGPi17nr8NIS7s2J4saZPlicY3Cb59DyoIsy+d6TqDE9N8sKTMDi7
 SvgNfRy77kXAd3bJLLm+vJZ0ZrLYqjOr7njgNQsrlLnzAsQkQdKnEsAdwPhnJe5KSUZv5vXWSgN
 nrV3/BkvXJFwYchNeZvVGJkkeRGjrmv4LSzlJ0OSjO6Zz2I8pmAE5H3vzg9xlheF1JbXaqvgjvc
 o5lfTxJp6BGICSF1DEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010061
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
	TAGGED_FROM(0.00)[bounces-115578-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:alexander.shishkin@linux.intel.com,m:mike.leach@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:james.clark@arm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:coresight@lists.linaro.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D90376EA197


On 6/30/2026 3:59 PM, Songwei.Chai wrote:
>
>
> On 6/29/2026 6:44 PM, Suzuki K Poulose wrote:
>> Hello,
>>
>> On 29/06/2026 11:17, Songwei.Chai wrote:
>>>
>>> On 6/29/2026 12:22 PM, Greg KH wrote:
>>>> On Mon, Jun 29, 2026 at 11:03:33AM +0800, Songwei.Chai wrote:
>>>>> Hi Greg & Alexander,
>>>>>
>>>>> Apologies for interrupting again.
>>>>>
>>>>> As the TGU hardware plays an important role in Qualcomm tracing 
>>>>> design, I
>>>>> would greatly appreciate it if you could kindly take some time to 
>>>>> review
>>>>> this at your earliest convenience.
>>>> The merge window _just_ closed, please give us a chance to catch up.
>>>>
>>>> Also, why us?  Surely you have other reviewers for this code, right?
>>>
>>> Hi Greg,
>>>
>>> Understood, thanks for letting us know.
>>>
>>> Regarding your question: since this introduces a new 
>>> drivers/hwtracing/ qcom directory, there is no existing maintainer 
>>> for it.
>>> Given your scope (and Alexander's), we believe you are the most 
>>> relevant reviewers.
>>>
>>> The reason for creating the qcom directory is as follows:
>>>
>>> /We previously tried to upstream this driver under 
>>> drivers/hwtracing/ coresight,/
>>> /but it was not accepted as it is considered Qualcomm-specific and 
>>> not tightly/
>>> /coupled with the CoreSight subsystem. Based on this feedback, we are 
>>
>> Some clarification here: This device is not CoreSight  so we denied
>> keeping this under drivers/hwtracing/coresight/ - Not because it is 
>> Qualcomm specific. We have TPDM, TPDA, TnoC devices under the coresight
>> subsystem, which are all Qualcomm specific for e.g.
>>
>> That said, there are other drivers in drivers/hwtracing/ which I usually
>> merge and push to Greg, after some reviews/acks from the respective
>> people (e.g., PTT HiSilicon PCIe Tune and Trace).
>>
>> But, your proposal was that there were other maintainers for your new 
>> subtree and you were going to push this via ,linux-arm-msm ? to which I
>> didn't have any objections.
>>
>> That said, I am fine with pushing this to Greg via the CoreSight pull
>> requests (similar to Hisilicon PTT driver), but would need someone to
>> Maintain/Review the driver (with entries in MAINTAINERS, similar to
>> PTT).
>>
>>
>> Thoughts ?
>
> Hi Suzuki,
>
> Thank you for your constructive feedback in helping us move this patch 
> forward.
> As the owner of this driver, together with Jie Gan (who has extensive 
> review experience), we will be responsible for the maintenance and 
> review going forward.
> I will also include the MAINTAINERS update in the next TGU release.
>
> Please feel free to share any further comments or suggestions.
>
> Thanks,
> Songwei
>
Hi Suzuki,

In the latest TGU Patch series (V15), I have also added you as a 
maintainer so that you will be notified of any new drivers under 
drivers/hwtracing/qcom.

The review responsibilities will be handled by Jie and myself.

Thanks,

Songwei

>>
>> Kind regards
>> Suzuki
>>
>>
>>
>>> exploring/
>>> /a dedicated drivers/hwtracing/qcom directory, similar to intel_th, 
>>> to better/
>>> /support this and future Qualcomm hwtracing drivers./
>>>
>>> More details can be found in “[PATCH v14 0/7] -- Why we are 
>>> proposing this”.
>>>
>>> Thanks,
>>> Songwei
>>>
>>>>
>>>> thanks,
>>>>
>>>> greg k-h
>>

