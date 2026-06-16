Return-Path: <linux-arm-msm+bounces-113413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wkHJBmVKMWqlgAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:06:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8223468FBE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:06:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eZRqdHJR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FoXHr+PU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113413-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113413-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9327301AB9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A99B370AC1;
	Tue, 16 Jun 2026 13:04:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CA236B046
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:03:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615041; cv=none; b=lsAqXYPsg5h2y1e8b0F0yXe1fzjBpZYaeyOuEAy7wP0O0CTZcDCSIufbh126kkQ3aFaTTe6wb5Jt4+oH3wn6b/LbbDFgFlJgo5sCbtoD4lKvLCudXqUnQ3LtqqY3YbXBpTvOH8EVkc+ZXb3LrVxd2YbkMhS6JOCu89cxtdZN9zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615041; c=relaxed/simple;
	bh=pFCiTIOaCtErcZ/jxv1e0Dao47Mm9tD9RU3GiKb8xY8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BtJxI4dTEcbY2/JhNxIyoZ/D09i08mw3/RVVZ04A/OMCeI93ikTiHCN2T5zG71V+DZ4b0jNrmJoe6Kap4zCgkWrkpUoxTlHt/jMafQ09ZyoHy8OXL6+aBwocMND1XhREKazwsiQQrfr3qRwICn2Fu9UwTDSpvGfREAVqTyAvxFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZRqdHJR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoXHr+PU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACS273474684
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qUyzgrOtBX2LiKRqpvqy7WvVynXsD0T3XMs
	8CgMXolE=; b=eZRqdHJRfDTrGM/X2Qw8KUYl+zAuKfuQx6xzZ0RC3+cJdOMUsxA
	wkoudYtVs4QDGkmLlvkvV3fXbchZ8EmMHOnB7VZ+Fcr1OgA71PXl9Y/Lj9l3D02y
	oPPjtc/CJbJcRd/HMraTknX4PL/D2EJucXusdax59i9SfDNHRB1Wti1z8D+bwkqa
	tcXRZjUEq6cNKRjOvEjF2mpHR6kMO/sR2yHpf3lOLxoQhc3TWG3u/5MhT+4k8QeB
	ByOLiLco/m3aoEM8Ynqp1jU4JrNb+IkScJsfQ37Tgr3JZU+XU8ciBag3MELQTTtD
	ioncMLQXSttujoRSRz/YPX0wN3Fc+r3JAIg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52t4pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:03:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf1845bddfso47185155ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781615037; x=1782219837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qUyzgrOtBX2LiKRqpvqy7WvVynXsD0T3XMs8CgMXolE=;
        b=FoXHr+PUG3jCSIKYdcLoJ6v1exsX3/tw/ZiJpEXPHTBiXCdmw5FwjgA3ppIo5DUGEA
         fDIQuIEQdaKhHvGN+WgLHL73+DDS0tZIReEsPcDXqmoowBLyWvli+7kovATqHwr6xMbU
         ym4q21w2xHzAYEGfXExMuIecmJGAX0wcRLGsioRDdTg/UABRwab11/QTYlopQ/dEwctZ
         00DwCz8gk+RrnQI81icp+inGZVdP9Zu8+zzHTpuJzp2o+eKa/olJXpEuVbWiNbzzu31Y
         jlMDeK5iyXJVeTt+XGs7aqPsUIe7TOiRIQWjDmphwyBTeLcX7sz4I12V+ttmmY+LNqk9
         kH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615037; x=1782219837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUyzgrOtBX2LiKRqpvqy7WvVynXsD0T3XMs8CgMXolE=;
        b=cx0UuNhyfFhUfX0k1nd1FdxaT5pDPwYjNqiB0EriYGrGDoqMovEYldiczdfRLSzVgM
         XqlcLJvsseJo1aBKovets1A7Bn64QEZkSnKmF+nvBoGnULnh4JDrNVL38Dd1k0XCYrGH
         Rv+IOquRPqCpyrpbNsnxbzN+rbPC8FkA9Bf5wFahldKry25V+TYP20+3PmEBDXf+IPDo
         9JLGkm/yQrKf0cFPTEOcL8kQxaFHHecS9WvAAYxle8A03xD5lZyR1xbLyPp6CJedZzjD
         0BdxTju74QI3GDdpj1dXtXD1ff3ljVHoDS8kG6Gn40xxW0ESU9mqYWyWXWxG7uOaMWNl
         eGgw==
X-Gm-Message-State: AOJu0YyYXnU3SsOzIO/CwSkeTpI2dZmbgNLyhLwOeJ9i39QS2kRWRBKy
	p6DMrN1f+/RILEqHQHh8JeVgnY/r8bSHZqUUGcSNJGCaJD0uCWHvZjZstANYF0z8hi/Sh+Kkel6
	GbuxsbCIH5Uanvli3r3YA0ZJ2BD48OjGzP/79bAGSYyUm2/Ka8DzLKMwEbeKjIHrTTscT
X-Gm-Gg: Acq92OFDA0CCZer2nd+CvR2LoeGrT/L/76+hGyot1+gxcbacVyBOPXlzUCw7M7XiF31
	rTQaXRkdv5sbEhEMl7AKlQNylgAAgGoUbm7cCuho1rofKeY3pgOGbxtC6msosODbmEAvb1KLpnf
	gZyngJQImx8+U9WOjQO0LmaneLPCXxZCOr8XmhS7HXitlUxNX+knCjHGiylZh7Fx60r17CjCSRN
	1peEirEOekfv/qYMnZFlH1Q2krOjy6zxGF8bNK/9jQS8WiucUVRNiRiz75zETC+8MvJdyp5JYqw
	MsOutb30l1jE5NdN6TQWJY6bNRQBIKXtg9jc22VK0hqNlng+N5eTmDboqinQDdGEwKotR4Vrtxu
	0ThfsWgXNDwGfs15COGkwg3GqJP8v3Nxd9fWn6km+HcKXd7i8wb2G+4Sx
X-Received: by 2002:a17:903:1aad:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c41050af58mr226079675ad.5.1781615036862;
        Tue, 16 Jun 2026 06:03:56 -0700 (PDT)
X-Received: by 2002:a17:903:1aad:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c41050af58mr226079245ad.5.1781615036401;
        Tue, 16 Jun 2026 06:03:56 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c58c3sm134867235ad.23.2026.06.16.06.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:03:55 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V2 0/3] arm64: dts: qcom: Monaco: Enable SDHCI storage support
Date: Tue, 16 Jun 2026 18:33:44 +0530
Message-Id: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfX8HS7YBSn4ElA
 Hm5LtBgAEzYwTmobGlUg7A7akntI7czgm0o5BpUln3Xbuj1YbAS4/jSIkYe2xkPEd86ag8nx3Sv
 14YTfDVaCEH0cYotLRgp5R0YBzrViPU=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a3149bd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=972t8ukbrjnbrM4mtFgA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfX7rv9QUS2NC4I
 aV8W1d0Q5QlMVmz6wD2rQbAwurdLd6U6atsVIfTGvjzBCX6xr1mZBLfNOJyJlwb39FwtxMoIJJj
 rdmS7x+7Nw4Kv1cWHFxecNCXY5zqxQN89YrdR1+b+boipHP5m86May+K0e3wYJk8w3uOTWjQHP7
 5YvaGgPmXAxiVem/Y9MBXX0oPXjnOAHm7iwWdnhQYkxMVBxB0aEmQJ+9/eyZP3lIwq+2zmyG90G
 yVVDx8HO1RS/ad9ijFZiP75p+ViuRyrPv9CG9HIoQltj22r8PTdofzGUu+e0o1HHTCSUIAvY8Vw
 o/fXZSp4NXO+KvFc1NItOk7lxY18eAM/vZ4NU/7rUx1DQEyFhaZMFUYo3JlVOXVFcBc6k4pWpa7
 MgtoI9UHcuSzmRGi0BUzOaqnlr5+BbDKqBK5gVxzeOuOHh8pOLfO9JahoiY5XP30sESHYbrZodA
 y2h1fzrehVD/Rj+F+hA==
X-Proofpoint-ORIG-GUID: 9Fnl-S3JvDgS1CHssumNMoOBnYD1WJ0x
X-Proofpoint-GUID: 9Fnl-S3JvDgS1CHssumNMoOBnYD1WJ0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113413-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:shiraz.hashim@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8223468FBE9

Hello respected Maintainers,

This is v2 of the Monaco SDHCI storage support series.

V1 was sent here:
https://lore.kernel.org/all/20260227105055.2364348-1-monish.chunara@oss.qualcomm.com/

Compared to v1, this revision makes the storage split more explicit and keeps
the SoC description generic:
- Avoids using the reference to direct supplies as dummy
- Updates the eMMC overlay to remove the static UFS host disablement and
  vreg_l8a voltage override, allowing DT-fixup to manage the UFS-eMMC mutual
  exclusion dynamically for flexible UFS/eMMC configurations.

Validated on Qualcomm Monaco EVK with both SD card and eMMC modules.

Monish Chunara (3):
  arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
  arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
  arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  7 ++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 37 ++++++++++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  1 +
 5 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

-- 
2.34.1


