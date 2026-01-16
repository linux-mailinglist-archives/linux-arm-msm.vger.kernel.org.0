Return-Path: <linux-arm-msm+bounces-89482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2347AD389D7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 00:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22FC3311D213
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 23:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1231432ED40;
	Fri, 16 Jan 2026 23:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXB8wg6M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfc+R59n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D6C31ED83
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605680; cv=none; b=CCS1skTT5L1Ab6ZAr1UN4XN1zwzWJlA3QftS4DxaS2h3iaWyRvifAIqIP1BPJKYwdRiKw9lOcbyHf3sodlOFbtDQCmQK/Esx0CCQVnHrLwMiBwBThnuIjesKnRlAWZW+Ir0mU6IRizzCsUnwaU2sy2Qi+tr3rkZpob++4aJM3/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605680; c=relaxed/simple;
	bh=r1bqX+YKzW7Wo7iz/2rkXvfUlo4SFKFYbrl1Eh5BoSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KYeSWJpN0h37JMsGI5k9kOgRdjVMdR2OpnOLD8d1g7pNzPbrR8I9UNPdNTThZxqKnshbyBrCnz/WlhYcRDFlRGRqYHKGL3fmmZqCOF/WhT0L7ORSozzNW4iNO3t/j4v2WZglZtPW+Js90+CaE2zhnwTOom+ZlHLfI0mO754AHlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXB8wg6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfc+R59n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GND3LV2646738
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nLNoInJmlgi
	CyTSp0s0aDwUKBeAC7fdewIAWrT/v+x8=; b=RXB8wg6M1UqjDyu5uY1Jpz9/GxI
	hrey0kk7FfZZrAqcc77EesVLivRtsdSP3Y+UH+uTOgb6ue5tUVpjBw8rePqNQAQh
	BGjqRQM2KKMaq4Lo/Bf2Q+Za/H6C9ziZKuwkFWVJBkVLDI7eI6JiDBGrXmOLiiVp
	QEG2CAZi/NrilZPFmEFeSvcXrvLlBR93Ns1HbpnrUDCh6d38bTSPVd3YDPcXfSwY
	4ES7HOOPeO3mqyjvHz+28QS1/4Vg7I9tN1UA1LbOZAPPi3pcyC8jfvKXLMxxGCDf
	F7Y+9Khm/2uN/va2qcr/4v4qkKt1wgDa+LXBpdID/0sQfxC4g0fmfdEc31g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvedrbj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ae32686ed0so1299130eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 15:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605673; x=1769210473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLNoInJmlgiCyTSp0s0aDwUKBeAC7fdewIAWrT/v+x8=;
        b=dfc+R59nKfMeRZv+Jf0hT6tKkSc0cdbC+4zH7dCtSy214k69AM/wczyXzwz6FicgDS
         iDH90QRNWH1uCg/fzGKnjqBDSg9I0gLVe6bOyfWjBPbQ7gatLxLNBOtr6rDZBjnYZmRg
         uzMYMrSosBXDj4oZkgBe4euoxCRV0cjPwY6yQxr0Do4gjHIMU9d56y04D7qg2PtWnlNW
         awyJwFjVJM+MIYCWyHqtF1R4y6AoAh9YYArGkLPsynxoaLL/YkDwLJEBIURQ6JIMbdE6
         ju4+/ZR4ZQTQcYEGx+PjTclgQYjSpgp0PKsbdkedPqbFIlV2anF3TLqGoeKoawvnWfb2
         N9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605673; x=1769210473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nLNoInJmlgiCyTSp0s0aDwUKBeAC7fdewIAWrT/v+x8=;
        b=hdoXWWtyIvj5UznsO+FwuCM6OpH6q4NKbRYt2/k1PSRlXEjhk6psWDqTXlOxNvIgs1
         c84Z15+yIOzDd9By3STR8kFyXWQ6Ba2akrbcCMEavkIKFhwWyYoMXdrgmJi7dMvlBFa9
         a7xQfqiewa1JyqDOJxJFE5cnfDc1vy8BcJyWwHN7DDr2JXhM6v9AHrUnbOxOepIzw1uR
         IzOBWTz8A99dhMo0BAJA5JaYeXY+htdW7qzuHHjVNceZvRbaixtoPWFAUWfNC2IyY15X
         oHWLhZJ+wOguY2MZuYdrYKASYQnYiTPBVqxm4J50Wjt1yLvOUsj5Q6IzUQz7+Ed+AVgX
         G3pQ==
X-Gm-Message-State: AOJu0YyH9XqxcaSV5zlHoxROehJZ2GTN1LeemsyEI2EZcC0yXYNH9n1U
	K5xdwKV5FNsWd2BjTvRUwIOlMsXDPgQQUr1YyMgajB4CMDYggd/6csR6Cn6PfzsI9O4Z2ofVDkh
	XbEaoty/TlRg6zRgEypT/JW7ul1LL59CBxqj+KzANmEOaDEqjLzbJdV8yc0ekiok7cqH4
X-Gm-Gg: AY/fxX6F3B0V/F0t5vImx+koOcKK6hcGbVIYd0f1fww97hnIckGx6UtIdbfqXOIUCmS
	sbqp6m8IIfKBDH7Bo8vgqKTC/1+Amri/MRKqOn8WY5sPtMRJi7mlOHL8A9K1W1zGhJo/myX0s9x
	kj5RrqBg8MpRRBzlv6eXi/QJg3N8K4N6yjDrdkM+iEFESEzXsyjE9lr4zsuGTIFIwO3tLB2EgpV
	JLETWg28wmYEpycOGftI6saaHXhnOhruuyRJozBqHCFb2AtdF8L883bi6L8rCc0VcJZgbg6mrkr
	3J1Cg37dcuYvyxSM4BTHaQS09gNE2XR0qA4vkFjfJOU/FehOLhbnHZ9d9F9+9uh+EUvrraQtxBH
	txUasMpbt5DaNJXbHb+6E4D9LxvHCgY0mYoYPZfaeHjFxPuIQB/q6q2ytEqM46xg=
X-Received: by 2002:a05:7022:660b:b0:123:3360:aa99 with SMTP id a92af1059eb24-1244a75ea1cmr4361083c88.47.1768605672814;
        Fri, 16 Jan 2026 15:21:12 -0800 (PST)
X-Received: by 2002:a05:7022:660b:b0:123:3360:aa99 with SMTP id a92af1059eb24-1244a75ea1cmr4361064c88.47.1768605672348;
        Fri, 16 Jan 2026 15:21:12 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:11 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] usb: misc: qcom_eud: add host mode coordination
Date: Fri, 16 Jan 2026 15:21:03 -0800
Message-Id: <20260116232106.2234978-7-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pl1My41vTQMEwUACp9hKeiCIUsWHJx9A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfX7a5/O59RLs31
 oulU2+qJPkWiNNpjcgxxWbvG0pwXG5R6XBmyF0MlYlvHtMt0J350Bp9Agh6N0XALqtWNGhuZVUM
 zWLVkyurT4+V3BeCQH5E0gcZAUJvAXHDCFY8lpKS9QXVZH2b4jNSNE4yz8uKllT7w57H4lkfO7m
 94GaDSVix2rehKRmFXpiTYomlyECTEU7ypgcx3jKpoB+ogW6QlHUpnqaUo+V5QlJ5IWhGknZyk0
 oAsWPX+StNiizlVU2ihGHU2D9ydgXKa8etdtWLoHl3caZveMzaMrtRVKsFYkjVS5zWVKiUXtWUw
 DPHSXYD3RYVaQoDbunyUEnSmS/Y5ecMf/GzaK+xNqF01SHRN16LsuImw0XE3Y8XefNr30hUxaK5
 FJwoN4rk86pwbfazCtyYnuJqupte1dfJbSHXdVDwR5hdv3/j4dkxI1HGliiEZCxVPKHqXBEiDYt
 SFmANjvjklUtYEK9uOQ==
X-Proofpoint-ORIG-GUID: pl1My41vTQMEwUACp9hKeiCIUsWHJx9A
X-Authority-Analysis: v=2.4 cv=A4Bh/qWG c=1 sm=1 tr=0 ts=696ac7e9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0DRR6HtdnbDkULtDn-kA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160175

EUD functions by presenting itself as a USB device to the host PC for
debugging, making it incompatible in USB host mode configurations.
Enabling EUD, when in host mode can also cause the USB controller to
misbehave as the EUD hub can only have one upstream facing port.

Handle below two scenarios to prevent these conflicts:
1. Prevent user from enabling EUD via sysfs when the USB port is
   in host mode.
2. Automatically disable EUD when USB port switches to host mode
   and re-enable it when exiting host mode.

This ensures consistent state management without creating conflicts
between the EUD debug hub and the USB controller.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 79 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 0ea6491f963c..3f1cc7ea2a6a 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -49,12 +49,15 @@ struct eud_chip {
 	struct device			*dev;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
+	/* serializes EUD control operations */
+	struct mutex			state_lock;
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
 	bool				phy_enabled;
+	bool				eud_disabled_for_host;
 	u8				port_idx;
 };
 
@@ -162,32 +165,66 @@ static ssize_t enable_store(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct eud_chip *chip = dev_get_drvdata(dev);
+	struct eud_path *path;
 	bool enable;
 	int ret;
 
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	mutex_lock(&chip->state_lock);
+
 	/* Skip operation if already in desired state */
-	if (chip->enabled == enable)
+	if (chip->enabled == enable) {
+		mutex_unlock(&chip->state_lock);
 		return count;
+	}
+
+	/*
+	 * Handle double-disable scenario: User is disabling EUD that was already
+	 * disabled due to host mode. Since the hardware is already disabled, we
+	 * only need to clear the host-disabled flag to prevent unwanted re-enabling
+	 * when exiting host mode. This respects the user's explicit disable request.
+	 */
+	if (!enable && chip->eud_disabled_for_host) {
+		chip->eud_disabled_for_host = false;
+		chip->enabled = false;
+		mutex_unlock(&chip->state_lock);
+		return count;
+	}
 
 	if (enable) {
+		/*
+		 * EUD functions by presenting itself as a USB device to the host PC for
+		 * debugging, making it incompatible in USB host mode configuration.
+		 * Prevent enabling EUD in this configuration to avoid hardware conflicts.
+		 */
+		path = chip->paths[chip->port_idx];
+		if (path && path->curr_role == USB_ROLE_HOST) {
+			dev_err(chip->dev, "EUD not usable in host mode configuration\n");
+			mutex_unlock(&chip->state_lock);
+			return -EBUSY;
+		}
+
 		ret = enable_eud(chip);
 		if (ret) {
 			dev_err(chip->dev, "failed to enable eud\n");
+			mutex_unlock(&chip->state_lock);
 			return ret;
 		}
 	} else {
 		ret = disable_eud(chip);
 		if (ret) {
 			dev_err(chip->dev, "failed to disable eud\n");
+			mutex_unlock(&chip->state_lock);
 			return ret;
 		}
 	}
 
 	chip->enabled = enable;
 
+	mutex_unlock(&chip->state_lock);
+
 	return count;
 }
 
@@ -324,18 +361,56 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
 	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	struct eud_chip *chip = path->chip;
 	int ret;
 
+	mutex_lock(&chip->state_lock);
+
+	/*
+	 * EUD must be disabled when USB operates in host mode. EUD functions by
+	 * presenting itself as a USB device to the host PC for debugging, making
+	 * it incompatible in host mode configuration.
+	 *
+	 * chip->enabled preserves user's sysfs configuration and is not modified
+	 * during host mode transitions to maintain user intent.
+	 */
+
+	/* Only act if EUD is enabled and this is the active path */
+	if (chip->enabled && path->num == chip->port_idx) {
+		if (role == USB_ROLE_HOST && !chip->eud_disabled_for_host) {
+			ret = disable_eud(chip);
+			if (ret) {
+				dev_err(chip->dev, "Failed to disable EUD for host mode: %d\n",
+					ret);
+				mutex_unlock(&chip->state_lock);
+				return ret;
+			}
+			chip->eud_disabled_for_host = true;
+		} else if (role != USB_ROLE_HOST && chip->eud_disabled_for_host) {
+			ret = enable_eud(chip);
+			if (ret) {
+				dev_err(chip->dev, "Failed to re-enable EUD after host mode: %d\n",
+					ret);
+				mutex_unlock(&chip->state_lock);
+				return ret;
+			}
+			chip->eud_disabled_for_host = false;
+		}
+	}
+
 	/* Forward the role request to the USB controller */
 	ret = usb_role_switch_set_role(path->controller_sw, role);
 	if (ret) {
 		dev_err(path->chip->dev, "Failed to set role %s for port %u: %d\n",
 			usb_role_string(role), path->num, ret);
+		mutex_unlock(&chip->state_lock);
 		return ret;
 	}
 
 	path->curr_role = role;
 
+	mutex_unlock(&chip->state_lock);
+
 	return 0;
 }
 
@@ -433,6 +508,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
 	if (ret)
 		return ret;
-- 
2.34.1


