Return-Path: <linux-arm-msm+bounces-94387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ0jM982oWkbrQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:17:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F4C1B317C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 539EB30C2226
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90869363C63;
	Fri, 27 Feb 2026 06:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPnuW/Ff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3Ei3+CN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306DB33344C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772172957; cv=none; b=T7rSLosReud5sxCY1bslc6OQdW/AVPKaMf99VQc4tKeCmLSyDzOWJoNtgnydNSh5JOZ8CqGfNqLsGkezfgh2aJrisMqT3hxjqt55Ao6650OdZopmlNl+9A7sMBTDh+mp94WIDQIHhsrHYJgOvbzCDg+fPrmDqJwFFiVzLeBovOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772172957; c=relaxed/simple;
	bh=CK1EiWH39nIgMGzpiIrw0qj4PZJ7T3qmsANCuWgg3Qo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dG0evj0tHZh9IwHpvy9NxV+kO0HeckyQ2CExCm495hVAZ/y9maGxMck6kf19IF2/+FubHntSKFBpcro8m/cf/go+PLAMW7d4NOs3uzdTR+UYXrvSOng/rPd6J3KKF6VkAn2s/vNGRoKEkVXsyM/rj6k9T+HmV6y5n3AcjEaaRKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPnuW/Ff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3Ei3+CN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K2FA1874156
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=y+YVL+8ip+GvScu0qrmLIG9vdAth+JBxGdw
	WOLm98ZQ=; b=aPnuW/Ff01FGBG9I58LIoQ1oZQIynm6tPSWrFeT8TV0eG+wvbmR
	Ay3brOoscnhptvKJUGwMalMut+15GWQy0ZMA4s+0HY3Q99GXA7BC2HAR2j1OFaoV
	b3BRnVS/XHUEnld1v56EASvM/iVvxt3Turt5cvLjaYlQNcxMx38vSLF4+ym59+Rh
	1znWCWnhZI5nkgyYpvk0FHfuDDVpdfxozfsnyPf5ZMBbzWFVtNML2NuxSz3q89rp
	EisxyhVP6wqGADK2iejjZrQH3JEZ1LiReuPkFA0ujaRQssZZp0rQPBNP1DJIlTEL
	PHmqcMUC8/HU9cHAYraK3Cwvvr+v+v6nLEw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuytstkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:15:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aaf0dbd073so17071075ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 22:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772172954; x=1772777754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y+YVL+8ip+GvScu0qrmLIG9vdAth+JBxGdwWOLm98ZQ=;
        b=A3Ei3+CNwHImB/zXSJoRLUJyLUrmreAYtUeK0C2VqitLr4ezGJYxLUBlS4vtr1nkpl
         DTHH9lT5S25tZ3AEje0aTdvmB14bPxsuG9wZW1rQFe2HRuMnO6eY4gOmPVSird0keZEt
         sGCuFlFsekyB+eZ0ZOPb2c6ZBLuR2XPRYh1b5GXv7UyL6o417GzGTj0oRx+LAwht7Lx2
         8WfJ4hszWuFNdbM4mR/0Hhzpb1WZV5DvaphZi09MbA6mAI/yAt7WlpdTMOYtdSYIbQvv
         qESzXcTM4XAMAUs9uYPOvQEH+8gs76QXp5NdTiQLUenxY5oHFzOZvZR6zZfaN/5pmb8W
         PCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772172954; x=1772777754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+YVL+8ip+GvScu0qrmLIG9vdAth+JBxGdwWOLm98ZQ=;
        b=LuJsquuDOF+kLM1cybIcUUo8ih29yqz4MOMXlPLqx/nmxhC70Aso76t+zpd/fwjikW
         FVD20kM3YJQ3LEy8E/S+9Yh4zqf7OvgnI4IzYYEvE8Z7jrIwTNqak58T6Xwh0LItlwsW
         +xyPXsDAi3izMnUQ+wmEOzXa+Ldwy+ulQlyS49XCEqDOkOdIfJl5CKeDHO/QcBdTvwfr
         K9fECQgg4Go0Z5dg9MsAK279mA4Q2txiV+MnZkYtAo94mwqyBawSoBGB/Rutkm8ZQ19V
         J6JbuRAPWFNIBjmIcsSzqA9n2RZ5iPPwCxsi+vMdfnWQoAkaiJEkAfEpUJe2+wXwA23r
         GP9A==
X-Forwarded-Encrypted: i=1; AJvYcCWwO3nuA8rdEFmEr5DwAzEVoLHuFpawx+kvSqh5AhGsNR74RSypvpHYgMUxNh5ghmZMJ4NowUfxhnUVy2wq@vger.kernel.org
X-Gm-Message-State: AOJu0YyK2DzkC/iSPhaWpP0aCULu1lbBGsb/QikN/0ta869jQE/3GKUW
	q41ripI/UJNgdvrVjsqZZcn7ohlRkc6G66/zu5nAr/9GKHCGHf5Tm6Bi92gAFnSFkVZIHMiCS8A
	XrlTEwTgi9tkjA8eeTnAYukcnfg0yf1gOL376xgifnKoqaGwGNvJxwZ3FpomnLUdEK0t7
X-Gm-Gg: ATEYQzwTXyTKIlO+0hEH4gchFmgtT6rXugP6FYq4nZ8X6zArhu94EeYr8TU9mGyLjTF
	ZdK0p7BXG4Vc3QgenT5IoDO0EcTmMbdtw2te891hXF6gqFwCNz30Pg7dkuhwBMh1/os6/xxdOw9
	MUNRkGIzXhRQRN/DpqcQU5ismMXu8zfQEJkvf1PMfqGL0znPuxvFZUDHuyP/ZCn6q+Xgza8hnAF
	DFfDEgw0Cckeo1jrp+aBLXjmVl7idFu2glm6QoALoFTNgZpgRSi8gfyTrPrK2Xz+m37hAsdMV9s
	xeRMIPH+VcCVoC1/zYuET5qQQQ5O3GnfSxBUQWdD9iDDy1WxB6RPCKKWrVeslAbtB9TV9iYa8gr
	jXvOl/h9+6TQCqhpJH9DZIwleu0/2f1Guai81WU6df4b5J+Ls2PaN0lE=
X-Received: by 2002:a17:902:c94a:b0:2a0:d34f:aff3 with SMTP id d9443c01a7336-2ae2e3f14fbmr18877375ad.18.1772172953988;
        Thu, 26 Feb 2026 22:15:53 -0800 (PST)
X-Received: by 2002:a17:902:c94a:b0:2a0:d34f:aff3 with SMTP id d9443c01a7336-2ae2e3f14fbmr18876965ad.18.1772172953429;
        Thu, 26 Feb 2026 22:15:53 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a043dsm64813025ad.54.2026.02.26.22.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:15:53 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
Subject: [PATCH v6 00/13] Enable I2C on SA8255p Qualcomm platforms
Date: Fri, 27 Feb 2026 11:45:31 +0530
Message-Id: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bJIb4f+Z c=1 sm=1 tr=0 ts=69a1369b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=8413JC8MLbS8ckBEwAwA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: O4IsmBQU57jmr8EPAgdhVgqMdh7y6nLv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1MCBTYWx0ZWRfX9LdcDcQ77VcC
 L9JDfaUV44JZJXBdoJbSGMbmuEUf7txhPr787TjCBrEG2UgfiXerecWsLc8pDtsmiCV2kXtKTxR
 w5RZvC2wOueJUvNq9f+d4kkUblui2+LVm9ZmYYO+iRCwlkojO+SB+Xq/Zsoemqr6oO+coFdg0up
 799XvqSZLS8chO1TWjD99mRWH8BbXbya71N75RisK1w9vJqB8oczK0cKNzEkJtgutPhZp4lbJCT
 +XaedEykqmdiGipG8gw9DyzZD0dI33l/iciiPwaIkAqlVEuh5qygRFDcrxsf2NZr81f1kd9A8A6
 gqx63GClsmwJ0+v/tolWxX5g1/Dwb4PB89LjlyJ8coP7u0lk5rudcLjlR3Fb9zWrBB1HIEG/jby
 xdAnT9FtEJ4kaSZVh2WREgB2e/BKLtgcQlS5+wPAkiNF93nQTZ/AMPG+9pfO4Q4ZOcpcoUQvi8P
 CSmuk57Uf1fEHKQ2wmA==
X-Proofpoint-GUID: O4IsmBQU57jmr8EPAgdhVgqMdh7y6nLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94387-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34F4C1B317C
X-Rspamd-Action: no action

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages I2C frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate..

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Praveen Talari (13):
  soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC
    path optional
  soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
  soc: qcom: geni-se: Introduce helper API for resource initialization
  soc: qcom: geni-se: Handle core clk in geni_se_clks_off() and
    geni_se_clks_on()
  soc: qcom: geni-se: Add resources activation/deactivation helpers
  soc: qcom: geni-se: Introduce helper API for attaching power domains
  soc: qcom: geni-se: Introduce helper APIs for performance control
  dt-bindings: i2c: Describe SA8255p
  i2c: qcom-geni: Isolate serial engine setup
  i2c: qcom-geni: Move resource initialization to separate function
  i2c: qcom-geni: Use resources helper APIs in runtime PM functions
  i2c: qcom-geni: Store of_device_id data in driver private struct
  i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms
---
v3->v4
- Added a new patch(4/13) to handle core clk as part of
  geni_se_clks_off/on().

 .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   |  64 ++++
 drivers/i2c/busses/i2c-qcom-geni.c            | 324 +++++++++---------
 drivers/soc/qcom/qcom-geni-se.c               | 270 ++++++++++++++-
 include/linux/soc/qcom/geni-se.h              |  19 +
 4 files changed, 491 insertions(+), 186 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml


base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
-- 
2.34.1


