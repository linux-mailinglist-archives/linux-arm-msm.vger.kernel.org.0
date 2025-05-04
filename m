Return-Path: <linux-arm-msm+bounces-56706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0711AA87C0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 18:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BED3176DDE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C531B1DF994;
	Sun,  4 May 2025 16:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UN5hFAEe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D51E1DED53
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 16:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375219; cv=none; b=uR+M05/u5VwO4yD7t3J81T5Ft6SSvfKrU26CgA80J+npQRSS9qFyKlK3Q6vJOc0n5GD8c9/+fztnTMgRGTKXgxOedNC21UrJeoZaaljnXwaI4SMhrAAq3EgFW/X1TJbyM/z1Em4ReaSD7g/atqjRbgECDWrehZoYeA2tQ11XRtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375219; c=relaxed/simple;
	bh=mxTI29ncxsslT5tqzVqzF6esCQbl4MQEJnMKnvcIrjY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RoBQXiSeaRYxkpeh53lJsIrGt+tLiOlu7gTTAhH0Xb8urRuPnIf+F/rApnsjaON9jZGM94rcw2+1VVbcvyU7PmUUFs5Gc/GpiDgZcljQ4sLtP9XF5X+MA4LR7T2lMK1ILyIT5EPU67l+2NBVxQY/P3nME9mbOHgVSYRZxQGx0Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UN5hFAEe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5448KBo3012776
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 16:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z4Q4oxnerkJx95uYsxiAX3sxi06TpYgZRYzGCnLdyRY=; b=UN5hFAEek1zei9jk
	i+ey+b23GE5m8v0soCodqbAk7BIMQ9UxSa2etCQLexjOb50jI3RqkrXM3ZSptuEw
	YnDbu1OwqigsjQmynUJmgkQk9wgsrZ9M0zP0s8mwwC0ORKaNj6128QQYzdH26Qdn
	m+ajBudEMr+SBCAbQX9qF3lu1kEpUpUdq98X083XqBVRB4wORvvCqPnYumNug7BI
	WfBUA/owmqHe5f2qI5S3q4qkf5SmdcOI5H9yBlujFjx2o29O58rYe/0Pk616/RoB
	m3oK1rl/vFJOOcIVTV6ZUwsUV9OTsZ1prG5jlHTQjpG+4Fj/zW+lfy0f0S2wIDkD
	2jM7AQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55t7c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 16:13:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f876bfe0so643734185a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 09:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375215; x=1746980015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4Q4oxnerkJx95uYsxiAX3sxi06TpYgZRYzGCnLdyRY=;
        b=gKraNwc5746FdjJlT9ogzllt3hbDWfpPMh4I3wWDBbSUecUT58qOCQgc7zhh1LXHoQ
         METLW22t56Gm9PKMZrQrigz6iNdSLNStlb5y4JaCUYFxnGERKVx5HlR6jIqvHhF6ZnAK
         vEzNrtYnGEdLzdQ+ooLodrGxXxcfkdhnzpO5zG3at0NyktQIY83RMIto1XnAuV7DRxs3
         Vy7qpxcNVHptFlJnh5SOtPpy5VNs6RE9RYAmqw37glB54zh7c5Sq3FiRJ22uZVT6QBe/
         KibaY7+gRFYefL3wByEgKf1K49/PLBsVMBHLE5kEeH4E3Uc9aYsvleTCZKyJahxceZz2
         nUyw==
X-Gm-Message-State: AOJu0Yxm0QUMp/BN7unB6rgFNw5ma8bYv+r4JO/eGtaMOZWNEBM5y/eB
	UTLWQMf5JlikkDNyg8bhHIIsqKt0F4wZ9JnY0MZlsIGnzn1mqj8WRyIh5hVeIqlAPX6F3Bqfu+t
	E0LGOYq+AVDUjq7wplptn+mpgbgHt/yZ/u86jTaeNbalgA3Q+nK0upcPnxqvGiAr1
X-Gm-Gg: ASbGncuY1I/kVC2EfxqyTaO7dumve8W76OVBs+3qHnVjOU/1090iNtkG0t65WYYvKyF
	I6bqdaddlz2cMjzwavsRGapM9HGJEFnUS44esU9IGAN7Y24GJYRKQTAeqRjmPukp9vJsw3O0xuN
	/97r30nbNOXvaTagFsvV8ehIi/RJ/EZDcZXrZMGSgmvFRHPC0L6jYMPeDNAZfqQcV8FImntbHnN
	YlugFBWdNZo73S6Jl80nObP03R4V7dxbfloXJP2ufmkBMh1BGPPajj9K5+60TIstmHMJaiQ73Rq
	WSyX7CjZbwPEf4dbDl5iGGJSNswSWtiTQdaO1gKwBfT18p+ZzXriOyCS+8GwR/sQ8WR/CeRcRga
	gGZKA2RwuGQr2Ks+ZCh6n92UI
X-Received: by 2002:a05:620a:1723:b0:7ca:dac1:a2b9 with SMTP id af79cd13be357-7cadfed926emr912055585a.50.1746375214994;
        Sun, 04 May 2025 09:13:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGco5fgaYnNMpsBBxEXRo5nZ43X/rGRriKVtlsYHoJbTZ+8uY8xGUEUU9xBouzMhrR9HrsDow==
X-Received: by 2002:a05:620a:1723:b0:7ca:dac1:a2b9 with SMTP id af79cd13be357-7cadfed926emr912052685a.50.1746375214680;
        Sun, 04 May 2025 09:13:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: disable DSC on some of old DPU models
Date: Sun,  4 May 2025 19:13:20 +0300
Message-Id: <174637445760.1385605.8148657144550211301.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX4nrf2BR8/Agd
 sfYE+1iilnSVRVl0duo6ErtwHEJyc6ocda6HNazK/LJ5x3ruqzcL6a5bkoQWgDC+WRiFUK0HL+Y
 TvupOE/B4raoK40Y3AGAN+hVC36WeQDdIQyRGakH1HqWgBNLE+51/Y/s5UxmLSSfN1rk0abu4er
 0igpqLdK/kKC92Ye6xNgz+JOFIOjWe3wDMdzC02uB7ob4twBPuZQd+9Ha//jN45+FioVkujLai8
 g4vxhkBZ3lGOE8HlLBNyrAgBq1RTFZKZlyuA8ppEf30tm4grpGL8ZnoUdgho/8dBvJ9icZm713/
 UVjmN3llleo9PmVVn2M4QLm8ihVMjNeKeSt8+kepARl//HWiVMpT8KGHXqkcRe15nheTWxRFCKQ
 CVZ4C8XqP8vCiMgyD+pdg6cdboP4URV6UKK0xpkU0pgnGb5qF7lBjdwQ+DMeTCxUoJCvmPai
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=6817922f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=FEuYHSLItigONA-XwN0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: llS2fw99z4A5-pzA1N_x2C5xKVz4dOdy
X-Proofpoint-ORIG-GUID: llS2fw99z4A5-pzA1N_x2C5xKVz4dOdy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=564 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152


On Sat, 01 Mar 2025 11:24:53 +0200, Dmitry Baryshkov wrote:
> During one of the chats Abhinav pointed out that in the 1.x generation
> most of the DPU/MDP5 instances didn't have DSC support. Also SDM630
> didn't provide DSC support. Disable DSC on those platforms.
> 
> 

Applied, thanks!

[1/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b43c524134e0
[2/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8917
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5be98120115c
[3/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8953
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5232a29ebc74
[4/5] drm/msm/dpu: drop TE2 definitions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e1fbb0d78e86
[5/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630
      https://gitlab.freedesktop.org/lumag/msm/-/commit/075667e986f3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

