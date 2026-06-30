Return-Path: <linux-arm-msm+bounces-115322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hPyEB+h3Q2r9YwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:01:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C6F6E17E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:01:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BmeaAAvr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LjdMzmGv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115322-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115322-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56E9130193AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47BB3AB292;
	Tue, 30 Jun 2026 08:01:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927C63A545E
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 08:01:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806499; cv=none; b=OC5miTa8rx/BpLsUJ5l4MjS9ts4cRfsvn5VrkkzklGuUJ9pKW0fC4dRd5dgenIMUIkDg995MkQ68Hgg9HBFTKb6b+922XrqmQWfAiQijI5ivHI0wAsZjRjxbAXRRJ+4TReAWnRF03m2bmdcbiiZuGUQeLubfcuQJlqcN0szz68k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806499; c=relaxed/simple;
	bh=cgCorLCAb0yDNWSRu0XQEpaIFmCxSgaLAb5jZK31Fsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2fFoeQ+EP1vggyCXBnpRfUZnEDniYnZSoQHcAtNBExeQQhhAbdRz7toIGsHny6XyauKSwcQAkI6hTAqZIjJW/syWK8iE6J5vodoGs818xqMvwB6HWb7uMEJcoG35g7LX8umDdtK34tgtTg0XrCPx7+H62zxzmCDI1DlPNL3Xls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmeaAAvr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjdMzmGv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CHMZ1029931
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 08:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IswBlb2AzqPmlcHDIkKH8P06/OkA5QrfAQpG7ms3Yg0=; b=BmeaAAvrms5eqOmg
	W+Vm4pbG8ytGREDBf7XDsDVHNLsWl1UasWjr1y4eugEcs8IWbhO2z+GYX5TesBWd
	9cWRbuOHDncliYAH9kpgN1HHh42DviBt0pRQ4tGPsh33c4b/y4pG6+jv7XFF6Lr/
	uLr8vW7mImeRJjXGz7Krmhlef5u6XLYYmLp1GtpbzDJ62Kq6RqfPzUP66tHB4Dfw
	H8tX3PDkiR+kWbmHPVSJgwcMsNDCtOwbrsu72Ix6V+L+/GIa2MCUHZ5ydl4AP5dC
	+tQ8c2ZUeHq2VODRHDOzZjLoTvac9QYLVqlRnQ/s1x6KYPGSgxu0gelXmPDgSLIX
	mi4eLQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4h7pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 08:01:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847a483ea41so495661b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 01:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782806497; x=1783411297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IswBlb2AzqPmlcHDIkKH8P06/OkA5QrfAQpG7ms3Yg0=;
        b=LjdMzmGvfzGjpCmRXwte5GtWT5Zc5ZkKgYgZqK0FswS6Xpqj7FL/mA8XA2NJLj5Yix
         ls3TmULBdJ6rEjvYgh6YpjpmMpRPK80J/Ci/BMIvhqE8SE3pX/3bUKKQTnzoDxawpt8B
         /PmfESuygKbHTHd9h4SbYGpmFKEXXW9sFKZnKsq+FTtcM3vSGBNwOhdHmw/2JCHXTaw5
         5k49RuCjRMhaxrS95K8hPxX5pfSC5UoAOFGCC4XoQBbVUXmkTEt43QciUAybjL+iba/j
         GeqrxTCFdIeJ+rDHyDCSEYqh5uiaJl+3dz7puhvJGhWLyq0W4TqDX9QXcVlRCys02Psk
         JWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782806497; x=1783411297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IswBlb2AzqPmlcHDIkKH8P06/OkA5QrfAQpG7ms3Yg0=;
        b=VFlARRueBuwR/K5gA1AAeco6PQTEvgSLB2u7t2GgWoAV7F6dDoz15XieEG4iieieSo
         0kxUEcaqt+npt2vN+JXjBMt6ZF3vDUzQJZVCOtbvyw4mKFYPLIc/ugoy4GUXBGehrWYW
         BbB6DeSB54+61l52VvTD4AYAtsbWFzP94hw9Y6gonobLhqHVOd+r6K+HbbKL+goU5+2W
         RvS0ORVI1lSr4vz9IAR+dAiqZBdAWWj8I99AyN7xTp/fpICA7Un7pLkon3PM6DrOzCcj
         HpsmTYXZ6bPRfeG+D1ZBONER29LFK0DE9a+QZIF7wtmfl78fPCWHI2HVATv9TOLgIzgd
         IBmw==
X-Forwarded-Encrypted: i=1; AHgh+Rpe2RE0U5qZHaEHm2XKC6w7EGpFsCizGty9s6FgEd/TZlEbGFTEGcWYct/B+c6pIgr6ZPn9fwjh+K9EOiBl@vger.kernel.org
X-Gm-Message-State: AOJu0YzyorSybiU4PIy3w/7PJVUe/melDpElWWQOJP71BaWYU5kUc+vr
	R7T+pEqV8tngIZP5+UTUQ47w7I9M1qK37k6kWtR9Q5piZRq7Rd3RaogesbVBTQTFa6G0L6K//Ht
	wU9EWh6pKE3t17Ru7caD8lmyW1po3t7xG0BW3qNHuPcpRAFxorGdwawmb7fBrR9m/ma25
X-Gm-Gg: AfdE7clmbPnHcudrcy31CvZ6YvQsrDvsiy9AVb34LA0l71Ci0IV3OEMkajzJVto5/SC
	2I/oVD8TxkCIKtHy0xdVHC+6mY06oiWHcdjNzZMIAAvTc/vNgozzV3x22bKRvclCjUuyzNxaJ9p
	T/yajkO6NBO8z1K6d0eQIDBgken1g9UNJzhbpNavj75A66ikhZVaop+wkoxrMBCgdcBIM01WM3p
	V12wbZBfLKiARHYXat3AqbKWFNbDmLyG+Vspwy6/8UdZH5L6FrpW1PkF9Un3Jd4BlZSmReNzlhG
	PpkJqCH9Y8bTV7PZLKR5jmTBc9MJ+MbsKZt6pAXuuH+7oUdoHA249M57Pt/zo4dGWO4qd+hCtwt
	pjAkLZ0ppP576Kz2AiJ0qZJqksDWMFhSzh/VJmkHVt3VzCxiTMq2QKR08y18VR42mRW/BDXSn3n
	xBughZO0c=
X-Received: by 2002:aa7:9307:0:b0:845:df5c:2567 with SMTP id d2e1a72fcca58-847a82501afmr606112b3a.25.1782806497007;
        Tue, 30 Jun 2026 01:01:37 -0700 (PDT)
X-Received: by 2002:aa7:9307:0:b0:845:df5c:2567 with SMTP id d2e1a72fcca58-847a82501afmr606054b3a.25.1782806496280;
        Tue, 30 Jun 2026 01:01:36 -0700 (PDT)
Received: from [10.133.33.239] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03cd5c2sm1384983b3a.61.2026.06.30.01.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 01:01:35 -0700 (PDT)
Message-ID: <33ee63e5-c1df-47b6-bde1-4fe6b037878a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:01:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/7] Provide support for Trigger Generation Unit
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
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
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <ce9a2121-8f7e-4ac2-8795-5ee602966e74@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -WdYlxWNZE9Fh_87g1Wis-0e-InaXS2c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2OSBTYWx0ZWRfX42Hswa2Ks13B
 3HC2WE+8LtbgnrzBBYozSonp9RCjMfEHtDRNGUf8s82lOPaWJdFUmxHmwmd3zlVISAXnyO5L6Jc
 /UV1rl1+Cv6PpHV0uRgoB903DsEl8y0=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a4377e1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=fWFuU9I0zHhLgkhYlfEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: -WdYlxWNZE9Fh_87g1Wis-0e-InaXS2c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2OSBTYWx0ZWRfXxEgLm0LqH/Vh
 KpBZQ1j8rpzPkdEcD+1Z7zy/492L6icPdAEancOdXFSSd2Y8TAQj0CHOI/q3jyiXTD2wsw7UKIN
 EU92ssOzIn+Pb5/T3Nt0dEADNAn4bvdJmnRwkLsZAdBD+rcpSrStIkLzkLoUggAd/9sM9yb16ve
 6FnAfQV8KLSUYkOVTG/JaXx3N37Mr/algu6QG0dxRtMhoGre0YuJN5h4p+rHgLVCNIe63Byp6O5
 zqARi0VIPFa1zIayX+/kcgnouRDQ25UHedYvbNJoPC8/C+fY8AVghp5ax3vPkDdH66tB5/OEDMC
 qBcJe36ZDB8I1sWTLPK0BCEqmK/M4SLVB16bCldpdkrKgL2IA8OM6X8KZu3p0gmAP5/QVPFYA2s
 t+0++CBFoMwTEdU+QhNrdN5jGjeOGWEbZaMrfsQaSX503HYAgsgUmFgODv1c1KHr02c/yx/D1yt
 BS6cov7k2QJhB8FFRHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115322-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:gregkh@linuxfoundation.org,m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:alexander.shishkin@linux.intel.com,m:mike.leach@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:james.clark@arm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:coresight@lists.linaro.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 52C6F6E17E7


On 6/29/2026 6:44 PM, Suzuki K Poulose wrote:
> Hello,
>
> On 29/06/2026 11:17, Songwei.Chai wrote:
>>
>> On 6/29/2026 12:22 PM, Greg KH wrote:
>>> On Mon, Jun 29, 2026 at 11:03:33AM +0800, Songwei.Chai wrote:
>>>> Hi Greg & Alexander,
>>>>
>>>> Apologies for interrupting again.
>>>>
>>>> As the TGU hardware plays an important role in Qualcomm tracing 
>>>> design, I
>>>> would greatly appreciate it if you could kindly take some time to 
>>>> review
>>>> this at your earliest convenience.
>>> The merge window _just_ closed, please give us a chance to catch up.
>>>
>>> Also, why us?  Surely you have other reviewers for this code, right?
>>
>> Hi Greg,
>>
>> Understood, thanks for letting us know.
>>
>> Regarding your question: since this introduces a new 
>> drivers/hwtracing/ qcom directory, there is no existing maintainer 
>> for it.
>> Given your scope (and Alexander's), we believe you are the most 
>> relevant reviewers.
>>
>> The reason for creating the qcom directory is as follows:
>>
>> /We previously tried to upstream this driver under drivers/hwtracing/ 
>> coresight,/
>> /but it was not accepted as it is considered Qualcomm-specific and 
>> not tightly/
>> /coupled with the CoreSight subsystem. Based on this feedback, we are 
>
> Some clarification here: This device is not CoreSight  so we denied
> keeping this under drivers/hwtracing/coresight/ - Not because it is 
> Qualcomm specific. We have TPDM, TPDA, TnoC devices under the coresight
> subsystem, which are all Qualcomm specific for e.g.
>
> That said, there are other drivers in drivers/hwtracing/ which I usually
> merge and push to Greg, after some reviews/acks from the respective
> people (e.g., PTT HiSilicon PCIe Tune and Trace).
>
> But, your proposal was that there were other maintainers for your new 
> subtree and you were going to push this via ,linux-arm-msm ? to which I
> didn't have any objections.
>
> That said, I am fine with pushing this to Greg via the CoreSight pull
> requests (similar to Hisilicon PTT driver), but would need someone to
> Maintain/Review the driver (with entries in MAINTAINERS, similar to
> PTT).
>
>
> Thoughts ?
Hi Suzuki,

Thank you for your constructive feedback in helping us move this patch 
forward.
As the owner of this driver, together with Jie Gan (who has extensive 
review experience), we will be responsible for the maintenance and 
review going forward.
The MAINTAINERS update will be included in the next TGU release.

Feel free to share any additional comments.

Thanks,
Songwei
>
> Kind regards
> Suzuki
>
>
>
>> exploring/
>> /a dedicated drivers/hwtracing/qcom directory, similar to intel_th, 
>> to better/
>> /support this and future Qualcomm hwtracing drivers./
>>
>> More details can be found in “[PATCH v14 0/7] -- Why we are proposing 
>> this”.
>>
>> Thanks,
>> Songwei
>>
>>>
>>> thanks,
>>>
>>> greg k-h
>

