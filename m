Return-Path: <linux-arm-msm+bounces-97952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHZhKOX9t2nrXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:56:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1246E299B28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51A5E300EF9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AD93921E3;
	Mon, 16 Mar 2026 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F4UihmPO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVhTTcWs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB0223E358
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665705; cv=none; b=tXtKLRr/EnLMkqk6lHnKK/mClWX5yV1dPBMQgyuKgZJM399bX91YLONDZWKQyQ5gFzXtu8xtNAq9P1E7f46GSMNYjKehFIz5yt3Mw4fsMcQpYSz4Uk9Yz96k/emFPfpY0FwMydb+zCJFp5auvVQOgCAnUhT046EgkkxfDFinOwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665705; c=relaxed/simple;
	bh=F6DK2jy+l8W/nYAKDa2gBr3eqj8AjxCZesPqmOI0BEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASSVasLPyMkqV+UdkqvEKbfproLZVd5VqbRv/t8LBuAAdvPHZ56lQEU9I2ZKDjFh/y8hli7WzzikUDMfLICVrh3iP7xhJqlXQC7CaIvqouxY3nZXIGtBTG2qmC6mxL+t9B/VQjL0zlk6SI6EZ2AZMba2/KNIyDM+f8UhB76WqfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4UihmPO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVhTTcWs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBoV8O538850
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VRUsRyIzyqkG+BjxjJ92JiWI
	4JOCpnSec8N4yJLoueE=; b=F4UihmPOWs27xmxIXRWJT4iBf8KOnvLfkZQ+H8ZK
	RZ10gMPFJ7lXKtJOiTmFfIYUSG3FD9W+mQBboypURuLfLsHAVUfN8cywB2ZN5Rhb
	4pVs/ETQgx9ZqOVcCZnE9Q/luf7F4Rl1N3AVckRm/0MEs2ObYap5+CSDiuY1CVgo
	mQx4QNCYQ9wUFfBDfKenEK4qFa0hGKWRrwtpuEsl0wdFPVDcPnUB/D/fyGhUwrCZ
	KORCr27w7pIuvzgwc3iiAcWykWTegd1o+E94QKU8ewFwe957af7Qc3OONZJvWMSd
	RzDJgZC8ytVd7a99iGjYLMMODyVeylhvCClxzANWKaI9ig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5ns0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:55:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7a25c5a9so11136385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773665703; x=1774270503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VRUsRyIzyqkG+BjxjJ92JiWI4JOCpnSec8N4yJLoueE=;
        b=XVhTTcWsLPeLYUfm/Zq5L49nplKI2gGKQiRrdDyFIGyczTMy5dkVa4EHUNn2W8s/Ko
         LtYuYV9JYwbOwI59r+O/1SikcnxbpNRKbTz70BNyPUhAC4uPb0nSTiNg7g2zK2yxYe2h
         R8M6prwVcws1KpGu8zhQ94FtHW4p7XDlhArzK63gTug0wD1VZfmv+ZoGZC5ZL06IubRb
         qsKiiCqWy4AqC33ZylsjY1WjzDuVGNyxYiJMfZ7dqVIvAPVflm2Fwm/ksN2yuh9XpHwA
         TvljnJlqKIL8zSb/lc0Aod9RZVWkZvuRzv82EvLKS5pMH8ZwKOR9zttw6JI21DRKWr0J
         l/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773665703; x=1774270503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRUsRyIzyqkG+BjxjJ92JiWI4JOCpnSec8N4yJLoueE=;
        b=K/RPNeJTxCOGrCzGxqPcI614bknzspleiCa3UhTBCnwKMwBsu6yb+2HDfnFtAfiXN0
         2KXR3NJGU5z0gaM4tNyTvE3NsS5VxChlQUW8xpFD6/Xv4DTKhU36bzFfyLjP1xLuLJGv
         JG6BV/zRHyvl0eJBPh6Y4Mk4onQxL3SHncyB5eIKo8UEakmfPgcgby4NMSEdAgY2vc4Z
         MB9x2JEINrcSWJwrxtHuODVvStOpwPvjz1YoWXRfhSwaZC+amw3O37kzwQ1F5cCOyg9E
         fvj6+B6C9cLdxZAAC0l8xbqA+tL1jkckS1cTPIcsDIX3qQcmFTDUZmcfNR8F/khGtc6g
         WziQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfOcDEBVbuGhjkqSXRtCN00+NwPaKaSoKKcgj1tPZGe+yDZqkgGawKWlUu7XEy1cyeHM/uQhiKCY8nvdaG@vger.kernel.org
X-Gm-Message-State: AOJu0YxAFafqbt6QQe2UltepUXBTtZoYvxgrgSsO9UL2Z1t1/LcuODca
	ifmsxIddhRpClgN5SMBbNFszLpXUsDQVdFAwZSVWGyUOxQ/T6AEUr10rY0KIqSnDT4SJmAheP6M
	vOAfTvCi+H7aSYpIojFL0z5XmvOEXauZw94rm5MZrpF7lVN/vWsURyNC49dMZEJJtW/zq
X-Gm-Gg: ATEYQzyvGYILIXxVbrRkWhPX/igg0ipwkLCTx8jzHccvIrgTzz0eX/loabRj3li4xYB
	txEe9dgMRHFsa2Z7gZ8E9dq65M6hPgYI7C3Gktc5rKSz3eFf/Qmo+C/s9FR3jtaBnwBtJsfRDr+
	l/tseKXqDtNayTD6lD6L20D17DqFTb7PBM+un3vfqbjhTbhJgWv3gfP5ZN6AArHtwj4K8lO6UJ8
	uleJVm95mJZN3GLRXrX2u5C0BleqtO+kzq7uvfrDQ+UFJlICuLtIOn99puAoaQ8cprnDOoiee4u
	Ut1PiO187Q/JhSTguHj4ZVYLvmz921oApFCOmgOGoadkz8pGjS34Ia7T9x45LRRiPbPaGV8Jn5e
	imkMdtxyZRFz2A8HQw30uzSCKnnBN9DCIvqyZOtuomow4MMEe0ezyaYvoKQ/HQXcIqm6cKJwlKK
	4A6nwHYxoJg2LCCLzdqUWl1Kz7LIdOS0L9qbM=
X-Received: by 2002:a05:620a:4609:b0:8cd:8a55:510d with SMTP id af79cd13be357-8cdb5b1b198mr1730430885a.48.1773665703078;
        Mon, 16 Mar 2026 05:55:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:8cd:8a55:510d with SMTP id af79cd13be357-8cdb5b1b198mr1730426385a.48.1773665702684;
        Mon, 16 Mar 2026 05:55:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e156sm3515043e87.20.2026.03.16.05.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:55:01 -0700 (PDT)
Date: Mon, 16 Mar 2026 14:55:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm Eliza basic resource
 providers
Message-ID: <zjaox3nw5qrptt4pvg7mlpwam6ij63hifx3dqhddfdjw2p7bky@wlk5tuni4uam>
References: <20260316-arm64-defconfig-enable-eliza-basic-providers-v1-1-7ae581670aa8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-arm64-defconfig-enable-eliza-basic-providers-v1-1-7ae581670aa8@oss.qualcomm.com>
X-Proofpoint-GUID: CNO5dK1gk7Mrk_T0X-DY9XJSZtSwTKlz
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7fda8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=FeTImC2-3NWs4XFU_OEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: CNO5dK1gk7Mrk_T0X-DY9XJSZtSwTKlz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5OCBTYWx0ZWRfXzD01rOepXCkK
 o8XkWK7qODNK2KdjPmIKYRWjZu0uXae9kROt5+Qlw9zkXWJbiGhIMvRfY54yByxz4AARu/mYlOD
 VmZbmNh35aynXEglGWTEoqMhKBa6vHzPAH01vPb6Ua2oogO/GUzZCHPyoOK/6g26RvKld4FCap3
 BadfjRfz461p/G6dmU7GWeSAk31QmFJB78F0iwvXBVhHnSpcKnRKQb0JaDH6gPWYOauDOSJZJ3L
 Ek4aFj2jGfnwROZ/V/naQEnO/hk17uzxe3+1b9dVnpoNp09qdpGEJMqPrxDSfpIWxMgStzGXLQd
 0xa6rq3gfaPzxOu3bU1lijPwtDdozhaGauITg3gU2GLFSgHE4E6tzY4xH9La1UD8nuqtZxuxP6q
 79w8Y59BIiAbTUnofukaqvxkHMR8O55ZYc1hCpJIRxVQmHEgc9UxPv3Y7Z23x4AAi+FRofmX2eF
 5dpyLG4HrcdaUt13/eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160098
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97952-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1246E299B28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:23:52PM +0200, Abel Vesa wrote:
> Enable the interconnect, pinctrl and Global Clock Controller (GCC)
> providers as built-in, and the Top Control and Status Register (TCSR)
> clock provider as module, on the Qualcomm Eliza SoC.
> 
> These are all necessary in order to be able to boot up Eliza-based MTP
> board with debug UART and rootfs on UFS storage.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

