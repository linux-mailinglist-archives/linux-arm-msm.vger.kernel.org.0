Return-Path: <linux-arm-msm+bounces-92475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGHAL64Fi2kdPQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:17:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 614C51198B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F6DC3000FFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768F8352FA1;
	Tue, 10 Feb 2026 10:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9S+j2Tb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aXi3M10v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0E7352F99
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770718635; cv=none; b=gP1M3vsBALiYqC7nDFw3MWK2B93iqKEqFAIFFIpS+u0qskZmF7CnJKTkY9werVXHB9KqA/EkX6YqelTU2Q29JfZf10uEyUFWoA2Tz1jnsKLfS1pYkeEYgqwtcllTwbdEZkULZ6W37Jhc7B768ahmhOOvEMslnVsZhwLWOd4Bycs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770718635; c=relaxed/simple;
	bh=hnhxlfijio724yfVw62IzrSppeTQWqiNQXNT38jugx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8Y8UliPsSghC+ftFSEx8+oIClp/N9VVU6jdT/HpHmZoG1/sW2XkKisq82s9HBP9OVIKycej7ATsY/F3SeHOSECTpLt7loPJYvMMO2op6lntEbcINs1z6O96BgdO0tg9gYV7e3QbD9/macWA78BAF2QsanOjlCMfB4S/yLek624=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9S+j2Tb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXi3M10v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A74vER3436726
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OaHPDPukpp+Z9s23h/0zCMupcD9EAbUV6Tmo071H7ZE=; b=K9S+j2TbCvlTVQx7
	YXVWnye+7jdZPXwFUxotmPFuk0qCxkmeZBGi7624CLZYY+P32ADGvPIFP7YjNapp
	CTywNDpgTCL7cZmrQgttsC7s0yFtcaKo7nAT+6FbKEIAqh0+QDgPcOC1dch1np+i
	/fLpdB7V/593HG0p4jJ67muP8It0POj0No16KgbUDAfUaHlr3HLFcfvFewUPLnpf
	Y6xW8r++zJnyiDIhv7bqCUS45p5Dpa5WPFzKIS5jTF2IvPsOrPnIiIGn3LdlTYO/
	S88tAfpCbc+WViAJJ3r4lb7zKL0NnduaFs7w/3zASH+O51qZaqbMz2lW9d0HdJBx
	pZ2/nw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7fevby6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:17:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c5e56644646so5028218a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770718633; x=1771323433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OaHPDPukpp+Z9s23h/0zCMupcD9EAbUV6Tmo071H7ZE=;
        b=aXi3M10vYH05UhuanUTQal7D9Rn9eEvPJ/mQs0/DIW1p0WZOemLyV/xiBwaqOntZLJ
         MV73ge8czeMNE705a4OnQHIqCM9wCSLNeORImU8iEJMs2FmFIwFeTJi/PSquomsa1Tag
         nuEOCbpvF0YrMumEaA+V57Ac4HHHoPbgjyYa1CzIGF2e26Zq8aMn5EGmoV8iQoblFDbi
         EuMg2Wmto8fEz8LACuRWKvLFI7D9hCbnRRVVtsSWWt774/TrMZKNsm3Lmy/v4l8fsE0/
         Wwi7skWMeKWvwFkvf7pGhFEW7eGFeN7gnJF+7Y95mukRya9PAs7S9z4DukwObUfuTpfL
         r7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770718633; x=1771323433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaHPDPukpp+Z9s23h/0zCMupcD9EAbUV6Tmo071H7ZE=;
        b=Mj5EnS5j7u6DMB+7FDLdK2dX8YVWqTAXyRYyvz4zi7YDjHjjrAvH9Azn9PXkvY502v
         c5jz5Lz2jIL03/gCTlkyY8Mv8Er1AOhEUQw/kEUVzuKYC5d/5lLAa1akOzgaH2PjQTnv
         u5KdsdEEd3ZoFr60LML8Mg2T5M4Z57aaagTf/avjSVwa+gh6AMJxiR8/+OLa7Bom47eh
         8UbGMmoGPpDlw6VKNOKtzs75JWNhWxeDroNN1SHnQKRqEdr6T2YGsqSlc8YX2BiBdaEL
         86SSv3MXcs8BJIFEjMbkTrGiKKWzQTtIPJYI+o4ukW9Y8JVvhIhSgCNJQe9tR6JAp2uQ
         YRag==
X-Forwarded-Encrypted: i=1; AJvYcCXeYhe0eJ0Lbi/MfmJfYoQzcVJMtdPMUdFfUYP/MZoIteE4mDwqH1MmPgOMux+T7uv9Ay92/PCl7iFhE0/G@vger.kernel.org
X-Gm-Message-State: AOJu0YzigoC9sQ2jypW/RzJUGHuenMCvOQN/OjI5Z+85AIwsTrhvVVnA
	poD+SanaCy34/Ggj3MOdZ5xUL4tPGpMOnGTNT3vclKlqjGVMqhZ+vNI+ScGHQzBNe6gDjCcKKk8
	GgHmj6wya2HTeGHU3GPifLmWUkVY/t1FNLRczNGkgC0sqEU7DXC3bE7IamwGxRpmgge5l
X-Gm-Gg: AZuq6aIUIF+LXe+7ronc9VNxpSZ1Om0ot0k2qI6fTZnC3KIapvwwbFhbLuVr00B7M5s
	26E5Kwl0fwlsaOmyb/XF/S47yAtFDzT+cg/GmhRs6J5lNYEi7DDU3AoZQLzdgQGAek52PuxrVj6
	Dq3FbVvuZP6T3lBZ5h9+r6qhMeAfA2G+ID59972lcIbeyxEbTq+iRK3Ct2t3OvlVMtyf6hOCIbA
	uMZvMl7uaQVHeuicX+VjTwpndVs70852GBYaeFHQkA5n0GYnG9SMnldSHXA8ecONVcdsYshKMdG
	dG5mNsIygyraYvyzvd0fhk0ZW6vJbcDq1sK7JR5RzT4CPHptISDv7fmGRkhk6penEHydvUF/TT9
	lGT2urAs25WgehZ5FmmLFy90UDkDNAa7mfuUUpvMvcB9IHqNDinSaQvrQCVzkyarV0WRXzv7rln
	UdRbO/xNuu6W2jtPU=
X-Received: by 2002:a17:903:2f45:b0:2a9:327f:ac57 with SMTP id d9443c01a7336-2ab0fe973d4mr17049645ad.28.1770718632747;
        Tue, 10 Feb 2026 02:17:12 -0800 (PST)
X-Received: by 2002:a17:903:2f45:b0:2a9:327f:ac57 with SMTP id d9443c01a7336-2ab0fe973d4mr17049475ad.28.1770718632266;
        Tue, 10 Feb 2026 02:17:12 -0800 (PST)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aa3ec42e2asm138713045ad.53.2026.02.10.02.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 02:17:11 -0800 (PST)
Message-ID: <23e007dc-4145-4260-8810-1e98e533b1b5@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 18:17:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] phy: qcom: edp: Correct and clean up eDP/DP combo PHY
 configuration values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-1-231882bbf3f1@oss.qualcomm.com>
 <57bwrceuqejzliljhrzj5wfumtr2q3dslgmjj3vd7masafi4k2@dskfnosor553>
 <23930db0-730e-4f99-a661-262b15f1a8ac@oss.qualcomm.com>
 <w3vmcgeh5bw7lfuyv7ziiw3oxpxtjyqmojddamjo5alz4nv7ld@ytgjwdhecfua>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <w3vmcgeh5bw7lfuyv7ziiw3oxpxtjyqmojddamjo5alz4nv7ld@ytgjwdhecfua>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fKCFjdKhHOJ9pYRNrl-UbTM4OummBaWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4NCBTYWx0ZWRfX1OTwVg2eARoc
 Pn8BymPBg/BCZQCqRs3gBcap2PX2NqA7aDDZDXuzVST5He8HLOPYm0c2C/jbmWyiWCRpyQp4Nra
 lY2l8Bma6v5HXEJGqEP5NYshVzJ7loe1MdibIvZRtkYe0zIasfln53cuTbk6QuKPvfPSUg/usEt
 pbyL9SdgHehRNg2p4p+Ow20zRH4b0lTVm7qpjjlh327xc5B0GME52LOOPu6iE0DjmasOIEYO1bn
 afAMeIfFvnjlba9XJKXBssWmA+x/dMFViYaMaE4CBfU2yJnRHfVgjkM+TOytCDRMtIi0iyiawJg
 DcHFwLXGaNl5BxWKeM2KL0KkixX4MXfTS4Um2Wm0lXKXT19/inwUjN4dSWn2Pu+8Nh8bd7TAKGO
 2ZX2wxPssn+SdDml3g4WmuAwJKSWFN/O79+QqWB+YSeZgSyahHomuglP0y77DFvlBBght3XTOTS
 FrO8LKwNqhCEclZIP+w==
X-Authority-Analysis: v=2.4 cv=F6Rat6hN c=1 sm=1 tr=0 ts=698b05a9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NlieldvSFmUDVkRJfYoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: fKCFjdKhHOJ9pYRNrl-UbTM4OummBaWs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92475-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 614C51198B2
X-Rspamd-Action: no action



On 2/9/2026 8:47 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 09, 2026 at 05:52:22PM +0800, Yongxing Mou wrote:
>>
>>
>> On 2/7/2026 6:22 PM, Dmitry Baryshkov wrote:
>>> On Thu, Feb 05, 2026 at 05:20:53PM +0800, Yongxing Mou wrote:
>>>> According to the current HPG settings, most eDP/DP combo PHYs can reuse the
>>>> same configuration values.
>>>> DP mode：
>>>> 	-sa8775p/sc7280/sc8280xp/x1e80100
>>>> 	-glymur
>>>> eDP mode(low vdiff):
>>>> 	-glymur/sa8775p/sc8280xp/x1e80100
>>>> 	-sc7280
>>>> The current driver still keeps multiple versions of these tables and
>>>> doesn't fully support every combo PHY mode. This patch removes the
>>>
>>> See Documentation/process/submitting-patches.rst, "This patch".
>>>
>> Sure. got it thanks, will remove "This patch".
>>>> redundant configs and keeps only the sets we actually use, matching the
>>>> platforms listed above.
>>>
>>> Should it be combined with the 3rd patch? There you sort out all the
>>> tables, it makes more sense to review all programming together.
>>>
>> Hi, if this would help with your review work, I’m very happy to do it.
>> My original intention was to do some cleanup in this patch—correct the table
>> values so that more platforms can reuse the same table.
> 
> Fixed should come before cleanups (so that they can be backported to
> stable kernels).
> 
Hi, do you mean the second LDO patch should come before the first 
patch？In fact, maybe three patches should go into the stable branch. The 
LDO patch cannot be used on its own. On both sa8775p and hamoa, their 
eDP/DP modes do not match the tables they are currently using (hamoa 
should use the eDP table, while sa8775p should use the DP table). If 
only the LDO patch is applied, it may cause link training to fail.
>>  From Konard’s comments, it seems that the HPG table may not be the most
>> appropriate one either.
>> Maybe shoud first determine what the correct table values should be.
> 
> Please follow the tables for each SKU separately (that's the 'fix'
> part).
> 
Sure.


