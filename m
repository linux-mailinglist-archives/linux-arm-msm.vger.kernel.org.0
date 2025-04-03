Return-Path: <linux-arm-msm+bounces-53086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6288A7A21E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 13:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAD6F1893AA6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 11:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D296D24BBE3;
	Thu,  3 Apr 2025 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqVpCI2m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A151F63CD
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 11:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743680828; cv=none; b=SlHSAL904iEgM/KeH3TmOq0H9n5lt/gVqtRkWCDui/JbhBnGW0vQ+u8CoBRhgQweUrSzt9P0Xz3wOvJya1Gt4HC7NVK5JfQwvIHrivTWwcedCDl8yWuHYOOgACmhsxy7jShIUiYVAa0Nuw8EYDzg/3eNYKwnzoVbQSjhMfPpxCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743680828; c=relaxed/simple;
	bh=bVCLsaxLXWbChut3pmQ9NWbwS6gpz4qyTGWJxKtSsVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8QLTvtrcQQ+ZzHQA9eMx8O9LiS/kEjWol41OjtxspqMsbKrqeqFmBX1uREYzRlUR+zFYDNz60W1l3HcOQYuvpEFi/HEcfpdv3fuPXEpJo+d5WvX+D7kC5M6DbyvhFR0RKA+KIOaJYMFr+ePaYDZgCmAGRJvprB/NB4d17oF+Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqVpCI2m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339s1wD027572
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Apr 2025 11:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aGDDQ0jFQhPbqbOdDbGahC5H
	PEzlI0t4a/oQTJyUEaA=; b=MqVpCI2mqWZp8Lj0wC0y/WMu8WD/S5b1LcuxFpno
	GEwxvFPt8DgXb+0YAkVXre9vkPId3PV4Jj5tYfd1vDK0rhZL/eg0ad99GpaJw165
	uJW0nya9aAYvd7tHD4UrVgohOn9M3fJi6IIN2ybVM9Sh5RZniPcklh8bUXUD+y77
	C9cDQYwcxme3wepARo9Q4lvoBRGaJJQcuFz6GE399d0IzUSUJUkbySk63ZDh0Xa/
	2hZA6ccQj6EpAUiLzy2wA6kuqVUDWaxUZxsuu52UF7Qnp5+Fe00I4rTsb++kQynB
	mmv5SAiFi6WITFVZvGzPUTh8E+n6po2sJJZCaa6o+f91gg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxapvh9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 11:47:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c579d37eeeso122660785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 04:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743680825; x=1744285625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGDDQ0jFQhPbqbOdDbGahC5HPEzlI0t4a/oQTJyUEaA=;
        b=ve6S5wjuC+r+F19EmjYWeyqQr7QDLTBWQels/6XH1SjnMCDGsm4ah0I+xOxIUwCOTb
         1jW9SlwsxWiSpfm9DTuxl4LLtLUuI9d7BSudGn47IzCO5BRKm+eKRfiEdjc1XalQR7Rt
         rv1Lf75rSA29/DeW313XpExGYtUj4Yb0bCeoXZ/Ga17SYJSA55y39hiIh5ZvCFGKp/U+
         0LvxK1xnGVnpiuajExknFe6FesV6Ve3VurvibKvHq1NsKlWNIrSWpGZVTFJL5DWb39+j
         z3n9abY+131VIFIaWCk6HXafnNZMWORLPB+Eb+CniV7gUN42rmJhq6SVYd1nn2lWebJL
         gSWg==
X-Forwarded-Encrypted: i=1; AJvYcCVuXmejzEzVEECb0GsjMNChsZJu5Zslhqs+IvPADyROAG7fzaA9BKYjs31cdOyvoX54NXNUT4qoBa4rqeub@vger.kernel.org
X-Gm-Message-State: AOJu0YzT5jJbvYCkTJFapTd20BrayT09+uNW7MyjRO9/OwyOUu8C6b2h
	j6HCQrD+hgxf7KoIT183WY5qNOjEcc/AZEonUW4xvQJ9argXLX6zuggmcmoUpC900+bUwpBeLpS
	pCIhWJUniXu0Y1TASl3BNAcbCxaTpfOpsaUbAY0KLuMiyBjE8LYi4JupzjBKcloQA
X-Gm-Gg: ASbGncu4mmatQCm6Nl4Di5JXth1UEaBWWvEy/Yc/jW8WmVg73dAeDjTVggRInIdpa7P
	9O026o1XMjsjzuwL319RQrLNeDae/f63HPsoJIeCZACAjrVRNYpWjkEqTKCvBJd3RBd351wf/Ps
	3ptOdGQogIRbwbtK+sjiPoN1HPanhz03nxMip+xdh38lVWtS7+egqOpxPbJoT2wU2usLz1AegBe
	YqB1wAWeiCRvWpMpwFMwyKlapYQDbiUQZPC6X6hZu5qruum6JznqWadp8QUQY5Zz+KEvO4+63Km
	1fTOiPdzDBI0IcWduo1Za8ApBzteHTJF94sj5Ng9FP3K3O/wxp9aHrilriu4Uj6YD9HHruOlido
	7bfk=
X-Received: by 2002:a05:620a:4081:b0:7c5:4adb:7819 with SMTP id af79cd13be357-7c76df69886mr231438885a.16.1743680825055;
        Thu, 03 Apr 2025 04:47:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvB3vmejuvkvpwELxt6ofgBobQEqwcfxb76F9Sa70Rld/6kujkTtCtv4H2O+UpMOZfBwLcHg==
X-Received: by 2002:a05:620a:4081:b0:7c5:4adb:7819 with SMTP id af79cd13be357-7c76df69886mr231436585a.16.1743680824698;
        Thu, 03 Apr 2025 04:47:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab9easm134722e87.38.2025.04.03.04.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:47:02 -0700 (PDT)
Date: Thu, 3 Apr 2025 14:46:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_wcnss_iris: Add missing put_device() on
 error in probe
Message-ID: <3zxqrofeg6b4xewituh3aesixmlirwuy5mvzng74y7srr57i26@xw2w3rvwk2pg>
References: <4604f7e0-3217-4095-b28a-3ff8b5afad3a@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4604f7e0-3217-4095-b28a-3ff8b5afad3a@stanley.mountain>
X-Authority-Analysis: v=2.4 cv=Vbj3PEp9 c=1 sm=1 tr=0 ts=67ee753a cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-lOYY9mtbGAmBqhMW_wA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Tgqflztqr1cNLQDdAlhZwMNLcZKB7gfd
X-Proofpoint-GUID: Tgqflztqr1cNLQDdAlhZwMNLcZKB7gfd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030047

On Wed, Apr 02, 2025 at 01:59:51PM +0300, Dan Carpenter wrote:
> The device_del() call matches with the device_add() but we also need
> to call put_device() to trigger the qcom_iris_release().
> 
> Fixes: 1fcef985c8bd ("remoteproc: qcom: wcnss: Fix race with iris probe")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> This patch is based on static analysis and has not been tested.  Please
> review carefully, etc.  Another option would be to call device_unregister()
> 
>  drivers/remoteproc/qcom_wcnss_iris.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

