Return-Path: <linux-arm-msm+bounces-105203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHifHEIE8mlYmgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:14:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED65494966
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1716B3022BBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260693FD14D;
	Wed, 29 Apr 2026 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYbvHdIJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="chuoJgPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02AE3FCB14
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468331; cv=none; b=POn10xnCA8zgwkOZJ4QVml9FRGK567ev3KS64OE/Kxx5n90rqsAblGwQ0h7ng0Q3v5jvI1JW+aw8Crtf5/CgJDK8AY9TXz5N6hUe58qyxRqyr4wjH4JDiUBnhpVWrzc3AKXvvsesau9GEPtTDO9es5RFtDLSEhT6KDPNNMOUKJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468331; c=relaxed/simple;
	bh=sQlnEyALeWoqRjlSzoDym4TcWUqFIQse80DmfyA5AD8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ieytdALEPrNBRnaLDVpDIzgH35a8iT5VTpfslt4MSYutyos4u3zJP1ZzEGmVFof8FFc4+LQU++WpLSrQHIz4Iao58psZFglNO/WQqV6ivuR0WYaYwu7Pynzm3o4+czFHZZUD5P0hT7ork1WwOYbowdwOB+sX/LGsadr1yPBqJNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYbvHdIJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=chuoJgPf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pqOi1641533
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5tcVTdVxFKWbPOvQ327MhX
	Y5HFY4B6nwROt9RjHUiXU=; b=DYbvHdIJcGqExfaDDBYQUX7jX+Vir7hdxBd5p7
	7/pKhw2zw5n0m07CDrDmI6b0rwqlM42pJW8VWTW44DKp7cHsX5CG9VuITpw4PUqj
	nR821edgiZD+ERbiBdn+bA2KT74o1P2MHK4s/ryvtNUb++ONTOriqfpyYLUDeswO
	GWAzELzslsnAK6JcdOv1L7smgGX0Bi+JBb+0Y/t7pCWzJPSudQmaXHtkm+p6avCx
	OUxligeTEwh7hQrAd122QYz35Vxlh90yA4nzOacjCh7rKzpQiM0Gjv1rtfRCYwdm
	6fYtCxWuBoCDNhUwHAkxv7EGQlL+fKzj9BJQoTTAgbGzEdow==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj81mum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:12:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6b984b3aso7026685b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777468326; x=1778073126; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5tcVTdVxFKWbPOvQ327MhXY5HFY4B6nwROt9RjHUiXU=;
        b=chuoJgPfDBS6IyXot7JA3bu1IblchgDt9C9HBQ/j+Ofp1digoaqWBVsYSfFqjEyhAl
         DDlxUNHg3eNjgcg0U9da2VVhgKCIxMo1vQT9uiha+I+FJCiBn/huuZkn0gSw2BdXTZGz
         WKvOwbwYpGYUoeLuNYxL+FuvjZPh0er6aG7s4g+6WLRNFZ/lSvZi+csd/BIxuNN1pv73
         LDfujySsk98r9mQmUc3vEzv4yOFcQK+EtCtE8+izCTDM1do3FKHl+IFIY8d07Q90JRqY
         wMah//4uILNOw4F7698GG2RWZTRBqJCIOK1n8y2K9W0UyYIoxUnJLdEDIROSo+HDA/RP
         EpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468326; x=1778073126;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tcVTdVxFKWbPOvQ327MhXY5HFY4B6nwROt9RjHUiXU=;
        b=Wqr3potZcUNOnGD1KEAt93dltROHFAhm4vHw1VHelZeUF1pqy1KZ40nhrSqIS0IBCt
         zvg2RGNvlcJq9moPGAK+JX24HfmBVgBW9FmtAOIAFZ5qv1Z2a+UEhacYrZZJ4py3F8xQ
         f0oWabNSamczucTvbI2paKNBVdvHhntmlGS7NpnFVQdEVAm8FcakvLQxapT/DnvzW4B2
         w0/xKi1Yz3g08Z0KpgB2rN45jLM/VyEnHtFM8yZ2cTUj97p9QVMYwaAvN+HAWVI/NWmk
         GjoRy68X053f/6Ap7MOTaty8j7kKl3Sx003R3OyC4ixmswhszfYJdxtB+sMN+P1lOFAq
         kzLQ==
X-Gm-Message-State: AOJu0Yxc+x5uY3eqpWJgkHuwzEYwVV/IDIGsZ4PiKzG+OBSb22KfIVUe
	DOfUPxsxB/fSraAAWK3/pKIPPTr29vyKLqq3X0DTRMBP5T0XBZNfus98VwWKxF7EAf0P9zGnS8X
	F7MNl5b4/ZiGmGbP0h7KHE695Ex/bgw9elXqzWujlL7ATpAMs8TFfavag3Y9n4QHdCkKA
X-Gm-Gg: AeBDieu+N/qxyiPZcmVvRlfufoq4yM4P0g0uQrL3FQCGMBwmQTJXJqlFexAMdOD/6pP
	VA7h0xZdsWtqifYvHww0M+9ZuAr3raDpxrjjh2U/ZxJA69x48LMg31RRoZO4AGRFhpyKAmeDi4J
	svDZrFIfq9Qfvucyl9WDRPfFG36lBfWx5MaO+0JE4DfzqSQ74JfhObtv+TMC42wXsrYCqioTTJW
	/jqQ/DsVL0cLPLmfaJeLxbg2jB4gYPHOQwPe6G5llfs/L5TV1UncGOvcY8YVNccuKJwzAiFJuA5
	lF1LNlFtA+Oml+Kp+d4gWOhGjFHl7uFUkWckwxrPt13HtKHRtGehf4hAkQ3GFGDM6cGBq6DW7hO
	lFZj9uxDWu22iU8ReUDi77cqxhSNhZDF85Rhcai1ikWSbXGw=
X-Received: by 2002:a05:6a00:b610:b0:82c:7356:f45e with SMTP id d2e1a72fcca58-834ddbefc57mr7895793b3a.31.1777468326517;
        Wed, 29 Apr 2026 06:12:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:b610:b0:82c:7356:f45e with SMTP id d2e1a72fcca58-834ddbefc57mr7895749b3a.31.1777468326058;
        Wed, 29 Apr 2026 06:12:06 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed6decf3sm2063025b3a.31.2026.04.29.06.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:12:05 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Add support for Qualcomm Shikra SoC
Date: Wed, 29 Apr 2026 18:41:55 +0530
Message-Id: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJsD8mkC/0XM0Q6CIBTG8VdxXMeGQKK+SvPiAIc8q9TAXJvz3
 aOsdfn/tu+3soSRMLG2WFnEhRKNQ47yUDDXw3BGTj43k0JWQsuGp54uEfhEg5vjlQdvSrAVOl8
 Flk9TxEDPD3jq9o54f2R33sc/2xZftP6haXTkOUgDqGpnDap2Kd+qhYTcjbcbzW2hGiN0ECIYb
 cCCKnUmmtoIewy+BieVgAYgsG7bXjk/B/HgAAAA
X-Change-ID: 20260429-shikra-pinctrl-fd71ab6ecd6f
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468321; l=981;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=sQlnEyALeWoqRjlSzoDym4TcWUqFIQse80DmfyA5AD8=;
 b=7suvmGo10znQ7hExo1MntSioSaikQqdZrIl8e00sFPl7ZeISuX5I8CZDGfMcHFtqL7p7E2xYc
 QQJdMSBePMuACWmZgCYMwlMcwyySOCTPJjyARq+m2RVKH6RsNa5tjcw
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: xT7dbh96yRQgeUP-poulSMgUrC9CtIZV
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f203a7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RKqVp3ilHWDC27yp5dYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: xT7dbh96yRQgeUP-poulSMgUrC9CtIZV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNCBTYWx0ZWRfX5QIitlouJOAM
 KGMijlj49aKaKPCsi4riFvjKiThXZro1QWukajZxEu3orSeiiaCVhfD66HzDX0bUvgYxI5OkpFT
 ISNMIWGT7wR2uH2WNEvq5HlpLI2+6NsnBZaIat+zlqmZZC3ex9hU9pwH6dk1nuYR94U9ZX0vcUz
 jnemiTWvvNZdAgFvfkBXhTPFLcMytzUkRGbvjwrwoH8DMxFknqOQFLIftedYRPuLmscbkZc/sUf
 W+gqezaAF6sGAY8SjBhmEz2itGkx2BncL+ey456EA2c7lbfIrIqZ9J9WMa6g+Z58BMFqZwNYUIW
 FZZXjX5fXq2WFZpbO3MzAd5yufA5VH9k1G0NyzmApghmzRzlNuNiXrO1esV/rmTFZoSn/enVO3z
 bFyUMHejMInV+JzZvEjK8lIdwB+ZlNH+jUVebH8g+g5yVMcxFknmx1gDLBH8zPWmuqxRk8IBE7g
 xt6FQEGtxDgTM5Kq29Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290134
X-Rspamd-Queue-Id: 2ED65494966
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105203-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add the pinctrl driver, document the bindings and enable the
driver in defconfig as default.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Komal Bajaj (2):
      dt-bindings: pinctrl: qcom: Document Shikra Top Level Mode Multiplexer
      pinctrl: qcom: Add Shikra pinctrl driver

 .../bindings/pinctrl/qcom,shikra-tlmm.yaml         |  123 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-shikra.c              | 1280 ++++++++++++++++++++
 4 files changed, 1415 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f
prerequisite-change-id: 20260428-shikra-socid-a27ae38cb7e3:v1
prerequisite-patch-id: 843f28095c0d42d0d60ab7000095c64dcb2e90ca
prerequisite-patch-id: 1069d6880c3ff91c230c20fcd876738001c6d35d

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


