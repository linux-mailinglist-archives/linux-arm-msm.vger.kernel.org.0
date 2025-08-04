Return-Path: <linux-arm-msm+bounces-67619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16276B199EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 03:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DBF13B5324
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 01:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E2D202C48;
	Mon,  4 Aug 2025 01:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVLKa/+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCF41FFC48
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 01:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754271472; cv=none; b=ZeFoc9cXnIWH6V1WQ3JCaMU3OxNmFWorGOUpVwI3qBZKU7TjLAbpPjTVyFvZfHNWcj9oXshsIQ57xWC4rxKjI39h2vN3ow5t48iCqhjQNlrXtC5YkjvzUWvI5aXHV5aSrlfNSRK8BwacGdRV0Zhq7cetlW+AMLdFqbSubFThXns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754271472; c=relaxed/simple;
	bh=dpxW8aShh2RYLX9CjF0k/XEH2duG8LnixEBwdfov9eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WoCP3LNOUlhgpe3theYxuDj7YcKHpvw47YhBHs6WjpRq3CwkCOtJE1F7b42cFSuOscsPW5JLdIB5m+I8RFCTjlfzG9VHjhdwZSonX6seulOOnmY56KW9jpksAlPtMnnE0uBWVJmATYGS8A5AbovjVqLB1nc17HLENlh4Hiu9H8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVLKa/+s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573JrNJ4019944
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 01:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+WbtO0JaeN1fhr4oYLduWJfFLHLQ9helHJAYmSQJKos=; b=dVLKa/+sxCcUjiVS
	CVvL/boLzhjw07U03x8zPGT60OITISJnH2Xt3wyCKMUue23nscPGGNJBQ2NMO6VW
	YUmFaZW8EEWVsqK60z7hI8sxklfyEIwzereJQTKqkL0HW7srw2dhjquwl2ozW/pX
	Xw9ybvOxhxrMDN+F2Ku2a6NrK5Cwa4JmYJpEH/JHPmnUA9QcJch+089WJEMQJdlu
	ml4bhd2VzF7brVc9PCPajb0qQ4sW/UQHk2vgVcwlqjH8sLqmTJ06MIi9fvwL/o/W
	HT9GfXRfj42dgzigxk+etp4/Wfkro6XUoa1XPqQMcqER4gpY9oFjDWRZIDgVh8yD
	XrDRgw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqk1nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 01:37:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76bc511e226so3386003b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Aug 2025 18:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754271470; x=1754876270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WbtO0JaeN1fhr4oYLduWJfFLHLQ9helHJAYmSQJKos=;
        b=OBfSK63iru75wtgfTtm54tvOEwr7wEdcM2E5GG5N4d7I20piUeMKYvn3RGSSjaQJC9
         QHhK79KU1I3O3JkADCkPeLjScsMKtuxYrRvZwMVwT3nT/TYT9vHgRfzOlzyCAzDGPV0o
         dhlhyNV2x8bh2ypp8EakR/OA2pMz+GBsLdynuWwOMZHHR7ypeYs0WIWRFKGzgo+QHhxv
         pwKhfa+pheVK1pg5xtq0y0CTXNLKeDMeM5UZHeZax3syFTT56S76Yj9V/ROZ8t44S3h6
         B3RFZYHH9sq00HeJ60Un66BEHZ0e3GCLG0c6ephLcWgoGwqkAmY2W0O2to0IEAn19xMq
         Yl3w==
X-Forwarded-Encrypted: i=1; AJvYcCUaetbbGdlRRuAL46RcwHhv83XJ9MP3k2LNAY0hvMWuLUIsuMZRWEXexFVPSjlVLdfpf5P6JED/JsnpjtK4@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ9H+pkmlW3HgvJehOzAR1rJgKEAV08aBHPt9WcStPpRAp7d4Z
	8eUC310HUm2mSdCLGvJtDZCq3e6PeC5te97K3SvVZdIVBSI4eT8YpO9SzqAgUUzmjjUgpSyAKoD
	ndlVl0uA8LG8poIm8zwLnYmndciTlTz4fz+kfJ6QcHqJf8ZWTSr9qp2I6Cns4gBh3AuTa
X-Gm-Gg: ASbGncsYOn3/57AIJhn4llGC0l/UTwiQ+4Q3SKQjav10URb962qXONn4bKTD6QDuFoY
	Z8SwPDQRmUFwzZ6u7j888fypEsWepEs6Khyw1zIIyhvINbg+mGiu1WqLwO6qMqhex1NPf1tp4fj
	+phgQbP+94GklF3n9m9AkgNcq2LMPK7VHllO+2g3/VL5wrcMU8hbTIz6Xd5mduDkO8rt/mKsCCW
	GbwkKyjbmbsajPNIawUkcUqceyK0wVXBax1Bok01PapEijjTbMXZNGHOzgzYj54E6Nwb4FbPn4e
	Zh4vG7JsSqNPXbRsMv2nqgvat73xilkcp5pwTwc3A9qv7Z6ghaBAg1q/KoZfUHkARNVm0SpSUZq
	j0ckLaHR2MqPgorN8o+5YHHfl2h8NaTWoDA==
X-Received: by 2002:a05:6a00:ae04:b0:76b:ef69:1543 with SMTP id d2e1a72fcca58-76bef691a42mr7909219b3a.8.1754271469840;
        Sun, 03 Aug 2025 18:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSsQ0u83UmUTk0WlvigtXYMQpcwrYjWvpZCc8dAhXTLDlgebDRDNNZo6m/tpEwTW8cNaMdHg==
X-Received: by 2002:a05:6a00:ae04:b0:76b:ef69:1543 with SMTP id d2e1a72fcca58-76bef691a42mr7909195b3a.8.1754271469414;
        Sun, 03 Aug 2025 18:37:49 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfd8ebbsm9208626b3a.102.2025.08.03.18.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 18:37:49 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Mon, 04 Aug 2025 09:37:05 +0800
Subject: [PATCH v4 2/4] firmware: qcom: scm: Allow QSEECOM on HAMOA-IOT-EVK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-hamoa_initial-v4-2-19edbb28677b@oss.qualcomm.com>
References: <20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com>
In-Reply-To: <20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754271459; l=902;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=dpxW8aShh2RYLX9CjF0k/XEH2duG8LnixEBwdfov9eo=;
 b=CI+Akt149+Xf3uKsOe8u1MUuyM7QbzrRCMaqkcccoVB+jeJ1orNwNIl/wPv8tYScRVw73lf84
 zCvOf/wj1i2BNEBYgc7zq+Nwxbe+mYMJk0fqJ0v1t1QVB8tiYfWaa6j
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: w7RSDhdQe7kTZTt71MQ31BUgtb0D1yMV
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=68900eee cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=h7II6S6JRGbW-U2bcKQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAwNyBTYWx0ZWRfXw4k0jbcGeBK0
 2CBKbykYDpIBNGd3xJF8SH8fW/zE/DTn+/YY0e8Ek+yRXEwxoQISi2APUvzGhI9KR8YMXsrYqhe
 nOh+BRw2WO1qmJkVmCVLJMi+ytlT1omvwbxY3OZKOqmRz5vqDmHZrGZLqCoTy0vY2QLVX+Sscfg
 LNzB/JXsOpcVVw7hntbTbjdf0y3tln+eEbMgdAV3c8Nv66+pnb5Hda6jXiwySxAdp3l4ipnLlO1
 iaUJH/BufKGi5DaQMMXqVj1yBA0vfyCdXPt7eux5SJtBrVAhR/1WXcOwr0oLJeCk62dgGeLUquu
 P1ks3CZoqMqvhQMiignTu9UeE6RpcaDiMGDajC8lJi+5d76nGY73Y50F+89VmIYghpb1NHHp+98
 dux/3YlqNHGY3F3rpPwPCcFKQa0U6CAxxYE/BfHx3xUHa0gZ1HTB0jODTCkX5AdmYOc1NpbJ
X-Proofpoint-ORIG-GUID: w7RSDhdQe7kTZTt71MQ31BUgtb0D1yMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_07,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040007

Add the Hamoa-IoT-EVK board to the list to enable access to EFI variables.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 26cd0458aacd67dcd36f065675e969cea97eb465..27c9d4a0912646415efac2df089ddedaf971fcb1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2006,6 +2006,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,blackrock" },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
+	{ .compatible = "qcom,hamoa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e001de-devkit" },
 	{ .compatible = "qcom,x1e80100-crd" },

-- 
2.34.1


