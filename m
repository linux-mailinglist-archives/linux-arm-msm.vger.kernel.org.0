Return-Path: <linux-arm-msm+bounces-87203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B73A5CEE43B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9323E3008569
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA1A2E1743;
	Fri,  2 Jan 2026 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YF4n0+us";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2URs6Qh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BDB2E03EC
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352080; cv=none; b=YZZ5M5G65aBtKHeyl/pXgZIgmtf9+yr1EiWsZ005AJjHHR8WSzQ+lccF3aAaPpxc5HGoNYpgULSUM6iaqhk1PmFuxGHl56xq4lPaer4wZuaDD42yFx4ymnLuSDjoKErHT0GxKb03J+pXIKZKbxA9GDHMrBKLdPWTyPDMQkVnoq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352080; c=relaxed/simple;
	bh=Pi+yvocHj+68iN/I2FwxDH0VlEMhS3eGuQeKsHtkHgA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GcMweLDeTFRfT4zqjDN9vLc3yqDpG/ovlTol41yf0gplhfq203AAjM/ptCsme6e8VNIoBRvZ8HRKPXtsGxd75QDrEyagstwtmrP6cC03TvgJXeFfTYVm8F7c2gWpgBRlsZn4cBpwzoDjV4h1nwjKQ5tX5viPBbE9/5Xm/5LcWpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YF4n0+us; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2URs6Qh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VvBB504454
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 11:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I3SH9GjIuBNMGI1J47ulzY
	/2PEEo5Dto+IZW5r/Jc3A=; b=YF4n0+usMep6pBs5kbpIkkGzV7r7SmmwGUUzFt
	gGHC1NfUzyCPGnwQvcRQzJYmkhFha0fpJTqgXRZ/nBZZ/N2d6nLJMx4Q1YHKjFRx
	inCLEcMK5xJWplkMSmKc2Agw4pA/2KBAIwPYk6UNn+qYtFEqRgx1NhBa3nWVUA4F
	g0JpxPh4ig9EDJKvbSn0mwvRjegV6sSKmzVIV7nm7qnAmZ9dEX9umuMsFfPCma/Q
	MdMFKSuQxGmtKma0BbDJ3AfokzuNikjtLMtevDu8u7czlE8CyVl0JSxBOU/msZIo
	LEZ0CzO3JcrR3dtRAEt3JYGKhA2/35b9rkiN5jEHNueHwQSw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be8bk8hxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 11:07:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a31087af17so252031865ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 03:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767352077; x=1767956877; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I3SH9GjIuBNMGI1J47ulzY/2PEEo5Dto+IZW5r/Jc3A=;
        b=a2URs6QhPmEH8VsSWfIfQBBg8HAsKddgIh/rVyVP4ToMfvKWEXuMh3Y4dDujl7lGON
         xg+4rydjgWxZ/g5j4aNaigWBdFtCZVqGNtd9PHvi38aV3O+Ra1o4coL5D1ktz9mFgYAB
         4inmgv8RrXrs8GgxltOWb2TgjPr9vF7CWJtFND6EzvTs08w0UMtJXrye3IJLmUJqH23q
         fzho5hdFpTn67N+cUD+wh3fhvv9/uhTRwDu6a022BfyEmOx/3LRLey9tufqazhkMnu63
         pD10KreBVKYjvFfAmi1tE1eZa4Cr5BQV7RDgmyGXOFFJ1GWtNLPUSlUfzZCsKG5WlQAD
         rtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767352077; x=1767956877;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3SH9GjIuBNMGI1J47ulzY/2PEEo5Dto+IZW5r/Jc3A=;
        b=aRUjGCOc8wlOM3S2Re8RT5HFuStwStWySKS+OaEE9+UKs/wKQc3sqGGpuiORL0/9VJ
         YKAxVlLxQkySCC71NSDjacj6LRvGFqO+29qK44zJcuUttxnqF/0lyDr1s6IycYFrl11q
         1+CWqKKgqL1fZPfT9awU3jsFa9zZQiWEZgiHCg/0mQwZj9uoEs6AbRkOImUFaZnOw1wE
         HHf7EUPW+Uwx9tZo/LmphSrrhN+lE9XUWjWQATwjp/FxqUBFwe+FpU+13QAhO6telwRU
         DE0mn+hKHDSsDZhxBnmLOjN+wTRM5Zn9Pq20SPvOO0alU11GCKpApcBzgJrYu9Zk53Tq
         zQyA==
X-Forwarded-Encrypted: i=1; AJvYcCWZssQoNIBqM++o9pUf40Dyrb2APTm/pcRZ3FxEMRsEEk9o01CTfzD9h4WZfG9q3+y4wVDkO+PztLgZP1w0@vger.kernel.org
X-Gm-Message-State: AOJu0YxkQ5IkXbr2f7RAfiAv4isnrE5pZtSjeSD4euknH1wPcZP4Bmy0
	n088I9qPw074iwBB5k1HXZeshaOeE27FRHzeo0eCGnPt1QxGv9uXXWcUUOfi/26S+dNxYyNv4bT
	XNmyz/wmWBfcoi1UL20NG+ta+KWSRhSCkj1QPWSgA3VGlP+rPhge0wgta6dJIx8nXN/km
X-Gm-Gg: AY/fxX4FR+fNp+eq4F1z8+0HZSVCGZJARXZxCHb4XWz8tO3MUxP3qN9wuIJu5ctVctH
	OjAMia0+4CRQgO2pOyCnBiV/l9s4K/zjHmIpwfdQp1WrkzkWL308L1gbZ1tSGzXF9lSR8BuRWaR
	UmnuUrQfEv33M6eMzeAeNB5M1o7sgZposOA/dlKkvKrmYNBMSDFuAlU/5Rxe/XCHBhp9JDHOxUW
	ZDju09OMZEy/J1WTTEeHWV6xo3YfUQDOhFA+3gYUWztREbDFZJJg1iwVK5P3XsnQ5zc4tIZvdF2
	ounMDEsugVzNu67zsBVSXdO5+JtOloiX8sFS3eoENII4K5h/LPMpAGg+s5PX3fj4QyHNmrQSOkM
	ds13XMGQHalqRp7liek0zp3QUpS9XrSjGLy2KcgI8kj2pTVaObkhH/aRVxu/HUB81fAIbB52Ivg
	==
X-Received: by 2002:a05:7022:ef0b:b0:11b:8161:5cfc with SMTP id a92af1059eb24-12172306ccfmr40591183c88.36.1767352077324;
        Fri, 02 Jan 2026 03:07:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnED6W2rIFjIWbPOJ4rO/6iEuR3VwGmmCPYaPaegYOMEiQWFQGUbmjAC4d4NgVomn4obQIcQ==
X-Received: by 2002:a05:7022:ef0b:b0:11b:8161:5cfc with SMTP id a92af1059eb24-12172306ccfmr40591138c88.36.1767352076691;
        Fri, 02 Jan 2026 03:07:56 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c058sm157431107c88.11.2026.01.02.03.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:07:56 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Add Mahua TLMM support
Date: Fri, 02 Jan 2026 03:07:53 -0800
Message-Id: <20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAmnV2kC/x3MQQqAIBBA0avErBtQExddJVqYTTWQZloRRHdPW
 r7F/w9kSkwZ2uqBRBdn3kKBrCtwiw0zIY/FoIQyQgqFkYM70oq72zx6u5wWj9V71E1jtB4sGe2
 g1DHRxPd/7vr3/QCeAnCGaQAAAA==
X-Change-ID: 20260102-pinctrl-qcom-mahua-tlmm-433644bae64c
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767352076; l=1125;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=Pi+yvocHj+68iN/I2FwxDH0VlEMhS3eGuQeKsHtkHgA=;
 b=/z9PbatxY6RggGC/eKZaTw5QeB1W+/cFfsAwwXKFbSK6rubbDzkYeTjRpmY3PhJwxKKvs9WY2
 nCdtyqVN5/lA+yaCpdDvONmuL1k3n2svTJSixDt/s9FpMXygOOu8Opo
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA5NyBTYWx0ZWRfX/q3j9aJWmB9o
 TAmdcpdvWGfnoXdNExY5GR8CgFWfmd8y/ieLA04KwbbQBD9D9ElLUFuNQFY5pQT50P0EJ8o/mcJ
 3Q6ELdgYZsD7eDRr6Wlt04Ah6k8FZP8TxIn3fkoLMM+xeGaVVSypoja28AXqxgaTrLHJpkHGpnG
 p9eYnjhS6dPBI9Qcr9hB9VXlFkcTD87uBXHFMyccpDavRce2qVpBYRsLPW4hFbra4i34dNngWE8
 476TXszjMwZZZqEONysSyMwda4rNdjJcvTmxLpdjpnh1b01vXkxi92zhp6CcZdmh21cnjDie8GW
 CCO5e529n3bOVuvhy+an+CfONuY9MnfmU2dwERwpNt8UWT58n9V4oqlviVwC4dXjqjWg6oIR+Lg
 Ujq+zSfe0rbthbQiOnhW05cV9cT4KRuWSmg5XFt/2Rnhcle5Ps6CStIHevuVBduWj0kwp82v9s8
 QA6xSmwhoMUfEHkjq6Q==
X-Proofpoint-ORIG-GUID: PxMS0qLB6Pg9vEN2ao07_5TELNCY7Dvo
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=6957a70e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4Q-EQNNWwN3BBnYOq88A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: PxMS0qLB6Pg9vEN2ao07_5TELNCY7Dvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020097

Introduce Top Level Mode Multiplexer support for Mahua, a 12-core
variant of Qualcomm's Glymur compute SoC.

Mahua shares the same pin configuration and GPIO layout as Glymur 
but requires different PDC (Power Domain Controller) wake IRQ
mappings for proper wake-up functionality.

Changes:
- Add DeviceTree bindings for Mahua SoC TLMM block
- Add mahua_pdc_map[] with Mahua-specific GPIO to PDC IRQ mappings
- Add mahua tlmm soc data
- Enable probe time config selection based on the compatible string

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
Gopikrishna Garmidi (2):
      dt-bindings: pinctrl: Add Mahua TLMM support
      pinctrl: qcom: glymur: Add Mahua TLMM support

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml         |  6 ++-
 drivers/pinctrl/qcom/pinctrl-glymur.c              | 43 ++++++++++++++++++++--
 2 files changed, 44 insertions(+), 5 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20260102-pinctrl-qcom-mahua-tlmm-433644bae64c

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


