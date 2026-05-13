Return-Path: <linux-arm-msm+bounces-107278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH4UDrdvBGprIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:33:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C753312F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46E43301AB87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C63410D2F;
	Wed, 13 May 2026 12:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bc0SuXc4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTbUlpoD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBCE3932DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675633; cv=none; b=fNR2k2b9VmN9X4/MTvTN3YkUC25qeSvCxsu48PwhPBEK7DiPUMGDi/Br3YMx+A5ARlByZjSy0uuNJq193rQqkz6GtK4eDuk3iQaX3eZx17C1IXC81r++b73MeFYq+ZXajoGPZEklcZBSrFrRk/uQzV7/YWLSPtCauC4JCdT+PGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675633; c=relaxed/simple;
	bh=32027uTlBG1SrSNflpFWBjDcaSA/std/UWgwrJEZnoY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n9cUJMJfxWKrdKceDesFc5EnG/0VdfyNkrEmN62a3ba+s64IsXF446YYRcRjKw+kFRdavk0IMrHxMb0LmTa+N0wfzt269aZ+k28d5N41qm/LMfy9Z76N5XGNyibfOX9OdESOo6WzW3UGl8wTQoZq9f9oBqXKVCQcDsWEuZYYELM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bc0SuXc4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTbUlpoD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rMfS4082628
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lNspXsrrChhgMLiJiT1wuU
	VBr/4vZ5aUNh0bg9oCdoU=; b=bc0SuXc4wPF83nQoFmuAXG4Q9xRaO65IV62HZ5
	Ig+YIzK9vmCRG3QFxt5R+8+ynH/wwuHcBwPCpxma05kAeaypUu24TyKDtphibA+S
	BuPB12L1SL3t6jH/NQ2QZ3xO+06InEFc59YMp3OFQzweaK8YCh4mL4Hj64c58iDf
	ltb/Nwi/TEA/bhbFO7EwlLeMh/vsD0LCDkTZAdRP+e2FJC9Pfy5RD1030Aq7xCoe
	znXA/uUWLeL1EhdY6tz53lq8KEmEJoBooTt4zYjbqZUrhMWb6QTTxsumZiPIoWdh
	4g0J74ejVJzrpXiQ1vAuRgyb09IkpSIKznXSpLPWYXk7z2PQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e0s3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:33:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50da529ff48so159861051cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675631; x=1779280431; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lNspXsrrChhgMLiJiT1wuUVBr/4vZ5aUNh0bg9oCdoU=;
        b=bTbUlpoDnULUGUO/yxcIM4QTIqYXKWvo/p3rNBtKgYhsk6Iw8pzTdOmmY3jyW3gEZY
         dw9+ErugBST/7aa7f5+IFPtF5pyHxgqi+hhxjMIoUXh6Hccm3VE6Ixfqn2v9lMS1oB6l
         VxsNfQqI0pTB61mP7sBn8Ba1Du8bKq2vB0sxpWwwmB1f81PnxMBnX3F3YtNPw4RL3KOG
         leIxu7cspMxRsbGTaNZUpuxKM48KmBq1jBPBkfyntxI8ij6YEoGJFpXNh3GnHornX03Y
         AcdgWRmzSVcwSNiftWpmYvmFtSFtRrckwmL/vdWGncerMMT47eoL0ZlLXO7vMMBSbBSy
         OceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675631; x=1779280431;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNspXsrrChhgMLiJiT1wuUVBr/4vZ5aUNh0bg9oCdoU=;
        b=nexaYYqc9S3SHqW4lSeM268o2UYLQeFOLBArHbd+my/r/+0E5tDBYQ8W25hklSmSS5
         hc0XtnICJoVQILQ0JSUxt356dHbTwSbL8x1HtCH+CW8YumUXIKA0XSoP4NiQFMQkZjPO
         4uyc0OEFSlI8qjvMKH5u/1SWOeo/540GsjHmaRSyxD7MbsU5zGoYob399skAASL3iHFY
         dqTANgetbzIy9W2Mn+h8OPJE5uY3VUKuekCXjkbSr0td5/44b8HjUzpUosv1dGsxsTja
         gul0iQLGYM9mxXWXhlYz38oReCbdnT10BdffLfvlWYlUDOaom2scuCcekf/VWVp/iezR
         BgcA==
X-Forwarded-Encrypted: i=1; AFNElJ/FiK00nX6H2CpSaADYB7LXG8My+XBrifNaxypgeJSZwpIR38Zp94fui++HEQsUzkryYk7xPgTnHa31rNJE@vger.kernel.org
X-Gm-Message-State: AOJu0YzkiKl6SQ7X/oyqeRs6bab7nY+nnm1m+FnfprlAXeLgpJCsHtid
	dDxGlSmdOxGvMrwzLzofIiEFScnMu1eJh9iYAgRxNou/ow8cE7XCM8Bf6I2NsFqtXw6udGgwdJp
	c7RYdnROQEwgGnh8jAYIkqjwL5M+u+qjruYCVfY+/OnHZViX1M0cwe3ZGZ12cwBPSBu45
X-Gm-Gg: Acq92OFOcKMCFRk5pthKQ/i/G9zqOwh1Gsq4wA5fYTffOcOxuQZ1EtYZE1B18oztN80
	DTCvOJWOowXMT25Z4Ave/01TLfhiR7pEFBksKDn/L/tO27NgrxfFSB1BlO1HUWVpdA2SWpc7OL+
	MEWRGR6F/XdEU+fY+w4+3tZ7oTE2eMrSKg6hRhkrs+elgWS6u0G1bR4dO9fR5Ektn+VVXuEBTaF
	7sHB1Ka3StSimb+LJWmAL67Y1c2+78VuKqZhFaX9SLHQu2ju3a3rMaIBNGIHn681Nc+bXmEsmnw
	SixXv6lPmmwQ2oKfBeLG52XRsmY7I+iEsgRLBZWCOQcRTF+GUSZN/ckkQ36CY+kiqvWoN5entTw
	ihUm1/m9MIciFcxXM9iZ5In8lXqMrbA==
X-Received: by 2002:a05:622a:8cc:b0:512:e827:d844 with SMTP id d75a77b69052e-5162f685f34mr44557651cf.58.1778675630809;
        Wed, 13 May 2026 05:33:50 -0700 (PDT)
X-Received: by 2002:a05:622a:8cc:b0:512:e827:d844 with SMTP id d75a77b69052e-5162f685f34mr44557181cf.58.1778675630197;
        Wed, 13 May 2026 05:33:50 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f410d9fsm58873115e9.6.2026.05.13.05.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:33:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: eliza: Fix debug UART and add more
 support
Date: Wed, 13 May 2026 15:33:40 +0300
Message-Id: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-0-05814d24f4cf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKVvBGoC/22QzW6DMBCEXwX53JX8AxTxKlUO9nqhrhJDvAYlj
 fLudYFKPeQ4q52db/YhmFIgFn31EInWwGGKRai3SuCnjSNB8EULLXUrG2WAzuHbgs8MQ7iBJ7e
 MsNiUwUYPlykR8DLPUxkM1tFgvK7Royj35kTFsmV9nHbNi/sizL8Bx0ai61Ig8r4mnGUCnC6Xk
 Psq0i3DDiI78Z+wr7axMfLgs55nWNhBR4N2yskBlenX+qVLv299riXnr17g+Wzv0NaeDA7Y2Ub
 2q3nlbpQ+TCFmSjjFWBoVgPKNwBziCOwRFfDZrgRx8gRtI7W0xmlC7FclTs/nD3VXWrSJAQAA
X-Change-ID: 20260513-eliza-dts-fix-debug-uart-and-more-support-fabef3d24cdc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2574;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=32027uTlBG1SrSNflpFWBjDcaSA/std/UWgwrJEZnoY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBG+oQL397mCrr9YXtzqhp671ThREsuRgX0JWQ
 t0dkHNbq++JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagRvqAAKCRAbX0TJAJUV
 Vi/8D/90csGb7ZqK/e4dWHnZsDfz7iEqNJxcEk3X5JqXoMY0oBhoQSeb6lV8huWID5owfv1jlzi
 DHUoEa8zj0QeQQbOHqLUycMcoIRBW19SpIXJwLPnKX9CHE7jclxoJDo63sHLLEZCdoX1KAhcPiW
 GIOSlj5ArC1Czo1s+caTuysLdg9DSfUPeXm4JZEE8G0SGijmhJ1eShGWFiEXeJk1MSdO6N4jjxM
 OJbHxaoTeL5G7+8Wrrm6v40wlfWuSHqJWTE8np4B2MlM+I0RYXzNeJ4xUGW3QJZLbgQGAw7lnw5
 vJyNatKPcSzDD5bGNebCFFgjDVViMrrSbgk50mimewcZMdSuuDYauSuK4Y6ryfpjhTt1snO+gRy
 9V6ta0Q9C1XDBrLd31EIfA5GRlPrBi1xdKRAzqfn2O329GZxfvkQcPsYueCVWlD7dIUfom8W+zQ
 or5pLWCZiprrnKYocpMZ7pVVJTY2HNl/90ybHpyp+i3UqEPKPS24tX4TuuUJhCE9e1VAUFberaX
 OXcnh6W4NKldJve+KUUHCX89gLY+cC2OZgWy3lMXT7IwyBIME1INRCspOfLF5C/E8Huh3rqBPiv
 HZtuU20CbUVyrRTTQfo+cmbFf1XTM4EULKlcSdrg+g6M65nk0qp/jXQDLrTraCWXl7T/vP2g3Y+
 b4VlZiappuj/wxg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: G2fM2X-YS1q7cLE3jcO4yW_sby9-X2-o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfX4Zj9R7JsRw50
 WWBWsyVuzusFlO8aIbfrgVIPghWctHEXaIXhhrrDPfO7o150v5zQDKHWLZDctg45p+fn4XDgXpT
 s4m6C7xgCvssMKsVJs71Si7cNQhRFYEd1VKh9aCDbSVyiI7k4wgkAb4jEeUAlSWL3eFsLmiQikx
 RbHTsaxrkiWX6Y/H/pcZjvCOW2BoFLI6Vq+fSAJ8Inrzp/c6Fm71mHch0mQk+9qEkV7C8Xwd2So
 l3r9U4n/4y9fujH1xNRYcNnip3SWJXouiSIS+wAT+4JYJkx1oAR2K+077WD4NLWiu/mq38N3opn
 SZhaGAVknZeL/8QBoEVAtr8gPbbDa8yGaVjjwSFJlHlobcKo6pnoUyB7JTlauoaEzGmP0ZK1I+8
 uXKkgwf2wD2asxTqbALhJD0fjET82PpYTquU4J5BokpQOETh60PseiDAIeKsmQVG69QOYe/VJU2
 LNoUNsoZF+xnlml+IDA==
X-Proofpoint-GUID: G2fM2X-YS1q7cLE3jcO4yW_sby9-X2-o
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a046faf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=b_JExzISf91byRTFrCMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131
X-Rspamd-Queue-Id: BA3C753312F
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
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107278-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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

Fix the Eliza MTP debug UART index and then add the missing
QUPv3 WRAP1/WRAP2 serial engines, the matching GPI DMA controllers,
SDHCI controllers, their pinconf state and the LLCC system cache
controller.

This series depends on the following Eliza binding updates:
https://lore.kernel.org/all/20260513-eliza-llcc-v2-1-27381ae833d5@oss.qualcomm.com/
https://lore.kernel.org/all/20260513-eliza-gpi-dma-v1-1-d8e37f026c36@oss.qualcomm.com/
https://lore.kernel.org/all/20260513-eliza-bindings-sdhci-v1-1-b2cae44163c1@oss.qualcomm.com/
https://lore.kernel.org/all/20260318-eliza-bindings-qmp-phy-v1-1-96a0d529ad2d@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com/
https://lore.kernel.org/all/20260513-eliza-tlmm-group-qup1-se4-lanes-v1-1-1babc6118829@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-aoss-v2-1-c3628ca79a25@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-pmic-glink-v2-1-d6b5397b7899@oss.qualcomm.com/

It also depends on the following patchset in order to build successfully:
https://lore.kernel.org/all/20260513-eliza-tlmm-group-qup1-se4-lanes-v1-2-1babc6118829@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      arm64: dts: qcom: eliza-mtp: Fix the debug UART index
      arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI and LLCC nodes

 arch/arm64/boot/dts/qcom/eliza-mtp.dts |    4 +-
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 1540 +++++++++++++++++++++++++++++++-
 2 files changed, 1539 insertions(+), 5 deletions(-)
---
base-commit: b462608de92a7cac450781f9d8d4c7cf3ccf82db
change-id: 20260513-eliza-dts-fix-debug-uart-and-more-support-fabef3d24cdc
prerequisite-change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13:v4
prerequisite-patch-id: a5535fbaa3699a133dfd13cfa9a2a74b18b46dd0
prerequisite-patch-id: 04af1479b04d515ced835504144cf09381471b85
prerequisite-patch-id: 480c23fcf537d5ae69214f0aabfcef11418d37fb
prerequisite-change-id: 20260327-dts-qcom-eliza-display-64de3cfc8a50:v3
prerequisite-patch-id: 827ce662558e6c9669425d70c563a44f0f89675a
prerequisite-patch-id: 9c102d9b419548ec7805fe87bfa0ec52272166a7
prerequisite-patch-id: 9190eb29bb9822ac57b9f3a2d6ca20200f8fc9ee
prerequisite-change-id: 20260512-eliza-interconnect-add-missing-sdcc1-slave-node-65020a3b2ecc:v1
prerequisite-patch-id: 2ba90a6d131ef9f0065aa7d4e855cc93d1e97fce
prerequisite-patch-id: 7dd9c4f27c461e52a096ceca08427a724c8faa6d

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


