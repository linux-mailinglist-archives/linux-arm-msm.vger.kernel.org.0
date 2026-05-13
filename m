Return-Path: <linux-arm-msm+bounces-107386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIzSJ0+fBGqbMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:57:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C87536996
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE57730AD045
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A2E4949FF;
	Wed, 13 May 2026 15:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfI7l5Tp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQoBRvuV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FC73803D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686551; cv=none; b=RZtTGsCuHschTqA8Nq3dC9fsyMMLKh+09HKoXakbf1ufVErCC7n5dGXP8CWGy5xL6vTtXVYZsPeCPIC5YmGN1o8UB1fHzx4o0mFwfoo/qjapwrxQLAa/j7wquxxyGLYhGcdcWytHDgeA8vyEDJ5+rgiaWrh21kuAJt05Nexw6zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686551; c=relaxed/simple;
	bh=rISBv32VZRJHCe3I/c+s75nTu40II2+RrJDUcL5VN/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYN16qXm/3LeR5vcr/MFubNIuS8LQYKSk51rtcUg7Z+4ns+pdaHBG4fi7j5srdo0eTarGzkOHI5CYY+jCj9YA5/YnvI4LV+06ceB2TSJ4f+N/zfqChSfZ/ps3TBH61U1f1aemesWfdJaeKUDmRvuQ3EBjryHM0rwMOrTXq9KmRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfI7l5Tp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQoBRvuV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEvsAr4082628
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o2hoaXqlrNgqLFRzekm3d2iZ6wdlHEJPfnH8qVCkVtg=; b=bfI7l5TpYmN/RNGJ
	5r7qUCNcPe+5K07H3aNZj79c9cxmfEaqnCd+jKP3dskUGTrUC7RujbPwYDKcyL+B
	6dISHcattyRSGMoZdAoK/sCdA+zEtPu9p6QCoSh78hs+EqGvJOSrBelOZ3IWkFqF
	oCx7ZyPucvvRlLZlml4jk0wWGjx457XYo16/vQk86Lyn3+ymC3mugGkDPf3aPM5W
	ZSDXfYFhLgkgIWBAiBwQ0SuVWBXOT0tuLwcpw/GWzDOizG1+PiwGMAy8lXg8/XTZ
	ljJKrpM73PGn+eTUM2SNmj5xlhjKQ+ivmFIuy0nc2D6yQBlfxjGrZ3CDemdMh9B4
	45bZNA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e1jx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:35:46 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95f4d5efbe9so4942694241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686546; x=1779291346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2hoaXqlrNgqLFRzekm3d2iZ6wdlHEJPfnH8qVCkVtg=;
        b=HQoBRvuVS1jj3/9k7bH2rAwze0Djptv3tBf07PMOg9H33sLBkj6lMK2o48eistBBJU
         ks+frgU3SE2iz4L9RrQsfhzJgLvM+6i2qPE1d8ApU8TFmIqBeOmfwcc2bT5raySrvWuC
         1o99lRlZBR16txKNGvyjLeCqEpsReGa8fV0hCowz5mp19HGTrq+kz5HjDcXjRLF+HetY
         MZY6Fvrd+bm7jyc+6HGWge1IzNK2scFww2/hylyaucbRYCgaQfNmBqFNYyBnUE893o8C
         UPF9Jlzc9pRL54GYjbiOR8P8tPstXlDY3SLuAvHTQ2AQydJ0u1eZL68N25yv6Q+RtURH
         vvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686546; x=1779291346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o2hoaXqlrNgqLFRzekm3d2iZ6wdlHEJPfnH8qVCkVtg=;
        b=Drv+jafHqCJzfGY0vGB+s0pAwQBQdBulXeWfgwN1WLT8uUKNf74l+lXjENtrgwEHpW
         TlKYwheIPV3nM8YzvJZ+l0ADrhbDr2aPggPh8WnL8eNn4asjg75Y/NBfmOjigGST9zl2
         7/terk14KurkSyx7lY65RA5Obw8yGYiA06atrWDra4JHa77nNYlgdIt6dHLth7fnZav7
         OXk8ximdZTV+h2+H/Ul1PsvzFxwf6p6DaXSlwRdAYooiT7f57uHQXFGDih5Ydq6+XozY
         ITm4CrYjLhsOvYwZ03MNQOoQV45psPpctyCi9NAaQFVvg9E0UnVtFJKI3OlDCPvli9B5
         WFEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8q/KWXUapIphq6l20gvnJpIPJ9oQ58LaHM4EzwiPSGC3qCcIFG35AD1GPl/AG5dWSCeszHURYDpRDMM4xf@vger.kernel.org
X-Gm-Message-State: AOJu0YwPck3PFt91HExreQ1yQsR5dcKzPsVnzFWPG6qxJ97d7WeKDXHY
	9dWNAMg6BAFjLyLdAVQGJZ7vrD8YiG4QyhajOAd0OVZ3CJoadeZnqHWiT7qWOfFkXil+twL981y
	+0E9cpLPoA1aFC2ch+S2v9r3tfQKYrLMa5/GgiMoN+OXHEOsyP8EFcJhxc3P1byQ4nX+ztGC32t
	gN
X-Gm-Gg: Acq92OH+VjU9d7TmkdNA4tKpU7gH0ZKsFlhYAE6XuOFbu9CxdiHcfATg+FstdS63aOg
	n8tmNtTMrN6xAhJM8qGjYvPqkflImbpz3hrEPXA5QTF3m3Td2vlIyiGk4+vaGWWH5ZfIEetY7oW
	ENg2H5evldZ61E6XE8sU8qaa85lofxytv46gTVl6vidBq1GMnWL7rcV4xSEQhbgATj65nIm5k67
	U+8btNYvVL0snHR8yUNybGYGh7joxaRUSniw7CSZsV4pQewDwvo+YcDlb4j6Vf/lHdyurNXFrOd
	nQc3RitIjaaTd6JqzmXhb68ULeSAepZzYPf0nzNiyRFfecCYkWxfItBK0xwwUVsHZE6MeQiOjxG
	epyRpNZ4CJfLYJ+4ZhbQrmf1zOSyLarXxMqExIpK4HaFUsM643w==
X-Received: by 2002:a05:6102:5091:b0:62f:46be:8318 with SMTP id ada2fe7eead31-637733e7ec3mr2235645137.6.1778686545683;
        Wed, 13 May 2026 08:35:45 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:62f:46be:8318 with SMTP id ada2fe7eead31-637733e7ec3mr2235568137.6.1778686545109;
        Wed, 13 May 2026 08:35:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f446ec6sm43165835e9.32.2026.05.13.08.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:35:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:35:29 +0200
Subject: [PATCH 1/2] dt-bindings: clock: qcom: add missing definition for
 the USB2 PHY reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-nord-clk-usb2-phy-v1-1-8eafcb2d5129@oss.qualcomm.com>
References: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
In-Reply-To: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=921;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rISBv32VZRJHCe3I/c+s75nTu40II2+RrJDUcL5VN/E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJpHyq62Fd0D422+798qtyGB3Qh1sliG24iW0
 MfNBA28jLGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSaRwAKCRAFnS7L/zaE
 wzgjEACo+oJDN7R2y7DDlPZmNZDA7W5u9oOrcgYRMACpxRKh2fg6jcA+QVUKl9uGTBexKJBFH/Q
 zUEZoiBhetVUoiJEzW08YKrKE6nzPyjGlDsyGUiof+Js1pihMIWw6JVjNVA63be/cGY8alyzfh+
 V2lheK8sAzKOfXOZ2bTzH0XSpCDbAdPyj778eyZVLjmOUomvtfpK0JW0qNd6jGM8zuVVJFPiQow
 XhAlCVGJyBCsOtUxPmX79hCuDamzR4xgE8Smmohsc/jqUhXPyJawNqwB0az05eriNzSLZWy+A9/
 oCExbYcLYkwSPcOhleQ7jrZlFY/eYz0D+9QmLLXhiixSogn+l4cBTXeJt4NSxnsKN02Pa7Kl8hB
 VuELTCNL0sx3Gy0d4yD/lmqS+zr8a6cBp0TIaOccAVacVhJ3qt4+//J46lFNrWkoplZAYcqWM3W
 422/lBKeXkzny6WRBnMp3W1kwXdFqqaImBJgSp5rbz8KTrx0gLhQRbQYPf6PWHc18zvoUsM6fwY
 IZeaq4/DLOVw0kQMMASrJqEU5S3j/hzxf80fzCywcfPXVRa0ejjeszsob3KYr0cQZYc0+7ZFhGm
 xvD492PNWyeW8xoPKEidgPIhbklCkXXPrCvKG4LOOzfQTSIUL/ZSr9Uf+l7Xy8n7K8MqAbgxzzK
 HPtde6xutVbaxmA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: io_P3UBzXAtX76ILf11yFzzLqW0qbUjb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OSBTYWx0ZWRfXxlOYzaYq3oIW
 VJ7vxaihqNtEJmbQX35MYxBLMXrNFRKrIqQPn8dPEqEO6l5Zxus+0MaJm5xQNofCM/euOuNm7ej
 jPzL7Sp14ILgkYMf2SMLtikKZSPWQK70wryD+MovtTOG7IL2CXlezvmEneTAY740ZkRpFdtolS3
 5GEtu2uLVSSjCDiZjQisH+OXkaht1PJQPP9XfVgOQwMmIm/o5rSctBoSmoMJWYKC1HuFMlEHlDh
 la+crGGK4kuaOQipl4bqqD+6UjuoSMMkInVoMiilWSXX96Iuy1MjPp2cYvMblHZiXs1c5HQebWm
 qOSv2qYHS72hchBJdVFH9uOZ359yYuUiHaQJ6Xpp1H7kXGCk/dPb8eIPWb/e+kOnXH+79x2oMZ/
 N457cB6gWLADocwYZ18UJsG5poWiVBVHYZryzj5mKwKjdrTpKNF6IzThkijZg5hyMz9jhq85YBZ
 k0/YYteRMcs329Un1wg==
X-Proofpoint-GUID: io_P3UBzXAtX76ILf11yFzzLqW0qbUjb
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a049a52 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=XZKVq7CPqAJHpqD8ud4A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130159
X-Rspamd-Queue-Id: 38C87536996
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107386-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The USB2 PHY reset definition is missing from the negcc clock driver and
its bindings. Provide it in order to enable adding the USB nodes in DTS.

Fixes: 06498d59bb4e ("dt-bindings: clock: qcom: Add Nord Global Clock Controller")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,nord-negcc.h b/include/dt-bindings/clock/qcom,nord-negcc.h
index 95f333d8e1aa7cf1e386b6926380b2c853f7cf43..c2d048d9fc9e98d04658de665a1928297bde035a 100644
--- a/include/dt-bindings/clock/qcom,nord-negcc.h
+++ b/include/dt-bindings/clock/qcom,nord-negcc.h
@@ -120,5 +120,6 @@
 #define NE_GCC_USB3_PHY_SEC_BCR					10
 #define NE_GCC_USB3PHY_PHY_PRIM_BCR				11
 #define NE_GCC_USB3PHY_PHY_SEC_BCR				12
+#define NE_GCC_QUSB3PHY_PRIM_BCR				13
 
 #endif

-- 
2.47.3


