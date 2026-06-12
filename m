Return-Path: <linux-arm-msm+bounces-112869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KvTUGqS6K2qwDQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:52:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D0567772A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:52:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MW8nM3w4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fnypcLFb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112869-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112869-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B6EC30DCF27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938AC3E3165;
	Fri, 12 Jun 2026 07:51:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C8F3E3156
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:51:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250681; cv=none; b=HqGq9ahCTEgE6F3yV7DtEnOVB0mH0lF0rFlCvFqIRXqKPMzuVVzOWX4cj6aRTGhT5hw6hrtbAaDD8GSLjezgIQPMsU1nf7vLoLmjqINKvDu/H0dDt66NG1FsbWOOvEB1j4A8KKX7Tdm/lUC01r5Vf7olu5PJbgqEok0WeDNroN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250681; c=relaxed/simple;
	bh=tDaa2GIQNYzrJXEHHFWUJQbVOLYpKKq8qCdms4Nv98Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VHQxCW8y9aPXNrqWd7ewLMoZYDgC9cl1SH5yoR6YnCYxfqVd5G0jW54Gl0hbo5uvi+42RD3NlsU1c65rTAobYca+a3+kTidU2eLFy/ngJHBPTSUS9Tpg9MiZvXwkQ0O+U2zUdtvYzroxOjh16aMTrHGxcf5BayaPjHxUI1Lc/1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MW8nM3w4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnypcLFb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BpLq2401890
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E5Dk7W1on9zc2CAG5PUvEN
	WzEFC8IfjL74+2bjLgydQ=; b=MW8nM3w4XwDaBy6gG4t9Uvfkji6aVM9DvSWDBH
	2ThSK6S8dZzF1XSG9zVlV/WfPUhimjpBPCWi5KcI6ftClD7vQreh9DoWVY0YFm1a
	d5WEr8THezabn85ILEOpu5UzWj82Rv7VfuRVRGuGbQlR/pRlAM3vZWQTuWQlQfT0
	JEzaQlEOyJXxkouOA36CtI4m7eM8TL8EQPWXw9L61MzYpxeWiMNIcQnbrVruvjFD
	kqpmXf6g5OXE6XgplnvyaoTx01x7bRGQp7AX7ZMlEI86Vj3QE5xTjAm2yCfoyCO/
	kBgRKqWxKtGrVGC6VXpJr55NtxEZGamAZCDfIDsWlNkuHFjQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30ga36h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:51:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d6389bbf4so801321a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250674; x=1781855474; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E5Dk7W1on9zc2CAG5PUvENWzEFC8IfjL74+2bjLgydQ=;
        b=fnypcLFbHZ+FFc1d6fske/C5xsDIfnpYd/27Agc9Itu13voqkxNpT+ewUkuI1DoNbP
         tv2IXoSXMUDDGXCZHqcadjO3DAL3bH4ugld9IktuH8vPELRFpYeWHwroGBC4q2LUF2B1
         FriOO5tX5pyggU0p/WGJXQEMHdyg/6OTzVn0urJoX8mWeR5KtEVKVr6+/tTxnxjcL4at
         02vg5FnxgCU0cep+mxmfnK4m7dxKiFjz08EafLZkcNHDR1uSrAUS6PrYvVTjhx9D3o0t
         PJQ/RvhPL4G+hTfX7d8UY1BNdF4sp16rNQktRYAPejGss9HWWg1/bYIMPMv1oqTSm3gv
         gHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250674; x=1781855474;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5Dk7W1on9zc2CAG5PUvENWzEFC8IfjL74+2bjLgydQ=;
        b=cEnBxxwsBeoxEX7hUEiIyne7tEI+TkusWdNtal/wuz1fwYgdfq4GXJ1xMoIBNKAOAG
         9Yhwx+mSIeytivCaD4NvRINTUIkULvFWkOFcxC8yJAoADU5eWGZdLyk+nB1dxspcbGSp
         eAdaGMlp2C+yTlYMp2EEriNNGeMy9DxDa3OkDCFyQXkYVOSZbOsy7HkOKJiGUjy/Du6f
         CqVdKR2tzt3tXq363lXvDhzGX995wo1eLudI/LFfkjw3i/QnASCa72xOEntBvnGtJZfE
         5rNUNDSyvR1eyfSlog4lR7BiyLuFc3bqySopjY7cqVI0eAwzOcrPB7y+X4SoDFNEmuIi
         BRvg==
X-Gm-Message-State: AOJu0YxnlnVNbrilXTI93Uv2D9Ej+Ng8oGh4nFukviNfJWHkclo3IuR3
	yttRkwd5Lrze4/9njTIL/0kHciJUDHSpX1yoFjxp6OhfP+d0GSqwKO76/AYGtrz8/rYWkLcAL/p
	ii2yzgmUGtuyf9ZIaEcXDEvB8YA5g9fK242j+J6s2jtauDsBKzFbEChWDssYedae1/VK61gBq3T
	Im
X-Gm-Gg: Acq92OHKCjFLPSXSuCEdF8u+pIk2ghm0L5q7e1dEEGq6NIjDAazjQ0kU64bKeGZ5y34
	km3WlSWZJ58s6Ynf0TIkkZQmnsBSdcZ4A8d27GcjBjcnS8y73XIwGGsAsk7ArE8NPgP3JefOPAM
	EH6Zc9NMmpNKHu98mFiKBJjjAkx/1gx/7kA+Qzw/wm5nAmfMKwM8aY7O1TyTqulpdVRBfR9YtII
	49jtl9h+7a1lCL0jJBKvMZHKlGzVL0Tf8+CsCB0wEIPXEyT0AnaIg5E8cCPU72B7trw1Lpueeh+
	Emy6j7W45WxWxH2ZxCOaQdeomef8PZILqFbU+RnmL4dNBigqwwCd4BGA6kgn2Ow7Ftf3WOKpVNQ
	1vfuLuRYO/FIGBmyL5GmwJ2OtY3PoBBM2wg66nnNx065ANRkeA4o/FamS8Bm1JJ+0x8X2CzdGR8
	4DNV3tF6wO/Y+QpdP9eEJcVEUFvst0JkNjwGjW
X-Received: by 2002:a05:6a21:329b:b0:3b4:b6d7:a992 with SMTP id adf61e73a8af0-3b783b4f2a1mr2382075637.8.1781250673765;
        Fri, 12 Jun 2026 00:51:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:329b:b0:3b4:b6d7:a992 with SMTP id adf61e73a8af0-3b783b4f2a1mr2382044637.8.1781250673382;
        Fri, 12 Jun 2026 00:51:13 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5ab99sm1307544a12.6.2026.06.12.00.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:51:12 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Google-Original-From: Kathiravan Thirumoorthy <kathirav@qti.qualcomm.com>
Subject: [PATCH v2 0/2] Add support for the QMP PCIe PHYs in Qualcomm
 IPQ9650
Date: Fri, 12 Jun 2026 13:21:00 +0530
Message-Id: <20260612-ipq9650_pcie_phy-v2-0-b938cc2fc267@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGS6K2oC/yXMQQ6CMBBA0auQWdukHdOiXsUQAtMBxkWtLRgI4
 e5WXb7F/ztkTsIZbtUOid+S5RkK8FQBTV0YWYkvBtTotEWjJL6uzuo2knAbp0057Ws/nNFeDEH
 JYuJB1t/y3vydl/7BNH8/cBwfr5xw63QAAAA=
X-Change-ID: 20260521-ipq9650_pcie_phy-60d7df32581c
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX9/zzUGIadNBC
 YzYWlJq0dklXhjVMvNl9PzWweQMUzVzkKnzz+7Mbi/CYBYrJyQcQ+EtpsDMadwPl9JOgc8MjOMv
 Xqg2yFuY3ioAXJQxw++NXPwfrZpEgC8=
X-Proofpoint-GUID: LtuRMllucvLZkCVmVKgRJ28V6ZbAdxkw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX05qhOKD3t1AR
 tgAeWsLEDDz4ZjWskEuSUIzT0cWtFV+nlhqWKFb/aSwBun/oiuyb6iVc7F+FbRWXH8yk8mBl0Xr
 qUCig6Wlli0VCZ3dvevOTQJYgJnCNufxU6/SeXsIYOYeM/EpCBaCnYI3Mo311KyCWRLbGjcYOFz
 tuPd+0Y668SuiFN2tKaI4f/sOWfF1qAiTY4JldSUcwVweDXxAvc8yp9gH026pajbsxkb79BipXr
 Qx0UvCqEhxTpADzy0JOAf6H2hnTjUEP9hlJ6YSpkbH/QIrEXeA7sgFGpottTjMHio/FuqZlTTY2
 lVHbVq+LWuMVCZJl9Fzc+545ShRKpPJlyrsf34tOktHAbp2qziThdKw2AR17ORN0Q//uXlAMCh8
 8vi7+H/cVE+XCabJpskmUH3g8IZFqOgSIaKebXVHVQfx4xcxj9sz8VoaTGDL2YonYlji6mFubv3
 4A7a2GKs+pl+i301hPg==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2bba72 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JfrnYn6hAAAA:8
 a=cqutcY1mnIGKQfsvmZEA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: LtuRMllucvLZkCVmVKgRJ28V6ZbAdxkw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112869-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,infradead.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26D0567772A

Qualcomm's IPQ9650 SoC has 3 Gen3 dual lane and 2 Gen3 single lane
controllers with the QMP PHYs. Unlike the PHYs in the other IPQ SoC,
refgen supply is needed to bringup the PHYs. Both single and dual lane
shares the same HW init sequence. So reuse the tables.

Document the compatible along with refgen supply and add the phy driver
support for it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- rebase on phy-next
- pick up R-b tag
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com/

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Kathiravan Thirumoorthy (2):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: document IPQ9650 QMP PCIe PHYs
      phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support

 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 220 +++++++++++++++++++++
 2 files changed, 239 insertions(+)
---
base-commit: 2ace2e949979b82f82f12dd76d7c5a6145246ca3
change-id: 20260521-ipq9650_pcie_phy-60d7df32581c

Best regards,
--  
Kathiravan Thirumoorthy <kathirav@qti.qualcomm.com>


