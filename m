Return-Path: <linux-arm-msm+bounces-97384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKtDIQjcs2mzbgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:42:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E38F280AA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C8C730058ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC742D876F;
	Fri, 13 Mar 2026 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYQfg1ZZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4d8npsf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4D31A6832
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773394950; cv=none; b=DunplwDj7xwmLmp2GW4bDXPLrQHytMYCanJtkDsCPTlzCHwMCwHu/LiS0qC1pHr+Oe7M6y2SCbBXbRAyNFDVv9RuZDaxqvlKzq73nVf7Y+fB5KkHD/ZcA0pzkgbdwVBZwP0IiwOp9yO1YiSS1ZyfmKHGom3PZkbXm/R0jX74NpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773394950; c=relaxed/simple;
	bh=5O6H7w0B5GRO5xsxqMSV5moSBjgJZJGeYsxmcxblIeI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZLqnL/EBm+qvr4I6yYU9cJse1UctA6UnRzsbS37dAMxpWmlgaC49CDwO7ZHjeIbRZJ2zp97ebRWiEcekqNDnasu+P0wZs/Kp4wm2s1VJef6zfZuw4FVq7YFqux5U7jpmEzO+1DnOinojeNGBdmUuVTqUZ+z0mpmA39TOWSLN9M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYQfg1ZZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4d8npsf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5u2HM3845045
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M7UL+yj/qF9TpEifw98IaE
	sM7JHR+QKIoYkJPkZWq2s=; b=LYQfg1ZZC5uZp1ZiN0rq+JziReN/cv4Y32KnNu
	I9sna0hiyb1KEO98amCrnZ/G4jztq8r/xhJRYpsG6ua469SK7+ucsYzmZUldoDXB
	jh4m1v8ZNCMjZVodvsQ38cMPR2SXhz9uZfHAtAN/+4mYxYjRIknQ3O4JvQlgJAiI
	yPanyJ6vxXZRwYfTG1amMA6gMzZnZ4Ca/U7dWxYrPyzwZaijkfI0kRW7HInIlq6G
	2Y8DxyXSwGZkCvwyhEd1neSO9sU2sVbeAxBu9W4OiufPUTgJ/Jcp1AWYIAlRCMhj
	8J+IzfKgHW4j+H/vWPoncWUpu3naihp4f56f3/mgILE/xk3g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54weng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:42:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a0249d51aso170154246d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773394947; x=1773999747; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M7UL+yj/qF9TpEifw98IaEsM7JHR+QKIoYkJPkZWq2s=;
        b=g4d8npsfEyOeUV62x5ccRxgC8942wWCel3VYlr2Gd/hj5eG7PpPgl7jnQVtWiHNLrC
         f+iBAN/arD3slJH7GNpULeM7fZSzxJtk8DCRB3FpwWOLp5AF+vOYkHO4+n81yyE/des2
         jZTmfC64mfO+vpDmOulhZAkPjjvr3+QYCPM7pOy+8JHj5M1RJLnm7X+j0GQM8WifNi1d
         ZnvSQKG2FQJXCSFf1hJXIcKA+zLoAvdPyP5t15gWtmofQ3C2Ptctm3jMKVaQbrjerCbI
         OziKBz1ddcfUItJs9/ecVYFQfONs3kaww9yWVoiiXQr8XtZH7Y80FUHQedipLWFWT1Qe
         gPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773394947; x=1773999747;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7UL+yj/qF9TpEifw98IaEsM7JHR+QKIoYkJPkZWq2s=;
        b=B3hkmWdtH6liasrFAT8hXK5im4oNhJdjjKTaQiKXawLagr1c+38JNtnIUjBcAzV7gf
         SOgDFZn7r3jjHidPGj5p0oqD0oPMrDkz2jiGPA22NyGeQ8wNPpjMAnfxH/7SnusMGdyS
         wwyHgUTr8Lvx+CDR6iE4SSz5Yd8tkIy3U3KgANdHMzoN5cmEAebOe16aAkZ3BGbDQe4M
         jzZ3jh1s3LeoQdiR2uPll2aQB8T6K1CvJ2VAV9uNl7rv+0zDkdZpckNnE2xf7NHG63zY
         dIeJwBM+qPY8h4Uf9ISSSgS5biHabolaBzbgo/MdpdHsfA6KoTsFH8g2LpD+K1yURpV0
         ex1g==
X-Forwarded-Encrypted: i=1; AJvYcCUbrAQ1n0r3rnFcbmhoHDratGk7Z+C4rIq3/WctSjxnKS7XHGJYrpY4+hLH4C/o/G5Sp0PrealF5f9b3USg@vger.kernel.org
X-Gm-Message-State: AOJu0YwLKQ7aB/fOr2/8l8YQfqVqtRO1nxfj6oMuyBPIrAJE+xLGt121
	KzBgiGyydKlEFwvuUeDZc50LuVuDv1Ls3eqoLyKAYgOAgR5cmTDqaFdynbfOYOZpLPX2VENHIS1
	R2h+BW14s+8xHvc9h39m9CZPuoJMq+F4KaymFlrodVZtCDiSe6J75lJgyPUEnvsz7gyGR
X-Gm-Gg: ATEYQzyHY2PANsxS9LGItCHU1XXHlkcMWjTFGHw32+o7lJU4kigLWPISKMKhi0YA8NS
	gGmkTPkM2ekTX+m7/bcqrSL7SAjG/z+xV8mtEiKOBSzjwgR1schDHycidWouTw/DY3XAFilzx6n
	eOI231utjJlxeei23OaSw10LconYQ7qXiPub9b/toZb0/U6Uu0C58mgWRAyMF+8DuyPOxAVWTeB
	PGcZhd/EWPu2OJYOqgIaeVhs1Dhllv5hUL3lPGRYf+ROFT676v5RQPcOIQWbjMXTSG5ptor9wvs
	IbwzmUNNfWrIyu8+x2gH/Ol67kHUiSQedL4o+tt4+HP6ZfpVRQSeJ6P5N4+ubsxgTLl/PerLlOA
	w+7HKDneh/3c+WLgjPK+zApQJwAcqK1kuNHC1x9n1qh+qVrclAAIRirmsrqtbsf02+HvdjDSLMy
	5VobVfK62Fyq+p
X-Received: by 2002:a05:6214:411:b0:89a:1321:2ac1 with SMTP id 6a1803df08f44-89a81f5bd71mr39807046d6.34.1773394947454;
        Fri, 13 Mar 2026 02:42:27 -0700 (PDT)
X-Received: by 2002:a05:6214:411:b0:89a:1321:2ac1 with SMTP id 6a1803df08f44-89a81f5bd71mr39806916d6.34.1773394947067;
        Fri, 13 Mar 2026 02:42:27 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65d0a7b6sm54663656d6.44.2026.03.13.02.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:42:26 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/2] media: qcom: camss: Fix clock and IRQ configurations
 for 8775p platform
Date: Fri, 13 Mar 2026 17:42:13 +0800
Message-Id: <20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPXbs2kC/x2MQQqAIBAAvyJ7TtAEib4SEaJrLYSFhgTi31s6z
 sBMg4KZsMAsGmSsVOhKDHoQ4A+XdpQUmGFUo1VGG1kjnvTgFumVSjljcQrexwBc3BlZ/7dl7f0
 DySToGl0AAAA=
X-Change-ID: 20260313-vfelite_fix-00a36e8dccfd
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773394942; l=904;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=5O6H7w0B5GRO5xsxqMSV5moSBjgJZJGeYsxmcxblIeI=;
 b=zvsMWl443n3ApyU9ZTZ+NXYoDDRWmkSGQz3bKRzK92S8/a2Jiq9LgOGmfi2Nv6oh6N2AOCH0N
 02oomhaIdORAp0UtdAbPLsr1tfsrKDzNuyc0zP8q/ORnGetnH+Rt66W
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: Ku9lhmxT7mJc1OEcggZWOZyIhj7wNHBA
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b3dc04 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ytj735iEwNNmAM0tCg0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Ku9lhmxT7mJc1OEcggZWOZyIhj7wNHBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NSBTYWx0ZWRfX69Nx49bZT6AG
 vzfrgUzf+rk9ss0NlsG0fb8C4F+xYv3AnP2bjsUrC0kuFGnKseTmNn/ibSXsdHGdwTpImwdnQQZ
 Cdi0ldDfzemt2pQysRW5W5ds60J3tG4Son5NRvYeprrotAyc2RbgbPPP2linm+dRjey6JXdOpri
 QwJ7jYSJWDNWutB7LQRi+bGa3Pgc85TR1P3tmlSRyy8ToLn8IxjtFN6WifCGAGJ2swRJ1F14lqv
 G+w2Gh3W3qWDMsctA6yviugZu0qs3/N23n/YK6M9PbD2IgC3PCwYHdGJYVTv+LEx32Io/Qa94aC
 1mELaVGA4OcPuoKEDjDJ7WNDGf/YO94LbAVYirZGlQ3W0KsDpKowjJ5yfELX18CihU9JeHGN7MO
 /XZ8c9GD8luVBgryX0WJfkHbOWDOTourWYHAaYSTfwQY0cPD/SLn2FJ9xy7egqXGM1HWsgd+L7q
 7b41z1cUyECrextlACA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97384-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E38F280AA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series contains two fixes for the Qualcomm Camera Subsystem driver
on 8775p platform:

1. Fix CSID clock configuration and IRQ offset. Simplify the lite CSID
   clock requirements and correct the buffer done IRQ status offset
   calculation.

2. Add missing clocks for VFE lite instances.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Wenmeng Liu (2):
      media: qcom: camss: Fix csid clock configuration and IRQ offset for 8775p
      media: qcom: camss: Add missing clocks for VFE lite on 8775p

 .../media/platform/qcom/camss/camss-csid-gen3.c    |  6 +-
 drivers/media/platform/qcom/camss/camss.c          | 80 ++++++++++++----------
 2 files changed, 45 insertions(+), 41 deletions(-)
---
base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
change-id: 20260313-vfelite_fix-00a36e8dccfd

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


