Return-Path: <linux-arm-msm+bounces-62127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A15B1AE5996
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 04:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27ABD4A19DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 02:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0FF219A9B;
	Tue, 24 Jun 2025 02:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kfm+e0gX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E4A1F9F70
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731246; cv=none; b=uOwpRe18/soTaB3PojyxL/WJ+G+yc1TC1kn11NpsbK4wv3Q/S36B9/8YOgQo4lwfQC+DvJ10yWw28pwR9N3z2ivdpYjh7MJonKfgsy+4ADcx/dlaSG35m+vsk0dJXhi+zrl1kS4YLJVhi2HRhFahvtNuzpwDRSQxhL1FQoucUgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731246; c=relaxed/simple;
	bh=t/rZg2mXoS35Z6g/Fc1ahHAw8Dong0aRc6LecgnXaBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ofjZR4lP07KwaAec2OKnOGLfutanprXT0lGU/CbxTlei0EwZndn+RJNHbvk0/e13sA3ZwizZHjRBoBE5vly2VDsnLxMY/1hpIcvHZHolkOMwBEeCMisBNsf7rXW4f0E4nZ/wujTTlaLEs+rOiUfEm8zh4OFTlq2EM0Wb2T8IEiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kfm+e0gX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NHVf1i006106
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/47YVhRJHDkRQwljfohl4e6sBDrvrN8mrp2H+cyoRUY=; b=Kfm+e0gXMOYuSCQi
	fd7M/lRqEXF8FgVp9C2C9Md0QYX/QC/oUtjvF472QtHC3hanXoUUFxywffpbwxF/
	c9W75VjZVyOVhi9t5RcWwAEpoxUmRaqghmOzRSm8CtFSg9hfkSST3TJFBFoKZ/5Q
	v84SBpLX67FbZHvcRwhQMYXTN0MXLFyGeZ34PMgJY3DGNE7xZirGvxNSQQ2Fn8fZ
	/CRpkV96QQtKDPBrpIPBrcoJNHkmCFiP3fX7B6lrgwCSgsqzGlvQI/TCEJQGJSUm
	3y+d/1fcv+e8Rk7JmfO/cqMdk97kGnerTB7EwQ3r9RQUhCqSVgakgzJZCeC2IOhC
	mTD/3Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgahd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:14:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09bc05b77so799719185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 19:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750731242; x=1751336042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/47YVhRJHDkRQwljfohl4e6sBDrvrN8mrp2H+cyoRUY=;
        b=iGHNXzurYhRnMe0mGYV++ZV4Vmlot3N25HOC9xOIX5auccDYQPAxQehWZOxPKD9Fn+
         aiTZrw2UcnUjfOQutJ8ZCFK8gNaTCR96rgGDLkkLD37Iok5wN3EjlfRd8l75zNrY1COl
         rEiTNr5doFlTVmMEhWD3tqn7B//RshpQpqHiE2xiEKPtpbWloelefmOLzmuui4vNbTKz
         korvOdnj39GK9sJrH4s/p59lT7Fk6jMGnGOcMpYk2CPij5QluRZBvgCE9maZSIMTNo71
         AMebgOCe3vdXfSOh8f+210mUFgrhjyer28BIkjsLR5tfy0TDMTnNiUCBWw/otaPDF8Px
         AVJA==
X-Forwarded-Encrypted: i=1; AJvYcCVvc8L96jX95WCeuKkKMW2k3vUBwRUsTYSot8DqN58dqlRvAosLY7tviJx4Vq6Gu+tGmf0bCMF2qYPiYEkK@vger.kernel.org
X-Gm-Message-State: AOJu0YzrfvKXJ/h/LVNx0vte/f1zURhEfm+7Vzao1AWF2hh089dIAtaU
	JVcP2N9nGFfvzK5lsW01X2YsntzphWX1cHK2BGgq8v+hhplry0MAE3areLadN4WZUyiWeibu560
	ROif07CzipMJ/H5AwC+ADmSJ+uvfFZzD7bRTq5ZrEX4IogrO+D7B7KBfMEvQ7oZCIZTMaQHcpLg
	KjRK4=
X-Gm-Gg: ASbGncvzNww1gKchg4JlMt8kHUHCA+CR7o8ZvV0WfZpUmAZahpLsNAta3gkVKCMFGYh
	NySBcAVP1ElkyRdciquC72ueYJ4wFa45T3lhuGRilcL3cSD75HuWlJyFfIXFIFO2ugZtB87v7iy
	lZpeB9ayUexvOCvlPhzHN6DcAeg/EPL4ncaBGnghr892lL6psKiITPurTI6WwdfRi1OTReqRJK2
	n+9JE9S8t0w9HYj6cg2FX2FheCfl9ljQUif2P+MuW6VU7O4qlHqQu+FdBxCHhfnSFg55lbqrm1E
	amCghIAdlZWIv00LqX47wvzZfLS48uWtkWQlomOlP0Wl7bveRtnWb9V+CWxZqUsQUOjO7NsFxIj
	8T8s0VwAimncQH1MjVFfDo8SFPlbEK6/2EnY=
X-Received: by 2002:a05:620a:4246:b0:7d3:dbed:869b with SMTP id af79cd13be357-7d3f994985fmr1943749785a.42.1750731242068;
        Mon, 23 Jun 2025 19:14:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqNvGeq31ZsFPXIO/lQgxlb0Vn2tpiIlaT+TQgY4zyabgD3bBEA+zw9lFvTIbJzIJ89IyVKQ==
X-Received: by 2002:a05:620a:4246:b0:7d3:dbed:869b with SMTP id af79cd13be357-7d3f994985fmr1943748385a.42.1750731241667;
        Mon, 23 Jun 2025 19:14:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41446e2sm1637764e87.32.2025.06.23.19.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:14:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 05:13:52 +0300
Subject: [PATCH v3 1/8] efi: efivars: don't crash in
 efivar_set_variable{,_locked} in r/o case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-more-qseecom-v3-1-95205cd88cc2@oss.qualcomm.com>
References: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
In-Reply-To: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoWgnlIwD1YOHrg11CPLxY9aW5PbRmv4EaxnsBp
 jEGag+qTSOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFoJ5QAKCRCLPIo+Aiko
 1a8uB/4pt+r79WsfEV7XaHTaHhmQdEWSg55qYh+hYrZtxbNHOACrQMrGLGjC0vOndbSWD5TXR5T
 dP+t2VrJNBLG6p6om4m8idOSq9Uv3Ga79iLTOaKPch4veQwUF4PnciRKG8f4ngPBdJjfD1PzNvg
 VO2EWAQjCbBXiH53lt5Os660fgYfzZa6zDZCXOMQrhIcJq9c9GQ/mHAaCGBleWRILQCWuGcth9B
 cgEC+cVA55MGnOMYZpbE2iOzaO0mNgw1c9lH+8Q6W/bfRPO5RO/+YxPXXoKVQWSCJ08RGIURNxx
 I7rwPZkkwKOL+6wgbNKyoAk+tMmx9v3OEPrkiiuNDvDxd3xW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: jgOZ2KB3wvNnoEQ1QXg7mHGezneH2Phy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAxNyBTYWx0ZWRfX9TcPBge59i0o
 CHjQgVxFOHuXXE1qI9qDFtBBzxNp0J+duKXVBhF0HiHgJt2Q9A0tvqtx7p3W2oUZlvd0envmZro
 UTyFn0ALi2XVWkJm6eMN4Hq10VMDywHNCQYxYFGP471Px817Q38pn8nz6QVytIYTHxRvyzB39lE
 97XEqonENrRaRJn2Di5mt1NobEWKBl/tsGaYrBC4nOCm08QQtcLYrcUhj+1RaaieTWf2qfJKG7q
 XEkhf8SNbb+MLMp0t+YEnL+2xjswPQgtZ6dfzqAo2pEoaaVKqC9gQ90TWDbSJ4fxU3/8T0yrV2B
 NW070WAeDDtiNn6PF0PCSgCwm4PlSrdpZuPuC4bmz6cbnmrBhZfdW6bamkS7fneCCfPJeAlydlR
 784X9GZW+a6nNroi6I4nzQXg+pz3KFxPtspzxRYVtLaNQwYJMbhgCreYavWqxMqoSZ9L2enn
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a09eb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=2-Wz6HayXEhRivmEhXsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-GUID: jgOZ2KB3wvNnoEQ1QXg7mHGezneH2Phy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240017

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


