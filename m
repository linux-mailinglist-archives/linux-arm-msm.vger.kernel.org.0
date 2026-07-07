Return-Path: <linux-arm-msm+bounces-117140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5Y85HLmYTGpNmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:12:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C77D3717CE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:12:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cB3CzkSC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jCuH01QZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117140-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117140-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9B70301683A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19343876D5;
	Tue,  7 Jul 2026 06:12:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5395D385D75
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:12:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404723; cv=none; b=MhBn76DUuYtmvifICAEVzwIcm3Xr5VURD7nthjVBZ9fM8TM0bILdochS6JfYGevgsrA/31VSV5mS1bmXv9VtOWu/XnD4saebIk/b9xw0DpbwA3wNTwRBsqY17NtY343whj+kOnvN34wpUMEb0224nC3qC7xWBJ3mhL/8/LmkbqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404723; c=relaxed/simple;
	bh=JFXGqCGu2H92EhpiiWXQPFhlBhyUzeEGrMTelGV5S+U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RAhRpkkJIrD6vNfebBNsydqvyZO6Wv/Jnp/Nw6NfFWd9C6ppO86bbY/G0xav/ARrVNU4jW4VXRVN/ARgUiH2pk4D/Xh+mnwzmzdsS4VQ316OYr7qf7SqC4i5En/zn25KfRITmxf/oZ83Dy1HVybRv2o4KjP0y11KjXDK4ky1/UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cB3CzkSC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCuH01QZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748mLC2585297
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HINMq122UHv1BM0ydfXCtB
	Iu1L4J+lad+rQZ2QvoAtI=; b=cB3CzkSC6FeLPR1/Mw+Z3rbhUBtZNG0XIUg3Xc
	HGzNUk4xCM/TPQQxCbaXjXnObCkBCPjWHrPo4Am0TcA+WxwI/zuYKBIL1Rwi2Bxu
	CUKD8jqHXADvvR1PIo1hgV6uH/YiJLB1LO0an28yf6DxfxJPVQ/QoOAuNJZX13EB
	N6ZyZ8wKXsClaU28AD+NvVt9gAdjuRjI8OjyLNE7ftDpKNUkNsX3FJXLtKmjDqiY
	fOu7bczap3xJZiJ492PWSWDYqND/g5I6QZbPNucml7NXNYed0GIQICAv9Q0vPa+V
	iHp++KGwbA/B+6bLzGVY9Zh+ROGP6Zst7ccans9YqLLvWv4A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t158e1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:12:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8478ff5d801so7118822b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783404720; x=1784009520; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HINMq122UHv1BM0ydfXCtBIu1L4J+lad+rQZ2QvoAtI=;
        b=jCuH01QZ1S4wkfT+v0ZLvzJPcj6s7zDMdvBHYyyJSCj+4ukr4YXqzZWQTqu8HBIvMn
         EfzykfsULxWlcAYBkPCkB+3HhN9fD3Xd38SZdxdyWAzJOSdn+WU4aChi9ZX7yXz82wGg
         bOT3MQdB2uefqpTHxcrztwku8VrGqJd2vNDqOP+U+hV4yZZ+ZUG2amUeVcVASCoYAt6W
         0/Nm/PCsJ5U/uxUWPIaDdowypqm64mV+72BqNTlpS1k8OTpX0h0BUHCRQ/Ljh1viVo0X
         LCu24qyexr4E6eKJjTCTqhv/xpfv8H6CKBgEZJfQM9ILY3crsbB79pDMbn2sCqdPCWC5
         j5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783404720; x=1784009520;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HINMq122UHv1BM0ydfXCtBIu1L4J+lad+rQZ2QvoAtI=;
        b=Ss0+AN9aSYqlvNisSZUCeKC/NEG8wNWaOTAkynixZobMUJVxLHH34sLO0fmyX6pLxV
         DH1BuBfLw9s2YEpAJgLO8GkqfWJqgvC1iSRwiow9lmU1BuHub8SO83LVVawhErpLRMTH
         l8fqYmW29o/isZkewk/87eSv/3htEtB5s6UI1TdL9vNTQ0M3R9ge3kUTHQgWYYyFJ0hh
         Hqq6IZdavC9pgTpZ0VbZvVT4tEt6lKpQoXKir/k6urbMEHm0aCJs5A9ecjIL8S8/2jBm
         f9Q0sObcEIme9qPHOcPI+i1QZ2fmsqEOl8BwerAXhvoX4Hzujovk519vt3JbEzsAMs8R
         1Zow==
X-Forwarded-Encrypted: i=1; AHgh+RrUUfAn97DS6TVAwH4bCc1InRnxDzEWsZ6pAdU71yWWhBRb5kb8WnLRg3ReJXT+xv3llWuFPHXD9+y/rVvl@vger.kernel.org
X-Gm-Message-State: AOJu0YyRyJQlFZ0syfJGw+lAoydP0M9pmHTddYLAnO1LAlBgQppo7bn8
	O0e5XY/bCQljwzuak2/UlOgrJVxii9ztGY1yaeSMPT6i5iSfb8S5I7KmOxiqX0C5u+r8lVL+hWM
	dcjhQpEx7r6MqrS1ZEPPDF3VdxfJrbsYV8sJNIMawR8nIQ1ya0aBCFj0f1AzLRkRKTNfd
X-Gm-Gg: AfdE7cnbwbRpGP7JlcIXT1psNuyp3yXXPbSeMDDlvYQngZypNmqALjRtUe4/XZxKOHB
	KXivcg1jM5Xowc27nLi7s4dEfk1X1DNS3or0eIbj1GQWopk5FwHqxDsYqngiU1bJHeyyUN7sGiR
	ZWnV9MhK6vmWC8glc8MAtpCeZKyQuC+9840qfEWYD93w9bpAJZJKCkMXgZpXYIkfmdifdmp7iy5
	X3YfmfIiK0STmf2mQAdSiara4U5MtRvx7RPzks4IyJbdSwGAFG130PblBJncFdwY0SpiK6E61Gk
	WA1g8Dhn3FJJ3ZiVfuK8rDOUbQsABYx7B28EujQ0GPm6/BgOmVQkfn/cME1gIs/eLpiK24VMUEm
	ybAXxDWF8FlXfrf/2J4Sa4xXbZywV1aSWz5fB
X-Received: by 2002:aa7:888f:0:b0:845:d2e3:263d with SMTP id d2e1a72fcca58-84826e23a4cmr3586102b3a.55.1783404719983;
        Mon, 06 Jul 2026 23:11:59 -0700 (PDT)
X-Received: by 2002:aa7:888f:0:b0:845:d2e3:263d with SMTP id d2e1a72fcca58-84826e23a4cmr3586073b3a.55.1783404719452;
        Mon, 06 Jul 2026 23:11:59 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8480da8bab0sm3299321b3a.8.2026.07.06.23.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:11:59 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH 0/6] Add TEE based client driver for UEFI Secure
 Application
Date: Tue, 07 Jul 2026 11:41:26 +0530
Message-Id: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6YTGoC/x2NQQqEMBAEvyJzNpBoFPUrIiHEVuegxkRlQfz7Z
 vdYTdH1UERgROqyhwJujrxvCVSekVvsNkPwmJgKWdRSy0Ycbl/NhYkjnPXerDwHe8L89hMQqmz
 qdtQVpNKUXnxI7udf6If3/QL3yLdGcQAAAA==
X-Change-ID: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783404715; l=5039;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=JFXGqCGu2H92EhpiiWXQPFhlBhyUzeEGrMTelGV5S+U=;
 b=dVY42OrgfUJyFWtbinXJzW2iuRrRIcONitvA1Il7l21EQnP9ev/NCpeiFZ6MREvVXrIFc6om/
 CuZK8NGA7gVDiq2k20hJaE188RBI801eAQdLnpq/dIAWqqE12rbcbSS
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: g3vZCf7HoDYLRqk6955H-k40ZWo-wZ8Q
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4c98b1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=EPKcpx9xAAAA:20 a=EUspDBNiAAAA:8 a=nyFiw0sUOsifHlYUkUwA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=ZT_8zCgGubuJgGonBfBE:22
X-Proofpoint-ORIG-GUID: g3vZCf7HoDYLRqk6955H-k40ZWo-wZ8Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfX7VAZz3aph+Oo
 Rq6G7YE03gjN5oTh29K38sKM+67sXEkXOYwuT6IJ21wBgl5jdJxm410wOBKd0EyJaWZ1dGI+DJd
 EUmtisB6/EU6fPGUs6Ah5exqgnlOnCA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfX/u/vjPoNKn6b
 c+Ddcikqj6vMQGOib9pe5anbsKlh+WVHTkSILv49vc9xqOg23UTmA7G8LupKmJ3HC4Uz3T9x7Uf
 XR2Z+b+g+1O53KcBPiBa6cAnjlF6I0qWNJ4psY96UugEbd2rH7dO8MdcHcy34SEnmxWETZ0HpLb
 rE3P7CTZlByuOwP8JZ+hd8hffQKUp2Pin61rWGLRTjCvzlH1RMuEOYAz4M9JeGJYyJrFZJuvM0R
 mH/lWbwQzL8VX3D2Oa9NC/dC3EyBnRNE1sJMXuQC0imiFJmar36gtrU/8qxikWMVo6k9Z8L1Snq
 YW681MRngcCENsYzrTOOAXlD16iGp9jo99c6F6JtlHtg/7DvhYt+sW0ihFjX6bm8lews8zB20R8
 +JV55XYf+XUKUnFGXfZwTN91s4tyVh9L87/qzqd4tS6TwgCrzISs+rYGkLCgTscyjavu0IIgFQC
 EudRC460SSO8Gr73SIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070056
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
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-117140-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:sumit.garg@kernel.org,m:amirreza.zarrabi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:basantk@qti.qualcomm.com,m:apurupa@qti.qualcomm.com,m:aneelaka@qti.qualcomm.com,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:harshal.dev@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,shorturl.at:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[shorturl.at];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C77D3717CE9

On Qualcomm SoC based platforms, UEFI stores EFI variables within the
Replay Protected Memory Block (RPMB) which is only accessible by the
Qualcomm Trusted Execution Environment (QTEE).

For Qualcomm platforms without emulated RPMB support, specifically
platforms where RPMB is not located within SPI-NOR storage and instead
located on UFS/EMMC storage, non-volatile EFI variables can only be set via
a callback request from the UEFI Secure Application to the RPMB service
running in user-space (within the QTEE supplicant [1]).

Unlike the QCOM-TEE driver, the QSEECOM driver (used by the current
QSEECOM based uefisecapp) does not support callback requests. And on
certain Qualcomm platforms such as the RB3Gen2, attempts to access the
QSEECOM interface fail due to lack of support within Qualcomm TEE.
On these platforms, a TEE based uefisecapp client driver is required to:
1. Access cached & volatile EFI variables stored in uefisecapp's memory.
2. Ensure persistence of non-volatile EFI variables via writes through
the RPMB service hosted in the QTEE supplicant.

This series introduces such a uefisecapp TEE client driver for the
aforementioned Qualcomm platforms which installs efi-var operations _if_
the QCOMTEE driver registers support for an object-IPC based uefisecapp
service on the TEE bus during its probe. Only new QTEE firmware versions
available at [2] provide this support.

Thus, QCOMTEE now maintains a static list of always-available object-IPC
based secure services exposed by QTEE. These services are implemented either
within the QTEE kernel or within a pre-loaded Trusted Application (TA)
usually loaded by the bootloader. The uefisecapp TA is an example of a
preloaded TA loaded by UEFI. A static list is required since QTEE does not
yet expose any way to dynamically query and enumerate the services exposed by
it.

To facilitate object-IPC interactions from the kernel-space, this
series also introduces a tee_client_object_invoke_func() to allow
invocation of TEE objects similar to the existing tee_client_invoke_func()
API exported by the TEE subsystem which allows invocation of TEE functions.
Some suporting changes are also introduced to track and handle operations
for TEE contexts opened from the kernel-space in the back-end QCOM-TEE
driver along with associated changes in user-space libqcomtee via Pull
Request [3].

Finally and as previously mentioned, access to the object-IPC based uefisecapp
service is restricted on older QTEE firmware versions. A new QTEE firmware
release must be picked up from QArtifactory [2] for all upstream supported
Qualcomm SoCs to enable access to uefisecapp service via the TEE client
driver.

This patch series has been validated on Kodiak RB3Gen2 platform with UFS
storage by attempting to read/write EFI variables via the efivar tool [4]
after mounting the efivarfs filesystem. See [5] for an example.

Merge Strategy:

This patch series could either be taken from the OP-TEE tree or the
QCOM soc tree. I would prefer it to be picked by the OP-TEE tree since
all except the uefisecapp TEE client driver patch in this series make
changes relevant to the TEE subsystem. It would be great if the QCOM soc
tree maintainers can Ack the uefisecapp driver patch.

[1] https://github.com/qualcomm/minkipc
[2] https://shorturl.at/zQU07
[3] https://github.com/quic/quic-teec/pull/27
[4] https://github.com/rhboot/efivar
[5] https://docs.qualcomm.com/doc/80-70020-27/topic/manage_uefi_environment_variables_using_efivar_tool.html

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Amirreza Zarrabi (2):
      tee: Add kernel client object invoke helper
      tee: qcomtee: Allow object invokes from kernel clients

Harshal Dev (4):
      tee: qcomtee: Track the object invocation context
      tee: Export uuidv5 generation for TEE clients
      tee: qcomtee: Add support for registering QTEE services on TEE bus
      firmware: qcom: Add support for TEE based EFI-var client driver

 MAINTAINERS                                 |   7 +
 drivers/firmware/qcom/Kconfig               |  24 ++
 drivers/firmware/qcom/Makefile              |   1 +
 drivers/firmware/qcom/qcom_tee_uefisecapp.c | 525 ++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_tee_uefisecapp.h | 120 +++++++
 drivers/tee/qcomtee/call.c                  | 218 +++++++++++-
 drivers/tee/qcomtee/core.c                  |   9 +-
 drivers/tee/qcomtee/qcomtee.h               |  18 +
 drivers/tee/qcomtee/qcomtee_msg.h           |   1 +
 drivers/tee/qcomtee/qcomtee_object.h        |  16 +-
 drivers/tee/tee_core.c                      |  26 +-
 include/linux/tee_core.h                    |  15 +
 include/linux/tee_drv.h                     |  18 +-
 13 files changed, 968 insertions(+), 30 deletions(-)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>


