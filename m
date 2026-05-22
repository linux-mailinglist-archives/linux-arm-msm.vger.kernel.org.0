Return-Path: <linux-arm-msm+bounces-109427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK57OszAEGoSdQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:47:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 537975BA2F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F39DD300E73D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 20:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EFE25B09E;
	Fri, 22 May 2026 20:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XsMyDPUo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MEL3vxrR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F552DAFBD
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 20:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779482824; cv=none; b=k4P0HeKjZobXWzMSwhp1sHeooTqQTodprBlG9ZByvsPRuHDbg+DHPAiYl/GENmnWKxrcwZ9ucYUTQ/GRFCejn2/WH0uP+BKbggOTfeOzu8dP9f0bdvqZrzhGDk4x9g4dqCrlHbehHM/e2spAcnsumNC2HpHT9dptifnxNE6SYVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779482824; c=relaxed/simple;
	bh=MbS6RLpx3KDiAX5WnKfxswsxlvVW3eCJNiioBJvkHtI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lQoRO4xOC6is2kJv7bmJ9oNCBuIO9WlPFv9lJS6HD/Mr2ooNUmEAcIIOVElC65KNcAlcincEHc829zvnizn9i9Ne9Ti6AlOVszKOPOEHFYzHc1dueSRM4MQNfLSaAtrfUyDSSpU6J5dKMcYeZ3XPAutSu1D6z7AUsKhV40wsEfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XsMyDPUo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MEL3vxrR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MKJWRr779483
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 20:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D/4MpsFUNDVSM17/5mxaQxeVZemrCTfgp99
	HMD+OZtU=; b=XsMyDPUodfLIdouuZbaNSbtGyCbppe50WopgNw18Okjl7BeRQ25
	oa7yI4B0sWTzd8QJE4TEfhTkQntFs4VkDbWPKCV824cGTWZwRnqHibu6FxCRR3NP
	jZOl7dRjEg5SDeI1G1lYv19+ZeBKQ5fnHUs/A2fq25m158pfShBezN7HMAxTp9qY
	f+GaaI6W1aVUKDeRnleHjHY1iWMHK+uicSIHg+xIbVXXrEy1yZJPSl1RKIpXxaZv
	t8sabjMLxhd+/M0a7NAIX65TJKWMDJV+TC3jquQCFq9zoq4K1DqM/y6KvX9Ggc2M
	Je3C3wMYlErZ+eVguEhdUEpOWtFe7VtoDcQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7avj42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 20:47:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso15561790a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779482820; x=1780087620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D/4MpsFUNDVSM17/5mxaQxeVZemrCTfgp99HMD+OZtU=;
        b=MEL3vxrRmlOW5LbAPbuJDelt8nvLMtWS1gS8/czwxJEtdTBxWWujqlhqtWzIAU5OdW
         zmJ777TIcYZPktbQXSYd1c7V8Df9AVKEahgS0K8UorScSkBx9NDNqO2TbvyiT97MjRJG
         5q7ZJbuw1XxGFdRvLOqExbXFAynLZu8u3xaOBGhk7JpO1k58kcGhYYJZ3IqNxwzDFD6s
         wVo/8RC/XKdNzE6istCYB91TVz9UL8HNk/eEdCfycE9J25ADbxD048+cYDLuGt+O7W0g
         LfmkyjHqxfgayngw2PfF14LcI9JaGM64zlKfDsN45Y37eKxQkBDTrJJ6CHHUX1KXIxch
         4WEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779482820; x=1780087620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/4MpsFUNDVSM17/5mxaQxeVZemrCTfgp99HMD+OZtU=;
        b=McLxFU6vxj+biHrybEtbKbsz4xDMZJ1rz4fOVhJoGsX09bapstXphbVlDxLZlSmR7c
         uWkjA9vj9gKYjOqoKjVgE4Mr25IQPduJPatUn9LKXOutijQULoEvxTnLkuyDwskOGGnG
         bSTYmo+1N1FHLNhUJg4b2NJizE9mojXNyKJY9h2WodfG1YbS/9EUC4mIhp8+4aPMAl4c
         G5BP6XvkchQA66EeQ+J0aj2dK8ftCDoj507R7XumwdkLFstiM1DF969vfI33SuGG6saj
         SEjMko5IAVNwkN9ORB2h8Sqf09tL2UPGfBX1hlB5ZEkEOZIBadLHM9NNJrYsPwCIYfNc
         gtfw==
X-Gm-Message-State: AOJu0YwkyzroKcnv1gRiXkJXqPup2ftDy3suyxHB2JdyrlUjZ6DBhV7Y
	tbYErB6yCLR2g1gQVOxEMWj7Q0DctxgHpxhlBfm9QsSqAgzEJp2LXPSfLyIkhM3uGTpIuVJkOmS
	N4SLM/BiusUPsx2aJoKmEKP/m5srILvhmyhXwRDDus3SZ/qQ1qIr2NLNWa7byRo1sje5D
X-Gm-Gg: Acq92OHYVrlvfHvdaXi1/VM27NGgL0FX5OMOVC/1bpYZw/pI8xjY8AVd+L7aSh4QcdL
	q/TrPzTyQ1srJgW16ATQt1JTEAK+IisLIG7tdMMY/RdEvGI2Iq7atjujsIHCrqP0rYoGDHZD3GE
	0tQt09ylQQsOioO/Vw7h2dN9w/03JxRNBt4JDVIGjVgFEieULbHP+h7VeYhhrFVrKRwLPp3dx/Q
	dwPi0Be1OFJVi7av92gibZ4UdOLa6vB2c2ULyAN0JVYrLL6rinfj7sFlGo2XssxMV1NZxkATn3l
	SGptYVXBx/3lnAJEjH/4jMnhaAf/FSrOHJ3Rrc+RoyiPicb+gKwcDa7ix3rjOFr4B88yJIMu8/a
	RpF3gBfpQ0FuinlR3AWGFPgzKuOV6XnpktVg6VBML8cWXvI/FFw==
X-Received: by 2002:a17:90a:dfc4:b0:366:19da:832f with SMTP id 98e67ed59e1d1-36a674e9e97mr4617125a91.17.1779482820359;
        Fri, 22 May 2026 13:47:00 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc4:b0:366:19da:832f with SMTP id 98e67ed59e1d1-36a674e9e97mr4617106a91.17.1779482819863;
        Fri, 22 May 2026 13:46:59 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7263179bsm2720956a91.1.2026.05.22.13.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:46:59 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v6 RESEND 0/2] pinctrl: qcom: lpass-lpi: Switch to PM clock framework
Date: Sat, 23 May 2026 02:16:42 +0530
Message-Id: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DtBL_txM6lU4Pqlmk1x2K0vEYp5q3G-2
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a10c0c5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=AVCyWFV1gjYqDRSFLWIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: DtBL_txM6lU4Pqlmk1x2K0vEYp5q3G-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDIwNyBTYWx0ZWRfX7+gaacSR6+SN
 9cG7BswTEdcXaaoHO1mDrsBgOcjjWoE6NtPkXp2RlBEPukgSaWfiJlyt/lGsIwlxZbZUE0/ovum
 r7DSJ4cbM7Qfj6XhQPSQFmaBmneutCbLFPy0dlH1MzrNB7/Y6bcmfEeCEBKiSkMuMoqllUeClwm
 8qH5V/sD6WAlnhKAKz8O6GL/bWaN9xaDmzuNV/llluNMo8HCbf37H/8bImUsR8rtsy2OGsB8CsD
 d1x55k/nDew8alO1TOJTYbvO9szD8H3LGNYWZoe6jht1kixeqIIKwyydfVza+D0rmaMNars7WGV
 tFtl6Udk7BTKJ+1Kky+rtICRK7JNyyyI+KuWvFvDt6dwMmQBYoMN0Rol9Bn1Rov1XCN1vcCqnIK
 Lzq9iDHzqJlZut8495+VleALc8m547SP8SvM9kWS7HAS6fQ8cESOqr8Ptg55xNKnVS2OT0W2r8g
 MqGvBz3+NFl6NKpf/eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220207
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109427-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 537975BA2F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series converts LPASS LPI pinctrl runtime clock handling to the PM
clock framework and ensures GPIO register accesses runtime-resume the
block before MMIO.

The series is intentionally ordered for bisect safety:
- patch 1 wires runtime PM ops in LPASS LPI variant drivers
- patch 2 updates the shared core to use pm_clk + runtime PM guarded
  register access paths and adds the PM_CLK Kconfig dependency

After this conversion, LPASS LPI variants sharing the common core use a
consistent DT clock flow via of_pm_clk_add_clks() together with
pm_clk_suspend()/pm_clk_resume() and autosuspend.

Testing:
- Runtime behavior validated on Kodiak (sc7280).
- Wider runtime testing on other LPASS LPI variants is welcome.

Link: https://lore.kernel.org/r/20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com

Resend only: previous post was mistakenly sent as an inline reply; no
code changes.

Changes since v5:
- Rebased to current linux-next and refreshed the shared-core conversion
  patch to apply cleanly on top of latest LPASS LPI mux-path updates
- Include SM6350 in the preparatory LPASS LPI per-SoC runtime PM hook
  wiring set so all in-tree LPASS LPI variants are covered
- Keep PM_CLK dependency under PINCTRL_LPASS_LPI where shared core PM
  clock APIs are introduced

Ajay Kumar Nandam (2):
  pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on LPASS LPI SoCs
  pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM

 drivers/pinctrl/qcom/Kconfig                  |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 144 ++++++++++++------
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |   7 +
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  19 ++-
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c |  15 +-
 .../pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |   7 +
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |   7 +
 .../pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |   7 +
 .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |   7 +
 .../pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c   |   7 +
 .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   |  15 +-
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   |  15 +-
 .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   |  15 +-
 .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   |  15 +-
 14 files changed, 209 insertions(+), 72 deletions(-)

-- 
2.34.1

