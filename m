Return-Path: <linux-arm-msm+bounces-93677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KKNOwdGnGk7CgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:20:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3D6176094
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51B8F30413AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E6C34D4DE;
	Mon, 23 Feb 2026 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFBWs7sc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jq8S4bbV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29705344D98
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771849019; cv=none; b=adNi/KDpHI5BiygaeIvcMRY+Fl2F2Zald6azMS/hV6QqMzgovUq5PxSjdptvNLLY88nIJhVlFX/8IR9IaOrKiGwkt22XbIVlZky/xdyKYlTd7MZ9lx64JfB6Gd50Df5yGJi+saTONjsdemXp/Wq1ub9saWJ3ohHwnh8l7AKZXps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771849019; c=relaxed/simple;
	bh=anvKFcr4JPwrgicD3hRuoEv7eMJu5LkpHRhppIbaDVA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cykGEOCUKfY/AQ2zei8OZAwSs3vDPjRBExg1fENjXAfKqyiSabcfTZ5KCKQHCHWC5gg3H+AxELQ9jDOzlLhJ9+vP3hqFSGTStV8Q67AboprUp94jH9CNVEP8TsqtY3cTSRbBsx5Haac0QqqstaGJoWaP8mC7z1hKZ5vz7UUQ4eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFBWs7sc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jq8S4bbV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWDUW3732709
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hvlgW9Ix2Woabzo/ldedDq
	IRB9542i4+rJq7vGs5KHI=; b=BFBWs7scAkKRbR/JbZYES491VqTsSKQ6JXQZaS
	ctT9S9f+WOzKrFnvXCnZaG0u1imMjUGefiG3lBb9bDwv7ScofIfeb5NuepIPfm93
	jf3MK2tnASwyMQlD99cqnk6lqhF4WtIBQ6Wp1cTi/NCQytwKj1WsYfRerY4KyhHM
	Xq2lHqYUy/frhTtZaTFoHW6NCQNHAHRUM2kfFXHexOdVR7qJolzKAphdsVNiHWPf
	qdpePlmm8cS5/2SUsK0hhy/8RvvDfNNy6Qiv2yVlSD/ItONwYpJyULJYHfxvZXR+
	OtClXMr8+Gkuey9sLODb1ju8bZL2Zc4SPNrkpr6Y3D8dZl6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t89s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:16:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ef98116so4730390585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 04:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771849016; x=1772453816; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hvlgW9Ix2Woabzo/ldedDqIRB9542i4+rJq7vGs5KHI=;
        b=jq8S4bbVMh3Tl4AMws7hbEdbYinkMz68N7z+sM6lPQxDe5r4lwJ0v8hvDg/ejGWILC
         xEmcZvXB78Cp55vqL2dbMaDmeyeZmOpFe9OhHyknulMx6CJcb7pzqV+E8xMD3KBIYDMZ
         WNZUQhiwRBDAakwkBk+nH7KCUzyYjsWyT3d8qMhYr1dz5SqYFGV3uisdSdl4UELHT8Ed
         mmYn8OuLM7iHmfqrGZzozO4xOYp+YYz9c+f+GBZElbuq24Libz/rOaIkPmg6Q+u4b7nf
         RPuMpPkDVk6G1t1K1ZvLPG3gVee9adT/CA2jUdFtEvQfFPCM6SwF5Evu1rXeCPqEuGTY
         n/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771849016; x=1772453816;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvlgW9Ix2Woabzo/ldedDqIRB9542i4+rJq7vGs5KHI=;
        b=tGuy/yEURGclX+FANjXjfP/hGgHlV3Z8EY/iiIu/xxoBk17BkaMzMt0FPIt6T5GNEx
         IhyfpI46zsnEEX26J7NJZ19LQVSNHNk0XLkCTGIpTV/sB5mH4T4EUkGmIfmffLmyur79
         2sks22xpMxHeJz5zsS3Oob/pj5ryvMv24UJzjA1ofEv6UkpnS9RmZnNoH7VCqOZmJ45D
         HDvioEaxAXRgFms3uKZpUOjbKpJDxLNfvudqtvCipFshFvLVZEfv+nePvrhGv+gDoLzb
         xfi12Lsor3A+NKzUIm6H/Fu7IBFA+bxL5Vy2xLWjkaRdv8SrEzk8bcXZlfXxYEO0pJ9b
         Dm2w==
X-Gm-Message-State: AOJu0YyV3m3C5mTXNRkLbdHmxT3DuAxIpjgXKYp1ix1gvNrsGhEhNZb0
	alBcDu5CkQDFIpT3BINVf7pZKIS0O9eNiWjR+FOrQJm3O8vNwwo5yyw0l13YVr/P9gPZ78OlTUM
	LYHfOEnDxz6lPAzdIjj+n0ZjgopvYeX3e6E0y6cxrkxGLtfOAgER6ZKTaad5w0985UHeU
X-Gm-Gg: AZuq6aJ/1fMSvi2m0bLKOiBriJQuG5apo7iA1N4/akSJJSpAgaFaDT+NV09dRQafmKB
	EoAZEDo39habO6ynVRiIwviAp5thzv/1zSue5D/BxlDu2OxXqHvUFw29XP9RqRrjDn2PMnKBWI+
	24j9q9PTHSU1nC4rUiT9YnqokwqOD2WSpSb4EYeFgqX3gR/pDGJY13enum3O/z2knj4OdZyULK8
	T8fZX2FpP6CwA+cRb0hxHSlM6CtbgJ9jVn8QU+jhEPK5MJE5zqPl/vaZKkIqKbYuPWb4qY59wMw
	EyLki81iOwolYm4IcvUWouMzm4j55ebymNp4S6i5po6KoTNos6bJYstDguUn3JbJ2VqV1EUM1Rn
	hcOlXvcUi3c+T906X0sigFOHaFZfwdg==
X-Received: by 2002:a05:620a:c44:b0:8b2:989b:efe6 with SMTP id af79cd13be357-8cb8ca0d840mr1033261985a.26.1771849016302;
        Mon, 23 Feb 2026 04:16:56 -0800 (PST)
X-Received: by 2002:a05:620a:c44:b0:8b2:989b:efe6 with SMTP id af79cd13be357-8cb8ca0d840mr1033257685a.26.1771849015716;
        Mon, 23 Feb 2026 04:16:55 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm274881985e9.15.2026.02.23.04.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:16:54 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/2] interconnect: qcom: Add Eliza support
Date: Mon, 23 Feb 2026 14:16:41 +0200
Message-Id: <20260223-eliza-interconnect-v3-0-f4508b8335c5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAClFnGkC/32NzQ6CMBAGX8X0bMm2lT9PvofxAGUrNdBqC0Qlv
 LstXjwQL5tM8u3MTDw6jZ4cdzNxOGmvrQkg9jsi28pckeomMOHAM2BcUOz0u6LaDOikNQblQOt
 cKFWkXDRpScLj3aHSz1V6vnzZj/UtTKMpLlrtB+tea3Vicfc3MDEKFBgoBQ0DkOXJep88xqqTt
 u+TcEjsTPzXlG+aeDDVXBRVgXAo82zDtCzLBxVr05AXAQAA
X-Change-ID: 20260123-eliza-interconnect-b73ff8523d59
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=anvKFcr4JPwrgicD3hRuoEv7eMJu5LkpHRhppIbaDVA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnEUsFZAEn8Zohh4jTwJaexKSo25GeXvDA3WGe
 Fzh4mHhGRuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZxFLAAKCRAbX0TJAJUV
 VvOfD/4qWMz9j9kpMqOfWRusFpt+PAY3BrvMc3vasU+ZSsbt01I/7muXezBAw7Ca647YqSboSGP
 CC7bHhmSzxvmFSBNvqBGl4U8wAjU8syLZUW49D1K9s0X3L2MT5tJKj4yPkeevf5fCsOd4s8pNWM
 PvLWr9Wc3pWW1ZzkLzZd89HDFo4D5u7oqHNCu3MmMyjvRHgIOxQx30zT1+ptOD/3J96tV+bulod
 5IUVvxQhzxFEYhLCeT6UYH8j1dQ0g1Hf9abJ8vqJnCYnktDciZZMV9/y7mOXYSLAqgo8j2R/Lky
 klEBUlRunB3hA8355imyGQPx4pm8n+ct9ZoPGITIhwYxzYDtioRtRPnjg0DmtCqi/6p5a6G5amj
 Uy7tXyymgsFvaburhAuhJLmBRi1A1T1tmUcyOeanfXogaZZ/RYasj0iJ50Dyw0UDa0Czj5PqhsN
 CALHeg4TBYYfe6wWZ+ralUe+nwIJH4xEvK+ubqCXrOTXBxyuO6LW1H5JZj059j1bt2SLy1tBtph
 0GVGWJ1F7CrShLoiUH4SQLtRURFPkg7zHmHPBLA5IYblY/Wkquu2kc2zRhvAh7Vc/1vE0mIgtoy
 3LNxPmJJpJ0x6YIQt/KT/EHYF5ZFmJY6RU7tE8WtykAWezNniQLP9Dsd/AKY4BCUzbuzereBgbw
 3B9/UWC9sKW2WFQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699c4539 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=ID9p70YM8hoiZytZed8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: tcbBpEYXUnvR2e71iydqpu36fF8BNO4I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwNCBTYWx0ZWRfX4OwljxlAUOWv
 Pm9jnoRREQgG4iJJLpv1b58D6JGWfqIssyhyF83TIG/hM3nKFKEjxpSd7MbdQqPNFXLqc0bGRLc
 sxjvRQKcj867xsrdM4HU67snuAma7Z1rPRTVH7THnBgDky6Ao2KUc5ghWFU0alwOe+280KwEUzy
 f5ZJfpYDGJl8KCSa4CYMgnhR6O8h++UXN1egfQ9f4Dvx/5JyNr9h7G6MOq0nN8p/L0XTQWc7f95
 bSZdSr6PKRc02mOtzYHabNuXabhquDBm7cq25ZUYbw7yg/Nz92Q5DouVPMEPZltl9P/Zng4QHr+
 dcc6gJkB6r8YqL/g+/E6AFQpHUXGypVIviXQTbLrWjTfYJ2yem9ygUiN9FBceOrNoATv0eY1EEA
 ZcdMxC/Q6iRVqdM9gigSXZb5QYfBq4W7PM2x6zGp7lnY7pQpf+9RUV+2BPCjVEML8DxZ04eGwdR
 x3x8FmK54Xhna7Mk6Bw==
X-Proofpoint-ORIG-GUID: tcbBpEYXUnvR2e71iydqpu36fF8BNO4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-93677-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A3D6176094
X-Rspamd-Action: no action

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Picked up Krzysztof's R-b tag for the bindings.
- Added UFS PHY AXI clock to the aggre1 noc in the bindings.
- Link to v2: https://patch.msgid.link/20260127-eliza-interconnect-v2-0-b238a8e04976@oss.qualcomm.com

Changes in v2:
- Picked up Dmitry's and Konrad's R-b tags
- Replaced the all-caps SoC name everywhere
- Dropped extra empty comment line, reported by Konrad.
- Link to v1: https://patch.msgid.link/20260123-eliza-interconnect-v1-0-010ff0d100c9@oss.qualcomm.com

---
Odelu Kukatla (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Eliza SoC
      interconnect: qcom: Add Eliza interconnect provider driver

 .../bindings/interconnect/qcom,eliza-rpmh.yaml     |  142 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/eliza.c                  | 1585 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,eliza-rpmh.h |  136 ++
 5 files changed, 1874 insertions(+)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260123-eliza-interconnect-b73ff8523d59

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


