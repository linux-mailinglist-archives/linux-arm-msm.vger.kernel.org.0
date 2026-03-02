Return-Path: <linux-arm-msm+bounces-94872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MH6MB1tpWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:57:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5251D709C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65A1C3056B7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C2435AC1F;
	Mon,  2 Mar 2026 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyiKYXFG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bo9PVM2q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8351435AC12
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448835; cv=none; b=ZX3JVi7x4AzaBLM/cdrUVrt8D/m1un+MdSSonwGmlq8poPuDJDOKLbzsiSDsjaky0tF6DlckYg5MmmaHoqqU0JkcSI/8BHJquC7rX6q6SFN3WegBmtKZZFAWabEnvgEJHkAwn+pJ0o4eUZgOyFKlG/Uke5T8EYySN7/lYoTjnlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448835; c=relaxed/simple;
	bh=j5Ix9t2krSPr+pvE6bRRwSqx5ClVg6lCGBuwRlKrK0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5YcJX8L/8rO5teAxP5zNdbdy9xO/b8KiiFqmZwI9WzB0BDhdthQI9nvFRL52EfDUM3NNN7nmaKYruCieIT8LQP3Yhg2A3IT03HmkJWzz8peXz4jUlbnbGpj/wTjjSjmHUSolPiGF4XiZ2AfLYz3LY7B61EapbSP1PLMhSbC3Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyiKYXFG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bo9PVM2q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229K3cs782739
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wDRzvs4lKe6lzoVo9obMRd5reHDn3pymfPmnNclniRY=; b=oyiKYXFGp00kEBqq
	vm78bXpkKjm5RVM9ydbgdXOB+RC0I31QGP3afH0zKSXELSWQDMiPVDS9ntUuhkrp
	V2kZvo6S3L10betv6DqXINuMwO1nxDaY/ncFvA7tXPBINg0Rcx1Xh7DB/Rd6lATG
	WBGNv3+7pdwkKQioDePx8ZK7AIRB6H5ZQks8po6QrG/vgivr38mA9jP2EnEUW0Ln
	+W7wk0o9/dxgIR2KN0oc0nNvNlbgRlPgUcKo/xntl1bDRipci/mhrREdtljJPhH3
	1uGibIxGXDqZHasnD6vpgmpwE98MunE5LnJWxJlBxT/iRgKAxTRYx3tBs7HROgIu
	XVawBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u00b53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:53:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so4208972485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448832; x=1773053632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDRzvs4lKe6lzoVo9obMRd5reHDn3pymfPmnNclniRY=;
        b=Bo9PVM2qp2DjzLO/FgAj72qdFfR4nLNx/8qCpiBgUr57TdOOmclP5TLy3I6o1FBsJ7
         jfagaT0pnxSDFYSmUXKS86MzhERuvjIIbKdk21RvVCN+UhR/OE1lP8epfF31H/NVSioF
         tgB6o1VyjjlRt3s7TF8AbQdzDN6fJHowz8PSh1QMJskmSSMghCU0o9BTxZ2+kRNXlrng
         VQQbwquyvKio679Li5mlEKN4kT2nthckc8keDuWGdVH1fKOofFt/2V3XwgcMF68lxJlQ
         K4UycKlR8M1yQJmoEgwphGFU5zYUCV61J+BOuzf+14C9Ix6ybQxVJacIU8hxm9J4JcJk
         +vYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448832; x=1773053632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wDRzvs4lKe6lzoVo9obMRd5reHDn3pymfPmnNclniRY=;
        b=cUhZMcSQMhi9+eAJHOHFfEWK+ZQlG43e4Hbs12Vmz/LtXnGjGlUBk0/s9hWXTXp4UX
         8exNRf/gVviq4FDusOVsP+L8lpMtvUbLjJU3ZDliEGNXlzT0ORd2ooBMudibV3xhRtW3
         7s/bDDYTLq7X1GMqHAbhEeL5oKJGAmahE7fTlzjdPbZCKWKix7bHiKZmMLE7Nb7tV7El
         NC0BHJQND70S0Tkagl5YR9wikJ34WYN1GLBrWCbugElVYJ3WvQhl+Bi6CjhW12g4sOPI
         NQs4jFthGB68GgDG2kh/XBLXPT6eAdSxywpIGQNrgsDvZkZVrqPUqONFY/wtHpZn6Pz2
         YyRQ==
X-Gm-Message-State: AOJu0YwqUFH03vxW2uPkc1Gp9wO6qi8jzZlyE4lYUpkY8d9mV59N7mzK
	4HkP4wPcClw6S6WfSDIYKjUun2GodRwjrRWMHc61yOrLO38FBig0370+aR6098BeULTdeaq4CM0
	lVcTGFjXzuBAy9cewc/1TMNRj1BtmHzWmJt6eqzeQFxqjPaWISQCTK4HYQP2TtFkEEc3u
X-Gm-Gg: ATEYQzxb7OOoyruYHR3jEViQE4177wlTRPwM+Op47WqsNYfjAXSzjbTP5QLl70oBGSl
	/b0azR54x3vQLFU0IPPXnuYLBCHaOcm2aGc39ejY2Gj5o4lzXsw4L42WAOyocpBmnBy74roAu+i
	lOugPLaBOqDrGzSeDrKCi/cRKCGezXAQ8I9JXg7/oUOq8ssOrn59/oF9am00OYLYCciWznyUW9c
	nCQJgFlTO5VMRxqRstaLrHwDfYyuTIgzpqSZG9E/8fDkumqbhVLUvj9cXPZZU/vZpMCGGLEW98a
	8usQoUKwxJlMCDDWL3xDqa3hc88OhWTOyGz+E0F3vJUJIWCrkvbya1QWCd5NR64TLBSZvh/cGLZ
	Hopbf5wWzYEP6FjHoiuNqZCH6UnUXdQ==
X-Received: by 2002:a05:620a:29c6:b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cbbf3edc70mr1828241585a.31.1772448831819;
        Mon, 02 Mar 2026 02:53:51 -0800 (PST)
X-Received: by 2002:a05:620a:29c6:b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cbbf3edc70mr1828238985a.31.1772448831236;
        Mon, 02 Mar 2026 02:53:51 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm8399509f8f.38.2026.03.02.02.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:53:50 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 12:53:34 +0200
Subject: [PATCH v6 6/6] clk: qcom: Add TCSR clock driver for Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-eliza-clocks-v6-6-6f42d8a9d25c@oss.qualcomm.com>
References: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
In-Reply-To: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=6765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=j5Ix9t2krSPr+pvE6bRRwSqx5ClVg6lCGBuwRlKrK0E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppWwxt47Gb9KQEcayshhupE6EpQEp9qFjZYUB1
 LYkFHu+tH6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVsMQAKCRAbX0TJAJUV
 Vo/oD/9RwcWCJiMSCWNyMEb1U7YtZSRzEIEaBDYMrMio3vupGZw/O9yoRq0sIozDLMip6lcxzJt
 ISRHznVIOZdNcIKnWWrvmZfIOZQBK8LqRfjuVN5IY8m88MqhIqpkLuMOeGhuowPJdN4zbR7lVPC
 pK+QXNXyjGAbM+fKGJ1VtV8Ww/3zsGySsuR6fUYig1vTDm+gePamifhEaQdjW5cjtry/APLxAX3
 /HW1qw0Vgr/DvlH+QIXX+w7gnYMTJjuEotvcU4L3FWVdfG/nyGRQfnV3vXwsuvmySdvLD+ZDs3p
 EE4tXtHlEHAMZc40EJvE81wXmwIZ2JT663tENOcupBLFDz05iVAV1/UX1QEkRKDBw7tA3vuQDw1
 iX5o9JJ6walvaSBy0cERreub5UO1xqADGfDZjfCZlYB1+LFImRLY9HWp3OYVTIwJTB+PYxIaPYl
 dDL0ul4v0/4B9cxWfIBP8O4He1N8/6z62hk1D8/AVnac9QzIgKT+XSYE/5AjiIkNSCPcNr9MaiH
 kBE/vJyt/CvmyUWxRUKq58ByEowQwZPHV4CaZ3uHyxwOIPtoW2GkX4A1921WxV7El4BPFc1XxOG
 D3EJYdee9Mcagr1JhwL92shkTF1EJs/M1+s1iyP0kJ/rl0TyRVMPDdqU2VfleH6NSjPam5pa9sG
 C6KjSNH2aRZ6r8A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a56c40 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xMpycIIAKlYumkEOWPcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OCBTYWx0ZWRfX7TrzYdQcgC74
 Lb2x6BKy2qi3xEboopNV+zcQQ+Zl7aCzNo/Rx3MyIUOoPmXWTCLA/uQvn4uYkW+WRUlWB5B3g9n
 skKQC+C5cCQqj6lWEKxaaoejRDxQ2ottji+ev8akkHjYN+6LX55ZcWN8Xc0RcVGHYn/fRF6dfzD
 yDZrQ486gXz+hl0/QqaNn/zSH6jOAOSyflH8GWoeh0ERXxOFxYWnqbdGjYz0wturvOvkPz91tP9
 cREPl0aAiAiBsAc4ZUDBzpXNc8sahJbFTi+lJArm/RvShhF8ZGulwge+/AYQZm+4Ha4ONA1Vrjc
 4B+w0mPjfcmepAfBp96L8kW62wyBVuXundAWJzDtYWOS2yLPtfXktcA65xrByHZgurgXKlmg8Z/
 f3esF4Ufnx1J1ABto9PNEthsvWWajMlKxgt0EFSbu5n0oL+EOThMDYS2iAreN4uRYqKV5zobx5C
 PQLcwq1l4/kECVndASQ==
X-Proofpoint-GUID: nZCPtnR-OZq7MEkQ36X5eUWptxEg-PBw
X-Proofpoint-ORIG-GUID: nZCPtnR-OZq7MEkQ36X5eUWptxEg-PBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94872-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F5251D709C
X-Rspamd-Action: no action

Add the TCSR clock controller that provides the refclks on Eliza
platform for PCIe, USB and UFS subsystems.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |   8 ++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/tcsrcc-eliza.c | 180 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index edac919d3aa2..dce21e33e366 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -28,6 +28,14 @@ config CLK_ELIZA_GCC
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.
 
+config CLK_ELIZA_TCSRCC
+	tristate "Eliza TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the TCSR clock controller on Eliza devices.
+	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
+
 config CLK_GLYMUR_DISPCC
 	tristate "GLYMUR Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 98891d19b3ac..2ac9eb14e1ab 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -21,6 +21,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
+obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
diff --git a/drivers/clk/qcom/tcsrcc-eliza.c b/drivers/clk/qcom/tcsrcc-eliza.c
new file mode 100644
index 000000000000..ef9b6393f57e
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-eliza.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,eliza-tcsr.h>
+
+#include "clk-branch.h"
+#include "clk-regmap.h"
+#include "common.h"
+
+enum {
+	DT_BI_TCXO_PAD,
+};
+
+static struct clk_branch tcsr_hdmi_clkref_en = {
+	.halt_reg = 0x14,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x14,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_hdmi_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_0_clkref_en = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_1_clkref_en = {
+	.halt_reg = 0x1c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ufs_clkref_en = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_ufs_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_clkref_en = {
+	.halt_reg = 0x4,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_clkref_en = {
+	.halt_reg = 0x10,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_eliza_clocks[] = {
+	[TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
+	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_eliza_desc = {
+	.config = &tcsr_cc_eliza_regmap_config,
+	.clks = tcsr_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
+};
+
+static const struct of_device_id tcsr_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-tcsr" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_eliza_match_table);
+
+static int tcsr_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_eliza_desc);
+}
+
+static struct platform_driver tcsr_cc_eliza_driver = {
+	.probe = tcsr_cc_eliza_probe,
+	.driver = {
+		.name = "tcsr_cc-eliza",
+		.of_match_table = tcsr_cc_eliza_match_table,
+	},
+};
+
+static int __init tcsr_cc_eliza_init(void)
+{
+	return platform_driver_register(&tcsr_cc_eliza_driver);
+}
+subsys_initcall(tcsr_cc_eliza_init);
+
+static void __exit tcsr_cc_eliza_exit(void)
+{
+	platform_driver_unregister(&tcsr_cc_eliza_driver);
+}
+module_exit(tcsr_cc_eliza_exit);
+
+MODULE_DESCRIPTION("QTI TCSR_CC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.48.1


