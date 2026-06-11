Return-Path: <linux-arm-msm+bounces-112701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 77eFD5GKKmo5sAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:14:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6806670C30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:14:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VgJ5Dp0P;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aEKBFhY9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112701-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112701-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7BB533B4C16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D3B3C9EEF;
	Thu, 11 Jun 2026 10:10:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8393CAA5D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172658; cv=none; b=CnMLXR6cI9OiVm9A0beQmYQSep4ASgTynb54hQ6DmCLfKwO7Hnh4nFqEk8pon08CGp89a6SzjmIu37znn8T2QPEHlAbuBAvd82KpYO2PnoeQu55ipw4wb74m4RBaKxjzmjnU+ICLTxDz0bZdv7AuZm08O2qw/Ael3ZJ+JBVWhYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172658; c=relaxed/simple;
	bh=ZxjX8+A6FBTaecjdAORo5qujDJsZbUaBlBdXJEaxCxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HPtqXeryW6nkd+x7mfeuDP8L1yfuAMfmyE6ScjCIFX5/ZGxWxFbnQ4IExUTSzCiuLaJyu/dVxsQVsypRi+TtZTCANGD5wbKmLWeTrqRa411qa3CNAIk0588RwcprLe8JS+S6wwVyYuZY7Ina+hXgPc6YeQzvJPtQaB1GO2mZnfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgJ5Dp0P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEKBFhY9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9x6tN267510
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Rwc4/nWVfH6Sf7XgvmXET5o5hcWse/f6GCS8/S4cFE=; b=VgJ5Dp0Py87l+223
	coHdghLh+dO8NRPwaliGPbk7YoYD6yDxs8kwdbOjb9jFIC+yzdXAKpwhtGi/XfxT
	0B70pPhq0J5p7zTYlN/Bq3GRBCAR8jjZZD7Usa4UIIe20ybNGXiZxvoUpBudaRto
	ZQ4FPwGiAvytNeLv/IGM55tdbLWqioS0zq2FDGwSuBf7eXGLQAUedoxiweNXBBFX
	jw6Et7Lj6OyJLsCqpWL1zHuldmt3o44snj/zSEZUEWbZgHr7haa3IsSZ7unNDPM3
	ooRzbQr/jwTOJNvSTm6Zhe3kDtdutoRNOeUybdVzgpm2IPM00LmWioj9p7VsBWdZ
	y5wGxQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u2v0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a2bf5388so4222801a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781172653; x=1781777453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Rwc4/nWVfH6Sf7XgvmXET5o5hcWse/f6GCS8/S4cFE=;
        b=aEKBFhY9HrAOVQ5j+F89vGJ2V3LOWeWuKW6kfsUqpBn5jknrT+yv7vBQyxkdSRJEq+
         mcB9FQZ1KgXg6opQyTZ48/jc7RiE0mwCq7hpQBuGODC1QHcs27r+CcnPVe6lGMXFYo3U
         moetKYlHUkf9MXR0PhvMRPgLm7kitRh7fDFL0T+a4AWfbNuyeZrQ1twuJvNAgq1LVgx0
         mxLb6kJxAeTV6JWgztvngt8O4h7YLy+gWrEwGtywzRQF45QO5IsKgN1XxdoItOmWjkcQ
         nDRwt4hFhEv1Aue0vPc0iyty43GF3IWOyYzxh6aUAGBxRY0zxE5yuGxH+CQni5cb9COw
         Q87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172653; x=1781777453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Rwc4/nWVfH6Sf7XgvmXET5o5hcWse/f6GCS8/S4cFE=;
        b=Yi9CeXVdR6BxfepETyB0f89lIpA6mJWsm6Ukoftz9yd3zAqU1QpcDRYxCm22hmXGai
         8DPq7VlxH/uUTa7rcuZEs8VlAfmnEJnbi0G6mbMly0VfXwlI2gx6ALpb/LhvbX1cJxOb
         PS2Zg7uHD6xU5w1m65rOtfwGpKHoFlL3tcZ0arXFCxragrqUXhbl+ts14667kEEwnBii
         QJm3UlPJPJSRg/Tl4A3EE59XboIa/T64XYsq0mIiV1aJ/hVM9CGxihBTlK8g1HqBNda+
         MvUyTWO3ipm+vPaiW3srI9mQxbzvZa5z8FMKasjNw7bVCgnyfLWBxl4fFAlJiz/kGrv7
         ardg==
X-Gm-Message-State: AOJu0YzsSXlfAkoN0ZkWV08prdAw6ey2SoE/Loho5Ey+hF2AmJKFAcl0
	umTB2l7PRib24LarQefpTut3nMK+TufnJt92oR24i6WgUHLbKdwFuXc7dSdlLUoDZsGdCmU+tw2
	J1dBhKLcsRvs/D7j2ewQJNYwmSEMJah8OpZg8e+RZz0RtZEE2hh8RZHUPeO/Cfa0WVIXGnxtUJK
	17
X-Gm-Gg: Acq92OH8LI96Mo298cqxGxFbRWI3LJNy+fRx3D3+qsKFmNeKo1FYK71Q2mCHkyqugkF
	3StVchDjPZ8XHEdRj404IgAnR7Bl+tkkPDCX0VZJaKP3ieUVY4SSFRPRD5oEyyvXDdNNCcjjIIG
	YcAr1dGT0hNvAD19Ipg8jmZKmf5Mfa65gpFwHTncuJtXCe+Fi7VcElDQYfbzxcCUZLjFCwx76dr
	yX3vw7bNB5SkyAxUcPCH/ZJZpglDDtZAXjILqmxR3608czGJk2K9bFN/S6dV5ZWsL0OuKhl/Wvn
	YiuX0ctfInQ1UAr+8RrsTP05wDOWuCXL6TRciN3b28X48zWRAKXtwZt+5HSksB4+ppvDP0ZEuq0
	DVngA1FvYvl6i24/JWssh5i7PEvHQoDGwi25H1iqu2/Huyog=
X-Received: by 2002:a05:6a21:1518:b0:3b4:84c5:45d0 with SMTP id adf61e73a8af0-3b5e33223camr2350023637.27.1781172653300;
        Thu, 11 Jun 2026 03:10:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:1518:b0:3b4:84c5:45d0 with SMTP id adf61e73a8af0-3b5e33223camr2349962637.27.1781172652791;
        Thu, 11 Jun 2026 03:10:52 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c865860f3d4sm1279646a12.19.2026.06.11.03.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:10:52 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 15:40:12 +0530
Subject: [PATCH v5 5/5] arm64: dts: qcom: Add Shikra EVK boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-shikra-dt-v5-5-103ed26a8529@oss.qualcomm.com>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
In-Reply-To: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781172612; l=6252;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ZxjX8+A6FBTaecjdAORo5qujDJsZbUaBlBdXJEaxCxI=;
 b=i6ezhM3kDydHfFKwZRjxlvfzeFVgqv/nHdE7z7Xbqsm0UzA5/G71aAoSYcFuZAxM/ytH995VY
 0rGI3J9OP2EDrTOlhDj/5lXLt6RQD1OO9RDv7b/D02zAvsMt4JA4ZzW
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: KXYYFMLbzERgW_ImgkDCI2sK5lO1TDys
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwMSBTYWx0ZWRfX9sTObtdwdr12
 I5IfnByo32GjcNX+l+7aEviVOOBEg/U8DndPumuVmRmAxZx/rSf8ZpKCvqJ81A/8YtWi63wkRp+
 qoKZYp8PkN/D/58AoMT6BMEDkXmwLRI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwMSBTYWx0ZWRfX1e5yvo/nxH/s
 eWQNXjj1OWIKMdliqsYMQRRNZcZ4+KTUh9WrkzFISkyV9adY0RpF4zU6g+K3OKNH6j6w3Alkn1F
 BIuoUA6TnjXIy6y+roZMzWZgm0eQc/0Z/E8ZeB0x2K/aXasA3CpXW+9EAxgJR+VxYIruvt82BDL
 9otr5yMELhaCpUB5KE278Ke+AUUSMjT4VQlnKu32ISRw3v4sGGxxpmNz0iVPjvlTfTscgURxMLs
 5qYnsUEICRlNClm2y8YvB05Zc3VfUt5Vu4WtGOoLgpsJlPpQ6zT5BVsnijn8MJHxHUfwn4Q3qP6
 riBYOgG7LVNeQZAbCmOAg3uEKXonuvaXVY0zGG9bKuUThjGi829bmKISYE5cklLeIalJlLN36xJ
 i2DDYidR+Kz7f4DHNpxfjT7L0TQ3bf+jmaqzr1EqWwJLz6Dzz0ayR9J8bDNEvqDWB5Kd+GfJSn3
 YtN6JvuJh2GSV0gc1dg==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a89ae cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=TizygBHPM-tQ0bhc_XQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KXYYFMLbzERgW_ImgkDCI2sK5lO1TDys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112701-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:quic_mchunara@quicinc.com,m:rakesh.kota@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:sneh.mankad@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:xueyao.an@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: B6806670C30

Add device trees for the Shikra EVK platform, which combines each
of Shikra SoM variant with a common carrier board.

Three EVK boards are introduced:
  - shikra-cqm-evk.dts: pairs with CQ2390M SoM (retail, with modem)
  - shikra-cqs-evk.dts: pairs with CQ2390S SoM (retail, without modem)
  - shikra-iqs-evk.dts: pairs with IQ2390S SoM (industrial, without modem)

Also add shikra-evk.dtsi, it represents the common carrier-board and
daughter-card configuration shared across all Shikra EVK variants.

Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Co-developed-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |  3 +++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 40 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 40 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 40 +++++++++++++++++++++++++++++
 5 files changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..a9e9d829fb96 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -334,6 +334,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-huawei-matebook-e-2019.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
new file mode 100644
index 000000000000..0a52ab9b7a4c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "shikra-cqm-som.dtsi"
+#include "shikra-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Shikra CQM EVK";
+	compatible = "qcom,shikra-cqm-evk", "qcom,shikra-cqm-som", "qcom,shikra";
+	chassis-type = "embedded";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm4125_l20>;
+	vqmmc-supply = <&pm4125_l14>;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
new file mode 100644
index 000000000000..b3f19a64d7ae
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "shikra-cqm-som.dtsi"
+#include "shikra-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
+	compatible = "qcom,shikra-cqs-evk", "qcom,shikra-cqs-som", "qcom,shikra";
+	chassis-type = "embedded";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm4125_l20>;
+	vqmmc-supply = <&pm4125_l14>;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
new file mode 100644
index 000000000000..d0c48bad704c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+&qupv3_0 {
+	firmware-name = "qcom/shikra/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
new file mode 100644
index 000000000000..3003a47bd759
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "shikra-iqs-som.dtsi"
+#include "shikra-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
+	compatible = "qcom,shikra-iqs-evk", "qcom,shikra-iqs-som", "qcom,shikra";
+	chassis-type = "embedded";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8150_l17>;
+	vqmmc-supply = <&pm8150_s4>;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};

-- 
2.34.1


