Return-Path: <linux-arm-msm+bounces-91574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKmVMix6gWmOGgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 05:31:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F645D4674
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 05:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1FD3301703B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 04:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781317263B;
	Tue,  3 Feb 2026 04:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dD0ZtuZ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acvM+i7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DF613B5AE
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 04:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770093098; cv=none; b=mWKBxFvpImly0x3HWn3Q5GxT4EbgH50q4t4FmSR34p3QyeGBiTWPKdKelLYr0V+r8EoUobRO4zqL+knF3AVoZydMmCll3x2hmWhcBYs0xy8ZKV3JfBFXuV/0VjS4WzZ4P9R/PaLHigNvmiQllkEulnySJJzvHHXmNplvA6vtb7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770093098; c=relaxed/simple;
	bh=0IS5ZbUpMH2dbsBgyEy8vkkwfL4ha52EhcOchSdvlu0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XzAkqDVrpzk7lTiNy51sGAJJgDIRCyQSjuTRgTAZWeZ0yl438OlzNbsN/7ybUClq0WIp1pSzp1FxdTSgE/Z/x/GeXkKM+dJ68NHU8B7fUCM5ElkfYw9QzCGn5YW3LXmgQHkuOZ/G0RP710gOJhSgZCDgbUPFVDkML6WaGjY8DWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dD0ZtuZ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acvM+i7s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JdcAY2848639
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 04:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CokYZsCwCpmalk0n6jBUnC
	2btsYencMNEWeWKPmDJj4=; b=dD0ZtuZ1kamlmfW33R6Wr4rUise3D9O+Z8i9Gd
	6ZyiZjcOfjjJKAtrT6PlTg8GFmwYWYSIGjMO/Sp9hfQL71pKPEvxu2jqpAshlJ4N
	TAeOtLE/Z2bDNG0RE84TTDI0CQHt2fmVic2B6RwIYg+DQVedqR7NJk1GwlubyAEM
	P+KK4rKgIOej3uLWEOW2RhSbvw+KROEVSVPSVmAI9zVCHFC38ZLvt4VZ6sgC60i8
	a3lhdImhpuQ3zTqWQ3jDwO705j9hH3j9XzssL+402RYMLgpmqisHCIlirBlDTHzj
	Uj7rOpTdt7s8sElsjQqC6fdzEM5sEfWC1BTEAfD60VsPi6jw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tqtjwtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 04:31:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c5e56644646so332545a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 20:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770093095; x=1770697895; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CokYZsCwCpmalk0n6jBUnC2btsYencMNEWeWKPmDJj4=;
        b=acvM+i7s2f6ohJYL3BHpjRiK19s6oqTDpqrgUc1XpOjVcmtLmLZIL+Pcf/TD3/zzjn
         EP1iKfoS0TqOd22+4u9nNxCocISPxve8XF5et0WqNgotLFv/QpdTjApNj21D3pHnkYaf
         dwKl7SrgGzOfacEtGvDef0Hq1cRZqi7/nv638NNG4Pe7eWappdc6hfKMxKFPreTgsgOM
         L6laTMAkTg23qKPxmY1UlZaoEE3rZS+qGm2r2Xas4v4UT5Ed5R9AfdUOnUlYVU9hadHw
         iH5enzsaALTy8Z42nZWK1UdaGbMSro6Wg0fxOTyyPU2wybGyzLxtS1eMppGcCddWUniM
         iV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770093095; x=1770697895;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CokYZsCwCpmalk0n6jBUnC2btsYencMNEWeWKPmDJj4=;
        b=UEVZI40xOAfmRHSdQoqJnApXbj2JN7NUzFpcsvoVKi6Wx9zUfqKylVMmElrqbK1klm
         ATHZV/Fx6UUwHZtoCcSJR7d6QpYSxJBvTeHVXhoxatw4Mxk8xBMIZJT+OZnEVi+sqpY0
         /wUjdUo3YVH1wNOeG/6JlVJA/LaaPOxH4FZcARjZ7feswHV074WfMY9FvR9MKKIROJjv
         K4H4RIRWD/8HmqezP+DplzDGhLDa917OZCx+SPx5ORou80Txa+mWTRMBSpQS4ooR7930
         lUJ+kZkb6LjrhaHmxoxtj59stEBISUf33QZ0PXhQQ5qd6N9uzkzUHwcR09xx0yv7H1fB
         Y5OA==
X-Gm-Message-State: AOJu0YzFDsWd6odcmxh3qwg7ZpzUVIMJx1zkhhv3jugJIYWsI50SeclK
	eTo2YExFd4rSEskTzFIDsEj2NerOJjtjI7ndt32L6YsIAF+2LhRLwg0iEWjG8F3hS95INoGWavz
	jHI6BcRFLStGJWlhscGOhWgqboYWosHG2MioWTc/0wBecJOnU5L4jFUe00JVHUayVYm4y
X-Gm-Gg: AZuq6aLZoqVdeTeY6s+BrZnsfr45YHWTBJlgBYBZpB+GJlTQl3BirJ+2ikhWArnlx6F
	PdxrpEdaybIODRVkyHJDOBvglUQLTZthnBNen/gNMOiuyZLx0nMGirsLn+6G57cDv55A5EobsCs
	hkifBj5KtQsS4+Laap6w7JPmpIzdAIvKpiyYIpPnh62mQeXg7OZvChoLyfOMXTnSDpy0uIhnuuS
	rk/2MSx+wX2FKHIzYbbGqt+uvjpcUeKvR/ahpFn2lE4defshNpr37iRABI289//BLVJuVvrlRAz
	hGeADj3W1gUIi5TKZzrWEBS0B4Jt3waNQ8TrU7UEJ7sFvQHvoJwhVPAwCu95DG7f6YZf0EO/Zkw
	cNWimGsuAPmjhOWCSRSyaqemxWKIpCnHMWKBZCwxTd+B/hA==
X-Received: by 2002:a17:903:ac8:b0:2a7:cb46:7069 with SMTP id d9443c01a7336-2a9246acc23mr12325945ad.25.1770093095364;
        Mon, 02 Feb 2026 20:31:35 -0800 (PST)
X-Received: by 2002:a17:903:ac8:b0:2a7:cb46:7069 with SMTP id d9443c01a7336-2a9246acc23mr12325795ad.25.1770093094726;
        Mon, 02 Feb 2026 20:31:34 -0800 (PST)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4148d0sm162487605ad.27.2026.02.02.20.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 20:31:34 -0800 (PST)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch nodes
Date: Tue, 03 Feb 2026 10:01:27 +0530
Message-Id: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB96gWkC/42NTQ6DIBSEr2JYFwNYf+qq92hcIDzrSxQsT02r8
 e6lnqCbSb5J5pudEQQEYnWyswArEnoXQV0SZnrtnsDRRmZKqELITHJ0dqE5oB74CNumHTrgk0H
 gZW5tlcsub8WVxf0UoMP36X40kXuk2YfPebXKX/uPdZVc8DYz6iaivyyquydKX4sejB/HNAZrj
 uP4AqSsOSzJAAAA
X-Change-ID: 20260131-industrial-mezzanine-pcie-75dd851f5b04
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770093091; l=6437;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=0IS5ZbUpMH2dbsBgyEy8vkkwfL4ha52EhcOchSdvlu0=;
 b=CEqkWR5dK9tJxQqjO0cwGCZU+VWqklscYjZEkKg+7Os0jF83diqx/WGuQvIm+MgUgZX9qtFLK
 x2dqWDan0ckBJpp2mfNzIbHS3gJrHsX8b2um7SJDtpezAeuqApRcVMo
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Authority-Analysis: v=2.4 cv=XP89iAhE c=1 sm=1 tr=0 ts=69817a28 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DPOz585mkp_on3fXeyYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: pTTBbBDOb8AXheAnfyEM9wNGaTFCJqBA
X-Proofpoint-ORIG-GUID: pTTBbBDOb8AXheAnfyEM9wNGaTFCJqBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAzNCBTYWx0ZWRfX87t3rYSxDHtN
 74Fea0p00JZ7n1ptf+jnDOOx7qtzGoeuxfWp+BsbCe0+9RzXJBuCV9cdQwG9/H7WEhBmGmL3VBK
 Nlzq9C5mCrMmd4ncOBx+P2MamQXAwhGBh3jAMhn6aWiHFlFuUPvMxL+2Zr5oRIFu8HSs+mQi7bw
 j+OkdhlRybgubx1QbSQBLQDBFE+qQ20Khg49oGRIACoG5FSMQdSyvmeXN/8WRP6u0eMJlu8k2Hu
 hJioZevsW0wX1LuxqKGN7zHo5lg3YBsyLumIfG95rnG5IdhZauZp9B4qSFTOniRIk5jKKNmeNfS
 veDsksbzzydZBWN5JEUIiHnwI6H66yYRliJRKZ7dxa0M3enD8hMTOIJgS6N6pD6Q1Sq5kPiCPWP
 A0LJ9rwaT/zaijXPHCrR+XfAyMtBoVgmJRGUUOdtqJA6AVd3M2AGRh19uF3rI0ycHhC0Vu/devJ
 WmUr7dL/I/PhXiW0e4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91574-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2F645D4674
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
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260131-industrial-mezzanine-pcie-v1-0-b3c2905dd768@oss.qualcomm.com

---
Sushrut Shree Trivedi (2):
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for PCIe1

 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 234 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  12 +-
 2 files changed, 240 insertions(+), 6 deletions(-)
---
base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
change-id: 20260131-industrial-mezzanine-pcie-75dd851f5b04

Best regards,
-- 
Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>


