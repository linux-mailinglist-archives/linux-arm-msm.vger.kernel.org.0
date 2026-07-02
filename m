Return-Path: <linux-arm-msm+bounces-115938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y5dZOOtBRmrLMwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:48:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B72A6F6269
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:48:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qq56hS4g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EC9SQdI0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115938-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115938-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B9DE3004618
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5837D3BED7B;
	Thu,  2 Jul 2026 10:46:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA873ACA5B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:46:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989193; cv=none; b=Z4JW2ibYR9xop0owyt0W+GVthHI7g2DfT6JXjVuoY/DJrbhRMFxWm+jg3kZ3gJawrEp5+M/jdIVMrXOWQiZInAuQzAe0sMww05vrzst2+9efmFSyIwuIULkq1RrpgMFfNVJB85mizBO6qiI9Vk9pKXfqkYW1jQJhm72xZ6gjhX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989193; c=relaxed/simple;
	bh=UuWiowSUkkLYBCFI2j5RmkjjfgRaPpYyPxsZlfvVpgQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MUrbHcb0FaQb6KOXMHQKp1eQXq8PCRfm4QIJ3SFn9pdzJf1npL1g5LeZWtIHiEQxcCtkAx006pUStWcvDRbKxLrhv3vcqBUHgBKs66t1wQh+10zzYNSnIXBrdBdrt2MqCm4lFYeKOmegcfmTIisL8JgvJTowEPm9bLxDBivBckc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qq56hS4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EC9SQdI0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KL914115600
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g3M8BKOQRB2G3U+jibgwRX
	tDt1cwkny9K4uSgSksDB8=; b=Qq56hS4gcggr6zWHP6OM19FMeMio98SPi+lUN3
	0H49UC4ZqoEwmDCGrNX/k9QoK3v4i3XhfJzTDwRVMU+BuYbDx8jHrchwuvxb6Spz
	5VUV8NA9IfrEJPSXgGnJ/fGviu8Ikc3xCbmO++G59wtZuuZpBM6Ab2BaWI8hELWh
	Q4UdntbVTg/3lM8WQ0tl4TnmOk68MQzlphGF89Q0GZD7nrXTaNiQTJp3OZSC8KUy
	ubrjCeoT1cPftRfxz7WhZk63woHcudBOjNEQbfnQi7XGvEKPPmcTSF9VIMW4eM+p
	VOOhYQKR8c6hPX8wyUlG7tUCOBnGgszIGkKWvLJ+koXKxxlw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n940a4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:46:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e663c29f2so54655385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989190; x=1783593990; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3M8BKOQRB2G3U+jibgwRXtDt1cwkny9K4uSgSksDB8=;
        b=EC9SQdI0cJA4R499RhF5eAxf5qlZ/lVlXvlIPrPgdzIsJGHJyfyFAj4hIryANDAmRp
         FclBZj5ucVZ0hy0+BAc+RNn9geUAfE4gCyyH2klPOtT4pMonhEiikAYxHNcJf8tBGAUn
         w6ZuDBJRQY+HtoFo1BNsAU5K9yadlsqctJlAvW2GdAuoG/9PKZX4pRD8rtd8f/CvxDEV
         x/bMYFYntxWcYtJ9fwcbFP+MmGbYc+E+Cg1xOUF6vOH9RLub1nagXT1PWIv40akbJiA5
         aAIIX6CEYek8xd8eYhK6lAUkOEy1KOc5ND8gs5aXyxMGV9OvLn2zBkwkze3WLvn0OBtY
         nNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989190; x=1783593990;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3M8BKOQRB2G3U+jibgwRXtDt1cwkny9K4uSgSksDB8=;
        b=cWH4A1jmnxqOl2h6L0ZdZJIOOBeFMK0lQPeWVs5VwlqveRYFcL0aJA7f6jrjtRG5B5
         ar6c9tpfCFF8Ww9ePBIHR0cwVqxNbN0MIT83fjjsHvVOTHWjrKnih8iWVqy5DzEMLhfr
         sCGzDrOlFTLfnKrw7igPHx9n1fa5uSkK0hfJdzsvnnjH8kotfspVB1nGI/ZyGQKONl6s
         4Ck1GWP/cHkh7i0FR2gHyqo0ip1Tv0r90vMXAOMq9RYWRZDjkm1s3s/4lEIQatoF1AGc
         3guKdTPEk7q+kM3nU7OxSpCtDr5i8CH2WatfViOvzBlQt8//fYYXkWtmB/vbvvxvFMKz
         PVuw==
X-Forwarded-Encrypted: i=1; AFNElJ/vPW1KDnOaNTpDaVn4tdzq3RcLt+lLLqs+lzEtEHLPl6ACyCT1BeFe13031Q9Pd6GA4v0tCYPwVO9dXH/W@vger.kernel.org
X-Gm-Message-State: AOJu0YxgCMQdLtljoiA220DC6bqd7YZo8ekLWLWwj836pQj2AwUjzSVR
	doIpmfNCdGxJYE8v+Sca5FCuGT3mpTUgb1cnB0SSOHMqfs4NQaNbCUN0dCX2D/sRFEk5g2yPn4n
	ue4MTbjpGYD9ATIO3PvsUiiH1ovIS89rxMLY8003lei6+Y1NWvDJQsK1b4OrQv767/M1P
X-Gm-Gg: AfdE7clcaOckb1hrB3lJGIveyhxzYYWXpcZB4vqS6HjY/pSBUcgN8Ryf6kF8WKCeLeI
	MVYXyVz2g2c23J5ve3iAUPEvtHj5h8VeMSKBUzd++HfF1Z3kuYVWclHYfcl/NMj+8bG/OPM+2X7
	zaUUeKces+fRZMHE9NUiSmeycfAPvbSHo+jHKhNEl7GQWir9ZTYB/QbSfSOzPz+XBlU3YMw8eJh
	qdeo2MdRixoUFKK6c8oInMfLyOzr95QJa+yR6Gx7ee83M+tT4Tkc4qtk8bHSUvDd4hbigoqkqVg
	XutH9VO2U/tXL1i69c3UaeWQEABWoRSAYKqDvc3dedyweBncFr4ttcRgaMfk2QkP4djgy54juDf
	lHnziDjzTJioO04DNptBvS6euTFrm0dulF7xeNaQ7lsldMzThjDdee6kbis6XM+zJ/vQZuSpMHJ
	eC8CKkRU1hLL8v4QuBXgTbjiL3Gb/FDCwhMpV3+cuJMqy02OiKphi8uiM23DYL7Lo=
X-Received: by 2002:a05:620a:178e:b0:92b:f1ba:5fad with SMTP id af79cd13be357-92e69821ad8mr1223563585a.37.1782989190100;
        Thu, 02 Jul 2026 03:46:30 -0700 (PDT)
X-Received: by 2002:a05:620a:178e:b0:92b:f1ba:5fad with SMTP id af79cd13be357-92e69821ad8mr1223561385a.37.1782989189650;
        Thu, 02 Jul 2026 03:46:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b5ae4959sm109689666b.0.2026.07.02.03.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:46:28 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/4] arm64: dts: monaco-arduino-monza: Add support for
 LGA WiFi/BT module
Date: Thu, 02 Jul 2026 12:46:12 +0200
Message-Id: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHRBRmoC/3WP3YqDMBCFX0Vy3ZH8qKmyLH2P0otoxzbQmJqx6
 e4W332jXpbeDJwD5/uYFyMMFok12YsFjJasH1KQu4x1VzNcEOw5ZSa5rHgpOTg//Bl42oA3JAK
 sOtQ9F6pXe5ZG94C9/VmBx9OWA46PxJ22krk0Myu3yb42LNdwfwbCEZyEdoIogYPQBW/Phd6Xq
 j54onx8mFvnncvT+V5crSGEpbFTk0WdCwhdwRbr1dLkw+/6VRSr9tMDUSRX3Vd1IZXgVaneXOw
 0z/M/u6Q4vykBAAA=
X-Change-ID: 20260520-monza-wireless-e6ce7f013f38
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMSBTYWx0ZWRfX3nZwiX1FPAm1
 YDMBgtCb/e+Di5lq0R9l6gZsg0e0KwcH1RYnHMfRv16ze+q/iMD/IFjqj9Vp/qpYnQnRKc5KQd0
 vOIGqTYNdrrneAwcelh46a2v9X1gf5wjuKYSBol+MxSLBWC99qJ2LIdm/QaGc1z0kHWAcYTlr9p
 0OOghDe78JLMJKcGeEB7qqB+Tx4ry78jnfjcuvgsw0XbuLn/BBKBx7qzl+pcQQFveogRv2VduV9
 J5VsZw+sM23VxbV2Ziu3ZSzBlIILjnfcoiY+NJZ5xmZLFUrA7/wefAxGf0nABW23pIUWEpAZC4t
 ai+NfmNc4bVtsZcCfPQBZ6qJzcsdhiMstdMAgVTAkKLywtHz+w4ako2/aq8cFte4G6/enuCtgoa
 L3VH7oMcZHMa9L9qxj0lyvX5f1bkUo4aZWiNeoJzCg88/F6kqvWHN9brLw/+hX4WwgW0pIEojAQ
 p/4ic/kYoQ4D4u3rKLQ==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a464187 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fyB3VsXpRON8pw57WvEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: lx5fKZZN3HzM4MrX64O18showdXWKEII
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMSBTYWx0ZWRfXxLxknAJR/9l+
 pFecKuosEcDCLZEb6nqMv7iWXE8vZbtFP9cfZvGHKkoGYIpFu+H1Hxr8S2ay8oOopFBTRQWMVu7
 vCTZkr/L6CrEdKIkuYeUA/3pfHSFBNM=
X-Proofpoint-GUID: lx5fKZZN3HzM4MrX64O18showdXWKEII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115938-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B72A6F6269

This series describes support for the onboard WiFi/Bluetooth module
present on the Arduino VENTUNO Q (monaco) platform.

The board provides LGA pads for a wireless module. On the VENTUNO Q
these pads are populated with an NFA725B module featuring the
QCA2066 WiFi/BT combo chip. While implemented as an LGA footprint,
the design is functionally compatible with the M.2 Key E.

The NFA725B exposes WiFi over PCIe and Bluetooth over a UART.
Both interfaces are gated through the W_DISABLE1# and W_DISABLE2#
signals, as defined by the M.2 specification and handled here via
the pcie-m2 power sequencer.

This series models the hardware using the existing pwrseq framework
and connector bindings, allowing coordinated PCIe and UART bring-up.

This series depends on:
https://lore.kernel.org/linux-pci/20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- hci_qca: extract M.2 pwrseq into qca_serdev_get_m2_pwrseq() helper, called
  outside the SoC switch; drop duplicated of_graph logic and redundant
  bt_power NULL checks (Dmitry/Mani)
- dts/bindings: use qcom,pcie-m2-1418-lga-connector (fallback
  pcie-m2-e-connector) instead of the generic M.2 E-key compatible (Mani)
- Link to v1: https://lore.kernel.org/r/20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com

---
Loic Poulain (4):
      dt-bindings: connector: pcie-m2-e: Add vendor LGA connector compatible
      power: sequencing: pcie-m2: Add QCA2066 (QCNFA765) BT serdev ID
      Bluetooth: hci_qca: Support QCA2066 on M.2 connector via pwrseq
      arm64: dts: qcom: monaco-arduino-monza: Add QCA2066 M.2 WiFi/BT support

 .../bindings/connector/pcie-m2-e-connector.yaml    |  7 +-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 64 +++++++++++++++--
 drivers/bluetooth/hci_qca.c                        | 81 ++++++++++++----------
 drivers/power/sequencing/pwrseq-pcie-m2.c          |  2 +
 4 files changed, 111 insertions(+), 43 deletions(-)
---
base-commit: aa61612ab641d7d62b0b6889f2c7c9251489f6e3
change-id: 20260520-monza-wireless-e6ce7f013f38
prerequisite-message-id: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com>
prerequisite-patch-id: f4a7d1957c1776051608bf3d808b2786606c1ae2
prerequisite-patch-id: 6cd3c33583a9af16b3f6f71517b16b32d8155b7c
prerequisite-patch-id: 0550c57d69cf112fd4830e62f4388db6f8bf397c
prerequisite-patch-id: cc10d8079e37ef0ba0c33d0984c95d76361df9dd
prerequisite-patch-id: d7f4bb2bb4498ac619e67a94f8b59119a5caaf26
prerequisite-patch-id: c00ce9095b2d3a412229796194828b55642d3d96
prerequisite-patch-id: 09600595c2e80b12eda3aae39af192847d0f03d0
prerequisite-patch-id: a6118ed2894c176780ba933750e1068f2819fa4c
prerequisite-patch-id: 1dee41a33e032094e8dda74ac4e0bada928573d7

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


