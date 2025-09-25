Return-Path: <linux-arm-msm+bounces-75077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FBAB9EF64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9EEC1BC59BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1958D2FC036;
	Thu, 25 Sep 2025 11:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVYNYtTB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A075A2FBE05
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758800580; cv=none; b=rcpAmvind8abgeZrC+sswjiy3hPsmejSkd40wv5nX3gg3OJ7B4TqLf3SeJVhGRfXG17W70Xv6QBzbm/Yw4+ni3joyc7Jd0lb+HqmYfJOelhFRugIkJwPaZ3+hoA/aD+QTNcyw3W9duNAU1CljRskeRZbyoijxx8z2HSWZzYJ5Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758800580; c=relaxed/simple;
	bh=VlRsKP0AlZXEr4syIqGk997jZca3LzoEn8FL2OlekIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hFK1f0i1+nigXKaEHjDUGhcCNxcLsKG7OlfgpQvXc1ww27Jd920qeaHspkef0+z42UF2GLsJOs11tfA11UrKcCrpROjcnHuc/LMJbLqsscO+at7jLGTAtJXtoEPeqSyhly3qxPN5IAds2h0sigV4sBkAiubLM6sgn7rKrJwmmXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVYNYtTB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9N0bA025092
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyoJlzEOQKYfqNHKoaUcAIRDzSzD2tltxogjlfJtGns=; b=aVYNYtTBYXtSmk58
	7CiczI7tYSwmHc0oxDkTipdO7KsqVRp/KCJNqg+kMobplAwxgpQrD+AVtN2hDZPL
	6Z3dWy7TRVwReegLkdjj/IVuRoQpGWafl2NNnBNifJsyG3T2HW3Qcp3It5ICaw93
	HyrZEJ/vmgaFBTklkFKdHtxSJQTpiogzkmtGOm7QlE+OWY7Ih2AcP85nska6ekuF
	zA+m4WnxwcUu21Hj0d3a+o7Irhzj+gMCOX3ecyf+ytac5b3PgMNPvaXJIaPcOcfW
	SGqy8ZORPEGQNq/OsrUzWHEF0pUVmyrSZPm4LY1/+lTbzTa0MzjdB7w0+m3dKich
	E6uzng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyf08rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:42:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4cad9f8f93dso1767861cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758800576; x=1759405376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hyoJlzEOQKYfqNHKoaUcAIRDzSzD2tltxogjlfJtGns=;
        b=c1dRu2v9fn+8KtfOjXZTW3yBbaPwXEiFVNnPcs03A+r/Rzrw9j/hmPcyynoU5lMieQ
         ZMpNkIij/NHOsrNOaJ45LM827MGM2M0vD880kEleQniAhLxkyGzDLlklbuz1vIJOWE2E
         chl5rPMkUeb7SZmeEdW9ov4A/S/wRIh4cKQ+TR8iknQm6gEDCfA1mBHAFbewU5lwCtZS
         6UsKfQydMVDl6hpIwVIujixm2/b1ORPwUqTxkGtx0wdY6g6LiAdT9aNGpWRB61o7afUh
         KLDwAxzOn2MCYFu4CcrMY1isikn6pndYeQT66y62MdmlfxWynzABv7ScpTT8L6r0mq9A
         wzTg==
X-Gm-Message-State: AOJu0YwuSdKPtT4XCSZuAXpmF3Q6uYYhVS5pee43tYI/3+SAc4V+w0dh
	58GSEcTeL42CxjapTRJhEZEIT6acVgXDdmDwLfiFdiU4SuHpTJKelKhWoG61wt+oHKSw0iMrG3G
	FZEe4whb5kXEwetOTpg3F3YPWiNtxFyQifqAJRIdXdaHCiBkyqtR+b4yPAWtQoyUP8jysqhg83S
	Oc
X-Gm-Gg: ASbGncuGbVo+XIMa8fA+jDLJBg4WhyecfE3r0QPO6Hc8wdImd2jt/8R4GJI2QI7A8rG
	5svBKuT1wPNcg+vEpvfWttmdHAO0Ie9cfhrzI/UdCtxGrv1F7xcGEjBZZ6JDBzsKFfvl7UNKP8V
	Hw+iMWn/cc/CaMkTuX9giI6Efhx5xxNxuFRcdQUd2OR1J2XpR3Krl3zkRs6wV7m23XIp9S1Tdae
	T0+fNsiEVLgpFsm0HJkLZZlUE9yaegWaOp2GwfnGb1rw1AGsYNmW61j+O1d0okK0JHBROrGDAdd
	/zAExK/X+wL+ybUh/2ox0Ixa2rfb/Gf57hF6IPTK2eMuldmNHkOt+QbSZkQMT47SuPBteCOtPaS
	WZDSGkDF+Yiih3Gc+/TrFYA==
X-Received: by 2002:a05:622a:1905:b0:4d5:eedd:6893 with SMTP id d75a77b69052e-4da4b806fefmr26721951cf.10.1758800576273;
        Thu, 25 Sep 2025 04:42:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWGRWLaOiykmDKGvjnmGh5TU7kHhYj22O4CIawL/S0c53YrQcQatBuiNwrwRSEZhIS+hFkJA==
X-Received: by 2002:a05:622a:1905:b0:4d5:eedd:6893 with SMTP id d75a77b69052e-4da4b806fefmr26721661cf.10.1758800575833;
        Thu, 25 Sep 2025 04:42:55 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629886sm1091846a12.2.2025.09.25.04.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 04:42:55 -0700 (PDT)
Message-ID: <b7855860-410b-4d32-afd4-84d61cac4a79@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 13:42:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-6-611bf7be8329@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-remoteproc-v1-6-611bf7be8329@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _0j4Y8RgyY1Hib2ied4kM1SVADum23mg
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d52ac1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pQmoqa-UAMS7fspmYOgA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXxcQEfqs2XsaL
 cwyGQWFSYU0DusebsllVF75Pb5DxqFfZqjytDiBgwLdQwzZLf04mn/OUGX+tB3OE4uwX+mAXHak
 aPiE6MkdW2GCjz4A6woToS5NGw3nKZD4cLyGtEk4Ec2G/x0emXEObOf+fqrOtzONN124iW5H5S+
 WFIVn5PXqFWKc5LS4Lhzx5eoXufvKiQUavpDqSdzFiPxVzmlVhj+w+aPF1Gg6tLNoIDbFtow2ku
 Zuz8TxH0zOKh3gljCM/13stbD3POXHFyBmQUdKSuM0rKbtMPmoR9NwzZJb71ttssjOyATLov3OU
 7k2lGQGbg5KqM3aKail9HzPzbWLs7SGN4YMX+ANYqXjs9ZG/XizpqUFueT4X24AMfB3DjG8xVjo
 jwZH5mJ6
X-Proofpoint-ORIG-GUID: _0j4Y8RgyY1Hib2ied4kM1SVADum23mg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On 9/25/25 1:37 AM, Jingyi Wang wrote:
> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> It provides a solution for control-plane processing, reducing per-subsystem
> microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
> platform.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 99163e48a76a..5007e1706699 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1487,7 +1487,25 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
>  	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
>  };
>  
> +static const struct qcom_pas_data kaanapali_soccp_resource = {
> +	.crash_reason_smem = 656,
> +	.firmware_name = "soccp.mdt",
> +	.dtb_firmware_name = "soccp_dtb.mdt",

.mbn?

Konrad

