Return-Path: <linux-arm-msm+bounces-108477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBN8LGlODGqxeQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:50:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3264457E043
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A329B321EDCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB48E49553C;
	Tue, 19 May 2026 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdIQ7J+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GlZFU5wp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF3C4963B0
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189747; cv=none; b=UhdXhTyRaLG7FBhySzLF2UNr4/q0c5SQPYz3jDuFByxOVUxTJFR3Vr3lzCI4x5D5cgJ/b74t8Q5mx12npmpyaGfVjGU8oZ2TcbkDpPtuQBkrpYuIFwNw998V7jgTs77VfSnZ5CnkKU8NeFQmgi+WPzDV8nt45grD2weDo6eMQDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189747; c=relaxed/simple;
	bh=ap6K6k+El5tekEdZ0WngKg85WSbPGb7xvWPETREbYMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hzZcCvC7SRKIuPCcSXcjKSLeVBAqVa/tWTv+abx/tdG2YSfXXjYnIrl6WGGu5fwTq3Nw4ttdktvHmmY0aPluAR6VPxkqT8KEiWt30pdZE/5akfRqVfbLqyZFJ41FALRbJe752cxGd5RJdcfDBzYLIpj3SNCp/yUkKhGOdfM2Nig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdIQ7J+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlZFU5wp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9bWBX254059
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F8zXM5n/Ky38SDCu1iW/JnWkDQ8dWlEoAId9HPk/6+M=; b=kdIQ7J+sPKSis0eu
	qtB+1DlhpbeYGGCnDOzniDK2f1sV0dK8E5OkpIsrrlKudmZ1rKhgE79w/Exe4pEa
	wLP68Ey945CQ9egxVoiBkWU+Z2Qy0BVpOFJzB0NUS21tnR4s6enWAfjIxiyIj9hQ
	GutFwXhYPJsf0ZejqqQwRe2DyATO3vsjBcrwgNFOnI3ggqF6dDKaafjXcnB9A45x
	cEbEbQj6dhE7+OI4TQLD2koHqljU78bxJrA2dt/CChlwPj7J3nF5oxxFtx9SoXjm
	8doSiGksLkOkUouHXecniGvOQBt1D04jQJxjjY1Io9xkQfOstfFMDx5cXkRpmQtl
	OQ60RA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8h87skxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:22:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9fe2d6793so85625795ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189744; x=1779794544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8zXM5n/Ky38SDCu1iW/JnWkDQ8dWlEoAId9HPk/6+M=;
        b=GlZFU5wpvB+bRP2kWH8G5NojRgdTnUj2Sw+H5mAqtYZSpVjoDnJEcRq6jZqIBLGH3m
         w85UNerJ/yd51pPEWXj2bWlA84H5kuiy2iZW8k3VF6wp9FVFg9gWS06vff6YN6nfibhI
         zoXvFhAPEmLBZ83Y56UYVKQiphkEiQcLCI0c4MgjZLDqkLVnNhKXdXtxptHQMxzRGSou
         Y333QSdjPgk2u+NkFi/SnfIfDpDY7ghIUTstlTKDbK+Z8kGmhUdncRy8XSN7ki9uOqWB
         pAEqQRTyo3pIHjkYOjd1J1p5GGbnNzae8hE6yWspVqrA1Fpat8r91NUNiQ/TCydWH0up
         CXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189744; x=1779794544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F8zXM5n/Ky38SDCu1iW/JnWkDQ8dWlEoAId9HPk/6+M=;
        b=VP4Ad38vpA8VVMP7AxH+a62RJeo7g+Z5c9SKWFL2ai6D2X7Zy9Fubg/zKZlDcB4Nqd
         7GMuEkA+vzTnbhcterUuD+ch5MhZE1c57hZ8v2pd7xm20HZgE2M6o2nZPbLOTj9Ud9iE
         E5mlPlNeF+1bUpI3TqhmZvwqmEBEwpKcpVPPpQY8jdJ5hE1qU5T4U4ZeA607/Edct1sl
         tFIPnetD5qv28C9c07ZO6ZkajiKXTIol89Y3u37rRB38nEQs6CjsgD4Z+1q5FYP/6PVb
         CYpSQ6VJM4jl1y5uLobbsCSOCF4y09T3c0BkrtSSMu/UUoDE2tL2wOVBvYCAv8S30oR/
         pOEw==
X-Gm-Message-State: AOJu0YzIkCHrfitaPJqO1l/Kc4p24CZKg8/zq920aDgkIWaKNkgYdcQa
	Q3LwKGb6NJ2LqAwiqwIVNP/kgOuw8pkUew8ZHXJ2ioEsP8vS/o4zz/F5xyVtdGC4cPQOue6urdD
	1yXMX1RJ9J3gRB43LUzbvoMUvLw6ir8z5FpJiQiG5/KdZp401IRuWrXhyhAskbkkETTWu2zQ8Zf
	lE
X-Gm-Gg: Acq92OElUJgBczSda98FTzBzfwqSRdgc/ez8yajGvfGFVq6YkKA4FdZmZUg87AroqDQ
	+y1XcrornxeqHaHNQlZuDKq5iUBgTE4B4/rtYkRM/Zlk2dUB34iRdOalZRaEutJu/6hNjQZpdYr
	+3o8YnBvBKDiHQicuVMKbCC2FoIYatV7zYszHJC/HqJ3cvcm+IjFAw7PGm7IIH2XBUnGELmSgNI
	gYLmusP8YHizFs8SNaTiOuyAerJ4n5oWr1HSL8n7Rl8DpFiU6N4inAIAzCHw2W5cfSlCJhMnqQt
	+SyeMe8SL7pzYR+Sv03ojs2U5HyPKQrWbm7/Lhe8A7CjLxy8wqeyKKvGDoEa2+uC/WtBovCUm9T
	at2yCOuX4yfcne7/tJIocx2UC5ZxOw5c1rnMM
X-Received: by 2002:a17:903:15c7:b0:2bd:e5d4:dc63 with SMTP id d9443c01a7336-2bde5d4dddfmr93412345ad.26.1779189743636;
        Tue, 19 May 2026 04:22:23 -0700 (PDT)
X-Received: by 2002:a17:903:15c7:b0:2bd:e5d4:dc63 with SMTP id d9443c01a7336-2bde5d4dddfmr93411975ad.26.1779189743113;
        Tue, 19 May 2026 04:22:23 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe78b9sm192743605ad.43.2026.05.19.04.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:22:22 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:51:25 +0530
Subject: [PATCH v2 5/5] arm64: dts: qcom: Add Shikra EVK boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-shikra-dt-v2-5-c01b90fb4395@oss.qualcomm.com>
References: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
In-Reply-To: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779189702; l=7354;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ap6K6k+El5tekEdZ0WngKg85WSbPGb7xvWPETREbYMs=;
 b=BL5R2cYROSTNoSWRlEWSIDuNeVH8iehb72h9ietIocAXf1LTsj8Hu7tk5/FTrSlUS08YYCdjM
 5ajch33RejfA7R+UnSKgjCJPqWyaQXgDoQUXnym5ehqjR1nrRTi2wYc
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: rfqjzlAhCc83LoZQlTOAvDUCwCQm5SGw
X-Proofpoint-ORIG-GUID: rfqjzlAhCc83LoZQlTOAvDUCwCQm5SGw
X-Authority-Analysis: v=2.4 cv=a9sAM0SF c=1 sm=1 tr=0 ts=6a0c47f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=UVWtEavHwLwq9t59c2IA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMiBTYWx0ZWRfX/f15uoBLbXHf
 RpqQPBUyV+9F/ET4IEPz74lMK0Y5MfK+Yi2I9YpbGzxQ8tXG+lcO7PSe8oGXUOfle25lY6Buqii
 BpnqS/9R6n+ZOnMcQvd7qzQbk0RJCu6v1pS0LtNZaIv6hZPo2E0m9UmW7kcBQa7fUmvtS7fyAZR
 L47WZVGe4oNQuKXa1EWjAkvZ9KG02XTdEkwpUSvKZHVgtYfi2wqT0gqP0ItFb9TI1XEfvGitYvm
 kmYrul1fq9z5jhEO/1HUat9sxofi1c/679GE4rcjC4c9NaK1Jj9ydQpQMeGZI+f+gKxJ/XyKXlR
 2jgZpQY2YqaYYpjol4yQWVDZNvv6ACuWa04TtLPxC1Kev9TSlf12YaloOdAH+L3k7uyFFTFy+jG
 ZQqBk/wELMGaAw1efE09R45WRXQAezHs2qqumiIgHmg22U3qnEdxg2SOVVbpFrwIELBGxiFvuLt
 KKvsltAq1zdIVnRImyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108477-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3264457E043
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device trees for the Shikra EVK platform, which combines each
of Shikra SoM variant with a common carrier board.

Three EVK boards are introduced:
  - shikra-cqm-evk.dts: pairs with CQ2390M SoM (retail, with modem)
  - shikra-cqs-evk.dts: pairs with CQ2390S SoM (retail, no modem support)
  - shikra-iqs-evk.dts: pairs with IQ2390S SoM (industrial, without modem)

Also add shikra-evk.dtsi, it represents the common carrier-board and
daughter-card configuration shared across all Shikra EVK variants.

Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Co-developed-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |  3 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 61 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 61 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 14 +++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 61 +++++++++++++++++++++++++++++
 5 files changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 795cee4757ab..3801f280c8cc 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -333,6 +333,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-huawei-matebook-e-2019.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
new file mode 100644
index 000000000000..12eeca84832c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "shikra-cqm-som.dtsi"
+#include "shikra-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Shikra CQM EVK";
+	compatible = "qcom,shikra-cqm-evk", "qcom,shikra-cqm-som", "qcom,shikra";
+	chassis-type = "embedded";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm4125_l20>;
+	vqmmc-supply = <&pm4125_l14>;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
new file mode 100644
index 000000000000..ee460d8c6a87
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "shikra-cqm-som.dtsi"
+#include "shikra-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
+	compatible = "qcom,shikra-cqs-evk", "qcom,shikra-cqs-som", "qcom,shikra";
+	chassis-type = "embedded";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm4125_l20>;
+	vqmmc-supply = <&pm4125_l14>;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
new file mode 100644
index 000000000000..8b03d4eafa6d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+&qupv3_0 {
+	firmware-name = "qcom/shikra/qupv3fw.elf";
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
new file mode 100644
index 000000000000..096283ed9b1a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "shikra-iqs-som.dtsi"
+#include "shikra-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
+	compatible = "qcom,shikra-iqs-evk", "qcom,shikra-iqs-som", "qcom,shikra";
+	chassis-type = "embedded";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8150_l17>;
+	vqmmc-supply = <&pm8150_s4>;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};

-- 
2.34.1


