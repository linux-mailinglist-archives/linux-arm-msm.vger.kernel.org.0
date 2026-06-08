Return-Path: <linux-arm-msm+bounces-111706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3f1jAwdpJmpgWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:02:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC06765357A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:02:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZXCMHTXj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LO0LSlwC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111706-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111706-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CBF73033AF3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374E3399357;
	Mon,  8 Jun 2026 06:59:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E1D398911
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:59:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901981; cv=none; b=ax5yl639WQiCXyUHrjLjjclk+t7MhVKWFeLk3LtveXimLnclaVSJIRT5LY3D+SajRrwiSvztE3u3Qg0w9ImAQyzYRrPLPMBHmenignE3EzS8cuUUKT9UvAJU/8MYgw1H2BXgF9Wcbp5XF4+CUrR7qlB7xaicbUfbkIizX0SWJrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901981; c=relaxed/simple;
	bh=K+dgZNHY5hnIkDIrCn9f4ZsTwh2z36hnTVJH0i21ga4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bOwwJmDIzYoNKvErVc9tpSpoSK11/rwaCnVOjBy9WsIW3K67noINH6WKRP4DrmIOituCU7ICRacRaJedXUArMaq3l0oFoFTKs3jpSh9KgZ+fGpe2SCdIhBNVSevIq3pCDRoeH64OQRwWD3jDquPl2L/VeUgZQW45WHapnXWxmA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZXCMHTXj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LO0LSlwC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ouqb2832966
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ijJ2Fs7y6o0l/NRnU4TC9ZpeExxhgCsJvN3KF+zKxuw=; b=ZXCMHTXj0KwyxOuU
	UxMnzDBkxzD7Fnx1REV+YmBYfyJjxrx4BpiTe4PUEFV23hes3ftNHq1zMOY9E5aU
	QCsrFGwOzW8a1HfGxknJuvlI/QP6qSoBu9rKP7crGoBsg+ost5oDB+AaPfZtbeGQ
	gL6CL4VzNZzxMphuT5jPBPlma1qj6EuRYAitDcx5y5eXqTmCRaulI+N2jEqULSDP
	UijczHrBNIOgrfaQF4a/UsP+UJoB7Zm84Mqi+jlR0VCyd33XWw7QXe/MKBKfER39
	hRWbiOqd4HiIFRs+9nndFTd5w1r48pSYftGQ0IVAUoBL4WM5XHiW+YHMzhPg4BqW
	9jgWpg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmreeas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:59:38 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfc66167c4so1554731137.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901978; x=1781506778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijJ2Fs7y6o0l/NRnU4TC9ZpeExxhgCsJvN3KF+zKxuw=;
        b=LO0LSlwCBXkwPiJ08w8rhr5kfzZrzn3l/27TDxMT6986Rwrvr7YsCc9T8aNC/IvP/d
         5j+nI8sv8qKutNiBQXoburOEH48ul3bdIw5tGP7MpKKpVHmS/BzYL4tk3GZUB3zAsJSu
         rTPOwcIUsZPwgZfRsBkD8VDP97/Q1H583CJl7qUHv8JbhVNgJ2+BsvuKz85eoHXhoXSY
         qBSo8s1+AkPpu0LDO6/zeJqwlDi7jtMOk2CJIzignIWNZNydIzQnL5hqhGOk6Nmudx3F
         fnuwFxPUwlt8G5OtqX0bcNzWCyp+J4oXFS8TB8fn4SUSMcO/SBgLspBA+vhevT2u0VtT
         iQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901978; x=1781506778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ijJ2Fs7y6o0l/NRnU4TC9ZpeExxhgCsJvN3KF+zKxuw=;
        b=fcrmlTCkcwVizWkT1Uph3Zt0eer+I2gFSgoPwals37mrXIslOtR0tHUYWDrjlsuFwz
         UBNA4FX/TwRxomiGN/xTUkVFrtMuu448QddMWjcmbZ5F+WFwKmFWVJ6/miXZHd0Zb/d5
         Wp0vPmNk+eYjcf/GMavfslOWIsFsG8PJeTLBgXOJHYUG0VS25rwkxuqjKChPiX18FpiO
         IbMCkpGluUJ42FnaL/qmwKbw3xoa5vD+oqU0UrKn2mUB2QIdt8RANiiOa0hoAxQsTVvH
         eXt987B3A6S6y77x/kkSA6tm9ycXbmN8OoYllDQhViiwVlUAar2mMnGFZe8iW8vNfwSD
         MCEA==
X-Gm-Message-State: AOJu0YyZUFrv9GjGn4Nh/F8GPR7GBqieq/tLZcPASyX0jHD1+fiRPshF
	+P/iizOGeYjWcURbIy9ceq5i6BZzGvLvqInMpmLa858naPBXE85uE0C40Z6Q6o5xXerixifJxRI
	+Q9uudLVhvUGsYODYJhqQCrDWReD6oSFH2tFtGStU2GUL7No1VEVbWg1ghVZCFxV7hLmV
X-Gm-Gg: Acq92OGDZGdbkQtEUataDLa2rqUhMk8+GqzlFyBhfT1jzv7Tg/zpl/WhHiekJfHG5RR
	5DPDhXptyT5K2MZOeMBeuYwo+ArnuocW5HBbYwLNJv8r/o+PFaflUqXaht1kyjOAYUPV31ORaa9
	ASHBwQCfsyHV9N7GBpcJuTw6T8rq+NaZJZzO6toYqJWD46TWLtBuNtb87j9xfRbzlOy1U3IXNOH
	hv+/zafpnuaz6BbDSbfAsoHM9rRaI9l6aDfnTuH8pu4GGkYV7G8ara9dfFSLE+nrfpj6WBp2ON7
	jj+htRSz4RCE+ZOYRDjPDy74MUkZbx89tLUOsH1b1ftAC3ySwGlqVElvkNpoKaFUiIxR+20o0Ey
	dKuFLuwDZbG7pNQjaT+qg+ubUKyNR1rjyGFa2SgvbvQ6pLzFrsCCbul9BM0fjSIevdAE86JqeRS
	kyCaOHpx3ZKhvBUQU4LpRtFD5MW7IaiYkTbwqT9XsBu2SsHA==
X-Received: by 2002:a05:6102:4189:b0:631:28c1:155c with SMTP id ada2fe7eead31-6fef118d103mr5591740137.7.1780901978122;
        Sun, 07 Jun 2026 23:59:38 -0700 (PDT)
X-Received: by 2002:a05:6102:4189:b0:631:28c1:155c with SMTP id ada2fe7eead31-6fef118d103mr5591717137.7.1780901977643;
        Sun, 07 Jun 2026 23:59:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed789sm3638621e87.3.2026.06.07.23.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:59:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 09:59:23 +0300
Subject: [PATCH v2 5/7] arm64: dts: qcom: sm8350: expand UART18 to 4 pins
 config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-sm8350-wifi-v2-5-efb68f1ff04c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=K+dgZNHY5hnIkDIrCn9f4ZsTwh2z36hnTVJH0i21ga4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJmhLMPpbd/iMy/AOpMuLuKYEOLwtm4UqjGzc9
 c2zxSS9/baJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiZoSwAKCRCLPIo+Aiko
 1ZeYCACypuX/NOMni2S+nKV60V4Uzvrud9ETiK986sgV2kEiiqR3Irz5D9bjUu1QyFC+dxgjMLK
 fGMJqgWJ43PFl8xeHndud30r9tdgXfgppDFyKaZYq1FslQm17WnlFeMXcZNe4Ra/WZR/rBOuuk3
 mlnHxU/XnUBR+lkYkZUeY3twUskOluahTpW8iPGoVYhVSR7G0xsNEFhT2tdn5RCXQ7/s1lWXREo
 aSLJWYYNrMjuW0joWOScuInd6TzzVh4dY9JNAWLqg3H5eKwxHZ1E25Ml2kSpUmfoXHIpYLD+qt4
 tVVA2Tgd2ufVZAljVuyoNBsRV9IFVNyFf+0sESlL/d+1ce03
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX7uTOXvQtaHdl
 EOYjJE03RDmP0vQA9RlukPUgEMBibCuR6LV6PcDbYRHdo2sRaFVMg+OSHj91gQTXdUkoIEYw7HN
 Ra2/kfkrZSnCiWMKk2JH+pOxFDvlKBTnWn3nOuKiectit+/ZBUSVjLDiE535FkRDoi/hxuhdZnD
 mc1cI6jvV9cHej6W/aFuDSFXt4HYpv1dG5gWwqTiMj/BVlJpYYcH3q4f/cYwBLwAFK4gIctJ+Kx
 eCl6ycjQxgJZG1BhLufhUyBYqiqjQBroeASO8Az2786WRky8LGcMBQR2eBzPfFh98NdpexWTj5a
 ML3UHMrHuHZq8i2M2XL0eOpQ8TncacgUnKzKhpH6CDqHGS5wstaFb/N7Fcyhsy29ruH6GP8HVZW
 0Yrxl/iBsPzB7vHv/cfzyYFL2GBqM4oD2dJLjAnZgpiQSYkZ+/JR2ywVwPuVMg+KqDf8NHWIIld
 mcVjbLYl9tfTJ3OanYQ==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a26685a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=GNmHCbt0ONPBLg8daWUA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 6nyn2_HK7NVzbHUsDL5tn0O2t_83rJCU
X-Proofpoint-ORIG-GUID: 6nyn2_HK7NVzbHUsDL5tn0O2t_83rJCU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-111706-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: BC06765357A

On SM8350 platforms the primary use of UART18 is a 4-pin UART (targeting
Bluetooth or other similar applications). Add all 4 pins to the default
pinctrl entry for the UART.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..eb2a795d8edb 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3309,7 +3309,7 @@ qup_uart6_default: qup-uart6-default-state {
 			};
 
 			qup_uart18_default: qup-uart18-default-state {
-				pins = "gpio68", "gpio69";
+				pins = "gpio68", "gpio69", "gpio70", "gpio71";
 				function = "qup18";
 				drive-strength = <2>;
 				bias-disable;

-- 
2.47.3


