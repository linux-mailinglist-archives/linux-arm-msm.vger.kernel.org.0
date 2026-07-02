Return-Path: <linux-arm-msm+bounces-115887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rhVAJn0zRmq2LgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:46:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AEE6F5753
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:46:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i1QQYMQx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HdyBDkpf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115887-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115887-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C32743024885
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B526848034F;
	Thu,  2 Jul 2026 09:36:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E4D47DF80
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:36:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985014; cv=none; b=RX5roAI5uyQeS0Hn1rYH8pXqY75lSv1FP3kS5JuUvGU9++DIffeIkgKSgDnt5Mo27nWOvx+pvplJxKRCJnaCD/M6giNj+QbqXfKKQ0t9eEDg8O/eufHz7vg0Lo1XAcflzXYyTDBnymsRtk4UTRX2GHmth35/w4PKBPyl6s9mrf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985014; c=relaxed/simple;
	bh=ha9fWLnbP01/VrndnLaB1lXP36wWzxUY3v/qBBHW+KU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WXngMERj/pn9+WJlMX19mC8zrtU/GHFgbIIWFMPnCsdnFJLYMdHH6vzBGiwq/L6/x96T7Xfu6TFwhqHaYzvWI093by+tTodNfzFCGnwj261OepbOXNAUa6lpLY4dD+v46PbklMXNy7YCLHPiEZq1UI3pdrAjSRh9ajummPllXBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1QQYMQx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HdyBDkpf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628bHSo3009446
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hWNsTDwKnB0nQjRuBjtpdR
	mOjat4eE37McGVk/KSLto=; b=i1QQYMQx1WqpIO/nb6nJ61tdqzMjSp9ab4dAhs
	pcfbe9WV3n7roLacoCvkpQe5VgfgBJNiXg1PQN8e2A4tV3oIys7pW1/6XlwQqtLK
	YdYkwm58AXh8TxUEaEC8jSMpdRTd6kqHicTPsCJqSsNsBXzKtj/dbk4YIM/8fWiV
	WVDflycizXvaDR/TJAoEBRh/N8m/S8usL/WqSylEa0MlSSUwNgUoh1FhwLBRDo2C
	P09yLbjD35D0TVvp70owEqErSpipWoo0TiArhUypdVG8+7PC5OydhHjkkIskeAcl
	aWy60wriy1eKwT7HQVJRWF2v1h+UjTZBo1HZPNU3ez6eXPyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579ruahw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:36:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so51898385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985012; x=1783589812; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hWNsTDwKnB0nQjRuBjtpdRmOjat4eE37McGVk/KSLto=;
        b=HdyBDkpfWMxnog9C1r0P900ZoqDhdnaWiAKO8BAkaDSOVIpMO46aXLpVa9wCob5qIO
         +9jIDjFUyAB3w0hfqG9eJkMJnyzpljzlZv01mTZcehga8fvOk8y4oF5S9xNtnBV6WztP
         jxVPR+JS/U/Kj62Gz3PTLRAROR53/ioUmvRAxTyHM2rEhPuDcg3K7tOJdaPNj5/OZjgU
         3OvugXlObuA1H0HxekituT4XYDew44ejZ+UsSjJ2JLzLt1Qo+u53C2cujyzq5QSNsrkp
         gGzZWxBbJBh9oLpOSdkcR4lmsD7yyCBYJU9L7PDYJL0i/4Wy6vyP7HjVDu53SEvRsJ0d
         gCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985012; x=1783589812;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWNsTDwKnB0nQjRuBjtpdRmOjat4eE37McGVk/KSLto=;
        b=kPRGlzZ9RzA7cJ/ZUIP4t65DvUh810W3phcgkAXD1Wks1EPJoImx9ELzMkzkTFxGxe
         sjbDnMrDnn82+ZBLFJRd2w5RUdFFLbmrvhKpBOO0NedzB8DVe2blsf/gqYlixTsyLRgN
         r9ZfinDtYyNDv8vnkiwkpaxlnZZJyFBmRXtJrCSdEzWBDjOS95hgUTR/ZJuXaRhyeiNW
         wR1V+7wzIZd8x9EqxiW2dfWd7BcKWxpUdUBqaFP3EcVMA/2B6hUD5XXvnj29YVlU5TRV
         M1oWtALg93vG6Jw9qWMwqZe0Ul8m3w8kevSM55eDczRyZocMlZB8TrWIfudry5yCEqT2
         rqUQ==
X-Gm-Message-State: AOJu0YwA/nPXz0Ew5Km/J8vOsx/w2hJovBByvRkukQQQ3FbiPBKDXL5Y
	jeIclo083uOVJGX6nA7VWijG2tJf9Wjn0xZjGN9BIDCVnaxsPvTh43dKRtrwZ6zSOt4/dbVTsCp
	2C7Y71+yWSUGTJ4DLxUDcXdYsv7rEw2U2RSp3BUIKDtHsAfz1csRlZVXfSUjR2GzSduksXTFkQD
	Ik
X-Gm-Gg: AfdE7ck0SjnDMDRcFIQ5POE+3QRcYLxqQfjOhckEP4RNDWuVmiGnYpYmvr/qbZtmrco
	i+TFrd/gSjGJ1uTsS1Q4Z9ecgPA8mONAZ+N8wewYz/8IZ0cdKlKCJKO3MF1lep+D8Iuh4+qqXi0
	IPeH4k1twlPpvhlAlV5AnAF1GyqQpw/+xzAYrVTIYu/ccsOaciWGqTyE/b9fbIMPhTcFzN+EdHc
	RSopRq1cNpkHBdLgHqIppZsZSseY1oG0kYKNOqRe2veseTTCj+ynrBofdR7LElKH0tH/IycGNr9
	UJwJeqhlS7DzVLd79Jk+PJHxE0ehcnZzyhLjy2UVqCRIb99dtojn84NKQ9Vwj+0pkBhl9+uGVDZ
	V9rBaPyMpPKWhZErBvHEwRtN1TjSHd3B8/VQ=
X-Received: by 2002:a05:620a:4550:b0:92e:61f7:5687 with SMTP id af79cd13be357-92e697f1e67mr1220754785a.29.1782985011726;
        Thu, 02 Jul 2026 02:36:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4550:b0:92e:61f7:5687 with SMTP id af79cd13be357-92e697f1e67mr1220752485a.29.1782985011322;
        Thu, 02 Jul 2026 02:36:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3db964sm7101335f8f.8.2026.07.02.02.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:36:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] drm/msm/hdmi: Simplify the code
Date: Thu, 02 Jul 2026 11:36:39 +0200
Message-Id: <20260702-drm-msm-hdmi-cleanup-v2-0-a4a4f0e8895b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNwQqDMBBEf0X23JUkNkJ76n8UDyFZa8AYzaq0i
 P/e1B567GXgDcy8DZiSJ4ZrsUGi1bOPQwZ1KsB2ZngQepcZlFC1qKRElwIGDti54NH2ZIZlRFF
 pJ6zRtb20kKdjotY/j9t78+VE05Lf51/ZeZ5jeh3qVX7aP5ZVokCrdaXVWbe1o1tkLqfF9DaGU
 OaAZt/3N/Mm5UvUAAAA
X-Change-ID: 20260311-drm-msm-hdmi-cleanup-035d0ca56c9f
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=921;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ha9fWLnbP01/VrndnLaB1lXP36wWzxUY3v/qBBHW+KU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqRjErWIym2Fh7Huid6TbyoC9GZP9fOKccezf8I
 43Uaue8fuOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakYxKwAKCRDBN2bmhouD
 11a3D/4+AtzUox1wG9dcBo0TVCXnxW0eTcd9APyNwpbMG1mxzkrNIWhdF4JaN/vwc6Gz94jkoul
 fXzCHxAW5rEoGKS9rhRnCoeqiK9SNUl0Ej0Ny0qbechpcAOhESx9BJ8x86FHpYL3dtqr0L/D40o
 11liCTboIHgnvIpj0hGoCnep2hIM9rLmOZ+ejKACJcxcY+Iyaf6TZvNV4S3aZEkLB4x3vmd/dg+
 U7cDi15hjz2cCxjL9D3TY/3dZsJylk+7qp5yDISN9c0SWbYqPnG3jZNc7iaE57ZKt9NGjLFXxlx
 L1ThEc366iVZUVk/r2/UQb02wEPyv6TXgLEcufSbzUKM2evhC2IfbTomg3fRMVoaGBTKYbXZG5d
 BzKkv+Y7DKGX6UKnBghX/T3pFk36yIgRxfw9XPghub3V59oAEa7v0+aKXgxuaJozMek4rIhFTcA
 BqZNqsuzapg5lZSsOLIAJJJsU67iC76p0VmkA/nuZkU2pAmAJZ42ePsU2MWCzGnuVapSVO4aszE
 v+mmb0YWoz2p8EKVr7EQcvv5I2GA/f9dTH+6No1DZxmwV3VG+uxCGESr2Y2uAHLDXa5lr1/OvGU
 CvDZOiVlqcp8dibVudZ3JkuLkthcBQWnPl7Y4FpgO8jx2wbkNFPOK7rX/tguAG3v9zXKw8QgZ6S
 q8TiwnO0cIdArkg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX1MIJhtyokalF
 +YX9Z1t5DClMFsOGui8UBnI0JsFLMCw/tppeRcXBtxRnN9+WlyVZip7zPtlMNpY5+ATvi2TF8ts
 F1gVVV0/9l6fb/LW4sP1LrvWhccmb1IthnBdZlLJ5I7VSY6qzGXLZxwpy4ho0X0IOXVy+9F26R7
 Xfh0GUXzjoil17j+Rge9QGmHL6M1XpsHC8ZMK5ku0gzs6Z0mzIGQhaO3GJUtDcyM7kh2NzFqYKE
 ceuCcVjKdlnrRBKI40hU8WfgHdXbrP/Y1kR/CFg2V3LOFOhUeB4oF9lC5Y381vUiy7IJ/iFO2ZH
 DDizMU0YXL2lgaq195RmF0IDd4Zea7apJBGtYFg2Ug7zme2zPzJPt9pMzplJQQpx9qEz97xZjZd
 U31cpeRGdndSj7MMCzZGAcKuwaoRBf6xZZurhZ1W0Fn9XeGO/43NgIXi5HONSbpdq5HSJs/QxBH
 e6DmqoxSru9QG+2sJew==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a463134 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=kI3vywTxrR2MwHqzhFcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 15f0NcndPiisk3KhPoNFmc0ZpYaPkLdS
X-Proofpoint-ORIG-GUID: 15f0NcndPiisk3KhPoNFmc0ZpYaPkLdS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX47lG5oEUL8rI
 P6ochxqTiSADsts/3HunfQ7dNu9jkQeN6IX/foyfP/C7bZJQt7AcWw2nHN9YJuHDKXgB9/Qd/yi
 zyXwz6450CADeeI245GO4qPIGMeuwCo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115887-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44AEE6F5753

Changes in v2:
- Drop all applied patches (1-5).
- Add Rb to remaining two ones. Rebase, but no changes in the code.
- Link to v1: https://patch.msgid.link/20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com

Few code simplifications, without functional impact.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      drm/msm/hdmi_bridge: Simplify register bit updates
      drm/msm/hdmi_hdcp: Simplify register bit updates

 drivers/gpu/drm/msm/hdmi/hdmi.h        | 19 +++++++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 98 ++++++++++++++--------------------
 drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c   | 85 ++++++++++-------------------
 3 files changed, 88 insertions(+), 114 deletions(-)
---
base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
change-id: 20260311-drm-msm-hdmi-cleanup-035d0ca56c9f

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


