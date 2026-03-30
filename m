Return-Path: <linux-arm-msm+bounces-100664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJd8MiUKymmL4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 07:29:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4179535588B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 07:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42D7830068F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 05:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91A23815F9;
	Mon, 30 Mar 2026 05:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5lCeoyS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UaSiGMIs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73D029ACDD
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848539; cv=none; b=KuX3s63RBAtoLoursCfeompo/R5ZfR7e1AC82p/nb7negubcZHulG7S62YZzVCbNGvk1w9QJK6bIANWGrNGLv5smE/yx8qGisJEJI0ARWscHeKj1EhP1xD0xAgkj56YODqaJONAbPllPXUf5AkV9BGrvNYcaNTTI0jf5vxdcDy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848539; c=relaxed/simple;
	bh=Oqnfe1B7pgXZGMnxOjT9IdortdmUJNYX97ief7kKKuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pN1gGpIaD/g9fn7rYQkEAv0hBpV+JCFcAHxQDBo1ddy2funfGzQqLPAjBjx3iUrZ4VHre8pWM+X9FI66aNbgmIB+CmGaB59VNQ6AAIM3Lnst0chaE3/tPo9CuyqNBN5bbqtEHbCde8A3zMDwDZN+jpEvzza4kH0GW5ZoFPwCWpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5lCeoyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UaSiGMIs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4LHxi865969
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	20GNW5it+X2su5CUYneKv8hJ0SfE9B5LXD06+2GpUP4=; b=g5lCeoySpJ6p+RGZ
	xk5oP67iwVMc1hZO7Zph4sopamh8o7qo1u0ZHjXuRWpQVOcxa63+QEavAACHGdlt
	TbYQqLRmK23SAtatcXsAjoX03lT0H338vBOnzvt54beJK4OyH6ZHPNBYizKdHa8s
	QJ3PkYO7pQf3qPip/ZfTTGSP864jYNeAjMDha+s/uyaTJYAYz4UlQfRoCkcN3PvK
	Zz1EVi7IwrRGOQw+dI4DEMElxbrc7zeT/XeBpq4RZ5QE2AVizqtYdjT4SUn2gLSU
	PaYNuvCEwg0bXAOiCM9+2/ZdDXUN54ouW+auflLfMi8Tif+oG/ITyMi6LUtpbbho
	TZuShg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hcf5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:28:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a782029b7so3125701b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 22:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774848537; x=1775453337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20GNW5it+X2su5CUYneKv8hJ0SfE9B5LXD06+2GpUP4=;
        b=UaSiGMIshcosvF9R5288wyE2GKxGSH7kh3jjTz0dhtvuSFU2LkZaFokyPPW0IgciIV
         3uezwJ164dUiAbI27SEie0nqoOzvD79uIDPv0X9eZ+g3Vb+1R547VWG+RF5eh8/89uOb
         NxDiKRQKMMUWRYcY5jbOedorsXJ3eAJyIQFV0DHAqPSAvXK3RX3owvSbptw/S+U2TrZV
         mN0P2ilC4lsT1etYIR3WfG2vNpSLLRT1CaXw9G40WeTzGEN05x4HcE6+wovQd8b1GELe
         UDQGzRrmrS+sh2dVdDltcJ5EY/Iopg257T+ynH+ghtgglx2QRBFLawNTA1/xKBrAVRG7
         eGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774848537; x=1775453337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20GNW5it+X2su5CUYneKv8hJ0SfE9B5LXD06+2GpUP4=;
        b=WHK+BOakaCA9N+RfZkdBKsF683vVVrt6BD6h8MXcnlvaj5/ZZ0hTvbB0lKoEccFbRR
         vU+sstPnrJmlaVj0YGE/lczzZpe2t1DOV+XA1aECDneW5e6cDy3gyl3ZoA6DT3m3YOXG
         KzYkbONivemWyFCplkLIuTT2qHYiPKgThiBlkoVzs2q1SCRdaep0oMbtspgFL5WwETNE
         XEMkIPv8IVRS+0PvvAiGss//aWiDbs90HiFJNtGO+0svb+EyMzXK/KZFL40QFzowxlG8
         xcDimlu17wJa2m//KAubQ6R28OCH7sSDi+7Fs+G+UVMJAJcCAgev2BFO7mHoMwJOGDty
         lkpg==
X-Forwarded-Encrypted: i=1; AJvYcCWj1x5bntV2g6LdCMS54KtYKc+vBQIpMKDaKWI/RYbKYqwdOUqEKnyNAl9UkzAwfCQ5mJYxg/v5IBUx+TvM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Kek1HhAxJCaKcFanx3fd+dBa11wiiIPkv0imKP14+WaGrbMt
	L2Btn9ZBbdC5M7T1Jpy6NJy8ByXCQD7OQRNPmp5Tr0q2hwjQlOjvA+qx5vsD+hxLxlB4H2hHQKP
	v0N+J/RPRFn37iLl8PmRnCkQtrKcn/zRXJUlbAXIoRlUiPpdaWhmWXSmm1AGatsWqtu0R
X-Gm-Gg: ATEYQzzmIowNmESt6PO5U7mFYbLQIr6RetpXVS9d9eBgZglAm7CxWZRrmPaQCZDo/A6
	oLwO21VOcl0mMwOdLt4Kp+ZKz0EqioMUQ1jXcSikNAxznT387AcjfZlxrxLrbiR9Ooe8++2f/ZB
	PlnrqVUTAIxD9/bgTgNdXY7g/GM96bvVQbkvLQBISF+CqkkMm1+2J5BEc6x3OPzzTohx0BN4jKw
	g9ao0Vbm36XQr6KSK5quLQXnbSzSp74kKs6x+jSKSIM+HTYYEiJMiePmPK03fBHMZ8Hkf7gLfnb
	TeRUAtEgcePfY6TZm90p+OxFp9e4RiQRy4kWPz3eiF71vej3cX+AIK2iWHMLOjEg2z8FxoGDkCG
	g+Lz8wyxqZqVuFu6OhKWiEbNvx5KyAs3IezQQU1b1AL2Dy1yRKpQ=
X-Received: by 2002:a05:6a00:438a:b0:801:eee2:45b6 with SMTP id d2e1a72fcca58-82c95e7c457mr9909611b3a.24.1774848537578;
        Sun, 29 Mar 2026 22:28:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:438a:b0:801:eee2:45b6 with SMTP id d2e1a72fcca58-82c95e7c457mr9909565b3a.24.1774848536921;
        Sun, 29 Mar 2026 22:28:56 -0700 (PDT)
Received: from [10.217.219.124] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8465785sm7263307b3a.18.2026.03.29.22.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 22:28:56 -0700 (PDT)
Message-ID: <d98d21a9-b355-45a8-a8c0-a0659792e76b@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:58:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dmaengine: Add multi-buffer support in single DMA
 transfer
To: Vinod Koul <vkoul@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan
 <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-pci@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20260313-dma_multi_sg-v1-0-8fabb0d1a759@oss.qualcomm.com>
 <20260313-dma_multi_sg-v1-1-8fabb0d1a759@oss.qualcomm.com>
 <abkyyBxSnwZWAt4-@vaman>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <abkyyBxSnwZWAt4-@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69ca0a1a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=kGe3cHaNJUDbgVJfyvsA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzOSBTYWx0ZWRfX9qtP2pJ1nO5d
 8xqJRK9c0xwcSd+6xduIyGfPMH5n6QvzFTtXkNdDSVoYyPfcovxZqn8kgu+QRrVxwZUy2VMFpeL
 Dw6qbp4VcIABxZkRyeMH5Ehb+wlrO6DKu5ftBoweldmndvVTtkfBvgJ2lSLxuOE3dJ5RoPLRtld
 hC1M6MqZ+wbhi3J/1Gx94+nzoMo3QL+voz0jI/jQzF9P0RgHp125ouVmx0dTUdLeNilMVeyWFX4
 KmC9wZH2XQMhYCHUvh8KNd7j3R9KcgaUmM68KnVSfePFeW1jECtbUiXYZceTH2SX4CbD5bkWO+I
 b70NN4iO/l5h63Jg+gAMaYp2bevfy4tU6mqc6RlYQQ8tb4oArD8bSenMDPgIDMtKPKJdtLPYkC2
 S49bj+n08NeksX24w/5vfbHwG1sd1pM1P2Y0mtwAo49klB4KGlt4h3O1ZZ8WmruWu4BitMCHTLk
 R8G446iIH1TXMexQz8A==
X-Proofpoint-ORIG-GUID: dwxxoxxZDn-ZhxMEP82HqRmQL6_d5iW4
X-Proofpoint-GUID: dwxxoxxZDn-ZhxMEP82HqRmQL6_d5iW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300039
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100664-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4179535588B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 4:24 PM, Vinod Koul wrote:
> On 13-03-26, 12:19, Sumit Kumar wrote:
>> Add dmaengine_prep_batch_sg API for batching multiple independent buffers
>> in a single DMA transaction. Each scatter-gather entry specifies both
>> source and destination addresses. This allows multiple non-contiguous
> Looks like you want to bring back dmaengine_prep_dma_sg() see commit c678fa66341c
I was not aware about this commit, I will bring back this change (only 
the core dma part).
Along with my changes was are integrated with the above commit.
>> memory regions to be transferred in a single DMA transaction instead of
>> separate operations, significantly reducing submission overhead and
>> interrupt overhead.
>>
>> Extends struct scatterlist with optional dma_dst_address field
>> and implements support in dw-edma driver.
> If this is memcpy why are you talking about dma_dst_address which is a
> slave field?
As we are going back with the commit c678fa66341c we can ignore the 
current patch.

- Sumit

