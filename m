Return-Path: <linux-arm-msm+bounces-107602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO3hFQbQBWoPbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:37:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C80542631
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC1DE30262DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C3F3E3C64;
	Thu, 14 May 2026 13:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ar0sIAAH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GaYulEU4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7213E1D1F
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765798; cv=none; b=TgFGx8jsy7q5ORsfu9JcFFbttIBnf2Y++l8FZouPzsERcB3FH1yxNpxL2IPu1vAMnjKpD8dKh/Sbbkts8mdXhYtCrnQMqseJhqtlrkNPFW+CjMaY43hyZDCA87pJyuotvlvusP6Qk4/FrMn6p9oS6ldbApJ3RPPWoJXNSO4Hi3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765798; c=relaxed/simple;
	bh=/KVx9sC4POXCHHH8F81nT+GwM1D4G/EUhd3OxvUY+YA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OJQUmpSdegwa/j3yETH5NadBfKvwX2jbNr3iBGSv50DfAhJYa2N25bApDR0O+FOmDySEvW6DTLbgU0AreUVl1kX2hUKNMC7SUh4HblevKNZQRkFFgz+bv7NdO4BAPEVyHgKT4SEJyDLtDKMWx6h1qo2fuagixjljcutBbpuyMw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ar0sIAAH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GaYulEU4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBegqw3062163
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zqCKHEN+F99dMgOCn37OEX
	1Nvr3GwQk1Jnpt81AU2kg=; b=ar0sIAAHgi+Wm01v7RvLYfD5dTM+Z3GPFaG/5M
	VsIqa7SKcupbeFfzVn/p3sSYlrlwlrXKpoAcZRTLWsYMm5xNiv5InnWZH3PFDSLW
	r7Pg1vRB83fqKDKwCbOOGvKFSxFFNGGfYOBFh/Z8atdwG42h7hz86Nmu3rIdw8hN
	SqgClnDlYMWmLbRwpDH1sgcpYpQwiBm0rv7873JYogDlKYandZ/5x0XiSwG5GfnI
	+0br7Xti0LU3CJETmL4ut4w6rpwQnGJJVxtwPvREEUTQW+3ACR402VNxg+4vabcw
	/74EHbbaanUYQc+sPTzBFadmqTfzMn3J3CLfaGjVFyn2AISQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e554aa606-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:36:36 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6312ba5c81aso5233225137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778765795; x=1779370595; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zqCKHEN+F99dMgOCn37OEX1Nvr3GwQk1Jnpt81AU2kg=;
        b=GaYulEU4rXx0OY2xRye7lS3cW1WuHDcb5An2sn/Xhfwmu/b554votXM07B/V+G9ek4
         sIzUkdK40S2VYfdvx6NmvFbSI3iHgE5fDqnjkH+qj09/SqFz/4dRprnSMhPZfwjeWagE
         GBIy/nNm1w1Y66SC3CdYp6y70tFg2/i48iY4LAZdptgIL4wxT1xn+EVQtqhVYaEx+Gp6
         hZyE3G6gxNyacZaRRxqjzMcDf4uSZuHxpDB7KfktiI8zbNaj16uGr89wss6A9NElDKdw
         D0d0riIIKGuyHwNKVQLKAW2AfmsDV7kftvCqFOIt3Tzewq1xYBsSSYdXS8DvGpk8j4Kq
         yQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778765795; x=1779370595;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqCKHEN+F99dMgOCn37OEX1Nvr3GwQk1Jnpt81AU2kg=;
        b=LctV8ajpEPu0HTDtJ2qmb1puxlBcNmo+eV+TvqiJw9YZ/7Am+14pD25qXVdMhXOQFp
         1IycSHTYg2XNweXeuQuuDIuaHLuPj6EkueXhhm5jOBOalmZYm0ivylvxdnT2UZlGUh4R
         P7QTQAJSBlYKypFTYlZn/Y590WEkFDltuAcoyV65Lu62UDmjkotzssXu0uvzJttV8UVM
         6hQa+OC2D00RIRK5Z535rdDDcy8tD12eWoV5qrXzFNVkLRNUIfx52o07qugYiZ3JRxmw
         +1d+aJK5OEuvYpZCb2f2Rkwom2HXYY7lEQDqX/c0OdJv8qBV6sf9kgR5BVKWAB2va4Ch
         wrNA==
X-Forwarded-Encrypted: i=1; AFNElJ+O8dTxp/q6Ee70wkAr8IGfTsjAJOTthUkHKNHbDHkQ5XZTsvdx4AIZrw8GcrFUkiESd0gHIueLH+8r0U9X@vger.kernel.org
X-Gm-Message-State: AOJu0YzDtdJ6QM/Wksks3rwiEI9sqHBFUxYxEr2c404V4NOXBFXPQ1BT
	maGSLtE/Yt5GDYwbsrNdE+7q2YYIZRmRX6uOly8SDaKTApvOzpDoFqqrMbHe13Jd85K0JNSOal6
	54kGPl8vBpDtDkX4JIKaM1GcsNKtq8qs/3m4EhnB2dD0fihmHBMrR+W7pnSUYltO/2poTTOWtks
	zq
X-Gm-Gg: Acq92OEGnqYa7yTRpMiKR2GRMsOo7B/vL63a/msGLl3B/R/g74Nh8541LpIYIHrNDaR
	PHjgRKh3/uNPxmH5KZ1vZiIUeoZUQXEOWZRNwfsOsC4p1uY4qhZE5tdCyydFA3F3qoOagUHbvcZ
	yzBGWvrA2dhfBxuafwGxOpmFLqYHlF1G7H+Nr7pzE6LtCrEWcKxQOSSe+ZATZ/fzrTtbNNWS/l2
	yi5eJxRnQO4AU6u1/ubHdumaynyoQlt1YWFLuWKCCvVQ+EVjBMiVGU0c3c5S2490JEMxFfprAUC
	Nwc9AJK77m5bfcBsoSo+Oge7LWotDjceUN8WV5zBcQR61hI4nfRMB027PftiGUMM3sF2CpH4s2J
	A7JHgakNfRJYsTB/5Lk0O2pxcmXOZ35bYrmyAhvaH
X-Received: by 2002:a05:6102:80a9:b0:634:92c:bdce with SMTP id ada2fe7eead31-63771e9ed03mr4132369137.12.1778765795104;
        Thu, 14 May 2026 06:36:35 -0700 (PDT)
X-Received: by 2002:a05:6102:80a9:b0:634:92c:bdce with SMTP id ada2fe7eead31-63771e9ed03mr4132319137.12.1778765794468;
        Thu, 14 May 2026 06:36:34 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm7382462f8f.10.2026.05.14.06.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:36:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] interconnect: qcom: eliza: Add missing SDCC1 slave
Date: Thu, 14 May 2026 16:36:22 +0300
Message-Id: <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-0-13c03bc890cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANbPBWoC/52OQQrCMBBFryJZO5KkKOLKe0gXyWTUkTbRTBvU0
 rub6g3cfHjw+e9PSigziTqsJpWpsHCKFex6pfDq4oWAQ2Vltd3prbFAHb8dcBwoY4qRcAAXAvQ
 swvECEhANSOcKQUyBYLfVVrvGW0JUdfWe6czPr/HU/lhGf6s7i2ZpXFmGlF/fS8Usvf/txYAGb
 yic98Y7bPwxiWweo+sw9f2mhmrnef4AAIkGTgcBAAA=
X-Change-ID: 20260512-eliza-interconnect-add-missing-sdcc1-slave-node-65020a3b2ecc
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/KVx9sC4POXCHHH8F81nT+GwM1D4G/EUhd3OxvUY+YA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBc/Ziv8dWV++lAtNopB94vVgeU+AtvndXtdBh
 /cp80IHXsuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagXP2QAKCRAbX0TJAJUV
 Vm4ED/9CPY6tnRj3cDf5Y3C6lm36n7rhIzRF3PIP0yBzT2jz3tXC1RRRfAujluZkzauh6s7qt+R
 q0I96wDnYIlDMVMvO/eS4uVM1J8073z/+MVD4AjY5IHWYUf3mxRXXIalKCeTNQF2TnJYjnjP7fF
 u7ifxXx60oCEqwW+r+I8PwACWDqE1iEFDukbJneha+Wh6PRiQ/0pijmUWmLFMKdey1cx1uFyP8G
 CUbcRgWUy9FJeutjGhqA6i8CfsVBuMh8E7RYf5OeT3MIH/P8uIwwuUvS0zUOkk0DZ+gz4Pt5vQ1
 I2Lj6ROlrjVeRG1q1k3mtRiZ9Bwc3TeVLQEs5G6LcivdQrexS+GQumeV7QWwmLtZZmVJHfJru43
 nLZbgEcCUfobgoOYuhD5VXTqqGCn9ec064wBqBe2SJvNG6p8+zW6s8Ai9Nv2a5Ra0hvbwLupmhZ
 Z1cNnK8ZaBwl+BSKe5lYkDABuRhhtAKTBf9VqnyrAezQ/DRV5vh/iPitBYwZsbdEh1g8K0fGUd/
 uVhVccweUHPp8Tw7KA0TsrP+n0XDRZ/zAN4yWvWgzdb7zPCS5vUppH5BEnSLoAfJep21WSH1Ky0
 y3IpSJB16C0RT2FwLcJhhUR5egbE10btQFxUyFGEVhWUcqPCWLljQuMKOSCqJGFQPIJ23uxitas
 D6Ifv7GA/O4yOtQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: mziyzp9heCztKCQooTYyATODX67JE03x
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a05cfe4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Rb2RZ36IZFNs43Mee3gA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: mziyzp9heCztKCQooTYyATODX67JE03x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzNyBTYWx0ZWRfXyjK/kAoj7LCa
 7eEq42vBJNJbQS5tgw7dJGX/UJIBS8+DvuqyruFnSrMbd9sccFhEAnJLJJKJOBr4cyrF1eszKXy
 O6wyX5gbeI9+uyvzSFRz//4HRdyqyLsb79L8uzz5hQgCqCyJmhaG7HB1wZzqpl+kC5IVMO/UuKC
 JAyEmoglaHtMz79NxGKielnbHcWJb/R4FpxUkk8MPrDchwdMTO3g2ecMzH70xTrsonGhx9zWnIm
 VVkMmJgEBQUhA6aAkPpeXVDZAm5JOPKaktbOxQ87DE1U7oZnNejuXgRDtI5rRCu2GTE4Ol9Rfpo
 u5mAhK96WdiODV+lmaQPU6fCAIFDwQLrtS/opldNjTrM0jyLjn08AVeN0y2HF9KA5hNG8TQlZfd
 bSY0/dXvPNK+39MIgWHcHhuZWO3Yjp7MQsR2fqijeUbsXES70EXXQZr8gsLtpDF6VJio+sgur80
 NNzzndWb0q0nDEl+kRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140137
X-Rspamd-Queue-Id: E5C80542631
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107602-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the missing Eliza SDCC1 interconnect slave ID and provider node.

The Eliza interconnect binding and provider already describe SDCC2, but
the matching SDCC1 CNOC CFG slave was left out. Add the binding constant
and the provider node so consumers can describe SDCC1 bandwidth paths.

The provider change also adds qhs_sdc1 to qsm_cfg and bcm_cn0, and updates
the qsm_cfg link count and bcm_cn0 node count.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Dropped the Fixes tags, as Krzysztof suggested.
- Picked up Dmitry's Reviewed-by tag on the provider patch.
- Added qhs_sdc1 to the CN0 BCM and bumped bcm_cn0.num_nodes.
- Link to v1: https://patch.msgid.link/20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: interconnect: qcom,eliza-rpmh: Add SDCC1 slave
      interconnect: qcom: eliza: Add SDCC1 slave node

 drivers/interconnect/qcom/eliza.c                  | 15 +++++++++++----
 include/dt-bindings/interconnect/qcom,eliza-rpmh.h |  1 +
 2 files changed, 12 insertions(+), 4 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-eliza-interconnect-add-missing-sdcc1-slave-node-65020a3b2ecc

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


