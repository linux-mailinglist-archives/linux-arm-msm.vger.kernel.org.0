Return-Path: <linux-arm-msm+bounces-55298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAF6A9A791
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A96C3A33D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB720215175;
	Thu, 24 Apr 2025 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIyaouIP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2414C2101AE
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486454; cv=none; b=W94kzELISodA/HOmFuQxEEmgsRZwCn+ZlXVyAn//z6XL6V9J+3XzVxX1vlM8UdAydyIHMkpegLCCR9SaF4orXXWoKWdTFmgUtM3aGh8HdVJI4YA92SxTVwnipAx/k7BPDBRrYe6YxtLDSl0D8WLr1sSlGTSJpjmo1tSgAjoRkuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486454; c=relaxed/simple;
	bh=CF/aYD+Nsr3nocmtFfWpxD7GOTbvRFE+GGinm++Bd+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXChJZlELwd+T1WT6PDP9FRJrWuFkNvXnRGZhzUZ0Oujz/d7lkr8JvJ3RquoJxUG1MaVM8SsYsoFDhSHNQM/s2u0//jMvCJo9QpNhfz4A46VPUONaRbk2xCKqLhRO5MWiUpLa7v0oBjs4RiM0o48OjjqJIh6N6TeB5tuooYzkJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIyaouIP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FABV008930
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pDjRpH+J6CGnlh13kx8+R3WX
	Es3y+59jkGLHtd1EBuM=; b=eIyaouIPCacxeLfjR4f2BcE+tC5Uyc4i13ntg/T2
	3SLbX3AphGht1EkW9xna1jbWAYTl0Kh1+8q9Or5bsZIiy+LzKsb2dLfkN1WDxL4J
	dAYiXMLeWN0fEpyxIJC2946xzWKvSpWDg18VNPDDjCKK6367A3/Q85rKetPVGWhZ
	HWK3pfu3M/e6EOM7ACryW9dZxqpMBQ+kTbPewwJs0RM0OEY042dlGMvLRLFlT07d
	PxGwZbQrqB46wvqGybo+k718ZlFXijJZL+l59ZFf+2LMRDBCDlw8PNHHY35OgSfM
	DauWW1SKhgrSavyxOhBX0zn5kIIDGemu/s0Q4J5ThtYxyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3cwyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:20:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c09f73873fso106991285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745486450; x=1746091250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDjRpH+J6CGnlh13kx8+R3WXEs3y+59jkGLHtd1EBuM=;
        b=wekGcCLFOa/jIcQx3w3ZqzbaEym2rJHG3RyzB43xs/J4SWk+/S2lou+39kp69VwADz
         wtf8RcBiLYNdH5Drmv078Xgsjsj7G5nTR+waDvPEji9zLSrQtDFz0fS4nis2sHuAxJbx
         1C8anBp8NTLOvflCo/xeheBoi+ZFm9UTesDh9wj+ADHSWwVJfW86GObB4YH86bwwYXc+
         hT+4p+uIxx0Zqo6grX5LsV3z6H3dg53ZB11p4XtC09Iz5udGrKEbX6rw/60/s2IRd5qc
         4iEqmXLD8ZNP5r3Ooi9TyhI9wCkYDZB+/HJggNPZQA82AIEz6FzSTKZcx8RPEFRx8FTN
         Y4+w==
X-Forwarded-Encrypted: i=1; AJvYcCUyrw320gCIbF7vhu5ZibofrKD/QUko1/nrH+p+8o4NKDM3w6GBi0UXwyBbK6pVbBEAtaK6NlfKcsxTOaki@vger.kernel.org
X-Gm-Message-State: AOJu0YzLh+6S0Q7z1OcM2B5AbbbrP3Ir1gl23W/TB1Q6j9297YVPeegF
	feWIR6sTXF5JGNu8VFUj1gkSHYcE2e3TuRzE9euJN2YJYh13BETweH0+2GH864gkfHSv8jkVt1D
	tjZjxatzX3O2/njD1xXK0Au5YSceSDlodx5lRO9Hr/C/g6EtYTTpRMxp/DCa3gKUK
X-Gm-Gg: ASbGnctra2NhDMIoyBImXFO94mhoyXpdrElmckmi82yZkV/ZFB9tTcVCfIjsDKPDg9y
	3Umx9zOz1+dXUo5gy2tXs8uFXr+v5mfYC3l7KfQ6AipapaTNwV0od8qcPRKWji0AWokABRlCz1C
	DZ79xliLnXFCOBvNmuZb5h8PY3bPg+4KfukycDeAGUW82WAIr7gsKY7Gjl11M4pKxfFBlgpaWLX
	TtLH54zRUOAx04JgChdGfAO/LFOtRSg0p/I2PRvF11YiJURxWWdUbjrCsOdXosx2Lj6vR7T7Ri5
	g5QyycOUDwJJRPeEJCmGXGVBs379UsyZgftTb2dXOWJ+9BZD6AxjkiswwSUPSLP2dyXFGGz+POU
	=
X-Received: by 2002:a05:620a:4054:b0:7c5:4b6a:d862 with SMTP id af79cd13be357-7c956ee938amr279922585a.33.1745486450684;
        Thu, 24 Apr 2025 02:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXeic/MNkIklWTVv8k/JVRx/CtwZ1JpYeAnulapKYrZSdZyMll2kb0qr3b+jhkqOfvLBmVww==
X-Received: by 2002:a05:620a:4054:b0:7c5:4b6a:d862 with SMTP id af79cd13be357-7c956ee938amr279920485a.33.1745486450385;
        Thu, 24 Apr 2025 02:20:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb88dcsm162385e87.253.2025.04.24.02.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:20:49 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:20:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: Align wifi node name with bindings
Message-ID: <nsbzaqjloqm4jnwiauabgmokhodtxgbkri4lqhk23f3vcawymy@i2vigckhuvql>
References: <20250424084713.105080-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424084713.105080-1-krzysztof.kozlowski@linaro.org>
X-Proofpoint-ORIG-GUID: fysWPNaySVtppTRVa3g15ZXnG_Djmy3G
X-Proofpoint-GUID: fysWPNaySVtppTRVa3g15ZXnG_Djmy3G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MiBTYWx0ZWRfX6s6LPGDsgCMq jyUKyEdAsHnK45puMVmbtmoyK22sRSqU6psHu8eSi+WU+IWTha1MSxKY/eORbY0Qeepf7iDBoN9 Z00F3mAKuc86SGp413rgEsICh8TbM8KzydiTLLjgWoJPBFPhEYINrPpU1dy5x2k9tis2C5jUw6j
 rmj/swdWmLkBQofAIEReLwJ8utzqAAJod3Kllm+zrXXBHIF9UUjc90jsiZwavt9CUCfQdK1fdoM 6BkhGCkjsOv9OYFIv7voga1w79oeyR5GtGahn32xPs7dCT5GE6hH2JuxRhf3oJT6KhXYQKOuIxI G2y12deDR4+k8t+Uv3t2UIoAaYktcVQ0qAE0ePKeWqC+lF3SU+/BUIpjesfmEI1MAY0UcWNT47R
 MeIZmC+6qHVJlZrNX3n3G6XmRcBVeHKk7gGtf+CRrtznYcPcz5Q4qiQIA3OGVuYa/bwbGrUZ
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680a0274 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=IEkoaye7scGfjVXCoRQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=612 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240062

On Thu, Apr 24, 2025 at 10:47:13AM +0200, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>   qcom-msm8974-lge-nexus5-hammerhead.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

