Return-Path: <linux-arm-msm+bounces-118099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cPS+K3D4T2o6rQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:37:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1425D7350FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:37:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ocULjT97;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R6vk+2kE;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118099-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118099-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1126530120F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 19:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C9D2D47FF;
	Thu,  9 Jul 2026 19:37:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0443C062F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 19:37:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625831; cv=none; b=CgRdiQ5CAceTbBD8zHGCovUyic9AGrxs4RMFZefuY3MiE0qaymgvIe13hjPUE2n9oLjRS12aJc+o1NXPdK+qbHJi6Ut+0duM/8M2kNhyCgnk7t6O9M0IGHHGPwjQtDcbaftSHD4TuPybqW2/xwhQ8basxpEYB9VTzC8M30SjgDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625831; c=relaxed/simple;
	bh=NwkqOPZThY3EP6npn6cBCU5ORPjGyqb/JKGlYfmXsR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rMvPX9ZXq6y8W16jTDWurUvBQModHY69LIpvPq9N3WHt7nnFkWUn9BM7bunArjBVobArsPvdHSyTcRqp5Ak6zxx1lRRawpy0lmCCl5lHhQ9w8zjJg/GPi7Hw2yzmFR/PTW5pe+xotuwy07m45FvWAWEC2OAsF/6qag+OFBHeJM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocULjT97; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6vk+2kE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXdig2475553
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 19:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlhIThoKhWV0NGGXTdce+TDsYV+ZJZQiQf8v+8Efj/I=; b=ocULjT976cnMtZJq
	ejlh4lx7n0P30nR1lwYcZqw7DLHU3zUXwhu+UU+6fIeSpoDXTJ1u9B6qUSevu+YO
	JiQLZ70wEksOlHI3kmfM96nYKt8BrMwPc+IorazNyuCpN6NcGBN+GxYRP5Mx5IU4
	sQ/pxqH1Sm/p9Uv4gLpeL5o4zlP2+q/Aq+trZOjQZNF8ui5QwgyfAg3WLYyyiDb6
	Ou1L23X6RKkJm83KK6MIjeWVsZoOWLACVvOHu6lWhre8DrewUzpwL8VAjDd1jBJF
	KTXQ5F3fdA8O/Kj5pVpJVgJgWrrdxm9Hs2H9fIWXyln5LxzFMLpLPZPSGQmvXDIn
	ENQzMg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5mrvvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:37:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-970cc72ccd4so647868241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625828; x=1784230628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlhIThoKhWV0NGGXTdce+TDsYV+ZJZQiQf8v+8Efj/I=;
        b=R6vk+2kEQzxVpH2owoYyWyAyzdzi2icfwVoZRkNDFy/ZpqfS5717AwbV24bLNFg2yC
         bsc7L8FMDNHkUdMqQLA2a1PDbnR2ttkEqEBS2wbuqc0VAawakB2KwRQAzkd1AULo4z4P
         ObJHOKjflSoIwyLhezFgxkb/2NXa5AM6Fgm0sHtvtyXsLmCe5v/PO+vm9paMm1L0TXnp
         FFREPKwjQcOGzCrFkjyQn5ouRToHPZuhWd5zLvri5MqYvOX/4FRIplngw+WdtfFChsNg
         jnozEGa8MVZAcKFa2N1dA6s/2X1FXyuugRcrZ9Ecbx7GCMOuZOsRx3kM6vbGrbePERbf
         Wl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625828; x=1784230628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlhIThoKhWV0NGGXTdce+TDsYV+ZJZQiQf8v+8Efj/I=;
        b=CPDyw1SqfYoJ9vhWHkL1205DQoUe283v3STpZluJz9edFYcC3ZoLezR/BCVyHrrLw+
         vIsTa5iBkNKfMe772x3ITLERduaEyoTLHD+6ciBaD5ogSRNU4G7MDGylm3oS/pGzRMOJ
         fP3pDNM+nWrHQR8HAblevZgzvwBh6MwF/8PZrJNQXEaGi9M+V3cFdfjZRc4N8AkeLQzH
         fcDE0F6D25JbNWVVbh+5VgjgUvO3+yHMr3oEoZbTUK0Kfl88wOfRbVz3llx7p4S8Sw16
         FY3g3UuZhgiKO7x/Hnd5daoKFDqeWT5a7a792WVroxshTkIjV7JfuJ04DDRFvku+tT61
         9dcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrk5mZ7D/zEgD1yx/FB41oTol47WQlMyIWIa2ulJnQsgKztmfHw3T9BKxvVyR9j8uCuUWjKFzrPN0R839vN@vger.kernel.org
X-Gm-Message-State: AOJu0YzmpKa0yQUDI3a8xj74hjiz9+83pl+nXvsN8KrQ3bYm1KzmQ7e8
	1Adhwdp4+Hi5WzRCerP7LAZQMGmFD9YLeY5qJIJZkdVAjqjcZ2rxPHFUrJ6dgrKSGRxx7IqbdqO
	6bSscZi3vnkGf/x/qvT/eZl19iOzf9npkqD7tlSUw+IwsbvKQsP3gi9n3920uaxJSaJl7//lSi8
	DR
X-Gm-Gg: AfdE7cn3/GhRvbTTdIqAsEbY/XNqEzNfsEVT9vQRWsg9pCCR74nQ3sgUv+NROiwS3Dd
	rk0S3BDoc/Vo0+SL/xNcj8V+HaeJG/54cPehYu6YxFojMSbbzFGc4ZxrmNzPN8j+y/heNI6VgpO
	xEtsGQFV1Enrqh6nW17x6HvzB5Vew7+S+PElGt3s7mnLwDWrmrFT9L4pcQbp2oo/WyYIi7QUBR/
	4TTMFet0cswTDRqGI5SRTDAoDUwm3p9OsY+0nsCfIJNTB87j3cq8AelJELBnyeP+/jKfSQynxpq
	npM9sNoXF+HBFGYrkZL0+E5HUe5LTWqGVRZzKJGqmllCOksR0MD+tX9WMHBn8WpunRvM7bgT+oo
	BIUPBe+fHroY1iUuHVadSudThgUdvHnhs10TxwjRo5UYjDYhLbwQZ4N7cvxDMx+Cw92n1S61GGE
	skN2SC9MmISyH2eWV6odSpLcLN
X-Received: by 2002:a05:6102:610f:20b0:738:8b5c:a41a with SMTP id ada2fe7eead31-7450cb34f7dmr321023137.18.1783625828483;
        Thu, 09 Jul 2026 12:37:08 -0700 (PDT)
X-Received: by 2002:a05:6102:610f:20b0:738:8b5c:a41a with SMTP id ada2fe7eead31-7450cb34f7dmr321005137.18.1783625828004;
        Thu, 09 Jul 2026 12:37:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 22:36:59 +0300
Subject: [PATCH 2/9] media: iris: account for UBWC extradata in the QC08C
 buffer size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-vp8-v1-2-6af3ab578a7c@oss.qualcomm.com>
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NwkqOPZThY3EP6npn6cBCU5ORPjGyqb/JKGlYfmXsR4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT/hd2wUbJLMz2y2ia77Ja/8crI7gIJWNgvBPc
 MC+OSh4UD+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak/4XQAKCRCLPIo+Aiko
 1f9bCACMWUAIHbrxOy4QMybUCjRbEHG9i0ftbno7urPW6GlLutaHvjlw7B77uUUmc1UnfOv/tjN
 UccOWS94kszuqh6QEQWUm2Cgb+IDUxiL3z4zqH1ispz6RAdk2oHvL12gdyRjrjG7kkyX7zuE9ne
 3AoRiWcdAQVJVjua8L5csIBH3MqE9r1kAayQHEPTxKiRC8ph7T9Xsnubqn5M4VYzAFiUTxtOYX+
 fj4mZqEMyvLHag2Kyt/Yns1/+TyzcvpTdcAhKkSHi6YQpSdxhnmGLw0Df/ZH1eNxY3S3h9wyMPU
 wJ1ja8voIW+slmsPBKC4hi13+IgCnaU4nBxj+L3xy/CCQiQA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5MCbUgPFtz79CAAWqjfSQoMdEnIpmYgw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX+XOEsHN1F0vR
 0wnLWhFaaux6NczTgyYWSZNM4QN1ROzHHga/5EHvs/3l2QaOGD+3kIAzgSXhuJ+3ekxoV5o0ZXR
 GqvnsF/5Day9WGZwAO7ywOKy23xyBEg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX7up64sjBNRIW
 clb0Red+9DQkD9c6oQEBHsUGtq8z6TD6OSvvRaE39rVpZPHnT7sf+azJEH9aVZdAgXhmqnrrr2w
 1h5ktUUFdPkSIIJyN5moRCal+rNwjPqX5DKX70KKgJdlTheHF/NHc45B8dt7vlck/tJ/WVvNDPw
 YaqbGKNOG1DGs/+MChlM3Hb9T6ocLy3aZKpR6rLzPnfNRcGvjPenrTCTdfnbQT2WtSExflvVgvP
 gAyweJDi8RNpGZEC7LeAPLvQ3pNoVp8Ueu/FUdotGDdk48ZWutMYqIzrDb5+t+yzTQAJz2T5Pb/
 7TTGwBVoq8b3Tm51VBQic+0DTYnHKwFPCmvnBBF0hUur1N37vhpa8x4OIWCpNslpgvWlHMH/kYL
 0O4gBU3MTPVdV2dZX3f1sT14hzpYUJSjFS5gNYEluDCAX8xKnHZjxMgSLOZGNQJSFimL0r1eCmo
 CefbjxgHySYohAEK7YA==
X-Proofpoint-GUID: 5MCbUgPFtz79CAAWqjfSQoMdEnIpmYgw
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a4ff865 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=sREgFY7xmtrZiFTpSfQA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090194
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118099-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1425D7350FA

iris_yuv_buffer_size_qc08c() sums only the luma/chroma data and metadata
planes. The UBWC engine additionally writes a trailing extradata/scratch
region below the frame, so the computed size is too small for the
reconstruction (DPB) buffer. When the firmware writes that trailing region
it overruns the buffer and triggers an IOMMU fault; this is hit when
decoding interlaced content, where the reconstruction buffers are packed
with a gap after each buffer.

Add the trailing region to the buffer size, sized as the venus driver does
(max of 16K and 48 luma lines).

Fixes: cfd71b14b0d6 ("media: iris: Add support for QC08C format for decoder")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 246ad0abbac3..f1de4442be1f 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -261,7 +261,8 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
 	uv_plane = ALIGN(uv_stride * ALIGN(f->fmt.pix_mp.height / 2, UV_SCANLINE_ALIGN_QC08C),
 			 PIXELS_4K);
 
-	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
+	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane +
+		     max_t(u32, SZ_16K, y_stride * 48), PIXELS_4K);
 }
 
 /*

-- 
2.47.3


