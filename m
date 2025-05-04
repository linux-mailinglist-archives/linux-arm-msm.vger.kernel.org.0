Return-Path: <linux-arm-msm+bounces-56713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF989AA87D6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 18:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EB353BA36E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C051E1F3B90;
	Sun,  4 May 2025 16:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p61HPtGl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A801F236B
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 16:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375230; cv=none; b=IwBkKz4SFrSAXc+Y9tb9JiEnV5h2Dflifdxd5SkpnUKiLRPZYIOss41syK8Uf3dm7rBZBwcFfLjv4P3lf4vz6dRi3X78DS00+7H9o720myuAFCi8Iah+4KjiuLLuC4MtfB0vAS8U7Y6SMjIV5kf5jIarg694BFhMZzL4K9YPBHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375230; c=relaxed/simple;
	bh=Skbd065aT0ZHQcN9uGka7V6r73b5ykLWPWeCTpFhdBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TiQOddgnPCVimlVl9K/3oVPra8CAbYCGyIysMSfZrROXZktTiKduh36nnk6TsskExNltelNI/ZkroWaTGtbDzXjD2UUCPAy6+t29yDEaeJB6w0FzCr/L47HHdKvmT2lzLylvylgIpT0kRcN0LZ4oKVkTBNChMhqSaYs6gWXnbpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p61HPtGl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5443Txbf016078
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 16:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=; b=p61HPtGlIeEUxjqo
	ybywT5R1PFpAyKPZrQFAiTzHEkkKv0mRm11o7LyHDiys31qJI/nQ45V0w0HEnLwx
	Jc/K2zT6KjvWz7OkhlHVloBS6Q69jmEjaxNIa8wxcMzaGwNE2cpfjF74yleafYys
	2H9n+GA4P3pB8MclK5INKPmMr+tVT+rJ7IDT4wZ586o5OyAjnulK0p0Gpok7jnwZ
	Zohh2mA8Gb//nS99mU5BcKvJKYO8aPujBAaiE1DVjYrvTegcOHS0+jMi7BlIcM+x
	vpIhZlTndetVnqAp3JWyG4pCb4vL60Zq/D9OsRhtacCzexQSUTUiJi89EHyazPXD
	JLDw0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55t7cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 16:13:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c9abdbd3so354266185a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 09:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375227; x=1746980027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=;
        b=cmKD615gvlvuVJwVEq+wgYRWA98nhaFuciXTrgxRYkF+Aeo1YiHdtGK7sHbF7uAOpp
         yM1HNj0HhymnXUWoAgC7KlAFwIrpXCVceM885Mkfm2FLNKkKBR2ror/vGrTgET0IxQib
         015v7aRAvDn8D2szPmH7Q/YXQGgxBkaVpBdm7dhNqCIIJco0ccgG7y9n5Q3QKMxzdaYv
         I7SIhxUT3XqlsC2Y04WINW1Rd9u4Qi+ufWNkjiTxl7Gbcn3ppbEHS0qX2P5xnLfUPCyy
         mwH658quK+vsy+Y/yxaN6y0I2ScqZJtR/KBPguQIGYYiTP9lsclc4+fcvIVqOztFFoiq
         Zwig==
X-Forwarded-Encrypted: i=1; AJvYcCUWRo9MAuAgHX2cdWGDL7U/M/+I3xSzRKmQj97rnG7cnPushgFZFK+CjEllMugwirPE8LBDsKaxXzlyU109@vger.kernel.org
X-Gm-Message-State: AOJu0YxPdYR1QGm6Lc03Nucu+JNTMlmKYW4hrZxi8x33VEfFQ8A45KCH
	muxwDSoxdkTlSlpoYQfqe6Fftc44Z+iUPtAfvpaxIQENIH9OsIeqzF6I6Yy0scDN/eULRixZpE3
	4CGdjoiSBbdWgwC/5UCFCuB2rnBzlGrHSrwxo28z80C1wNmks6x5J36b8RTW9AauT
X-Gm-Gg: ASbGncu82fe0/gwqlSeEx/oyly+I5QGlyaGEsgdaYKKy2SGjgRn246MjUfL9zp9IOJK
	gSe1n4pabwoujDHvO3h8kf+Rc3u1HteafvFWQXEBiGJIN3WS3Q6HWgJ0HsjxXWvJ7Zc9X0vephp
	3XU65C4cM6U1C2dSysmd5cjVvzVKfkAGnq2wtXRElL+GSvH70fCxR6Q4PokufXFEWOtXSeAij3H
	Reb4psPCKWW6PkWnaLgLkaIF8opWAtCBN5RshhcOP85cwPvOVMPg2oO9qCjPtBsVWe1XkJgpdSF
	AHFlzmxPSD+BkGXmNKcWoQuyeKG4hBV1WkcbNL5tOEOnDTKtDbuL/TzEVvC4eOV1eWCk+mY6YsY
	d1ZpzBASjKPV1McEpcJXiFbte
X-Received: by 2002:a05:620a:414f:b0:7c9:23c7:a92b with SMTP id af79cd13be357-7cae3a883afmr521803685a.8.1746375227095;
        Sun, 04 May 2025 09:13:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWfqVRImHTF2hlg2i8dPTXb3VY+dorTtSOXnHwH9+M7i4F2YAepO0JanfpdKI8BQ8brOlCnQ==
X-Received: by 2002:a05:620a:414f:b0:7c9:23c7:a92b with SMTP id af79cd13be357-7cae3a883afmr521800685a.8.1746375226766;
        Sun, 04 May 2025 09:13:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Robert Foss <rfoss@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/11] Various dt-bindings fixes
Date: Sun,  4 May 2025 19:13:27 +0300
Message-Id: <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfXwsNf7j3voM4B
 M52L5fib6Tb5kHpEp/rqx0TVsDFUSW3ot21rap37mgThHkYVeaFGxhYRqPOJIQMh3UU/1dIgvQ2
 kI4zI9BBjEMyVOHmCiEJ9YYH5aUvSwz+mgxXnw1E3jM+MahIVAK8MIkBJSjBfj4TdBqrLDemZ3I
 rM6M42QuLnuv3CNUU1zIcEzJQ3gGRwVte1/aTkiXjcXtOfyGqGNO8FSwQkIX4gFZnO7o9N7PzOB
 LPYFb3guF+puzSRKP/4CduHGbgFDkZQSJVz97DAJUHvQpA75FQzAMrGUC7NoZZj2q0uwB0aE/kI
 hpBTaNw0r1TzHrs2FUXh9rSThWyuF9S+HqdOXDNF4vGcIjzaBg057F6CmTXOkRbjxKQjMwU3loK
 HRv1OxFEGgoUQY+i/hXnlVZPvw+5vebIOSuBP1ugGXWwyvhqRg8HtgceOvBb7wpyltlyDzPX
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=6817923b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=AprTATsQUE9CPNEuHX8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: PKEQI4TWHh1t_zbhSzVswVjLnTz6yZuu
X-Proofpoint-ORIG-GUID: PKEQI4TWHh1t_zbhSzVswVjLnTz6yZuu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=813 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152


On Thu, 06 Mar 2025 19:11:12 +0100, Konrad Dybcio wrote:
> A set of not quite related bindings warnings fixes.
> 
> 

Applied, thanks!

[02/11] dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path
        https://gitlab.freedesktop.org/lumag/msm/-/commit/60b8d3a2365a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

