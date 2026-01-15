Return-Path: <linux-arm-msm+bounces-89278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C03D28A0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 22:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0307300BD8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D63327C12;
	Thu, 15 Jan 2026 21:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wuj8sJK4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XFE9INU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28F3327798
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511159; cv=none; b=gf7bQHc67mPLeaeSpBMaoKUGGENvIqPaTaGrnKhfi7Ar5AT2oJjSAN/GxvKagLz9yDr8mmJLm8GiFdNvvrEXJIa2fUZvV3ufeGPIJ3li1YnWcqeKggiqYZiweuCjpKkOiLGOK/x6J+wvKllz04sUkAvYrDUFNG4f3v9qs9Q79pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511159; c=relaxed/simple;
	bh=sfzA/jv2kfwTOv+ctrdwHWGU9NPcphm5AWRbsk0bTPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BXADVcvMQOaxy1gsu8ccw8BywA5u3ruU7nFxefYfAzzqTM+3z1Xy3g+ArdE+om7bPdOdTCd712zTtnhg1eSPFdkuUkY22EDoTeEa7bJXXJ6vQXvF1YDNVQOqFu7lJj06iLNg26IF1MN8uatkSpbFM1gP0x3wJBZutT/VlPi89cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wuj8sJK4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFE9INU9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYGIi2866209
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/kb6DjN+Kxg+2Dboyf3yHThguSDY0BOoE5Ljzy/mnE=; b=Wuj8sJK48O3yrePt
	UizqukN82n6mdH/IZFQyUDeSlTPjryOGTNCpcydP2U7RRtlknfaQUs3klMxVcxnF
	s8h2+fPitCpRCDic4qpydnK2191dpXZmJTD8qKFD8a0tNu+cS7MSgS7OXtOrRTNp
	JeSkD7k/92klvWffhLvml1WY/SmC1ARqKyiocECPB7jGTpT2hfVePnne2QjJ0aVT
	irAHhfaM0LuWbux18LJ/8y+qVp3ThCQmuL1fIzo0JsXmdByu3RxN7BYK4oz+crnh
	PUpKLiSGXHCN9YahEkwIJCDNYNmHd9MYjG5PizOPYP1KpCgvOENxjjVx795DBJwY
	4lO7NQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2jfgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bc4493d315so385550585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 13:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511155; x=1769115955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/kb6DjN+Kxg+2Dboyf3yHThguSDY0BOoE5Ljzy/mnE=;
        b=XFE9INU9AQBaVV9WC4hO5miATkYvZbTupcvxew+tCp0qs2K8O/CPGSq9w2MJCtyGT1
         vLnIQzijD2u+m5y7gnr5l9tqBs5hvde4KGYc8r/aB8CAzb7m1gE7mmkxaIlDaqEmmTUC
         lDhOTxc3zlPrmdAnR14vR7XpaH2WDhQT1weYxAA8J9zyigKgvMpeETGMjERB5yrkWB4R
         d7fsH7E46K4DrmEjcqXfjWIsRcR04BoUKrdSILIANZhqkHV7cz9KJW3xf34i04utgyta
         7x2ssFj0wjnygBXOzNG60Q+ecxmkB7wjFA2wO57nTny8KW8o3RAguXK4NXU1KSNCAHWq
         rt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511155; x=1769115955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W/kb6DjN+Kxg+2Dboyf3yHThguSDY0BOoE5Ljzy/mnE=;
        b=qEUxza0Fct0Udf1muJXjwVV7TsCkjNO3j+3+7U4ttZNGjX7S2Q3N7h1GTXbxCyvq75
         BGD8UU6yA1wjfNdX3C8Gt68V4+JpObTJ8Dh2XOvkI5w8UaRqJ/L+kRlfeBE+fYmR+vjv
         qhzqD60VuD8xGAIGPo3BMbS7jBpWMIUOZ9/3pf1XmHc5XTNzL+vmoOX0UsnudNR/TmAL
         NrH7BsrPDKvNiQuu8kTbEUC2xz8RYW4gU+bdZF3XnBlE3UuqpS6f5X2RC/O4bHEf2shO
         CQyeClIMK5tCUxZ/dMQNm8NAe/bDUIeJB9jcz5fZ9iWFIJR5Kvi/5/1IWSxrjUnVXA5n
         UvQw==
X-Gm-Message-State: AOJu0Yw1JIQEeB47MW3WhurxfSzTSHvBmTsw719haIWOrNu2t82Q1Zvr
	sRIaFnL2ghnfeLZGKTPYft3ByAl1yX7V/is1lon+MyTvw9zq/341wwlW5i09bkOkyvoeR1YxCSJ
	9A2hnnzD3uFxiyRyPCICmsoc2i3fBSOJWFuR7VYDZB/fFcNyAVxDChu+JseqGblq3XjXB
X-Gm-Gg: AY/fxX7AM4/qgHuIDe+c4uthysegQXpy490/QkOcib5ExoM4HFEcUcSDF5FHFa0kHQD
	UesvfV1wIgNyFCWpf6bHd+CSswuGRyJgx6TFXcFfdwpk2E397MUWRpRGvw97Y5HM4igNYloQAEp
	YdM9jGJk2hgC4PbAL/YhU5EJYviCMgRVtTioRWR5KmGkq9MyYKT2bFAAixNnR+IypDzRDXzEq1D
	pzFhEMVJgeMRMVEw1zy59/CCP2NXwgfIvGNEt/va7+t6es0oSraFRL8zHoexRVkDHk4qxyqvf+F
	A6nil1VvIcj0XSjLQoaU/pLnU3jy65m6SIusVxrwXyIJ8e9PMSQUlpOCwP/fNal4rTxqVgfNJih
	HuVMy26ERWD2AoSBzuBbXZ8c6S2e6T6aDL87OACzdaPypMCzqBNTUGkVZ0KZIUmSp6agWgtKKXn
	AQi2KykT03GOH0Fd/noZJL4N8=
X-Received: by 2002:a05:620a:4141:b0:8b2:e1fa:6eab with SMTP id af79cd13be357-8c6a6948174mr99297985a.62.1768511154705;
        Thu, 15 Jan 2026 13:05:54 -0800 (PST)
X-Received: by 2002:a05:620a:4141:b0:8b2:e1fa:6eab with SMTP id af79cd13be357-8c6a6948174mr99293685a.62.1768511154209;
        Thu, 15 Jan 2026 13:05:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/12] drm/msm/dpu: rework format handling code
Date: Thu, 15 Jan 2026 23:05:51 +0200
Message-ID: <176851027323.3933285.2288254082530063722.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX+dw6dlKc9lJ2
 UxvsIJD1gXZAAOccjI+y03GFcYYv0A9iDk8pdDCEJWAfizDnK0h7/HWyFsTlCj/hZ8Vg3c/VB+w
 KUgvO4PLqlwGmYM7jxPfknq4zphHaGlVpmAGg3/6m+/jhbgmsACFtJI/deoxkixOh1TSO+j1DbO
 X9s+KOH1yWe9a1q43I84BSNByyK0Hhnw1XVpVAgOGim0PtKb51x82S8ateZKFOcct+8fVawdCHx
 W41JWa/DApIXKWeuR1t93xGG6VOmSx5c9DkiI9mIppM0nQjwZXyUe/DqSNLfbmAc79ggpI4x4WJ
 bHm9SGruozOsihfcNoX5sh14Ll1gL4oulTIxy8WiMp/5iHNifRKWDrxN+5adeyjAuX+6mNfG8xH
 VdWT5ZNiyexmBYXjgOPO6hU6v0cY2qFOhqE/NPVAkFMwz9hOj3ZTNoTOY+U6H/adhiy6qDHbAZI
 ZIt+dZtq6xwdi2cIcLA==
X-Proofpoint-ORIG-GUID: yZ6YGuuYSYItzozfBrv6E5PZnBytu60U
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=696956b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=uKya-R1R7wZuNpulkw4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: yZ6YGuuYSYItzozfBrv6E5PZnBytu60U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150165

On Fri, 14 Nov 2025 05:43:27 +0200, Dmitry Baryshkov wrote:
> - Rework mdp_format.c in order to make format table manageable
> - Rework layout population for UBWC formats in DPU driver
> 
> 

Applied to msm-next, thanks!

[01/12] drm/msm/disp: set num_planes to 1 for interleaved YUV formats
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6421e1c5075b
[02/12] drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4066b57678b0
[03/12] drm/msm/disp: set num_planes, fetch_mode and tile_height in INTERLEAVED_RGB_FMT_TILED
        https://gitlab.freedesktop.org/lumag/msm/-/commit/adcd6dfea82e
[04/12] drm/msm/disp: simplify RGB{,A,X} formats definitions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8549e95a4b54
[05/12] drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2bd6ae0edf76
[06/12] drm/msm/disp: pull in common YUV format parameters
        https://gitlab.freedesktop.org/lumag/msm/-/commit/72ca4e9d0410
[07/12] drm/msm/disp: pull in common tiled YUV format parameters
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a4378e4bb138
[08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3705de1965df
[09/12] drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
        https://gitlab.freedesktop.org/lumag/msm/-/commit/72f20360d4cc
[10/12] drm/msm/dpu: drop redundant num_planes assignment in _dpu_format_populate_plane_sizes*()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d4db3a06c5ba
[11/12] drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ada4a19ed21c
[12/12] drm/msm/dpu: use standard functions in _dpu_format_populate_plane_sizes_ubwc()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2f3ff6ab8f5c

Best regards,
-- 
With best wishes
Dmitry



