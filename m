Return-Path: <linux-arm-msm+bounces-114254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MnXtApi4OmrKEwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:47:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E696B8D4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:47:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pDY3yLV8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JgfwZ3TG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114254-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114254-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CECB93017CE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267E01CD2C;
	Tue, 23 Jun 2026 16:47:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC65631AABF
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:47:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782233235; cv=none; b=p4Ri0WZOrW9cBVAzN0Sx+3YKyue8N2yKBVrxnVy1Y/6Tn5U5JcuT9ORW+wpQ1/JNIZWnftDx0JiyoqmYqUT7kuo/VcSW58p9DuPKSM0jpBjm5C/qBkPRBQNJXGUA7+HLyRZf09CP5m9i7mT+U/KryQdG/ot2f7LaCjSFnpZGgwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782233235; c=relaxed/simple;
	bh=ickOgqp7e7FCZNO3eNjSwNBANQsKvA/8RRTMthmVMuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToQfY8cCp8sXOEDivL9Ij9hAJ2dz/9fVVwxxzViSDc2DJX4YM9zHeydwF2dBmB3gJrqMINCj3fbGSVzrBQDUycCV1yxstAVgTVuMCSWBT2bNHlcBTm5CBhjENhmma+H6W1hOFeL7SY4LdWgQ80U3t1MoVrsouxUglVBkK0uMAGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDY3yLV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgfwZ3TG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXcS51155247
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNCnasIGge6iLQlgIEDujkQhHNFEgY5Q07iOwzqg3uE=; b=pDY3yLV8p6AaPYor
	6i1WnaLjwRgDHl+AqULKrA+SvQ7QGs7OtcgUPlg+oCSRXyETLuz1MldKJ9cw1ZUs
	Wgj18jmlMuxQ3ohXl7BfanVmjD2x2JjEVq8ZLMn/uC74mDpMeS6a2i/HzGIyhAP/
	I1WR8eE3wwTbp6aywJR0NKUdycz6bPQMrE9ds+fD7Eon3UBWOJ9bbJWOO+qZDzIb
	ymQpl9HsYzYldCHlqXXIxOnPcFqm+Oe1pMxLK1otiphDTPjVu1PBVxYSPPggBjLg
	urGCm+rqwf4hHkvxLLUq7F5PjaZpzobeneMMnyUW/8A7jA42ekDRb/ay2cdUjFI+
	vH9yQw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28snuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:47:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c6d4a825d5so10894137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782233232; x=1782838032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SNCnasIGge6iLQlgIEDujkQhHNFEgY5Q07iOwzqg3uE=;
        b=JgfwZ3TGKhS4U/hVxJd/9NsDja7x77IM9zCIXDVyA49wEZIV+M+YeIf9c7K76iBV7s
         Lh28hkQm0TXdcvXldcBdhlcwJ6fChqPxboorA7D12NcRPy7o5Er5igmrjEnnv58UKqZz
         eqOheEuAGN/GB4zCx2GrHXtkWYIW44+fVeRGgi+cYVYOa90wiMVwv46IjzTHocOS/KKu
         dBhtqellyjydG7MKfxsdrNfQX8jqmaJd5NWGrHreAKah38LqldkfEiIinnFHo40KOFhl
         rF2Dmmzt92qSTyQC5/sbw1V/0wdjNnzx+d65QbbUo3AM1aYg9XAyfjd7RcSQ5KFDdOcb
         m1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782233232; x=1782838032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNCnasIGge6iLQlgIEDujkQhHNFEgY5Q07iOwzqg3uE=;
        b=gO8r/EepINzgkXE00Aw55K9vwa2MzYoyk3d+l4k+hLwsEGBsQLm8O7bN4CcQipFLUD
         zPqcOi3Vlp5CWNQx6G9Y8sXyo7pNruyTfHw8H/vCHTZ6O6H2h2cVVzr9SBqq1T6Ee5tp
         2XHHtr7KtPvBd97Enk2vgvVzubII7WFJkfmTIdvcVpqI3UoLpZMGj4GJD1jx3cEKo872
         vVW9CXCQoeAHZeYORo+9a2ydIayq0EzuMOEACpeIq+AN+JO0J/LLh/fPHHuVE4bJmyhx
         7VTrT6WDJihucO2oVmF7kWyD/6FOKxUHPsQNpf+83SrqIUlMRiUt8HF6VvbeY9dNRq7/
         v4Og==
X-Forwarded-Encrypted: i=1; AFNElJ+/stMSSbD3ONK8U7P7m+nfiAzN94qA6PXvwr5KjuroQB72ymmAQplX6hXlM1qfNB9zj1X/vfRq5Sd3zyxo@vger.kernel.org
X-Gm-Message-State: AOJu0YwfxeF053D3xCYgeNGF6mK34OVML9Twv8C5Vc2g9fu+9kStVqD7
	mF0jRMwoPV2XyrdJaGRLsiw0W50bXspabATvyT9mKIHzWmcsM466+Euh6dHjSBiXU0jt8Qp3UU+
	bdHxSh0eOWMUx501zFlsBpJBbouSKmd1W+9VsgSRbC8wRx4qFDG2Gv1tmBg2RVbFoZvqc
X-Gm-Gg: AfdE7claDjHfVcAABmzF10c4LTImwmBrBXhLMN9Hr92qQ5n1cnL4ob7JWC+VZHUy8DU
	50/LLrWKGSjnrGq2lNZoaqjab81+WmARM9Viw62pQM1dUuDnH4xxVY6atIi67UmmA9p3uYkXN71
	JwOAGBiN8XBfKowZVZOXTLqsw/d0/E0Fjzw8OiQD4l5i8zzZJdx6/dYwl2YJKUy2NLXdVd8DTPt
	7EyLA7Q/trp86mWYvzbNGDZfR8QdjAwlt/uu7gITWpB0xnl2ROyxfggJhSfq60lqzB8vRJnNmPr
	YIWn+h6TkoHZk1wqyal1HpAWh/m8ICRxAiXUwHkne7SD8FcYxlM/4WEc9Tq6Lr/js7pqO+ahTgf
	/HBuSQWigfJimTV/AiF4er5lqqE3cXP4KenI=
X-Received: by 2002:a05:6102:5715:b0:632:8717:e553 with SMTP id ada2fe7eead31-72f3b6a9e65mr1438689137.7.1782233231935;
        Tue, 23 Jun 2026 09:47:11 -0700 (PDT)
X-Received: by 2002:a05:6102:5715:b0:632:8717:e553 with SMTP id ada2fe7eead31-72f3b6a9e65mr1438685137.7.1782233231529;
        Tue, 23 Jun 2026 09:47:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1002d6c5f6sm195658166b.49.2026.06.23.09.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:47:10 -0700 (PDT)
Message-ID: <adb84189-59ba-40cc-a18f-0405ee5a7b6a@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:47:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] iommu/qcom: Add NULL ctx check in TLB invalidation
 paths
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-7-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzNyBTYWx0ZWRfX2T9W9tHeGH3L
 PMBzrS5DgrfBSOL63kQSyJxIpPrzQi5t287THN5qChN+E2Se3uL14v5ohZxhqn1A8NJhJPXGcRH
 hKGNBcHczQqV80SmSOivKltA4gqhoO4=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3ab891 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5zc1ivFRGWfvx6kDekkA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 7mA_CCZqYzQqQIdsqi616M5Yctv02sBQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzNyBTYWx0ZWRfX0OvzrzOJyTiK
 0aJLqeikQuBterT76rfXVKmSZmrjkoNxTgSz6N+rwPRSC1/exQnPabLY1xQevTBToEFIZ5UemDn
 44QzBo0sfr/1Q7tV7KKO2o26HddncMAPCAgIyD364QZxcc1IoseRzge5d4bX9DwJV/opRekCGj2
 31iESB+CJBOwRm5bWJk+kMyOy+GMVOl43EApujjGRfS6Z0XiFh/Vy5L/Pg0lxC9prJhdoK1smIA
 E4NKcxRnO1Ef/77VxJ3+wLSF4bxgHB73sbtJPBaHxZkVMYWOyxMVByGOaJUb44AGUwOyC80bZgW
 Ok3d0+n1rl96036jiFFlbbfP8b9YD51ARNE6lvBtaM3mXBtSPzGkCq5pobwDe0Im/HqpgpKXn8E
 ikBEhDu5BQRAle+VTt6RBas8+wUK/rYcjWTqLZ8g4PuCh/Jf4Z1F5iyqoGa4N5fSrrqw9JMC9Bb
 67coiJOXSzzHPjwDbiA==
X-Proofpoint-ORIG-GUID: 7mA_CCZqYzQqQIdsqi616M5Yctv02sBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sin.lore.kernel.org:server fail,qualcomm.com:server fail,oss.qualcomm.com:server fail,vger.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-114254-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7E696B8D4D

On 6/23/26 2:20 PM, Mukesh Ojha wrote:
> to_ctx() returns qcom_iommu->ctxs[asid], which can be NULL if the
> corresponding context bank failed to probe or was already removed.
> qcom_iommu_tlb_sync(), qcom_iommu_tlb_inv_context(), and
> qcom_iommu_tlb_inv_range_nosync() all dereference the returned pointer
> directly, risking a NULL pointer dereference.
> 
> Add WARN_ON(!ctx) guards with continue so TLB operations skip
> broken context banks without crashing.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 40fb0408dc07..51b60b296bb8 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -121,6 +121,9 @@ static void qcom_iommu_tlb_sync(void *cookie)
>  		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
>  		unsigned int val, ret;
>  
> +		if (WARN_ON(!ctx))
> +			continue;

I'm rather unamused that we have to deal with this in the first
place.. I don't know if this can be easily reworked to be more
predictable, but this works in the interim

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

