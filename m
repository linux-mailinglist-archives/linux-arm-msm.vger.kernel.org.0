Return-Path: <linux-arm-msm+bounces-70343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 216B6B3149D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6253BA2ED7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F2E2D7DC0;
	Fri, 22 Aug 2025 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFTWwsQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8997296BB5
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755856854; cv=none; b=NLqFGbMEpBLZzGggf4st5ND/x7RCOns+x6FjvlEKeJ76AXU+CLeOHjQdQOM8qMT3s7Krlo9uep1lvbZL+5TbkO4uJZP4NelLpC+XDtSxzMs5c0jJl/az3kTqSnWeLYuzTfrihk29Xj5oMln9YWgOGHHAG9PNvN774ZMAGnUipPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755856854; c=relaxed/simple;
	bh=IN/9k5eKqvtwYiC4dwIMx/h9QOJQd7wmJS/BI8UgYf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fdn0X6xP6hEJUJai8nLchmQtW3AYMw0kJxigsmxaAF7UaL5+1hBg8Wc4NDru/b+cip0FWkCUAoZhwVMDGmm14I5uAD4FfrA1jbl8LJNAkx1F55BNGPKYM4C/TYAPFgl21E22Q4wzRcb8BQEx0JPqAanDFsZ32gtH4XXWKlfPxxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFTWwsQZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UIiS027221
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BiZ7xasJHYty7KtFQNXG24FyU2/Y4YICeik
	S15YW1Ns=; b=dFTWwsQZE33huhNM22tYIR9hkj3HW2rY6o8hm00mkFWtEL8D6B3
	Y8uYQ5vgraV4gu74rdNUN8J9AXYrVktpEm3nldFHgTD4573R3qp0HackjJ3B2ag2
	HZRnDi3EaDUC0UNDL0U43Vy9B+bPBZ1daMUaFV5qIv8wUUkqEbrfxQj4diTWmWT0
	MUuAZJYbKicQRW5H75fkdEYRluMU74NOoPJInXzFTMiP+A4oDwCagOzYhZtBnBtK
	HlZ6sGzw3tGDukNst8JJDM6536f4737iW1QpyALaV2nxdYeGRg7nITkgTy9GPoQ0
	oMxUOin9VqPkG0BdbVK38QxroFI1De/Fh/A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5298tdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:00:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b10990a1f0so57211661cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755856850; x=1756461650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BiZ7xasJHYty7KtFQNXG24FyU2/Y4YICeikS15YW1Ns=;
        b=RcPReeToBqT8IjH9KCkxkux/Sg3D1cYfzTmVctxW2UC6b3cR2DAt7/EAwMD4mg+y3X
         /+Y9lUwT9SliEuwAE0aaOcDIUt4rtrC1A3iMFekmCnmgePnDPflyW9PWjLg8K0yt/C47
         YwRviybkwXV4I0vbWMIQlOXJahqIoy1dXVWKWJjv/PDqcP4Ng98nMBP/ZuWMsUcYREtN
         bybC+UzduijatNdMlQ3O0PdpT+JSh0Hv56G3bAYk6aYa1p09i0kAE65iGmJZlJOuhecq
         iNjBQn3POMVOZuhF2qZGdbS/i5iODMJgGxbxnHBAiYAJS2a5Y2uC4V4pVUNY89bNPi/C
         ZF4w==
X-Forwarded-Encrypted: i=1; AJvYcCWZDPbJCk9Dr+yi3i5C9PftSDH8gADjjCp/gm1KF0rDHkvoPMRYdlmIKii7sI8Jah+O462iqD8S098JxO53@vger.kernel.org
X-Gm-Message-State: AOJu0YzpAQtT8p03Bxu0kFohH6KR7rIyStoNduNiRp0xCR5iy8yLcFf3
	uutmN8tpi8Motk3gkEJ0iTk3mFV4qLLCpQxhkne2HdxoyIfbu+kMq0dFU9QyfahCyJMZ61KCGUc
	U8yTcn7bwEM8ZTV15+wNYsDqUZe8SHPAjrjxCJXR3hPfhe3LdDatKNiNNB95BxoIQMuzv
X-Gm-Gg: ASbGncvSFG7SjpNe6M5gQFyGkU5jV+F1Mh2cJkFPh57dIg3CyoVtxyebfvifG37kdC9
	vhTPGOzWxoWB6gRhAEW915LKq9fUWkJuV9ZQVVBt36hXX2KUtkREyGXRnArd+Grkl/w7mE+fb3L
	TvIioN+fdRDjtgCLA3wbxiuXsGwt68+ZXbeauU0RfhL4X+8u/B1Va6Of0lR/17vW/HcmSJDbyh/
	8JFwmGhtl3Y3YMXYHUhimifw2uwj43OnnoQVAotEYIJKJOLkGeiWKXWbMVrvLIh6RgWsEZkntSh
	gjrLHYFDBAMl+aUZPluLx0EfAGq17Wj7h+KpX7yGj2QNVEWBihj0Ow==
X-Received: by 2002:a05:622a:15c1:b0:4b0:7575:7de9 with SMTP id d75a77b69052e-4b2aaa8127fmr25925391cf.29.1755856850115;
        Fri, 22 Aug 2025 03:00:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHlmImglh7kCWwqglLr0kKxfa+uA2dLapDHNyAD+y71j9BoiZKNNUVT2fntTr5vj1sI7+2Jw==
X-Received: by 2002:a05:622a:15c1:b0:4b0:7575:7de9 with SMTP id d75a77b69052e-4b2aaa8127fmr25924861cf.29.1755856849508;
        Fri, 22 Aug 2025 03:00:49 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0748797a1sm14184608f8f.5.2025.08.22.03.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:00:48 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org, srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/2] rpmsg: glink_native: fix leak and cleanup
Date: Fri, 22 Aug 2025 11:00:41 +0100
Message-ID: <20250822100043.2604794-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a83fd3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=nIwsDuCTDOBSikEnyD4A:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 5IppV0VU7QUqpIXOEOLB0TN6eBs1PIHu
X-Proofpoint-GUID: 5IppV0VU7QUqpIXOEOLB0TN6eBs1PIHu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7GLtGNT/j+7d
 yPfk86dqypFXgIWQLeWG4XfHHe7L8vwYEz0zR+aaDRkWXRCNv/Seu5iEPBgjEygTC2kiw+VX4y5
 fke2iIU41OVs21aV4F7XK9N7EfuM/gDttqfP/6fpbbluzeFK0glI3MKx2/yLD1DQxjVUC5j+45q
 8uU1o38RdIE+lH7IRKCLdV2jSz6jykALngMeT+S1VhXoeA7jT8edfXLt9VxJOIlGhhznGIBBHRB
 5W/S23+syCkeWHqKZRt1YUCqLUrQviofTQsbFGAGi0FCk6WfMJ0gMAmGnYZfpNDaVokBYdcpAIy
 +IJGyvuRp2dAbakKt8HWY+cVwetqa1yC4Zl7v1593ILSUTXmdZ62GlrhbJsjJSsPx+XRwqU34Ye
 ON8Djv8Pa1hjX7WrcYhWzWZQwe2xpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This series fixes a rpmsg_device leak in glink_native, and also adds
helper function to remove some code duplication.

Am not 100% sure if this behaviour was intentional and not allow
rpmsg-char interface to work from glink_native, but by the looks
of the code it looks buggy, which is why am sending this series for
discussion.

Srinivas Kandagatla (2):
  rpmsg: glink_native: fix rpmsg device leak
  rpmsg: glink_native: remove duplicate code for rpmsg device remove

 drivers/rpmsg/qcom_glink_native.c | 35 ++++++++++++++-----------------
 1 file changed, 16 insertions(+), 19 deletions(-)

-- 
2.50.0


