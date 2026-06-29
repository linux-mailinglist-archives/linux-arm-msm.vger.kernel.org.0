Return-Path: <linux-arm-msm+bounces-114856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gf8MGLIWQmr5zwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:54:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7BC6D696A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:54:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NnPKRdmC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iR79gP9q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114856-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114856-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26DD130687B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F873A8FF7;
	Mon, 29 Jun 2026 06:48:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B320B3A7F66
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:48:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715695; cv=none; b=JRVt110oJ/t/FcPj1TONP2ewgxOahixJNjP3grtnLgQXzRc3IIw6xct4eC9CfDzxCxjWTpyrKGaTqqaz6j2OlLMClTTnT804jspkZ/dLv/ONsJcxmisAjqsQEpYvjw/F+hgq+HN1jyYCuCq8s8/3s4VwL1Q/UVuwyJmRQy9dxXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715695; c=relaxed/simple;
	bh=yKAoT+km8Ld0aGDl7IvJTU1MS3bYbIRRbUIueCAinu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jEQm495JFqe7uVGRyLDhYlcVLp9L0Ifp4v3eK+pGP4Y2bUnmh1CEV4u87ae1Pjq+Zs/7MdVNC/4gmp/Sf4J6tW3AinUWH/KbKZbQ6qeREg9XU1DdwwL+JHGYRFOtXxYPN5tBqIi725TOi9SKZS510UJL62e8o5i2elMq8CjMUo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NnPKRdmC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iR79gP9q; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NO6J1744979
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ElqLYWeKhZzjaYdaSuKi9s
	AgcTer/f8b5SbaLucRmaQ=; b=NnPKRdmCht5kyd9rEBh6zRpgbh9H0v+a3ZA8g3
	OqH+kDx2nj12tlRDiHyaFJj/2n999At+ZkZKdLjGEholoTeOeZNGSHAoIi0YCMV7
	YgYeotGqC5SZsWInKjiwZrIhtznJPt7WUnRlrSad/AIUi/EhciDkcft0mdRJ89zk
	Y/u/tT0YSYwCJNezckqtnQewxgqmtqQnvr9FZzHfrGGuXmEik39ekOdjjZVMqIX7
	LcDrjY8zXDN00iK+JKjm0T2HKogBBXfFQjuHQxP/qU1CNSHbWCSs2qxcHo87i+9+
	sOWKsxoYfilH2rBic43AqM5HCjXLlsE80s2FCLO2FCDbklSw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734d5aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:48:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c95b0e22aso11165598eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 23:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715692; x=1783320492; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ElqLYWeKhZzjaYdaSuKi9sAgcTer/f8b5SbaLucRmaQ=;
        b=iR79gP9qjyaq3FmUwQdqgqJ1L2WCC6Ilb20GX7OM18foe2n6c136L6ZA3NR3OXBxOh
         b0wRDFSrKxfrKmR++cj2SyOmySLffs07Gy/hivkwtWTS7Z08Kf8K0iADEbSfGoJ/oTE3
         P1QPJsJDDfv9Hr9JL7C9tjaI/CwWUtfgFFC1DH1RzZ8PJntJTV4YrKAjhoF0h24k63oV
         KHnbKBhYlxTAfhhaCVJYjeHsDMbfCn5hxz7OqPbVx0fHgJEddiZ5YvyKMRiy6El66Le6
         AGB+jz3aKiC3IjHOlPOPU1P/4w/2IHDTsNMN9huYlRG64b/p4DHOWB4jjaQ0whm/Zu04
         EXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715692; x=1783320492;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElqLYWeKhZzjaYdaSuKi9sAgcTer/f8b5SbaLucRmaQ=;
        b=q6Ui6+3rE9lH2khTq59AXOBtqiIWkGEWS2YGl6F5qZ48HX/F8M3CO4RpbXXEBYdLYk
         +zVCWYI+3u9tSReIWtCNfyyLPkRxFwn89JK5bVIidZPNAjrGPYnF6G22I+MAErFj+RIp
         OqakSnt6pBF0lHv6Vi06H8cTBwbcRt9UhkXL12894RF++dLxYVzSF8w6cOMlPEUU33jU
         iLYLtA9QVTvUTA5tOKmqoxyyTmD+TJ64uUnVuHj+YQRlq4zHoc3RJATNzU9VuUryG5XF
         K8FIzoWxkXY0ttDphY1uFx8HH9+YFoYkFdezouee9zgHDSgBrhvU3z63sAa+UMKoauKW
         W2tg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3zNSaKLo1Kdy+EQ9+0cj/JL5qCXpAMKNrsy3LDvdoq1EKl8wxhgjLZ+QnPPrC82vLhtsIYmrz+Asp19Qb@vger.kernel.org
X-Gm-Message-State: AOJu0YytaOs5x0mFrBIECWmf0b6RxLlcu2/FgnXSpE2UhD5rC44ECJ/N
	2hwaAtTXoE/QOpYanh8iRnBppyIjPAb0toeXtBk2UAGTQrZ61Sjwgsqs63DkqRYgVvyGfGyTQJc
	70Avx1AvE3pVEtyKKzydnm44YhhNKRv7dIowERXOL5SJ5NRDO3/IKGoTGqUHHS4uHP/Pzht9Pd6
	chddfj6A==
X-Gm-Gg: AfdE7cl7zyAfTEloySuVrAdy3yDeCIK2voha6hGSKDHx5hv5vlYMaFCPBYHc6SZluUj
	sOLpo/eB8muH85BVpubIGX7Ypx5CdiG9onFob5Fvqr6oPa7uQJto/YyTB5uq9pt6Bx+9d3lXm1U
	m2F5mucVxCAD5JTtlmwx49qKKMtS3fKB6K0coYcRILuPwRXg4k6yAlEwCGN/ZPfx2kRaNDpTrOK
	60Go2VwIQa84Cdebt6zMwbockb1q8uAhPom3ivxglVKKWQHjB4MUlkifKM0cmoeyjFDHDLqPgXt
	1oreAXVGAI8Cx3j6L1Q2vnL8hRBkAeG2pmmwd4PTytduNaGEJVxI0/GGqyP1IwtAYfi+Z3lrmJm
	GCQ0hLkz9N3j4bzM2BsihdtOfOy0FB4Hq9PZ5kY8+wfYkIe0zFz2xjux8/456UQ==
X-Received: by 2002:a05:7300:2156:b0:30e:cef2:c3c9 with SMTP id 5a478bee46e88-30ecef2c4dfmr1551008eec.8.1782715692496;
        Sun, 28 Jun 2026 23:48:12 -0700 (PDT)
X-Received: by 2002:a05:7300:2156:b0:30e:cef2:c3c9 with SMTP id 5a478bee46e88-30ecef2c4dfmr1550992eec.8.1782715691981;
        Sun, 28 Jun 2026 23:48:11 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm56154774eec.7.2026.06.28.23.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:48:11 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:48:09 -0700
Subject: [PATCH] dt-bindings: nvmem: qfprom: Add compatible for Qualcomm
 Maili
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-maili-qfprom-v1-1-9c097e2edfcd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACkVQmoC/x3MQQqDQAxA0atI1g2MI6j0KqWLjCY1oKNmoBTEu
 xu7fIv/DyhsygWe1QHGXy26Zkf9qGCYKH8YdXRDDLENbWhwIZ0Vd9lsXTClTqQZSXrqwJPNWPT
 3373e7kSFMRnlYbonPohwnhfBqBP2dQAAAA==
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715691; l=978;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=yKAoT+km8Ld0aGDl7IvJTU1MS3bYbIRRbUIueCAinu4=;
 b=3wDMyPHXQOS6VG4ee5e5bj1JSmQYIvIKnJN2Y4wrozOA8u5QKntW+ern+whd5ZuZQ/A4VqGVx
 ZJBqKi62By0Be5vENmoIWHpAKv/uESZKfjS0jZupr80k3x/huHg/Ced
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: QfRvP_qCPzxr3fxtrbsLOm36hpjmk7aH
X-Proofpoint-ORIG-GUID: QfRvP_qCPzxr3fxtrbsLOm36hpjmk7aH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX5ActGNoQsHB6
 zYjNyYzX/P5Pv0fZbQwTDp+O75mACZZZth4MffeK7gJ1qqW+cICC4AsNqTly19Eh0t5kTYj1a3U
 esMIO4qGmsHIN6hw1i+paLSvfxQUTOI=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a42152d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dsQ55Ntb7nCCdps8rRoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX5HXdSwxbtQ1x
 lA2oxGZgdRRjU+acYRKFCZqdAMWIU2YEa9RFt/oIuTrtoWEcNYcEmD6UpZ5iSOm6tvhJFchxRnR
 B9Ry1jp/hcOdP83y+pslGrrA6OWWwGE5UF1/tOxde9dNTLT3I4tUYVcS1d+yuhi+bKRPbFBSsfj
 whxAkkd1Zbw7JRxIGbBrQKpieKAQUPMs5336kJSBQWgEOEwBNs66EVglcbxTxIi0qt2qccl2Wgj
 mL+idL/95n4X5r+ap9j9kpz4ODHqecPiFu6fzdltgjRilDRZltAlcj5NE8YQTZIMzGoFElJ7Il/
 hVaTm3ofIinDidsJpDlzY/bxYXIkjM345SVeF458Pr0+dmp+nLZbglFJ0R0Nwm0uvq/p/mI3Z4z
 Hye8zxzs3Pifu2ObsgFeBo4ZsFnv02+tOc7ZjMG39xpzsiDLhWNa8O71uFNhAC0kjxyVtg5Et68
 E7P86j+R1Rftd8QBzbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114856-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE7BC6D696A

Document compatible string for the QFPROM on Qualcomm Maili platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 8134ddb54e13..72206c44feee 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,ipq8074-qfprom
           - qcom,ipq9574-qfprom
           - qcom,kaanapali-qfprom
+          - qcom,maili-qfprom
           - qcom,milos-qfprom
           - qcom,msm8226-qfprom
           - qcom,msm8916-qfprom

---
base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
change-id: 20260603-maili-qfprom-bb7ff3daf8a7

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


