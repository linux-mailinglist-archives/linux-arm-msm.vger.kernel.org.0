Return-Path: <linux-arm-msm+bounces-105635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEvRGokU+GmJpgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 05:37:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF65C4B832F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 05:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E95C730086F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 03:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B96214813;
	Mon,  4 May 2026 03:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCS8Y5Sm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dG04g+Ax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA30A3594A
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 03:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777865862; cv=none; b=Gw2qarpd+AbcwWLNBzHgeV3c7j+q2m/j4/kbKqW7QFQfdeycJtkfFuugOGXiwtuhuSVa1+P/gTFMEH1oPTnqOWUV2Lp+bzAkH9z0rDJJ0lgi+44oF/cIP28EP2qrBLYmEFuJ8l2qQLqFmcunTGZdmlxslGqFZ7m+myr09oPQqWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777865862; c=relaxed/simple;
	bh=65H9iGGksz147PfSdMd/HPgB2A0hmOqHXAmhvGjSwVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jb2HwTPS+YuXC+YBkLO3blYrrduWcUgD1dA0ZiHsWktAcSKRnFrzeI4ik792O23JdfUfdiWSa7StVKNPQ40LI/yeWl5iUGhmyG8DWJet8dq2IaH5ZCzMfDhrBjkg2FqAWHLa2ZJcuSO1gsN2oHrMbqV3v9E5Zyu0oUzWvX6Idjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCS8Y5Sm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dG04g+Ax; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6434eEaG3219122
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 03:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RiZ8ZehJHOgAnZPUtOhC/yoFNONpm3oh1RebvCBkpKY=; b=KCS8Y5SmYxUC30M1
	aqpNDzduiNY6aSVBKCaoi9O1IfwNdu1iznSJ+9MzyEQIADutO42fRiWjzmC8ynz0
	5yWm54y2bIi4btq4TH3+GYVqv6ioY7HYao6HgzXtpzg+ruBerC6msAELWz8Q6PaG
	qUVAGj318pxH1mF2qNxLa9A7/CK0WHzkHmgYMV5ssGwuWBf2OVUz6SbRdtlt8BzH
	9loQUB0xfAckuTOC6t4qwoWz0+BSPtfFGP0qu9jl6ztHnDR9Fc6dN4QbN0hjPOEh
	hPkGZKNl6IhjPWVNMjjSJjhfkZNrwpASaP6x959cWcWQLgRDBnvA7f0milTPXM9Q
	uFqviw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwa1em1xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 03:37:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-836cfd84728so213697b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 20:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777865859; x=1778470659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RiZ8ZehJHOgAnZPUtOhC/yoFNONpm3oh1RebvCBkpKY=;
        b=dG04g+AxDlrOCrPFA4dWaFgszj4pVc3yYfjJq78+2rNj1CrX1paVbnDJ2lhIZJqJu8
         oRcVGxvGUJpO9+tI5Air28PSeJ/ZrpAE3w88wQtBXaN1Zw7kMmpYWxafsda4JrbC7N47
         lftq/6joV/6Zo1ZbKEvV/ixDAn2n5v9YTHlSzfgTcaw9nQ3sqWQhXwCv0g2/eNlz9y43
         jKCUh547z1GsA2yYYlFBKEdA+t/n5MCqXAN29Cu6/M8+ekHW2nY8b1cMZj8hv0AXrXHu
         oSk/hEHriWMkBQBeC+P3bQUyR6SAi+p7japRlAaPibelFuwJN3r8oTq7fvePsIgdXWue
         vYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777865859; x=1778470659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RiZ8ZehJHOgAnZPUtOhC/yoFNONpm3oh1RebvCBkpKY=;
        b=nMK0gJYz9xrRnrm0B0nNQCnaxEoAZaCrDt8kLds8oyELWq8KB0cG7ACPWUfwJudcy1
         8xO7YwZSgvts5PNhp1PxUUz6vjZfpOwcNliU7zkbgy5WBoqi6/5bb20pKeVrmpW+j14B
         eSbQAAS44/5QGzyzY4z4VNmVYVxJwwHCspT7NMOHO6OZrzgjfBnSxoiWsbMFK/IbeFtr
         OL8sMGa6bVzVNAqo6cN9uEQkapHpeI85RH0bp8VCuRggnH0tERfp7KUM+o8+8JqcFzdO
         aQjXfsV2ctiiqM1zrUCTJc4TiRmTBCgTIE6HLEPHsqe2aNBFFouKvUXaPkAL6U0GGaNp
         9imA==
X-Forwarded-Encrypted: i=1; AFNElJ9OOEg4erNriYuA/1DDZq6Gh97PbeE7xXYr+bc8SwMazbfElB15zonqQfSpwEoJI9vvlhb8MpApNvclqI3x@vger.kernel.org
X-Gm-Message-State: AOJu0YzfP7t3vE7JnGOs2PPmSJlN+qEC/lIh6Pe1GDSkQlyKmyCktWn5
	UChuGP4nNtOHn1MywZN8naT8+Rf7ISEyL7Mynn6Uc4sED2Fsp73hlf9bwmHfCco1V04kK9m4h30
	o0Fhpb8t5c5HgdGdvm4+gDwql021YI9xYV573S6Y2jsYMSou6kKdnbm4ku+Jeb4rmMUq4
X-Gm-Gg: AeBDietoP4rGNmafjx5oPFTqjGZwLDfprzD37H/nxkPCK4rbOlTLHHQnVTjOb33OGkE
	Kb+fZxQnYAafkZ94zDI/+/1KAaYMeQP1BlPjq/A9TGioy2fMJ8ETBrTnrlHK0q/Dgr5Yao2bSDN
	gzSYNMuJC0T+LvAOltH3QhK/OH5jfpUCllAJLKoqo+6AYx6+y9+Xpa8BByTxER28FU+yCSFGaDj
	I26rCKqZzZqMUgrxcE6gBvEUjH0craXMCRiPkMC6Kqqu624tZo7iXo2JM+1ZoO4/Pn6i5YqPHYp
	6La7hELzWoH7lR0NjnzJqFqx1sPGFV4IX8zFiRDrU1Zn7lqAZrKWmiV4M+fbY5AOxx4JRVhpwWu
	FujZ1WOBsAs55Ro0+zjsXSX73PPd82Zt5Pj9+C3XChER4UIvCWIsPKIhzjALrqfnVIQ==
X-Received: by 2002:a05:6a00:bd84:b0:82f:39df:dd54 with SMTP id d2e1a72fcca58-834fff00167mr13681841b3a.8.1777865859264;
        Sun, 03 May 2026 20:37:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd84:b0:82f:39df:dd54 with SMTP id d2e1a72fcca58-834fff00167mr13681818b3a.8.1777865858697;
        Sun, 03 May 2026 20:37:38 -0700 (PDT)
Received: from [10.92.193.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158bcb99sm11045688b3a.25.2026.05.03.20.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 20:37:38 -0700 (PDT)
Message-ID: <dd4dc11e-338a-4d13-9830-095a93187f4c@oss.qualcomm.com>
Date: Mon, 4 May 2026 09:07:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PCI: qcom: Add D3cold support
To: Steev Klimaszewski <threeway@gmail.com>
Cc: bhelgaas@google.com, bjorn.andersson@oss.qualcomm.com,
        jingoohan1@gmail.com, jonathanh@nvidia.com, kwilczynski@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        lpieralisi@kernel.org, mani@kernel.org, robh@kernel.org,
        will@kernel.org
References: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
 <20260503203008.287559-1-threeway@gmail.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260503203008.287559-1-threeway@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oIZyYqGHlOzYGglK_e5BDXQAiJXgLYmy
X-Proofpoint-GUID: oIZyYqGHlOzYGglK_e5BDXQAiJXgLYmy
X-Authority-Analysis: v=2.4 cv=e7U2j6p/ c=1 sm=1 tr=0 ts=69f81484 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wWH99FW7VD-f-Ch3qS4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDAzNCBTYWx0ZWRfX8ThK5tIMb8Pt
 DmCZbkF4ajScFr7sgJfdAJk1+aV7MaCwXdB+aXnn0BOpZOTkSbQ6fhHvcjOEUzLKeVyZn1UGhVX
 mt4w1ZgxoZYcWBGMRHYMxM7KbL6x3ZUP+rUPJ/12M+MGsjn4mfEVNOn9W31bAw3fuAky/TvbUKW
 mkeD3/CTxf6wy/g2NACfgkmmNGchOeWRPGnRgoWaPVOCKcgt8LR7jidvACUV8zlF2jX9fEnLfzx
 +NpRNdRXDfpv/kKWWMsO0DUB8Hjl0M9PY5xcenbhn8S8K2xJRP50sXrQBk7YnxtW76CI2z7qy1R
 GtGMSvYELqh2JtKh6g/sXJLx0HIdC2l8+/DTDcXm/MXcnyhioP3FcjlWQLmWaUNMefjdUSg7xmt
 JkV67WYHTiN7i/TXR8TS+ihejYjnMYKSQ/RTmLcKU7UpXaRBS2p01iRsiRrPk03ndlvh/onRuML
 2hrwbYjJ09Fsj8u4U9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040034
X-Rspamd-Queue-Id: BF65C4B832F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,oss.qualcomm.com,gmail.com,nvidia.com,kernel.org,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-105635-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 5/4/2026 2:00 AM, Steev Klimaszewski wrote:
> Hi Krishna,
>
>> This series adds support for putting Qualcomm PCIe host bridges into D3cold
>> when downstream conditions allow it, and introduces a small common helper
>> to determine D3cold eligibility based on endpoint state.
>> On Qualcomm platforms, PCIe host controllers are currently kept powered
>> even when there are no active endpoints (i.e. all endpoints are already in
>> PCI_D3hot). This prevents the SoC from entering deeper low‑power states
>> such as CXPC.
>> While PCIe D3cold support exists in the PCI core, host controller drivers
>> lack a common mechanism to determine whether it is safe to power off the
>> host bridge without breaking active devices or wakeup functionality.
>> As a result, controllers either avoid entering D3cold or depend on rough,
>> driver‑specific workarounds.
>> This series addresses that gap.
>> 1. Introduces pci_host_common_can_enter_d3cold(), a helper that determines
>>    whether a host bridge may enter D3cold based on downstream PCIe endpoint
>>    state. The helper permits D3cold only when all *active* endpoints are
>>    already in PCI_D3hot, and any wakeup‑enabled endpoint supports PME
>>    from D3cold.
>> 2. Updates the Designware PCIe host driver to use this helper in the
>>    suspend_noirq() path, replacing the existing heuristic that blocked
>>    D3cold whenever L1 ASPM was enabled.
>> 3. Enables D3cold support for Qualcomm PCIe controllers by wiring them into
>>    the DesignWare common suspend/resume flow and explicitly powering down
>>    controller resources when all endpoints are in D3hot.
>> The immediate outcome of this series is that Qualcomm PCIe host bridges can
>> enter D3cold when all endpoints are in D3hot.
>> This is a necessary but not sufficient step toward unblocking CXPC. With
>> this series applied, CXPC can be achieved on systems with no attached NVMe
>> devices. Support for NVMe‑attached systems requires additional changes
>> in NVMe driver, which are being worked on separately.
>> Tested on:
>>   - Qualcomm Lemans EVK, Monaco & sc7280 platforms.
>> Validation steps:
>>   - Boot without NVMe attach:
>>       * PCIe host enters D3cold during suspend
>>       * SoC is able to reach CXPC provided other drivers also remove
>> 	their votes as part of suspend.
> I have been testing this patchset with Mani's patchset that is supposed to be
> related to NVMe on the Thinkpad X13s found at:
>
> https://lore.kernel.org/all/20260414-l1ss-fix-v1-0-adbb4555b5ab@oss.qualcomm.com/
>
> v4 of this patchset *boots* along with Mani's patchset, however, v5 does not,
> and unfortunately, the machine does not seem to get to a point where I can even
> get logs from it.  Do you know what I might be missing?  I have *not* attempted
> to remove the nvme drive and boot off USB to test it.
This series, will not have any impact on the boot, this series comes in to the
picture only in case
of suspend and resume. can you share your platform details and kernel you are
booting with.

- Krishna Chaitanya.
>
> -- steev


