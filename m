Return-Path: <linux-arm-msm+bounces-99878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIm3Np3ew2kgugQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 14:09:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E4D325764
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 14:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 598B23083DF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773103DBD40;
	Wed, 25 Mar 2026 12:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eR+wV2a5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXGybaMB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6F33DB644
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441043; cv=none; b=io+WGOmEkEvC2Fn24HhqcE3XJqAp4qaO+Fle1nUPy3jDa2CkM4K1SGKJvdtc6koffVuK+B/AgN/kAB2Ca7BG4nZzDZVz+mqBKLF5TooanMyxx4L7xQpLyMCKNGoJK3oozZeSiP4lgmUTxcSlqaPYwpmt7AgvAzARH0T03/juTeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441043; c=relaxed/simple;
	bh=QpPLeZ1cqQr3FzN2YLabhHgQTjAgivfc8dfYen/DG4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HMP6mgEo3OtWmfhj6jkEx4PeTr5TrjEHfwkCTJxUs792aArXcwjEW4O/G7Lrne09Z032uoB7YdZ8BmdK/o62/PgUutbX641f+taqKF9FLIOat1XzBvY2TGaY9KBoT76gQtIocPIeeizru1BPs5ldlc6hxXm/Vkn+J4c9BT7skbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eR+wV2a5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXGybaMB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGdFn1626559
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JaWWNuEsgM30JPsQq/Un5nxrZosUzYeSlGe0mJTeQEY=; b=eR+wV2a51z456GOG
	+1RXTAvKbYFflBaHkyGprblzAgmFxqt6+TwATb4dRbUi6s/f1+YSh5QtiJiaHc6P
	nL0WyGYCl8fERgegPcy3uCwwjbipMi3RD1wJPl07o7URqi0BNqODPb9IwK0AL4xT
	79eh0cca7jea/S7kQeDxLv/36PFcUbYn5YAIenMyUlEdqqE56NqvMIXaMQXVGlg+
	/Vm9t7Los/rrmIBzdZmBnCyVtY3Cz3PpJxcqdYPviWM62oLiY/oEHiXLTQ1exvfl
	/BBsPwq/czV4FKbgWPv/F1tloI7WJBWjTGd0uY724mB5pr+nnwCD06phkRlvRH4b
	H6w9hQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489whns9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50925fed647so137580551cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441040; x=1775045840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaWWNuEsgM30JPsQq/Un5nxrZosUzYeSlGe0mJTeQEY=;
        b=MXGybaMBvEZ0ZIowdwe6AEqJN7YSH2HFSoIJVYAcPlPV57YJGwZGKLfDwovVb2PZE9
         pKnsbJSLkjRiPRx7EPJPVGQlE7p89nBpQU8p1Bpp2q2xgy+ugkqe1RJPjFKuEoqYP2+c
         7+ziq7U070tEP5t6o+ffVmq2WnZ+mORocM30QOVwsPeQz6Njjrk2R7QQ4yGYebHF3xXL
         5XRVUIs4PIIODdXaUi+DKkTD23nAkGltpxI1Jpl1AkYyieMOrRt+tEIWrpjM+86dAtaJ
         rqVRdam7Pl2KmOWXwT36CR5KZol6OPiA5AcVy4AVU6RutCorJfvHx+bLXanW7IuFNinx
         88Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441040; x=1775045840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JaWWNuEsgM30JPsQq/Un5nxrZosUzYeSlGe0mJTeQEY=;
        b=AvDYQN91J64tejOHCjEylR+Hu5nmaKB1HX5Tf3Dg1ddopV2BcrgZpn2OSojeoBAWoY
         Ol6FZIZz0qOj+Bxm/WH/87WYUKRks34s7rNyyIoxXuJgt+xDNBx2T4MGm9CTkdqNdkEw
         4JjiHlsKOx3NrzWPMoaYp8o+fPZrpANqS2qPqlHasDOA6706pWKbfWthVAGfsiCWj0u8
         J8hddCtBMM6yWLE2cCEjclG/o5gnD1206WXfrwC/JoVoQF2SWkFBAiSxN5yMbPv/cjut
         BYrD0E7JzxqZ+NZqC+uTCnu/hnOdfOeWaxBSFSj+CY5p33k42lmLglDiiN7MA2wme0On
         HUVw==
X-Gm-Message-State: AOJu0YyA/GKkbW9eUXdxtW89Knwh2C3xBdfqNFD92F/xlD2cpu1rh/jX
	DerU2O415BUxeeMelCQGB1Xevn3VP2KxVRA25u1wZrz5jwQrlRaF77z2Ri7Tvi7VJIcu72sAo88
	Z9JJ33Ct0xvPEJLmkBFZKlJf9Zmzb7uCW7zEoJFXpNMuGNPYA0rErcT+SxrTWliL1lYy2
X-Gm-Gg: ATEYQzxK3zX2YNxoCpl8OYThlhgyX0Pf+ZqETkQIzd4F/EaEFy2/rmkelnukCSpNsGZ
	Z964wzC8FvGvbXiQXhQb0Q0BjVCPmm+D5oXH2b0mB290itzaQuY/qEjuwIW33rCijbuq/UaORvy
	DKfg8gHBKeKzE7O8OgI0seu6970CtC8fEqHikqv3v0RNhtgp1zvVZ0vK4ceZfz5jWGg2uPN0Dil
	R0M0/gTrBlXrBrN2FIsv7CYCTcZweLA+fyCB7I5r+Rp90wPOLvwTHkXeAaMr/2SJDWQnehPNnAJ
	MVK2ZMHUDNMeSkyhVAuKo7CfoIWQuMhKi3ohB2cz0pkPq9WhJ7vIpNyOXjUhtIDIo3OvyZIDaDO
	AX7ep/Leibty7x2NUrFyAmFcGA0oUzFAUqtnFHVhO54vJ
X-Received: by 2002:a05:622a:343:b0:50b:4755:949f with SMTP id d75a77b69052e-50b80e333b8mr46901501cf.43.1774441040420;
        Wed, 25 Mar 2026 05:17:20 -0700 (PDT)
X-Received: by 2002:a05:622a:343:b0:50b:4755:949f with SMTP id d75a77b69052e-50b80e333b8mr46900611cf.43.1774441039749;
        Wed, 25 Mar 2026 05:17:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm6480356f8f.36.2026.03.25.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:17:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:16:49 +0100
Subject: [PATCH v3 8/8] soc: qcom: ubwc: Add configuration Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drm-display-eliza-v3-8-dc2b2f0c74a2@oss.qualcomm.com>
References: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
In-Reply-To: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QpPLeZ1cqQr3FzN2YLabhHgQTjAgivfc8dfYen/DG4w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9I2a+J0pjGAmk2+Lny/aKCD6LOagAIf61WE9
 TEYbIYeoteJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPSNgAKCRDBN2bmhouD
 17vuD/9QS5FgUbK5hmT6VQaxuq5f9oHtrr6i2dqMuG9xEuhWta21qkW54rZd3HfyAjfUD6rcFTF
 W2efY5RshQmNFlCrH7+OEwjzkp+DsKzF7NLC1IhhGWjvM33HsXPL3B+dabBSBleM+J8JCA1QLbI
 I97cD81ad4nvYau1Go7JHqdSJFBlA1Z3GnOhLFgnLBmAV/Vfpd6dMvfgXQ5nzRphehCFMJOR9Om
 almvBxdKY77/to2cRVG3BM81fMCtK04ErNY/sU/7Qzdrg35vrG6YgL0nz++isdHHxZLJXqFs08s
 AFNlItUxrJtKJNzPByuiuzbhJzbCQ5ApVAjjv1Qpx+COSHB/XHP3t+1maUvBjm2xb2J0o0mN0Yg
 fGZ7VF0ctzyaZaPuDGjqj9+sC2W3s4LMLuTW8Luco3Q+gHnZf4WGOSBvM56OjbCpkkIZM1wspGu
 6XGpg8onA+nNlXw/7cg6L5egB0+qOpjTvAwrhEoZBFS1VMCcjV7JxZH1QLXw5Znf0XNV0R4V4TF
 WBvmUMrM+ZAxthHPGFEhcEukaVlaP99z7OOoyOIxfb+ebz22OHEPIHq+XgDhB7nbgMg1X2S44NO
 9M4Ggsp5X9xU/4Rpz5lmGrtKjWQr8RZKHmXXdPk2Egy4KkvTgK8hiERKXBnm/yADNcnQkN2VOSH
 TsY5lUlhKdkhcEQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Fz-8FPMfUHRwjYid1t-ZMYpTcJYGgBRS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NyBTYWx0ZWRfXwdCzV68qQsoU
 XHLUt697cOuOvup0YdzDfgRZdWD8Yvdlz84MfMDBEHOTXJt8zdVY7AJeWopdrXnAUfq6LLctUYr
 VDUguhFZ+a6VtMSwHh0Lujna1d+5I5kW7mKZPHD19uadL1ggHLiifGZGnTe+9A99z053j8gEIJS
 xgVlrGDEtRNZsfQ9xfZWPrk3Ihyxpvn49aLBElXV8LoVQa55A1mDNj/br1CnN2bBWkfES13UwcO
 So/brAkVmqtsKrHRKzju7bmsuhhCQvlfkAogzPmtzQgLCx0uzvFND39LBiAsN4i+6KYUBpaBVpd
 kI8+E6Hjm+YP7Yc0qIAYALkQFBDxF1Psm0NYUz8lQr+G5OSIlBD4uOgjiFkweZi3lxU0+TL03Dy
 DZdJjmb+JDNVljfPA+8NHaEl2VEfNA1I5uukM1XxyJTGJKIYJm5MlwSYqIfZU+nHhjG92+7VgtI
 pi9je+qavJnOaUhTJOA==
X-Authority-Analysis: v=2.4 cv=e/gLiKp/ c=1 sm=1 tr=0 ts=69c3d250 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VWhB_nMSBEne6Ym2UFwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Fz-8FPMfUHRwjYid1t-ZMYpTcJYGgBRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99878-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
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
X-Rspamd-Queue-Id: 38E4D325764
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add configuration data and an entry to OF table for matching the Eliza
SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
1. Use data from manual (UBWC v5 as pointed out by Dmitry, but different
   highest bank bits).
---
 drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 8304463f238a..134c7835e4cc 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,6 +16,17 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
+static const struct qcom_ubwc_cfg_data eliza_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
+	.highest_bank_bit = 15,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
 	.ubwc_dec_version = UBWC_6_0,
@@ -244,6 +255,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
 	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
+	{ .compatible = "qcom,eliza", .data = &eliza_data, },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },

-- 
2.51.0


