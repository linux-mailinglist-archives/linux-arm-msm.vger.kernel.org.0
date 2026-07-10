Return-Path: <linux-arm-msm+bounces-118266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IWL+E3XhUGps7AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:11:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D81AB73A931
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:11:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JZw8oN3J;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z3v2Nyqa;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118266-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118266-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DC2A3130404
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C41426D2E;
	Fri, 10 Jul 2026 11:58:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54B64279E3
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:58:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684734; cv=none; b=EQalukQ/HN5slnVjgqBMrjbOLupB1Yr5q4Qqt3ho4WOG1Nw2b2pfOrg3mjF/DYfozg/6fdVcsYE7s2PpFMWDWBu+9HvOUxBxV6yaP3UCiDu4BpfUg6YaUDgyCK2TXn82yQ8MCSi7OMYIWho4uWJTObrjVnZPbV7T/RYrZjSOzoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684734; c=relaxed/simple;
	bh=dhcU7WWKBrIptr2rO7avt84lEHu/1rHnhWGmRsyMsR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O1VVmi/0J2ZXBEmHWwXW6pZgdGjZ98UoI4krt8A/ezRCyGT8DT1aX4uLue6nVCdhoBTY0O3pR9Ad/3qYVAuH37M5yKsejwaYwnGay+bIbt+3p4zqsW2MM35K3PePRgjDFjs0KUtS+Hy4+IHukcDQxsayvrsqLBg0w4MVu0LuO1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZw8oN3J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3v2Nyqa; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAnFih616904
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhZGVhj2JUX5N9gykpa7/WpW7Rt12wQPaI5D4gJufLw=; b=JZw8oN3JhixbrBS0
	1v5RyfyxxtwfVFl4ROpDK9tkNggNao3e5OScqsx0HXo6IT7cE6+rFd717wfUK76F
	qdg2ywgtId4o7JqxLzgjksXIFE9V873l2ccFxxk6heFkigzg2xOC0h/NbJP3jiET
	eGwpiiyGDStfIXltrT1oVP4zLO6lqLRI4CVc5u5btbZ1HbcdPUHIzatjV7rJIs5G
	MhnSmrrjpvyOJ1PFFfKzoHaBMZfIs0m/StR3Q8GIl3HPt1e0h5c0NRo6Jkifd/3t
	m6S0IiIyuhHmTWA3Uzvugjeqcj8UsquNqtLENLKBVnD7PjIYoFEG92vV6BHc+b9o
	QZOrCw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n1q5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:58:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so1261351a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 04:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783684727; x=1784289527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhZGVhj2JUX5N9gykpa7/WpW7Rt12wQPaI5D4gJufLw=;
        b=Z3v2Nyqaq4E89CPGw8U8w/JVD1P0ZiR1TX2NbuLhwtEuJ2O/IaoCgQtWCH72U+1PYI
         EOvD8fQoizmsyp5Nm+YT+vhpGjQG7AkGWFKfzFbaW/1MPdqXRoyYXZbDya5cY2HPlywH
         3rfprTrNtbSel5BDgkV5TLOZoQKtFlbr4Q2Q4SaLSkMoxGG0QZz+y+HnTffTCd0gkGOE
         oc7X0KArKIi4HfxzomzFMpwpWyNdskMtmuXZeRCbZZYpnMTvhYkT9zdIFQ47UNAWrMHt
         wJlLHWBc7+TIxCml16sndhyV/GqmRhX+L3N6sV+eqojH1ZfOHo0OP6d44fj2nxb50o+/
         Q/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783684727; x=1784289527;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QhZGVhj2JUX5N9gykpa7/WpW7Rt12wQPaI5D4gJufLw=;
        b=KoQMJxN0KkdsCKTcymQQuEP+Xbb82fu+QPuvMx8IvK81EUBAnVQ1b2CEsIWg3q1DXb
         2mQu83BOC2zrjWkE+5qkrC3Dh/eCK2yjxDqhJPW4FdbM3QHgHNxe8tqjIrq/HVNut2Di
         1JsT3Ddr1t9od3UXLzXnz5ekgwFaWHRWIsBoT3XfP7ZQK3nmnU8E2j6wZ+DTm4mb3Yra
         yCjXugLgjo/NGYQrug03HktemVQtbFxK0/HRK1eic+Dr8J3KM7S3G1J9m+myeLlWKrjL
         +RlA4FjYRh65KproqGUvQ63DTR1iN1H+YvPYExEixD+A6CRPvkpmVz2PA2Z8wvVAglyd
         3/aQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqrq0BRkomC+7q7F35kORm93GiCY1WqAtq6X3Da1ePTjekzp57Kxra1DyeXtPeFyjo/S1+6MLF9ONckK4A0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzezc2N1wmDYAsGyMF4WkUxhn5rSqrW4FfdLnMgJBFY2E+2a7zu
	MaGP6IxxexrHZe+yyFSUBioGLWGTgPFsA/0jL/Wb4z3ZzH5HgvD1FoMyelLRKC9x54/eB5QZ4g6
	9gglDvui7couIeXtuchtdH8zvi0O4p1Ibora06/VkFAESrdCHLrk/p7TMP+z6GOPB7HiC
X-Gm-Gg: AfdE7cl8MTfgmtsseLZz+BEWUcKx/O89tycWpZR7lAaki/0fzS0EYF//rL3VUWxYlvt
	53+9zX29+rJq/cGJBk+aanDoAqqNCewkC2ObQydk6ZBmvdqM/ZtuOn1hONC2fOGHeym61ajBNk1
	qOkHuJPVxqXbrqCEybh2sT3t84LBwFMOhx04vT+mvZCYp/Fgu1UJ/N4uO1Px1/43hY3JmCcDhRW
	wjU5w1kPoZspPh7V5W8REt9RgRge1OnsrfIS58esjaxMkq3VFVQebJScjseIzXXAPaWzCN5dsJY
	FrjGoQX2BWn6trLP5NPyuUk3pocQOdnBCrBbhvKDlbfYi5egrIgyghGi4LIQR0edA3yIpsME9v8
	FAHQM3x04dikLs+fqJNmFXZhEsgCdRdrRgfbX4p7l
X-Received: by 2002:a05:6a20:158e:b0:3bf:ee42:195 with SMTP id adf61e73a8af0-3c0bc90146amr13428418637.11.1783684726950;
        Fri, 10 Jul 2026 04:58:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:158e:b0:3bf:ee42:195 with SMTP id adf61e73a8af0-3c0bc90146amr13428371637.11.1783684726291;
        Fri, 10 Jul 2026 04:58:46 -0700 (PDT)
Received: from [10.92.178.80] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm38927780c88.0.2026.07.10.04.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:58:45 -0700 (PDT)
Message-ID: <53bac441-a886-4007-9b25-ed8859fbc979@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 17:28:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
        bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com
References: <20260615091242.1617492-1-palash.kambar@oss.qualcomm.com>
 <20260615091242.1617492-3-palash.kambar@oss.qualcomm.com>
 <tyvt6by2k7wxzds5n67fxpwiw5rwmtwjyluyyntjba7fjo3ri4@no5ay6hxntod>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <tyvt6by2k7wxzds5n67fxpwiw5rwmtwjyluyyntjba7fjo3ri4@no5ay6hxntod>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDExOSBTYWx0ZWRfXyPi0Sjm9hUdr
 4UXSCR+8DnhgB7x3R3Os7Y8rsh9V8AGSS6QE8rJdkSALImgcmt8cf1l0Wjfw9k8q+3auuJLmSAM
 EoyXNwsICUUIEQCYoRAa22uEB41CH8Y=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50de78 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7JFUvE9QZZRMEIWW0wYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: efZZtHpJwaVU_sxO7K3xCkCrsJIUlJlh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDExOSBTYWx0ZWRfX5fWDurexKKDo
 ct/EE4PaMVVfbLnsnVvCvA0ZKhrRo1yqe/ZIVLV28gZrYate1d6Lo6noP99ugn1Ru3N5ySND1AB
 /dnhFLv0xk0H/LR8v85Nmo7JJXay/Xdp+xJO0UHBdWgDq2r6v+gZwHVT395M+sXpl4Cnkmtb5mu
 K0IjaBE/msMEXkSSZqSABbO5txU2uKvsF5BM1O/oo/jwC5cQOGxfskPTP9xNeoUUC1k8X3MLX5k
 GKV2g19d2lubqY7b9Khwo/tRhvKpBKUJzagRKo4OfMpLrYSqHP769QpAks/2nJKKOvS2tjwH3Kb
 RebmhkIIGNcdhJbao0zhJdR85nD7//6XtMc+AyOOHEWt915ssA4NS5JS9RDo5wz3Lb3fokdQja+
 bfGYWwBjoa4IAkLBn/rEVDZMgIod12qBeA3dcVE7floMsthpXpERDbYdb33dmM9WGTWtwOULe2E
 3Z3ME8Zbjk9HiiKRekw==
X-Proofpoint-GUID: efZZtHpJwaVU_sxO7K3xCkCrsJIUlJlh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118266-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:alim.akhtar@samsung.com,m:bvanassche@acm.org,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D81AB73A931



On 6/17/2026 11:30 AM, Manivannan Sadhasivam wrote:
> On Mon, Jun 15, 2026 at 02:42:42PM +0530, palash.kambar@oss.qualcomm.com wrote:
>> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
>>
>> Add the init sequence tables and config for the UFS QMP phy found in
>> the Hawi SoC.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> 
> - Mani
> 
>> ---
>>  .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
>>  .../qualcomm/phy-qcom-qmp-qserdes-com-v8.h    |  13 +-
>>  .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
>>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 139 ++++++++++++++++++
>>  4 files changed, 212 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
>> new file mode 100644
>> index 000000000000..e80d3dd6a190
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2026, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef QCOM_PHY_QMP_PCS_UFS_V7_H_
>> +#define QCOM_PHY_QMP_PCS_UFS_V7_H_
>> +
>> +/* Only for QMP V7 PHY - UFS PCS registers */
>> +#define QPHY_V7_PCS_UFS_PHY_START			0x000
>> +#define QPHY_V7_PCS_UFS_POWER_DOWN_CONTROL		0x004
>> +#define QPHY_V7_PCS_UFS_SW_RESET			0x008
>> +#define QPHY_V7_PCS_UFS_PCS_CTRL1			0x01C
>> +#define QPHY_V7_PCS_UFS_PLL_CNTL			0x028
>> +#define QPHY_V7_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x02C
>> +#define QPHY_V7_PCS_UFS_TX_HSGEAR_CAPABILITY		0x060
>> +#define QPHY_V7_PCS_UFS_RX_HSGEAR_CAPABILITY		0x094
>> +#define QPHY_V7_PCS_UFS_LINECFG_DISABLE			0x140
>> +#define QPHY_V7_PCS_UFS_RX_SIGDET_CTRL2			0x150
>> +#define QPHY_V7_PCS_UFS_READY_STATUS			0x16c
>> +#define QPHY_V7_PCS_UFS_TX_MID_TERM_CTRL1		0x1b8
>> +#define QPHY_V7_PCS_UFS_MULTI_LANE_CTRL1		0x1c0
>> +
>> +#endif
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
>> index d8ac4c4a2c31..d416113bcb3c 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
>> @@ -1,6 +1,6 @@
>>  /* SPDX-License-Identifier: GPL-2.0 */
>>  /*
>> - * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2026, The Linux Foundation. All rights reserved.
>>   */
>>  
>>  #ifndef QCOM_PHY_QMP_QSERDES_COM_V8_H_
>> @@ -71,5 +71,16 @@
>>  #define QSERDES_V8_COM_ADDITIONAL_MISC			0x1b4
>>  #define QSERDES_V8_COM_CMN_STATUS			0x2c8
>>  #define QSERDES_V8_COM_C_READY_STATUS			0x2f0
>> +#define QSERDES_V8_COM_PLL_IVCO_MODE1				0xf8
>> +#define QSERDES_V8_COM_CMN_IETRIM				0xfc
>> +#define QSERDES_V8_COM_CMN_IPTRIM				0x100
>> +#define QSERDES_V8_COM_VCO_TUNE_CTRL				0x13c
>> +#define QSERDES_V8_COM_ADAPTIVE_ANALOG_CONFIG			0x268
>> +#define QSERDES_V8_COM_CP_CTRL_ADAPTIVE_MODE0			0x26c
>> +#define QSERDES_V8_COM_PLL_RCCTRL_ADAPTIVE_MODE0		0x270
>> +#define QSERDES_V8_COM_PLL_CCTRL_ADAPTIVE_MODE0			0x274
>> +#define QSERDES_V8_COM_CP_CTRL_ADAPTIVE_MODE1			0x278
>> +#define QSERDES_V8_COM_PLL_RCCTRL_ADAPTIVE_MODE1		0x27c
>> +#define QSERDES_V8_COM_PLL_CCTRL_ADAPTIVE_MODE1			0x280
>>  
>>  #endif
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
>> new file mode 100644
>> index 000000000000..5f923c3e64ec
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2026, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef QCOM_PHY_QMP_QSERDES_TXRX_UFS_V8_H_
>> +#define QCOM_PHY_QMP_QSERDES_TXRX_UFS_V8_H_
>> +
>> +#define QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_TX		(0x34)
>> +#define QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_RX		(0x38)
>> +#define QSERDES_UFS_V8_TX_LANE_MODE_1				(0x80)
>> +#define QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE2			(0x1BC)
>> +#define QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE4			(0x1C4)
>> +#define QSERDES_UFS_V8_RX_UCDR_SO_GAIN_RATE4			(0x1DC)
>> +#define QSERDES_UFS_V8_RX_EQ_OFFSET_ADAPTOR_CNTRL1		(0x2C8)
>> +#define QSERDES_UFS_V8_RX_UCDR_PI_CONTROLS			(0x1E4)
>> +#define QSERDES_UFS_V8_RX_OFFSET_ADAPTOR_CNTRL3			(0x2D0)
>> +#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4	(0x120)
>> +#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_FO_GAIN_RATE4		(0xD4)
>> +#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_SO_GAIN_RATE4		(0xEC)
>> +#define QSERDES_UFS_V8_RX_VGA_CAL_MAN_VAL			(0x288)
>> +#define QSERDES_UFS_V8_RX_EQU_ADAPTOR_CNTRL4			(0x2B0)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE_0_1_B4			(0x324)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SA_B7			(0x3B4)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SA_B9			(0x3BC)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SB_B7			(0x3E0)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SB_B9			(0x3E8)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SA_B7			(0x40C)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SA_B9			(0x414)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SB_B7			(0x438)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SB_B9			(0x440)
>> +#define QSERDES_UFS_V8_RX_UCDR_SO_SATURATION			(0xF4)
>> +#define QSERDES_UFS_V8_RX_TERM_BW_CTRL0				(0x1AC)
>> +#define QSERDES_UFS_V8_RX_DLL0_FTUNE_CTRL			(0x498)
>> +#define QSERDES_UFS_V8_RX_SIGDET_CAL_TRIM			(0x4d0)
>> +
>> +#endif
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> index 0f4ad24aa405..d4aca22c181e 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> @@ -29,9 +29,11 @@
>>  #include "phy-qcom-qmp-pcs-ufs-v4.h"
>>  #include "phy-qcom-qmp-pcs-ufs-v5.h"
>>  #include "phy-qcom-qmp-pcs-ufs-v6.h"
>> +#include "phy-qcom-qmp-pcs-ufs-v7.h"
>>  
>>  #include "phy-qcom-qmp-qserdes-txrx-ufs-v6.h"
>>  #include "phy-qcom-qmp-qserdes-txrx-ufs-v7.h"
>> +#include "phy-qcom-qmp-qserdes-txrx-ufs-v8.h"
>>  
>>  /* QPHY_PCS_READY_STATUS bit */
>>  #define PCS_READY				BIT(0)
>> @@ -84,6 +86,13 @@ static const unsigned int ufsphy_v6_regs_layout[QPHY_LAYOUT_SIZE] = {
>>  	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_UFS_POWER_DOWN_CONTROL,
>>  };
>>  
>> +static const unsigned int ufsphy_v7_regs_layout[QPHY_LAYOUT_SIZE] = {
>> +	[QPHY_START_CTRL]		= QPHY_V7_PCS_UFS_PHY_START,
>> +	[QPHY_PCS_READY_STATUS]		= QPHY_V7_PCS_UFS_READY_STATUS,
>> +	[QPHY_SW_RESET]			= QPHY_V7_PCS_UFS_SW_RESET,
>> +	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V7_PCS_UFS_POWER_DOWN_CONTROL,
>> +};
>> +
>>  static const struct qmp_phy_init_tbl milos_ufsphy_serdes[] = {
>>  	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0xd9),
>>  	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
>> @@ -1307,6 +1316,11 @@ static const struct regulator_bulk_data sm8750_ufsphy_vreg_l[] = {
>>  	{ .supply = "vdda-pll", .init_load_uA = 18300 },
>>  };
>>  
>> +static const struct regulator_bulk_data hawi_ufsphy_vreg_l[] = {
>> +	{ .supply = "vdda-phy", .init_load_uA = 324000 },
>> +	{ .supply = "vdda-pll", .init_load_uA = 27000 },
>> +};
>> +
>>  static const struct qmp_ufs_offsets qmp_ufs_offsets = {
>>  	.serdes		= 0,
>>  	.pcs		= 0xc00,
>> @@ -1325,6 +1339,15 @@ static const struct qmp_ufs_offsets qmp_ufs_offsets_v6 = {
>>  	.rx2		= 0x1a00,
>>  };
>>  
>> +static const struct qmp_ufs_offsets qmp_ufs_offsets_v7 = {
>> +	.serdes		= 0,
>> +	.pcs		= 0x0400,
>> +	.tx		= 0x2000,
>> +	.rx		= 0x2000,
>> +	.tx2		= 0x3000,
>> +	.rx2		= 0x3000,
>> +};
>> +
>>  static const struct qmp_phy_cfg milos_ufsphy_cfg = {
>>  	.lanes			= 2,
>>  
>> @@ -1845,6 +1868,119 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {
>>  
>>  };
>>  
>> +static const struct qmp_phy_init_tbl hawi_ufsphy_serdes[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SYSCLK_EN_SEL, 0xd9),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_CONFIG_1, 0x16),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_HSCLK_SEL_1, 0x11),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP_EN, 0x01),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP_CFG, 0x60),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_IVCO, 0x1f),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_IVCO_MODE1, 0x1f),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_IETRIM, 0x07),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_IPTRIM, 0x20),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_TUNE_MAP, 0x04),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_TUNE_CTRL, 0x40),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_ADAPTIVE_ANALOG_CONFIG, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DEC_START_MODE0, 0x41),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_MODE0, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCTRL_MODE0, 0x18),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_MODE0, 0x14),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_ADAPTIVE_MODE0, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCCTRL_ADAPTIVE_MODE0, 0x18),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_ADAPTIVE_MODE0, 0x14),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP1_MODE0, 0x7f),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP2_MODE0, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x92),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DEC_START_MODE1, 0x4c),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_MODE1, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCTRL_MODE1, 0x18),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_MODE1, 0x14),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_ADAPTIVE_MODE1, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCCTRL_ADAPTIVE_MODE1, 0x18),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_ADAPTIVE_MODE1, 0x14),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP1_MODE1, 0x99),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP2_MODE1, 0x07),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xbe),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
>> +};
>> +
>> +static const struct qmp_phy_init_tbl hawi_ufsphy_tx[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_LANE_MODE_1, 0x0c),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_TX, 0x07),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_RX, 0x17),
>> +};
>> +
>> +static const struct qmp_phy_init_tbl hawi_ufsphy_rx[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE2, 0x0c),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE4, 0x0c),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_SO_GAIN_RATE4, 0x04),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x14),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_PI_CONTROLS, 0x07),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_OFFSET_ADAPTOR_CNTRL3, 0x0e),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4, 0x02),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FASTLOCK_FO_GAIN_RATE4, 0x1c),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FASTLOCK_SO_GAIN_RATE4, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_VGA_CAL_MAN_VAL, 0x8e),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_EQU_ADAPTOR_CNTRL4, 0x0f),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE_0_1_B4, 0xb8),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SA_B7, 0x66),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SA_B9, 0x1f),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SB_B7, 0x66),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SB_B9, 0x1f),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SA_B7, 0x66),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SA_B9, 0x1f),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SB_B7, 0x66),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SB_B9, 0x1f),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_SO_SATURATION, 0x1f),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_TERM_BW_CTRL0, 0xfa),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_DLL0_FTUNE_CTRL, 0x30),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_SIGDET_CAL_TRIM, 0x77),
>> +};
>> +
>> +static const struct qmp_phy_init_tbl hawi_ufsphy_pcs[] = {
>> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
>> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_PCS_CTRL1, 0x42),
>> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0f),
>> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_RX_SIGDET_CTRL2, 0x68),
>> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
>> +};
>> +
>> +static const struct qmp_phy_init_tbl hawi_ufsphy_g5_pcs[] = {
>> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_PLL_CNTL, 0x3b),
>> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x05),
>> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x05),
>> +};
>> +
>> +static const struct qmp_phy_cfg hawi_ufsphy_cfg = {
>> +	.lanes			= 2,
>> +
>> +	.offsets		= &qmp_ufs_offsets_v7,
>> +	.max_supported_gear	= UFS_HS_G5,
>> +
>> +	.tbls = {
>> +		.serdes		= hawi_ufsphy_serdes,
>> +		.serdes_num	= ARRAY_SIZE(hawi_ufsphy_serdes),
>> +		.tx		= hawi_ufsphy_tx,
>> +		.tx_num		= ARRAY_SIZE(hawi_ufsphy_tx),
>> +		.rx		= hawi_ufsphy_rx,
>> +		.rx_num		= ARRAY_SIZE(hawi_ufsphy_rx),
>> +		.pcs		= hawi_ufsphy_pcs,
>> +		.pcs_num	= ARRAY_SIZE(hawi_ufsphy_pcs),
>> +	},
>> +
>> +	.tbls_hs_overlay[0] = {
>> +		.pcs		= hawi_ufsphy_g5_pcs,
>> +		.pcs_num	= ARRAY_SIZE(hawi_ufsphy_g5_pcs),
>> +		.max_gear	= UFS_HS_G5,
>> +	},
>> +
>> +	.vreg_list		= hawi_ufsphy_vreg_l,
>> +	.num_vregs		= ARRAY_SIZE(hawi_ufsphy_vreg_l),
>> +	.regs			= ufsphy_v7_regs_layout,
>> +};
>> +
>>  static void qmp_ufs_serdes_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls *tbls)
>>  {
>>  	void __iomem *serdes = qmp->serdes;
>> @@ -2259,6 +2395,9 @@ static int qmp_ufs_probe(struct platform_device *pdev)
>>  
>>  static const struct of_device_id qmp_ufs_of_match_table[] = {
>>  	{
>> +		.compatible = "qcom,hawi-qmp-ufs-phy",
>> +		.data = &hawi_ufsphy_cfg,
>> +	}, {
>>  		.compatible = "qcom,milos-qmp-ufs-phy",
>>  		.data = &milos_ufsphy_cfg,
>>  	}, {
>> -- 
>> 2.34.1
>>
> 

Hi Vinod,

Gentle reminder to integrate this patch.
Thanks.



