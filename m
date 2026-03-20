Return-Path: <linux-arm-msm+bounces-98908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GM9FgEovWkG7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:57:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4262D925D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A984F30382A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 10:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225753876B9;
	Fri, 20 Mar 2026 10:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jb/NuHSQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtFae3n5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68D7383C7C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774004223; cv=none; b=aZIehzIc1xw+7/OHUvPVEcxWqgHzEcSsFxU0Mh8hjiengMeLXznc05WscXiS6cvQndd4Qham8oL13EguPNRHoLBuXzbDb9UHRz6ayR3ZGxpl0uBYoaSKAL6s2Apt1Ek98aoB0Gv25byILX2L2hkjsWXzWvS6moH8/uUQfnxJSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774004223; c=relaxed/simple;
	bh=j0qWhLJLks5VKCXR8wJlf8gZv79lSlxVINgwScXO5+0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UXS9fofzlOayFv4hZhdkb2IuRR9wkyGGhVv/OPPeHdhLVt6RxHiF88HgX1yUNay2Jf2qCCH7N83RuBWllsq7/ofSlLxo535sbKDg2RHvwRZTyncgpt6T9kjQ4bpNjZ+nwmuyT4jncj4Nwr6JIs3/XoIBmq21T1ug75Q12/ULfa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jb/NuHSQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtFae3n5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XvJh539542
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 10:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1WBtUEAgZ1fou9TqodhwAx
	/jRFQirPF7KH/DV+O7K+0=; b=jb/NuHSQt1wz6GOcmhXQkGgrPrvtMUKl0p/Ajm
	l96uYwH2EOrxGdDE/lL+fyr03reRa2+vxhEt+oXXvW06X0C4rES4w7lvtJqMiAKw
	l5H4SfTN93lPcNuM3w7NzBk7maRbcJJSFGV4OA6mhsobSTQUmKrvWE937xsxstTC
	s0gO6AXuodlD87vcutohus4b3epQi9pVSAPGeeu073Ijy/pTTbuNO8v1jlSKjdwD
	nosBm2e+wdUodkDPLzEZuMdzkUOxDPjckwOQ2UR18fk+SiUlpEEwnDsVufm69NUJ
	DhvpHUNLDHPl3JmYTZYBJfSRXF4OG/mLKNAGV9P+nqpUHqCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0sm6hpt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 10:57:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b323c43fdso71269221cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774004220; x=1774609020; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1WBtUEAgZ1fou9TqodhwAx/jRFQirPF7KH/DV+O7K+0=;
        b=XtFae3n58pRPldIuReWyvlnJaye4OPfJW0+wVvaLNmcIYIGXBx+Z+flJK7nVufPpG2
         3UJwQqTY2BypcuIOXfnpjmbMtduy0ANr47BLIgUofDPadMl7PBLFONQ8unD1VqU2XbeH
         OD8laa5hUmYJ7FUxizYShvKzgDZxUISaD3QoL0uVQVhpg0iYZXeOHg56/yQC16+4hxry
         CFOLLv0deqrSNCPkE7aIF34v/a7dBo1PjZzNRibdKKRya1F1Rr+k5k9mXAkZ1sPKDaCH
         cjsqhvZGCEc3Cv0fBa/JGP/HOGNXhBBGAizdC9fn7e3o1cWL/Q5MixpaAycXZdI7CmWc
         THLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774004220; x=1774609020;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WBtUEAgZ1fou9TqodhwAx/jRFQirPF7KH/DV+O7K+0=;
        b=DHhtMgsGBsZrZBOMEAVzOzcBdtbfeHOM+E0pA+xM5NG+ZdpHHm7ipXTECsWFdXNfZJ
         OjVkf2dwYbfce0pn/QdGbIrjqC5PT/CiqAGsu1lfCVJwo9+CCJ0/r7t43OqoKv9ta7x8
         YSuvA/GPrB3uMGcbg24XPJ7xVJoO7OYQyJTh0jY69EtwUmEH6jlZKu695eXvDzlMGFil
         EpzPw9u2jWX/gWYe6TGqG6QKuUo21oBrBxFha3JI+0V4rmMe338fFmTXhI9geTI1zFBF
         42SqAXG+93d2wTv3S9Df9Ox0mO1EPuxOBSKOq0miOR6PoyS6IzPjBk0IU5qQFcUUa1tn
         M6HA==
X-Forwarded-Encrypted: i=1; AJvYcCWCau1fcddS1owsbZBTo4489/nWFwRs77SRTiQX8GtqTPL7NAsj9O4tm56ZW95p0lJ+rroVg3GPWH7MoNL8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgxh+7K1VBVVPIcBXRtAhaQk0qj41VjaGxo+/hr+NLGtIkdiyk
	OfqDc34nEM2rULVCb3iLmKrfwOKo/SbugdQ7/HSXxFUwTM3Vy+BXBtO7wRh2nSE4WHentmB5jJN
	VFsxPRtT1jClpRw2jIShaZbHAzv6cjcETfvsfeiBX6F6WRhzzS1DS7XNKK27WkcCpl6BAVfCqbO
	dh
X-Gm-Gg: ATEYQzwjX84ypaM01iswPXInWLxSZMZNqwpCw41RBDqq6nWkNb+6xoGPl5bp4OsLA2u
	B+JnDE8gHukhwVv8XfJ8luJtVMS/xSn1B4LZCLcbHODIv2NW7O6ZMlYlnZLCT3WI/AjoZHQzzXC
	mLWWwRAIXPCuM611GNesIi9HMtk0nyS51C72NiWJgojGlqIJBgcU9yy0ozgq0I9YrTIXhxyYrOT
	IpGfEhOZXbN/GoX72kkJtQt+byOruVIHDhy9IW5DIh0G84uA1fDObijEZk5yRK6FcbJi/l8dZyR
	jADhnhHosh3sAGSxv4DfgQEo694EXlEndyZooEQ/68JRmiW7G9QkY95QeW7fyUfgX/EMwV4Nxku
	Z+d1WshpsQDlgCXSNPqZsJD9VK0o=
X-Received: by 2002:ac8:5d13:0:b0:50b:29f0:299c with SMTP id d75a77b69052e-50b3757b12emr36434281cf.60.1774004219687;
        Fri, 20 Mar 2026 03:56:59 -0700 (PDT)
X-Received: by 2002:ac8:5d13:0:b0:50b:29f0:299c with SMTP id d75a77b69052e-50b3757b12emr36433841cf.60.1774004219037;
        Fri, 20 Mar 2026 03:56:59 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fc4d90f4sm103911555e9.1.2026.03.20.03.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:56:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v7 0/2] arm64: dts: qcom: glymur: Add USB support
Date: Fri, 20 Mar 2026 12:56:51 +0200
Message-Id: <20260320-dts-qcom-glymur-add-usb-support-v7-0-ba367eda6010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPMnvWkC/5XRwY7CIBAG4FcxnBczQIvgyffY7AEYqmy0VaCNx
 vjuS+smethG90LyJ8P3T+BKko/BJ7JeXEn0Q0iha0tYfSyI25l262nAkgkHLoGBppgTPbnuQLf
 7y6GP1CDSPlma+uOxi5lKtrISNYLgjhTlGH0TzlPD59c9p95+e5dH9nci+lNfqvN9jFiTPC0dh
 5DXi9afM53qBdNkJHYh5S5epp0HNt24r8fEy/UGRoFqhRKFWmEDbNOltDz1Zj/2LcsxVQz8wXL
 +BssL21QeGqHQcoYzrHiwAvhrVhRWKeEtl5oZmGOrZ/b1Hw1VYaVFV7GmVsjUDFs/sewNti6sZ
 agdCKwb0DOs/Ccrx7c1AmpbgdHg/mBvt9sPbMyoPMsCAAA=
X-Change-ID: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=3099;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=j0qWhLJLks5VKCXR8wJlf8gZv79lSlxVINgwScXO5+0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpvSf1h83ifSxNAdNbX7heTt5YNw+vT3VR1kbxm
 9CFofIU8F+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCab0n9QAKCRAbX0TJAJUV
 VuVcEADDVhqKqr98qEMLR0i9sSG9wURO5Ow35GphTqsrhiQX28WUOhoO4TT2ep+VhCXh5esV5Gh
 GpSnKntjx+SlTrHH6zHclJZB9t5unkXYmq/NmsWeCpDfiQe4uM9aBTT4sVmV54K/Xs9YvR40SlM
 DdLBKUfo3U6AmzAVeRq0olkE/EKxILpgwFhKOxqvlJclBlrAkR1jydTHjLrYglHoMc8ec4Q3vzD
 DHLyidPc9qwYi+hQrI9I5XF+IhNldrdDnJqh2BGQy8XM+CK49dagOiii7RQGxflKBTGcp0bRDvn
 lip4/auQOV7sQYxyOdPuxbiYn9Iru6FfKBRVJoM6eHoy7w1EAv96WJGPjb7D9jePekzlcAblT7F
 omYGNjDbXM8AAfbcAATZTZm5P3gB0avVI/UF1wUS0nocnUzmOOWGUgNnKwP8PLTyInaK9cJxsdS
 BbcW+Zlvwrsf2IBryid3cmE8QaLyqG9gKdMMJoix6+AVvlwruoVw4Zr04zPCC/hFLTQvqcZTCJt
 6xUXKmegFR05d1nDJ7jAlSvYdvFjMfzrNVeYi3yr07lHkkVcyMKsHhggFJ+fDEE45dWsLvj0TkH
 Yt9CjR8PV4mh89lJb1ELpELnsNi9hexnMmycPXpIfCuH7bIAwxc28nYIoOGckJMCv1KQr2n49l1
 vCb48Bm8tI95sBg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: ZheyngjlS_gBfjWQrEJiUmv8RhuzlUs3
X-Authority-Analysis: v=2.4 cv=Rv/I7SmK c=1 sm=1 tr=0 ts=69bd27fd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Ad1fb5OyY2Y2j-lNpeoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA4MyBTYWx0ZWRfX7wJAoVg42yTa
 SBl0FeTBxAn4kUi4Ct7kbfi1KnT86qS/O3DP+e4yzm+9wKYBQSFKxkHcXYjbp8vqr0EbPPMMfFH
 SqvT8WCNf1MGqvl2tt9fCgRIgrM63OqF56dTcy/lOrMv3TDpQQ3j9J5bGFUyHtOY4pwakj61Sf+
 Pe8Ig6NsrSThqaZx7t/S1mdzNHvOdA8EaXfJ+AMA/kp49ZLieVY4YaNrF06V80/rciePKhEyPbP
 bEutjJ2brDIeg97GttkCQVtDlyQQ8w9Lbu1kMIpIYCNZGrHU9DEj/PMfOgwdixEJfSMxtXXmFRT
 cR9LQzdA6nX3M3w/e6nnG9UzwRQzHgqF2/TiOlirXnI1vbT434GSDFp+4L4nVPCkgAZk06g5lfn
 Sef/y1iH2jBTLgI1upJC4m6F8v6y46kAqF+nt8NXxCNt4P13V5vtjOe51tr4SefolurbNZ2prdQ
 401wtQNvookRPaUZQKQ==
X-Proofpoint-ORIG-GUID: ZheyngjlS_gBfjWQrEJiUmv8RhuzlUs3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98908-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA4262D925D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for USB on Glymur SoC and its Compute Reference Device.

This unblocks the upstreaming of the display support, since 3 DP instances
rely on some clocks provided by the combo PHYs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v7:
- Rebased on next-20260319.
- Kept the nodes into the glymur-crd.dts even though there is now a
  common glymur-crd.dtsi that is shared with Mahua CRD, because
  this has only been tested on Glymur CRD for now. If Mahua CRD
  upstreaming effort deems it necessary, it can be moved to the
  dtsi.
- Link to v6: https://patch.msgid.link/20260319-dts-qcom-glymur-add-usb-support-v6-0-fa305b40a90c@oss.qualcomm.com

Changes in v6:
- Picked up Dmitry's R-b tags from v4.
- Link to v5: https://patch.msgid.link/20260319-dts-qcom-glymur-add-usb-support-v5-0-b1d9c03d5f09@oss.qualcomm.com

Changes in v5:
- Rebased on next-20260318.
- Reworded the commit messages to make them cleaner.
- Dropped all the dependencies.
- Link to v4: https://patch.msgid.link/20260309-dts-qcom-glymur-add-usb-support-v4-0-6bdc41f58d18@oss.qualcomm.com

Changes in v4:
- Dropped the RFT as I've been able to test this myself now
  and Pankaj tested it as well.
- Added missing second compatible string to pmic-glink node.
- Dropped the 3rd Type-C port support entirely from CRD dts
  as the SKU that I have only has 2. Re-worded commit message
  accordingly.
- Forced dr_mode to host on both Type-C ports.
- Picked Konrad's R-b tags for dts/dtsi patches.
- Picked Pankaj's T-b tags for dts/dtsi patches.
- Renamed the second PTN3222 from "_2" prefixed to "_1", as Konrad
  suggested.
- Link to v3: https://patch.msgid.link/20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com

Changes in v3:
- Dropped the PTN3222 USB Redriver @0x4f, which isn't there actually.
- Dropped extra newlines from pmic node, reported by Konrad.
- Link to v2: https://patch.msgid.link/20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com

Changes in v2:
- Picked Rob's R-b tag for bindings patch.
- Fixed CRD DT commit message according to Jack's suggestions
- Sorted nodes in board DTS.
- Added proper quirks to all controllers.
- Added RPMH_CXO_CLK as ref clocks to the USB [01] HS PHYs
- Replaced 0 with 0x0 in all reg ranges, as Dmitry suggested.
- Renamed all usb_ss[0-2] to simply usb_[0-2], and the usb_2 to usb_hs
  like Konrad suggested.
- Link to v1: https://patch.msgid.link/20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com

---
Wesley Cheng (2):
      arm64: dts: qcom: glymur: Add USB related nodes
      arm64: dts: qcom: glymur-crd: Enable USB support

 arch/arm64/boot/dts/qcom/glymur-crd.dts | 214 ++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 691 +++++++++++++++++++++++++++++++-
 2 files changed, 900 insertions(+), 5 deletions(-)
---
base-commit: f6eb9ae8b9fc13c3971e4a6d1e8442f253001f36
change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


