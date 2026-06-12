Return-Path: <linux-arm-msm+bounces-112926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /PruJ+LoK2pcHgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 13:09:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3404A678E09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 13:09:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=deeruX93;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ECFl+ZI8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112926-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112926-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E255300C31C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4055637BE6B;
	Fri, 12 Jun 2026 11:09:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD021345731
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 11:09:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781262560; cv=none; b=kYMB2O3bN5xRpUKmh4U0zk3ssFtu7W6RSkPCHepxRe1C8VkNasLnCKIL2HKR9ji9BhCMshLTVcOSvC/XMjR3PoU6uW7PJ1OM3Ln9c87x91CV7c0cPAZte0kPFuXm+dGV6t4KefrahTpaP+5rUUHhwQ47ZRpGj+hlgDXVxFU5WOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781262560; c=relaxed/simple;
	bh=wDfw/CHOszIITkuDLVx+ZNe5U6VnWJtQo2HJs2z4j0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WNfjnVsyWKQlehETlqlCFhDNIBM163f2lRKISgKF6XW5+poKWGnsUTbUVPP7+y1zadWVhJpx7L3lMgycWewrbu1FWerf60QDWs50ZROVvxO+dpcoPxKFma66ED3tyhsFinq2gNKRybvDZyObTEcI+9QOxJmZaq32CHYHd5loBfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deeruX93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECFl+ZI8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CB6ehv3411795
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 11:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qcl8DraQ+00AIYY2fkfL1G
	yLlyuwfktofxLDB/8usWc=; b=deeruX93h5+BVbZDTOAfGp4iI/IJzDJdycC1H6
	toB6/GoPzxuKljb1bv5PKP4ngSuzTWTILEC5dxpkdSuiayAIWvRbKIto67YtmJHB
	qSvboP6pa+ih1Jl9YSnBXJ6RtzltMDqLoC3saDvf2hJz2wwiiLA5iXm/T4C8ZAsY
	2/H4QZOLkCbw6b1tBAkNveZq6bdwjlR12c4zZxj6ZVNPhUgLAYNI8MgjSBeiTyyF
	s76k+Tuc6iqM4gsTb2Oi77meG9y2ZZXRLpVarNoDOx8qq6CmxxfowrFgRVrQOkCo
	wqddWq6HujE49zLEmJsgApnIglOqOPNf97XbFXholcNaZ89Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30gakh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 11:09:17 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963a96abbb3so906285241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 04:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781262557; x=1781867357; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qcl8DraQ+00AIYY2fkfL1GyLlyuwfktofxLDB/8usWc=;
        b=ECFl+ZI81eAuxbGky4z2Ed9kFFcim2g4DU/Dc7Y/NItbX73Q+c0WYqJzJW+fPvTGUF
         b/kVjYCQAnEBhqsJBbqdLcDTnCKZP7yopKH6Al3XnS2siqywRnOjXLQWt5fLwlY++fg7
         B6YZdPrpyzKrrVPRregG9Ajx1vWmPiR6tOG/nEPrGBx1isX4GqWl1RSjCzmOfT/tsIpU
         9PWD7pxfCZVRFC10I4kwZpO1r9pwLKxEybtPr7hjjRcetqJm178+KEo6bqSgm5lpaTHm
         2xT2bJUVW+E9LTG78Efwjn5OGMoW1JM4nHg7jJVFNNGNILmBhxG6n2LBrbjCFWQjWVSy
         ulbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781262557; x=1781867357;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcl8DraQ+00AIYY2fkfL1GyLlyuwfktofxLDB/8usWc=;
        b=rF6M/3MP58JVG5Meo62W/e39aT0nx3y2aDuNKVIMmpKny9w0kbhB6rvWqoprkDPpXE
         /6NUTIom6rahBS4lsWOCQFDc93KqAv66VtcovdOKmZMSA12ge5vnQgsos3z6nl+kaC+g
         rTO2XkZm3CrTDDsgTWrJc/fywMTaA3fxlwSK+gLluuoRcq9LkGjTOLD0NQ6P1LxjShs+
         7q38jIYwaVI+IYbmsqMTOPYSJW2X17LfirW1cG49lDCNDyBUSd16TRGeSRd6W/FX7V6N
         c+HIsSci1ODRrOVR4TYkmXnnu3ovW+VT40up04//bNm+xZFuCHFsuvMwIyTVqjvKN10Q
         M+Wg==
X-Forwarded-Encrypted: i=1; AFNElJ/U2gYCVj+9BhATgya5Yl/kQGmX4rZB+SftIesiDvFybJVEg6/k/zhMzLPM9ggHsl9OxqERPietxpspRZB7@vger.kernel.org
X-Gm-Message-State: AOJu0YzbORPQFT4UfOYS5gj6BUnIIDhRhV+dXuzVuwOMsa9lfdUVlAjO
	n3GBgKxbMizxf9qg1nNEAsc0RY3d9T6OfjhjB+8u3TRHYhwWdJBhBapvngcFR8Rnvt2iUYxBdbR
	ak0ru/EE/SL64s+CpWjt9lgBJi33tvGtrgF4Zz3iSJeqlciDNzj1f1oFBvFTbaJp35Q3Pd+QSz1
	Ld
X-Gm-Gg: Acq92OEn4d4Awe6xdHetEI5etWVMAPXC0HuIKfEBx83orCYxLmCDYJh/Qo0ffG3Yff6
	SKFpWPDzOHAiWMDqYRaWrGurF+m6N8mvylIHclwqyLPi2LNEWZBcZ3b+fpEdeGljf/K4ocK1hXo
	f05mHbzOEZFXwm6L+/tsSv4lb7iO+yqt/9K/4CiRyNCMSK/6sM6kCjoofuOZ/20gh6tXIdbmwSo
	ahritjNjXNiSNOEyOutkivenZ5tmfxoJ0sicKRDiB/N9fmZICPWltSydhiEuEtQWaTcnEdl3MiS
	nVZZq7tGlVc7hQwL5AYt2xy4Ht/J1V2jfC4V8Q1IrZ40gshgIRvb5l9zeeYt48r8x14r1/Yymbu
	fV2faN1s64CuDWLjG8gHFQtadWg==
X-Received: by 2002:a05:6102:571a:b0:636:46ee:2f10 with SMTP id ada2fe7eead31-71e88b14374mr955992137.9.1781262556855;
        Fri, 12 Jun 2026 04:09:16 -0700 (PDT)
X-Received: by 2002:a05:6102:571a:b0:636:46ee:2f10 with SMTP id ada2fe7eead31-71e88b14374mr955974137.9.1781262556225;
        Fri, 12 Jun 2026 04:09:16 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea843d6fsm60403635e9.14.2026.06.12.04.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 04:09:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 14:09:08 +0300
Subject: [PATCH] remoteproc: qcom: q6v5: Make handover IRQ one-shot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rproc-q6v5-handover-irq-one-shot-v1-1-bb688f4446b3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANPoK2oC/yXNQQrCMBCF4auUWTuQhCaiVxEXNhntuEjamTYIp
 Xdv1OXHg/9toCRMCtduA6HKyiU32FMHcXzkFyGnZnDGBROsQ5mkRJxD9dj2VCoJssxYMqGOZcG
 zvxjrk6F+MNAyk9CTP7+L2/1vXYc3xeXbhX0/AJ45ztmEAAAA
X-Change-ID: 20260612-rproc-q6v5-handover-irq-one-shot-759015d0e4b0
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4898;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wDfw/CHOszIITkuDLVx+ZNe5U6VnWJtQo2HJs2z4j0s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqK+jV7qxQNpcpjAllpg5rbTBFeP9P6/lBxRkci
 e5LaW9h9gaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaivo1QAKCRAbX0TJAJUV
 Vo1fD/sEgplgbXh7o5EulS8PYvqjR+SU04OQCTsvKR0nKWaHFOInj1VJsm/56cTHBME4W+3H+ah
 Ju3eDQa58o/DHjq9xCRsRqDlsj1d5loPf96pQTDSRfFfcp9p3ipuONFsHrMlZrA3MMr9uEuqCE1
 rsiIG9YgxHJaXD8FpeEL0wl3vNfYVMTrsoOmedQrZYDp/4z6PyP113dq5o+iVHKnMeVOCO8aCcI
 qFgWeblqGyQyofqilJAmLlYONJ8hjzBQZCYBesYC6lOiUp6a762tLwXOcRK1QFipNfxwWyWWCo6
 ZJGSo52mvVHEs57TyC/I4GvnhU8Mse/DK1+mY/Lc65unYpTB387e22z75H0GbPVRu8AWgOiR8m8
 7ZZ/zBHPayO0re3qrEVET4WdESJoIRYxicAron9dU+iayLbcnpDi40VQhEaxON67eBAc5P3xCK9
 nSdBL0ipdEU0dawbAnpbFCfRBTrSoGIoaMoTxASOacUXo9wxnXfAZ/B7KUIjbLjsquaH35ddcua
 +4A/6xpwqK1Z7axNFOiRu57JGVnKHVCMN9WhHHcKNDd4YzQNUfITfF6pKQfFqdkJ3nraEpVQOg/
 kNUcHyeNMhimX8/YWWLSiajpbRR1yWDKA/Fe34iNDpbJ14gEiLJUONgSIiX2mdoGDeMRdXku5TR
 boanDYHkyy7YzPg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEwMSBTYWx0ZWRfX+462GiHVtgcp
 y0sf2k3X7SNdUfEbe4M9JRHNAUP/pg/l2XP1zShJ+ncfvr82ynmGWT626hnBS6Mm8aJIEZcRDxI
 RjrLZHYk16u5WxBlE08DEYD7OB8ktio=
X-Proofpoint-GUID: 9RYS8DdDzWB-QpmaOfbLjBY55pc6K1xT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEwMSBTYWx0ZWRfX9CRU2YNmbHLO
 iFIMsZt/Pnx22FPHZXaO0ROR4+WlnFVmmXzLZwftFrrIH8y8QlRWntv4BGciptgsalJNKZ0RQLX
 4M3xBSVJizGGqOAopSkpfb3HywyWxZthVrHT9s8sYEVG8dc7VmAuGpiWKOZklslIdECFSqlYQxC
 mb3jF2zTKLHnNnh31d8cW3wt9SCrRTbxxR2HJ04WLcE46lqC0KxpjqvVDXx0Q968K/2Nhhqp1S0
 dCNY8HKL1cN8N++CUt84v/TYGvZr7Ng8Rp5sYQA+lkr+f/ErYOxGAcRX8oxCz4EBYcc1ubKOwsJ
 6RLAA4P4LVyur8DpCI76ts//mGtJRx9o0Y9D04BnoNJLoVyUjv4mcHq5eHa7i1uKzo/ag2YJY+U
 U4fZkhqhby3RAeAABR8iT4PaDMKTtPMrKBMVO0Vw9BmXb2EC/1GJ1+MQJop3YwspxK33T/eciBb
 m+rqdBtbJlLomEGVuvA==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2be8dd cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=etdG8aBnbEAUIrYLCckA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: 9RYS8DdDzWB-QpmaOfbLjBY55pc6K1xT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112926-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:stephan.gerhold@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3404A678E09

The handover interrupt is expected to be consumed once during each prepare
cycle. If the remote processor keeps signalling handover after the first
event, qcom_q6v5 currently logs the duplicate interrupt repeatedly while
leaving the IRQ enabled.

Track the handover IRQ enable state explicitly and route all handover IRQ
enable/disable operations through idempotent helpers. Request the handover
IRQ with IRQF_NO_AUTOEN so it is only enabled through the helper during
prepare. The handover handler disables it after marking handover as issued,
while unprepare disables and synchronizes it before checking whether
handover was issued.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c | 54 ++++++++++++++++++++++++++++++++++--------
 drivers/remoteproc/qcom_q6v5.h |  4 ++++
 2 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 58d5b85e58cd..c66cca05c250 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -36,6 +36,40 @@ static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
 	return ret;
 }
 
+static void q6v5_handover_irq_enable(struct qcom_q6v5 *q6v5)
+{
+	unsigned long flags;
+	bool enable = false;
+
+	spin_lock_irqsave(&q6v5->handover_lock, flags);
+	if (!q6v5->handover_irq_enabled) {
+		q6v5->handover_irq_enabled = true;
+		enable = true;
+	}
+	spin_unlock_irqrestore(&q6v5->handover_lock, flags);
+
+	if (enable)
+		enable_irq(q6v5->handover_irq);
+}
+
+static void q6v5_handover_irq_disable(struct qcom_q6v5 *q6v5, bool sync)
+{
+	unsigned long flags;
+	bool disable = false;
+
+	spin_lock_irqsave(&q6v5->handover_lock, flags);
+	if (q6v5->handover_irq_enabled) {
+		q6v5->handover_irq_enabled = false;
+		disable = true;
+	}
+	spin_unlock_irqrestore(&q6v5->handover_lock, flags);
+
+	if (disable)
+		disable_irq_nosync(q6v5->handover_irq);
+	if (sync)
+		synchronize_irq(q6v5->handover_irq);
+}
+
 /**
  * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
  * @q6v5:	reference to qcom_q6v5 context to be reinitialized
@@ -64,7 +98,7 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5)
 	q6v5->running = true;
 	q6v5->handover_issued = false;
 
-	enable_irq(q6v5->handover_irq);
+	q6v5_handover_irq_enable(q6v5);
 
 	return 0;
 }
@@ -78,7 +112,8 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_prepare);
  */
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5)
 {
-	disable_irq(q6v5->handover_irq);
+	q6v5_handover_irq_disable(q6v5, true);
+
 	q6v5_load_state_toggle(q6v5, false);
 
 	/* Disable interconnect vote, in case handover never happened */
@@ -164,18 +199,15 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 {
 	struct qcom_q6v5 *q6v5 = data;
 
-	if (q6v5->handover_issued) {
-		dev_err(q6v5->dev, "Handover signaled, but it already happened\n");
-		return IRQ_HANDLED;
-	}
+	q6v5->handover_issued = true;
+
+	q6v5_handover_irq_disable(q6v5, false);
 
 	if (q6v5->handover)
 		q6v5->handover(q6v5);
 
 	icc_set_bw(q6v5->path, 0, 0);
 
-	q6v5->handover_issued = true;
-
 	return IRQ_HANDLED;
 }
 
@@ -256,6 +288,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	q6v5->crash_reason = crash_reason;
 	q6v5->handover = handover;
 
+	spin_lock_init(&q6v5->handover_lock);
+
 	init_completion(&q6v5->start_done);
 	init_completion(&q6v5->stop_done);
 
@@ -304,13 +338,13 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 
 	ret = devm_request_threaded_irq(&pdev->dev, q6v5->handover_irq,
 					NULL, q6v5_handover_interrupt,
-					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT |
+					IRQF_NO_AUTOEN,
 					"q6v5 handover", q6v5);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to acquire handover IRQ\n");
 		return ret;
 	}
-	disable_irq(q6v5->handover_irq);
 
 	q6v5->stop_irq = platform_get_irq_byname(pdev, "stop-ack");
 	if (q6v5->stop_irq < 0)
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 5a859c41896e..8991ff090579 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -5,6 +5,7 @@
 
 #include <linux/kernel.h>
 #include <linux/completion.h>
+#include <linux/spinlock.h>
 #include <linux/soc/qcom/qcom_aoss.h>
 
 struct icc_path;
@@ -29,6 +30,9 @@ struct qcom_q6v5 {
 	int handover_irq;
 	int stop_irq;
 
+	/* Protects handover_irq_enabled against stop/handover races. */
+	spinlock_t handover_lock;
+	bool handover_irq_enabled;
 	bool handover_issued;
 
 	struct completion start_done;

---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260612-rproc-q6v5-handover-irq-one-shot-759015d0e4b0

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


