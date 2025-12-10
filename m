Return-Path: <linux-arm-msm+bounces-84880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF07CCB2200
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 07:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A74153140469
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 06:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F6023EA95;
	Wed, 10 Dec 2025 06:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6l1ABGL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0No044d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050EF27703A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765349558; cv=none; b=HI+uXSgbFO4eZy4OhEsc/5orsn0jsH44WzZ6S09W6xr5x/z/QiwnWgC+iKzW54LhWXuPNGS79vWdHy5+0Uf4gYQGSXXdk1Fee577VMIPtsX2RLgi9NvAXgi50054GUAUYHyQ9jMpOQj7BYMa/f4QQOnY8CuBWA/dtKQSVKsc1o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765349558; c=relaxed/simple;
	bh=KpKDXoemsveBuX/STj6AV8aHp/CuCY5D2sBI6JNWvuI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nhfZiTPH2+Wsc+nGb/OUuofCUYc954bGIf5+PB+T9SSRZliPUtHaRFjV3wYTb0CScRhwhL3xDQdvLnMuVdexCNbvcwjI/5sDCxYggQ0Ve4gfuRuCErdSoaIfSSBbtMqquQuvaDa2m3yN7ktfeqWyGDmD8DIBV52TgfevhEvClOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6l1ABGL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0No044d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6Dc7i1598096
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/guRiMdRuAu5Z+FMmb/rp9vrrBjPh8cAJTF
	k719b7NQ=; b=Q6l1ABGLddUBWDYiQK+uE5EvgNGFZgZm9beQ9+OzpGC87SycSUc
	c40DgI1JaGVnz9AlVI0M/SzCFsnWZmLwoHqUQ6fWq56T0tSR3BvpoaYRJuqMctD/
	9v8CJ4dXM8sExJvNXPhpiuDBih/yCzTvFZDuXtsQumVha3zM3Ut4lyHBwRyl5NgM
	CUd/0zmGUa9aXRjoR+K4oCt9mquVDGSnAkDFc9bJdsC68NUe211ndKkZ/XyRcmf6
	t2SpPEPOHrNB058//MvtGW0nbguf7kKw8bq0qZJaa1/2ewVJOj3AGZGC9fx3gkl3
	1d2sf/4F5NycL38qghftu2tBctnwvtqEADA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp0b9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:52:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29ea258c1d8so34560795ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 22:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765349555; x=1765954355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/guRiMdRuAu5Z+FMmb/rp9vrrBjPh8cAJTFk719b7NQ=;
        b=Z0No044dpA8dUTc+ckD7Tu3kn/RDxtHIvaJFw/BwtTb7ObMtw0WRZC61MTIH4qSzGD
         TBY/oEbzUiKcXD3pznXcZRg6lgMzCegiSF38fp5xkZCqLc8LsDnSrcsEHTCJrOejTJhh
         ZqJp4CoctUUkq5FcGa1P1/L8JJvaCvuKbPrI5xi1X44C3M3yJKPRo+QPLX2KF0CREO6A
         OCWjowsS2THerP8liceKdWkwth8FrL6N0eFqcRxhnDDFhtz83iZ+6Ee+21Yu/Zf8qPlE
         0fpVlCaCEz8weYLe86/Hjl8ZtGKpG0KH0eTy3W1HLEh16rXWsWtyK6t6ITHm9s5mYSNh
         qM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765349555; x=1765954355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/guRiMdRuAu5Z+FMmb/rp9vrrBjPh8cAJTFk719b7NQ=;
        b=g6S+OX8gTcPMlD/D5QAAJiwp97FFv1CPUlsqht/swDFTrFNKq9x48W0AwwO4YvjCKQ
         IPlaVRiq2iSnFtS3Pbas+fQIb58Wu+NMODrnXLXkB02VwGU2W1JEiYxlgKLqzHsRekz7
         4pucnMFqKBiiEQnzmC772dGu2uOe+HbMFpCUISxDJ3iIt6O3pvmWBxx4IzgbZNReUxAw
         DUZKHfiCypkTI/khtqAPkToqC7XQ2FFmtzPZPAOZluUHubNWsVNINtvbtou8PFCNER5+
         CQTJObRmZt06InOmKz3AoML3VS31hXV+cYgIC2FoJA8LAlAtv0pDD5LAwwlo+PlGQT06
         N0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVYAkSEcuDKqL2TCfUxgVjisMvfHIS2pr8vSdTCIS7rnz1YsrkZicXesj1IaNb7OYV35xtfWW85ZQfHdp7F@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb5szKLKxcnDWXzYuMqg9QoGc4Du+2MDROJiiNbyqHbktPGEnQ
	RltgiiM+gW/x9EeP8GB9oxIKw46xArev7KVY7XR4ZkSYx/ud5nR02Nc+imEYFUyPccIqjcHPcoA
	tapIrXU4xrTZy7fJnhZfcxBzX5/3e51ZVowgFAkxSz03O/vA43X4G0xPZIqovFpaGAAQT
X-Gm-Gg: AY/fxX6s0TuYdZhPAbmeLqElkriyZJDf8VPdOG/jpy5xDzapdFjKtzScebllaDoLOuy
	LQBa1SFkgE9YMjgAC/MOXSVDqvajq6HOp9qHQcKZishExsUEJvVujxn59Uv9PIoaa4Qx458Ik9P
	d2SdOipN1yOXdiXjf/ZvAb3cJIM41ywdZV3vzACZjgYY63zJKYTYlaHxIkYtwuVul11XzEiRfx0
	lR7jJShz1Mkyvv+R9TDd9rIOPEPfEsO77wQyPyeCCwXzatDijqw8SgPkBYb1AQ11DexJLSmMsYQ
	73TO9WgkuyoZI1XnvwHtXXYPj2FVTXi171YZ+VW9iyEYtmyr2WgfcIifn18quFNTpMoVAfxYEpl
	pxJ43k5S+l3tEjeaYQeE2EIHxnA8HEeGkTMU20T4=
X-Received: by 2002:a17:903:3508:b0:294:d953:6ff9 with SMTP id d9443c01a7336-29ec27d17f9mr13992575ad.47.1765349555530;
        Tue, 09 Dec 2025 22:52:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyFa3r0LjOGGGw6Zax0bfNyI4OFRdfM/ejz2rz21XatErfmeZxoIjj1Z9zeFJQ3CaAN/ssUg==
X-Received: by 2002:a17:903:3508:b0:294:d953:6ff9 with SMTP id d9443c01a7336-29ec27d17f9mr13992355ad.47.1765349555064;
        Tue, 09 Dec 2025 22:52:35 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeac7360sm171728205ad.81.2025.12.09.22.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 22:52:34 -0800 (PST)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 0/2] ASoC: qcom: q6dsp-lpass-ports: Expand sampling rate and PCM format constraints
Date: Wed, 10 Dec 2025 12:21:54 +0530
Message-Id: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA1OCBTYWx0ZWRfXxJGJ8hlVyIH+
 K7zfZWl1+wz4pOo6A0PZ2a8+1yaesS7vhI48iAlui07OIG/8zlnbHOEJysh+lcRbtjxlRsGKTPk
 AsOImzmYWAQzTEGyXQU191qT31pmuJptjhgGFGdYpvB6KcKutnRvYw1Hd0yHzfmMlk07SPOEG3G
 IRJaHZfG9mBgSPitNAEbliAQ2ZrvHCukU7XHfrtyfcim4Xhl+XncNMqCxTV3SeYXWTVuR8kIOwn
 oW8UXMwYffMUDGy9OFt4TaYr+f/RPRVvPWwYccq2hrsNBfQPSuj/RAURVlPkYatKM9f/nca5k0Q
 t40+45xZ2gt81txTUIzQxRZBSwixsitVIndxTK5MGW/4RCSuf9yp5caaw8h/zH8wj6rffQ+p/NU
 goqpv8nzRe7ZSI8ku/FYW35wg3cO3Q==
X-Proofpoint-ORIG-GUID: YKQamz5Broxc99EJDXtlHmymueMoK5dt
X-Proofpoint-GUID: YKQamz5Broxc99EJDXtlHmymueMoK5dt
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=693918b4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fYhDv7OwVwtdUCyixT8A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100058

This patch series expands the existing constraints in
the q6dsp-lpass-ports driver to improve compatibility
and flexibility for audio stream configurations. 

The first patch extends the supported sampling rates to cover a wider
range, from 8000 Hz to 192000 Hz, ensuring better compatibility with
diverse audio hardware and allowing more flexible audio stream setups.

The second patch adds support for the 32-bit PCM format
(SNDRV_PCM_FMTBIT_S32_LE) alongside the existing 16-bit
and 24-bit formats, enabling handling of high-resolution
audio streams and improving audio quality for supported hardware.

changes in [v2]:
	- Updated commit description as suggested by Mark Brown.
	- Link to V1 : https://lore.kernel.org/all/20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com/

Ravi Hothi (2):
  ASoC: qcom: q6dsp-lpass-ports: Extend q6dsp-lpass-ports driver to
    support additional sampling rates
  ASoC: qcom: q6dsp-lpass-ports: Update constraints to support 32-bit
    PCM format

 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 108 +++++++++++------------
 1 file changed, 52 insertions(+), 56 deletions(-)


base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
-- 
2.34.1


