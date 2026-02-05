Return-Path: <linux-arm-msm+bounces-91917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHvmBTOMhGl43QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 13:25:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A85F9F26C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 13:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E6503030109
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 12:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754F13D3488;
	Thu,  5 Feb 2026 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEFKMJ4G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvbcC5MP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB663BFE40
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 12:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770294072; cv=none; b=iYClMuUtaeYIX+yHyiXv29MiBHCfDycrpmrZndVmMjD3j8hG0Qg1hwApXTecIBU4UMbAdsBoPyFVCemXOKuJ5Hr9BDewD2M7DictRilpzjSxz+v+7rJzUHMh7nZcp9q6R1SHNWaJpPLFUeJUA8jRcufKmDIX+CY7yEWXy8y5g2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770294072; c=relaxed/simple;
	bh=M4SRQJlLkDlPWSVz7v2Tl0jFzXHdog8+Bjj6R9sksz8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ozs3u4QBGWqPvE2aqcdjI01kS0Pi/7Mh5KfhDcYmDgMdlEeH15Xy9pjnhEJYSAD1FhbMdH1rj9GwcR3DuPNARucnQKMisRAtB/n/NOusHWZlmxuG1p9dNgYuS3U2loqF/O0VArwd0BiD61vG4yu2c4hQIj1Aw0BEZJU8Apv6jeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEFKMJ4G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvbcC5MP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615B3tEF176860
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 12:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eSCXARRsTLxA1BLm6+6KrL
	EaJYwd3icVxfp3SCmdKtw=; b=AEFKMJ4GA/Y7S9YzaAq0Aherrj5fOr+/vr9KKM
	lj3jbpAT6UEgcwFD9itL996wwnE+KwhOZi4JHyXdFfAyzTeXQ84dqSWSeGiy1F9v
	fNltVgWVV6HhLpG5+vQBSnuB78A1SJluCFtA37QSNCzC0osbe5brgThSv3+g53nQ
	hJ3HTvn2M4+zsozjmbWdNKUvxM0i6bh3lP25Q2jPU8roU9utl/cf8Jo3vzyPAwOK
	alrmi0veBa+/2gy97IlBYI1Y8YANSbd9Uto+7NPmOEAqTzJI7CqHKNIADOd/uKHV
	uFx6hLI1UMcKVqyP2PWsNUCG1slP/5xfQyr4qENq64y57Ceg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0p07am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 12:21:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3547cd89bcfso2028213a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 04:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770294070; x=1770898870; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eSCXARRsTLxA1BLm6+6KrLEaJYwd3icVxfp3SCmdKtw=;
        b=UvbcC5MP/yIc1iSIH14KvlGDqLq0gTVpTUWvzHu3xH9LxqF2gNpXjKvM9eepoG2AQt
         Py+OX2spf7rSxk9GS6N2Dz98sfEJ9letzbXcuu39kHagM8ZjdjyUUErqw+4sjZtv8GLa
         oYipzEmfqEimi8U5+9AtuicmlLrOtE9R16D5wMa0UcqPeX9P0ezWMYmM40w5F/ovZZZC
         2KyyvkSfcGQD/1Q0d32EUduvq+3ZnKzDRuKFKTab+85B621YLkBeVRTQhzxKcPyciFYJ
         mDVodQwwbukVKbuUD544g0uoKCgpuApu22ZQvfQWB33ZGLmoi/IaF0fogfUiefU6IDdO
         PggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770294070; x=1770898870;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSCXARRsTLxA1BLm6+6KrLEaJYwd3icVxfp3SCmdKtw=;
        b=Z46FuE58l1oA4IpYGPNIttmhnoakFHP5wXzSETfKtrij7AphcZrMTPY/l9mDP5/q8G
         nR4bpivquxeSVTcVhapO3dee19yl4kKTcSFjqXFSLMXAvFTS8We25dQv7c3qpVUG/cQK
         vUw0zIVWCmyvphvDHPeoaIQV6vdQcC5+u8fX2fA5BP3yjvGwVhv8fg1+RWP7+WrrAGyk
         1k0j1h7+5bE3D0T3LgONOiyJOiHArBcJcXX7QGhtjMXndONCQ1C+DvLqBBj2r042IudX
         42Nw+Ptg/lek68fL36JBnRsU47qQUZ5JRZjglAA1pYs5xnYNgzKXzXprCn061RuRsgtH
         UOcg==
X-Gm-Message-State: AOJu0YzXdrTuvCLeZW9cUIFAGdt24C5cKhjnsF/7HhyfRtqjHvaahROJ
	Dw+GcCshImG+9heWnQHhwJlgNh++4ItojqTj/WCXgRoFaPQRLCOG+cd85nPhL/wBqE7T2SOIRwf
	Yz0ItM1T3lIFygSbLPN8cxKg2wKjonEJ59N+KkQUUPBFNfk1QOsm5kuAnoNOvfFWFPheA
X-Gm-Gg: AZuq6aJ6omKRU7BauRiP+/AIQ2IfJnQLm3QfI6JGA4T0oK5yOzP2ATWxngQ+fdVQmd+
	4d97aMj/h8VCU13Cpay6e1YuORIiArVhbpcHtgP1US1EEcl5kod12JG68DKcY85Yh1ZOvQ7HGyT
	evLwh0pTB4QWFPq5gSrqQn5KmlQTtwFWm+qjtjlYxoP8WaMRtLJADWKv/hTZnIZ5rL5DdPyvFHx
	yA/jyVf4Vb72NKMJ6dm7ok0eedctgq+ru6jxevLt1Uw9/NzMvB+cEVUmUN0z6UhCwECCMEi8DTE
	5rxPUm9xv282C2Vc8Jkp8fL1cTzTO/aJ6O3uWS+Hyg9gy8PHALfYZ4MbziehxkbDb2ivcsBlRJe
	jh/h6dK8RjjVdcyQ1VgKj38RJAHJx0gmA97nm15ijlhaxaGQUCWBVpcXDrjWbrE6BvN3UDempXZ
	5yMup5E5WYNH+76qmpEm0gHskYzpe7FQ==
X-Received: by 2002:a17:90b:4c07:b0:34c:2db6:57d5 with SMTP id 98e67ed59e1d1-35486f5b63bmr5513670a91.0.1770294069915;
        Thu, 05 Feb 2026 04:21:09 -0800 (PST)
X-Received: by 2002:a17:90b:4c07:b0:34c:2db6:57d5 with SMTP id 98e67ed59e1d1-35486f5b63bmr5513623a91.0.1770294069348;
        Thu, 05 Feb 2026 04:21:09 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1c8c55sm6262715b3a.24.2026.02.05.04.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 04:21:08 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [PATCH v7 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
Date: Thu, 05 Feb 2026 17:50:40 +0530
Message-Id: <20260205-upstream_v3_glymur_introduction-v7-0-849e7a9e6888@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABiLhGkC/5WPW2rDMBBFt2L0XZnR6GHZlNJ9lBIUW07Uxo9Is
 mkI2Xtlh0KhDWl/Bu7AnDP3TIL1zgZSZWfi7eyCG/oUioeM1HvT7yx1TcoEASUDKOg0huit6TY
 z3+wOp27yG9dHPzRTHdMtlYaB3EohSt6QRBm9bd3Hanh5vWZvj1MSxeuSdDYEs4qq7DF5FDBkj
 IFGnSOqAhSjjI6mfzdv+WiiOzwPIeTHyRzqoevyNJ4W09YES5eNi1UGrTa6hFpIFGTx7l2Igz+
 tRWe+itdOyMq7nWZOgXLEgrWsVVo2Px5YFbP4wqYKDO9jRcJqA1wpZGABb2DlNyz+ASsX7NYUq
 uZS2NLcwKp/YlXCopCtAG0bjb9hL5fLJ2401ilSAgAA
X-Change-ID: 20251007-upstream_v3_glymur_introduction-5a105b54493d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770294063; l=5176;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=M4SRQJlLkDlPWSVz7v2Tl0jFzXHdog8+Bjj6R9sksz8=;
 b=WAOdRVX+l2Z9LqE/27EvTgIvWCR7TdgMaYwzaGbDEoNxgyX7H1Q/YCU2TewbUm2sQiF1qVZlq
 kz9ejAsbjCGDZGSsaY6UqS545nixAxP2T3vMd04/rZjlJwNKzw5JfTW
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Authority-Analysis: v=2.4 cv=ItITsb/g c=1 sm=1 tr=0 ts=69848b37 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=pou2ygFnXE7-ag75BL0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 3nvZn1aWcdtIXILHo1vsKaXL4aAqySTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA5MiBTYWx0ZWRfX/qQcHg06fvLO
 3eVQRZVfCC3n3qsTAeQ854WmYboPq4h+PGNSRK/v6nVd/9qZsHYz6CU3QxNmb2cPxjUxufczyfU
 yqAJlNM+/GUnj7vtEB0/HSpvkT+DhfthKd6Bkeeq6+IajFB1wlHGi9SEvYOCVkVgXokWhW3N1cK
 CgamAZkS49QHj/J8qxdC5dba8OtZoCG+6Qc/lcAPJFTql5FtIUqg62mrl0Dv9LCIRPx7MVPCOnR
 /HM56giJUUrbYsx8CjCt9hL9iFFBh6Y+QbjhADkhzEzs89XoPwzcudUc1rzowhpbS2+Y/LLiuTo
 TUG+4qi4aXhK0P6kgW0K6ytyV4FYrBG8uzoUtkFPaMsFjB0WUrCRiX/TPGxzNcnD9RfUofgaVg6
 ZSZmJaPsydcgGyKPGAcqRVCREon9LSeTq4dSq9i7yQpegEr6kPe/bbih4qHH7QAw0ywjE6E2V7G
 9ax2YEvFzUuTAYQdJhA==
X-Proofpoint-GUID: 3nvZn1aWcdtIXILHo1vsKaXL4aAqySTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-91917-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,codelinaro.org:url,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A85F9F26C2
X-Rspamd-Action: no action

Introduce dt-bindings and initial device tree support for Glymur,
Qualcomm's next-generation compute SoC and it's associated
Compute Reference Device (CRD) platform.

https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-

The base support enables booting to shell with rootfs on NVMe,
demonstrating functionality for PCIe and NVMe subsystems.
DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
thermal management. The platform is capable of booting kernel at EL2
with kvm-unit tests performed on it for sanity.

Added dtsi files for the PMIC's enabled PMH0101, PMK8850, PMCX0102,
SMB2370, PMH0104, PMH0110 along with temp-alarm and GPIO nodeS.

For CPU compatible naming, there is one discussion which is not specific
to Glymur, Kaanapali and Glymur use the same Oryon cores.
https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
We've kept the "qcom,oryon" compatible

Features enabled in this patchset:
1. NVMe storage support
2. PCIe controller and PCIe PHY
3. RPMH Regulators
4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
5. Interrupt controller
6. TLMM (Top-Level Mode Multiplexer)
7. QUP Block
8. Reserved memory regions
9. PMIC support with regulators
10. CPU Power Domains
11. TSENS (Thermal Sensors)
12. DCVS: CPU DCVS with scmi perf protocol

Dependencies:

dt-bindings:
1. https://lore.kernel.org/all/20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com/

Linux-next based tree with Glymur patches is available at:
https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/b4/rolling_v7_glymur_introduction/

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Changes in v7:
- Dropped regulator boot on property from wwan regulator
- Added comments to identify clocks in gcc
- Removed extra EOF new line from board dts
- Link to v6: https://lore.kernel.org/r/20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com

Changes in v6:
- Moved pmic thermal zones to their respective pmic dtsi files
- Link to v5: https://lore.kernel.org/r/20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com

Changes in v5:
- Added opp entries for pcie nodes
- Dropped qup-memory interconnect from uart nodes
- Update trip1 type to critical for pmic thermal zones
- Alignment and newline fixes according to comments
- Link to v4: https://lore.kernel.org/r/20260112-upstream_v3_glymur_introduction-v4-0-8a0366210e02@oss.qualcomm.com

Changes in v4:
- Enabled PCIe SMMU for all 4 PCIe instances
- Updated dispcc required opps level to "rpmhpd_opp_low_svs"
- Updated watchdog compatible
- Renamed gic-its to msi-controller
- Updated GCC clocks property to 43 from 44
- Moved cpu-idle-states to domain-idle-states
- Fixed alignment and zero padding issues according to review comments
- Dropped glymur-pmics.dtsi
- Moved pmic thermal zones from board dts to soc dtsi
- Link to v3: https://lore.kernel.org/r/20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com

Changes in v3:
- Enabled system-cache-controller
- Squashed all initial features to boot to shell with nvme as storage
- Updated tsens nodes according to comments
- Merged tcsr and tcsrcc node
- Addressed review comments
- Link to v1: https://lore.kernel.org/all/20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com

Changes in v2:
- Series was sent erroneously
- Link to v1: https://lore.kernel.org/r/20250925-v3_glymur_introduction-v1-0-5413a85117c6@oss.qualcomm.com

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

---
Pankaj Patil (4):
      dt-bindings: arm: qcom: Document Glymur SoC and board
      arm64: defconfig: Enable Glymur configs for boot to shell
      arm64: dts: qcom: Introduce Glymur base dtsi
      arm64: dts: qcom: glymur: Enable Glymur CRD board support

 Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts         |  598 +++
 arch/arm64/boot/dts/qcom/glymur.dtsi            | 5913 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmcx0102.dtsi          |  187 +
 arch/arm64/boot/dts/qcom/pmh0101.dtsi           |   68 +
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi    |  144 +
 arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi    |  144 +
 arch/arm64/boot/dts/qcom/pmk8850.dtsi           |   70 +
 arch/arm64/boot/dts/qcom/smb2370.dtsi           |   45 +
 arch/arm64/configs/defconfig                    |    5 +
 11 files changed, 7180 insertions(+)
---
base-commit: 0f8a890c4524d6e4013ff225e70de2aed7e6d726
change-id: 20251007-upstream_v3_glymur_introduction-5a105b54493d
prerequisite-message-id: <20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com>
prerequisite-patch-id: 14469fd166b31b251b98bf25e783ab6f57ddd13a

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


