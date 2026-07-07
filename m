Return-Path: <linux-arm-msm+bounces-117420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RE4fErh/TWrH1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:37:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD122720268
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:37:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WA8ATFa2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="iG/fiDiW";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117420-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117420-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4809F3051285
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 22:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFAE48164B;
	Tue,  7 Jul 2026 22:29:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F754A2E02
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 22:29:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463395; cv=none; b=o5uvl5aNE1uQrZYXVgpX6TNeIRXY+YNLiW1e67rHUtn3CXBTQJ2B/wFPwokG3WIwDgTeFRki3XRLLwiVhaiYdWZjejv1XCPU+iwhqqLvf8qV1KnA2yXBTRf2F1OAD65P7DX2BVpIDjvjmjsFLFaiIX2Jahfe3HcaDXYHVUO3wOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463395; c=relaxed/simple;
	bh=UNUL9Mr0l2L8Lqs+wHPrdAEPNY6fCsW9k5nh51lE3yE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IcB2DBHAKQHGa79C4aGXf4WIn4HJWKST5a5zmO2vmitW+orq630z3KACpe5Q/gkFlgvp4MyJ0byYjM1+LY5bTBpwWZI31pp08DpMI8duWUizGioz2xY+naNM74prdPdZ4I9YLhNUI6X0t0yQwY9NZs9VCJG9lt2XBG4wtTlo6zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WA8ATFa2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iG/fiDiW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667LbsPr751223
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 22:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VtT1Xc7mzYmEVXSOrS2xHmSXZj1i0soFFiiNBvav0A=; b=WA8ATFa2R7gV4thU
	2vafkiqJobF/q4UIq+AjsVKX1rvJrsocFGLpXXW531S1Wzo+nrTSNHlDhPXnTHkb
	rYMzyCcKLL0aRh/BR2EspPSF04fqnX3e0bC60xkJF3gdlTfVAlHXXY5QKtrMhX4y
	p6Eb10WJv3kfqaxNcuEoBnHbFMTEG3tkYAfKWqSimQ+HFiTkFkVrs0zqRgpSPAOv
	ENGya8u/rGUCjSSlkXcuQpgCeW46xxoIYq3DDwgjAAhr4LEuMczT1+kb3Vvlq3qc
	WWb/B750nAm4e1mTgReiV55wiQnqUYrgz3jKXNIcVxfLWKOU04HosqpdXi2/Hzao
	OcgM9A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgr6v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:29:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-737f1f1e1bbso10120137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 15:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463392; x=1784068192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VtT1Xc7mzYmEVXSOrS2xHmSXZj1i0soFFiiNBvav0A=;
        b=iG/fiDiWNc2E7A0PewZIuL9U0N1c6sguokQilLwftvbxnNvA6L4em2zx+qKHdN022Z
         CavHOwY45GrRiuazK70V4RAXdhi+5T7l4c3N0jGWGlNdI5sCf1qoJS3f8OWATumWmnQK
         un7BzMc3X2g+SvuiTK5P6sa/gJdZ/enV/E9Wv/kTkYicAlflJVHJWTWfJUvg1qyLOBp4
         pFBLWQg+b3KOirXJ2LyKTnzm5+35kLJ0lXKhsOTPbFkNZ1JBZf8q3uHT7xN0ea/JYSMF
         WEQmvGXUQhbeYsvlfB1mC3ZB0uMFzO259fO2oEUcIjTQjzzdJX/tQmulrZF8yo5K4dwi
         EmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463392; x=1784068192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6VtT1Xc7mzYmEVXSOrS2xHmSXZj1i0soFFiiNBvav0A=;
        b=cMZyoMkB9f2x34GS12yqjmKP+n7nT2ywJrP+FW9PJyPD/E6ouIjLUFKomgN4xnXHDF
         J+S4uuuBwdrbGXvNXO9f7t328NuhiWxWlnC2eBBw3oUDzNd8pZj6zgmuxczF4vjmOpVI
         us5+OOpbBCyYLArM/ZWdGGaCvPhSX7i3yaR416tJZg9aSER2PuOO08RwHUgWwnYI7GAm
         R2gGBLYyTDSbvk23e5M1rkU4K185hp45WXXxzt6shQkfsqSJnGx7JsPl0y/z1orhtaGm
         g4Zq7Qq25OJ4dD1M86gjGiOGC22+9OzTJ+bxmFORCeMybay++BB20McKHgvElTwzVBWi
         zCkw==
X-Forwarded-Encrypted: i=1; AHgh+RoP46pGaoU93UFHXrh6IM0G4gxRrfxqlTuuU5HrwB3RRxyK8ff0WMeNHeuKi7wdpM5lzbnCDI6r7/ByA5fQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+v142yoIVmHU/gn0tV9wwBTomtxPyeTgsw03ova3kcyh5YVSr
	hakN8ZemlY972jAXymRvCcIAH8NfXRaAnPRbBwLk55y3hOy7Hjrt+BNHZASqckbROsWhgWkSW4I
	yuHwhxjp5CGd49Q9F+RmZiH8QPrteIqAqKQupZPk/KfuolKilnyZvjbdp+7wSyoYP4cQa
X-Gm-Gg: AfdE7ckG/yU9t8A8IttaET86wdmHavCACHzoV/ulvuac1DS/kKMRCFBfWTFyNCjgTsW
	VePRWs9PRduVsoEoWsqeVHhF2lnnauqlR3tnowgdv5I3qy3SRZWbpnVcXaxcBZE7y2SYDNCsDlV
	1cfbOqmm4JvFRltcNBwV0am/H9TsAo7l6LnFEnZPhPP9DgjTP1CPs22etbBBQrNyzacIBmG5Wtf
	C2Qymw+ZtmxSMoGQojyNxRjEEdXT+WTTDU/iuhfsYgpDLsAygj9kJuF+4/T+WlJeayzDjYseQQX
	TY4kdwx1+hZM6tnzIR8MgFhA2Tki9YZijijuTAnXkkzzS9S20fSSuJrxPHAhSiSwbbro8pAf5GG
	NIl368YH/8qiXa6Oq/QJR9qHDZbxv59Yk6GG5xxpgLSXq2uyxfP7nCFqQgv8zvhRKu9XRaIWCve
	QLX+RTeIp33tPROhVRbXyyJz98
X-Received: by 2002:a05:6102:370a:b0:738:84c:6b3 with SMTP id ada2fe7eead31-744b79e2516mr4446652137.3.1783463391796;
        Tue, 07 Jul 2026 15:29:51 -0700 (PDT)
X-Received: by 2002:a05:6102:370a:b0:738:84c:6b3 with SMTP id ada2fe7eead31-744b79e2516mr4446628137.3.1783463391274;
        Tue, 07 Jul 2026 15:29:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:54 +0300
Subject: [PATCH v6 11/18] media: iris: Add framework support for AR50_LITE
 video core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-11-374f0a46c23b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10669;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vbLao7R78n3Cd+uUYw/mexaoZuBaorBehVeJUdtqoNk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2pIwmMlU1AtBMDoWZE7bn0twRME7W/5YXnm
 bETz4+lkDeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qQAKCRCLPIo+Aiko
 1exRCACzqmy9z2VtS8WN+mQk2yUYafIbwkzjMKnxZCqivyGxzHa09ONmvJq9uLoM8B3a8wRFeO9
 CG/AUgcRyw7EYRyJ98LjceROYMzMCS4pNYLwzAaYshIHp8AL9wvq25mUIUzz/s4GJSHeggDeTsR
 MC5f3yQg0L/jilCWVv9vX6zTL35FhyAvG8RZjUJBRrL+xTGNnoVd4G7v04K9Qoj50aHE1JIKnEa
 SNTd2vsmJKwYQQmp2mxA6gJGGN7kfrQW51YnH/yAM2d7oYr/K5olngIxxaTbCIZty4k0N6DvmTw
 auWBqFT+78aJ3i5pBB2H0EqGR9e/jP6a0F0+SD+ZYj94UogV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: vG53wCMsqVRNVnMjiuvATt7A-YzocxjE
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4d7de0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=oth-URKmseDdlDMfR28A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: vG53wCMsqVRNVnMjiuvATt7A-YzocxjE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX3+FDSZwuIwZa
 F6Tjbm42b0svSn0F4Tj6z+YcDBS0fKCeCjQ/Kn/WxjMZMYbDqzvYKfCwWMKOtCXg2aZhmtd/h8d
 yRPqoaMLTKaJTL+zoazQnRG3GLq4B+Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX8Jwm7IQYjM1Y
 qzZkp8ttOtUDkUFTPhc7DOrNt2b8K5uuaazDzQBD4GkiNzIZJpq7yW7aPcMpuis9vVjS8/dsizc
 zN1XNjTlWZo2FMZ6qWIliTLPWttEN0FAh+Y4lAD9QS7XNVKuy5/nuKOwTgBKs29PtOuhJN/idBk
 3lxBrn/wCRVTV4IOEqftYTzBitdP+X/il8MK+/TQ3f5WG4R2/getihO83BineXD9va6CA6rjdrh
 43zogup0S1dEA0wF7RwZUraM7iOZwpHIOwhUd/Yf15LjzUwXTX+Xr9LIBQnYSQruX8nT//nG38G
 SxrVogbJuiplch6lULzuOQTuiMlVh49xWv6EoUUbZ75EnKU4tUTHADSwXvqJW9Kc5eoNVG2Qydo
 6qTksCVZlYYPq9o6fLd9BFIrmlteeAKiNZ0zGJeioghzIsxiiBV6/dMoKX1KwAH1CA/5EZLDz94
 yyhbLUPkvNWS477TLcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
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
	TAGGED_FROM(0.00)[bounces-117420-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: AD122720268

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Add power sequence for ar5lt core.
Add register handling for ar50lt by hooking up vpu op with ar50lt
specific implemtation or resue from earlier generation wherever
feasible.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  28 +----
 drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 130 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  29 ++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 6 files changed, 164 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..f1b204b95694 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,6 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu2.o \
              iris_vpu3x.o \
              iris_vpu4x.o \
+             iris_vpu_ar50lt.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index accc1627defd..6a189489369f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -74,6 +74,7 @@ enum platform_clk_type {
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
 	IRIS_APV_HW_CLK,
+	IRIS_THROTTLE_CLK,
 };
 
 struct platform_clk_data {
@@ -315,6 +316,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	bool no_rpmh;
 	u32 wd_intr_mask;
 	u32 icc_ib_multiplier;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index dd2eeae0d9eb..5419a5096b00 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -12,38 +12,12 @@
 
 #include "iris_vpu_register_defines.h"
 
-static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
-{
-	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
-	struct v4l2_format *inp_f = inst->fmt_src;
-	u32 mbs_per_second, mbpf, height, width;
-	unsigned long vpp_freq, vsp_freq;
-	u32 fps = inst->frame_rate;
-
-	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
-	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
-
-	mbpf = NUM_MBS_PER_FRAME(height, width);
-	mbs_per_second = mbpf * fps;
-
-	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
-
-	/* 21 / 20 is overhead factor */
-	vpp_freq += vpp_freq / 20;
-	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
-
-	/* 10 / 7 is overhead factor */
-	vsp_freq += ((fps * data_size * 8) * 10) / 7;
-
-	return max(vpp_freq, vsp_freq);
-}
-
 const struct vpu_ops iris_vpu2_ops = {
 	.power_off_hw = iris_vpu_power_off_hw,
 	.power_on_hw = iris_vpu_power_on_hw,
 	.power_off_controller = iris_vpu_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
-	.calc_freq = iris_vpu2_calc_freq,
+	.calc_freq = iris_vpu2_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
 	.interrupt_init = iris_vpu_interrupt_init,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
new file mode 100644
index 000000000000..e084a5b49f2e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+
+#include "iris_vpu_register_defines.h"
+
+#define WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT BIT(3)
+
+#define WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT		0xb0080
+
+#define CPU_CS_VCICMD					0xa0020
+#define CPU_CS_VCICMD_ARP_OFF			0x1
+
+static void iris_vpu_ar50lt_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT);
+}
+
+static void iris_vpu_ar50lt_interrupt_init(struct iris_core *core)
+{
+	writel(WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT, core->reg_base + WRAPPER_INTR_MASK);
+}
+
+static void iris_vpu_ar50lt_disable_arp(struct iris_core *core)
+{
+	writel(CPU_CS_VCICMD_ARP_OFF, core->reg_base + CPU_CS_VCICMD);
+}
+
+static int iris_vpu_ar50lt_power_off_controller(struct iris_core *core)
+{
+	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return 0;
+}
+
+static void iris_vpu_ar50lt_power_off_hw(struct iris_core *core)
+{
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
+	iris_disable_unprepare_clock(core, IRIS_THROTTLE_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+}
+
+static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_ctrl_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
+	if (ret)
+		goto err_disable_axi_clock;
+
+	return 0;
+
+err_disable_axi_clock:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+err_disable_ctrl_clock:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static int iris_vpu_ar50lt_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
+	if (ret)
+		goto err_disable_hw_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_THROTTLE_CLK);
+	if (ret)
+		goto err_disable_hw_ahb_clock;
+
+	return 0;
+
+err_disable_hw_ahb_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+err_disable_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+const struct vpu_ops iris_vpu_ar50lt_ops = {
+	.power_off_hw = iris_vpu_ar50lt_power_off_hw,
+	.power_on_hw = iris_vpu_ar50lt_power_on_hw,
+	.power_off_controller = iris_vpu_ar50lt_power_off_controller,
+	.power_on_controller = iris_vpu_ar50lt_power_on_controller,
+	.calc_freq = iris_vpu2_calculate_frequency,
+	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_ar50lt_set_preset_registers,
+	.interrupt_init = iris_vpu_ar50lt_interrupt_init,
+	.disable_arp = iris_vpu_ar50lt_disable_arp,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 41498f94480e..d64e7745a63d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -97,7 +97,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	}
 
 	writel(HOST2XTENSA_INTR_ENABLE, core->reg_base + CPU_CS_H2XSOFTINTEN);
-	writel(0x0, core->reg_base + CPU_CS_X2RPMH);
+	if (!core->iris_platform_data->no_rpmh)
+		writel(0x0, core->reg_base + CPU_CS_X2RPMH);
 
 	return 0;
 }
@@ -422,6 +423,32 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core)
 	writel(0x1, core->reg_base + WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0);
 }
 
+u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 mbs_per_second, mbpf, height, width;
+	unsigned long vpp_freq, vsp_freq;
+	u32 fps = inst->frame_rate;
+
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	mbs_per_second = mbpf * fps;
+
+	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
+
+	/* 21 / 20 is overhead factor */
+	vpp_freq += vpp_freq / 20;
+	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
+
+	/* 10 / 7 is overhead factor */
+	vsp_freq += ((fps * data_size * 8) * 10) / 7;
+
+	return max(vpp_freq, vsp_freq);
+}
+
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 71d96921ed37..a62b6184bde7 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
+extern const struct vpu_ops iris_vpu_ar50lt_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
@@ -40,6 +41,7 @@ int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);
 void iris_vpu_power_off(struct iris_core *core);
+u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_size);
 int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core);
 int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);

-- 
2.47.3


