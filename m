Return-Path: <linux-arm-msm+bounces-66057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3123FB0D889
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 664DBAA0D40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 11:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776F92E4256;
	Tue, 22 Jul 2025 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqIPgit6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01672E425E
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753184887; cv=none; b=DidzgoxEXsndDAg4ACACgJbrlBe4uIpuHjA1cXZ1xK6GgsgarW8lcOkd12ZaCP4r20VZBoHPuaMBW92evAXrbzqVVY4lNMHGk2Vs+1gNPykOBqVq42iQWFzMolUOXrJq2wQ/oJ/b8ybpCKbhWGcBEO7LI3K66Ga/xQxJZAWHpMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753184887; c=relaxed/simple;
	bh=HgmqSfWO+1Qv89IawgIrcQorcabXHoxhcjMblkphFi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJ2jvVWTeDwniIrWvigZX/XFsAi1hBIwfyZ2KRtm20ys6z2KdwBnHIqPqn81HCvAUBHvm+6GlVybdni0alF0nGpQt4QOnt6+/d2btkq5b8pZcYeXu+j4Xu/g3ylBzZMLXNlOELushZygeaI5KnBBD05Z+ijYKQDIde271HcIsJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqIPgit6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M9wmRF016283
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e/uV9a7Jqnj6kSvl5ZYFA/WJ
	se7QAWXeSsw+XPt/+Bw=; b=LqIPgit60cWkMCFQZtUxfk+sA6Agc8gMiVS0+DeM
	/YMX3nfW8oakR3qdO8tj9a84bSgu1hbtltywBEQrDM0kWPIhHYqMBG4NokzNx6Tb
	pug2QlPUUM40Kjww+NN92hKaPgXUSdYJlb884hOotKv1fX3ksi412fI7lOyj+J3k
	jsTBhArmG+YC9jEyHdpyTPYyd7pRq+40ERBCpreFJ+uqZ/6PuaM8Zm5/mdUHBdaE
	2ECvsPpDby+++LY51tTPn6LY5v/3pmqbhDq5qaZrIhnCbSLCRNOt279XY7ozZGGx
	IYCJmQrNB7tGKg51KKMsLaXLuVSSH5ziBqov/EVSxtQvtw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s1bx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:48:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e1fb57a7adso483079985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 04:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753184884; x=1753789684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/uV9a7Jqnj6kSvl5ZYFA/WJse7QAWXeSsw+XPt/+Bw=;
        b=Zuv06CFmcfPPsUGjm++6m5zyX3a6Cp4L+lDPzBbXEVMReyZN8a53iS3Vx9qgEKi26t
         2j6UGRE54p6I+/aELtOrnOOrsqkaE9oSvCp12OJeWfYtFYo35r062ARQNyxh0mUKK2l0
         EYY05GL7HAbjjZc3RmMng0Tv+xg8cmlfqSWsFXcyQbttccDdJQJ2GEIsZlR+PMnwYyZt
         7z3GJIXE2Vu/LxOysItrhHnPPVu6tk69cBE6xct2rd3mKHI3FUgJqTHz32qKb/bwIncF
         k7FaC5Fq4612x8B/cbx/54HVhxYJPn8GVYD0WzjvLo8o8bVaFmDTGPDxTPS7dRu6qhzH
         w7jw==
X-Forwarded-Encrypted: i=1; AJvYcCX+MuQU0d2wd7JHixjmEoe+x7+PvhmwDdBCs/URkh4IEF59zxWQvw03sFlTApyCOCbe5KV67OUz9+4ccv3j@vger.kernel.org
X-Gm-Message-State: AOJu0YzHXQKF9FI9uFXtqJlUeOwOb8WI78II/kvdsqxzC95s6A6fBhNR
	zIYhiIlTrLl9TSJibDdwkpCMyV6g9R2wLkE6DG9HkMJXGaxeIWSq4v68KrgWRQa9sdfByx1kh6z
	DxTmr+vNva7m+J4d6Q9ik4/T7ZJNEuxPRec/Vh5PJMhfautK/xF/pp8hgm8mPfuKzKD1d
X-Gm-Gg: ASbGncvj78fuEy2qvvTk/YV23gB3fGazZJO06igbI+f4T3nWbNxgQMIRkcAiF60QHlz
	nHfMSKDh2DP5vLTbENf7vhjkKidi80y4pdf6azv+vRD3i8WOuuR1bvIy4ynnRS+vlGGJYZSgfAI
	IiH40fswo4RW1i4O9n8N+DC/ikL19FlQFfpvQqCoJRTlVi3sIZv17wg54eVljxhx8yeEMnACFOe
	D1Ex/2G8Qx09ZvEFinRw/An52O1zVlSyuMtGdPyQYtzClPskeFpGxgEvLxHZMe5bhWLf+EcluAP
	DCGzxaUgxmt3ycmKaQbI/cy2xzbnx6Sr+NYTQYARof/e6eX3jbO4tJ3pUgvE+FjFKPgnaNsxcWA
	Z1Snxwe98Bz27VXAgkVzHZkWtxEREI+FHwgdFH7ttbT23w8sFmI8h
X-Received: by 2002:a05:620a:2612:b0:7e3:2f8d:59e4 with SMTP id af79cd13be357-7e3436168c2mr2621826085a.39.1753184882883;
        Tue, 22 Jul 2025 04:48:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiKUU67trOd5R2G3OmZaeyDZK2sYFxK5CnKSSxD7DTzEXFdVZTER58keZzaYO6YjVhiNEKZw==
X-Received: by 2002:a05:620a:2612:b0:7e3:2f8d:59e4 with SMTP id af79cd13be357-7e3436168c2mr2621823385a.39.1753184882424;
        Tue, 22 Jul 2025 04:48:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31a99696sm1934653e87.34.2025.07.22.04.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 04:48:01 -0700 (PDT)
Date: Tue, 22 Jul 2025 14:47:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nikita Travkin <nikita@trvn.ru>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: tzmem: disable sc7180 platform
Message-ID: <73g3u4ekk3e22a2n5zymugor2itqvdt6jyohb4qf7wltx25l2j@obxegh5fnnwq>
References: <20250721-sc7180-shm-hang-v1-1-99ad9ffeb5b4@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-sc7180-shm-hang-v1-1-99ad9ffeb5b4@trvn.ru>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5NiBTYWx0ZWRfX9bpIJCo29lsj
 jdtxKYrorL6bVDPYFwLd7xW9KGLmBLotIOALRNgRgK95500J7zmCjhzRztVTyXLH241fvSn/Lqv
 YiZ48Y5UcfipUBuM9QEbMaAlRuh97L9CITQSw62o6Q99+lnAPmjgTM4XonhJ4JAlgTrz4VJ6g8L
 TrMKusq2LHrH3jcqObjfFrINwAzWQ2HGWPvf8BQPjad6rE/vxPV8PuAFAwKOmhEY3ZmWwgRSAfL
 GFuxmB52QffVkJvF2WPslKwJZsslhwu+++OajmFywBTvTv+JKu//AeDTs+3sETipjt9qZUuZW1O
 iSV1RRulcs5MKU7Wf891xVkAqMXHfNjJ6JhnHobYP5BY1Dj72SZnEklBwJPSy0zdbCA2OopDyiK
 0A43WEnF+XIRFBmmjhWn16ik+eBWsLDmaJgmNMP7WzPlRegYTbnvntV62q1t5XU7tYnT2REK
X-Proofpoint-ORIG-GUID: NStKOlP3tS5tFGg3FMG1bEHbWReVmP4F
X-Proofpoint-GUID: NStKOlP3tS5tFGg3FMG1bEHbWReVmP4F
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687f7a74 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=InlpzHCLAAAA:8 a=EUspDBNiAAAA:8 a=MnaHLJqymsomQlmqN2oA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=j9sqBCYxEfXq8HZXc0HF:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=860 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220096

On Mon, Jul 21, 2025 at 06:28:03PM +0500, Nikita Travkin wrote:
> When SHM bridge is enabled, assigning RMTFS memory causes the calling
> core to hang if the system is running in EL1.
> 
> Disable SHM bridge on sc7180 devices to avoid that hang.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

