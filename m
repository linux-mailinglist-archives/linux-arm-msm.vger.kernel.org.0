Return-Path: <linux-arm-msm+bounces-62246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C19AE728E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 00:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B64555A50A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 22:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917C825C717;
	Tue, 24 Jun 2025 22:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UpsLtGOp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DBD25BEED
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805611; cv=none; b=Uqmq0+dWmSEA8S8x4/v6IkVtBy2ou18JiF1f/MTUaQM9RMEmKwQ9t1Eqtnto1/MQEsEutapEC3QoKVoo9uVLq9leP5SXNJT47tCc5OCBK6Xfs4Mfua0H9zlc5mgXePILhqC7F8GZkaZmOmisVJIFZSCH1V85sHuVC19uJ3C31wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805611; c=relaxed/simple;
	bh=t/rZg2mXoS35Z6g/Fc1ahHAw8Dong0aRc6LecgnXaBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/s5v3Y2wkeoN8k8A6Eaxi3Tp0IER56YtoD7DsphMCn8U7JY5O1qHWVERgl/3DXmfM6QMYzWUQyPeExaf911rs+bL8uTqAsSi1adqNgwhNZuDfJgrzXMfQzTLRgoHbR+amdWrwhTvc+diOfWWr85NvQEYsF4SyqZ/piNE+JaquM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UpsLtGOp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFcGcb031297
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/47YVhRJHDkRQwljfohl4e6sBDrvrN8mrp2H+cyoRUY=; b=UpsLtGOphCfC/MZK
	CdD1TgsjzeHahCrZkUMFA/+NMhTfGkS+ZkCXATYs9GWw6WcH3wQm3enIdAqN6LM4
	KiM9gnqtHPvtr9nUi0N4rE/96Uok3wGV1xpZi7Z+EcMiOlJ1m3/r+TzDLHad4spm
	rICWHPEMsyNebWaBTRhi9ltzHhFRy1v58gnPoSopwHCuA8Pf6G8Gq/RqEiC0rjGD
	3wuaSZYs0ecMewsY2hEMLwtX88QLIAuUZaPH82UpcAMr0isD5j1rxmmPSGHi7/uV
	6Wxk37sQGvq2vx5zhnVRzGI70YWMRVArA9ujlY3Rbx7dZYR2DJ7BA7m8q48uJ08+
	3ytqSA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmqfgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:53:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a71914dd25so137127861cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 15:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805607; x=1751410407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/47YVhRJHDkRQwljfohl4e6sBDrvrN8mrp2H+cyoRUY=;
        b=fNYlqB6Wgk8TjuP2ijCBI1MMW7vf+h/IQDnvNDGRBXUCwpg5664aCedkNSgRMSs/1F
         SrFLmQGPJOXVvcc/ZysTFEHPF8oOFiXoZCR4PTDdHv1uS7moKQStTJnAuAtVpK+GAEI/
         Hqm9dPuozbcYK5y3DIHEiI+ONyIeHZR2OsHjzM4lJ4GPZZyUon6wrTa2Y1oaSCWq2yFO
         P25SnOO2fG45zEnmLPZJEZ0XIhjWdHqWm5+xo9LBS38wjWl3qFa0SSf7Y6uIrOqmV0Zb
         Y9Mq60hKULAiGB1/BybKWhtSw+lcr19Mb1cBitqIFQvjPz116QYTEGOMWNCHj4/P42vL
         Fi+g==
X-Forwarded-Encrypted: i=1; AJvYcCWNX0f59CVxs49a35nG7+y7SLbLNXF0c//UEvQV6hb9Ui3IiZp33i7AzB6eWCo6cYjnSx33A/wQBMjk50oA@vger.kernel.org
X-Gm-Message-State: AOJu0YwBXw2B2g0E/IBuprax1xOgsuGf8oaz7cMvkuwtwAv5ZZkm45m2
	/+lu95QJWFZLVoOsFCE6s1QfTqdibhy7dfHXEIs3epS17vZZCv46cFlgl1CvMyKYjXQMXHfe8kU
	mW6NAOUHH/l4MeKze6r1S3afzdQzTq6mVEWyBLbyrTvkTxnZKcPXmzx69wjIAyHIlCbgE
X-Gm-Gg: ASbGncvkqFtz/1gMLS3mLjOy/hjtq2oroB6KeADfZLV34ciaeogpUCVlcmybbyJneSX
	NoJr/5m6ynO2UTl6fgxlWjTDgMzFUMcZd3kbtQFRMGb8qvaPkmwB1NcX7ovicmJbw4YZqQJZOe8
	W0r50pJrGnVH/EORtEw+XC4k+za1NkGpKqqoQoeJUmRaeNqneTd9L1GiIwISGj5tt88J7gbALK1
	4qULGDkb+0FzKaax3RDftFc9bVd0iH8rKdGdkShQEnSS1w8ydGmmjGFvQqj7l0dRR9Q++4LswTo
	T22rYWpZQzhxhNrFE41lTCwLnsaWfMGEglwOkBpKBcwiAPAOVtMylT2K3ldjhcE5vzJdKpEj+37
	vS3N8w0VC410uct6qDG6oTxmcFJFifh12j4M=
X-Received: by 2002:a05:620a:2815:b0:7d4:6f:a3f3 with SMTP id af79cd13be357-7d42974bbd3mr120817885a.44.1750805606656;
        Tue, 24 Jun 2025 15:53:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG94M3DQjJxjlOh+Wa7ZVDN2Ra0eLm5I+n3Okv+Uk1a/lJierkVbRDFtP5lW0t+YOyOA7SF3A==
X-Received: by 2002:a05:620a:2815:b0:7d4:6f:a3f3 with SMTP id af79cd13be357-7d42974bbd3mr120814485a.44.1750805606292;
        Tue, 24 Jun 2025 15:53:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f5980bsm17843851fa.7.2025.06.24.15.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:53:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 01:53:20 +0300
Subject: [PATCH v4 1/8] efi: efivars: don't crash in
 efivar_set_variable{,_locked} in r/o case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-more-qseecom-v4-1-aacca9306cee@oss.qualcomm.com>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
In-Reply-To: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t/rZg2mXoS35Z6g/Fc1ahHAw8Dong0aRc6LecgnXaBA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoWyxivcQKN9slXayTHROefKCDktNqjipS1qirs
 xkySAckA9+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFssYgAKCRCLPIo+Aiko
 1S5PCACYyB2xDS0iQyM+NvelIhDHfQwbdUlUaEjQVCCSve1uwzQm/XLjA3raAXOL+c0KmJtILQI
 rEOrfxnDr9JDHnVkBtOpy0n3O8UAmA7jXvjl6uC0eFJJaSmChTl+tIOc+2U3qKHv2YgtPIjB60G
 GpTQdxl/X27iK9dHsROC0Xs44R05PsOlrsnqZGynae9K/yHc/P11ES21H+crbemKyW94PS+AyI0
 IIfUaLZrbZVe2OWBk5OAv37znQIV02F63t43l2cx7u225Ra3V5W6E2QlvGYcEcVcBLpXUxDU5/S
 66JuoPiykkS2Vynu1gZ8bY55D1WC0SItw8fZdmAaaAktc2ae
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ht9pKB88AGI_Iqt_nV--vKd8pfgSGC9f
X-Proofpoint-ORIG-GUID: ht9pKB88AGI_Iqt_nV--vKd8pfgSGC9f
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685b2c68 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=2-Wz6HayXEhRivmEhXsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MiBTYWx0ZWRfXzcu0Xc6Oj9Og
 LWrs1+jiFrTgkQ7RdjBIVcUV4my3YnpVm2EPvoGVehuHsXusfvmDlvx46L7zeB3Zsx5vbG8XLxS
 kMVu4xERfop7JlwRkXXHMXKl+wSOOkHan8OoR90RCHo6JSUYOIgpci+U6JlmLK2mhPWRusgnSev
 NkZCW2dJCeAF1LQk8b+83xn3FHvtHUiI/vdHsUAgowsRjOedHD4YUixgzRCZEWgij9bBo4p3/ro
 7n9Vqpx7C7ot3iV2B65on0g3x4PeQk37g9I0NdhUp7XJIps/gD5b9KsDyePdPES8nUduDH/I1Op
 x2rJjuHZ9rOpntEGLoH+eov7Y2iioMVhEswM4xImG2MQ6ccs2iANJiY7ckK6mEMZj2YVWeGlTJb
 LG9Wp5d96a9qWu8N3QtCFirUHo2DnV9jyADFehnb8rhstWOFNWk6uWo92tcBSMUvt7qLXaIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240182

If efivar implementation doesn't provide write support, then calling
efivar_set_variable() (e.g. when PM8xxx RTC driver tries to update the
RTC offset) will crash the system. Prevent that by checking that
set_variable callback is actually provided and fail with an
EFI_WRITE_PROTECTED if it is not.

Fixes: 472831d4c4b2 ("efi: vars: Add thin wrapper around EFI get/set variable interface")
Reported-by: Johan Hovold <johan@kernel.org>
Closes: https://lore.kernel.org/r/aFlps9iUcD42vN4w@hovoldconsulting.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/efi/vars.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/efi/vars.c b/drivers/firmware/efi/vars.c
index 3700e98697676d8e6f04f061f447391503f9abba..11c5f785c09364f61642d82416822cb2e1a027fd 100644
--- a/drivers/firmware/efi/vars.c
+++ b/drivers/firmware/efi/vars.c
@@ -227,6 +227,8 @@ efi_status_t efivar_set_variable_locked(efi_char16_t *name, efi_guid_t *vendor,
 	setvar = __efivars->ops->set_variable_nonblocking;
 	if (!setvar || !nonblocking)
 		 setvar = __efivars->ops->set_variable;
+	if (!setvar)
+		return EFI_WRITE_PROTECTED;
 
 	return setvar(name, vendor, attr, data_size, data);
 }

-- 
2.39.5


