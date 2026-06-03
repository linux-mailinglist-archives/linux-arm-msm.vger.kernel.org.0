Return-Path: <linux-arm-msm+bounces-110916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aQ4ULcXtH2o5sgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 11:03:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D5A635F7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 11:03:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Prg8qrAh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J2XYMu6G;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110916-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110916-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C71730B4441
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 09:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C46836BCDD;
	Wed,  3 Jun 2026 09:00:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B52346777
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 09:00:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477222; cv=none; b=LgVhOyg2ihUSF5wQe/wuyY2JOYGa5WQHD9RtPZEPMbtw2MabnkKlLfC/bj523OGzEBhxNPMTZoQ+FiDxNIjn+PlQsEcjayVY23k0rSW9sLxNlRKvlMWZ4Qh7Qa3QajQR/AghBV4NmVJ+1+L4ToWMf3GVmmLrEmoS/V3vhFsTpoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477222; c=relaxed/simple;
	bh=HOm009KlM7gOb11vpXjzLh+oiI5o6wQhswTkvDu1g54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsYVl5wZOg61n9lLpeMJ+rttQo2Qs/toqDOSLc+uKe04FsXNi8W5EJ1G/A9Wqjiu6tyUsyVvndHGto+hUGgFAUMue+ADKi2iIzT6nyxtvb0V3qP1UNRVcCDrqbELnTUBleefxozMYcUTy58j+QxYQYHH+jxoMpAzq45Id1aITX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Prg8qrAh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2XYMu6G; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RLGH873753
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 09:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tXQv8UIZDnB51xwqzRRnfaONheyvTz/2wDM2Pz33Ca4=; b=Prg8qrAhOSKP45X5
	570p3KoJc+XJNcMP8FDrzC1UcweLTlfeP0Pa83jhqCSyS/YL90+QGTAmd231j+C7
	5bxoJsUkl5eeRq9iiOrlbXXYgUOemwRjndx6uD3/GtBoQlgbSY1axSDSVBM4XpSs
	t7a4m+TJVNqX7VFmP8jwyF0Fm54c5a4xVciYvoFpumCX9A2x+djLfeKAEtxhcrm/
	ja7FZtiRZOnyYb/HRLQ4kdref0Qg0AiSQVQ52D7JGRphDhMu2Y2W8pjPVZcAXeph
	SuqVQtpfeBatGTg9jA8ijo1g2zlCotWtmKziffQg1eWQ/0Dn96U4zpdCxwJRwvmp
	D/q49g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9jknk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 09:00:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517582695d7so12073271cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780477219; x=1781082019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tXQv8UIZDnB51xwqzRRnfaONheyvTz/2wDM2Pz33Ca4=;
        b=J2XYMu6GR7ae41Hl3awG+rVpSYXwR/C9sKNZWOa2Hv+/hZgvhdqchsd903re1Cbgyq
         cFbdCZlfJU3HUT0pW/wg41yhzWawi+moQ9bfLvf6OMUKZPSs4MXrH82nibIB+QPxs+rx
         I9zAL8HxUYuP6XdRz36S86zePbctEu586YFmP+mKDrrQkfCZ06AmBtXRm7+tR0qpJviO
         gN+p4IVcB2TQlZv1m4ShPkcU0APRH+vOTxpIAQ+B8vW6J0QkIlZ4ayTmhqugRAUbWzJu
         VaefRTb3RkG/BcXcpLNMMnI0RhHUL/s7vHHuOPGKazW6so+39WRksGptHmK0YvJQYiko
         VLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780477219; x=1781082019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXQv8UIZDnB51xwqzRRnfaONheyvTz/2wDM2Pz33Ca4=;
        b=WQOJZQDBXUxKWuWkyNY1O5XEBf4FeUCxP+O4WaGLeV0N3SH+2N/wANr0UPXX/rnnEi
         zG03hmbWKi+227NxnAq+fzyJLl0WRl2RxsGJWDQ50NGAZVMistYUREfxSkTnIwdjcRgP
         Q4Y6EArAau9qFIP57mxDmbGqcpROSJnXT3BrPZ8+w7KorSxKEUBRmtDZc3p3cjXJLUTN
         yck/G6An3yz+88q3hTAqqjHi6SG0xJD+wblo8Z3ZfZG09z9nsDJmUh520b2YYTUnm9he
         QnLG6yBhqbCgbmi4QwNpXjbVBHs/gGORWOtHW73aXKy7zq53IDYbm7ky1oCetG+Z4VkO
         Llng==
X-Forwarded-Encrypted: i=1; AFNElJ/ox6BAN2MVM3zO/xE38lutmCcEyByU2zPgMBJrPoPzZBuxQN22Mbo3jKe4xmKxs/IAwcTYdgQESlJaF/vk@vger.kernel.org
X-Gm-Message-State: AOJu0YxD7fnVpSWKoMTW7cc0Dzce9T27vmcA0eoQetRtzFwWOWrDC8M2
	Dan78VeCVVte6W00TZF6eAaq6NHucp1LbEInLhTenOk/NFmK8vLoPWWdGWdarIzIjEXdmnL2alF
	MJs5odNLIfMFGYvTfHBMLuVCFTZR5Q6cKhXrCMeDI51WtOCsToK+6BajkLbpXWv9jCbyCIhIzg6
	M1
X-Gm-Gg: Acq92OGVeeyNis3iUeBCodcfBqe6+89rcsYsLKNNH6j/6mnuZt1OqgNI6NT1ns4wAzP
	B/1XPoxouuPe/zZsC+FimnktmTovIuw0/3D9C2u3aJ3PpCmmhQSmo17/rqXw5XA7l9cpokiR/Pv
	9ZPnOEJVej1i7zk7SzZ1TiPg6UHkfFPTSKtwB1DUXBtA6zL4BOdQBEw/XqIMiChuI7VtBjGaM5n
	tR3XVwaUlCZP7jaKDOsVeGrK2ml7/gn8CD8ys5Fh+x4c/StNDa4bs7uMxKxYLyyLLeEoIK+Hk+U
	rjE/KCaV4ePlk0PQjK+V3lLy/D2lOtRqDQIigITPuiLmzOTjlvZrxbGGFe5KvJRvkEBl0rIuUH4
	IaxbwCQq8xi7uIYzIMF/cL+JgT9O4EqcvSisZhx+K8WcmmYBVwugtNCv4jeZ0Zdnk
X-Received: by 2002:ac8:5d01:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-517797e9e88mr26047101cf.19.1780477218940;
        Wed, 03 Jun 2026 02:00:18 -0700 (PDT)
X-Received: by 2002:ac8:5d01:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-517797e9e88mr26046531cf.19.1780477218535;
        Wed, 03 Jun 2026 02:00:18 -0700 (PDT)
Received: from [10.204.101.69] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055305d40sm108744266b.45.2026.06.03.02.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 02:00:17 -0700 (PDT)
Message-ID: <a7bf44a8-33e9-4559-ac05-574b56cde871@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 14:30:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Fix FPS calculation and VPP FW overhead
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260602-fixbranch-v1-1-b8eccaad6d17@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260602-fixbranch-v1-1-b8eccaad6d17@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0ps33f_Zp7TH-Bz_-hFAEMVqnmfXd0YN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA4NSBTYWx0ZWRfXwPlfOF2NVPpN
 0q742ssRn5Z05+PlfACL1cNMIPTxDfNDBjnUU1DJsFnNJ4Qn2TTMcwiHXMTJISxKueADBFTFj6w
 7ufJATah+Zu5SLqgeaJlWOS/ni6SXZwpqzvjYwYdsMh5gUEIMJovLflzO0+kMt7S3u0TCY7/1rY
 7RsuYVVdbYrGS67X3uZXbhJR5zQCg6n4Z/VnlSOXkiV2iTD4tvsMKpG7NRN+294nUhj3Re7dNuL
 AHmqLDh3BOOdB4JWsTEku4zzYYq63HndaN1eqhyQzhtudxWMzmQKgnRVSnGrXjLyTGP1uF/aA51
 Einnvu5SzYq4qJZbNawyswSmFGPnlRnGE6pajz/d1txGN6QSjkYpHVk4+Kq+P1gk0K4yte4uc40
 pRihLbF9LE8YiyWRdXY858/jZDdQFLouxZ1//m3siw/Hzi2fcmXaGa2nwCFK9fGvJCS0r0sXd9N
 hD6cJiy7SW6bCHTjSiw==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a1fed24 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=T6R9ZjUqKG0JamU5TNYA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 0ps33f_Zp7TH-Bz_-hFAEMVqnmfXd0YN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-110916-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,intel.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16D5A635F7C


On 6/3/2026 2:31 AM, Bryan O'Donoghue wrote:
> Use div_u64() instead of mult_fract as u64 operator division fails on 32 bit
> systems which don't link against libgcc.
> 
> Fixes: 5c66647a5c3e ("media: iris: add FPS calculation and VPP FW overhead in frequency formula")
> Reported-by: kernel test robot<lkp@intel.com>
> Closes:https://lore.kernel.org/oe-kbuild-all/202606030132.qnBXVDkM-lkp@intel.com/
> Signed-off-by: Bryan O'Donoghue<bod@kernel.org>
> ---
> Quick fix for u32 bit division error in -next.
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


