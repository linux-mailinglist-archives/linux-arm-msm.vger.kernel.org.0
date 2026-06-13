Return-Path: <linux-arm-msm+bounces-112987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FpeuM1sQLWq1aQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 10:10:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB8A67E132
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 10:10:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Tywa36MP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N11BM1pB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112987-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112987-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 941F73092380
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 08:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253703C3425;
	Sat, 13 Jun 2026 08:09:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF4137EFFF
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:09:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338198; cv=none; b=Jl6vMsQ7+1sCFFRPG+sDdPNTANh+1C1nP1EgHaFFwAr/RmVo8HTLWkry6gRSPWctpK+YRzC4U98nd9G9dZbBZ0BYpCHKqjgATSPp8N+DTb3VZ/t0T20xl9dMMQ1QGUqrNax9SHJGrlA5BMiMVZBs8t0e4kC+Nv1iWFPhx30/LJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338198; c=relaxed/simple;
	bh=+7laVCDEO1nBE9uR5JZO5I+iOzHGe9JCa3pTLrz/6bo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XWqjz5teopL6wmU5SI8F3DuoyYgRI0TpB7R2VfLTvBmIRlKOt/ykIyMIUv49x46/B4BfOGWyHFpE2CRvUva67ExgfaTvy7uhFPHQMvX9FzL7gtdVgktRmImIlnh7DNp9jSBXdZFU7dNksvpTfxeM7TjAOuFft/DE+0EndBqFCfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tywa36MP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N11BM1pB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D6emdI1760381
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AWJntzIPAF4nht3b6zxnhn
	bi368k/yOuvIPyr67PFG4=; b=Tywa36MPYyvw1mAGz04tUamfNgZThkF1EajU/Q
	IN55PYIeC+YHSARqb/kv8YIeYRL/LmhjUMoQES2dIKtOF2H1BS87UjtZnR42HrVL
	9kCtd0upba1YU/dYFovkryo+YDl19fZqXluQvlr47Qev90AAyUXkXBgbpGGrjddC
	zdHLQBnT5cKl3Hj+m2oFxf5kO/kcsyptya80GecdZ+V07rj4pY0VVkFNxHOenM8r
	qpmu/ko71Tyejl5lHcdN7MLyeKnEUbqu5RMtp9D8qdSv8iQCbMJ7KKdfioqO3eBB
	eR+1gj+M7DE3ke1MN2nzgk0vXut/4trRdB3BEsg2wgWgA2uA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g80ch3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:09:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842692bf60aso2329136b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781338195; x=1781942995; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWJntzIPAF4nht3b6zxnhnbi368k/yOuvIPyr67PFG4=;
        b=N11BM1pBiFJDfZqjb0QmyHb/SwpI7tch5cn/GHy580Ijic7ja8Hb2H6AL7iwaZ6ne4
         D08QrkirEXO7HKLIVNXPdv2wq60ufaNhMdPjrHd2YQQwiSG8SnELJDt/psHEV2qqbZ4n
         DcuEmo4EUUuYptLYR4mfMKa4pfGcT4JlWRlRf/jo06RtJJCWEoDVEwdgwOAgp7BZISvi
         fISytIqtNNYxi4/iCfkw50GVd1ZEXwS8MWMj/baE0tRWxcHYMVwJJEhW5ulgBqgC7ZPC
         Vo3sRDHoczzCwNcJao2Q9jo2Bw5GQ58jo4vGrb5JvM9eXzXpCAUhHInUWAfvmxuF/bZJ
         I/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338195; x=1781942995;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWJntzIPAF4nht3b6zxnhnbi368k/yOuvIPyr67PFG4=;
        b=Ia3TWdlw2PuqsYOAPI+WxFrqixCUyAWF64vDEvCI1qQ3u1w/PNdtSNBXujrJXQ7CU1
         rd/OIdDrHm9ZnFakF5Fzh7pov+iJa50D5Hhoqk/3dO1kaJ4UsAG05q0EcHJ3D8OynGh3
         1QNdJSHk/CqeqqI0zqu3Si0kf6xLoYm6+8nQ+ioSwM/5OMGK9rpYTcjGCl2k+K9LlytO
         vRM0OE5yPjqcbxWeBXKsb+6j1y11UmaotqNJavBV63/RiTJSypiNtuHwigiG/aiAuNi7
         vjXvN5mXESB9g/Uh/bHgGiEGQQ1m9GGAFSW8aASJiDn0etjO5Io4Co9xfNmNr78V346t
         UEOQ==
X-Gm-Message-State: AOJu0Yz/qKGPR134hZbCDXDiteUHPoBiKnLgavnOXWnvHd6DG9hdRw4u
	0tYNnyC7o9Vg0L9auyegqsp+FBThYPflZ8rHw8zT2DeLyCaDDDOaY6xjp+IlIzxlAqkYcbAOPmb
	XItrlZWLhEMdVfmZQSDL/iFBPDt/e4WKBCg/YG2YXsnwatOJ6YDJERo59gMbNgVL7Gv7b
X-Gm-Gg: Acq92OEEn3rrDch49jFDNYQEEHABTk2y9IjjCJYbYamW1FkYnB6gHzCLI7z1hNdcPI5
	6cqBC9UG2QwWjJbmJP6HO7J3xhy6aBzNTR3+2B94RSxeRWf9AzekPg7GPYn0E27IkdGfoKCz9+k
	DgVMO36+eYr8TFQlfIoIhP1ZTxAy9t/RUXvn2rhxlsukerkPiA6Vb/VgnfNZxm124oZVfIO+jBN
	EdDykLbarYAOgk3zkFvZgUzN27rizxIGLPKBdloS0sbwWS0+kOn67NgeiYAa69r2MXUEVYDEUEB
	FhmdDTCIIxXOH8UPB8jxA92I0UpKPuLcxzyWVMifMVzeWT91Xr7jaxaieVmtYZr7EBGLg7Yy+2P
	JCa5HwvJZFQIiciWNuLA9hZuJDeLXgZnVKTQt+36n
X-Received: by 2002:a05:6a00:35cd:b0:842:459b:d61b with SMTP id d2e1a72fcca58-844e1a62be1mr3040909b3a.32.1781338194726;
        Sat, 13 Jun 2026 01:09:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:35cd:b0:842:459b:d61b with SMTP id d2e1a72fcca58-844e1a62be1mr3040888b3a.32.1781338194283;
        Sat, 13 Jun 2026 01:09:54 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9dc5esm3926647b3a.10.2026.06.13.01.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:09:53 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Add PMIC thermal support for Shikra
 platforms
Date: Sat, 13 Jun 2026 13:39:20 +0530
Message-Id: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADEQLWoC/y2N0Y6CQAxFf4XM844ZQDrA0/7Hxpi2lHV2RXAKx
 sT47w7KS5PT3HvPw6jEIGra7GGi3IKG8ZIg/8oMn/DyKzZ0iU3hCnCQl1ZP4T/iETs+6jJNY5y
 tc76Bygl5YJOKU5Q+3N+jP4cP60J/wvO6tCWiXJdkmz8xM4gqvm1ttrmKzWW72d7AOgsETFXd0
 d7771F1d13wzOMw7NJZZwlV7PoIc5sJu7LJCyDfI++lxL6shJgRPUPfENS+Iqxzc3g+X/Zqg8k
 HAQAA
X-Change-ID: 20260613-shikra_adc_support-0079650eb76c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781338189; l=1622;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=+7laVCDEO1nBE9uR5JZO5I+iOzHGe9JCa3pTLrz/6bo=;
 b=v7tjxhob2A6FDGE6d7h+znfxPdaRvPLDP7T8DrQD9KqDEPwLo7vIKyka+FA9q6wPndNJWyDIv
 sddBRFpD88JAxCx9WXOhDikpxiK6OxMUNVJJ7YITqHoO/ZvI3Oo3uXc
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2d1053 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0ecBSjoEOrMiUCtx3tEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: KFxLsL6-5ZcMBOJ-p_wS2sqcaYDR3mOu
X-Proofpoint-ORIG-GUID: KFxLsL6-5ZcMBOJ-p_wS2sqcaYDR3mOu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX7z112fo36Dy/
 ODQxSkM+w62ngGTyBRTTp4cp/IrsSTHqkDNsDf00Lzqz2R0+kMRBd1+0N0kGzNeKHc8aLPe1E//
 OsYZM/siO3e1L/z4KmZzOY5W9OZOu+bAlhFIrAyw+kmZLgyLF7pVBdRVO+/LB2kMZy/DrlfNT8x
 KosksNqjy+ZgqdwtEwsJhFkYYRjzr7mYQNpvwPQV378FGoViKzdgixhnIyuOoSzL5XBRzXUh5mG
 H29pXSae9bE3jjPlna+h2HEuEDVfLlFwu5SrqsKsMk1Ugz5cVmYCMKuKJ1V1k4YIqyRbueX9hm6
 QGaWjQ5urugP36wzBLfNYxDF4GLRGWTopoU7k/7zdhJjqTkbAUCdiuDn5gKc8SvDb9S+bqoqbS3
 YONDPHG+YurOiapEL14DV/9hY1qRgl31tKk/dydoY1pacMhjfy7eMidPYHsxoMOQpxbuRuRsHoc
 Ge4zljr0UoaLvNu8b9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX1ijwC9p+pWCh
 LQ7FzCEsQYKGEupJ8qqclblalXiEq78dH1qjtL4XF3P6Wrc3I1EH/xWb/Sq3cvWlYFgNwV/JwJT
 3O7a9RpaIxtF6A81F6pype5PYfFIImA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112987-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BB8A67E132

This series adds the following:
- VADC and temp-alarm devices for PM4125 and temp-alarm device for PM8005
  which are used for thermal mitigation on Shikra CQ2390M SoM platform
- ADC thermistor channels and thermal configurations for same on Shikra CQ2390M SoM
- ADC thermistor channels and their thermal configurations on Shikra IQ2390S SoM

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Jishnu Prakash (4):
      arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
      arm64: dts: qcom: pm8005: Add temp alarm node
      arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform

 arch/arm64/boot/dts/qcom/pm4125.dtsi         |  77 +++++++++++
 arch/arm64/boot/dts/qcom/pm8005.dtsi         |   8 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 184 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 ++++++++++++++++
 4 files changed, 382 insertions(+)
---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260613-shikra_adc_support-0079650eb76c
prerequisite-message-id: 20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


