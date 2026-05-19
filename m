Return-Path: <linux-arm-msm+bounces-108353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJTzBEUFDGrDTwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:37:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F5157831B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3D2B3054BB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3119D393DEB;
	Tue, 19 May 2026 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vr1niQA1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sy7Vci6q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3BB38F639
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172537; cv=none; b=WqFtL9pBFN+HeYVigJ6KS8KHNlSsnIJtx2tWBEnRQw37JhmM9QTNzNZ7CYTSmNt0D6UdPMzOkqyGv0XxwyQwG2VIKFtY9tcU7svpfvyO9j2WFBfuaWeNYX/M6CNNwXOlt4eOllxeUUvs/6Td/oUzop5LU+yIbHMP35ia56HOFXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172537; c=relaxed/simple;
	bh=hGQrKFRjP1hpdpAcZfNLfUIZIR31hJSwjPWTY95YuyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+YnpZgVg8rCWiARp/FWNeuXp5UpyNXYvtOpLEwWldt5Lk7QtCh724NX4a0NXBdZv6JmrEn+07lD42b6GHV5QS7JKfn53vVzLU2p1Wx4gkpJVMvLUw2m1+ojQOiZ4E9uwE2W+EBzF9OKaE+s4RhIFQOeyPsf7xxMPG2f9zewq7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vr1niQA1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sy7Vci6q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5ZvvY2701134
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z8ISBEru/rJ
	YUpudCe+0ajVUfFZY8DjrezK4pf9ZH/M=; b=Vr1niQA1Ovyp2ai/etNo1y+o5pX
	zgpiaiQNXjIIc5qiqR0L7PbwtQVcEDQAMDoNfkxJXc09zrE7knz3c4w7u82fTDpW
	UiadLwUCOmKK9UaWczYZcDpFhdeg3TY+WmyU03Fhd6cpClVcL0s8FiIorDcvmjdS
	osZ2a0A6Ami9m3RWTAnfjDYVuBrEXfaA2NrCc0OfYYjEod7+wKRCDox4+0m9i1K6
	MhI1UOKnjenMwSLlKusUVl9rqcNdvD/h2d8ayufRvKLtavufvk+Y2dwEEOeyzyOO
	gEOGlQ6b56d4GVg+XFDA+XNYfv6eAuTfORHJoLFodGsdr4i7ZajuCJ5g1ww==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82mekjbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2fdc19ce995so2255080eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 23:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779172533; x=1779777333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8ISBEru/rJYUpudCe+0ajVUfFZY8DjrezK4pf9ZH/M=;
        b=Sy7Vci6qOqZtKvHETwI/c2MOMKpgv+CbtHPb20ZU6TSkEbDe1aeL5jkcHQA1JICRMi
         YUj9AtnqS74MuJz1GMskSasQxgvfE7uKc/QF1YAuEej4BKZWUM3FvQ+UsPAG09f8FYm2
         NI+7hAWVHX4k08hXz4kpW8AZ80Iw9nl62nlci83xeTpmf8Zqa7noylRhyf/bJdaoMIDe
         1RagsCwSMDLmpyepbmdqxs3apXCjexaF5gmTXwDlFBJKegG5XoRA7/a5H2zHK51TgdtP
         V8xFn6KumzMEWps27UkcBLaLzt0oYv0L6G2Hka451Yb4lmCGTXRfbKTCXGi6GjRS557K
         qnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172533; x=1779777333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z8ISBEru/rJYUpudCe+0ajVUfFZY8DjrezK4pf9ZH/M=;
        b=CDERUUEzhfpJYC+XOQ+4qOrjc6bNzT9FSjQOswbNTUhLu7mKXk2aqJuxneNXK+lOhx
         HPmoD9aDx3zEUPgeL9GbNd1ee6UvJDk0TpjSJi58NTk4Jy7P6niRVlrwAn3e1ZdI+kLF
         mKdbwdetwTwUtmi1OeCv/okxB3Z74/ieRyiunc2tz+GOEoJrd6u7kJukKeF2Rxz7Z+uX
         CHxpnE7r0r0BhDnj6eZK3S2rSH5RGAphH11sdAYgS20S/T1lcIJlExrBd0+vJzJZ8jUU
         WrlDTFpUPw3yFARL/xV4U7/Lgff315oQPGYE0TdMRozq3YF5L2SMfNTrlKVJZmhOZsQm
         a7RQ==
X-Forwarded-Encrypted: i=1; AFNElJ9oq29JGtybKqTgZU9sbPUG1Z9zwxMQ68eMMzeQr7olU82aYtOlfbVnnJTFH1GC2ca9/yLOY7KA11MkK3kT@vger.kernel.org
X-Gm-Message-State: AOJu0YxJJm/C+bSTd8epIURKT+fxcnIyfKnUSr+T2N3PCPsOY74PkKvq
	0I0U4Wl4ehrqFvlYgScp9V9N0nA+vvqM0Sz8JdFVFqOf8JkChrB/S1XW1eQ7hiFW6HhC/XFuouA
	C9pxj+ClX3nqYLqX3ZWSfzh86hDGlfNlikY1zNReXVSKfBhMslW1nrrxZARLnlGF+6ihf
X-Gm-Gg: Acq92OFHS9N4T2q/Du3D1UEAf1lkwNEExavETtOlRdP/aH6Vz2LDvNph9DY1Axzw5gH
	JRrUfiSp5/IkcpE3vP5mu2p4Y9VKQtaEitCjjnLZIeeTMkxOiW/3Y1OanjfH2p+DZbR6zovPXmk
	OF0uv8vr+UEEYOcjMtDAxYethvymkG/YGWC8JqrcBBzJdTdW5sQKcy7B5R+uTN0UZ+MEq4bZyFT
	cJrh2v/vz60px2FEw4JlOc9qjzZR3muhzJ+bRPpaWrL3Kuy21tSvALNsiHTuSklcPGsFKE4HRtJ
	ptwIlI78bNNz+1TrGSOn4jeybYPBlDXG1frOkuBxwm2Z+kwwHTzAaeJ3bmDIjeVcn2TXioNBaRx
	4df0JUkgGJpCI/2t1A4F/LqUIU1ivAjq5gn+FHcKH5LXzAQjODRTB3Ni7zd9Z5N8w7m+gCB+uKm
	WK1pxiLA==
X-Received: by 2002:a05:7022:6607:b0:12c:9037:5126 with SMTP id a92af1059eb24-134c890fb8bmr10210493c88.9.1779172533299;
        Mon, 18 May 2026 23:35:33 -0700 (PDT)
X-Received: by 2002:a05:7022:6607:b0:12c:9037:5126 with SMTP id a92af1059eb24-134c890fb8bmr10210470c88.9.1779172532773;
        Mon, 18 May 2026 23:35:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm22614537c88.5.2026.05.18.23.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:35:32 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/8] dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
Date: Tue, 19 May 2026 14:34:58 +0800
Message-ID: <20260519063505.883379-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
References: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0c04b6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=v3ITllUuhb3Bg83hOPoA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: U2ZVPkP-QCaHkmXrjE964U9Po6PMYVgM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2MiBTYWx0ZWRfX/wHiGfeicySa
 287f0tLOeWjllYOblrgtoW1ZGtXXTZGYA5kSBX9zydDhkRfEo4hnRxaUXic4wlGKCsm+Ix5Yq+8
 XWs4txNcofU6WOJ0ZBqfecgztiO+EviQVhEXJo/uxgwxQHEOW1Ss06IKY0xHgm36NJ8uKxTaCsj
 WGqMQH127vGll0YuKRh1KWUCgsltj3rbeOM9NANTYVrZXh7Lq49Hodad/wDsBXvGFtW3I6efW4U
 FirasOLJA4m3bAoO5FnBRbtR75hsPaIN+RI0HDzycr7trviqZfP1KuTg4IBJL5n6dvShOIPfZVE
 gBBdzRc4tNdfQDgyf+EK4XPgBk283ec/kL1q7Gi6ANu0b2zVKxJxq14ZAA0sSkER/sjNUYkNpcg
 0RFPrZnfFrAlZLcnRWz4F/IOTrFd8VjA2IReQOU0x5YTNrT8sDWYb3Jggp6Eynfv2OmfPUAnzvn
 YwB1uadlXI9NTbD82Ng==
X-Proofpoint-ORIG-GUID: U2ZVPkP-QCaHkmXrjE964U9Po6PMYVgM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190062
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-108353-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 33F5157831B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Nord is a SoC family from Qualcomm designed as the next generation of
Lemans series. SA8797P is the automotive variant of Nord, where platform
resources such as clocks, regulators, interconnects, etc. are managed
by firmware through SCMI.

Add SoC ID for Nord SA8797P.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index bc65e233eb93..3b353c46b3ab 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -297,6 +297,7 @@
 #define QCOM_ID_QCS8275			675
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
+#define QCOM_ID_SA8797P			690
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
 #define QCOM_ID_CQ2390M			756
-- 
2.43.0


