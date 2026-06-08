Return-Path: <linux-arm-msm+bounces-111707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nh2LDUBpJmp8WAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:03:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D95156535D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:03:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MsePBlZ+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AVU+re16;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111707-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111707-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 971E8303EEAF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79B039020C;
	Mon,  8 Jun 2026 06:59:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D6039937B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:59:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901985; cv=none; b=P+E7PPLlfH6IWs8MYBypoYP0scI07Ra5RQKtlkAPx65scLLDC4/Zhm+Qbuzxs0ONremdOXBzjFFqJ2ZUCOiGha9ernvC9cik6/OQ9TRhTW9uGWVzVe5fy0Im5pN2Zm39nbyUvwPks8TLJMlGISsCjo8/NZ1l+SzuI4POwEorC5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901985; c=relaxed/simple;
	bh=n8BAXFAj+oDCn4RhQ8z2NOQ90wTtinkzV4SU1c/SY4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkvHTHaL/dKchxUrXSbMap4q77S2L8lNuxglGVJ+BzFL03BV3jjB4i2kPZ5vZWM6Olx+bF1pk5zyZuGZA5/+g61kMdrTrml20/w9ZEoXoQEQlb9xEFdMXM+vJXqA+orpSXwbUAjp7nxA7xEdOeXEIVVezcAFYpjsNQ8gFASGvJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MsePBlZ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVU+re16; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Pk8O2733110
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/7UWcSa7sch199uUm0ihpHSXkTOLrOrU2Q3K/tjsND8=; b=MsePBlZ+U1N9lgCF
	NLYP92U844vUD1wYtSyuAsPUHaJfSR0oRRVeFxzRzhEUt7JpEkblaAj9xyG2n2th
	wCjSB/RcL0cZlKR9o0D6MwJsJ0L1uP4wHUo6TYjfVAEPlxKwR4uIboDS7VyBaGjk
	mLTcXMKsYDmNAkPjg1CR1E/MP3y86PETbOao+3zXWzlqxxkgwwsLC0QGWZR+enEH
	I0mAVS9BL00B51ZNv03jyj1vQ74kp4qbFVKbbvU03RGqp9kfp/VVju3leLhQ4Qo3
	ML6rl/erWJO8/4iIRnRWkPRh3bAOW2pwcqXnTPgS3O8c7L89WhgNUQVbJYzaW80H
	jlITsg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6gf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:59:42 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c77c80d967so3941270137.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901981; x=1781506781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7UWcSa7sch199uUm0ihpHSXkTOLrOrU2Q3K/tjsND8=;
        b=AVU+re16EWAF0Oa4PfiOA06tUaphi69TeDWtn2AAJRwEnrUlBrFYO6RFyn3CnxeWIU
         EMhJ2kfElAH60+r5+YcAuxCPnsnSJL9c2RilBr4fl319uwkE1wZk71+fYzdvxxj2/Kr1
         AVA9MGZlAQcPGrkLS22Plb0W9slxaelqLWC3se0U2f4Zu8sQH8n0xD7bfXho5a30wQ5N
         gKWjHnR4+wyMAFrnfAjem2G4ahzYdidVHjDxOlfhI/TkIwW9gkRRkPimerFY24KACnJO
         6JDol/4W+2+WrjBmgQ+gkRLftjy4Z1rfTH9u9kdmWbMfkzEC/PwI+zy5eIW7V/BlNng0
         0Uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901981; x=1781506781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/7UWcSa7sch199uUm0ihpHSXkTOLrOrU2Q3K/tjsND8=;
        b=R7D+lvJDbVtnOe30nG9jt519iS9Rsi+PG2xe4QYpXOyMfdI5vMv9AcbACWrdpKA2RC
         +cmFZlAu3XH49ty3Oepk9DKjDRBbB3NZn2PMEM/hZH8pKzPW00OzPRQO4QjTOXSFOZ+F
         rFD4gbdHEW6n7y1qrMXMJR/y3Csr9qNuDVbKusoHdOr7XNi8sH/daoc7AW5TQtaoAXC5
         byGZzg6S1yRGpH8RZvvyXBsKm6y2dH8v0+z1GbgiZooNBFAYxaiKIUKakikd6qwDoWuy
         kbfXVVP7LYSV1dGs9wYEz9xwj5dOk9Yb9Q5EiA2416M3lWAowvIW9kz1sfWj7KwfvY1b
         dnHg==
X-Gm-Message-State: AOJu0YxURoR47XiwS6XkF/r5JP+glh9NauQwl5eGxfymXtzGmEyGiU5w
	FEIy31B6oEFfDc3NhjExg26h1+4HMi3sqXTbt12jkIW19oJQJiWGFLJgNyD3wn/GdGj+hrYZGt7
	7E16a3kFa8HYJOqQUr30GSV3IYZesOisP4tnAIpD5EbW7PWITqOjQln0xtkTjGAmnteE9
X-Gm-Gg: Acq92OGxxGXvxvf/1Ogaf24lrHOD0Wv5IoGIINKDOff3QD7LeeyJMxUpuW3tk3+zccM
	umYSOhD8bXyAVBYUemuXzPstucmF21M12pLH32WNxcFDLJBxfbeiQrc/aZKLJg3d2ZAmtTyQIC7
	2cDuv0KOgx8YPksViUiDfRZwxp7dsCHOS+pk+WKKbRfQ5tkA6xiyj3/aTwh86VXvr08hwMogLY+
	SZ6dBUTxKAG9UQ0ML32dabRjX/cWLz8yFWQZquUoOELDDZpW0n7tKw3/HH8+/wf41zgseP85WmM
	qI042ynlL0UZmftm2pgO2q3HaMZzhMu9CNDUvJLtDVrpYhN2CB6diThq+YvNYkm9IZBHMR4yj0p
	RCOdKQ/cKj61S6D5AXFFzVn4xHrrDrtoarH7IgDZ7VKkYXEuexdJx+loC6g8N/l4zYbYNapAESF
	/8ptlmUGjHxWJyhtiut0jsni3DpzaAGwmNUYf9HVr3l7Nbpw==
X-Received: by 2002:a05:6102:5490:b0:6d9:a889:13b2 with SMTP id ada2fe7eead31-6fefdee84d9mr6614162137.11.1780901981534;
        Sun, 07 Jun 2026 23:59:41 -0700 (PDT)
X-Received: by 2002:a05:6102:5490:b0:6d9:a889:13b2 with SMTP id ada2fe7eead31-6fefdee84d9mr6614147137.11.1780901981146;
        Sun, 07 Jun 2026 23:59:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed789sm3638621e87.3.2026.06.07.23.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:59:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 09:59:24 +0300
Subject: [PATCH v2 6/7] arm64: dts: qcom: sm8350: modernize PCIe entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-sm8350-wifi-v2-6-efb68f1ff04c@oss.qualcomm.com>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
In-Reply-To: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2866;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=n8BAXFAj+oDCn4RhQ8z2NOQ90wTtinkzV4SU1c/SY4o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJmhLpooe78rWUM+pR4BQH6xXBSOcSM/trlgR8
 7p27ucqN/eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiZoSwAKCRCLPIo+Aiko
 1Wi2B/wL9YzaoY4qmodagukhZOgdXJIhA6Y1QNMMx/Va60ooRz8YLt4QW9aOMDXUsOFPoLa+U94
 XGMmnat45/qKU/rD95roVjE/BrtRvsA83alds5Pw92qaatXP5HGdcyZshtqD9v9dYyp5tVnmLkB
 jrWSC8j3g1Omxut44iWRiy6laIkRAR5O+JZoEVYqksajmAMmaPGxK6iuwV7INO439eRXeKu+9lp
 FRg5VGJff6rHF94spYK4CBnlSV+CKQJA2Ow+iMkJpMN9oOKFjNSPu23rynyScf4FwdMmcCI8ey1
 Q5Im/Iway9vmYQRKRL/dS3vObRmxszVEGx5OzDrTZ10Ztks8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a26685e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=a-LFHBoeUMMLBGfzAX8A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: VZH0oeV2aKbk3P6JjeZErJVLABLtQv83
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX2ebyqUZeG70m
 8LeoZ8p9ewAzoVyvKD1sdhkTJeetFXnP/4dvZUHRLw4bX8je7kHbav+gMx97+rE3GiY1sd0uba3
 xvDsuUFZlxuTmXEyfMB4JTPAp7p8T3XB8xtVvAf1o4bOqlJNy5iSWccozyejeNiZZV83waKsEWW
 I0v+x12w6rzH5odWoEukf3xD0FjRpd+dNWIPk1OO342wcDx1IdG82lAnvwclF1xpkiTyYx7OfhY
 VhW0eZXYduM1HlyvzcuMLu/W4b7/AHFtudlfpo2g+4FHfMBpRsgGQ7R0bG1SfO17FJ2qHjBbQ1s
 EfbKmTfxTJXGonX9+iYT/M51MCtttpYk2ySA8/DW49okxXc2bQ2mR8Ulnsab5OM2PYII/bNVl8o
 8mMJ+i+kMAns/iUPbJRdkCOVuLsSqBcotYb4OkwhxzVZecm3Yof91Ui+PG1hqVwYH1nkpNCyK0f
 c9p8x2tl3r30nzfdTFw==
X-Proofpoint-GUID: VZH0oeV2aKbk3P6JjeZErJVLABLtQv83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111707-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,oss.qualcomm.com,gmail.com,holtmann.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:konrad.dybcio@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,m:jjohnson@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath11k@lists.infradead.org,m:devicetree@vger.kernel.org,m:brgl@bgdev.pl,m:linux-bluetooth@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D95156535D3

The recent suggestion is to have PERST# / WAKE pins and PHYs in the PCIe
port rather than RC device. The kernel recently started warning about
the older style of DT. Modernize DT for SM8350 platform by moving the
entries under the root port device node.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 18 +++++++++++-------
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 12 ++++--------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..4973a3eb11b5 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -493,12 +493,14 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
-
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5b_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -507,15 +509,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
-
-	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+};
+
 &pcie1_phy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l5b_0p88>;
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index eb2a795d8edb..136daa444865 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1583,12 +1583,9 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1596,6 +1593,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -1692,12 +1690,9 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1705,6 +1700,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie1_phy>;
 			};
 		};
 

-- 
2.47.3


