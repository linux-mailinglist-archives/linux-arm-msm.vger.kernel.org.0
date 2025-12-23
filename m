Return-Path: <linux-arm-msm+bounces-86312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD04CD8EEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 11:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2A0C3039772
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAB634BA28;
	Tue, 23 Dec 2025 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAiODTnZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MbD4ZykC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459D3349B1B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484300; cv=none; b=U8R8EZO6/vlH78gJyeSMxhEzVJh7AFozl0TATHX58Th7ckOu0m7DqWHht6x5O2EhFmns+SXfPce4IdS4W6hSSU3qQfiBtJwDr2BovoeOg8xNlrn4Ouo5Shso7UxHVBWNoef/+8zaUwb+xBUnPMmhjdmT/9bMIf6Gps2oBi7aVX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484300; c=relaxed/simple;
	bh=Aessx24OljIFWC+mc2LsHK/66rMxd0lRq5JDSMHPZrs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xlm6bxj1x8sfs2xo0ah/2/++l/zxod5/VPDqFvcnMD1FAduyUxwYhyI74ONL0GVowHoYSVaPZjqls3iBPHLX2ZMUiFKlfjNUF001h5140hDjr1s318IWSLJ07skp+VEoIwNVlYNFfeCPAx1perkRDt8Aqg3iB09DCF/JUZgC1Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAiODTnZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MbD4ZykC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2hM7v2041074
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rpb4W73dFQhb2fFVWipjtD
	js1BBDNzb3ATpS6fi83mQ=; b=TAiODTnZbMj6PmIgx9AmPxt9azJHDmXkcd8QmU
	d2caYjG+9fRP3dpKbbCX/MqqOww+fHK8m4ygpbKLPRL+NQdtRHTDvANw+HiejMXZ
	+KZ0R2ENLChWcctaHwCkWZXCZHPNkiOEf6fxy8W/5G6ncv6HNjtGK81Sk21UeqEb
	uqeir517kr20DQfkuFHKJXaXVz5TqxqtqLxrQfyqOBgi0Jc4ZQbmGEwiCLGBawhn
	6yV7zTd3clbDt+xqTydTPh04zn3+IZOG4drvZZZ6Zyvxl0Dhxec1AtrfcLBupWgC
	0f+hb355KrFHSK76YEr+Bh1/X4sbZbtLvmUKUHT+Kt0j+Ysg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pkb59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:04:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f183e4cc7bso87594091cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484296; x=1767089096; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rpb4W73dFQhb2fFVWipjtDjs1BBDNzb3ATpS6fi83mQ=;
        b=MbD4ZykCSYJ8V3vVyieD8BsNUm4G7Ng5F+ujqGDTtVdnOdlHai2+jsspfXmWEoT25b
         BgeIYxOHW4OCBzYlglXJVNt4oOjkalh8Gpsw8/VE1fRHvdhOp18Uu2xpdq/wpQeLv5uc
         /JAA8RZotAWBMFNWYPkVBtDEWO0l5nd3wTMjKFgaRZP/k7uo4/sPaF/t2WlWFETylBtU
         zFYRkPJjSlQtKoSvE4GvlLVC89UMJhabg44fKHc/JTIvvWxIZJDhkaxMgTrU8Z4o4bSo
         yA+yZSBohkgNWuH9Ru4wZRSmxh7tMoouPf8I+xni++tPRLdHq/0TQOK6AmRTjRl9VWuh
         fv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484296; x=1767089096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rpb4W73dFQhb2fFVWipjtDjs1BBDNzb3ATpS6fi83mQ=;
        b=ZvzwKrg+JPDX4a5DsYvCo34NUSZBlV/U2Lu2oLBd/uI0L81BxINylHJ5aGe9jZhpHS
         UqDoWvsDK2VcAFRTWgy4pg95IyfA0v8PpJr9ugGhrs/f5eMd1ReruI6qB84dBzKFqwa0
         1S0GOufMScdemHP4Ikopj0AQu+VFYuPPXWw0uBATQsv+R5GiUdtueHkqf0czNAqydVo5
         I+rcrSYECkNq0EKDPW3299cKwrWgUmikReBBO3z/W2kcH1KD397LhWVIe2+Bxy1CGIyw
         ubJNrNo01YxMBbGag2M1g/U2QtQhSrVT5gq42PNHZSCzTmcaOC9juOF7ouzVbc5y0XBv
         JRjA==
X-Forwarded-Encrypted: i=1; AJvYcCXMzpBI1sFMpPLEriISqlZ0hYSHd0QoqsNzK2DtMVFLDxkoLJFh9Qn0fUdBx8R5SLza2B2E+ouC8RYjQD9K@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1eNthUmMf3asx6EIOIKd3W6vWKbHB2ht2EqbHZcTb1n0Hbklr
	VZpPbQpJfOTkBVcv0KAyRsHJrenN74GEvdOu5GKCkqMxGS2B9yK2Hvox+8KK53ONFbzveLsqOLl
	HLwdRJTEi1IM5asWlI6AWvUKBWaOLJ4vSZyZtOfFT8J6LiANRZAG2TndS/8Y+HovurFzW
X-Gm-Gg: AY/fxX48xnCIgUnYWtz8Qshf8FnN/j9uhE4MPP/fLzsRuF7lT2cZZ3P4avTQnf/dPep
	cd5U3rIft914dyGZz/D9SKgFXtzOK89ZOaUMcW4dDjPvXxO7qRqE/+Id2kH2hoD9vt2D1AgSWgb
	7ttQpjSe2sFX7/L6TmMJ+MKPtI6UPEDyw2HIROJ1EdGwFgsFqR8dUmavIpDamQ5p2ZWiF1KUjIG
	Y3Lx3eQ6tSn280TzW4apCjE64FNvxvvtMdFFrxYPppQLmdMXjzhxRDWfAs63Spaw9vrFqjD/ee0
	Yt262NnJRwEAgnoMZq/N9Q/cZbpP/kzxMA7mso6ub9npm4h2erIjpIZGiUDiuraOo9gSGcseCek
	IYVpsKtyhzmJTxmkq6oQrD4Qum0in4LN4Nou9b2I=
X-Received: by 2002:ac8:5cd2:0:b0:4f1:83e4:6f55 with SMTP id d75a77b69052e-4f4abcd06f8mr204815061cf.16.1766484296285;
        Tue, 23 Dec 2025 02:04:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiNHKqDKCrFlscF1e8nxZ5lfR1gZCs8573oK/BJMiXsdrVSl2/AbVhz7yPs2GYVwiIg03KGQ==
X-Received: by 2002:ac8:5cd2:0:b0:4f1:83e4:6f55 with SMTP id d75a77b69052e-4f4abcd06f8mr204814511cf.16.1766484295661;
        Tue, 23 Dec 2025 02:04:55 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:04:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 00/12] i2c: configure parent device and OF node through the
 adapter struct
Date: Tue, 23 Dec 2025 11:04:38 +0100
Message-Id: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADZpSmkC/x3MQQqAIBBA0avErBvIqSi7SrQwnWo2JgoRiHdPW
 r7F/xkSR+EES5Mh8iNJbl+h2gbsZfzJKK4aqKNREfUoZNE4E9Dxg/b2h5yoh643+6zUpEeoZYh
 8yPtf162UD/OF/y1lAAAA
X-Change-ID: 20251223-i2c-adap-dev-config-9403ab811795
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3406;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Aessx24OljIFWC+mc2LsHK/66rMxd0lRq5JDSMHPZrs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk6CFIKSo02FUVtncKxbJmpddSLBsdGwlGxk
 3xgKHq5LdWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppOgAKCRAFnS7L/zaE
 w9lvEAC6IPKCIFxQKEcT0e9etvsanf7pMOhUQltvitPug6OEIG0KYMeK/K84tQWkYK1rDNEM9+S
 VInnmCouxiX6wvyRpsmIWYdoTH3Hx0NwbMAtenLaYgj1HOqPC/2T4EfL2fhIHFks+HcwQJQtX/U
 6IJHl2gOPKIqt/Nsdy7uhRu+dsZtrmTox0QcIWDnQ2u1AJHSOPrUWAP2bziaEPzvN7wMFnmMI0L
 yWjqOuw6piX/7Jv7xgdIphnmGvtOjVJY8CN7EzZPssJk52TGwSu4jbPZ+oh+VVPDc5ednw2LJcG
 GbY06fhDBfb2tk7U5drjc/kU27DZ7CjOZoBeGXE3FMBPIKQBarOf+PxOssqRC6+0y+CfpBs/DWW
 rk1QSObI9tMRBTzeqAMF8jCp6dqEm7lHH21J+CnG3Ed1AFcnI9zYtDqbK4FKGKA2z6wgf0gwQbZ
 48KFlz+jGZHxm7KimHiLcfu5XZqlSW0GKFLwH++KbYffIP0VH8DrDBU4X42xbIZr/WaBfen+HLG
 tgpottRsMj2BslGnnqPwbYb70GrH0NM1WEm1Afevt9odAaChxpRNm0sHJHpnE7mukt8NUqfWiVO
 19KRrejHoawa94lLIdae41mcZ60Yr/TOm8q9qNfStSjmOFamByZqVSisccC+ixsP/EnQD1TXsYA
 hicHpNR/3lUOyWA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX/P3vLYFj8iMF
 +Ei+h4i2aU/7lJXaefyl9CmM2fvfVKz2Gni+QA6SYGtilx4qL5DeQ8cqjbAP4lNptVJGusAlW3+
 /5z+sms/3F6YaSD6snUBajp4ZCpOwACLeyFzqS3F+79C8OsYJWQcyLQ3jZwKi6hBBkRcSA388v2
 lYoYs6Z2cuKelIwHgZ3hW87TdEew6TVp5S4wlnIf0pe77o5XxexBXJzrpRF59riIWaeYQXTE9CS
 B9wI33lfUXHE/aqijeTVbQEr0M2iDyLxbx/8ZofDOy1dF4tBpL7pwKy2yL9sq2mwl4qdoW2x6f7
 q8U+pQGTKpilDWLN8fJ6mxpplPKveBBL5pb7fDzvQtZKKTMsoG79M9LT+IC01Ld0Mq+yu1rvFEc
 CsQfigFRkIta8F0LWOcR6YFURjlChfrUIsGkbkoMoH2vII2iUycoQsLJ8RacgFi6+eOs4XOX637
 snbLmvLNEDLpruVXvxA==
X-Proofpoint-ORIG-GUID: SLOlfVkG1Gof19jjZ-wwrDKYBGs3DYJ6
X-Proofpoint-GUID: SLOlfVkG1Gof19jjZ-wwrDKYBGs3DYJ6
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=694a6949 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_sFN2lLQU9JdPEgOWvQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

It's been another year of discussing the object life-time problems at
conferences. I2C is one of the offenders and its problems are more
complex than those of some other subsystems. It seems the revocable[1]
API may make its way into the kernel this year but even with it in
place, I2C won't be able to use it as there's currently nothing to
*revoke*. The struct device is embedded within the i2c_adapter struct
whose lifetime is tied to the provider device being bound to its driver.

Fixing this won't be fast and easy but nothing's going to happen if we
don't start chipping away at it. The ultimate goal in order to be able
to use an SRCU-based solution (revocable or otherwise) is to convert the
embedded struct device in struct i2c_adapter into an __rcu pointer that
can be *revoked*. To that end we need to hide all dereferences of
adap->dev in drivers.

This series addresses the usage of adap->dev in probe() callbacks where
drivers assign the parent device address and the associated OF-node
directly to the struct device embedded in i2c_adapter. We extend the
latter struct to accept the parent struct device and of_node directly
and make it assign it to its internal struct device inside
i2c_register_adapter(). For now just 12 patches but I'll keep on doing it
if these get accepted. Once these get upstream for v6.20/7.0, we'll be
able to also start converting i2c drivers outside of drivers/i2c/.

[1] https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (12):
      i2c: allow setting the parent device and OF node through the adapter struct
      i2c: qcom-geni: set device parent and of_node through the adapter struct
      i2c: bcm-kona: set device parent and of_node through the adapter struct
      i2c: keba: set device parent and of_node through the adapter struct
      i2c: omap: set device parent and of_node through the adapter struct
      i2c: rcar: set device parent and of_node through the adapter struct
      i2c: st: set device parent and of_node through the adapter struct
      i2c: mxs: set device parent and of_node through the adapter struct
      i2c: highlander: set device parent and of_node through the adapter struct
      i2c: gpio: set device parent and of_node through the adapter struct
      i2c: nomadik: set device parent and of_node through the adapter struct
      i2c: bcm2835: set device parent and of_node through the adapter struct

 drivers/i2c/busses/i2c-bcm-kona.c   | 4 ++--
 drivers/i2c/busses/i2c-bcm2835.c    | 4 ++--
 drivers/i2c/busses/i2c-gpio.c       | 2 +-
 drivers/i2c/busses/i2c-highlander.c | 2 +-
 drivers/i2c/busses/i2c-keba.c       | 2 +-
 drivers/i2c/busses/i2c-mxs.c        | 4 ++--
 drivers/i2c/busses/i2c-nomadik.c    | 4 ++--
 drivers/i2c/busses/i2c-omap.c       | 4 ++--
 drivers/i2c/busses/i2c-qcom-geni.c  | 4 ++--
 drivers/i2c/busses/i2c-rcar.c       | 4 ++--
 drivers/i2c/busses/i2c-st.c         | 4 ++--
 drivers/i2c/i2c-core-base.c         | 5 +++++
 include/linux/i2c.h                 | 4 ++++
 13 files changed, 28 insertions(+), 19 deletions(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251223-i2c-adap-dev-config-9403ab811795

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


