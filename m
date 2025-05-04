Return-Path: <linux-arm-msm+bounces-56705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B91B8AA877C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 17:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F522175BD4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 15:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA431AA1F4;
	Sun,  4 May 2025 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Muhs0tLx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20029154425
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746374271; cv=none; b=K722GYSNCYNYvxkdLODCjMZ6KthWQfXT9iTUeGAyJxg36PkKCX5SMVt4gdNU/ck5M0mo0XuuzfYr03hEzkRi5dXxCHLLpasYRhhCESxIu6vAlcd7gRvF/oKUhJ5yWqHxUeR7KoOSImEUEr758eRhCurdfNs3t6bv7DF4PVUVb28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746374271; c=relaxed/simple;
	bh=Dgx1jva6DzN5ZiPWjqZBOROZ41hVkAHSccmbGgta4qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lb37VUd5C1cizZAp3OHeJmdX+d4pd0Fi+ufRWSfBS70ucgerqyIbbAlecQ5D4NsxBN1Ky6coRlCvl95b9VxyKlyUpLoGf4o1FUEfJbLTitMJUMIV6AESIqvYIJkPHioPamh0bXt2wQeF4lx4CqulEoiD8ec0ZQzbNI2vn2ckF8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Muhs0tLx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Cv4mc003096
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 15:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+NBQddzgvDX+iZ2tGFQkPQN/
	CB+FVzuOwSU6o3vai0k=; b=Muhs0tLxv4F0GjAsHtYTZwiV0aE1Ojbcs+DMkUy9
	aXJ4pj5l/4i+4GO4tSC02XrC5zsZeRwwSr4vthbo0cIwk5IO3dSxp4FOzJs8Prji
	3i6UxhQDSPKiOQBziC4yFtXe/NZghgLC2CJZHLEMarbctkn4NErxbhOGugXfHfAd
	GyMSa1mygawfFIs9ziSjaQ8oM9Q6HIzkTODSEM28B2uH3+lUxmA3MZBIcwc6BMbL
	TbTmS/lbB29to/muzTgyjjPEN081PnKqQRawsfQL4EHSnuHfTuIvyEAHHJzuS5rD
	gGPddG8+z7dq8tW4mg3C4LQrtzQMbmBUdNw1mCwy2l/8Fg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg2621-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 15:57:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4768656f608so77457401cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 08:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746374256; x=1746979056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NBQddzgvDX+iZ2tGFQkPQN/CB+FVzuOwSU6o3vai0k=;
        b=Pv19qHpQAdC2nFDU4AQdEVVaxzUaW4v3OFrVJ/vNk6dOhLjR5RUAWVuYhdsk5YvM2q
         7Tv4Pv11kA/AR2swY52oyO/hXWu+hpqvHmXnHOZpANzJWVGm4vp7hBHTHVU3ZCmACjuA
         ODjpGuYyqWy/lvjBjbV2Xnh8SuzeAU07W0e5fyDdRFKxxIX+Se7H4p+XPuGxDn6CdoIb
         lIc82XnD1fVaj9pymYhVTJ7PF3Q1ri9PAydSmXMCz6M5D5Vc3wSVidHLTrDJnnI5XyM3
         G8+3gWE1Ef/e2FrrLPPXIQXRRMBr35bECb8v/lvveoMYNLXCbz4eacWuEZGfXN3XHn3z
         +dVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB9BhsWm2QeJDTJcXRjhWbl0/PUgP6RCKxpT+t5IQkz5BaJzJNBQ5oGv6nsluwUWlQR1hF51hspl6G/HRC@vger.kernel.org
X-Gm-Message-State: AOJu0YxkdMtA659ev8c/vR95L5Tz1s6qQTvy6PEhf24Ds2EplhGJ8jU+
	FCZmhRPzceU8OGiSGOHz6h2pDqpwSHwQDgmwlcyxG5gWcFyyxNR5vAhl7gpNXwJICoVAboAEkU2
	kabxyXLXz1MUcCpBU5T6bYI+PbDBPfMVRkpEPfqlT5OdDGeI0QcrHjs4YrWSlbZsn
X-Gm-Gg: ASbGncvpulV8Enb6eA0eqdOQeyo6iPxJtJM60u17e81RcEjeROE4LefthIy8Hdg/kpF
	X9Vvpx7o5oMDozjzCU3rT4y7rqlhBzxRplE7Mul283pYeOeZ+k1EzZll2kqanTnNh5GGFTis0S+
	dG4SWDvUxT2PQOKxz0TmlbsM+VM1VpOUB09+axP9EjkJoUwymZCcQpQHRRwtZoEP06kFZEWKzxg
	/kdaCM2PRT3sWijv0kK+ukS8avPduIAgzGIBGErmmhku8pgOO9/Kdy1d5mvEyzSjcrJeQDJQhBn
	Ev5gBUmEOuKWqbSXe7nWjxRt2STpFm+QX9wn1KgsNBXpvz/lgtUv1Mv9EJcxDeZlG3Vdkd2ZuoY
	=
X-Received: by 2002:a05:622a:348:b0:477:1ee2:1260 with SMTP id d75a77b69052e-48dff3e17ebmr59557781cf.1.1746374256687;
        Sun, 04 May 2025 08:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4apz9O7p8cmIJktiBqV/ploX2tWp4mathpyShsF97cdRuhrFPCVNENtImRJjdMdTGiCcezw==
X-Received: by 2002:a05:622a:348:b0:477:1ee2:1260 with SMTP id d75a77b69052e-48dff3e17ebmr59557571cf.1.1746374256352;
        Sun, 04 May 2025 08:57:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202ad908aesm12406461fa.96.2025.05.04.08.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 08:57:35 -0700 (PDT)
Date: Sun, 4 May 2025 18:57:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V4 08/11] phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
Message-ID: <vliufhbeztmvgoddhxsla5p4vmr75wmqf6iqlnqe7pnp3bobqi@thrwl33u22yi>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-9-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503162440.2954-9-quic_nitirawa@quicinc.com>
X-Proofpoint-GUID: L_vuIYusQh9Df3gTNxmROisDxVISmJvN
X-Proofpoint-ORIG-GUID: L_vuIYusQh9Df3gTNxmROisDxVISmJvN
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=68178e7b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1ySLA9CudziWiy2AdkMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MCBTYWx0ZWRfX4/Zrgd+dn/T4
 VNqHzQMtGPggW5nupIXYJdrLIV6URmVKGnVchh5U7nF8KDbdPmpZud3/MSQ6l1cyB/QRowp9xvy
 MjOL6TYvMKJOyqqGnsW+VJYP+ncJHkDLB6gz1El1D+A/ScP7T0xsFnaFbRmTDnspIPOuvBpfCvh
 hMMraZSgd8RELT6FQ6I0INZwLRQZgoNISEyJUWod0MKuhDZ4c8C4jMFOy/KeKlGHzZ/rG4MEwsM
 d2ro8Oi2I9zTmAeft63k6Vb2K7XBsMHMIm7fa0j80+IYf2GbUKP6AgHkKAkbVQ4ymNnLjk3a1L3
 lZQf0Myetl95R+Gp/xluRbxBb0omTeKRm/Y8YxAoR54EM0Shk8cOGxZG2/QOrCASTN4qZXHNpvR
 Rt1aiDWKJ+QXw/ALbhwPNhuNxi8sqBpQfATwqPF8ryzJThrA+fS8mfHqAtmMb9YEppPpVBmw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=673 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040150

On Sat, May 03, 2025 at 09:54:37PM +0530, Nitin Rawat wrote:
> In qmp_ufs_power_off, the PHY is already powered down by asserting
> QPHY_PCS_POWER_DOWN_CONTROL. Therefore, additional phy_reset and
> stopping SerDes are unnecessary. Also this approach does not
> align with the phy HW programming guide.
> 
> Thus, refactor qmp_ufs_power_off to remove the phy_reset and stop
> SerDes calls to simplify the code and ensure alignment with the PHY
> HW programming guide.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 7 -------
>  1 file changed, 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

