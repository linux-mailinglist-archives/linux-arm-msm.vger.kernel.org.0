Return-Path: <linux-arm-msm+bounces-118874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b6a7FCtCVWq1mAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:53:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D74274EE63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:53:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LyBk6hsU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Tnnivk2o;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118874-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118874-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E2A1312046A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 19:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633E9359A91;
	Mon, 13 Jul 2026 19:50:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16811352030
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:50:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783972227; cv=none; b=iFiilABd7uUZeqcl4To2uPumqpPO1SRVjvQ84LpJMxK1daKSyXPq/NT71+9hdbRrr8Iln4v9BQKglHfSfuaOq5bo0FRmJZRIpVervz3u0PLwC5DNTzQme6AgN8/qupcX+KhCYV+l8AWkEMHQwrQYEWfenspFlB6EQspaPHUhJPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783972227; c=relaxed/simple;
	bh=Za+5766RAtEJJPh6njpQsTKgzNJxRSFfxFO6pDVF9Ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=or2LU9OHhupxLbzCGKWJuGuBKX2tq4H+80ojnk0FwZsV0Ol0q/CW4cEywVdksuwglTIJPXqsvx+6bHKU6yjym0BYn3gF+mivXipXX2l5tVqCkC5XYYgaxJuWCyy3ZoP5wDRt0T0xGZ9mLXtGr3H9GPCzIMXcYWkODQx51j60DH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyBk6hsU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tnnivk2o; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ99wh2519257
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ucGZQxg2reJFI939JSAKmdJkAoKn8gx0mJoRPr4qic=; b=LyBk6hsU5QfSEQIl
	a7iKaaVJ5egLKv+CBOviDq4gAmwGWqnQFRWUdVXsrX8zU2EvXLEiI0U3NkuXTQB1
	5XJrafTzPcublpd/6SMcJd9MpBINSDU0ImV2FVCq0QRMZKUUFTm1Gdv3lR+1vD2e
	ibmSEsZG9iGnKsHvxw2JdzmMOIAAy0KolV3IbxmFe5PTM5no8OE1IxDcdkhMldRp
	Cem6cuxLQeiuu9BmOsMrOPW1XbChhmz/FX/W+FSWa8Q18kT2W41Mbih0RZM0er3s
	ICvrBCD6y0CsVOMNM4j7L4tqvce9Jc3bgALNRi7wCk3OY56Y3NEZg7FEHzCZW3fw
	aDwIXw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44crk3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:50:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88ab059052so295619a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783972225; x=1784577025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ucGZQxg2reJFI939JSAKmdJkAoKn8gx0mJoRPr4qic=;
        b=Tnnivk2o94jB5duXJg/VdtGOOxZU1S+8CpLvl2eSRKHgcxRfpYT1/KqADLHL0RaVs5
         dgkGd0a5pOcWikRmk5YQtGX5/AKxLiEknTjWw9AnoG8mcO4K+yTLzv9+WAXWZmzmAABn
         988EeuX0LfICOf3WizjyATOatGlMzHf2c0125eC/9H3epKzcrOxDmHriXwkvwwHc3kwd
         JpZstxRGjlm03QvdilbUtrINhKGp32lsijBSdJ13uBr3ElwntAKaRXmXWeX1PNiibZRZ
         4CS3oqiOASHCdXr7ENy24/Sa//JcRzJ/wCyZ5yBoitzoU1FFzHF9n4HzW3aHC6hf3OJ/
         6JYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783972225; x=1784577025;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ucGZQxg2reJFI939JSAKmdJkAoKn8gx0mJoRPr4qic=;
        b=oqNc+vk62O74BRoQJ+CxmEd2EH07syL5K3USFYrl9HL1USHFkhmd7fWo5AW55ITSIR
         rsl6bc4v0hN1rbx8lPYdzsv+KHRsuzH/AEuOjUCZ+qZDJtpdPq/VjCugqc3WlYsUI0R4
         b9B3cIVPOat+6L48hhe1lOiwcwXnJEIMBM+j56rHoHEMLfZ+KjsBZyBH+QZCcZPEt44X
         yEtEOYrAwGY3Tn0WSPqBbcBd+2ZCoUMqohCp/7vv4SSXZ87M9itCPuf+Hfv2qsNjPjLi
         HE/tcVkuo+p95cnMW69227EtGxHUTVCBPPrXL3wf5HjCUfZYcGhohWcKYkw8Z56nF8Pw
         Atkg==
X-Forwarded-Encrypted: i=1; AHgh+RrYYJbx2IfISOS9Zofl+Bc1UpwWFVc1hQl+tqfIhzDo/QLeji55koykqOaPavfTxpCr0NG/njMijmXGyqK+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyquxa90Buzq5rkmgUhGRoEsRl/VEtKSnbFC/DdxU0DwCes+rA9
	vAJUH4E8Fx9Gw7vwSR/emvSMHYCgqdtxSRRhjGcsyDKcDoonwdePHKbpCrO+WtnW1KyzuDuTcy+
	pcnuLS4gQensh23kkdIfHhfXNzgzCBZwfmM+AfxddB+FA/0vGLcL/pBUl/YUEZvEFHe0g
X-Gm-Gg: AfdE7clt94EfsVH1Na2MpiSDmKGc3qn7dlG+AL2jvyKN5rx4Zor7xBkduErDW8HofeV
	UyMInTdNBiBF+Ufvf0fNv6ciD0jbiZiGTb3UL6zLb5ASqGxvssQjr+718Joi1yru6R0YD72XAQ6
	NZs0je7UPdcuu1f4VE+fhF2y5WDAI9lT4SjPcODdCG6AvJ1TipyIVXe5XwgORnJdbtUvy6slJrV
	28smuCjhiF50tCunQ2qwhiDy9Qwm+Ha75QOeoycD9zKtyQ0SfvvChw/tAYXdNAHM2IVKDrqtKyD
	2VAEIReGm7wdcT9T8ZgrOQrXtiNLDLFhwd/jOJBosDi/xQ/ddjQO5VtW4zXf1o7h8+XjAb0nVf6
	qAMRlozQjRWjy2D3NSgE2Kip2Y7MuISYR5KQ=
X-Received: by 2002:a05:6a21:6e43:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3c0f08602bbmr16998106637.2.1783972224694;
        Mon, 13 Jul 2026 12:50:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e43:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3c0f08602bbmr16998079637.2.1783972224229;
        Mon, 13 Jul 2026 12:50:24 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm57081837c88.1.2026.07.13.12.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 12:50:23 -0700 (PDT)
Message-ID: <2d9d6724-a3ea-42ad-8cb3-ef08fd0882be@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:20:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-8-c9f1354dbd29@oss.qualcomm.com>
 <clfy5lvz7vm3ogw7pvyyidiujqcjxftx55p67szwgc6ivsq6r6@xrrcbfdkqkjo>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <clfy5lvz7vm3ogw7pvyyidiujqcjxftx55p67szwgc6ivsq6r6@xrrcbfdkqkjo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rxWmazuRgCr3UkOIwACEzkvaDGhxfJdS
X-Proofpoint-ORIG-GUID: rxWmazuRgCr3UkOIwACEzkvaDGhxfJdS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwNSBTYWx0ZWRfX0IV+QOmaNMt+
 MkYTKCIQyTqoUG+GfnfP0PTbNVv2dA1kXliYIJT9KisRlJL/OuiFPoezaV607x8oixcboXKytBA
 RlWV27YoqS50ASBbZjB86us3pm5b+MA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwNSBTYWx0ZWRfX8B2xGuGHwLBu
 w88+BfEW2lz467sQ+JCuuy8F1+8CVeWqziGPSFFgDniXJaaqEsrzK6ZdIdQWhd0E4exo9TsTxuC
 JWNwNOMa6Isi1rk3fkpY19qtuQFbpvIRn3RF/nXLottvs9qqtPQMNt60NZUrhcsgiTSSqSO5AXX
 JkvGhowRELjEAnz4iiZUVWBzigYhrTYYyfSvNzOVOE9cQzIJzCQ3QKoxGsYdgMhllTxj4UW8bAl
 5bpQV5C3QFQjPGOnBv6bZxNiR855w3QyhSF6YGi1nzoVBdVucIPUhO+MsvPiYjI+/fa14Cl3PWj
 K+SwEul3MsdpkkxLXDLOxbVIfKlT2kBw0Zy71gQxsx1o3zjyqB0N4NRGYr8fIMSXl6D/KswE/+o
 cEMnzSq4PzBbQnnm5YFC0gmudWenvEpxK8K0ypQtm2xiQV7FUnzZMyn93AbGU7QPaT3V2fCV6Zc
 aePBnNwnqa42SeONo4A==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a554181 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=yNfbWwvibup9Ri9izU+P7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JoE_KpbED9LNO2fW3XkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130205
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-118874-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D74274EE63

On 7/7/2026 3:53 AM, Dmitry Baryshkov wrote:
> On Sun, Jul 05, 2026 at 01:44:23PM +0530, Akhil P Oommen wrote:
>> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>>
>> Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
>> shader firmware path.
>>
>> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> index 1374afd9d14e..b280d8e845b1 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> @@ -417,6 +417,14 @@ vreg_l7k: ldo7 {
>>  	};
>>  };
>>  
>> +&gpu {
>> +	status = "okay";
>> +};
>> +
>> +&gpu_zap_shader {
>> +	firmware-name = "qcom/eliza/gen70e00_zap.mbn";
> 
> Should it be gen71700_zap.mbn?

Downstream uses gen70e00_zap.mbn as this fw is shared between Eliza and
another GPU. But, for upstream we can rename it. In linux-firmware, I
will keep gen71700_zap.mbn as a symlink to gen70e00_zap.mbn.

-Akhil.

> 
>> +};
>> +
>>  &mdss {
>>  	status = "okay";
>>  };
>>
>> -- 
>> 2.54.0
>>
> 


