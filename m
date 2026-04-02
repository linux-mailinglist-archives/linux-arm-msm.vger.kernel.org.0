Return-Path: <linux-arm-msm+bounces-101412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMyADt7czWmliQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 05:05:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7009382F18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 05:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01564300D6BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 03:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEB2353EC0;
	Thu,  2 Apr 2026 03:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSDRflnU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GURm9cqS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09DA34F489
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 03:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775098903; cv=none; b=q2PYThRq/0CNyAdDUqO2aNVjB3ziFDK/uaEseoYaLCimTbwqJCXNtiTDHsYHGIMIh166YdsDhDA5nCf1V43rYkdysco/SRp94AkomFnPjYSrZAbzXsdDYpFsQNO7rO3h8E9XfxRpZhy4t1IEE5L4i4DjudOP3OyRoPaM3NCJfek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775098903; c=relaxed/simple;
	bh=f2v5SwwFgePL9gIso6GzVLr45Q605cPfPF219lREbvE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RO3YeWt335Tc0tSdnLXKgBYWfUiBqnYIyoiIWHborBUdDEcwFXg7DmiW7TEa/F9OTGqDFib/EpdJsoOh+gxcUXLp8cj2mgiSc6s8MVdFVEaV/Wxug9ubbLhZGgpqyGsAxdoOtgTJIbi/butLkoaOu7orr9fiSuF+KVSOjAV6vvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSDRflnU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GURm9cqS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4HYu1965355
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 03:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oRGv2sSlVdsBDicGh/FSno
	6dDdTvkWE0GZ5eJYt+YxI=; b=XSDRflnUfutXKvSChnepvq6OZQicV651dUOf4z
	0koHefBnt6qTTB7H79hfBBbSj7d5Q3nXZHZ4orJ0Yy2M1nwiB5kAS7cr3mMuX1BQ
	gHklt7j2oPxS0rvV73HSnCkDHTPaVrPxnIJyo1g6k1OP5UqAWvNq/eGHMHPUreYd
	sjoN83abCNW+/bOMpmvvRfl2Hfx2p7EKQCwL5bkddsY+xKq1eyM8MrRWD6oC5OTx
	3srqIbTiLgAc0CcHkbJfLhZVI4VhdBh9V5oRd5EF+O18ZvXDLDSYHBHmcYv44tEl
	yHnfdM9Q+NS44tU4cCYKLPMSEFPNX4r/gzHfL4d2NShDbLNQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h0w47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 03:01:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so544173eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775098900; x=1775703700; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oRGv2sSlVdsBDicGh/FSno6dDdTvkWE0GZ5eJYt+YxI=;
        b=GURm9cqS307HBknbVngJ03J/vM4xyPx9hqnRio5Qp4Gn/QNIMM5BVLq+1jX+IXSOrp
         ZsEZYVD1PAuo6K2QIVYx/X4/GDnhMFz9TRv/wFoe1kc1V0U5n7/Z0+cBCvJIde6lXc29
         F0V7QVDr89B5szEu2AYfoNZpEOgLp4DGCjDvdAVRtzCZq6FlKoLRA9CFnK5DVMn+5hsJ
         j9/a6PFbcx7pAGUmjZRTa7z0tUYJU70lvKkqiPdlQH+x8o+lWXvRCOeyIGHX6Gr3YAP7
         D1ze1BR67S4L3tOiOF3HdI4uArM/yBKh03FYsOXIOwRZqsflqiNMJwHnDudj3DqNiBso
         BENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775098900; x=1775703700;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRGv2sSlVdsBDicGh/FSno6dDdTvkWE0GZ5eJYt+YxI=;
        b=jan6Whi5+Gwzt+Tls8F+e6qdRAuNMhh1jAgKRMa1bc3nTXisdCDGICK2XnLF+qriKm
         OtNzCSME+PDEz87z2vmXI9ihLOi3zYVYH72Oldn5wVFwRmWFwuzfP4WLN+Z+r0M04nax
         8+St9yVDjQgkzSfDh1tHnB7zjdadfeR8bdlTWoZLBSk+UJxzezu92qkr242ONacy2OZX
         +NWwh0WFr/fecSQ6W3gAAXNBGXsJs7KNkJgITHcKacsufzCi3w5rpaCu0inGxI2lclF1
         E2drt3WGUeQ6l1pyawoiczFfiJ7EfNkmGy66RgagV0zmGtr1MfCIK5XnpSnNiGQr7FiW
         fcXQ==
X-Gm-Message-State: AOJu0YwpiwzH2BxUM6LGwc39GKTpMNXr4dgKOET6CtaUAjcX7ElwETgL
	uZCoNzxdv5oUVqBva2YWpcPYi6bM7O7R8UFt5+vmQk2X5z9VevhIDSor+MIa4wf0SwMb6zK9gbk
	5czN095qlb7sjn9Z2G9hZju38ESyHnao7SwHlrZIej+qET1vRenHgki62DXjs2im9pdA=
X-Gm-Gg: ATEYQzwqqIIqJOY8a8aaiD00+X1ePzLdqyLcIyH35dwLwoGVDySrPpr7PGoJmaFa5T0
	LomcT8dmzJThmnUvcXm4h7TZZOBM0gl+eWy+ihlsXZToJuiKA7jnobh24t+q305dw/gn2B/0sUl
	H6B3D3VN1Y7Tg/tD8b+W8wQu9ckWbBMBAHrfDFAPrp7oCxBOxPDzmPPi4kdM7DezT2gkMViwyop
	FlJeo5IX0skST2kQjs480uFN1FMqMLbwl5y2GAwLWqXjIhrc7hMNZu/8N4QHKd9wzNQm5ZetGqd
	cRQXZ1I4xVbydIIFzmNOkyaM2nJn4VZ5afq/heLYzakJV9bo1Bch8PuploI3ISeVES+wVyH0S5d
	rgY+rhScmK720H26WAkwW+sovTwHcKRS/QCpEpaZGMPWwXbecAOLLiCmE7sM6EJDnP81exNq3mw
	==
X-Received: by 2002:a05:7300:ed0e:b0:2c3:fb9d:cd04 with SMTP id 5a478bee46e88-2c9325b08a7mr2875860eec.17.1775098900192;
        Wed, 01 Apr 2026 20:01:40 -0700 (PDT)
X-Received: by 2002:a05:7300:ed0e:b0:2c3:fb9d:cd04 with SMTP id 5a478bee46e88-2c9325b08a7mr2875839eec.17.1775098899342;
        Wed, 01 Apr 2026 20:01:39 -0700 (PDT)
Received: from hu-fruiz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf010d7sm1287044eec.25.2026.04.01.20.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:01:38 -0700 (PDT)
From: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Subject: [PATCH 0/3] Retrieve System Cache Table (SCT) descriptors from a
 shared memory region.
Date: Wed, 01 Apr 2026 20:01:33 -0700
Message-Id: <20260401-external_llcc_changes2set-v1-0-97645ede9f6a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA7czWkC/yWMXQqDMBAGryL73EA21B96FSkS4qcuhFSyUgTx7
 gZ9HJiZgxRZoPSpDsr4i8ovFeBXRWHxaYaRsTA56xr7tmywb8jJxyHGEIbHUafYTA0wdz60XDs
 q/ZoxyX6/++95XiPBT5BrAAAA
X-Change-ID: 20260401-external_llcc_changes2set-5ee118ac7152
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775098898; l=1367;
 i=francisco.ruiz@oss.qualcomm.com; s=20260305; h=from:subject:message-id;
 bh=f2v5SwwFgePL9gIso6GzVLr45Q605cPfPF219lREbvE=;
 b=BGgjtTogITYB5Gl7DlQ3B2Zoh4XHOWyNyXTzZCG7e8ngvUF+vbxzbkpIwOurWuxyVpY5bV2Wc
 1Wg5qAFrGDWBRIXCv26yTCLmCR97xXh4g00j4wUfCxOhWzmL5o79rNn
X-Developer-Key: i=francisco.ruiz@oss.qualcomm.com; a=ed25519;
 pk=Gcv2CX7iHozjnQ4oK+9fINmBiQTmVC4SpaZzoM63CHE=
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69cddc15 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7fDgnTYA3Q_ah9AnCHUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: DlvLzOdWoWc5mSX7I7-8XHz-mVE5y0la
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyNCBTYWx0ZWRfX+Mwck2IZWReY
 JZq8n3KZUzzgaYrE/v17XrBEdBiMlA+VrckomQLeuVCF8Kl89YEeeGl4uDzJxl7pC1QyHj0zaBw
 1bXXt72311qpn2acYf+Gm61u0+OlUppfBR8FMnb7KTiISsPBoHlECBmPtP7dn7dNT15RFjHaasm
 YGGyuPHPqNNiwSx+VoKG+F/9QIemIXygpjOP6m3QzVbvMBckaWUjppxpciR3VO0EMnpaw3NnpJ8
 +H9ruP8fG/DXcvokZH7O78fD2V17nfJ7VRUXftgCRUKZyPo5BLndLIvXRz8QlZZT71JMYv4Hx5q
 ByqdWeTqhhFx2HXs2bADwN5flFyjrgE87DL6TzcQpfR6/EssMgX0H2T5sJwSocyQx7POFunmYqM
 UdbGT9gijCd2tMer5m3eqIH1AyJaqM1Tf0NrWlNF5oq3kk8PbUANfvq8kNAPbmilKbhRBqetA/n
 6y4SJX5YZ/TKvYWcSUA==
X-Proofpoint-GUID: DlvLzOdWoWc5mSX7I7-8XHz-mVE5y0la
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020024
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-101412-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francisco.ruiz@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D7009382F18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On newer Qualcomm platforms, SCT initialization and programming are
handled entirely by firmware outside of Linux. The kernel is expected
to consume the pre-initialized descriptor data rather than configure
the SCT itself. The LLCC driver therefore only needs to locate and
parse the descriptor table provided by firmware.

This change implements support for this mechanism in the llcc-qcom
driver, enabling SCT consumption on platforms that expose SCT
programming through firmware. The existing behavior for SoCs where
the kernel programs SCT directly remains unchanged.

Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
---
Francisco Munoz Ruiz (3):
      dt-bindings: cache: qcom,llcc: Document Hawi and future SoCs
      soc: qcom: llcc-qcom: get SCT descriptors from fw-populated memory
      soc: qcom: llcc-qcom: Capitalize LLCC/EDAC in comments and diagnostics

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  29 +-
 drivers/soc/qcom/llcc-qcom.c                       | 301 +++++++++++++++++----
 include/linux/soc/qcom/llcc-qcom.h                 |  44 +--
 3 files changed, 298 insertions(+), 76 deletions(-)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260401-external_llcc_changes2set-5ee118ac7152

Best regards,
-- 
Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>


