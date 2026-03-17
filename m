Return-Path: <linux-arm-msm+bounces-98183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLQkNexfuWmrCgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:06:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BDB2AB6F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B495130A04E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71183E1232;
	Tue, 17 Mar 2026 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8aURp3L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6qM/29v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEE93E1219
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756170; cv=none; b=nyLzGzl5Na+6jqO2WafA2IS2SULEHpp3VRNNxIdbDxV1zjOaQTzxPRQyvjYEGNCrLR8hKhuFn6GfVvnhrU+Vfe5IqBnCGvP+Cj2dngMa3LG1rtTY55lhdUwsSSSQr/gq8EM14Q0MLb0N+Qcrjj3ejd2/S95n/hbxLwUjALsBaew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756170; c=relaxed/simple;
	bh=qoz55FlU0wzlioVR5y4kqwZWHtjnuJw0AgLGnvGjRME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPm4aRsjUgY6qOtHSCdZDCFPequYI3Cr4KCsrjH8PVtAQtw6lknjL9d+ROgR34NXbYnTfH8tNaA9Tk58oCvkS+oMVetHBumV+Pz889hiRsY7Feu4Vv04Jar+RxpLkKgq3GU+m8CqgN565flX2d7Pxq/T1pZGq0Dx7scgPBQG1yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8aURp3L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6qM/29v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H9HlMr4022389
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=; b=U8aURp3L83W9hIQU
	YeimIZTZKiTV7Ab+ZFEGRnCz0QTgNKbhmJ3fG8Aj/EBBPWbGomEj8KTLMKo8/wd7
	B1L/2qEmbDBLbxkaDgI4oPof151d7poQGXRPeSW9NWvZAedd3OXhl6FGoOWxAiB4
	XOYVhUacYPMWJSabS5x0LFeH5TvLF81zaUqKymqZlAzM/H5impkgtq7pz792K7Ix
	cuBwDQFo6rpfWtRG/J0NXyEz5BbUtmVtJLNZ9qVN92tNLYPp6VEgx8KusvqVPw9D
	53VkNfZ+blDdGM+ojiOLSO8P+7Xrmcgph/1rsSB1Y+vLh7HsZMaQGAgwtshAAico
	WUlKZw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fkyy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:02:46 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94ea6fdbd28so64774775241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756166; x=1774360966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=Y6qM/29vDP3zvXbUxjmDX683M1hBXPLo96SXxA0vSFuIsFxc7zk6XPVO4wvBTM9x8D
         OYa4NOnF+euIsv6Pghxhr/MRFpn/Gcj2tHr8VGT53CR9VpGjN8yhjRADnNfb7z5VmF2t
         dsnTD4LoCb5ZO0P0ufGkHxH/0c4KELnSY/LwomR/LmrsV1VDeObq8S4BP0bs3rFtIX0I
         Rl+sF8rGHjhnhnE4ko+QPN82NUMGbhC7iKpsIzW3OYxdAU/sQFTlP2vvCK+ydkh7FfiU
         +u6QURchci93ko0NBgs/AS+3z12VBVOeS2MFoudZ8De09SvtaIeXMIPBwpb4QVm0plZ3
         TbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756166; x=1774360966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=M4OCbcELA8vEH/Hry+jG1x+xPyyfcYxzlBTmKezxS+Vt0okYVy0vi1TeD6VpKNG7BY
         GCv71WkpUpWXH8lspWzZUA7UkTXUv4F5n7BabnT+JaL8STthoj263JodUskjgz6amk6s
         fy+1A34wZpWPg/kX2IGsjDC3bSzhc4pRZoDyuTgVHxsKxdsLimSX8Sm9h7pefPGZ5v+o
         OcKc5XCfAq8WYIGk+5ebsCAJ807GSvSw1uG+lTzSYvjoi0binIXh7OJRuLPQpWo0fZb6
         CUbKF/8ziVAY2jb/Z3+/4L58uGz7G6WvMT8ygePYgQaT0p/16IdpgxQ6PaaADe06j+W2
         4JAA==
X-Forwarded-Encrypted: i=1; AJvYcCUqeCfo0MC1Boy21z88J36mKdEoVSj6b4BrE1QZMihB5tr7674FAb6pDHuTZnQ37Ppox34eILPVi+SWdZDt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4xZZoAKSAncgY/NVVv+UXNy+kIBuVCsFM3Ze8FHtQNjzAc/6u
	Dnv/sg5OM/H5k8WT6abhDKvPLncnknD7FCwozLV3zY9x68ZqfSimdIhVoj4Nh1a+aIoQnEMunsx
	hpnGAQCYlfJ8G/wMVjX1bWpEgVC/pOMuSaYkxkemFMJWZDzBGCb/NxMtc4/7dk7Jpz8xW
X-Gm-Gg: ATEYQzzV6vLuQSATx8Bo9zqA+mtJVzmCTj7D9kmTfNdFCQjuWVLuagvFMBPQWjxkhVC
	g8dgcOD3GSqAFT6VfYHCUEKbFN6L7qtKajkT3/YQCnuIampbbxDhyUhuRA9iZAlAM9DI+VK+Atf
	40Ybr5FQGV9lLaQE6yU5MV7QUv3gOeDU/EOUSUx60girluPFaxNc3jiM0zRBuOZcZXgwXFe5+VZ
	kwrPNr5pyW11OwvYm59NahQ+5RvZ8yN6zLqTUgfwmu1H9BLOOCBuqCm6TMZFAo7qXrFxRs7JLcy
	4YBKpAzc3ciTk3BwI58wKE8SwB0rlIgxwe+C/xPs91qTaMwN6qHTMscTpjBAQXKQFQ1eJ9cjYtm
	0IgVXLjmublcNTH5TEK/vjaov8tQOa02Nrho3AUMdwqT+ctlXP9qY
X-Received: by 2002:a05:6102:b13:b0:5fd:ef38:920e with SMTP id ada2fe7eead31-6020e8ff56amr7643389137.29.1773756166098;
        Tue, 17 Mar 2026 07:02:46 -0700 (PDT)
X-Received: by 2002:a05:6102:b13:b0:5fd:ef38:920e with SMTP id ada2fe7eead31-6020e8ff56amr7643322137.29.1773756165543;
        Tue, 17 Mar 2026 07:02:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:10 +0100
Subject: [PATCH v13 03/12] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-3-0968eb4f8c40@oss.qualcomm.com>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
In-Reply-To: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3778;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RN7fpsHiCZHYCJzNDBLJB3M5MgjeycllWN+nZFNR5GU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV7y9ZYaNC+PjAwISHvYpwr3lKaHdvpbstczB
 Tdo0FYPbvSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable8gAKCRAFnS7L/zaE
 w1q8D/0VjMXWHsWGlmxP/k+KCCyjLkVQe9MseoDppXf/VlBtxYqbYrf1DyZOibBBL7Z0kJmvHpS
 iKQ0SoXGoNoXTs+mbAjgpVR0aphVL8nlINjN4sE8H6AyROUWE8PgpuJz63Yd3g9TLgApLg870Fu
 1qWSdlfGh1EoAFL/UWakZBtG8v+8/kS2tC4ToxlXkCQ0VVxYAZVHRPFAoeZM/M/1ZYHlkB0aHeD
 Oyf7bC/rNfHAZD3gmVFHKKOlghBeB0mqjgnX7rfyC4w1Pa0Zjf8b38J5Sz7mIGQkWv++bkcvKpP
 5PwASinwl7+D+9BGwTEA9vKMf1hziTVgqsAkZibB41PpZHnfN4RoRRS/n/A+AukGa3aq9CnJXcq
 K799w9uy9o9NzcjAnXpXa9uOre5XC9koxZK/+KfGjSn+zGR812mVjCn7oKXv5yD1RGoLEMoWMQy
 8gCEIBI1ZwIE0Xa3nWyCGM/EINHD75ppZ04hlKgnqQxIgv8zsysZ4rJTR2fNVhahzPVWd0oykjZ
 UMVP9Jf6VFm4hNzsXmIEffVgYVCkni+1oJ0w7yBaCoK8nkc0x2jbAEniVfzk7CXyyiW20Lw8is0
 UP8urIwUX/nXJ5qA2CZrFhvya0M+cgJgDXKWFP6U7hdTDiilLU3i60wU4pR9ThkuPyI3Miwk9IQ
 BE9VQTT3amshYFg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b95f06 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TrvyydjZQXJHshIfD8hBzyXZqWGynsWw
X-Proofpoint-ORIG-GUID: TrvyydjZQXJHshIfD8hBzyXZqWGynsWw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfXxXkWJnkZ/7Ya
 wHXwOdBToIDdy1+gtUBuAri4HC4wdGkoaF3JmTesPgor9hDwGYeBYvCTTGRlDtAgjnBwnD46CSo
 dNYzhHoc/OQ8ID0UbpcGuszYpZVmHeJtcLZz161EAU/BtGNn8zIi2Ax5LN1cztr8k2/ZWF4uOyi
 A2nbFAs5QBfpsD/Y5fnLuOOle82Rlw2L2ZqSi21iLnbyR1loq+rmtJDLweG7StEQDGqVoYHvDn7
 NoPB0GBEgvzh/YHc7r7tllaTc2ne7NAAfwjVBTn9I+NWje1rwx/OGDULc7Ljg2GKvwtIICY94Mq
 jgqfIdKgtR7742kpUZlT1VYL7MbwXlWHA/VEDbxI9Y/HRVNYES2TkTDpboxf/ik3gcijYiMRFbW
 hi+9EOkGuLnFVm/vL1Kd/R4R48CDJfMfCxuPGPx/pFjCvfqq9eb24Et89XaSiTTChKQ01mx1BnA
 kpRVk0BNXrBwnFb9KTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170124
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-98183-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RBL_SEM_FAIL(0.00)[172.234.253.10:query timed out];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[linaro.org:query timed out,qualcomm.com:query timed out,oss.qualcomm.com:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[linaro.org:query timed out,oss.qualcomm.com:query timed out,qualcomm.com:query timed out];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76BDB2AB6F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index c8601bac555edf1bb4384fd39cb3449ec6e86334..8f6d03f6c673b57ed13aeca6c8331c71596d077b 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -113,6 +113,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -142,6 +146,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -171,6 +179,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -200,6 +212,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -393,7 +409,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -411,7 +427,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1205,9 +1221,9 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
 	{}
 };
 
@@ -1231,7 +1247,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3


