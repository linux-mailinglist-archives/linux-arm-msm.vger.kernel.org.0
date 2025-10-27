Return-Path: <linux-arm-msm+bounces-78843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA01C0BD41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 06:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A9DC434816D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 05:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10B72D0620;
	Mon, 27 Oct 2025 05:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oLrLLA04"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654E7239E7E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 05:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761543284; cv=none; b=IZC5Yc81i+33rzwFIETZ5rEPLs3DWIWAbtPdj49XjTBO2eV9HcGmDpJewGzcldUpac43qUhqmqOiWainM41Lei7hPk0K/y0sEorj4mj40ZXuRROwkty2ZSxZJrH276DRc/hNRXSnJqFLtfITw1LKkgDPLBNcyKwLdFH2/JeO1Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761543284; c=relaxed/simple;
	bh=TpwCVWhyQJkTI7nenZ633M2sn0NC+Uz9kQnNDboTU3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DiJCSK4qiyu9ZFZVSERC4L435/Pxgk02kf98zB2XOuTESso8L8RbcKenfQJTayDdIzkxtNLtRVmsPZP7408rhMeKEVsXZT5xwO/3WySjSl7mYnlECH2oaddJSJHzOCrXZsbVJegIeHg8YSs57yigRYJGwBvS9Ylmw7h5hA6fUHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oLrLLA04; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QNNvCF1080537
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 05:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PDIEKrvO3DowKo435wUZPP80lHdzqRLWRnZPmnjleSY=; b=oLrLLA04TCdy6UQS
	YGPo2ammUm3wbnY3C7RMbwFwkDisjamfWSRWyFPcPgeTkgs1bmpZN2jidzVy8fZf
	+uHofYu51uho88tXASjHN9Ff8NadUvM4qxlh7o3kyBrX5Csa2ZZM1ZgJA3NhI94l
	uBK7KGimcZVo8nzrJwmDE8hV3zoxbp3dZY0J8XxbeBKDSptSDvyHzCOHtFfk7bb+
	Bc5Q5F/bUmf+qUKqqvDG7Scc833NOowsdIHQAfzkq8aexyXzJDYTnlg0SukSQpGe
	T1hRZZ4iTtCDdvcArApufVy0h271NM+QVXbtG3/Zx6uBoY5QmKXb0WMQa/cXuyZm
	RNIArQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0px6k9c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 05:34:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a27ade1e73so2775561b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 22:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761543281; x=1762148081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDIEKrvO3DowKo435wUZPP80lHdzqRLWRnZPmnjleSY=;
        b=UsWTN7nMn5lc2yKB/xBzRMLE6VUiPGo8YAcR2xQ0WqM6blIlqUxC/iyXD33QcSYeDn
         wQSyAzRKmWQDLj1R+HjIa1cDCe1fFbt9vvdFuaBDCBQKlZkbSXUwLpto2GQmOxMmX3u3
         vQaGc1GaquvFjyCt3TCeHoAVDX9uOQ9NZqO1oC3iweod+iILr7J16kqc5NwPyL3snpES
         QDVJaCiaRbiI8OYWDH0JTaN44yvqluJQzHgZgvnvaBVDWQaoq0S9+wj7YulAcoARW3rE
         ydKMC42qTDBiglhwK502rx1yDeZwBnbMeTgIm0lu6Vz3eq1XacVfbUDxZEozOaBbOybe
         jCzQ==
X-Gm-Message-State: AOJu0YyTE7DhzBg0LQ/nPcWkaBGg3p8R+ypfDRO6zQ4WZNtTl2XLMPBu
	P4T20MzbjtXftp7BcJfTzHHMJWQBwPTFJnS7/xiOGI0FavBALeo2zPPGeIEin/pdfdN5V/PDEp3
	ynF+lSyByhHxfq+YT4GHgYDzbl2aPkmwhCbdFfEDOeR6IzPumE0QdIX8/bN7QlcAq99bu
X-Gm-Gg: ASbGnctagGxHPcl8llM9kn2FeH+GqFxDjs45oQxe1RHyqC0RsHShD7beSUuEaNnx7Qy
	BoOH/cX1LJRyzHEa3bEqgoiLEcot46GfNVUjrNbzp3tjJCyJW73agl9P4F8Q5L+IkLVa98sjyPa
	7JNZYIqMXKfMZFQaBGef0k/mR327bIw5wETeDrJ9HHspPyC75thk9ym+NOuyKtp4Z/tDqK9suG9
	eLrqDim18uWU7PLHvRO3O2FTk9ZhjW83WcGSdBKk7SjxBPiU284xriiU8npDDtdgCt18/qgmOfa
	62dRae+LtBfg4a54lLCc5WaURRH3lIAcSBKZfOlrtEkPmf2o4C0z67oo9u8Ss0fg7LCxfzA4p0Q
	5UQpf+R19kWLjXcZh2Se6y71cmfMD5jU=
X-Received: by 2002:a05:6a00:88f:b0:77f:2978:30b0 with SMTP id d2e1a72fcca58-7a28678f6e3mr11579284b3a.11.1761543281279;
        Sun, 26 Oct 2025 22:34:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsIO7GRXzKhtowLGxLS5LBUo3hlx5I4P7Z0DOgENX3Uogg441FvmN1zhp7iRNv2vxDxvPtpw==
X-Received: by 2002:a05:6a00:88f:b0:77f:2978:30b0 with SMTP id d2e1a72fcca58-7a28678f6e3mr11579250b3a.11.1761543280776;
        Sun, 26 Oct 2025 22:34:40 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414087d2asm6877609b3a.63.2025.10.26.22.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 22:34:40 -0700 (PDT)
Message-ID: <29e4ddb7-0ed3-74e6-78d0-396eeb201fc3@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 11:04:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: qcom: iris: Constify iris_v4l2_file_ops
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
References: <20251026181138.13387-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251026181138.13387-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA0OCBTYWx0ZWRfX6lZ6TYIrBWGf
 HOcMJHZHXrDF8lzOZPz+8FRRh5tkv+nK8AZvcnZq48aEuHI4+1AKDT1en6fPsxZNYfZ6ezekl2F
 QwrJTElI4fEpJ7PFzADxXtDBzJ8LxxhD/xNbx3asmJeszE3IfAmYaYVFq4b9o3fMocBaVqoVh64
 7zybcVf33t7TISfw2uLNo5kD8FEnJvjUr7p6Yrxmmi9P7nBJcrAPE77eDZAY0g6ntHuNRyQrQAx
 vhIIpB4OAJkrxpSiXbGWz3563dvTzh0ExADT1StVGBTdspeULrXoj3QMgG1uYd4QmLafBDR51CO
 q9tQSQxbUVWaomsOIBU46NoyzOaSyEtuUMM7M9dlg9v7snWJgXqFhBjc7Ft+zQNWR4ugpXGXIKt
 gjFmTLsGpUQJhoAwlqNe/v3kaK1U5A==
X-Proofpoint-ORIG-GUID: 7QWqEtlHuBrwKobuNqNK9c8pTaEZ5T_d
X-Proofpoint-GUID: 7QWqEtlHuBrwKobuNqNK9c8pTaEZ5T_d
X-Authority-Analysis: v=2.4 cv=WqMm8Nfv c=1 sm=1 tr=0 ts=68ff0472 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=3tk5DILjExYhGTJMbPgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270048



On 10/26/2025 11:41 PM, Laurent Pinchart wrote:
> The iris_v4l2_file_ops structure is never modified. Make it const.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vidc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index d38d0f6961cd..c9b881923ef1 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -630,7 +630,7 @@ static int iris_enc_cmd(struct file *filp, void *fh,
>  	return ret;
>  }
>  
> -static struct v4l2_file_operations iris_v4l2_file_ops = {
> +static const struct v4l2_file_operations iris_v4l2_file_ops = {
>  	.owner                          = THIS_MODULE,
>  	.open                           = iris_open,
>  	.release                        = iris_close,
> 
> base-commit: ea299a2164262ff787c9d33f46049acccd120672

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

