Return-Path: <linux-arm-msm+bounces-102548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPrNLnUR2GldXAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:52:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD3C3CF9E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA63E30131D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 20:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B69342173;
	Thu,  9 Apr 2026 20:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkmgYNDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KbvvuVQN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3C433B94A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767903; cv=none; b=nJ3nIW8jERsA9rB0PG+9tLfd6qjixeCh2neBbW4PS+j4hXGSulTQROxwyzMVHoD/zAkemEtvYKXl0xYihJAtg8tQEB/LdiJeleuPyg46Hd6Ji3qxdmP15Z0NimURN21M/ZYB6Ub/99EdNbJWdTOf8SZL2MT6feLtLTuHiEWRKWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767903; c=relaxed/simple;
	bh=+7ooedey7pZss6nxC4MelZ08DllIp16P+HJNhzWNu+s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q3r5NHRUp2m+G7rabCGVqEgGiKzV9jp80hJcbIbUCAwXlsJp2uAHBCHhNKwSNLBtA5wplemUj/+l9Ol/JlfZK+gI2GuyfBsqvgenpn4kb3U8+QMwclCPirndhCtjjEN0JwSXS7mjBcjo9UV1hBXfJ3kUzs+YeAjwgtXZCowziR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkmgYNDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KbvvuVQN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639HYaRu3352902
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 20:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jKpBiFaOBJl17f8mUlp9yO
	Dx02+ItIktu9keK2GJ29A=; b=WkmgYNDmmM9nBoz5LTg0Yfgb+CjkMoAL/sfdrY
	NamT1UeLDONzVkV+h0v1otddrZftfA/nzH1TQb2vG8EDrnSuk9VY+K462aLIvM29
	QDKbR4xxtCbn1HhBuGakIy1Oo2rvDaiu/Qee9LEWn0aex0bxmTcyePlLAkJbSAy7
	Sz1Vwiah6FWv3uNG/TECP9JcI+WaKyH29y2BrVzMQ6+jaRSa/myu1bN075Sjy0T4
	iCJzgWjacaZlwji1l5Vp8tb2fS+z2aCowFqyCGXD65Qod7vOCCQz6gjHMhKjmFNq
	98hlMHMgz677HMRD5MgHth0o/jX7rncOQSkflFvEqvrZx0Yg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qsva5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:51:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c4cfe08c9dso4089880eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 13:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767899; x=1776372699; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jKpBiFaOBJl17f8mUlp9yODx02+ItIktu9keK2GJ29A=;
        b=KbvvuVQNyGyFn5d5ck/8C+tz3CPCtFRMlFBc9gfpIDscTERGkE3uVemgSSA0nvtLw6
         Y+plqBueh6nekuM2gkN4+hplg+LDyhdCvZCghw2apwo6npQvL7nJ68JSATcindgrvAKb
         UxdDYG0F+7iV029sLTpaHixLBBQeclxjb7UvR08YDJtLq2PUnY64JuMFMN86fpwiYco8
         7i5WMjEEG4UnTZ7G6ZgRpSA0sIa1BI8XoC9cuUoHElvA3Ziy1KAurTTwWO5R4Wxkoq6I
         hfTE/NE+SlYLCEr+qsEg1n/9xgDFxYbCrQRyOxBtYG25jSSbeTXXy0JbycC2yGY0+y3A
         FzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767899; x=1776372699;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKpBiFaOBJl17f8mUlp9yODx02+ItIktu9keK2GJ29A=;
        b=dse0JtzEBalRI9pTYpbAhdZtzkNvuKfHtk0jNVwVaSLpktZC+DZ/U7VzcDpUqrXjKK
         /E2M+dTbXdA8pFJVbc6qm7JNTrRFSN1AMb/6NjwhneSN6lr/24+imyy7X+Iy2lkhQhmX
         NQjETWOSbFKc6jD8EK5J2cymH8Knr45kdFEIj1Gl2K/+gFwos633/HmzQXBECZZ7z6bp
         Lr6zGa+SnXQTcA7R2tI6TZS56USRnXVlAa73cDCUQKKOEK6IOgeSQuXKZ5+E7sKprzC4
         95ZV3wLaHEHxvXqIhWdGSii2STxJBVjGSscKtXOTWLLRBp620QjiNvhmaIV0hs+59Eg/
         rVRQ==
X-Gm-Message-State: AOJu0Yy4f+/5HmCrmGugE3tXZI/Y3Pgo1l2EbDd0lHZtapYqoZyZW7CP
	jRgesMJcMslasgbxElkGzswpDe6nsWd3b9bCmqiJ2m3pwpUuVCzlcg/9MJSYg3yMKbMi96BTrbI
	j/uo7gy9ym5y70IIWyNIrgMOfQdTK+y4jCc426HKkQHxxwLqqUIdEmEYi5Jw8mrR1CmL/
X-Gm-Gg: AeBDieu5eyNd9G7tEIOSae1Q+h/vfbXpG1uj0H+kQbZrVbqspdTW1BFLyEXyyyInH9C
	t1qIVqL62Epd3aHLWC63//cReHorPUoLixFzU7sPvF2aeOVbqJTW6QAP7fENh80UtVxw12JhDMD
	D+ycncculoyYlnhEk+GNfqUKp3HBtlsEhnp4pCaeUcwA2JqSbMxBBgMWeomBwBppcr7E6ATMaDJ
	46PDI62FZJHbwmtdTkA+XxKNOzMUXU+ckIGG9zSFnu8Shgpz9ENJ0bM27qgiAoNSYJPkRQCOnK2
	JhGW1Q/hSTNSMI+oots42pa698jq67nWg3qh34XsAM4IoiNnnrwQKVSILAVhXsP9YHOv2etR3uP
	1utdqqNx62Ntj3950pp3xgFGTu7WDvUKcXveC/MtXvlm0y0FP7Ev7wQ15FMKxt7Pz12fue+0hf2
	mM
X-Received: by 2002:a05:693c:2c0a:b0:2c9:ee15:a0e2 with SMTP id 5a478bee46e88-2d586991ab2mr414155eec.8.1775767899263;
        Thu, 09 Apr 2026 13:51:39 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0a:b0:2c9:ee15:a0e2 with SMTP id 5a478bee46e88-2d586991ab2mr414126eec.8.1775767898682;
        Thu, 09 Apr 2026 13:51:38 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:38 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v2 0/7] clk: qcom: Add initial clock controllers for the
 upcoming Hawi SoC
Date: Thu, 09 Apr 2026 13:51:34 -0700
Message-Id: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYR2GkC/0XMTQrCMBCG4auUWZuSH83ClfeQLsYkmsG2sRmtS
 sndjUVwM/AMH+8CHDIFhn2zQA4zMaWxQm8acBHHSxDkq0FLbaVRVrj+KiI+SSj0W4feWG8R6vy
 Ww5lea+rYVUfie8rvtTyr7/cXMfIfmZWo0mitCcqb3emQmNvpgb1Lw9DWA10p5QP1gTXFpwAAA
 A==
X-Change-ID: 20260316-clk-hawi-1ad4cad36d6a
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=2287;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=+7ooedey7pZss6nxC4MelZ08DllIp16P+HJNhzWNu+s=;
 b=CIf4C7+Esdwrf0h6QF3QjWHcWclvMT8VWvgIg3cVJWiiHsCcbt5yYDMdz5fsfGMbNVDxGKkAn
 54lZSAAY7X8DXflWrVDFm6BVJurlGQquPq8/soONoAmM2RoPbsFRkCK
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfXxqQ2VnYDdanI
 F0grV7Qj1pVOdqgl6XxC240/eQbCkuoFvjbzbIEIYjxvVPS4aIlgivMEv7kxr/pWTI690cUYIO7
 btRAq6Yibp/lXAN168MCmYxMKF03W3sGNBo+/3AHm9MUFPqp86zUaHGmskGuw5NnCKiFwLUD2Yh
 S5iiYAKpsh2PZAI/MOaG2TxMenRvk3093PqSMlE0ts/vj/YK/7JBLyXQH8PTC0yocMpzLHtDkvk
 Dm4kYN1Gvonk9V7hLg63g7NPsRBgbQhVasAQ9pmBlM3Unp8FSlDllTQaIcOVD7PGLthyXcWprtb
 vg7yCg9Xcc1vvrvvKQpcKZhKv9q6JmlLZzN+vjx3MIbLIVdSLlcKDCR/oBI+xMQ5W1bCVfM2DRS
 M9uM5LqlTGy2jrNL+2sfU8JAeUvwnfH+5il4gsuQ+CxM3OTlPH66NpgjKPnDo7Win/7maSLt2is
 5OzzQdeKlmmrHP+k4ug==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d8115c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tIqp-kY1CHwBKU6mdUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: OVXNqD1uhNWnXOGlniF8Hb0h-Gj8KA7F
X-Proofpoint-ORIG-GUID: OVXNqD1uhNWnXOGlniF8Hb0h-Gj8KA7F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090192
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102548-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CD3C3CF9E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for the initial clock controllers required
by the upcoming Qualcomm Hawi SoC. These include the Global Clock
Controller (GCC), TCSR clocks, and RPMH-managed clocks. It also adds
the PLL support required by Hawi.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v2:
- set the use_rpm flag for GDSCs to support runtime PM.
- Use clk_rcg_shared_ops instead of clk_rcg_shared_no_init_park ops
  for the UFS RCGs. This avoids a UFS GDSC enable failure due to a
  shared PLL used by the UFS RCGs being disabled while the RCGs are
  still configured to it.
- Updated commit messages wording to explicitly refer to the chip as
  the Qualcomm Hawi SoC.
- Collected Reviewed-bys
- Link to v1: https://lore.kernel.org/r/20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com

---
Vivek Aknurwar (7):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for Hawi
      dt-bindings: clock: qcom: Add Hawi TCSR clock controller
      dt-bindings: clock: qcom: Add Hawi global clock controller
      clk: qcom: rpmh: Add support for Hawi RPMH clocks
      clk: qcom: Add Hawi TCSR clock controller driver
      clk: qcom: clk-alpha-pll: Add support for Taycan EHA_T PLL
      clk: qcom: Add support for global clock controller on Hawi

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |   63 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   16 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/clk-rpmh.c                        |   33 +
 drivers/clk/qcom/gcc-hawi.c                        | 3657 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-hawi.c                     |  158 +
 include/dt-bindings/clock/qcom,hawi-gcc.h          |  253 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h       |   16 +
 include/dt-bindings/clock/qcom,rpmh.h              |    2 +
 12 files changed, 4209 insertions(+)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260316-clk-hawi-1ad4cad36d6a

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>


