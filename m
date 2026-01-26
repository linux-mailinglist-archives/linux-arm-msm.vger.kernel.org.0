Return-Path: <linux-arm-msm+bounces-90478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KH7CLf7MdmktWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 03:10:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F0C836B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 03:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 71AE33002B5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 02:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158D2225413;
	Mon, 26 Jan 2026 02:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ngULxMQf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8cj6ydz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B50620DD51
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769393392; cv=none; b=DP5diTj2nRc3vmjc8WnR+gKyhTEVWsicuzcl6kju+yUQf8UKkHyA1Q2SNT8g5dHW4buSlGY2VYTIM/i4ptdzLwZgx46eDiwS5XeMU2K1FkHdDl0aaG4JcU9DVFUqz9b/xwPRlsycTr64xH+qnbcHpJ0dt1UWKgb3iMqACzwT0Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769393392; c=relaxed/simple;
	bh=vHxga/uSYViZ719FSLl/RswfKHr2CDa4nNQE5M69E3g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BSfEtxj05TpG2EgW20m+sR53heV7ORb3wqQbpRzHaimaUv6Tf6nH/CuiNip7qyqmNf9Qk2MO3J0bR8zuj/+k4KmYDO1luHK7oWeUERo8kTGcXU9oOHqXEVlLtmCUiwpsrDgblrFQmRx9chRU0ywa44vld+zPcqaScPUMkzkJGYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ngULxMQf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8cj6ydz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PLKXqi762743
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aDH3OZOrhFiB8qZUJYQrPC
	gbLEM5wp2a86h0yLVbzqo=; b=ngULxMQfRw0E28p73sVzwCddedmuqR7NnsnW9I
	W5gsveAXn9BeLAqd1aWyuAGf4tCYbOgiyk26OK5Aztl1IPbK/qqVm1KMf4IRxIKO
	wEQ1aC7V4/FyQO0+Qt7JC0D/Qln/NeanM773iQNnE9KTfaDhOvspIEFbtBgLoyNn
	aAcLGDc7o3dWJL9QH9QutAcnU9VBJ5xK3M5L4JKie2rxeFO89sUKnNpr8eidoTY6
	OKvq7bYp2ULE2HcSikaF7+SmLVpUuaRxR7/O1xmtHgOEw+fjDNCZneWS8NkdQDWl
	uMUGqNF2tVX4FXUJwkPu/z+X4NBGpj9HkoNuRmPxAAEMwsQg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f32ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:09:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c277fe676eso1187536585a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 18:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769393383; x=1769998183; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aDH3OZOrhFiB8qZUJYQrPCgbLEM5wp2a86h0yLVbzqo=;
        b=L8cj6ydz99vIQriE6wfVk9Da84WAPxoSq/RlapFzkrZvcdCo4xI2UcIGNDqCES8Tnx
         nVPSuHdKcO11Py75P6Fnx2nJLbZnDs8vkhoE5GtJBpHtA8bsMeRhEj2evnPxCX6b+sK3
         1suAVF+qLZkgB8jDBJTsgZHIsTFs2jhVj9z/njp9zNmNQfJl16sETcd52ooSc1DOiOzs
         B1CvhhHm17XJFjTR6Ba4nv8mthhujhg6ZloJFDqMUzdLE8Mmabqr8MsG0W3jgxBCyN3k
         wwEC1uUJpC5Pe0SNrWLpKWKNCzwzSbTKK+jZzIJjrjW5zv/h4bxoeffdQzVNBPD/RT95
         ekZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769393383; x=1769998183;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDH3OZOrhFiB8qZUJYQrPCgbLEM5wp2a86h0yLVbzqo=;
        b=JB3csGpm+q06oPfJFgqKKWYzEe5qFmDfaxqM2uQHEZlo0mcj4pv2A6sJ4nYVixiQ7K
         rbtkKIQd+A7j95vh1tAongv661wT4TNDyuft+n30vv8BPogMz0VQRCc0a2+14Z60KGFj
         2x2mERWcWb3DTBI398synLd6lnRj+5xMIt3tmjoAnNI7nhBgDtEGAHM70E80QI/UdFIB
         WD5BPls5nvSd0p+aWYzLvYqWzq/vnb44Zc3aOJ8OE8NI3L4voDxdzhnt7cRJ5Hxf+Jig
         kem0D0UvumCgW5gTn8YPwtD7ldQov2ilblRePFm0QMM6lnuCclonA6tNZJXXY3dFVF46
         Pjxg==
X-Forwarded-Encrypted: i=1; AJvYcCUznYXlTgoEgydSivr317dNZLrcc2KTovz194JPNvbXw4aiQrUVB2CrGswib3RX3DHKN6lh11nLqIVdzauf@vger.kernel.org
X-Gm-Message-State: AOJu0YwDUhaf9KBHreXutosltP3kCOthY/1syuKERSKOYc2lu//CGA5v
	XPIEA8mJUQOEXJP0zUcItK3ftIzsvlmcNukhCzICcSaU3Z24rt/OGh338tlZvk0Jh5YjxI4ldJM
	Bbx69DHhZZ/ysHie7jd/nAVJUqySdw+uij91TPO8kVAQhI/tCKbAD4ivNz4B74PJTWvHR
X-Gm-Gg: AZuq6aKjtyKIgaS8HW7cRg3iZI1hvsJzyVgCXTuCMi+nyKGXgOMCtcnFUoBwv54J/43
	I5IFLpNW2eMqIOcmWJBEL7RMGqD/ZGechYWSKGRyQsxyZY4TIbHR7PlBjNSNWsBsYtRp9KUolZS
	fvKhVBW0VenPj10yyS77l8PsRedL4XfTBVAmIi716xvkL2SvMZ07YAi6ES9tZ3HMP3wqpKjcz8Y
	QYe6UHRhhlDht3Nu+BPleGniCX8DQK3fXxT3HVhc5mA+xMePiWADx8WXOFDfSKr0UTsuXVQW4Xp
	jGwySI22IyDHLIupLt2FXcSbQwtOGdzQu5EEN2kDkf5LrCJjB/6ZKaz+88ibPhuLGC/gtQNN1iP
	JXMBqQdFeQoaVSuk6vZAA4DfHCbk0VEVERF4HQFjWk/Tw2yxU/ULJkTC/pCJfVwb8s2q8/uvobd
	WYmd/zSboTSQVHJJXbJdCMFqY=
X-Received: by 2002:a05:620a:2946:b0:8c0:ceb0:890a with SMTP id af79cd13be357-8c6f95853d9mr375529985a.16.1769393382368;
        Sun, 25 Jan 2026 18:09:42 -0800 (PST)
X-Received: by 2002:a05:620a:2946:b0:8c0:ceb0:890a with SMTP id af79cd13be357-8c6f95853d9mr375526485a.16.1769393381775;
        Sun, 25 Jan 2026 18:09:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9faed52sm22778201fa.2.2026.01.25.18.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 18:09:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/4] media: qcom: flip the switch between Venus and Iris
 drivers
Date: Mon, 26 Jan 2026 04:09:35 +0200
Message-Id: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/MdmkC/4WPzY7CMAyEX6XKmUB+tlHbE++BOKSpu7VEf4jT0
 BXi3dfQy972Ymkse76ZpyCICCSa4ikiZCScJxbmUIgw+OkbJHashVGm1FrXMsO0ksSIJPsbLpI
 emMIgu7L2tm+D81+t4OclQo/bx/hyZT0gpTn+fDhZv7f/WmYttaxKY13dOwfWnWei4331tzCP4
 5GHuL52VIT7ytHTzhOtJ5DvI0xNMcGWTqOnBFH8bcUllXFKG7WjKVSmUtvCyE5bbqJK65psGfL
 6BUwoy+YnAQAA
X-Change-ID: 20251119-venus-iris-flip-switch-d59a3fbc6a4b
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6822;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vHxga/uSYViZ719FSLl/RswfKHr2CDa4nNQE5M69E3g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdszjiK/YlDxKPnsGYLNafMx58TXYJxR6vJUMw
 53exppVHFuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXbM4wAKCRCLPIo+Aiko
 1eN0B/42lGlHJXv8C5Irm2AknE2C7snY3iZrkihTBz88mgUCj+/MO+DrRVmJQ8jrqZttFucza2P
 FwrjUFVMUMoVpPW1Zs8xtec3j7Gsu6UewzEQ+7eNASIuOItZ2a/oAu56g+nqa54RWKbega1fLdw
 Xl5Qc1hlPlgeefcE+fYwdq1uLDr0QPwzUGKl3csITWRyt8NB4jsKbVTKo1BF7/51w/e7u2TwswH
 x8QhFd2TO48iG0lR9fICcnqDH7LFmgoReeKsCO1cxF017xind0u72McSQmk260Am1x4k6YEL0UB
 vK6gW8Ej1mi64MdvX+wYrPzclDq5wxNHsg7KzOA29wbO14LJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=6976cce7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eXfWA5zK0X9Z4glz7VIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: L2JqLKRbUzj22jO3uUeoLyPb6QHrbA5B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDAxNyBTYWx0ZWRfX0ZH4K7080ZO5
 maNAPPNzhFNEyMoHhODFIMdWCERwbjZgYUFKXoh6a8clBiV6QYad0Irb7CaD245oXcXcGQeSlf1
 TZjs/IhMp1iB3RSDkRgkokHzCUZkdnNZMVK70HzkmhYyLoXlT4GYrU4j3WjhkY71j+PkGuL87SI
 I9ncDhL6v/CfMRLvLoSU66Wz4Lh6jqiD2rM7/wk2zmbM9t+y3lNqmzKamDkHrlOBJndDd42i9Cd
 qLO0xBD50OMxF3Zwr82gidFmY9AFVC2bL5BD1nCOODkzRs7FRwhIkOucV42jLuw8Slk2fkTdslW
 0Zcv0+2uFMDR8pKfmTnLNxnwX5nnPKdo3kdyYZIu8kOtzrrYgapJUzvsnFtrk3KYlRMPa0awu6I
 jq3Pw/XN73SM1u4ETOz69dZDEzeSTxizSqvysnqU2DEKlIsEpahct9ZVvnDzLJgeHSu0yPfLZgV
 O2uXmfPzlDHPjx6OFqA==
X-Proofpoint-ORIG-GUID: L2JqLKRbUzj22jO3uUeoLyPb6QHrbA5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-90478-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,out-h264.md:url,out-vp9.md:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9F0C836B8
X-Rspamd-Action: no action

As the Venus and Iris drivers are close to the "feature parity" for the
common platforms (SC7280, SM8250), in order to get more attention to
squashing bugs from the Iris driver, flip the switch and default to the
Iris driver if both are enabled. The Iris driver has several
regressions, but hopefully they can be fixed through the development
cycle by the respective team. Also it is better to fail the test than
crash the device (which Venus driver does a lot).

Note: then intention is to land this in 6.21, which might let us to
drop those platforms from the Venus driver in 6.22+.

Testing methodology: fluster test-suite, single-threaded mode, SM8250
device (RB5).

$ ./fluster.py r -j 1 -d  GStreamer-H.264-V4L2-Gst1.0 -s -so out-h264.md -ts JVT-AVC_V1
$ ./fluster.py r -j 1 -d  GStreamer-H.265-V4L2-Gst1.0 -s -so out-h265.md -ts JCT-VC-HEVC_V1
$ ./fluster.py r -j 1 -d  GStreamer-VP9-V4L2-Gst1.0 -s -so out-vp9.md

For H.264:

Only the main set was used on both platforms

On Venus pass 126/135
On Iris  pass 78/135

- Fail on Iris, but pass on Venus:
  cabac_mot_fld0_full, cabac_mot_mbaff0_full, cabac_mot_picaff0_full,
  CAFI1_SVA_C, CAMA1_Sony_C, cama1_vtc_c, cama2_vtc_b, cama3_vtc_b,
  CAMACI3_Sony_C, CAMASL3_Sony_B, CAMP_MOT_MBAFF_L30,
  CAMP_MOT_MBAFF_L31, CANLMA2_Sony_C, CANLMA3_Sony_C,
  cavlc_mot_fld0_full_B, cavlc_mot_mbaff0_full_B,
  cavlc_mot_picaff0_full_B, CVCANLMA2_Sony_C, CVFI1_Sony_D, CVFI1_SVA_C,
  CVFI2_Sony_H, CVFI2_SVA_C, CVMA1_Sony_D, CVMAPAQP3_Sony_E,
  CVMAQP2_Sony_G, CVMAQP3_Sony_D, CVMP_MOT_FLD_L30_B,
  CVMP_MOT_FRM_L31_B, CVNLFI1_Sony_C, CVNLFI2_Sony_H, FI1_Sony_E,
  MR9_BT_B, Sharp_MP_Field_1_B, Sharp_MP_Field_2_B, Sharp_MP_Field_3_B,
  Sharp_MP_PAFF_1r2, Sharp_MP_PAFF_2r

- Fail on Venus, but pass on Iris:
  BA3_SVA_C

For Venus several tests crash the firmware or crash the device,
so test-suite was executed with extra:

-sv CABREF3_Sand_D CAMANL1_TOSHIBA_B CAMA1_TOSHIBA_B \
  CAMA3_Sand_E CAMANL2_TOSHIBA_B CAMANL3_Sand_E CAPA1_TOSHIBA_B \
  CAPAMA3_Sand_F CVMA1_TOSHIBA_B CVMANL1_TOSHIBA_B CVMANL2_TOSHIBA_B \
  CVPA1_TOSHIBA_B

For H.265:

Only the main set was used on both platforms

On Venus pass 135/147
On Iris  pass 133/147

- Fail on Iris, but pass on Venus:
  INITQP_B_Main10_Sony_1, WP_A_MAIN10_Toshiba_3,
  WPP_A_ericsson_MAIN10_2, WPP_B_ericsson_MAIN10_2,
  WPP_C_ericsson_MAIN10_2, WPP_E_ericsson_MAIN10_2,
  WPP_F_ericsson_MAIN10_2

- Fail on Venus, but pass on Iris:
  ipcm_A_NEC_3, ipcm_B_NEC_3, ipcm_C_NEC_3, ipcm_D_NEC_3, ipcm_E_NEC_2,
  IPRED_B_Nokia_3, VPSSPSPPS_A_MainConcept_1

For VP9 codec:

On Venus pass 174/311
On Iris  pass 232/311

- Fail on Venus, but pass on Iris:
  vp90-2-05-resize.ivf, vp90-2-14-resize-10frames-fp-tiles-1-2-4-8,
  vp90-2-14-resize-10frames-fp-tiles-1-2,
  vp90-2-14-resize-10frames-fp-tiles-1-4,
  vp90-2-14-resize-10frames-fp-tiles-1-8,
  vp90-2-14-resize-10frames-fp-tiles-2-1,
  vp90-2-14-resize-10frames-fp-tiles-2-4,
  vp90-2-14-resize-10frames-fp-tiles-2-8,
  vp90-2-14-resize-10frames-fp-tiles-4-1,
  vp90-2-14-resize-10frames-fp-tiles-4-2,
  vp90-2-14-resize-10frames-fp-tiles-4-8,
  vp90-2-14-resize-10frames-fp-tiles-8-1,
  vp90-2-14-resize-10frames-fp-tiles-8-2,
  vp90-2-14-resize-10frames-fp-tiles-8-4-2-1,
  vp90-2-14-resize-10frames-fp-tiles-8-4, vp90-2-14-resize-fp-tiles-1-16,
  vp90-2-14-resize-fp-tiles-1-2-4-8-16, vp90-2-14-resize-fp-tiles-1-2,
  vp90-2-14-resize-fp-tiles-1-4, vp90-2-14-resize-fp-tiles-16-1,
  vp90-2-14-resize-fp-tiles-16-2, vp90-2-14-resize-fp-tiles-16-4,
  vp90-2-14-resize-fp-tiles-16-8-4-2-1, vp90-2-14-resize-fp-tiles-16-8,
  vp90-2-14-resize-fp-tiles-1-8, vp90-2-14-resize-fp-tiles-2-16,
  vp90-2-14-resize-fp-tiles-2-1, vp90-2-14-resize-fp-tiles-2-4,
  vp90-2-14-resize-fp-tiles-2-8, vp90-2-14-resize-fp-tiles-4-16,
  vp90-2-14-resize-fp-tiles-4-1, vp90-2-14-resize-fp-tiles-4-2,
  vp90-2-14-resize-fp-tiles-4-8, vp90-2-14-resize-fp-tiles-8-16,
  vp90-2-14-resize-fp-tiles-8-1, vp90-2-14-resize-fp-tiles-8-2,
  vp90-2-14-resize-fp-tiles-8-4, vp90-2-15-segkey,
  vp90-2-21-resize_inter_1280x720_5_1-2, vp90-2-21-resize_inter_1280x720_5_3-4,
  vp90-2-21-resize_inter_1280x720_7_1-2, vp90-2-21-resize_inter_1280x720_7_3-4,
  vp90-2-21-resize_inter_1920x1080_5_1-2,
  vp90-2-21-resize_inter_1920x1080_5_3-4,
  vp90-2-21-resize_inter_1920x1080_7_1-2,
  vp90-2-21-resize_inter_1920x1080_7_3-4,
  vp90-2-21-resize_inter_320x180_5_3-4, vp90-2-21-resize_inter_320x180_7_3-4,
  vp90-2-21-resize_inter_320x240_5_3-4, vp90-2-21-resize_inter_320x240_7_3-4,
  vp90-2-21-resize_inter_640x360_5_1-2, vp90-2-21-resize_inter_640x360_5_3-4,
  vp90-2-21-resize_inter_640x360_7_1-2, vp90-2-21-resize_inter_640x360_7_3-4,
  vp90-2-21-resize_inter_640x480_5_1-2, vp90-2-21-resize_inter_640x480_5_3-4,
  vp90-2-21-resize_inter_640x480_7_1-2, vp90-2-21-resize_inter_640x480_7_3-4

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Sorted out SC7280 Chromebook bindings (Stephan)
- Dropped most of ifdef from venus (Vikash, Konrad)
- Added testign results to the cover letter.
- Link to v1: https://lore.kernel.org/r/20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      arm64: dts: qcom: sc7280-chrome-common: disable Venus
      media: dt-bindings: qcom,sc7280-venus: drop non-PAS support
      media: dt-bindings: qcom-sc7180-venus: move video-firmware here
      media: qcom: venus: flip the venus/iris switch

 .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
 .../devicetree/bindings/media/qcom,sc7280-venus.yaml      | 10 ++--------
 .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi        | 11 -----------
 drivers/media/platform/qcom/iris/iris_probe.c             |  4 ----
 drivers/media/platform/qcom/venus/core.c                  |  6 ++++++
 drivers/media/platform/qcom/venus/core.h                  | 11 +++++++++++
 7 files changed, 34 insertions(+), 38 deletions(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b
prerequisite-change-id: 20260120-iris-sc8280xp-85d13bc60536:v3
prerequisite-patch-id: d34f95892aabfca4695d8b41c4001a23688e72ad
prerequisite-patch-id: 0dd97291d4aa94feb2e915a6a6324ac0031deca8
prerequisite-patch-id: 9de15d81588208683f296b6d48363226df41fbd6
prerequisite-patch-id: 6a89a4c1709b0b543a7d2a03954b7a628f549aa5
prerequisite-patch-id: 668a6b7fec7ed8302ab23c65ad76481be06847f6
prerequisite-patch-id: e423b8d12b47c7414e694625204977e37414ce4e
prerequisite-patch-id: e5be869bdd8a73b5c3d3407b1a47c66c944dc832

Best regards,
-- 
With best wishes
Dmitry


