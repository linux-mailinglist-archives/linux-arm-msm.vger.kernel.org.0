Return-Path: <linux-arm-msm+bounces-115912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YfegAeQ8RmoyMgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:26:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FAF6F5E26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:26:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o36jjQD3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QngBaj7X;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115912-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115912-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B817C306A523
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8C447D954;
	Thu,  2 Jul 2026 09:51:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B961647D933
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:51:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985880; cv=none; b=i/gg1tTyPAoQDPaq9sf0wMSBP9P/l2XEOmZI9nNWzICnzzYMHO/aB7Qq0wYrSRYWro+8gd49AN/EqMNmkmwzZEgNgbIVr6FetiV0IA54pPU1xxP4hzD1tez7G+eYZFwCt0hk1fR3qm20RP4/E+8XqUPEgKhGq7Eeh8Ow598ltco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985880; c=relaxed/simple;
	bh=2njLzbY8Unn3mSyRXWJM2yX7i/tGL2ovfQ0evn7w6Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cIqJVk9LVeOY7hN0tvOYy/EphuOH+Od99+yhD4ZUNEpSpGmBJCo/mHjy+alpUq/8dflirhYiuSEF5/9ZaGZWWYlBn5DxOU9YkN9s0J6z6YPjUULWlWJgOZqTwQR75/arQnnu8Z8+lVrhvNgyeb7S+T+2+ckvMrCapI96JjNf5jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o36jjQD3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QngBaj7X; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628sJRm4172117
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80z04yj5XQg07vhnxx5JXgiciswuUX0lR8As09BTFfE=; b=o36jjQD3Bx6YOqF8
	rEKAliIE/nMjk4c36ZH4TLHrbtzcfZeS4o6tHTwgeO4JhYGuQ5j4mnKRdf7pRdld
	RhEd9thLNmtwlPpyRUaGNbZ0WeeJV+zwwsBvoDSMC9UHPb22Tw+H9cPRYhhFTVkM
	IXen73KBkySaO7TBkgBXYRI8dvu278pgnDxvAr0cAu5Ge9MZLlGbDr93vIkPSepI
	WLyzbeUk4AIRuzAH8AadjvNWHYP4Cjjp2inxqQHatPrwit4X8v3lk1PkEVO2pj8V
	HMdYIA+c2tUCehf3cpH3GX7wwQlExyPlWWdOueeYX8qPBYg629p0f46MlBLgViu4
	nhv/Kw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwr7pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:51:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84622d6102dso2065893b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985877; x=1783590677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80z04yj5XQg07vhnxx5JXgiciswuUX0lR8As09BTFfE=;
        b=QngBaj7Xs8OjrWAlH75xP9aXrxPTchQduEe+3so0oRO6AEuARoGcMBXIImA13jsLoj
         qmDeAdpYIR+h+lktZcoGalHGPZDWlfpOZG09VKMXSkmIuxPRRy9LeEX/CIGewIAJHft+
         TU2oi/EEAkuZZ+n3NrheVoprmpl1omQcUQZo3JzAMHpdu3y1HzfVobbYABky8ZMfhZQi
         hRGfdl4aLFVGaPYjRFRdagH9SKjc1ZKFt++9qsA7Z/jFlku/R3PQuV2vV/C5f36mBtnn
         3meCbJJlUo/B+XUnz/PgpI3BdfUPyE5eZecmaMvhvLr9fXsetNZZlQ45H5yxutRJ+Nod
         OPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985877; x=1783590677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=80z04yj5XQg07vhnxx5JXgiciswuUX0lR8As09BTFfE=;
        b=Qf0SMbbvt9Qu807OvTcF1uX+OmmsJ/WWuqERjxiOcr9srHJKtVv1Tysevx3RZtoFEE
         yCVndC+uXNz+3DO5ukhrEhqUU7pSFU8PXk5H707qFCr/OaBAP0fo/mGhJagV6G0/zikV
         AdDCMSNWQlDGW/ZOFRPx8eXx28hj97uLTQt6fK+yb8M026s7ml/awCb/Ws+W+J9DPyVl
         MLfQZHVj8GPQkIpBZXdHDBzl4Z2UYpk1td9yoYGPYjYDHEZqL9ATxV5O++5tLQO5A/dV
         mXPtomgehxiXWtrlOUh5/fZ/vfxbpr0GyOxv2H53fQinEjCaBqootSG4WfMMVLd7ky70
         6+aQ==
X-Gm-Message-State: AOJu0YyYXSkECVGAQYXv2xaeNR6FWMA/yDJfzX216XIJO781Zb8DEpPS
	jW1X5rYY0vq0oCRWCx4JR3cKRWN32qN+T5L9MlPGZAKM6UwrxP7JJ4OqEbnWhJ3Fvh0rXgL/i0d
	ZeCBqm0R8npVGEpmIGfUzzu7AAbz5hC6iE8LpX6Wf3HHutUpKaJvDkqDnVUVibrUNMOr0asXJPT
	jO
X-Gm-Gg: AfdE7cnb0N4CdsZrIUBVf6GxP1W/t25OyJjlwOeAC8cEKec/7X9pluuJ1QNsEK8by4I
	/yFrMwIQZ+ao81YmmqjDlDIOhhGGbhD/tjan8cyIBqpzUzfk/AmsubLE8vogumAbXz+aQ+FXpp2
	orohZAZ7uokVNwDoFm5JMcPX0GF1JZxYrwvSb+gk2+Z4s4wKjkSidywoP9yuJvwfcY5p7f02Izf
	Og0F+hY9+ToeBjs2Z3CVkWJaMk0OjqoBu11/RYp7gYGqSIFMWGu/3LAUSoH9YZpQOxEt4XoUGN5
	6zB6s0VGgy80aTSjpgIPUevVwPP5JmurusJTGxN6/q7SU3UjV6T1skHxuja5RTBBsvBkityTV9X
	t17q2UEmf8W+D6jEMWUfIq2+34w==
X-Received: by 2002:a05:6a00:4091:b0:845:ec1c:71ff with SMTP id d2e1a72fcca58-847c51b624dmr4280310b3a.46.1782985877167;
        Thu, 02 Jul 2026 02:51:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:4091:b0:845:ec1c:71ff with SMTP id d2e1a72fcca58-847c51b624dmr4280282b3a.46.1782985876615;
        Thu, 02 Jul 2026 02:51:16 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb78ee2esm1110051b3a.24.2026.07.02.02.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:51:16 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 15:20:46 +0530
Subject: [PATCH v5 04/11] arm64: dts: qcom: shikra: Add cpufreq-hw, EPSS L3
 interconnect and OPP tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-shikra-dt-m1-v5-4-f911ac92720c@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782985846; l=6550;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=2njLzbY8Unn3mSyRXWJM2yX7i/tGL2ovfQ0evn7w6Vc=;
 b=HIxDx49c7/YmEkDy6wYs09L9p6/XNNX2RnpN0zUoWovMOFCSP5qDk3MAter7ZV59RFbBuWsld
 CBMuZZMrmtECLf/JyVSP9xRzd10tbQQQ1xqE7JLG3f0GazIaRnHcITk
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: u5kQ6_UNaCYYXsUg5_zpURAyblooBYiP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX03t45WxDsPYm
 Uuz5Qii9ig/tryA800Hw5+ZAu5cg+vrgSzFM96J+w9I1VvvnJxxrC42da+W12/m8viYuCOCMiaM
 idKm4PiDqILCWqlnmQ/ksvzWMEnMr6GsL0mWSbUSBvcmjnOJ3D8SD/OeMsE3fNP0sn3OtPnoxXn
 Q/cGp/Ab33rtxMEtI8j37IX68iWOusGhTdChIuxIaxyuJZhsSqu7s/KBwd5gKYCDjO+/URSL7gT
 IOjc7wZ3dNLlvvdKTwkmek30iRvWvah8P29et7DtElUyQasrTM0IYq+R/HRLyOBy+/yNBXUzasj
 ycj8SGY0+JStCiBaI2KRkVJvAj7NByYzpMcVCQ3AQ6OpeNSDbJi2Ae6zYkKjSQCr3esGfRCg6wR
 j5ERnQotKy3eQ9JTszpn+Etdf7CA1GNlV+yW/6Ur/Wt+DsqiexbAl21jTIuhQckQMZP5z0bJC2V
 lSfFEbE7hUudfBPqEBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX8beARFmGbUmz
 BwJ1HpWlNodu71OCB0cJNji4q/jOuPzPcYS2HS9fm6N1u3gYnBgFzP17xbOY1MFa4dJ38NXPt1o
 zovH31ChoctuNQe7uHiAd0tsHqBHnjA=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a463495 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Hmkr-C8MtNtjzj7I6joA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: u5kQ6_UNaCYYXsUg5_zpURAyblooBYiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115912-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:aastha.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:sayantan.chakraborty@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0FAF6F5E26

Add cpufreq-hw node to support cpufreq scaling on Qualcomm Shikra SoCs.
Also, add Epoch Subsystem (EPSS) L3 interconnect provider node and OPP
tables required to scale DDR and L3 per freq-domain on Shikra SoC.

Co-developed-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Co-developed-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 140 +++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index d66b97dea319..26ae21d4c7e3 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
@@ -44,6 +45,14 @@ cpu0: cpu@0 {
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 		};
 
 		cpu1: cpu@100 {
@@ -54,6 +63,14 @@ cpu1: cpu@100 {
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 		};
 
 		cpu2: cpu@200 {
@@ -64,6 +81,14 @@ cpu2: cpu@200 {
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 		};
 
 		cpu3: cpu@300 {
@@ -74,6 +99,14 @@ cpu3: cpu@300 {
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <489>;
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
+			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu3_opp_table>;
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 
 			l2_3: l2-cache {
 				compatible = "cache";
@@ -132,6 +165,86 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	cpu0_opp_table: opp-table-cpu0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-768000000 {
+			opp-hz = /bits/ 64 <768000000>;
+			opp-peak-kBps = <1200000 17817600>;
+		};
+
+		opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <2188000 25804800>;
+		};
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			opp-peak-kBps = <3072000 30105600>;
+		};
+
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <4068000 38707200>;
+		};
+
+		opp-1612800000 {
+			opp-hz = /bits/ 64 <1612800000>;
+			opp-peak-kBps = <6220000 43008000>;
+		};
+
+		opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			opp-peak-kBps = <7216000 43622400>;
+		};
+
+		opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			opp-peak-kBps = <7216000 43622400>;
+		};
+	};
+
+	cpu3_opp_table: opp-table-cpu3 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-768000000 {
+			opp-hz = /bits/ 64 <768000000>;
+			opp-peak-kBps = <1200000 17817600>;
+		};
+
+		opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <2188000 25804800>;
+		};
+
+		opp-1190400000 {
+			opp-hz = /bits/ 64 <1190400000>;
+			opp-peak-kBps = <3072000 30105600>;
+		};
+
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <4068000 38707200>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <6220000 43008000>;
+		};
+
+		opp-1900800000 {
+			opp-hz = /bits/ 64 <1900800000>;
+			opp-peak-kBps = <7216000 43622400>;
+		};
+
+		opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			opp-peak-kBps = <7216000 43622400>;
+		};
+	};
+
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
@@ -1820,6 +1933,33 @@ frame@f42d000 {
 				status = "disabled";
 			};
 		};
+
+		epss_l3: interconnect@fd90000 {
+			compatible = "qcom,shikra-epss-l3";
+			reg = <0x0 0x0fd90000 0x0 0x1000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+			#interconnect-cells = <1>;
+		};
+
+		cpufreq_hw: cpufreq@fd91000 {
+			compatible = "qcom,shikra-epss";
+			reg = <0x0 0x0fd91000 0x0 0x1000>,
+			      <0x0 0x0fd92000 0x0 0x1000>;
+			reg-names = "freq-domain0",
+				    "freq-domain1";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "dcvsh-irq-0",
+					  "dcvsh-irq-1";
+
+			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.34.1


