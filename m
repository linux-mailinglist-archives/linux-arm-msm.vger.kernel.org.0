Return-Path: <linux-arm-msm+bounces-114974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y3MyNJFHQmrn3gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:23:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A4F6D8DB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:23:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LEAYJGLb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V1y9DiBS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114974-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114974-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6693030117B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6303FC5C3;
	Mon, 29 Jun 2026 10:23:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22163FE347
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:23:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728584; cv=none; b=GHaByu14SG3x1/huTO9YTWWjRF+1+KLgUXuDrEISTN8BN0OKZfmzq7WoiPS3diVXjWtQkKdD7Dw39GuSd95PyaXXuWx8hMuyu7KSAIksNxVBtTgssc0EIQjjovvU72OSRF1ySB+eOQqcKbM/C/z7UC2bnAccbn1RNV71eT90EpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728584; c=relaxed/simple;
	bh=u1frYAFR6bfYGD6YC8Xth9JznaLh20b1r0htv27bdJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bu7FGAw3JpyN9/BWjWhmeckv5o2XFghrJMY4Xw+yc4k/clDJearrbYwrWRZComg+/iQIGu0lL8l2l4V+/YlES9ZqMLFVF008N0Pp+CytHy14nS4+ZzdcBnfdrjSAGgAb2/FP1a4yifrU1zeUDuV3XfzA/A64yZ3LIz2ssautH8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEAYJGLb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1y9DiBS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6r14D2076291
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bX52AaJ2fnPYL1w2PE3bCZ
	oDEoHC3zsNqpkKhweRa4k=; b=LEAYJGLbqvottp/5J0GljY/WkjrCJjA3/Tng5s
	buqZUDmpQZS06BeZLeCr8dEEZKuQMdpoxnL+xFXEUGRKJyX0atC4tJrLYyxOQgSN
	6z8lCuCM6frxlTL+0qUnoNCNszEcMOF9p3W/0zjEaVARaJBc511Xa8+GR/VNP48M
	Dbl4Y/Ut+mRf09pGFqUri2gi4OdnH56GHwp+SKU/9hRJkLS34uoUHjgUVD7Wj++4
	KDqP9HUsyWC9fPscOc9lI7UW3drW0m4+KRygSJe1OUBSOWo6w1XyweNdJDPVPZud
	SbCcYzOGnTpIfTc/VzpW3X0Sn4rtc12DPiVdGbpK0yDMNbzw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gvkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:23:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c62861b3bso10126394eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782728580; x=1783333380; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bX52AaJ2fnPYL1w2PE3bCZoDEoHC3zsNqpkKhweRa4k=;
        b=V1y9DiBSEboIzMN2DRSmhMch+3reFOReCkK27P3MtIvtug+anSgBIk/c02HhwJ/ZzP
         kRYmBkNgDIV26YeH/IHAE38A5JOJxlEVxZY9lRZnTmDJj7EDvkA4nZ/XG5IVWktpuVJK
         wGRDOr9Ctav+CkUf53doiP8gTUEB92hc3ligxSlZQwA1+rM/czikoVMsQzb9Xnswouus
         8acW4OeNwrdAX1Eo05AprZSMsGuIDzMes+IYhIohSz+ALhRNovlwfviOZjJJ7An2fwJd
         AOxiytB/+agGqX5xsqLChWhQ0QQpq92RlXBw78a2WYQfLthtWjZIcej+Kwkn19uUymA+
         eQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728580; x=1783333380;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bX52AaJ2fnPYL1w2PE3bCZoDEoHC3zsNqpkKhweRa4k=;
        b=L7XoNO8enSJsF1gPjHwj+Stez8ayhCaGjkSddvOxaLMjMv2/DtkzIf7rvWTvrDCmlB
         4bMedQmFk5Z4gNSVg9ss0RXT9p6cWLxqtmUJafcJA4Zh0yLfoxnB9/HwRon0y74kcvH3
         ipjA98jJoB90xNlfCnehkjPRaSswsM+HYLXxett5i6jsg85q5o8Kiw+mmg0XJKtDMgxS
         zKP97v8tsy1Gw+P8Dvn4ewSucpeEpIfXHjoD4p6XP6WVDKxEQa5JiNR1+Mb0tlaEzP3k
         TbzsFItHvzlGS+8ZuknSWmVkdyOFUinDkH4coqEIHCyq+xK5AYl2btYN7RRcZYWCmLjY
         Y8zA==
X-Gm-Message-State: AOJu0Yw3d5KqRG4ZiQl5kCxTAjZg9RZQjmKOjAfQFAemXerb6iwrgXg6
	jAwXwjbbN6XRsWHwDD7aOtXF/fdw3WmqE3HHwJ//PB20FY/qbHIVUs1AdEk1f3aGsi6Ltz/z1wJ
	tjEigznd1/U6tmVzu/MBM6EkmBcxTO7FmXPYVQXV1qV4ivGAF9zQmxwZLqHnJ452/x5/nRfRWh1
	/w4fI=
X-Gm-Gg: AfdE7ckR6Jrs9r/107HP+PKMMGqLvPKEztxJpx9ztAKaM9t2bcABq+O7ARN8YxtYwKX
	1/F53e5O6mAgaJqYFoJfq4wavYrXHAaAqXtqFakN8EK/L/NKfWRVYTWdhyE1aGxNj2Rp46ZNhKm
	C3XqotbFofUaEMT2VHdC9MpFcO3gjYpHpYEPnN+VlZ++c2+saoRXw1wez+HxYjao+FxcLUn0m0x
	bbzqOP5nFHI2gf4Rz01C2JxyqT+sA/OgdTDsfR5lvKsnixOzt3KPmQqRIGstZHTt7g+1L119Ihq
	3OPb7WgJy51e1vuI1b8AmMrm7sjtiSDdbbHvqyIo55lOZ8QFLeshPHltraMvZoqnozXnfUNTz+P
	SLdmIXBEwKTreuJc7yC2hNmhFc/FR3DxQnxUzM2znLJF2PZBP9pVRp/I/JWWyfgsFKEboBRdAzl
	s=
X-Received: by 2002:a05:7301:3c8b:b0:30c:ab97:d7ae with SMTP id 5a478bee46e88-30cab97dc0amr8969965eec.40.1782728580043;
        Mon, 29 Jun 2026 03:23:00 -0700 (PDT)
X-Received: by 2002:a05:7301:3c8b:b0:30c:ab97:d7ae with SMTP id 5a478bee46e88-30cab97dc0amr8969924eec.40.1782728579366;
        Mon, 29 Jun 2026 03:22:59 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ab6sm73554440eec.15.2026.06.29.03.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:22:58 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 03:22:57 -0700
Subject: [PATCH v3] arm64: dts: qcom: glymur-crd: Move common board nodes
 to shared DTSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-glymur-mahua-common-nodes-v3-1-98cc00943359@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIBHQmoC/43NwQrDIAwG4FcpnmfRuBXdae8xdtBWW6Hqpqusl
 L77bC+7jDECgT8kXxaUdLQ6oXO1oKizTTb4EtihQu0gfa+x7UpGQKAhDBrcj7ObInZymCRug3P
 BYx86nTAXzHSclGoVKvf3qI197fb1VvJg0zPEeX+V6Tb9R80UlwKloBFAtDxeQkr1Y5LjtlaXh
 jY8wwc8UfELhAIKQxUXkhkm+BdwXdc3HpgSRhoBAAA=
X-Change-ID: 20260326-glymur-mahua-common-nodes-893fd80808cb
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782728578; l=18667;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=u1frYAFR6bfYGD6YC8Xth9JznaLh20b1r0htv27bdJs=;
 b=oNMsLETBYHJQ0MJpVXC5u6BP7TU74kr5AvPodcwobYNhkF62zz/sI+ZK+NfiHba+s/QhMBjtk
 f0qXG2eKlbrCgwOavxl4hElUeKYDz0dyRUcLVEes1VXuJ//m1PAgJE2
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NCBTYWx0ZWRfX2aILUmips8Sp
 pUEtZsM7a9UAELsL40Ndo+ev7FceURGsM9p0ttmOi3qX3CgX0XYyVOLv51vShzStN1tDlYCT3fc
 r3nI/Ojx9IQromTV9ecYuU/C+mI244o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NCBTYWx0ZWRfX4DcvoAxcpuoT
 D6gY7rkmdN/JL428WgEa7B5s9IwsO5jYMrpjcqfG6S0oSZcQ/CnUVE22bpQ8VlAOK9A1jJjsxlJ
 JQDgbAUHbczL23M+ele8tLpn3SpiOlKHpzPVm7EpncY+VcA/ztxPnuFwaM8Ze5bDnRt7pnxcTtD
 Y5pde8etveptNWOFi2/NMr3mdc6NvkaINTci8UljR9rYD9DzDFvx/o2a9YQDXeGphPOvsgMf1yN
 La3eA8tiUjODUL0j+3vDYx0G7QYcnVEs62tYxbbt6CQiQo4HVLZsXA0e3ni5Huvst/wVsMmbIUF
 lTsn5UsUDZanGa8HNMGPguzctc6pknPf5DeL8qbN1QEJzvpLM+b0y0oNpWmm7Pl5SofwcVpz+Qk
 S19bFtXu1W+c75NyFHCbmEqKeMpn7q1ZiED/98q6zWz06Qw2ls9t9/WBRT5zRUumAl5deatG4Sg
 1A+kp6b6M3hfvp4OVZw==
X-Proofpoint-ORIG-GUID: sYwQrzYvc5zIFD9qiF4KGNId7maV01hh
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a424784 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EGdizXfL7dkd5kc_kBAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: sYwQrzYvc5zIFD9qiF4KGNId7maV01hh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114974-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sibi.sankar@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:gopikrishna.garmidi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68A4F6D8DB3

Mahua CRD is pin-to-pin compatible with Glymur CRD, as verified
against schematics; only the external peripherals connected differ.
Move the common board nodes from glymur-crd.dts to glymur-crd.dtsi
to enable reuse by Mahua CRD.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
Changes in v3:
- Rebased on top of latest linux-next
- Updated commit message
- Link to v2: https://lore.kernel.org/r/20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com

Changes in v2:
- Rebased on top of next-20260518
- Updated subject to include glymur-crd scope prefix
- Rewrote commit message to describe the actual shared physical hardware
  rather than the code-sharing intent; the commonality was verified
  against Glymur CRD and Mahua CRD schematics
- Link to v1: https://lore.kernel.org/r/20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts  | 399 -------------------------------
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 396 ++++++++++++++++++++++++++++++
 2 files changed, 396 insertions(+), 399 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..6125617de82a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -8,198 +8,9 @@
 #include "glymur.dtsi"
 #include "glymur-crd.dtsi"
 
-#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
-
 / {
 	model = "Qualcomm Technologies, Inc. Glymur CRD";
 	compatible = "qcom,glymur-crd", "qcom,glymur";
-
-	pmic-glink {
-		compatible = "qcom,glymur-pmic-glink",
-			     "qcom,pmic-glink";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		connector@0 {
-			compatible = "usb-c-connector";
-			reg = <0>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_0_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss_in: endpoint {
-						remote-endpoint = <&usb_0_qmpphy_out>;
-					};
-				};
-			};
-		};
-
-		connector@1 {
-			compatible = "usb-c-connector";
-			reg = <1>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_hs_in1: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss_in1: endpoint {
-						remote-endpoint = <&usb_1_qmpphy_out>;
-					};
-				};
-			};
-		};
-	};
-
-	vreg_edp_3p3: regulator-edp-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_EDP_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_misc_3p3: regulator-misc-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_MISC_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&misc_3p3_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-};
-
-&i2c0 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	touchpad@2c {
-		compatible = "hid-over-i2c";
-		reg = <0x2c>;
-
-		hid-descr-addr = <0x20>;
-		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
-
-		pinctrl-0 = <&tpad_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
-
-	keyboard@3a {
-		compatible = "hid-over-i2c";
-		reg = <0x3a>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
-
-		pinctrl-0 = <&kybd_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
-};
-
-&i2c8 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	touchscreen@38 {
-		compatible = "hid-over-i2c";
-		reg = <0x38>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
-
-		pinctrl-0 = <&ts0_default>;
-		pinctrl-names = "default";
-	};
-};
-
-&i2c5 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	ptn3222_0: redriver@43 {
-		compatible = "nxp,ptn3222";
-		reg = <0x43>;
-
-		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
-
-		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
-		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
-
-		#phy-cells = <0>;
-	};
-
-	ptn3222_1: redriver@47 {
-		compatible = "nxp,ptn3222";
-		reg = <0x47>;
-
-		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
-
-		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
-		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
-
-		#phy-cells = <0>;
-	};
-};
-
-&mdss {
-	status = "okay";
 };
 
 &mdss_dp0 {
@@ -217,213 +28,3 @@ &mdss_dp1 {
 &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
-
-&mdss_dp3 {
-	/delete-property/ #sound-dai-cells;
-
-	status = "okay";
-
-	aux-bus {
-		panel {
-			compatible = "samsung,atna60cl08", "samsung,atna33xc20";
-			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
-			power-supply = <&vreg_edp_3p3>;
-
-			pinctrl-0 = <&edp_bl_en>;
-			pinctrl-names = "default";
-
-			port {
-				edp_panel_in: endpoint {
-					remote-endpoint = <&mdss_dp3_out>;
-				};
-			};
-		};
-	};
-};
-
-&mdss_dp3_out {
-	data-lanes = <0 1 2 3>;
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-
-	remote-endpoint = <&edp_panel_in>;
-};
-
-&mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f_e1_0p83>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
-};
-
-&pmh0110_f_e0_gpios {
-	misc_3p3_reg_en: misc-3p3-reg-en-state {
-		pins = "gpio6";
-		function = "normal";
-		bias-disable;
-		input-disable;
-		output-enable;
-		drive-push-pull;
-		power-source = <1>; /* 1.8 V */
-		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
-	};
-};
-
-&smb2370_j_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0_1p8>;
-	vdd3-supply = <&vreg_l7b_e0_2p79>;
-};
-
-&smb2370_k_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0_1p8>;
-	vdd3-supply = <&vreg_l7b_e0_2p79>;
-};
-
-&tlmm {
-	edp_bl_en: edp-bl-en-state {
-		pins = "gpio18";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	edp_reg_en: edp-reg-en-state {
-		pins = "gpio70";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	kybd_default: kybd-default-state {
-		pins = "gpio67";
-		function = "gpio";
-		bias-disable;
-	};
-
-	tpad_default: tpad-default-state {
-		pins = "gpio3";
-		function = "gpio";
-		bias-disable;
-	};
-
-	ts0_default: ts0-default-state {
-		int-n-pins {
-			pins = "gpio51";
-			function = "gpio";
-			bias-disable;
-		};
-
-		reset-n-pins {
-			pins = "gpio48";
-			function = "gpio";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-};
-
-&usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
-&usb_0_hsphy {
-	vdd-supply = <&vreg_l3f_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	phys = <&smb2370_j_e2_eusb2_repeater>;
-
-	status = "okay";
-};
-
-&usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
-	refgen-supply = <&vreg_l2f_e0_0p82>;
-
-	status = "okay";
-};
-
-&usb_0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss_in>;
-};
-
-&usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in1>;
-};
-
-&usb_1_hsphy {
-	vdd-supply = <&vreg_l3f_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	phys = <&smb2370_k_e2_eusb2_repeater>;
-
-	status = "okay";
-};
-
-&usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l1h_e0_0p89>;
-	refgen-supply = <&vreg_l2f_e0_0p82>;
-
-	status = "okay";
-};
-
-&usb_1_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss_in1>;
-};
-
-&usb_hs {
-	status = "okay";
-};
-
-&usb_hs_phy {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	phys = <&ptn3222_1>;
-
-	status = "okay";
-};
-
-&usb_mp {
-	status = "okay";
-};
-
-&usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	phys = <&ptn3222_0>;
-
-	status = "okay";
-};
-
-&usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	status = "okay";
-};
-
-&usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
-	refgen-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
-};
-
-&usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
-	refgen-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..1de3a49f49e4 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -11,6 +11,7 @@
 #include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
 
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Glymur CRD";
@@ -68,6 +69,101 @@ switch-lid {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,glymur-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in1: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in1: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_misc_3p3: regulator-misc-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_MISC_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&misc_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -444,6 +540,135 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	ptn3222_0: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+
+	ptn3222_1: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "hid-over-i2c";
+		reg = <0x38>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "samsung,atna60cl08", "samsung,atna33xc20";
+			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l2f_e1_0p83>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -562,6 +787,19 @@ key_vol_up_default: key-vol-up-default-state {
 	};
 };
 
+&pmh0110_f_e0_gpios {
+	misc_3p3_reg_en: misc-3p3-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-disable;
+		input-disable;
+		output-enable;
+		drive-push-pull;
+		power-source = <1>; /* 1.8 V */
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+	};
+};
+
 &pmk8850_rtc {
 	qcom,no-alarm;
 };
@@ -585,17 +823,47 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2370_j_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
+&smb2370_k_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
 			       <44 4>; /* Security SPI (TPM) */
 
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	hall_int_n_default: hall-int-n-state {
 		pins = "gpio92";
 		function = "gpio";
 		bias-disable;
 	};
 
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";
@@ -688,6 +956,27 @@ wake-n-pins {
 		};
 	};
 
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	ts0_default: ts0-default-state {
+		int-n-pins {
+			pins = "gpio51";
+			function = "gpio";
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio48";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		pins = "gpio116", "gpio117";
 		function = "gpio";
@@ -726,3 +1015,110 @@ bluetooth {
 		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 	};
 };
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_j_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in1>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_k_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l1h_e0_0p89>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in1>;
+};
+
+&usb_hs {
+	status = "okay";
+};
+
+&usb_hs_phy {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_1>;
+
+	status = "okay";
+};
+
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_0>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	refgen-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	refgen-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};

---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260326-glymur-mahua-common-nodes-893fd80808cb

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


