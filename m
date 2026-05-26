Return-Path: <linux-arm-msm+bounces-109903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP6PIWDfFWq2dgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:58:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 208675DB0DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDC51304D75F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFEC40B6F4;
	Tue, 26 May 2026 17:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MszJtreq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SyuQmJMY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B82E40B6DD
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817073; cv=none; b=q9l2le0x3vnAcR/zw9yPjNWOMRn09VAj8HPeAv5/nyIbUYuYUg2wDOsN4wHnCbxAtnkFdUvuTK+Q+kIBwWyRkJPBdaAy4cYo4YJzFm+ILapD/AN2uISyWsZiMh+Cd7qZ1EpFinuLBwjfzuOE4nMFYuFEgdcwEjvUrfHnxoSCT2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817073; c=relaxed/simple;
	bh=kO3PS+8vM+Y1cVJMEsnWbnLSJAXWqhiPW0FIU1IObx4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lJCpD3O/Pps10ZilGRcKv2EfrndbGbLndJ978Z1/MR0IJu/h7MOQPfejlgzLNXle/xv7zRKHa9YgvrW4xCB5n7o5pp/8iSwKCW9b+sryJX5IzrnuqjbOfJN3llQ1efgZtNaHg+UV1+1j/VzdlK4LNJDEd06Xh11wEw/HJP5V6pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MszJtreq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SyuQmJMY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH115N3289740
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+8y1ULO/S42l3Qk21MCc9B
	/F3Sk3QdLI8zKZezL1FvI=; b=MszJtreq0sZpv3cEJSb9Br9HjNN7vc4pjSv16y
	gl2thm4Q8JVMlyFsP9PnJceuaWmKMvzy4KskwdxO2b32f1ml7IyxACRaRrwN56B9
	YcFOXxgJe3y4vgLR5rPRmVDXxk2ZxaO+7d58FIHzV3qXifLxhCtjdamHyw/4ZyV4
	5/LGdCFQWJFkS7pDsGBKA5stF4dZW0WAqjqMeiC/xuldNR2iE5ObmyF+kUp9ZPQu
	Lghp3lfhbcnUzDNEZ2RyLwqOHExqPsHKqL0KWqOASAyjFUyfbJO4OidACd03ixzb
	ntU30JimXluGHF13tgx0yxOQ2xahfPKL+RVOEDufVqbaqz7A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edf1j8abp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:37:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c850ff84ddfso7758830a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779817069; x=1780421869; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+8y1ULO/S42l3Qk21MCc9B/F3Sk3QdLI8zKZezL1FvI=;
        b=SyuQmJMYE5+EY0tOjYbvWrpgyRTdKCnPMIsW5ceWko9+Wyp9rpZ/a6gDkj8g5/7KBD
         EyFYmLwT2RagrZIwjOaT4zRS/ajkrMCryumim/UY9uK6ZIGBGAPbY+4XD2ZJRrujJZNa
         xnrxhhuRHyd4EnVSqqQKGjVpdWzR0IjIe9xtWL9EL26kDM+BaoDXRrixjeuNmKMNdPH1
         nDtn0n7x7r6EOXZ2gkFt3s4DUFLV8ogARTVZvYvA3JtKAJSokgMYg5MQtc6ndHq1kn91
         t4Me19j3Lgty/MYsCV52l08ajdy7SazaTryAeXWPQwMZvuqUlX/tOE9ZYDLlTTwkA5BK
         Jm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817069; x=1780421869;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8y1ULO/S42l3Qk21MCc9B/F3Sk3QdLI8zKZezL1FvI=;
        b=hZEsw68VdPpS+2xizwsZh7YkaUeITlAiaxPQQ4WwRq2bAAYaxvo01jrhuEfGWACp9A
         E3ikaklM5Vha3WP1Dr9AlrsUBwoe1WgHz78bZ4XMvCyHECq9nA8m2dDomtzHEjBnANsh
         rOs7sa0SWr5zKH4JG+L5B/fMTvL8Rkn5xuHVdKm6gdMvGi+0Csanes4xJyXTzvdD3P09
         JsoWLW9jzPvH/pp/K5wPE1AdqrbHEi19YUY4eRCaTJs4uvYJZ2+3ex/Igzyrd9U1QOKc
         B++hgKolncI7G+rb1kSWBl+CRDRs0ZPX4fu+1eVS9CXbhaUDL7vQf1qUeN7IxsXYp52x
         61Ow==
X-Forwarded-Encrypted: i=1; AFNElJ8XAr2T/hcC5EiLeOKsL/iBQy5fMrDBxxhKnbEOt06+ieKkygtmsHGT1a3jUXfIJCzsTYQ7dnDOVBmndXSO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx2wEUKdISRvcZWhHIXaCZTHts+hhyAf71nK1SNLWZ7EDpLZLF
	4tcNZVhiW/bCiQJ3dp4AF1gDEWPAl8kF8i9KZMf7mrlSJCJcUOktmgvEy95rlc69avCEdQvEDcJ
	CFVxTpNiYUNNwCCudiW+DaMNGRDkwYSFp0Aojok9oAyZIwnV5odnY8/SwLJwKz0ntH4Kz
X-Gm-Gg: Acq92OHYx0PlQtbRDhtDr3YnUcoKerFQ7HIN3gX64rtSKF1GyqFDHUtup1Raqq0tJUn
	8zkhZ1B6/aq3G5ful1Y6abb5uVAcXS68eFWgqHkQdVQknKVusqYfnigUJeKNVvghOSp0b4mVVkw
	Yusy4eluvRSAA1UX/wnWWSLVQoVGz3J9s/pfMGjUJ3LqSjfn0n+n01TOz38LsUsW92WuT2ND/jf
	qqiqs5/FHowF4sxPlPHVvbFuvLLdoXFUWUJSPPCMq+Jt4MykxxEfW5B7+0yNTJ+Edm2qBsjdQWM
	Upz1JIUXtaZdxzV5Oukm6G8BYZ+1h0WSTPfqQSOcVn3afsDxFuLoUWYtk9zFdMfQo+gA0kxSRNJ
	4+N/uF1bhDqFbOTULFNaK6TsDbAo+Bj8OdqpMxDlLWtRan3ze++kbxHQ3ASWA2qN+RA==
X-Received: by 2002:a05:6a20:a121:b0:3b2:86e8:a819 with SMTP id adf61e73a8af0-3b328ecdb1amr19699628637.25.1779817069423;
        Tue, 26 May 2026 10:37:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:a121:b0:3b2:86e8:a819 with SMTP id adf61e73a8af0-3b328ecdb1amr19699583637.25.1779817068770;
        Tue, 26 May 2026 10:37:48 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841c32b511dsm3260461b3a.48.2026.05.26.10.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:37:48 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add tracepoints support for Qualcomm GENI Serial
 drivers
Date: Tue, 26 May 2026 23:07:38 +0530
Message-Id: <20260526-add-tracepoints-for-qcom-geni-serial-v4-0-e94fbaec0232@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGLaFWoC/42NQQ6CMBBFr0K6dkg7lhZdeQ/jokCBJkChxUZDu
 LsFNy5csJnkTX7eW4jXzmhPrslCnA7GGztE4KeElK0aGg2mikyQoqAcJaiqgtmpUo/WDLOH2jq
 YSttDowcDm011cOG5lBJZXsiCRNXodG1ee+b+iNwaP1v33quBbd9vIKPiWCAwoJBxXiAKhprmN
 +t9Oj1VF5d9Gg/ZOgF/3AwPujG6VSZRcGTFWdV/3Ou6fgCa1nx3OwEAAA==
X-Change-ID: 20260427-add-tracepoints-for-qcom-geni-serial-948777218b7b
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779817064; l=3687;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=kO3PS+8vM+Y1cVJMEsnWbnLSJAXWqhiPW0FIU1IObx4=;
 b=faXztxcLxDwYimpPKNMRU6Z1BWVnGfTxoTnn/P4uPACUYxAHbQgBuBVpF+uILLFyNMFbg5eY+
 6udtByJn8c6CNVHZc7K0AI+9UxG/5Alw1tBtdeycE1ow+A/Wz0O//gV
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=ZNjnX37b c=1 sm=1 tr=0 ts=6a15da6e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=meVymXHHAAAA:8 a=7d_E57ReAAAA:8
 a=ag1SF4gXAAAA:8 a=xnuwXrIFmXssz-iuO0kA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=2JgSa4NbpEOStq-L5dxp:22 a=jhqOcbufqs7Y1TYCrUUU:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE1MyBTYWx0ZWRfXwAZEESJveVdT
 m5424mzg0T3FJW9xgDjab0CTguD95y1JhPGxHwgZIJYrKQJYdVdzZ5//LNSbzUP4OWdr5UCVntC
 gFCxK9oox1g6LwwJfXx4INIUPSABCMInqTkOBQlVQ9RIa7TKcPiK2ntfRvZvK46qbxyl/qrgQ3x
 toyu2QBddChOjHabc/s2P1sCxqGEp3z0dCg5pieTnk9fi7LxHG7Ux4IyxkpE40piHFDDwHEHENS
 E4+/nQi1y0iTz387TUZiob3zJVtDD6nHQU8IoySUqyQrLcjFVAao+eTEoKN/DkNsS7Tes/AzD/c
 kma6SmaqwEZgp1nRIkP7GIG0ICVoGKkvELEq9qQ2g1s4DC+HX/Auimd3LXOmlSW+Ceely0zdGI8
 FPcQ6/e5bUJiI9Nz/waWP5QXnDeUhTa01Gdfzm5Ikxr0rwTFDjHotgaML/DWYYH2q52b4Fy+Eiw
 HUZiznGvx6a9skj+Drw==
X-Proofpoint-ORIG-GUID: y_-A33pbByZpzTJyv1-XFb2thoezBMNw
X-Proofpoint-GUID: y_-A33pbByZpzTJyv1-XFb2thoezBMNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260153
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109903-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 208675DB0DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add tracepoints to the Qualcomm GENI (Generic Interface) serial driver.
These trace events enable runtime debugging and performance analysis of
UART operations.

The trace events cover UART termios configuration, clock setup, manual
control state, interrupt status, and actual transmitted/received data in
hexadecimal format.

Usage examples:

Enable all serial traces:
  echo 1 > /sys/kernel/debug/tracing/events/qcom_geni_serial/enable
  cat /sys/kernel/debug/tracing/trace_pipe

Example trace output:

2517.938432: geni_serial_clk_cfg: a94000.serial: desired_rate=1843200
     clk_rate=7372800 clk_div=4 clk_idx=0
2517.938753: geni_serial_irq: a94000.serial: m_irq=0x88800000
     s_irq=0x08000111 dma_tx=0x00000000 dma_rx=0x00000000
2517.938803: geni_serial_set_termios: a94000.serial: baud=115200 bpc=8
     tx_trans=0x00000002 tx_par=0x00000000 rx_trans=0x00000000
rx_par=0x00000000 stop=0
2517.938807: geni_serial_set_mctrl: a94000.serial: mctrl=0x8006
     uart_manual_rfr=0x00000000
2517.938818: geni_serial_get_mctrl: a94000.serial: mctrl=0x0160
     geni_ios=0x00000001
2517.939165: geni_serial_irq: a94000.serial: m_irq=0x00400000
     s_irq=0x00000000 dma_tx=0x00000000 dma_rx=0x00000000
2517.939592: geni_serial_tx_data: a94000.serial: tx_len=8 data=61 62 63
     64 65 66 67 68
2517.940610: geni_serial_irq: a94000.serial: m_irq=0x00000001
     s_irq=0x00000000 dma_tx=0x00000003 dma_rx=0x00000000
2517.942174: geni_serial_irq: a94000.serial: m_irq=0x08000000
     s_irq=0x08000100 dma_tx=0x00000000 dma_rx=0x00000003
2517.942323: geni_serial_rx_data: a94000.serial: rx_len=8 data=61 62 63
     64 65 66 67 68
2517.942680: geni_serial_set_mctrl: a94000.serial: mctrl=0x8000
     uart_manual_rfr=0x80000002

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v4:
- Rebased patch(02/02) on latest linux-next.
- Link to v3: https://lore.kernel.org/all/20260518-add-tracepoints-for-qcom-geni-serial-v3-0-b4addb151376@oss.qualcomm.com

Changes in v3:
- Removed \n from geni_serial_tx_data and geni_serial_rx_data events.
- Resolved aligment issues in geni_serial_data, geni_serial_tx_data and
  geni_serial_rx_data events.
- Link to v2: https://lore.kernel.org/r/20260512-add-tracepoints-for-qcom-geni-serial-v2-0-a5726421b3af@oss.qualcomm.com

Changes in v2:
- removed multiple trace events for TX/RX events, instead used
  DECLARE_EVENT_CLASS and DEFINE_EVENT.
- Link to v1: https://lore.kernel.org/r/20260506-add-tracepoints-for-qcom-geni-serial-v1-0-544b22612e08@oss.qualcomm.com

To: Steven Rostedt <rostedt@goodmis.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: konrad.dybcio@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-trace-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com
Cc: aniket.randive@oss.qualcomm.com
Cc: chandana.chiluveru@oss.qualcomm.com

---
Praveen Talari (2):
      serial: qcom-geni: trace: Add tracepoint support for Qualcomm GENI serial
      serial: qcom-geni: Add tracepoints for Qualcomm GENI serial driver

 drivers/tty/serial/qcom_geni_serial.c   |  27 +++++-
 include/trace/events/qcom_geni_serial.h | 164 ++++++++++++++++++++++++++++++++
 2 files changed, 187 insertions(+), 4 deletions(-)
---
base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
change-id: 20260427-add-tracepoints-for-qcom-geni-serial-948777218b7b

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


