Return-Path: <linux-arm-msm+bounces-77631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FF3BE51CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 20:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD8491AA0329
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 18:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9241B222582;
	Thu, 16 Oct 2025 18:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQG5y/db"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DF31519A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 18:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760640810; cv=none; b=FBHTf9rQ0EBDLlx/q0LS+ZLvg77EXTfI5CO8+Y8DurgomAkpH6OF1kgfh9fybNXHWvBYpE1lyH14jw8V9sa/Lb9sYzYj+3Noha3FlH0lLq5+j2Smku9dTCvmIlQfujsqEJQMsgIPGhnSWnx3EYawXNtKchnoe+imK0RJORZhGds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760640810; c=relaxed/simple;
	bh=vJdrxH1k/5YPLXLEsFF6fCEqg23MPLjbDBgaeSQtCi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nwjJTKF6sQGtYZJBeMj0lzYG33T2cat9Sgk6+P5kupEefI04HomMqU1RtxF2cblIAkTPX7XYqlRpHsbYNrx3Roo/r7zbqLF2hkum+TM1gnor1c++E7lSfjHOU/hO4zQxEPP8n8hNNgestFz26JIkNCS+txU9D2O7uwcbBA59fic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQG5y/db; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GEQuBK024854
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 18:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eFHiPMUq4Md01wD5fLIaoT
	nzLwYa7cZa7iBHCmHZPxk=; b=WQG5y/dbHZrZhhomPGevKA6ey8HuAOK7ka3L8k
	AK5TnbBydvUMEhxn3JU4wGIUdqPAanNsRqEqgD+jBa+pNjB8gTB1GGKNS2LJqStm
	cEq64VFtRvmrTAnSC+BwYLytfnjLFWdpY2+SCU+1owd2bF3ct4XKtd4Yy/3IAQdj
	/rSsy3aXga3WiXxfpFnCemRleMG461ZX4GZHySLS/kdXEvMyP53GUBcMSY1a1sBg
	HKLvwYB53/nTHHPVCNUSSEbjELIeRVWWVG5BTQaLVmZj1z+Fl/jh/DT4UT15vjUJ
	Zw76xBrJsNq9zoz25XFOu89sxJNOUBQqnbcxhLpSCxQ7TkRQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff11cfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 18:53:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f64c5cf62so927654b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 11:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760640807; x=1761245607;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFHiPMUq4Md01wD5fLIaoTnzLwYa7cZa7iBHCmHZPxk=;
        b=XSwud2j6ATEsXGafSCEJPxwoS87MCGgYWcYKHi3kdiTyb2FICREnIPKgc5eWYDnglZ
         UjJuoWH4qYtQt0f+Piuo4lOCQHS0rmTuMEt3OjN4P7AG/cmKA5JTd7Fvc+k2Pu/742ZI
         A3owmaKLDcyFLfOW5yEeyJQobyMamHAMNbLJ5XX7FIM3t3aLWLQIxyQCArUuAVEtF8fp
         KJPWutDszO04Rzsa2EomVZ+1LT7F6pOhYpKrM2UYSpCLM7RhU1Re6VEQp1M3yFmRDLDD
         oTFN5yR06YEOY300jlTn6xqV2WLSzqbqKMy8m26g9Uc7u6cPOeC4XKLQReUq1S4ZD3tm
         aqnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrQ9m/ozIxkLavFTilpxQqzyzS2tB0K6jZsWKCD9LsR09KUfQUGj4hBRdf3p6RPzD2aztqh5ybnuzZUYWz@vger.kernel.org
X-Gm-Message-State: AOJu0YxUYww/XcuJhxEJXEuslE9RBjNEv9d1PoXBLJ2UUeIrtxHjAOhO
	2wqr1uP7zigRp1kY5U7vhN/qt9YOdGkjqXkGv5NrFF+Ei7/T+y5ZmBnVEn2dS25HC5VuCxWKMmy
	+bbS9I+4NMFuxKRIGl8Oa10AbJRxTIf1LEF5W0LQjMnhSIzzRf7QYIqX9hpomgKfvc4ta
X-Gm-Gg: ASbGncsNjgBT+8UCI5twA5W3nqgSRWQ1hD3hnbX06UwJ/svZ96iLjydYKtID48sRD+Y
	ppXtBrw8aiRJwZx56QXqxX+TLi1nZ9ujcBcoEfSW+TH27Dl0nZjc0F+83tTB9kiRPAdUcLtJm6S
	IdndMMo3JL2z3IOnnULjjtBLZDOdBj/q+u13HIm1dV2NNMqRs6FL10Tx3xzloMO2yTFP0vvYa+x
	pZSa/BbNtgJjPF0q1Q0U387np6kBeYi5l6tSlHT5nvm3imM0mVTgt+KfP4iQnS1G+gvoVKARClY
	7saxzaTyWN9zCETJYBOiJ8EscDiRflkCn2gzU689+txAewu9TPOA/b9kEyfdLNEV6+XXrH+lFG+
	288+7ZY6RUxF6a1bD0+56MHg=
X-Received: by 2002:a05:6a00:13a0:b0:792:574d:b20 with SMTP id d2e1a72fcca58-7a220aff329mr1132982b3a.25.1760640807533;
        Thu, 16 Oct 2025 11:53:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI9YEwO2q4DvEuCB2iTjQevF/8YkUPQABypLhGfV7GQxCNyKDaED8fqQ3J6JkK10r2HG3qzg==
X-Received: by 2002:a05:6a00:13a0:b0:792:574d:b20 with SMTP id d2e1a72fcca58-7a220aff329mr1132947b3a.25.1760640807047;
        Thu, 16 Oct 2025 11:53:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm22897713b3a.59.2025.10.16.11.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 11:53:26 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 00:23:15 +0530
Subject: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to y
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABo/8WgC/x3NQQrDIBBA0auEWVfQgDX0KqWIGUc7i2hw0hIIu
 Xsky7f5/wChxiTwGg5o9GfhWjrMYwD8hpJJceyGUY/WaPNUvzWGjXykhLUkzn5DaYhelslZrSy
 Si8a62YUAPbI2Srzfg/fnPC86eVtXcAAAAA==
X-Change-ID: 20251016-update_defconfig_tcsrcc_sm8750-5ce7d157b7aa
To: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7SfRcQ1ogcTO
 M0fk6bB5aorI+YCPxIjHykqbBfvp/6Gx+eZrcSO8POVql9gjWRuwYxdsUo+d6IgoZXqyUhZrlE+
 4LtEhRAfUv7z0rGw2bpm9nzg+W453GewplDnO6CaJp6KODp/ZvutioezbSMW+weAzar678+9vf9
 ge1Aklniivzionhf+lmJEgLP+JZB5Rq4Wyq/HeqiCT55RVmjxY5j9nj6OrwYtszlyuzM+I/je8p
 PUlnVpu50JDSnRttOyIahG4EvQu2eorKYfpiAYknPw27+qzAWEyv4cxn9uFnWPcGGlYSXogsTti
 zPMKQkJpbay+EB2Dnnw62FtGRgggfC5X9N+xPHbng==
X-Proofpoint-GUID: IKSAKkLCbyi7JqDDTyYxPBu2KBWL8W_p
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f13f28 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fjpNi09VKJx1qQd3FNAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: IKSAKkLCbyi7JqDDTyYxPBu2KBWL8W_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

The TCSR clock controller is required  during boot to provide the ref
clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
the UFS driver successfully probe and initialize the device.

Without this change, the UFS subsystem fails to mount as a usable file
system during boot.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..85e3afc07598a99cfdf804ce1f320ed76717fcc3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1449,7 +1449,7 @@ CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
-CONFIG_SM_TCSRCC_8750=m
+CONFIG_SM_TCSRCC_8750=y
 CONFIG_SA_VIDEOCC_8775P=m
 CONFIG_SM_VIDEOCC_8250=y
 CONFIG_SM_VIDEOCC_8550=m

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251016-update_defconfig_tcsrcc_sm8750-5ce7d157b7aa

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


