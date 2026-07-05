Return-Path: <linux-arm-msm+bounces-116505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YdAUMzcPSmrJ9wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:00:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 471CE7094D3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:00:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=g785812M;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j97affMH;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116505-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116505-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F7A13006B0C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF14335A384;
	Sun,  5 Jul 2026 08:00:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993D365192
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:00:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238452; cv=none; b=mzwGM8NBHcz5u4OSVoMVjWF6S1kC2gwkMltoCGjX4t+To7FXxht8uRLH3tTX+Gi6LaDBkSrawiJSAMEh5dvrNXHGK/OnxCnj/2cJnAEGK3aXC97wXPV7QGf53crgL6rMReBWOz1GBRWodd85kwsjy8/VwjA7bQUPadL3gOdMjtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238452; c=relaxed/simple;
	bh=URQVb9Hu2fuzstaA7s+Dd/pLK/dbkCOd1kpmgoOBjng=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ut5X9HHImyhKaRcULZIZ67pcPwPF1KP+GjWO2VP767VJzlXrs1OK70lIUlJK+O+JI79pLx0Lpo+z8hvIO+P8oaOJGB+4MkLYgfYD/66EuTiFcvTscyLrQp56jWoEKmcof0G2PRYnvgITGUJd7G5OhfVEVNhFimfMBi/dJ+nKFlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g785812M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j97affMH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6655W9iE871676
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=64k8OwOX7AWdYCpKVex+ex
	yN30K4FzzL3yTqY9H2RBA=; b=g785812MkR0jeIIjz63it8ak8hMvZM23hCqxHL
	gAHw3y0GSU5IGzSsY9Lpyq5hDQM1iUrR3VIVHkI5EMkRn1WCYAOjN9DqbHyXNOnw
	b30ETVxc0qcs+HvO79XUz2kfOSqW5FmG2K2pCfdCRf2+qPoMoN1ocrj4DpNH5HuP
	+ckdGGd+ebrMBZz6AQ0SPXxi7KtfJCe6U/vEfPRVbB8ue4zM5vqJS5uuzPQIpT09
	I6kK4oO5obWjDAceULaMtaTmiUNjvrO9zw0XS+dYxXBCMgxukVlRPdiSWJJAaBhD
	FmpaGiSw2DWjUnQvlM0ljmJvXB5T72eCVAVgFDNayaM2ctEA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4ste09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:00:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so2720914a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238450; x=1783843250; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=64k8OwOX7AWdYCpKVex+exyN30K4FzzL3yTqY9H2RBA=;
        b=j97affMH8qRvKKd/Ku9F+LgQT4SnRpIZ/Ip+zijjbKZKGb4AWRr38zZb5VDXJOIi1F
         2HtcZPHYFpPXTLnUMarqbu40L85L0Ncw/q29yv640rNDFWuDDqa22i90U1oMkl6klQ7A
         bEv5a2u3HRJVtHtOCGF2hzzM4uqeDFJxEfvRJdN1KxDlHLUikCHMZiMIh6UmmqWQeatV
         xpDVdinL4eFRAN4hz8+DfyJjhj880MEfsb7uXwz/TFgmFNWguRXiQiGpGs7oWj+ylrvO
         cvJHbIZJLQW4vdCRH/aOHALssjTg7Jysl4HnroE+K8JrVcsMSMAbtM9YEtxhNDB9gF/l
         j7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238450; x=1783843250;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=64k8OwOX7AWdYCpKVex+exyN30K4FzzL3yTqY9H2RBA=;
        b=jn4txMtNlftnNvWWCSHN5SbBz/nUEw8b+BDwfcoyLCAXWUBqSFNyaCHxgi+oGhCwBD
         8n1w2Bnmxa9SYLyEYn2Je5vfvooVRwjpf/J2uykOq/zv1lyxYIgNEpuoiLQufIWtQtiV
         1uMUGH8LUMw3KNdtlz0vVUlhi8XhMySbn3J3wbe4mBCZ9c1OiFrQCiLWH9zFYtgQGE1I
         uDd+bk1PJ3J0fAiXtUVGF8cajwqMoEZRbsvpN4SMs9y/jB5mO1aC1eFTvk5mTr+p5mNC
         LoFE+xi49tb59m1RhXQW0btxpr1WeODeCQlCNX8xc5m3NVUQcIEuoHxTcC1EA+Qu9UJH
         n2IA==
X-Forwarded-Encrypted: i=1; AFNElJ8cN0GDf9Jo8w1HbR/B1tAP7zgxjylha2hTV30ok7x8nNB9YRcKYrQrSwDdnmNU3kdTl5nA7gLIGCp2vKRH@vger.kernel.org
X-Gm-Message-State: AOJu0YwTkcJ+lU1MRnqjyqyoC2f6FYc9k5gsQpI62nJPxN6z135rjwZX
	fuz2yfI5ubALTfOyYe0mgw4V1PK4tL3vUlWJkj2FGvvV4Z/l+pPS0iB1o2clBRfhfZAdgbBp6Wp
	8wBGtL9Y6S0gtroJK8QqQUZEsKTJNjlu8wp4Fyf33OhTcO1iIbwfHByAyBCEPiXrsYVeM
X-Gm-Gg: AfdE7cm92T2T1Vn8/E3Ki3cPMt/r3fSRp9RhQhsqCPrrceIhwOPLc2wwZnNFEsyj8xD
	EH5A3vYmHsPJ5e68yCxfX+Ghbo+SElm7gaP29mzGjyh3NVb8vxODpR0f6gKNV8ZoI2y4pD/6kEx
	padwfVSIrNptVlppmh7MNgSyYpOS+BX3EhXYhHdSdcJoqsTtpHIQLHRVYJxe9bi8eMqCI0/CbPB
	/zFVtZtSJehBk3rgaAsijNKMwOLps0MB9o5byIeu5n5YXKGyrMARXu4SEGmodAfh9thzL+vubk8
	+bAGguFTrJEKikBHzEjJ2L9grITk9PsCs3YTJwXgox+Rnm4enc2UAL/Pe6DLGXpK5cc407RCWsy
	+uZlufPhn5dr6CrwyMVIgIh0Ht9ywQLpMVw8=
X-Received: by 2002:a05:6a21:6e8f:b0:3bf:6c08:fb8e with SMTP id adf61e73a8af0-3c03e5916e2mr5801013637.48.1783238450011;
        Sun, 05 Jul 2026 01:00:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e8f:b0:3bf:6c08:fb8e with SMTP id adf61e73a8af0-3c03e5916e2mr5800919637.48.1783238448966;
        Sun, 05 Jul 2026 01:00:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:00:48 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/8] arm64: dts: qcom: Devicetree support for Kaanapali
 GPU
Date: Sun, 05 Jul 2026 13:30:04 +0530
Message-Id: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAQPSmoC/12OSQ6DMAxFr4K8rlESppZV71GxSIMLUcuUBESFu
 HtD2HVj6dn6z38DS0aThTLawNCirR56D+ISgWpl3xDq2jMIJnKWcoFvKXuJzThj7fCWX2XBeJI
 qIcBHRkMvvQbdozrZ0DR7qzuX8JSWUA1dp10Z9bQ6DOaCJXAEWm3dYL6hzsJDItyz/88LR4Y8I
 a5YoQTL2H2wNp5m+TnksR9Q7fv+A5p/DTXgAAAA
X-Change-ID: 20260412-kaana-gpu-dt-968a70134c22
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=2164;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=URQVb9Hu2fuzstaA7s+Dd/pLK/dbkCOd1kpmgoOBjng=;
 b=A5ueMO6pkv7W0jq9M8lYGlP/UQ+N8qJKQmdwVe3f2yDx/gBZObWVIlTiApffHVD2KMvafWnGI
 Wc6rXJ0SU5iDxoEkZ987rQGNfssS9UD+04+9JBd5Mg3XhOBdesECS7a
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX5Ov7E/cYUOqa
 XV4DMX+szict0eHUMbB4tlBodnO5PEngV0/TPZIx/HrXPquLTAkpFbq28rNvQ39u1Q/hrcnurb+
 uZ4iMUgCilWcbwFGNFP/nM74JICfWMs=
X-Proofpoint-ORIG-GUID: 5JXQrNCIJpIFCB3pkedtI3YHQAHsFkb8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfXzzEY262M4qbP
 HN5p/zNHzivCbi0FRRRLfhpgoyKt1K+JlLi3/ZXduYDRSYqezcDvlZRIPMExWMDQh0w0vECv1GA
 SH6Z6nsdrn4hVULhe3ZlWfSNWYoCHJgN+i8bL7eVxvYt4ETpdH8sOgOJwpemjFgODFBxwmEZQ/h
 61lBZH1Wit4Heg9rBaVYQKjsx8MqlwFCdOt7LrUiLr32r50hT6aL/JK6iGs/avxeeSdKE1zzbd7
 DVcctu5OPN2TsF4xXHoKmsh/cI6Niv7PeUK0RvHl66odcVJFdpjfUrKzakmahlv6JoUhyPZG6Qi
 5CHfXbfCZqSdUPxtAjbsCB7DY293qxknpLzdxlgPdMOeGwqll6T5Oys4ASHJ/VIhZUEecngyQ4b
 A/VQRUkMgLQF0YTxvwNa1yyBxd1F5tXMrtATDIgPRk7OGbT7Gx8ZSqgZDKeO/4wTiu0blaxg+9g
 FsgdY5FEjNb0QkvXERA==
X-Proofpoint-GUID: 5JXQrNCIJpIFCB3pkedtI3YHQAHsFkb8
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4a0f32 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RSuC8zd2ZDaJPqFJxW4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116505-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:akhilpo@oss.qualcomm.com,m:quic_qqzhou@quicinc.com,m:jingyi.wang@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 471CE7094D3

This series adds the necessary Device Tree bits to enable GPU support
on the Kaanapali-based devices. The Adreno 840 GPU present in Kaanapali
chipsets is based on the new Adreno A8x family of GPUs. It features a
new slice architecture with 3 slices, raytracing support and other
improvements.

This series includes patches that updates DT schema, add GPU SMMU,
GPU/GMU support, GPU cooling, and enables the GPU on Kaanapali MTP and
QRD platforms.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Fix formatting in DT patches (Dmitry/Konrad)
- Update cooling patch to lower the polling delay (Dmitry)
- Keep both passive and hot thermal trip points (Dmitry)
- Update GPU OPP table to match latest downstream version (Konrad)
- Add a new patch to allow HFI related structs to accomodate >16 GX levels
- Drop the smmu binding doc patch as it is already addressed in linux-next
- Link to v1: https://lore.kernel.org/r/20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com

---
Akhil P Oommen (5):
      drm/msm/a6xx: Increase HFI GX perf level limit to 24
      dt-bindings: display/msm: gpu: Document Adreno 840
      arm64: dts: qcom: Add GPU support for Kaanapali
      arm64: dts: qcom: kaanapali-mtp: Enable GPU
      arm64: dts: qcom: kaanapali-qrd: Enable GPU

Gaurav Kohli (1):
      arm64: dts: qcom: kaanapali: Add GPU cooling

Jingyi Wang (1):
      arm64: dts: qcom: kaanapali: Add QFPROM node

Qingqing Zhou (1):
      arm64: dts: qcom: kaanapali: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |   2 +
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   8 +
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |   8 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 461 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   7 +-
 6 files changed, 484 insertions(+), 4 deletions(-)
---
base-commit: b96de4afaea292f70aec05d40def1d993c04d71c
change-id: 20260412-kaana-gpu-dt-968a70134c22

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


