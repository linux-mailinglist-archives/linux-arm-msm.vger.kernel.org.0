Return-Path: <linux-arm-msm+bounces-95281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB3JFm39p2mlnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 10:37:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4421FDB97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 10:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF206308410E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 09:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEDC3988F1;
	Wed,  4 Mar 2026 09:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1/MgbWp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1y1eNiw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577D7383C9D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616914; cv=none; b=V5eU3zix+33OJHFAsGfbHtKQBlI5BYDa5MA9L34RksfVTq53O6+cOr+6k6W0qn1kML6Gh3tuPViZ3MefNVGR59O76uvBrR/K9k9nevlSm6dBZC6WPhZ7WjTuRVGSSydL4noXTAVCk/iPnc30KXGt2bOUj8sQ71ydArm+zUnr+18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616914; c=relaxed/simple;
	bh=EzXD64F0RyH0zPAC4K6xzonp165P7LLftsQuyrIMX/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kLAte7Dryd1UFiKIppqTjWL1Ajqc1QyBk7ErEa6kn+bs0iOvo6fs6M40xSPdHHegaG53WTOYmntU0fF3yNVIlDUsIa3smBdl3MBbhLubLRoKLulOqqUL+cPF6k2DygGa3NW68ujaDQ1pQ2Gy8aRz+0JrWLNuc5QdjpzEB5OwQEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1/MgbWp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1y1eNiw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SVbN2306174
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 09:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t80u5LhNs8dedbnLQe3vnPgp0bI1VMt5bD83HvKUNdE=; b=g1/MgbWp9GnnXzTd
	dYgjmB5pE0P9xO0EdT20U1vIXpi5wS3RFe61V/EBK+qRPr9eONuDqjb9UYV2umU/
	XCP7CoOKVrwU57sHnaAy4LUA4efHqaLUfjweLNBhhI7Q2qzZR8QazjyrvWniEyPb
	QQYK28Z1sRZka2ZE29KDYJXFNg/0EdRPi/TmeNbb4jH6w3G5fmFZKHC+H/PiUrdc
	PTgx64nHg5jzDRyyzQ51s1Le/VaT5IGp7W8hsfQ7Yb6zp3JOAUrD3gO0jK5zYDmi
	9lS2S2AOKeuSXQde+RvkHYShPDF/QlA7jTobiMPM3THAv1Ntk1wMS10nDiGYvKV5
	Hm/DGg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpau8sjxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 09:35:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7385e8fa73so31124a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 01:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616912; x=1773221712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t80u5LhNs8dedbnLQe3vnPgp0bI1VMt5bD83HvKUNdE=;
        b=L1y1eNiwCBa+ZZtQCgTXBXCs+rmukmXwFehzBpg7wuwYDD8TGvzJqe9XRnfYuKYEAL
         Y5hmpRLXVg3mdKgyjZLyOBQrka4YQMwM2m497tpeLzqTVEf+8BGWlUDMiM0ntYcBzCQs
         v7jnu+72DZW5EDOsO+H51MNE/NcKFXyBqYzGkoIux49q3DiDjIo0o8IxEOd9jj1kS98G
         0nf1J9qX4vXCxd7StuMDpA3xnJ8BZZsLCCX9Ufb2o4I8k1XN9eSaxYQTn9IK8D4Ifcvw
         YQwsLlIIIRj3wcJPcRRdye1Wsdk2YWKBwQbszg4AjErIcqopW195iKcy+IzF/SQ95eDs
         zsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616912; x=1773221712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t80u5LhNs8dedbnLQe3vnPgp0bI1VMt5bD83HvKUNdE=;
        b=tSz5Bnc/KEW9lvfliQdtaCad+iqnjgE3Ali86/aw0t5Swj5Aj1CeLmdCGXoVVahDLN
         BwGeyACZCVxLmYWThVmKpcMsC1ExeNHDHFjg13QMiFOawjKUEb7KqE7q29XHRBkJJ1k8
         BupfOnE8792b/y1x1U+4xwfgtmnmpM3am2Gj3+dAscq896124fFXaqsA7F/Kkf8YPHsE
         SE+CGjQ47oNuR9Hp/JCQuv4mBAU/aGHifFqWVtaSXezl5OBxHgAIGSIVLcZkEjn1oyEM
         TUZLxlAKqA6p0AIvGBccwT0Pz2yi/uS/n3F5TeCNLpXG8R93o1DGQ+BnaYzP2idqof4c
         Ib3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWp3KKjrSsiqbgrNjpAj/zYKMkVVfB1Y3XDR6aTBHocx0o/qxoF6hPhbhdD7dJ7rzkapiqhrm26F+BQ+fwI@vger.kernel.org
X-Gm-Message-State: AOJu0YxaBMwvtuIf2uW7ciFeGM0mHhSvOhSGK6H8hSWN9ol7sbb0feuH
	vmPxW8jn3JTnZvuvRsluaKxEQSloVsjCu7ID8S+DZ9GSrk+26wLjpXH6S6tuT4e4+A3190dJJrX
	LU5i3V8+x8mzJKyztvx2nZMFhyXaNKeX/XMIr4bsYvkEzxNLi0tmrBdmmtKX+Gkodt5mK
X-Gm-Gg: ATEYQzzhrDIre2LoJbiVOq5NfRTNgFFr5OG+N/csaR+znpRnzWJU9hux2bZOB1ilUwx
	+Rj8vWtqewWrjztMHzdKqHyDRj7tt/833g6JYRoRYC34B+r5bVMcZiph4kKmejUXL7CVYAVbHVK
	/RiOPL8abOEhf7L27VgyV1xy1Zb4W1dqV0I9UgK/MjFGHDanvY73H0FylZHPp3lcwZSbCPO65oI
	TVNGM3RZeztbe2pN/hwwBivXMtGbvb2e2yzOjwKu0EJr4vfGndjAwkr6KYA82BKafuEhy4ixp8K
	1GBHQKyNOpLh23CkPEv2aGKmvzl+4U5nQHbYb3aHk0rSCyVfw+FtCCwrlgk6S0gJ6TsKExzPKln
	o/7RGRpXyQrTY7UiljhdySTtHwkzrrHxxLNxErpZZJzOnzLFRcSrsr3PU
X-Received: by 2002:a05:6a21:608a:b0:35b:9ba2:8cd5 with SMTP id adf61e73a8af0-3982e2036d4mr1560337637.56.1772616911558;
        Wed, 04 Mar 2026 01:35:11 -0800 (PST)
X-Received: by 2002:a05:6a21:608a:b0:35b:9ba2:8cd5 with SMTP id adf61e73a8af0-3982e2036d4mr1560306637.56.1772616910991;
        Wed, 04 Mar 2026 01:35:10 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73790f881esm1186795a12.10.2026.03.04.01.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:35:10 -0800 (PST)
Message-ID: <9aa4c1d3-713e-4137-8042-a73bea8e8f34@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 15:04:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] of: Respect #{iommu,msi}-cells in maps
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
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
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-3-4d1bceecc5e1@oss.qualcomm.com>
 <laif6gacqyacvchnfuyhu4w3f4746xlrlxrr23klrgtkbn7dn3@rracfqemavwd>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <laif6gacqyacvchnfuyhu4w3f4746xlrlxrr23klrgtkbn7dn3@rracfqemavwd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AJS1/0o2 c=1 sm=1 tr=0 ts=69a7fcd0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=FlLgGEtdp7AnL9SkOqcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: t7H85V459EsY2NEeK9EjYsjZjyGkVFph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MiBTYWx0ZWRfX/yxodm8R6Srg
 ifJz7Wkyi6wezHZpmOfZi4I50QAuSy7BlBn2ZPiAcvzugJk4CazxpbpcS9HBfUgZY+WIwvShxpB
 3ZoDAv7vuY21yONHl++W35FGr3vB6RaVIWRktY8aEaZgjO/NH3iAyW8nlVfWUcFA3MAPRnZQ0Wb
 KFpJMdiDC20rKW++tXmtcrDSUTEVTi/hGh8CM9PI5gxY26UrFX4zDtgbctynMFJzfbbCnOsgyvi
 kzNSb2BPzOLy8ykYAwEcQtZGIUeudnZiQ9j9Rr4BfkLLxllr4lz+/hIEzaOd3P1WIun7qQHDeIw
 SPfs6mnXKkdHQALcqqYKn+nIY3xjG18NNHYnv+UhGfwnOaGIsiDymANMa3S7jDVyOZN4bv1hKX9
 WySZ/FM/5nXCD9r5Jgf34BVL6irD5+Rlj/hqQwfOVKD/vGTuGWmqhfcDn0Fc6/XZFprrP5YevSD
 6l889Uuf2CMFk9nqrRw==
X-Proofpoint-GUID: t7H85V459EsY2NEeK9EjYsjZjyGkVFph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040072
X-Rspamd-Queue-Id: BE4421FDB97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-95281-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Action: no action



On 3/1/2026 3:44 PM, Dmitry Baryshkov wrote:
> On Sun, Mar 01, 2026 at 02:04:21PM +0530, Vijayanand Jitta wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> So far our parsing of {iommu,msi}-map properites has always blindly
>> assumed that the output specifiers will always have exactly 1 cell.
>> This typically does happen to be the case, but is not actually enforced
>> (and the PCI msi-map binding even explicitly states support for 0 or 1
>> cells) - as a result we've now ended up with dodgy DTs out in the field
>> which depend on this behaviour to map a 1-cell specifier for a 2-cell
>> provider, despite that being bogus per the bindings themselves.
>>
>> Since there is some potential use in being able to map at least single
>> input IDs to multi-cell output specifiers (and properly support 0-cell
>> outputs as well), add support for properly parsing and using the target
>> nodes' #cells values, albeit with the unfortunate complication of still
>> having to work around expectations of the old behaviour too.
>>
>> Since there are multi-cell output specifiers, the callers of of_map_id()
>> may need to get the exact cell output value for further processing.
>> Added support for that part --charan
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>  drivers/iommu/of_iommu.c |   2 +-
>>  drivers/of/base.c        | 117 +++++++++++++++++++++++++++++++++++++----------
>>  include/linux/of.h       |  16 +++----
>>  3 files changed, 102 insertions(+), 33 deletions(-)
>>
> 
>>  /**
>>   * of_map_id - Translate an ID through a downstream mapping.
>>   * @np: root complex device node.
>>   * @id: device ID to map.
>>   * @map_name: property name of the map to use.
>> + * @cells_name: property name of target specifier cells.
>>   * @map_mask_name: optional property name of the mask to use.
>>   * @arg: of_phandle_args structure,
>>   *	which includes:
>> @@ -2118,18 +2145,19 @@ int of_find_last_cache_level(unsigned int cpu)
>>   *
>>   * Return: 0 on success or a standard error code on failure.
>>   */
>> -int of_map_id(const struct device_node *np, u32 id,
>> -	       const char *map_name, const char *map_mask_name,
>> -	       struct of_phandle_args *arg)
>> +int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>> +	      const char *cells_name, const char *map_mask_name,
>> +	      struct of_phandle_args *arg)
> 
> Some extra whitespace-related noise in here. Last line wasn't changed,
> so there is no need to touch it.
> 

Thanks for pointing this, Will fix it in next series.

>>  {
>>  	u32 map_mask, masked_id;
>> -	int map_len;
>> +	int map_bytes, map_len, offset = 0;
>> +	bool bad_map = false;
>>  	const __be32 *map = NULL;
>>  
>>  	if (!np || !map_name || !arg)
>>  		return -EINVAL;
>>  
>> -	map = of_get_property(np, map_name, &map_len);
>> +	map = of_get_property(np, map_name, &map_bytes);
>>  	if (!map) {
>>  		if (arg->np)
>>  			return -ENODEV;
>> @@ -2138,11 +2166,9 @@ int of_map_id(const struct device_node *np, u32 id,
>>  		return 0;
>>  	}
>>  
>> -	if (!map_len || map_len % (4 * sizeof(*map))) {
>> -		pr_err("%pOF: Error: Bad %s length: %d\n", np,
>> -			map_name, map_len);
>> -		return -EINVAL;
>> -	}
>> +	if (map_bytes % sizeof(*map))
>> +		goto err_map_len;
>> +	map_len = map_bytes / sizeof(*map);
>>  
>>  	/* The default is to select all bits. */
>>  	map_mask = 0xffffffff;
>> @@ -2155,27 +2181,63 @@ int of_map_id(const struct device_node *np, u32 id,
>>  		of_property_read_u32(np, map_mask_name, &map_mask);
>>  
>>  	masked_id = map_mask & id;
>> -	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
>> +
>> +	while (offset < map_len) {
>>  		struct device_node *phandle_node;
>> -		u32 id_base = be32_to_cpup(map + 0);
>> -		u32 phandle = be32_to_cpup(map + 1);
>> -		u32 out_base = be32_to_cpup(map + 2);
>> -		u32 id_len = be32_to_cpup(map + 3);
>> +		u32 id_base, phandle, id_len, id_off, cells = 0;
>> +		const __be32 *out_base;
>> +
>> +		if (map_len - offset < 2)
>> +			goto err_map_len;
>> +
>> +		id_base = be32_to_cpup(map + offset);
>>  
>>  		if (id_base & ~map_mask) {
>> -			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
>> -				np, map_name, map_name,
>> -				map_mask, id_base);
>> +			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
>> +			       np, map_name, map_mask_name, map_mask, id_base);
>>  			return -EFAULT;
>>  		}
>>  
>> -		if (masked_id < id_base || masked_id >= id_base + id_len)
>> -			continue;
>> -
>> +		phandle = be32_to_cpup(map + offset + 1);
>>  		phandle_node = of_find_node_by_phandle(phandle);
>>  		if (!phandle_node)
>>  			return -ENODEV;
>>  
>> +		if (!bad_map && of_property_read_u32(phandle_node, cells_name, &cells)) {
>> +			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
>> +			return -EINVAL;
>> +		}
> 
> This will trigger the cells_name property check even if later we
> discover that we have a "bad" map. Is it intended / required?
> 

It’s intended. We need the cells value here because determining whether
a map is “bad” depends on it, as mentioned in description of of_check_bad_map
this is specifically for the case where the DT has an iommu-map pointing to
a 2‑cell IOMMU node but only provides 1 cell in the map entry.

>> +
>> +		if (map_len - offset < 3 + cells)
> 
> of_node_put(phandle_node);
> 
>> +			goto err_map_len;
>> +
>> +		if (offset == 0 && cells == 2) {
> 
> ... if it's not required, then the bad_map check can be moved before the
> loop.
> 

Given that, the bad_map check can’t be moved before the loop, because we only
call of_check_bad_map() when cells == 2.

>> +			bad_map = of_check_bad_map(map, map_len);
>> +			if (bad_map) {
>> +				pr_warn_once("%pOF: %s mismatches target %s, assuming extra cell of 0\n",
>> +					     np, map_name, cells_name);
>> +				cells = 1;
>> +			}
>> +		}
>> +
>> +		out_base = map + offset + 2;
>> +		offset += 3 + cells;
>> +
>> +		id_len = be32_to_cpup(map + offset - 1);
>> +		if (id_len > 1 && cells > 1) {
>> +			/*
>> +			 * With 1 output cell we reasonably assume its value
>> +			 * has a linear relationship to the input; with more,
>> +			 * we'd need help from the provider to know what to do.
>> +			 */
>> +			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
>> +			       np, map_name, id_len, cells);
>> +			return -EINVAL;
>> +		}
>> +		id_off = masked_id - id_base;
>> +		if (masked_id < id_base || id_off >= id_len)
>> +			continue;
>> +
>>  		if (arg->np)
>>  			of_node_put(phandle_node);
>>  		else
>> @@ -2184,11 +2246,14 @@ int of_map_id(const struct device_node *np, u32 id,
>>  		if (arg->np != phandle_node)
>>  			continue;
>>  
>> -		arg->args[0] = masked_id - id_base + out_base;
>> +		for (int i = 0; i < cells; i++)
>> +			arg->args[i] = (id_off + be32_to_cpu(out_base[i]));
>> +
>> +		arg->args_count = cells;
>>  
>>  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
>> -			np, map_name, map_mask, id_base, out_base,
>> -			id_len, id, masked_id - id_base + out_base);
>> +			 np, map_name, map_mask, id_base, be32_to_cpup(out_base),
>> +			 id_len, id, id_off + be32_to_cpup(out_base));
> 
> Again, having whitespace changes doesn't simplify reviewing.
> 

Will fix this in next series.

Thanks,
Vijay
>>  		return 0;
>>  	}
>>  
>> @@ -2198,5 +2263,9 @@ int of_map_id(const struct device_node *np, u32 id,
>>  	/* Bypasses translation */
>>  	arg->args[0] = id;
>>  	return 0;
>> +
>> +err_map_len:
>> +	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
>> +	return -EINVAL;
>>  }
>>  EXPORT_SYMBOL_GPL(of_map_id);
> 


