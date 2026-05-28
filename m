Return-Path: <linux-arm-msm+bounces-110080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CA26F3sWGGoAdAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:18:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB1B5F075C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99EB030C3AD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2643AEF2A;
	Thu, 28 May 2026 10:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTNeL8hH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q6HkBJUv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E6938B14D
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962846; cv=none; b=MUjK0swmtXBMXHr/sI/qK+QlReSrJCduTcZPXPjo/XovYBr4ZHRp6b8pXSL64Gelvtnsy/adwArRVKYWSwEyr20BmPh6z+YPlCJg3iEC5odBj0pLHB6yEkTWGIoufDYppf8QXgafxuQMBADCW97quY1XuZIEOOeW9Cu8WFvirD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962846; c=relaxed/simple;
	bh=P9zdRF75ovh9OUXTq7XDoR9YzQx/7k+N5XbMIS2Z4GI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qsBtqZuNWZA8itTJJ6RKFLAhcLmFm/E6w7rAHPUHk7xqjhOxw0fLSXGCX9Zzf7H8Hva5opn6b8vdwZ6IJQQ2/8m+B3VdNN05Sww2gcl/LZFjUZvY1zvnii68i0KJ3jKFHat9AYXpbo5u8H0AyXBc3JeIMyeuXEqCN1FRYDnA9Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTNeL8hH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q6HkBJUv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vbbd566526
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=goCFzwdKHih72u34xHY50O
	J45xpUg1uFhWBNWD5VHm8=; b=VTNeL8hH9RjqCl6T3He3GQpfPA7B6A4Vm/GnH/
	U3c43RPJ0fhnf1/yeeymrbu03xR6R0KiC/9fV7P/bU72NDj7klQmf+c2xvq3G4/U
	a/Xw35W6oOwyLlUnDzSu9oa1dS/wHay9JDFYMNi2nVOFle/lNj/RfcN4S+0x1Ysp
	k83A0VX5VnMmMYKvyW1aBhJhFYjsj1JSKEGWoIyn+dmwaYNT0rwyobtZ8pEsu6y2
	UJxWkkQ18RV4cLlqXhKAqctEcLFd8UlXdXFrioeOzQZi/pCG504ZhlE0mLz+bbdY
	krJwpf86AJJT1khzTq6+jACdaskFk2vnLqfhVTup5VcXdHSw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynja53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so12687334a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779962844; x=1780567644; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=goCFzwdKHih72u34xHY50OJ45xpUg1uFhWBNWD5VHm8=;
        b=Q6HkBJUvlhSZDibrdyPhZHJqaO1Bj+dZ49l8ElhojLn2DwGNSe1zdYyfiQeF8+fG2k
         tCUNgU3E/d4Lwx4pCPSRRes/iAidqzED+iaTJVDC3shGDhngdsvo79V3t4gOqpxBOcUx
         njmyTlmiUB+Lb2UUzvzK/jv5ji/IKnsPBL3VvSP2dHvRORaLp52IPfN0y7fspBpiiwKi
         aQPVqBARltcAvqEOR4pksxz3NubjBI3hjp/CNWll3CHHPzCSek2n3av1/MorZGUkRwtx
         /4iU9vki1nq2pPxcu7aDwsdv+ATBRFALcp7NfZCJLNuiT9edZzOxQoy//rlqY7fhyXfN
         hJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962844; x=1780567644;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goCFzwdKHih72u34xHY50OJ45xpUg1uFhWBNWD5VHm8=;
        b=BxUxfgGMefsdR7kRr/VoGwjeBlD6BeQ2L/FVWU+oBzFmjAJ81CukDcxKg8z8HBY96q
         ryiGrcvuqPDdZjHFJcPkyHitwIGTbRiaIv2b897kKuhhz7OfWQ0n1cOQD7WfM79mr1Cf
         uNOmCIOi6APyAuVyd/dxUxgBcMjMQswwF5EYbKCZhj+sPdpof3bspKnjeL5RbtirRKzP
         35/qPhEXLlpxLUNZo0Ql+3V4amWYaWhTJaa52KSYUNEE3ElnvG79EdZJkl6/seUzxDYw
         a7bgiJmJPZu3ah+szUbrbLnZrANw6UqFsaTXYv2w1myuuOWjfaoilf9Qz+PP6zPLz7L7
         UaSA==
X-Forwarded-Encrypted: i=1; AFNElJ+VTgXh/cpk/y1DjyKa6Ad6kDxH0TDnTvdxKpQnwUOpRXHTB9ZMn+8JsAGsbNJipEiCxlGEElNCsrNyl7mf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg5QwDIsfM/mzMV19sJnY0ANiEeF13xChv5mF7uXlZQCBbyT1k
	7222GZZ1MLVZ7V5ynYkPq1ICNnrU0hhGWHhi3o/j9rUv0PATc+4qZlD8+Wr74zVVsHfv/CKH9Ip
	kLdZm1EVRmC8HWN2ZYSwP1aPPaFa+hnOjfKTzBVsKzshQMx5AgSsWsim23y7G/duXgQOQ
X-Gm-Gg: Acq92OFXUlVRDZDSK8hA4FGUM6SRybdvYsbhUAwrgV+UAOUM2Sel5PsOJWtC1JgOKn6
	kSMqn6cIjszi8VhQZgokoTB/PqgtPs8TKqiY2impGrsGXpjT7VLLmM9KyKFg30AELcZrJJmdY9G
	/P7A7FgKoRG3wd6nxiWex2hE0IWg+EcgjMcXC+3a4w4gi8e0PIWG0i5809apOn83a1b0IxZsPqo
	DyBiVW2rO/AJ7pHj855prhuvtU0g4VvIuS+ReLGhDsvPCXaD1VVr+vjeX/Fp1XMZ9fobH+h8+yQ
	+068Uso+xxWof5rRSBItzDHm0OSJNHXInOAKoLrj5wKMBqRN0p56HWYY9FYhnyTbn8Do0Eh8juz
	QRlke2GShPVX0jrgnxHTcMSMtlrrhDjqyT8MUuBdWP1PayGSSUg+Sn9iLldlp6k8=
X-Received: by 2002:a17:90b:490e:b0:367:b819:2214 with SMTP id 98e67ed59e1d1-36a6765b57emr18086227a91.13.1779962843982;
        Thu, 28 May 2026 03:07:23 -0700 (PDT)
X-Received: by 2002:a17:90b:490e:b0:367:b819:2214 with SMTP id 98e67ed59e1d1-36a6765b57emr18086205a91.13.1779962843504;
        Thu, 28 May 2026 03:07:23 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b7e38af60sm575296a91.1.2026.05.28.03.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:07:18 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/5] clk: qcom: Add DISPCC and GPUCC support for the
 Qualcomm Shikra SoC
Date: Thu, 28 May 2026 15:37:01 +0530
Message-Id: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMUTGGoC/32PzW6DMBCEXwX5XEfr9Q8yp7xHlYNtbLASArEBN
 Yp49xiiqrdeRpqV9puZF8k+RZ9JU71I8mvMcbwXg18Vcb25d57GtniCgAok4zT38ZoMbWOenKP
 dtBRVQWqHHBCCJOVzSj7En4P6ffn45B9Lgc+f4x+7RO1kgfqX3BVgmoai7nbNFEEL34YQuIVmx
 R1vTfbUjcMQ56bSuhZaaccEcGZA162yQlpnawPKWmGMROkEkL1IH/M8puexdmVHk3+HrYwClaF
 VNWdCGYvnMefTYzG3Pf5UhFy2bXsDLS2d8UYBAAA=
X-Change-ID: 20260513-shikra-dispcc-gpucc-6f59c23020f5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: VHAm7uBDNdBw993eBl7T1v0fU0wsWt8z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwMiBTYWx0ZWRfX6uhNwnfpFgCn
 nKVLKhrzAujK8lh3GYWF6lUJhRFyPSNM3FP8HE4Iz8lq5uvzaVlLLtcivb7CZPzFdPWh9fgZ5+i
 iYz54hntH/cvnx2kcYjQ73THiHAxlpkX30wJKA5gqDfdPtwXncHnUmTQtoiBWv9GElMRh3aw+0q
 P7w5IiLjWgLTa3tkNyIAcEBuotgMh3QSFIJ9/mUErLYThe8cpg8vQD08tgKwb67R2er2cBRpCq8
 t6lmZlyOm3Rpb9aq21qN522hE8kyjdRNrb/LsWgSaGoKwUbFYf9Ba0JWlUPFdn2+TRxuZjg0tF8
 JrpO99wVz36mKFWkmKGyhkCI45my2qE3fJjUyV4X7g3BzWDiFlAdVky+hRKIGK98nd/1biaopTM
 OJ2+Ym+5COobGpGCg58VjbvWd65XnYdH/mPMwQxQvuohj2cw3zLy0DzG/JxvXBwiQ6CCXSBw6Pc
 DWSBhg4LAff34WNl/RQ==
X-Proofpoint-ORIG-GUID: VHAm7uBDNdBw993eBl7T1v0fU0wsWt8z
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a1813dc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ywMLko9bWws4LfX_0TgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110080-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0CB1B5F075C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for the Display clock controller (DISPCC) and
GPU Clock Controller (GPUCC) on Qualcomm Shikra SoC.

Shikra GCC series link:
- https://lore.kernel.org/linux-clk/20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v2:
- Dropped QCM2290 GCC critical clocks modelling to kept them ON from probe.
- Updated the QCM2290 DISPCC/GPUCC bindings to align for Shikra drivers reuse.
- Reused the QCM2290 DISPCC driver for Shikra without modernizing
  (keeping the clock-names approach) for now to avoid potential bindings ABI breakage.
- Modernized QCM2290 GPUCC driver to use commmon qcom_cc_probe() model
  and reuse for Shikra. 
- Link to v1: https://lore.kernel.org/r/20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com

---
Imran Shaik (5):
      clk: qcom: gcc-qcm2290: Drop modelling of critical clocks
      dt-bindings: clock: qcom: Add Qualcomm Shikra Display clock controller
      dt-bindings: clock: qcom: Add Qualcomm Shikra GPU clock controller
      clk: qcom: dispcc-qcm2290: Add support for Qualcomm Shikra DISPCC
      clk: qcom: Add support for Qualcomm GPU Clock Controller on Shikra

 .../bindings/clock/qcom,qcm2290-dispcc.yaml        |  75 +++++++--
 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |   4 +-
 drivers/clk/qcom/dispcc-qcm2290.c                  |  18 ++-
 drivers/clk/qcom/gcc-qcm2290.c                     | 153 ++----------------
 drivers/clk/qcom/gpucc-qcm2290.c                   | 174 +++++++++------------
 5 files changed, 161 insertions(+), 263 deletions(-)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260513-shikra-dispcc-gpucc-6f59c23020f5
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v2
prerequisite-patch-id: 5a0fbdd458785da2d0e850c851a05046672ecadf
prerequisite-patch-id: 1f98e515a52bbeb25e2a960a804afe16c6a472a1
prerequisite-patch-id: a64476b2ba6e0f2a55928baf72ec32672ee0123c
prerequisite-patch-id: d0c8651205232862b40f942929e1efdaa3084eb3

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>


