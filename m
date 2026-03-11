Return-Path: <linux-arm-msm+bounces-96931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIRLAN9CsWlCtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:24:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BD226211E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9BE03719865
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E940D3C6A5A;
	Wed, 11 Mar 2026 09:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LE0H3ja4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFcskoXQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B5E3C65F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222399; cv=none; b=UcOPK7rvu457zvy+ZRKb/KDGqotO+e8RhNq669zLuj5vWC9TTfa1beoNzMeiJVUmx/Qgivk74m8XqtgFjRySNM7R7YuZeRbA6lnCXkm45THINK8trwNy2SmUIKDIyIkGzwTaHRh+658PiylhvlqRgIZ/FzRzZzcw4lqb0tpYxXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222399; c=relaxed/simple;
	bh=D4FTk1Dc6ZZyZyyYwyYFZQ/PqkaMYdH1kar/R97d2u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hsctv7n9xOXxSQ+qaMBuvm5fMcm6Wg263QTeMYzGrVcjx2jvxrsG/3HqmXbaoq6Z3eVgvkmHB9MZ9OFtnR6+bu4rMYgDw+gOx5+lNLyE1SjvHA9CzR1Cad7/P4yUv81c9fAu1EcVQuSZe0x4wjwLGxw7DcvHznAjekrcFvI8EC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LE0H3ja4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFcskoXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B91n091573310
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n9S9Oesm5sQiwmkIMcRlV+iU3KxqxzSjhKdwL2L+zBI=; b=LE0H3ja4bH0H7vP0
	r4EAfLW0IdOHoNjJ1P7XcijpEqt9reMhI+unoAXLpZ6rIvWAlDlSRBjBwBKcgKaP
	MPiJGzbXdiU6Xw8akUzRAtkMNAu6orcCop9zEp937juBCN2ziFbiEKWZDjmxe9vv
	KtnMu3T5xXbxmodeRMfZ3iajiK6lLEhqY0V6VOUweaD546MLjzWDZepcQ3wKHrRD
	BYKopEBYyxv6DrupXAwqSOZzVAS2TUXlL6KmXlyFDqLNmdGO8JCR8UQ37zA9HnX3
	Oq2LvTStn7NSC6/udCYRsZEEBF4230pPVj0LsMX9HEIOjDISFLhEmb1L35u84UF4
	O8Mvnw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkay5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:46:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829b20cc6faso736003b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222394; x=1773827194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9S9Oesm5sQiwmkIMcRlV+iU3KxqxzSjhKdwL2L+zBI=;
        b=SFcskoXQ5gQhG1wCAWLkQD5t7VDk1Nl2x73HpJwrFAl+aM4XfBTWDkIMTMh/cReyuY
         yGCNLFBT1CcrXuVthyxPsgS5AQGAVVX/+Wc0SUEMWauBWCsfb+wS79GEn4zjsF57TagU
         QEjFfyrgddC1ZyTG0ctQYRWesTVTiKKupv92BXpP0M6Gip+zBa8XVjgwX7zp4+hc8riG
         2Ahk3a7e5k2r3mdqGPU7t6sfQx3XqSuz61rykLbibVjfQmldxxT+zL8/Do8mnvjjdGIv
         c25+PO+AM8JdSZ0eD/hsCgvKXq+Rmlpbpbu4kVHsaboU7GSc4F5ss2PpSrb0Hjy3keDM
         DD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222394; x=1773827194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9S9Oesm5sQiwmkIMcRlV+iU3KxqxzSjhKdwL2L+zBI=;
        b=HlT1ex1ai7JytrOqmFjcBPqBt5tqS2netdMshdm42J3EHD+CsFJi+FV5FzwaHXfTc2
         rwZzLR32FTrdaHyEmmI1kzdwp3R6pcPv593LNzdqZ+dr+K6dfFVAH8ZgJCGBfQxKOsIH
         aVSxprkEGxmI51aYB9u+myw35I7vRn9OCGEpn+jy8GXoGY7EAfHjvyhhWRjQV7WFhhHv
         wQf60U88RyYlVCHzsHzCoXKrLelCXlcYSuwelFmgO886nIsRNEOtQHgzzEcaiVaPM47R
         0jQpOdGZ0NNha2TQz0W0ME2TaThy2etXojDeaTFREClffLFa97qN7C0eWYzb0W+/bBxz
         F08A==
X-Gm-Message-State: AOJu0Yzhm1/YVVtkI6m0JOso7QiqPakUg+hBxzNTDspVr8kMK47k423p
	3ua64xZeI383SLoUTaCcPFY0rl7PlUXrA471WarA1xjPJUgiikj7OIx3U5IblMoX1jKXIVlUbZK
	IVaO5XVFa+WrILlC1BvXE3QcM0PjGU0624RqgQLXXgYiUgZn2lDWRWEz8xlwnDH/WCV7P
X-Gm-Gg: ATEYQzzGvX4s9tkuVEfqghzGJKtUtyVaIobT15g1GQdXNPrE0v3Ycm3La9RV8lbSGR0
	KxfAgEGEQPT82pQ5zIA7DbZYDVN+whnovFdf3IRAU9VqwlxcdqEeEim5iFwICS/IMG9dGW8gXGs
	+RW33DtNauD5ucuiau1VixCaqyEZ1zPJIqJAObhOagRob1be8cqgzAESdGJslzYOT1QmN1BJyiU
	R7tpr9+ISRbuV0my+Mat0HMR5KYjqzmQARCN1fSwtKqTkLJ9h4DUltP+ZXww1cbRjHgcTatzAb8
	ETe5XdfPGAr2xTTMyBicjUSLAZ/9KmopnrFB0KVwD0JuzoSPr/CD8Fq1t4tzjFNKQjSJ3xZMIr4
	GP+b7iG5fgLC5BKnBaFR0CXyXg0Ku0nZWRYE9vddSjBTy9KnRLtj0FcSyJNuixBncdsti6fnceL
	Xsbn10m5z2HWDPTlupdT1v4ryMSBwUE8qXisvFSm5pTKnqWArL7I88oSaT
X-Received: by 2002:a05:6a00:1a90:b0:823:1bc7:ffd8 with SMTP id d2e1a72fcca58-829f79ae018mr1595225b3a.9.1773222394443;
        Wed, 11 Mar 2026 02:46:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a90:b0:823:1bc7:ffd8 with SMTP id d2e1a72fcca58-829f79ae018mr1595212b3a.9.1773222393938;
        Wed, 11 Mar 2026 02:46:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:46:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:15:49 +0530
Subject: [PATCH 7/9] dt-bindings: firmware: qcom,scm: Document ipq5210 SCM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ipq5210_boot_to_shell-v1-7-fe857d68d698@oss.qualcomm.com>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=853;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=D4FTk1Dc6ZZyZyyYwyYFZQ/PqkaMYdH1kar/R97d2u4=;
 b=QebNZs3WsL0Br+pxni1jb4Njj6XELEcpcYhGX9Et/T0vK8D0o74pZoru2uSLhEMn4P/UNRjyH
 Tl5Cm9eQ2N6BlxfEbn/07H5Pgwe4vWrVxtfvJdL7WsgBmazFGCDi55Q
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: E4qnXh7_DZI6sKkH0DG6MgrDZ-ciMHmr
X-Proofpoint-ORIG-GUID: E4qnXh7_DZI6sKkH0DG6MgrDZ-ciMHmr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfX73+w+AgTBiM4
 PqBBgw2euFBy6Wpc9eKsE6xHyRaRe152hxd80abretnB4AnwOViYSjCdxWI/xW8L59noFfz7elV
 fbI/tBjJGBTDxtPKCT4rWqHi9b6DH1fGG7In4PfqE/TAX8C6YrUyGVOg4dvggNwBgZfX5oNzL7I
 4F/JOrFXHXVITyDVnxOrWBAiTYb1VlH4Wkwq04udZ6X1H8uINJexv53hMMbRpCk4q/hKdmQCUwP
 wEP+dJNbMVdPji/thq+tIS8WhFRyXPxUrq+Z9hyetPBPT1craRmNFrZHzLDarRSWQUvSYriGxff
 1kWY3sjFaH8OeDIWVpghEclGlhQEuKEVxzEP4w29dD9+1Io3tjVELGtIA7yX4HTqeI9Unp2nt5Q
 0zEE4M6CMdt8WXMRGPYfI81M/iV3h3H5soBC8qwa1uMzQeO+au5whhQc+ZflF4PShqKZbxTqko8
 hNXnPYdGDulGD32ij8g==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b139fb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ND75c01xaBhBG1K22twA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110081
X-Rspamd-Queue-Id: 50BD226211E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96931-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the scm compatible for ipq5210 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index d66459f1d84e4d99c7f72415d08bfdaf1d701948..6d9b71a9b9b3fefd1951b963f34942243aa48ccb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,scm-glymur
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
+          - qcom,scm-ipq5210
           - qcom,scm-ipq5332
           - qcom,scm-ipq5424
           - qcom,scm-ipq6018

-- 
2.34.1


