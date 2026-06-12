Return-Path: <linux-arm-msm+bounces-112960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mRjDJMVBLGrPOQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:28:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9063F67B548
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:28:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NQpfPDzB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QwOSqnpA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112960-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112960-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D7699300D4C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 17:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F826406291;
	Fri, 12 Jun 2026 17:28:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECC93FB7E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:28:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285286; cv=none; b=Oec+eHY6pE7I8hlPk7wCb6fzWGWmfrZfI77oqeaJ/trCqtNjJ0TmF1Md9Y4g1dfLTcynueTVVyEVTTYpcmHppLl1MC2Bh2RGXxoAN4YQoa12qMPPbc1JjvUa7o417dz6hiuSrQaeCoe+Tv0sINXJft6fYV9rYbqngLrfJJBpT0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285286; c=relaxed/simple;
	bh=vTT9js0dPynLTNdhb63LqCEc9S79C4AxFHOjxxFX2dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jg++/HSCms0JFFIp/s4naB3wR8yMYUgOOD/58IgXtb4ltBwfIW4DfsvDWtfxn6SNXocwJJAH9vJ/0MxMuG9EucQ/CWkY+3B2JAtz2ITgeQ3/IWirwywvUbzVulipe8Op5FVniRILgn1RXo3CdVoGTzh9B0VMxQSmj12XXSlqmqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQpfPDzB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QwOSqnpA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGUMg74150488
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwsIp/myDG/w4Mfkwf6fYT6eW8wAXDUyrskN2e0eScY=; b=NQpfPDzB/TVxZry9
	PxIkuYmvHl3QEvtWghZ2bJ6/f7Tr/6nJv8kqtPLqQ3g/GmqDL6Zxbr2KLz5LS23n
	6P5wXB+AdMAXg/ae/anAuVBJIAMqeDs1JjUwF5WFl1+wAFIgP4ntLAlkV0uS6mDW
	cLE/WRdmIQsZvc1wuq3t7Cakk4HrA99X4UIF1VoD/0u8dmu05RBUArT3mjHH2zm1
	wOEwjlttjV2bnWxmBEafL03onR9Lc4vhDUxLQxTm0iG+itMtyVrouL6zKNi3zPgY
	+zPagSDhRoWNRaarucbYXK1/4tzjaDFQIEUbSsG3cuhofw8tVxSoIc6fiXDqvZ4s
	7VkWRg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcm33x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:28:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2befec3fd8fso8641295ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 10:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781285282; x=1781890082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwsIp/myDG/w4Mfkwf6fYT6eW8wAXDUyrskN2e0eScY=;
        b=QwOSqnpAobCJuaGPibniUdtSCL0PXFPsxqDg4NvleMOvcchX/YZjtAA/fLnFUEUPDh
         BPhHEylplLbK13RF225oUlZ06z+skhFm13NHWJ+PRib4EZnNg7uEVXvOKeSl83K/APkG
         zng3uUSpaWOSpcp/zRbcNBUp0SzDfbLuIgUyAiiPZPxDtLjlS/uhKs/mkyvxiJLRM4LV
         Fuedub428J9QjdtnpMjn4jxngu2ANFnMZj1NJudpwuvJEsaUsl792+o8kPaGdjFvSCqO
         n7dIySgMlVTqZQSdHxhOAtRlHvASJ0K9eTODmX+co4K7lroLx6jhiVhVuZA+RbBTrCwG
         cvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781285282; x=1781890082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lwsIp/myDG/w4Mfkwf6fYT6eW8wAXDUyrskN2e0eScY=;
        b=Z83hYoXuXeZj80Hx8rxClRs1Fpwj5zKc8djtLwftNajRt0+mJq33K7zAuUpQIe/kIU
         VsZE7aDrJAsNOG2wiGJ8h48mryTEefgXj0q8r3pqi0PqEMo2k4ZF/qfIbpo6M8gN/onp
         R4jGnxfEroWZRtx6g6qYHxPj9yxkkcWYL6jWwUT+VcntHCJtGCR3q+9wKUZ5hXUZhRZL
         M24jpUAHmFnJjUonKhEtGjbz+SSRzj8N+pCL566rFY7j0Fa+NCHFh7WcZbSnNB0hDALA
         dExs2Z5lNX05HY9rr3zn8qPiwHFG2LTSCH1NISWvNHmjxj6x52F+8FZj1tgiX8xu7H4Y
         4nsw==
X-Gm-Message-State: AOJu0YwrCVYC5Ei0V+eXKd8AOu/0kWaSz5ncvrgV1h/c94Q//05zx8Ff
	CgGNtNR7D2/rTp09cs2htf6hsJ0f7htncBjptcA9/AzO1cCrl2ilzgMZi39jrHhXlw9Cvo+c5xA
	LKznLPIbmJgwPZdZIyexMwgbkNIopSd8v63EZ2EH/50IH4usCEvasb5/HrmQjHSCNFQ2O
X-Gm-Gg: Acq92OENYdgTybdUdI6rwoEK3p1XQiWawb7Dir6cw2uT8FC3LfQ8aWatMrhzcV5DnSL
	lTa8sgnuy4lc2Q7FCzSrVPFGEsk4fYCc7uG0B30cU+MUuhw1LJBKUzN7sX3lHXcanxk5L+DcfOS
	x3YXs9th+WyYBsCyOxH8sm3C3FE/ImXE5V4WF3V/expLr8iJFk5sUQ1ZG45bBxeze3gbwNbQyU2
	2Qh/A/YEVoMU/ns3MzDsYypmyFUav/43g7Ye6rx97ik3djDqsel3pveDthq05grZZKHW99mwzFJ
	6CVGBwLY8U3dMT25N0CJVbTgrgtZ3PdOzb+FLxDZyK43ZYvH3TU5MI0i/02OzTJBGEXTJXvZwDe
	aacCW2PgcCAIbJndi4YDMkwlsTzFty4uRkCWY
X-Received: by 2002:a17:902:e751:b0:2c2:b6c2:9daf with SMTP id d9443c01a7336-2c41293c41amr45794035ad.37.1781285281358;
        Fri, 12 Jun 2026 10:28:01 -0700 (PDT)
X-Received: by 2002:a17:902:e751:b0:2c2:b6c2:9daf with SMTP id d9443c01a7336-2c41293c41amr45793645ad.37.1781285280769;
        Fri, 12 Jun 2026 10:28:00 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acae2sm24278105ad.52.2026.06.12.10.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 10:28:00 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 22:57:38 +0530
Subject: [PATCH v6 2/5] arm64: dts: qcom: Introduce Shikra SoC base dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra-dt-v6-2-6b6cb58db477@oss.qualcomm.com>
References: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
In-Reply-To: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
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
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781285260; l=23629;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=vTT9js0dPynLTNdhb63LqCEc9S79C4AxFHOjxxFX2dc=;
 b=9pyIYxrCHr2W9B0B7KOnNVxoEgX3KvvFDTjPzwFwcc83f9Vev3IKuqbIYD+M0ScxhukUJ9CQO
 tsE7bUsC8kLD53ayNj9EEM7d6I4w2ix75HRZmEdrLPmJw8rie13NPL2
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE2MiBTYWx0ZWRfX3nnAMZcXYOQY
 jwwXYNgV+NBAyhopOPhW5R/g07GPSdtzVglgbcHNDOLzH/Q8xRaR3Ozvo1pRRlXF1RFm28KKHnz
 6Q4Mj9CRFD9YSWpAMm2CgtR+jQYUskfDeVDwYZkF+REyHeSi1vxiNJQGR7sV/sdfZbi1/ILWjqy
 ardOgHe3pY4p9TTrdOrEcJoMTwfZJto0K0Utx2OpGD/5sfZB2rhtQNdv2UYtgxtmZaVi8cmAKMf
 tFQlKkI7CaofP4B7fkd7S+/avAHScBnXAr1UJaPOTDT0B1wpuGiR1Gkl92xCfBlcC4r/GQhEcyg
 +g4v65/GsLXuQSpQJBGSpBxAQrZyYep1wkw2XY12GynRRRnwiU1mMIij1Y+YC2oFqZgINfjhUbj
 eKeI5ssrntpSQ1LIaS2RCOic4YKxwdPUUCcYtw6C+UWh+5ZuBqngobCA6HUoqVub+E7GSRjZQhV
 wdeRHbGWd8oJoewRf7g==
X-Proofpoint-GUID: j5xItPqO_RsBws-yOVkuXUQem2jCFpeL
X-Proofpoint-ORIG-GUID: j5xItPqO_RsBws-yOVkuXUQem2jCFpeL
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2c41a2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=6UBnnb2_QDgcJB-b6ocA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE2MiBTYWx0ZWRfX9RrZvSjHJYsm
 YSrNr49sZhQw3z8K0Kjk6sS4AMMLlnnId9ylIUSUJNB/UgsqttTqwz2t7HdQrvPMPLPSouavj3q
 CSiBBxS5kmRmcP62ej6GBVm5SP9tWTU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112960-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:quic_mchunara@quicinc.com,m:rakesh.kota@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:sneh.mankad@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:xueyao.an@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9063F67B548

Add initial device tree support for the Qualcomm Shikra SoC,
an IoT-focused platform built around a heterogeneous CPU cluster
(Cortex-A55 + Cortex-A78C) with RPM-based power and clock management.

Enable support for the following peripherals:
  - CPU nodes
  - Global Clock Controller (GCC)
  - RPM-based clock controller (RPMCC) and power domains (RPMPD)
  - Interrupt controller
  - Top Level Mode Multiplexer (TLMM)
  - Debug UART
  - eMMC host controller
  - System timer and watchdog

Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 842 +++++++++++++++++++++++++++++++++++
 1 file changed, 842 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
new file mode 100644
index 000000000000..4e5bc9e17c8e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -0,0 +1,842 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,rpm-icc.h>
+#include <dt-bindings/interconnect/qcom,shikra.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l3>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			next-level-cache = <&l3>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+			next-level-cache = <&l3>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78c";
+			reg = <0x0 0x300>;
+			enable-method = "psci";
+			next-level-cache = <&l2_3>;
+			capacity-dmips-mhz = <1946>;
+			dynamic-power-coefficient = <489>;
+
+			l2_3: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3>;
+				cache-size = <0x40000>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu3>;
+				};
+			};
+		};
+
+		l3: l3-cache {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-unified;
+			cache-size = <0x80000>;
+		};
+	};
+
+	firmware {
+		scm {
+			compatible = "qcom,scm-shikra", "qcom,scm";
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
+			qcom,dload-mode = <&tcsr_regs 0x13000>;
+			#reset-cells = <1>;
+			interconnects = <&system_noc MASTER_CRYPTO_CORE0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
+	};
+
+	pmu-a78c {
+		compatible = "arm,cortex-a78-pmu";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	rpm: remoteproc {
+		compatible = "qcom,shikra-rpm-proc", "qcom,rpm-proc";
+
+		glink-edge {
+			compatible = "qcom,glink-rpm";
+			interrupts = <GIC_SPI 194 IRQ_TYPE_EDGE_RISING 0>;
+			qcom,rpm-msg-ram = <&rpm_msg_ram>;
+			mboxes = <&apcs_glb 0>;
+
+			rpm_requests: rpm-requests {
+				compatible = "qcom,rpm-shikra", "qcom,glink-smd-rpm";
+				qcom,glink-channels = "rpm_requests";
+
+				rpmcc: clock-controller {
+					compatible = "qcom,rpmcc-shikra", "qcom,rpmcc-qcm2290", "qcom,rpmcc";
+					clocks = <&xo_board>;
+					clock-names = "xo";
+					#clock-cells = <1>;
+				};
+
+				rpmpd: power-controller {
+					compatible = "qcom,shikra-rpmpd";
+					#power-domain-cells = <1>;
+					operating-points-v2 = <&rpmpd_opp_table>;
+
+					rpmpd_opp_table: opp-table {
+						compatible = "operating-points-v2";
+
+						rpmpd_opp_min_svs: opp1 {
+							opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
+						};
+
+						rpmpd_opp_low_svs: opp2 {
+							opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
+						};
+
+						rpmpd_opp_svs: opp3 {
+							opp-level = <RPM_SMD_LEVEL_SVS>;
+						};
+
+						rpmpd_opp_svs_plus: opp4 {
+							opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
+						};
+
+						rpmpd_opp_nom: opp5 {
+							opp-level = <RPM_SMD_LEVEL_NOM>;
+						};
+
+						rpmpd_opp_nom_plus: opp6 {
+							opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
+						};
+
+						rpmpd_opp_turbo: opp7 {
+							opp-level = <RPM_SMD_LEVEL_TURBO>;
+						};
+
+						rpmpd_opp_turbo_plus: opp8 {
+							opp-level = <RPM_SMD_LEVEL_TURBO_NO_CPR>;
+						};
+					};
+				};
+			};
+		};
+
+		mpm: interrupt-controller {
+			compatible = "qcom,mpm";
+			qcom,rpm-msg-ram = <&apss_mpm>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING 0>;
+			mboxes = <&apcs_glb 1>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#power-domain-cells = <0>;
+			interrupt-parent = <&intc>;
+			qcom,mpm-pin-count = <96>;
+			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */
+					   <12 422>, /* DWC3 ss_phy_irq */
+					   <58 272>, /* QUSB2_PHY dmse_hv_vddmx */
+					   <59 273>, /* QUSB2_PHY dpse_hv_vddmx */
+					   <86 183>, /* MPM wake, SPMI */
+					   <90 157>, /* QUSB2_PHY DM */
+					   <91 158>; /* QUSB2_PHY DP */
+		};
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hyp_mem: hyp@80000000 {
+			reg = <0x0 0x80000000 0x0 0x1600000>;
+			no-map;
+		};
+
+		xblboot_mem: xblboot@85e00000 {
+			reg = <0x0 0x85e00000 0x0 0x100000>;
+			no-map;
+		};
+
+		secdata_apss_mem: secdata-apss@85fff000 {
+			reg = <0x0 0x85fff000 0x0 0x1000>;
+			no-map;
+		};
+
+		smem_mem: smem@86000000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x86000000 0x0 0x200000>;
+			no-map;
+
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
+		audio_heap_mem: audio-heap@86200000 {
+			reg = <0x0 0x86200000 0x0 0x100000>;
+			no-map;
+		};
+
+		tz_stat_mem: tz-stat@a0000000 {
+			reg = <0x0 0xa0000000 0x0 0x100000>;
+			no-map;
+		};
+
+		qtee_mem: qtee@a1300000 {
+			reg = <0x0 0xa1300000 0x0 0x500000>;
+			no-map;
+		};
+
+		tz_apps_mem: tz-apps@a1800000 {
+			reg = <0x0 0xa1800000 0x0 0x2100000>;
+			no-map;
+		};
+
+		mpss_wlan_mem: mpss-wlan@ab000000 {
+			reg = <0x0 0xab000000 0x0 0x6e00000>;
+			no-map;
+		};
+
+		wlan_mem: wlan@b2300000 {
+			reg = <0x0 0xb2300000 0x0 0x100000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@b2400000 {
+			reg = <0x0 0xb2400000 0x0 0x1900000>;
+			no-map;
+		};
+
+		gpu_micro_code_mem: gpu-micro-code@b3d00000 {
+			reg = <0x0 0xb3d00000 0x0 0x2000>;
+			no-map;
+		};
+
+		video_mem: video@b3d02000 {
+			reg = <0x0 0xb3d02000 0x0 0x700000>;
+			no-map;
+		};
+
+		lmcu_mem: lmcu@b4402000 {
+			reg = <0x0 0xb4402000 0x0 0x300000>;
+			no-map;
+		};
+
+		lmcu_dtb_mem: lmcu-dtb@b4702000 {
+			reg = <0x0 0xb4702000 0x0 0x40000>;
+			no-map;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+		ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+
+		tcsr_mutex: syscon@340000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x00340000 0x0 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
+		tcsr_regs: syscon@3c0000 {
+			compatible = "qcom,shikra-tcsr", "syscon";
+			reg = <0x0 0x003c0000 0x0 0x40000>;
+		};
+
+		tlmm: pinctrl@500000 {
+			compatible = "qcom,shikra-tlmm";
+			reg = <0x0 0x00500000 0x0 0x700000>;
+
+			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			gpio-ranges = <&tlmm 0 0 165>;
+			wakeup-parent = <&mpm>;
+
+			qup_uart0_default: qup-uart0-default-state {
+				pins = "gpio0", "gpio1";
+				function = "qup0_se0";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			sdc1_state_on: sdc1-on-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc1_state_off: sdc1-off-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-bus-hold;
+				};
+			};
+		};
+
+		mem_noc: interconnect@d00000 {
+			compatible = "qcom,shikra-mem-noc-core";
+			reg = <0x0 0x00d00000 0x0 0x43080>;
+			clocks = <&gcc GCC_DDRSS_GPU_AXI_CLK>;
+			clock-names = "gpu_axi";
+			#interconnect-cells = <2>;
+		};
+
+		llcc: system-cache-controller@e00000 {
+			compatible = "qcom,shikra-llcc";
+			reg = <0x0 0x00e00000 0x0 0x80000>,
+			      <0x0 0x00f00000 0x0 0x80000>,
+			      <0x0 0x01000000 0x0 0x80000>;
+			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc_broadcast_base";
+			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		gcc: clock-controller@1400000 {
+			compatible = "qcom,shikra-gcc";
+			reg = <0x0 0x01400000 0x0 0x1f0000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		system_noc: interconnect@1880000 {
+			compatible = "qcom,shikra-sys-noc";
+			reg = <0x0 0x01880000 0x0 0x6a080>;
+			clocks = <&gcc GCC_EMAC0_AXI_SYS_NOC_CLK>,
+				 <&gcc GCC_EMAC1_AXI_SYS_NOC_CLK>,
+				 <&gcc GCC_SYS_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_SYS_NOC_USB3_PRIM_AXI_CLK>;
+			clock-names = "emac0_axi",
+				      "emac1_axi",
+				      "usb2_axi",
+				      "usb3_axi";
+			#interconnect-cells = <2>;
+
+			clk_virt: interconnect-clk {
+				compatible = "qcom,shikra-clk-virt";
+				#interconnect-cells = <2>;
+			};
+
+			mc_virt: interconnect-mc {
+				compatible = "qcom,shikra-mc-virt";
+				#interconnect-cells = <2>;
+			};
+
+			mmrt_virt: interconnect-mmrt {
+				compatible = "qcom,shikra-mmrt-virt";
+				#interconnect-cells = <2>;
+			};
+
+			mmnrt_virt: interconnect-mmnrt {
+				compatible = "qcom,shikra-mmnrt-virt";
+				#interconnect-cells = <2>;
+			};
+		};
+
+		config_noc: interconnect@1900000 {
+			compatible = "qcom,shikra-config-noc";
+			reg = <0x0 0x01900000 0x0 0x8080>;
+			#interconnect-cells = <2>;
+		};
+
+		qfprom: efuse@1b44000 {
+			compatible = "qcom,shikra-qfprom", "qcom,qfprom";
+			reg = <0x0 0x01b44000 0x0 0x3000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qusb2_hstx_trim_1: hstx-trim@25b {
+				reg = <0x25b 0x1>;
+				bits = <1 4>;
+			};
+
+			gpu_speed_bin: gpu-speed-bin@2006 {
+				reg = <0x2006 0x2>;
+				bits = <5 8>;
+			};
+		};
+
+		spmi_bus: spmi@1c40000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x01c40000 0x0 0x1100>,
+			      <0x0 0x01e00000 0x0 0x2000000>,
+			      <0x0 0x03e00000 0x0 0x100000>,
+			      <0x0 0x03f00000 0x0 0xa0000>,
+			      <0x0 0x01c0a000 0x0 0x26000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&mpm 86 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
+		rpm_msg_ram: sram@45f0000 {
+			compatible = "qcom,rpm-msg-ram", "mmio-sram";
+			reg = <0x0 0x045f0000 0x0 0x7000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x0 0x045f0000 0x7000>;
+
+			apss_mpm: sram@1b8 {
+				reg = <0x1b8 0x48>;
+			};
+		};
+
+		sram@4690000 {
+			compatible = "qcom,rpm-stats";
+			reg = <0x0 0x04690000 0x0 0x14000>;
+		};
+
+		sdhc_1: mmc@4744000 {
+			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
+
+			reg = <0x0 0x04744000 0x0 0x1000>,
+			      <0x0 0x04745000 0x0 0x1000>;
+			reg-names = "hc",
+				    "cqhci";
+
+			iommus = <&apps_smmu 0xc0 0x0>;
+
+			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			interconnects = <&system_noc MASTER_SDCC_1 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_SDCC_1 RPM_ACTIVE_TAG>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			operating-points-v2 = <&sdhc1_opp_table>;
+
+			qcom,dll-config = <0x000f642c>;
+			qcom,ddr-config = <0x80040868>;
+
+			bus-width = <8>;
+
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
+			mmc-hs400-1_8v;
+			mmc-hs400-enhanced-strobe;
+
+			resets = <&gcc GCC_SDCC1_BCR>;
+
+			status = "disabled";
+
+			sdhc1_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-peak-kBps = <250000 133320>;
+					opp-avg-kBps = <104000 0>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-peak-kBps = <800000 300000>;
+					opp-avg-kBps = <400000 0>;
+				};
+			};
+		};
+
+		qupv3_0: geniqup@4ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x04ac0000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			uart0: serial@4a80000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x04a80000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart0_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+		};
+
+		sram@c11e000 {
+			compatible = "qcom,shikra-imem", "mmio-sram";
+			reg = <0x0 0x0c11e000 0x0 0x1000>;
+			ranges = <0x0 0x0 0x0c11e000 0x1000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-sram@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
+		apps_smmu: iommu@c600000 {
+			compatible = "qcom,shikra-smmu-500", "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x0c600000 0x0 0x80000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		intc: interrupt-controller@f200000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0xf200000 0x0 0x10000>,
+			      <0x0 0xf240000 0x0 0x80000>;
+
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			#interrupt-cells = <4>;
+			interrupt-controller;
+
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x20000>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2>;
+				};
+
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&cpu3>;
+				};
+			};
+		};
+
+		apcs_glb: mailbox@f400000 {
+			compatible = "qcom,shikra-apss-shared", "qcom,sdm845-apss-shared";
+			reg = <0x0 0x0f400000 0x0 0x1000>;
+			#mbox-cells = <1>;
+		};
+
+		watchdog@f410000 {
+			compatible = "qcom,apss-wdt-shikra", "qcom,kpss-wdt";
+			reg = <0x0 0x0f410000 0x0 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&sleep_clk>;
+		};
+
+		timer@f420000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0x0f420000  0x0 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x0 0x0 0x10000000>;
+
+			frame@f421000 {
+				reg = <0x0f421000 0x1000>,
+				      <0x0f422000 0x1000>;
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>;
+			};
+
+			frame@f423000 {
+				reg = <0x0f423000 0x1000>;
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+
+			frame@f425000 {
+				reg = <0x0f425000 0x1000>;
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+
+			frame@f427000 {
+				reg = <0x0f427000 0x1000>;
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+
+			frame@f429000 {
+				reg = <0x0f429000 0x1000>;
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+
+			frame@f42b000 {
+				reg = <0x0f42b000 0x1000>;
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+
+			frame@f42d000 {
+				reg = <0x0f42d000 0x1000>;
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+
+		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW 0>;
+	};
+};

-- 
2.34.1


