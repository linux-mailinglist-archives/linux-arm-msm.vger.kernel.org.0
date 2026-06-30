Return-Path: <linux-arm-msm+bounces-115379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +lH9MrirQ2rPegoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:42:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 240066E3BEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:42:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="PgMoQ/+p";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SWyMIZ2p;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115379-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115379-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08D3C327F90F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561BA40B6FA;
	Tue, 30 Jun 2026 11:04:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE12440BCB5
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:04:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817463; cv=none; b=JFkflwTKaEAjqe1So5d3cTIlzFkLvYEZS8IxqPfpj0el+Ztgfk1klgR8B+aXpGGB+9qevf8OuvTnmyPOFw/Nlfu2CnJnsQp1rb4AqiBjJEoyBk3GRcew/jCG9wmKe3D4UDUPUHlpnAljU4IO6SfbkTZMYgh35/Nab9TiytDxogI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817463; c=relaxed/simple;
	bh=fQUPmhPxNjKZEYwfuVKBirrd16g/+0UoJsbRG4kPGas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O3imYj5lYWWZTggs6moEQI7ZRjReeDdhDk9UMgYh6V6PNhFEunaFl+NqF3rXvPwY6eQVNDSUgftX2OLSR+LG00/yXGBbY3dxqXZx5R+vaTbUKE4tQ8eqZ4+AQSBgX5Vo2AlpHn9QJIsF+un8OEyStxFF3ZUz+XC6oSBfzGys2tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgMoQ/+p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWyMIZ2p; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nCid1606367
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tnwQYIB2oMxdOusb1j01rB
	DKSnAHELsMv3JRvufhtNM=; b=PgMoQ/+pt8ADDDPWEl9/YisqHsHHMkvC/evk0h
	Npiakhp1bfUfC9cO/hbnoWPJitmBcU1vzVxMpqbhlnjBSxGB2K7AxPaBLLjgV4bd
	byfmx7G6sYjqazDwlLtLFK5TpeTShr8GGSoRnprsKFjqcAiCfvdcnFbYU6Qu1eHb
	rXln4YIi/SLSb9yx+AwUpBt82pePF5wyOpxd/quLLXbUnIVGA6BEaPmH7Elf1idG
	FEnOKgZTCvAcVn1goHTAPFHxUF1+J439Mn1ieEDYUAU+J6YZ4qE8+0tHd39QEedi
	lqqEds67uuvn8iQQ16iTWJT0wGMtbk9zDuMgrBhnUbRaevDg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5syks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:04:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso199920485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782817460; x=1783422260; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tnwQYIB2oMxdOusb1j01rBDKSnAHELsMv3JRvufhtNM=;
        b=SWyMIZ2pn7gmFB+GBW+ABsQPWN43Dk1+2vF5VUzhqFYdclJdDK4XEx52MN18rTAk+K
         luBmnL+06q37GqLSW87Gpa/Bluc0gDPSpisbTWS5GJSlNQnIArYiP0zTRzdLTo0a6L4Z
         sUapLHJ7QBsGN6DOLZqTJ8xIDs36RQzs30e1d97Z69Z3u5StykcPrsHZlgMqORaMKmxb
         YodZ2HELtavIUYn8saeuZuP6pa6wEcxtEj1QXkDEebQzodUkR6Gr1gBxWOog8qkV1Am+
         Nq84Q0QjKHC05LD1t6wXscJXJrTtGYCkNLLFmDtqYFjXHCg4ANEDCcJJwCtU38ydZwy5
         fZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817460; x=1783422260;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnwQYIB2oMxdOusb1j01rBDKSnAHELsMv3JRvufhtNM=;
        b=C3VSaXUouoqdMBndV+4kyd04nygmGZFiPTtosXSDZzUz7zwH7PsaFOlp5oz+bf4zFm
         8/cwsAmLNlTFayizI+los8B9/DnD/xQRNIMx7LNGvsQB6wb6c1PDbxFXPtpNwfB0pmVk
         SgPCxI0jClNh/jjosjzkZ7VZG3a0/TXE+D5It8+ttWSYozymWLLtisYDvI9jLaIa4uCh
         e8lOQknVKtfVcNB7YtxTplOcwgLrMBsMuV686RA5cd0+Egh07ku+ZkX0GFZdtacSXjqQ
         e2F9v6eAnLbWmDteIoh2Nwp9fa/tB40+IFDSD628TPYuzdoc35SBJxFR/BGErfgjqRid
         LwJw==
X-Gm-Message-State: AOJu0YyJ5YUAuoZxtTUmutbYpHLLb/5BRhNVAe9pnUPxvmGbqsG96DoQ
	upuxzv8Q+0PpypHOyNWUq0ozqyg8ZvgxsNGHbJCSkEDRNCd+EQZhHeXRO8TkfYV+wNrj4Ehg4bA
	FKhfS6h+BKQIRqNIUnQp5i4rKXF0yKqcEgvgNtameBNW59WhnKVO7giHnXHH4sjYG8ppt
X-Gm-Gg: AfdE7ckO6SXtNS46nNeNhEwAFTGFQRMUDBGo8W3f8eOmN3vXEFoILlMUkczQnIjCYtP
	TJuMMMm1jsKwTPPrFKc/uOPRkp/8NhlekCUv1Pm98F7sbJOxY2Bv8n3RR87/X0NKlBhMsvONM+e
	XG3Szj3DCE7GKS4thBia2nimZ1sACTbTJWeb3+0jfKROKbKF9RVBVbOGp0TRtjwKsIStjVGoi1e
	S6r0OnoqXhMBPQ2fqq0wa74l3/yjVbsBQIX5Ibr42tRDE8qwPDIZGAAqw3ip/WSbC57p1laNse0
	letkYVQNrzqIx/Nbc0AAkkRpVoW+ITrdSS/vDww35spoF/uv+B3zMwAbW8Zu1gyA+44hC4Aw/jl
	3W8qPWplrqZpbGQg=
X-Received: by 2002:a05:620a:601a:b0:92e:6430:3c68 with SMTP id af79cd13be357-92e6d80809bmr31277385a.18.1782817460036;
        Tue, 30 Jun 2026 04:04:20 -0700 (PDT)
X-Received: by 2002:a05:620a:601a:b0:92e:6430:3c68 with SMTP id af79cd13be357-92e6d80809bmr31266785a.18.1782817459304;
        Tue, 30 Jun 2026 04:04:19 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636ce7esm7137226f8f.23.2026.06.30.04.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:04:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:04:12 +0300
Subject: [PATCH] arm64: dts: qcom: eliza-evk: Add support for USB and SD
 card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-v1-1-146264625095@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKuiQ2oC/02Oyw6CMBBFf4XM2klo5SH8imHRx6D1AdIphGj8d
 yt14fLc3Nx7XsDkHTG02Qs8LY7dOEQQuwzMWQ0nQmcjg8xllVf7HG1gnMx4R7q5p0IzMdJyRRq
 UvhHOrJGtUd4i1XVhhSRdigri3MNT79bt6tgl5llfyITv/q/haZqjQ0g10IoJ49ndhTYbaA2YP
 GQD/4JttsWlKH5WSTKZ1b0oRHMQsiqbdimge78/HS6WMfYAAAA=
X-Change-ID: 20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-e774d12eb516
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3131;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fQUPmhPxNjKZEYwfuVKBirrd16g/+0UoJsbRG4kPGas=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqQ6KtffGqJVAEiaWmdcDS0eIO1bvNo+PdT3Z/c
 9tdbpSnQsuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCakOirQAKCRAbX0TJAJUV
 VgZpD/9iXJ/7vN1RgM5AB3zqPaNIjfJt6ikcBa6ioUzd/k+RWbX3HYRG3Xv5nnml2h8Ytm3KtWC
 GLB25SKDt9IINMzS1J0BLRKMTUCwZ9M0Cj0RxDPWLFIigaFGc7KQn8q8qJwLQLLA+1z1ADcyAV0
 3/IsqyraWCbHnub7JtyS2Efub+wm6TiXnzg/KqKsKMKeMFnDwCJCeuorGQ3KiqSA4o95Rku5ezr
 bUIwqut9eJilPDWRHuJ7NF/DZzY++bSUVtq6EsB3TOS6neKTutdZAaZbigiRDneKzp9Lzz37tqR
 lJfwBvrnZSM7bqGgP7K3wfxLOUWSMP0BKfhVo6sL4c5T0GB+c9BlvdxfDDqxtwOtD2ay1XpgPjh
 xvBnC41O/MNuHAFcFYbiUZzacKkGpJK8Lm9vT0TG6Iw/cWoXWaD/RLbgl0YWbWKydDL0oGqmA87
 vX23GJonS6QRK82sYEXcpVIAuduXYVauqhegFNOLdyCA3hHoXiuUPRGKqlmk9gzKcf9ddKllkT9
 kakumhVJK15eYe9mkqPXwiKJ8YAkVQQN17eoyVaMxmSXpjYsSAGnzuQEUKHhjCLf2Z0BceHCRu3
 DL/uaEY/nZZhgq5+crIJ0tP7PdwILnNil44xWgELXfV1BeLiCGkQLrEZ4D3kI5v8I/b2b1Uz5fW
 jGs6WNqKeYLqHSQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a43a2b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ly97nd3JUEkQhviyxlMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 1ujaWksWxnVOXf45RERUZswZ-64GEkuy
X-Proofpoint-ORIG-GUID: 1ujaWksWxnVOXf45RERUZswZ-64GEkuy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMSBTYWx0ZWRfXxCClJxia/9hE
 3k+DiuC0miy2xfK3+aF6ze1/ZSolJvLUWnQyu3Hkt3EvphS/3H6w8N9TrgHDz5A5RLOQnldSgf2
 VL4z6YPxVC/WhDSPXn5onnTTd6dbNsGiYRBehN5TEcVfYJJcs3hych4wEHvMaO468FlMpu+spm2
 uoPJ/EG1j0wGTb5yo1y2+R0MATEIeSE7JQ66lASLB38btJz1r8/qxLGudh0xYAJ/NPC4KHqrGva
 /jXXadQ3RVkg7NkP0NgEwt1E8Knj/c6Qkc4yL6xLa5DuWbvKz+P2bunNIl/2Q/9tc65JlVO1CVq
 WEFJxlOlJe7CN6bJUJomwiV3E5Ijbw+TdirXhWWk9x0ALpd3YhPzPQ4oIV/xeye3k9mhFKRjOnd
 nrwmDOYpgJiD7TP3jD3331QR9xSXxVLMEoADL1y0FLwmA3WSa+6cdgOkak6LGYRYDiIvFxq//8c
 mR+O4jEsQdHITKCpZag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMSBTYWx0ZWRfX5q7t6U3SiQm1
 RMU8OhGzHa4w21pbkUI/0sbtallODVJqFRMFQ62wJNDyTzicHyAW0rGuU0kiFGf2xuCG/yywsZG
 wxg8Ta2otLG0VTJ3dSEegutsvYfwAwc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115379-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 240066E3BEF

Even though the EVK comes with 3 Type-C ports, the Eliza EVK only has
one USB controller and a single set of PHYs, which are connected to
the port marked as JUSB.

Also, the EVK comes with an SD card slot.

So describe the PMIC GLINK node, the connector graph, the PHYs and repeater
supplies and enable the USB controller.

Also enable the second SD host controller, describe the card detect GPIO
and the board specific supplies.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 92 +++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index e47b24f8b827..2fc945658300 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -11,6 +11,70 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	pmic-glink {
+		compatible = "qcom,eliza-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 122 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm7550ba_eusb2_repeater {
+	vdd18-supply = <&vreg_l7b>;
+	vdd3-supply = <&vreg_l17b>;
+};
+
+&sdhc_2 {
+	vmmc-supply = <&vreg_l13b>;
+	vqmmc-supply = <&vreg_l23b>;
+
+	cd-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&sdc2_default>, <&sd_cd>;
+	pinctrl-1 = <&sdc2_sleep>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&tlmm {
+	sd_cd: sd-cd-state {
+		pins = "gpio58";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart13 {
@@ -18,3 +82,31 @@ &uart13 {
 
 	status = "okay";
 };
+
+&usb {
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g>;
+	vdda-pll-supply = <&vreg_l7k>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l7k>;
+	vdda12-supply = <&vreg_l4b>;
+
+	phys = <&pm7550ba_eusb2_repeater>;
+
+	status = "okay";
+};

---
base-commit: 758ee0279ff3463f564cbb36687f4faa035b7878
change-id: 20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-e774d12eb516
prerequisite-change-id: 20260514-eliza-dts-qcs-evk-7f1419812659:v4
prerequisite-patch-id: 9e10dfbe360941cdac0300aaf163149755952f9f
prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


