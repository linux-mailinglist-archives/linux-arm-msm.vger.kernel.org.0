Return-Path: <linux-arm-msm+bounces-116112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AmPBIY2wRmq6bgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:40:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CBE6FC306
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:40:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="eRs3y9/s";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GlY+4BtF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116112-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116112-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16DAA312A470
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195C534F270;
	Thu,  2 Jul 2026 18:34:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC47361656
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:34:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017282; cv=none; b=b5cXSp2Z2365R6FA/a+oojTo4L1VhK9KZCfJ9E1CYr8T3tV4uRVsaVNKUU9jmO4kq2/WpOC6guAgQF064hkvWBqiqxXEcas18cRe1EoS6E1eh8siUGk2vZSh9GXPSOhcZd42yCM9VQU0qIvq9qeVj4A4w320Z4vDFoqHV6eb0h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017282; c=relaxed/simple;
	bh=r03mqDr0zXMme2eLh3UMMNhL93L+E55I9me18xI/3lQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zyt+rIaMru5i0NZHTnQ0ed8E3WZ1tuNkmwZbbZPn/f43fvvPlcmJHvd6DZ4LT31+AY/vz4JmOXnhBSG7jptKEJW16beiD0l2A7A3wBg4kZbL8NxvMKZMOEciosl4+ky6mkLCZedE2vory8tQEL0DFN1Gd/6KMoUSi82va4ipN0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRs3y9/s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlY+4BtF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3diM560343
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7J4B2q8cWXeNVw0rOowPJSU1IEMVAe3tvg7ghlT+Np4=; b=eRs3y9/s+DwWhpag
	uE64q2zw8U/hJZgL/Z+JCdlQy+uS+YbxaoD2nk83h++dLBzwjSxi6P35pYWRXvrQ
	k6Adu7T5NRC1ViryeYnMNA9wxDaIrutaApw5sK6kB6XvtXO44pNAqUx8kN16ERRK
	P+ae9NnFxcQSkSeungLlOycvIgARiktYjOZzJzz6TAaJYvgt7AGwSPXR0QlnQnru
	/s0bA32NP3TIR3KYZapGbN49qEMkLlZTjqxw8E4DRP8DX4c8ePFVXmrVxZljKRYm
	U4snvi6m0aKWIoXiRvna6wOOYgopjYvggtKHQCpuSm1P6BTtCgYJW/YG9U2Gk8Ui
	6Pmt+g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bjbq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:34:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8478e9c4bd2so2300722b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017279; x=1783622079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7J4B2q8cWXeNVw0rOowPJSU1IEMVAe3tvg7ghlT+Np4=;
        b=GlY+4BtFbnURQyimaU7s6Dtd6krXsIEuLgGf45d4qVjnc6jxPnEh/dpWvJllCIibQQ
         YWT0QAlIJRO4vz2ZAAcWhPw0z6QMOYRVnSRCGIu9wfvyoC8Ze1NdCPx5+EKWQSurNH2a
         JhdpdVGXbSwZfHM7iFC9uFhFavGUrSn6m5uBStsfpUmzJSu0ohng4WNxwjpR1tmUpviO
         LsNoCQTOg5np7iHh7eQ8o6IadKIDFef0oyjZeDD/6tpiiQFTuKltS8r410khD6JI3luh
         W7U8+u0C0pGrpY8leB2+5mTWbnDq3oKs1BEV/6vGawKM/tKcK7uWXbiR7hu1phfJm4b/
         nySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017279; x=1783622079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7J4B2q8cWXeNVw0rOowPJSU1IEMVAe3tvg7ghlT+Np4=;
        b=I4apMn3GP7IBlzBrfvSydp1ArIoL2Tp1c3syaWADXAqu6sz8qj75DoYKRDGjoCIdPa
         GqS3sLgy4OjluHu4bQ8cM+ZzUCSTtgD7+INDPx1BXnZyxjzmCN2LKE7OoyaF1VO/d0p8
         DH9sGWTXthPWOW7ceLLC5X23AOhwlEipiB3bC+5lCo/9FCB4r2yqlk+q30vouDDHqW+q
         MvmMqYdiutzbfcUNwQAYE7Kw4ALURwrlGsOF2jcl03Ff6D4nSr66wTCES9GRYDnCd1iL
         YHYxHA0bJDdmZq5Dhl3s5u1Cg9CAmEh0r1TpCbqmXI+B0Yq9RRozUt8Kj33v7viJW7no
         gz0A==
X-Forwarded-Encrypted: i=1; AFNElJ95V9vJz3yV+yh1NEUjqgimJ8K7iH/rMc9lGnYkX6hWEixv+Ug/yuY/cTrsErk5BJx1MVYyYQKYml2zVLN9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ifPRRFZ8Bynzkq70NPfVZvwf00D2pEXHd7cEQbHNvuoXFY4h
	nOUHVLxQsW0t/Gu+hRJ/WgBsnzlS3w7gO2A79cRmPYRO2CRXqgyvc/o3o+QfKQ+kQyq1zA7ktEh
	xNXNk8vxdolZO/L7sL7XY5fL/45jNCuRW8oMaIMA1Lr4QqBAFmFCIzfppburckluKdQPT
X-Gm-Gg: AfdE7ckUGLq1CVgdcSTBUfkoJEOky57Fa+M7FrOKlWl7FuUl8rAW8Njt4RTeAbwK9tD
	kpskrfH81fCL15uAasRzdyZ2ktgjtgyNlhhROUNwq3rbTRMOsZUVfrfOc0vhdfCpcdmqJqpvTl8
	Q5yJDxVXo4FjzMcb38SEdKXimUcsklf+0TOn9ycUkO+Nii4twKIrNBD12UWnDpiVzCkKMms12Cd
	kFtjK4PS91YWEtaoLiJxmkv/sAYHTMzcZraeZ20Il46lBoASdnjQEEeG5+S4GxE7zwxaTemb84d
	DKya2N/cHGiPWLAa3ChxcTym/vhYfB/5H50Sh2LxDewBTXXl9cV5QHfr3Vp0I0dGif3yUWN75Gi
	wltHwao9JTqBb1od5G8+xWXhU7UPsq2808xPIC3VC0w==
X-Received: by 2002:a05:6300:6715:b0:3bf:b0b8:58b5 with SMTP id adf61e73a8af0-3bff422d1d6mr7432130637.36.1783017279124;
        Thu, 02 Jul 2026 11:34:39 -0700 (PDT)
X-Received: by 2002:a05:6300:6715:b0:3bf:b0b8:58b5 with SMTP id adf61e73a8af0-3bff422d1d6mr7432088637.36.1783017278666;
        Thu, 02 Jul 2026 11:34:38 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:38 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:40 +0530
Subject: [PATCH v5 18/19] arm64: dts: qcom: agatti: Add missing CX power
 domain to DISPCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-18-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: gtUNoQdo0cidlO6sh9JDlZb1ujfYI9GX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX5LUGd4rUOo61
 GLNLOWHCKoe+m1VBLElqtAc01IuUqdmNDHtr2/F6wD7/+Z7IwSSXsqCJsIB0i4PG68nifioZNLV
 snFuvqSuvQG3BVfjqYKGUFcL3SN2ipc=
X-Proofpoint-GUID: gtUNoQdo0cidlO6sh9JDlZb1ujfYI9GX
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a46af3f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CskgkK4JsQByPEGY3C0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX9Wb5yysUiCYI
 9WevvDkWfvRyxbxOlEShXWDvvJbAuWi/lk5UKf6v3txRP5gAmTd4ZlqCygvE6Vp9XRmY/TSAhr5
 GT4F17AJTEOTrHmZeD1x/+r8eiCRP3IEjaZQ1Zs0Toz95wLcKpEbQM7OkzyZK/SfpyCAvub0uHr
 jpHdLo4fEDTDuQ/bdOfvVeY8i235aXV/4TWpoBnwwoEGEQ81KaXF7k1KQRU8sqcw9QnCYFsNNSN
 tokWWcby10zRygDnutUS22IS8nxoEJa+ueUeO3yUUK5PHScz/ZtB8q48lMik60SHe2nJ2oH7hcZ
 CRfsRJDOsV90W03JIN/aiXOM7f74/AYfc6UL9A0yhI8+tBIuYJ+JOmMtUaWjiDfZWYJ5uQ5p7UW
 c1ycc3javoyAkUEdk7AfYjziGrzKfCweJiyWpbD8aHrrelO5w/e0GxPlaZszeCepVMrSRgRc/Lj
 uUd6h8+tMdvAk14yfMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
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
	TAGGED_FROM(0.00)[bounces-116112-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01CBE6FC306

Add the missing power-domains property to associate DISPCC with CX rail.
This is to ensure the genpd performance state votes on GDSC the to get
propagated to the CX rail and to avoid the rail under-voltage conditions.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f1d93f86d0a62a813f76580362e850ab847e51eb..2e8a8ca9b9d5f40fa102862b5a93dbd1996de8be 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2203,6 +2203,7 @@ dispcc: clock-controller@5f00000 {
 				      "dsi1_phy_pll_out_byteclk",
 				      "dsi1_phy_pll_out_dsiclk",
 				      "sleep_clk";
+			power-domains = <&rpmpd QCM2290_VDDCX>;
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.34.1


