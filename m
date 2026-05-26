Return-Path: <linux-arm-msm+bounces-109765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAJ3NuNsFWoIVAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:50:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F355D3B36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B7EB430265FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FC53D891B;
	Tue, 26 May 2026 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fr1+vbDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnBuMI1T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EFE3D79FD
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788772; cv=none; b=ogu2UAjOA4N5jOWvLVoHeEzQDJTPxSin9sqARmfqG+Zf26FoFQBLZDIS7/5Zg4HR+sg50Yb7XbtHdmGSM2xCBC/lzyaTDVYGA/fKsKyicohE5MwdCl7n8cYMPpZLhQhTx+bX6j3bTwSRMK1XUzCv029mElJU5IxFQ53M+8E1viI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788772; c=relaxed/simple;
	bh=ZCAvrcBAJIXTnHEvSKz8Yq0JKkscj5TsSoJRyS3heaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTlGQgBGtm5tCZe1Trck6lIlz6jURNIcNpLwRTFtQfLdxbiOThuiRs/lbfxVOOtWsQhmVx7njQGjB3N9dNl7PMgQG0Sq8Lsat24oo6FFMrJ0cdGMGHc37yldtP5dgCAoAPXzpgJrGcaME6qmBxnG4Cs5liZKVmpnyU6DMQG/8bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fr1+vbDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnBuMI1T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q9Cel43658354
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tNWCjXxY3vDlbxeyc6dAiioLTzJiUtHmEfK77uv8QU=; b=fr1+vbDENVQY5Zkc
	AWKEyhljX0yFvxH6I1SvWUMTfp19xN/S0yh+TGoyD9Cl2mMP1B+cxYr4CMbB+3HK
	i6mgb6GJt0ChQnVW/edYstQ2ZQ/3qEyz7787O7HhTjAw4XPZE3hs5gii8npI7Amv
	SV4YTLdzF9yQsyRYbZhe8MXQpEJ8I1OBPDETlM0oT+VsBZIO/86gjRfEn9vRxRhD
	fa7RK+Fn5PB0Yls+1QT2cAgdVoCp2+ET9/qfV+TNX1+bxgF2y68cg7pgqK+nzx0o
	z9PP/dkyTpf4v2k4Ml/cIFZEvKeM5ltrMipw4x5NALhFjWWhKMw9d8b7GJjlf880
	lK0fmQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqynb74v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:46:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba3245a43dso115662815ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 02:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779788768; x=1780393568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+tNWCjXxY3vDlbxeyc6dAiioLTzJiUtHmEfK77uv8QU=;
        b=VnBuMI1TbZBKQ34ChVJFTVJ581pMrscHMt/ZxDDDtXbNvdk+5dbGI6vVcHo/krt1Lr
         l6Xo9bnGE5zvJWHOAzMEaUM9fyCGrQaeJxeV70X8y0LsjEDY36lhXnI14EEHu7QBIKkD
         ypPdArXCTba+KbIIamJ+5M9so4EI3mjhzWntGGE/F5lfszIRuRabmBe4W9NDLgtJV+mf
         ICHUASGVX9Bb2pYSNhlR223M1LOrjsOnTyeO7IvRliTW0KquZqj/tq5LD7k4Lg37MyFa
         /SUTerOC80RbmOqA+v1gVaDTWKic2CHqwCqoaRGReMDpb7qaiq9Nda79xIByORjrPOYJ
         hzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788768; x=1780393568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tNWCjXxY3vDlbxeyc6dAiioLTzJiUtHmEfK77uv8QU=;
        b=EmNtyS+TaHzN6Vn3t/Ipq2ydEQoYAJMNjB622SUsEtaEhGrC/+nMNZ4X08iACSOH5M
         poDSsW+vW3/6pFrYPv70K5onmRjNgS2Bj199+9wq/ntjHJ74nJv5eM+Nh3fzeyLDVx8L
         VckoXqG5zIEAKkSbKBtP+t2OfEK80yfoS7vg28XWrzGcIgk5FSL2Es3U+ZadQ0jbUSOV
         ujjacqX7L+/vwKre0WIucAfMILyvaTKrdRpEm5NxRKLB+81at5DjOSNWCcvlBZYGGzRR
         EB+i5mdHxpQF1i7I3tLbabtCTt7BYr7BeV9JZ1W4P4/ny6P1MW4elAj+yFmHOcNiF9QL
         mBiQ==
X-Forwarded-Encrypted: i=1; AFNElJ83FVeiPGrZqxMcUi8YwZqOAPXfvjNaBHoS0cJVTEf7M8OxtuVXVimwAyt73+jd4IaFT997n+3odxcEKLOm@vger.kernel.org
X-Gm-Message-State: AOJu0YyjmMICCGzWyYHPoAWyAKBFFuatAfUKM8pJ0u3G1liM4YjU+sti
	QkTR+ZyJbHn/ItGDCVpLx5LJuyCsOBxpbmd5CeVODcpfsyh0wqAeBl9qd+Nbygv6+yN6UiuT220
	x/ZOm3AObAa3gwjXB282JnwBu5RTvUh7AGVSkmhHTfjBgBcTEw4hV6S+h5Qo8RWdZJljA
X-Gm-Gg: Acq92OHWpIzlWtMYSMCZDqu5uHMwX9ttXTyx2tXimthoExiRaMrpAtZnvEbgbUW5UYd
	A6JzIdB8wti+qFvxvqWQiWmjD0uME2akNwiJqR24sbcx9O28TVJ/J69+vT+FVukytygAj0KgUO/
	DaKq0AyZ5BgD1uiPSJINnfDYrtFrVI824S8r6Puk9A2/vVjaqOdF+j9ajcV2u9AFOoeuOaoM6zj
	f2rFOiWn3A6G9edLWrFxzhObRfBchbD6c5k+hsFjhusyoUXyck4YYP9y360qJy8mj/9wcevpGDF
	u9rT046JEbSK6dr49wTqvaxoDlZL0aLdZ724M8QMcaQ9QP1zLj6I7WeY1vMeLNlLWv9d85OS2x4
	DOix4hUZxGTNdQVw+uF7G2gxRb3kh1LfXw+r9y85I3BafKNHlD1t0faDQ
X-Received: by 2002:a17:903:41c2:b0:2ba:e42a:231e with SMTP id d9443c01a7336-2beb064837dmr200645345ad.37.1779788768337;
        Tue, 26 May 2026 02:46:08 -0700 (PDT)
X-Received: by 2002:a17:903:41c2:b0:2ba:e42a:231e with SMTP id d9443c01a7336-2beb064837dmr200645035ad.37.1779788767805;
        Tue, 26 May 2026 02:46:07 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2ebcsm121223885ad.49.2026.05.26.02.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 02:46:07 -0700 (PDT)
Message-ID: <f2eb5c9d-a78b-401c-8796-f7ef7a8d7386@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:15:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 0/3] of: parsing of multi #{iommu,msi}-cells in maps
To: Krzysztof Kozlowski <krzk@kernel.org>
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
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com>
 <20260526-finicky-crafty-hare-eae27c@quoll>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260526-finicky-crafty-hare-eae27c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a156be1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Jo8nEopC4ZUABtMbiE8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Z9YvBZ9BX9DYeyx0uM2z1iSHQcUfdHpS
X-Proofpoint-ORIG-GUID: Z9YvBZ9BX9DYeyx0uM2z1iSHQcUfdHpS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA4NSBTYWx0ZWRfX+L+jf4VlSy5w
 FkweEBpXAtMa+AaUeP44YXw/FRyIF2Na09mr32m39yNhwYfM2+53jUaVIOGzJUvW3qDMr/Za8PP
 KWDZguJQAgqAZPGlUslFj9L7k+KfDwTSI3Zybl6rpPSblyyxM2bnAxtXrRhPVxGUtVNwpS2/dfW
 3ddv1u4G1iO9BvpoLUeE54Xu9lblHjOZ3AgLrCVTIby4gQxqVKkAyoElcOmo0pKrLSon8ET9ZF5
 FrVYTvpULGwFbxnmmnqfWVEFO+QhdkK+u7BIL9quonTaP7aWDfJhuxFXfw9hpb3fSiLobkrRwVK
 FtmbY2Ywsa7X6reXj/nVPiMrey3SU5oCOrw2jO9pKiZ6T3JZgrNp9zD+aUuPOX6ocIOs96nQN4p
 XQuv5SYf0b7Rm67ENndYrdXsx3Ks8qHfpla1vrJWc1JuID+70o6zrUCSC8v4WM0/hWLHzqWHlCN
 XXU2vhuBvEPf+/i78dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260085
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
	TAGGED_FROM(0.00)[bounces-109765-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
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
X-Rspamd-Queue-Id: 33F355D3B36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/2026 11:42 AM, Krzysztof Kozlowski wrote:
> On Wed, May 20, 2026 at 01:32:39PM +0530, Vijayanand Jitta wrote:
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
> 
> So there is no real user for that. That's unconvincing. I would assume
> that at least you have real user where you test it.
> 
> If you want to speed up acceptance of your patches, then also I would
> prefer to see at least one more user, beside Qualcomm. IOW, show how you
> solve other people problems, not only yours.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Thank you for the feedback.

The upstream user for the multi-cell iommu-map support is the Lemans
platform's VPU device, which requires iommu-map entries targeting a
2-cell IOMMU node. We are currently working on the glymur series [1]
and once that is finalized we will post the Lemans patches as well.

That said, I think this series can go through independently for the
following reasons:

1. Correctness fix: The iommu-map/msi-map bindings have always
   specified that the output cell count is determined by
   #iommu-cells/#msi-cells on the target node. The kernel has been
   silently ignoring this and assuming 1 cell. This patch makes the
   kernel respect the binding specification.

2. Backward compatibility preserved: The of_check_bad_map() workaround
   handles existing deployed DTs that target 2-cell IOMMU nodes with
   1-cell entries. This series has been tested on the glymur platform
   [1], which uses iommu-map with 1-cell specifiers, and the existing
   parsing continues to work correctly.

Thanks,
Vijay

[1] https://lore.kernel.org/all/20260515-glymur-v6-5-f6a99cb43a24@oss.qualcomm.com/

