Return-Path: <linux-arm-msm+bounces-90230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH3zDAlAcmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:19:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDFF6896C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 219F13017BC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C1B34D39C;
	Thu, 22 Jan 2026 15:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecrd/+Og";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W034MH4a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A40831B101
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094698; cv=none; b=Hgqf6EACStiJbQ6al0zL/cr0pGLHgdN/2TAxD/ElNH2rtNt9StGlKFOMh93Okp4LAtwk8fd53Uj63YcufLyF1G+45tX9aHb8CD9oBH89IfJTIRjVw4kNu4Ab351UZzBkFvyu18iMx3mBdmYvT1NxwW1HCkCgfdkfhSIqte3t+dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094698; c=relaxed/simple;
	bh=H5ThibAWvoajrZPKGPBvO69JSuR2rsvAoFuAmH4XUco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJMaSYk0wdya3MuOYynP6PqYMZi2i3Kk5NKn2Rof+7Whc9MBVbdSLEKXU/6d16vLMqGW2qiErR8CgRuqZTeTURrhGe3hbfnJHlSx35XZ7KapIJ6vaQaow09A6PF3QNYYKESto6nWJ9t8T3zXm6noOUJUHQ1St5f61E/AP1pScFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ecrd/+Og; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W034MH4a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MAllVq2915283
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E+apXPPkNURrNT1i45k0NbCCo3UvVpz3ZhqjBzyjoTY=; b=ecrd/+OgSZBX7q1n
	SdzeAj471Tuy2Hd+3FbAQCJnpCFUAMaoFtMohm5SVM5aslmM7jh5ljKmkr4chqw0
	J7UNIoU2xwVV/rMBFW6tF7zexKMeoxhZ2rBzSHout+er3sQkTwiQ2fEPpc97soRA
	ugSZ3u0CWTGxWgpQo6k8TALn3H00nBbgfL6THP5wUa8AYF6OhFvi+4eCktJVvGVV
	oLM6c2cxQFqY6sekNv2JHayyNIKVDuv6rGQ+JcunpOWJkIVEOvECJAu2QKgjwBgl
	GS0O6EQ2YA9QAFve4BUNqO/YUn0xK33cPn+OV8Dt5l4+yJrhN/7CpxaMxmRcvi/Z
	yeZrsA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujf2gs5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:11:34 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94807fe6f62so95205241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769094694; x=1769699494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+apXPPkNURrNT1i45k0NbCCo3UvVpz3ZhqjBzyjoTY=;
        b=W034MH4ai0H9x5LkJyHV5v5kGmT7sWeNc3VrnGbYLhS0KOttlQ6giJqoOKf7Tu41sN
         lDHRb7U1QEAGIA2isLBHTQsplf+B+X94vXpwLlXZQO01Q/0hCqgfUHUtYxRs9zUBGy+n
         cwxRYLPlKfKlxttNoC9TsP0gfNZc+EZbmPBSMrviGWtWQkKAL8qZQ9kM0gYhETjhCy56
         jhV0x6dfyfCuWe3g+TS9n2wLKZaOCiLotknES6IXBTYUh/9wlRydzQdTzAdL9iyKRE9S
         mQxfdd2Y9dIVdg3LkFvLC8Y2MmKqE3O8Z1sczJSpl83Qn9e0BJCIXDRx1jS2+Wnk19Lx
         nMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094694; x=1769699494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+apXPPkNURrNT1i45k0NbCCo3UvVpz3ZhqjBzyjoTY=;
        b=rBSdWNVLJRbbOKfemiyYeL9whaNPcgw/JILRF5jqvgJhb9axwKJIAWen/v/BvAv8i6
         sobOKnZ+51wVnNfbeVb8tMytX6C4h/nXwUTpcjUV2rjRdYasHTc1O5N+9UnXC39ii1IY
         Ozp9Wf8slCiy6mPkXRbJ0y6Oqd3h+H9Oly0qq15HXqVAW/9MPLHGUkDbyhUCXl91Up6z
         SdyIxTXtx1WRlAalxBY00g23I/TcWuD0Jp9iFbbwAU3ncIXASq8kZjhmj+blMV9q0uL8
         Xv+G7WHa9o/Uq1V+zXVUiOkZOT96S8gmK7U8MDn8cT5rElDjUm9tefFH+FNhExhhuXyF
         eb/A==
X-Gm-Message-State: AOJu0YxNMTSfcgnyw7BoYhpPQ2qcq+oysbaHANQC51ztnfoXB7U4uD9x
	XKX0kzz2X8zTDS5XWFTplMlGlklqk9Mgr1dkDhc6yID995UF6IUwRjNxNwl4S8mTmzhOgHJPKGc
	OpGNbfVBR8iTvvPyP+NMUP5Kdodxfs0kujCm2ofuTidz2CZi8UYHR/wMi3zgUETgZao20cZaMqm
	/v
X-Gm-Gg: AZuq6aIZa5mRf40Vl9cPzIEfdUux8sBkYRp1mee8NPc7s16vX9jlx9zGUVFppIlSLzF
	/aYk5uw2m8KpsJqWaR09I8U+2TaQOhTEgdStmWHr2aaHM77/IxcVmRpNZnni6vUGyTUNZM2YTq6
	nj5XW2q9UnqHbHJIuiMkmITceAdNWL9J0noyM9KKWYgVjBP+b9Q2MddPip0dx4Hy0bbxNK9Tcxn
	MiI4qz28e93l+ff1AU7IRBJhVJcsBmBZHhFvmWt7dlUBvW+abEmlUChJv+bWHPKMhI6MDilLM4s
	oUEPCMDHmIDmSDyhqwnz/Rh/zrV4ukh1xF+XS41VevsbXTZBhwnbQzX3ehuHUurr+uA7AkpDP8j
	rkVzVAsiOyDge7aqwOapFehTdu59gOZBkZRlX24Zy5R5fDfwkrtJo5LNTreak6wNnPr0=
X-Received: by 2002:ac5:c5d1:0:b0:559:a30f:1d47 with SMTP id 71dfb90a1353d-563b5c689d2mr3193470e0c.3.1769094693754;
        Thu, 22 Jan 2026 07:11:33 -0800 (PST)
X-Received: by 2002:ac5:c5d1:0:b0:559:a30f:1d47 with SMTP id 71dfb90a1353d-563b5c689d2mr3193454e0c.3.1769094693292;
        Thu, 22 Jan 2026 07:11:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16293405a12.31.2026.01.22.07.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 07:11:32 -0800 (PST)
Message-ID: <4aad22c3-a720-4d88-baa5-aead6854a771@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 16:11:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/3] ufs: ufs-qcom: Fix sequential read variance
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260122141331.239354-1-nitin.rawat@oss.qualcomm.com>
 <20260122141331.239354-4-nitin.rawat@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122141331.239354-4-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PxMxSs-qubjkKn9TcpHY8I35NsXFO1zl
X-Authority-Analysis: v=2.4 cv=fdCgCkQF c=1 sm=1 tr=0 ts=69723e26 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qSU9NBqPYLnPsOZMscYA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExNiBTYWx0ZWRfX48bMeWlvRnUR
 CnD5JU5EtppCLVY2zJfAUjJCDxnzNziCP234uN1fuPrbpQWpNcl7q5fqnWOtZe3+gIASp2jyCY6
 6KfoB4BRgmu43Q33AR3ZWaNdU/CCqQdBfy7GPqoDr+zJjx31Kcaptk9NSN+oecAFY/wW4eqP6we
 FrnyxoeKRcpwMOXKIecoWeskvdSH9iOwbaQLiMXfa4P3/xqE+MRLHN0iRd0U6X2VeJpLP915Son
 NuHPvlir/xsSALZfQ5bqsiZhGhCCPiHk0eY7JwKuui6mLfUbA60brmvqH87MEw/O6eN6SR9PXw1
 5VqWFhGIREXHh1YAogJX1MNlnRz7sFUe1djBbaLLd9F/LkN1WjET/8s+RONaV5LMeoO9A18PSBp
 cSQA63hqeAEy6jnwhfWYrZ4jqlWSPUcgvC8PDDxWnR3TCOmbs9JA4alUbF+BBHtMsvT4qu1nkIl
 +5nG9o6pWyl7rC24jvQ==
X-Proofpoint-GUID: PxMxSs-qubjkKn9TcpHY8I35NsXFO1zl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90230-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ADDFF6896C
X-Rspamd-Action: no action

On 1/22/26 3:13 PM, Nitin Rawat wrote:
> The current devfreq downdifferential threshold of 5% causes overly
> aggressive frequency downscaling, leading to performance degradation
> sometimes during sequential read workloads.
> 
> Update the UFS devfreq downdifferential threshold to 65.
> This widens the hysteresis window and prevents overly aggressive
> downscaling, ensuring that frequency is maintained for loads above 5%
> and scaling down occurs only when utilization falls below this level,
> while scale-up still triggers above the 70% threshold.
> 
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index ab5aed241913..5ef810b95b72 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1962,7 +1962,7 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
>  	p->polling_ms = 60;
>  	p->timer = DEVFREQ_TIMER_DELAYED;
>  	d->upthreshold = 70;
> -	d->downdifferential = 5;
> +	d->downdifferential = 65;

FWIW I see this is the value that's been shipping on android for 
quite a while 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


