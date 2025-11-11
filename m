Return-Path: <linux-arm-msm+bounces-81203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB1EC4CE8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 128C61887182
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6DCD338F5B;
	Tue, 11 Nov 2025 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdJkDDDG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNwbKGXB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE9D314B85
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762855791; cv=none; b=FFr9YrxswA8OYItWf1yzm/NuotKLRwgVmdcyX1+bZyWGIex/YdX3SXsZtep03/97E083TsSWXIZB5voxAQWzNdNxelDmNFs/WgBY3fzQnCKSg1bK3s3PSji/Xb64DsBzQ/ghxoOzot6b7ASn36lYuIogpR3drTBeGi0AwsZIEj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762855791; c=relaxed/simple;
	bh=7ap3Nb2h2Hgjoxh0bjtgij4Jlz6ESlkqT8LpdYSlYQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhN8uDYwp7YKcjDEZ1s+I2D2LowlDYt2rkGDN0RYzP4FcEWuMPQRUJkhoAHH2W903ju6LhoyQTvrC3XTLJV+pT5+XPydU0lfblxlbYzbaY6y/swdJ2qv43QoCPwWOHMzVH45wg+kzi1JeA/G1uEXNIrHCo71RjPUSLL83Np79jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdJkDDDG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNwbKGXB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB4sZkv1326773
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bMA7zEZG1mT9i3/f72DuynQG
	/e/UEMOqhR1I59QZTdM=; b=TdJkDDDGwjv/RGOnMK9zGkfQKE4qbkHUFU99nrWB
	XZ0JeYDCUCsC0LkXnXJtozxwLAH5Rycm2LFPM+2tSHQR1lgaFweFef+UyKqJAWl7
	drFJoCiDElUwG6GHc9Xur9zGP2XVld4I6yer7Qm77DXXgQyzibcvqsrIai84ipam
	VUJrkOu+O7P+rkV92JngAvRbhUXGhdoPqWOIu/6DFUGr2nyRAC7jokaE9HuOZSZn
	nwTRNlYAmyOP61/eJUjlb5ae+zuAKBxOBr0xF0L67XYweWzo/sA1TYv8VqTsD2EO
	uVc22OFrkR1RQ3wHa4TN3fX0TIMsNzlgik+LitvUnUnzDg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxhhgwef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:09:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8b33c1d8eso114310641cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 02:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762855788; x=1763460588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bMA7zEZG1mT9i3/f72DuynQG/e/UEMOqhR1I59QZTdM=;
        b=UNwbKGXBKy3qn8fhB4FFwwH8mrhNScI0ocG9jAzWDS5s99sVRj8u2YzhbInUgbOrmu
         RO5EILf9c61Dw4gck+GH1jIEMf/xvlbgPFAojPBdER1y+Pc6HyBeNnJIgV+oyfXtZnN8
         7VO4fE5OEDcH4Rzph+SvX1u93eDBfXWeBo+X+UIhDPkSF+diQ/GVnBJfKL+zNAJ3oZLh
         Ovns7i6lcruSYczG2IrhxtuvZzeo1+wn8t8flePW4mDrwE887IYaaymQ5+wlJVmPdmrH
         lL1a7lEgAlwWSFI+EwzRSo4mP7uOWtY+eF6eiP6atD8C2ax9i6d7VFOTAmASQW0zVbj2
         O6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762855788; x=1763460588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMA7zEZG1mT9i3/f72DuynQG/e/UEMOqhR1I59QZTdM=;
        b=SC1OjV0r61OngQTchb/zZdbonl/Zx6g1QakrGuqgOz7OjSMI4rFMqknteozLVImoA3
         5xUnHWeFHnJSZ5P3P2hq4tENFOJzTQ5Y34peOTZuPESBHeUCiAYq8NVeStAqnOUmViej
         Vp8oanY+hX7QkuFEBnXIRsyOqiuIjyltaguDxyAAMe+p5AcYABDta4lmlhVLf+NwPLNn
         sJZWBfGDgKz8ONadS57v2WtKnlHty6pUULIy8uq1sudkBV8QWiFhe9sOqHpScNNNX3rH
         PEMrN1J5RCqrT//KQf4y9X2qcL3k4U1T5cI8QYtrXNaR3MwP1fJV0V9IO6uv1MwuyDY+
         5V+g==
X-Forwarded-Encrypted: i=1; AJvYcCVOKkZE+ejPKB+6IhzJS/XqNjcwdULhufUVZAz61x9NK75KLgZZc5ZlUm2YBvH2ymk4MZhUrB/GaZZhdnic@vger.kernel.org
X-Gm-Message-State: AOJu0YxuJwtFKaTpK1QXkoNKD4Rt45WMMcELbnRcrxzTgULZgOzs7vI2
	eTzuK2YW4ByJ2PfscPTHaoztubw7Jv5FSR6BN4Sr2TkqK9xVWl1bEXPQYjYXaqnQVHEEng0nS/c
	8ZwocF51aplwMIEf8rcH2uko4gv/px0qsdM45xjvZLFOQmlZ1tpXQOB9KufmzMqsCOAQG
X-Gm-Gg: ASbGnctO3aSP5R34QWaA9fLygbb8dABgHFXAzcsSiAV0CA8G38DyXHkmNoE4aP94YEA
	dYpRIUI1b3ewhSSnLlEh9xYsJk9o+B58rf7hBTIPcaDvBv1H85wWh4qzh810B3cIK+w7djrtmlP
	QIvdrn7f4wjNbrM8y1SNZnrowPMkjRmnQ7jSc53XaPjyZE0WgMVjYe9wUtCTPEpxBxNYZkoieOC
	bGc8kRM+YmOJ8PJgAeVAyV2UxKG8GGMPvOgj3WmYlsZ/Z5XjkBGt54Dakj79J9MS3OBIqYNNGdU
	U9PZ9iQieTN51JGjluijFtTGkiMXR1rkPhmKWKi72CBk0qUM2o1fDoExVO+GjkXqUe3IM5RDrAP
	HGNYVFLMVZpCvN2EUfWc7khmVelmM7gYashJzMp+rQGfYpEE2A4J+CaJcPZ23FXaUf9jo73T5sw
	1/Sf3qIuJpSfMq
X-Received: by 2002:ac8:5887:0:b0:4e8:b446:c023 with SMTP id d75a77b69052e-4eda4f8fcc4mr161512431cf.49.1762855788092;
        Tue, 11 Nov 2025 02:09:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAdk5oeg2zuFx9VElgiOts5cm9SgeGDvLPbWKRyigR2FtP38RcPIC2MNQfRTRKNLR+ZTXWkA==
X-Received: by 2002:ac8:5887:0:b0:4e8:b446:c023 with SMTP id d75a77b69052e-4eda4f8fcc4mr161512261cf.49.1762855787664;
        Tue, 11 Nov 2025 02:09:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a013bd8sm4864093e87.1.2025.11.11.02.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 02:09:45 -0800 (PST)
Date: Tue, 11 Nov 2025 12:09:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: mdt_loader: merge __qcom_mdt_load() and
 qcom_mdt_load_no_init()
Message-ID: <6zfnpcq5jjgv7yiukb2df7nzdznrqyzl52frjtksfjjrkasjjf@skzdei3k7eeq>
References: <20251111-mdt-loader-cleanup-v1-0-71afee094dce@gmail.com>
 <20251111-mdt-loader-cleanup-v1-1-71afee094dce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-mdt-loader-cleanup-v1-1-71afee094dce@gmail.com>
X-Authority-Analysis: v=2.4 cv=Pc3yRyhd c=1 sm=1 tr=0 ts=69130b6d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=X5wZVq-fp_SQTXckX84A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: PTSemKH69WwAm4mzKyR1dOrisQP0A52k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA3OSBTYWx0ZWRfX6cNa1rqqcvDb
 XcGm0/AeMubzcSnvUc4uMYcZP69jbVSL4UXli9Ftaleu49dCOnSvH5SF03O70DtnA5AI81fFqQp
 iYbe8ICIwanZLE0GZ7tbiEbw1Bxj9iMB25eCXWa3hl55AMsytAVg++WKldI5FxVWwnwI/QoBsBH
 kB3UeDdTMP4epndidqKqt9BRNDV96xSG2YPvJKyTMkZUYZV1aplBal9FtpdkxfAbi/n5bhYGkKo
 uB4aXcc+15b0o4IdexI//VoEkWdiePIg/JAGBWJPDbbFOsyBV9+xOMj1PMgpZeOVkskjqLiitzO
 uAZcdQzgleg0Hcaneaf695JwebXOG5s2qM2UdBTP5PnDjGsI9sjK/pDyiYf3Dqc+IVUOSIh8JKM
 g4GsgwO5gOacljdh9DCnwMtFvPSnyw==
X-Proofpoint-GUID: PTSemKH69WwAm4mzKyR1dOrisQP0A52k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110079

On Tue, Nov 11, 2025 at 08:40:10AM +0100, Gabor Juhos wrote:
> The qcom_mdt_load_no_init() function is just a simple wrapper around
> of __qcom_mdt_load(). Since commit 0daf35da397b ("soc: qcom: mdt_loader:
> Remove pas id parameter") both functions are using the same type of
> parameters and providing the same functionality.
> 
> Keeping two functions for the same purpose is superfluous, so rename
> the __qcom_mdt_load() function to qcom_mdt_load_no_init() and remove
> the wrapper.
> 
> No functional changes.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 46 ++++++++++++++++++-------------------------
>  1 file changed, 19 insertions(+), 27 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

