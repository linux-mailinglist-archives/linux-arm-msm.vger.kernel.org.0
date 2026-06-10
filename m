Return-Path: <linux-arm-msm+bounces-112312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SyXWFWQGKWoBPAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:38:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 096E3666535
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:38:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=g35Zk0vg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YnZKO2xe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112312-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112312-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4774B304F2CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 06:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544B03806B4;
	Wed, 10 Jun 2026 06:31:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874B13812DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:31:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073085; cv=none; b=rSh7RxF5bZVyjCqQc/otXYzbfj5rxsTWpa9p4h6qrg3fcZyXdZtKh27PZx5jCwUGjcZqzQwZ+gk7R1Ixt1liQw2mZCs7JIt/+2RAfpfK7xb9mpG7QX9jjTGUp0alxAyKqDxdzgbXmcARGmxwPO+dTbCIZWJ0QnYbt1aKNv8nYJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073085; c=relaxed/simple;
	bh=rcTcJpE3yUY0hhm6BFw1uxVSjJS5mYu2YiKIJn49g0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fTefOpJXBk6oHb/SQeTlqO9j6vIshoHSEQzY/8BckoH+S4YVVKxUpQ4BF4u2IjNqMYi5ZXgIBa11V9hrOCjjdjWf4MVotAtYJ+OkBzpBVzy2+RaKJ5tj5ndrcSFXg7deekXA8bQhe6zsiqP5JabkjxlsAgUKZWYXsjjpZtaRI/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g35Zk0vg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YnZKO2xe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2efJH4061452
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+ow6PHZ38D9xAFsmHnbWI7u94qafZAXWP1UyjrDZ+Q=; b=g35Zk0vg7iU/BpzS
	O5fKtCwwjUn3F8hCEF6VYLiqgzBcnu7oWGR2asiGBQcnYKEjVipGP/7yzrQZ3eM2
	8B95PiK2sL7F9LGm7e7TgDFoCeWOi3zwgpxEsFaMFeSvNRO8VqEB4XssLnguYbMS
	tAkgYvjhVXiutHWRtlA3avOe8jmjJU8DkYOhxNdYVyR4ZledzZtxXdYk8Nxj6YoS
	0TV7Pzp8TBROhEHRez70cpA++EbSnut76wNcBGsMIqG546VM5nXrbua0Lpwym4h7
	au3K0cZ/ycj+0PlanW0TVXx83i+TCBdPNhKpx6DWRVtHPe8IioKelXqxe5kCtoyX
	GhdPxA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2h1ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:31:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d99181eaaso8609065a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 23:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073080; x=1781677880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+ow6PHZ38D9xAFsmHnbWI7u94qafZAXWP1UyjrDZ+Q=;
        b=YnZKO2xepJ94EdpCeuPKJw0i6lgzH/vy6Q+Km8SU58mOt8X4n8+SDBNMZD8RZum+ak
         ptCLlGAhJ0aJkYa9TR/2NRQwVqhpdKwQ1oReHpVpl9QrAOnJZTtiu6zZCBmF+bEv9crx
         QOALraDJbiDTQ3dt+YPvN6IDD0ooANnv/35m3UWPAQG6t1cQf3K31fsnshiDblvaMmzM
         m6jjnyNU8gXwxY7lC9GCtskm82X2v8kfqKAH0V2CXeP9y7nVGvjxSjTOHXtootnzvjm9
         sX7u1kvZIo3RqbiovLDztK43hoOKgV0g7QRv45BRD9FevF5AdoARnHAdI00R6uc0JPD3
         la6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073080; x=1781677880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P+ow6PHZ38D9xAFsmHnbWI7u94qafZAXWP1UyjrDZ+Q=;
        b=awPYPmp5aMbgpaCDFoyAYtk3Uo2Cv0ozcu/2tTJxQ4WbfpK7hyjZlehPpyzP3eKFKD
         ZP43DhBljCSmmmpUKXLiCuXy+ncfU9Q8kve+8r/7N06kQgHjIBr0HgttXMZ+0wgsa9zh
         OlMXBhY8npAMvy5a6pEikmvLcYXGk7CHsEJXaynMTWvfpbImVQo6SvSSKIKBf5NRqLEO
         jDuRZz5F/KDN568Dyx0RyS+0uaBPtu/dMTtWIxGtOSmim9CZ+rrFAonKdF0wv4GPRV1c
         9Ab5o1H1F13VIlQSwkgVMDRGuJ/0+MexxaiGNbMIFW01RmjND8Sg/OoCz+cwSK1P5wnV
         VGsA==
X-Forwarded-Encrypted: i=1; AFNElJ8bhc7ZDG9rWZRX0LR/qD4noN5eya7/oSo6f8ShEVtwanCXFFyjK59s0+t+kSzYrckmbWfZ0a/zqwkc9Hpt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3HRxgy0usRisSffmIxGkmFFLTQRBNytUZMx9lNaWFyupPvvyC
	M+mvaC86SrzeNawGnjH2o+ee9j7IJisAzacU843sojJOXAZ9tQU2yCzOBTcM6NebgVipcDbb+Sr
	7+xym0nb6EY+ojj2iwRet3YkN6BccdBIbNoJl6KS2apga2XRWYmuEFNBOr9HW2iTRzmB2
X-Gm-Gg: Acq92OHKd9A0MhW9JHvVgVupF+rkKoAz8nbNceC1aWuAdl71qthCpigPXanm0Hs+Xxt
	BLym5b2k1uIBImMitK9rR8l8vgxxX0QjVWj5Oj1ktcgaYR9Wmlt1wki7SmKrCGDb8d4fov3JbYS
	V+arocqWBSpYwVmbVzSdeDfXYsVZPByUTjtzT7Y4vyYwWPEqkwJamcXf2rpWoN9dxbadAMN3GMN
	D03xDEpCg+y2V0lMq6BQ/KTg+b6UCRYKpSlRTWbPuRHNOng5jOQMkGN/FI5w0nrTAXZ2A/ephYo
	CTyjcAsYcBdTFEmp8TqWMnLNUmRTvapbRZRqa58gLVEDfeKeuKtlTsVmSuKhk04rAdY75G3kH6L
	AhiiBzoETvahXczJd7yxgWX1YQiso/uL5xPIIwsbETSc6SMMXB3XjCRt9dBJRKCfyMQ==
X-Received: by 2002:a17:90b:554c:b0:36b:9512:871b with SMTP id 98e67ed59e1d1-370eed0b682mr26380337a91.11.1781073079604;
        Tue, 09 Jun 2026 23:31:19 -0700 (PDT)
X-Received: by 2002:a17:90b:554c:b0:36b:9512:871b with SMTP id 98e67ed59e1d1-370eed0b682mr26380303a91.11.1781073079201;
        Tue, 09 Jun 2026 23:31:19 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:31:18 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:47 +0530
Subject: [PATCH v8 11/12] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-11-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=4698;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=rcTcJpE3yUY0hhm6BFw1uxVSjJS5mYu2YiKIJn49g0c=;
 b=WLhP8dSPtgIXOpJAAOfN4Xjiqv7drSdsGLGTvi/pe6540Dq+YvtPdOTo94ABMC+6O06SodSdE
 TyO/p/kkdw3CR/q7PKW41DuU4ilUyX2ad2si7+64vdkTC0ttH9MZi3V
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a2904b8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=scTG0D64rx7uByHHbCoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX3i/pBq53ut9X
 HzjDC2Kqw6wLpEdLUMGJ+3Bo23T3uLTKfhqdc9Njfnpj+qkc7k0dGCa/tPqriTf412eyFjI23Ky
 t3DpyeQEPUyUn9nFWXiX/UMkerPnTVGfZCdlshKMR6kCxw1J7moAmvsnazrS0iYbecGkQPSITtL
 LSbEaVgSXIz2d1g8mQ1zmgwc85pkhdYgE3TVAZjAHE/+YeNXaeRd4eGNqGFsyg0Qyg8O+7kMPFh
 t6U063faIh7FXUKMsyfJTNXA9guwFwJ5kTS1Z0vN6mqUBBaM5LawkSXEotFoF3L8AMtj9Omat2S
 EHcn8JrDr32lY192O9ImydAll+TAPiPwx3xAmBJIelOrm2UjX4F5zTSmml8I15JtMWCt9bK946n
 D1UsqQbh31+kntD3zkeRRAX1fxfiMHGWhQxuSx0Jjq6+C3nOJvoK3ubQAnFQYGAJqeJ8N0A0L5r
 MXwNqjiUvtC12g9rywg==
X-Proofpoint-ORIG-GUID: wvmtwN8CsNJoO8MjTEXkAog5EmiRchpq
X-Proofpoint-GUID: wvmtwN8CsNJoO8MjTEXkAog5EmiRchpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112312-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 096E3666535

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..42bcd03c4d3e 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/media/qcom,glymur-iris.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -4788,6 +4789,123 @@ mdss_dp3_out: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0xaa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "core_iface",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec0_iface",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec1_iface",
+				      "vcodec1_core",
+				      "vcodec1_core_freerun";
+
+			dma-coherent;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&apps_smmu 0x1940 0x0>,
+				 <&apps_smmu 0x1943 0x0>,
+				 <&apps_smmu 0x1944 0x0>,
+				 <&apps_smmu 0x19e0 0x0>;
+
+			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vcodec1";
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "core_bus",
+				      "vcodec0_bus",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec1_bus",
+				      "vcodec1_core";
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable on boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;

-- 
2.34.1


