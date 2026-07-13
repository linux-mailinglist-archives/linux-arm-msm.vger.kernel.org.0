Return-Path: <linux-arm-msm+bounces-118694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9yIWIoKqVGpopAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:06:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E8D74919C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:06:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="g0V/b/pt";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="bDa/UB7q";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118694-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118694-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79030303E8D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980C33DDB18;
	Mon, 13 Jul 2026 09:04:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C44D3DD52B
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933467; cv=none; b=fkz7cThitvq2cNIY8OiEWbWDZMETSGJ9bYgK1uno4RXruyIWRtlg6fLqUDYpKJnni53Jf8J32JhFeAVaSBL3VmVdvAyszenPA2luVANCK0QLgCfnfLmPHCBs3z04dUGXLgvCFv+DIGkcEFp8oM2oz+z/rNyM2/ffR3KNEGPz7tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933467; c=relaxed/simple;
	bh=3MohiFJRk7R/WUpguwJ0RoRbuy1k8TNuGFgJUfVj4ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRaxBA3A4/1gH6FK0uuk8gj5tqgb/8V/+eaThSuEouoVAvu6oZl148fQ6EGNp9OXRiQaFX+RUZD0bWbWPAJ6/7RvMZ8bE3e2M0/vBbQ55u5OeUHUkA5xYGqsgiL3Jiai7yneBo3FDVf0LLWO55QDShSOYblZ7+F4N3sl0kmiKKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0V/b/pt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDa/UB7q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NeQP731611
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=; b=g0V/b/pt7gBOpS9A
	FcIZUlgSmkt3HZrco9HVzUZPygAbgPmlabCne12CbH61CVFRkW4NjxNnaJ2Lb5C8
	HGhnDBApJf+KLd+Cp9yGoE9B/fGTPtqlQXh+fKo4veuBM0VGOr6x/V0Vnq3tA3OY
	i61ztCNT06Uy4mNWe8v2GTvPEFn3ODtaqu2PZ67eIXi7KkmrMWH6a7A60UPz0juw
	6Uu1n4PJ6GYxewUXClb3JmlH2qziy+jttO+/DbOWwnISI8bNuxAvKRfNHxuFR53D
	wCwn1B5iFTpozcnzLSH12M7XYeuB/+GLBUzmT0iOz8qJqZHnb7xmmFi+hAGNHMxV
	UygTkQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39rvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e095fd889so853475a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 02:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933465; x=1784538265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=;
        b=bDa/UB7q7lQRcDEFosiSHeZaPAqhI6MTR30ujT9Li3glDc26oRWF/siFS3790hcKJ1
         v/uLj/CRvFQYfkYEHdcTUmpD7Y5hekHPBabXA6AakH3AkX2qMLb+JZ4Za0huoRgzVYSH
         DM2E5JgPE+iylgJr/tEzhkxMJyivvtV60KhGiATaEilMghUcFuW6EuKMFV2z55bZbQDx
         6KGnpiLF5v4Cs4Oqo7iFa7screi6pV+Rflg4Q6kfx2EJABE1JYVX0D7xxdPhIDLbOkRW
         hAlaN8/Z3Z+fN3Wwa5ZXivQnfH+k3V4Tiu4FlLZcexQHUODOHjiWoNlpLCC6tpnG3GWe
         5mOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933465; x=1784538265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=;
        b=Md84fgU0rj3TSKUYg+3b4imLoG79xJ7ZxfV8TGAkzAc2bNDES84JMNEOiLF6yCpQlF
         MY7q2P6kk7U+jl2wNan70IJSD4PUJw8GMoCJC9cR6AyAkTv5zTK/dQ+SbTcMm9peJ+5k
         UZv4SHVLB7DChNM5JfihcNFhRmOEBas7T+wscdyyCBgVHzQK43LszsHokJiiI+LhrxXo
         E1L7CFyv1Gg6Evjkh/ndvxWIalTODSxcOIHDEJ82oYZuwWOAbgKhGhjadydJuqPr+MIO
         iH0lJmTFqmRPSPDOEAl3VCPHoX+U/MSsoN7yO778m6kT2opKsBFWnGff40lQpH1JFG79
         RC4g==
X-Forwarded-Encrypted: i=1; AHgh+RruGnnI84k6U1U7GVK7LJP9BMvcTEthWziGxED+74QLDgyL23GP3UxAuHr+05WDJIn5JR8KWj75IuTYGcVq@vger.kernel.org
X-Gm-Message-State: AOJu0YydprZLg5i4N8yIMRHEzrrkoDP4XD2Me0TdbtPZhr41/Nkfk2gI
	2R5HJ24JzVyCN9MvNYz0GCtZTDqpoAqflO6qILSzDldbn0kjqYeXkrTWqm+h+fHmjI8NxPFve5y
	N5sOcUwWUzzaUs+aLXX/A/+Tds2/LEVCSfu5ro9anoXo1EKfZVwHSoN1jFW993A6cfE5I
X-Gm-Gg: AfdE7cnetE5BEy3DvJgzM2XtbCgxKZEBOeDpjy7PfWuWAP/cIqCYoKYT/4+bKHVdg7E
	39XfmdJYdK44XqBTk3sJx4lx4EgWg8gBuqQh1Gq4x8A+2aZBpBvHcW3mm/LUSSy6mWXFJ+eOtqM
	a9UVnJG5bzWhSJWb7+rbb5WXIzz+VAbpHd/oKyGmCWA/ZOFEpkRLeGp1a9RptN1oJoyPIkZ/uLo
	bRhvmVKMmN4w4WguGbKEBn2noCqlMmcQmACauH+HwQc1rohq7NVIKQ7Ar2UX1zsL9oE9iH5hyTP
	p8IQJlDxCiqYHePlEWykyy2Qilvxg916nMaoAtV2tBheW6kF+zAqAyngXCDShNUHE1k5x0eL2Qq
	/hEFSLTDeLm43Ze+eH4fKj1soCttb+27EGlw=
X-Received: by 2002:a17:90a:c106:b0:381:20b:a9ee with SMTP id 98e67ed59e1d1-38dc74cf96amr8305956a91.14.1783933464693;
        Mon, 13 Jul 2026 02:04:24 -0700 (PDT)
X-Received: by 2002:a17:90a:c106:b0:381:20b:a9ee with SMTP id 98e67ed59e1d1-38dc74cf96amr8305915a91.14.1783933464259;
        Mon, 13 Jul 2026 02:04:24 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm43504435eec.25.2026.07.13.02.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:04:24 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:34:07 +0530
Subject: [PATCH v2 1/5] dt-bindings: clock: qcom-rpmhcc: Add RPMH clock
 controller for Maili
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili_initial_clock-v2-1-79548f0bb58f@oss.qualcomm.com>
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
In-Reply-To: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX+OVrp4YGYfxQ
 hIBLqt5xfd2gHOAbes2THBwdjiNMFaSjzq0y55lIv6TQCwKGdQt+l9XUZNOaznTa2avsxxTcEV6
 gZYl+ltv8smF6snaJRiALuj6BdjW7NxFYPCoCUWhDMSwDSVKeyKv3RrAHiaPTtll3AvEnsPDo/b
 SjO+3kXY/gA5qovstNCmiNWlSqiM44Y0kP3e/AXn9IJCvWVkpgTR9gq89NH/CLNF7m/4EFQhzLa
 ZTJ792o+0jhiqlmCkHg2CPb5G9Xhz1A9Icjk2nouAsSvDdcm3Glm2ouVDi8C9zjIHLaGM9PLWjW
 W7b13yakTF3vziJakhHbBdW5kP8wvdaXIASLMxQfuzJttVADMqaC2f/OlaOuO0AMMucjkl1UkNd
 8qqNmS27vfCTygMbUkmQmekehXuUIbQ6HgVOiQJg6zX05aTXV79v+0YKoCgLwfXPqdjOjEdlWDj
 NeV/68XwXhWQE5xXRLg==
X-Proofpoint-ORIG-GUID: Cbb-J8VX5th9uS4fgxH5zbq3zn3vvSue
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfXzsUXHGlqcOkn
 HOk6RnKmW1XDjTVRsjGbqpurL4yqu1bjgnJG4UW1dfufIxCDvcVgW77M1wvPk4jS1GYlRFmiIAN
 o+UAlp36jqvYi3G4R3RXC/sr/5EQQyc=
X-Proofpoint-GUID: Cbb-J8VX5th9uS4fgxH5zbq3zn3vvSue
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54aa19 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OozyDhJeiyY2DhU_uTUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118694-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02E8D74919C

Document the RPMH clock controller for the Qualcomm Maili SoC.

Maili SoC is a derivative of the Hawi SoC and the rpmh clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi rpmhcc driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     | 65 ++++++++++++----------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b33860429527246484560823074f52a9159d..2b446aca5207c9cc2922635b0539f2d2f926ea0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -16,36 +16,41 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-rpmh-clk
-      - qcom,glymur-rpmh-clk
-      - qcom,hawi-rpmh-clk
-      - qcom,kaanapali-rpmh-clk
-      - qcom,milos-rpmh-clk
-      - qcom,nord-rpmh-clk
-      - qcom,qcs615-rpmh-clk
-      - qcom,qdu1000-rpmh-clk
-      - qcom,sa8775p-rpmh-clk
-      - qcom,sar2130p-rpmh-clk
-      - qcom,sc7180-rpmh-clk
-      - qcom,sc7280-rpmh-clk
-      - qcom,sc8180x-rpmh-clk
-      - qcom,sc8280xp-rpmh-clk
-      - qcom,sdm670-rpmh-clk
-      - qcom,sdm845-rpmh-clk
-      - qcom,sdx55-rpmh-clk
-      - qcom,sdx65-rpmh-clk
-      - qcom,sdx75-rpmh-clk
-      - qcom,sm4450-rpmh-clk
-      - qcom,sm6350-rpmh-clk
-      - qcom,sm8150-rpmh-clk
-      - qcom,sm8250-rpmh-clk
-      - qcom,sm8350-rpmh-clk
-      - qcom,sm8450-rpmh-clk
-      - qcom,sm8550-rpmh-clk
-      - qcom,sm8650-rpmh-clk
-      - qcom,sm8750-rpmh-clk
-      - qcom,x1e80100-rpmh-clk
+    oneOf:
+      - enum:
+          - qcom,eliza-rpmh-clk
+          - qcom,glymur-rpmh-clk
+          - qcom,hawi-rpmh-clk
+          - qcom,kaanapali-rpmh-clk
+          - qcom,milos-rpmh-clk
+          - qcom,nord-rpmh-clk
+          - qcom,qcs615-rpmh-clk
+          - qcom,qdu1000-rpmh-clk
+          - qcom,sa8775p-rpmh-clk
+          - qcom,sar2130p-rpmh-clk
+          - qcom,sc7180-rpmh-clk
+          - qcom,sc7280-rpmh-clk
+          - qcom,sc8180x-rpmh-clk
+          - qcom,sc8280xp-rpmh-clk
+          - qcom,sdm670-rpmh-clk
+          - qcom,sdm845-rpmh-clk
+          - qcom,sdx55-rpmh-clk
+          - qcom,sdx65-rpmh-clk
+          - qcom,sdx75-rpmh-clk
+          - qcom,sm4450-rpmh-clk
+          - qcom,sm6350-rpmh-clk
+          - qcom,sm8150-rpmh-clk
+          - qcom,sm8250-rpmh-clk
+          - qcom,sm8350-rpmh-clk
+          - qcom,sm8450-rpmh-clk
+          - qcom,sm8550-rpmh-clk
+          - qcom,sm8650-rpmh-clk
+          - qcom,sm8750-rpmh-clk
+          - qcom,x1e80100-rpmh-clk
+      - items:
+          - enum:
+              - qcom,maili-rpmh-clk
+          - const: qcom,hawi-rpmh-clk
 
   clocks:
     maxItems: 1

-- 
2.34.1


