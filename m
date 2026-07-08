Return-Path: <linux-arm-msm+bounces-117651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T8cwFI5dTmpiLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:24:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D325727497
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:24:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jrRlBi0h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WkugNPff;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117651-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117651-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2FA2B30872A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A61477E4E;
	Wed,  8 Jul 2026 14:19:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DE344CAC6
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:19:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520348; cv=none; b=MUPOSJBHog940x/S4Tq5MsArJzLThXjTrMk+ju9Ue0vDGdoftYcALDDcPH8mQpZTf864/QGIiNGimAA3zrTltyxBFhxm53Jvb1W8C98JI7X/7eWZClrlA7KPvMavkdglJ2zC2ebT13+rs5TTwq/oQ3FSZQUHmpCz5twV7a3NviY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520348; c=relaxed/simple;
	bh=D2sAHGoeZqQFctpwP5qoYf674QKPbhInAf6VDEiYhAM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VcQrwc7jovMD9TiYtbZYIKMqTUVK0SBb12jIehvKldY2HxdwoJM0vtSNVD48kID59Gphoz+Ydxfxv0/8jCQ2axnns1ztZJJAsa7C8k3hp5jMVnqC8f4B7qsqLCV4wJxY0sUIzRC/hOEQXyUZ4PgzqctoQDW+5hCvQKS4EhKkIMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrRlBi0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkugNPff; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C47vO2760271
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 14:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OQ1iP1u0PkKvFv/dSIZu5A
	aQDlJXSHVHnEZSWYIrLjc=; b=jrRlBi0hsZgndvDo5951y+mVdN20Hsmcw9GYkk
	wgJJHrHeBBgmXn6XmjzDHa/Com29z0uyk/LtnRyf7LyyKIiuNLrPVOE+x86fPQXh
	hp5SH7ORdvpWUYHemBGQhU60XUgzeFME6uGN2kHxxWlIKFteLAh8/WprYe2RHtFF
	CGCn918Oo7wM100fqGLxTdTb/Ty7svWrscLR6G5mRXSKyp3S17dfGdSBA+4c6lc6
	KruIqjybbMTxl5uJD/pPVQCD7QJA+5czNsBgVHtNByo1hdqxSxaiXPSHA6YOb+n0
	HGR4epSCbl1QpNkMvFKH6IFfY14C5rxFFNkK8goHHq6Tp0sw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5vtk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 14:19:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744c204396cso654800137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783520345; x=1784125145; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OQ1iP1u0PkKvFv/dSIZu5AaQDlJXSHVHnEZSWYIrLjc=;
        b=WkugNPffoD728Dk63/n3jz3XzoFTIwrfjq0JsLVrOwnCSoZLvhTdtOSryRokwHSbQo
         2pAUrkn6ejJCv04few2LNC8lBJJ135EFcleeRxN4+RySnTlrGOujZSdGGksExNx1lp+N
         aRGG/12B7YCENsqCRKumEobohzgDU84gs7xNeW5ypuMxjJU7nnPBTggrroQklwqJ6pIl
         7OD8v1LELFzttPBFCWMOEnDGYwQ2c444q8Rugvpn/D4UYTXhrGZb5C1eFik98w4hCRlJ
         4n4MxFy91JurqFbNJA/Jj98azLNhhu82I2ZWj4k2cBrJt6UI9Hb2PNXmTn3WcmameGRB
         nOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520345; x=1784125145;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OQ1iP1u0PkKvFv/dSIZu5AaQDlJXSHVHnEZSWYIrLjc=;
        b=lLnn48y9GKcBMhdamdM2oeW3q58CAWfVnTtHnWONjei8sCEeGHPwsQbkCzzu9ukGTg
         UGKzWeisnT+jBWz1uJazNF3W/twtsD7abaznDy6i1XhzkjdRWBTQ275CIHArl+8ARrXM
         HTxV0hUxXd+0t/1SmR7hqOsjj0pAiNM9OQUXRmH0ehbruCLTI8CEi15RJbByZxlWsH9b
         s3MTvfqnCE6aLZDK2QUHpQW20xRVTthNukHs9Nmc2vmkbG31qP5/0GMMDYwH4J1vqhQF
         2Y/A2VBzNhSyDCom5fXEgzSPfztfsjQxCkVjR7j6f9Rua1Vv3TDmi7P+nKHpq0pN9LfW
         a0ew==
X-Forwarded-Encrypted: i=1; AHgh+RpOgQDeOccFmEXIwKCbziijGPCM//o7ckB4UE55JDhGnPN0Pqq0La3cPKSfj7rczxfbJYpOKPWjwwDDZE7B@vger.kernel.org
X-Gm-Message-State: AOJu0YyhlYL/cPXtCRV/ZSQrZrxgiG2DvS42MZMFw0lbSQ0TSwgYQeOn
	dAFWpp65GfiwrbEHwHnqnKtFAnEhfxkiTv0OQiI+IOnqV2rgwxWirdtPACgv6zjf1/trOU9qbrv
	gVay569EzP/iOqcm5vFT6XJhgnTCP8VM+PPrmobWGNUrsN13QQLe2BxRYzc+7q7/bz0Ho
X-Gm-Gg: AfdE7cmMJTXNsUKe5lugvmjM+4ukYNd5Xjc1FCH3JvZSzwPLrgEvDTldZ9NVrCNQw0u
	Myt+nccfF+VmBDhEwD8fDYJp6d3zXxZrAotq+BDDqqVliyqXlk5G3YMclTQXZ0h74LUq5Mw7L+P
	pU8ebjovwTHAsNoPcQAPxkc0kHngH1IpuR6tE7BN35/kL8o2pulBXQbsfFA4ZX03CJV6UEU7IAJ
	Z/UepY8fn9pcw82XWRjdbTvcjk3pGTejxXySiA3AWW2h/OFzCtQ6sHmUY0OJZXN6fTNcgB0RHYM
	04y1q7RTKG8llh/J/FGSQrP1Wl3TWwNQbLMvBYxmHh3yf86UQkX9eSEOqDlOFhoJ6X79vzTc64B
	BBhmOpxAGGGtPOWRJKuCs0OI8Utt2W4/kEvkE9z18pJa0lfKex5XnuQx4uTR9hMLxi/bVyYzYx6
	LSPpeprZGAdqMMET9r3G0B4rtLLFzm5L2WG5r110bHILolkH5Yu8OGNFLHumXdTTqKW6ARIvKUq
	vJsGJLZNkEAQuUJdwha
X-Received: by 2002:a05:6102:5486:b0:738:472f:2cb3 with SMTP id ada2fe7eead31-744dfff1839mr1525833137.8.1783520344906;
        Wed, 08 Jul 2026 07:19:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5486:b0:738:472f:2cb3 with SMTP id ada2fe7eead31-744dfff1839mr1525656137.8.1783520343329;
        Wed, 08 Jul 2026 07:19:03 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm3080829a12.29.2026.07.08.07.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:02 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 0/4] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Wed, 08 Jul 2026 16:18:59 +0200
Message-Id: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFNcTmoC/3XPTQ6CMBAF4KuYri3pX1rqynsYF6UM0gSoUiUq4
 e4ObJQEN5O8Sd6XmZEk6AMkctiNpIchpBA7DGq/I7523QVoKDETwYRmWljaxu7taANlol5YATr
 31ilLsHDtoQrPBTudMdch3WP/WuyBz9tNZuCUUeYr45kzpefqGFPKbg/X+Ni2GQ4ya4P4Cobxl
 SBQ8LwAViiDR+k/gvwV9EqQKEgDDr/Jc6nlhjBN0wcfvguSLwEAAA==
X-Change-ID: 20260629-monza-leds-c292e68c9a49
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: jcsMXsGFhOvF32YP5zTPERv0No1Gv1M3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX8nQLB93LjZwi
 LhbzlKdCwStIwVy2Asz2r/1ARMRlXk41c36CbSkAWcz4sEc/ySPpUcFTWuoZpdunE4nVpAhuqYO
 frOduFLLJWPQGmooaL0Qs+qqXV/JWKw=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e5c59 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yzvYhh2-rlWI4r5pe9MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: jcsMXsGFhOvF32YP5zTPERv0No1Gv1M3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX6mjWDxnxwrAT
 yk22fzol/AO93fV7kSIVjsmwweoxnROYcweyM361R1CGJ5tH+qeUpR/LTKpkTLPIoO/xjQt4eYA
 j8cj7pM9kk+z/VZxpZ7qp2hqdJ9YhPudmXPUWDIxW6ol2gpEUsLsCYGPyirsnoLgjN+bMbmrOI/
 wRBGmiEraJX7cTXR2O7NJReHRQ5w3BpjiO2jdWy0fQpQpIiUHasyFykkfL2LpDl+WHz7ZMEr2xb
 rioAUYJK+jes9fu/ITRhnkZeH7qzBczlfdxUeORG6QfmnjL7zZB/2Xet7idCnf0h7SJAirVaDS0
 Kln/4USGzPxU2EAZO4pMGkgD3HQB2HNoxGL4YhTVXYp2JQsONRG2Zf2POy0A1onQsFU492ZtalQ
 iNg4MgawXNAc3Ld5LPgY4pq1yr0MqFcMuX7D57u6G7sIR8SgeE+AhEwpIML7ajtedadPopYXZxa
 BPgG+7cPvKF8zId3u6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117651-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D325727497

Some devices use PCA963x controllers to drive RGB LEDs, where
multiple PWM channels correspond to a single logical LED. Add
support for grouping such channels into a multicolor LED device,
using the LED multicolor class framework.

The DT bindings are extended to describe these groupings via a
multi-led@N node with sub-nodes representing individual color
channels. This follows conventions used by other multicolor LED
drivers, while maintaining full backward compatibility with
existing single-color LED definitions.

The PCA963x driver is updated accordingly to detect these grouped
definitions and register multicolor LEDs.

Finally, the Monaco Arduino Monza device tree is updated to expose
the onboard MCU-controlled LEDs (compatible with PCA9635). The MCU
manages four RGB LEDs mapped to channels 0–11, which are described
using the new multicolor bindings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v4:
- Narrow the led node-name regex to allow only hardware-supported addresses.
- Remove useless 'minimum: 0' prop, and add 'maximum: 15' in the default block.
- Link to v3: https://lore.kernel.org/r/20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com

Changes in v3:
- Add color to required multi-color leds (sashiko/Conor)
- Bounded registers value for nested led subnodes (sashiko/Conor)
- Add fix for PCA6535 reg limit (extend it to spec)
- Link to v2: https://lore.kernel.org/r/20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com

Changes in v2:
Changes in v2:
- bindings: Reworded commit message to explain the motivation (Krzysztof)
- bindings: Kept the "^led@..." pattern and modeled multicolor groups
  via a dedicated "^multi-led@..." subtree.
- dts: Renamed node from "leds-controller@22" to "led-controller@22"
  and dropped the unused label. (Konrad).
- dts: Moved "reg" to directly follow "compatible" (Konrad).
- dts: Fixed unit addresses to lowercase hex (sashiko).
- Fixed checkpatch issues
- Link to v1: https://lore.kernel.org/r/20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com

---
Loic Poulain (4):
      dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635
      dt-bindings: leds: nxp,pca963x: add multicolor LED support
      leds: pca963x: add multicolor LED class support
      arm64: dts: monaco-arduino-monza: microcontroller LEDs

 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 108 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 126 ++++++++++++++++++---
 4 files changed, 323 insertions(+), 22 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


