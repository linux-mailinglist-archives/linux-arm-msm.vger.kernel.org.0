Return-Path: <linux-arm-msm+bounces-82343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA5FC6A1B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 9B41329444
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5017A35BDC5;
	Tue, 18 Nov 2025 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAJkACEg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLrrnOj/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D3835CB7F
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477507; cv=none; b=ss2ti7gVZ53eK8YwUJPxuRaA5XmCS/MiYFlS0+yuVKmlhml7nxK/dmRXTHvL5SCZ+KXI2dAK3cRisc6hnoBwR0IvKvBSq9xzbr3Nku44Vf85B3N602AVlj4os1AKRBOBujEDM1IVpdhVLgJDSQvjR9v2kWhRz1MPUMVMFHEY46o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477507; c=relaxed/simple;
	bh=YsXZpPAaNSeCnyMCCLmHOfqq67CcDMLsx+wfM4OBZcw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iQLdH6VKMYaI5QsK49q7SXmUJ1GqpR6RE6QMsZeXe4rVbJ8Ar7nHAjCgeAPDrB2wNBrcTWniEaU9RbBsV0zv7i+WA3zOM9Te9vts7QN8vaOYmBudTXNY8gDVzl6P0oJs7dASm6RNwK9WL2W4QgD9A991pGf6HstPp5bUJNt7PXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAJkACEg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLrrnOj/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIDaSfc624247
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rGGIgrmmsmbimgDt4vADL8
	x+TnC6/clX59aBfoICLGQ=; b=NAJkACEggwe5dI9XeAYm78ykugzPfdiFrBqtzH
	yg2dzRs73Z2SCZZc1h/e6Yyv5u8pSO31AQnVPqgovBWDmzjuc/K9F0s5hweoY1qz
	vq7dZHdoi+jFKOOuoTk2DBQzpijnI3UQy0BMYKZXrtgd27VxHl+c2Sft+drLywtr
	DknaF179k9AyEZNEa0RSrKbLh9JeVTyGAO42y4TsvhQ0wrOBmnxs6lLyZSB9NVN5
	t3aX9qPt/K+/AUqCmQNoAKsU35Frn1MDYwcECdP3YiBYJsbc6fh16/cpx/OU5CYF
	gPN6pokiLYx7GwLG4hBznX+ga5w/r16A83EOC83M7BtAIU1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahfasrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:51:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b26bc4984bso698727585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763477504; x=1764082304; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rGGIgrmmsmbimgDt4vADL8x+TnC6/clX59aBfoICLGQ=;
        b=CLrrnOj/7jRNyyrddyvs0yXaKxsxDfr3eljwN1YOvOgbk9iME7/wRbzO9u7J1DG4UH
         P8EAwBnicTB0kaA0p/4ZVV3ogEU5IcS3g+C3Z8Bdu/83+Vjm3RMv38CPGPq8aI4hGbHt
         Kj50DP/2G7W7C4USR2H9dsAvO7saXJ6QVIzDyblWaXjjYsjLe/0EOpqRu5IvoZIlUKp3
         HFadCzGbTAz9I2TjpxMoCEvIkzKQfZbRmP4idrh05yCaCCKdWSCK/eTgS6gTMb4irCwQ
         5L0QRbc6TrRxhD/YL+wrbv51yR+R6bVQprzZt5ko/6UocWQD6ANHONX6LA9gcLECVh5I
         zh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763477504; x=1764082304;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGGIgrmmsmbimgDt4vADL8x+TnC6/clX59aBfoICLGQ=;
        b=j21FacIO5X02oRpbmWrhpApMkV//lMWbtYFn9OcgVuqqG9VKJmX0WZQ7kFIf8UGDkV
         lTOXYqwKvQkYFPFU8H71Ep/L5+jqUii+wmBYmaCv+ixDE0zwr50jKWNDlLw+JqrM3vCb
         SDtLDBmvGVfF+6QMJ1yyDw30HRTJgAW6r/aaxBURxD3Q41vQcP8Wp9cboCRBg0JBReHY
         iJ+x2V+4hNOWvPZ0IILQBtKHO3Qri1851mnnu7Ha3sHBionPHdjhs3J1nNNjhljAqyQl
         6lyc2BxuClBxS5VVn2qkyFieZ40LndRdzFmlgnrZl5g5NcIbSUMZ+l23f4W72mkozLXL
         lLUQ==
X-Gm-Message-State: AOJu0Yz0+tBVdb0TTcc5kDSTn1HtWfT3seECoPxjJnsJX649doVOKcD5
	Es2peY+aJx3xWcDgOtOzp4uAm8n5xTOlNkyr0MNxDpCr5KficF3XygBjsu1d+/NksgCX84vcbsn
	ealuOCcREHFF0LHNOphfnPfb2Snldt5Z7IX0ISxhAQvILC9zVSv/wHMQnk4rIVCYR9v9J
X-Gm-Gg: ASbGncsLiC+SHiTz1vpSUX/xoCLCSQAWyEjGQy/zJQD9B0Y3riTECFg8ykIqPEV9EcZ
	4ALqh7cepXXzKQV5ugldyGKo5wuToNhd1h2ej6coZFntzYb+R1X5O5ynFVLN/GfFwzBezRDXXd5
	C+jMrdDbgyg/bNZ3ddHvVx8KHpWTJpZRz5f8HHvT8PPF7WhKADQTTmSRYZbtH3ib34XK9Q4ObFb
	yOMKiK+sPWG37QXKL34fitORXCrF8DTN1Ry7GaNSbE54i+SSdC27UY+xasERtiZSShR9lSbBvTQ
	WYvoxc14nWLJVzGzqPpHHnl91vES0/YP65ibN4b/HWjLi6B/DLvkpvKxzlLPkx9HWa39tfmhC5e
	dJTaTkpzWeMmdS+Rfum5PhDdrvzIxxkfYvnKqg+wjXNk797stBkUN8llX2vmT2WOyj0MbigxMIv
	0hfQno7X5t9RL5
X-Received: by 2002:a05:620a:1913:b0:8b2:7435:f5ef with SMTP id af79cd13be357-8b2c31af092mr1906434385a.41.1763477504145;
        Tue, 18 Nov 2025 06:51:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOh89KGm2e3SAC+RYQcrRv9hFDfW7hchMk2teOMHv06MEbLSDUqdxcp8lWwug5l7F2CNaMoA==
X-Received: by 2002:a05:620a:1913:b0:8b2:7435:f5ef with SMTP id af79cd13be357-8b2c31af092mr1906430985a.41.1763477503650;
        Tue, 18 Nov 2025 06:51:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804056c9sm4078452e87.90.2025.11.18.06.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:51:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND 0/2] drm/msm/dpu: use full scale alpha in generic
 code
Date: Tue, 18 Nov 2025 16:51:39 +0200
Message-Id: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=818;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YsXZpPAaNSeCnyMCCLmHOfqq67CcDMLsx+wfM4OBZcw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpHIf8MKNxZ2ueS1HaSCLaQfJho9tD08SK2nuYM
 Op+LcCCuKGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRyH/AAKCRCLPIo+Aiko
 1R4HB/9N7rlkCTDCnt3lIT7pFnquNU+9p5+FxOxvikp+OLT7qOm5e/EdfQesMJZZG+sViaWYf+c
 q+PkOarRQMH5txAJutQ5NYKYsOifKwbDEq8BooXb0QrFRyHB5u6RabCwfnOCaQ0Qy/DgyB2A05E
 MWF+ooaXZ6uqc+9v/Al2K+ecpxqagyuj7BvNchYe0OJRg+R7F34PhTeh08vwe0KXV3A/xHrnM8H
 UqtpieauuHQuAyEUAhiz51QT/y8WjoqctmOAvGKoDl6zpXtntz4CYjhXs5zL4zKYqAFGgWhvQn1
 u4C1lIyQSvfbSo3Zi/dnqhSd3SheWSM4u4mftMJhKlxPT7Az
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExOSBTYWx0ZWRfXxqfxvCcKAOPv
 3HDQWRmJXqwhXPLkBxoNPhSIxK2w3IdPW2nQP4v3V2Fj21znBi6+qt5y6CSbqgtJv0RXw7tuMie
 YBl8Id8MSzI+eHtj1VjCwc0T0PgNFimLScfFce8r6g9ikokWbu6zg+7IlZ4KzwrDuBKsQqrLI1+
 lwzeGI8SUbD4UH9n1fEFBeQRkDDSRbINsltlhmthwS7DdDZhar/UCzVyplGHKrLsT1po6Ykq2H5
 71wVFoNK5oPfwRLd8Jp+f7WulWqUsCqUEbn7eKXK7CuJwW3N4wpG/NYSuzPPhdpab601XzOJ6sw
 VhzVYLC0S0YCdr//ZkTKQQwnuCDDw/mB45vBltyd4VmiCkDqmTBKvR4HP+7bpIhtmwBilZG211d
 tPM7oH60xKlhq2TnS8VxqMsqi+cBzg==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c8801 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=XoDkaeHCiDYGaMSRgogA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: JPujhJV4sAxM5PqmLE5mv17jJ4tGCj-T
X-Proofpoint-GUID: JPujhJV4sAxM5PqmLE5mv17jJ4tGCj-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180119

Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
callbacks embed knowledge about platform's alpha range (8-bit or
10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
alpha and reduce alpha only in DPU-specific callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/msm/dpu: simplify bg_alpha selection
      drm/msm/dpu: use full scale alpha in _dpu_crtc_setup_blend_cfg()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 10 ++++++----
 2 files changed, 13 insertions(+), 15 deletions(-)
---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250814-dpu-rework-alpha-060ff6bf5185

Best regards,
-- 
With best wishes
Dmitry


