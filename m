Return-Path: <linux-arm-msm+bounces-106857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OY4KQSdAWqTgQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:10:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F055850AA62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AD7D31C5D7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8D13BED43;
	Mon, 11 May 2026 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDXB7tFJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3mAFOPD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6843BED18
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489986; cv=none; b=dGOJ1TRKEC18si21C3h1Xap7VOIg695u6A0po64+xMhNHBvRRW/gwaRrrHJJ9z6CTaHDWyjVrurMebnhyfMydxhQmDjl6tu55aB08yYgOxB+3e+G54goT6OfLF57g/JX/vv6N12MXWrShDCzDqfoT6fTpYus5D1zcdG2QI23+6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489986; c=relaxed/simple;
	bh=1oNu3Ybz+buPhzmyro4fPZt20fCvfnns9m0dFcIa4q0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r1ccyTPr3KYIVNPgNAotIJ4FNOvEmCpCMGKiUupG41te5ngfwPa/jZeL7ePZV8MFxPH7lYANKnofP169ROp4rHGn01PU9imVJKZZIuK0PQLbxEisDOQMHLSIClqQQDYiJlKdQoeWDTtL0MrFNP73OlfQx9mQRTTvRnx/DMKYqy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDXB7tFJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3mAFOPD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B4Gshu653339
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sOpFRfTS8YZZKvv8cfVsoo
	ZOS+5nbuLmR7onX/pyU2Y=; b=LDXB7tFJqe8MNgAulQFdwdt7IbDrKrUNH/buzn
	4YfrPuvQGVJoISSQPdU3CY3e6S2n2SUH+zUjDfs7SbFuwmYJkAfu3QsXnAArvKpC
	yqsnYDoNs2myCzjNPbQqTa0f9674Q7kh9yLGAM1j3jZ90a9cYHTbOUbPOc/Hqo8w
	jwywuFIJViP2tncz9QzjGW0sENnTVd7GMys4WPWXYe280rb1S2cCsWitOG4HSs1U
	4hPeTiFEOUKWEp7bXfb5f4RHo1NKlrcdIvVtkXku3DAnzONL9Whw7aJQ4po5pGN2
	bXDlYQMeTfeGRrYya8SEsGhZcYGuJtoYZpRSFULudD2IYT2A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xu8xnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:59:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b597b14a22so34243476d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 01:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778489983; x=1779094783; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOpFRfTS8YZZKvv8cfVsooZOS+5nbuLmR7onX/pyU2Y=;
        b=E3mAFOPDy9wO2bDmge/wr31SXl7RAkbQL8b2nOsQe66S5Yt1OxA88p8j7QcgOEXhHW
         YNiAIdACFnpJeMBNDh4zY7yE2qoXS/4wlQtXcwKZzhbvVD+UJeYj4XU6ZCzU6ltyKLDl
         bEPWMZQxB3TpQLgtBCiPVzxsbiZKVLXswZTkVChspuLca22A4yvBmt5gQG+l43L110pu
         rSlW1KoZ93nPvcRnlLKjg7JsLvAsMWCrV4iZL/7GL5NtWQXgyT9W3Bg+AQXCrH4pmK0Q
         Z9czomSHAcT5FtFfXzxu/GO1nOmu+2nAUb8JOSPKzm1r++saGfmBt+2J2JTLQhfuQJnR
         Qyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489983; x=1779094783;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOpFRfTS8YZZKvv8cfVsooZOS+5nbuLmR7onX/pyU2Y=;
        b=KYBG/NR0fRtLxzyUeI6JAlglIC8YB5ulZllxtpH/T+iGto7YqFrojcKlLZ7nIb0ZPP
         f5e826P3ndx6gqtTXofwUe6VuvXOjGJOH6CQY9bC9SrKt8+xAfbsLULvWJmj8hnMNTO7
         YvhJGGQmvJvpNcMS7xpkjWnmstZe57uUfq85kMEqZ55b7jljQzP2xlblGfeCZ7hOR4Tc
         8Sk98yBDQMT8gUOGMZtzqueHJMQhOSTC360wQJWmSKR+wFVRxrCTQ0zPTyV4/5oC4Rta
         XShlvUW4kqciD+XuiRR9PYA47XjBxkRGeXyl/33rP2hxKTUQRyTiyBCi14DCdYYFRKue
         zIng==
X-Forwarded-Encrypted: i=1; AFNElJ/Unp+3tgF2npLwYYAzzaiqKMB/eW5/jET4iBu7SluXI30DaB/gXeREKJpVlN2yPpp3dt+7j3/ysMov7ude@vger.kernel.org
X-Gm-Message-State: AOJu0YxGt8N+u7LfYu/mdgy9O9CrzdKuV5gREMJPuMDEFDO/LV2DfQ9M
	Q5A+V/gpHcIJLzfXPsRHdNBd+JLZ0A7PLdjks0edxwVQDDlwfR3AUz4Y8/HhrL9GKQJ61kkP8nz
	rWf7fafFn2oIN2hfa/q1uK5qptZv9xoMNPUzTXURNqr1cOVt981A/1NRBFDQiJ01SU4WO
X-Gm-Gg: Acq92OHjiAPWeHfl3CSABK/KjHVOv1afohe9YtkQl2F+y1nlUnQvOS8gOma+lZbdvE2
	SM35Z8vIm0o566zP0Q8abrlIbxbKPLimsEVG9Fr3ZBNAiupfPD+MMJC757nVRXN04b4Yz2BaE6X
	z9/KdklCMZ7k3MsiIctQ7v27rDh5Yk0Wb43QnMY4VCNPZxuRHCm34GMXbieqXarMRz2eXv8MliC
	44FDF14O3aKyCX6vd4VKagUzgYXH8/1QkqQDMz+J6I84JVn7zT2OX8BfH2XrBWxSC7MTYZfR4iM
	YHmXtfFYGCfnZj+n4yQPThsgVc3ixnSf86B7bhHboY/orGg9R3ZU7IOJM9xIeb6l66iE22BCpUX
	P2mhlBqvuCoqOn6gJz8y244H3AcAqjcB+gJfH2qpdprqWh8QgPTDGdYIiftdcijkbiUKwiTBUWB
	rx8Wnuzqy/Ij5d
X-Received: by 2002:a05:6214:3d9e:b0:8ac:a708:eaa7 with SMTP id 6a1803df08f44-8bdb6ec5eaemr228212696d6.5.1778489982767;
        Mon, 11 May 2026 01:59:42 -0700 (PDT)
X-Received: by 2002:a05:6214:3d9e:b0:8ac:a708:eaa7 with SMTP id 6a1803df08f44-8bdb6ec5eaemr228212496d6.5.1778489982253;
        Mon, 11 May 2026 01:59:42 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0c7600sm89017316d6.1.2026.05.11.01.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:59:41 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: camss: add support for purwa platform
Date: Mon, 11 May 2026 16:59:33 +0800
Message-Id: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHWaAWoC/2WQzW6DMBCEXyXyuRvZxsaGU9+jipCxl2C1/ASDm
 yri3WsgUlv1stKsNN/OzoMEnDwGUp4eZMLogx/6JPjLidjW9FcE75ImnPKcClrAuEyfprKmCwG
 EkkqrWitkgiTHOGHj7zvt7XLoCW9Lgs7H8oeZTmxESfODCNE7HKyFRE6zwYaKTHGFwpZRkt9xn
 lbOFbSmG0yF8R24kNKZRmRO52Xk/w2ScZ7DnruaxyvUPDNZoes6l6aMjG6O2gQEO3Sdn8tTj/c
 ZniE12d5pfZiH6WvvKrL9n6MWRv/UEhlQQHS2yV3hNOLrEML5tpiPjX1Og1zWdf0GvGjPxnwBA
 AA=
X-Change-ID: 20260409-purwa_camss-475787b87e14
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778489976; l=3751;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=1oNu3Ybz+buPhzmyro4fPZt20fCvfnns9m0dFcIa4q0=;
 b=itnupMO7HMBiBn4z4X1G/wyt7NVTpuif222EmtZUh7oyuzGxgmIx5rCy8fnRihpZGy9BVfrH1
 s9iscvcy6WeAE/p7xZBceWo6CZlA8Eo2AsPmFfrOsxknRXEgY0Sx3G4
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a019a7f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0LVA6Z8DDARUrxZ_zYcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5OCBTYWx0ZWRfX8L2XPZ4yqF+F
 axXo0w3NucsyX7Fgy7JCT9wzhkGotGXNJOPorucNHHWix6Sb4/f0D9JXzge+hok/G/Az0CLX9ls
 tR5zINXe35ZQpGcZKH0ilx8c0wY22fytd6bFxYQRYqoEWTn7poJmzG7y9hlxroRy5KImfmmu2Fp
 pRiV5dLKNwy89ACUXAIxpD0k0otYDL71T/B0BaSWzVywxtb5303nfi5Xt2Qcky5FZybkhaJ5PXH
 DVdbZLEjqDOCGfDJOFKSgQLIfk+9SmPExcHAdcXymF4UlWKFzNHY+BQea85e7bkhsfUBE5wpmTT
 oY0uVPCKPJrAMu1XNgxunkAVivvfZpNvINejUsyN/F/1buFwhSPLeZCb0GY0EE4YalKsYrWasON
 ESZmVmziraT6k+6TS9K8XLLJ3+GWxZR2NrgQLa6Mto2FQ0V4AtLEFWYNlkav7NFUOdd7k0wuIzb
 7J9XUFAhd7YrxRAR0IA==
X-Proofpoint-ORIG-GUID: 3peUUJm0ThwibK9YX-bKmOby62vf7bmb
X-Proofpoint-GUID: 3peUUJm0ThwibK9YX-bKmOby62vf7bmb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110098
X-Rspamd-Queue-Id: F055850AA62
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106857-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series adds camss support for purwa platform and enables TPG for
purwa-iot-evk board.

Have tested with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":0->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev2 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 -F /dev/video0 --capture=5

This version serves as a candidate version for the blocked csiphy merge.

This patch series depends on patch series:
https://lore.kernel.org/all/20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com/
https://lore.kernel.org/all/20260317-camss_tpg-v10-0-b4cfa85c2e1b@oss.qualcomm.com/
https://lore.kernel.org/all/20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com/

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v2:
- Based on the old version of csiphy.
- Remove Src clk. -- Bryan
- Extend the register block of the VFE. -- Bryan
- Add comments for IOMMU. -- Bryan
- Link to v1: https://lore.kernel.org/r/20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com

---
Wenmeng Liu (3):
      dt-bindings: media: Add bindings for qcom,x1p42100-camss
      media: qcom: camss: add support for X1P42100 camss
      arm64: dts: qcom: purwa: Add camss node

 .../bindings/media/qcom,x1p42100-camss.yaml        | 352 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa.dtsi                | 143 +++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 127 ++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 627 insertions(+)
---
base-commit: b462608de92a7cac450781f9d8d4c7cf3ccf82db
change-id: 20260409-purwa_camss-475787b87e14
prerequisite-change-id: 20260506-purwa-videocc-camcc-fef043727e4c:v5
prerequisite-patch-id: 61bdb45446193b72dd8a4b093e4ab2f78db2f066
prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
prerequisite-patch-id: a03b10745ba5c628d09fc5278aef832864e31823
prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
prerequisite-patch-id: fecc5a4a13c8e1c35ddd2f35e7469a327ead3b82
prerequisite-patch-id: 24424189b11acee204622997908d85a0efbb2503
prerequisite-change-id: 20260227-hamoa_evk-2455daf43d86:v2
prerequisite-patch-id: 61bdb45446193b72dd8a4b093e4ab2f78db2f066
prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
prerequisite-patch-id: a03b10745ba5c628d09fc5278aef832864e31823
prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
prerequisite-patch-id: fecc5a4a13c8e1c35ddd2f35e7469a327ead3b82
prerequisite-patch-id: 24424189b11acee204622997908d85a0efbb2503
prerequisite-patch-id: a7fbea14628b62a8de096dea420473b283010aba
prerequisite-patch-id: 03fac1de813acb872200c337bb8149620a3995b9
prerequisite-patch-id: a12186bafac9b287c19fd719aeceb8ff1372dfbf
prerequisite-patch-id: 99bfa681b2f4943ba186e9b578945e068c0eaa5d
prerequisite-patch-id: 6b7ec01fe1f9fa4fddbfc1990ee5ebd5e8a2c359
prerequisite-patch-id: 0c5714a743eba31d29bbe5960723d0ae18ed6c6c
prerequisite-patch-id: 38821bf26d8c5e4880d7aecd8e1d12df8a5cc0da
prerequisite-change-id: 20251226-camss_tpg-b23a398bb65a:v10
prerequisite-patch-id: 520491f0d518f3463d429e77444e231fa6016dd9
prerequisite-patch-id: 459fda84ad92fcd4a497d00ce1690cd19f2cbacb
prerequisite-patch-id: 82330aed01b91c49acbd577ba75bb73bcae6ac90

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


