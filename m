Return-Path: <linux-arm-msm+bounces-49238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4DEA439B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F89D1887D0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 09:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB0F26138F;
	Tue, 25 Feb 2025 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpG6jsyI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AE525EF9A
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476074; cv=none; b=MIaz4KOqDl7/PyO9C2fedkomqWH7QbzqqdhaJ5XHbIMvoOPp8IcUw/AfCsb1C6fpzH8WYMJpHmwokeESzVo8ikV5E84de78aPfdJhHiS9cIBrL7WuX6gkz9CEAHC+wx0fpZPFWjzdTRGw1BZarxNmyke42KFlo9KoDStBxmF+8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476074; c=relaxed/simple;
	bh=G+vP4+qExF/rUOr8bvTqGICdkWGOfTuwA+ivlE9VA2k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qJ3cdGxqi/0zZSFctRQDwnHrpU8m2vEWd8q9moL4SHgR9w0tTj7iUMYDToJDhKVh0+YIWIL/BXuzh8aG78uNoHtsyQ65DZ2zXpYkXvkC/NqD+bdvP/VJCv90h0nXfsqRDXRBFlK5cs+BIhjhUMSXITGTeRw1ikocM9Yl2Vu1PLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MpG6jsyI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8B1lV020230
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8A0hwcaDrftj/132t9c5tZ
	IuNNiuUzpaspLORZEXg+E=; b=MpG6jsyI8bMQgFxY59aiczqaHPIgblYyQyVvoz
	nQXuS9/zIl1FyDq+c4D+WGTb9lMrfTamDzAMYklJ/ODo9epHcl12qz/x/04Vjfy5
	D/WwUY6AR/Zxty0RXtykXP4zkIui8zUoyZ9wkD3UrPKurU2So1fDVGgZZmW0p7Ge
	gSp2lvShaU3zYTD/lvBW+Iga/AW3h9GNCVUq0IVSR/LR9qp8G2J6dHe2NBpmLKce
	CT+mdJ1EPkpiEI6WKasIFwVRCjxJp44TWpGdnWV9F0pxsl9p3HhSi+aDMAJHgl4Y
	gypONe/FbmznZH4ULLSwDjF1Q7W5UFtNnXKuY2Qm114zVhBQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6t2r75s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:34:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220e1593b85so104993415ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740476069; x=1741080869;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8A0hwcaDrftj/132t9c5tZIuNNiuUzpaspLORZEXg+E=;
        b=YFhbn0N/0OFtHSoNCsyIPvRylKMPGDVUaFAIF6ICtUEgwgiZRfiv3Zk4X8IanLYqlr
         frFHcGeDjoCrGP04OvxQ1DGxHWf8Xt60sXRkvyQ/Yn2Ud34qgaXfMIQebRvkbAkzI4wm
         PyrHBLievglumAvn4w49JgTT0fBOs9sfB1yCyi103hKSCAqdU+uNMrbvwE/K37aza3RB
         btq8Gf4H1s87iw1Q0jBlPyCQusyzWMjAkyQ1uONBR6EdzVYxVTKp/IA09hF1iePSjzt0
         SpFXgH8hH6AScpimO8SwCeZTvggoQu+eJn6SjtgqYUCPhGdibbSxXPjPsQRc/18Zk5pl
         03ow==
X-Forwarded-Encrypted: i=1; AJvYcCVx+PJ+L+3XS+8qoc+8Qk7v5Xv/9QywUMRwRcdy0v7MNQq2AWnPQIUB+3EJUGSPg2lM6OecizGMzSlhanKE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw22dY5fu6NmR/7GJtuaTcwhwBge5uuvt93rAIiQtjS+lJALGHC
	/DM22ukG9/FXgP5sle/5hRuEkgIMKYjZDpeSc8Mzbx7nQpS3Lp04mI0M/I9eVbYKCgDNJmsDj5y
	0tkCRrPRGLqEoTC5blWTxhfH7+neWeiOg3FDiN3mYf9iEUK0Uu8hqSGt7BH6TcHaO
X-Gm-Gg: ASbGncuVY3QYWnhxhgqUawAU3uSPif14rD9cBJyuiJGN1A+1lfuObEEDNhK5QiqUSYn
	wUip1pNBUwa9/km/JvaZxfU1EJsdD7Ti0zwHwycMM4pUoAQrKw9bqTwbUrfHY5I6lM1MdJU1M9v
	2OtoJbObPsVcy0G30MkgBc9K2NPZQRs9eBxaovzOiEguR1Bih/qhqPsQ/JLaKme2Sx5W7CQ3ysg
	bgAgsbL5rQDCO4cwBu1/T+QbwuATaCTq5QtDk4AakqV+q0kpS2Lrr9eMJYwbPPpGQ/4ZacFJJ1i
	+X20D2E176lhpjOJJlOFdcmUA4ZtUdAh5AH/9avwFe1i9gEm0i4=
X-Received: by 2002:a17:903:94b:b0:215:6489:cfb8 with SMTP id d9443c01a7336-22307b33070mr48255095ad.10.1740476069241;
        Tue, 25 Feb 2025 01:34:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaNQk7kM02pE1fgxm1QOcReRCwU6bgT3nfFkNDVfYj/upyZ0fbAqP+kFIQjdlSzQMbZaP5aw==
X-Received: by 2002:a17:903:94b:b0:215:6489:cfb8 with SMTP id d9443c01a7336-22307b33070mr48254565ad.10.1740476068734;
        Tue, 25 Feb 2025 01:34:28 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6a3dec52sm1080770a91.20.2025.02.25.01.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:34:28 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v4 00/10] PCI: Enable Power and configure the TC956x PCIe
 switch
Date: Tue, 25 Feb 2025 15:03:57 +0530
Message-Id: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWOvWcC/1XMQQqDMBCF4avIrBsxQ4y2q96jiKQ61kA1mmlDi
 +TuTYUuuhn4B963AZO3xHDKNvAULFs3p1CHDLrRzDcStk8NWGBZoESxLqxl2QbVSjHUpHEwUla
 1hrRYPA32tWuXJvVo+eH8e8eD+n5/jv5zghKFkBVh35dHvKI5O+Z8fZp756YpTweaGOMHgak6k
 60AAAA=
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, dmitry.baryshkov@linaro.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740476062; l=6669;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=G+vP4+qExF/rUOr8bvTqGICdkWGOfTuwA+ivlE9VA2k=;
 b=mlWw+UK91rUumgUCl9BfIgT5+H3XI+Bf+7RVF7PwD6iAA7+csG190iagn5Y3fATv1o0EZYkJq
 5c3E6HeIxwHAkrLUhvfy1k5ZWxAJ2e/7ftOrS3UJManWGyVLNQiX0kF
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 3MHRhJR6Qu7aqDbrNUEWHA1eOZY8zRr4
X-Proofpoint-GUID: 3MHRhJR6Qu7aqDbrNUEWHA1eOZY8zRr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250066

TC956x is the PCIe switch which has one upstream and three downstream
ports. To one of the downstream ports ethernet MAC is connected as endpoint
device. Other two downstream ports are supposed to connect to external
device. One Host can connect to TC956x by upstream port.

TC956x switch power is controlled by the GPIO's. After powering on
the switch will immediately participate in the link training. if the
host is also ready by that time PCIe link will established. 

The TC956x needs to configured certain parameters like de-emphasis,
disable unused port etc before link is established.

As the controller starts link training before the probe of pwrctl driver,
the PCIe link may come up as soon as we power on the switch. Due to this
configuring the switch itself through i2c will not have any effect as
this configuration needs to done before link training. To avoid this
introduce two functions in pci_ops to start_link() & stop_link() which
will disable the link training if the PCIe link is not up yet.

Enable global IRQ for PCIe controller so that recan can happen when
link was up through global IRQ.
 
This series depends on the https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
changes in v3:
- The QPS615 PCIe switch is rebranded version of Toshiba switch TC956x.
  There is no difference between both the switches, both
  has two open downstream ports and one embedded downstream port
  to which Ethernet MAC is connected.
  As QPS615 is the rebranded version of Toshiba switch rename qps615
  with tc956x so that this driver can be leveraged by all who are using Toshiba switch.
- move common properties like l0s-delay, l1-delay and nfts to pci-host-common.yaml (bjorn H)
- remove axi-clk-frequency property (Krzysztof)
- Update the pattern properties (rob)
- use pci-pci-bridge as the reference (rob)
- change tx-amplitude-millivolt to tx-amplitude-microvolt  (Krzysztof)
- rename qps615_pwrctl_power_on to qps615_pwrctl_bring_up (Bart)
- move the checks for l0s_delay, l1_delay etc to helper functon to
  reduce a level of indentation (bjorn H)
- move platform_set_drvdata to end after there is no error return (bjorn H)
- Replace GPIOD_ASIS to GPIOD_OUT_HIGH (mani)
- Create a common api to check if link is up or not and use that to call
  stop_link() and start_link().
- couple of nits in comments, names etc from everyone
Link to v3: https://lore.kernel.org/all/20241112-qps615_pwr-v3-3-29a1e98aa2b0@quicinc.com/T/
Changes in v2:
- As per offline discussions with rob i2c-parent is best suitable to
  use i2c client device. So use i2c-parent as suggested and remove i2c
  client node reference from the dt-bindings & devicetree.
- Remove "PCI: Change the parent to correctly represent pcie hierarchy"
  as this requires seperate discussions.
- Remove bdf logic to identify the dsp's and usp's to make it generic
  by using the logic that downstream devices will always child of
  upstream node and dsp1, dsp2 will always in same order (dmitry)
- Remove recursive function for parsing devicetree instead parse
  only for required devicetree nodes (dmitry)
- Fix the issue in be & le conversion (dmitry).
- Call put_device for i2c device once done with the usage (dmitry)
- Use $defs to describe common properties between upstream port and
  downstream properties. and remove unneccessary if then. (Krzysztof)
- Place the qcom,qps615 compatibility in dt-binding document in alphabatic order (Krzysztof)
- Rename qcom,no-dfe to describe it as hardware capability and change
  qcom,nfts description to reflect hardware details (Krzysztof)
- Fix the indentation in the example in dt binding (dmitry)
- Add more description to qcom,nfts (dmitry)
- Remove nanosec from the property description (dmitry)
- Link to v2: https://lore.kernel.org/r/linux-arm-msm/20240803-qps615-v2-0-9560b7c71369@quicinc.com/T/
Changes in v1:
- Instead of referencing whole i2c-bus add i2c-client node and reference it (Dmitry)
- Change the regulator's as per the schematics as per offline review
(bjorn Andresson)
- Remove additional host check in bus.c (Bart)
- For stop_link op change return type from int to void (Bart)
- Remove firmware based approach for configuring sequence as suggested
by multiple reviewers.
- Introduce new dt-properties for the switch to configure the switch
as we are replacing the firmware based approach.
- The downstream ports add properties in the child nodes which will
represented in PCIe hierarchy format.
- Removed D3cold D0 sequence in suspend resume for now as it needs
separate discussion.
- Link to v1: https://lore.kernel.org/linux-pci/20240626-qps615-v1-4-2ade7bd91e02@quicinc.com/T/

---
Krishna Chaitanya Chundru (9):
      arm64: dts: qcom: qcs6490-rb3gen2: Add TC956x PCIe switch node
      PCI: Add new start_link() & stop_link function ops
      PCI: dwc: Add host_start_link() & host_start_link() hooks for dwc glue drivers
      PCI: dwc: Implement .start_link(), .stop_link() hooks
      PCI: qcom: Add support for host_stop_link() & host_start_link()
      PCI: PCI: Add pcie_is_link_active() to determine if the PCIe link is active
      PCI: pwrctrl: Add power control driver for tc956x
      dt-bindings: PCI: qcom,pcie-sc7280: Add 'global' interrupt
      arm64: dts: qcom: sc7280: Add 'global' interrupt to the PCIe RC nodes

Krishna chaitanya chundru (1):
      dt-bindings: PCI: Add binding for Toshiba TC956x PCIe switch

 .../devicetree/bindings/pci/qcom,pcie-sc7280.yaml  |   8 +-
 .../devicetree/bindings/pci/toshiba,tc956x.yaml    | 178 ++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       | 116 ++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   7 +-
 drivers/pci/controller/dwc/pcie-designware-host.c  |  18 +
 drivers/pci/controller/dwc/pcie-designware.h       |  16 +
 drivers/pci/controller/dwc/pcie-qcom.c             |  35 ++
 drivers/pci/hotplug/pciehp_hpc.c                   |  13 +-
 drivers/pci/pci.c                                  |  26 +-
 drivers/pci/pwrctrl/Kconfig                        |   6 +
 drivers/pci/pwrctrl/Makefile                       |   1 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc956x.c           | 625 +++++++++++++++++++++
 include/linux/pci.h                                |   7 +
 13 files changed, 1035 insertions(+), 21 deletions(-)
---
base-commit: 09fbf3d502050282bf47ab3babe1d4ed54dd1fd8
change-id: 20250212-qps615_v4_1-f8e62fa11786

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


