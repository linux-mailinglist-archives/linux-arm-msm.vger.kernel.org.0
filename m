Return-Path: <linux-arm-msm+bounces-58397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13554ABBA0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C5571887EFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 09:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC2026FA7E;
	Mon, 19 May 2025 09:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BXz6b7oC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDEC270558
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647778; cv=none; b=TGCqgyJXNiBKE5HIAk4Y9OOaQoESDviq7cG7eQuA0FrRGZUOd1UW0X1aVFoc6uBLlBrW6adiQy7ZQSftgIPbVotHcT164JFGzWRhB9V84MttWqWHgV0VVWBR9xQlF4Gon8L6PC8TmjOxlvCVm05wCQFElF/8bV0I+ZwEVpGODC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647778; c=relaxed/simple;
	bh=x0K9OeLFsl2BOA7hHSAfMIHOVP+bgVA6z5/oLYSV7cM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cktu4yF8Ff4vkgRrnqhucR1AX41FzKwuiWhWFphVdBkKbh/7imetPOwVm3v3BXwQklzjTFLjC1Ex90LnpYpW7jHil5Ezrh1P3N7D0l76QqxVRqUieTNyaXy33s8uyEuHcog/Jf5r4nNRpFGgqveLnSXD+y+9GRFYFIFgSEucBnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BXz6b7oC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9II6o005958
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XiJWQOsSjPJDty+H6k9sLvaFKHbc2ZYPjWloagFTUus=; b=BXz6b7oCx8lOjDWn
	a1ZyRCCwePp3jJU2m0BeELMhlfxJ9BonPX6mOYoGQGUR83ZFc1OwQ6kA/nDCTTpJ
	3bOxqowzeTICY29iLNlVeSOL/FTFtfonwsB5U/dM9MOClQf1UFawsFg5aagXy3/e
	vVQWoWjvBolfSzwSzgoCbIxl3aJ0TTcO8VMjttKdgv7h1jsGz2bBFGYQyRbwGYyc
	n750LmfZpsm5feKrRNfVEZ6Z9lfti+HeqO2eBijaMiwHYcMzsym0oQJo5KOlFqyJ
	YuGoMrlGGXzk0VBgDb3ZKjpZ23ikNIhWqZbpKoPuwP2jvFho9e7+uDq5Lbj9iP/f
	jnh+KQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7buss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:42:55 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-72c7d6a53easo4590570a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 02:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647772; x=1748252572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiJWQOsSjPJDty+H6k9sLvaFKHbc2ZYPjWloagFTUus=;
        b=YI8JwLF5x/MK18WNh1FewuT8Bc4rB+RrIO4RJGa9vfaQilgKnBfRnKh9jZSDGJG54A
         EFNP5XDp6dpozMLL0baFqvg2AIEgpO0wG/oqZM2M8dksX1dqu0vwOsgxuJTjnOFQE9mb
         pD6QD1J3KW/67ggvbaPeHgEghxnQa1JupeLMDmMLr4xGHc+mM0iUEK2p1DVRbT7TdqyT
         dA2K+lfakD8OSf5DhGGBGWiIIWUpsfhPGrPw78WDrv6sBIOPwzCKUGXyPtxzmxBM43ok
         LKYkz7gYO2kAMfp0SmdEDBeVwT0ecc2qeLdzHuawfT6ltQj5gyHhawH8yopNbbZUhzVU
         ojgA==
X-Forwarded-Encrypted: i=1; AJvYcCUmgESgZFL68O/mSw9L8+LeuumGz1KVBKoseCGJRaoqz+6PR9AsTOZKk8bixRZu/oOyR6kxcHbfiRzQWnBs@vger.kernel.org
X-Gm-Message-State: AOJu0YzWkVgrY7tRodzPt74yI3jUuPg99xg+DfUhDL5RpMvwIs5VLPsg
	omkhh+C4JA7VZ4XkjkvRHM+IKQhV/UuxAVsCsrVyalxzxxYMD2PtA9aLo7UCtugPHMAW6tiG2MH
	Z/fQkNMeUJ80ghk93euNXcNiAd0sLhvqF+O1cUB/xgcy0d759xsCFV7Cv/eXFR1O89cO35CR9gw
	oW
X-Gm-Gg: ASbGncto76X6i+OQr897JWpYUgGBBIrG8SBxkan2WTQEP+eEblva+Do0MbZW9uZAXfZ
	+Keu4l03DEkJslmWD6rK4hQm1E4qmsQCny0cAuaTLuQi/dsPf8rV4fDC9JI+u6FiNqLUxN1IQB3
	S9DWc1ZLhGN3y2nUphf2kMKNHP+XxP8+nv7sno/85TwA9pCnjV3+NSPwgs3RHwfJkUuAQ4zRe11
	8omt156HJlDvWLs/ykc8RGJfveVoyU4e2TyGZb0Zyzp/v0LU+z8KtE7gkykx+htnbDDhzdysa32
	1CBgU3ROGODpSsfTOzhHFGNIKCDpVDDEKCreJWgP128E5hA=
X-Received: by 2002:a05:6830:90b:b0:72a:4762:d387 with SMTP id 46e09a7af769-734f6ad96ccmr7174000a34.11.1747647772106;
        Mon, 19 May 2025 02:42:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBnYDYjqkRiND8LMiPz62w5VQU2kQ//u6sfClrPQdPj8SXQ+K7WCVUKR9gzx/G2jYXnJcn9Q==
X-Received: by 2002:a05:6a21:9006:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-216219ece5dmr18241891637.35.1747647760987;
        Mon, 19 May 2025 02:42:40 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:42:40 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:15 +0530
Subject: [PATCH v3 02/11] PCI/bwctrl: Add support to scale bandwidth before
 & after link re-training
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-2-3acd4a17bbb5@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
In-Reply-To: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=4129;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=x0K9OeLFsl2BOA7hHSAfMIHOVP+bgVA6z5/oLYSV7cM=;
 b=hlXh3zqujL1wiLOQN/Kx308qPCf3/2bpuedRxHJErXBNzLyLD75gSBrgDdI32RFQT1req0ZTZ
 DFCDxSNTsC/B0J+RdROE7tmUukDSd4Zr+1UT97h29tM6Teigs25q2Kt
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682afd1f cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=AH_oHoLqry_2ofrPVhgA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: 8sDeOBRB95q81GDwk7WaKzt7hdynXZ0f
X-Proofpoint-GUID: 8sDeOBRB95q81GDwk7WaKzt7hdynXZ0f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfXwMdp3NocdF7m
 czUaFW5L7hqEV/wzfu1+PURWAa877urHo3BKkZS+NqKfVbyRA606L9iYGAj5VidJkX/ldKi4+Lb
 5j1HRLKM22O1uV7Mm1ZlrkjHyi03M3gsskYJ9E2RcZfhWsNapv96p2CKKZd545494sZ1Ue/NNAh
 a2x91xXZ0MACM51FyQcqv9Sm9VfMBvKeLpk8WKk8wfs/LqkPpIdoJF5WipHfAQW4VJEzc1unssx
 vh1GiqVaw6IRYeDsp3AlB57BlLUu85ObqYAdZmc/FpkE/SBwWQDNzxA5MrbnlqgKeu8Nx/MUi4L
 VwJ8MZpMfmT/J8Rh1VwmL1ZWbbiwVH4rITypwJyi5sKFAsAfB240eOdEwCCb3afIUcOBHCt1cLr
 S2jjLev1D8FEIPcwk+Aqbr9gnb3zpI6ECKvAfB6Ra9nREU0Rt2ipYk6uqCyG4ytpLAjk08JM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190091

If the driver wants to move to higher data rate/speed than the current data
rate then the controller driver may need to change certain votes so that
link may come up at requested data rate/speed like QCOM PCIe controllers
need to change their RPMh (Resource Power Manager-hardened) state. Once
link retraining is done controller drivers needs to adjust their votes
based on the final data rate.

Some controllers also may need to update their bandwidth voting like
ICC bw votings etc.

So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
the link re-train. There is no explicit locking mechanisms as these are
called by a single client endpoint driver.

In case of PCIe switch, if there is a request to change target speed for a
downstream port then no need to call these function ops as these are
outside the scope of the controller drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
 include/linux/pci.h       | 14 ++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index d8d2aa85a22928b99c5bba1d2bcc5647c0edeeb6..3525bc0cd10f1dd7794abbe84ccb10e2c53a10af 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -161,6 +161,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 			  bool use_lt)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
+	bool is_rootbus = pci_is_root_bus(port->bus);
 	struct pci_bus *bus = port->subordinate;
 	u16 target_speed;
 	int ret;
@@ -173,6 +175,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	target_speed = pcie_bwctrl_select_speed(port, speed_req);
 
+	/*
+	 * The host bridge driver may need to be scaled for targeted speed
+	 * otherwise link might not come up at requested speed.
+	 */
+	if (is_rootbus && host->pre_scale_bus_bw) {
+		ret = host->pre_scale_bus_bw(host, port, target_speed);
+		if (ret)
+			return ret;
+	}
+
 	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
 		struct pcie_bwctrl_data *data = port->link_bwctrl;
 
@@ -197,6 +209,9 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 	    !list_empty(&bus->devices))
 		ret = -EAGAIN;
 
+	if (bus && is_rootbus && host->post_scale_bus_bw)
+		host->post_scale_bus_bw(host, port, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
+
 	return ret;
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 51e2bd6405cda5acc33d268bbe1d491b145e083f..7eb0856ba0ed20bd1336683b68add124c7483902 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -601,6 +601,20 @@ struct pci_host_bridge {
 	void (*release_fn)(struct pci_host_bridge *);
 	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
+	/*
+	 * Callback to the host bridge drivers to update ICC bw votes, clock frequencies etc
+	 * for the link re-train to come up in targeted speed. These are intended to be
+	 * called by devices directly attached to the root port. These are called by a single
+	 * client endpoint driver, so there is no need for explicit locking mechanisms.
+	 */
+	int (*pre_scale_bus_bw)(struct pci_host_bridge *bridge, struct pci_dev *dev, int speed);
+	/*
+	 * Callback to the host bridge drivers to adjust ICC bw votes, clock frequencies etc
+	 * to the updated speed after link re-train. These are intended to be called by
+	 * devices directly attached to the root port. These are called by a single client
+	 * endpoint driver, so there is no need for explicit locking mechanisms.
+	 */
+	void (*post_scale_bus_bw)(struct pci_host_bridge *bridge, struct pci_dev *dev, int speed);
 	void		*release_data;
 	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
 	unsigned int	no_ext_tags:1;		/* No Extended Tags */

-- 
2.34.1


