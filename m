Return-Path: <linux-arm-msm+bounces-86483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C439CCDB7B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BF04301BC9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477F130B50C;
	Wed, 24 Dec 2025 06:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vjz0p11t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZszNpV3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4F7328630
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557671; cv=none; b=H6jXKFeRD0CyrBHFypJuACPlnTTyqNiBC87GlFWomDZgNshmJpRWGti7mINF3Jl6ZjBN7tPCZRB2MJIJ/5sbPElsmmsO72Q+1b7WhuHEnJjN7b2HB2BZQeUpXbKAvY3ElQ1TdqAQwxzWlEq7WTctd4i5hYy2M47Iqsr1EP2lvpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557671; c=relaxed/simple;
	bh=+SS2ltcVwvFSQnkKO/PerV7/JV7j4nGcD8UgGoJoeLE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ihSG9R/IP3MODQd26AnCUZrRW/J2BcvxqVCgEkb/k3qzjk3Uxd5T4sKM9eoiVzAoWTU+wmIJPyk+u0HkG6TcbSaLkux2ccm8lzu6SDyru6zsd5FwRI3aLjLke1k2P044+N3WrNe+OBvH48VMt5n+NEVzCDd+tcq/nD62fAyTPSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vjz0p11t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZszNpV3A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO61f3V678252
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zT8QNff3XoKDPSpn8WMsHO
	Q03e8p4wZSay3vJ5V2iV4=; b=Vjz0p11tPkJLCMdWAqxll2YG+0HZPHgaic5Kpy
	z9RR6rUIl2yng7yQCSKGOpOiBwZQHIRO9NC3mKHLd640HwZsnqGqVZka9rS/RRH8
	uheeoBQCAxj3QgIJZU0T5wxieR4MfPMJzWsdHJwiW5THt6ZHazINGLh6uQMw9s/k
	BKHjGciZG99E6j89y4M1tstEGufLyJzdKwOEMMMBviXj62btkatqHYh9Yz/WMrBb
	a37LZ3703UmkcrfKWjbeFwNv62x5YGtqj3lC+Mbb7obf6GDm+LPmmRvBp7wit4DM
	pcZ+7iRup2IifywDYfPWrZwFUJ962hAD6juMvXXQ/p3cQunw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq1rmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:27:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ae3e3e0d06so4986717b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557668; x=1767162468; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zT8QNff3XoKDPSpn8WMsHOQ03e8p4wZSay3vJ5V2iV4=;
        b=ZszNpV3AyVFBEbq6yi1gFX0YB0TiOrvhOYZYXdbcReZaqpuW3u8xyaoLdJLL0kRGjN
         11sEZCtpj5JJ1Kuk1EM+HhXWGuoUIbsvvQXrVKXOn5r48Gi03Dkx9ckpYaFIuT4ePZ7Y
         Dp5EUKzYD1anDKriMiDA6RpafDw/Hfh8Nue6DZ/kKkmtFFZPVEiKNyQNMZ54aG43DZPu
         FcY+q9kE34Smm4FfJv70gMuGZf5vJC4CeSNAGSS0Z/D+hMyFt7sMJS7zzmB8eMMmg8Vl
         h9dT+GEHxZ49g+d8KvylUur7srdk7oc+lv3CZoD7HjyyAMjkLAr1IUq4l72WMzh2FcWN
         r5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557668; x=1767162468;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zT8QNff3XoKDPSpn8WMsHOQ03e8p4wZSay3vJ5V2iV4=;
        b=JY3k+1vj8ZnFji+GZTBivSzV4mA0wwlSUAx2q+lEESLX+Q6eZTmFwpLnhX5swlcf6E
         HLrRdBdTlBS/cSUop4jwPTCOEk+AF1tHUp7iqsb31dsqv0TL2OlVR4qfBnI/KI+g0bX0
         0KkpfbLJG+e1BfZMMVG3uVO4uUdffecIXDUfWv1U45IEBNQZvI9Sm/sEs54tI3KOMaA2
         rU8X3FJdhIow+cBwuqZOS6iCi79QVbT3u57mS2fAUNf7jQSCywX+2Nc5bvJINA50bDgo
         4e0wP2pRgUqpFhY3BTQXGEN9dy19q2qBuFc/j2if0iCucbrZzw8cfhhM9nnP6sQ9JJXq
         XsBg==
X-Forwarded-Encrypted: i=1; AJvYcCVxgvi/Gh1OUAVJr/vNGp5cdDM6uPZPUtvDDPjMIC0jtL8T6mHmreZzPKecIY6VHEpenCOp2iH9ThJOF6SO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywscqz2smSxdKjfkllR7VMQzvq64Y56aUBwqsPdv9M4JZy9sht6
	/rvPu1IQejn9fPuQz0JkETZmzzplB/PIy06B7kW7Kk3+IUS+bTNqGjRurYCtDGsD/KSg5RIW25c
	eOjGFqory+2nyrWnFU+irRq0k0nCCKji8LZwCsyS9nrvBggYOK1Nu/Awoh4CVFUV351gm
X-Gm-Gg: AY/fxX7YTWQBUW6UiW+HGrG2BjpzdrfEvJFeWnn9CE/7W5Fk5Yq+XVF4p+BbaHirjnE
	RokOmW+JKCH1UZEXs/g4hNC24oFckX3j4x41xv2aNL8u8UUv55NFKMBAfZ6VWeyBCsbwi3kNbBb
	FqU9PdG54GZgM+QpcoKvRyyc8KKRXRU89ELJPpLazr14ns5OV1mzKj/Uili/5y2o4f/8lfXWbr4
	Nw4DYIdM2tH6x45v+lMG2yIZsruntArcu+sv8N53qC0mbk7UbEKlPr1L8awQxzD5Crmbrm37DJA
	R25XRit77xNJS20ZpAU9fu8Pc++bcbC3vPsGEc12gi9OOYakFP90zzqOjQxiamNGsDTjsVS/Dwj
	W0HJzUdERDDw119yhQEGtZuzJIV6ZcZAHBmNEEth7qanE2Gw=
X-Received: by 2002:a05:6a20:3d85:b0:366:14b0:4b0c with SMTP id adf61e73a8af0-376aaa00913mr19109028637.72.1766557667611;
        Tue, 23 Dec 2025 22:27:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFf7iy8x+I7pbJ7yXY5PMUmA53IuJq/iPM/dXq8QSuG3B4JkQxUnnMuUX5maUJPg6/Mg12YZQ==
X-Received: by 2002:a05:6a20:3d85:b0:366:14b0:4b0c with SMTP id adf61e73a8af0-376aaa00913mr19108998637.72.1766557667127;
        Tue, 23 Dec 2025 22:27:47 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7eb85f15sm15618908b3a.68.2025.12.23.22.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:27:46 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH 0/6] media: iris: misc fixes for fluster, seek and
 concurrency issues
Date: Wed, 24 Dec 2025 11:57:09 +0530
Message-Id: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL2HS2kC/x2LywqAIBAAf0X23IIrPaBfiQ6la+3FwoUIxH9PO
 g4zU0A5CyvMpkDmR1Su1IA6A/7c0sEooTE46wZyNKJkUYzysmK/s6XAkfwUoQ135l+0fllr/QD
 j9ArjXAAAAA==
X-Change-ID: 20251216-iris-fixes-4be01def1c7f
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766557663; l=1173;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=+SS2ltcVwvFSQnkKO/PerV7/JV7j4nGcD8UgGoJoeLE=;
 b=MRAjhRmBJgvc51EC0OaKtQXnlFNBNPxGrqj+JhFCwarBHivtstw7UWFs6KugY5SBV3ki1/aEA
 tOncMv04EkYDn/0/Igh9C9mf+hXEttydYrxwdR50H03GZa+0gVLdKOt
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-ORIG-GUID: 2ZDiGMQFVIfwgnyXxeOlvbr3YzLJ4lV2
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694b87e4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qJ7AGJJM78aGNJrzRvkA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 2ZDiGMQFVIfwgnyXxeOlvbr3YzLJ4lV2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX1zVygimHXqrO
 OoziyM3m3cr6iTGgxeJAA77n78deifd52cnFoxE/9D/yi+DVVPoASlRGcnWvcim+KIQUI0RtoFy
 aOTPG4yritPnEiDIuO4Bgbp/iCXKaUQOks69dHzH6RahWTQil41oeuJJSxNBR2Sa5MoEAF9nZ96
 wRbCzhMvSrTpNKOhdtRMyp6t3sHICJ1ZUhsvDsTCpN7CmVrfuLjtJY+wUc/+/8LMH2tmQ96ZUbW
 +fnfrvVBns5KZPwhltG753iupPN2bgSX/uLJRz2rlXXBoJKX/OpGeeao9rAY/Uaq73e8oZTmnis
 AFrGSQHSkf+stt79rphCt2c62mSKF9HlfmAwVw8ul762AWgR7OTyCzfkOxJCN5OwNNTvlGYxPdJ
 /lBfzFJ19y5soDOEfBo/WAz2DssUlzBFfeE3CUByH7o8mpnyeVbIZmwQntbNpB9VowTaKmbbmr5
 BK1wh4pM6SDq2rwWKYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240053

This series contains a set of fixes addressing issues uncovered during
fluster test, resolution-change, seek and concurrency on Iris.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Dikshita Agarwal (5):
      media: iris: Add buffer to list only after successful allocation
      media: iris: Skip resolution set on first IPSC
      media: iris: gen1: Destroy internal buffers after FW releases
      Revert "media: iris: Add sanity check for stop streaming"
      media: iris: gen2: Add sanity check for session stop

Vishnu Reddy (1):
      media: iris: Prevent output buffer queuing before stream-on completes

 drivers/media/platform/qcom/iris/iris_buffer.c         |  7 +++++--
 .../media/platform/qcom/iris/iris_hfi_gen1_command.c   |  4 +++-
 .../media/platform/qcom/iris/iris_hfi_gen2_command.c   |  3 +++
 drivers/media/platform/qcom/iris/iris_vb2.c            | 18 ++++++++++--------
 4 files changed, 21 insertions(+), 11 deletions(-)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251216-iris-fixes-4be01def1c7f

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


