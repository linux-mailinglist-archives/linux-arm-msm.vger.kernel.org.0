Return-Path: <linux-arm-msm+bounces-97190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB8/IdSmsmnwOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:43:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B453271302
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F7B730055C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14033B7769;
	Thu, 12 Mar 2026 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTWDR23r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fx86aiTe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1E35A3A5
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315722; cv=none; b=lFwVRV9Lv4D3ji35mhnjONNu1lEYhBVviVGjnbAiWFTMRCKmSCP3nPWh0QPP2L4z2Yhi4T7n5KM6VME/wmvji2/q21lVk3dLnS2Ekon7DQc29/n3PCn/+/EhRIv/9+Pim18LDEWMFH3pTAhdtP026giCiqRwx5p3BwWPPUb96As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315722; c=relaxed/simple;
	bh=nwaZTsNWKtiAy3M+myiu//8Q2UY2tqa7VUs/W+GtYLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PS0zvX7twAWPI0PxLhzQSgAOFY9L98n0+7+zCEppBI+8SxOO7sf0QDRlRgjtHGhr/Y+tmufl10eiBw54IqI+TsxBSoJavBaaI8CaAibFCecat4qC3BEqL6hlUTVFDsIXkCXakSTPvw/+JWTaSDaTl6Mm6K94naixItA4/r8LK5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTWDR23r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fx86aiTe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAGC9n4027169
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O6HJTG517rx7BZNC+Lqbxk38jHNOTKDXfitY+fGl2Qg=; b=cTWDR23rSNC6RXYv
	NYm5xAfJP6JIuBegbdJxesqHYjbPVMpbyoaplrYspybiURpA1Trs2IBBicGX/68c
	/5p+bLJWsmwM5nkoINvohPNjkwnCV2Td1WLJKuiQev/oeNlwdMwm/GB45fgFyHxJ
	HBiAKD73NnOBoytDQFweyjSwkRPfJWCUyj7pEosaMeJDL4V+7DNFEgrEfn/EASZJ
	6+Gx97SZIgZENJcFW2XKZ7T0QIf+zW3nzwfP8DgMViWz3ZckUTqhX36WvwMOPypt
	LWOJsODEoFAaVja57lITwPwa+tEi6nJkKgY1F91wyXAO/nJARSgaUFBOp4o2h3W9
	cdmcuA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54swpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:42:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae3badc00dso11361365ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 04:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773315719; x=1773920519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O6HJTG517rx7BZNC+Lqbxk38jHNOTKDXfitY+fGl2Qg=;
        b=Fx86aiTe64fRotfK0UAte1EtRJa3yl9Z9nzvbK7XSSizBgKjaGplbOuyq5E+ATJ6VR
         iEkDtpbq/BHVTG0wK7kFHMj6ZHHF0npK/qBTnbgR2iDQY59EigV5QILAvxzPXgAXcfYV
         MGVAYPRvi9Ikmbsk/rTJOpexeEYsn4XY1lqv+hubYF8Og0VDzwSG7bwHHwKKDvkqm/wW
         SImibFbdglZVKvSFnnTJ4803LQCpcB/svPPbK/m+J4p/7NahI1cDuqT/+/7yEtw4oQUm
         vpp4RArMXgzHvVE2njwTjcMf+1G3yjWa+Q29cbl1hjBOPJ/ecFJJTn1oirek7WkfHMbj
         Chxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315719; x=1773920519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6HJTG517rx7BZNC+Lqbxk38jHNOTKDXfitY+fGl2Qg=;
        b=H9Yt6FntfQXtcPoaXFB9R4o55maU/IsEOf66A+QlQ7aJ+gNun63OY3747EpYjGbo2I
         y01sbD2FxFjzx7HF2ulGiqBvit3QyJNmepaW145LKiJHX8aJNvBEFmPuP+21RU74TcRk
         DOlozC4c7vsfR+BMvyx3Xr6/wX5duA/IwQkGSx25RBQKG+4UxMZhWvn2/qKqJ715Qrop
         0E83iCiFGctmP73JRXtZ6/k4inzfAMRvs1Uw72qWKTn6uOEqTF8+TxuJ7EocDiV1MdSd
         8C0fymgFyY4si1q89P9/peMdGYRzcSQOOmOf97R4m166mbB/nhfa6bdmdBUSMEuMWVzB
         gTlg==
X-Forwarded-Encrypted: i=1; AJvYcCXpJ1RQ9gFJRIE9uz37rC8Vun0uQFN5hJVyhQrRqoPPgj/g/thJ+AOWsRSggMFNgJTd7Pq+3zH2LO3y2JpM@vger.kernel.org
X-Gm-Message-State: AOJu0YxhNUkwmcw6dNh0KilgXsgODsrxGscheZDudCUcuiJ8Qs8f2yyQ
	4CkoL8LcbZt6b+Qjqswh0hbLPAxf9qyNiMybMscrZHkVc7nkVXKGpqX519veUw0g6yaqD9MKdF5
	riL/UMybxi2ZxZB606Us072YVX7AJCWd2UhPtlVKEN18zHlKOuG6J/wmY5829J62vrrbg
X-Gm-Gg: ATEYQzyipFkNnFNQH45yUGLRUSXP1+v0l3wtmsU8sJGVMF/LOlgZfmSmUzTDhAc6HJy
	oBA9zXli4/66iOzav8wFk7WObv+lHUny6S4TBLsRB/QooqvATZJoe7NpDUNNZR3gZ8aMM7sGniP
	bXXpBLNWxTjRHE10D++l+HV0NN1R2EhpHDrqI6ny8S0zKqGqlBuIdMscJD2CGRvSJgmHmgak8ey
	DZ1j5aMcI0552c+yHSMBlgvR506uOhPy+VbSIGzcwUl5NZpXuKq9Ar+ya0QGCf95phu1MzNMBmt
	7R7tdnByyy2D2zv4lYN1gaqRZo9cfK5LWoZgETvHdgZKqcgmxr/GMEONc1rPITZfkTadodfsZE6
	jQhbHn9Kh5TBrtpAsi/AOTYSpZbKVS6U3RLJhXSV4cNa71IKE7ZED90M3iQ==
X-Received: by 2002:a17:902:e807:b0:2ae:478f:2ec with SMTP id d9443c01a7336-2aeae89119emr62683435ad.29.1773315719568;
        Thu, 12 Mar 2026 04:41:59 -0700 (PDT)
X-Received: by 2002:a17:902:e807:b0:2ae:478f:2ec with SMTP id d9443c01a7336-2aeae89119emr62683115ad.29.1773315719067;
        Thu, 12 Mar 2026 04:41:59 -0700 (PDT)
Received: from [192.168.1.10] ([38.254.186.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae22217dsm53886225ad.4.2026.03.12.04.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 04:41:58 -0700 (PDT)
Message-ID: <57537059-4989-4704-ae6a-72576d031216@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:10:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] of: Add convenience wrappers for of_map_id()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-1-c62fcaa5a1d8@oss.qualcomm.com>
 <3plcdobbd6teiluzijzk33yepbpsur24tnmjr32sco7a4loptm@xmzmsaurvmvj>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <3plcdobbd6teiluzijzk33yepbpsur24tnmjr32sco7a4loptm@xmzmsaurvmvj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RmBq8UOYpmmqKOTxPvGJX6FxFP3BNqq3
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b2a688 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=FuYIH7Xx0xzBSkYrynBYgw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=6wy38kV5EeFARYyu09AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: RmBq8UOYpmmqKOTxPvGJX6FxFP3BNqq3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5MiBTYWx0ZWRfXyifWARTiVDEN
 W0K0hMfrw/VuZrvRBW82ORIeItw0QECIQ/ALR5qlAI7BnBEYxFZzlqPCq4unQgJkZbtjOPji9Wl
 vkyTogARnA+e6MA9iOgYe70yPVlAAglVSGOgvg9ubTIqM9jlDBYSinD0+XoCNCpYZmHreQXFwYo
 IFvh4ZyN0013G3lMjLhxWeRPErQ7mV6OOpypU4nnLRGCSd3isSgWmeircDPiQq78EYRxGBVhpUF
 RuE3EVwxseGO/LHHT2Dyoj88dqz0tQW5rIQzCvZreseuC1xk/t0zku0Y17q9vEniQOeV0q5a98C
 7pUgbalyS1zcW0zdr19Xtlht4IrDvKcWr8xCRHvalQ3z4X1hw2QXu5H/LoaTTtCLxYtx5UrwtAw
 LCx46bjZL1sAxatXqRtumdsmO+UUW+h5OWIAgeSAfQrNwaAGQxS2NgxsG+CkUYaG87/4QmXhkQi
 uDhhRY2MTyy759igvAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120092
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-97190-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:email,nxp.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B453271302
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/10/2026 2:46 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 01:03:37AM +0530, Vijayanand Jitta wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> Since we now have quite a few users parsing "iommu-map" and "msi-map"
>> properties, give them some wrappers to conveniently encapsulate the
>> appropriate sets of property names. This will also make it easier to
>> then change of_map_id() to correctly account for specifier cells.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>  drivers/cdx/cdx_msi.c                    |  3 +--
>>  drivers/iommu/of_iommu.c                 |  4 +---
>>  drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
>>  drivers/of/base.c                        | 36 ++++++++++++++++++++++++++++++++
>>  drivers/of/irq.c                         |  3 +--
>>  drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
>>  drivers/pci/controller/pcie-apple.c      |  3 +--
>>  drivers/xen/grant-dma-ops.c              |  3 +--
>>  include/linux/of.h                       | 18 ++++++++++++++++
>>  9 files changed, 62 insertions(+), 16 deletions(-)
>>
>> +
>> +/**
>> + * of_map_msi_id - Translate an ID using "msi-map" bindings.
> 
> Which ID are we talking about wrt. MSI interrupts?
> 

id refers to the device’s requester ID (RID/BDF or platform stream ID),
not an MSI interrupt number; it is the key used in msi-map to obtain
the translated MSI device ID (id_out).

I'll update the kernel doc as below to clarify.


* @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
*      stream/device ID) used as the lookup key in the msi-map table.

Thanks,
Vijay

>> + * @np: root complex device node.
>> + * @id: device ID to map.
>> + * @target: optional pointer to a target device node.
>> + * @id_out: optional pointer to receive the translated ID.
>> + *
>> + * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
>> + *
>> + * Return: 0 on success or a standard error code on failure.
>> + */
>> +int of_map_msi_id(const struct device_node *np, u32 id,
>> +		  struct device_node **target, u32 *id_out)
>> +{
>> +	return of_map_id(np, id, "msi-map", "msi-map-mask", target, id_out);
>> +}
>> +EXPORT_SYMBOL_GPL(of_map_msi_id);
> 


