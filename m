Return-Path: <linux-arm-msm+bounces-66585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD64AB10D56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADB211D004D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844D82E3394;
	Thu, 24 Jul 2025 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xckxuzj6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA1A2E2F17
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366805; cv=none; b=glGkWxFrbNaQCDFGrhv5bDQFTgcd/pD87C2gtgPa+xQe/Ezo6jLGZVE2OJ2zXfpWCwFm6Etg8YkA9mZWf7/nMX91ed2MNKJrLnaNtgncQF6Jz2L1y6mYLy6dl00Z8be6uzvTTK1VItXuALXMt7Ry4JY8yGPiYx2Ntta4NfM3ST8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366805; c=relaxed/simple;
	bh=RB0MXSL9iAdyQfhytAVo156s7TbriQQimjTjISxShuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdbqzWbHGLvVT8er/ziTwq/6QEPkFM3JKGd4XWmhmz5FgE3aAFbsWTbFho9Qsseox2+kZMYyUMHv9i+sqANN91nNwt1RJ/mpPLv7OLS9AHOwWf20eDGf61zsn3oNqbILiHg61zNaXESwUnq5nmRrjFGkz9wfMdFs99J+HcXIKzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xckxuzj6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9Zh1i001529
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A+VdurEKUduQkz+MfAKRObdV
	YePeVHPl1wVvZbZgeJc=; b=Xckxuzj6GDcsD/3rzVHt9pBnkZoBD/6fEgbaUWmZ
	7vx1oTdWAS+aSMsCN5L5w3nHLUQzfMNpW8qeh1dk23Y7oR6z2xgwN+CqOndRAaIT
	FF4Ba2X/m53dxzIWPB8wz2SgsXrk+sogtrC2xcqsHKQZKwL+91Q9lXqK7EArbHdo
	nr0A/aEIIu6WEnvqgPzI5BUKP1D43Qm8ByGQ1GzTHSLVgVuwpiak/d4ITYRphyOY
	Z5wTfuQFX948UOU9nFQevWR2ayHkuDYLU0arv/l1zw0eDaEBjUV++XYRykTvmk/R
	FjigUunVkkwXNhBjDRH75Hgsgjmw6/NiNPuTnEvWqLqIkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ufkjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:20:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e2e237fb4eso182884685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753366802; x=1753971602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+VdurEKUduQkz+MfAKRObdVYePeVHPl1wVvZbZgeJc=;
        b=DR12Q17Hzs0mFlK2LZ0tFcoAYowIb+X7qFdGTd9DXdo9wdLVvwdZgB6wdc/K7UKaS+
         bMAdIf6rZst3coOdddp6mv4bsrfafgLaNfz2nblFPu+p63l9a8Xy0xwO4vFSQFKDEl3R
         WafGptlsETndeWNL+JeXYoMd3U6d+zPAHZ5rtE9cWJIexLR4ptVaeIcp/t+9VYGg7M6i
         JWXu6gzTN+nR/tdL9gUwd2xeuj3tXgOXWpJKoewz9NiY3h4AndAdl8R7DmL46z12RNVI
         FXTXIRt0p5kJABlN+t77G60tF5yXb83pInx9jMTUU5WWjcIwuA7vufIjsMDCvugKuLGi
         ZwdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNovrQ0jbHv5PU7YyDSwyf3rd4i7Xd3GPc6nsDYYwWfLVC7R+6+fefQZVwT9IsV3+jVZWgBFj5TRVfd1PT@vger.kernel.org
X-Gm-Message-State: AOJu0YwET2Op5m6vIhuyVdOcTBIOwOu82qbzm1flRI3T10RY1aSW2pQi
	fZ9HdKaXICAcKGI09tIBEgp8Q2GwwHDkqs2PHuU16lAwFXvoTgwDw4b5PkYAywO+8FwPpBzey7E
	B8wGCtmdNYCqnxsCzDlNJ0c1GXOB4aeQ7urnVeTSXcMRkxaCCDZ3GklN9HDCaSjwFMz46
X-Gm-Gg: ASbGnctnflojlUgZUf9iJfmurlryqu+MEQSv35Lfx+OQ7eU0+n4+lHqgy4eEHKsSp1k
	B23NwoEBBBrvcrTocn/FVQ8TIDnKIKPRug5xltygq1rUuuvVxzmBAf1lrxU6baBKaJv67qIAJDi
	X5SAdSfjjH4ymayTQ27fTCZHKuRTDi6fGBkvoS8Ta/mYPm8rX6QBawtNvv8Gk7Q7MN9p84PK5H8
	k+i/8XVneGBP7S9fvqnZ03cL8a8j9g5M3rqK2Y3AX28Z8f53sOOD8Va4fKrTzpqjmiGMEdJQcgJ
	NfbFdE855FiKIEWuW67s4r1BIEeMBxJ14adrHHx9qpiX13DLk0opKh/w15JDjOuqiOKif2P6l7M
	lruConkNPuUuZw1tGHKb4L5NYmMVFEDbLWEjyjKm34ufRMeMmeZ1D
X-Received: by 2002:a05:620a:a918:b0:7e3:46da:9e1f with SMTP id af79cd13be357-7e62a226f8emr851536985a.56.1753366801482;
        Thu, 24 Jul 2025 07:20:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu82FQZpsw4p0HB44p5QHytv3oARhOYGPxT+kbfN/+yl6AMnXI5Y2W/WXRiHc3PGuzslrCdA==
X-Received: by 2002:a05:620a:a918:b0:7e3:46da:9e1f with SMTP id af79cd13be357-7e62a226f8emr851531285a.56.1753366800903;
        Thu, 24 Jul 2025 07:20:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53ca2066sm375867e87.200.2025.07.24.07.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 07:19:59 -0700 (PDT)
Date: Thu, 24 Jul 2025 17:19:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] scsi: ufs: qcom: Drop dead compile guard
Message-ID: <33dxc5kf4m2luijisbdzsxof5yi4hhrbsrfziqsbsqzm3xkkad@ivhyl5ozuyc6>
References: <20250724-topic-ufs_compile_check-v1-1-5ba9e99dbd52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-topic-ufs_compile_check-v1-1-5ba9e99dbd52@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=68824113 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Ts7gs6oRpwORAAbGo2kA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwOSBTYWx0ZWRfX1XCYRAeztXXZ
 Y9gA9FaGHS1oNhFcDHJBpHCjoHaoM9duRtdgbveqpMhHfTeENQYKlW6RAIoVvrkU1/rNXtaVhK3
 EjWc83lg/Onk1SQvNtBkELnvr2mWB99AD1TI+5dnBls6kcgQZ+bCiES5kmY1M3xzE3HrPKkESzv
 NsYetzViIDKsIF8o4HAdYMLN9Q0m9ZBi3lksbdcfBi5tR2aV8xBasMmXQXsqePEmvaFWRoyPkb3
 ZjHvq0tq5HBZIW5NCgmMpfoIM71yfvgiIPvEmpQUi3ZnZV1hG4xAGKSN5KkAktJLQAmQLYYOAID
 BlYtJMJqM2qMZY0FtdsfV2MDpCgM+HbpokCdUyTA2kbepVFeI11k1k4mcMslozi7iLoZ3SpEBcX
 lNu9YcwdM3etzUkTKU2uMsS1Wigda8PELPxu2GokJV7zeghHEbjOyMoF3mSeAm5SNq2BTGjp
X-Proofpoint-ORIG-GUID: xrEJ08o2GWPcZpfkIws8R8Ygvah02fZC
X-Proofpoint-GUID: xrEJ08o2GWPcZpfkIws8R8Ygvah02fZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=917 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240109

On Thu, Jul 24, 2025 at 02:23:52PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SCSI_UFSHCD already selects DEVFREQ_GOV_SIMPLE_ONDEMAND, drop the
> check.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Is this something that could be discovered by our existing static
> checkers?
> ---
>  drivers/ufs/host/ufs-qcom.c | 8 --------
>  1 file changed, 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

