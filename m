Return-Path: <linux-arm-msm+bounces-101764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPXuFcbg0GklBgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:58:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A610F39AADE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14DA030AB63B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 09:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BA73AF67C;
	Sat,  4 Apr 2026 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wn5xJqFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DH4vWt5U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169E33AA4F7
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296281; cv=none; b=BSN33DY4sLsfZW+lNpVf8tTi/XGv/Gv6//Zaau4/sxHVjXK30ixSUp6ZSCSvEs8bOV4XFV7Oz76VmCulhy5K2MIgd4Hp/kB39RG9FepBZHjjKAVAJz63WTPuNyHHoAtXbcXBUOrCgG6RZJqWQoglqAJz5fWHUe0Q2PS2ykObii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296281; c=relaxed/simple;
	bh=c7eWSUnG59J1YIxNERkK7hxru7fbZOaNWSWZCMVrV8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oxSYvYlEZKhMYUYQVJo1NWP32PrtJdJI/eJA7WovjTzDiI8bkHudVOKgSVQr8rFQuw0vhd+h3jGR+1kapCqn4ozdrQv+VHCzjD6LugGsATF77cJ4KuM8NY7b/IAB+T2xYOgjiMKtAEwzO8K1qe57SXwQFtx5VJ/Q3o7OdFxd8hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wn5xJqFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DH4vWt5U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342Xiio3989217
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 09:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BI/VbMEggbDWeLIzA0zsoh/0VKEql+AeY0gue2BvnOA=; b=Wn5xJqFZMYPkyFPC
	3/utqxWVH8q9uY2+GorSZmi+ynGp0/vkwyEvhoMIMZLBvp6Z8XGW1ToSamOAnHgM
	Dby0lJI4gfqucd0g+noILhZTmUETw3qS1cafFwlqB29OOJWe2s7QmUgUA2oMaIhk
	BxVPO5a+q0UBnI38PsoA9ef3mOfHmbly5GDyIdivttE/l8WdVmdS7YRa1my0/mb0
	ZxyzV3iSCTAqy2icl3erx0ed8rhcII/Tg+ambQxeJnbIkiEAD0j48Z4YsNq6gLJM
	aqm4V24QUf6eGN6ox2xMoRSULmDxozaBo344Rwo9jhvH3C5/bakY8JYr2Wl94n5L
	1LsYFQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfgnnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 09:51:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090e08dcfcso74971751cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 02:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775296278; x=1775901078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BI/VbMEggbDWeLIzA0zsoh/0VKEql+AeY0gue2BvnOA=;
        b=DH4vWt5URUaEdzzoYPWGKnEFh9YdrxP+cYYsIn9iY7lBCbQCDccgfL74Bpmw0ACLth
         ybG5FzfomLovHREN8E8Qlba+q9jfEo7lNL1rySVrfTVJZIFeq3sYORBVf3owNEOoUmBF
         go2I2wpLzXyNtDKEyQDnLGB2fBmx3SBnwHPp1ZblPfGQpiakLqK6U+XyDI9eD5JMGEdy
         f+NTEF3K4VNUvb+fgQ2v5u6WxMBT4GOedQNpxP2KFTyV/0u3dtgW+oYj+eSs6t9mx8n5
         +C1WgC3V/rIUmkFohGVRbD60iDI6nxY8KB+wjNNg5N+pYaH4qqIAWDfH0RAiiuE7g6d3
         j78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775296278; x=1775901078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BI/VbMEggbDWeLIzA0zsoh/0VKEql+AeY0gue2BvnOA=;
        b=JgwhW4gfoWmikRP1zh/Qd4r0xky3P3dCPtnVBYI8B2EyhidnIR89chnkdECNBUbAkO
         8AukysGRoHYk8xdok7480upaqa0sB1Hp0lzK+Tn74S5xxpRZBVRcx2cjih/LmXrSrPhA
         eo1jL4PveyAv+h+5p8y+UdeowB84f46rVzt5sblFVIB4GIJF3d3CT+nEPzOeSwYDyyUW
         U+TyScBpz/DF41NFzAcsmwhlvgNGiG5Ud4d0XsLymjMUgSkrFHStsp3HQmHdiSG1UXHe
         BMh1m3a7ysVVGt6U6MrlnF9e1vbiqPMCt7G3LPpCXEuYMeE+v1qNU8cQSsBmR6B853gZ
         huYw==
X-Forwarded-Encrypted: i=1; AJvYcCXK7T9IoVJUAfW8f9YVH01qGF62EiqH5Ux/stusSFhHzIau5uXHo2w6Zcb/ghCDGHCJJ5Nkn48L9QMaPqxH@vger.kernel.org
X-Gm-Message-State: AOJu0YzFoDGQmdHPNS9pMKQ5tuy8El2mkCSvDE+E5ZwnrvIQvp42zkS5
	sLF++ZNN07Pu7WiPh2DzVdG+6BR901npfeVf+g2zNilq38TqksNNQF/22lOiDna9kDBjKQ9/7XW
	0eQbLsPtnFh+G1P9MjucrVLMI9jv38vw7Se+vH7Qi8S6hCf3Z11Hn++cjO61jOaogGVYE
X-Gm-Gg: AeBDiesO2GSl9t6JRrkuJuw82Xkqm8e1S2kOCgLSj8lB61D3BZ9MpBVwkPbbgEsuHJQ
	sURMRtCmrnswBfC7doESW5e6QNmLxD5Cb+QudK6tqOMATMt7R9M6/eXU/gg7LYbwqsrs4xlRTfX
	tCAJfBvDnO0YjRKTDlprKJKzxmEgjChjLgSBGyCCJ2ceL7XXkOkAWQPf91xJ7gnqVU0NKO8demc
	yZNv11ut3mvuzoGGYLbg2rHfkyfB5vcURsGd0EJl7Li/HzwmGxrMMjaBBpsumqoEYDEDWD8G0xz
	vaM57KNA4E7NZm9ybdrE0pnQAU8GWm95z5La8/W24580+DzWo7XM0/aw1HMvPzg2zbmwSW4Wa6S
	9OFSJHMfxdkgvI2t04875yEgRCtKh0D1nXrWQ0bibFwPK
X-Received: by 2002:ac8:7f07:0:b0:509:5dd4:7192 with SMTP id d75a77b69052e-50d62d25a5bmr92964441cf.54.1775296278518;
        Sat, 04 Apr 2026 02:51:18 -0700 (PDT)
X-Received: by 2002:ac8:7f07:0:b0:509:5dd4:7192 with SMTP id d75a77b69052e-50d62d25a5bmr92964121cf.54.1775296278078;
        Sat, 04 Apr 2026 02:51:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm24098466f8f.15.2026.04.04.02.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 02:51:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 04 Apr 2026 11:51:02 +0200
Subject: [PATCH 3/5] arm64: dts: qcom: glymur: Fix USB simple_bus_reg
 warnings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-dts-qcom-w-1-fixes-v1-3-b8a9e6806e0a@oss.qualcomm.com>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=c7eWSUnG59J1YIxNERkK7hxru7fbZOaNWSWZCMVrV8E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0N8KgD6gXcQFtkgIAXLyCW8cteVmMv5EMe4CS
 CyuLUf1e52JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadDfCgAKCRDBN2bmhouD
 12nyD/0TsNEGv0B0VtU7Fw9UDPV6I+M9cbOqgY4b3nha6tJgoZlenFo4U0nqCSwEjx0eth4mJz4
 mtdGWCmabPlxbM8n6+/kW3Z//KnCqbJK33LdQQgYsOLBe/cuPG51vmYpQU83xmbENe2WD4lyy+E
 3J9d00l55i6CcZEVCRElJdRWulRbCXrBZ6xOChAB0Op9mstiAIrhhzzzNmJFPxRb+FQ8cmJjKNI
 tm41/mxnJutji0T7t6ujF3Y7KpAFMyGVDg9gLNluJSn1hRi3ZuV/arilZONASc3nYqdaTGHRud8
 AKQc1/ewnqJeC8o+ZbN9hrMYAVIUJFzxs7bHkhH7MG6bTf0NYxB51sXZtYzCZK07uKOMedAYOXA
 WHOoU2R5ct4nfJo2ASjMEbahCnQ48SBnhxJROTOINkbbjx3hNPtyG8hbtPWwyU9svh6bY52m3J1
 2Rt1I/OVBdagqlDn55VBL93Jnp6uLn+lVqiKZwQ8IJAzVeCRROqKtmGOZl5ELw93eluXt5mhHsh
 enWBSt/EiF57d0XmqGlG6+N6vgYIg20mx1a043UqkgthskDzZNdB824AZOjq7kQOijW1BBoTBd4
 f4OqjU/C/JglJYUFtRPonoXyUlGcbtc+fbBnznoUkyNNCt7OhlFkLFHlCajZzQQ0RDvK/2q1fAl
 zp86ZTF/c9y0mvg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA4OCBTYWx0ZWRfX2vB8tcOZ5drx
 9q5LE6Fc3ccUUS1XkDYdzL+9bxyQSKEI4YoE/wuezlnOWedEbyDrtjpsesw5xd/xRetfAkrI0Qw
 c5q0b9Kbn8AYmgqo+fJBgxzcMy3p+dAhnis0AFgxbkHIjBMr8KU7zYQPMxAK0UTFEH3zAcD3euj
 IIROTdbI1DnxxfJ+aOHC2EsLIssZ5C2h5xfnxzqean5jFvxMWwYrgbAEvelrJ6UJbDNZN+v3e0j
 LCR+5f9/8ZhNrOEDwv1s/U2mzEKqt+CL0WVWCvXRF7OUAgH4SC5fAX3WZri1ZxVxZg2T5iFHqDX
 0ehefCpiag0GknvUArFy37tkXfFBZwORat5y6RXYenMFY9orh5nFQVaEhULHxZe+lJQ4EOWqAxc
 ZJZTYfh/zOCOMqMmG5jdkpm6nnaQlR8s5e1yufWZByaw3NjQioW0mIowVwFyAqfmbjeIvOo7f8X
 2Ni2N3mrr6VQEfS/gDw==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d0df17 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mXL7kWYZv1q9rXQNpRkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ebRunBeCqrbJKCVrovnLpurs6QqMqDXn
X-Proofpoint-GUID: ebRunBeCqrbJKCVrovnLpurs6QqMqDXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-101764-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1ef8800:email,8a00000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A610F39AADE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct the unit address of USB nodes in Qualcomm IPQ5424 SoC DTSI to
fix W=1 DTC warnings:

  ipq5424.dtsi:642.22-693.5: Warning (simple_bus_reg): /soc@0/usb2@1e00000: simple-bus unit address format error, expected "1ef8800"
  ipq5424.dtsi:733.22-786.5: Warning (simple_bus_reg): /soc@0/usb3@8a00000: simple-bus unit address format error, expected "8af8800"

Fixes: 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index f20cda429094..876bf6a8b8ff 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -639,7 +639,7 @@ qusb_phy_1: phy@71000 {
 			status = "disabled";
 		};
 
-		usb2: usb2@1e00000 {
+		usb2: usb2@1ef8800 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x01ef8800 0 0x400>;
 			#address-cells = <2>;
@@ -730,7 +730,7 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
-		usb3: usb3@8a00000 {
+		usb3: usb3@8af8800 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;
 

-- 
2.51.0


