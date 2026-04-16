Return-Path: <linux-arm-msm+bounces-103332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDvgNg1X4GnyfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 05:27:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B6F409F03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 05:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0069B30B8248
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 03:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA242D5923;
	Thu, 16 Apr 2026 03:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWY9Qd3W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HX918G9n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D70A2D12EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776310003; cv=none; b=cUN+MFstU7Yk4+Yh7/BZPXovkhOo4H9ibodMhXMNKBCQ4DeVMX1NEVj2QSxW9dmhRMqPOv4oKk3DtANmpU30t16hXiT+YMfpdq1SaRj0EG+OrKO3nnqSDPct+f5tso+PQ0hVRXZSXyvOVAmvpS7r5JnuNk1h6qceyZA51yYRmlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776310003; c=relaxed/simple;
	bh=YeNLm5HD9pelPvBZyoqENV0LIXfXT18gRjN/gUVw054=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UwCDK42fM/Ap2S5kDGy9Y/yw155hUgN1kuP8CCMZsU/iM13EtAKdPTXcB1L75Xkql9wLqx+X1M3ptGt7q7lnmA6IN0Tf+pe9IEl1zHQtDPUX6pPE+03gKL/ZtCXnc9njJO6nXAN2Wh2/7HinqRDkkvXR+71LxwYPbT3sJ6b+qOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWY9Qd3W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HX918G9n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G2KMYr1702344
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vDK6pAlGwxYE897uZGp1sSM8FaPwo0OHKjiLMvDJlSM=; b=SWY9Qd3WKivoaF5z
	JCNUWFn6lHYDHyOuTykCB5IdRbNsUrvJXHcbkMpoXZzEFaGmmiVh4/iNs5m2m3/d
	1ctBxyEGpnQhAu31duNagl7MvxO6Dphq86jgT8s1bddtRVBYt5aiZvC0Q06xHb4f
	pJ5mQ251/oFa31hOjocFi81oL7nTanhTsaxGMhiRvRj3+79HdoaaaOzK6DQpIlj8
	DMKRTns25lEdApCluihx1mohx8vnRlScMBm04DII0VQ2demD5TuPnhQ0Qu4l9aQk
	+r4A6uDr4avQHRyxxypoO1lgUgcJ9ZoXxMNexwA1OoF0Yg1Uo5d1Y4vVKNY0rEpu
	3CT5jQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamhyu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:26:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f2478c37bso6176812b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 20:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776310000; x=1776914800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vDK6pAlGwxYE897uZGp1sSM8FaPwo0OHKjiLMvDJlSM=;
        b=HX918G9nZ6i2DfnyWHnPIiEQYhY3c78JF7SEhBCWi2ExnpBBUr4hTYI+trTWA0avXp
         NeEi37Fc+mBAbjgx5OPiHsMwzq9z21GrTudWrwnZE3vI3OhVLezXuwW0+gb/dyyhXnAP
         +kWRo2fCETpronsRCIssOOBdOT7GHMAtQdhW/mOEJBvznZy8xx3Wd/vS3mk3hvj3bih9
         RmUpAzp70Xk+YOB77Bo4tTnQLd5kufbkFxqe5pXuohlrVMlRQWrEVJrvBEn7oPXr3Hyk
         0Yo4uCEW75RvssIMMS9DYjGDCPuY4+79BpYbaq0tzqz9bc6Pqy2BFonfh1pxlKVNTmdo
         3GeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776310000; x=1776914800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDK6pAlGwxYE897uZGp1sSM8FaPwo0OHKjiLMvDJlSM=;
        b=jkwUqK7cCCugOCItuta6Pjh+LKb87yEUmP9pI26L2GVLvwrwhVUmzwb7TuRFVY5S1V
         3tfiNuOdDElZafvZ8+EBMrodDVT8JwuEXntDWuWCfYoXMlN35Jme8iCtO/TCgdZUlEhA
         oCE4j+9xHaZj8xP6mbb/z5eo8gwkbmWXJOSqs/aylNZCReUlbVUD5wJrIxSLIphLyzFJ
         aza6VmRZgSHJtsBVAXUDu82JwEMKhfuoSP5azvW8Cm4Pp1+wH8JiSypv37NEMTo1fooH
         PVF6IgZ+221G3zdTb9L2SYjkQDmIQFwqHvxnuzt/NtAJPGT81aQgVeGMIlbd5uvVtqtn
         pfTw==
X-Forwarded-Encrypted: i=1; AFNElJ9YAHJDJK/Z5GvFEO0w7h/PKayiTCOPz8b/t2LGlJJIRPs/OoTu7I3p9Alht+LcYcmaE2ERlQBb1MTFxK+w@vger.kernel.org
X-Gm-Message-State: AOJu0YwN8+KsbpsQi+QB0PVteaoRoeElgx5oLcskocB10XIyDhK5Fcsk
	7wAz5if9Wpabr7BNjEJRsm+O/ElkngNK5kz5OUGGtQIW5y1TEmOzNEGelORZlYHsSyl6Pv7gJ5G
	+dvGg9wOBAtR/PU+F5yvwCK6RwzlmPwP4iuO+2LeuwXzYMcDJR88gcPXy2bvhpIxc8+A2
X-Gm-Gg: AeBDieu6+7UvA+laExtQ+1vUlH7p1/LuPNJ7FtrXvF2EvyWPSLORbtR2K0EpYq2TlAD
	zsgaZ1DiyeygsPWYAToMNDJbai6O3UgH//YBARitpKo33GUxjGOxyfptIjDEBjywosvnWpMvXz/
	/EZB254GI2fyK8h8tR/DIOJhHmeu7y+znp11DfTgJCs4rD7YPRJ9wK81EBFFW1cW/BQHgdqfFB8
	0QQagHttmeX7/CijRU0a/8zUiC4EpgC13PL+tgGQ4vFKhBqfWlu9oNYeY/bwfTnU+F2iqBqwt5b
	ZREutxm8SDdq7cyKrP88RPL+zYBV7f5nr5M/S5tzVE50g7+09pP6/MZiT2VD+CbaKyC3RXwyqld
	CxkZUINQe4n+9bHHZXrTX7tCQkkKOWnDSPItXAvGQvswPCtSB7lb/eGVY
X-Received: by 2002:a05:6a00:3924:b0:82c:77cd:50e8 with SMTP id d2e1a72fcca58-82f0c30f593mr23470666b3a.27.1776309999714;
        Wed, 15 Apr 2026 20:26:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:3924:b0:82c:77cd:50e8 with SMTP id d2e1a72fcca58-82f0c30f593mr23470629b3a.27.1776309999089;
        Wed, 15 Apr 2026 20:26:39 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6707b6b8sm4265094b3a.22.2026.04.15.20.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 20:26:38 -0700 (PDT)
Message-ID: <555b2695-1feb-482b-aec2-d6f3f2b2ef0e@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 08:56:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/3] of: Respect #{iommu,msi}-cells in maps
To: Nipun Gupta <nipun.gupta@amd.com>,
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
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260408-parse_iommu_cells-v13-0-fa921e92661b@oss.qualcomm.com>
 <20260408-parse_iommu_cells-v13-3-fa921e92661b@oss.qualcomm.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260408-parse_iommu_cells-v13-3-fa921e92661b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rnC9mIpCF4pEzcEjnTmCPVnB5d3J5rff
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e056f1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=OsyBWCJeBE2wmg0BnjgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: rnC9mIpCF4pEzcEjnTmCPVnB5d3J5rff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAyOSBTYWx0ZWRfX0yoK0XIrJSJf
 SyHxInjo+E0d6HmiS5hpf+h8O7Xq7yS1btbojZWOQDBLDpByfIuTaQi5gSStwfLDCKKXC0+ZkH5
 wgM0vWtr/6ZMMPPjdzSxL99JHmp0OXSpALxi5AHbPYjDsMpc2vH//YlAv9hMYhRa/W3Mta41vdZ
 238zf42WufMVMjv3M1wEzWY7hlNFckERvv07iXDSru6922T/rCjrvK65y1quNlAzxYDP7AjF7Z8
 1MPSEU8Z/q8RLEJzb8P7GdwgmC0jwnmsbQvrKfrcBxqy447DQncB+ZFGCv3r06Q3H3VH3UYEDJ1
 io7+e8xMw2+y5vxeFnhuOpX/ZIaJj0uTNbMhbN51eXC7SfCHo5v5rCGi3aqKVu6vy/WypTVaj56
 lvvW4tzSqfYlln+RC+lrU9XdnNuthothrFGCXndgAd5Uc2Zko90VgZ6ZAu6esPk7JvQH1BbeMaf
 61yDqJQLiYhlvlZelGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160029
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103332-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	ASN_FAIL(0.00)[114.105.105.172.asn.rspamd.com:server fail];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A0B6F409F03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/8/2026 3:33 PM, Vijayanand Jitta wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> So far our parsing of {iommu,msi}-map properties has always blindly
> assumed that the output specifiers will always have exactly 1 cell.
> This typically does happen to be the case, but is not actually enforced
> (and the PCI msi-map binding even explicitly states support for 0 or 1
> cells) - as a result we've now ended up with dodgy DTs out in the field
> which depend on this behaviour to map a 1-cell specifier for a 2-cell
> provider, despite that being bogus per the bindings themselves.
> 
> Since there is some potential use in being able to map at least single
> input IDs to multi-cell output specifiers (and properly support 0-cell
> outputs as well), add support for properly parsing and using the target
> nodes' #cells values, albeit with the unfortunate complication of still
> having to work around expectations of the old behaviour too.
> 
> Since there are multi-cell output specifiers, the callers of of_map_id()
> may need to get the exact cell output value for further processing.
> Update of_map_id() to set args_count in the output to reflect the actual
> number of output specifier cells.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/of/base.c  | 157 +++++++++++++++++++++++++++++++++++++++++------------
>  include/linux/of.h |   6 +-
>  2 files changed, 125 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index b3d002015192..2554e4f1a181 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2096,18 +2096,48 @@ int of_find_last_cache_level(unsigned int cpu)
>  	return cache_level;
>  }
>  
> +/*
> + * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
> + * specifying only 1 cell. Fortunately they all consist of value '1'
> + * as the 2nd cell entry with the same target, so check for that pattern.
> + *
> + * Example:
> + *	IOMMU node:
> + *		#iommu-cells = <2>;
> + *
> + *	Device node:
> + *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
> + *			    <0x0100 &smmu 0x0100 0x1>;
> + */
> +static bool of_check_bad_map(const __be32 *map, int len)
> +{
> +	__be32 phandle = map[1];
> +
> +	if (len % 4)
> +		return false;
> +	for (int i = 0; i < len; i += 4) {
> +		if (map[i + 1] != phandle || map[i + 3] != cpu_to_be32(1))
> +			return false;
> +	}
> +	return true;
> +}
> +
>  /**
>   * of_map_id - Translate an ID through a downstream mapping.
>   * @np: root complex device node.
>   * @id: device ID to map.
>   * @map_name: property name of the map to use.
> + * @cells_name: property name of target specifier cells.
>   * @map_mask_name: optional property name of the mask to use.
>   * @filter_np: optional device node to filter matches by, or NULL to match any.
>   *	If non-NULL, only map entries targeting this node will be matched.
>   * @arg: pointer to a &struct of_phandle_args for the result. On success,
> - *	@arg->args[0] will contain the translated ID. If a map entry was
> - *	matched, @arg->np will be set to the target node with a reference
> - *	held that the caller must release with of_node_put().
> + *	@arg->args_count will be set to the number of output specifier cells
> + *	as defined by @cells_name in the target node, and
> + *	@arg->args[0..args_count-1] will contain the translated output
> + *	specifier values. If a map entry was matched, @arg->np will be set
> + *	to the target node with a reference held that the caller must release
> + *	with of_node_put().
>   *
>   * Given a device ID, look up the appropriate implementation-defined
>   * platform ID and/or the target device which receives transactions on that
> @@ -2116,17 +2146,19 @@ int of_find_last_cache_level(unsigned int cpu)
>   * Return: 0 on success or a standard error code on failure.
>   */
>  int of_map_id(const struct device_node *np, u32 id,
> -	       const char *map_name, const char *map_mask_name,
> +	       const char *map_name, const char *cells_name,
> +	       const char *map_mask_name,
>  	       const struct device_node *filter_np, struct of_phandle_args *arg)
>  {
>  	u32 map_mask, masked_id;
> -	int map_len;
> +	int map_bytes, map_len, offset = 0;
> +	bool bad_map = false;
>  	const __be32 *map = NULL;
>  
>  	if (!np || !map_name || !arg)
>  		return -EINVAL;
>  
> -	map = of_get_property(np, map_name, &map_len);
> +	map = of_get_property(np, map_name, &map_bytes);
>  	if (!map) {
>  		if (filter_np)
>  			return -ENODEV;
> @@ -2136,11 +2168,9 @@ int of_map_id(const struct device_node *np, u32 id,
>  		return 0;
>  	}
>  
> -	if (!map_len || map_len % (4 * sizeof(*map))) {
> -		pr_err("%pOF: Error: Bad %s length: %d\n", np,
> -			map_name, map_len);
> -		return -EINVAL;
> -	}
> +	if (map_bytes % sizeof(*map))
> +		goto err_map_len;
> +	map_len = map_bytes / sizeof(*map);
>  
>  	/* The default is to select all bits. */
>  	map_mask = 0xffffffff;
> @@ -2153,39 +2183,84 @@ int of_map_id(const struct device_node *np, u32 id,
>  		of_property_read_u32(np, map_mask_name, &map_mask);
>  
>  	masked_id = map_mask & id;
> -	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
> +
> +	while (offset < map_len) {
>  		struct device_node *phandle_node;
> -		u32 id_base = be32_to_cpup(map + 0);
> -		u32 phandle = be32_to_cpup(map + 1);
> -		u32 out_base = be32_to_cpup(map + 2);
> -		u32 id_len = be32_to_cpup(map + 3);
> +		u32 id_base, phandle, id_len, id_off, cells = 0;
> +		const __be32 *out_base;
> +
> +		if (map_len - offset < 2)
> +			goto err_map_len;
> +
> +		id_base = be32_to_cpup(map + offset);
>  
>  		if (id_base & ~map_mask) {
> -			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
> -				np, map_name, map_name,
> -				map_mask, id_base);
> +			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
> +			       np, map_name, map_mask_name, map_mask, id_base);
>  			return -EFAULT;
>  		}
>  
> -		if (masked_id < id_base || masked_id >= id_base + id_len)
> -			continue;
> -
> +		phandle = be32_to_cpup(map + offset + 1);
>  		phandle_node = of_find_node_by_phandle(phandle);
>  		if (!phandle_node)
>  			return -ENODEV;
>  
> +		if (bad_map) {
> +			cells = 1;
> +		} else if (of_property_read_u32(phandle_node, cells_name, &cells)) {
> +			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
> +			of_node_put(phandle_node);
> +			return -EINVAL;
> +		}
> +
> +		if (map_len - offset < 3 + cells) {
> +			of_node_put(phandle_node);
> +			goto err_map_len;
> +		}
> +
> +		if (offset == 0 && cells == 2) {
> +			bad_map = of_check_bad_map(map, map_len);
> +			if (bad_map) {
> +				pr_warn_once("%pOF: %s mismatches target %s, assuming extra cell of 0\n",
> +					     np, map_name, cells_name);
> +				cells = 1;
> +			}
> +		}
> +
> +		out_base = map + offset + 2;
> +		offset += 3 + cells;
> +
> +		id_len = be32_to_cpup(map + offset - 1);
> +		if (id_len > 1 && cells > 1) {
> +			/*
> +			 * With 1 output cell we reasonably assume its value
> +			 * has a linear relationship to the input; with more,
> +			 * we'd need help from the provider to know what to do.
> +			 */
> +			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
> +			       np, map_name, id_len, cells);
> +			of_node_put(phandle_node);
> +			return -EINVAL;
> +		}
> +		id_off = masked_id - id_base;
> +		if (masked_id < id_base || id_off >= id_len) {
> +			of_node_put(phandle_node);
> +			continue;
> +		}
> +
>  		if (filter_np && filter_np != phandle_node) {
>  			of_node_put(phandle_node);
>  			continue;
>  		}
>  
>  		arg->np = phandle_node;
> -		arg->args[0] = masked_id - id_base + out_base;
> -		arg->args_count = 1;
> +		for (int i = 0; i < cells; i++)
> +			arg->args[i] = id_off + be32_to_cpu(out_base[i]);
> +		arg->args_count = cells;
>  
>  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
> -			np, map_name, map_mask, id_base, out_base,
> -			id_len, id, masked_id - id_base + out_base);
> +			np, map_name, map_mask, id_base, be32_to_cpup(out_base),
> +			id_len, id, id_off + be32_to_cpup(out_base));
>  		return 0;
>  	}
>  
> @@ -2196,6 +2271,10 @@ int of_map_id(const struct device_node *np, u32 id,
>  	arg->args[0] = id;
>  	arg->args_count = 1;
>  	return 0;
> +
> +err_map_len:
> +	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
> +	return -EINVAL;
>  }
>  EXPORT_SYMBOL_GPL(of_map_id);
>  
> @@ -2205,18 +2284,21 @@ EXPORT_SYMBOL_GPL(of_map_id);
>   * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
>   *      stream/device ID) used as the lookup key in the iommu-map table.
>   * @arg: pointer to a &struct of_phandle_args for the result. On success,
> - *	@arg->args[0] contains the translated ID. If a map entry was matched,
> - *	@arg->np holds a reference to the target node that the caller must
> - *	release with of_node_put().
> + *	@arg->args_count will be set to the number of output specifier cells
> + *	and @arg->args[0..args_count-1] will contain the translated output
> + *	specifier values. If a map entry was matched, @arg->np holds a
> + *	reference to the target node that the caller must release with
> + *	of_node_put().
>   *
> - * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
> + * Convenience wrapper around of_map_id() using "iommu-map", "#iommu-cells",
> + * and "iommu-map-mask".
>   *
>   * Return: 0 on success or a standard error code on failure.
>   */
>  int of_map_iommu_id(const struct device_node *np, u32 id,
>  		    struct of_phandle_args *arg)
>  {
> -	return of_map_id(np, id, "iommu-map", "iommu-map-mask", NULL, arg);
> +	return of_map_id(np, id, "iommu-map", "#iommu-cells", "iommu-map-mask", NULL, arg);
>  }
>  EXPORT_SYMBOL_GPL(of_map_iommu_id);
>  
> @@ -2229,17 +2311,20 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
>   *	to match any. If non-NULL, only map entries targeting this node will
>   *	be matched.
>   * @arg: pointer to a &struct of_phandle_args for the result. On success,
> - *	@arg->args[0] contains the translated ID. If a map entry was matched,
> - *	@arg->np holds a reference to the target node that the caller must
> - *	release with of_node_put().
> + *	@arg->args_count will be set to the number of output specifier cells
> + *	and @arg->args[0..args_count-1] will contain the translated output
> + *	specifier values. If a map entry was matched, @arg->np holds a
> + *	reference to the target node that the caller must release with
> + *	of_node_put().
>   *
> - * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
> + * Convenience wrapper around of_map_id() using "msi-map", "#msi-cells",
> + * and "msi-map-mask".
>   *
>   * Return: 0 on success or a standard error code on failure.
>   */
>  int of_map_msi_id(const struct device_node *np, u32 id,
>  		  const struct device_node *filter_np, struct of_phandle_args *arg)
>  {
> -	return of_map_id(np, id, "msi-map", "msi-map-mask", filter_np, arg);
> +	return of_map_id(np, id, "msi-map", "#msi-cells", "msi-map-mask", filter_np, arg);
>  }
>  EXPORT_SYMBOL_GPL(of_map_msi_id);
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 8548cd9eb4f1..51ac8539f2c3 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -462,7 +462,8 @@ const char *of_prop_next_string(const struct property *prop, const char *cur);
>  bool of_console_check(const struct device_node *dn, char *name, int index);
>  
>  int of_map_id(const struct device_node *np, u32 id,
> -	       const char *map_name, const char *map_mask_name,
> +	       const char *map_name, const char *cells_name,
> +	       const char *map_mask_name,
>  	       const struct device_node *filter_np, struct of_phandle_args *arg);
>  
>  int of_map_iommu_id(const struct device_node *np, u32 id,
> @@ -934,7 +935,8 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
>  }
>  
>  static inline int of_map_id(const struct device_node *np, u32 id,
> -			     const char *map_name, const char *map_mask_name,
> +			     const char *map_name, const char *cells_name,
> +			     const char *map_mask_name,
>  			     const struct device_node *filter_np,
>  			     struct of_phandle_args *arg)
>  {
> 

Gentle ping.

Thanks,
Vijay

