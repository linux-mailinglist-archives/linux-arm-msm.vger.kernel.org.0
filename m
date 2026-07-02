Return-Path: <linux-arm-msm+bounces-116094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qKXTKKSyRmpabwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:49:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F23416FC4C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:49:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CrNe5eLd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hGIQd1d1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116094-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116094-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE6C9307A301
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290AE342CB2;
	Thu,  2 Jul 2026 18:32:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20EE35AC2C
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:32:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017177; cv=none; b=MH50JmQRoOKJrATifm3KUCVH8HCguTx1JRKgcyIiRexg9xOhiI4SHgGKsWS5sUAcW4EsdsbRKbNH+z5+1BoS/ltbYB8sPd4yEP13SmKrSthBSnb5b4ALD89ufSweMzhShMlvGu1A8f/rfYpEnoiZpWc2e5GZzHKktt/sUIr9948=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017177; c=relaxed/simple;
	bh=vxhflPrOdaYGoxTfLfbwwZ5FG49sYTimGVlqDhNCwuE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lbU30iLxp8auOOVWcfocOQPiFpD3KXz7on2V2pUTomrCw2opO2hvzY0cm8hPaj6Iet1Z0e0Wc5VcYuZwPqohe3LHoKxKgSZ0DIkf3eoaDlJxi0Z5Hl5jXQY/IVkO56vPQayVjsVfV6+RsnVtHe2DZyfBLE8y9Ga3LReFgaj8Km0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CrNe5eLd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hGIQd1d1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3H7d645329
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VjOJXFQkKwF8skj3FkQ1tb
	bCkRos2qZQgHhQ/j0wxY8=; b=CrNe5eLdF9W4IjUKW7IivgvnJjAebPAE3iUUA1
	NsM0KOdSug77f5tPvjlXJ9wUiMLXde270TWprRK6GKeLYyDBL4yINbg30cbSFj4U
	2B53ZhV8chHWl/H8xjEgWxJ2QRq6iydh1IyvWxOSjKXKTB3i/FvesMZxY9NQVDuT
	6iCX4eM3DFrLzLky100Wt4frkwmeQm1bVbV4HFRpbFuJvaI5I31CSUXQ7Nd5qjuM
	EsVN/LOFqWysrreS9ox6s2R6HOWCYVoOhi6zYp4TOJ/NNH+cdHZVPhws970FdGJM
	lcMt6ALQG2nQXgi8EyWw70/p6qGiwgFHFyXPWNHTHLOneUqA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb3dne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:32:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1232548a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017172; x=1783621972; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VjOJXFQkKwF8skj3FkQ1tbbCkRos2qZQgHhQ/j0wxY8=;
        b=hGIQd1d1+oA53aA0uaV4Jgr7tXh3EmLkfNXfy7tomh0wSzUgCKz1eag7Gt4WIQD2jf
         CPNrER+Qw3Sj6cvJ0wL6q264wwr3ODyklMXB5ClF3X3yvRcluLJBwB4ZCGvcQaoXI9E8
         XIxjw0Q9d/1jUn/tOuT1T4ex/LUeYSyd052h2YAVb8/QfIoV1iC5Nbc/hmB8fjkUQAiw
         15k31dmttoWnUQjlSw2Yvh6gNueAh3zP21d5cspiNwozLa8MAHFs2wi7iVtGSaEaJ/pj
         B9aeT8s9Ys9EKWIy4cIHBNd/L+axZFwdmayWVdp+TCVD2+OD0bkzZihRwhHRFKKM07iI
         jncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017172; x=1783621972;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjOJXFQkKwF8skj3FkQ1tbbCkRos2qZQgHhQ/j0wxY8=;
        b=fb1p5wxm56nEzmqmabqhGRVi0ynsDKd97mSK9gT2XkN2YZuk19ckVxrWDy1dofWB2M
         MrUPDSVIl2l22ha0229td58T2o3AhBRieGw9QeozKJ3iSS/55Fx1dRo5n4/Lgv83EgNu
         cxrmUs2q0jdH+VsFESRAWqbLEWA0Hmn2IYdrO2L+dQ0QZL/9SsJAOAwYRxhGLk+diS9E
         uDesGOnLw6fQIbRBPGeuSsjeYQAYEQ0IkHmdyYYggjt5kOMy2ks/sKZMlU34QYVRAqJI
         UnVXkqHNuCV9spKLeI6cESbO8lvDbux29yJlfl1Iz89NlMuvD8ySvWfNGJ3kVaWhqB1r
         oFhQ==
X-Forwarded-Encrypted: i=1; AFNElJ89t/4dbsJQU9o6p1vNvjcusKlBHywUhdbl2Zz8BFayX7IBTBdz0rRNcg5AUSWtCOImYxU61lnv0P8LtNsn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9XIfAWflSEqNN1pwS3T8JtSqNNB/jh/SV/XIgfPzMKNrpgygF
	VTjRUKWZ1nuUFoozW48ShDfFsWSe7d4sZnr1wecH7NLxBRXT+8YEQ4c39ouiScOo45EDzYj9Kiv
	PDfnXUZUxn8g1IMCBfXWN1o4+G60JofTAgLl067ONP9BvYOGNU7/m/UjwaXUMGVwI8RWV
X-Gm-Gg: AfdE7cldQt+Je8eNImHzDhKRPoOkDAOWqAv10zrrdz8Nzjv8Wow/KC7b0qnZF69rctv
	taxjIWnBzh8efYN77pnhBI5CzMd3Ht7WfZVuQwIAGCmAV36pwek/dmqw3s8jGYdoamw4VAstsb4
	7iCb/a06CGV4oCm1ud5ScT1RA8JcctZuJloDZqeND1BiXZzs+dakSZMG8+ewl9UND50yUn+PMoI
	C26a+3V7T+TlIfByL8la3H35mLHM6p4MVY1uhTT+c+6NJGsKMbUUPU+Wj6gi71nzxhHt20zFlFD
	1vSAAKwRiqdgJ9rP69e6n4JKTn9UcPquyKSWBiHf6YnbepRvh5x5CEoV93DEEnIOx9644Awl/WE
	Smn8EZvfWUv4c1WZ630jI/DJ+UlR2DUxpmpvbw4tGNA==
X-Received: by 2002:a05:6a21:7a9b:b0:3b4:731e:6fad with SMTP id adf61e73a8af0-3c01c6d75c9mr1034225637.16.1783017172236;
        Thu, 02 Jul 2026 11:32:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a9b:b0:3b4:731e:6fad with SMTP id adf61e73a8af0-3c01c6d75c9mr1034174637.16.1783017171721;
        Thu, 02 Jul 2026 11:32:51 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:32:51 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v5 00/19] clk: qcom: Add DISPCC and GPUCC support for the
 Qualcomm Shikra SoC
Date: Fri, 03 Jul 2026 00:01:22 +0530
Message-Id: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH6uRmoC/33Qy2rDMBAF0F8xWldhJI1ky6v8R+nCeiUiDzuSY
 1pC/r2KQ5tQnG4ujOAeDXMh2afoM2mrC0l+ijn2xzLIt4rYbXfceBpdmQkHrkAyQfM27lJHXcy
 DtXQznEuqILXlAjgESUpzSD7Ez1l9/7jPyZ/OBR/vjw+7rWYZuf6RNwVMw6Gk3e8y5aDRuxCCM
 NBOM/+3LBn7XWukrpZO1yhRoWondSuYLntq+8Mhjm2FAZFpBV5p5kRtmwYctxYAnQdljDTKOOm
 R3Dbfxjz26Ws+z8Tm1f+9xMQoUBmcqgVD1Rm+7nNenc7d/vb9qsTMTvyJ4s0yxQulpQi8QBCMe
 UGJB6WALVOiUIpZZjpRC+mbFxQ+U7hMYaEaDhgYcC0YW6Cu1+s3iF7A41gCAAA=
X-Change-ID: 20260513-shikra-dispcc-gpucc-6f59c23020f5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Q_UjovCGu_HCkODJ4zl9ycFyZn1C3Cm8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NCBTYWx0ZWRfX/2zINzHGHI5E
 PF+PF09b5UBOLJQ81128qs9FOT2O9S0FWyylVXF/byNS+qNbBCJMl1gydu4/2WCDfGXLL7+1zNo
 D85VtleFaqLPKFNjOpIvxC5YZsC/OUI=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a46aed5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3CZ3qO44dVgf1hZb4ZMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NCBTYWx0ZWRfX7jnzbUQcg45E
 YOyK/hVlBM67MCbnTid+OlW98VmPj4Y6Hd4huPvHTBIVgLzBFzDSMHNwCYld6QzUgLoDXIAuZsi
 j1Zql9R0TR5qAR84s9mjLE6pVwwlX35mOohlWvZJBMYr2mdRAaNrEsvIwYGAf5mTyqNBfzhefiu
 Jrt6nIDcMjumJU33LYtdvPFN7ZdkTBzrsVApR7Gaa19yVLl9QkWYGaiklhW4TXmNGFbTh6f0TSC
 CBUz14xx+2n89hcRsKi90yOVDJTtZU8c1D7mPdrDsTpxVmn4d/ZjxbMZB9bZLDk5/YcosbE5PeQ
 qlxT/uGA3sf8RsSJE1hq1g5pjMvzrj++su2PsT5+vlzi5ZNtK/Q10GaEvWvA5011vK5c1LEfyFd
 n2572sMDUW4WzYYslEGtylb6tRkQ/sjH6XMVXWbnCfGyijHJBAC3idSBI/3695UF30ZjAgJkL1q
 KmK2fmRzSHduJXFQXeA==
X-Proofpoint-ORIG-GUID: Q_UjovCGu_HCkODJ4zl9ycFyZn1C3Cm8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020194
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116094-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F23416FC4C3

This series adds support for the Display clock controller (DISPCC) and
GPU Clock Controller (GPUCC) on Qualcomm Shikra SoC, by reusing the
respective QCM2290 SoC drivers.

This series extends the QCM2290 DISPCC bindings by adding support for the
DSI1 PHY and sleep clock inputs, as well as the CX power rail. The Agatti
device tree is updated accordingly to comply with the revised bindings.
As a result, the existing DISPCC binding and corresponding DT ABI are
changed, making this an ABI-breaking update.

Shikra GCC series link:
- https://lore.kernel.org/all/20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v5:
- Collected all Reviewed-by tags received on v4.
- Updated the commit text of the bindings patches [Krzysztof]
- Converted only the critical GCC clocks to the latest clk_cbcr convention
- Reorganize the series into logically independent patches [Krzysztof/Dmitry]
- Added CX power domain support for DISPCC [Konrad]
- Dropped DSI1 PHY clock input support from the driver, as these clocks
  are not referenced by any frequency table.
- Link to v4: https://lore.kernel.org/r/20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com

Changes in v4:
- Included new patch for Shikra DISPCC/GPUCC DT node support
- Link to v3: https://lore.kernel.org/r/20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com

Changes in v3:
- Updated the QCM2290 GCC patch to use the .clk_cbcr convention
- Extended the QCM2290 GPUCC bindings to add DSI1 PHY and Sleep clocks
- Separated the patches as per the review comments in v2 series
- Added Agatti DISPCC DT node changes as per the latest bindings changes
- Link to v2: https://lore.kernel.org/r/20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com

Changes in v2:
- Dropped QCM2290 GCC critical clocks modelling to kept them ON from probe.
- Updated the QCM2290 DISPCC/GPUCC bindings to align for Shikra drivers reuse.
- Reused the QCM2290 DISPCC driver for Shikra without modernizing
  (keeping the clock-names approach) for now to avoid potential bindings ABI breakage.
- Modernized QCM2290 GPUCC driver to use commmon qcom_cc_probe() model
  and reuse for Shikra. 
- Link to v1: https://lore.kernel.org/r/20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com

---
Imran Shaik (19):
      clk: qcom: gcc-qcm2290: Keep the critical clocks always-on from probe
      dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1 PHY and sleep clocks
      dt-bindings: clock: qcom,qcm2290-dispcc: Add missing power-domains property
      dt-bindings: clock: qcom: Add Qualcomm Shikra Display clock controller
      dt-bindings: clock: qcom: Add Qualcomm Shikra GPU clock controller
      clk: qcom: dispcc-qcm2290: Move to the latest common qcom_cc_probe() model
      clk: qcom: dispcc-qcm2290: Switch to DT index based clk lookup
      clk: qcom: dispcc-qcm2290: Set HW_CTRL_TRIGGER flag for GDSC
      clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for DISPCC and GPUCC GDSCs
      clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs
      clk: qcom: qcm2290: Update DISPCC and GPUCC GDSC *wait_val values
      clk: qcom: gpucc-qcm2290: Drop pm_clk handling
      clk: qcom: gpucc-qcm2290: Move to the latest common qcom_cc_probe() model
      clk: qcom: gpucc-qcm2290: Keep the critical clocks always-on from probe
      clk: qcom: gpucc-qcm2290: Park RCG's clk source at XO during disable
      clk: qcom: Add support for Qualcomm GPU Clock Controller on Shikra
      arm64: dts: qcom: agatti: Add DSI1 PHY and sleep clocks to DISPCC node
      arm64: dts: qcom: agatti: Add missing CX power domain to DISPCC
      arm64: dts: qcom: shikra: Add support for DISPCC/GPUCC nodes

 .../bindings/clock/qcom,qcm2290-dispcc.yaml        |  35 ++++++-
 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |   4 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi               |  11 +-
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  42 ++++++++
 drivers/clk/qcom/dispcc-qcm2290.c                  |  79 ++++++++------
 drivers/clk/qcom/gcc-qcm2290.c                     | 113 +++------------------
 drivers/clk/qcom/gpucc-qcm2290.c                   | 102 ++++++++-----------
 7 files changed, 190 insertions(+), 196 deletions(-)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260513-shikra-dispcc-gpucc-6f59c23020f5
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v6
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>


