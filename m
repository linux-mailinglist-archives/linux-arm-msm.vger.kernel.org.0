Return-Path: <linux-arm-msm+bounces-117612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eZfENlRBTmogJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:23:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9BF72646A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:23:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ey/Uu70q";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LlQCdeFy;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117612-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117612-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B75D230131D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 12:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC60F43DA2D;
	Wed,  8 Jul 2026 12:17:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B02842087C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 12:17:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513069; cv=none; b=JAAex0ye3n0ZdrlB6+rESkFxrDWedIsP9YtUpXkrAbuOot3updQlmfTFo2lDYOKvFuDwKOwUOMLiT+CLmyEIzEEjd1j2DfUKmHeeDrYlT5UhFZzXwHLrQt+pRnZBLTMYFzIc4iyYdvqt6sz1YS0WgCsWv77+Aynkha/P6wjMYSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513069; c=relaxed/simple;
	bh=2OTR4Uda6T9rFzecFPmo1D1H7dwe+VKFBl6L59G2A0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aLQxcltrF0GMYnMtW8EIn2nD9TLkeFLIRtPoEe9PKq60tcf3CZEhQvpI8HUAEaHZuj1ub72G/1pSOLLfVOFozI+sKz1Ax748cN3bhjtXMwbhn4/VOwnQLl9y7v7VK+CjXT/ptwIidpnHVZSbHXOitd+VSspeFtYEhCir0i9VA50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ey/Uu70q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LlQCdeFy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3lNM2580420
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 12:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q/Ar/kPupFf4wpR5UurFF2
	yKHdeIymF31jARad6asx8=; b=ey/Uu70qUeUksEJbhJ9mMCJc8BCsq7p2CZmqJu
	ospjy/nUGKuMya5eq+eMEVg+B/GuXO0f4Y/us8iJaMUV9KbbfBEUVOAalcHK9bC6
	o6zsv/1qNi4eteAwcaSbMswzqhV5WsXeuSkvnCg85wQFgGPbB+cIIv2W8NAJTXPz
	X9GDfc/mBgRR21kocufjfOxGToAG8ldn1NrdCaDg8ckEtr4Du5oSO+l1jzcKEWyJ
	HUud3iyv8upxDplm7/xYSl+KjZE4h6+rk6YVg1L/tS5nwep5X5h+AHz1D1dJVjdm
	YsoKz5wT4dS4OCCQgj+NzXBU6IgGU52IbkGzsN/+kYbCxzDA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gan6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 12:17:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484b57b98bso466984b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783513066; x=1784117866; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q/Ar/kPupFf4wpR5UurFF2yKHdeIymF31jARad6asx8=;
        b=LlQCdeFyqsBLRzbzpQkfTN1Wkc6MB5pA35v8NXYUNvk4dIC5Stg1YIgjt28c8ifsDU
         6G3FEKva71zxLUa9Pdw5wLUoa3JcUskwX6u5PqUpNaBSwSVdN9N+n2ZsDtbztBi0pQ5q
         jHauhAmcfElUowRZipPVlCrqUkwsj0HDngjZf28+ezHD5D27ZBGnogB5dv5W6uygTQV9
         LGY+W6FBdag/sy0R2ltfN3mchLQqVzYRaoq7WGuHq1T0RkkD4Zc7rzRPCVoJzzpKE8Nt
         97n4GzcfMvt7xxRwh8FLMvz5WHez0A+BIcI975KVheff1YJPmgGCFMbrbLpMcKSJUuQc
         biVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513066; x=1784117866;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q/Ar/kPupFf4wpR5UurFF2yKHdeIymF31jARad6asx8=;
        b=YzF5XyGxZqm4Aaep0tj3o3smCIxQtlYQp0+GC/DmXpfSj824UAhVaF3Rk4dr6/U50F
         Ugjt6T04mpa2vHHh+2JeFfRxePJR8Qxmp8zt1RYAboKsawhPRXpbjNtWsr/pLk2HDGGv
         nK9ewnpOAFZ2TiemwLNbwVtoKA36BQpwrC/gRM1yF7bcPXTjbgbxEnv83UWl+gKJvmAt
         715k+74wqqy7U6G+arO9wYrmwmJZEcplDbF/nViZjsjBK2DDXRsr8DGzpPIocBhB0eVw
         W4ML9OvAXGIRdBVfWxj3zQd7qJzQnrAlSyUyJ/K+rK0wqKksUYmrlKmEob3fFq0bbM0F
         qz4g==
X-Gm-Message-State: AOJu0YwcDAOSPx+HhjAiXBX5+3f1U50vvJjcv8DecFJcipyrIO6zl2zf
	mu/6nAi2K88LDRkw7cK7LMLTBitGvy9Q7vFIr1XTD/FvtAUihFVcOe0qt6znLnWfrwW58XoI0hG
	UZOiQD+Xm+bX2Jw6uRn6BsyAkLQCXOS4U7YHz45tYaZ1cTi0O68MbalOamo14lAJIcDe3
X-Gm-Gg: AfdE7cnn2FoyeRhmCzWs9tbvJ1K9HuXTjgBlIX8FPNibKsXFhh/a7Z+3ZIE+VSlSbs8
	MNPeJB0MeePoadAaZ4CN/jWH3FJMWH+TKNndZcS4sTDFp3j2AaVO2wgxye6wWrf8j9/p+KMPUuu
	ImgRUqs/ZMS0jU5APoH/3D7FALlRF7Cx/NdsYxiLczckvhcNwW8r58EDUo0Uh4SlXJ/kxSkoglW
	4R+oWlAbp0QV5/sRw6r3tMJ50gyuVwhfJ8KS7hG0hqJyPko7GpXCqMgIPLrzMHi09TpLPyUfXt8
	sk3/IrvrlFxzB3GLFP9sus3zK6vNoqNAwsIJl18S76OHXcF4/Dk/val+87WgaLhuqQGBHivTe2j
	sAIdjheC4NUH6Z7MjB3zOTxcUoQ==
X-Received: by 2002:a05:6a00:b4d:b0:848:2f73:9002 with SMTP id d2e1a72fcca58-848436957e8mr2546882b3a.75.1783513065798;
        Wed, 08 Jul 2026 05:17:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4d:b0:848:2f73:9002 with SMTP id d2e1a72fcca58-848436957e8mr2546850b3a.75.1783513065294;
        Wed, 08 Jul 2026 05:17:45 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848337d12ccsm2367474b3a.48.2026.07.08.05.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:17:44 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v7 0/5] arm64: dts: qcom: Add initial device tree support
 for Shikra
Date: Wed, 08 Jul 2026 17:47:29 +0530
Message-Id: <20260708-shikra-dt-v7-0-977b65a300c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANo/TmoC/43SzW4CIRAH8Fcxey5m+IY99T2aHoABJe1qu6ybN
 sZ3L2qtmGjSC8ls+P92GNh3JY45lq5f7Lsxzrnk7aYW+mnRhbXbrCLJWOuOAVMgKSVlnd9GR3A
 iqCVaLaRQQnV1/8cYU/46WS+v53qMn7tKTuePV7FfnDzB7MVbhUDGj6Gu4f2tEAZWREwpcQ/9L
 Lu2nUuYwyWchzgQnzeYNyvitPcWWaIKWT/Te1EJf+cooU2mJJPzCOkfySmU8S9aO6XK2CjA6t+
 odyWSsB2GPPULGTQPaBMYagMNQkSueeTovFeGU+MpRuoo646DW+cybcfv051U6zi53/GzZvwzJ
 UA0VYIbzgERnrelLD937v3402VdTtjMWsC2AKtAAOotJC+4lQ8A3gDspgNeAQMpYTSOYxAPANE
 CugVEBbwMjiYHnlv2AJBXQN08wVlWgAKPyJQzktkHgGqBmyOoCiivgpcGvdD6DnA4HH4AlmpJ6
 ycDAAA=
X-Change-ID: 20260511-shikra-dt-d75d97454646
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783513057; l=4467;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=2OTR4Uda6T9rFzecFPmo1D1H7dwe+VKFBl6L59G2A0A=;
 b=yYGvcWSnNDplQkDlmcBbZ0ZZTR5IN2C/Fuq11M5+K33m7els5MeYYAA4bVn4wV+oou1kLid7X
 I7MuL/OH4nUAUG4IZdDbjQ0m+LAgAibvRQwbNjZjDyBowj43dR6s9fd
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExOSBTYWx0ZWRfX6wai8IM9pLhl
 SgHurKqrMapPpy3Nr7n2OuFcwWILzPBlBsT2qqu1wkdm+FcmIm5roQOa4gQwF4VuQeWe4t7Ynzk
 IC2o3w3LE2/0ZNiAyf5iWpmLz0vxCSA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExOSBTYWx0ZWRfXwlXx7GLO9VdH
 ePozDU/nh/Cpze8wbjokVL4bjSd6V+wf8P9BsirlOU4vPyA123dTe54Ibo/pvdPWG8nLN31NeL6
 F+VsOWZD2mniWDTftXENoIJAVAvESMYToVaJfXHlw7xzlGkrfGz66xasJwTBKuWhjsnN803OcBw
 PerVZ9qjqNIzpBwCoPc7aoHSs6WzYVg0AchS5ckVP+XGf0o59lP/ZdvRJdAyDP+8sFv4A9MzUga
 G5xfBTb38oCHTaHZ/tYgUfIYhofo5VFHDHcvnYThtHipjN3NfYhb9LzPjG7z23gSZvo60Wx7ieW
 /UNi44TsjzMJnWTRtfhuazI5rSObvuel5Q3WoS1UCbHDS0O/U8uCnUW+x2yV33GghlbNLpSe2qj
 zAfhhMKjD9HGqBm5vW7piujzsMgPUB9H7ekzSds/8n7307ApPsGoBJVsZOjWuFoL8NxcftgRIAG
 UYl1b6oCayHKpGCgfmA==
X-Proofpoint-ORIG-GUID: 9AHzvkich-M_mL40BkCDqhpriMoutv6y
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e3fea cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=thxruFBVZ7uuMI2BP_UA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 9AHzvkich-M_mL40BkCDqhpriMoutv6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117612-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:quic_mchunara@quicinc.com,m:rakesh.kota@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:sneh.mankad@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:xueyao.an@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E9BF72646A

Add initial device tree support for the Qualcomm Shikra SoC.
Shikra ships in a SoM form factor; this series covers the CQ2390M,
CQ2390S and IQ2390S SoM variants and their EVK boards.
The series adds:
- dt-bindings for the Shikra SoC, CQ2390M/CQ2390S/IQ2390S EVK boards
- SoC base DTSI
- CQ2390M SoM DTSI with PM4125 and PM8005 PMIC regulator definitions
- IQ2390S SoM DTSI with PM8150 PMIC regulator definitions
- EVK DTS files enabling UART and eMMC on the carrier board

Note: USB support is intentionally dropped from this series. It will be
sent separately once the USB driver changes for Shikra are concluded.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

---
Changes in v7:
- Rebased on top of linux-next
- Collect Reviewed-by tags from Konrad
- Link to v6: https://lore.kernel.org/r/20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com

Changes in v6:
- Collect Reviewed-by tags (Krzysztof, Dmitry)
- Fix ranges value and interconnects alignment in sdhc node in shikra.dtsi (Dmitry)
- Link to v5: https://lore.kernel.org/r/20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com

Changes in v5:
- Add qcom,rpmcc-qcm2290 fallback compatible to rpmcc node in shikra.dtsi
- Link to v4: https://lore.kernel.org/r/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com

Changes in v4:
- Updated commit message for 1/5 and 3/5 (Krzysztof, Konrad)
- Incorporated Konrad's comment
- Collected Reviewed-By tags
- Link to v3: https://lore.kernel.org/r/20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com

Changes in v3:
- Drop USB nodes from this series; will be sent separately pending
  conclusion of USB driver changes for Shikra
- Fix memory base (0xa0000000 -> 0x80000000) (sashiko-bot)
- Fix power-domain macro: QCM2290_VDDCX -> RPMPD_VDDCX for sdhc (sashiko-bot)
- Fix INTC GIC_PPI number from 8 to GIC_PPI 9 (sashiko-bot)
- Rename SoM variant CQ7790M to CQ2390M (Konrad)
- Add PMIC DTSI includes to CQ2390M and IQ2390S SoM
- Link to v2: https://lore.kernel.org/r/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com

Changes in v2:
- Update SoM/EVK combination bindings (Krzysztof)
- Add per-CPU-type PMU nodes with PPI partitions for the heterogeneous
  cluster (Cortex-A55 + Cortex-A78C) (Konrad)
- Use full product names CQ2390M/CQ2390S in commit messages (Krzysztof)
- Update RPM interconnect tags and power-domain to RPMPD for sdhc (sashiko-bot)
- Update to use MPM for ss_phy_irq instead of direct GIC for usb (sashiko-bot)
- Add IQ2390S SoM (PM8150 PMIC) and IQS EVK board support
- Link to v1: https://lore.kernel.org/r/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com

---
Komal Bajaj (5):
      dt-bindings: arm: qcom: Document Shikra and its EVK boards
      arm64: dts: qcom: Introduce Shikra SoC base dtsi
      arm64: dts: qcom: Add Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add Shikra IQ2390S SoM platform
      arm64: dts: qcom: Add Shikra EVK boards

 Documentation/devicetree/bindings/arm/qcom.yaml |  18 +
 arch/arm64/boot/dts/qcom/Makefile               |   3 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi    | 156 +++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi        |  15 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi    | 170 +++++
 arch/arm64/boot/dts/qcom/shikra.dtsi            | 842 ++++++++++++++++++++++++
 9 files changed, 1324 insertions(+)
---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260511-shikra-dt-d75d97454646
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-change-id: 20260430-shikra-imem-binding-a7bb9d2f16d2:v1
prerequisite-patch-id: 80d8ab865b7b0663c5b2878b45b55e2e4fde9c19
prerequisite-change-id: 20260501-shikra-scm-binding-a7ff5fabd0f2:v1
prerequisite-patch-id: 8e645e1c6ad6182de4813a726c293654324de1df
prerequisite-change-id: 20260501-shikra-tcsr-binding-fff1689e4097:v1
prerequisite-patch-id: f6781d2cf0829ccb32f1400623c95739972f2ee2

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


