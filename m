Return-Path: <linux-arm-msm+bounces-100350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJIkNDKdxmnrMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:07:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7718934677C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F8C530221F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EE62BE05A;
	Fri, 27 Mar 2026 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+YTkFW1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NqC99m8R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70727303C97
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624043; cv=none; b=c7TKVhQtZQPXzvxN6wUgtrHkHZF+DiN9Bb8Z4wZ1zZitGTOpc/QByfM+ZZwfwdmRjRGRwiZ3Fh8MJ/AsSQjVpV9P0mlyPF9YtDaDZLH1MV+nEJKDz4eiaCaCys9D4NQUgCcBfRKvT1fE+pJMyl7xxhPSnkrQ/+dqsumuzdP/Uh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624043; c=relaxed/simple;
	bh=Q1M2TmMz1lIs8VVk50gUv7BVVCmurZMf34K29XAP1xQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QHiG/jwmM234gnkyNtRLW5SVmOlWcCQrBYdMeS443SypkuEjUX/aWmpnZYtxYaLvp9KNMSztHJezQ/yp4AAnz8bDvW+5jiBLMPSqLCFcNB2L1M61AaKvV8XSVcYX0MUwpvb+TnNmCXRouHSjVMupZBHE4Cle7NhW4FwMFS/y7bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+YTkFW1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NqC99m8R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhn4O316848
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jm3Zt//eOBSWdsSrodcdg0
	HwCyKxynE9/sYFgcO8whU=; b=A+YTkFW1jcptDLYie2z6beyCl9fpODvGmBSkSU
	W6R/GYW52S1ly3XKhy5ouEV5w3tnDDWQ98h5e4QQrQWkb0Z4PC0BmvGAtj0ZwB3e
	gYEooIJp70TTkEVIi5iGejj1D2VleEPTP5UXFk67slGq/OSCAlj4al8ms3Bvnt0Y
	aOO77Mk5byXkwf5XkZpOFqy89cKXgsNYi36v98xU2u0tQd7D5k/oQE1VKX0qFcal
	BzUxrLSFtOycr/ObroT1V1E1WlXTZrZb64HpWLE8cotOhfMAq/fRGtwv+uHbnJKN
	LCE3DFLMXKiajlK0TliIHjc2C6y5iaLxvKKnSAy18SMO3erQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s440re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:07:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35c0abf427aso590237a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774624039; x=1775228839; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jm3Zt//eOBSWdsSrodcdg0HwCyKxynE9/sYFgcO8whU=;
        b=NqC99m8RRg5+WpzbRmXGN0fd9Qd2P9GNa+O/T5P+LEXhBA9WdEiI78WywnMQbCpY5J
         vXQ3Zjp7Rd8kVv4yO+1jYkSydkkJhKY4NqeYkITo145zH9LQSnj17B4BUc6M8iCfB2KO
         bL0toeT9mxDWNGkslGGffzp/VrxnFyh2AqcsSJmWZmE3u31H0yNOfgo6UCWUyQfeCrcF
         DztdlqxzP0QoAiOxgWmuQm6/d9mMTjQN0BE7bQpykZnC1ttxk/cd0blSw3NfYv9f8b1R
         2DUKARY+2sKwSwuwyljvKNVRA9dlINJRKJWp5yjYBdqboWzEPywyz8kcQQVVUrFhbYut
         03SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624039; x=1775228839;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jm3Zt//eOBSWdsSrodcdg0HwCyKxynE9/sYFgcO8whU=;
        b=ahlqzid0RRRJPaY37uxw6OO1GvGGba3Zk/8sywwBTiBWVaTNa7AYj0hs9tZ9L+E9Ew
         ssd5Unt9nYup7ZQObnXI1WXda/tu4kyzsTGByRUxI6YVhWf37kpZ6i4gyuP1ffMy5YHk
         VQzdYKbNOB+V11ilGub+Xpykv/tXmfR9Yhg44oRgGkuua49bqEPok72QmzORLLriuCPF
         oBgNPW42zkrxUsTAJq4tkk7/wC5gKSgryLOIhzEB5UyPeVYnKYisW9He+5SGeF+9MT7t
         QjVnsB4/yShRLMKW8F6lm81zQnvIi6sMNrCMoJBnJEUdE1Yi//3shV9nWn8ErtpRJvlT
         q/uA==
X-Forwarded-Encrypted: i=1; AJvYcCWhx5pgUjx31IVLlU/BCtpPm/PinxE4E4SrKHVKbGLIRF7XU8BOBRBFPyI4ILQD1yWe74TxhIcj2AkS5rI9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq1rdaLW8gk+yM2sHhh581JMWGicmUgPMMEOSdqt8n/M1X7oeC
	D868ido+/MegTAF8m71Ln+q03DTK2204cKmHMo+MnQWUlklQzdsZ6LN7qFEZXSnnNdTKw/PZS4f
	DSTeNb9PwT+DfLyVCyObfUiAtYgW8xf47rMv5Mzn/JoY3IxYH0F+J3XFZXLcRLiZi85ya
X-Gm-Gg: ATEYQzyJfwhE8hjOyrcqdgv1dHISUye+ZezB3G1C7n6b6CfDYoomMUQ1Qk8mPuhko7i
	7InEMdjcBfXIRr5ifXHOHTxxWiDet7L6VPMrtRhPDiCyPDg9Y5YZ6NHy54LwWcb7aSDbZ12eIN+
	h6G/YJvhL4JqgZyNqnRDdSxkqcc6/vy50h7eKhLPo7tG+cUqcEqvoO5d/nY8sMuYNXOuannq8Z4
	6nlXfZl6gfGJVqJqP20ve/progsTK+Jucfs9jw12oCR25kH9yaFZLrPl8cVCmz5Xdmq9A/9rOrK
	MNSCOjmHSgaiSkjs4r/vgKCCusnKlMnCPstawCpU9cQhFbxMkhkkLiI/OMn6pi3M0HaiDFXX3ew
	nTv1xKBt/aXCb803cKQNcrYv155C4j/vM99urOjzLVrs0b5YriVWR
X-Received: by 2002:a05:6a20:6a10:b0:39b:835f:1730 with SMTP id adf61e73a8af0-39c877f8f90mr3784678637.15.1774624039169;
        Fri, 27 Mar 2026 08:07:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a10:b0:39b:835f:1730 with SMTP id adf61e73a8af0-39c877f8f90mr3784604637.15.1774624038406;
        Fri, 27 Mar 2026 08:07:18 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76739b5ec9sm4864561a12.32.2026.03.27.08.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:07:18 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 20:36:46 +0530
Subject: [PATCH v2] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always
 ON
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-hamoa-usb-qtb-clk-always-on-v2-1-7d8a406e650f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAWdxmkC/42NQQ6CMBBFr0K6dggtlARX3sOwGMpUGoFKB1BCu
 LuVE7j5yfuL93bBFByxuCa7CLQ6dn6MoC6JMB2ODwLXRhYqU2WWyxI6HDzCwg1McwOmfwL2b9w
 Y/AiNaQvSNtc6JxENr0DWfU77vY7cOZ592M7YKn/vf95VggRUFZqqsCqz+uaZ02nB3vhhSOOI+
 jiOLwv56oHNAAAA
X-Change-ID: 20260316-hamoa-usb-qtb-clk-always-on-bcd4e5f3553e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: sVgGnH8h0m7BPzkRMdVenMWbe7vhAQX0
X-Proofpoint-GUID: sVgGnH8h0m7BPzkRMdVenMWbe7vhAQX0
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c69d28 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4CI3Usps31ucNWVHWDoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNCBTYWx0ZWRfX/jRNla7GfBRR
 ZwdURsy8ds1jvBleYkmuaJpZyJcksH0E1IFVqR3SmiYjZdf35L16zfmQlfpGMdP46Nw2Xa7IELr
 8om4BI6BSh1GdVS3rETvlzZE8Wt+uvDYT6TmYuw0gWqj28MyThTY029nMtkTcEL878jUyuRxFJn
 JA5TXys1+A6K2pFuHScY0D69v1Xn4kkVlsmnB0jZXuG72tHdXlVgpQL22X4tIFExAujDNi0XrkK
 M1gXdTvzU4XcwDdcIs8JXwaoj7EJ+LXxXYAcA+K3PT1e3dz/x4g1yo+JG1SVhnEYKOW+WfAJRHw
 Onp8/NJbF1oS3G5B0PtpzQ4LLC1oQGCumXLAzJNl1tbT1NIjDi473CLeGd62+tPEfjfE0NHczyn
 qcIoM0E/kR7R+AQwpNV1qDHXjGfxHU49N1lQRRhfM/xefLPmvI+RJFtkYOp93OIdTs5DsgCyaQL
 rnBly1CdC1+GrNsXqfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270104
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-100350-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7718934677C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In Hamoa, SMMU invalidation requires the GCC_AGGRE_USB_NOC_AXI_CLK
to be on for the USB QTB to be functional. This is currently
explicitly enabled by the DWC3 glue driver, so an invalidation
happening while the USB controller is suspended will fault.

Solve this by voting for the GCC MMU USB QTB clock.

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Updated commit text to add more details
- Added Fixes tag and R-By comments received on v1
- Link to v1: https://lore.kernel.org/r/20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com
---
 drivers/clk/qcom/gcc-x1e80100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 74afd12c158c01c121d9aecd56e65c0c302d7cd0..73a2a5112623e5190f41129af7fd76a86603557b 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -7480,6 +7480,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
 	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
+	qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
 
 	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
 	regmap_write(regmap, 0x52224, 0x0);

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-hamoa-usb-qtb-clk-always-on-bcd4e5f3553e

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


