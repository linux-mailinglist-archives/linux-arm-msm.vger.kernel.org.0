Return-Path: <linux-arm-msm+bounces-111304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YdbpD5spImpiTQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 03:42:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 975C06447B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 03:42:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fCSuqVjD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NMdPwyZ9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111304-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111304-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C01C3060CAC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 01:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7EF3BB9F4;
	Fri,  5 Jun 2026 01:28:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD5A372B51
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 01:27:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780622880; cv=none; b=DkwtAfMTKRghjlBvH1gO0J+e1Y/ocwg9Kz8MMs/6vzEQJPsRQ5uOtI/RJz9zlpB4jA2OIFjnmaYp61m8h8mu9prN/GlWwbWFpP9Eo3NZOLlOHWf3hjpRhld8jKHiNgZaWJdygCoet4aZgq8sSl2wOnx61NHN0mJiRanHurMttVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780622880; c=relaxed/simple;
	bh=BPZVrj40PVQeeFYswAnpcpt11XBFHkwvZ6MLK/ulGc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJxWglCRvoct8S8aPnDUByejZGgQD1zm2iw6vgnwfsNwo13MASNw0OnsjXJbZ3CcRUTabO6DZVdTAs/kNz9ZZNfWDLhLkNEyvAgcCampahOl1Pl4/+FeyWPSmmLE932JhZh75EWq+N/R/ATGt85ENVR9zL/kXtURYK9EfexTt9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fCSuqVjD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMdPwyZ9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654KKn1H2701692
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 01:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YKl6JvG/MrQiHrQ3H0zajo7ZT+v04oiaR1ECHAlix/I=; b=fCSuqVjDBJ6//uZ8
	FWdCZLm1q9CeCNkW2Z/XVi29RNAnlvkL5kfsvSdtMOoHKldgtiSGE4cXzkrz2aSq
	E8gTmAyWle3wgxeNaox9pNoCPSZqRlhNMihGzDqDgBAnsmgPU9Pm67glBhNw8JpT
	JUa4zY99ScBBV972Hnalkhk+UkTt3d5w4fEzXZS+3dJ+mlocVr4un//F09Vkq9bM
	qvYMp4Vyc2AlcrrXrt+G3UnDbPSw6JbdHAx4+orAPdKueoLjme9atT/UHgoGjvoa
	JofjWnRrKWOwxOLawcThqPSSURnJBF8szNronotaDkrfCnQXUwCMiE7R/NV8IVDy
	5Xk78g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekgaj12ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 01:27:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304d8613efbso1262285eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 18:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780622872; x=1781227672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKl6JvG/MrQiHrQ3H0zajo7ZT+v04oiaR1ECHAlix/I=;
        b=NMdPwyZ9P+YlxhKOwqbTVv+UNMr58djzEHSDpa0fxrFNkT5w76O7vKp03fm+5T5rKX
         FDvW4ul/Ys408RyJXV+defAHrWwdkL5P9IEmCJEoiG+vpyFuFWtusQrTIhOg+PtmZuGA
         /El3ueAO+PCcZooBh/WpSf1tHWYskJh619bseny9Z+9xfVn0/pKTddstVyRCoCWREVPy
         iTUa65GLObR2CSlfB/oWNxJIEtSIWs0eQu19n2SmoaOk/vwP5lK2Ts/2w3Hn7qx4Jcat
         +sKNULSoVlPtIgiwPpgpli2S6GuWYJIpnrmC78rKL//6yqDTHMfiB2NbsRFg0XmyxJWt
         rfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780622872; x=1781227672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKl6JvG/MrQiHrQ3H0zajo7ZT+v04oiaR1ECHAlix/I=;
        b=MurAPLzguzYXD6zntnCe2ajXdw9FQuALXm4V+y7G5m/vmGGhoQLvVa9uJV6GMcFZ2j
         vmBxKPgUXqp/cqFa7sQ6DT4LhQyuITbfP0gXumEvPfemFf8SWRnjIJM7IOmkCnl4dC1Q
         vfHmTZ7rH5987uQ/QIynNYIonjoBaFf0f6cpR2Pv0FaEmgL/02hRG4JTshlO490QiFjJ
         3M0I3/IIJyjvdWYPedBr9ZbWJvlSJLJvmBEKqTpaImrYp1YmQ74jLGN3YU1+X9IwH2FN
         0OzV1bl4HSuX826023IQ/X3H1EPKcbcxrWI0ds5ZpN0bD4wxn9ylc6jx46yk/V183WUX
         1P9g==
X-Forwarded-Encrypted: i=1; AFNElJ+n9uWgAijKr1aMXvGy6uRZ+fyz6peCUJjoqydBahfrjqO2AiqtsDkEr314LjRbQ3D+8B6hSt1Nkb29N/40@vger.kernel.org
X-Gm-Message-State: AOJu0YwQbz761NpbQ7OAHNEzwGnljjzcpOj4ofp2snsW15pQ3mT1n6z7
	PRisj1b3hq5le8BXK/VL9vjuj16BeFhQMvwHMBX4AcGw7OSapfXZP36QnOIPQrCFx00oKSDmudi
	ElZyhnxfQ9wgNkMGbRpw2tHp+Sq1b0PZwkZvaLnid/RnEG4oXPaRr5mZKLbOko9j480RS
X-Gm-Gg: Acq92OHNr+OzU4nwTMb5aBH2C7+8J8XMX5g95KOLI0E5SsxMinv4IcVbUDBc4B9y8mp
	2GebbutU1uIytFovxe+OOzxHshyQG2RrN7MGW6fiSfc/s2l+CkRO1Fu5GfUUudzAvvItMASPb12
	qF1JwWNcz5+Pw4XpnJ7zuQ8l2TV1xfgfWmEc6x0CuK0OuWIVtan91jP8YKLWqClqw+aTifV8Y2M
	erKhS5fSsacXxatMq9Ynd2Xao1VRlK6xwes0KraKaxDVPzFn78SprLhgLQfqXOKXx3xhq1Pe3i8
	EZflFCuURa6kcKlOKFu+yp02V1Ihiq5Qk2naLeKPJfVBRSdWDW6G0il5HAPPEgUNtyxkwP0S5qq
	3n3xxy39vKjVLCU64OO2vnBp91iOBmTpPoWl4/EodbC9OMQLaIMgFBkImlb28JSlqRe5Zt4gd5Q
	KblidceFnC7rNYnw==
X-Received: by 2002:a05:693c:2c01:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-3077b32a4ddmr630084eec.3.1780622872434;
        Thu, 04 Jun 2026 18:27:52 -0700 (PDT)
X-Received: by 2002:a05:693c:2c01:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-3077b32a4ddmr630068eec.3.1780622871935;
        Thu, 04 Jun 2026 18:27:51 -0700 (PDT)
Received: from [10.71.179.79] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm8526270eec.8.2026.06.04.18.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 18:27:51 -0700 (PDT)
Message-ID: <078551b4-049a-477a-a538-a02c8c7c18d1@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 18:27:49 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] PCI: qcom: Add PCIe support for upcoming Hawi SoC
To: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
 <20260530-mutant-gecko-of-anger-ce8803@quoll>
 <76bb3e5b-e4fa-400c-b7fb-98f95c7a068a@oss.qualcomm.com>
 <CAGyK6coCyziKzffGmj+fGs4U+mXEeYJ0Q2+z6xHCA+i=gop2oA@mail.gmail.com>
Content-Language: en-US
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
In-Reply-To: <CAGyK6coCyziKzffGmj+fGs4U+mXEeYJ0Q2+z6xHCA+i=gop2oA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDAxMSBTYWx0ZWRfXwWNztgo6jDmQ
 8zWDh2tKzsT1AM41LxkC5hAFR7nuFX5yMyOZIg/QkCfFZGu7vrnCZSJygTitzzc0mgPlBVHpUi9
 YRZwZojS3q/2aqNYH8bLqugg1wxtpMTn1kibAALSnFpViVhBobmp3W6HkZP40tmOCMPn9MKdSwZ
 pVw6WIjQDzxhTkO4UbJbIoawuzmM87C4vFz+uRf3VFYDVYcKyk8DwA8YBDP32wVQLh4tJy9opWi
 fPkXSmDdbFc83m6vXUUnEtp1I0hOjL3X4zTsybJv4mhCqY4tG4bbhgHQyVvPNHVos5tHH+Moulk
 fckdhOAgCw2SHWnyWnW/I2bpZXeRHgGgr6AejZVoxuGvZu7cDIAw+zjOtFUaPv7It5DQMy4WdHn
 A/qBPZRt7ITe2bEqahDcKW7x8dflT0md/pbdmWkP/zaNamjdDDu1Tv7j5yl5KqmTnMGZmwXj5U0
 B5Y4cXo2nQOGJNJomeg==
X-Proofpoint-ORIG-GUID: Z3CCubJzpyWIyxF0zrne8TikovXeWAZX
X-Authority-Analysis: v=2.4 cv=P4AKQCAu c=1 sm=1 tr=0 ts=6a222619 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=U4w5n6qQ5FTTLL6fV5IA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Z3CCubJzpyWIyxF0zrne8TikovXeWAZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050011
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111304-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:manisadhasivam.linux@gmail.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:manisadhasivamlinux@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 975C06447B3



On 6/4/2026 5:09 AM, Manivannan Sadhasivam wrote:
> On Wed, 3 Jun 2026 01:26:53 +0200, Matthew Leung
> <matthew.leung@oss.qualcomm.com> said:
>>
>>
>> On 5/30/2026 3:06 AM, Krzysztof Kozlowski wrote:
>>> On Fri, May 29, 2026 at 01:10:07AM +0000, Matthew Leung wrote:
>>>> This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
>>>> platform features two PCIe controllers: one capable of Gen3 x2 operation
>>>> and one capable of Gen4 x1 operation. The first patch adds the device
>>>> tree bindings documentation for the Hawi PCIe controller, and the second
>>>> patch adds driver support by enabling the Hawi compatible string in the
>>>> existing qcom PCIe driver.
>>>>
>>>> This series depends on the following series queued on linux-next:
>>>> - [PATCH v3 0/7] clk: qcom: Add initial clock controllers for the
>>>>   upcoming Hawi SoC (Change-ID: 20260316-clk-hawi-1ad4cad36d6a:v3)
>>>> - [PATCH v4 0/2] interconnect: qcom: Add support for upcoming Hawi SoC
>>>>   (Change-ID: 20260311-icc-hawi-d6dc165f8935:v4)
>>>
>>> It cannot depend there it makes it unmergeable and untestable. I skip
>>> review in such case, please follow standard documented practices about
>>> decoupling independent works.
>>
>> Thanks for the feedback. On checking the dependencies, the changes are
>> applied in their respective maintainer trees:
>> - clk: applied to qcom/linux.git for-next, commit d6cd9d5692ba
>> - icc: applied to djakov/icc.git icc-next, commit 07548b04dc36
>>
>> Both commits are present in my linux-next base-commit and have checked
>> dt_binding_check passes cleanly.
>>
>> I can resend with the dependency references updated accordingly.
>>
> 
> No. It will still break the pci tree when this series gets merged. Please
> resubmit after v7.2-rc1.

Okay, I will resubmit after the dependencies merge on mainline.

> 
> - Mani


