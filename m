Return-Path: <linux-arm-msm+bounces-109915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFAoM5frFWogfAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:51:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9E25DB921
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7925308E654
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 18:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580CF421F12;
	Tue, 26 May 2026 18:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPUpIaqm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5f8bv/P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0543C0A1B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821055; cv=none; b=rosr8vRPTChJfKWqFgpF6gOLj0ssb1XkhEXN2WbXnGsO2sU5D1M3NKhpO1UN7mk9J5Yn5QvWcg8nTb3GlttdBMK1fYMW7nI55IdeAnN95RRYy/p3UNRnNs11RPLqnBfTkLWX/9hE8O5t3Xt9Phekd07AfP/rAjBShCeozgWTQNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821055; c=relaxed/simple;
	bh=m9wxtDMZwdDXxuS8fkMy1CcuHIeHi+XXMXrjt+8e1Vs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qyn6uP+e61SLXwys9NA8X7HycYqUO4MyBf31kioRC83tezcXgcukVoTJM2fV1yLoUxRJbzcvxGcMrDMop+ya8jLtuHvoIsTls9qJtR1EUJZI09MkQ621m2K1EpvHQ9351a/xResxOGxSGtGqqkRuvdQ95tSjb6HHWezZsT/hMpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPUpIaqm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5f8bv/P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QHgubl2260818
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5FejAGL4pNOnrqngeFle1ZA/WbYFf5I2uXT
	jAH4zNhY=; b=cPUpIaqmJQAbB68fG/JKpOcKxIdFKDOOh05njiRyblFpG7H89jq
	r27aiW5/t3MJ4drypijutHKmZkSdgkhBaeqHnHmmQLQXWuBVpViM9oTVzelJU99C
	JPPSjL+b+jAa5SIGAbDMJWilECd3T9RVDBG8N6U3hWCdDoR/jDHRhSIjpJelO8sr
	JUuMDJM/NId75z8qZMKAJjQvfZdQ9LnZZ0CpO3Ax1p3t8DSi3gUmNqud0l6FLLBU
	+3xrGD+I9v8wE0inVHVziObF6sowj7TedhtOWmL8PosGy8arv2zvXL+4GD0CpLke
	SlGvHC0jqoeTCj/kg+3Ecb7ZOph7tAiLYig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edg5p87hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36a8ee809ffso991313a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779821052; x=1780425852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5FejAGL4pNOnrqngeFle1ZA/WbYFf5I2uXTjAH4zNhY=;
        b=J5f8bv/P/1U8RfIQMzSGKjtdp3nWNhgfE7he2pV/1H5Yp/CfvMwHfbJtxO/UWXSZGM
         a3H5z/lU2MtRiOqko2QoQTbzmR7NAeM6SpCbimH7PqBRLVq1fQAkGak6lE6GXno4157E
         AY1B64STH6rnxTOeue7r20CitFkVdGGDHupp/exhy8xnVcTWdaP/vA/O5eO4MrzDkxA1
         ikn7ogbOiexxpSP5JDYvDvG/pJqxq+sNcME92C/8xeKP9oLwUxdo7/hn5MkB29thoaL1
         I2rfLOTUkzknmers94FpV/ArW0JjSXJdN02wrGM3FRkvuPvU73mIu1EoguKA1xTuPwtE
         gj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821052; x=1780425852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FejAGL4pNOnrqngeFle1ZA/WbYFf5I2uXTjAH4zNhY=;
        b=gFLFzlQerRAhizfA9ctH4caUYEP7eEOBm+HYfysfLEMSbCsrVWlEGJCyBnW71S4XlD
         3Koa/5OAMuuvG3+6m2yCMDbpbKYW2gWzEvrvsPH6EMB/qkIozjAJsp5KnXjsUN6lGE8q
         Xbr/eHvLcHdWoQFgEidPuCxZNYRyqG7j1T4AlzBef8qa+8SNigPn+SHIiG3GX2Qtik1j
         nJXtqpSyiMW8LpL7VVq7sKcFlSkk/18DvXOkMYVc/gLGMLNHRX1bfTY4cWGtScbVyvB+
         PS/b60TjWLkU6y+EWD4Tcx5PahKtgRmTC8D3llZGm1+N0Ni2lpaW5WJ/+Vq8WSq0P+I3
         sKnw==
X-Gm-Message-State: AOJu0Yw90qqnW03Wiz7MqhF786U1ct/aro/nwcPgXsghvNieFQkI5yXh
	lVfYsedWRpoq1uVggwRQzEy44/IGR6WV+1E15fPQdoYBi5gF7Rs8v++NJQyWcvpf/5aKD6DuyY8
	x++CUe/OKAjTussmDgw3oo1KRdtW6o02FRZAmIcYrfPg2wQqcxg4EVIKAVmA9TxRw/10=
X-Gm-Gg: Acq92OH2CUGfFFbtMeK++OCABOnGsw5zsEGeE8A83SeuqFtlEp5wBP2M7PO/1FF+kvy
	9Q1+AjzQAK98VkkaeN+Lo+YhEprET8N7d2vHFXRu9XztEl9IcTrewjYEzS3aD0WUNO0IM0OKcwU
	bUYiHkzL+mxTzDvyCFEi1mNhi6OkKgYmK1W3FDVkbWZcL/3vobRfFES7AZfYhjGoHKxB5lli6ew
	zn2IClCzQhAAB92DT7hdg2FzaTjdmcQtfTXYu5qy9pHn9i+4SIKecQXQw0iPufmlR5jDKo/WkFr
	0h+PUmhTtHErlCibPR12jptlvkTvGqZDK1T9uMjiNetQ4ZguTEqLyqaX1tH6AQzUnSOiEZtz4Df
	m/mrfDXxhu1dq466PZzCPCbTy83t77kxqtSIhUlRAHbeETfn05CbJbXOSs357k5s2
X-Received: by 2002:a17:90b:2c87:b0:367:d436:81e8 with SMTP id 98e67ed59e1d1-36a6787ee39mr10816325a91.6.1779821051932;
        Tue, 26 May 2026 11:44:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2c87:b0:367:d436:81e8 with SMTP id 98e67ed59e1d1-36a6787ee39mr10816295a91.6.1779821051446;
        Tue, 26 May 2026 11:44:11 -0700 (PDT)
Received: from hu-ppratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm16866628a91.9.2026.05.26.11.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:44:11 -0700 (PDT)
From: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add USB Phy driver and binding changes for Qualcomm Shikra SoC
Date: Wed, 27 May 2026 00:13:57 +0530
Message-Id: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zTqm_m1T5Kk6QkPZLRSlK8XFpSPLrhUH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE2NCBTYWx0ZWRfX6I62reUKW+Ig
 AtnjKsvQyT1NRJxHBhQUp3x5QrsCoBORRA3eZtque2oruhoMi06zhdgj+gD9JkulrJm7V7rA1++
 jKMEimpiECht+EZG0VkChKYE147mFI0awG5WfI/XppzIj1AD+iChuN5cTTx0Sr+CS+nid7M9P+i
 kCMyEMOafDHSjJNHng4NxhZC0FNoxA+2k0FB6Pu7jggSZ/AmkRKPeg58fQOpyEG62fRHDhDbVkY
 vs1vzrRcgD+8q1E+Yobdef7SOKlfM9pXrAaUlGX1v041OYfZr0ukIaLly6WEqyCG30oZpjC0ERO
 OLO2CcovdypB9PTnkeEhaHVv6GyR8zBHwu5vxnxK2x3iEHeG77dZr/OAotUQ78njxnFHa5mbbxW
 ZZ+fVLPS3/bV/nA5EiCVpHiA66kXW/XfsKDcZFFRQajwSPcsjXcfAuEzKxdifMxZTvh5+xhitdr
 1okyrYq7xJmG9Nh/ySw==
X-Authority-Analysis: v=2.4 cv=I95Vgtgg c=1 sm=1 tr=0 ts=6a15e9fc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lodECODDCjcd_M0iS_IA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: zTqm_m1T5Kk6QkPZLRSlK8XFpSPLrhUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260164
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109915-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pratham.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E9E25DB921
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds Driver and binding changes for USB Phys on Shikra.
There are two USB controllers - One of them is SS capable and other is
highspeed only capable.
 
Changes in v3:
- Moved to using qcs615-usb3-dp-phy since the DP Phy is present although
not operational.
- Using Talos as a fallback for shikra in qmp driver
- Add required "phy" reset in qmp usbc driver since its needed on Shikra
      
Link to v2:
https://lore.kernel.org/all/20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com/
       
Changes in v2:
- Separated the usb controller binding changes
- Updated commit texts.
        
Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com/

Krishna Kurapati (4):
  dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
  dt-bindings: phy: qcom,qcs615-qmp-usb3-dp-phy: Add support for Shikra
  phy: qcom-qusb2: Add support for Shikra
  phy: qcom: qmp-usbc: Add support for "phy" reset used on Shikra

 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml | 13 ++++++++++---
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml  |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c         |  2 +-
 drivers/phy/qualcomm/phy-qcom-qusb2.c            | 16 ++++++++++++++++
 4 files changed, 28 insertions(+), 4 deletions(-)

-- 
2.34.1


