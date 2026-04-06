Return-Path: <linux-arm-msm+bounces-101984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Dy/Dsbf02lxngcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 18:31:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 126CE3A54EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 18:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 04BBD3008CB7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 16:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B40538AC9D;
	Mon,  6 Apr 2026 16:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OI/HvV3T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QY0MTlhm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83DD3C1F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 16:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775493055; cv=none; b=ngyxWXKYAcwdACJC9qEmmpn0iALYWFBZcRYo9d8gZZQprwv9B5xkFSzrjvJ+kMopwkVINEXO7CciHSlXcjMYos7MTkFqVDlYVURpzOxMbqISBCX2JnDT2gWU6hAIG9spqzJ4qso1d8d9g3ss3wT5BzQ1ISjD4BWgd9tOo7n+n3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775493055; c=relaxed/simple;
	bh=YMlNw4W7DOT6i35XXwaAS8oTfUjHUAj2qF7O6Kz4V38=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gt9EVHGMOhLey3rbipF6/G6hq+s6qmJQ9VWoz2Q1p3K2VcWWvWVMHiAmcCnTO0ziiayJhnMEOKTfvOnaFeCEISa+qSHvB/kiJQtVSdJo/QWdA3fsQwJQzHTXrHEDUheILyrs8ZCpIZWgQNeGhxBUPCxABMn5I82NLAj4nzXmf64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OI/HvV3T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QY0MTlhm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636ElWMI1466023
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 16:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V4IA/Fi9z+qYlvcs7UGEzg
	F6SMwi2xeclC9tJCbWSCI=; b=OI/HvV3TsmQhbU8e7rg1iktFoBoAhiLeV5LXLp
	1jyJ3+vBt0kyqyrkqiWUT1ljDvI7XUqBLV7BgHsC0z1F7HyjEYo3t82una2Ex0xG
	jRWutCzvystx6hpXe9NNuwDE6PUx6/khWD/VMG7U5YPoyRxv+DU/q/n/TOdwxfOU
	5gqmhyB/11yDc8gPPJwlCg8UwuOyPJWBMPK09+D5xSwkWq2MBq89jBdNLwglSoQu
	o8b31bRW2TidwxHhrQ3n5GxLa9MdeQ0csMbesIfdLZddzBaFuvWqqTzDFOA81x6u
	ju8CKTh0jWR/7JnpC0rHFEsRRUoeAyxvcPB4sPPF8QQSjpkA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcewdray4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 16:30:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b242062308so96209065ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 09:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775493053; x=1776097853; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V4IA/Fi9z+qYlvcs7UGEzgF6SMwi2xeclC9tJCbWSCI=;
        b=QY0MTlhmmfp2/HYRy5mKc79YLaj7hnifvbvw2RHfpiW9bMLrLJ2lP7cZXCllb5TIt+
         BkN5E1Hl1L/3pFpd0UoR2VEGf19Dg58+zHj2kx+yf+FN8VZTU/cheOPnJin9VG8RGUDP
         WwFUTEMU30O1MMX7u+TdgiIsy40Ov0lOqiLRIrL2YZCJxH2CQpbFp0O7Z/h6x+e5vBj9
         0evqCmEiHQKwF1KUB5jdIWyvnwun1pYYRjuaIL8oFAWttQjsSbXmBxwh46jSs9AcxDBk
         ZpG508tzvoIpf7EkQ2TffxpTbKzGaT6pH83ms2GEvrPaBHIqbKxymRRjEIAX6RxBdT/k
         wLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775493053; x=1776097853;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4IA/Fi9z+qYlvcs7UGEzgF6SMwi2xeclC9tJCbWSCI=;
        b=p3rFJ9Uu+ARCOZ0Ov/Fg/1/J9mPQ7nFMfSlz5rFTpowHExqPo7KedGqiXPtv7W5ECh
         dcmrEIkAuLkaCH36wFzYARPaYkahogoVFXeoOK9qbp4UbMAgTmvr68jaDuhrPaFepLbR
         6sX2SF9EH2j2JM/WWHykipgDRyiGC4I8I7Tm4H2SiQamGogBacrta6p4JiKiaz01LW6G
         z78KH+M4Y7Q/Vf7oqPvLuMhSktwL8L5ThNS8KrS4Nn2+kTu23eEyzvZ3REaa9tZhC/8m
         MFE41BmJtHdjdsQ1De+9ccHhHlGlOlRK2GH6+BaTlehEMSiPaDruIICp+1v0A0c49RH0
         bYzg==
X-Gm-Message-State: AOJu0Yz/+ghOOrTLNlKCaylu0nhyCMBdrl4Hot919QP8ojuWktxgdHuW
	cx77tPFmolbD071UlipW1BxcMUYvrb8Wb7vgWz7hH1VyT3JZJ2FnIR+x7P8tIHt+aCG1EfY1ApF
	56nyUH59bozNLZIcfXFeiTEJMlDkkjYi3eLF7xbw0/D5xsAAhdMydkhrR669FJ6CptKIN
X-Gm-Gg: AeBDietH5rhVDmPZVze0H9GjVpXpKfM+17oFozk/+pgeEgbfoUVklelJviwwlWH0zxk
	u2NGQBY9zHpNWKWYQszmIqYcxjCVrwb8V9xdsuAT52pVB/Y7KV3Qdr/1xl1MsGnZoZIC6J5Odua
	7ozhV83HKvOdHRVxEbqx8P4nD9H3Yls75LV6FLJequuUYkoldWljtsiQvXTIo0FqlZYj4kuZyXR
	D2+JqMwlj3GEEUqslxxoYhf1naDPgvBPvSNCKYUTGiiuZgYXC7dHNMZHlnFZdcj2ME4RkG6Jl7D
	BRhlGPTYjJmSM5RO7ym/RzBRlYtdHPSTSeYP0o1KcO5SspOup8QCOzYwP3Voe4CyfaWIJCp/r+N
	G1ykEHlBug8urOyonSmOEdYUT0PtTytWGK26vqRsRpru4tK93UHlpsG8=
X-Received: by 2002:a17:903:acc:b0:2b2:5042:dd22 with SMTP id d9443c01a7336-2b281935ddamr143279435ad.34.1775493053367;
        Mon, 06 Apr 2026 09:30:53 -0700 (PDT)
X-Received: by 2002:a17:903:acc:b0:2b2:5042:dd22 with SMTP id d9443c01a7336-2b281935ddamr143279025ad.34.1775493052824;
        Mon, 06 Apr 2026 09:30:52 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cdc61sm145144455ad.80.2026.04.06.09.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:30:52 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable iface clock for kodiak and monaco ice sdhc
Date: Mon, 06 Apr 2026 22:00:35 +0530
Message-Id: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKvf02kC/22OQW7DIBBFr2Kx7lhgbDfOqveoIoSHoSWJIQbsR
 Ipy9+K6y25G+qN5/82TJYqOEjtWTxZpdckFX4J4qxh+a/9F4EzJrOFNz1veg0NSNE2o8BrworQ
 xLhcGSAxW9igs6o4V+hbJusdv8+dpz2kZz4R5q/u7iDQvRZn3s10iGwkzhkltplu4U1Tam6K7q
 DVkgrUFDiTLN+04GkvDR0ipnhd9LdBUl7GV71WCCyG77r2W7aHjDQjwRFGf6xS8+5cbdSLYFi4
 fq4PorRikMdwM7PR6/QANNp2/LgEAAA==
X-Change-ID: 20260406-ice_emmc_clock_addition-e19f36c1fca5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: OzWXwRj5qMxyFIoR3-nGvzUmMISjQ_jr
X-Proofpoint-GUID: OzWXwRj5qMxyFIoR3-nGvzUmMISjQ_jr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE2MiBTYWx0ZWRfXxDJurMoUejSe
 ecgd1YvBSy7KrJKqfEVDYB518mPNBVIBfXALmEkEdxs8kJmVceEW6/MRX5bJJfpfRyT9CGrxZyb
 4tnWccp8EdEBOMKeqXApAM1zeqdLjIT7caPOqLfZ4VTCvs9XmFNE9Lgv6Wy1ccIpZq7YqPyBZP0
 SCMkRbbS71Tu3SPkQ+OUBhydNI2vnocyp2jkT6FmCDV8FBOpY4BNSme8bLcjNLg/q41KcHLbdh7
 I/E7Orh1iJ/Y0Ec3njVmJinu46wdyGBnDKd7bhgnKoRyfgsUwx3NONoWRZfHXx0Is3ZHk6ipSbf
 J0t2cqW6NT+mo6E13e1WlEAOdL6t911Hi8n34me0T3Ey38OFryvq9EfcCJajEL+I697ITtIWr3s
 QAdi/C55dHTCEe1YRSKJH748DpzhuXaV7CvRPFzXjnODgmzRkfR1Udqx11ioyZ5fYXaQnOljpNY
 g4F0xWuD4oRuVzM9wFA==
X-Authority-Analysis: v=2.4 cv=KfXfcAYD c=1 sm=1 tr=0 ts=69d3dfbe cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N2sBZ17_MvgTsLg7TvYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060162
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101984-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 126CE3A54EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As ice is now standalone driver decoupled from ufs driver.
MMC ice controller should also now specify iface clock alongwith core
clock.

The patchset is motivation to fix ice mmc where ice ufs is fixed with
below series.
https://lore.kernel.org/linux-arm-msm/20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com/T/#m5da5dd7a18318583b23ffeb42fa07ef1438042d5

Testing:
* dtbs check
* Custom monaco/kodiak device with emmc storage.

This series depends on the following prerequisite patchsets:

[1] Add explicit clock vote and enable power-domain for QCOM-ICE
    https://lore.kernel.org/linux-arm-msm/20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com

[2] Enable Inline crypto engine for kodiak and monaco
    https://lore.kernel.org/lkml/20260310113557.348502-1-neeraj.soni@oss.qualcomm.com/

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (2):
      arm64: dts: qcom: kodiak: Add iface clock for ice sdhc
      arm64: dts: qcom: monaco: Add iface clock for ice sdhc

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 3 ++-
 arch/arm64/boot/dts/qcom/monaco.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: 816f193dd0d95246f208590924dd962b192def78
change-id: 20260406-ice_emmc_clock_addition-e19f36c1fca5

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


