Return-Path: <linux-arm-msm+bounces-107656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KJTG1TdBWokcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:33:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F41145432C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65A4B30BA015
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8202B401498;
	Thu, 14 May 2026 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NRpVxQYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eE1JZ6/Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAEC3FFAD1
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768902; cv=none; b=dnnh4AJR5cCCZ9vDfG9WYAMJtWiLNjdnnMB8Ckg9UvcAY7rrVnnuAXkayYmx24qPNRMvW1J37LGSFb61PwSwv/cq1w37zW0oENjxy9X7VsSl0jFKdOri71AiVKOSv1Ub9wFW44GQIGEJ7vvKSBfRjELghXvT4NZmFKBrVoACuyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768902; c=relaxed/simple;
	bh=vbRU67UVOb7vag0urLTR9CGL8NDqWbK8p17LbDC+cW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2NTSZPtyuz7X3S/8OcB8rK2HTg5ySk8ocLwBL9bX9+KXB23ivXGDPG8F6iRz58c9t40Ar6VUTcG4778WYUTeXcPdSdJ7DzWhn4FBu5SQhVsnP10ccclQkd81YBQA7iH7zW1lTIRKksjvynFNSqzqNHSIEgADxEXhwd8aOnYFq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NRpVxQYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eE1JZ6/Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeXjB2241739
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lVT+6+ENhr9QUbosk5DVYlfO2a3L1c21Y2zL0+4Gp+M=; b=NRpVxQYT9bG/uPQF
	IBuTkRhJd6b7AEoCvbiiiah2eseNeMWXBfRh6XkzBc2TkJj0XCvMUuxtSyq79p0W
	x6k2e16XJ6avvZOTM2OdyoPWqX0R/5UbPx5sNOVOHiyLGlN5V/+Y9wLUmp4APtRT
	I/2+Vy8cGkquGwNSAMnCyfqOVXJds3blolbsKx6deGrLmb1xMM49xWJ97iEcNQKe
	64Lu2DznOWviMAl5stx0twPMuMgU033Y+8BvLqCtVDogd0ukPjhJBMjKGyf0j+Q2
	Okl1dqQz6UA6Szci8urtWmGMinZKoTEMCt1+WkJkOseU+WkxcIb+UHq8gZqPquqA
	MXUFjg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513gb24x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba224c3ffdso126452505ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768900; x=1779373700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVT+6+ENhr9QUbosk5DVYlfO2a3L1c21Y2zL0+4Gp+M=;
        b=eE1JZ6/Za1drFK+ENuqd58x5B1Se5WufVPmUokU8ikr2edX14ihos0+4goRq8oI8k3
         B+8rWOygxGtIY0/Kvc9aEjJJd4w8pWYFjZbgoGrnNkythVFMyfth5uL2QsvthmQJ0Fmc
         gGdGmMIdLnIbwhO4UFRcshqQF/1y/BlCza+KDiuRkVXWs8PWrtv07XmgkKSxnJIbeLaI
         DwPB/0I+oSdZwy4nP6mJu6dBc4rczcRVZzExTCIeKkRQZU2bnB9zijOoWYlnW1ZT2yN+
         +Auau9rX3wmORmXYdv8LQm2XwNcFOlt0uNqhC4KHRier0HvF6+zHX9xretM6sZxsm+y4
         vEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768900; x=1779373700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lVT+6+ENhr9QUbosk5DVYlfO2a3L1c21Y2zL0+4Gp+M=;
        b=UkZrIcg8Xgs9jXD32LKlsO2WX2PZVkVETt9kTNiZf+egQJUQTsHQW6ZOV+1HwkMwY8
         3fwCzE+Kn/fcMBgEQvnA+GaRrhjglzWOL5VNyMxrhqGNxVKaCLibF868s4KJcEiWbXzN
         eERGwfj0A7jg/E92cQ1sIQJPXhgdv5YT7l18sL3/Rm9WH75Nts/9dj6E23WygrjhaFqH
         i8CKFbcdKcVcZzZgwqBuHLW4rJlBHS60Ofl4d3vLAx6mxiFPF31sYk0fg+d4jRcHWJ2f
         Uz5gbKCU7AFTNiz0eryIpkaaMiSCUGVmrJ9+hI9JpcM2jpQw2y1CPk0ARTtFU+8/DVRH
         5XEA==
X-Forwarded-Encrypted: i=1; AFNElJ86pHljZDt2ldH/ry7Yn8SftpBsgQXCqnk7sV740zatJFyHwXk4NG7GH181PxhMa2Fnp/p/jrxGIL6q4xE4@vger.kernel.org
X-Gm-Message-State: AOJu0YyWz8NNgI75RwRKix7aCcjVfA2oNM9DTlNqvsvXHvQ5idglaay4
	C7Lqxw2viM9If4gDGnCc3OFvUzJFRB2ccakG1Bcx1XyQTzll2Zfy4PHl+PHBTwGVJHyBKku0D77
	uUfkWDNAHoHU4SR/RCxofOSB/tnnbXKg+yArFdauLW0zW5/zW5FGdhrRavTgunCYjSalI
X-Gm-Gg: Acq92OE0Hc0lnflgd8+xypUpkT0hx4S/mYFgoJXZyV8s5T2FcTHwYHZNfdnqCItfKWW
	z0WRR1OAVEoGqHaaY+/b9RDbMUt8729Jv65YgPKttiqQw3Z2O7j01LEnsyBWoAj9ddO0sBjx51R
	xSBarq2z2pLcQVeqcx1i3L54leNNDl9t5GScwwFJHoilxqgLhUWrHYgtfnfjmmLGbuokJxGIS3q
	K+PzGkxpF9aRo9VISXckSkaI39b+lhXwjRVrU/fudewttyaGuRDXEdXej1urcu5fcOEcqOKHu6O
	mvG6phqUUybKsxBY5ORdIt7dB59/bfVHz+DDpOGKpnYsdgc28iTeraDswBWOhzv+nBXuFAwhtoU
	LWrMr/Wqmd5c4Rl9jg83/AAw/FpEuhhGfx5dpvivanDOqFRmxFznUFV5Tsw==
X-Received: by 2002:a17:903:2910:b0:2bd:2439:25fc with SMTP id d9443c01a7336-2bd27147127mr50114325ad.7.1778768899373;
        Thu, 14 May 2026 07:28:19 -0700 (PDT)
X-Received: by 2002:a17:903:2910:b0:2bd:2439:25fc with SMTP id d9443c01a7336-2bd27147127mr50113845ad.7.1778768898844;
        Thu, 14 May 2026 07:28:18 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:18 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:49 +0530
Subject: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=3848;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=vbRU67UVOb7vag0urLTR9CGL8NDqWbK8p17LbDC+cW4=;
 b=1ujf4JijpapWH/nOjxZ2QgZuRc0mQFRmg1998wEzgTxxWNXW+Wu6uTuV3aIgaDfjFZ74E/z0z
 sUG4/0XD4kBDQ+Rg5DzfQ2CFoovpR4etLcGo6OPdUtObyR6ZlRz/Y1x
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfXxkzWeWvnal/M
 iDo8fNDfBEGD2T0bDNchp1sojV60MCUMcfRn9TCuMLDM8a5ouk20GlxJUEScoKj1RP8/bdh+wxs
 66F/ERCSTMVqxShQsQgDxfj6xFBiIev0sQBU7hfbWgdfn0TnYL8ByZc6Qn2t+WbekxYG0XsOFM5
 EbNAfMKHT+0/mSVKfKcMfLyAAPpDNuPKhmmU3+b5hD2xOPggAk4lwPG+xbb8dYFmEk1N1LYJPjq
 THOVANYpQcTU3Pqt2auMMS6y8bubW6OsLfFIvU6gkgV8rgY8Tms/qlXc+8xY6DOGfPQdz1z6VKc
 vVxG1wkFFXGxSFrQmltHrP4JAwqXCuDYKAQSh1ZkgHjeNM/hF2nO9DIfdivsudGtQMcbyGbeoYC
 QUof+69FK4M3QDauxez86b6+31MfwY8MEV1ZJivel8ymHdlXH7ZLosCWVE7+pc7S13FHu81TCez
 oUa6kV+p1ZwK0R6IBnQ==
X-Proofpoint-ORIG-GUID: rKKsUFkRagU6bSI7OSaoj3UAhKZ0tGpH
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a05dc04 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=n1cGDs2KZ32Q86TtW5UA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: rKKsUFkRagU6bSI7OSaoj3UAhKZ0tGpH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146
X-Rspamd-Queue-Id: F41145432C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107656-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

MFD core has no way to register a child device using an explicit firmware
node. This prevents drivers from registering child nodes when those nodes
do not define a compatible string. One such example is the PSCI
"reboot-mode" node, which omits a compatible string as it describes
boot-states provided by the underlying firmware.

Extend struct mfd_cell with a callback that allows drivers to provide an
explicit firmware node. The node is added to the MFD child device during
registration when none is assigned by device tree, ACPI, or software
matching.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/mfd-core.c   | 30 ++++++++++++++++++++++++++++++
 include/linux/mfd/core.h | 14 ++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 7aa32b90cf1eb7fa0a05bf3dc506e60a262c9850..cc2a2a924d6d3044e29a9f864b536ee325ed797b 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
+#include <linux/fwnode.h>
 #include <linux/list.h>
 #include <linux/property.h>
 #include <linux/mfd/core.h>
@@ -148,6 +149,11 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 	return 0;
 }
 
+static void mfd_child_fwnode_put(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int mfd_add_device(struct device *parent, int id,
 			  const struct mfd_cell *cell,
 			  struct resource *mem_base,
@@ -156,6 +162,7 @@ static int mfd_add_device(struct device *parent, int id,
 	struct resource *res;
 	struct platform_device *pdev;
 	struct mfd_of_node_entry *of_entry, *tmp;
+	struct fwnode_handle *fwnode;
 	bool disabled = false;
 	int ret = -ENOMEM;
 	int platform_id;
@@ -224,6 +231,29 @@ static int mfd_add_device(struct device *parent, int id,
 
 	mfd_acpi_add_device(cell, pdev);
 
+	if (!pdev->dev.fwnode && cell->get_child_fwnode) {
+		fwnode = cell->get_child_fwnode(parent);
+		if (fwnode) {
+			device_set_node(&pdev->dev, fwnode);
+
+			/*
+			 * platform_device_release() drops only of_node refs.
+			 * Track non-OF fwnodes explicitly so they are put on
+			 * all teardown paths.
+			 */
+			if (!to_of_node(fwnode)) {
+				ret = devm_add_action(&pdev->dev,
+						      mfd_child_fwnode_put,
+						      fwnode);
+				if (ret) {
+					device_set_node(&pdev->dev, NULL);
+					fwnode_handle_put(fwnode);
+					goto fail_of_entry;
+				}
+			}
+		}
+	}
+
 	if (cell->pdata_size) {
 		ret = platform_device_add_data(pdev,
 					cell->platform_data, cell->pdata_size);
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index faeea7abd688f223fb0b31cde0a9b69dfe2a61ff..abfc26c057d6ee46947ba2b6f2e99f420e74b127 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -50,6 +50,7 @@
 #define MFD_DEP_LEVEL_HIGH 1
 
 struct irq_domain;
+struct fwnode_handle;
 struct software_node;
 
 /* Matches ACPI PNP id, either _HID or _CID, or ACPI _ADR */
@@ -80,6 +81,19 @@ struct mfd_cell {
 
 	/* Software node for the device. */
 	const struct software_node *swnode;
+	/*
+	 * Callback to return an explicit firmware node.
+	 * @parent: MFD parent device passed to mfd_add_devices().
+	 *
+	 * Called only if OF/ACPI matching did not assign a fwnode.
+	 * Ownership of the returned reference is transferred to MFD core.
+	 *
+	 * Return a referenced fwnode or NULL if none is available.
+	 *
+	 * mfd_cell must be zero-initialized or get_child_fwnode must be NULL
+	 * when unused.
+	 */
+	struct fwnode_handle *(*get_child_fwnode)(struct device *parent);
 
 	/*
 	 * Device Tree compatible string

-- 
2.34.1


