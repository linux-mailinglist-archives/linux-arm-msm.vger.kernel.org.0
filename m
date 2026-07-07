Return-Path: <linux-arm-msm+bounces-117415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DSy4EJCATWoL1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:41:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B18F720305
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:41:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WwY2ZF0Z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HZbOICoM;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117415-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117415-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5067231099F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 22:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97959480953;
	Tue,  7 Jul 2026 22:29:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082503DC857
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 22:29:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463374; cv=none; b=J+xc0IbS6cT3xpVbDmNRJpRT1hzkLSSIuDYULSMnCLLZLzs4YutLVbRaf+vsiSDPBaYyh9ZbrFI70PJMnsP1kRCDh9aDXG0Hl2uy31U/a3dVgVpqdbq99Bftv7402JJwHMtfApw1UZ52ExACLGpgtB+G+JGeUzN1OaLkODe1JLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463374; c=relaxed/simple;
	bh=mn+e/RylLLe8OTePgCv2X/kFcuAkbIe3sFltrQBvOOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NspXPOF55G4jZ7Lqdc6gDqxTN9QRczp7hgmRY5J1FNsqvGHbqtWrN+KSjA+iP+fEHPAjeZfFCQpxPvKJwzkuFgWZNv4lMxLzTeyJMMw/mY5hbpjiUbM4DWf1SJrqvYL/DKvLLqVHhjS7E8OCjUwk0gbCaEritTnaLuCfKvF4NlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WwY2ZF0Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZbOICoM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5RPu490995
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 22:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=; b=WwY2ZF0ZwrPiDpbq
	+FDDNdtyrKM2wYanMnzIYjpPDBXf+tJ1dsXcyT45c0YG//FMXglaPU/0KGrsxi87
	3YfxjnYOWRet+Lqy+ZVG3cwFpGC/mVPvX/WHnqQ6H+misgMQkFQFOQ3Xb/ltypp9
	NP60TYPZ1CMilAOnZT7v2oXrFLso2ftIPuprl1doAUDd731aZeGMOlvBuUgjE1Ay
	pkP3eUlg6M7lG5Q1GwOmjsAsO3tCl4N5tkMFJU7xmxyNcPOmutaSAaczKpevOuSq
	qOmAKf3KHJ5qUvInF3v0N1MIn3AWdr65EiHBDUdLqcJ4c6+BI23pEdtIPKE0yaLI
	SjYfNg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9ac2sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:29:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-738627c7908so4109137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 15:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463371; x=1784068171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=;
        b=HZbOICoM0uU7qFJbYiMGJOfivvmdtb6eEAHjsE8jwaSB9J+a61xFhiB2X1zWfht5Yq
         LS7i650LHoU4B7VxVXtXFEM0I/hrrejWCua5xkxHHZ8Jh6giHQcvAfxdp1Muhot01kPQ
         Uw2n6feY3d1w3KJ+tCdhOreRcuw0fB2jzuaLAKz6Yo9+SGczD/B9aby36vQbjm5PxUI1
         QR3J5+d+KF0h4ImgKN8fujv3iIiIwa3KxOV4EPmY4Is4OsoQ2uSzFY85SXUvazqlqHux
         J3zUZOclRqzgN1wVoUKnLjOrByhtI5y7VWRbbyzq7nK27Ub5LJCB8ui5e+taHCuEq+qW
         RvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463371; x=1784068171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=;
        b=CsKnwEBzBUzmL86zQ0HWpORvraJemdJSKrubqCWG8NH0IMrSo0j++Jb80Hj+l+nvia
         QiyrmrswRUA9CeSyGwSx5KnUxUHsdznu+dpK67X/R42DwRsHCiX9cEkTHsOpWc4vKu51
         mnu4C3utkur5HpCYq5AG0SSYxeF+H12rmYc+Pv0QPCXQ7hjlnsG2kfU3mtjCYTSwwEeW
         7ZxCvSymDBiU4BdaUDisqqMSkYDuyq+YgkEt5hGvGHm4plSIHlQweTnBYnIjji8bZyBh
         pcn5lL8TIO6gKrx5ySyosJ9zyw1IgJmpcjlA9rgKoQ3Kd450SUkE1BTKNCJ+xSl+2USO
         6RCw==
X-Forwarded-Encrypted: i=1; AHgh+RpUcoctRe+mhdoVMaHb9NemRzBHL44/ooPIRM9yHUB9JzVBhkS7fqQKl6AdCVfanVQbTDq2HgcDDzk0hv02@vger.kernel.org
X-Gm-Message-State: AOJu0Yypvjo9AB8S0FOMu3kVcXguTWvhnosqms2dFHWs+XOydJBFGgU2
	AygJKE7wuVEHi5vKJDmSBG8L5xlvhYV54im9Q+lHpzy/HQPqZLMz+nQ8D+uxn0gTiUE4VcaWlX+
	ePNHC+j0LhqaPDZBEgiS/cuqne52KSUfJbd18e1SN1m9xN/vDKeIxZgLrEGvn5QVNLF7X
X-Gm-Gg: AfdE7cmqm8l8IMFx6Gr88JI/IAqTUuldQ3APPNIL/poSaPQXgzaLJeBPBhOftKpR/W1
	pRYuyiUvsMTRVCA8tkVeApHsCAqwZ7WHGAWIvLq9Z7wWCk3TWwiS9l8FgJXk6v7VePGRz9xUkg8
	fk2uDOYeQlZ05ET+zYpf+rsL/4ef3+nJJ9ik9eLhnMyePy1Agc/MWq7PTxr40e3rgzG0ciIWYQA
	3X4Qvui9QD08wePxD1FsIZZr+YlTot78/QT/xAFYSiRmklcg4rz/cbILJX8boNUYGkmlVpzG+ro
	998AbElMFbFsylYYk8YCvTd2+6MmaGXEC9/AEw/TRRoxAJ+iOrBmXvE/HUWKLzHVIlure07jROJ
	97V48kvBwaQbjo7+8oXYEL5gtTr8J6b3JwXHymxfjUBLcpZbYfMiUeIjWB+AcXjPqZZrWvMvdIv
	oUfOsGuRHszYGb+4OqKDkrX8zJ
X-Received: by 2002:a05:6102:148e:b0:737:fce1:3277 with SMTP id ada2fe7eead31-744b7de56d8mr3946575137.26.1783463371167;
        Tue, 07 Jul 2026 15:29:31 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:737:fce1:3277 with SMTP id ada2fe7eead31-744b7de56d8mr3946559137.26.1783463370665;
        Tue, 07 Jul 2026 15:29:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:49 +0300
Subject: [PATCH v6 06/18] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-6-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4931;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jlbWJ6BnLAb8hDHnLKbkTUpBs5ZGORWEUsmmVGvPwio=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2pwoX8RSP5D7/lr/H8aso+Rq1OUM4XYc9ef
 vhBiQ4CYVeJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qQAKCRCLPIo+Aiko
 1R7NB/jZ5Q9TestWO2UwnumbeoAbma59S0SYWDnBw5DEqBV21ky+K+U6sV5YfehVsquxgPYEhXE
 wEA4O7WEI/2+r59KSk21VvvG81cOpDBABd3ZG3ntKJ1lEUEnFS/EPoYIqFxleaeDdb6Fko2qzd6
 yf1IjwmxXiffeUXdDif+BK4qd9T8qyGUdHRINCpPJCdQfLBHijY5bVpI1KxXobdkSX1HHusUH6f
 hXY8Nwg96hYp3/sCcSq3hn7zpDnEwCVKqXIAjvBAeiHMJitTia+DEsbfxMS9ImEI5kbldIYMwHy
 feouNqXUc1Wi0GoWWXYQTk/8ifyW1HOcjVKYZADPdZ23KsE=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: R2x946Ha6SwI_lqxlZYdPCNUZhOFhpfZ
X-Proofpoint-ORIG-GUID: R2x946Ha6SwI_lqxlZYdPCNUZhOFhpfZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX+659yT1L655W
 eOJ2g0dWBz3lR1ATUZskM+XZ1kOhqwggriuYfjlzaFPJkKJCHJ/ojbiDF4FZXc1c5z+GVTbc8vZ
 Ne01Cvg+uPJY6cpHMxlNY1L8K3eCfz4=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d7dcb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX9usoCaw8iKxt
 OHjuMorWecA87CFrywrT5uKB5y6tEAkqCkEebl7/MTf+LKD1R7KBlbboDwGfIQlQYKQ+VPMrdbv
 J5EuM6APCBmBkxs7+icAwNzNbycUtnxZ3bXVB4bF2FQbBfUsOaxaGZtFCfEIdVcudV86B+9RuEk
 nRm6NCdBK2r4eY5dZsAPslowRfQtpCUOWMIpifquUCjp4ZFqiA/baLNVJIacWPFRlTgNUrO6NvG
 qqOaGohPw/kouEK2j/yFEb5ntCXInjqh/4ToTBmtPqxRWEyONO+wVwDlG0BhSegoicacO//kQdg
 J0k6BtjP6+cdiybsE6EufM90uB2X2S/OmHabR1sXluGF7h92rpBREWupkZDtm12P8ftOyTb3lhp
 NFGVJZF2ZaMtpVkGVteSZ4d1m6KUoyhI3RzrR8PRMlKdEvCFnEi8NbiC/rJI8kG+HgJqN+p2FXs
 cgy8f2RT/evcO9259CQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117415-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B18F720305

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The interrupt_init sequence is currently shared across all supported
devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move interrupt_init into a vpu_op to allow per-device customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 2dc121a3f5e8..dd2eeae0d9eb 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -46,4 +46,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index dc02ced1b931..c3b760730c98 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -262,6 +262,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -272,6 +273,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -283,4 +285,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index f608a297d4a3..90ccdc0d2a07 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -369,4 +369,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index a49113b0da23..375bcd923476 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -31,7 +31,7 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-static void iris_vpu_interrupt_init(struct iris_core *core)
+void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
 
@@ -485,7 +485,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
-	iris_vpu_interrupt_init(core);
+	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
 	enable_irq(core->irq);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 21ed4c9bd5e3..9151545065cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -23,6 +23,7 @@ struct vpu_ops {
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
+	void (*interrupt_init)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -44,5 +45,6 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
 void iris_vpu_set_preset_registers(struct iris_core *core);
+void iris_vpu_interrupt_init(struct iris_core *core);
 
 #endif

-- 
2.47.3


