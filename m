Return-Path: <linux-arm-msm+bounces-92671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKifDA2vjWmz5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:44:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8872E12CA1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E972303AA90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F4329BD87;
	Thu, 12 Feb 2026 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fjpTqENW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/Ywy58F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6707B281358
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770893066; cv=none; b=khhEyuDTISpd+jqkk+xDYz9xnVZ/NSeb+XlI/jzY1p7oY3WdNVRb7v+enWNdQNdVXN8DDCTHmt8QwTFSHd1UDwHremci28DpzOacTRcpAzJIXOKYXHeg805OUz0y4IRoNF//7NlNLDgNIEbm7uvccA3rt4zIlsOMtPE5rMtSRUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770893066; c=relaxed/simple;
	bh=xZGtG/teHt9qThRKBMjDansjAY+cXKqWiIi6owISmQQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JF1YZ1WaZO9lZHX5Yj14XEyLjfFmsHvpbG0+Kr6rc1OMEYYkf7Yb9y8ogZdkgcdGOZv9ACEuWY/ih4XPxg6EB18SqlRSPQAqqwbYTUcQsiXH75hvLJSNl0vfVr7XinOt/1lU3pqyEXbGfksYsacJ/OMgUXK13nEiXTJMum2+THA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjpTqENW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/Ywy58F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CADsu93963716
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A+hv/+FglUu+ul890+d3uB
	Dgm4grHy1rv7R365tuwgY=; b=fjpTqENWTYRG/wLA4VzZXIDFqnrQCScSaE/OQv
	CTFUGdFoIYjfgVhgtc11D6JIPSAxG0/loPZk4/CAH5P7Xxq1aehuiHP6str2IGvc
	4GoWPqg0HU4KPitKQz59fPeOZBXFP9pZeTC23cyZVlj0w2McX5RSzfifZU2Aa1+l
	84ywx1cgZe7gcIszvdfz+ENvgLahESRXC7ftEHEkM56zQjNQ09Z10EmYqYQjDgtA
	f4XieCIOx2g5ET9zYF8gLaZV/q+wC4bSA/ifXGzTDah/HpFITy2ZDmd3eE4zx9P0
	+42IvN09y93rW6EBkKX9x3/PXFl6RC8UlwEQdTEo6nzGie6g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y8ntnef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:44:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-352de7a89e1so2822853a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 02:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770893063; x=1771497863; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+hv/+FglUu+ul890+d3uBDgm4grHy1rv7R365tuwgY=;
        b=Q/Ywy58FYrjliGGRO7ifML9JTbn+4G5MjuAhXY4V70xINXwZBMlAgUI1icRTlwhmXj
         fCjMO8jvKETKTmdEcEiG9kD0SF3DGiLyfdTrE2awUltfFWOwrXrTD7/pF45JKStBZm9j
         aapCJVBdSM/PDhb2zrS4quiBcCCuMx3CpQqveSDJkOHwscB6OAPRhEUqDzLETqfV3SGO
         4bOJpJVsYz2NYCybtT5MWFJO+xIl+N/3JddsvqN17ii8+Sb/ZjmLKOvfWN5Nha66M3I5
         DoKIvS0yolG7aZN28tUSh0iU/p48HXDqgDHHb2KTqz6bZ8f6KzQsHMl4z0fy2kZhMy/+
         FGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770893063; x=1771497863;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+hv/+FglUu+ul890+d3uBDgm4grHy1rv7R365tuwgY=;
        b=JDYLlDW+iPG50td1ofeJ2SSDCtdkAl3l8HDyWtESm6pCBcHPPVIrnlIDlJk7lKsPni
         0hLRdf3aV+vPXV6BBwemJG6Hkm+iGNNUfdzrMGJFy9WzIJ7BeM+lVsq7GpwICaEDbwUy
         zt2xSQnnigUDnvkOWAF78FBIb/4X5hwMBkRJ7Z6fPOxwirpnmkY3qCFw8GONe8EjH7hg
         au4X4M7bq8bhfEDFr1pleULwleMcHtCknrV5u5w8B6InsZVAsfU4BxHodffa58ysR5SE
         PBLJBDQSb8njB71k9f/Le3vXtqsyumvAoihuCS2e2Y6/QJkb5QE2l4Vq9Xj+Q26m2WDe
         obpQ==
X-Gm-Message-State: AOJu0Yy1nXZ8njil/bza13FNTsaD/Tnge7o3lVQ9YreYQUSD1adFNyh/
	YoS7xIfuZ2kM5rjDw76s/DN6y8uSfJm9RwPE7ut9MWAnmYUspl6Q/PZdOHOI711WeRvXQt4CEuw
	jWbWKsg9w8ZUww/CqQDagEXizaiL7Adp7tEqHWOA/gto6/v+haIzWs0MNzxpUR9X05q8A4oNj3C
	XE
X-Gm-Gg: AZuq6aLZtAmiL6EVhEnRbByLyS5N6C6dkfjEUZPDTZE36glDNi67NKYZ0fpPGHtcLQ5
	mwg5dC4aJeiZ5BzZUXeRECn8MXICG/fhEbXgEjJfwadQoy1Ww//JAF8JOQq7HHuXWIcj5uVfYY6
	58iHfMW9/bINGrdyRGzURrCvFDmrdKWiDbECAs+tl3aryxQ/B19RXhbXQw9pYlo15J6Bvz5TIV7
	DDIx+/WFM63tYdVobZEcxiTTDZzRvR79t+TPF65RmqSJP8EnMNxhfesnzIdN/bhXvb0TmByKYU9
	hFlN3D+vYCgzXG/LdIez6rS6HwRs5UO6M1BxJP7CrsFO0SuQ0x9SFnoHjMpS0tGf1JQ/Y7oADdC
	SWyLZdeAN/AvLvnAxnvhgxppdvDC4cqXPwbui9+Xc9gHVltWczNzBtnBpVA==
X-Received: by 2002:a17:90b:2584:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-35693ccf631mr1766636a91.16.1770893063103;
        Thu, 12 Feb 2026 02:44:23 -0800 (PST)
X-Received: by 2002:a17:90b:2584:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-35693ccf631mr1766597a91.16.1770893062343;
        Thu, 12 Feb 2026 02:44:22 -0800 (PST)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567e7d9537sm4983375a91.4.2026.02.12.02.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 02:44:21 -0800 (PST)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch nodes
Date: Thu, 12 Feb 2026 16:14:00 +0530
Message-Id: <20260212-industrial-mezzanine-pcie-v3-0-1e152937a76a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPCujWkC/43NSw6CMBCA4auQri3pQ16uvIdxUeggk0iLLTQK4
 e4WNm6McTPJP8l8sxAPDsGTU7IQBwE9WhNDHhLSdMrcgKKOTQQTOeOSUzR68qNDdac9zLMyaIA
 ODQItMq3LjLdZzY4k3g8OWnzu9uUau0M/WvfaXwW+bf9RA6eM1rIRFYt+kZdn6336mNS9sX2fx
 kE2PIgPKJj8BYoIlllRgc7rtpL8C7iu6xuMyJgSGgEAAA==
X-Change-ID: 20260131-industrial-mezzanine-pcie-75dd851f5b04
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770893058; l=6561;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=xZGtG/teHt9qThRKBMjDansjAY+cXKqWiIi6owISmQQ=;
 b=n8BaqM54pPMiWDgeH+L4a5kadfzuzWZAvp7r+zoxQlEy7QxKi2mawNFkHsrrkVPQMzsJrb5J3
 q/xZbtkEAIfCnqRw6DVUk5NxGyroBFQPmNCr43hOhg8XLFMCNeS2z47
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4MCBTYWx0ZWRfX8eqEqCDA6/UL
 myngIcGLqJCUgvvT2tbUj9mth0JwpcyjPHIifLCsK+QuIwmOOhf5+HQ6fX08g0PMdWVI5VbuTNa
 NsO1+GQEr8ZJrInA0Czfyw2D/Igc8c3ig4+Fx7MCKuGGkD7BQbRAmeoXqU2OZyylI3DMyGRY+1A
 KDvAY7myXqEfcB0QJUp0HgVkCJ8PDs+s9td2yBTivdfAdfqCsPStJCZSHqFjAWFb51hA4x9NQds
 dhFNJeIAwevkBJxKeAkY6CQnVkHuHjpnPypmRazE0mQHOwnzfFH0EnSsgEGKYzEQBybdu8r1Krd
 SHOW1lU82X+Qw/YrCmu2mFw0bcIVYfVRoFjIn3+ehjjeBCK3yTyCfLQR3ec3bY/1HcCf4Hj9pED
 RAmbQWMCuflRKlS8apBHaOTQ2KLVc4+lpvlGG6/DfZH/mWDqYCk2GgL7yWxwIV8b61hrDGOnDc+
 AqQVinzm0BF7yyE0rWg==
X-Authority-Analysis: v=2.4 cv=VNvQXtPX c=1 sm=1 tr=0 ts=698daf08 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DPOz585mkp_on3fXeyYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: tHf9RN0hBgd5n4eaKcDRV4zP-3FURnIC
X-Proofpoint-ORIG-GUID: tHf9RN0hBgd5n4eaKcDRV4zP-3FURnIC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92671-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8872E12CA1B
X-Rspamd-Action: no action

Add nodes for the two additional TC9563 PCIe switches present on the
QCOM RB3Gen2 Industrial Mezzanine platform.

One of the TC9563 is connected directly to the PCIe0 root-port while
the second TC9563 switch is connected in cascade fashion to another
already available TC9563 switch on PCIe1 via the former's downstream
port (DSP). The final PCIe hierarchy on the Industrial Mezz platform
would look something like below:

                   ┌────────────────────────────┐                                      
                   │                            │                                      
                   │                            │                                      
                   │                            │                                      
                   │            SoC             │                                      
                   │                            │                                      
                   │    PCIe0           PCIe1   │                                      
                   │    ┌───┐           ┌───┐   │                                      
                   └────└─┬─┘───────────└─┬─┘───┘                                      
                          │               │                                            
                          │               │                                            
                          │               │                                            
         ┌────────────────┘               └────────────────┐                           
         │                                                 │                           
         │                                                 │                           
         │                                                 │                           
┌────────┴─────────┐                            ┌──────────┴───────┐                   
│       USP        │                            │        USP       │                   
│                  │                            │                  │                   
│      TC9563      │                            │      TC9563      │                   
│                  │                            │                  │                   
│                  │                            │                  │                   
│ DSP1  DSP2  DSP3 │                            │ DSP1  DSP2  DSP3 │                   
└──┬──────┬─────┬──┘                            └───┬─────┬─────┬──┘                   
   │      │     │                                   │     │     │                      
   │      │     │                                   │     │     │                      
   │      │     │                                   │     │     │                      
   │      │     │                                   │     EP    ETHERNET               
   │      │     │                                   │                                  
   │      │     │                                   └──────┐                           
   EP     EP    ETHERNET                                   │                           
                                                           │                           
                                                           │                           
                                                 ┌─────────┴────────┐                  
                                                 │        USP       │                  
                                                 │                  │                  
                                                 │      TC9563      │                  
                                                 │                  │                  
                                                 │                  │                  
                                                 │ DSP1  DSP2  DSP3 │                  
                                                 └──┬──────┬─────┬──┘                  
                                                    │      │     │                     
                                                    │      │     │                     
                                                    │      │     │                     
                                                    │      │     │                     
                                                    │      │     │                     
                                                    EP     EP    ETHERNET              
                                                                                       
                                                                                       

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
Changes in v3:
- Fixed DT binding errors.
- Removed labels from unused TC9563 switch ports. (Konrad)
- Sort nodes in alphabetical order. (Dmitry)
- Fixed styling issues (Konrad)
- Link to v2: https://lore.kernel.org/r/20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com

Changes in v2:
- Posted as v2 by error. Please consider as v1.

---
Sushrut Shree Trivedi (2):
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for PCIe1

 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 250 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   2 +-
 2 files changed, 251 insertions(+), 1 deletion(-)
---
base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
change-id: 20260131-industrial-mezzanine-pcie-75dd851f5b04

Best regards,
-- 
Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>


