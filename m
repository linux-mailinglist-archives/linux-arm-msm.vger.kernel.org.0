Return-Path: <linux-arm-msm+bounces-89803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4ED3C66D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9542340A881
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC8F395D89;
	Tue, 20 Jan 2026 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YlqFN7DL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vzi7s+D+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD74F40B6C7
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905231; cv=none; b=gDes0XRzRaIHJMJnO0pgJFIUXah1WTM2yz5rvmQEPpR3QfbA/SyZvui9bKZw4dWen/hoMoRxoatDmRN2OpyBw/jboJgIo7nK6QId5uNS0OP8pVVwaNbA1SsST+gpm3ufAmGPfW6Jb16JuF1un7p90RQ5Avgm/tn7I4tw7smb3EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905231; c=relaxed/simple;
	bh=Xkww8B1bvxwpIcKpy1JewYNymNIwaL0b3k48QMs66Fw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NRoMwY2CI46eMM8vosRhel+pnZF3B/IfLNY6Vk0bEo+GTn5B57PFa7AiELCjd07MKH3ZRG11sTyVe6/YZFcUQt7Est4d+KGMlQUPCi+2GdpyNofFvpxHbzasdGwjeW41yG7hcLtI13vyIbPS72w7Q9cM/ILc7xGpckvxtiMNqjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YlqFN7DL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vzi7s+D+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K9CpYM3176513
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zbZ9dEOX181
	iqiCrxrmv1ex1DUncYQRrvsx5WfV8NQM=; b=YlqFN7DLCKoPxjFLqqKPRadGK0W
	Jt+Kk7ABNzVRX65jaPOVXpHw0xYHd4Z7xcg/xuK1NVNQ5nQl3mpE9EmnJswBs8FZ
	f779YOe8VZw6nNS4j5ED2MdVoQvaE5xqukh6vKePdGafvVIP5gLmq1oOn6Ix3oBS
	BJp92siB2+5f5PKobyBTcGpSIA4aH3v17HzKCRqLhLqMsqsAtBYvx0i1HTpzUluI
	lL0I8txrU1GaRGaoWD4a+7kYMt0bELTBXT4kPWNv/B0yBWwoC5XdHELCMDDMW0IG
	nzJHjsfl49x6GZ2hOu2fg1qrvV5H5MYQAUKvpl8CgOnR/c6ksYFqmY5hhIA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt0p2hd6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:33:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so3144352a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 02:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768905228; x=1769510028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbZ9dEOX181iqiCrxrmv1ex1DUncYQRrvsx5WfV8NQM=;
        b=Vzi7s+D+EtIUxloh7+7qQBcYtCu4LjO/fAfELwGqoUvXdrV55Btx+UNflGgFBHRpLJ
         zoaJK5OBElcLgMYX4LNp3ufI7xP6KMfx3D5ATI74Q1XtcRRy/2zpvkgc1k2fXfXWWjOk
         cH7XL+vbSabcGYO/ais/A63BpqdTn1GAAYNhic2hWr8dFEulT9RWzYBQoRNA1S4GwfjA
         hILpBa8Nbw0KyUITdGIiPrBg7sjr83LWWZcxJOg+itCoWw62KT7Ds3mTXQJX2Ii/Knw7
         3CKKcP8wmYv4VVpL5PZm8dhOZDT9WaeKQoKRdg0jdcLAApNt6eZD4D7g4zR8X02JZO1Q
         BKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905228; x=1769510028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zbZ9dEOX181iqiCrxrmv1ex1DUncYQRrvsx5WfV8NQM=;
        b=Ltqkee9G6H0EN446qmDvdmeeoX5xG5AXR6NAYgwROyTB8PoR2luScLDUrFzXC15l9O
         iUBkM0d0EqnVHtKgzJyVTuh8gDTDm75HJ3pXjgvv2Vu6TtOrKHLWF1Z9Pl1kc2ix4WPl
         PZc6/yEnzLCaimrjVpj06TzUhrxxLjsVIWeOhYdCJ9VY4jGk0idedUFGODRNeVlxIP+q
         8nNYwYBBOayRgKOGdRbqFX5Pa8ZDvSe5QekFoyKnCkxNqLHz6Yp5XOKP2gpR+xYWhvLp
         0yYz4cAEAfCfrbKTLXxXl20hQSwYc6mc2ma2YlEyegB0Zh6guuJacYNRYY7sBoTSGoTh
         Mb3w==
X-Forwarded-Encrypted: i=1; AJvYcCVpwU24XYShtJBIKmerytK5l5IuT37x1w+5GuqZbyhxEFkro/SMc/SRVC4OozgROz4CdFFSiMfNe0CeD7za@vger.kernel.org
X-Gm-Message-State: AOJu0YyHZjryZYbkGWJcctEwCSZKUc2i3aq1QxQOWDNw9GvqUOv5O+z9
	iNF4MxCQD6JbxW5MQeg7DKDSHo/QsWIvtJye36a7/lbcLl3CR6pS7+rcTqL++9FohSA//AAAQTd
	qYRpsiHtaouoy8h8PxpihJAE3KvE3BqnvlbuMk/j7XlJYCwcDPN8gLuJHJYMVr3Un4wvR
X-Gm-Gg: AY/fxX5TS5TM2nGBnrMJEBX07dlC2H/qt05SxxDn32H95biysauYg3SHjidXfc+z92S
	VIeW9BS39WbLCPlhfqjBSDUxOrzS/ZC3r/JW/H4L17dU8WcX/DCAuG0uFagP9uiqvrWRCGtrHtM
	K/8p6ZlQahjmaKtRBovpzwe5m/EWF9HKE9Q2lFhQJhesnupOaQOmV4OsVwbZf1VZVQQC2cE2CPk
	t9aFBpOmpuhjwnXD13NRt/bW3gEEUrHdoyWwGvxG1ZnE/avEHE9ho284BZxL2hTi2/7FjltXzTz
	4HUAcnLi56/Fb2h6z+hoPgbfF2a4qSo3pokcfaoZob0xKrqLgF1n5RdqXMCwIHrdFLdEUt9SngO
	DuCPIK9C2t/h60kkQTHEkhuAI+7wpUvPwV9BO2gyPni8=
X-Received: by 2002:a05:6a20:3d83:b0:341:6c8a:5218 with SMTP id adf61e73a8af0-38e00d47cd2mr12826865637.56.1768905228120;
        Tue, 20 Jan 2026 02:33:48 -0800 (PST)
X-Received: by 2002:a05:6a20:3d83:b0:341:6c8a:5218 with SMTP id adf61e73a8af0-38e00d47cd2mr12826842637.56.1768905227527;
        Tue, 20 Jan 2026 02:33:47 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf3791e5sm10050709a12.31.2026.01.20.02.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 02:33:47 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 3/4] arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary port controller
Date: Tue, 20 Jan 2026 16:03:11 +0530
Message-Id: <20260120103312.2174727-4-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
References: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: acVzusfjUHa6_cNJDu46g4dH7MtMyoQj
X-Authority-Analysis: v=2.4 cv=drTWylg4 c=1 sm=1 tr=0 ts=696f5a0c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=917_i3xC6rPZgS4eXuUA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: acVzusfjUHa6_cNJDu46g4dH7MtMyoQj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NiBTYWx0ZWRfX31hg/qywWWxS
 nZ7/EPt+D5hWdkEGwYrUC+mMTDlBS3fMPAPM1DQCc5LlrjOLymxMDb1gZ9v9nCYSI1ObmA8bhs/
 pTSik4mmZKJFJskbNscuErHZo6KkppFoDbvaapSnFsZ4vpBESiOf4uvBNVi50+e+D6Se8/iInRj
 d6HrZRvE+SIdmxPfOWJbIvMrUayu7YNq0fgZH4pAudQyvxTW5qEU4ZtoJagi5U3dK3n2d47IkAK
 4tdaRF5E2gs/QtvH18IQ/RhVo4fuowccIbKu5eNc0NRiuAYn6MVj03sAxaVJQ+7wEKV6TtuZ0kc
 f5uQCLyqYsTq7kem1CauSGG/hR106VC1Cn9FjCm/taqZ0oW25CgBgAF+1B9gTr4xBEGi/9DGHa7
 oDoqyYpBKX170Kd/Jl2b/murUXJVadhlhvBeQlKV/oqphcHPsE2i3cbt1XZs56gkz28/ExN7Lss
 sxRzy8rmOh6HjfVelSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200086

Rename the hd3ss3220_ instance to improve clarity and simplify usage when
adding a secondary port controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 90fce947ca7e..074a1edd0334 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -62,7 +62,7 @@ port@1 {
 				reg = <1>;
 
 				usb0_con_ss_ep: endpoint {
-					remote-endpoint = <&hd3ss3220_in_ep>;
+					remote-endpoint = <&hd3ss3220_0_in_ep>;
 				};
 			};
 		};
@@ -522,7 +522,7 @@ ports {
 			port@0 {
 				reg = <0>;
 
-				hd3ss3220_in_ep: endpoint {
+				hd3ss3220_0_in_ep: endpoint {
 					remote-endpoint = <&usb0_con_ss_ep>;
 				};
 			};
@@ -530,7 +530,7 @@ hd3ss3220_in_ep: endpoint {
 			port@1 {
 				reg = <1>;
 
-				hd3ss3220_out_ep: endpoint {
+				hd3ss3220_0_out_ep: endpoint {
 					remote-endpoint = <&usb_0_dwc3_ss>;
 				};
 			};
@@ -904,7 +904,7 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_dwc3_ss {
-	remote-endpoint = <&hd3ss3220_out_ep>;
+	remote-endpoint = <&hd3ss3220_0_out_ep>;
 };
 
 &usb_0_hsphy {
-- 
2.34.1


