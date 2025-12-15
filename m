Return-Path: <linux-arm-msm+bounces-85200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B04FCBCFE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78CFD301E932
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 08:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AA63242D6;
	Mon, 15 Dec 2025 08:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GLQP+rnH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCAlkz4g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1790E328B73
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788008; cv=none; b=plWN3LZG+kTmP7iXUXQYuUL0dN0IwplO2DOQ0+ZjTVSqzIiM6z+u2sBnYYezIU/g3R69Wqq0o5xFZZOEI9gFdbvBeqIVKZ4J1A6Yt3PFFHDHEkC2dcwZ2X3f4VIK7G3/IGS3SNc06b5DIY6u7Gjc6DdbDbEyWY6l9V9GqbQYD0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788008; c=relaxed/simple;
	bh=vTeQ5AHKkwW/UkEd9H1rXrSNU2GbMHUYNZLpJPgp8X0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y/5uMS0xeeyMG2iOhtyW+B9tBKkl9Wu0Gw36w6K9UtNyUxQB+ksqpzFIXLL10W37vKZw4DjhuLoS7v58Hh/FoxrxOk/qVspmcVkiEcwM+4lGpAktSCvGzMr+lV3OulHFkmTavGgVN9I9WPg34SxvHIpyWWJeAedcwzXEO3F2+8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GLQP+rnH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCAlkz4g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BEMr8Hu2233680
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sav2JkTpiNB
	huDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=; b=GLQP+rnHjxmM4Gu3RrUAsJrjuj1
	WpDKzVpDAvzh8NeF/pp58Wa3J3hkeqYZWI+ZUPRiBWGhppANJOF8oxGUCJeGodO/
	ii6SF+2m7/Qa4HfkDOjrv0jPGvzQQErzm7uzvEXSJ74TXf4uvBLDCq/P8R3Np0SE
	5x0GS5Md0rqELXQ2YFv7P5Lo8GANQaSJvjP6LB+blyGfg9QNnRlCOHikrbQ9UOTz
	Xc/209FbIwXf1EzLi5wuw+8coxbI1r++iZI5l5z7cl1WYw/nQWKQtyY3yvXqxHC5
	cOIlAR2isRBB5f0gk0nTYR4h4v73IGSA6UP3rN51xNGEplYv/iERt1mF05w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11afbtye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d60f037bso59842441cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 00:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765788004; x=1766392804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sav2JkTpiNBhuDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=;
        b=cCAlkz4gwFCmoZpGOTcRcjhvgz7jKX8JgcroD4KIVEYg/QMnM3fx4ZpODS+0o/5f53
         HM60tVx2RC1WmAL4dnB/wulOXl5WAUQWx24QGMiBzyw1ke8JJ+DKrrl6byXct/s0X7on
         bTVWbhJu4VfG9sNvPDUcHHIUicirUz/qYzxiSSN+n3xl34k8+aLowbtr9NBG7JK/njun
         xDZNfmCKeMZV7z+hvbNQfYxJ87RU2VuTHVy2Kf/XPQqeC3OPf1rYNOwfiM2UeusmsH9O
         3j6KFzXf2yU8oHUo+tgo6vOipxFHxOErZd1VNX2Nqu5x7zujok8GPWLIderIzHXMJdHS
         57HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788004; x=1766392804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sav2JkTpiNBhuDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=;
        b=J+p6KTNqtjSMK+gF0DcfopSBO8JLpDDuVXqldLutKD0eSivFf44K4USJ6p5tm3KIXM
         NxsCnpy4467AP608eVJhp3+3IZPUyZzXvjxFAYo4EI5D+BYw41XI8gdV1osQzmcC2VOO
         ftlnQ5LuNvnqHkbCeTugne0suQy04Q6Lqz9mObtBNV7TzA/hFRg9YGuy4NAeOZ3OVsO2
         B89KygOY0mRrwTjDs/5wmJFGMv/3VpK8qKZkkPYiBlOAe0d4AZfoKzLZJTUwWCzSJzCu
         CuvJVlMAgXT+F88tXnoQtA56BUgpvGN0PXL/5tuyER390Dlc5RdI+zulTaNJbUbTMrxf
         iddA==
X-Gm-Message-State: AOJu0YyTbbKMQajsXOBuNIHj7bABBwfeDKwDhmWXhn0j4TYyS+5zvK6w
	GxVl6nYsYhFstKqUM9cRCPRWwo7Ql0yLbBc57rmgZlJlqE4QFU3Ej6T/AsxvLEi7wxkkHJn7ADo
	5iHUhnsnZSDVzZtptdCyEbMejajBfkqjqGedlRGM+7RqZnVRLvTAysHILLdIKJHu/PfUO
X-Gm-Gg: AY/fxX69ylRtPXJcrgLyaEzI2LcfBDAK1ZFvxzctdLSS0YVDUjfUDALogu3JAqH2rKq
	Ng7+awkDMy9fPxxmAKvTDv0BSzkHJDd+OC3+qUNVWgldOj4oCHj5AoAtx79EOn2scXZgMNYOKUN
	tsA02c227Mr8BUOL3WlkTWHffa0XWK7O3nvN1iQSES4Am0VPul0h46QXssymh2YTHtuYKUZKWwF
	fKWq5YslHjNQFje1txVpn/ssVTJnWzwyebUdNfBEgQRn83NIjdWjyJtzAhRkJua9XALM/xNDq51
	dTcCu7TxnwFcvyqcvli3Ad5hVGWXhto1ikI75uNUlnzEd2A9tm/eSmoRcXK/0OGHovrTsR87cZ+
	X4uo5ABIpvs0buWokQDQ3msjrEB8ATWgjRzM1hkhnKm3E6WiJNnxdVN37sCaotetdPhk=
X-Received: by 2002:a05:622a:59c4:b0:4ed:1bba:f935 with SMTP id d75a77b69052e-4f1d05e1009mr142361691cf.57.1765788004057;
        Mon, 15 Dec 2025 00:40:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjYobfDnCO0D7Ol1hDSoFkMn3Lh3k7Wfl96wThmTVmw+iAn7yB3AV0vwzn0Pg3esUZljPQiw==
X-Received: by 2002:a05:622a:59c4:b0:4ed:1bba:f935 with SMTP id d75a77b69052e-4f1d05e1009mr142361631cf.57.1765788003667;
        Mon, 15 Dec 2025 00:40:03 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:40:03 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 02/11] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
Date: Mon, 15 Dec 2025 16:38:45 +0800
Message-Id: <20251215083854.577-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TtDrRTXh c=1 sm=1 tr=0 ts=693fc965 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tNVMJPnUsVqa3Ada0T4A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfX2rttfDo/vE+B
 z5e9RM8yYLmt/nxgsNm1iiqA/gN9GjTeVAelaWwQ7usBVhpg8v4T8tCPF7YA4VoHJ724LsS0eCM
 TPn3HONltE2ihqWjcNz9NLQ09r0Z0L6Ye2jLlGmbBVrZRf5tPiiBDvlM8j/pU8untDrX+ePNFf3
 O3Qe9bnImhxFOa946lM+8Wyib+bp2T0gXxDdVwfykYNp4nAh56FiqpBTgULZCfOK3cDkzDhJRJw
 AxPMsWI65kngmS68pSjaWWW2t4x2Bu5d5ZPmWHVuAkwaix4/kbmy679vpvFxdzZuim3wlfKT4NK
 +lWP6q2OTp5sfS1jxqxTmvl9V8kbKjEGYg+C+Zk3lWxcmNSZ9VCl4N+S1NRg6/cgkq6SvzgpVq+
 r4aeVBv9XBuyRjRz1DWHx5Ypcrm9yA==
X-Proofpoint-GUID: xpXhfV8nHb97hRjWtbQZ4pePh_KgEKVf
X-Proofpoint-ORIG-GUID: xpXhfV8nHb97hRjWtbQZ4pePh_KgEKVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150071

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The DSI PHY registers on the Kaanapali platform differ from those
on SM8750. So add DSI PHY for Kaanapali to compatible these changes.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 1ca820a500b7..a6e044eed3df 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,kaanapali-dsi-phy-3nm
       - qcom,sa8775p-dsi-phy-5nm
       - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
-- 
2.34.1


