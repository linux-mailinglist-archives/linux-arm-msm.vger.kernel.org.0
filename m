Return-Path: <linux-arm-msm+bounces-69167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4193BB26097
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34B453A2910
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB9A2F0C79;
	Thu, 14 Aug 2025 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InC+QDjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFFC2E7F3A
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755162649; cv=none; b=p7pZhHVBZjzxW7ox8qHLUgymqkJF+meX5W4hjjfdP5sERtj0f+LevIW5MJ5hMeAqlaAWjFrPdHpblXpTlF7P7G5aIiZOMbTGUMqjojdHmBI3g1zVnoANKhZPfyG5kfgm8ETuYLErRJcc4McJIWITyJdqYIcaFtdsAp6zrcxiIMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755162649; c=relaxed/simple;
	bh=tAda8lFFp65pOgTZMvtNSBa945TWBHuTFcLf76W4S4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VezIPd0dOPafTe62RjD5ZTj+c8nenXRrhqxaZA9xDU1DMbSOLYR1Q4dXhq7olqBECBA6Y9+QjE1wjH2Ljc6H/677AMXn8j4sBIRIJ8fhWzBeSmGOPjxuqnFzkm0YDNPRVMxzIR0ES2GVSa3RsTdSNOG3OKsIC7a2GRoZL0BVp1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InC+QDjJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8xKKT011413
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+CK8QBatZxbpeMJRWD+G2VTJdLA1+wNankRYjHTL/I=; b=InC+QDjJwbq+Uy/4
	UEqPy0MgK7Cjtba+GEAfNXm2UHs8WsqsqFBVRuHFCp6OXdtx97zPfLMygvGH11aP
	Hgh28fm0zus87L22fzYY2r+mwmFHbazdcmNKD93LgQGzZ4k/+eaJQsO4JZB2aNpt
	VQykQTySf8sfy4F+ZwBdC2ekeFP9fEJAAcMLzw8FLfUW6CeOqZzSRQVXVp7Mz+ES
	TU+KW83IsJXBKV8y7f96fY2k18yd0oyNMfcoT5VT1D+fA1+mDWVVjEHkh9nnG2j9
	LrQgkL4FWx3LKfTzDzeYGngigfLomrmSXNEqCuBuxJ/Zf71T5t+/gU2K/8M700MN
	stUbNA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbj8d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:10:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e87031ebf0so19760585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755162645; x=1755767445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+CK8QBatZxbpeMJRWD+G2VTJdLA1+wNankRYjHTL/I=;
        b=BCvNvSG62i4fT9QiPsC2rHiAZx4juAJxbpHfsRj4EfYE1iqJFL078cPiWYO4b/6Nqj
         JhQ3+bpiEPpwCjZf8qqXXVEotn5ruPbOJvobpNhw4eyKm7O960wautZqt40O9M5Fi6e+
         LzsMiHupA9j+eFsIRqdL0SyjmNPx25AUm9TC/Yh1VShSqWPlXk6+KXUcSzBTPatgm0qT
         A+qEntAbaal0uPe/l19gklcNHqnX/isaQMg53BYzNMyDD3JyrvUVfYjFUG4f+i60s6CP
         Idn1qpNx5KfwunsUeZ6bNtEL9XgCVYhjJf32jmeSbgkrmzLUVhIDu9z3IF1CoVuwfzUI
         yf0w==
X-Gm-Message-State: AOJu0YxBvv+tWcL/DXD3KewX2Z6CiZ4QzjiVBjBZ0pXmhoBuwYs3BYyA
	jcgwxg4GpxX1PQMhhVv6BkzcmR1HZBrNGTmhxni/ZDRRuxqebYC7a+LCmlXutX2XL23toJjOTFF
	lYNJs2+suhxyXMKpuJX0Pc/r0vZ+XX6g9biqWlzrTzyGIoUrqTSK14koey8zSP+MSPXE8VKlOJU
	o8
X-Gm-Gg: ASbGnctSfwOcs3b2brCekE3uC0HLrwm1yk9AldRWf1jgnB9nC3ixcChv0zHe+8MWpqH
	+CFgrCJPk1l0zW9Ddegj79/HK1YkfS5OWaWraN2qaDdWRjJIsc75HuK3nyjyTs5Re+wJ9lfKCWf
	CeatuvuSpBPuoiWxM1+aaXAPGop6nAV+UaGd6DT7Au2NldLlDsjm8HmCzZyMg0KiowDLm/FltEi
	G93AwfI8gtC7LLxTDwAYo331q9skCqK3HDigb1Y9dQZQz2km04xP4MrKr+6arUk8ip52aWbPhRo
	KNqk6JbSydO4HgJnhrEV+/YxtUi1aMneRWLMrjBHSaMCyJter8KBqTaqrkfmv6EvSQByNVXyTFS
	UIXU9KusptTT2jIcB3A==
X-Received: by 2002:a05:620a:17a7:b0:7e6:3c4f:fff with SMTP id af79cd13be357-7e8702ff7d0mr181122585a.3.1755162645202;
        Thu, 14 Aug 2025 02:10:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn35nVFpbW4SQ7GGUjk0NbSwr7QNZskeA5TBdBYhzOrCzf4UEpISooyNIg4+oLGOSan0/jPw==
X-Received: by 2002:a05:620a:17a7:b0:7e6:3c4f:fff with SMTP id af79cd13be357-7e8702ff7d0mr181121085a.3.1755162644705;
        Thu, 14 Aug 2025 02:10:44 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df2e4sm2547262966b.62.2025.08.14.02.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 02:10:44 -0700 (PDT)
Message-ID: <330ba090-8036-4451-a74a-9055a811b2c4@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 11:10:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -v4] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for UFS controller v5
To: Palash Kambar <quic_pkambar@quicinc.com>, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com
References: <20250814065830.3393237-1-quic_pkambar@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250814065830.3393237-1-quic_pkambar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689da816 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Nfjzny0KhGhuxlGztiQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfXwEKtkX2kRZ8N
 n284UNkbxjYWNMhtc2XmWqr3dC0JfCGuAnxZX/w5fIViAvwv+7TQ/CTqo2W2DVudq9n9XVtrTVz
 YbOF16LH6cCYu2b3XF/Vq/HWCa1FGthWGk1WyPmI5f37oW1yXbKWgiVgcgTp7cPfCkDLs1jaIik
 d0w1QCYdWLhIyr44T12q5lJPd6SdjjsVgaBP0+Fax8d/Na4zjmEyF0FPmupU+vuBb7+62eC5YUS
 Cnbq8pPqAjpJrbZz9925rq4Ij1TMxf/4B5G+3208v+eqh3VQ2A8UDbvWjyEOmV2rwFatpU+CDoF
 am5rk/drOMpKNgy8AXjaV3aljvJ/2cWqa/mKmG/uPUnZXCOGY71izRoBw8kkipnaMCag3bCTjrW
 wQtaUeIq
X-Proofpoint-ORIG-GUID: zZ0I3FF5pxzAP9EiwWMzSL9XKFVoC_GL
X-Proofpoint-GUID: zZ0I3FF5pxzAP9EiwWMzSL9XKFVoC_GL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

On 8/14/25 8:58 AM, Palash Kambar wrote:
> Disabling the AES core in Shared ICE is not supported during power
> collapse for UFS Host Controller v5.0, which may lead to data errors
> after Hibern8 exit. To comply with hardware programming guidelines
> and avoid this issue, issue a sync reset to ICE upon power collapse
> exit.
> 
> Hence follow below steps to reset the ICE upon exiting power collapse
> and align with Hw programming guide.
> 
> a. Assert the ICE sync reset by setting both SYNC_RST_SEL and
>    SYNC_RST_SW bits in UFS_MEM_ICE_CFG
> b. Deassert the reset by clearing SYNC_RST_SW in  UFS_MEM_ICE_CFG
> 
> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
> 
> ---
> changes from V1:
> 1) Incorporated feedback from Konrad and Manivannan by adding a delay
>    between ICE reset assertion and deassertion.
> 2) Removed magic numbers and replaced them with meaningful constants.
> 
> changes from V2:
> 1) Addressed Manivannan's comment and moved change to ufs_qcom_resume.
> 
> changes from V3:
> 1) Addressed Manivannan's comments and added bit field values and
>    updated patch description.
> ---
>  drivers/ufs/host/ufs-qcom.c | 19 +++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.h |  2 +-
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 444a09265ded..9195a5c695a5 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -38,6 +38,9 @@
>  #define DEEMPHASIS_3_5_dB	0x04
>  #define NO_DEEMPHASIS		0x0
>  
> +#define UFS_ICE_SYNC_RST_SEL	BIT(3)
> +#define UFS_ICE_SYNC_RST_SW	BIT(4)
> +
>  enum {
>  	TSTBUS_UAWM,
>  	TSTBUS_UARM,
> @@ -756,6 +759,22 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	if (err)
>  		return err;
>  
> +	if ((!ufs_qcom_is_link_active(hba)) &&
> +	    host->hw_ver.major == 5 &&
> +	    host->hw_ver.minor == 0 &&
> +	    host->hw_ver.step == 0) {
> +		ufshcd_writel(hba, UFS_ICE_SYNC_RST_SEL | UFS_ICE_SYNC_RST_SW, UFS_MEM_ICE_CFG);
> +		ufshcd_readl(hba, UFS_MEM_ICE_CFG);
> +		/*
> +		 * HW documentation doesn't recommend any delay between the
> +		 * reset set and clear. But we are enforcing an arbitrary delay
> +		 * to give flops enough time to settle in.
> +		 */
> +		usleep_range(50, 100);
> +		ufshcd_writel(hba, UFS_ICE_SYNC_RST_SEL, UFS_MEM_ICE_CFG);

This was supposed to be '0', IIRC

Konrad

