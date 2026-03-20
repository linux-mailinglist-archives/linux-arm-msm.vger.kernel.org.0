Return-Path: <linux-arm-msm+bounces-98855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI8gE5WlvGlL1wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:40:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A70762D4D41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 582273135D0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 01:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CC831E825;
	Fri, 20 Mar 2026 01:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B63qgP/S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXqdoed+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74D82BEC55
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773970832; cv=none; b=eNRTwpQt1eax+qjP2xUmnMSLFeztA7Aj8QYAaQPSrJznNND1SyaU1mZYCuTd++wQ5MkBLhealxuJUHaSBhfkI6/0dpU/pmzoZf0ijF4TDQY8Y4/Sbsxj2urrq5VO+qFJf1yZAlIvH6md9zxsZbKjOVfFQSRUXgwOTRcimwGow8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773970832; c=relaxed/simple;
	bh=EmF4+PIkkPw29/w3CtTjt4RBSz9+WNqzJX1jd/3J/uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ptc/YlK12JeGvjsdGo53GsvUntkE0tX2Dz2ewiqFrB45bjUX6mH60xecGx1qviwLsuYge2pWFa93M2ZTv6FWr779b2pWBTfAq3Y1Jio59XyuHDFTT/LBCdOpYiC3ytRlGdR7HKVOwDIfYVy4ENgFtPXp4hzWwLKZhn2cFZsiAFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B63qgP/S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXqdoed+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JJdKlj2759400
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0v/eVwvU+bDCzPfj8Olb6vFjTl5BLngWw4b7/4Nn43c=; b=B63qgP/SVzIHrbK8
	1Xom4BQXVmqlzJ3AHRwR82GrEHfXVoTp+6kFoUIAnf+mED9yDdNHzfjNAkDtgAqV
	A2sY2gG6K1iaCSlAD0vYoA95Z7e8lyFXqCpJmJPeXxxK+IXeV+V2n88QUKGOeoil
	OHeO3DaoYYYufcRiwQnx1/u0bZ2kf4AAhFLsnGzWr3PZO/Qrt2QfM+38UMYmpxMU
	Ghg795xgeUcGzPgyC/Gj2AAnLRsulPrqpMrKCrOamsVI93XdKp7823+C9xG/3yWd
	mffKT3z68AlC4Zk55+jEsXwUK2CZof1qefyf+UPqfr71ACmpxpZgA4hQ9b7S+1iP
	v5WjTg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0qg78sq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:40:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a019abd6aso2248861a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773970826; x=1774575626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0v/eVwvU+bDCzPfj8Olb6vFjTl5BLngWw4b7/4Nn43c=;
        b=cXqdoed+m4m6axmnMSD9HuOE3hzHPXHqmbTlPEwp/Ump2mIhcxD2at/H1YZxJl1ExI
         ChNVozccKTqNEB3iRGTGXgryEIBuTUk8kf7EIc/fCrHsDvZIVGbEzIHgqmpfC829SFCb
         /UmwPhjUoLflaMbTE0/nsidJRXJCewtcpx+SZpstIj14sWAwsFFr0FHDjJJdIalyA3VF
         gM7njcCSaWfpEHwI6sa+F1c/9NRH7YuzlGauG27WojfIuYThqGZE+/Hw0litGo4SfCGA
         dPdKzC1ZglHzaDqNeB55mw2/2TTwqCbXzY7+WQ47zKXyOo7th9gTHz7ahVPryChVKzsN
         Ultg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773970826; x=1774575626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0v/eVwvU+bDCzPfj8Olb6vFjTl5BLngWw4b7/4Nn43c=;
        b=jpcQlOHJ4rzNpsvVxTOBPN1VSiW8/+5SXMRUxhqrn2rRET/Ayz+porBVzJF8LNqv66
         IEj7DxPp+KZhuU/QcI5Lfpxp8ZbzvvHJvIJPHMuNH1T9wquhra8S0LqEWHK6ixtupisM
         YPHyzS3PPHd2fUy6IAzfjBdRZ4kQE08TifDqeTkyHOJeftzrkvskDPdKSDvGMQGYKz0i
         3SBD4rc1BvaPfKVIivV+AgTA2mYkIP91n9qpOodLz0EFfVf4Udm27AXZpXkKwNnPzyqJ
         noBf4yXRlCSb8OHFjt8jjP1X3+dG4IISLkM1QmZqA9MKIg6NHpHCvdgszKoqyX9Lh+hB
         HSlA==
X-Forwarded-Encrypted: i=1; AJvYcCUk2j+MnlgnNzmgmYiJn/4gMyy+4cV/uJJ1tqXARITsxuyvRdt3MW/40euiL5uNBg4tWrgG72mPR6qXPAiw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl1PvP0QUHj1m06RIwmZyW8T84uh6qfa6QhqBCh6oPIRU97dvn
	PbtIcIqazYPMunNt7qut/fu8XEngSCf79TFphyBba2i8tWcK+Fknhs1urfPCRG/br/McTpoU/PK
	IL75A66FNFBbpOhI+jhSktPaA1vKrH6AtS+wel2NAAWi1tPmNzeb6188vhGKTTITcZpmKxzoBDe
	g9
X-Gm-Gg: ATEYQzzwksTtjqKxaQo2OckBCGDuYXBr0ymMyoCoIS0uZcUy10z3mefHt3UjyWCsjBK
	SrPR0+bBcFKu9KwnZ9mJ9guN87A/d0g8GwIXzESi8705fuZnsHQ5JKUw7gzvlk8NPVsHe9YXjlR
	vnL5tbqKr0BwlUi82roD7ll3H08e2RkqrTXp7G3AYDWBJO3Zt/7JYbeywqHtXg1XTrpD6NMwlgU
	F4LmSKUIvA6Hx3w7ttr70vuhB6PschErx1Rr6zATl6GS3mLXoqBUitI9BtLCwv6jC6ifOm1vg+i
	owAYj3GLVTXRxZP62ogQX5zlMzq5pACbL4mry61Ft7xI+cveEaVAW/VFgCpeiQqtiqvo4tq/XDu
	MVdPf7TFt2vDRatiedVEH9ymKquTTU22+DdW/zkgBwK8gHtIjePfg3pk=
X-Received: by 2002:a05:6a20:3ca8:b0:398:ab2c:a5bd with SMTP id adf61e73a8af0-39bcf249a8emr1097351637.21.1773970825989;
        Thu, 19 Mar 2026 18:40:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca8:b0:398:ab2c:a5bd with SMTP id adf61e73a8af0-39bcf249a8emr1097332637.21.1773970825514;
        Thu, 19 Mar 2026 18:40:25 -0700 (PDT)
Received: from [192.168.29.63] ([49.43.228.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409c681sm468106b3a.37.2026.03.19.18.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 18:40:25 -0700 (PDT)
Message-ID: <4649cbd8-7128-4c24-8d8d-c12bfd2a677c@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 07:10:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Advertise hotplug with no command completion
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260314-hotplug-v1-1-96ac87d93867@oss.qualcomm.com>
 <t66kmmr22z5anjhhez3mwfbmy64pz5246e4oepvpwf5j5l3u5o@i3gsh22x4dst>
 <015d00db-9ed5-45a7-83f8-1b10bc2ee457@oss.qualcomm.com>
 <e94f9da7-3daf-4393-9455-6707cb963e0c@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <e94f9da7-3daf-4393-9455-6707cb963e0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: b59fqkQN3yRm833MeFIrk_cgC5UZ_v6o
X-Proofpoint-GUID: b59fqkQN3yRm833MeFIrk_cgC5UZ_v6o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxMCBTYWx0ZWRfXyspmuvksP51J
 0wsWRG5vnH4HBeoCMZpbH+TVhjwwYH+2AaC48s7iiICOJRnQxT2qQFl8ShPA9BBrL7EARWR3+s2
 qyM6dqkp77BDEnFQIL7RzbnsK7mlNX3bg67b2OSFN35nHUnnBNKibcWIfNR5g6kJ8TySTOGIKzX
 0t1fvauelKs8lL1w8pgL57zaAIK0x/Z7OrkH+AOgskNuMyslaDOOAY6fwf0bg+ijsbCpjS5q+Nq
 4Nc8Vyu2OVIBqJOys4O6eY4htt+kUyihXNLnJlB5S26j9jNcvb0KG8ky1iO3Ax5E6XccJW1BSF0
 bgNHX5lfyC2aU5d8TvnoJphE2zLTyzg3thK8+qReu6+5bcQQXr8oAyuybCTXa4NExk188fjaz2z
 CBABANZNotgM4wjpXkV+IsXtdCauRAzsdWxU24siFnm/HSTc8ZDt4VYUAHMCcxqAzDp7jTpkG+5
 K4mJrJ0+admGaIKs0lw==
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69bca58a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=B7CTsV8aGTFndON/lcHZzA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=p95sTTYnDXT8MWe50-wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200010
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98855-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A70762D4D41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 4:29 PM, Konrad Dybcio wrote:
> On 3/16/26 1:22 PM, Krishna Chaitanya Chundru wrote:
>>
>> On 3/15/2026 3:39 PM, Manivannan Sadhasivam wrote:
>>> On Sat, Mar 14, 2026 at 07:26:34AM +0530, Krishna Chaitanya Chundru wrote:
>>>> QCOM PCIe controller advertise hotplug capability in hardware but do not
>>>> support hotplug command completion. As a result, the PCI core registers
>>>> the pciehp service and issues hotplug commands that never gets completions,
>>>> leading to repeated timeout warnings and multi-second delays during boot
>>>> and suspend/resume.
>>>>
>>>> Commit a54db86ddc153 ("PCI: qcom: Do not advertise hotplug capability for
>>>> IPs v2.7.0 and v1.9.0") avoided these timeouts by clearing the Hot-Plug
>>>> Capability bit entirely, which also disabled all hotplug functionality.
>>>>
>>> Just some background: I added commit a54db86ddc153 to disable hotplug for Qcom
>>> PCIe Root Ports since we were seeing completion timeouts for hotplug commands
>>> and also the PRSNT# signal was not exposed on any of our SoCs. After checking
>>> with some internal folks I learned that hotplug functionality was not exercised
>>> in Linux. So these facts made me believe that hotplug was not suppored at all.
>>>
>>> But it turned out that the Qcom Root Ports support "Data Link Layer State
>>> Changed Events" such as DL_Up/Down events.
>>>
>>>> Instead of disabling hotplug, mark these controllers as not supporting
>>>> command completion by setting the No Command Completed Support (NCCS) bit
>>>> in the Slot Capabilities register. This prevents the PCI hotplug driver
>>>> from waiting for commands completion while still allowing hotplug-related
>>>> functionality such as Data Link Layer state change events.
>>>>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>>>    drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>>>> index 67a16af69ddc75fca1b123e70715e692a91a9135..a2924610f3625f2456a491473c135840e31bafb9 100644
>>>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>>>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>>>> @@ -358,7 +358,7 @@ static void qcom_pcie_clear_hpc(struct dw_pcie *pci)
>>>>        dw_pcie_dbi_ro_wr_en(pci);
>>>>          val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
>>>> -    val &= ~PCI_EXP_SLTCAP_HPC;
>>>> +    val |= PCI_EXP_SLTCAP_NCCS;
>>> Are you sure that this is the only non-supported capability? What about
>>> Attention, Presence, Power Fault, MRL etc...?
>> Even though there no signals required for attention, presence etc in the hardware
>> there is a way to generate these MSI's with these bits set through parf, so technically
>> so other co-processor in the system can trigger interrupts.
> Are you saying that the RC itself will not generate them based on what
> happens on the bus, but they can be triggered artificially?
Yes there are parf registers through which msi's can be triggered 
artificially.

- Krishna Chaitanya.
>
> Konrad


