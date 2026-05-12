Return-Path: <linux-arm-msm+bounces-107039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALtZJx3FAmp7wQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:13:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C151AC56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 803E7300EC71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 06:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA3546AF20;
	Tue, 12 May 2026 06:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8qYTRa7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DigdfEWl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5F8477E4F
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566417; cv=none; b=RnJKeJUJ3n6w15msAe1VhqXbm356Kv1/D8xBUAFNmGOy/2OdKf9/2Q7YK46yRiHv+h8hjPFwIrSaLWFSFqUjT1ciQDn0mkFO2A/lKEDn2/98jsWToF72l28LwrFGSXGTCqJqcJdBFQVx4rfCaGnprk17x3TTgPpZam+c2PQIHqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566417; c=relaxed/simple;
	bh=4eHF3ynPQfpm7HcGL/RGQMnHGQvyXAHActKIK0UjYN8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EgFnl3UL9dZX9BuFLzzBHMZsjDk39nbpDdzImyM68/jCaiP1Ayb8Oe8XsBsBeCZzaGDlx5UUGenYFavqWhdxsW4HNOA7tDOpjDiLMMya8Vc8reeDwwhBr6uyEr1OS5mi9GZ8I3aZgImOdXhStvfER81LpmaCcL8CX9E0tZYrXSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8qYTRa7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DigdfEWl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5BdBu1183975
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=trz5LOcpB3IsEunOaMvecw
	HRhSnLAlbyBe156eD0qCY=; b=h8qYTRa75BIb8C2HP+prA8xM8Nb07Z1D1tULew
	iOie63IRAwbWXSUQ5OKQA2kEzOyLdI4Mj0yG3PFRsdlF6QkyrIGapkxxxqAbCxVV
	iDYIx2L78zpwiruhqkm3hBlZtu9hzWy4v1L8Jvlrnlns/3wHJ8TawcYjJO8i4CHk
	HvEU7Ej1qpZ9xA+GKJxIC38KYbe5rdn9TlvabDG9u0QH9RyOwTukOhcIIfFkOmnd
	79NaA0mXojfsnCtUDSOy0xbYIDDKAI+liBqRTQ5ZjAMAKm0akp0wKygaCZou+BbU
	oBPZzZzevyNat4By25WgI3dnl49OG/5F8iQfWyPOzyDOvixg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuy9rgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:13:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-368b0dc7731so343648a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 23:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778566398; x=1779171198; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=trz5LOcpB3IsEunOaMvecwHRhSnLAlbyBe156eD0qCY=;
        b=DigdfEWlpENn6vZWY0Mkd79vc+nya4WGGitJJ58tORl950Ic1xzYdq2e158bbakck2
         jYIrtZ5uxRt20CzCQWe34S5iUnr6rI4ubzkO3qDtjV75AcQV81ryIPcg4UuFTsKzm3FM
         ENOqCS3xk6AYyQseh631MFxdYgZhsLsVkB0kyKS4zEuoCWHDzGiBSlJ6lmSDN30Kwveh
         bOH1SVbw4rkW6msnVX4qJ6Vh6FLlfTq1LMwGb52sDjpCP1GAm2l+Q+O07MvscfjtM67s
         SjhMJcoNPD810TrfrMhzbA9OUoEsOE5aFbs5w4xILV438ic0tFzLJDEm2tKFakmqOtmE
         wioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778566398; x=1779171198;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trz5LOcpB3IsEunOaMvecwHRhSnLAlbyBe156eD0qCY=;
        b=E19II+jRdPjYnbRpaUW0t93Qj6pnKFQCUtDWyf8lYtAZmfwqQL5hdjYTNd4wiyqu+N
         wkHsM9gimAWx5/JcxyAkNBskYnNc5SmARD/gp0iMmB5nb+H5u9AOiepyuADxxXBlC+BX
         q2PmDPjKjbOYLosa20iQ3WYz9qDAuDdQfxMhN+jdotrikNQzOKqq4+GZj1WqTIOiTbLx
         BQPsUfXvy1/D6xrQoNvuGQ9PX2iSh81sBfX56kjA2foJbzRy7Fb/1T9/FmjQA/Vd2ZkW
         gbhqRrGe1X9+5iFx/4Ji0lQ9849iiN5HWYo9kf6WpjatSNz47GNymaO0c3cZEbTr6ZQd
         b19Q==
X-Forwarded-Encrypted: i=1; AFNElJ/SQQ6FBxU6gfnIYTsFI700uM2lpCOuWPO/CEOMGIdDGLEu4XeB9YYIuWj8jQ2BrFJrRce7CZ6JDMp8Fv1E@vger.kernel.org
X-Gm-Message-State: AOJu0Yws+8WFSSvaDGNcylcKVuCX8PN+RHyUtw1ZfmOX8Kni1IMtUs8+
	duuoO1SsCGDllZ+PpS1cgMBvHiQdko0RZ/U1TR3MzT0JIGDd4aThRu9LFc0whc/obSbw8jHpyjP
	PoSS3q3niU4YpH5zrtgp8i32zIJTqc6eqXpnqNM0gnHj1LW/LS1fjK2kvawvEW+hYY90X
X-Gm-Gg: Acq92OHw/lu/ZjZyl/wbMeO+5Ke2RA3O7aYPXWlqTnlJD4l5NE1Fp4BCyStPeCLiUY4
	OMlxdpfkspWmNEBipsy6DF5j2iPkTUe1BR4InU3mFzJiNTYni9aVHlec18QwhIqZ9+a776+kTqH
	cyem/dTywrgFy4wmpQjjyYtk3F7k8v/A4bnSMzyOGoe38/D7Ljy2p6eSJwWr2kU/J/NAO6h9gUE
	om7F91mD1RIeXcgL3mLVYkLGpxL1FO6yMO6j1nlupJj1DIBAl1ebU5v1ypWxxCi79E7JgFKS6Na
	gml+hLw2t6+XprjXhqQuqH6giDBB17FrY+0pWBMmPN0OCDqYmFHVHVgfLnOJXQP8yl+ec6F6tOf
	EEhmfQzXTdf+8aBx8rUwZS+srMWuqEHbmxqGDQT66LrHwXSeFeOKEEa0=
X-Received: by 2002:a17:90b:520d:b0:368:6998:b49d with SMTP id 98e67ed59e1d1-3686998bc21mr7059393a91.10.1778566397603;
        Mon, 11 May 2026 23:13:17 -0700 (PDT)
X-Received: by 2002:a17:90b:520d:b0:368:6998:b49d with SMTP id 98e67ed59e1d1-3686998bc21mr7059343a91.10.1778566396968;
        Mon, 11 May 2026 23:13:16 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b00d2131sm842518a91.1.2026.05.11.23.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 23:13:16 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add trace events for Qualcomm GENI SPI drivers
Date: Tue, 12 May 2026 11:42:51 +0530
Message-Id: <20260512-add-tracepoints-for-qcom-geni-spi-v2-0-3b184068ecf9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOPEAmoC/5WNQQqDMBBFryKz7kiSVqVd9R7FRUhGHaiJZqy0i
 Hdv6g26+fA+n/82EEpMArdig0QrC8eQwZwKcIMNPSH7zGCUqVWlarTe45KsoylyWAS7mHB2ccS
 eAqNMjHTWl6pxxtSNg/wzJer4fTgebeaBZYnpcyhX/Wv/eV81KnTXLOio0cbrexQp55d95tlY5
 oB23/cv2sgjLdkAAAA=
X-Change-ID: 20260506-add-tracepoints-for-qcom-geni-spi-e31457c2267c
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778566392; l=2423;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=4eHF3ynPQfpm7HcGL/RGQMnHGQvyXAHActKIK0UjYN8=;
 b=Z0cRG7eME1C0YRZ/9uUyk54mUdaX3e7DSlAFnjJzfNp8j4L61MFEhGPEjk4n1pls8v+oti6bl
 yk+G1l7eb5uDagzpqRO1tO43DJHqQtDKVRaDekW/sMh5Zg6CJ/zRhbI
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: K_8BDeRFZsdEq0yCdv9jogbkW-neUXtv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA1OCBTYWx0ZWRfX26jrf3884h79
 igWXP3FZju7CHGGxgMZcovjzLbV1umFuZNlUqVyN2l1mkAdAXHkjkfb6OGJ6PnW80G6POdlv+m/
 31Di46meVJg70aTbTeEpBMl/ao0kDQgTjTXpr75Snzf3Zs9vnQhHkWe5JD1vB7U6QFNRXqmjFpI
 ilhUhJ4VUjiZJf+wF75szJvv1NfDONTQoG1XQSd+nF276g8fk+G/RA5VX2+3lCOTw05BNeAeOuS
 2FS1zbySbWFqZ7FtOVAUz5Iofdbf27UwivkC+427CW2M5M6Zd6hQdmb9qKruXjIz6lOYaW2Oait
 KI4JAWUg9fOtvjjiCneVK8O0Akhrlv6W06rn4cfWCnUpp3kQjjAbxzDpBJrPEaLhMexnOgbIPAM
 yNPUhGlp69fnEnxapYbxfiWJ787LAK1VzkpkUfV/BR4eRv81+3sRr42B6whDGl2Sp2am75t1mSm
 2izVmawjabM/QTZGewA==
X-Authority-Analysis: v=2.4 cv=UZ5hjqSN c=1 sm=1 tr=0 ts=6a02c4fe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vdy0y8WXZQco5u0MrGUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: K_8BDeRFZsdEq0yCdv9jogbkW-neUXtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120058
X-Rspamd-Queue-Id: 9F9C151AC56
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107039-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add tracepoints to the Qualcomm GENI (Generic Interface) SPI driver.
These trace events enable runtime debugging and performance analysis
of SPI operations.

The trace events capture SPI clock configuration, FIFO parameters,
transfer details, interrupt status.

Usage examples:

Enable all SPI traces:
  echo 1 > /sys/kernel/tracing/events/spi/enable  
  echo 1 > /sys/kernel/debug/tracing/events/qcom_geni_spi/enable
  cat /sys/kernel/debug/tracing/trace_pipe

Example trace output:

1003.956560: spi_message_submit: spi16.0 000000001b20b93c
1003.956642: spi_controller_busy: spi16
1003.956643: spi_message_start: spi16.0 000000001b20b93c
1003.956646: geni_spi_fifo_params: 888000.spi: cs=0 mode=0x00000020
     mode_changed=0x00000007 cs_changed=0
1003.956647: spi_set_cs: spi16.0 activate
1003.956648: spi_transfer_start: spi16.0 00000000ea1cf8b6 len=16
     tx=[4c-80-e4-ca-68-4d-95-aa-ee-99-ae-d7-69-e9-5f-39]
rx=[00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00]
1003.956653: geni_spi_clk_cfg: 888000.spi: req_hz=20000000
     sclk_hz=100000000 clk_idx=5 clk_div=5 bpw=8
1003.956691: geni_spi_transfer: 888000.spi: len=16 m_cmd=0x00000003
1003.956708: geni_spi_irq: 888000.spi: m_irq=0x08000081
     dma_tx=0x00000000 dma_rx=0x00000000
1003.956717: spi_transfer_stop: spi16.0 00000000ea1cf8b6 len=16
     tx=[4c-80-e4-ca-68-4d-95-aa-ee-99-ae-d7-69-e9-5f-39]
rx=[4c-80-e4-ca-68-4d-95-aa-ee-99-ae-d7-69-e9-5f-39]
1003.956717: spi_set_cs: spi16.0 deactivate
1003.956718: spi_message_done: spi16.0 000000001b20b93c len=16/16

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v2:
- Removed tx/rx data capture since spi core had already support.
- Updated commit text in patches and cover letter.
- Link to v1: https://lore.kernel.org/r/20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com

---
Praveen Talari (2):
      spi: qcom-geni: trace: Add trace events for Qualcomm GENI SPI
      spi: qcom-geni: Add trace events for Qualcomm GENI SPI driver

 drivers/spi/spi-geni-qcom.c          |  13 +++++
 include/trace/events/qcom_geni_spi.h | 103 +++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)
---
base-commit: 1f5ffc672165ff851063a5fd044b727ab2517ae3
change-id: 20260506-add-tracepoints-for-qcom-geni-spi-e31457c2267c

Best regards,
-- 
Praveen Talari <praveen.talari@oss.qualcomm.com>


