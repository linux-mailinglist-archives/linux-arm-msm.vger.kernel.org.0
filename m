Return-Path: <linux-arm-msm+bounces-97192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AD7AZinsmnwOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:46:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1642713C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E977A3006B1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22023B6C0B;
	Thu, 12 Mar 2026 11:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HmaP0o5E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8qk0tGV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985B2390216
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315778; cv=none; b=BYAKrW+cSwBZXe3PZHLBU7vKMzT6mSS8MMYPiVy3I1OZGtxFTmzxhwTAwg1kb05s/bJH6KmZ7EvCOxzIiQY3bvxFJWpqcqQ4sQVmWeSCjT54MRbySSCyA5n64gY+tJYOCEnboLikSaGs7ar2+X0h7gLiajU/m9LuTVePOHmlftU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315778; c=relaxed/simple;
	bh=vuDtbFLrMiurzB2+xC/ot2IB+T1N8Hc0u2jO0iC2vG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWWxF6Opa2DECz7zHydzM9ETzAjVIbxmH+mbMIRmiz/5qZM3mMfd/L4Uphu/hCTlmq1HljVPnWo6Nu70Q+BZUMwvNcA2s5pt7ffFgSp7SzmJjQrn99UvFjVKE3Z7CoWHW8/23+HS0411bMTjLqdlXcwwF4zo5YxzhNVHCkSW6hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HmaP0o5E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8qk0tGV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9J0cN3137406
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W9ejYWHNwRhjPiGAgnplcOS8lPIHbm/6D31/N+auTSw=; b=HmaP0o5E8kDigSFa
	alJVniCiNF7DjBpO3slqiNJ3tC/PYMDuDwHYrqAZ6m3faf3xBUSqMLfpUEiT0ME7
	uWWAeSVIZ60cNAHJhwuo6Vb8dOptnxFIZD2ZPlI6SJHGh0bEalGe5AilAQjBoaDU
	QZVlr/4PFlZA2kIerIpl0o8Gs05Rqi4LvYe2xoN8EAgrInA5+6ymKHj2jVoDFZlX
	twDN9GpYJxK9TErk0jdzr2qqWM7kBKQCbwArOlfCHOrYnIloY9u/so8cENTOFlPK
	42iYYDiTfRSrfY3aZO54lNm32900MmfmU17DmtlRZIiqhD4bfqXTlQnqegCK9Mod
	59ZCww==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w9y4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:42:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aad5fec175so45456205ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 04:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773315776; x=1773920576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9ejYWHNwRhjPiGAgnplcOS8lPIHbm/6D31/N+auTSw=;
        b=K8qk0tGV1VvYa8n6L4GNDEIrVk3ylGJtU1Tj0MngO4fgE7rkiOZpJOpDPwdgcPoHjJ
         3jIEz1gIIGqIPLX4PJGCOKffj5OQTnx6GRJBzh1lFqp2mUCvJ7h6vBtnh564Njc2SQRB
         UGFyJPwknQpbWPjrq3rug4F+SIFkArjit5lt7KxnrHmbZFMR0y3cXM336E7PHu499TRM
         NjQaydvCMaBmANW4iBaRhbkkUHEDZQ12jI7d+QyzAA/1Gx56toGvYf/Z4/d8M8mdw9mS
         tHe3dzN/bCwZPouSKY4/bHpknHsqRNbNxlcLgS+iLOCrzJMhrB2gm8vahNuVEa2njsM4
         OXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315776; x=1773920576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9ejYWHNwRhjPiGAgnplcOS8lPIHbm/6D31/N+auTSw=;
        b=BRZOC0L6aB3JXFmyPCTRX0C/zK5bbbJFqNvOcH79zkFBvIzxM2hsYqs7hAIm6U7MtC
         7D24BLQ1C0WHJdPsu07BlYxkrOtjkKoZNuoY1Z7GxEj/RE0hOWlhKhRCWdG60q7hejIk
         hLFrBzYGrkLKIcLj5Jt4MDV6/H26tbyG8PIbs5rUkwxOXQSOzZOmXnArcyl4+FPjkwBS
         ewTO/++PFbeQjozcbkMpqLrTkYSIKAUbE+L84xhy24z74L2UdqVtzXi2HNFFIgORGIbu
         5egRvUuH6R6HpfVOWYCr4rBmmFlbQQMSo8zbRG+PYfDoy5gDyZwTWsyuFUy98BgWuLHy
         jTVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6bgIxvZCjOgnxGDlSbrutfZyKEbNsSpLX5APMNfg+/reIDg4TuqZK63hBMnG9erno+IgJnYEDs2VRS6tB@vger.kernel.org
X-Gm-Message-State: AOJu0YziL1I15tz3Yat7jMdCZvYfvUabeC4eVCk12nqgHJmeuihCTnk8
	Ck6nit4ic6i72Vq6KMLrRfZi9iWto5rDe2O6ogfupXpe+xUjPkIiBh4RqT3nYw0FBoLRaoD/B1I
	3jU8quc/1PaZebd3Ll14A8shpTcz8kSi/VEELVzYgFFqJJG0RbFQSvSRwgZMLZrqhoT36
X-Gm-Gg: ATEYQzx3yyn4SKoGNZuocC+2obb0rXGxr+bBqMO250U7Zco0mFNvUIlVJy7fxwwghsN
	rxWdybNM5QenqnRz86SfedfbrMtmVSZ8A3liMWihauFC5ADdO9BzgkmrWWAIgLHA5/EhYZ1vLbD
	nXJabLVv/O0YBu5TezJ0guA93KvWi51v9/bFk4Bap8tS4UYlyhLGaBrNWHRkL2ldUx/0KkjqaCo
	MY+PWCN8YYCRR062yq+4b9rApGUPOOIxdinQStiSTWxuTtAl7roodxq0xw/JJLgE6QMNVUQoVIj
	/qiCo5b4Yye1D1TI6NFft4xaD6BQCkI760plynsoXYBtBT7TcXQHBCvGazk7O3pB4YnA7N+n+ck
	i4Yjcf9WWOsQdPqGqoyAxi+aHpL0P3au/xuSb+MqQakD/U3mSGhrzJeI+IQ==
X-Received: by 2002:a17:902:db06:b0:2ae:3fb2:ec9a with SMTP id d9443c01a7336-2aeae7ad446mr64958775ad.16.1773315776344;
        Thu, 12 Mar 2026 04:42:56 -0700 (PDT)
X-Received: by 2002:a17:902:db06:b0:2ae:3fb2:ec9a with SMTP id d9443c01a7336-2aeae7ad446mr64958285ad.16.1773315775895;
        Thu, 12 Mar 2026 04:42:55 -0700 (PDT)
Received: from [192.168.1.10] ([38.254.186.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae25cd67sm56194955ad.38.2026.03.12.04.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 04:42:55 -0700 (PDT)
Message-ID: <04eabe08-f339-4d9c-8b61-184241d192a4@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:12:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] of: Respect #{iommu,msi}-cells in maps
To: Bjorn Helgaas <helgaas@kernel.org>
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
References: <20260309210849.GA591344@bhelgaas>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260309210849.GA591344@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: s8LkjOSvBluDcKPH4mbOYfwH_zPpL2kB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5MiBTYWx0ZWRfX3+xzSZxwsi80
 qThXixDUk/nr6cretSgMneOzaxu3oET3JiXdwf7RsN2KVFYoIes3ilU/C1HCEVVcBd6jQ55w+BQ
 JK6amyhGDXDanHzwfQajk0kqPwm4Hcac03BwAY/pOIgZ7pfeCbqAOA1EhB4A7eZNhaJoUeO1nz0
 LhFgMyfob2Pl1/7fzcg6CX9PtdlMsVUGptpfs+nOs75nnDb0PqzuIXN1ikbLRTM5PenYs8xu6MV
 UvUyKentjP8ZwHWtWC2WaOXpJxjmIku2+OfUi2lnkKvhl5uCJkBNAEnYQQXwBZrrwv5/FXy2UJC
 P0gRVrBRhXCwsWwRZlD0lfJAHSUuR1gqvOJzvlsgQEJJzKanVc461SeBvK5iIZ1JWhRNUyvNEd9
 v6rff0QKS/Y9ckmQSetj1wq6RtZGW6284aG3oUGv49aWdEUm5GQeI4uOxuLONJCcOJmlz6f1NZR
 jYrDLtqdd6bau+lFSqQ==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b2a6c0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=FuYIH7Xx0xzBSkYrynBYgw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=2oAOsZZM3GA0Nya8fkwA:9 a=QEXdDO2ut3YA:10 a=d1F_yjlUjjEA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: s8LkjOSvBluDcKPH4mbOYfwH_zPpL2kB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120092
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
	TAGGED_FROM(0.00)[bounces-97192-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
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
X-Rspamd-Queue-Id: 7C1642713C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/10/2026 2:38 AM, Bjorn Helgaas wrote:
> On Mon, Mar 09, 2026 at 01:03:39AM +0530, Vijayanand Jitta wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> So far our parsing of {iommu,msi}-map properites has always blindly
> 
> s/properites/properties/

sure , will update.

Thanks,
Vijay

