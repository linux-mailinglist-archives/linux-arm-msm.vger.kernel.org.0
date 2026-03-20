Return-Path: <linux-arm-msm+bounces-98914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LG2EgMuvWmI7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:22:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBEB2D976C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87E11313A7A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15813A5435;
	Fri, 20 Mar 2026 11:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iRj6f0/0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJmHzlYv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810D1375AC3
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005416; cv=none; b=opOOvJQX4oA3zpmraGjHCwRzSOb+awqT8N4L08hqyRe0zvcrXaz1SxmxtYhIyXnIXXvt6nE4nBinqquOa5W7nE6pZtxXmi+VHL8a6W07AI3a2G0aVrO8AfkjLXdW1M3ZSCAU+Nf1MlM8u76eu+wahHBfhbnyWzdgogxWVxzMF0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005416; c=relaxed/simple;
	bh=fdoBdmjrT6gLlSiZyKLPg9xz3bHeUwzTR7yIe+c5d2o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WpLdO4liumNE+ge+DsovGRlvbaKaJobQjh1sz0tHekc/fp1BgqXt5NVMtzpudBXGRx9Wwoz5Qj9cXXFGlzbviP77gbgKY7iPdshPAJ43/YOlU3aHsd/1iY4WtSW4jipUrIWfsG9Nnaj0Tr0DQBaM+VE2/X78v4AAKSMSkqPOOms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iRj6f0/0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJmHzlYv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XihZ1525562
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0bNp+F2J1VwoWrAEd3Vl0O
	Z750UwjjuVfT4YYccY/AA=; b=iRj6f0/0phVcCEmTcZ9e8yFAb8adxPCbNxfODi
	upzw1sF0/GVH2IAt5ax9ULwrlPWF5GQfrPSZCKIG220bHJ5OjOJXkYNl0+CP4KJ8
	XvWTyU213h55St4vQ4Qw7biyj+NSnPaJD16hXKpgfEi2rxAslOB85X2H2eURhmOp
	zca0ELJuMrvnlua1UBuqB+vrXcY5BCPzhQfukXTjM8+sOt8C9DJ0Bx5WUmXeIPqf
	SN3YOu85M+ZSWI5u2AjdaG6gucalIRw+ciXWr/GDNPh+JcYuWZUegad0qQg/ZjtD
	g18wsISXJnu4+xH1xUE+D9fCHyauOjLXzHRcCfHwBPhAF/fA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0jt9374u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:16:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4076dc16so27055271cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 04:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774005414; x=1774610214; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bNp+F2J1VwoWrAEd3Vl0OZ750UwjjuVfT4YYccY/AA=;
        b=BJmHzlYvM8sXwuIHKSK2FOClq8v1mkvjnPBlF8uk/f/D/o3i0mvCUCyCz1x9fX/unt
         OZWogKo6WD6F5gYR1iCRnNgl3mjECged4GnxHgVq3fmar9W9O7AXJakQfb5gSPDhNAkF
         UlBmZ7m64viO8Ay13OgpQdJ3ad1FqrLbQimcinuQCEDAefpckcBSg0NO6w4t8xlWVFLd
         D9hWnH9bdoZw50NWgyxjCH9t3dU/HRlNg0WNyXomwhOfiuRrbbFd76UYBwlgyiAlkzkM
         G1iw53T6pb0p7mYhwrkp/PTJzrX6Cbl2pygboadCAXgwLx7Rw+yyoSRMC5heBXbIFe1g
         /RWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774005414; x=1774610214;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bNp+F2J1VwoWrAEd3Vl0OZ750UwjjuVfT4YYccY/AA=;
        b=gtBX8NK8iw3U44wNa8ZdiV4vrcoEAKZFXg8tHjog0xGLiYT4EQ1FTa1r29K6hE0bRN
         NT9/m45L6HBiNKbn2XgBLV1/qrp0L7t5XDP462Pa0bCfokulLonyuk1zAc5vLBQj8jgw
         jAF95oqLTC6hBkaUkhsIpv/1qNI1y+cGaCjXsSA7Yr3yJRbG0t+JvstCyMAqKhQ+FeyL
         pAO2d5ECGvjfbsrlczsPuhkfgYMK+uWySzooIVXiGybuWw0s2qxHUWfgka+zpJZx1zs2
         ujs+I7X38iSrNSXXGTf/LE+ZgiIVpkzldYeJzyIRUJssm2HmZOjbNqvRdvO+ySOLmrxz
         CYSw==
X-Forwarded-Encrypted: i=1; AJvYcCU7tR/Bddx/XRL41Sn78sbXLKITv3SWlBLt1NhbfO/gO2o1SBLm4DNzkuGd8Ie/05808VlBEfuXN+F3eyNd@vger.kernel.org
X-Gm-Message-State: AOJu0YyzH9HDZ9ew3KTkvcuo6IwYC9RhLNosSeIK574uqwu8wosZsQu0
	hSk1BgBeK+C7u0ikBceb9eupNjl/KJ8Fdbcn+70lRgpOUvPHdbe/8IQasvp9jfXZT4I7EtbdaOw
	WcMXLADC2gifWif6vBsrEVK9MwTRNcRmc18i5LyLwVPCDQG2xzL+P1om+86Gk8Bqbs1bF
X-Gm-Gg: ATEYQzxqUAQLTewMjmhIehopEhEcf7RGljC8su6plhjD2XQqqE4tvqCQoJkJNRwahyc
	0XpXrZ8+dOiFK49SCedUKg/v5JugFR7QsJH/L1PTt1W6Fp8XDgWQTedubHbvZGvdo95qSYbUQRs
	abGdRESRpEE+ZvVPfrqwkLYFC5Ry+4BIZP5CXTcY+RrOlXCoocHseDrqYcJppQx36AQQbtNjSYx
	x+qonLJcYoFG6ufVox8aMvfMM28zAL3V9O+SQUwr706bmqbjfgwYLhAhr6MZxeWXfGNEOfENwB0
	UxJdhwelxiiYAVAUqMqaDYctvKJCnqY2oWRdcGFxiMWWSlDtMZYRgVu7LTBHqS8uX3i40ARnJNZ
	9qVW2zTHR93ACIzGGNHFyj0jp2X0=
X-Received: by 2002:a05:622a:7106:b0:509:44c3:5fe7 with SMTP id d75a77b69052e-50b37525590mr24960831cf.46.1774005413293;
        Fri, 20 Mar 2026 04:16:53 -0700 (PDT)
X-Received: by 2002:a05:622a:7106:b0:509:44c3:5fe7 with SMTP id d75a77b69052e-50b37525590mr24960331cf.46.1774005412427;
        Fri, 20 Mar 2026 04:16:52 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470b1f7sm5905898f8f.25.2026.03.20.04.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:16:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v7 0/2] arm64: dts: qcom: glymur: Enable SoC-wise display
 and eDP panel on CRD
Date: Fri, 20 Mar 2026 13:16:42 +0200
Message-Id: <20260320-dts-qcom-glymur-crd-add-edp-v7-0-ca415560447e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJosvWkC/5XSy26DMBAF0F9BrOvID2weq/xH1QW2x4mrBIgNK
 FGUf+84KEoWJVU3iJGGc0foXvMIwUPMm+yaB5h99H2HQ/mR5Wbfdjsg3uKcc8oVZbQmdozkZPo
 j2R0uxykQEyxprSVgB0KFo/gOdSlpjsIQwPnzXf/8WuY46W8wYyLTxt7HsQ+Xe/zM0l5KkrTm8
 m3SzAgluCmEBWEY8O3Bd23oN33Y5Slq5g8Mz2biPcYRq3CzdUqC0Xrbx7g5Te0BPzhu8LGQ4kk
 K+gcpkCwsc85oZmunVsjilXz/c+cCSQcFCNEa6/QaKV9I9gcpkZTOFCVVTClqVkj1D1KlK2XFo
 SrBVGXxC3lbqhDgNGHfxqUfz7o12WrZUsoUNYnTMPRhJIqVWtnaUsFNM5epUbqNQFKWH5usg/N
 IHndj8O0HXOsXl/ACAAA=
X-Change-ID: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=3122;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fdoBdmjrT6gLlSiZyKLPg9xz3bHeUwzTR7yIe+c5d2o=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpvSyeZKBox3ekVn7SGRPRGpIG2kKSmAmbZX6SP
 F4ps9LDSMKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCab0sngAKCRAbX0TJAJUV
 VpVAD/9kjPFu8NCLZr1NSq7A05qqx+iQWrDdCsQpoq681hstfYYTGisHbND94+ynrkBCpo6IOh7
 D3NHOZHelOH6cqgqLKtTZ55beLgbLEuqb7nljkdoo9uXLRMI/T1Ek0kbGpWr8ascmJnVf1/oLY3
 7UNT47G7JXOPjQ2qDoxmN05g6OTN7zDr90Cz/TY468/vY9WzAqJJZadZOCwoPY4OoTn9t0WFtCw
 F/gTw2nl52AD5zl7LZ8y5KWoxxRNT9CdHcsyphXqlJjh+6Xu/zdiBJRzmaEDWxIayjR552ifJQz
 aBkuaFPvFnkZBwK9hpVg2WVk9uI3c+bHDa8q+rWH2gjtRV1T4cfOrLc/zW9V7O4m6IA8l7vrHi/
 hxHj8s7hx2/67YyNdjk62Cf5jHW4EioT0jw8OLiLQJNwkyilg4DNDz6oFefYbGT1VWvWg2r+UqG
 QWsB/lJ6You/TO+TbAjTDozmu0DWKu7y2z3A7BM4PsxQ3SpxhUwzpa3CFIgQee5ne/jjzx9GVXy
 OcNDajeI3I5Mz4V+PUfZ0BLR4BVJQh0K1P8/kvxfwRiC8d95ibjpeIurorttQG4cO50kcwxGRNf
 +hAI6hoVA3x++J7b/33/djW2Rdu8gOoscfQWa97ZJPtoKky2qsZ/M4sWKDgaxOkDHB0uOXAQR4k
 ku2snp0ZQW0+tZw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: u0LKRbauMhiOm1_ABDPL1gBBehlLUlVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA4OCBTYWx0ZWRfX+gtWcjMW8w4/
 aPm4ZCul+sqwLws5N8cKh2ieI4MYpnQJekYji0JmVMciSX2MvJmy9QOxC/t/yVnhldaer/EQ/Cp
 /ClRNiepNmqWLeglcaUFh7EkFpzYtaFqg2GwUzTiDLCRj/CH8nNE0DTyzpdHWksaNWSC2S/cFVw
 BvZCPIZd0OvjKeuHBZLvY4xrUqoND8K7TImWq/IlrnMY2hZGbivwwAxL3rJrsLj5MAOnpR+qQBj
 YL8SUJEeIxNrF44S12OIsTsRVs0WSeRMhoj2ezE3mevrqvTizDCtehXEKm42vGDkRrTeAQNTHMY
 PalBbgR8Jw4aG07HfW3HOqghozhYS+8YhxNHN5hde0tTKrpDzXlTPipXDUFFQVih4D8o/S8a3t7
 H0rbd2MCpzKbHygo3dpR1pUapQFtzpIU1nw4s0yHWYLsY6K3bI5pvtdXgCdUWm9Nr7xFgG6Czn6
 HZS7x9F85eDDTDe+MzQ==
X-Proofpoint-ORIG-GUID: u0LKRbauMhiOm1_ABDPL1gBBehlLUlVy
X-Authority-Analysis: v=2.4 cv=FKMWBuos c=1 sm=1 tr=0 ts=69bd2ca6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pV0pCZoD4vQzL_oKQ5UA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-98914-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DDBEB2D976C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Start by describing the MDSS (Mobile Display SubSystem), the MDP
(Mobile Display Processor) and the 4 DisplayPort controllers it brings,
then describe the PHY used for eDP and tie up the PHY provided clocks
to the Display clock controller.

Do all this in order to enable the eDP panel the CRD comes with.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v7:
- Rebased on next-20260319.
- Reworked since the glymur-crd got commonoized, but still kept the
  nodes in the dts since this has only been tested on Glymur CRD for now.
  If Mahua CRD upstreaming effort deems it necessary, it can be moved
  to the dtsi later on.
- Picked up Dmitry's R-b tags.
- Link to v6: https://patch.msgid.link/20260319-dts-qcom-glymur-crd-add-edp-v6-0-f582e87ec874@oss.qualcomm.com

Changes in v6:
- Actually dropped the phy patch dependency. It is a functional one,
  but not a merging one.
- Link to v5: https://patch.msgid.link/20260319-dts-qcom-glymur-crd-add-edp-v5-0-5fc47061660c@oss.qualcomm.com

Changes in v5:
- Rebased on next-20260318.
- Dropped all dependencies, except the USB DT patchset.
- Reworded the commmit messages to be more cleaner.
- Link to v4: https://patch.msgid.link/20260309-dts-qcom-glymur-crd-add-edp-v4-0-fe4e33acdfb6@oss.qualcomm.com

Changes in v4:
- Dropped the RFT as now this is tested by me.
- Dropped the 192 MHz OPP from the mdss_dp0_opp_table entirely,
  as suggested by Dmitry in a discussion off-list.
- Picked up Konrad's R-b tags.
- Link to v3: https://patch.msgid.link/20260303-dts-qcom-glymur-crd-add-edp-v3-0-4d1ffcb1d9f6@oss.qualcomm.com

Changes in v3:
- Fixed opp table according to Konrad's suggestion.
- Added missing reg regions for all DP controllers, as Konrad suggested.
- Fixed all sizes of the reg ranges.
- Replaced all 0s with 0x0 in all reg ranges.
- Added missing clock name entry reported by Dmitry. 
- Link to v2: https://patch.msgid.link/20260113-dts-qcom-glymur-crd-add-edp-v2-0-8026af65ecbb@oss.qualcomm.com

Changes in v2:
- Add missing PIXEL1 clock to DPs [0-2]
- Use the same opp table for all DPs and drop the dedicated ones.
- Drop the extra compatible from DP1.
- Changed compatible for the panel to samsung,atna60cl08, as that is the
  actual model.
- Link to v1: https://patch.msgid.link/20250925-dts-qcom-glymur-crd-add-edp-v1-0-20233de3c1e2@linaro.org

---
Abel Vesa (2):
      arm64: dts: qcom: glymur: Describe display-related nodes
      arm64: dts: qcom: glymur-crd: Enable eDP display support

 arch/arm64/boot/dts/qcom/glymur-crd.dts |  73 +++++
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 466 +++++++++++++++++++++++++++++++-
 2 files changed, 531 insertions(+), 8 deletions(-)
---
base-commit: f6eb9ae8b9fc13c3971e4a6d1e8442f253001f36
change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750
prerequisite-change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c:v7
prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
prerequisite-patch-id: 8d240ee207afc875f46f640c6e72042cf5bfb61b

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


