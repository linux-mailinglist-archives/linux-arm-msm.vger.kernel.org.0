Return-Path: <linux-arm-msm+bounces-79798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8DFC234DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 06:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B2353BBFF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 05:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0900E2D8780;
	Fri, 31 Oct 2025 05:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhdjMjkR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NY3SG1K6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE0428C854
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761889875; cv=none; b=LRpwAAg475i9Lnk4S2jdZRS7+pQw8iEMzPszQ++BCi0AxoeBLMb+dnc7epM5883gABUnTJdYRlGi5toe5RwGzg0Z1UzjLlbr+hBlLekEsqyDPAdn/Mw4OsoCwD6g6hGioO1JKBXqd6/Coi+vaO/l5uF4DTOSSXzQBqAN8hGEKyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761889875; c=relaxed/simple;
	bh=KZQc1ncWK/NT2o7uMwShWY8VsLBHjt4vtFQesS4qSnc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cl4Ial9rJaSWA87TjNeiq8C329kAJK7/jX3Mw8jtYP8URqeOX6B1mutJvvn33CZTzuFxM7+kXqKYP3zjAQVc7KurnnnTOlJH2ima9bZGv6oFMjdjb/cxs7NhLxe0gM1MMQvVBB1bhhTPw47nWo/zNrrm3qhcd5T32zNIc4zfATc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhdjMjkR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NY3SG1K6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59ULCZet873191
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SBgEdDykoflUBh7hLEHm4Z
	XfYOUKbHHXMD2Uykw33H8=; b=YhdjMjkRJzdGmDoP4NnXi8Lar0Oiqy/6yhuzsw
	pwn6mD3d31NdYTjliTfZSzx5AXQ8EXIsf6IYs6EO7lQ0vhroJEZoLLo7v1ylNhyd
	+nTqsls65Wx52fKI7pfGD6eOMZ6CG9t2f/mFmng95Z+0XOKPDrvAb1CUIEqtjEPJ
	PZHFEt+1eqyMwSYwvrUaQ0YQOdzU++uDstQwrbyVyMeByrS9MW50EHYZlKMrcWuL
	/Ax3WAg4Qnv8RuubK2AhRqMJy9MJNRyAY44Nt40QKibtSr/f9Nh6ajEeLkm5LkGi
	roPkg3rgcdOZJ5hN7ffBjyCv6XX5h3pCWFZMMu/hBtCUL/zQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn11uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:51:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3403e994649so3976243a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 22:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761889870; x=1762494670; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBgEdDykoflUBh7hLEHm4ZXfYOUKbHHXMD2Uykw33H8=;
        b=NY3SG1K6G3pZ3JdlvqY7cOD3NsTlbHVOGHCSPte4/ID4A9zh1vtphzIxFj4ECIRBIR
         zEBR6yDQBVLpBoy1sAHSYQVm2iW+ZwNw1Zd0vXi0ZLYyE5wdm2lxNoIXG9Z2WpMj+fR1
         QjPma1MrGkXaXlg0H0llM4uUBAL67uxCeslE/zp2hK/ZVRuWBYbzVGKm2y4JQ8Xdrarl
         1DakrIFGC9ar16DGJ2G/7NSwYjG0bgzKhxjPkV+TCCZVngGTUu21bUGe/NuxgIGZ5lXX
         CkHfNMx01/Lr6N0P3wlxumQxZ0+BSroMgkJ/jl7LSS0nL41gyM37tqBL+aJtIrC9njKH
         +BoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761889870; x=1762494670;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBgEdDykoflUBh7hLEHm4ZXfYOUKbHHXMD2Uykw33H8=;
        b=ctAkr9ZaCisGY5PApfGioognWgMQwITQ2hNfaj9IsnrXcYWH5Z/tJNs7X8yX27K4Qm
         Vo0zrYejebEDfkXJcSEwBFu0GQEtvNXp+PrbIZf1pc2xZ3ZUWdWFShGAUhkgQWX832a6
         lXbOXsePF1cBvVnBlKnnLVfvgCKskFsDWwnFSbwqL+oJpFaySRSBSQ17m3My8JZ77tE0
         Hlf4HPVDov4+a5oU/K9eRFVwqTwKVNT292zaAwyQP2QLc8kzXWbXzalxvWKiypY61Iot
         87RH6L2+ltH0TMGM9HmlqVnBahjtP+2ssftfBpNd8uS4lSpxLXKkHvpafS+pEtuGpBi3
         1jSw==
X-Gm-Message-State: AOJu0YyBdv3nmmTpFqE61a2wh4WJ5ynYuJ567/zMhevZe4LxyOg7y2/U
	q82OJ0txyC6M20c1lFNBC7zIHXkrruQy8hD3Z5ThLLBaK5NXR2GKlGsWLFkmTIqGjWCSxo1NXEK
	IalkrRk8z0UvgqfZgnnQZNGZ7JfOvDyNMA64eiNSPYQpwYf1pHOjCGqsF2qoEc1tKuHD77lTOCT
	XL
X-Gm-Gg: ASbGncttPWVWGt+Px3NjpoEj7CEhONoBKLYr3lLNI/kCxdgtA7+bzDwyhkiwKMMgSUl
	CHj/LIInYsMZ6FNWOFvgZipt49TBh8EZKcObCFdi1/JJeYPXVcFBC1Cw2PVgJ01KAmDsphcwzbE
	KthTVKM60LBhZH6cnZ18S9mU/06ywEFaL4pMlQdm6PvXo79bscY12aHEsktGUEOFrwKdf6p8DkO
	Hg0A1q1FKEAPdxiL32DxpOSx6T7N95cpEmVFCoSdQwXfUhBhhAtE0fzGg87Q5ngAW2aizH+aRi+
	FqLNPkBp5sl7VbNSgNUjXIe7afd2ArXc0ZInLR2FrSZgLR/C6XTVAA4Ux7ckaZsrislnTIum9my
	4Slb1HdYVpNH13IvPQLzTMjCXltO6xa49/LPB02Tj5aGp8rdP5Df0mcQFeEFMFkdRNGEXfEcj0q
	YrNHMJFiGem1G1l9RK9MvwvAKsVru5TvT9vg==
X-Received: by 2002:a17:90b:3a90:b0:340:2942:dbfe with SMTP id 98e67ed59e1d1-34083055450mr3203830a91.17.1761889870395;
        Thu, 30 Oct 2025 22:51:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtCzzxMEQAufhaT6NfEAKkYvG41A872O3Im1gBGsYE5KIjt5uXIMsYI3vX6051fvdwKVfk6g==
X-Received: by 2002:a17:90b:3a90:b0:340:2942:dbfe with SMTP id 98e67ed59e1d1-34083055450mr3203803a91.17.1761889869855;
        Thu, 30 Oct 2025 22:51:09 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34050992f92sm4646049a91.6.2025.10.30.22.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 22:51:08 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add support to extract the image versions beyond
 the first 32 images
Date: Fri, 31 Oct 2025 11:21:00 +0530
Message-Id: <20251031-image-crm-part2-v2-0-c224c45c381a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEROBGkC/2WNwQqDMBBEf0X23EiyYio99T+KhxjXutAYTWxoE
 f+9qfTWy8AbmDcbRApMES7FBoESR/ZTBjwVYEcz3UlwnxlQYq0kNoKdyaUNTswmrCjUoLuOBjL
 YN5BXc6CBX4fx1mYeOa4+vI+DpL7tz1XJP1dSQgp91pWsja7R6quPsVye5mG9c2UOaPd9/wCc8
 F74tQAAAA==
X-Change-ID: 20251028-image-crm-part2-1f6bbefea2d8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        chris.lew@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761889866; l=1231;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=KZQc1ncWK/NT2o7uMwShWY8VsLBHjt4vtFQesS4qSnc=;
 b=kfubHuaW4YJh5zPt69T0oIBwZuixPdiHCZQQNtfaWC2EgNfLmdYEfKUBrHw5pyloGzbLBy/Yj
 gzw69puPKRdD9cYINCtkvqaaufNiOcbiHiRV9XPQmX2WTYXj0BIH9Yl
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=69044e4f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0RBcOS8U-E0fvNCSUu4A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: jfdeWmhJ1QVNukUuaEnkPuKg5OIu9GsX
X-Proofpoint-GUID: jfdeWmhJ1QVNukUuaEnkPuKg5OIu9GsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA1MSBTYWx0ZWRfX1r/IUdXUgROK
 Whmm6bbdHNiH9oxgK1zh1aY98At4rvHXoK/dVyXL9evxYl/jCTmhcTfOVTZ3PqxZKUKj51/j9Ne
 PGI6fJtIfWpRu3QjLA2MRKa1VqDQsoTXecDEQnY9UDx8MdGrdGvuuFqmF3po7PvT6OYscdqpDN/
 Foq9V4H3FR/HXcS6FM1bWy+DVx9T+sNjYvve3cl0v2MeaOVUkftjbis5O75ywyXZD3K3Vnn//gO
 lnJpcjlLfHhi4tQradYO29y0HBX747YgJVh8RfEW0fFWuClw752B/NDf8MmkKNGr3ypCvDlIqco
 MfCBRdVkAqjiD1DV6uba7tmcgS6Ah02K5y0IlGnMkjvZjmOAUf8/XTDQfjs7YwEcXyH5nbnX6Ur
 1BvPvNmVeNW+HG3szTD3xwwZdYMK/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310051

SMEM item 667 contains the image version details beyond the first 32 images.
Add support for the same. While at it, drop the WARN_ON() from
qcom_smem_get() and qcom_smem_alloc() as it doesn't add any values.

IPQ platforms doesn't have the SMEM item 667. So I couldn't validate the
image version details from SMEM item 667.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Dropped the qcom_smem_validate_item() and removed the WARN_ON()
- Check for the return value and exit when fetching the SMEM item 667
- Link to v1: https://lore.kernel.org/r/20251030-image-crm-part2-v1-0-676305a652c6@oss.qualcomm.com

---
Kathiravan Thirumoorthy (2):
      soc: qcom: smem: drop the WARN_ON() on SMEM item validation
      soc: qcom: socinfo: add support to extract more than 32 image versions

 drivers/soc/qcom/smem.c    |  4 ++--
 drivers/soc/qcom/socinfo.c | 45 +++++++++++++++++++++++++++++++++++++--------
 2 files changed, 39 insertions(+), 10 deletions(-)
---
base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
change-id: 20251028-image-crm-part2-1f6bbefea2d8

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


