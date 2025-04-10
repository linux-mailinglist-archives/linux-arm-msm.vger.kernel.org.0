Return-Path: <linux-arm-msm+bounces-53914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7465A84DD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 22:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFA727B68B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 20:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412401F1510;
	Thu, 10 Apr 2025 20:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAvcKzSW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B850219DF99
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315535; cv=none; b=W0kZP+7tdNtNx2RkfWQeDn5XWpgtiNiHcTcJxqCZNdAk9D10DAudpFkvhZrr2nMwbkxKaU9jCrdqF4VqdkhkqUDvPKsJV4dMSZ+auKHkwWEnQFlImDybtVi7bsd0FOU0fsPrcUKdjx4mgn5gsluquYZasE5GKaIgLhNwGBZ6cAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315535; c=relaxed/simple;
	bh=kE0juyTpiJRFvY3bhCkubK6oqwgvbhtJEpj29J8UYsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uARMph6iSJxOPLi147f3oseW3CJrkcpSONCY2DuCDl5Al/EYI4rcVFBKg7Gf+lhK73jjiu9WCU1Y/ZPb9h8B6LXry/ByD5DudQ5sZpvMB0/exxi9nsIh7F201zGKfpiRU/U13anEYAiUFvCc3HyCrKx1LRE0hF9AsSpyczbqvVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAvcKzSW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGA7Hq000635
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TXfF9vM+BoIBd/qesq5gNZSO
	9HgKKIqscZ8pGO8kuqM=; b=IAvcKzSWfZBOeARWfvOqiUotdPXWOaEavfq48bcu
	swGb2WHJy0XVTswakGO7TB8Y5YurgV5MqfYNZWaKeO2bHSXB61bGxbZAWFJwKSni
	12xSCl9zI8WAs6X3dfXoB2LTJyRQAECKchgOtghHzMu6a3sd2pfbIh4jkoRrwaRO
	mI2yFmw1TUikbGaNo+8SDHD1CisIXAy3RA5hs3rXL0XFHrV/kTDcwOZ2V0PglAFh
	nM1MH3X8TChqnMWmCne+6B/JUYWeGqiiIyhIiYMaYnQ//9Mzlkt9tOcwBJWoCbq9
	dHCgm8fGQxgZev94yn45I0mTzHSCKmMftZyp2fhKY+3dTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd3060f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:05:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f876bfe0so231791085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 13:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315531; x=1744920331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXfF9vM+BoIBd/qesq5gNZSO9HgKKIqscZ8pGO8kuqM=;
        b=fvlCxdTyUORYdbwf78N26GtXi3qRfREuIyVzdTVWgwPTrepPX4RUAd1loye7/UKJLb
         wfwdnWxXGzf92CGEjBAelaeGzVOCystqXZ9tc0oPLpqGhs5GkrBLoTn8EK6mVnaa6Ntl
         4R9MkR0RYPalMr6yRNig2EaxbTBihQKvTkpO8sbEGCa/VwUqyGWpjmtVqQq8e9JC1TpF
         HR3xCQa2QTEXha0B1yrX/c14lpSgB2LHSnhnP6/QGQG2UyCYl2W3m3yk+EKpmQlKq7YQ
         5X0augMjaBMTQR9iwCb++6avu996ibZsipvAQgIcRhr0AJcNy9834KyfHORmJR+Vhs6u
         AH9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaLnSpYamJL0RR8Ca2XZQ9NEzhghcWX7aZ/7qpUgvy7KEmuUc9J7dUY/5rCU1MR7+WEZmfUy7fXcxZIcdS@vger.kernel.org
X-Gm-Message-State: AOJu0YzjxcM946OJlrxD2U5+4DI2/dBv2phtsF1IrIWeh3RhrssuE0u0
	xvKBQPSWDYgNwXtrbvheJUU3KxcZhesDuQLua2Yl+tHVUo5JU6k1+ghv0mha8Cb0cQN42vDWsJh
	EtnnyVMIe7h1x/0wHHT7BTKZxs6TqRUEOxjpAKZjicjssIP54DChsnCJS2U3qrqhF
X-Gm-Gg: ASbGnctQte0JU+maPtfEXR3awdwNK4JLRWdfwQY4DaNVPe6uhO1wwgdCqZH+GnFYKkq
	AcnJXzoHlCVBWDcKL7E95zNye13q2T6MIILLBicBcm0PiTZphXXSE5ASLEMk0LxbykEVKlsHzrI
	R0W/UNktaSgKISxxC2D0e1wcrPui5tVHxYVDrK0JLHy337VO4FRPeC3H3my5g2cf/i9DH4Oe3Ni
	DwWWqOcr0BkOV3yC4xaZH11WmKdAL7rxk/IhyidDk0wGtd7xcYEeRb3OuyNP4Zvn9bPHPakBeWw
	PNuaS0Pz452XAYMdC6oQjVXuzp5m1I7KFibUjapLebp2XvKHagtrw9zenqph7mvQeaJg9eN8OSY
	=
X-Received: by 2002:a05:620a:19a9:b0:7c5:53ab:a74f with SMTP id af79cd13be357-7c7af1f32famr39461785a.39.1744315531609;
        Thu, 10 Apr 2025 13:05:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNwwRD5+XOsvvXwA7FK0l1NN+2EkzlXU5C/nqu3FRHnxldNXsWpsj4tAqkeWZh4iuNHA2zcg==
X-Received: by 2002:a05:620a:19a9:b0:7c5:53ab:a74f with SMTP id af79cd13be357-7c7af1f32famr39457385a.39.1744315531220;
        Thu, 10 Apr 2025 13:05:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d52084fsm232846e87.255.2025.04.10.13.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:05:30 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:05:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V3 2/9] phy: qcom-qmp-ufs: Rename qmp_ufs_enable and
 qmp_ufs_power_on
Message-ID: <2hysso6n4f5tnyknmgne2r4wpy72j2taqwuncqdcwqqztr4g7y@a3scnple4tew>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-3-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090102.20781-3-quic_nitirawa@quicinc.com>
X-Proofpoint-ORIG-GUID: EoE7w0Sw2NziDpsHSgkaCA-COSgYiCpR
X-Proofpoint-GUID: EoE7w0Sw2NziDpsHSgkaCA-COSgYiCpR
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f8248c cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=hpSo_X1Mu2B5NIsQaEEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=736 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100145

On Thu, Apr 10, 2025 at 02:30:55PM +0530, Nitin Rawat wrote:
> Rename qmp_ufs_enable to qmp_ufs_power_on and qmp_ufs_power_on to
> qmp_ufs_phy_calibrate to better reflect their functionality. Also
> update function calls and structure assignments accordingly.
> 
> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

