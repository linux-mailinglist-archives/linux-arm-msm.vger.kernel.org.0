Return-Path: <linux-arm-msm+bounces-119026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WPMjONwqVmo80gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:26:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5599775481C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:26:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m8TWXM7f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Ha/Wxe8o";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119026-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119026-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A495D3071B8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA691448CE2;
	Tue, 14 Jul 2026 12:24:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F294483AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:24:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031870; cv=none; b=Gh3tfMNEm6LLHBUz7/kTb/I7Ar1deiAmEW4HxeaSfgvxA4L/RRwQeqBoRI3nx1PcHdtAlcZnQGIPUFax3nOsihbRX73hlwhTHN+rFCUwbGMz9Xyky7NVrk657RRzBsxSahcxyNjrfKwYp+WvIUh/xYxlw6H+e99cL85h45Isy6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031870; c=relaxed/simple;
	bh=a0iJXpiPVpNb5jp2bwdcRkK/t1vDreQyJ7PZL1jDvkY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MLncfDiHBBTSuepD26dKseQ2LmT50/x5yEuK8nYwQnJrLNqfgSA/7evYt0J2D+ZZka5Ugrk3TWDKf2AgQuds46wyEuYRHCTKdHo5LmURWFs0OlaRnvkk8csotEMmK/ZBggYy8XTSgmewzlRa3l03dF2IO0EgEBGH2nhxCkIsCfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8TWXM7f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ha/Wxe8o; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBOO74234653
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VO/pEhXd5lR+VCcrF6A+ZH
	NsGAyCTWVhy3fTRz5lAc8=; b=m8TWXM7fnjGOsvwSL/uYXiN50NA+KJwc+3Kq9o
	4qrdub49oRLGY0NZkdveDAhJRkdm3gOE2VmFUVBRmq4Ue0PlCWdrWIUSYGJjxLu0
	2R+r4f9vRgVNw1GXyroZn3SZ3N6/hTEAbV1Ox8RXL34O0iWi8wUxIFXC7ijnB/zj
	K1w7BnutQYW/ISIwhRxO1Dxxs/ieF9KM/pyUKT202vQeXyZr+2Oh6a1QCEvGqLQA
	SZrK6A6TXC9s99L3fFpTjzV2lKSdqt33IpSF7l2x9EVESaL2AzPSZn8am6HE7/Ox
	MFHHhGKRp/5jr/4q90H6yyxIfFO/zVF7rcofpS1+/W8tF61g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdde09vtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:24:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a87ef9713so8399671cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784031853; x=1784636653; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VO/pEhXd5lR+VCcrF6A+ZHNsGAyCTWVhy3fTRz5lAc8=;
        b=Ha/Wxe8oEOdKzC1LN0Sr6jg36Sz/b/scFC1yI/XZGRb3KfzRHzkQOe0Y3fyEotGwCu
         ESZbb2L8g0ZHnzrFcCT38fFMiy8P557o8VQSswrJViY2eLCrEIHuqvRXmDMzNh+FLZOl
         OnzDEvIy2RzMX3E54Zet2u1oK9b1FxOb1Aa7zu1FeGccPvaxdxHbPimZryF2wfPGhHPU
         0I5Wi1yJ+1jj7jCygcd+BXwK+EDVEe6WjNRq9yX4yv37cSmrDcK3wmYbJgtXRTXjTVG8
         cYVviST2bTXnl2J0aAWGDs8/6QRGpPrekdsSrQnbVBiMfi61F/h/YcP9VycC+nf9Zxvx
         DOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031853; x=1784636653;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VO/pEhXd5lR+VCcrF6A+ZHNsGAyCTWVhy3fTRz5lAc8=;
        b=Rgs3R8a8ActLJkQhkL8s4GZTM3DZlhHIAtecDI6ZzfcEEL8NyYhT+QTdDGiHE0TxI4
         ZWEABhxVisTD+qmiLX9k+HeHD/ENn/74wTcuIei48Y3puZLYboOMwHmXsTVYdWezavoh
         O3i8gmdJpn6uvVQjvlsI0/oUNXSXQv6Sr2qH90Jti869VWalcC7DZIrsOHdDqCaTBk0a
         7LBtXgFkwKLhzBlCKW2vfgX2K5+0T6sgwBpkaKmbqIpQq3aF4SyX6d/8mzFQLtUz8c9Q
         gt3oQsbqY5vTjnpyOSuRBTxIqx3746LD9LdaatMhk7LTTNd4kaeWLteb4oqNX+nfqBge
         RLtQ==
X-Gm-Message-State: AOJu0YxLJ648RXOOCSdvr1wOn+lIzEIIO8wWJ5eJBfVLQNTK7A9uurym
	UBaZaCcl0pdUwvjJEu63Qh6CFsqVdeozLJiJK8POdJjabNT1vQxYYIvCdkTe2RvoPc/7ROjkS2J
	NjAas0FtKN4zzHzgjbO1lTjHtsUGAhuSDY/hJ/JnjakG6YDfcyEJ6Z7WW7WrtUbKElKrr
X-Gm-Gg: AfdE7cl4AzuoZaezEM7wIxjbHrWIFu7Aje8SXw5DnJ8++Gy1dqUHBO1ZoADLeSE+TTW
	JWtrBI5RwSj5rAOcjqTo0iQsg9yeJ7NFIAZnwnXHok2qkjjoeUOiBMOmPwScsO1HDh1moACaqiR
	SWKFhByiMAl1z79iqB1oUjl5K+9AH+kCzmTQlVwizwZnfX0XdllrkdA9JzcIPCruSyg9ivTTQdD
	LxCwVznMCqEqjiVAG4Y3kh2a8W7RkLq113pUEumBwiyXNfJhbLA5fIChYWS0jbo5YIYFoDU1HYq
	VVtEa9uZbzyMHP6lXuRT5dRwNBmSdKhEPnI7WqDZyMZtIH7FVY+5s0vjrr9uOay0EF33cKG7Off
	8+taMnca+IYpnZEY=
X-Received: by 2002:a05:622a:a958:10b0:51c:b91a:33f9 with SMTP id d75a77b69052e-51cb91a632amr113417661cf.13.1784031852586;
        Tue, 14 Jul 2026 05:24:12 -0700 (PDT)
X-Received: by 2002:a05:622a:a958:10b0:51c:b91a:33f9 with SMTP id d75a77b69052e-51cb91a632amr113417411cf.13.1784031852148;
        Tue, 14 Jul 2026 05:24:12 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm77031845e9.14.2026.07.14.05.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:24:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] remoteproc: qcom: pas: Add support for CDSP on Eliza
 SoC
Date: Tue, 14 Jul 2026 15:24:00 +0300
Message-Id: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGAqVmoC/yXMQQ6CMBBA0auQWTtJWyKNXsW4aMsoQ5Q2M0CMh
 LtbdfkW/2+gJEwK52YDoZWV81RhDw2kIUx3Qu6rwRnXGW9bFHrmmYrkhPTgd8DUa0HjvbExuHg
 6dlDbInTj1+97uf6tSxwpzd8Z7PsHEbfuLHkAAAA=
X-Change-ID: 20260713-remoteproc-eliza-cdsp-07701ba2b956
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=a0iJXpiPVpNb5jp2bwdcRkK/t1vDreQyJ7PZL1jDvkY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVipiNjDQw5v7TlX/E5Fuv7ulYpQkwcQPqs8bp
 RI1+LzXHcKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalYqYgAKCRAbX0TJAJUV
 Vn3kD/0aI2shMbCcQiUn6cXG4gT5F3h/UUipteD/wFKv3pkhiBPllNpLS/3smE6WJfOfq8a4c4E
 YIqhuEosk5xZlrZB8IF1hHGq8vtKsrCAC/I1j+jIVUUUwrr3aVAgjVrBljXdZ3tDZ3qC+fHPREp
 6p3UZNgzlGMCAb2athFCWQTW9x3HGK63uTAicABQJHyRs2whqrWthNgBZ3gdHkFB8npA0oUVZrv
 Ns7yRP6XmW4/kbvEzZgJh8gNYoL/rneUAd/hsL7YHd/CgWLnqrxaotzpJsxhsjbKYb75EROhefg
 lhkkEuNtNz2Ufy2CcuhB8j+xU23N52PJbyOvMH8a+RBb8/9/OEVyCPIO0L+R94ZlJDCjyENYmh6
 CFYkpPiYJIxLVNNn5h+LJEr31+iSpNFXbRcWNu9Bo6y82Sgfb7RrqiAouehKHXanMNSc0XAC3M3
 FRw/n4kV8YU3EVQhrmlxqG8qfYJ8AONVMs4rAgTchhyzc7qqzk7fMeTyGXM2CoARBjbOu2xNIpR
 MbF7OOsqLZw1r5fqhFNG7eTgGcF80+xr53liUrWqbaPSJRSUm8OIcnE/FQ+/Y+bIpyEPFb9J+Gw
 TclA0jRmgH/BEi9P+C42Q9nw68eJzblQ1WqmYNW5hkXR+InAfQWfrOwEw8/WWx89W8Z9ZVfcLaC
 3/h0bWGb48tyQoA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfXxBq7s2eVRpO2
 02D1bM/jRphu3nabuhuBY9aQu6qBF3hGhgsubIgZai25yUwdSW89vvKwModEZ8FskeRy0e+PJjN
 +97msuEAAE9zSFDX+CL+iUgqC3kDDeM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfXzKxeOMSy+SSB
 u0qG89Bv3B8YPWLbp+z2TRAeqvf5DIRq4g/97gfOAdhLcWtDEVsCRvh2jTTR1/O8v7UE0wZezDd
 1TgtJ1vVDEDQRpNZP2gT2Ox3iE51HBUt5OnFFIv2/1Q+SgByx0xMTEqPPqEhwLxOqikatORyE0c
 7pmPVQplb6d2t96tS9eELx9yCwot/cF30eCs28k85rZvtenhKcT2PEmVd3zDt3WcJ9kKGHJ6XHP
 r/7DSOegVaN+PlH9dUMmofPstiG9JUHzSCNoJa0spSjwnxiClD5qAHdqDPqcsMcWMWtiQ8NlpBt
 w336McBzwADEXixyRqF55BNdX4G4BRNu85/zAacrPr6G8wFK2X/WA83zQe/btohY6baeEvAN+vM
 vF/LKibmHHCbvi4Vne5W2/4g3I/zVqsyknyOl7H7ZSWKrEFAPQgQzD0qLx2AmyBK/dYVlLbgh7a
 l4y7vXJuKECXS+SEYqg==
X-Proofpoint-ORIG-GUID: KfLZ5qdZiRxeFW7ibztaFUwSu9S4Sf8z
X-Proofpoint-GUID: KfLZ5qdZiRxeFW7ibztaFUwSu9S4Sf8z
X-Authority-Analysis: v=2.4 cv=F/FnsKhN c=1 sm=1 tr=0 ts=6a562a6d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Fk215-RvauUPKMbZKwgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119026-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5599775481C

First, document the compatible and add the DSM memory region
and the NSP power domain, both needed on Eliza.

Then, add the driver data and tie it to the compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,milos-pas: Add Eliza CDSP compatible
      remoteproc: qcom: pas: Add Eliza CDSP support

 .../bindings/remoteproc/qcom,milos-pas.yaml        | 41 +++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 26 ++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260713-remoteproc-eliza-cdsp-07701ba2b956

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


