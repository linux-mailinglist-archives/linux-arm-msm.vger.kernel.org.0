Return-Path: <linux-arm-msm+bounces-96288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB98I1zormlRKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:33:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA9323BBF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85E4030743E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 15:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A893DA5B5;
	Mon,  9 Mar 2026 15:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezxlHF0h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZUm2jtW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7443D75D8
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069871; cv=none; b=pr6BpGwe7T9trIYLanv+YY5E5phQ+PnfmkuNC00nudgTGmqSSSPbqoMUeA/PFz7B0xr6yMwTCBX6LMzHbfoQ8P/DNqdzC6OGMv8hWHcgz2MusbvpiPVVlBD8UFATGHRyW3Gs23Lo/sBqb2Y+AzUsnjyG4Om5B0pVF6XUY6zF554=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069871; c=relaxed/simple;
	bh=i24TgRrLoGVPLjM+/eKgUisXgQ4vL+kM6dE3Nj1V3G4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iQCC3x6PvRkSyd7Bo8B8caDryxhgjsBHXzHTJYONMCzjf3Ps1WERclzVcpOHesTReb21tKOGoXWts21I51ObqeERUXFZp1KgXo5ojRlNjCqFUsI7au3MOxWDc351D9aUN0n4WlZLwjRxWMQwcdV9j+EsMn+LGdX9ChwLtsXSWAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezxlHF0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZUm2jtW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629EAWIb1249055
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 15:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yga3XbiT8rvRu5nMdqM4/M
	FVlYqHPYbfjWpnYtaYAOw=; b=ezxlHF0hR5ibnUmPjHNsH86x148fYh/ke8b6Qk
	Ur3tQcRVAnIt6cM9XG4yZfxit7Sv+N9Atet7J4DwCgNpG84l6omh51jyI54dUIA3
	8JCSrBpgEzOZiQSKrCvLqCYJO4aPoKmHzsTDR0tmDiMdF7kCTzZmFNacVmRyhd4D
	sc1DbV/IQskTu6KFA9EBC/Fm2EUGMB3HEEp7CcPUHq0eh689hVVkP/0aLGOXECrf
	Hvsnnk/oZAxD/W7VplJ9QsaWWVrjmO4an60s5FyGy7na7iL9T9xdHtv79GhYMToG
	hoWPIJqIt8/xGBw1HZBDBwS0VA+cWWqMAi32HGQ/3j9Ggtaw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr407sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 15:24:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fc27cf7so872833685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 08:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773069868; x=1773674668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yga3XbiT8rvRu5nMdqM4/MFVlYqHPYbfjWpnYtaYAOw=;
        b=aZUm2jtWYOhlVzOFay8zKFb5ZXYCZ7TUn/rz7wsbqKTBpYCcFdX1QC4AVsPhTVyaeC
         9TYdkWVwDiLrMy6lnd/huOhOFIfAlv+jrOL1ueiUW34mB4EIFCTUOuBaUr0mKn9yanJb
         a8yHfqCD3QvnBbUrSYDcbu8dxb0MBhcKVtfU3z/B7eg+vahftxsPvqxiKuSZRJzXWOT5
         ZLEx72suFIL+JFMtzJQw6vgonWGdSqed4/BlOoiD/zQGP1Ab58Y+/FoHuI9D4RUgouVU
         G3DJK1BWHGmydW4V+NpqMHgMWmFtH5BrsK7jiqoib1S+HIfMXKozgRX90UMUPX4nb02f
         aKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069868; x=1773674668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yga3XbiT8rvRu5nMdqM4/MFVlYqHPYbfjWpnYtaYAOw=;
        b=ERWwmwXUV9a1yjq6mhjJgf3EhzCIieCnPtk32gqmAT+401L6y8pa9XraKf6aNGQvMn
         dY9Z5sSei7J3gjR6XuvykTCbKLKrHc1zBzj24gfXRL99FeJPOokFdGKiyel4Et0k2Jum
         5HJA+sAMIQ98TDLTCDP35388RqAUqCCLAUcVDZteVg24eTiR+Rhd8oxcnMlN8gXHaUVG
         Q0068JkxdhdTwmhFmqplMGz/SHyLc21qSj2c8o0+jwW9L0K42mTqY8NWUn3qJW1k0HXn
         C7W91FaMdYPE9Sc9Y1oFUOgOjGRje9/kkngY3jhJH8t6cM3Vt3QYXF+KcIVwlw8G/K5z
         g1Uw==
X-Forwarded-Encrypted: i=1; AJvYcCV5tfUArF0SDM10Yokc0t+q8RLefGWRQkZ/PwumXe15hS7a0WsqUH1MjY2K4hfyyyj8APKOGP9slkKcl2yy@vger.kernel.org
X-Gm-Message-State: AOJu0YxP/je7RfwQNsD80LQPRzWrKoJ6PrFaOt5C5e036wFLG2o8ur5q
	KkZPl4cHINY2diLakokLxGZptHYabVHKdylHfOYuy3TKwIdtsM0SM2FMN3EnapFyXEmbshCx4a2
	4fyctew5ZJ1VN3ElSo13pJt4HRydUYCI1xhmpRYhXLJLqnPmTpjJ5gWeJEAQhbYhPPU9/
X-Gm-Gg: ATEYQzxIoTIa3cOtm6OJ/1sE+MLTWTjm/j/pdkhW6C2DLOwRVxD1gK4I7kFbZb3D8EZ
	QatzSMRVNwWiF8Zjnh4wVoVqCFUnGXh3Ic7F6BhnYNGoAW4FI/lxNb90t8rYVF6ZfrfK6jLslx0
	ras2LN6ljjIa39nMFpO5kj0t0Qzf3t+87EoPKocFouf32cD44rBjx42cEPmzPEi4Jl9027h1Mhz
	CpAqMznR3tkD8TbPuJWLcSmhEOpScuE1Wlj8d9yl4/JCwutN5AG5pYphP94m/cPbC8/hcEJdOTs
	HvBVLcdiljiSSkyKoBVQ7AXks5Kpl+wrK2ef0spEBuWj3PrQWUEftBEMLlJAHunts/m5kwidzuD
	8NtIPxBV+1dT8R1m95a1LVLDwJ7pdKsg6EDSG6nUqMtDhRqwGo3p24KA=
X-Received: by 2002:a05:620a:290e:b0:8ca:2baa:6656 with SMTP id af79cd13be357-8cd6d461f63mr1458821785a.55.1773069867935;
        Mon, 09 Mar 2026 08:24:27 -0700 (PDT)
X-Received: by 2002:a05:620a:290e:b0:8ca:2baa:6656 with SMTP id af79cd13be357-8cd6d461f63mr1458815085a.55.1773069867392;
        Mon, 09 Mar 2026 08:24:27 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853a59fc36sm192812515e9.9.2026.03.09.08.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:24:26 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, m.facchin@arduino.cc, r.mereu@arduino.cc,
        loic.poulain@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/7] arm64: dts: qcom: Add support for Arduino VENTUNOQ
Date: Mon,  9 Mar 2026 15:24:11 +0000
Message-ID: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzOSBTYWx0ZWRfX6M9nZFce8eSC
 mIcN5MfmVtg+pTO9xjankGJl4o/VRniqG3XVO3H4FhzGOEcAnBwId7LGBBjX147Wt+Sl5EtefAy
 tO1BlZP9CXL2a6cC5zuqy+vHeNKH5gNbytW9lOoOGCer/8TqglA/CMMNEUS/NfnOcprlfY1/c/B
 2phrDrd2RmbqLCzr8dDvMHeQjJLds6L19lGOi2ZXq8AQwdrUlIn1jKjTlgYzAHmhMu6yDdnEpy/
 xdB5RWRu6lt4QWa07nqLKbe8X5Xz5QGu98spXQ9NKKvBc3Cq4wO+4W1br9gsmTTUFbRTcnBmOFi
 +0K3MiFZDeFWm2vssNDwG5P5GiF52nOEjyrN5Vdu9/1eCql4Oc3jH+YRH9Z6JYpyEpK/b223ewi
 EkZh/XP42KQzXrkZBi2PbY3amwxzBYs9Id5BPBkW8NF6u/NkaWOgliHyfvxUNjjeu7UG/eSBuMM
 iEMaIr+0rvA40+oiQaA==
X-Proofpoint-GUID: 8qqYJs3c2Db4X7woOQu-iSFekRp9h46q
X-Proofpoint-ORIG-GUID: 8qqYJs3c2Db4X7woOQu-iSFekRp9h46q
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69aee62c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=Ar_5JxPjAAAA:8 a=6arpMgwqxbr1QNdnrLkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090139
X-Rspamd-Queue-Id: EDA9323BBF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,arduino.cc];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96288-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,arduino.cc:url,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This patchset adds support for Arduino VENTUNO Q board, which is
announced recently [1]

VENTUNO Q board is based on Qualcomm Dragonwing™ IQ8 Series processor
along with a dedicated STM32H5 microcontroller.
This patchset adds support for below peripherals
    - USB Type‑C connector with dual‑role support
    - ADV7535 DSI‑to‑HDMI bridge
    - MAX98091 audio codec
    - 2.5G Ethernet PHY (HSGMII)
    - PCIe0 (to onboard WiFi chipset and USB bridge)
    - PCIe1 (to M2/nvme)

To make dependencies easy for new audio dai ids, I have used numbers
instead of defines.

Audio tplg is available at: https://github.com/linux-msm/audioreach-topology/pull/55
Branch based on linux-next kernel: https://github.com/Srinivas-Kandagatla/linux/tree/arduino-VENTUNOQ 

Thanks,
Srini

[1]: https://blog.arduino.cc/2026/03/09/introducing-arduino-ventuno-q-your-new-ai-robotics-and-actuation-platform/


Loic Poulain (4):
  arm64: dts: qcom: monaco: Add HS/SS endpoints for USB1 controller
  arm64: dts: qcom: Add Monaco Monza SoM
  dt-bindings: arm: qcom: add Arduino Monza, VENTUNOQ
  arm64: dts: qcom: Add Arduino Monza (VENTUNOQ) board support

Srinivas Kandagatla (3):
  arm64: dts: qcom: monaco: add dt entry for lpass lpi pinctrl
  arm64: dts: qcom: monaco-arduino-monza: Add sound node
  arm64: defconfig: Enable configs for Arduino VENTUNOQ

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 512 ++++++++++++++++++
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi | 325 +++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  89 +++
 arch/arm64/configs/defconfig                  |   2 +
 6 files changed, 930 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi

-- 
2.47.3


