Return-Path: <linux-arm-msm+bounces-112918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jzxrCXrSK2r5FgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:33:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DCB678554
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:33:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LyUBAIGh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XFv13Az6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112918-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112918-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6DA334FAB23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A9A3B442F;
	Fri, 12 Jun 2026 09:26:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17073B530D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256380; cv=none; b=s6GVJNjnysaeW5vzYppTzJRR3jOkKibkgFebi6l5+Z97/uHrmcmPLRKqvfdZRVr3Zl6710Inf9YujRSBCH9SxByO2GhCE6uhk/9aGxBDhTabwiberMm/IvU9Fua7gj6c0fzIl3yy25rN+vc1nsLO49KlnfyIcg88Fc2BzVpN2xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256380; c=relaxed/simple;
	bh=7e9Z74Q1L0nekJViAOnYD+dOHRBzFO189DFrri+T0ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmfA5OKE7nNSUf6I+HxRmGhvoHVc3xoBDDjOuSwu3sKu6irEGYjO3H1ppwDuktp1xW6nR7XKrHuEbnUV5tpH5SCQTLxikGhaecSYhyemTiEpnS658HCnSNXtBQ/1ZJXzizd9N2Cas2ebmKLDXabEDjLqYaDeHa+qu3Vzjt6APyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyUBAIGh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFv13Az6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39Y3W2411555
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NSZIeR/PALw0s5YexEl8YedZMsbjMIImpBw2uZ0uvz8=; b=LyUBAIGhvRMOcwHM
	Sj9lo0phgy7tmMhGveWSgaRsL9CCe9OAU139QKjKxk1I1jawSt2hstqaD/C2Qp2b
	WW5+ZFUd2OIG4/l3+mwn2Nu9BaX+G5FS1AP96tl+kYd86im1j8vS15oPBUt6xdym
	PIrmkaWHkxSnYCeXwqaGIq9seOzF2KvXEFBFgMhRcyhKbLU2sWwcE4L2sBDRRI/Q
	RzqVIH9YgG+RQHsESt25+bzd08Q+IIKnZj6g8X1pCKW4sJLLDt3sBqyZsUupcCTP
	SEI/TUXeQX2+ZpG9r4dRExzOnOlI3ry47XLgC3vrWPGEE+ykVL761BuZaREQK3C6
	xQo49g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165awf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:17 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963b744b61cso724856241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256377; x=1781861177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSZIeR/PALw0s5YexEl8YedZMsbjMIImpBw2uZ0uvz8=;
        b=XFv13Az6mwOoS5n4b53mBd9gjnqnQbXZCnXHscn8gzyIRyqrzVNV8whBryLcIkGKVn
         Awu3csg5asPcR83Jj3NVW6QLvBhFqNCCcqBO20Ewi6BuqeJYyOskYvetzQSmg7msLpL6
         D0Vrw8YQCPPT7C8lo0N9o3NoPboRI6yGP8z0oJLK4nL1DdFOVd2iVNINSycrJ+QvLCUX
         PNz8ixTshCZjW6f0S+dPF0nhEIZ8EuSDq4h5IarpVKNUcUWotufUnYSO8e3Lvt1wED92
         Mndvxoz9rpLoGVWcv78JVAHHZ6xILWtm89mbETEDIJyxUer1nSGQgw/BMkz6Zx1/GEml
         +Eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256377; x=1781861177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NSZIeR/PALw0s5YexEl8YedZMsbjMIImpBw2uZ0uvz8=;
        b=dtgTJzNnlPlXm3Fm8jVUjvOfaqgoXqxlLMfiDfMxhU7bFhxj4+LJI5ZfpglHrm3CUU
         XWpZGhMqpZtRpzV1+PV2/4t4IiRifpf+Ij50i2+/pM9ipLWzAs+paESFoeZ9jxUNIP8E
         RgKnjpAYJ5mwdJmevcSnCVh5gaCY2MkSGGf05tZ9m3oklQ7G7BWgRYPteWsP+CAMawbF
         j2iuZb7jOZ5QqhXAMENkUOw88AzQhCThN2vqBoDxRFh1ZSVIndzWmI2p2LOjffiN8lrq
         ywfvjt4wDiljI2z0PfNR5er77yPGSXvbKDMwrWOBKMARRVb677FVIg0KNK67datAigv9
         /llw==
X-Forwarded-Encrypted: i=1; AFNElJ/g9kKoMr3Bv8NaNGTytZXkuDkXBLJx1ftCtiL4S2l1s5WuYKlS+5Q8spLsmmnyhr6WVy9v8hdXQvoq7Bg+@vger.kernel.org
X-Gm-Message-State: AOJu0YzbHsLor6wycljISSPE3OxqT/j2WOyf66CZ4RluDVUPzEHivjdU
	Z+NQ10mJuHtnypb03h0Uh84CZwurR5AxQNgdfOMygpn9y93vqmvQyHyP32QwXsmG3J+ciFCF2y7
	+rkWLthEspEtmvp4umKaggrmg6SpBwTE15aq4wejP0vIG3xuIs4GKqu93lIduFtsRn20c
X-Gm-Gg: Acq92OE2Gbst/oWkRKd2fpx6j5/Yt2b0qWPv8vbB6mHQ0DEYHm8MjdoZzimX6WamoHL
	nJVpKYQDGpwo8yehTpgE6/+i8M+YSEMqSMT50qc8s+0nU5swfjQRfa70sltN7g7IyJBYlymjqdk
	x5bhOF6FZIHLcWgMQqGGy2WCeBVef2VqUU4aqd0mbhfaUTgZW7GFzFI1NNcNoI0OBe67tyPMsPA
	hjDCwT57HCyHaBmZAEH2O5AQcTR846WdoaT22GRjbDLInMpktIuoX1IJU01jzDelEIvmgSoRyRP
	zQU0AM73ndOtpm4Sg784U5W59DAq5AAJNqerPTmF+GmWRP8zB///gVIvIydJeiz01s1hzldxCNv
	O1ZQNh023dJI9AmrpAI2Z7h1pi0rgnRToTO0w0GZ5ppo7+xG5twxKD3YFAFtG4o3hfq+p1sXf+D
	pVfxvnTSoipTmJWcEDi8L+Bl9JusP0b6bGgxg=
X-Received: by 2002:a05:6102:5815:b0:632:3bd5:d572 with SMTP id ada2fe7eead31-71e88dfef60mr826746137.27.1781256376799;
        Fri, 12 Jun 2026 02:26:16 -0700 (PDT)
X-Received: by 2002:a05:6102:5815:b0:632:3bd5:d572 with SMTP id ada2fe7eead31-71e88dfef60mr826727137.27.1781256376284;
        Fri, 12 Jun 2026 02:26:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:26:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:46 +0300
Subject: [PATCH v4 14/16] media: iris: add Gen2 firmware support on the
 Agatti platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-14-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=22525;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LPduOF4U48dDdNMZXEau7vak3Qu2qM+bqRiM2DzBGS4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CRTWgJ0LUMxjgOM1sclxAXsPdcg4lH1vWw6
 +Hpb+u7htmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkQAKCRCLPIo+Aiko
 1cueB/oCmkZpuzHNNEobLFXwGpEwWYFte7Ly6eBS/U8QZ73JgAN3CTq1Cy7K33TjLF3gP8hAnNG
 gUyLcKRT1U58O+5scjYPnt+zt0iVUAC2qbYirIaxEZWzl4lj63W9Y15laujW1vQYKEEvY6JUg+E
 nHZaY4vHpyGX8E6CIs7KlELE3rsSD/GyuSnowKrhgl8qP2fjVLPtEu1ttQl2SHI2aOWUecbY0sE
 SMS+F2RJjrvDi7MIa4APMXyj0Rn9W/RiYwch17Qc+uEuyEBnaBa23T3d/rwAaHCBuwkabU70ZIa
 PA5bCdIOKjvXpCHzd7x5o1XqNwxM61S8gHcC3y/VZH3HjZBp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX6t7mctW3iaYK
 It++TnHxowM1HJfaOU06gYV/iCPJiCK1NQ/ns/vCEor5OIldDGkacNJLBfcaXgmqRWkkFiv0+i7
 Ra0HG6Qt4DnTmCQgiukyGxzrYcjIvJqGcUASAHaVRomEwK1sRlMwdD1/j0JyDU4MNKk1oh+Pihx
 N2YGLe35vwfhzr/W/DGjGBHu3OHuQWr9/ZKj/Z8UDd6nFvBbPoS2YkiCA0G0b5pTQiuhZWD/mKc
 4pkypE73AxaLkwTD+NR+ISy0rOVonBjT3Md4LfuHaVsGa8+DPLkiiPfspUv+bW7z3wrwyBBg/sm
 4dX31Ry2HkElEFEk1U29EV2PDRYAlS13igAq1chkFqiybOEL75YNdWov1+m6FGSSg0JwsfSciAR
 XxK7N3tWyOOdP7g6DdkwImxzhHDpRW3HFwb75q+wNMhAR9OQpSfhTX+GHvIe+HsJi4D1JEBdcXq
 2jkO+biWwON1/iknTAQ==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2bd0ba cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=GUEZgOuAT4xZVSXxJacA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: O5ng5P1BVmKNJZ2YplIW3M1t86qucvdv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXyGTUqxJoX1cV
 9lDelC7P4kXMGpNjCU3IVwvmd2v+xhQznpmDo7bhPsN68aNqpN8kKJ88ggnkIwEMwUV+/suFHsG
 aZkBJCSSQ5s3gblhCvp5qryayDTCDc8=
X-Proofpoint-GUID: O5ng5P1BVmKNJZ2YplIW3M1t86qucvdv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112918-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 75DCB678554

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Agatti platform is using HFI Gen1 firmware, which is considered to be
legacy firmware branch. Follow the example of the SC7280 platform and
extend the driver with supporting both HFI Gen1 and Gen2 firmwares for
this platform. Like HFI Gen1 this firmware doesn't have PIPE property
(but unlike Gen1 buffer sizes are calculated on the driver side).

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 613 +++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  11 +-
 3 files changed, 623 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..f89245269e8c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1118,3 +1118,616 @@ const struct iris_firmware_data iris_hfi_gen2_data = {
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
+
+static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_dec[] = {
+	{
+		.cap_id = PROFILE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
+		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = PROFILE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = PROFILE_VP9,
+		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.max = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0),
+		.value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2),
+		.value = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1),
+		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_VP9,
+		.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1),
+		.value = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = TIER,
+		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
+		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+		.hfi_id = HFI_PROP_TIER,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
+		.min = DEFAULT_MAX_HOST_BUF_COUNT,
+		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+		.step_or_mask = 1,
+		.value = DEFAULT_MAX_HOST_BUF_COUNT,
+		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROP_STAGE,
+		.set = iris_set_stage,
+	},
+	{
+		.cap_id = POC,
+		.min = 0,
+		.max = 2,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
+	},
+	{
+		.cap_id = CODED_FRAMES,
+		.min = CODED_FRAMES_PROGRESSIVE,
+		.max = CODED_FRAMES_PROGRESSIVE,
+		.step_or_mask = 0,
+		.value = CODED_FRAMES_PROGRESSIVE,
+		.hfi_id = HFI_PROP_CODED_FRAMES,
+	},
+	{
+		.cap_id = BIT_DEPTH,
+		.min = BIT_DEPTH_8,
+		.max = BIT_DEPTH_8,
+		.step_or_mask = 1,
+		.value = BIT_DEPTH_8,
+		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	},
+	{
+		.cap_id = RAP_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+};
+
+static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
+	{
+		.cap_id = PROFILE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
+		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile,
+	},
+	{
+		.cap_id = PROFILE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile,
+	},
+	{
+		.cap_id = LEVEL_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2),
+		.value = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_level,
+	},
+	{
+		.cap_id = LEVEL_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1),
+		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_level,
+	},
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROP_STAGE,
+		.set = iris_set_stage,
+	},
+	{
+		.cap_id = HEADER_MODE,
+		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
+		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
+				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
+		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.hfi_id = HFI_PROP_SEQ_HEADER_MODE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_header_mode_gen2,
+	},
+	{
+		.cap_id = PREPEND_SPSPPS_TO_IDR,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+	},
+	{
+		.cap_id = BITRATE,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_TOTAL_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_bitrate_gen2,
+	},
+	{
+		.cap_id = BITRATE_PEAK,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_TOTAL_PEAK_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_peak_bitrate,
+	},
+	{
+		.cap_id = BITRATE_MODE,
+		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
+				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
+		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.hfi_id = HFI_PROP_RATE_CONTROL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_bitrate_mode_gen2,
+	},
+	{
+		.cap_id = FRAME_SKIP_MODE,
+		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
+				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
+				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
+		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = FRAME_RC_ENABLE,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 1,
+	},
+	{
+		.cap_id = GOP_SIZE,
+		.min = 0,
+		.max = INT_MAX,
+		.step_or_mask = 1,
+		.value = 2 * DEFAULT_FPS - 1,
+		.hfi_id = HFI_PROP_MAX_GOP_FRAMES,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = ENTROPY_MODE,
+		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
+				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
+		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.hfi_id = HFI_PROP_CABAC_SESSION,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_entropy_mode_gen2,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+		.hfi_id = HFI_PROP_MIN_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_min_qp,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+		.hfi_id = HFI_PROP_MIN_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_min_qp,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+		.hfi_id = HFI_PROP_MAX_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_max_qp,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+		.hfi_id = HFI_PROP_MAX_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_max_qp,
+	},
+	{
+		.cap_id = I_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = I_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = P_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = P_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = B_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = B_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = I_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = I_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = P_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = P_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = B_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = B_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = I_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = I_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = P_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = P_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = B_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = B_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
+		.min = DEFAULT_MAX_HOST_BUF_COUNT,
+		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+		.step_or_mask = 1,
+		.value = DEFAULT_MAX_HOST_BUF_COUNT,
+		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = OUTPUT_BUF_HOST_MAX_COUNT,
+		.min = DEFAULT_MAX_HOST_BUF_COUNT,
+		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+		.step_or_mask = 1,
+		.value = DEFAULT_MAX_HOST_BUF_COUNT,
+		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = IR_TYPE,
+		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM),
+		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = IR_PERIOD,
+		.min = 0,
+		.max = INT_MAX,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_ir_period_gen2,
+	},
+};
+
+static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {
+	BUF_BIN,
+	BUF_COMV,
+	BUF_NON_COMV,
+	BUF_LINE,
+};
+
+const struct iris_firmware_data iris_hfi_gen2_ar50lt_data = {
+	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
+
+	.core_arch = VIDEO_ARCH_LX,
+
+	.inst_fw_caps_dec = inst_fw_cap_gen2_ar50lt_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_gen2_ar50lt_dec),
+	.inst_fw_caps_enc = inst_fw_cap_gen2_ar50lt_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen2_ar50lt_enc),
+	.dec_input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.dec_input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.dec_input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.dec_input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.dec_input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_output_config_params =
+		sm8550_vdec_output_config_params,
+	.dec_output_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_params),
+	.enc_input_config_params =
+		sm8550_venc_input_config_params,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8550_venc_input_config_params),
+	.enc_output_config_params =
+		sm8550_venc_output_config_params,
+	.enc_output_config_params_size =
+		ARRAY_SIZE(sm8550_venc_output_config_params),
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+	.dec_ip_int_buf_tbl = iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index bc04831ae7fc..5afe395cc4a0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -57,6 +57,7 @@ enum pipe_type {
 extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen1_ar50lt_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
+extern const struct iris_firmware_data iris_hfi_gen2_ar50lt_data;
 
 extern const struct iris_platform_data qcm2290_data;
 extern const struct iris_platform_data qcs8300_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
index 393256f39112..d9de7dcb59e3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
@@ -13,12 +13,18 @@
 
 #define WRAPPER_INTR_STATUS_A2HWD_BMSK		0x10
 
-const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen1_s6_desc = {
+const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_ar50lt_data,
 	.get_vpu_buffer_size = iris_vpu_ar50lt_gen1_buf_size,
 	.fwname = "qcom/venus-6.0/venus.mbn",
 };
 
+const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen2_s6_desc = {
+	.firmware_data = &iris_hfi_gen2_ar50lt_data,
+	.get_vpu_buffer_size = iris_vpu_ar50lt_gen2_buf_size,
+	.fwname = "qcom/vpu/ar50lt_p1_gen2_s6.mbn",
+};
+
 static const u32 iris_fmts_ar50lt_dec[] = {
 	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
 	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
@@ -78,7 +84,8 @@ static struct platform_inst_caps platform_inst_cap_ar50lt = {
 };
 
 const struct iris_platform_data qcm2290_data = {
-	.firmware_desc_gen1 = &iris_vpu_ar50lt_p1_gen1_s6_desc,
+	.firmware_desc_gen1 = &iris_vpu_ar50lt_p1_gen1_desc,
+	.firmware_desc_gen2 = &iris_vpu_ar50lt_p1_gen2_s6_desc,
 	.vpu_ops = &iris_vpu_ar50lt_ops,
 	.icc_tbl = iris_icc_info_ar50lt,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_ar50lt),

-- 
2.47.3


