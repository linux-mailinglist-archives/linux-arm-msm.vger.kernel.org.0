Return-Path: <linux-arm-msm+bounces-115971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VkceI31ORmqxQQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:41:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0156F6DB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:41:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=USCn2SKV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LPIGeg0D;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115971-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115971-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6CD833015C3C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C802342B317;
	Thu,  2 Jul 2026 11:40:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9073EDAB6
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 11:40:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782992432; cv=none; b=ooAB/LBqOHMjXBpOTVQ2xzlKtrepx13l0IXnNoWk6WJMRKPqblGwu/UxV3eUhCZPZGvFUqmcOJZ10XxXBR/U3sw/B/wKEMq9s4A/6XO8VHclCG0imMe+yKGWbq71pky7gWrd6UPXaUtsoaqMcbLM/mZrWNWQCbuqAwglTSu0/kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782992432; c=relaxed/simple;
	bh=ECwyXGLyiKahd7C8k8+zQNRe/N/N8D3moPR8+kwZ4+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sTSFD/99CYQH/WA8X03WVcvguWynwArFtHl52Ol/gtuM6IeM2pHU42iXvq4N72G9mMmREWQe4FOWQqbB1lIrD+1Jz1eYa9+Cyr9e3RS1aY+fkhevK6wKV0t1oQLH6MBkD/1nDyp+FZitSFGyqQcnWGlBV18w8E2P0yE6jxDfkdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USCn2SKV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPIGeg0D; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628K7vr3009616
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 11:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NIrrgt0h4u/XYVrX8w7YmBq4OVJYHoIKS3bZyeuiC5Y=; b=USCn2SKVpEpFe142
	SRlk17aHjfvPRyrZ7BTMDGfMAldC98/kEp1seUkNJCo4oBJuVHxQ3Nh5zVZ+sEdP
	aeiGemEHkUuDsQPTld6QBXtxrdlq0m2BCr8DHkzb/sxG2yf3RnJ2OHhGFEsViAI8
	nO7PiPA9BKW7jIbI2D1weEK7dwXGwJ5SfsobsufXwFk70/EJpaQW7to6W6zAQ14J
	Q4ur3ulsDzNpJfYQA8P9unzVQ4JIQOIamdg7DxXY8xNfbCXywAEHYNScOM+9ntHW
	Mc/BF03OQoAOmf4pJy+2dYCVS7GG2UEMOw86mb2ITlZegdKbflZosrq1MWWHq6Ia
	om/19g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579rusk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:40:30 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5954c5fbcc7so1022547e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 04:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782992430; x=1783597230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NIrrgt0h4u/XYVrX8w7YmBq4OVJYHoIKS3bZyeuiC5Y=;
        b=LPIGeg0DIv13GswevFsDKANMmAJYj4upQGWqozm2g93exkRh25Bs8jyIfv3jgAAwkJ
         fIx32ZfcyRi1yffvJB41MN9jO4Uqpp/S0wew9cRcxc1X7mkZ0chqQEsmWwDF3aIfTWa6
         OA3+pYbbO5tom76W6jAu8Wjy+lf9X9Hhp8i7A5BoGF1JOGkfWtSXb70dPBYkgQZKH1Gz
         IF1L6C9fU3ZYQJsmyx2BUaKhaJ1YjU0KyMTK5wm587MWfV1VonhaUO8BNU8+v6YwwlD0
         nXbulrQRJCF8KypqAB/Bj+2+40RsJAM8T7vXfFPEMng0cO/Pedor3emxAAW8k3b8HRco
         ldGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782992430; x=1783597230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NIrrgt0h4u/XYVrX8w7YmBq4OVJYHoIKS3bZyeuiC5Y=;
        b=SH9H5tOm8dJgn6+jZigGRIIPEdffsjWF0tSJAQR9FFEXxICoDnO2uVumeBPfPjgaWa
         S4JUb8Ezj/ljw1K+lmDoX8oMzhcX/Hsa7RirQZ+XMZXK9/nkQFeieCffjfd3PPINXlZs
         aJCyNMVorPWLJFrXVRMpXPKwUUxA2ZMXhIxXWIWcTd/thnWGksK4rmdwWlCMY4luGI2f
         7JgyyxkM2JUJfqDohf2kVGNAPj5z5yfRkNOo+A6MqLciyI4u8FMyndMni6HzYpDtFo2A
         mUa17goXzzJTrC/tYOl6xp732/zdtyX7mrAzyQZJGyXEdHiJx9G+L8WSH+ccG0l5Vm+U
         oTaA==
X-Gm-Message-State: AOJu0Yx+I2/LwJtzXhBsBIcsIH1OKIV3pBMsiHnZK7jGbAVZ5IBaX1J/
	SL0veSSfRlgcQEavr7wZps6dhAI3UKKIqlhlEsyQXpcYT1W8HqbSMQGmoi4zvgEfxmT67C62fXA
	27rrM04abqhfvFGZ8Sxk8761nKLSRPgnidIeqvKojeXfUVOkbSNLX87cjzQpmbbTtElA6
X-Gm-Gg: AfdE7clOV0cxzv/5e6RUypwpH/mrvYfF0oON1lhICP1+oUaG75irCP81Onc0AqySUyb
	ikkkneCctD74ObkZW1VMWvupE5Tm0bYfLaSkOsN2I0WhuNvovdc3wWGs6sb959SKsxLrJG28qtS
	9/l33A42oQe7QfsDcV9uJh8iWJ1ZLtsjMGDtHsY1LCKrs31TZ0Huhem6N4Tiox4ZTHxc7QZOoTh
	y8dXsK9+vqEEhgLGXGgFk/gzEI7CgMjNkEdngisBKhC3moUClHg02H5Oo+fAm1jd0iF7FqxJ7us
	PeAFMAyaMwu7n4i//g8cWAJblYvPsvosnMzpd6dITY0Zq+2mY928uQKlETfuEr6RpZuH/sm1Fnu
	Z32hRrlTEZT+QVaFbcS8d4npTxcRBV91rkdWCxSVfpJHTaJv82PZMGJQA5DKfHsnOwTyYGu50in
	M9y8tbxbjsrezwj9P6zyGz1eTS
X-Received: by 2002:a05:6122:310b:b0:5bb:d01d:451 with SMTP id 71dfb90a1353d-5bddf66ed8emr2090818e0c.10.1782992429571;
        Thu, 02 Jul 2026 04:40:29 -0700 (PDT)
X-Received: by 2002:a05:6122:310b:b0:5bb:d01d:451 with SMTP id 71dfb90a1353d-5bddf66ed8emr2090806e0c.10.1782992429020;
        Thu, 02 Jul 2026 04:40:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec8991affsm626240e87.13.2026.07.02.04.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 04:40:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 14:40:25 +0300
Subject: [PATCH 1/2] phy: qcom-qusb2: don't unrelated bits if autoresume is
 not used
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix-qusb2-v1-1-b5cf55621524@oss.qualcomm.com>
References: <20260702-fix-qusb2-v1-0-b5cf55621524@oss.qualcomm.com>
In-Reply-To: <20260702-fix-qusb2-v1-0-b5cf55621524@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1932;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ECwyXGLyiKahd7C8k8+zQNRe/N/N8D3moPR8+kwZ4+U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqRk4pLMS8rCk2CpbTu78M9dn+SXUk/73cb4qR8
 85AfNYAsmyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCakZOKQAKCRCLPIo+Aiko
 1QGsB/9BoakvHIdg29X089W/XXcy9aLwJ6sU6xehzCAkcf9smnZrXiOp41KRQuTWXEzEmWXUwe6
 RkiCbNfrshQbGxM/zVf8zslehqxkZMtydsw9qdMcVRtlq8Nb/fU3RorNhHMVRIb0CDQArcFSoLF
 R3KbrAOWEZOFqLZW5ttCmZg2/Thl+iOb3i3al8WUiS6ca1NA8sx5TNzc1zcdTNolAOMjDKWEU/w
 hpGlnruSHQLzlhsz6w9QXQW1P+ShHLc5YeW5JHp2Ap93m5jLCQOIFL4+wJ9qDxisRo6940sLNzg
 al+6xINox1dcY2ydcwydU5kX64rsYBSGshviwKW9sAztoid1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMSBTYWx0ZWRfX62LrSIbVgutS
 zjvQFsZnPyl5wtKSyi7K1WhOyYv4l5CELQBvN0bBKmMoCM2mLW9D9njwQ6jTjd/J4vdmecqeWPe
 tUlUWQ89J6G1H3yz8J+KnGBcxuS22AKuABePAL9p6/1kwCiZJaDzbzbaz1VHHYAlpxm6ozW/MUd
 YeSA8kfz8v3cch4KhiigcbgouRhjRjuplcCiLpANWEdjOZJX+jyIHETIQd2psu1w7GoWNJgzA3C
 sHOIlrkRFyxNPgIb218umuf1o8XNGY8Jw1sQ07hR204fKJVLcUC/U+ZN0w0siDJv1nvvKyPDTR/
 yMcN6sUObqoa0PrKgsW0fcEq1G6ZutkhwSN1ZjxjR+SBVql3cxTfkcFLzn1ASvC7wnvVCLh+d7q
 1yA+qHn46p33xZWQ38taIlwfgTvl5tyrk/9DciilcwuxSFyfXGAwuZr+oF/WJt0SY1jeZX0j4ZO
 ycdOlQpAlHBMbUbbcCQ==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a464e2e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=FT4fCJ2990P9gJUHT4wA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: IgGnkz3M0783oy_rGg8pBNlDlpKwHjNZ
X-Proofpoint-ORIG-GUID: IgGnkz3M0783oy_rGg8pBNlDlpKwHjNZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMSBTYWx0ZWRfX0KtLZtnJE02L
 fU9yEcxImiKsi7rXkoGTftrd06y6NrtLkHaow69d47Q5m1OLiE+gW4C6iPmrH8b6Xd9LpGfkIen
 OQ7Yypq272OoaafUA/sdPMPeklrYJHc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115971-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D0156F6DB1

The IPQ6018 and QCS615 platforms don't need to toggle the autoresume
bit. However the driver ended up toggling a completely unrelated bit
(BIT 0 in the TEST1 register) instead of skipping the autoresume bit
programmign at all.

Update those two platforms to specify 0 mask for the autoresume_en and
skip programming if the mask is 0.

Fixes: 2cfbe6765b7a ("phy: qcom-qusb2: add QUSB2 support for IPQ6018")
Fixes: 8adbf20e0502 ("phy: qcom-qusb2: Add support for QCS615")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index eb93015be841..1109c480843e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -341,7 +341,7 @@ static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
 	.disable_ctrl   = POWER_DOWN,
 	.mask_core_ready = PLL_LOCKED,
 	/* autoresume not used */
-	.autoresume_en   = BIT(0),
+	.autoresume_en   = 0,
 };
 
 static const struct qusb2_phy_cfg qcs615_phy_cfg = {
@@ -352,7 +352,7 @@ static const struct qusb2_phy_cfg qcs615_phy_cfg = {
 	.disable_ctrl   = (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
 	/* autoresume not used */
-	.autoresume_en   = BIT(0),
+	.autoresume_en   = 0,
 };
 
 static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {
@@ -677,7 +677,7 @@ static int __maybe_unused qusb2_phy_runtime_suspend(struct device *dev)
 	}
 
 	/* enable phy auto-resume only if device is connected on bus */
-	if (qphy->mode != PHY_MODE_INVALID) {
+	if (qphy->mode != PHY_MODE_INVALID && cfg->autoresume_en) {
 		qusb2_setbits(qphy->base, cfg->regs[QUSB2PHY_PORT_TEST1],
 			      cfg->autoresume_en);
 		/* Autoresume bit has to be toggled in order to enable it */

-- 
2.47.3


