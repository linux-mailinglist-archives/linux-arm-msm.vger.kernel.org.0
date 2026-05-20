Return-Path: <linux-arm-msm+bounces-108640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePjvK6NrDWrgxAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:06:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC7A58962D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 250033032397
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4C33A6B73;
	Wed, 20 May 2026 08:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZaRSheFu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VuBL/fce"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B105836CDFC
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264363; cv=none; b=Or1eexiBwUPBJTTOj8GYYf7RHHlo6FQJNtqWIHS4gnujsra/YalYrcIFDAFrQo3C/mTpqaUvdQ1+sbgMDPO54iFrOFacLrxjnXi/TCz2CQlOiq9hBkKGGDWW10BvCw7HdnIGij1UGNGqf92fpsEBA2hjxypLm63jYHyjNHAnA40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264363; c=relaxed/simple;
	bh=KUaCdDomY2qU9nG60VsZNCEO7wba/w9qv4eRI81YKo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tApbvE9kJpphusAQn9Z8ICqEyFiHhqiKAt0VYSkZO3zdwIYPZJr1Ot9QTMAlCP8VzYclKDje/tt+cU05F+losg8eezD1ShC6keCKZQlXEURUYQnKnZlslVhmKeH3qvEzy0ObyIF9mfKUrLsH43fpGFQdCIDoiNXIojvZoYm6aSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZaRSheFu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VuBL/fce; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7gdp8341575
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4o4tguLJ2M8UFVCSQAOmrgjGYGYAaNNp+BkOJSYljs=; b=ZaRSheFuPELGrHrU
	5bq5fVMfyqResKiQ70JQ9GcmVcwVO++BNdtAGa8VE2RcuXKOS1fdXMzwTJtDbph5
	Kdz4noyWWRWd6d23UxPQMSbSlVPYhaCaEpU8/dR7MIrPBCAKu4u2eeLWD7A9h8Ru
	U3reVb2kI1+5mBFvP29oQxg4eDYm25BSrQS33OCcAsX2dxLWXMzwkxEAzAllr/T5
	SbMuaMtk4zoKuAm4QahqJUCu0TasoEKPmouhj+BzAYKQPlph23Nquuv+5EWqtMuO
	plY7E2DXbNgLQ53IfLC/cnaAcIDD30ZwYB/zcqQY/p+D8n8MDMmrXgdUON6gqfI7
	uk+kjg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3vbp1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:05:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82ba4715b6so4808957a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 01:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779264354; x=1779869154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h4o4tguLJ2M8UFVCSQAOmrgjGYGYAaNNp+BkOJSYljs=;
        b=VuBL/fceh5Ece1PXQOSfa42Xn/BfhtInYmw1tzmg/mCFuIR9AvRBemthybBkBYGyuT
         l1aN5WXvh/d1k9HifM5Q5KHjfjV8E2xSd2hqkUutdob6AoDWrgxahqbhd3fwaS6pniEA
         fmZ4dcf02QzSLtPZi1F1u77S5mKvhzlK4KoUnNbCd6whLfmZTqRNECZYZNIXz3MRrAzT
         ZDMkZ8Q028IMCiGRuYTbyqGur6/QHEMBy+K6M6ZGywlRKv7PXdHfUnhowyhsklEHU6+f
         3mj/+9y3LZIDcROOWc7NWK1I3X0rEZOYiuuKLZTwRRh0brbizGc0stzt0spH53XN5NHD
         TzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264354; x=1779869154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4o4tguLJ2M8UFVCSQAOmrgjGYGYAaNNp+BkOJSYljs=;
        b=ju3jxkcQ30vO3wkIjvu+WqmOS9tK6cBg4CmGIkEKvwlE2XNBFcwaCmW6lcGxEuEXL6
         NVm483s5eGKcFAID3Ue0v3mx+z42wMNnooF+43poz2JICOeJtPQeob3y5QP69Avzcz5u
         k5l5al8B3Qf4QsGfLatK0R81XZN7Qyao++PdBMjdGwC8xgTHEZw+X0iwkRKeVHtHgE2h
         4/LiOnWwsvvAcXazKj0fwl6XYraO/WS3OW0TaW4guLUNnVan6jflmahLWAGDZw+0GnNn
         0y09NMZLe+kkl2CfAYpbODKR2Hn5c8RdhSCdYKonw893LltKWiKhmgSCKkiIi6ypLL43
         DzDw==
X-Forwarded-Encrypted: i=1; AFNElJ+muuwyEsDSjWGUvaSw8xNdDyCE4ts7b/qJHjyUW34zcdBCyifryRo4e6lnn3yfH8nUBvxRY4ew8pzFY8yp@vger.kernel.org
X-Gm-Message-State: AOJu0YzLPEZqno1KnQHgXm7n9jtnAR4pYWuLP3KWenSLY8rfCjW2sPKF
	hS8CX+JCFO8xpGXW0GXYw50X4VRF0HFooGgoyqZwqmkqm4j1y5kFrHCgDlxygLmU7LyakPMiaYf
	T9FvGGFkE9VcUDW4YgKhWgma/T0HVd1GPU0vIjwjk9VF4eobCocICaqiVm79rpf7GA/s7
X-Gm-Gg: Acq92OHzIL2PzpMvg4WM4yK8LT5VaOiweoOey7u/I2Fecv4yEm5hht8btnl29Sr+Z3i
	4QdjTkOPbYHS16Ka06GFj95yiUEkWy0yHREsVKUPTMGK0bMr6lhp/M7JbTdWCkY4r0A1/9N7u0o
	QAEOvewkRSuKLVeYhTZx0/0eUBW5K5QYK0bjS7B0ayZ0rz8kQb4A5LE1tjxOJP83PqttcNLQ+O3
	0oXbTQWbcp8/VHb8GgPtzdQ8gVhFGV0GWTY0+TzfvDg5TH3JWhrl+RMw+8vuuFvu1L99c9DySud
	81w/JhOyH8oJR+A3zpDWWhmOkRE9RVbOQGBIvnO7wDgiuk6lbqjtNnZlFv60ysatWVrUeNSp9pR
	1xuBlOOkGrM+nsTwCnBgZQ++ingtcpx6lPbigu4i8V+NaMZE+v22Qrtp2Uaclb3vyqB8=
X-Received: by 2002:a05:6a20:7d9f:b0:398:ac0d:9a0b with SMTP id adf61e73a8af0-3b22ecb031amr25955133637.50.1779264353659;
        Wed, 20 May 2026 01:05:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9f:b0:398:ac0d:9a0b with SMTP id adf61e73a8af0-3b22ecb031amr25955066637.50.1779264353199;
        Wed, 20 May 2026 01:05:53 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb11683fsm18637582a12.26.2026.05.20.01.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:05:52 -0700 (PDT)
Message-ID: <11b91838-9b24-4a62-8760-fdeb3703afc4@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:35:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/3] of: parsing of multi #{iommu,msi}-cells in maps
To: Rob Herring <robh@kernel.org>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260424-parse_iommu_cells-v14-0-fd02f11b6c38@oss.qualcomm.com>
 <20260506221915.GA3290640-robh@kernel.org>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260506221915.GA3290640-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lwNw1EBkwRIbsdrawmkxCH0I8JUdF3Mn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3NiBTYWx0ZWRfX1xjjUGdoJDEf
 mIiq7PldWRp1ss0NdEUT1CJIbELckAxTM9/tr16pBOJ8c5UYRm2H6jwPl54VXi9tdQpPVImKWNm
 uR2SZgF4F11Nzp1j6NqdtQsfy81BFPMTIyL8O1qbCnDBdQowJc2EaavqBczF+CxqsfwknEX1qUN
 7I8gpCm38mnJb6vdopQcSPRAAPB6otCjODp+TR9YWL4zFtv7BLOda57DIY8JfyN+kBB8U7aVAa+
 oHYCPmqAMb0TnVYfHCNVxTqjgd/88F+Yt8MX8oPHGAPKY2aHJJuNgOnVJlKw9tP+9KLJNADwQan
 D5QMQ9vm3YPu7/FrSKtF7e2sVaVPiClvBJUQcVjUZGEg/j3iS1ZqMJv/8QRFgaMTDtJSjP3noMt
 /uXdf76+fdfksxoeunB+W3AJASVui2Zad0qBB4rfLRcEOKGmVdi9iRwMSGwT60ECBr3Cxhtj22M
 AAKDkGU1ehW5XG/57/w==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0d6b62 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zmrd7r8un3QtD10oEDQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: lwNw1EBkwRIbsdrawmkxCH0I8JUdF3Mn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-108640-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sashiko.dev:url,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 2CC7A58962D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/7/2026 3:49 AM, Rob Herring wrote:
> On Fri, Apr 24, 2026 at 11:26:07AM +0530, Vijayanand Jitta wrote:
>> So far our parsing of {iommu,msi}-map properties has always blindly
>> assumed that the output specifiers will always have exactly 1 cell.
>> This typically does happen to be the case, but is not actually enforced
>> (and the PCI msi-map binding even explicitly states support for 0 or 1
>> cells) - as a result we've now ended up with dodgy DTs out in the field
>> which depend on this behaviour to map a 1-cell specifier for a 2-cell
>> provider, despite that being bogus per the bindings themselves.
>>
>> Since there is some potential use[1] in being able to map at least
>> single input IDs to multi-cell output specifiers (and properly support
>> 0-cell outputs as well), add support for properly parsing and using the
>> target nodes' #cells values, albeit with the unfortunate complication of
>> still having to work around expectations of the old behaviour too.
>> 							-- Robin.
>>
>> Unlike single #{}-cell, it is complex to establish a linear relation
>> between input 'id' and output specifier for multi-cell properties, thus
>> it is always expected that len never going to be > 1.
>>
>> These changes have been tested on QEMU for the arm64 architecture.
>>
>> Since, this would also need update in dt-schema, raised PR[2] for the
>> same.
> 
> Sashiko has some thoughts on the series:
> 
> https://sashiko.dev/#/patchset/20260424-parse_iommu_cells-v14-0-fd02f11b6c38%40oss.qualcomm.com
> 
> Rob

Thanks for the feedback, I have Posted v15 addressing comments from Sashiko.

v15: https://lore.kernel.org/all/20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com/

Thanks,
Vijay

