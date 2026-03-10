Return-Path: <linux-arm-msm+bounces-96779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EL5PADqOsGkukgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 22:33:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C5A258566
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 22:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD4893014633
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75E8355F2B;
	Tue, 10 Mar 2026 21:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y7RlNkT/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jq8Fiwy5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF932DCF57
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 21:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773178423; cv=none; b=WvjtFWOvYNRyRsnY7LKS3FLwjHSj2YAO+u61xvp6GQ/9fYXrt6b0j39ik4GJ3gkC2KFXNYCHEVfDolBIj+G0njd4OpFoyBPkipM9liT1PbA1f6VAZpEOqw2Xx+X3R4iICBDktVG82LRHyw24ZUfpU15CklHWEOT0VKVBqXvrkXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773178423; c=relaxed/simple;
	bh=vZ6kfSxF3p3jXcX75AWHKBUyJT+t9LhVszFZ+FfguWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WE/UtbaGpLABGEFu30N6XnoC9bDSk1sBSzw50eRO4KezWjXL+O57VyKufdephvLp72Dp5XoS2JW2wyIDQZkuBR/E6sVXvhxE2UDXqAt9XhKl/9LPL+k7YZ8IiWhCSZVJcLSVzqi+gjR3NIMLwa+yFx5eLZQqcxItCjllp4f79c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y7RlNkT/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jq8Fiwy5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AGH01E508377
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 21:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fcNF+EJtmKlwQJTpyTUWvCK0JPqQPEfk3+f+fKDaBI=; b=Y7RlNkT/h/+qZeJR
	DZUT3B5LeXlu8B2QRvH/aIOr0QilTivjoC8nN5mny1HHU7/rXmDnfhJNcaeScN8R
	qFepx94SVura8bZ0TXNBEBoKVhqtojLI0+z1wXiA084BoLBtJZ1eyLQYtoKdCxBR
	i1KzliaQXat0pek+vuyQCpQ2m1nd0/daCJE8Otb3HiHYS8AEayUp5FoNzJGhPzxg
	9sqZ9UDtV1JbXBTcYpNqiBmw/ZH9pWmtoN0ahD3HWpTF63hAFivdEwVcoVaHGgiT
	aiTa0FRD/8vZaB4dWJGam6+2HFhVBvDEFKjcMghEK7fZBp/p8BfiQEyfPfdPiCFs
	d2Yzyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppah5pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 21:33:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4f27033cso100451625ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773178420; x=1773783220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4fcNF+EJtmKlwQJTpyTUWvCK0JPqQPEfk3+f+fKDaBI=;
        b=Jq8Fiwy58zsfOjJF3ufJmbTfg7tSawzCobi9kD7hkU9F/mUCYVJyX6hOnFLkSH6fXh
         l782drHRl7T4bpMyoSlMJdP/DyzZ7aRbucXsAIKiTW519zUb69uOwGfMc5vEbY6CoyBe
         cnUbpGTryil22dXvjgHNa/PIrFKYbRT2bSF4neB6+Z25mPOPR2SIFa6H+kSHvWteyKyL
         VOoIAOJrqa9sjpjvpVrEDUnzZToSjoaOKPHBlsZ0BwyI6QkOSSBdDtcKayskpXCqWlYS
         M78xsbkUxFAZFhNDCNLEhAO0uiT/tZbNNiuMkXfP+usBJ+tFoc+qW+EIsTPQcPZinuTZ
         f9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773178420; x=1773783220;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fcNF+EJtmKlwQJTpyTUWvCK0JPqQPEfk3+f+fKDaBI=;
        b=KiLgqW4CFrykzpSPXgPWxkIILTUigaHtrT7vEf6C50HxYDyCIdjKqEQ3syUORPaLH8
         uiBP+w+62UmXpCvL+riVY4nxRWxw0+b2KktL7CGOkHr2hSblkS/pMoBAM3An+tMbR39s
         vza70HefDfL8MdjrgV90GIj5zffnwY4nPKU/T9ZikkODpbvbhCXYjbJeKm8HELHvuabE
         b0Xiw2OPjis6nvOunyhZF9H15HZ4PbJMRKJI/ffnFcE/BExTvgnix+156Q5dd0yBO82m
         4rptXa2/QCQRVoaYi3PKpqqcv6WyqTqJSQotfyzuZMQpAKqxHhIQ+EVy2t72m23xMgkZ
         orsw==
X-Forwarded-Encrypted: i=1; AJvYcCUSFHH0Hgr54lk6Qn6TAKY2/VJLrEGXhOstMFjFl7Rd/h+1O4BdgCTdWBs52QeRZTXx/mqS673oHdGBd2/S@vger.kernel.org
X-Gm-Message-State: AOJu0YyF8sN9HEcfz9iMvuKne+HDkfoFF1q08rBosP58K2cxq/BGSrZi
	i0GRHjaqaM40Q+YXGfDlOqjzdBYWGGoZMbP4d9D7QZVrzYgufkONQmLe+QfRu9yr7prawHLQdjt
	c1AfuQHeDTzcAPY9f67S8TcLym4FuU58gOARrJ8LG3sj74vSIfLo7gvxB97sjRHXzKJUC
X-Gm-Gg: ATEYQzyT+6KLJ7PlMTG2K5nKQ4vvEDEOS7Li1/SYHaARMFc//UaYo82I14cDx0mawdF
	jAWjYELE+eKhWhy1+z+vhcPZtUbB8BeMGh2dY4cqEbAsDKD2lIT/YoJu23WdKQizTDnarPf7OmI
	ZBRlmFTVbjECqkO2LnPsJCKmonE9ne/EyBMEEHmV0nfnGhsrGOSRpek6gEZ5AZOpVV5V6sVerZR
	sBwd533HooG8FP8mMpIUGy9HscyGDh62idgGShIRw1kYwkdJ5d023DRJjJgbwx60x8Zan92ZKa2
	qsHzm8rZnet4nJaPWYp7Y7WEBt+CGG3UxF1Q7Z6q/fskS++SoT2ISFvSUvEsHUt5bEoHKry5ytC
	Gz99eTTFAlozh6GGaR+AW8zDr5ItF7qMkxk6Ln32RJt643w==
X-Received: by 2002:a17:902:f68b:b0:2a9:62ce:1c15 with SMTP id d9443c01a7336-2aeae6554bcmr3105975ad.0.1773178419454;
        Tue, 10 Mar 2026 14:33:39 -0700 (PDT)
X-Received: by 2002:a17:902:f68b:b0:2a9:62ce:1c15 with SMTP id d9443c01a7336-2aeae6554bcmr3105675ad.0.1773178418668;
        Tue, 10 Mar 2026 14:33:38 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.235.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222e2fsm2550725ad.2.2026.03.10.14.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 14:33:38 -0700 (PDT)
Message-ID: <b2c3c56d-5b30-4201-bd16-924bf674c9d7@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 03:03:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Questions About SM8550 Support
To: Aaron Kling <webgeek1234@gmail.com>
Cc: rob.clark@oss.qualcomm.com, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <8c64d188-9e14-43ae-8950-b31347f8eff8@linaro.org>
 <CACSVV02HKpEGQ6cAhNQ8a0YiT0nXHVD8=yXOfONz=1Amac+z2A@mail.gmail.com>
 <CALHNRZ-4oM9Kpx-umvdYaMXDwBtny5HHpe1PWzFcJ9=3m0s49A@mail.gmail.com>
 <4c2faa1d-504d-4642-90d7-8db21b99d7c1@oss.qualcomm.com>
 <CALHNRZ-HzFfgeScszdHb3CtAsm9rc9UBrbkiz7wgo+dVUZ4wWQ@mail.gmail.com>
 <CALHNRZ_=c0JZ4B779rCciP+_U+YMqEbby1F5RaeyUTZiNZdc2Q@mail.gmail.com>
 <593afb89-031d-4376-8ea7-024b645c62cb@oss.qualcomm.com>
 <CALHNRZ-FjMiS7ADWmBeY2gAQhswi15Uc1qCM6xP5FDeSbgD9_Q@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ-FjMiS7ADWmBeY2gAQhswi15Uc1qCM6xP5FDeSbgD9_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZYrrodN7c8QoQQVqDYkQo2Ac_rUr1aWq
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b08e34 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=BW+shDmDd6ONvfG71J/jLg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=UnGnXU_rWU9t5xrPzJoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE4MyBTYWx0ZWRfX4keU3bsvXFVV
 3p/DcMH069E0QsCqN0vXzSV14O8tC3/cKAx/tiu5n/bwkjJa7TstM8k7FHMVDa9G3H+62WtiprZ
 yUfP8GfK4KRwcxKvGaLAiJgLd7Z8XgRE3jJIn/Okzmi68mtiQTmfe8bMFd1rTEfMzkz/useWeqj
 VBzd/uCeLsU1mrYN2pelMQqqWyXJIEDUZfjsw8wKSDgz0aPrN/78ttO4SSryuB1QRN+dxHkTZY+
 Vi70PqlJABVommOk6wcfkPMpIBA8YJyKcRSYqm6MHPChFRC5nYvic//cotZrDsa80VjLK70fp4V
 YZsTsXRBMcRTFqseePoqQARA323bQ6QghNDzMngqzfauskMZMi/AYIMwuT6iS6CkXy948qoHmZu
 H4ZDV19PrBcBni49Jcjz729OJQtuYqMuiIjltO8gm+Le3V5qD2SZ83rjZwXU/TpqnDfro47ueG0
 Nxukg/eSkP2zx5R+vmg==
X-Proofpoint-ORIG-GUID: ZYrrodN7c8QoQQVqDYkQo2Ac_rUr1aWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100183
X-Rspamd-Queue-Id: 66C5A258566
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96779-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/5/2026 11:10 PM, Aaron Kling wrote:
> On Thu, Feb 5, 2026 at 7:29 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 2/5/2026 1:31 PM, Aaron Kling wrote:
>>> On Thu, Jan 29, 2026 at 8:35 PM Aaron Kling <webgeek1234@gmail.com> wrote:
>>>>
>>>> On Thu, Jan 29, 2026 at 5:11 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>>>
>>>>> On 1/28/2026 11:24 PM, Aaron Kling wrote:
>>>>>> On Wed, Jan 28, 2026 at 8:46 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>>>>>>>
>>>>>>> On Wed, Jan 28, 2026 at 12:54 AM Neil Armstrong
>>>>>>> <neil.armstrong@linaro.org> wrote:
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 1/27/26 23:48, Aaron Kling wrote:
>>>>>>>>> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
>>>>>>>>> for Android, using mainline kernel drivers. I have come across some
>>>>>>>>> missing functionality and failures that I would like to inquire about.
>>>>>>>>>
>>>>>>>>> * ABL fails to load a dtbo using a baseline dtb unmodified from
>>>>>>>>> mainline. Using changes described in the gunyah watchdog thread [0], a
>>>>>>>>> dtbo loads and the devices boot as expected. If any of the changes in
>>>>>>>>> that post don't exist in the base dtb, abl will fail to load the dtbo
>>>>>>>>> and go to the bootloader menu. This appears to be an issue in the
>>>>>>>>> baseline abl code, affecting all devices of that generation. Would it
>>>>>>>>> be allowable to merge a change adding those changes to the sm8550
>>>>>>>>> dtsi, allowing an unmodified mainline dtb to work with overlays?
>>>>>>>>
>>>>>>>> Any addition to the DT must be documented in dt-bindings, so if it's needed
>>>>>>>> for boot they should be documented and added for sure.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> * SM8550 does not have cpu opp tables, thus cpufreq does not work. I
>>>>>>>>> have locally copied the commits from sm8650 and adapted for sm8550,
>>>>>>>>> and that seems to work okay. But no measuring of bandwidth was done,
>>>>>>>>> so the numbers are likely not entirely correct. Is there any plan to
>>>>>>>>> generate correct tables for sm8550?
>>>>>>>>
>>>>>>>> Cpufreq works but not the interconnect scaling, so doing the same as sm8650
>>>>>>>> is fine but since the values were calculated from downstream DT tables,
>>>>>>>> the same should be done for sm8550.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> * As part of a series to support the original Odin 2, a patch to
>>>>>>>>> update sm8550 EAS values was submitted [1]. But that series stalled
>>>>>>>>> and this was never merged. If this change is valid, which per that
>>>>>>>>> discussion it appears to be, can it be resubmitted by itself and
>>>>>>>>> merged?
>>>>>>>>
>>>>>>>> I missed this patch, please re-submit, I also need to update the ones
>>>>>>>> for SM8650.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> * Per the mainline kernel device trees and audio topology provide by
>>>>>>>>> the oem, these devices use primary i2s for the speakers path. There
>>>>>>>>> was a commit adding clock support for that as part of an hdmi series
>>>>>>>>> [2], but that seems to have stalled. Is this going to be picked back
>>>>>>>>> up?
>>>>>>>>
>>>>>>>> No, I do not plan to do this work, it required adding callbacks in the
>>>>>>>> code to handle the clocks like done for the pre-audioreach firmwares.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> * Inline crypto fails to detect hwkm support. And I see other logs
>>>>>>>>> online, such as for the sm8550 qrd, that logs the same way my device
>>>>>>>>> does. I traced the issue to the check for wrapped key support [3]. On
>>>>>>>>> my devices, the derive call is supported, but the other three calls
>>>>>>>>> are not. I was pointed at the downstream headers for sm8550 support
>>>>>>>>> and only derive is listed there, the other three don't appear to be
>>>>>>>>> used in the downstream driver. Is this expected? And if so, will this
>>>>>>>>> case be added to the mainline drivers?
>>>>>>>>
>>>>>>>> Does hwkm work with you remove the last 3 calls ?
>>>>>>>>
>>>>>>>>>
>>>>>>>>> * Some gpu related clocks complain about being stuck off during boot,
>>>>>>>>> causing stack traces, but the gpu does work. I tried to do some
>>>>>>>>> research into this, but quickly got lost in the weeds and I have no
>>>>>>>>> idea where to even look.
>>>>>>>>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
>>>>>>>>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
>>>>>>>>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
>>>>>>>>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
>>>>>>>>
>>>>>>>> This may be related with the display handoff from ABL, did you add the
>>>>>>>> plat region to the reserved memories ?
>>>>>>>>
>>>>>>>>>
>>>>>>>>> * Sometimes when starting rendering, a bandwidth submission times out,
>>>>>>>>> then the driver immediately complains that said id was left on the
>>>>>>>>> queue. I have tried increasing the timeout, but the same sequence
>>>>>>>>> still happens. Timeout happens, immediately followed by a matching
>>>>>>>>> unexpected response. Implying that this isn't actually a delay /
>>>>>>>>> timeout issue.
>>>>>>>>> [ 1848.517020] platform 3d6a000.gmu:
>>>>>>>>> [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
>>>>>>>>> HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for response
>>>>>>>>> [ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [msm]]
>>>>>>>>> *ERROR* Unexpected message id 1015 on the response queue
>>>>>>>>
>>>>>>>> Weird the timeout was extended for this very purpose
>>>>>>>>
>>>>>>>>>
>>>>>>>>> * Some 3dmark benchmarks such as solar bay cause a gpu crash. I am
>>>>>>>>> unsure if this is a kernel problem or userspace, so I'm submitting
>>>>>>>>> here first. If the consensus is that it's a userspace issue, I'll
>>>>>>>>> submit it to mesa.
>>>>>>>>> [ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu
>>>>>>>>> fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
>>>>>>>>> 00000001512E9000/003d ib2 00000001512E7000/0000
>>>>>>>>> [ 1860.113122] msm_dpu ae01000.display-controller: [drm:recover_worker
>>>>>>>>> [msm]] *ERROR* 67.5.10.1: hangcheck recover!
>>>>>>>>> [ 1860.113238] msm_dpu ae01000.display-controller: [drm:recover_worker
>>>>>>>>> [msm]] *ERROR* 67.5.10.1: offending task: Thread-23
>>>>>>>>> (com.futuremark.dmandroid.application)
>>>>>>>>> [ 1860.258126] revision: 0 (67.5.10.1)
>>>>>>>>> [ 1860.258132] rb 0: fence:    2884/2884
>>>>>>>>> [ 1860.258133] rptr:     36
>>>>>>>>> [ 1860.258134] rb wptr:  36
>>>>>>>>> [ 1860.258135] rb 1: fence:    -256/-256
>>>>>>>>> [ 1860.258138] rptr:     0
>>>>>>>>> [ 1860.258138] rb wptr:  0
>>>>>>>>> [ 1860.258139] rb 2: fence:    41563/41569
>>>>>>>>> [ 1860.258140] rptr:     1752
>>>>>>>>> [ 1860.258140] rb wptr:  2319
>>>>>>>>> [ 1860.258141] rb 3: fence:    -256/-256
>>>>>>>>> [ 1860.258141] rptr:     0
>>>>>>>>> [ 1860.258142] rb wptr:  0
>>>>>>>>> [ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG0: 0
>>>>>>>>> [ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG1: 0
>>>>>>>>> [ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>>>> CP_SCRATCH_REG2: 41562
>>>>>>>>> [ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG3: 0
>>>>>>>>> [ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>>>> CP_SCRATCH_REG4: 3736059565
>>>>>>>>> [ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>>>> CP_SCRATCH_REG5: 3736059565
>>>>>>>>> [ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>>>> CP_SCRATCH_REG6: 3736059565
>>>>>>>>> [ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>>>> CP_SCRATCH_REG7: 3736059565
>>>>>>>>
>>>>>>>> @rob do you have any idea how to solve this crash on a740 ?
>>>>>>>
>>>>>>> The clk and a6xx_hfi_wait_for_msg_interrupt errors indicate that
>>>>>>> something is unhappy about gpu pm.  I'd focus on that first, since
>>>>>>> that is almost certainly the cause of the later issues.  If things
>>>>>>> _sorta_ work (rendering UI, etc) you could try removing all but the
>>>>>>> lowest gpu OPP as an experiment.  Could be that power related problems
>>>>>>> surface when the GPU ramps up to higher OPPs.
>>>>>>
>>>>>> Things work amazingly well compared to what I was expecting. Using
>>>>>> mesa staging 26.0 as of yesterday, I'm getting roughly 80% performance
>>>>>> in the benchmarks that do run, compared to the stock Android. And
>>>>>> rendering is correct everywhere that I've seen so far. Mesa 25.3.3
>>>>>> gives about 89% compared to stock, but there are graphical glitches in
>>>>>> some of the benchmarks.
>>>>>>
>>>>>> I set gpu max_freq via devfreq to the minimum available frequency and
>>>>>> ran the failing benchmark again. It completed once, but failed with a
>>>>>> similar stack trace on the second run. And per sysfs, the gpu did stay
>>>>>> at that minimum. Of note, that causes the benchmark to fail, but
>>>>>> rendering does recover and the unit is still usable afterwards.
>>>>>
>>>>> In sm8550.dtsi, I see that ACD values are not specified in the GPU OPP
>>>>> table. Can we add those (from downstream dt) and try again?
>>>>
>>>> I don't know what I'm looking for in the downstream dt. But if such a
>>>> change gets pushed to lkml, I can grab that and verify.
>>>
>>> I took at look at the downstream dt and took a guess at importing the
>>> acd values. I'm not sure if the gpu here is the baseline kalama or
>>> kalama v2. I guessed the former. There were a couple values missing
>>> however, that I had to extrapolate based on other frequencies. This
>>> however changed nothing about my test results. Still getting crashes.
>>
>> Please use the values from kalama v2 dtsi. And if the acd property is
>> missing in any OPP node, that is a hint to the the driver+gmu-fw that
>> ACD should be kept disabled for that freq corner. So, please follow the
>> same.
> 
> Alright, I updated the change using values from the downstream v2
> dtsi. Still getting the same results. Since it's needed regardless,
> would you like me to submit the ACD patch?

Sorry for the super delayed response.

Please go ahead and post the patch.

> 
>> ACD configurations are required to meet the hw specifications. We can't
>> predict how the hw fails in case of a spec violation. I don't know if
>> this issue is ACD related, but we should ensure that all power related
>> configurations are accurate first.
>>
>> Also, could you please try the latest firmwares (sqe and gmu) from here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/qcom?id=30979b116b5c5857b72c4332db8db0ff1ca2dc08
> 
> These are what I'm already using.
> 
>>>
>>> From my perspective, this part does not appear to be a PM or frequency
>>> related issue. Some of the 3dmark benchmarks I have never seen crash.
>>> Like Wild Life Extreme. I can run the stress variant of that and it
>>> beats the unit for 20 minutes at full clocks with a screaming fan and>
>> that runs perfectly stable. Solar Bay Extreme also runs completely
>>> stable in all of its glorious 3 fps. The two problems are the standard
>>> non-extreme Solar Bay and Steel Nomad Light. Both of these
>>> intermittently crash with similar traces to what I posted before.
>>> There doesn't seem to be consistency in the faults, sometimes it will
>>> be almost immediately after starting the benchmark, other times it
>>> will get 90% through and then fail. But they virtually always fail to
>>> complete. For another point of data, I have never seen GravityMark
>>> cause a fault either.
>>
>> The peak current draw can vary between benchmarks. So we can't rule out
>> power issues. And are you able to reproduce the same issue on another
>> device?
> 
> The only relevant devices I have are two of the AYN qcs8550 devices, a
> Thor and an Odin 2 Mini. The issue happens on both, yes. But I don't
> have anything like a phone or devkit with sm8550.

I will post a few fixes in the next few days. At least, with that there
should be a coredump generated for hfi errors. Please share that.

iirc, you are using upstream drivers with downstream kernel (ACK?). Any
chance you can try pure upstream kernel?

-Akhil.


> 
> Aaron


