Return-Path: <linux-arm-msm+bounces-110655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI0hJmfCHWrPdQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 19:33:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE44F62349B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 19:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7E253051C40
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 17:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A1F33DEE0;
	Mon,  1 Jun 2026 17:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1/rujjM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INF6fjem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A8B3DDDAB
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 17:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335061; cv=none; b=mwUpcQPzoupggo7lkowFSPSfDNZF9nRMJxg7Kzuj+Wgzy+JvV8QsXYPg1DdA3luMhoGOlkggIyI0kfulL/FVny/OUFhDQGR2yDkkBQWEsGPqgq3Yk/qItgMgd+agEsOBX/+cHuxeCLZEj4MMfSOxCPWrkIBd5mWJkQMjLsRMPl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335061; c=relaxed/simple;
	bh=Zyi6ZGL896jGON4iStDG4HYuocR8SRlTT1GS2O/Ts0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tBpznUrzjhg3XE5QWbG/fKkmZBVzivCY0iYZrnWYoDJMCRKNJJBrj0B0NxzJtUZ1Gf8p6K2snSlJ0bI6IzyDzr0kGC9rNZpkrAf+qs/x7i7bohMiducUHkCIMwYBqJKBeQPZpOOcDmoTBVzE4AALdJfaKfUwkgvcp2tlKv7SCKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1/rujjM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INF6fjem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EnVMT2740525
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 17:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xCwwzgX6X6FAk6K+BEi4rFbrCZI7XpDhhtoZrbnj3PA=; b=B1/rujjM/5EQKr4X
	lUbYrgXgDIX+FCKrQ3Hn3MW3Jfqz4Ita7YYgImO1R461MdboqGxaBNnXvv4lfMK3
	4feFCRAU9eekbl1K8MPkKZzLJ4CpTyHDUB5zw5H4snA/lx3XmfUdd1PfV/o7wkLg
	uD4dd7/OEPyYVHYPdSqR/XkhSI2lZM5Yqp95GnQAwfME0Wm3YSG5+WZV3XfPUzLa
	dmKotEzbUHtcxFCMWEOKxelDomUJjNe/2KgCHp34OdIodaNlK2EOmpWttrK2Zx+G
	MF2WeD8qPX81rGI7yKVB8jMYRUIMbecfiKVXntm7TYXP0X9YkLeaqT/B3ExpfyY7
	KIwvLg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqj805-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 17:30:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c1e08848so22107585ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 10:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780335059; x=1780939859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCwwzgX6X6FAk6K+BEi4rFbrCZI7XpDhhtoZrbnj3PA=;
        b=INF6fjemnrPwc+bbYj5HAnZ41nCzXlwQA/qzUwXrNh939NM3XzEVixIh1Ct7vjc3uP
         RjmzsDCKxwATqXdQJeD0NZcXwvHW/u2ZaJUEeFdpA0ZMDUEH3jz3B3OexZutkovwi6yH
         Marr2B0LykOvmajdET7HM600w8z0PHd/mb0sEcBk3G9EqcTAn66gSroBpNJ7qbMx+VKy
         yG3ZYI9e8Xp1XiNDHRP1x7dIMUeuRVb8GLYmqnv+eLmEL2gYUQpU62eZd6hOKQ6Ue2t6
         CcqXxHl9A4WlNz9PTWoVv+F+twkZ9Ti6sPfOSgJih+4lIy3kS39ten18sQxBpZDbcOGt
         5AmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780335059; x=1780939859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xCwwzgX6X6FAk6K+BEi4rFbrCZI7XpDhhtoZrbnj3PA=;
        b=aq71/ixotU2qSLTVYV8csRLOvfw7JS7h5VqYoJl/OFZ+7sCtG8tBmWUVJWpGb0Xfd2
         vbzSaS1jMF4YpkWk4wbAh9BT3cyjU+q8yIBQ2KA1VKGArFJPvsWIkJbqS279w97gV05b
         ALHe2tyJ0bv76oHDizaFWHrU8wPYax2F0bPKn+MpoFOHcVBvUSITcY1OaL2XObt1LPCT
         F94WxsjLCRlK1Zqikn2NixtNzRMZmnZ1X8U+hGDTieYpz1WKVUKYTkDK9FZR/jxHsQWE
         2HHfxu6cpdLJItW8/M4awW/ZI2N8tyvZpnLl5L6VMlTIzN5HN3iw3K2l7DZSyXm3RWlW
         OgUw==
X-Gm-Message-State: AOJu0YyNHUqaRet4Xxon8m2vfGQVgY0+j6YLmF/f7xxYoXE5xp1gS8Tq
	Ol+UoEL0vLRkEPrG0Gx1CDt0zBWoVxj/MvYZkTtgA3hPkfg6XzRmbIjJzls5ZKBJ1hcMz0DBi7w
	ocOp61bdLI8BYA7jVcn1eJ3CPfvU5t2DkI/OXdZyfkVE+/TTqawkCH8SDIpvkHPqc51JT
X-Gm-Gg: Acq92OHNGwv9XYWIH3gp1HT7bsaMNaR6EZNyuFskIQoJUUgTDY8Qgk4Ox3HCK8Go01Q
	Kh/SIpFdAc2cWM1+5uk+8J7y22jPQzlM0IvzMzJo2l7DWzOb0mueHrUovCqY+FRYuaSXnrirF5y
	Xvg73L9duk/PibfI7Dm3329wdkLLoiESFD+FJ07tTspfUIfBZ0SfLOY9YjSk0tS9mUmK+wI3x6Q
	Er6wUalkCojv37IXSpzshR8U93phj9wqmf+H/h/s1raIm+TOn5juICPdPXntiGZEDgaefqYtsEx
	CzGqwJTITzVX2a2s91EBmiVAVjJe6iW911ym8UaFC2y9KrkaMIgJlPlegWoQgvdpe9ESWnwwpoq
	3hMegWiBrg/NgWq9xvGH7KzDPy0k9/c6ZCX3Hs8/RFK0Zl4DrIFiKo0dNvYcjNBx/xbI=
X-Received: by 2002:a17:903:94e:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2bf367bd713mr122993595ad.9.1780335059114;
        Mon, 01 Jun 2026 10:30:59 -0700 (PDT)
X-Received: by 2002:a17:903:94e:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2bf367bd713mr122993165ad.9.1780335058650;
        Mon, 01 Jun 2026 10:30:58 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm149136085ad.41.2026.06.01.10.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:30:58 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 22:59:45 +0530
Subject: [PATCH v2 2/3] dt-bindings: PCI: qcom,pcie-sm8550: Add Eliza
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-eliza-v2-2-6b44c9c23d5e@oss.qualcomm.com>
References: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
In-Reply-To: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780335042; l=913;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Zyi6ZGL896jGON4iStDG4HYuocR8SRlTT1GS2O/Ts0g=;
 b=0Cr9XKqiuqEufsk3MnumP89WSaLaGSxg47BTJwEc37C20UjzDgXXyOejYZMYpvYjiWuENKAZk
 9WtrirmnKFNBkPl9gIi+eQg/CY5DJFxT6TFdo6IzLtpLOfTn/diUBhW
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: hwKGOq335XiBZ6S4EGi1JHA4bu1luCbD
X-Proofpoint-GUID: hwKGOq335XiBZ6S4EGi1JHA4bu1luCbD
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1dc1d3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ly1VyIkaSgMpB_u5KqwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE3MyBTYWx0ZWRfX9QT0+JOQaMnR
 ohhVQYHZJ+sqHZ69jzogqOIaVEvwdH0Wh2Rry9ZzMFXTgRFaO1mYG3Jolfoy3lEol3eL81jhWDw
 4PUairrCORkyS+F7+wQ6ny0Gh2xxpFEbZfoDNUXESMrxLWwrz3ndF+05k2pry4mYZbstCmtdrbT
 6TH6V5BTj/GePln1b9jxzOs9ZM1j5KQTPuDYfRA/taypJdgFelYFdL/zSV7zYvewQ03L/ah5TD0
 NTRcIHJHIe0vCbaMloeLnuCEcbbJgzD83NeQcMAmGCSFdEWnWnZB2PPh7LeSXpCQFbcrw1XjNGz
 ZNKmqF5KBxDNPJ2+RmP/tljLMutkJMFek7NLBpkW2YNxkfAPKLn9uzkWGk/BtRjrl5L9m9vro3T
 tiWlYeBgM4wbt/bGAI5yo1JQoSo2/UO3uO/OYXsXT7rYVHgU4WOqpYiT4t8YQWjxssjzAg1TQOS
 Vl8sY4M1El7BLz3U/7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010173
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110655-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE44F62349B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PCIe controller present in Eliza SoC is backwards compatible with the
controller present in Eliza SoC. Hence, add the compatible with SM8550
fallback.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
index 3a94a9c1bb15..98b7e0612410 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sm8550
       - items:
           - enum:
+              - qcom,eliza-pcie
               - qcom,kaanapali-pcie
               - qcom,sar2130p-pcie
               - qcom,pcie-sm8650

-- 
2.34.1


