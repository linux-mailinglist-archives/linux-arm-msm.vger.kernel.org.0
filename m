Return-Path: <linux-arm-msm+bounces-44954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0844DA10014
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 06:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8D3E3A7AA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 05:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A6923A0E8;
	Tue, 14 Jan 2025 05:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3CARc/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B4A233556
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831151; cv=none; b=XfShty+/UoUpOOzPMGG8wrAibYyyHr4yM5UTdqyK8TZYz6IIL4dqnIng0+DtN7YrzRlOmFrQP6MiXj5nlhrNIiX3sn5/W4d6nBdGLaR/pbxFK6500HjZvUhP2TvKLbRqtn9y15FIvYUWrpQ1BpbqrXQDg2x6NV6ry/Tt8khhb5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831151; c=relaxed/simple;
	bh=G6dtBU2rfEreIT2rFdyqftSefNbsw6nq18RbsWsp5iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZXrBUd4xxlwu8cknT6cmYU2S9xFe8DA7rHY2ogcBoWXwWJpxjAuTKE1jmxR7XulcfhIzbq/vwaUau5Gk/NJPpRqJJj7CvmvEEyKKQaGyWySOpuHPEr7cnaCxCrd7Z+1rWkyJ5wzdAt77fWKvMyX4MOg0NS0EbDHhtT3PrpOUzi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3CARc/g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DKrkBY023146
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gf68pBND6Bw8Zne3bWp+1+Yl8GBhak+geAciswXOc+E=; b=U3CARc/g+oBFma+x
	uYjF5bK9Fm6UOHVlBfrJz1Gk/f8VDjPzFI7vHzrhQ2262i5yNkESzQJeFA/JM26W
	ptyXRg0ABKVlA3bjxj155HdYp2tp0Qq99FP6ekfYQ1W0vEqrjZV1Y/23Qp0k7UqE
	3pWqgXOWpMdg+CnJRkK0NlE8z/oRSovaHKTM0V23Zz+q7wf7zj3jtkyPnFy7cHeH
	oYywycLRXF6JtDPyqLtUTZl1VrH0I6BonUYtOHCSM+odgLhzMXo20QhWMimsZBrf
	HHlRJSllYJ3aEw+J66jHt5WWIo3eiTLKEh9+TfL0qk71uWFE+M5mxAqxnRewzYmQ
	ILNhgQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445a928v6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:47 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5f696a2ee38so4153293eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 21:05:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736831146; x=1737435946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gf68pBND6Bw8Zne3bWp+1+Yl8GBhak+geAciswXOc+E=;
        b=OaXvqJxLtDpmdTrClT8CpXUc5IEoYKSt3Tm4H4BO7/81LbQntWcDJhig5n2T/0b9UV
         i1nlSKkQruaeBNP/8A7g23pRcDazDa2WSlMG+QidiYm1GEYGSxEspC8xtylz51a9LzZ6
         zmKUYr5kCPy7JHpMZKSSbHti5M7LKE+DnCG8zxrbqYyzs7aBRQl0z1GZ5UVdjqbdC3jr
         iTyLd1mE02N8ZXvgp6OPcTSjONmfqtrK3R9bi5Zs6U19YYMvaFKYB65eJP6ebHu4mkOz
         CXp9ZIK2DedyWEaUFKYTzeaMuWFF2tkZtDsozv6+TuUbtaiV6E2rlvtmSjHUnNewRZtF
         tm+w==
X-Gm-Message-State: AOJu0Yw4ZgWpUQ7SZyNQNHUlFVJaiuK8iS8A93MNlM7YaFOIjueMIZsk
	kgS+y3wWxs1CVGvPi9Y597zqQeNtoBg1iB0NU0cFOua50InVrn1uxJx1jJUYNn2h9IQSEg+NZmI
	Iery/Tglye5aDmYZPU2gIa+ypAVKqNekbN9yaCCCmz19PHmXr+L3cM/OY/WnWzc7B
X-Gm-Gg: ASbGncv7z/WJoTBk1uJGhQZCE9Mwlxx/uU8McPAkIEQq1fNLxjmQB3eTmoXUWSpj3DH
	2iSdJe72PFQvAUS6mtPmTd4LiOtQqnUsX04V4rMgbvL9Q2kMD56QKdikMIyDp7O/zlIs/Cr1JV6
	xNKcELayA/0IGd/ugCIcFdYc6SB583bFcxa5UOSEoWWzLPzm30sbXwzYmznbHPx3mMiAIxoHKIt
	jzTJsr8NBxbDQ7lYRSa2/M+PXabU+V3k7NjR5JJF2mnCiGZy2AIbWNqd14O3iZLw9mxU6ms+7fr
	D+mu/FNhgM3lPEIQ41gez+TwQBjM2Th/UI5/06X9sXUpYM9uPdGI4pEC
X-Received: by 2002:a05:6820:1520:b0:5f6:d896:4afe with SMTP id 006d021491bc7-5f7309645d5mr13975600eaf.3.1736831145833;
        Mon, 13 Jan 2025 21:05:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1lU6i27DwfQZgvaaz4U1vt5GzXa+IZsX7I/BiaDc+J/WVyAMzVDxPSrBxx/AL3//iDwyMpQ==
X-Received: by 2002:a05:6820:1520:b0:5f6:d896:4afe with SMTP id 006d021491bc7-5f7309645d5mr13975566eaf.3.1736831144933;
        Mon, 13 Jan 2025 21:05:44 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882756603sm4001750eaf.29.2025.01.13.21.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 21:05:44 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 21:11:34 -0800
Subject: [PATCH v3 01/12] dt-bindings: usb: snps,dwc3: Split core
 description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-dwc3-refactor-v3-1-d1722075df7b@oss.qualcomm.com>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
In-Reply-To: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=29276;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=G6dtBU2rfEreIT2rFdyqftSefNbsw6nq18RbsWsp5iY=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnhfIUyYuIIj988QjM2A610Bd/+42u2axIpEAqS
 EvVeaBYwViJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ4XyFBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWGWA//Yr1XCAl7N8ZgvipJism9Pj9GjU6GnpFUjbH4udY
 bpxRnkjdoig1TgFyJ1AX1K1PsYTtKprdAU5lR7RUgf2XQia347+SPYfuH2v1r4dn5UIyfkwlFVo
 jU/9z+i9OIgi8JkVxaSC8sWQ5+T3F9Wbr5KkCTAVEg8yFCWbGZiXURDHavN2sWcQqCd1GBjuR2z
 uTG8OcO7M3q9heU7ooyi/u82cLDf+MI7H77c/jeQGqEZVrc39NTPYNU97teJX4e8D25FgQ71BT2
 OG1D6KW7e8xW/KKQaqGXYOKveK2CBNcj1nPwOmoVcCGsNG367w1c367LKs22+H41Y05gaZHgCf9
 RTmY+5+b18Ujyc5oWbbk3h7iACUnHzlSRvmrpAtJdfTolor36lvnxFozzHmi6lbIZG1c+TB4Hex
 sBv2Wvq0zlf1FA3cV5WCTWWt8BgzlToPK5pbWCJNw/87yFXRpIT/Tk+ZDXNXCmYPq45o25dwAPz
 NfcrUZezOfEq2bg3Rp0+00DntIjVyOhfsOIxqT5bOhepoM14E2cE873NwNgrqdQozrkvFf0SrvP
 QMfIqCKIJLbLArrxoOIl6T5nK1qT8XN9dCVynu+dNPvriY2imhpbWPctMhWJu7y4RionAp68llp
 xfSZ220GnGAaus4pw5OuXDdEdZlqTRXNzExtRCms3nSg=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: yGMnZtcO-S-KOuWmLHAOdYQCUfEXa2LD
X-Proofpoint-ORIG-GUID: yGMnZtcO-S-KOuWmLHAOdYQCUfEXa2LD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140039

The Synopsys DWC3 core is found either as a standalone block or
integrated with vendor glue logic. So far the latter has been described
as two separate IP blocks in DeviceTree, but the two parts are not
separate.

In the case where the core is integrated together with vendor glue,
resources such as clock and resets are often customized by the vendor,
such that the standard properties doesn't make sense.

Split the snps,dwc3 binding in a description of the core properties and
the standard "glue" properties, in order to allow vendor bindings to
inherit the core properties.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/snps,dwc3-common.yaml  | 415 +++++++++++++++++++++
 .../devicetree/bindings/usb/snps,dwc3.yaml         | 391 +------------------
 2 files changed, 416 insertions(+), 390 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
new file mode 100644
index 000000000000..c956053fd036
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -0,0 +1,415 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/snps,dwc3-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare USB3 Controller common properties
+
+maintainers:
+  - Felipe Balbi <balbi@kernel.org>
+
+description:
+  Defines the properties of the DWC3 core as being embedded in either an
+  vendor-specific implementation or as a standalone component.
+
+allOf:
+  - $ref: usb-drd.yaml#
+  - if:
+      properties:
+        dr_mode:
+          const: peripheral
+
+      required:
+        - dr_mode
+    then:
+      $ref: usb.yaml#
+    else:
+      $ref: usb-xhci.yaml#
+
+properties:
+  extcon:
+    maxItems: 1
+    deprecated: true
+
+  usb-phy:
+    minItems: 1
+    items:
+      - description: USB2/HS PHY
+      - description: USB3/SS PHY
+
+  phys:
+    minItems: 1
+    maxItems: 19
+
+  phy-names:
+    minItems: 1
+    maxItems: 19
+    oneOf:
+      - items:
+          enum: [ usb2-phy, usb3-phy ]
+      - items:
+          pattern: "^usb(2-([0-9]|1[0-4])|3-[0-3])$"
+
+  snps,usb2-lpm-disable:
+    description: Indicate if we don't want to enable USB2 HW LPM for host
+      mode.
+    type: boolean
+
+  snps,usb3_lpm_capable:
+    description: Determines if platform is USB3 LPM capable
+    type: boolean
+
+  snps,usb2-gadget-lpm-disable:
+    description: Indicate if we don't want to enable USB2 HW LPM for gadget
+      mode.
+    type: boolean
+
+  snps,dis-start-transfer-quirk:
+    description:
+      When set, disable isoc START TRANSFER command failure SW work-around
+      for DWC_usb31 version 1.70a-ea06 and prior.
+    type: boolean
+
+  snps,disable_scramble_quirk:
+    description:
+      True when SW should disable data scrambling. Only really useful for FPGA
+      builds.
+    type: boolean
+
+  snps,has-lpm-erratum:
+    description: True when DWC3 was configured with LPM Erratum enabled
+    type: boolean
+
+  snps,lpm-nyet-threshold:
+    description: LPM NYET threshold
+    $ref: /schemas/types.yaml#/definitions/uint8
+
+  snps,u2exit_lfps_quirk:
+    description: Set if we want to enable u2exit lfps quirk
+    type: boolean
+
+  snps,u2ss_inp3_quirk:
+    description: Set if we enable P3 OK for U2/SS Inactive quirk
+    type: boolean
+
+  snps,req_p1p2p3_quirk:
+    description:
+      When set, the core will always request for P1/P2/P3 transition sequence.
+    type: boolean
+
+  snps,del_p1p2p3_quirk:
+    description:
+      When set core will delay P1/P2/P3 until a certain amount of 8B10B errors
+      occur.
+    type: boolean
+
+  snps,del_phy_power_chg_quirk:
+    description: When set core will delay PHY power change from P0 to P1/P2/P3.
+    type: boolean
+
+  snps,lfps_filter_quirk:
+    description: When set core will filter LFPS reception.
+    type: boolean
+
+  snps,rx_detect_poll_quirk:
+    description:
+      when set core will disable a 400us delay to start Polling LFPS after
+      RX.Detect.
+    type: boolean
+
+  snps,tx_de_emphasis_quirk:
+    description: When set core will set Tx de-emphasis value
+    type: boolean
+
+  snps,tx_de_emphasis:
+    description:
+      The value driven to the PHY is controlled by the LTSSM during USB3
+      Compliance mode.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum:
+      - 0 # -6dB de-emphasis
+      - 1 # -3.5dB de-emphasis
+      - 2 # No de-emphasis
+
+  snps,dis_u3_susphy_quirk:
+    description: When set core will disable USB3 suspend phy
+    type: boolean
+
+  snps,dis_u2_susphy_quirk:
+    description: When set core will disable USB2 suspend phy
+    type: boolean
+
+  snps,dis_enblslpm_quirk:
+    description:
+      When set clears the enblslpm in GUSB2PHYCFG, disabling the suspend signal
+      to the PHY.
+    type: boolean
+
+  snps,dis-u1-entry-quirk:
+    description: Set if link entering into U1 needs to be disabled
+    type: boolean
+
+  snps,dis-u2-entry-quirk:
+    description: Set if link entering into U2 needs to be disabled
+    type: boolean
+
+  snps,dis_rxdet_inp3_quirk:
+    description:
+      When set core will disable receiver detection in PHY P3 power state.
+    type: boolean
+
+  snps,dis-u2-freeclk-exists-quirk:
+    description:
+      When set, clear the u2_freeclk_exists in GUSB2PHYCFG, specify that USB2
+      PHY doesn't provide a free-running PHY clock.
+    type: boolean
+
+  snps,dis-del-phy-power-chg-quirk:
+    description:
+      When set core will change PHY power from P0 to P1/P2/P3 without delay.
+    type: boolean
+
+  snps,dis-tx-ipgap-linecheck-quirk:
+    description: When set, disable u2mac linestate check during HS transmit
+    type: boolean
+
+  snps,parkmode-disable-ss-quirk:
+    description:
+      When set, all SuperSpeed bus instances in park mode are disabled.
+    type: boolean
+
+  snps,parkmode-disable-hs-quirk:
+    description:
+      When set, all HighSpeed bus instances in park mode are disabled.
+    type: boolean
+
+  snps,dis_metastability_quirk:
+    description:
+      When set, disable metastability workaround. CAUTION! Use only if you are
+      absolutely sure of it.
+    type: boolean
+
+  snps,dis-split-quirk:
+    description:
+      When set, change the way URBs are handled by the driver. Needed to
+      avoid -EPROTO errors with usbhid on some devices (Hikey 970).
+    type: boolean
+
+  snps,gfladj-refclk-lpm-sel-quirk:
+    description:
+      When set, run the SOF/ITP counter based on ref_clk.
+    type: boolean
+
+  snps,resume-hs-terminations:
+    description:
+      Fix the issue of HS terminations CRC error on resume by enabling this
+      quirk. When set, all the termsel, xcvrsel, opmode becomes 0 during end
+      of resume. This option is to support certain legacy ULPI PHYs.
+    type: boolean
+
+  snps,ulpi-ext-vbus-drv:
+    description:
+      Some ULPI USB PHY does not support internal VBUS supply, and driving
+      the CPEN pin, requires the configuration of the ulpi DRVVBUSEXTERNAL
+      bit. When set, the xhci host will configure the USB2 PHY drives VBUS
+      with an external supply.
+    type: boolean
+
+  snps,is-utmi-l1-suspend:
+    description:
+      True when DWC3 asserts output signal utmi_l1_suspend_n, false when
+      asserts utmi_sleep_n.
+    type: boolean
+
+  snps,hird-threshold:
+    description: HIRD threshold
+    $ref: /schemas/types.yaml#/definitions/uint8
+
+  snps,hsphy_interface:
+    description:
+      High-Speed PHY interface selection between UTMI+ and ULPI when the
+      DWC_USB3_HSPHY_INTERFACE has value 3.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [utmi, ulpi]
+
+  snps,quirk-frame-length-adjustment:
+    description:
+      Value for GFLADJ_30MHZ field of GFLADJ register for post-silicon frame
+      length adjustment when the fladj_30mhz_sdbnd signal is invalid or
+      incorrect.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0x3f
+
+  snps,ref-clock-period-ns:
+    description:
+      Value for REFCLKPER field of GUCTL register for reference clock period in
+      nanoseconds, when the hardware set default does not match the actual
+      clock.
+
+      This binding is deprecated. Instead, provide an appropriate reference clock.
+    minimum: 8
+    maximum: 62
+    deprecated: true
+
+  snps,rx-thr-num-pkt:
+    description:
+      USB RX packet threshold count. In host mode, this field specifies
+      the space that must be available in the RX FIFO before the core can
+      start the corresponding USB RX transaction (burst).
+      In device mode, this field specifies the space that must be
+      available in the RX FIFO before the core can send ERDY for a
+      flow-controlled endpoint. It is only used for SuperSpeed.
+      The valid values for this field are from 1 to 15. (DWC3 SuperSpeed
+      USB 3.0 Controller Databook)
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 15
+
+  snps,rx-max-burst:
+    description:
+      Max USB RX burst size. In host mode, this field specifies the
+      Maximum Bulk IN burst the DWC_usb3 core can perform. When the system
+      bus is slower than the USB, RX FIFO can overrun during a long burst.
+      You can program a smaller value to this field to limit the RX burst
+      size that the core can perform. It only applies to SS Bulk,
+      Isochronous, and Interrupt IN endpoints in the host mode.
+      In device mode, this field specifies the NUMP value that is sent in
+      ERDY for an OUT endpoint.
+      The valid values for this field are from 1 to 16. (DWC3 SuperSpeed
+      USB 3.0 Controller Databook)
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 16
+
+  snps,tx-thr-num-pkt:
+    description:
+      USB TX packet threshold count. This field specifies the number of
+      packets that must be in the TXFIFO before the core can start
+      transmission for the corresponding USB transaction (burst).
+      This count is valid in both host and device modes. It is only used
+      for SuperSpeed operation.
+      Valid values are from 1 to 15. (DWC3 SuperSpeed USB 3.0 Controller
+      Databook)
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 15
+
+  snps,tx-max-burst:
+    description:
+      Max USB TX burst size. When the system bus is slower than the USB,
+      TX FIFO can underrun during a long burst. Program a smaller value
+      to this field to limit the TX burst size that the core can execute.
+      In Host mode, it only applies to SS Bulk, Isochronous, and Interrupt
+      OUT endpoints. This value is not used in device mode.
+      Valid values are from 1 to 16. (DWC3 SuperSpeed USB 3.0 Controller
+      Databook)
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 16
+
+  snps,rx-thr-num-pkt-prd:
+    description:
+      Periodic ESS RX packet threshold count (host mode only). Set this and
+      snps,rx-max-burst-prd to a valid, non-zero value 1-16 (DWC_usb31
+      programming guide section 1.2.4) to enable periodic ESS RX threshold.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 16
+
+  snps,rx-max-burst-prd:
+    description:
+      Max periodic ESS RX burst size (host mode only). Set this and
+      snps,rx-thr-num-pkt-prd to a valid, non-zero value 1-16 (DWC_usb31
+      programming guide section 1.2.4) to enable periodic ESS RX threshold.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 16
+
+  snps,tx-thr-num-pkt-prd:
+    description:
+      Periodic ESS TX packet threshold count (host mode only). Set this and
+      snps,tx-max-burst-prd to a valid, non-zero value 1-16 (DWC_usb31
+      programming guide section 1.2.3) to enable periodic ESS TX threshold.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 16
+
+  snps,tx-max-burst-prd:
+    description:
+      Max periodic ESS TX burst size (host mode only). Set this and
+      snps,tx-thr-num-pkt-prd to a valid, non-zero value 1-16 (DWC_usb31
+      programming guide section 1.2.3) to enable periodic ESS TX threshold.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 16
+
+  tx-fifo-resize:
+    description: Determines if the TX fifos can be dynamically resized depending
+      on the number of IN endpoints used and if bursting is supported.  This
+      may help improve bandwidth on platforms with higher system latencies, as
+      increased fifo space allows for the controller to prefetch data into its
+      internal memory.
+    type: boolean
+
+  tx-fifo-max-num:
+    description: Specifies the max number of packets the txfifo resizing logic
+      can account for when higher endpoint bursting is used. (bMaxBurst > 6) The
+      higher the number, the more fifo space the txfifo resizing logic will
+      allocate for that endpoint.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 3
+
+  snps,incr-burst-type-adjustment:
+    description:
+      Value for INCR burst type of GSBUSCFG0 register, undefined length INCR
+      burst type enable and INCRx type. A single value means INCRX burst mode
+      enabled. If more than one value specified, undefined length INCR burst
+      type will be enabled with burst lengths utilized up to the maximum
+      of the values passed in this property.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 8
+    uniqueItems: true
+    items:
+      enum: [1, 4, 8, 16, 32, 64, 128, 256]
+
+  num-hc-interrupters:
+    maximum: 8
+    default: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      This port is used with the 'usb-role-switch' property  to connect the
+      dwc3 to type C connector.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Those ports should be used with any connector to the data bus of this
+      controller using the OF graph bindings specified if the "usb-role-switch"
+      property is used.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus.
+
+  wakeup-source:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Enable USB remote wakeup.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+...
+
diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 1cd0ca90127d..4380bb6fa2f0 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -15,18 +15,7 @@ description:
   compatible string.
 
 allOf:
-  - $ref: usb-drd.yaml#
-  - if:
-      properties:
-        dr_mode:
-          const: peripheral
-
-      required:
-        - dr_mode
-    then:
-      $ref: usb.yaml#
-    else:
-      $ref: usb-xhci.yaml#
+  - $ref: snps,dwc3-common.yaml#
 
 properties:
   compatible:
@@ -70,32 +59,9 @@ properties:
 
   dma-coherent: true
 
-  extcon:
-    maxItems: 1
-    deprecated: true
-
   iommus:
     maxItems: 1
 
-  usb-phy:
-    minItems: 1
-    items:
-      - description: USB2/HS PHY
-      - description: USB3/SS PHY
-
-  phys:
-    minItems: 1
-    maxItems: 19
-
-  phy-names:
-    minItems: 1
-    maxItems: 19
-    oneOf:
-      - items:
-          enum: [ usb2-phy, usb3-phy ]
-      - items:
-          pattern: "^usb(2-([0-9]|1[0-4])|3-[0-3])$"
-
   power-domains:
     description:
       The DWC3 has 2 power-domains. The power management unit (PMU) and
@@ -109,361 +75,6 @@ properties:
   resets:
     minItems: 1
 
-  snps,usb2-lpm-disable:
-    description: Indicate if we don't want to enable USB2 HW LPM for host
-      mode.
-    type: boolean
-
-  snps,usb3_lpm_capable:
-    description: Determines if platform is USB3 LPM capable
-    type: boolean
-
-  snps,usb2-gadget-lpm-disable:
-    description: Indicate if we don't want to enable USB2 HW LPM for gadget
-      mode.
-    type: boolean
-
-  snps,dis-start-transfer-quirk:
-    description:
-      When set, disable isoc START TRANSFER command failure SW work-around
-      for DWC_usb31 version 1.70a-ea06 and prior.
-    type: boolean
-
-  snps,disable_scramble_quirk:
-    description:
-      True when SW should disable data scrambling. Only really useful for FPGA
-      builds.
-    type: boolean
-
-  snps,has-lpm-erratum:
-    description: True when DWC3 was configured with LPM Erratum enabled
-    type: boolean
-
-  snps,lpm-nyet-threshold:
-    description: LPM NYET threshold
-    $ref: /schemas/types.yaml#/definitions/uint8
-
-  snps,u2exit_lfps_quirk:
-    description: Set if we want to enable u2exit lfps quirk
-    type: boolean
-
-  snps,u2ss_inp3_quirk:
-    description: Set if we enable P3 OK for U2/SS Inactive quirk
-    type: boolean
-
-  snps,req_p1p2p3_quirk:
-    description:
-      When set, the core will always request for P1/P2/P3 transition sequence.
-    type: boolean
-
-  snps,del_p1p2p3_quirk:
-    description:
-      When set core will delay P1/P2/P3 until a certain amount of 8B10B errors
-      occur.
-    type: boolean
-
-  snps,del_phy_power_chg_quirk:
-    description: When set core will delay PHY power change from P0 to P1/P2/P3.
-    type: boolean
-
-  snps,lfps_filter_quirk:
-    description: When set core will filter LFPS reception.
-    type: boolean
-
-  snps,rx_detect_poll_quirk:
-    description:
-      when set core will disable a 400us delay to start Polling LFPS after
-      RX.Detect.
-    type: boolean
-
-  snps,tx_de_emphasis_quirk:
-    description: When set core will set Tx de-emphasis value
-    type: boolean
-
-  snps,tx_de_emphasis:
-    description:
-      The value driven to the PHY is controlled by the LTSSM during USB3
-      Compliance mode.
-    $ref: /schemas/types.yaml#/definitions/uint8
-    enum:
-      - 0 # -6dB de-emphasis
-      - 1 # -3.5dB de-emphasis
-      - 2 # No de-emphasis
-
-  snps,dis_u3_susphy_quirk:
-    description: When set core will disable USB3 suspend phy
-    type: boolean
-
-  snps,dis_u2_susphy_quirk:
-    description: When set core will disable USB2 suspend phy
-    type: boolean
-
-  snps,dis_enblslpm_quirk:
-    description:
-      When set clears the enblslpm in GUSB2PHYCFG, disabling the suspend signal
-      to the PHY.
-    type: boolean
-
-  snps,dis-u1-entry-quirk:
-    description: Set if link entering into U1 needs to be disabled
-    type: boolean
-
-  snps,dis-u2-entry-quirk:
-    description: Set if link entering into U2 needs to be disabled
-    type: boolean
-
-  snps,dis_rxdet_inp3_quirk:
-    description:
-      When set core will disable receiver detection in PHY P3 power state.
-    type: boolean
-
-  snps,dis-u2-freeclk-exists-quirk:
-    description:
-      When set, clear the u2_freeclk_exists in GUSB2PHYCFG, specify that USB2
-      PHY doesn't provide a free-running PHY clock.
-    type: boolean
-
-  snps,dis-del-phy-power-chg-quirk:
-    description:
-      When set core will change PHY power from P0 to P1/P2/P3 without delay.
-    type: boolean
-
-  snps,dis-tx-ipgap-linecheck-quirk:
-    description: When set, disable u2mac linestate check during HS transmit
-    type: boolean
-
-  snps,parkmode-disable-ss-quirk:
-    description:
-      When set, all SuperSpeed bus instances in park mode are disabled.
-    type: boolean
-
-  snps,parkmode-disable-hs-quirk:
-    description:
-      When set, all HighSpeed bus instances in park mode are disabled.
-    type: boolean
-
-  snps,dis_metastability_quirk:
-    description:
-      When set, disable metastability workaround. CAUTION! Use only if you are
-      absolutely sure of it.
-    type: boolean
-
-  snps,dis-split-quirk:
-    description:
-      When set, change the way URBs are handled by the driver. Needed to
-      avoid -EPROTO errors with usbhid on some devices (Hikey 970).
-    type: boolean
-
-  snps,gfladj-refclk-lpm-sel-quirk:
-    description:
-      When set, run the SOF/ITP counter based on ref_clk.
-    type: boolean
-
-  snps,resume-hs-terminations:
-    description:
-      Fix the issue of HS terminations CRC error on resume by enabling this
-      quirk. When set, all the termsel, xcvrsel, opmode becomes 0 during end
-      of resume. This option is to support certain legacy ULPI PHYs.
-    type: boolean
-
-  snps,ulpi-ext-vbus-drv:
-    description:
-      Some ULPI USB PHY does not support internal VBUS supply, and driving
-      the CPEN pin, requires the configuration of the ulpi DRVVBUSEXTERNAL
-      bit. When set, the xhci host will configure the USB2 PHY drives VBUS
-      with an external supply.
-    type: boolean
-
-  snps,is-utmi-l1-suspend:
-    description:
-      True when DWC3 asserts output signal utmi_l1_suspend_n, false when
-      asserts utmi_sleep_n.
-    type: boolean
-
-  snps,hird-threshold:
-    description: HIRD threshold
-    $ref: /schemas/types.yaml#/definitions/uint8
-
-  snps,hsphy_interface:
-    description:
-      High-Speed PHY interface selection between UTMI+ and ULPI when the
-      DWC_USB3_HSPHY_INTERFACE has value 3.
-    $ref: /schemas/types.yaml#/definitions/string
-    enum: [utmi, ulpi]
-
-  snps,quirk-frame-length-adjustment:
-    description:
-      Value for GFLADJ_30MHZ field of GFLADJ register for post-silicon frame
-      length adjustment when the fladj_30mhz_sdbnd signal is invalid or
-      incorrect.
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 0x3f
-
-  snps,ref-clock-period-ns:
-    description:
-      Value for REFCLKPER field of GUCTL register for reference clock period in
-      nanoseconds, when the hardware set default does not match the actual
-      clock.
-
-      This binding is deprecated. Instead, provide an appropriate reference clock.
-    minimum: 8
-    maximum: 62
-    deprecated: true
-
-  snps,rx-thr-num-pkt:
-    description:
-      USB RX packet threshold count. In host mode, this field specifies
-      the space that must be available in the RX FIFO before the core can
-      start the corresponding USB RX transaction (burst).
-      In device mode, this field specifies the space that must be
-      available in the RX FIFO before the core can send ERDY for a
-      flow-controlled endpoint. It is only used for SuperSpeed.
-      The valid values for this field are from 1 to 15. (DWC3 SuperSpeed
-      USB 3.0 Controller Databook)
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 15
-
-  snps,rx-max-burst:
-    description:
-      Max USB RX burst size. In host mode, this field specifies the
-      Maximum Bulk IN burst the DWC_usb3 core can perform. When the system
-      bus is slower than the USB, RX FIFO can overrun during a long burst.
-      You can program a smaller value to this field to limit the RX burst
-      size that the core can perform. It only applies to SS Bulk,
-      Isochronous, and Interrupt IN endpoints in the host mode.
-      In device mode, this field specifies the NUMP value that is sent in
-      ERDY for an OUT endpoint.
-      The valid values for this field are from 1 to 16. (DWC3 SuperSpeed
-      USB 3.0 Controller Databook)
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 16
-
-  snps,tx-thr-num-pkt:
-    description:
-      USB TX packet threshold count. This field specifies the number of
-      packets that must be in the TXFIFO before the core can start
-      transmission for the corresponding USB transaction (burst).
-      This count is valid in both host and device modes. It is only used
-      for SuperSpeed operation.
-      Valid values are from 1 to 15. (DWC3 SuperSpeed USB 3.0 Controller
-      Databook)
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 15
-
-  snps,tx-max-burst:
-    description:
-      Max USB TX burst size. When the system bus is slower than the USB,
-      TX FIFO can underrun during a long burst. Program a smaller value
-      to this field to limit the TX burst size that the core can execute.
-      In Host mode, it only applies to SS Bulk, Isochronous, and Interrupt
-      OUT endpoints. This value is not used in device mode.
-      Valid values are from 1 to 16. (DWC3 SuperSpeed USB 3.0 Controller
-      Databook)
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 16
-
-  snps,rx-thr-num-pkt-prd:
-    description:
-      Periodic ESS RX packet threshold count (host mode only). Set this and
-      snps,rx-max-burst-prd to a valid, non-zero value 1-16 (DWC_usb31
-      programming guide section 1.2.4) to enable periodic ESS RX threshold.
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 16
-
-  snps,rx-max-burst-prd:
-    description:
-      Max periodic ESS RX burst size (host mode only). Set this and
-      snps,rx-thr-num-pkt-prd to a valid, non-zero value 1-16 (DWC_usb31
-      programming guide section 1.2.4) to enable periodic ESS RX threshold.
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 16
-
-  snps,tx-thr-num-pkt-prd:
-    description:
-      Periodic ESS TX packet threshold count (host mode only). Set this and
-      snps,tx-max-burst-prd to a valid, non-zero value 1-16 (DWC_usb31
-      programming guide section 1.2.3) to enable periodic ESS TX threshold.
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 16
-
-  snps,tx-max-burst-prd:
-    description:
-      Max periodic ESS TX burst size (host mode only). Set this and
-      snps,tx-thr-num-pkt-prd to a valid, non-zero value 1-16 (DWC_usb31
-      programming guide section 1.2.3) to enable periodic ESS TX threshold.
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 16
-
-  tx-fifo-resize:
-    description: Determines if the TX fifos can be dynamically resized depending
-      on the number of IN endpoints used and if bursting is supported.  This
-      may help improve bandwidth on platforms with higher system latencies, as
-      increased fifo space allows for the controller to prefetch data into its
-      internal memory.
-    type: boolean
-
-  tx-fifo-max-num:
-    description: Specifies the max number of packets the txfifo resizing logic
-      can account for when higher endpoint bursting is used. (bMaxBurst > 6) The
-      higher the number, the more fifo space the txfifo resizing logic will
-      allocate for that endpoint.
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 3
-
-  snps,incr-burst-type-adjustment:
-    description:
-      Value for INCR burst type of GSBUSCFG0 register, undefined length INCR
-      burst type enable and INCRx type. A single value means INCRX burst mode
-      enabled. If more than one value specified, undefined length INCR burst
-      type will be enabled with burst lengths utilized up to the maximum
-      of the values passed in this property.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-    minItems: 1
-    maxItems: 8
-    uniqueItems: true
-    items:
-      enum: [1, 4, 8, 16, 32, 64, 128, 256]
-
-  num-hc-interrupters:
-    maximum: 8
-    default: 1
-
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description:
-      This port is used with the 'usb-role-switch' property  to connect the
-      dwc3 to type C connector.
-
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    description:
-      Those ports should be used with any connector to the data bus of this
-      controller using the OF graph bindings specified if the "usb-role-switch"
-      property is used.
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: High Speed (HS) data bus.
-
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: Super Speed (SS) data bus.
-
-  wakeup-source:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Enable USB remote wakeup.
-
 unevaluatedProperties: false
 
 required:

-- 
2.45.2


