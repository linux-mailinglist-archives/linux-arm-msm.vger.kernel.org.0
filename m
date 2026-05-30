Return-Path: <linux-arm-msm+bounces-110416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ0hLgMuG2pa/wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:35:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DE76120CD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D059730B6DD5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 18:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891D73D092D;
	Sat, 30 May 2026 18:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DE94gqAj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJ8RUfhU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3161D3C4143
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165735; cv=none; b=nbdo8EvJaTzhK5kaGdaunv933+7eLwMkZJi1XdEo0sC7UejRos/qDQtZwdbO6B0Hrz0+qhrwz4K8OLIGvLtzqXUZ0nrUzwCkNjhSfA5SvG9dV1qUIfjzHbP2BZdKzeX+/mTGYtRfZvffA1EgD9Ud+01iGag9y1MD/B2cf3hSPqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165735; c=relaxed/simple;
	bh=V7MkOBUR12odsi7KOXU5pkJkgmqrQKIHXeinc3zf9y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ERMxlFnWDPQ39KWYdCPibH1MyG464LRnEhMguI/cLSsJ2GqxCPiGW1JOLeDP5I6lJdwplPQEdNrvLtAYNQlbAbKaHOb75Uedx8GPlQs2//5OQnF23YblNhqxAq7zyiUg3cP4IgjNhmxJG9jU52jDru4xntwbn1Y6pNsoIl9CFV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DE94gqAj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJ8RUfhU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEOq3H211957
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vr8YiZpN0OyBIFNURSbGh0cFsGwvnUNEPGlUDKpGzd4=; b=DE94gqAjdThWcu18
	uGQjgcwkGcUpWtjQsZShmNYFrPfInk/deWmpZT87efslTPQqtUk2xQtgKrE+OocX
	uvMERBCB1OAxSNnf0K72rrrQI2UgHFILBs67J3YVpc3/Knq6d7jDOiibssIyRoNf
	/7LyggpuxRtdq2XSTq9IZ60hLh1LF7HP2Cbg3yvQKsf9b4UQGs5sNOJmGrSDq+wz
	sqZ517U7cK1lsu4opInACKC/6wMzvQIDUdXgEPzFManNjD8olSFAZhL3gUVnw+Ei
	1zURFR0VMVUwgAD97R8pZw4N+iepL6OsDRGiGMWgZCKfPMZcDOoQ8o7uDGRR28R+
	bmWYsQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efrnc9nmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2beb9002a00so78481915ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 11:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165733; x=1780770533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vr8YiZpN0OyBIFNURSbGh0cFsGwvnUNEPGlUDKpGzd4=;
        b=JJ8RUfhUhvPVZkZhp2KApR0KTyAU/Ud7OgGRZtwTgXp8/LtBr+SE10aMVrOpawg7Z+
         l4zoCEedMEK/x2lXB2mESRiFoYvSKh171E6GEbTJkGpSVJTnXo+PWo7oysiHWFQDtQjj
         suMByWZwk8w8vuUig4i6UfX7lz8XH86pBWsgMAIXNFVz8D0erCic3zMHPuuzYAf55Zlb
         3RjvZODfeGzBcWqOQx/I5BnEkBtBCCPKELU3FYTkcRhrKFPNpCVA86jn3/LPYwRTYzbm
         BgZu/1EAled/a7FD0N6GqGVaLcGUgaLnOxOGD8vaGFYT2RI9ypOnaeanrG2M7AJR2Xph
         Md+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165733; x=1780770533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vr8YiZpN0OyBIFNURSbGh0cFsGwvnUNEPGlUDKpGzd4=;
        b=MefTHBYatFTIMvYECz2Yvj+IFfbq06xkMIXp/xqy3U8RjNLhOyhLIfB3Mop33Jq8OT
         sis+Q3tVZJTBgSvhwfbP5Kqiqcdl6f4pmfIym9gKZbaMWglVb38mSgH2iasnHtw/fz1Q
         BMFb0h2lioCkkKsDSUg4GYq1uAK2ztBGB5Hks8keAn7a/owjxVjiko7iwphLPd62bKAe
         x5ltDx4iktUoQp32zC5Sk1iOtld1pwzAWUkDg8+JRxrCLO+kDYOhIlpVe4GUVh2ZuyTZ
         ENeObeo7obOT5zeG4szDYJA9Adu/SyVGuRu3atBZTjsE9Hds8K8sa3LgePArnrBE/BGK
         1qUQ==
X-Gm-Message-State: AOJu0YwFFwRDtm42tOboyqm6Ye416DR4dvz+yVIFnN+zZHwDYD7oAewv
	KTlvtO7QSvmBjG+zMATHrpjGhkGdjbSRXTAGzR+0MxyO7Nz1xnhz126FmnHUyjr3dOrWY5E+Osr
	+/CUL0rPm1t+sR2C2uwA/q3PE9j7FmQ7kcCve+4eYQBxZQwgP3csEpkx54iduwjsLp45A
X-Gm-Gg: Acq92OEfE3IcEULnN3rpnv9NqfmnaGwfq50815iQ0lEuDyp1Rf6IdAphMxt5jzgQuqm
	WA3OBplGNQ5OjTbQRE8TSW+elcxxzPdVZoHsb2CMEKMQTZirLOSJS5EpSKNrwVelM7ZtcphhQXg
	xhUwZ3UxPWN8WEH5or8+h2m3aW2s0B1gNP8VTOZqFgM+DVaoC2E6SdNtSMnl+Ilqa1Cx3tm1jql
	d8vsyyaH04d1p8yhYJetnzK0TJHWx8k+TiC8Q+3REc5yPw7GRpFfM8dWvjYiQIHIDopapBMA0Pe
	toNCelUftqJsN74drYr4xnx8m+BVy3+fHqaeh35x1VrjBqAVWrao1tj2yHK3vKFCqdLNCTOcjxJ
	Q1rV6RWO0oAChOov9tcyKzAbrYWuOQk2+9scXveAR8xgliqhwdGr9DJ+TgEXGNSOZqw==
X-Received: by 2002:a17:903:2305:b0:2ba:7881:948d with SMTP id d9443c01a7336-2bf367b214fmr52562115ad.1.1780165732922;
        Sat, 30 May 2026 11:28:52 -0700 (PDT)
X-Received: by 2002:a17:903:2305:b0:2ba:7881:948d with SMTP id d9443c01a7336-2bf367b214fmr52561815ad.1.1780165732323;
        Sat, 30 May 2026 11:28:52 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a27ee3sm56879635ad.36.2026.05.30.11.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:52 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:58:26 +0530
Subject: [PATCH v2 4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm
 platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-enable-spi-on-sa8255p-v2-4-17574601bd63@oss.qualcomm.com>
References: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
In-Reply-To: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165714; l=4685;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=V7MkOBUR12odsi7KOXU5pkJkgmqrQKIHXeinc3zf9y0=;
 b=M+M3zBWjkBIXobrL2H3UEToreY0uiKZokaUZ1qWF/yo59OKaz5ARh4oxes0oNLBXul8VkfRL1
 Z8HogbPVcshBlGFSRl3UCKFi0ftLZtoyOEfFO2hWoOJ9SKx7NGIoHtq
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: t0VJqsUCpGurVa-Z3kPPPUucxZGRIXag
X-Proofpoint-ORIG-GUID: t0VJqsUCpGurVa-Z3kPPPUucxZGRIXag
X-Authority-Analysis: v=2.4 cv=FcIHAp+6 c=1 sm=1 tr=0 ts=6a1b2c65 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pXSUDizEog3tsSCmG3cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfX4BvYyRSIqkmy
 LQliNGkvlSNopMMrCbu0FGS+Yupho9ni+rlBqIj/caMpkFPsks370NnmgAD6bXXaq9wsxnumuls
 xdEl/iPNI5uJChKB//j8vXTFzw/H1ufnHHOzmrbYjl+zAgPd80wRPbbbUgEkkn3F7fz+aK7CNHn
 Jb1Dg1ik6eDzxMWv+LdxIMauhEAfpgzfBGDyE7Qdww7m1TZRkD602Xq8weapq9tnAP80/UfwJbw
 ZnFUd33T6RhxSiYK3iX1UBGHeBBzPZ20URlgfpcICTg++Kct2mnJ5NcpAgUi4vkeBkvlm6+hYwm
 2K5rthCL3z7/gE9LGredzzjETZiY/E5eiiGSRIXLDTetnoI5UxyTbYcZzdVkIEp9XDPyCvQBu1M
 EhdNAvSjWw/+NNE9ui+SJYpQahZLoh6cvO3XQrUqeTXcurppyU4yYSTw3LK0A+9jtXnnX+pZSvo
 VM56EIDuIHtnuNFesOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110416-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70DE76120CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages SPI frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate.

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 7696412c6e87..98e34e58fae2 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -78,6 +78,13 @@
 #define GSI_CPHA		BIT(4)
 #define GSI_CPOL		BIT(5)
 
+struct geni_spi_desc {
+	int (*resources_init)(struct geni_se *se);
+	int (*set_rate)(struct geni_se *se, unsigned long clk_freq);
+	int (*power_on)(struct geni_se *se);
+	int (*power_off)(struct geni_se *se);
+};
+
 struct spi_geni_master {
 	struct geni_se se;
 	struct device *dev;
@@ -105,6 +112,7 @@ struct spi_geni_master {
 	struct dma_chan *tx;
 	struct dma_chan *rx;
 	int cur_xfer_mode;
+	const struct geni_spi_desc *dev_data;
 };
 
 static void spi_slv_setup(struct spi_geni_master *mas)
@@ -305,11 +313,12 @@ static void spi_setup_word_len(struct spi_geni_master *mas, u16 mode,
 	writel(word_len, se->base + SE_SPI_WORD_LEN);
 }
 
-static int geni_spi_set_clock_and_bw(struct spi_geni_master *mas,
-					unsigned long clk_hz)
+static int geni_spi_set_clock_and_bw(struct geni_se *se,
+				     unsigned long clk_hz)
 {
+	struct spi_controller *spi = dev_get_drvdata(se->dev);
+	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	u32 clk_sel, m_clk_cfg, idx, div;
-	struct geni_se *se = &mas->se;
 	int ret;
 
 	if (clk_hz == mas->cur_speed_hz)
@@ -820,7 +829,7 @@ static int setup_se_xfer(struct spi_transfer *xfer,
 	}
 
 	/* Speed and bits per word can be overridden per transfer */
-	ret = geni_spi_set_clock_and_bw(mas, xfer->speed_hz);
+	ret = mas->dev_data->set_rate(&mas->se, xfer->speed_hz);
 	if (ret)
 		return ret;
 
@@ -1064,7 +1073,9 @@ static int spi_geni_probe(struct platform_device *pdev)
 	mas->se.wrapper = dev_get_drvdata(dev->parent);
 	mas->se.base = base;
 
-	ret = geni_se_resources_init(&mas->se);
+	mas->dev_data = device_get_match_data(&pdev->dev);
+
+	ret = mas->dev_data->resources_init(&mas->se);
 	if (ret)
 		return ret;
 
@@ -1120,7 +1131,8 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 
-	return geni_se_resources_deactivate(&mas->se);
+	return mas->dev_data->power_off ?
+	       mas->dev_data->power_off(&mas->se) : 0;
 }
 
 static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
@@ -1128,7 +1140,8 @@ static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 
-	return geni_se_resources_activate(&mas->se);
+	return mas->dev_data->power_on ?
+	       mas->dev_data->power_on(&mas->se) : 0;
 }
 
 static int __maybe_unused spi_geni_suspend(struct device *dev)
@@ -1169,8 +1182,21 @@ static const struct dev_pm_ops spi_geni_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(spi_geni_suspend, spi_geni_resume)
 };
 
+static const struct geni_spi_desc geni_spi = {
+	.resources_init = geni_se_resources_init,
+	.set_rate = geni_spi_set_clock_and_bw,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
+
+static const struct geni_spi_desc sa8255p_geni_spi = {
+	.resources_init = geni_se_domain_attach,
+	.set_rate = geni_se_set_perf_opp,
+};
+
 static const struct of_device_id spi_geni_dt_match[] = {
-	{ .compatible = "qcom,geni-spi" },
+	{ .compatible = "qcom,geni-spi", .data = &geni_spi },
+	{ .compatible = "qcom,sa8255p-geni-spi", .data = &sa8255p_geni_spi },
 	{}
 };
 MODULE_DEVICE_TABLE(of, spi_geni_dt_match);

-- 
2.34.1


