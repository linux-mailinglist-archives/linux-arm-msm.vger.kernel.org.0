Return-Path: <linux-arm-msm+bounces-109812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJLSMw2ZFWqNWgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:58:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FD15D5EA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 007A0304352A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E54B246BBA;
	Tue, 26 May 2026 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWptDCEj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gHNnaODV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA437241695
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800106; cv=none; b=vDwZzueB/1BRBCLJrDRGolYs0JFslTcFTcqLO78Yid8MkXj4MTtCuNiSsai7APqwPQwRZCcbtoaSQa6hdHHAUe4iXOe8tPJQRI6h3RbLQW6XRyJvDg2w2qUkyopNMYxEn8uPhas3SaPo4EEHYUlphg3C+8gvqjBPeGVQlMHNhgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800106; c=relaxed/simple;
	bh=CnRPiuF81lBuCpoHlCurFFGdm2XmAncBNOM3KmceBW8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=POd8BY8flxFj5XV9YCy0EMYsu+kQpSScvkpvlSzHMJ+vsybHU0WA+tRf0lQ0QY8vpB6w7vF1j03RSYaO4zxPr3gQNvxGfWbWHxS0kNjY9KEhjKWBd9iSy0xMTya2WxYXVi2ge8q3+mIBC3QCsRMO/vSEItGBN9lTqPJTb79Vono=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RWptDCEj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHNnaODV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsVRD2411662
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IFDcglAGXjSDv6I35QrERo
	oEJdRQga4AJsVg1Timyjs=; b=RWptDCEjFdY2iNxdRLynLUsGu0KCCmEb+yWGoR
	lchKghPw60HsX/xxY9w2EoXdxMz35ahruTp3oCYOUdO+bpGrZnxYoUE7SSWXLEEN
	130HvIhjU0SedSWWdBZ7ySAiu0nw+FEZbbaOXeym+t/4/zgaS7+rVWL4UfDgTKA0
	2SqXMPqtHWf9RNKzVryhiJaMeg3fWH2rW35S5wfP5zgZ2eP1CjVFSspyCia0rxnx
	iQxYmPanYNcjriKQbHAj7ts6S05GyWoiMU/+Yz/dP7L+wFWAFGe9G/7QjtBT1kAw
	j3kAqvSmoANN+ZF3WSHyG2yjzLWduMQAKne90jWncS2qJ4BQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqync33v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:55:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso118171925ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779800103; x=1780404903; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFDcglAGXjSDv6I35QrERooEJdRQga4AJsVg1Timyjs=;
        b=gHNnaODV3aYZM9LICJFAhBxRXDw/riwKii3Tjskx87Wr0rnGi5HeYFDhTEgbv8ojvL
         02KZwo9Q6HJ/WYdABRsik43CtIR+IUtUS8deG3GWlO2GCpye1RVpLUjVefsC2ZEEsMo+
         98QTPDllurcXBj7hBoUHVyW1krMZFKJUoZQddaDIVPltSPSU1u1bLvYnRwIxWnTNJyFG
         5IZI8StlMoYat2fqbeB1swk5URN3traFztuy3CLfOrd6KAukA1FD7X+aSeRZYXbk8Ygu
         ItL3hsN31kX/3x4c2euv0u/3ErBgLkqxjgWTzVujvr6j2o9wiS/2U87MtQNAy11bzxnQ
         tMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779800103; x=1780404903;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFDcglAGXjSDv6I35QrERooEJdRQga4AJsVg1Timyjs=;
        b=fYxh+tyOogvB5a1e/CWMK5V1AgDOC/iHD9IDJjrk5p/yStrrfgj9xLKTuo8gsnTcjD
         GGfnFDB9tORWfAgLZqtzgRVk1L8BFOcx0BawluMJkKGj8gKeRUMpnsJZ7UoQKyKsJxeX
         6F73AdpYRicLYUI6u97cQmLUPI+tAEotIFn1QNzhAnyduRmq8IpdbG0JTuyQkVacd4Mz
         z2FZzZ3ofTthnqIdUYwBaecaBSKj4BU4nYI4IlGXBJAMRy63J6IE9h7Uq7n3ojrHxK9s
         o4M6dGmIR/x8bjE4n4v2tvTx4s3GbTU6f/8G/nheSD3kCAyP24011a2iqaThfjSliOp3
         0jiw==
X-Forwarded-Encrypted: i=1; AFNElJ8CAkQ9bLJk/kcW+MLD6eKC2H19fcKfKp/nY2hOEARuI+ml2oHoL5KuBkLjvAzG0csDwt3GpwS5nlhBO3q8@vger.kernel.org
X-Gm-Message-State: AOJu0YwC/Fq/c5U6Lcpit37bzNSqveCDE1zeEKJvQ6H3sOT6kW7w1TDO
	Ga513ooyL00bHSbb1K+FVgF0/B/i3sc6/kjF5H9rsLwSnxPHzhG8KYP4ObJpMrzZEFFWho6Jazu
	rViDOg4MipBIYwNwju5BoVYLoYm2YtuNpivzA9va9UH8K0WO4D7OSP7It5YkTCRZc6S9F
X-Gm-Gg: Acq92OGsKxmE5dO1ng8JcR6ZqavWwgzaMH5Vb5JZ7VP9UEOMwBrkHE1MG75WfPPUJvt
	f9XMMy7m69d+64R+eiQKO5/i1JaXu9FFnPQEn2W1QNo+/PlGJueLJELheH1viL7r0aF0pyT6e+G
	p8tkGmXmp+SNb/pfzpbxW+NhRn7Yan17sKPMO6K4MBPXsP8UjsCGecvx54yR2l3i5e5N4mfk3/U
	w0kD8ceXhqCy77+lViOM4+J/JYtdCJf15+i/5IS4KtU338e83+oY/pDytXqUeweUBOMM7xumbsn
	4MdU7kOZfW7Ys22pwkOdCzHRQcV+dsvDrh8aaxvcauT1PDzls53CfimNtZPT2HIsX73BKuPuI0G
	O7Xi090kPTJwWTy2+0W4cyLrthZMddJaZ+ibnWQZXzyUIADr1eX1Fyfqd7UVJGyI=
X-Received: by 2002:a17:903:f8b:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2beb06c4f36mr195265395ad.11.1779800102314;
        Tue, 26 May 2026 05:55:02 -0700 (PDT)
X-Received: by 2002:a17:903:f8b:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2beb06c4f36mr195265155ad.11.1779800101871;
        Tue, 26 May 2026 05:55:01 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm129000165ad.71.2026.05.26.05.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:55:01 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: gcc-shikra: Add support for the USB3 DP PHY
 reset
Date: Tue, 26 May 2026 18:24:43 +0530
Message-Id: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABOYFWoC/03MQQ7CIBCF4as0rCWZUqDSq5guYDpUotXKtMbEe
 HfRLnQzyT/J+56CKSdi0VVPkemeOF0vJepdJfDoLyPJNJQWCpQFo6zkYzplL0dEuXKQmZgWloO
 BGPfeYlM7UbZzppgeX/fQb53pthZ+2Z4/vau+tlbu387zVC6eTywVOE1DjLEJ0N3Vhw+eSeJ1m
 tLSVc612lmHtYam9uDawQZtAobWgw1Be2+UQQ2if73eVcTeivAAAAA=
X-Change-ID: 20260526-shikra-gcc-usb-resets-d50ff8a6c319
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a159827 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AmwuVZndQLEihibSxTgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: E0Cbe7V2CZoT20gzQma4RmYXDP2216aH
X-Proofpoint-ORIG-GUID: E0Cbe7V2CZoT20gzQma4RmYXDP2216aH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMiBTYWx0ZWRfX2y5jwIuFT0t+
 iq0vn2/59ZdkebmNcmwKItctbFxGrAAfvZPAVxG7wSrIT/UHdLW35BMSW3M3Tf3/35E9pTp0HB5
 3XPt0uOHG/W6s8T/U4jTeC1yJBGtP7ZrgHR4hJCKEENLOqgpd4LGE0OSd3NT+wVmtjJoU3VEFXV
 xcJSR9fSKNlmlNgt6SGNTe2gnsVg2UCc3HpZOtcpU0tTPBEOgG6NHRkfTMlLNyUVmde6F/HmxM5
 sFbrG7A3I6dRv+zXC7STKweYzsesyUfKYcImEW+fD9IF6W+YQ6Rlko37WKamxTfZC+lhj3IaM+r
 cRI08H3NXLhGq0hwvCqTMX5/KJe39y3LgVzNIVeBLrj4EI5CA72luPMeAOqxBK4LV/+gdbv6fQp
 tBcxO/QO/fUVy/5SzAFAb6izkmBOmqmQwpf6INY9ndn47ryn0R/Wjo1/fOrgYnzepdv49bbsIZ9
 innv/juDaizvl89vhJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109812-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75FD15D5EA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings and driver support for GCC USB3 DP PHY reset on
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (2):
      dt-bindings: clock: qcom: Add the definition for the USB3 DP PHY reset
      clk: qcom: gcc-shikra: Add support for the USB3 DP PHY reset

 drivers/clk/qcom/gcc-shikra.c               | 1 +
 include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260526-shikra-gcc-usb-resets-d50ff8a6c319
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v2
prerequisite-patch-id: 5a0fbdd458785da2d0e850c851a05046672ecadf
prerequisite-patch-id: 1f98e515a52bbeb25e2a960a804afe16c6a472a1
prerequisite-patch-id: a64476b2ba6e0f2a55928baf72ec32672ee0123c
prerequisite-patch-id: d0c8651205232862b40f942929e1efdaa3084eb3

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>


