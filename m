Return-Path: <linux-arm-msm+bounces-81879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF4C5D9E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1911335C742
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DE1325714;
	Fri, 14 Nov 2025 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fkb/SFPp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H34G7jgM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD47132549A
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130399; cv=none; b=fj2Hhq1YZ207/K3IqGfLvvoKmoonhBbP6nR2J7nZ9EFe+DhvTXx9kOdkes4Ud1ib88t4StxUqxcVW3AFPo500vmPfDQfBZ5yYePTI4jstaoi4sxbcYtAZ6dywxrIGPnLapE2CxjYBuPtrS82ZWV1gI16IA3icTN9Er1fUQ0yOg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130399; c=relaxed/simple;
	bh=c0Gy7uBbarXiXLRKShstYiimiNgErRbZVhb4Sdw4ZN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dBxJbfd9zuanu3wC8NbZyZ37IGS6nBDkuydElF0AK/2XhNtcqNv4ERVuHaw7la6l2DRdYkgjlWfM5Os1ZoAe4m+jmhcJhvXQvYo9IMd+6GxLYXGAvGc3oAbXHeVugKJLjEZn/9l7pYNcMxg5fAR5myjiz9RMrShq/m2n07WdoY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fkb/SFPp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H34G7jgM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8QxZW1481724
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H92ZsDgTbkUTKJhgAvgP79kB+seNOQREp3zo34zEY2w=; b=Fkb/SFPpPZe/enQM
	+UGfsfN+YDNnEEJVt/Rlbhe2LTpGowAMyvAb6tal4bo9EH71bFnc3kJK544mQOn5
	gBUcSwooifVSiJGc0aJ1h0kS230Px6rpQM6YFrGPMJRYjU5oT8QMVpmcRbccGIGZ
	UdFIDLE51fM7KBeFURGvm89W1937fgT5kEEMX/9HW0NBMdehTQFTDt6wSQmIqTzG
	HmmCnxzI4Gzebso8HINCkSpju0iVajLm/dcDbjBJEfk55OXFbelD5bax1ZrjpVKU
	wEtXRjxbZGsXk3ZQBvPM3747vcGOhwSEOQ5lHolgUre7Jf4i3jxFTXZRxj+jJtfP
	ZA7C0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9dtdfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaf9e48ecso69965381cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763130395; x=1763735195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H92ZsDgTbkUTKJhgAvgP79kB+seNOQREp3zo34zEY2w=;
        b=H34G7jgMrSmNnnZzNEg5pdrobpTr57asDDc0QIjyMzvvyRvtzB/BolKG+iXOK2LmZ+
         mOU+AZ8N7/DpJd0GGUVWgxQS3lSWCzFSozHU/uogcH9anO6tqD9454W49CopRjLaPQIc
         q7zTdXiu1jbM9aFn1QSZItEyhaaALg46QQzldo+VASuNnzDB28VG9H3Xa89sW8ADNZtW
         uh2Y+zLSgNV58s7JJAVN7EQ40KMW3BkaZdiomkcjQ4cH6UFtu/KuEn0BjQ1azFMUyO5E
         8Pdop6EJriFbF47TclvuShu2+hyk6dzn0G6Fc5v47iTX7Jyb9jw9IsVoM6CMKbUKR4fW
         VdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130395; x=1763735195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H92ZsDgTbkUTKJhgAvgP79kB+seNOQREp3zo34zEY2w=;
        b=I8YfZ603flQ+ornN48jlcU4mJHxdc8qIVE5mvyCTCDiICAvDosUsFYYKAN6h+ZEt9V
         WVD8XCgLjWn8uLDjCg0X0otdCF86ormImBmyClaWS3AoJ0XjkXBndVHbECsgYI12glZL
         3L9x5J3uRQ3xyOzgknTCht3lOCZolG9b1hUMbwP4HyEpqZIlsqU4wI/AaFKH3wrvyecI
         eDrosIrqiyKge5gatkufeL3cMLDEMmCVOaI3F7uS+T4hbteznVYCKWqwX+8Zko77C9rQ
         nfkGg0JQfPQ5Vbpgf+k+dWcvb70W31k/RGHOLDibmLk9IqH8Dd9fD4+McBTBGYWNnves
         s8ug==
X-Forwarded-Encrypted: i=1; AJvYcCV5Usa8647I539nGMkk474rVqE1NmdvKzt9RmQ+EBEU9FiI2a2L/TdFajkEPwjGADp6oGx+Sl1o/FhwmIiX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc3JPeuab/9MSqRx81ab2wqjNf3+Bf3cFkXRWGpU7FBHkbFXfh
	qPSVqGzjjA87S6I/JZ0BWAAWQyz2DRJtNUEInB9qz7HuFVMaM2NZEUGscHXPhVvKaeJwt7vS9og
	wHSfTV0V21g5waapReq3QV4nXZ8h6F0pZC8RnwbBJUKK5zoYh+puLeS2gvySHZDu033eA
X-Gm-Gg: ASbGnctMenvkMF+w5Egh6rl3mrVnYaNDmv9mNk5FJ5Ixh2VeL57YoqbDTohOw0ZWHTS
	TIcNaaG0Mc8h0dTFFTN/h1okUIHXdPfF8ApqVZWfr/7V0BJlUb9gpG+4jXaCdYtbzQwrQR268N9
	TPUDsrPpVzxuMc6veJmJKAYiK5SuYoHl0yAnY6d+n6GkhAz1eR3pxjyt4vd0wtYn1OMcjLmO5Q7
	w1SBXmJAY/3WmRMaWUoXJWkbVzSoxHllC7YiwGbYlpvQPOVsgJmtY4dXmlIoeo4sEIbzwI5khmg
	KUbyYktvPsbNsb255dtgFAbMnxMTowPJ+z96LyZIMwoZuFIEYI9QM7ib9rPmoctuJvYKKSARvj2
	WPthy1csff7leBdDRMvNzkgHJUqLvxbOtOIgY5aSZfopD2yMnLJAz56nIp0c15HylF6SwgtGVPd
	EGh7X3HG6XrTDJ
X-Received: by 2002:ac8:59c5:0:b0:4eb:9e22:794f with SMTP id d75a77b69052e-4edf2171bfemr44962691cf.82.1763130395515;
        Fri, 14 Nov 2025 06:26:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4YqVYNVjL/1B7NeGIRe8IGvJOuyU+4Oeto661Y2vEKRPzlrXHYqZMVbHPWOIM+paqpNmJNg==
X-Received: by 2002:ac8:59c5:0:b0:4eb:9e22:794f with SMTP id d75a77b69052e-4edf2171bfemr44962121cf.82.1763130394913;
        Fri, 14 Nov 2025 06:26:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:26:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in dpu_encoder_helper_reset_mixers()
Date: Fri, 14 Nov 2025 16:26:28 +0200
Message-ID: <176312947286.1737000.3509947007748162020.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=69173c1c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=UqLjAnsgJHsByH5YNvQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 3oa_U2nBB9JvMINcWNhGZPKZXXJOMW68
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX01RdUUjHkvAD
 JJXfzcFMtCsbyp0xhDO8OsiQ6zSGOYmJdEHYVcVK3n0RoBPziDsXR2Gl82khM8vQh3ID2C9q+Tu
 rSCf+QEuAU4griKHCLLRd/jAWYLwSwzfv6aE047nDbMV5UNjndImcCB/l0m2KK3TUDe/kMxEhXy
 tCgDYQnDVdnf5z4Eje+n2UBe3BOnAWfSqcGDM1LWhmx30z1D/gFFfVS/K5sDvqnikK6hN65K3xU
 bLHlodDmzxy8zDbOwHJjo9NBBGrJcW34alZ4wGkAy2mrJVVfvTP2lqJYMPW0pJP/rIwTi7hKkzu
 agR1D5LgmBJPF/Ima/NJSKIXDJxL96klFCGrW8edavnH4zYWYcKZxGU/Zvv9+iAg7hulr1AIbfp
 KJPykyGyAVvrTw9YcwvQvSPKgoSOog==
X-Proofpoint-GUID: 3oa_U2nBB9JvMINcWNhGZPKZXXJOMW68
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116

On Thu, 09 Oct 2025 22:09:32 +0200, Christophe JAILLET wrote:
> 'mixer' is only zeroed and is not use. Remove it.
> 
> 

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: Remove dead-code in dpu_encoder_helper_reset_mixers()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/762dd3eb0c0f

Best regards,
-- 
With best wishes
Dmitry



