Return-Path: <linux-arm-msm+bounces-92318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EUMHzvuiWn4EQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:24:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F6511034F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7F92300D315
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 14:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043BD37AA78;
	Mon,  9 Feb 2026 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSt0fA11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgT4Byll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B4737997D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647095; cv=none; b=ZpgendX1DmIC7ZlFartp+GMC1E5bIXzHhoJFUi0J1FVC05zWSYLZ9zLzKVEocMSUnKHFeWd0BbiGrEwyQTo5qH9kRagQr6rngh4PynYgziTeKiWT0ZSSe1UgSdoSPHJOPOAMsaf5spKyaJ8NusufNqCSX8dRWc3evjckhRyFTnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647095; c=relaxed/simple;
	bh=aSeuZvg9YWqekhKFo6ft9TwwRmbebmq5nYdvyjxxwV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UjarLA0JSMHqavyjJ3UW45iG1z9gTp/1bReva4gsxzQaA5A3tO3jbFl038GmP+wwVzQ/ib5FoDWSfaOHj97Ca7piydXdnbZR18wTK1XIautE/XNUETw5Kqk2SLcZYDe/nZF5aw0FxaoCc8zSagfjZniYIiHM/xLUaBzh3kNJCwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSt0fA11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgT4Byll; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619BuGi83252630
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 14:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jZDoWCD5ogpVapP8awsgfluVPPIgcNUhPJZ
	WtTC6528=; b=bSt0fA11UqBntolY6wxzZzgxmLjORaYWVvOnq2hr7i5NqVS+msc
	yUTMj1ZAshw95Ciq/6G29zdII0tzFwJcPVKv5skC5EqBbTQjNf5jSawOglfx/vR6
	HiQ3xXDvPgfYqtxosDOJ3k3lSTHJ45VLhCcdIHNPpwOPsLOwDkzmhiWZ1QveBbZL
	upM+m0jciwCrHFOAXTS3FHLEdO0HEm/C4qMH0+v5HheDd2mlX2rDhfNAqM3dWENL
	3Syd1Hs4KfT26LKfa/3VieZFRujc6vUjpeXUEsg4MlTIBk8ePYjjgDcCLlV8FAEG
	NhJegM3qlvdYcDKvKPwNI1A54E96D9K50tw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79f69sfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 14:24:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5e166fb75so1399286785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 06:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770647094; x=1771251894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jZDoWCD5ogpVapP8awsgfluVPPIgcNUhPJZWtTC6528=;
        b=ZgT4Byllvy71njnwE48WHQ7tSFA7XNmb3HtxHUmBCUt6cU0Otq1HZY1pLDnqIdPIae
         7hlsJuicfEPLebqMbceo5PXE8yrekKCJo2xYTLdRwawxKQV09JEbH+wDzLzsx/t+JypK
         FdhDWYym1BaFgwAeckK3bRR5gMICaCGMiisSxumCWFYMEpL0mw7A3W+0mXLITumuMNvC
         EU2qPvT7UGyEdxOOQTvKzyzTVlUR16rGLYKLbOLuDUcE0Ezex9hMfC1EpcuIhyFBqsoC
         5OP8dCjx2mSX1yVCPGT/1bLVTX/mm5tyjf1J/4SgtpbvX2O6QQSfz1jwAEStb2VIFk4i
         Dtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770647094; x=1771251894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZDoWCD5ogpVapP8awsgfluVPPIgcNUhPJZWtTC6528=;
        b=AuF2YQK7eRLCxkFw92vzIBjzsU6VLInLIbV9jbwMfy4voSOxg1U5tiUIJvXuEAwNQz
         vps94BJcawzrktLe5pD/dT3l+14nrCWRa0Rz2rL+aV+iHg56VII88zgbrWUxus6UQZQJ
         lmdKZ3u/J96uXD1TE2jklQ1zniJToZ/yllQZmEHElOP0nn3jn+A9TjbcJy/RCO9glPOj
         qsX3NHXC1OHqYL61ib4mBctRTHrSoeJB87bAJDspoDhlHczb9d+zBoRT9JKucnXWGU0h
         Pr1aEI01Jst0ZZu3lJxxInw3ETPk7JcAddnZQrBtysQ/MjPARYzPRTcdbCH+pS/zmQOu
         zuyA==
X-Gm-Message-State: AOJu0YwfkWdgruJGnOLsGx5KATUlhk8oGoCvhEk1EfiHeXTvSwsNAtA9
	k6NRlYvtkJV8uAJTIQspK7cWtTdGw201KZ0rXEupMWspaCr6UHFcI2TYUW/GaZja+CiyGZVYiKq
	CSCJhLWMl9Mnbil3zKtoX1Qd3e0aWmNM55gNz4Ol/hVaRU8IBTiCm5AwPRAj2zHpk/pEW
X-Gm-Gg: AZuq6aLeYRC2uyZBZNnGGFHa2oovUhTm3nRYmYC5rq+hAvU/jyEt4Yw0Pnmm7UStjym
	0RPiaOLuKxAmiSepL62hLP+a+OR4OEiQREAmnO44ZHnHd6L/AjHXnFMWX7ScM0kryaTaad1CFut
	8F0zXDmVVNo7bAQl/TIaG/QC3ier+KOMOh1e6V2sc/QGqnIRAw5tRMpNxWdzlRmXon5zbo2HLFf
	jVg0lhXkJa/dARv8z9GXVme2rXKQd2rSkeiiu42JD3yR4N0Z+6qKGSYcUXreecrEBm942qZlMeu
	+dH9AUPS9OoPzHaRCN8th8dKdoif6gZe2P+H1jOktzivxFcVbhw2iL/mxvvQ9crNzbeQiVtjoVm
	r/ZaeNlMtt9/m0kB80hoB2pdfXzH6i7ucuQpJOwBHnVJ7EW4b+nLeZy0=
X-Received: by 2002:a05:620a:1790:b0:8c7:b0d:df23 with SMTP id af79cd13be357-8caf1db65a1mr1568473485a.79.1770647093994;
        Mon, 09 Feb 2026 06:24:53 -0800 (PST)
X-Received: by 2002:a05:620a:1790:b0:8c7:b0d:df23 with SMTP id af79cd13be357-8caf1db65a1mr1568468185a.79.1770647093535;
        Mon, 09 Feb 2026 06:24:53 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm28296634f8f.28.2026.02.09.06.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:24:53 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: arduino-imola: add support for sound
Date: Mon,  9 Feb 2026 14:24:24 +0000
Message-ID: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zSrEr_BDAyAleUSft2xyIzNNjdJ0DSDT
X-Proofpoint-ORIG-GUID: zSrEr_BDAyAleUSft2xyIzNNjdJ0DSDT
X-Authority-Analysis: v=2.4 cv=W581lBWk c=1 sm=1 tr=0 ts=6989ee37 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=qC_FGOx9AAAA:8
 a=Z4lo2LbhZw9Xzx777ooA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExOSBTYWx0ZWRfX8USFMvmjGNJ8
 l7ucCdJdImgn/AGzPEumj5V67Vwl7PYtwlQlqu88c9ahD9En58G/oDe5hPQtWJI0zJN0WkkD4qH
 LQkTbWzvgViRK9dk0eC2wyed5vdkMhLn2LmrZppLlsJeBPRDm21++oaL4ShDkNlrCqQ2KiBTyh1
 zdV+4pQjTC/Ki7kAtYPqzcKwK1fXM+dOxK0R6tEGbds37sps+bb+H/jljTvl/yAz7TtMmVuBivT
 WnBAhuiOLS74ym4IKIy7y5p1TaplUaYj3vmnXrO3z2tG5kZ8OqS0m258voBaCuldWcjOyTpmTAo
 LeVPb6aF9n7DF5ucf3w6ycdfC4w6eeWLD4uv8Xw6QYbvgUBGTA3RbS3Z4uMzgQBc5oyQ4LowfgC
 QKNGCMQxGuXeZ/+ahnF99d6q5cStVb4KMdhHYmoBjXEv1I3uj35dB12O2xqAJQi0fSD0wl2I4kO
 QgrqyCSeF67M44MOLqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92318-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D3F6511034F
X-Rspamd-Action: no action

This patchset adds support for audio on Arduino-Imola platform which is
based on Agatti SoC. As part of series a some of the patches worked by
Alexey are reworked and sent as per previous comments, mainly on the
dt-bindings part.

Other base soc level dtsi change is picked up from 
https://git.codelinaro.org/alexey.klimov/linux_next_tracking/-/commits/rb1_audio_wip_v3?ref_type=HEADS

Along with these changes, add sound nodes for the Imola alongi with
defconfig changes.

It made more sense to carry the previously sent v5 version of dt-bindings
patch into this series as the dts changes have dependency on this
binding change. If this is not okay, am happy to send the dt-bindings patch
seperately.

thanks,
Srini
 
Alexey Klimov (2):
  dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4124-codec
  arm64: dts: qcom: agatti: add LPASS devices

Srinivas Kandagatla (2):
  arm64: dts: arduino-imola: add support for sound
  arm64: defconfig: Enable Agatti audio drivers

 .../bindings/mfd/qcom,spmi-pmic.yaml          |   6 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi          | 189 ++++++++++++++++++
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 137 +++++++++++++
 arch/arm64/configs/defconfig                  |   2 +
 4 files changed, 333 insertions(+), 1 deletion(-)

-- 
2.47.3


