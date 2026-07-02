Return-Path: <linux-arm-msm+bounces-115816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o0keFIPhRWpGGQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 05:56:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EAE6F3525
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 05:56:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LxvElt0P;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z1qu35I4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115816-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115816-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C55463011C57
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 03:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEBF34C140;
	Thu,  2 Jul 2026 03:56:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F104634B1B4
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 03:56:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782964609; cv=none; b=ZAs26wpEcZDjgjSK3Rs5ymKcn32b36GXGH3eD/XNNMBIPfMNpcjd+o5RNmEWoVf88cvce8BvOAj8sQuVB1rF7t42QKKAcb5DlSKsW+qXw3TcJbX5S3J4vLigDPyWzwkjXVCpL4AXKMRI4DPRFpbpJPnFmNAVMtEMIBuXs8icDyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782964609; c=relaxed/simple;
	bh=F4ZVqw8wpZpObxfVIRZm94l19R619ImSd65/k7nnKkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txxrirZL1XewfBXwMNb06sqinRU+BC5zGXhYvGqAwoxwB8i4n3Q4rk2IdFnZ6KnKcZBoGz+gVlfeA6HmS8MPrspQuYlsXAyfjGzmmGwIGddzjyoESpe6HcAqyz5IVy57wWRN+Pv/QpluWookeVp1nyEmB5769xTZx1eTHYMmlaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxvElt0P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z1qu35I4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KcZe3047825
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 03:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovteoajCMGXH3GIr0qzJfxb/mOrkQymP//Bqyef78LE=; b=LxvElt0PClbHvIT6
	I6Oe6j/6I8KscN9uBlnZSAE0UEWZXdUOTcDsM3IrrEjmzv+ufaITyiDTJPdMP4B4
	jiI611AEMKx685j67G2/WbUzKe8GqZRdmOFh57Ld8mlv7Wq0vpDZDEoAp/Uz/IjN
	FXKUn0wjTDxNMLVJFtM4LQEXuEf+3k58IZy1zD/g9rm/5q1io68uTvyciptzurKh
	4GcPhP4MMOR2FD6Y3R7x5SXctiS9aLdIVipAFUS6/uO2fe+BW743wBbI2q1hxX4E
	kWTl7on5YkG3tRyf4ergEAOBG4XAYea8o9Mgqmeup1+J0I9OsmbKYw8MDmQPwRvW
	OTSNaw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqv26c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:56:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fccad2b01so2793505a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 20:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782964606; x=1783569406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ovteoajCMGXH3GIr0qzJfxb/mOrkQymP//Bqyef78LE=;
        b=Z1qu35I4TPOXNWSRx/ecNfMPSds1n5+XKj1w8YjDo0R5wLNxdgdoQfI1hHPP2EtFnt
         T/y9o8a8p90ODmM7a6yOSwexPp8iHrzBqBfgMgjMTErSKmzNbq/CMsIZDBYA5zPTxFi7
         Cc80gSJ66gO2bBNFP/WwCTWBsM0NgMP32g7FPg64KD1xH2mCShuvfAAYJBXh/ChLGhfS
         vZWfMZ0hkJfQNbdiMayg7dR78KQ4IAev1ysp64EbX/TlxvHGQN/KAqUiC2GP5QFMCiQn
         THkVxyc4DDNAUFx2tWwYsZmc94jbDRkc4g2x8RYA14etTzGYeMMh6kMMYbY9/QhRId6P
         kGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782964606; x=1783569406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovteoajCMGXH3GIr0qzJfxb/mOrkQymP//Bqyef78LE=;
        b=AWxehfA3FuMAS6U5sD8Xfmk8GcP29SOR65I/fsPBiS5FpKoQAAvqi66IxwqcfOSzGc
         lM/4E0icTf66k6J9USSoHQ1p+3WEQW5K4cSnTrLWguVH/WYCopyttmooNBeRn8K1EIWT
         Er5RjZT30Onxv0E68ibyQzSEdCHRJRc2bpBTElgi22A4q/cxh9EcCYZlbYkCV8Qw5PNz
         Oi0KMXg5wPIewLnF4kIYyPNsw6D9jLoE2k237WitX3ycQa4eRSDcX4706BZn6BNM4FSL
         nARAJZTgM60KndkX9NleUBt4aIcLRJlzs4cF0M25eeUSlRP0WEt6rYFvgIjlfy6YnScz
         fgYw==
X-Gm-Message-State: AOJu0YwkbgrKVbMY4vc5iwHwOPqoORLvOwvNM4mi6ET/NB/vnx9Ux4xR
	G003GF+1lQFmJPsEvR5anh6JU2phzgmsDQI6cG/dAnBXXzl+ML2BrJuHBYMm17FWhP/75Cpb8mI
	VhBbg4d+mpbO8yv5HJqkpSyGipHf2qELVmrMa0wfcjj2vOrOOSXSk8YOKeB/QDBs/z3Vm
X-Gm-Gg: AfdE7cmoaZenMtG9vKqKYuWIMEurohxvCuGfMawUWoFUXShzB+GhEAic9vcgo81OQr3
	64kG+NPwqxy3y5EFNV7+snixb6tCix8/E5TzpDtnKH4EcK71Bgh/bGXZIAo2upxXQxn/y3WlDto
	BfiFdt+6a59ZTZD7t3bIE3ah2eh9lIat+XBOsH3cB5Tn+HWxpxt1Kvi4394MRCQT6e0rsGc8lMy
	f/yyRDtjJNaRM1ZcEXpK8reCCkDRAQquFiu3u4mySmTmm/UNvLoQIIr3PNYfZJKfR3sdmsDElk8
	74fpgrxFg0KA0HizTMl0Qk2L4JFVEZ90oLUbkoZ+FufnnIejaIzCCIzvmAEwaQv3KBm3ZnWeq3/
	HG+Om5FcC4X8gNpi6yXXyv5G+NKxJ1lVH9qDSOpRu
X-Received: by 2002:a17:90b:2f8d:b0:36d:8e6f:8d9e with SMTP id 98e67ed59e1d1-380ba941590mr3202609a91.20.1782964605837;
        Wed, 01 Jul 2026 20:56:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2f8d:b0:36d:8e6f:8d9e with SMTP id 98e67ed59e1d1-380ba941590mr3202598a91.20.1782964605403;
        Wed, 01 Jul 2026 20:56:45 -0700 (PDT)
Received: from [10.204.78.220] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd221bsm3901449eec.22.2026.07.01.20.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 20:56:44 -0700 (PDT)
Message-ID: <e0312267-5ea3-4ec1-9154-2f5c0546d60d@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 09:26:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misc: fastrpc: fix memory leak in
 fastrpc_channel_ctx_free
To: Eddie Lin <eddie.lin@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260701-fastrpc-cctx-cleanup-v3-1-3a73c2e4ce1a@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260701-fastrpc-cctx-cleanup-v3-1-3a73c2e4ce1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gBeij1fJyBDcb5DnZuUlcj2k7Gh04SSt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAzNSBTYWx0ZWRfX1Xehkmz1pPHj
 PCGRo6VTpFOhS1wYcnhoPHJ8+Chmza3hkCbAqPQkpCJoqjXBeKtSCdG1NRLkUdNkNhtLpPx4IjC
 rtERxAANPUBoV7Thp9rgFCcMa9+rZko=
X-Proofpoint-ORIG-GUID: gBeij1fJyBDcb5DnZuUlcj2k7Gh04SSt
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a45e17e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-sgLQT9tILotkD796yYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAzNSBTYWx0ZWRfX7fguE16rXcJF
 ScRTNK7vKp2vqFAARSt6HpKklO0xGQM8S4CI7NGz2nvtk63M+Yr2JznojrN0W5nD01Vhxm/gz/E
 YI9VI+EwHzXS0g+WxBZK31sTpThsJzm3hs4U6UxyoDCTfKWwbvHnvm571S7vnd5RcNUl+JTh4WP
 FFXsuly/5Iplm+4yTEcqdRrGjFoB6V+3vXfNR6ANiYRs2AaLtY8Nz8JEbrMZcL8AVCxCHii+o6L
 NOj/M5VabeT+2zSKOS0MsZoEz89KMvdWkmgfwcpPBsJTXi1ryecg6ZaGHRg0aOOebVd71rBwN7Y
 f0sKSTwo6kAwlSHB6o041803sRWOFYU9rgE+YxoV6a6H8+aeG4xO5dtiTRdQGF7JXMoPA00RjAw
 lHie7pxyL/COPmYDiaAqEfI9nBLd5haPMiMr1wGORYZ5MwYxVbwJqxZbZ1b3qDugW8ZmoIMiRgg
 qVlIRxN3PtAf6W6QEUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020035
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115816-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:eddie.lin@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8EAE6F3525

On 02-07-2026 07:51, Eddie Lin wrote:
> The 'ctx_idr' is initialized but never destroyed when
> the channel context is freed, leading to a memory leak.
> Add idr_destroy() to properly clean up the IDR resources.
> 
> Fixes: f6f9279f2bf0 ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eddie Lin <eddie.lin@oss.qualcomm.com>
> ---
> Changes in v3:
> - Remove duplicate description from cover letter.
> - Link to v2: https://patch.msgid.link/20260617-fastrpc-cctx-cleanup-v2-1-be87c021114a@oss.qualcomm.com
> 
> Changes in v2:
> - Added Fixes tag.
> - Added Cc: stable@vger.kernel.org.
> - Removed duplicate description from cover letter.
> - Link to v1: https://patch.msgid.link/20260611-fastrpc-cctx-cleanup-v1-1-28097444116c@oss.qualcomm.com
> ---
>  drivers/misc/fastrpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a9b2ae44c06f..7727850e9240 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -492,6 +492,7 @@ static void fastrpc_channel_ctx_free(struct kref *ref)
>  
>  	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
>  
> +	idr_destroy(&cctx->ctx_idr);
>  	kfree(cctx);
>  }
>  
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> ---
> base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
> change-id: 20260611-fastrpc-cctx-cleanup-bfd20aa7b8a0
> 
> Best regards,
> --  
> Eddie Lin <eddie.lin@oss.qualcomm.com>
> 


