Return-Path: <linux-arm-msm+bounces-109844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNTSBRysFWpuXgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:20:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B43F5D7582
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E57431AC961
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF45D3FFAA0;
	Tue, 26 May 2026 14:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CL9NQZvX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJqJdwmo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C17A3FF897
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779804539; cv=none; b=hAU2Ou38xL0VpgfR2lAtTxiXWYTfdO5qyVARmvWYPs5/oBXkgZRApPjVnQLN0aoFk6xvSPamzfG1VvrPdXuiPHsh2No7JJjeEVIixe3Ut9A/2+grC/I5Ewm/DXOIFi/z9rfi0ur0O4FhtXK80ksGgpRIlf7VbXko/oW2PfWavwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779804539; c=relaxed/simple;
	bh=0h2gAoU1ijRj2nMRG0t8ZPVkUryalG662AE9ufPJgos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQe8uwK5d+V4cx1+fMRq8yKPbNxxiNDg58lHOTrX3/Vs+4vGy+SDW5fZ27UfOz9Q0S+IMkprs+b2C3mP2JOqXFXmLPEssh3W4qWGrRAYN8Lw3IbGWyycxm6owYV2MmFS5x2U4Ed3BT6dhxa9PmXMPByHsIjZIrT/GV6jBopVbBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CL9NQZvX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJqJdwmo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QDhrkT2528461
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oAKZkwwe/mB
	pi8fxwxEneBxaGJrf1Ao9NvbMtFS0K5Q=; b=CL9NQZvXjdyY5XS7OGoM89Y+0tf
	OgOruddA/abljxYx13r4TVyhImP2M2KnSFNDt9ZKk2Z1BswQPPHG6nTgVKBuR/1H
	7Ez5D6Jpp/MnwcTW1g2kQJsaPsS4ItExCMWfyzQtE5WYKBwu31jrbADC+wjze6Ip
	8ubANYg2Yzs3QlTBToPkr/AD+IjqJYyh7i+dWgPehsC5CqikNATq4+6UUOTtG5Wt
	KEx1WqvY1gm4SeYV3j+wltrEnXqx+Gs7w1wRpHYHIXc/odZOLZhbz90tIo+tWKmP
	4+RN9oPpj+CQU8ZwfE0K+M4GqfQo4dcPkXHP84kiXKM+TO5BT7CkM6T9iNw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edcnnr3xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:08:56 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6347ed78bfaso13087602137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779804535; x=1780409335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAKZkwwe/mBpi8fxwxEneBxaGJrf1Ao9NvbMtFS0K5Q=;
        b=ZJqJdwmoR1EetdPCmRtwodq1rxplj2cJWCl1Ktbx/1xFxboy7PFu7gHigOHPk2oOdc
         uwJJiIkXl6BCPhYrJBc5iNVQGNJMwnft+yu4fZf6H4B4h9zayEJQmVlo8mbamOfk+GBL
         hq8D2/FOiAtaSF3O88nobXA5QWsvjcCYBSQgC1RVXasl/ktOso/3TEifrBlihVrhx2Xd
         8M/fLHGJRSkq529OyU9EiYT/U6k2gDl9UV2lqyVWu3YFKogotdHbAKMAtEHzTjtnINiB
         cLJg8Li6eqWIetimSvNA3YN5XKuJz+Ez6bBt/956VXkGe4JaHD6xeC97RaRAaP10sZfV
         1VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779804535; x=1780409335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oAKZkwwe/mBpi8fxwxEneBxaGJrf1Ao9NvbMtFS0K5Q=;
        b=JzuWna4E1OfKOJPEo40Mh2xrp3634nvEIbKj2/MHkpKKnD1SxSvSITFLaxLsT7uSrb
         n0m/eTpvAVcZxzG8ZY6+xllFREJIYgBxim50snFttDTZevW9U+4S0glWMW0H3vU6mQCt
         4B0lp9k93/cftKqB509jCw2DHx2y3kLPy9bU+ptck4rOe2wAzNMVeQalrkqsaN+YKA9V
         Mm/JtBmk0/FObImP8SqMla40HdjXO9+kVfNH2q90gh0ROZWGz6CXRswE3GUE9YUzMwTw
         fHT1pKKL144eXNaQMqNHdQrCu0yKjJg21CQaKawrPdzhiwUfaFDkAVxTuZJjlfWYnqrL
         fVig==
X-Forwarded-Encrypted: i=1; AFNElJ+M5Z0EBYMz1iK4B+IAc01NHBMmlaGSqRtiUpnObQLdtKplNN+wmzNC+YWOz149NfJc0L5nQPCuWqpNh9fA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5FJ7CqwlH/YyOATU7G11rHXrhEH9P0ytXDCe29IOjjFB5k6pM
	R1v9UKzGrghQxIEJAEHnqxlVMWLt8wJMtByF7q6W6voMbak7GB0ztRNKxZvmitDgu1PvEVxMghO
	VZIgMRGHHGkdJ6HvorQab/LR89YaqQx86v+Qgod0Z8zdpXa8wUMVsv2KD6DCEphyBkMMi
X-Gm-Gg: Acq92OFMzHcTeaBzn7l2mh6Hhs9Qz2BOLaAOqZitRPgCxtuOxUIRijnVP0gl8FQSnhj
	QDyQCuc3FXZcmNQeqMFA/Auibah9+3wUpC+YcJhJR1hE7kHW+WLAbnDiX5lrR9MtNUd0PY3h3s0
	rrxQ0ioCVeICy5HZ4EEFfrmBtwvpUXGg4qUb2vvCYZAv04bR9ft2w7FYZBlJe7kp8txWNFZrJbd
	48v/aTDUpS6ED2YXCLTMw8ZhSZi/XiNAw+nNi+c20zNOARDphXow5oA3CCs1bKA6Iwbi+sCphrV
	gck0MwgnOJ+LLktDEaK1kbi3IYr+HMmmOdXUbItjiYJElcy8xCCPVw317+XThbkf7QfDz2rw009
	PKM9NuVKjRUctWfYuipbOWM/fgtCukC13SThYtzOuBXMc7JhR
X-Received: by 2002:a05:6102:390f:b0:631:4c79:b1e8 with SMTP id ada2fe7eead31-67c890229f1mr8368210137.22.1779804534957;
        Tue, 26 May 2026 07:08:54 -0700 (PDT)
X-Received: by 2002:a05:6102:390f:b0:631:4c79:b1e8 with SMTP id ada2fe7eead31-67c890229f1mr8368087137.22.1779804534302;
        Tue, 26 May 2026 07:08:54 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490424aa561sm156266605e9.5.2026.05.26.07.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:08:53 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
        linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
        openbmc@lists.ozlabs.org (moderated list:ARM/NUVOTON NPCM ARCHITECTURE),
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        linux-amlogic@lists.infradead.org (open list:KHADAS MCU MFD DRIVER),
        llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT)
Subject: [PATCH v4 06/10] thermal/of: Rename the devm_thermal_of_cooling_device_register() function
Date: Tue, 26 May 2026 16:08:07 +0200
Message-ID: <20260526140802.1059293-18-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14036; i=daniel.lezcano@oss.qualcomm.com; h=from:subject; bh=0h2gAoU1ijRj2nMRG0t8ZPVkUryalG662AE9ufPJgos=; b=owEBbQGS/pANAwAIAagyI4oqT+hPAcsmYgBqFalNraM9tYHaYfQukOy41BntzyXp62lD/VEEK C2fmVqqZ9eJATMEAAEIAB0WIQQafc3hhXPRY1XIeySoMiOKKk/oTwUCahWpTQAKCRCoMiOKKk/o T3jvCACg9mha6aH7j/o9uxZy/QVXMGG9NLUEZ8OkuaPqCyTEgVpIdAzm2IEFFRGaQCLBJJ5t+rr d30owzQ11dRHPO1vR7leCY7h1HS/3GAxa9afb0cFZoGwmhDfO4DsQSXU/YH93ce+Pq1155LBsqy b3br2CdibVZ/pVDrWDU1JeoKurjRk06L8HVXrdLKgGysmOC3aCKwgqC8lTHNz4RmkEDtlkD3uhu FNNmG/JWqySCK21zoH4MZAJJFIC/rDUizl+YxAtBUkK+VZhAwFkJwzlqZpqTdQE4kLhZAZzuSDx EhUKMgYtufmFo3cidVbk4FVk8tKs8cGXiZXwEe90JPYHQDB8
X-Developer-Key: i=daniel.lezcano@oss.qualcomm.com; a=openpgp; fpr=24D626F253BE9E87E6CE5BF48FF4B8D271675527
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mzTY3wfGSrbrqabFqSL89a0vIT4m-le-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyMSBTYWx0ZWRfX4AaCUPP6GrEi
 mzG2lfHYQtMfRViqmwQGaIo67xU5BBoHumy438acOpRLqUNITxUnZCR90Yb8fT86jxrMScbnOun
 tY+ULN2NaF2BWBmrYzDzsUQKwVxFV2e2DV6+dw0muzi62nvBexabyknAKWjzhk5E04oLNO7pJ/J
 R6htmC1LNx56cRL38s0mJUF94nG2LYN7MWKUfqq4ii4i13f3yc7lj75giOnVH0IhSO79j/kUZ5V
 mnorxGNIkMBP7GVe+WBNRrcm9CR9GyPrXfy1g4GomTTGFSlRZFnq0OD/U/iuBsF9iSgdd4eaipz
 ERfh/Eh/Xv3vSK79nhcq8sg6SEQ5HPcEvCh56UGaP8fYIirg7Ui227oROMf4cqyDaCFnqs30E5o
 bAmsbYZ6nZEKCvHqWXmrPHtS5a0DYgRgrf193UxT27dfPcjlO2ubTRBuEfFYHAFlg3sKAdiMFhQ
 OQtUxRxcXlO+bviLTYQ==
X-Authority-Analysis: v=2.4 cv=VPHtWdPX c=1 sm=1 tr=0 ts=6a15a978 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=9QVJCMzFHTx7fD6CVgwA:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: mzTY3wfGSrbrqabFqSL89a0vIT4m-le-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260121
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,arm.com,kernel.org,pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,roeck-us.net,jms.id.au,codeconstruct.com.au,weissschuh.net,chromium.org,google.com,sntech.de,nvidia.com,linaro.org,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109844-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_GT_50(0.00)[54];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,etnaviv,lkml];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B43F5D7582
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To clarify that the function operates on child nodes, rename:

          devm_thermal_of_cooling_device_register()
	                     |
			     v
       devm_thermal_of_child_cooling_device_register()

Used the command:

     	 find . -type f -name '*.[ch]' -exec \
	 sed -i 's/devm_thermal_of_cooling_device_register/\
	 devm_thermal_of_child_cooling_device_register/g' {} \;

Did not used clang-format-diff because it does not indent correctly
and checkpatch complained. Manually reindented to make checkpatch
happy

This prepares for upcoming support of cooling devices identified by
an ID rather than device tree child nodes.

No functional change.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/hwmon/amc6821.c                  |  2 +-
 drivers/hwmon/aspeed-pwm-tacho.c         |  5 +++--
 drivers/hwmon/emc2305.c                  |  6 +++---
 drivers/hwmon/gpio-fan.c                 |  6 ++++--
 drivers/hwmon/max6650.c                  |  6 +++---
 drivers/hwmon/npcm750-pwm-fan.c          |  6 ++++--
 drivers/hwmon/pwm-fan.c                  |  5 +++--
 drivers/hwmon/qnap-mcu-hwmon.c           |  6 +++---
 drivers/hwmon/tc654.c                    |  5 +++--
 drivers/memory/tegra/tegra210-emc-core.c |  4 ++--
 drivers/soc/qcom/qcom_aoss.c             |  2 +-
 drivers/thermal/khadas_mcu_fan.c         |  7 ++++---
 drivers/thermal/tegra/soctherm.c         |  6 +++---
 drivers/thermal/thermal_of.c             | 15 +++++++++------
 include/linux/thermal.h                  | 16 ++++++++--------
 15 files changed, 54 insertions(+), 43 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index d5f864b360b0..8e5926b06070 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -1076,7 +1076,7 @@ static int amc6821_probe(struct i2c_client *client)
 				     "Failed to initialize hwmon\n");
 
 	if (IS_ENABLED(CONFIG_THERMAL) && fan_np && data->fan_cooling_levels)
-		return PTR_ERR_OR_ZERO(devm_thermal_of_cooling_device_register(dev,
+		return PTR_ERR_OR_ZERO(devm_thermal_of_child_cooling_device_register(dev,
 			fan_np, client->name, data, &amc6821_cooling_ops));
 
 	return 0;
diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index aa159bf158a3..1c5945d4ba37 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -841,8 +841,9 @@ static int aspeed_create_pwm_cooling(struct device *dev,
 	}
 	snprintf(cdev->name, MAX_CDEV_NAME_LEN, "%pOFn%d", child, pwm_port);
 
-	cdev->tcdev = devm_thermal_of_cooling_device_register(dev, child,
-					cdev->name, cdev, &aspeed_pwm_cool_ops);
+	cdev->tcdev = devm_thermal_of_child_cooling_device_register(dev, child,
+								    cdev->name, cdev,
+								    &aspeed_pwm_cool_ops);
 	if (IS_ERR(cdev->tcdev))
 		return PTR_ERR(cdev->tcdev);
 
diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 64b213e1451e..2505e9fac499 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -309,9 +309,9 @@ static int emc2305_set_single_tz(struct device *dev, struct device_node *fan_nod
 	pwm = data->pwm_min[cdev_idx];
 
 	data->cdev_data[cdev_idx].cdev =
-		devm_thermal_of_cooling_device_register(dev, fan_node,
-							emc2305_fan_name[idx], data,
-							&emc2305_cooling_ops);
+		devm_thermal_of_child_cooling_device_register(dev, fan_node,
+							      emc2305_fan_name[idx], data,
+							      &emc2305_cooling_ops);
 
 	if (IS_ERR(data->cdev_data[cdev_idx].cdev)) {
 		dev_err(dev, "Failed to register cooling device %s\n", emc2305_fan_name[idx]);
diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index a8892ced1e54..084828e1e281 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -592,8 +592,10 @@ static int gpio_fan_probe(struct platform_device *pdev)
 	}
 
 	/* Optional cooling device register for Device tree platforms */
-	fan_data->cdev = devm_thermal_of_cooling_device_register(dev, np,
-				"gpio-fan", fan_data, &gpio_fan_cool_ops);
+	fan_data->cdev = devm_thermal_of_child_cooling_device_register(dev, np,
+								       "gpio-fan",
+								       fan_data,
+								       &gpio_fan_cool_ops);
 
 	dev_info(dev, "GPIO fan initialized\n");
 
diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 56b8157885bb..3466edd7d501 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -794,9 +794,9 @@ static int max6650_probe(struct i2c_client *client)
 		return err;
 
 	if (IS_ENABLED(CONFIG_THERMAL)) {
-		cooling_dev = devm_thermal_of_cooling_device_register(dev,
-						dev->of_node, client->name,
-						data, &max6650_cooling_ops);
+		cooling_dev = devm_thermal_of_child_cooling_device_register(dev, dev->of_node,
+									    client->name, data,
+									    &max6650_cooling_ops);
 		if (IS_ERR(cooling_dev)) {
 			dev_warn(dev, "thermal cooling device register failed: %ld\n",
 				 PTR_ERR(cooling_dev));
diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index c8f5e695fb6d..aea0b8659f5f 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -857,8 +857,10 @@ static int npcm7xx_create_pwm_cooling(struct device *dev,
 	snprintf(cdev->name, THERMAL_NAME_LENGTH, "%pOFn%d", child,
 		 pwm_port);
 
-	cdev->tcdev = devm_thermal_of_cooling_device_register(dev, child,
-				cdev->name, cdev, &npcm7xx_pwm_cool_ops);
+	cdev->tcdev = devm_thermal_of_child_cooling_device_register(dev, child,
+								    cdev->name,
+								    cdev,
+								    &npcm7xx_pwm_cool_ops);
 	if (IS_ERR(cdev->tcdev))
 		return PTR_ERR(cdev->tcdev);
 
diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 37269db2de84..e6a567d58579 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -685,8 +685,9 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	ctx->pwm_fan_state = ctx->pwm_fan_max_state;
 	if (IS_ENABLED(CONFIG_THERMAL)) {
-		cdev = devm_thermal_of_cooling_device_register(dev,
-			dev->of_node, "pwm-fan", ctx, &pwm_fan_cooling_ops);
+		cdev = devm_thermal_of_child_cooling_device_register(dev, dev->of_node,
+								     "pwm-fan", ctx,
+								     &pwm_fan_cooling_ops);
 		if (IS_ERR(cdev)) {
 			ret = PTR_ERR(cdev);
 			dev_err(dev,
diff --git a/drivers/hwmon/qnap-mcu-hwmon.c b/drivers/hwmon/qnap-mcu-hwmon.c
index e86e64c4d391..c1c1e9d6f340 100644
--- a/drivers/hwmon/qnap-mcu-hwmon.c
+++ b/drivers/hwmon/qnap-mcu-hwmon.c
@@ -337,9 +337,9 @@ static int qnap_mcu_hwmon_probe(struct platform_device *pdev)
 	 * levels and only succeed with either no or correct cooling levels.
 	 */
 	if (IS_ENABLED(CONFIG_THERMAL) && hwm->fan_cooling_levels) {
-		cdev = devm_thermal_of_cooling_device_register(dev,
-					to_of_node(hwm->fan_node), "qnap-mcu-hwmon",
-					hwm, &qnap_mcu_hwmon_cooling_ops);
+		cdev = devm_thermal_of_child_cooling_device_register(dev, to_of_node(hwm->fan_node),
+								     "qnap-mcu-hwmon", hwm,
+								     &qnap_mcu_hwmon_cooling_ops);
 		if (IS_ERR(cdev))
 			return dev_err_probe(dev, PTR_ERR(cdev),
 				"Failed to register qnap-mcu-hwmon as cooling device\n");
diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
index 39fe5836f237..ba18b442b81e 100644
--- a/drivers/hwmon/tc654.c
+++ b/drivers/hwmon/tc654.c
@@ -541,8 +541,9 @@ static int tc654_probe(struct i2c_client *client)
 	if (IS_ENABLED(CONFIG_THERMAL)) {
 		struct thermal_cooling_device *cdev;
 
-		cdev = devm_thermal_of_cooling_device_register(dev, dev->of_node, client->name,
-							       hwmon_dev, &tc654_fan_cool_ops);
+		cdev = devm_thermal_of_child_cooling_device_register(dev, dev->of_node,
+								     client->name, hwmon_dev,
+								     &tc654_fan_cool_ops);
 		return PTR_ERR_OR_ZERO(cdev);
 	}
 
diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index e96ca4157d48..065ae8bc2830 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -1966,8 +1966,8 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 
 	tegra210_emc_debugfs_init(emc);
 
-	cd = devm_thermal_of_cooling_device_register(emc->dev, np, "emc", emc,
-						     &tegra210_emc_cd_ops);
+	cd = devm_thermal_of_child_cooling_device_register(emc->dev, np, "emc", emc,
+							   &tegra210_emc_cd_ops);
 	if (IS_ERR(cd)) {
 		err = PTR_ERR(cd);
 		dev_err(emc->dev, "failed to register cooling device: %d\n",
diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index c255662b8fc3..259c41f0c34e 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -381,7 +381,7 @@ static int qmp_cooling_device_add(struct qmp *qmp,
 	qmp_cdev->qmp = qmp;
 	qmp_cdev->state = !qmp_cdev_max_state;
 	qmp_cdev->name = cdev_name;
-	qmp_cdev->cdev = devm_thermal_of_cooling_device_register
+	qmp_cdev->cdev = devm_thermal_of_child_cooling_device_register
 				(qmp->dev, node,
 				cdev_name,
 				qmp_cdev, &qmp_cooling_device_ops);
diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
index d35e5313bea4..21b3d0a71bd0 100644
--- a/drivers/thermal/khadas_mcu_fan.c
+++ b/drivers/thermal/khadas_mcu_fan.c
@@ -90,9 +90,10 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
 	ctx->mcu = mcu;
 	platform_set_drvdata(pdev, ctx);
 
-	cdev = devm_thermal_of_cooling_device_register(dev->parent,
-			dev->parent->of_node, "khadas-mcu-fan", ctx,
-			&khadas_mcu_fan_cooling_ops);
+	cdev = devm_thermal_of_child_cooling_device_register(dev->parent,
+							     dev->parent->of_node,
+							     "khadas-mcu-fan", ctx,
+							     &khadas_mcu_fan_cooling_ops);
 	if (IS_ERR(cdev)) {
 		ret = PTR_ERR(cdev);
 		dev_err(dev, "Failed to register khadas-mcu-fan as cooling device: %d\n",
diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index 6a56638c98f1..d8e988a0d43e 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -1707,9 +1707,9 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
 			stc->init = true;
 		} else {
 
-			tcd = devm_thermal_of_cooling_device_register(dev, np_stcc,
-								      (char *)name, ts,
-								      &throt_cooling_ops);
+			tcd = devm_thermal_of_child_cooling_device_register(dev, np_stcc,
+									    (char *)name, ts,
+									    &throt_cooling_ops);
 			if (IS_ERR_OR_NULL(tcd)) {
 				dev_err(dev,
 					"throttle-cfg: %s: failed to register cooling device\n",
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 8c49d449d43f..b59d2588ff7a 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -557,7 +557,7 @@ static void thermal_of_cooling_device_release(void *data)
 }
 
 /**
- * devm_thermal_of_cooling_device_register() - register an OF thermal cooling
+ * devm_thermal_of_child_cooling_device_register() - register an OF thermal cooling
  *                                             device
  * @dev:        a valid struct device pointer of a sensor device.
  * @np:         a pointer to a device tree node.
@@ -570,14 +570,17 @@ static void thermal_of_cooling_device_release(void *data)
  * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind itself
  * to all the thermal zone devices registered at the same time.
  *
+ * This function should be used when a cooling controller has child
+ * nodes which are referenced in the thermal zone cooling map.
+ *
  * Return: a pointer to the created struct thermal_cooling_device or an
  * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  */
 struct thermal_cooling_device *
-devm_thermal_of_cooling_device_register(struct device *dev,
-                                struct device_node *np,
-                                const char *type, void *devdata,
-                                const struct thermal_cooling_device_ops *ops)
+devm_thermal_of_child_cooling_device_register(struct device *dev,
+					      struct device_node *np,
+					      const char *type, void *devdata,
+					      const struct thermal_cooling_device_ops *ops)
 {
         struct thermal_cooling_device *cdev;
         int ret;
@@ -592,4 +595,4 @@ devm_thermal_of_cooling_device_register(struct device *dev,
 
         return cdev;
 }
-EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
+EXPORT_SYMBOL_GPL(devm_thermal_of_child_cooling_device_register);
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 6d1862ac187f..e6328234a42b 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -205,10 +205,10 @@ thermal_of_cooling_device_register(struct device_node *np, const char *type, voi
 				   const struct thermal_cooling_device_ops *ops);
 
 struct thermal_cooling_device *
-devm_thermal_of_cooling_device_register(struct device *dev,
-					struct device_node *np,
-					const char *type, void *devdata,
-					const struct thermal_cooling_device_ops *ops);
+devm_thermal_of_child_cooling_device_register(struct device *dev,
+					      struct device_node *np,
+					      const char *type, void *devdata,
+					      const struct thermal_cooling_device_ops *ops);
 #else
 
 static inline
@@ -232,10 +232,10 @@ thermal_of_cooling_device_register(struct device_node *np,
 }
 
 static inline struct thermal_cooling_device *
-devm_thermal_of_cooling_device_register(struct device *dev,
-					struct device_node *np,
-					const char *type, void *devdata,
-					const struct thermal_cooling_device_ops *ops)
+devm_thermal_of_child_cooling_device_register(struct device *dev,
+					      struct device_node *np,
+					      const char *type, void *devdata,
+					      const struct thermal_cooling_device_ops *ops)
 {
 	return ERR_PTR(-ENODEV);
 }
-- 
2.43.0


