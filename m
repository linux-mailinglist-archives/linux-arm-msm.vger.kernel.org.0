Return-Path: <linux-arm-msm+bounces-71362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC6B3DB19
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC0B0189BBAB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 07:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512762652B4;
	Mon,  1 Sep 2025 07:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5BHFNO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB49A246770
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 07:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756712018; cv=none; b=bIkctJ4CwQo9gNv+WOGNFh3JjguUcEw3KKM875SHXCCuSpAIK4RCDAToFSuCCevj+cmipXMPAFdvVFD2XZ1X+FzuZg7r++TPWXrcczQWByv3vUYlfqh8cejEovGO6uLufAZThjOY6/qPg+1YjeaGoWW4HSGkOWywDS1zOTamJVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756712018; c=relaxed/simple;
	bh=gVlSE8+FJxabJJF6HJCmkpMqpJLW3soo9nABGLW1Fu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ffGhDOz/ph9Hh+FOs70bIIjH5Voj9j7PC7pfI3BPKniOcuySWM2kf6odoV917BrxpbQhdDKCZmuZM/THuw/j1E2rF4CipX8ZQnMqXyx5mgl+XG09Xz44O8/o9bQJ9y1HkhumAGZvd124m0LTHhzPkulrxtOqxRKcP858v3QOxq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5BHFNO+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VNwMIb031143
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 07:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5DJRmLadUWXtXyQvcD/tBF
	b6Uo8uJs+NYbbyFSSUDyQ=; b=h5BHFNO+3cRr6JAK4jf0kQdxlHArxlC9NlJ2Bb
	skIC4wBLiifLwhwKMWGmPeIQt/pKFs/LB7FgmO69JHxrYqS93QhPxyitKK59T0Ow
	+GLpTQluFbEoFpkJL0JztqDqq8rBQMO3fuuxz2l0wcLEKUcvwlBCotQ/kQMQ9gsx
	S34P/4SgNBHyH+UrAY0+iNY8B/8FtFU/bd7Tt2WtW07B9gBNLqYlOLOW5WWc54lo
	q737IrfbQmiuyYXu+pw2BB66HZff7KfpXBtM7wsR8AMPjgeGhl266ZqNwKuMbBI4
	YSZ4kGVwGZy+1UYx8+W1PAt5hZbbNlsgwjOUxf9okwCtaltg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjbrhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 07:33:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24ab0409d3eso21139045ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 00:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756712014; x=1757316814;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DJRmLadUWXtXyQvcD/tBFb6Uo8uJs+NYbbyFSSUDyQ=;
        b=q3t+ZyS3lPgdyIF/8yQQfOncKAXFssII4GWAzLSnEoX9273A8rbIr+OLOWs7k07HJ4
         X9Ez3OWc8AdDsPi+zHl1Be/tfeN1qvXsJLfWW24Mx7m0DK42JvcIDyDgD3Rb7NtQ3G2+
         Z9myyUsOF7ptzEFh2bqV0MkTP6pflpNCNMDNEuadognc8d1/MkJ//T1RtTWY4+dDDmSC
         u2EfsWqlS97esyVyH9jyRExuXhSAiuT7bs7r21lLBANW2goCa1lWvWlaxAeepxqZTwDe
         mT7rPhCJli+NMMK5HUTTipgXbKKHhRNxNiei6Jyf+DY9uqXh62RSDzMA1aK95IWcrSJ0
         GaKg==
X-Forwarded-Encrypted: i=1; AJvYcCUlcKeP550FM1VeFYz5H1hu/iW2kwaRVFQbXsKA7zTQGsRZ1FLsMJWXya8NA+aHt2YMcd0gVhcnPt0CXN+8@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/q9uhBl9uhPkQHbWZCTRqIrO7DnKw6o8JtoMxTU9+LXeZEUH
	7xkQq2pcv9gGfs4/jeUrtGxev6L2UT6ekRLxkSzzCXkepX1O/wkpnUy6BQyN7/HvpH/LutpSOVA
	SmgieYRVi0ATmHYPaNCVNrWwETWzFnOE4KWmtO1mTqizItBjDYDar5qXp6E5dOyhuN1o4
X-Gm-Gg: ASbGncvEYWseIRUIwo+tccaInL0blSQGNE/A+M2vrl2ht/mG+eEHWQHU/62qFFEFzmi
	QGmdK5CfdeUb0kW8EMFf4iY1+QjEWCnTL677JnMVfVHxbgn29BoEDXFvSSas0FUqNKJHhV/hIBv
	Ru2qO+j+G5gjH5O7z0qnlt6ofXATFMIdNUggpGArqiNacN5JDwXfBtRJ9r/00WqvqgojhAwTPHw
	Uu67R6VCOvszi/qHQKCo9gvdZHD1EQLBjA7bICuj9lwUTJnrRqih6IgfBH/rVgb2J08vnbJXxCV
	fv1sxvyEPsy8S6GJ/c3rRnBUSGJW2T0SEaJJeliViMyBEV16DKFDjoVeleNqWoH0YLThuJB/oEv
	OGg==
X-Received: by 2002:a17:903:32c9:b0:245:fa00:6e25 with SMTP id d9443c01a7336-24944a9bebdmr93753975ad.28.1756712014476;
        Mon, 01 Sep 2025 00:33:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvxr2epv/+TsKlTzR16S3I09bGwKg+e+Algqa7VJCpSEfXE5hgM55vx9JD+xWDXFQQaSMSqA==
X-Received: by 2002:a17:903:32c9:b0:245:fa00:6e25 with SMTP id d9443c01a7336-24944a9bebdmr93753595ad.28.1756712014027;
        Mon, 01 Sep 2025 00:33:34 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f5a0bf9sm16095554a91.13.2025.09.01.00.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 00:33:33 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH 0/2] media: update Dikshita Agarwal's email address
Date: Mon, 01 Sep 2025 13:03:27 +0530
Message-Id: <20250901-update-email-v1-0-8fd49d58c0e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEdMtWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwND3dKClMSSVN3U3MTMHN1Uk1TzxMQ0E6M0c0MloJaCotS0zAqwcdG
 xtbUAu6TRsl4AAAA=
X-Change-ID: 20250901-update-email-e4e7aaf42f71
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756712010; l=797;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=gVlSE8+FJxabJJF6HJCmkpMqpJLW3soo9nABGLW1Fu4=;
 b=ze0huHxvBv4Aw8AJgx+M/NXYh7bP5hi5WXOBeVALQ6BIk252y2rWE81ab2qdudDI7UaTB7+yX
 PvkAq/1VGkPAWwfasfhxHDmS9vvSBpl08G6QbWzLc81wN79fIk2OQ0S
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b54c4f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=kqLEYqA6lE3EGcPpYoMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZWuz5o6qvX_eN3bAqp4PiDYWHztJT6cO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXx7jbEBrrqVIq
 O04oqTfPcuQgnqEskOGRvbofFaPR0BggGSzW8EiZhzGAdA+YinaxrgwZ1eOqNsWELfrL8BFJZxz
 VKLFPY9Mj0Ops0DiFVxJ+cAYVmVpQV8nMeGqH5U3TJ6zsINbc42yeuSSzrzr5MRRKGdC8QAvl9t
 6Gg3FDhtyDfx8lwBcbVUC4d+Fr67xTym4Nb57Oh8fkSsmuCNOIE2/jbHWvr3PRilJI8LrjyGDN2
 0F3Z2Mo6R1thFPgwjgd959AE4nxp9FCaATL6YRXiwIvVEjDZd79ppk7QniZ1+LWLA140/j6ifaq
 Njurlhm2MagEHWpIVd/nis5mavC3UOb2UlRcgF5dC7FeYjDYuNztIjB75oKxPrJKGAbewqhAfEd
 vUVorGMW
X-Proofpoint-ORIG-GUID: ZWuz5o6qvX_eN3bAqp4PiDYWHztJT6cO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

I am switching to dikshita.agarwal@oss.qualcomm.com for my patch
submissions as the quic_dikshita@quicinc.com will go away in some time, 
update all my emails in the code accordingly.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Dikshita Agarwal (2):
      MAINTAINERS: update Dikshita Agarwal's email addresses
      Documentation: media: update Dikshita Agarwal's email address

 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 +-
 MAINTAINERS                                                   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: dffd279a8aa36479d127766e15fa817830387aba
change-id: 20250901-update-email-e4e7aaf42f71

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


