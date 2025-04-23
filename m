Return-Path: <linux-arm-msm+bounces-55112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE80A987C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 12:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 811224449A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 10:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20F626C387;
	Wed, 23 Apr 2025 10:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiU+rpCM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6751626A092
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 10:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745404943; cv=none; b=EQC5d21vdmrE68BXK9MeQMzocmYoiL8HNrY/q+145R/pV7EtuBTlZ7UO90HLmzE5p5xJYGA/G2hkmYMr/xna4hrXVdxISyLiNveZq8DV36qum9vqBefcRgfyASWi7MNNM4l4TRPHimwzmDYy0F/AqpbEwyBrtE2BJ/bfhisfiIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745404943; c=relaxed/simple;
	bh=+qd2CcY6IxK8CQAlvfKvFE8WrtuvDbfJCfTWsUc/asw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cnf3Kp/tipzpdJQN3TbTWuQYTUlbib8NL73UGT+x317ubiIkxl5RiQVMN1bJSJ6n3A5cX7bTdeRDcBDTPrjc9I7aBq+NpBKubWWwAflVkAHN7b03qPPgKkhBLIyRN3mA8+L2ILUysTMjHl9lQSqN4hQBV/wxQ2zO1xbuuk7m658=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiU+rpCM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iU2G014204
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 10:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B/sUVk9OKoRUIb1LnNSnSHgYKaMS9g0fDBib8P+9OBo=; b=IiU+rpCMYxFJiHvO
	+HIoPm450HBMyp2/oWkQm2mY9CR70Z8whPzjZGhAk/IyZRSfWGH0p9EBggmsGTmx
	5SM6b07V62/6+9pY/ewyDAo2NozPqfZ8ilG6Bfgz4BDVnYZeO8lp1gqR3IaHMQ2I
	/SuIXkgnYcpw1aOYL0rK3vwBmoqZScauKBgvZCAnCwlqrQdeFK69SnunOZuoJVMU
	FF3Tp1IE5haUORVjnilSPfPF6ZWClMianHp0rY9n1eIcVUQqqv2/jR6vV8q+k2jP
	0k1PF3fgyMGPEosjFsbyMBqIeISr9nYC5mNHC3HywwPmqhwtqKAcq1pclbFYf9Zg
	u9hFgw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh39t18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 10:42:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8fec7ab4dso14753596d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 03:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745404939; x=1746009739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/sUVk9OKoRUIb1LnNSnSHgYKaMS9g0fDBib8P+9OBo=;
        b=pD8PjdYtjYAf8wDXL2HKvfu8FNtVui73IhASUZSaz3coXjLH/7xzOKC+cVPTBgRg53
         CvHnC2gTg9PtBlpPqhPgn6wN5PWVmqz1Y8oBwanBcin3PxO9QyUIgLHlhrmZOcECz8EU
         5VWc9e/F/Cb1aafZGdHoGpK4aPcPWhH0VSZHb0GRhoii+ktD/YsTVMTfPl6xMhJP7i45
         mQ0AIE/B5IxmBtcX6gKj3h3FcePXTHIJGZGRWlenaB64/Z8Pf5vgwDj1US+QmGLjlHtT
         7qfcWD2eE9XFyrAIgvu7B5otyaNQ1ndP0FoTtDsv/ST9oPxUvaMftQ/PfgbK57ChYriF
         qKoA==
X-Forwarded-Encrypted: i=1; AJvYcCWMKzSjHSrSwIaiUqRnnZxRJaIh1D9hAnQBbNYXBZ9rUTxvAOgIpO5d/Ew4Zyc1XXA/LJBrSnYnW5nvOGBs@vger.kernel.org
X-Gm-Message-State: AOJu0YxFSAOdktUweHt4qsJfxDyupOwGSuOPn4V+lV5sSOdwLQsYMNvI
	6qgGWYsDvA/ix+u5pxwf2wy/IiASdVfS7duF8etnwvlE8h8jUDd5UUly587sXOM+vUnrf7BRF20
	osAvrGS628RyMGfg/Ax0+45eZ4uOQvgqV8/IfxAtfLiFDKxKtKYzmw3ldOD2lRn1Y
X-Gm-Gg: ASbGnctnKUBmqNrzDbU6o+jSwMJoKuCudz8eVG/9+R72J7FdPRAtDqXCmN6lFzLD7nY
	tv3GkIiv0Wq2TRNaS5yhKRtVtzv5tH1eqHOehnYOH4wi6tTedM/raiySpNzEowBjCXrmN88Rbe0
	J+KzyFmJLjcghpYzt7wJm1ZO+rohLWvyD3Uur0Uqm6bQMjZ7A59GfqoR/+Z2ubq8PQROthRo0t5
	IdImSWF3DCrFX2MWfg5hn67n3TRTK82vzmqlBWUkTmVUhFMH3SLDTxzrkhoH6zRLx9kMe7yGRJi
	CfZbvX95MYMDLqgKzsEGM2vnjjO1A5sufy6k5EZy1HqtMOL26NH0GepeGpGny4fXTCI=
X-Received: by 2002:a05:622a:2d1:b0:474:e213:7482 with SMTP id d75a77b69052e-47aec49d152mr115859631cf.11.1745404939178;
        Wed, 23 Apr 2025 03:42:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiwe0IYpezKkV2uUZMKDuNbDxC8roBj3sADr4v35lgHslXOIiXv/KaGkpVkodjQUBRrJJZSA==
X-Received: by 2002:a05:622a:2d1:b0:474:e213:7482 with SMTP id d75a77b69052e-47aec49d152mr115859471cf.11.1745404938830;
        Wed, 23 Apr 2025 03:42:18 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625577f3esm7330749a12.21.2025.04.23.03.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 03:42:17 -0700 (PDT)
Message-ID: <3735f288-5ba2-4582-afbe-8b3f5d0f280c@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 12:42:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/9] scsi: ufs: qcom: add a new phy calibrate API call
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-2-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250410090102.20781-2-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3MyBTYWx0ZWRfXyzeOD44akN6r i/qfFQLiArt0cfQYCaA/t8Af+uzKjmoDlpaKtlcKGIDee5oP5FuCjfKFpsSnfBVPYinVNurunbF 674sa+Nlqs6CtIvRFVJ2MbGwaT40Go5fXPNWIJF/NuIP/76BJbU/O652SF5+ylpMbI0IUQYMgXP
 nZfs003ihUVqhxpprknfS0q/r5HKdlWxjdI+6cqOaAihUQR47qdKyjKi3f82RuozqqZaGKO1f1A J95qLNUUpisVAI0ckkPBDeCW2CNbhKCha3PQLUjhcHS/972gYd7dsAF7YrQgAUa17Tr3mtY/kXJ 99fzDOq4AezQyMrhBpVJZGzoJr35rTJ6UTY+IkPV21JPawa40QvrOjpI9segPAezFYXphB4/WBy
 1U0CBZNHpQG2/stloQyKgqJBQb+juESdc7+Oq6NRlO5QsP55fLxD6BycQV1QDTekugQPjNZc
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6808c40c cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=P7VlLZW0XDfqy93HOhEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _clEPQ69S-thegmM51kGebs0RZsU0Y4P
X-Proofpoint-GUID: _clEPQ69S-thegmM51kGebs0RZsU0Y4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_07,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230073

On 4/10/25 11:00 AM, Nitin Rawat wrote:
> Introduce a new phy calibrate API call in the UFS Qualcomm driver to
> separate phy calibration from phy power-on. This change is a precursor
> to the next patchset in this series, which requires these two operations
> to be distinct.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 1b37449fbffc..4998656e9267 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -473,6 +473,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  		goto out_disable_phy;
>  	}
>  
> +	ret = phy_calibrate(phy);
> +	if (ret) {
> +		dev_err(hba->dev, "%s: Failed to calibrate PHY %d\n",

Please add a colon, so that it becomes "..PHY: %d\n"

> +			__func__, ret);
Avoid __func__, this print is fine without it

Shouldn't we fail the power-on if this can't succeed?

Konrad

