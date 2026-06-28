Return-Path: <linux-arm-msm+bounces-114785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RYWgE+JLQWr8nAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 18:29:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0E26D45FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 18:29:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oP2KKzmi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cAdi97ra;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114785-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114785-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0067300650D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 16:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BBF28C037;
	Sun, 28 Jun 2026 16:29:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBE6288D0
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 16:29:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782664159; cv=none; b=oacStnxLD82w5jyAcnPryV3anedyEf2XBqtYPYCQ6DRqgAMR/v18I9DpNYAY1e2afHCcjUnRlkRcNGNR/AfAr3TohtAhzukst7mdFwqUtnPU8HFpY0JEklNA5mfjB9UigcXtGVTVBO5u/IZxmEAUPrqZgkO5qRD9ZqQwpXRP2iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782664159; c=relaxed/simple;
	bh=4NSxC6Mn34yMci20ZTuvINbSgGpx57EckysY0lZLfXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NgGkIw9aZAh+KVUlXjExvQxjIMir6BboKWbgj3GprJ0610soYy7OJqqYKLAp3PziLOXRYiR8K7qdu75G1Mv5UvaYdyfvxUxAsqDNyXqaMi74Hly7eMHvZG6Qzt+FXSBvJJyM4skcyJgaUSTBz8Qh8AJsMJyncHc8PV0P2kf+rGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oP2KKzmi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cAdi97ra; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SESjkv011503
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 16:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2xTfgdKMxe+
	lI5WKe3eni3EOigd5d95Lc7bPDZrpB20=; b=oP2KKzmiFF01pM0QuyaGZPqYqH/
	QkOytiQj/Gi+4UWpXH+36Iafkf9AvMHUa9dck2aqGPoJSl5OGmoL9t7k+N6RhoFR
	wf1vkmaeXOhYKVo83oVuNo6HwA0c2lxwiab9NdH9AIuW+R6fchBGCoA3JgloxxEF
	8v16F2OhUf0ZigOQA+YubaT6K+I4poc4w9fy7igiwsbF+Rrm8Mmo3Ig7LU9UplSO
	QqI/yTEd6pHjI7VKmdt5nyRKY3J2AxJ5rF2QHxDpc9M3hZnyhvraBk2KGPt7NFgN
	sNAdVYP4vgD9OyWGexn/ZZKh/ZwWuGZjrIxD/FnnmqaxyMpLqpLqjJb4xWA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26w6k8hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 16:29:17 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-80e910ddbc6so5781527b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782664157; x=1783268957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xTfgdKMxe+lI5WKe3eni3EOigd5d95Lc7bPDZrpB20=;
        b=cAdi97raZUAITIX9UM2mv8AGN0Z6CG12bRoRUDSNRMhMCMSBmWvey2hYOy445LxhKV
         o6fv6qfyC0Orl3te+Tm3ObpKSttA0juh0dMXaZpaNbqgxwoPwOXiDSg49r11PslT53Jy
         9FlMlRNaXJwm1E98WjCqk1LFnxqD7wXXhokOX62oJ7BJAgfEs2/YfDQJLEgleo9bdV9/
         qNMZGwKbtVdjUI85qlojFq2Qg09TH/hajWQmAImPdUU6LDL8Pec12vNMeCObTfzTK7a3
         vjMDHxIQuQAE3/ZpIyS+2xTFKP34Cz2eRdtuJXJAP+DAnfwoGr2bl/UnVk2AYghim/Qb
         r9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782664157; x=1783268957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2xTfgdKMxe+lI5WKe3eni3EOigd5d95Lc7bPDZrpB20=;
        b=ZKdKRpP2T++gasoH+2vZRfWdfixRIUnVrP6QnMFFhOayW1NigaDCu2c028AM0to2i8
         m2b6CHrMOHU26QBFI3rUJ5Q8lXkuQJEJFMTeHFIYPBnJGdzcG+51reoKepqWaiHVaKem
         i/qhjpr4dUJMGM0Q1nlZGmEdAPXBS/0ln/COAUfNiSQC+e5eB9cyN6O1X4Hoq24nHv4A
         OZcAMW5fNCHeKqF9mBmO/7ddKhmPkKDAq7XTEag8UpfkjiOBwp25VzWWiqC+GMxjITAu
         qmbGnO+MqvxbdevgGEEv756zdZmcK+qHbHiW7oC7Znbeo9gAAVl1nAEYlPVxO9zPz47T
         E9MA==
X-Forwarded-Encrypted: i=1; AHgh+RqIjyLRBdhEywWpQb3/gjsu0fThXAWYQfhiPooLnASE5nimkM/brM2mUuNV+PGShxvj9v7VSOqkTp40gnDZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyomqjZHSiP83Ud9Yw2zRczph61oSGNjm7CTrpuCtdYPOKkX4Ih
	X929SJHcJUfGvcjnzJ06W/jF/pfGYUsmC7D52hyZ7SDiW8eI7uZTkgrpA+d4Xy1V77UYL85HDLU
	Zg73O09VMgqSvNHEhsgdWzU4a8JKWAT6+fY4zSxX74B65qnONRjM0SGOyy+GFkxF/FXI5
X-Gm-Gg: AfdE7clkaZUTBJijeXbPYbn2JAA9sODHmj0iM3o4yPathQrqhYS+jdZ3I8BgLapxF7w
	zW99E03TC+3OtToDNxK94Cyfd2scxhmUb+31y8djRWLZWcYfNxvzrmyBljVCRZRZgwzHO3x+uSA
	BYnQ2tHngLP5rkY9xeoBE+n1B2vt499wusGbOBVoiA9e2X/B+TS7AvMhcxWWlV8JmH4n16BJMVw
	I9vehqt2OySimYGQcmWUizZZ546AT+/4AOvm8Z++E8PUtZLJTNBlAJME3Q+9oV9ewaTqi1FHJZn
	WxI60AvqxaqlOxRgviSxXvKpeps1zVDEM2UDaAje6lJr+rjKiOc9XquhnoVZTNhCdlBgXLwbq2Y
	CYmvlEjXo5RVuexUADZkodgb6rtK3saasO53U5v9JRYdmAon1D3QEWqdd3CbGSI4JoSMMs80903
	b5a6sOiQe6PbFGyIwRToRM5o2PnxKSLg==
X-Received: by 2002:a05:690c:7246:b0:80c:85e5:8753 with SMTP id 00721157ae682-80c85e58ad1mr79835837b3.60.1782664156926;
        Sun, 28 Jun 2026 09:29:16 -0700 (PDT)
X-Received: by 2002:a05:690c:7246:b0:80c:85e5:8753 with SMTP id 00721157ae682-80c85e58ad1mr79835587b3.60.1782664156328;
        Sun, 28 Jun 2026 09:29:16 -0700 (PDT)
Received: from localhost.localdomain (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80ec6c724ffsm5417197b3.18.2026.06.28.09.29.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 28 Jun 2026 09:29:15 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Date: Sun, 28 Jun 2026 09:29:13 -0700
Message-ID: <20260628162913.66306-1-jason.pettit@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <e7bal26fyufjh2f4j6rh57bcdvubp3qqydk4pjagq3qjdz3ywz@wtfsiff726zx>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com> <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com> <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com> <20260627190612.27271-1-jason.pettit@oss.qualcomm.com> <e7bal26fyufjh2f4j6rh57bcdvubp3qqydk4pjagq3qjdz3ywz@wtfsiff726zx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sLMd4LLeJmYDidXTEzpMoxZPVSNnA3Df
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE0NyBTYWx0ZWRfXzuVESLXIUyHY
 sutvUw9z7IWBMTTb13VsFjyPSA3HSRdFu0vhHrFfv4LY+V04a7njB/F7KFF6NR1P0IlNzdN3keh
 dg07l90jVJugRogPBzS3Nd6VoJZuBac=
X-Proofpoint-GUID: sLMd4LLeJmYDidXTEzpMoxZPVSNnA3Df
X-Authority-Analysis: v=2.4 cv=SuugLvO0 c=1 sm=1 tr=0 ts=6a414bdd cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=njTJukhxh3FpIjYFatEA:9
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE0NyBTYWx0ZWRfX7to8cGJDZ6mn
 wSwxTzCWAZ77MuwutskDVX21ePfdBAELuYvw71lygNceSQWJuYyaXfdrNQ6L7+mUYPCKwnOlo09
 Rjo4WPkjtNnPUKgMpY6KMaVVMaEUr+JYYAjrY5bEdIOPvUE+++xe/JwwcxFeT702Fd5bLuZST/i
 DBs7xMB0L/CWA/U93zmU6JPp0PHHZDsxbeL8PQsS+2xChyq1/+22IrW9fg8Os5Dfg714+mpc4JA
 +UY8tZXhI2f1sdrb7CmEzduYDU1Fyx/8q+KP6WSXLhYlUBz5SCfFseqliGJFN5KyvEMQR5cVegi
 FkAYYXMIh7+7IRsfGN/UbxF2PspPOgCtiY1YxxC+ZGH1tCv6o9NmrLarnru5YO7wtSnbsPSoqD4
 Qcj/P+X1Hgv90Pc/DH9HHyGuXC+pAMPtig6WA+xlL6hA9KjR38jWtYLkZq3/ieC492PLKWL1Jki
 D7Ll7yertI1Nr3yre4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114785-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:jason.pettit@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE0E26D45FC

On Sun, 28 Jun 2026 16:02:24 +0300, Dmitry Baryshkov wrote:
> This is very surprising. Can you check, is it actually the DWC3 or is it
> some power supply that is being toggled by the USB controller? In the
> former case it would mean that we miss some bits of PHY programming and
> still depend on the USB host / USB part of the PHY.

I tried to check this. I am fairly new to this, so I mostly poked at it on
the hardware. Here is what I did and what I saw, and you can probably read
more into it than I can.

1. First, with &usb_2 (the dwc3, HS-only) and &usb_2_hsphy enabled, HDMI
   works. I looked at the power state on that boot to see if the dwc3 turns
   on anything the DP side might also need. As far as I can tell they are
   separate. The combo PHY, the dwc3, and the DP controller are each in a
   different power domain, and the PHY's regulators show up under the PHY,
   not the dwc3:

     gcc_usb_2_phy_gdsc    on
         88e1000.phy                       active   (the combo PHY)
     gcc_usb30_tert_gdsc   on
         a000000.usb                       active   (the dwc3)
     mmcx                  on
         af64000.displayport-controller    active   (mdss_dp2)

     vreg_l2f_e0_0p94 -> 88e1000.phy-refgen
     vreg_l3f_e0_0p91 -> 88e1000.phy-vdda-pll
     vreg_l4h_e0_1p2  -> 88e1000.phy-vdda-phy

   So I did not find a rail or GDSC that the dwc3 owns and the PHY needs.

2. Then I removed &usb_2 and &usb_2_hsphy, rebuilt, and rebooted. mdss_dp2
   still binds:

     msm_dpu ae01000.display-controller: bound af64000.displayport-controller

   and HDMI-A-1 still reads connected, so the PHY seems powered and the AUX
   side is working, but there is no picture on the monitor.

3. Putting the two nodes back makes the picture come back, and the PHY's
   supplies look the same either way.

So from what I can see the power is not the thing being toggled. The PHY
stays powered without the dwc3, but DP still has no image. That seems to
line up with your first option, that something on the USB side of the PHY
still has to be brought up.

For now I have kept the dwc3 enabled as a workaround. If this is a driver
issue and someone has a fix or a pointer, I am happy to test it on the
hardware.

Thanks,
Jason

