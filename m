Return-Path: <linux-arm-msm+bounces-67407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D16AB185DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 18:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15422543BDF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 16:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBE319CC11;
	Fri,  1 Aug 2025 16:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMURKO6B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0041A23A6
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754066180; cv=none; b=I0OxintgYUcRhsL/KEuCiJIc1V485wReqwivPcHRR5C2AICUp95zH5PALNKDa31tgZLd5BBV0vMuVRv5dLH9TNTLmY2DIfYua63JVn5kGfhvxFX88UHiZGpyy09YepwpFmETniddOqVtt5Y/KysZaS1gKN3wqw3Hm8KXIndRPKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754066180; c=relaxed/simple;
	bh=USVIRTYvItXP8BGf+5XlbaJOiJKBYU+1rya6gVHqn8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VDU9W78h3pS5+IebQS0L40W90tVHr/KJtj4SYQuUMlkfKwxXDf2OqbB0jnSlMJGnb+NG6XT2QeDxlPOOsnStdLdr7YXg77lAm96yGqPzLVey3v9cQWUe1xAY0pKpEsKTJ6vxos0QamQ3csop7FQgEy27n4nTWqZGsw8NjUNN0kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMURKO6B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571FNlvO010951
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 16:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i93bfBUxotY
	KxTjsE6wzFA2Q/b0JiDSP7PrC2Xp3hqc=; b=gMURKO6BOkDUpx5AG86lNVc550f
	93+3neyFsNZzdo8c5nnixXNezJG9oyN4wbQkU5Ksu2NaPRoi4TKqfhtJp9pkp2tm
	jkKVk59SgDMUHki6V6SD89Fa+aJFHdJrQ+BH0v0QvJutYWpcAPP2uZl5hBjzmUgy
	EIAlX9qygfcAbb2sBA6u3KvMpSrxYCR1umva86r8FHiOoQGcz6pQua1AbARrHk8G
	+lFuxbYgJJfbKHgME7XtOw0R0VIsA038qmMMS4RiY+S0b46pWWXt+6AlIOiO7D8X
	ZnxNRihBxH8tiV14p0Blra/IQGZI4HhUXeZY7z980QHvJy+qlF0FF+JvGYA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qdacceb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 16:36:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3f357b7594so278377a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 09:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754066175; x=1754670975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i93bfBUxotYKxTjsE6wzFA2Q/b0JiDSP7PrC2Xp3hqc=;
        b=EWXgrNge3kVBYCnqlxom0DlOz6J2zGoa5RVnrsok6/7fLsJH3g0Wb+Ju3MsTMBjnmn
         XJkIEhqzLMAWYL+qxqyXNgLzlQLhsGIOfxSlZX2cw/EH8e1ntSZK3wv+VKEeoGz8zVd/
         rHG4hyQaLBIAEZY0K+KUll63YseRYST4ZI1oWfo2/Uo6g0tdOZdA06X8JjSCYsUUMkUZ
         11ZTGsBgorTEgDHA6W8g36FmZiRiVm271hjzVgJFnl9SKxNv4K6PaI8biDy4Gwe9VTNk
         1yErYVrCjfqd2J9lEca07tyNEc5b/XhiCGx+c5gIxBzr16yoP5EhfS/0pfo3RGHJQ3NP
         /w8Q==
X-Gm-Message-State: AOJu0YywiIBO5e9qyeSd8LTPdnDU0VRHAYVwyQoK1dmOGd+BY/jrSFnV
	lJv3GLPIHOppO3RsmFl0H3BzcK1IJ5nfP+SFyov5VLRpFGF8/Ac4Yqn5qD46qpItLzMMlhGsNUi
	qFENY2ZjwKtZJBEC1ievalKwOh1j8y4PbpTuM8C9+l3HAvfhAwfIRLIF99lw3ZAV9uQ8Y
X-Gm-Gg: ASbGncshGzpTkg4kyLm00xhNpcvENdic6rynzgUVSEtT8G1rcwa0Xg6CIdFxUppjndc
	SwmiiuR3EJmprQDCFGerdcCFRwBypoJk7ynnZJ6NUMydE14dRhR3I1/+dhYZArQXTs8++2/LSub
	Ij8ducUchZ4lJ+peoTdPPc9mQjHXmkGE8/HPKU8zcKrwY7hzbMFUW5O8kqrgt7vcu5d+MdFp40W
	OWrHkePKIwE/dSrSBxdVHHKlZXZU6Cn6sh4k/49KBcYPRH1bztnGECDeonB1kz47oB/b5JDHTl0
	n3tduX6nvUEll8cJWpZr7evT4vw5uB2sL1gr5z5JG8H7VjAem4rcPz29eRN/U3DRprIvzLg=
X-Received: by 2002:a05:6a00:2d1f:b0:76b:cb1e:ac3f with SMTP id d2e1a72fcca58-76bec4cc7cemr4476b3a.7.1754066175521;
        Fri, 01 Aug 2025 09:36:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTMLKM2eZ4vKvP/DSM7I+lMHWQJybrsCRF+VUbih9RkpYt4jteso/4tQ42Ujq1Z60KobCoOQ==
X-Received: by 2002:a05:6a00:2d1f:b0:76b:cb1e:ac3f with SMTP id d2e1a72fcca58-76bec4cc7cemr4444b3a.7.1754066175138;
        Fri, 01 Aug 2025 09:36:15 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe74bfsm4508775b3a.121.2025.08.01.09.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 09:36:14 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com
Subject: [PATCH V2 1/2] dt-bindings: arm: qcom: Add bindings for Monaco EVK
Date: Fri,  1 Aug 2025 22:06:06 +0530
Message-Id: <20250801163607.1464037-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250801163607.1464037-1-umang.chheda@oss.qualcomm.com>
References: <20250801163607.1464037-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eYobONodOewc3Y44T9T3GcDRiq_EH1g_
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688ced00 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Zd15BVePnIxtF9Lu70oA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: eYobONodOewc3Y44T9T3GcDRiq_EH1g_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEyNyBTYWx0ZWRfXx2nD/Sv0U+c1
 J76XmVpltO5tJPanufcQ2sWnlMaW0hLPKQ3Zyi3/oB9/ZqmN0EQbSDv869upbcI8W/Qh+Z+M6At
 d4NnvHYNGN+1HT7JdNcnqe7RO4RWvZAHlEp+gPdPJgALv3xsmM0uFmhmYu33XPOoO+G5o1TA1X9
 jyYOxXfvIt7CHS9ZiSDd+PWca3IqwcPahz3Luhn1H+x7NQJyLCbCQ6wOLk+wKfV37l4wX/GgCr2
 3e9Rw6vu2o5arlLH2LPLov4wOfap6yZ8KtL9oglzbn7/7bkhsJtINb2z0sWrr6IZQuF4+qw2Bvk
 OIzt8zLRQFx0froWCIciH04Ckh1bB/ZETtqBVuXCNrgX2Pe3aGh7JK9nIk10TRC3yExNXHUTQh7
 nhaQi35fVlH/MzTTjd7XQs8MrxNvPlq6+3wxboMqwIg20A6asJy4ceweVpaNy1wu4asCH7xw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_05,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010127

From: Umang Chheda <uchheda.chheda@oss.qualcomm.com>

Introduce new bindings for the Monaco Evaluation Kit (EVK),
an IoT board based on the QCS8300 SoC.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 47a7b1cb3cac..31e260590f52 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -950,6 +950,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,monaco-evk
               - qcom,qcs8300-ride
           - const: qcom,qcs8300
 
-- 
2.25.1


