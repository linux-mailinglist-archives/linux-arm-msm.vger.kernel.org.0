Return-Path: <linux-arm-msm+bounces-114359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UJyUDKfoO2rPfAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:24:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E721F6BF14D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:24:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kUQy7MEv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kC976qMJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114359-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114359-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7333D3023D81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7596C3C4164;
	Wed, 24 Jun 2026 14:23:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2754836923B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:23:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311030; cv=none; b=LATDA90FRf/SxlNqMDDuUoufezGywUkLMDk4DSHLzb92LQ4qbEe6A/2b6JNaVNVu1IH0cO5auSZnk9A+7vljEvqyJwuFfPBhaiPZBXzsk/aUmJ4e/tJpsgxNokIlKfDrJWTZGKZDrUA4/beKVb2zbGn1vBYt/NTCq7JfABS71jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311030; c=relaxed/simple;
	bh=QNGenFbPTeXL/Rook3irOlkkvGOXohHaOGEMChBsdQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/F0Wnuu81qyyMBTa+vw0g1Ff+x2S+qRvMeMNTNu0o6R/cmmeTd2TvfY5VhaLHf5iPGPTn8gu7dOtVHXdyEEUzaZ4MvP3iKtlbGTRDzOXc5Bgwad3QnymCJofMMhbcbkBdeYRwro8p2hK6M9PaFt2UTiUWoG3rKNCqTMJBG45wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUQy7MEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kC976qMJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANWxG3069789
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NcpTjJLsVJBbegyf3923g3GsuTzjADZiqREetvkabCw=; b=kUQy7MEvtVXFcrSN
	Kurx+11u/l2qBqnAstYKRG3amRWswGVomFm4a5gA6cUsbviOIHWjMAzlBDtvTDNe
	gx2dghLCx7TE/Tiys4lDnoqrwpdlumR1M7Rklux+XC2+c6j5WOMw4hGMM4Fd7FV7
	3ImFV/vMU1yPkKM1VjrqlsbZmVYN+eEtrutp0cMoaVnNR7C5XV5ajG8kmVtTvwYO
	OTrZNwy7N+qwltmYqeqYdsBhPGZxJTiywfAyMs/UDXI3PnK2PMeHGVsUEu5qTM41
	miBL8AQv870WvJWT2kSnVVkscPK19pTw+FqpjOI+NLx612gEYHkPGVp8k+om1SYm
	kVs07Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g0yqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:23:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84534f17866so1063923b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782311026; x=1782915826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NcpTjJLsVJBbegyf3923g3GsuTzjADZiqREetvkabCw=;
        b=kC976qMJd8laodnsxMqG6b8d5NyxbIU63Xw+MFziSv0Nz5dgRTnUMkLG9zGIswrpbq
         pwy545oxTQF61EGk1ObnL2x8hOM0Kisym5SeGP5UEUGfyi2VvwsAPFA5zmChJBMnscop
         V3x3llX96/DYM5+96R0qEH8x2JWXm92T5YiXFKkmaMG6Wx42FVm1F9IPAhURo82Uwjkd
         vD+e7mRCzAl3RMwf/NS6AOgQcc41xrhkoRnel0zdVt1mfw/AMoT8QlRYi6hMU+3K3LbU
         tkinVjjXtedBdw7ut5OWjTjCuFbHYTeqjqKZvScXD5laKePmCn/EqBB6fdI7+RKsJ3nD
         2lfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311026; x=1782915826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcpTjJLsVJBbegyf3923g3GsuTzjADZiqREetvkabCw=;
        b=FyJfYWRmXgGLpuriKXZQ1OjRBVS0AMmzPuLIb38id8w+/X/2hyGZlGGrwovY4z87Rc
         x/C46oIu/G2n77TOKtPZZ4rE/5hVtY+c1To1pSFBybBNXg1JuJZ5xX8EdVHQnc7TqB7A
         EIW4Bx530HcLXj3wS2RSv1uNNtG994Jwq9EfKzYUOfIiP6Jy1Y2lzWwGXy26NR7wLOoo
         OSJgK2/ii6UunU6XDSswQXNJvrwRAN62SB0E7iJJ2g2yx23byJ2W+oIiM3V36Q0wdreY
         sATXCw/7Rtgea2NZqptihHqhR4+fyeEqoF5niDvVE7wa/vWFJeNB/kqPqEPf/KPw+C8S
         Y5IA==
X-Forwarded-Encrypted: i=1; AFNElJ/PMCaeR4ehnYNdTsdFrsUUFA5ybNOWsy7+ZOWJkjrPZfXh84yjBS+jKB2QhIQLS2oyAWdyN4KkAALDBlTh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0YSjCQwGYZxnBoSXoeBkdTm32NN/J7Ej7yYKOjJW9OBXCVhq+
	20QBn9PmWfNM63HNlnSKsMplElr6LNFeVmEZoiCgcs1D0SNM2+x1OYRWV8ggQzG6Op1qsCCDGay
	O7xjlrACoPAE5t6xToitn1aSEJ2BxrAklJ9dI9xCeXRSo3BGgdph7brKNRkIepXIj2PgY
X-Gm-Gg: AfdE7cnEiU4rtI5hA1QCs2sO4L828Lnj4QOYbb02/o3kXoz+mJyJjX4apXgJwnin4nI
	3DTWgIYG9hfEJCjLeYVIKPg8lqZ4KQegrTot0J+UA3S/6vjcJEdziFdn7+RFSFrRKB+RwtSc4y8
	J12h0pUq+jnE0Y/N3XPMaaj7GqZ/yZ1PwxMYlHwcpi8reZL5WJ4Gl+EAVOtsHAvA1MUcm4hScrq
	d7ZSY7vlpkzIvdVuBj8z5GzcYp6twumkLqGzWrkCysON/dIamVJteZtksrcyKHVor0aDv2dfIm7
	VTbjHfWiRljWJXknYQv9c2+rOeGAKnLzM0mM4uRpDL56XYfVPkMagtfvg2b/g2typnRK106e1Ne
	gVeu8fqrMi4dBOldBnkHVQ0+tZMCSigFLhcZLbFWcFppl
X-Received: by 2002:a05:6a00:1311:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8456247857bmr21212420b3a.10.1782311025892;
        Wed, 24 Jun 2026 07:23:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:1311:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8456247857bmr21212373b3a.10.1782311025442;
        Wed, 24 Jun 2026 07:23:45 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc773sm2548152b3a.11.2026.06.24.07.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 07:23:44 -0700 (PDT)
Message-ID: <74d3f07b-3212-41dc-ba59-ecac57dd1b78@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 19:53:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/16] media: iris: constify inst_fw_cap_sm8250_dec
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-16-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-16-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3be872 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=e8S3DcHKpQokSN46YpYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: YLGjOy025sdmSgpxR_RHKcTJHT_NlNyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfX/68NJRlUzGer
 CIVUd8Ia7la2JrEwZc1vAPLraD97PEcATjCoOUjROJ6ckE32LhhflWkcWxP4W8EO0z5+IACs4f9
 8FbRXUj3QIPy+L7IM757Rc48wouT5F+xWxKG1zfVDprCaWhwV/vJH8VPb1jhRT9ry62qqNGrrpn
 B8DpPD/r4PjoBGZSOH74Lz7DIEVG6K6Fat8oU9kvmXn2eNInb8Oruv6r++aACOunT7DOQpxosO0
 5k2vpyKesJWxdkxvSA4X6vbX2IN16Fa9lC3m7ZT5sMkXAYY5Y6OLaY2VmOXFjzByMYoJriLKGsa
 spwEPETbMDl1JqqhpKSh+AF8TEl/HuBzG/CxYWIF9bWmrtrixnH0Yg9CshbdFZGXhwbjTVBO5f4
 EVkbPLd3JZhcEGt/tg/ceKPHxHXtIw==
X-Proofpoint-GUID: YLGjOy025sdmSgpxR_RHKcTJHT_NlNyB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfX/ymgEZn/+4aI
 NUam166PSyyjjAVNBTBsZfj911pijkFYpuF4BjWpfMdL9PbSiWWIoNN806WaTwaFjsGFCgb10tY
 J8FjQOh8D6DPI4IEa5sCz1Bq3JVBbX8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114359-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E721F6BF14D



On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.
> 
> Suggested-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


