Return-Path: <linux-arm-msm+bounces-67197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEFDB167CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 22:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2C1C5826DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 20:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AEC21C165;
	Wed, 30 Jul 2025 20:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bl0o1Ypr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B10B22157E
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 20:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753908717; cv=none; b=Hr00qyOCr8QiZrIrSjeqx/Ql0/we4TkHIhbyAnSyxbJsBqQAZ+3x65euzo7Pfh9Tg+q5733Q6kDRC5bwcVzu6Oy1uxk+1V6LZ78f4w3s0iD7wygpWwS0DwkMOo6uOyTgzUG2R2a95VfcN+ZzVkfy+MfJP4W340PDlpZYUgld+yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753908717; c=relaxed/simple;
	bh=lNW2uz3OWthtQqMUaYd+aYMgM5tMDbL1PLPb4h1Ugro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N4dtYCAeSAHDXDp6DT3jVRtuvleUbbVE3wzxncWStU5Qlf9lFd161gcvm7zfQkYhSJxSIQulUZcT1LTKphpufAfnZxcYchmt/vfqCqZS0iPFMPhsgfemOaGLh7Jbtn4GIP1Tlz3DYyLKOYjL8v7JJLw6UhtvCsQIVRwj/TJg634=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bl0o1Ypr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbVlw017964
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 20:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QrHRGi8xXiiyZOKrfIeG35
	E4fgjNjTAGkCQncHCaq7o=; b=bl0o1Ypr0qRKAdQMV6ASbEURJARxyku4nEFiKQ
	V3qSE8/wjaxLvIzmMkUTQyeFRDkOmOaxs/cSeX+SP0vIOKznS42UWV9OH5dZRsQy
	1aCxoAUvFBc+hqSeoGbI0b05FipEFwUEzX8nfkneAtUNzdeMjhM6j1k54EFaBWG+
	1McLPBQ768xi2/u4NYADsur5efLvSFLocdYx5v2E4Hv8jfLEKpGVzjbkau0TbIM8
	jpUv3q5lRVvS7rGDl7z/qjTzi3vsx0JpQbXsMFvMkJeSvuzmwq74EwKmwcv6vE15
	Mvm/wj1JDGDJwdnwjTw9YMhOkaWaHVPgxgMn9wVzKBCCyh2A==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda578n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 20:51:54 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6193c29642eso184162eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753908713; x=1754513513;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrHRGi8xXiiyZOKrfIeG35E4fgjNjTAGkCQncHCaq7o=;
        b=hMcgVjdTxsfNRnCOtuoX6I1rIXMDVPdbARk+Q9SEBGZghKdYMhcLTdWSdALjbqY4pg
         60FZX/8wUfOB9XysUeuWzVimbcjWslKGi6dodlWq8dxsanJOej07MR/GYBB+fXSG1OVn
         mDT1i4i0ObcyV3abr45hY1VqV5XKkGw2mkKFekbgbu9eVbmz/AC2Fii8It3ptx6boCMu
         uKBKKxd5Sk+ZJCiVwldPpfDlvYY5SSQIlImU/O6zu5Z9bMy516/gZG2gekkiCIUpSVSr
         bZzSozxcWhxZc1/ACxgQp0pGkETRQgdxTldIfyFvXWJPDOE0hrnA8K0tqX11Lr3qMw0I
         NmdA==
X-Gm-Message-State: AOJu0YypLoEai203JlgMN2svoQen5ln3IR+KH28LIscDuBlZuccsoqKk
	lAdqjVFsSQ43Z3nBWNFuQ68egunCsdFfL7abSfZS4DGHBXwtXuuZSeSXE7S9+CxxqJqqRzWryU5
	AU6owpzCQ1WbdH9fkNw8/umq9zjvpQOKMSdg00AI75oTe1TmROMSIJSqi6WWd11cFXVtR
X-Gm-Gg: ASbGncvXPJn2ZouhXdhri+hTtuLfN1KKrVNadNn1n8h+dUwAqH0/3TXQNepzDDMRIcO
	h37c4RG1NjuOjavUJOUPjr8nm2oxq0h0B1fAJyXq2OtxEkDc5PyigMSqRWVQzAjNKPsnj+uoDNA
	r4YNgw1bDeZXf7szrpmcMXXzMP+JuSoHkggf1DHlFDVNvGvHn8/rrp5KytlFMORKxRHk+yDfhgY
	gVHxOMruGrtN/+CGw2SqV9yLPmT5YvX2v6dkSCEdPwyrxi0gh0siyVcI8ywm/7Pb7BjEbv/qisO
	bbIBm8AJAtuK3Xy7iktXV5MRgvUwrK7Gizr/DzJnwWOEzGYtn+WQ2g8wEGg/QVTEWvvDCfX08G1
	VVtpgaR4TsDP9ErxTmVGOjbhtArAMKleSMG0gaTU=
X-Received: by 2002:a05:6820:4985:b0:619:6d7e:3a4f with SMTP id 006d021491bc7-6196d7e5284mr394792eaf.4.1753908713401;
        Wed, 30 Jul 2025 13:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGciEHBCwSKdv9x3MWOT0GEpH+ewHi6JRMHOtpJzTpYZEHx6LjiUa3ywjEisEbjiVjGCn6xQw==
X-Received: by 2002:a05:6820:4985:b0:619:6d7e:3a4f with SMTP id 006d021491bc7-6196d7e5284mr394782eaf.4.1753908712974;
        Wed, 30 Jul 2025 13:51:52 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61913f4decbsm1968005eaf.1.2025.07.30.13.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 13:51:52 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 15:51:51 -0500
Subject: [PATCH] soc: qcom: mdt_loader: Deal with zero e_shentsize
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-mdt-loader-shentsize-zero-v1-1-04f43186229c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOaFimgC/x3MQQ6CMBBG4auQWTtJoYDgVYwLoD8wibZmhhgD4
 e42Lr/FewcZVGB0Kw5SfMQkxYzyUtC0DnEBS8imylWNu3rHr7DxMw0ByrYibiY7eIcm7qa+bxs
 /tr72lPu3Ypbv/31/nOcP4+X062sAAAA=
X-Change-ID: 20250730-mdt-loader-shentsize-zero-8c99653b6343
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=lNW2uz3OWthtQqMUaYd+aYMgM5tMDbL1PLPb4h1Ugro=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoioXoR4eyRpUnmUvvN51jRKPxB4cuEYMPeLKpP
 Q9+jPQypkqJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaIqF6BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWtpxAAw5/hHe4je/XaNCl6JU4LZWRPgoZFetCs38GFm5F
 kzhpTKr8LvKf9pzohgPgWWU+h8rap2JAjTo3/IbLV/5SYl5wb4ferXLOJXbAa6pmZIq+DXyT3Dm
 KuPZDvt0rmXPl7zqNM+qkdnri0k9XtdE0QF9naegeUXwvdsXWlg3FjL9H3Ljzindfh2WIb5yQMR
 XDoxiFBPgsfzbpS2awTgpW7oVRHOyZdTy1TkOSZ4jQMp9BjN/RpSrrVIhFIGOqftsZVQcMkoocI
 To0PI/oXtVifl0zpk1xI1cx+waNJGcEgPg0U7CwDlxaE8zQvjrffkKoRYunuIpmBWA/u/A50Fk8
 f7bpDncpvhvVVZ3oR8dohH9KAJ7rzzTivgfFbluWEtr+6oJZUdVjDnVNYr16yb+XwP4qJWjkvzE
 xi2d50bwuFYZeQlS0zp2MrLysTkSJagE8qK7JuZfU+F72KvBd8ZHRV9IkIXhVgKBBufsEZnSP3o
 gm3xwEpceybT0ha+wbr+6VPhD4/nbWz/orelNzdDGh+OOwtZoHIA1cxp4db7whgBDEW45vJ6YKS
 B75llnwHp+mIFoEMrz+7GUlyB2zYIREKbHDV/pKs2JsNaB1JJVcm2cNoZmO4q68pL68N89y+k6Z
 FNaxVZvsMtW9/hfb63oPjY3lIopPYCFFNzxCgNWYVigg=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: RcsgbmFeXyTSOefn-a-VNiILXrdD6ExE
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688a85ea cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=3EGZSaILo8U2r7-FxO8A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RcsgbmFeXyTSOefn-a-VNiILXrdD6ExE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDE1MiBTYWx0ZWRfX7Y6QAYYpyyvg
 mI0Kl0kNnpzNe/3OF0otQ/3vFEMF/DqaYsJjS+YsnGYpak066+CFruB56Nr0Nk+jDZuak7u8Ki0
 +ZVfU9npyXXyNEVZvIyu43cxXQxLviZThltRd8LZ+FRCMjfQ4UWfRyK7wwEEhXqhlIfjN4CjxGp
 BFzF5Jy9a9VVI7RRQSNCgfOtrBWPTqibHn9ZJH0Lim1fch9PvVK9mkF/Al52uVt9207K6H7TLAu
 BE9bbbdvQ9/zGafEzeJKge5p5lAYwUjDKBqzT3DoimNlMBuWHHekpyUH95tCoDZaLBPKS1M4VIo
 lj0ydXc2lghlNpJBjQioGJH3DZXclivKxO8iMaMaFo3l/XDnUWzgEe3DBs+dsKcj2LAWsoQFAWJ
 VizcPnp4Hb1YHjW/IFHYEVWZifkGgxDpEMMrzLx2Fz4aFk4YmCkKJTFxDWoWTRuJ7Pgs4UPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_06,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300152

Firmware that doesn't provide section headers leave both e_shentsize and
e_shnum 0, which obvious isn't compatible with the newly introduced
stricter checks.

Make the section-related checks conditional on either of these values
being non-zero.

Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
Reported-by: Val Packett <val@packett.cool>
Closes: https://lore.kernel.org/all/ece307c3-7d65-440f-babd-88cf9705b908@packett.cool/
Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Closes: https://lore.kernel.org/all/aec9cd03-6fc2-4dc8-b937-8b7cf7bf4128@linaro.org/
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0ca268bdf1f8c579b36a04fd94417be172fc1099..5710ac0c07a8c8a56110e3fc5e30b8610e106449 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -39,12 +39,14 @@ static bool mdt_header_valid(const struct firmware *fw)
 	if (phend > fw->size)
 		return false;
 
-	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
-		return false;
+	if (ehdr->e_shentsize || ehdr->e_shnum) {
+		if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
+			return false;
 
-	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
-	if (shend > fw->size)
-		return false;
+		shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
+		if (shend > fw->size)
+			return false;
+	}
 
 	return true;
 }

---
base-commit: 79fb37f39b77bbf9a56304e9af843cd93a7a1916
change-id: 20250730-mdt-loader-shentsize-zero-8c99653b6343

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


