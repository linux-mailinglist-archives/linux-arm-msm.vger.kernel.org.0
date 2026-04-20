Return-Path: <linux-arm-msm+bounces-103658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG8VNFi85Wk8ngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 07:40:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B9A426E31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 07:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F528300AC3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 05:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E73C2C21EE;
	Mon, 20 Apr 2026 05:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7/ppPPU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTK19fVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356FC13B7AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776663637; cv=none; b=e3Nm4Dg36vsck6RcTy3Boag208Rh5gGZqpRbLcdlfLlGnUZnmi2oqiShgj7cheZ6Rvg1nucFt0bUE/loGZkuipzSTqcOSDRfFIPCw/yzjpySQUANCGr3mQ0bQD2anh6lIxgMvWYCDYVf1BNBfo3enS/ixG7FkqAWMFI9WANxvso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776663637; c=relaxed/simple;
	bh=myqd4ojhJldM6vUnZJ0gN4tBCWq6MlTbFgeeAUEu2h0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNyvSWk46IDZy1ZR9iQyBUvTbV01xhT1nzErM+QZ5iIlMT900g4TGx8NxbdUXUA1X1x4f9amw47adI0QxNMLNJ6DguECApUSKeMaMaLh/Yxl3IaoRn7PJzb92AiUs/l+MaXeEr9vlqSLfmzrc9v77oGZM7ehUYP/WFUf8nQza/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7/ppPPU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YTK19fVg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JLqY6S282762
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cbyOwZQpyGaGhAm+nYK3pftZzkh3JFFDft7u+D4WIq0=; b=A7/ppPPUxlxoQKsa
	x25X6x9GUgim7xSYg6NmWnXIh5GmhrYhxqSXQXvPXXIpYhDjL1B2/PKSZKN5i5pZ
	M2SPhM0YvCKTaChAWa1U+PmdI+GoYDZpdKjH3AE7CiiMu0t2EhgSmtuzQdka+Ytf
	LusixHdhq3BZS9WWXyyWdHy74mVTR/wRtBjuNPGx5SRbV9KJ8jRM0UxS4UzKh/xY
	8PJcM5pwQNxdt6oOYrcY0hMPN4a4sVV82iZQLMZ/aMBah7dbt9sXS964ftMpjSaF
	i933exK8WkBXIouI9e16hxSL+GC/LA9gyQocrGJtjDMjFit2H1AUo+wtsh2sbjlo
	jnfDOA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkynecg12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:40:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4654f9bb6so28971605ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 22:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776663634; x=1777268434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cbyOwZQpyGaGhAm+nYK3pftZzkh3JFFDft7u+D4WIq0=;
        b=YTK19fVgULZpADi8Vs5UtDnMvPmgaQPzCcQ3yFHpVhIRpStRx15xYcN6FatjxwiDr3
         nU2jP7GgMxwGMuzLWxd40pwvRrwdI1rPvH4IrLBWPrQFsVr5L1rIXS/B9Is/EC0lEbGb
         W0/Abm5XqiLnou8qgmlJnVi94ZHboGNAFLNaJY2QCBcPPDJ2KsVbojxgWrarDvDXZ/uZ
         NFec6vObq56zZaZ2uHbgzGeNYL/Yzh/Q+TzMb7P3oyoWVlRLcRR2LHtIxEGvJkfHEs8L
         wKnYygQSuff+9ZjZ/3SudnDHQihs+HHF08fNA0hsssTakcLkErQ95r4FIK5TiPGi8rJR
         hoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776663634; x=1777268434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbyOwZQpyGaGhAm+nYK3pftZzkh3JFFDft7u+D4WIq0=;
        b=TPV2NuQ8JbmYRq5zhe2KUDrnXNBzw75O+f9OS0dYTCqgTG7T7ZpuW7nizxWbpxcRdB
         g2SVYgBjRMI3lmoAQyOlg7G/hvkQOAKkYbzT9hA2+RVM4rEixZ4f/rqThdwHe+AxZPMm
         DqSer2KRZkGwHptDqourZ+Khnu1EUU3Q8gghJdTNnajzO6YdagBqISdr0e9dI/jADVJ5
         ORT27fM8VghB4BO0QUcVrkRE9eIU74t4HbcE9x91HQPoR3eg8VDJNi8eQR7csPtYJfdf
         SWafUyBj1rfk9tv5cwNrzBbDxiDp/rVbNm5TTgo55Fywb5wYPWDZADPcv23TYHagVMJG
         V9MA==
X-Forwarded-Encrypted: i=1; AFNElJ91NQ0noLpF2PCw/z/svGoWVDnBcMTFZ/24Ty3KlyxAfcO+0TVJaCm6fRSXrMY+ILEF4Fbt131i98Z55QYN@vger.kernel.org
X-Gm-Message-State: AOJu0YwTDwsgLYG9dr5BCplvHAawbiNkfZh5hX43rDUwaZ7xGl2EdgCi
	CuT5CBpKEXsFM4pdVl9jRdAYMGWuxjaUwOkfNiyyJuQJW3E3iez71s2AZlbHL/1E0WTyn3J7uLY
	f59blDLbnuCOBmVGdwlvEOuKnY1tYTcP1fsSRSkoFCD74y40FehmRqfAcnqwbqrVL4JYd
X-Gm-Gg: AeBDiesnmpyOpV22Gm5kXi0L36WH9YTfljrfLLuiSdt03sAUNviXit62NiEgpQJRj88
	I5s8Sv9U2N50Z+791A4gdrrKBLFent2q19ryRmpmx3lRCXEzqt6kFlxj11kEooag2elARn+yDYd
	hXHMpNkzIZPl6jYwsATAll8Vx35jBK1vhpa5yKdLpqbW5O7QshUnYQ/Wadt7lFh9QxMxIU4ITJW
	c56Hf5lHgRv00k3OESilwrtwkobYmXy7HgOcx89gSrmV1Haa5H6hijWff0rJW71gf3UdsrMoC/H
	QAq2Uu+Xi8qqaye3fKzMG5WHSguaBN1ugEB5elZ2UJjTb/OUeUTXg4YRYtVTEME+m2HjnKD9Osu
	B/ao0tCmq6yA4rxjKPfn4T8qVNBBNPgKv6wkHJHEX7qR6OANrs9XbnTAbrY/74zw=
X-Received: by 2002:a17:903:b8f:b0:2b0:7225:d2c0 with SMTP id d9443c01a7336-2b5f9fb9d4cmr121746765ad.30.1776663634273;
        Sun, 19 Apr 2026 22:40:34 -0700 (PDT)
X-Received: by 2002:a17:903:b8f:b0:2b0:7225:d2c0 with SMTP id d9443c01a7336-2b5f9fb9d4cmr121746485ad.30.1776663633739;
        Sun, 19 Apr 2026 22:40:33 -0700 (PDT)
Received: from [10.218.21.127] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0caa9sm89101635ad.40.2026.04.19.22.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 22:40:33 -0700 (PDT)
Message-ID: <21664acb-8fbf-4fa9-a674-982c98992df8@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:10:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm UFS and QMP UFS PHY
 drivers as built-in
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260417035509.1021860-1-shengchao.guo@oss.qualcomm.com>
 <898874b3-fb73-4a46-b440-6ea3377c2f2d@kernel.org>
 <aeHxPALfVd7SgtUj@QCOM-aGQu4IUr3Y.na.qualcomm.com>
 <c2d7588a-34c7-42de-b809-0733b03d331f@kernel.org>
 <aeINUiVreq7HFqf-@QCOM-aGQu4IUr3Y>
 <dvwh2fwi6xzskicjtr6e7ldzsgf7fsptep4t6p5qzzf274jorc@zo7hl565tu2y>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <dvwh2fwi6xzskicjtr6e7ldzsgf7fsptep4t6p5qzzf274jorc@zo7hl565tu2y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbokiCE8 c=1 sm=1 tr=0 ts=69e5bc53 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=P-IC7800AAAA:8 a=SBhvAfEEOFW5FiPrgcgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: UCjhg_hvQBDASusUScCYQQa653edJ0ZA
X-Proofpoint-ORIG-GUID: UCjhg_hvQBDASusUScCYQQa653edJ0ZA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1MiBTYWx0ZWRfX2XlEcHymgONt
 V8wZDCn9gQB6f2gsbXJ08PmulNqkd5lo0aH1XzhfLUcj2Ex0KPOYZmJ2T+fWCsm1fXwpuW2Hqna
 MUIad5EdFjaM/QjIAuM1gvKE1jf3TlYgIX8eN97XFiZowcma/IxU/FIK0wWbKZRMlqFUNi8I2Xd
 vwMw+glvDWLyQyK3GarNXv+UudK9qOE48noFZg+Bb03oZ6LjEHI2DHF1tYSNtPvw5hjKlBrTzm5
 SbZFQ6t01CUd7iBdBJIbN/rzAhKyPu26cTm2GfOguHcS/Z6yfrqupo0s38aSJnJmWrSjPVrJ2VE
 rt25dgiAErGaAdFgpSu6dvHTfRZmes2pMDfF+sVjVs6jCTR/5iwkTYpNRQ7c94fZ7jQlydlVNiS
 gmCqRLj+LYQ27j2LYiT7WT2rEUaFoOq3KIE+sKttPNY3ZaOniWRpU9vZw+J916X/avKAu7clGge
 s6pPY1QuIBUVRrsgrkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200052
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103658-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47B9A426E31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 18-04-2026 04:29, Dmitry Baryshkov wrote:
> On Fri, Apr 17, 2026 at 06:37:06PM +0800, Shawn Guo wrote:
>> On Fri, Apr 17, 2026 at 10:44:20AM +0200, Krzysztof Kozlowski wrote:
>>> On 17/04/2026 10:37, Shawn Guo wrote:
>>>> On Fri, Apr 17, 2026 at 10:14:23AM +0200, Krzysztof Kozlowski wrote:
>>>>> On 17/04/2026 05:55, Shawn Guo wrote:
>>>>>> UFS is the primary storage for Linux rootfs across the breadth of
>>>>>> Qualcomm development boards - Mobile, Automotive and IoT.  With
>>>>>> Qualcomm UFS host controller driver (SCSI_UFS_QCOM) and the UFS PHY
>>>>>> driver (PHY_QCOM_QMP_UFS) as modules, developers need an initramfs
>>>>>
>>>>> Yes, you always need initramfs and every developer has it.
>>>>>
>>>>>> to boot from UFS, which adds friction to daily development workflows.
>>>>>
>>>>> No friction, it's both standard, easy and all of Qualcomm and Linaro
>>>>> developers have it solved long time ago.
>>>>
>>>> I'm looking at a kernel regression by running git bisect, where kernel
>>>> version string varies for every single boot.  How do you usually deal
>>>> with it by using initramfs?
>>>
>>> No difference from every other build and boot? I build kernel and the
>>> same step I have initramfs with modules. Whether I bisect or build
>>> kernel for normal boot is exactly the same.
>>>
>>> The only difference is `git bisect good`.
>>
>> So we have to rebuild initramfs for every single bisect.  But isn't
>> built-in make it easier and faster for the whole bisect process?
> 
> No. Insted you package modules as a separate .cpio.gz archive,
> concatenate it with the initramfs and boot the kernel.
> 
>> It's especially useful for tasks where we do not even need to make modules,
>> like debugging built-in drivers.
>>
>>>> If using initramfs is standard and easy, I wonder why Qualcomm QLI
>>>> (meta-qcom) kernel has UFS drivers as built-in.
>>>
>>> This I don't know. Distros do various things, but of course there might
>>> be an argument I do not know (e.g. like it was why distros do not make
>>> IPV6 a module).
>>
>> We can consult internally, but saving use of initramfs could be part of
>> it, I would guess.
> 
> Having the meta-qcom hat on:
> - If we know that the kernel is going to be used on Qualcomm hardware,
>    it makese sense to enable necessary drivers as built-in to save time,
>    boot time and to ease overall integration.
> 
> - Having the general defconfig, it doesn't make sense to make users of
>    all other platforms suffer and loose their memory by having
>    Qualcomm-specific drivers loaded, if that's not an absolute
>    requirement.
> 

Then it makes sense to make CONFIG_MSM_SDHCI or 
CONFIG_MSM_SDHCI_MSM(qcom specific config) as module too?
https://elixir.bootlin.com/linux/v7.0/source/arch/arm64/configs/defconfig#L1279

Not sure why it's enabled as builtin for all vendors.

-- 
Regards
Kuldeep


