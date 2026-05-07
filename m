Return-Path: <linux-arm-msm+bounces-106461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFoOOcmu/GkNSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:24:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4544EAF47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56C60300A32D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 15:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D37C44B690;
	Thu,  7 May 2026 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k8h5R0ij";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DH36wwNy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF58428833
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167489; cv=none; b=bzx9Haz9BCQFDm3acLyTPOncz2+VP17xkYtJ5SHbVDB/XNq0zaAd9wwRQwwDS9YtCXLIBzfd6yuTNya9g1Uw8NGr4sLVpNPzgRKIvhh5ojoWknksgD6XiPXtKNBji6shKJl9aU4cVuNvqn3D2oVAT74GoH58GUsOoWaMH6GPMP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167489; c=relaxed/simple;
	bh=5KQoGnk9u9fm+Mg4M42ByM0Fv8LDHLHP6OO64Ss7GoQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HjO6lSQJESqtmgKtsvpZv+emQGicD8sQFGBsHkaWTh7JelCcgPsb2fRN7OxNMdMZlUdqWDwbUNzbLS0KnwPl8u+cjAWePWDh2TKKsqb1BEE9V6aPGLHbNavCYGoXRKTg0FzvDg9NHTvwDskgqotyB8PoCDD+FOhuR73WKmc++5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k8h5R0ij; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DH36wwNy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647EQ48A1425037
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 15:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ll9F+OHyaqBGDElRAI8+n6
	uN+ffWtRJkbXYf6NPAuHA=; b=k8h5R0ijahFzuRDRmRUn7uXdx+KyXMsH+h7rLk
	3jP7PVt5uJcLOJpzMXlNU1oI4smB0XWqzpO4A7gHp0Gd6Jd//fnWaZZ3rADFAiJ+
	1uGBcuWQJ6zUf4Gjaowq09Fwm2EBJjF5YIiU+w4qZxG/36UvxIHfLqSBlrT1Ke55
	yGBqQFFVyDI6fR65KG7eeuyae6g2o3x/znT0M9ZJPJ54/sezk3mf8FwBpMAebbw0
	3tL5x+jWjmpR0kpz4jgt9u1gV+SuJrdQPmWhPLV+6uxxh/uENLdap5bnY6pn2ZwY
	ad+QtWucv8jO94JFtso3NYpj60iyhE97916RLysWnKrpo2GQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfsqug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:24:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f6ef62af1so2208054e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167486; x=1778772286; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ll9F+OHyaqBGDElRAI8+n6uN+ffWtRJkbXYf6NPAuHA=;
        b=DH36wwNyXkSm99URXXLLMGoARStW4Pynwcx8/86nxDJIQAAiwTikOBruFRlqnOvtdx
         DQZEEud6fEhdGukTHLaBQwSRLNOJYd6YAWror9H0VlTRD81BrSoOUSq5nLn29rBHOPwE
         ND+qXCBcyrvz/S4YXjJCgShH7PFc58x2ihpYWnQ5KxH7PiLmUeW1IAnkJd6puubggFKp
         9vTysod4LbI5Pc8S+0OncxxEHOlhwINsHj0HjMbg6b6ZbQgf5r7BfvTJkVfbQRvnfGaU
         q5LdPUFdw/9EPvDHEdsZm9zjngrGEXVPYwQnduj2ZoU6wrMmXxuN+wXMZoLOGGjD8ACN
         NYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167486; x=1778772286;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ll9F+OHyaqBGDElRAI8+n6uN+ffWtRJkbXYf6NPAuHA=;
        b=Q0sZWkASZOI6Mp4zT+BDIWESWtz8Jq9L/5ZbWEopgCF885ipF2tguXbg5CjPGdBxkE
         wUhRlUhgCy+NK87baEtpHHKpUBed0iKgRP4NgvcREiQ0yN8nYoAAFlZiVasjw2o/+NOo
         okeZMqglgx/ZR57wrH/bCmqKaIE2ds6+d9BwUbce/qfF6wJMVMDDuxdQKsSBGW7VMOFe
         YxB1TCtuJxUMZbf6Lcletf+8XcEXaHiMsngx+A4ieeIkdkMopnHGW6L/MF1dc6XtAqLO
         JhxYC09Hpn8iE0DvhBEqn96L5zvXIe3Hq2iLFa7ymMRHdV9T7wQi3Psur9Tc3aWGfvaF
         zJrg==
X-Forwarded-Encrypted: i=1; AFNElJ9ocN9K/X2XZtSuv4es4GlW1Ka0rxsOBZ9HeK/GBFT819yVEkjDm+lki9XegZol6Xkvj7oEhOrtSY5nA15J@vger.kernel.org
X-Gm-Message-State: AOJu0YyCWye9PM68ZhGr5YAtsOPO47Y5t/nTHECmK1j4/UyCIy2WDk31
	YjLXTr5MnKhqcvNXIlgQ/0ALT2jz7pI4pE84NSwwSbbLUWBreuLoBb2k0M0SQ+ky8zlYPklDU18
	8gtrOaf7GF3TT9VC6phi6tkVhiO0fquUcyNW+6l2fx4Rv5B+5mnYHgkyIf4YGv1+TGYZg
X-Gm-Gg: AeBDievWqfcPCXjGO0gjL3+YsRl3QjpO0xagHTEGwjwLmHrTJKhBmwD8/gbI0hGsffn
	rKjVoPS186C7+9CPrs2K1Qwjf5bfVD2/XnLPqSDs2ds6ivZfFKd8akewG86t9QA/DS/rUO561t6
	rBvfj3oeALO/LZvplwWJbIuRXr59wJUqVRCcXPQj56KKOaezGQ/PmdSFyNOWEz/vZxRcXPNK0/h
	MrVKSiHO+LpR11PEhOg80j8gRbhoH6gu2T6C4mSiY/pOhjdNWBtiMlMsgVkN/foBhvSn/Cyq75W
	ahQExXVMgFVGUCGd8PUjsQ/uiYbTM0RGUMDh62ZQdg7KHfLhzYJ5iSr0esmuQN6rqudF83zylNK
	NRSjQTCOFQzfLVFIQ67uQYwxYSPw+fn4ZfjaryOtQWsi1lujjQSGmCjspYNvQINU22qIftVjHcw
	HNMpzLTx353El0xa4fULd9sQS2m5Y=
X-Received: by 2002:a05:6122:3d01:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-57559517fbamr4919073e0c.7.1778167485663;
        Thu, 07 May 2026 08:24:45 -0700 (PDT)
X-Received: by 2002:a05:6122:3d01:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-57559517fbamr4919017e0c.7.1778167485065;
        Thu, 07 May 2026 08:24:45 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:44 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/8] Support for block device NVMEM providers
Date: Thu, 07 May 2026 17:24:35 +0200
Message-Id: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALOu/GkC/3WMQQ6CMBBFr0Jm7ZBSEMGV9zAsBhilkbba0UZDu
 LuVvZufvJ+8t4BwMCxwzBYIHI0Y7xLoXQbDRO7KaMbEoJWuVaUb7Gc/3JAEXbRssepL1XDTj9Q
 SJOke+GLeW/DcJZ6MPH34bP1Y/N6/qVigwppGXfJhX7SKTl4kf7xoHry1eRro1nX9AlXgVHSzA
 AAA
X-Change-ID: 20260428-block-as-nvmem-4b308e8bda9a
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fcaebe cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=ePHxKecWVazTPeOO2bAA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX3kOzbpsGG/LH
 nRqpAw07bb2Ay9LV2gQ91WPcNhsMSGg/56Yk8VeP+U7RM+jaCQxNW4oQeBMjU4rGDKEiOP3M79p
 VWMr5ByPH8F2Cv22NbKRy7ibJgmaviLo8Wuj3c99v+3rEVHCqTpW8ZGsWUOowLYd+lXK6iUy+Ag
 6y+LJaHRhEOLH5Q/3B70OEq0h20DYYAufVWQvhZ0kOuBygQpp3sSYWK8mn868gdboYR+/Q9WFxf
 SXE5PwKPt+o/pW5VofFCDLzg29rxMcPvLB9Gk5dMPoKpLXmaSZItRE4lVGjJntiJNIPqPAo2Qro
 fCPq+zaH4oPqiVzRgSNRQVc3tPifY8YaxxHWY3kILJHskJ41uGg3wDfH8F03Kpo/ysTi7CKCCzP
 Vsw1CLG/xCPD+SpORZriHYl62XpI44H0So9LbnywQWE/J2h94hrUeHgjC2pWXFEfpGV4jQ2PEQE
 7U6gta9unuiL+W1aQrw==
X-Proofpoint-GUID: 2r8BNrkzV2qKZt5YUxsYBl2_isX4QHIi
X-Proofpoint-ORIG-GUID: 2r8BNrkzV2qKZt5YUxsYBl2_isX4QHIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154
X-Rspamd-Queue-Id: 8B4544EAF47
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106461-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On embedded devices, it is common for factory provisioning to store
device-specific information, such as Ethernet or WiFi MAC addresses,
in a dedicated area of an eMMC partition. This avoids the need for
and additional EEPROM/OTP and leverages the persistence of eMMC.

One example is the Arduino UNO-Q, where the WiFi MAC address and the
Bluetooth Device address are stored in the eMMC Boot1 partition.

Until now, accessing this information required a custom bootloader
to read the data and inject it into the Device Tree before handing
control over to the kernel. This approach is fragile and leads to
device-specific workarounds.

Rather than adding a new NVMEM provider specifically to the eMMC
subsystem, the new support operates at the block layer, allowing any
block device to behave like other non-volatile memories such as EEPROM
or OTP.

This series builds on earlier work by Daniel Golle that enables block
devices to act as NVMEM providers:
https://lore.kernel.org/all/6061aa4201030b9bb2f8d03ef32a564fdb786ed1.1709667858.git.daniel@makrotopia.org/

It also introduces an NVMEM layout description for the Arduino UNO-Q,
allowing device-specific data stored in the eMMC Boot1 partition to
be accessed in a standard way.

WiFi and Ethernet already support retrieving MAC addresses from NVMEM.
Bluetooth requires similar support, which is also addressed.

Note that this is currently limited to MMC-backed block devices, as
only the MMC core associates a firmware node with the block device
(add_disk_fwnode). This can be easily extended in the future to
support additional block drivers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- Fix example nvmem-layout cells to use compatible = "mac-base"
- Squash WiFi MAC and Bluetooth BD address consumer patches into the nvmem layout patch
- Fix possible use-after-free in blk-nvmem: bnv (nvmem priv) linked to nvmem lifetime
- Simplify nvmem-cell-names from items: - const: to plain const:
- Factor out common NVMEM EUI-48 retrieval logic
- Reorder changes
- Link to v1: https://lore.kernel.org/r/20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com

---
Daniel Golle (1):
      block: implement NVMEM provider

Loic Poulain (7):
      dt-bindings: mmc: Document support for nvmem-layout
      dt-bindings: net: wireless: qcom,ath10k: Add NVMEM MAC address cell
      dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
      net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup
      Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
      Bluetooth: qca: Set NVMEM BD address quirks when address is invalid
      arm64: dts: qcom: arduino-imola: Describe NVMEM layout for WiFi/BT addresses

 .../devicetree/bindings/mmc/mmc-card.yaml          |  24 +++
 .../net/bluetooth/qcom,bluetooth-common.yaml       |   9 +
 .../bindings/net/wireless/qcom,ath10k.yaml         |   9 +
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  34 ++++
 block/Kconfig                                      |   9 +
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 188 +++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |   5 +-
 drivers/nvmem/core.c                               |  13 ++
 include/linux/nvmem-consumer.h                     |   6 +
 include/linux/of_net.h                             |   7 +
 include/net/bluetooth/hci.h                        |  18 ++
 net/bluetooth/hci_sync.c                           |  39 ++++-
 net/core/of_net.c                                  |  47 ++++--
 14 files changed, 395 insertions(+), 14 deletions(-)
---
base-commit: 47c4835fc0fed583d01d90387b67633950eba2b2
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


