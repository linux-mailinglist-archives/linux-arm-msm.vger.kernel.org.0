Return-Path: <linux-arm-msm+bounces-114242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WENhOuWuOmrPDggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:05:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2E56B88ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:05:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="UC5r/Aak";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Evc+/+wG";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114242-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114242-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1168630B30A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79B32E2DFB;
	Tue, 23 Jun 2026 16:00:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B7530B53C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:00:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230453; cv=none; b=S2IADYM7WghFoEUHXZrdQe4jvxZwRdQIrFJ+3IZ6egQ5Lz/6zB+u5n/QdHVUcNaWZDd19GmOCUa+utUb0vOkw5U/TDjd9kgiZZcm95fXLzytQunBbG9+vwX1A0x1nBB6NAd9+87RUO8zn8l4ULc9i8fc8ckEi7lvp+CBwrlM+mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230453; c=relaxed/simple;
	bh=7zC9pfHYsK99ZK3cKWoS4K4CNMWolRWecCBf9kpQFw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/hg0ARURxbko4w8vfG2RL4k76KMluOtxo1SwPg+Sdjat69kfG06j8UR39EyBBxP/b3CT44z9g+n4cLD1kl42SnGwPGyfMXuMO/ziAM155M7xd7xSXP+0wJdvQqYneTo7QPxxH3zp/RF3Y6QTZmMFYyoH1ppJhK7vvzqX8EoB7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UC5r/Aak; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Evc+/+wG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXtii1156015
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5n9k4KX04Bj2DP4+GCETxqUImU32jpS5w2W/MeCTA4c=; b=UC5r/AakEX9tCSnR
	VOKYIjJdRnOiPqu6HM3UlLAsyB0P/Rxmuq7LQeKZw5mYYiSewz+euND5UpiqVO/B
	P6SQSUZ8QrqvO0jheBqCj5tUnBqg947l72FUOAeZYF69QvqdCmb53kSx8HTal3y8
	Hg0stY5vl+KWipBw17oOAAQG3sYels5wwH028j4TaPwxfh62Mzcm5tiMeyZyKfLy
	a7h8QNl0aD2DMEt2vwrz0Lno0HM0/VXB1U1tSc0iIpJhNeKwfL7XBY9H0iA+thC3
	0y0ewCkjOtCfNUTYuxtuoFdoytX7pSJmppCp2DPrDe76l0n1llYt9J6Oc30LvYj5
	WnaBmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28sesg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:00:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915ccc2d4d2so113585085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782230451; x=1782835251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5n9k4KX04Bj2DP4+GCETxqUImU32jpS5w2W/MeCTA4c=;
        b=Evc+/+wGgNUW/AGvVYVU8Nc+EzY/x94+KGMt5XAZ50jGEdwxVfnvv8Wy1UPu5AvlJs
         +zfRykTm5FHdAE+nKXuUSleCDp+0vz50iHQgfSearwn7/3tW6PnY55tG+3yEV0ZJ085q
         5qhd+z67OO/vRrzSeflDf9elDcan1bWHjc7JZVmUHxi5W9Sx26touy4VZitcdW8PJUFF
         931nufxvn2vIudMuDXQbjPE+P/vj8go15jM9R0PI8DQPfo2TgrkFzZgdEuKIvDP8s8Vp
         KDPXjp2WLUGDWjr2d19DG2vM2BD5a+WPUdBWhsubXX1TFYwt3O5C0Yc4UCt7LoA25mAN
         1sNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230451; x=1782835251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5n9k4KX04Bj2DP4+GCETxqUImU32jpS5w2W/MeCTA4c=;
        b=ctVTfFlDVfrPvaoYAtSlkRtAxZeXT1WZOn8347YGWv6lOPsuMdXudkgQrPRgPpLZYf
         Naa7LJDIUjG6liFLEdkepyysoBRGCVh1EEbBLwyTdF1hSYkd1E3yAEzenFvUoo9hh8z2
         ZfqwsnVLm+cR0ZLfA2pMRjJxh9l/xCWaw6qAQ7+RS+E4Td0BwmktqFO7LS98gvVcW4Fs
         kkQ8UlRZC6l+9nhLz1IbAox+1w9P9JjxC0FvLozFmUjJptP4iV6gaLYZufcxEOeev6yD
         lyY3vCiQ/mgyunZTL7EWDkGEiym12BS40mROIk9WA2Rym7V38dW5G1FC1OOCGRzSOXfF
         y6wQ==
X-Forwarded-Encrypted: i=1; AFNElJ9B/NCunY5IeFeIpfT1GIzyMVRa4cZCaGcOxf1dlNt05g/b8+BEe/NR5mW1JNNCL9O0e10R06UJ14p0tU/L@vger.kernel.org
X-Gm-Message-State: AOJu0YyXty/OLFRULMztRMF8AGx+Bf1Obo+5F5ilPIpI2LslPnpHouBU
	JnapMU7n3dRn0ydHbwV2YmSjN9ASA+wiwaRohp91dLkHxwZpbXWLlFXLzMlfMvas23JQ8NPVVP7
	XXvbYveKFAsCSNbsBdkuq8F2ATsz5Oa/mzCasfxNw7CQJlpALzPIwwnD6KK0e4v24ZjP4
X-Gm-Gg: AfdE7ckbuL3saE6AvDgGiW1U800isxjtZPxycPo/XJrjPdGyzTLfoZy8IRuVj2l0FKb
	eusYurexrUx/f3RUdhJaYkQLYUxChbie5h83s+L1aalWsJRCT+FxxsiGZN8F0YDn2Hgbyh+knhJ
	FsgVvV2ve6ZaFDD40R3Wi8K+zZETwrg0X8WP2UYGdn0VSkAcbcn4D7Tmu8XOcz+dUOh83+wQOnI
	i+bBPbVAw2reA+U7TXTkvAVN+TUS2UQAss1BlmQFp97P61vr+W+ABOkL3tWTjdrIvXEDS017fmr
	9Jj9ozs3z0Q3clM3CTOjypPjM6uoOeYJLq1XRZZO8zyysA8nX/TAL8s7YTfCRQN0YsHKK7Yhrfi
	XTVAJksi0MhcztulvSbUCOjS+/tCNOZO70AY=
X-Received: by 2002:a05:622a:24e:b0:517:76dd:4c2a with SMTP id d75a77b69052e-51a4f4e1e4dmr56837271cf.7.1782230449844;
        Tue, 23 Jun 2026 09:00:49 -0700 (PDT)
X-Received: by 2002:a05:622a:24e:b0:517:76dd:4c2a with SMTP id d75a77b69052e-51a4f4e1e4dmr56836611cf.7.1782230449107;
        Tue, 23 Jun 2026 09:00:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e497e88sm550111866b.11.2026.06.23.09.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:00:48 -0700 (PDT)
Message-ID: <5417d960-85ee-4e56-8121-959b01511285@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:00:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] iommu/qcom: Fix missing pm_runtime_disable() in
 qcom_iommu_device_remove()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfX0ZdaPPseTk8V
 Nciu5jBZF/H7cr9dDZjCOxYjGZoO2izkXI/Gr/MktKSslmeaobh0QWvaJWYu1wglT8LRwxh8FC4
 /8BSC6jpPyFm6Pl7j6z8G11Yi5P6yzo=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3aadb3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CVC24o2f5RenLrmZXHoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: JbZIc-RKxIRhf2rfiJBk_xFi9ud88-r5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfXy3jREPHJrLp6
 ZzZurc3/eHZ5lm+3jtNAKkpVc2B2YVF/lF+yYNqtN5J6IVod/GL+LcaQRlExtRVO3RkdzUqP9vv
 UdiF0OIiIh2AMr6fTHDX+8jMGxGWX6JqBX2STrBad5+bD5B1Fm8HtZl/Q+8RAiM0bO6BQM1InYZ
 xTZwLWCSUbsA/wDPerSqsBpXAq+KJyXoDpe7sHKuqZZOzwb2fO54w2k/6IYqvr5NtR7PCy/bSQd
 1p0xQP7B8HmDRwiKO9mHU8dZzBnywFHYzDMBFConvArzHzjyqoL4zCsoF26ebjatLXpHh99JAWe
 LfxXlYZTmoRTDdBM1M27zbDa7o4BGBsY4MzPGecmpz6tdoV4RMhUUTz5xR07VcEmqPELGhFcFuv
 J1JvxDjwrj3rgOBhDO0xzXSlBR8PzMqMSwnZ0Sm7OsSt2PtWNa17iG7cV4V5omYRapdeGJMUV0y
 h5J/3dSebet11Pd9XqQ==
X-Proofpoint-ORIG-GUID: JbZIc-RKxIRhf2rfiJBk_xFi9ud88-r5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114242-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A2E56B88ED

On 6/23/26 2:20 PM, Mukesh Ojha wrote:
> qcom_iommu_device_probe() calls pm_runtime_enable() but
> qcom_iommu_device_remove() only calls pm_runtime_force_suspend() without
> a matching pm_runtime_disable(). This leaves runtime PM enabled after the
> driver unbinds, which can cause issues on rebind or if any code races to
> resume the device after removal.
> 
> Add pm_runtime_disable() in the remove path to balance the enable in probe.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 09f2ee6be988..cb43276f4a39 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -878,6 +878,7 @@ static void qcom_iommu_device_remove(struct platform_device *pdev)
>  	struct qcom_iommu_dev *qcom_iommu = platform_get_drvdata(pdev);
>  
>  	pm_runtime_force_suspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);

devm_ would be neater

Konrad

