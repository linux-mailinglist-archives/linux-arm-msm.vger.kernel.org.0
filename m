Return-Path: <linux-arm-msm+bounces-103116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDhRBWAb3mmFnAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:48:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC113F8F01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F16643008C0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24F43D649D;
	Tue, 14 Apr 2026 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YEa0kzoL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpEKTeS2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568933D6462
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776163675; cv=none; b=mP+T5JjwlKZE2ejCehMy3+sWuppxMjhcSuHSp0Cy4m/Up60KFH4H1E94Acn0nE0pxafmSW2MKd9x6QVYp9CHDSsKCz6nveuNkFGPTo49Qsyu0W9JLsK+8muZ6FluOwM4pFSqv6YT8O3lGqisr/WIAXsNYFAbdx67mrtQB1noC3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776163675; c=relaxed/simple;
	bh=8X8ReABQu/Q7ftDeGfocltLZS0cZ7Z3MVgZoDwpF5O4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRGczCSSwL8N9BOJ0Fq6dTjG7k+pBOT0fdS1nOPqOFc3w8NAmTrlqi8WhOPHg3XViQh/sjMQ9URlI7QLf9AvwdQHdmAbUG3kiuhj/mUZU4RrHTCX/QRQgjis4/vAKQzNEDEr7dhe/3ECmx/L4h6flQxLox2cJPcvW6DNjgmfSK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YEa0kzoL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dpEKTeS2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6SGw82386515
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GuSVl8/d4UX+o24MiptNZUls2zP1ssaJ7h8N9vs/C3w=; b=YEa0kzoLM4iNdUow
	37auQbpc3m/pWut5UzfDUS8Xvn7RulDpm8Z76INyrCw+6TJD1HTwhZY+PCcbakuk
	QgeYC8BTIxVDzk5wJ0XhvUmfXjsi6Lu8qnwKFfVQFmDpv62fzAGaC7sKgmJ3F+I/
	EoxuWT6sWgGwapi2BgUdJWkDO+0haqC6B5tx8sVFE4VzvIGwaCySVf8uFKblOAqv
	CoeL+E9nfSi4755OMdEE9QiGDwad+4/x1Gaq4IMeMFgILUw5qsCH7P1MKFlcklK/
	C0uGPMoiklJZLfR2PwgERfVIfbbbksEzmAC3/vFBKdaMBVNMCqKD5hSYH6eGpj+N
	zX9qvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w2bj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:47:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d7128e038so13297241cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776163671; x=1776768471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuSVl8/d4UX+o24MiptNZUls2zP1ssaJ7h8N9vs/C3w=;
        b=dpEKTeS28hZi+Mo4YF0acBaWd4O9BE04pGsSzNSz3IMMyonfe4vWGWK0dYv8IrpXN2
         qtKzoRBoXYagyO1iUbKkzk/eSjsrLCoyv05+rJfgYRhwwEvtKDT8wok4V1UHGWmrVosq
         SoMeau9O+/rWqz9GCoUq8V0J1NxNtAd50ZgALp0o4/Wu3fXJtoUDlD6sDgtP/3IV5WYP
         zNbqQc2bMTeHcVD3Wom7wolHu1nm+XB98X+PKtC9Vv+JGdMqIrp2Kann5l2M+sf5H89o
         jHQYZk8VEQv4xgJn6ejU6blFvmiQr5lCCfatzGTcLs2sFJQSZC4dpKtEv21JUXZFmuv6
         7J4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776163671; x=1776768471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuSVl8/d4UX+o24MiptNZUls2zP1ssaJ7h8N9vs/C3w=;
        b=JDcAR0g9re5PZQ6SyeIfN1KFzQhHVpiBXhfMpdI4jYVUnDRBtnKGcFwVX8aNTHmCK5
         tqm8io4+sQqHFnpey0+rZ//H3IlT2gAYI02t7BjOx4LkdRVLuLc4OeQ2Gc1aKh4X8/y3
         EhR4bCJSJsrwZ/Y1Lgv0K6NI2kst/sG1XfhLYaD5cMic1/Kkd+2Sbh07JXFWeYr0LQiN
         RDpMu7DIIo4Snv3c8sbUWMG0VdPQwqdEJaePqErlUTQh5cGiyTE59oj0TVoIMzL9qh4A
         j4cIHXgBWIxlVXAsrdGgpXDCa1RiBVNSC6dxqpuqZnmi8jPZFemDyQm+6D6EeGSWV+K/
         aOcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9753n/Sbo2hQ0BrREZgrueLmLNKpPX+u2Qh9GFedmIe02AZlABwJKE/awFJ4r0OdPi94tTkQVACuGA0DtH@vger.kernel.org
X-Gm-Message-State: AOJu0YzBJKfdPvj8mnA5aRvxv+2b9Q/tCf/1QZ9kt+WnD73ZunvNEEi8
	/ZGhwKD3K/lnQ5L7xsu9UIt2q8Hu7m3lvhs6taU74e9QiucrXu+1F8NP2KW25nRe4Bl4c68nNmw
	InMzQsdkpx+63z0jWMDG+Dxq/o0k3+VkBvjnuSkrXurxlnCQs7pJVotpWggdiztPgk8UM
X-Gm-Gg: AeBDietBKvuSthL88lDT5FxTSem3aGMmzQLcvNcqDNMmlUY9CHjxb2t45gZ9O3PgVwe
	ACpoHi1WOfVvphrIVLgXwwzCLc23wTjIO8uSIJXwWbV5o9kIVQK09khedUkSuGgF/9tSHAgF6Gt
	9w05BEA8DjWb4uhC3/jlyftJEaWGC9torEjEmMU+up4a54brvNpuluB3+5l/aQyebjtIlTWolHd
	Aagr8YHH8m3OWEXgTEhNfFTJE2FlluobNwshnZlb9JgVeVTx4fjrOFRrERIJSE20u3UteHgqlXf
	9ySiWpD7zcDADpD+cyYVQmkQh/YdE4kpwDpaUQhr3OSF6n0FY4Jz/NMfrKV77OaaLVQVwLbOTz/
	ZzosqWi2fEATFzPvBe6c1NQpsTIjl0qRqdKsShrnuwNscPgfmnJ4atKePvXrqeVqOEaHwJy1Na1
	Ahdsfy08/LvwmYNg==
X-Received: by 2002:a05:622a:44f:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50dd5b0ffcemr180319411cf.2.1776163671072;
        Tue, 14 Apr 2026 03:47:51 -0700 (PDT)
X-Received: by 2002:a05:622a:44f:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50dd5b0ffcemr180319151cf.2.1776163670619;
        Tue, 14 Apr 2026 03:47:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de8d689sm399063066b.3.2026.04.14.03.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:47:49 -0700 (PDT)
Message-ID: <578eba18-1a9c-4aa6-8c49-58d271b1b609@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:47:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS
 DRV region
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
 <gd5ixcfablbyyyz2wdacrvg43jogwg425na6utsgfcterm276k@tdko64tn6gwh>
 <ecb75ada-60c4-40e6-81bd-fc392007e9d8@oss.qualcomm.com>
 <20260414082426.fhkgwpjth7a6hzxe@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414082426.fhkgwpjth7a6hzxe@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z_ifpAfRaauVcpqAH1Het9x5f_WSw6xV
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69de1b58 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Aw8xZ2Yx19VhUrNpqvQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwMSBTYWx0ZWRfXzXUYjV5rnmMl
 cfyqMyS+/qxVIHTmVPbBRsSEa35Obp/Lrxv90HPH64xjAs/edDDpRcKJ2XrD567dglNmQKlEP/M
 FTLBhH46zd8q7zCUMkNaQ541wuplxHHtqt/6fWFbix35fiXbMZ5rj/gCViKpcNlguCCtAqaKtW1
 qCd152mDBtVSnNjwmwGOLH6ZlOht07GmIe4lCfaKqAdg9RZPHL1tlIeayF/36dMiVFVv2BXOYhq
 pHEVOmSubGsAEjChpH6zSjtkUmTYXxDsb1vGCqXHYzFze5RHXRIO/ONq3cMF6JzFAo25brR6+sU
 2pznCSXTeQWU6PPhNFln2BIwY3NAcE3pkkXYM6wd9mrRnjvfarXRj6lVpghmkkKfCLzGROZ3HxI
 K6CdVpdAreBMfMoThSIlB8XVehYUQK8DR0nYpXiRPvPW97QL1NJtXTZJUsSufwpxL5bE2yha5ie
 AQ235HQJkdGKQk+T6ew==
X-Proofpoint-GUID: z_ifpAfRaauVcpqAH1Het9x5f_WSw6xV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140101
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103116-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9CC113F8F01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 10:24 AM, Mukesh Ojha wrote:
> On Mon, Apr 13, 2026 at 10:23:59AM +0200, Konrad Dybcio wrote:
>> On 4/11/26 4:32 PM, Dmitry Baryshkov wrote:
>>> On Sat, Apr 11, 2026 at 12:10:38AM +0530, Mukesh Ojha wrote:
>>>> The PDC has multiple DRV regions, each sized 0x10000, where each region
>>>> serves a specific client in the system. Linux only needs access to the
>>>
>>> Nit: there are other OS than Linux. Would you rather point out that
>>> other DRV regions are to be used by ... what?
>>
>> TZ, HYP, HLOS, CPUCP..
> 
> Thanks for pitching in..
> 
>>
>> I'm wondering if we can make use of the HYP one on e.g. Glymur, to
>> parallelize accesses (and whether that would bring any practical
>> benefit).
> 
> I mean, Ideally, It makes sense to utilize extra 0x10000 to use or just
> to use the hypervisor one for Glymur.

Which one does the UEFI use?

Konrad

