Return-Path: <linux-arm-msm+bounces-89313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E440CD2C93A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F07CE303FE23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 06:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4892B34D90C;
	Fri, 16 Jan 2026 06:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAcXNIM4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1NQWGyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B718F2D660E
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768545154; cv=none; b=mEbj3BEC7mbO9lFIH9zavLncRhR0D7eBWbhSppk49AIRy4tUPRu7GxBiezvRvonJvkgmIHDXwHXrI3M6X1B0FDGqBQS0MkCaxqMIw238Mb1Nfppv+YnZ2K5yEmZadJsPK9CSyrrl8n2FVaiTh8+R0UDKDwKAQUIHs43kT72SuXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768545154; c=relaxed/simple;
	bh=cVp6/6R9XQlepJ7QgVMfMH0NCtOW5wKvgip99CTgRIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRb6AwENzHLrwkgpAKOfk/apsvwVGa+03MSkgNrdIlwWojsQaGmMopUDAhydzGfKY6FpuqdHa135ZjC1CqZ2MvpMQcJTlFISCSfevtMRmyCGZP41E9BH8ZkgkTZw2lcADZPxmUwCy9LOZ4TsRx1cP1jv7wvCjPpSkYy2Cqu4Bnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAcXNIM4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1NQWGyT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMckG02615131
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	571F6lMjkVoO1c608L9nLhKKPVlPXL7EwfrpN3qqPW4=; b=mAcXNIM4TYrQU45C
	OLpMWgIAf3OjjcC3eqWuyAFpjace0Qm3u69I/YKSPBn1485Af88S7xqY4VUn4+ot
	drghon3/sMW0zvgNiGoPPDPeEh7Yoh+tuE2hzxUXJwcbL916ilxGS57mdPhgmBk2
	fijzSmeoL2EA9L1oqcEUl3uiGMRAoTCn5oEiXoi78rn9/z0Bsc3myUOSA7uLIVSO
	/+K62mgF2DZs6RpAnoQEO35n/oxVrZiTxsJS2htMQsICcglYiM+zZqVlu5IytL5i
	PP7hP7xsu00kVom/GmPvDhudCiCo3LIVxH+jCYfkGi5gy6hwXf1fK323UqKv895x
	47cRdQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq977s3uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:32:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so14831045ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 22:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768545150; x=1769149950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=571F6lMjkVoO1c608L9nLhKKPVlPXL7EwfrpN3qqPW4=;
        b=X1NQWGyTogw5i/3Q01Cx40UvXRh2Gy1aghM5j0OdHcuJdYChRtDEXKDxOX1Oj682DU
         DFl9uBAADz8M0G7lx1irA4obCYAQgGgJLJeIRp2BIphWhLbat11XrYUfUkxXG0Qmdn0d
         x2qQccVer9b50dbytB+72OwaIZlZPLwD1BYquppZ84tv58bFYogsy23iy21T8ljuWFSh
         byzQMriwMhqaXjiE1NouaRUwD97UpQXz0C1ikouyi6TPndVxG+E+GmKQ29/0ich+kCkE
         od6w5aS0wCG6TKoFsITVzzUXSJC3TFfAHGm1EyVZ/Icykzs3FN1swZMitkdQXv3AaUya
         gSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768545150; x=1769149950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=571F6lMjkVoO1c608L9nLhKKPVlPXL7EwfrpN3qqPW4=;
        b=rgbRyg9z/vXWVsVTUbYSke6EkMoXUI+amaYHk7EeHRYU/edRywdKhw9YTWK9OpvE2f
         2si5P9yfzld07FOctVQ5eMddUn1QZQGfDOlVwp2f5wXoYx86nxEa+yEYq5D+AUzGn9dz
         EQOkUFbmftu7kW7pDR2aV3MjfjTLrJ+yrt2LjL4WnNA28c2VM8AC3bkd+2RAtbrOWT3t
         FLBDz1FJDMPMjLwZWd4dqX/63DbR7Llm41odmvl7C0MGsm5iqYoekxQ5Ca37sfcnMAYg
         D9RG5gOZDGCxYJ1VSahXSW7VSZvpmg8NLg3KbnlA/7K+ZRivtM1ohtPBShDg3952mPFO
         58GA==
X-Forwarded-Encrypted: i=1; AJvYcCVlH8b4C0PFE2eawcbKaqCoZOhSAaTmm+gR/J0avo8qC71y/uqLGQov2XFkqAitIJvqXG4zoX38bTv8Pjyy@vger.kernel.org
X-Gm-Message-State: AOJu0YzCI/92iAyckWNHhwHY1KB/s2EhaBOwgiSndC5OsG9ohn0YR+CV
	JZz6cH6OnfRof2UqiDmXvZXrHQheVUs2p1b8lil+1fPWzh+ukrYqpHB1VlzFChtnzg5q/ugz/np
	CHg6JpdL3QXWiUJooaWbHkEL0sp0Jj0jk8f/aZSlZOgHwyEfbgzNyLp2w7hfY6ZRpoKK4
X-Gm-Gg: AY/fxX7i9w+FjR7amdcPqukpWmpU3/XH9QzDO0HFDc5bl7grR/Nqqifw7+kwq0qsl4F
	uuA3ldQOrxNcHGNK4LiU+EpKWvtbx9LN8v2O3SHJx7PTUjMHVnggshSquo1AJhlpkswUkYZkxGv
	8zk2E51LwGa8k6G7UdpSBF8T4AXRpgR5B+pHRWlouZwr50Qt31y6bOo+71K1fiTwpGpOC4RnPtQ
	M3TzUk0kqB+zfmS8VCRJDRk53cksJubLlINdbGs/Y4/oH9f60EEnTeopIVJN+hXJWc/PMJeKZU7
	yOrQGjmROlNyArlwuzsxHgy2CtWANjWPbGzhenhXczgCVcS1/GRdKhgKermHpY3caOSaKj+HnKg
	Rcy2nPLv+90c5wIr4rlLUZ3r5U7Zmj7WzXceV
X-Received: by 2002:a17:902:d48c:b0:2a0:e223:f6e6 with SMTP id d9443c01a7336-2a718949652mr14797105ad.46.1768545149684;
        Thu, 15 Jan 2026 22:32:29 -0800 (PST)
X-Received: by 2002:a17:902:d48c:b0:2a0:e223:f6e6 with SMTP id d9443c01a7336-2a718949652mr14796875ad.46.1768545149243;
        Thu, 15 Jan 2026 22:32:29 -0800 (PST)
Received: from [10.219.57.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ab959sm10752865ad.20.2026.01.15.22.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 22:32:28 -0800 (PST)
Message-ID: <70e88549-5448-4a06-a20f-ad4395eb7350@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 12:02:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on
 sa8775p
To: will@kernel.org
Cc: catalin.marinas@arm.com, charan.kalla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, iommu@lists.linux.dev,
        joro@8bytes.org, kernel-team@android.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robin.clark@oss.qualcomm.com, robin.murphy@arm.com
References: <aWDsFoEe7PHQaL9F@willie-the-truck>
 <20260109204551.845959-1-bibek.patro@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <20260109204551.845959-1-bibek.patro@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vEU8Uge9pBYxa025n4bOF0YqSECVXxEI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1MSBTYWx0ZWRfXyXofgt8+cwb/
 tF7PkR81OGZBssGcJTul2KdEatlwjIl+uxHVVtncsFBAfNOParyWL0WY+tAqFurDBqM+pWH6Rxv
 wr4zcxV343n67aF5o5pIrHZFT1519699K7geov+ncHs7KZUysWFdLnt9lvWrQI6ya7b+/kBVVF9
 N+dl011EAR6Ohkmf21xyzACOcz2Bd0Prnqo/Kkrk40Cc+30v0XH87f8rjvkfnXlNIdopTYwUS7z
 bbsiRkiW1qieAFg83FmEgQAPnF4maEvzJRSEqFIskHbQH8PhRA578E1lqg71vOHPAGYFOxyeWS5
 v4VgZCiDAGf+cW93ZdBKtZ5s36/HLuHYqs5nnLFRsMjaA6sVf/YHzm8UKXd63UQJ0wbtiMLM8d0
 BYYE26uq/4rYcrGV4hrYFYGvY8mGj0jYEIDNhEWkhBIb6Wsur08V22o8IFaDOaI7quiB23HzabJ
 xy+6e4hwT0zGTZBvSGQ==
X-Proofpoint-GUID: vEU8Uge9pBYxa025n4bOF0YqSECVXxEI
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6969db7e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=x8gyvrLTtEN-rIJzB5wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160051

Hi Will,

Thanks for the clarification in [1].
I’ve sent the follow‑up patch on top, including the explanation in the 
commit message as suggested.
Please lmk if any further adjustment is needed.

https://lore.kernel.org/all/aWDsFoEe7PHQaL9F@willie-the-truck/

Thanks & Regards,
Bibek

On 1/10/2026 2:15 AM, bibek.patro@oss.qualcomm.com wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> The ACTLR configuration for the sa8775p MDSS client was inadvertently
> dropped while reworking the commit f91879fdf70b ("iommu/arm-smmu-qcom:
> Add actlr settings for mdss on Qualcomm platforms"). Without this
> entry, the sa8775p MDSS block does not receive the intended default
> ACTLR configuration.
> 
> Restore the missing compatible entry so that the platform receives the
> expected behavior.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 456d5146831e..718d102356d9 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -43,6 +43,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>   			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>   	{ .compatible = "qcom,qcm2290-mdss",
>   			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sa8775p-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>   	{ .compatible = "qcom,sc7280-mdss",
>   			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>   	{ .compatible = "qcom,sc7280-venus",
> --
> 2.34.1
> 


