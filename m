Return-Path: <linux-arm-msm+bounces-113798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 10n8OHQpNGpAQQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 19:23:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A45F66A1E97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 19:23:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FaI1f9GL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qbs8w8iV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113798-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113798-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20164305454B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 17:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA757348C48;
	Thu, 18 Jun 2026 17:21:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B2E349CEE
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803316; cv=none; b=EDDkP1jl/k5ENXfnX+XGWMQjrbvsDrgCMEpJU+caGsWoCBrGCYgRIpF2xhnqKgR8z3yl33EhLYp+d5tfyj9U1UCiofUS/GK4FyxmideTS4ZBLIgfXw5VlcKgzbBXMyxkuc4VyYhlrrExsH/fYMA41ZDlMrneoSkl4qAn8CHdLjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803316; c=relaxed/simple;
	bh=Qcn9omGlfSZM1RD4mLtu5/9tTLSglTD/Uo++QbqEPG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUJ9yvv4Ty9qNn9aMP2UlO3CU+hb6tHtzs3aSQ0wZ+6M/UgV3xbQqjZkCkaJL8jrfj9+EFufoty4yNXEByGV+6r+IOkKR+ia19vZ3dhpHZ86GUVENp5cTjECBcLhNwjEgxJl4bbisTX+WJnOaw7C0AJ0n+jMIL5xKQnMxGxTD8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaI1f9GL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qbs8w8iV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IFGUJm2094563
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YqcW+WgA+mITj8DAGt88WnFHZvZ7J25oGo5K8j/ix1Q=; b=FaI1f9GLEbHxsJQr
	e2EVwGZO/eBh7Ugc8tmgJDpcdjuERW4Cef5SbPk4YqaZfCs3tSmkTvyNUw4arhzm
	yIyAkQBNbcBz9I9yc2Fg/PFqOLphSmt087jX9W+DsL8Mk7aW16Hhy6sFe6jpsa9S
	jYtxMwR0sGdErPC0u/Lue1Hwn8qJ7h+6DeTyYu99Ke9ciLoY6VsFwQmGILDMHX8i
	nZrarzMEanlX5FI06+PVc+SN487MpmPt1qC4PLcZTRAaedquIm4ZHL98ojoxGQRN
	hKFTVc+4I5pQXgvIBG+9k4oHPN33i7AYupJa30symh90w4GsFEyUfsKUGCuuPUph
	xlcDTA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a4k1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3772b6b31b4so695703a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781803313; x=1782408113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqcW+WgA+mITj8DAGt88WnFHZvZ7J25oGo5K8j/ix1Q=;
        b=Qbs8w8iVlmBLEkjMCtvixhvGMAk8RN76nu3iq8Qn1vbl614BfHo+N9t0U9dpSKDmw4
         ePaX2vVoLBMrCuF/IXw8uv6ezKlqOAk70tsWGL7FbNgMbbwKMT0wyxBBkqTPo6eaq3eC
         xxpFeaEaIEzVOpHV0wpbMpJDiGGrh+5QEJ79Lg/4flvAwkQxtnnt0QVPM1wG/J7+yMOP
         D8JA0aeyonH1QHFPo+bCyo82g5r4X/jY5iBchBzFPFfNbuYBr8YF4jtZFh2trqe1sdnn
         nICi7xdRtCkd6RJ2bz3f6R2E3K4RVSc22TOIRwWU2aPeFl8sTq0F/HXu38KcIWxS4C5P
         1/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803313; x=1782408113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YqcW+WgA+mITj8DAGt88WnFHZvZ7J25oGo5K8j/ix1Q=;
        b=qSjbqLc5cZTmpZQ6U5fiQ/9iFp91NO8BvJbtHcjpbyoxbkA7eskRRghlTDKU5VYsmV
         gjtavGMEPj0PE2g6hMtAYToqgN4T1MHPM63XSlw6rRN0Gm5DVPRsOTnFLsMIQDYbBEi5
         sbAPH+6hgHR6Uo4o2X4MZM3fc7f9mBhnQDBJSb3KE3lbNGILTlc5EVLTkgdPeWVwh6fo
         1dFZR7LGbdOvs5E59pq/1FnP+N/sUgr7mfwPpRzEqGeSObx2Oj9n79wgqckzPLY3EfkU
         Yh1o09SwwuqT7H1s/E2vMH5uEd/0n+gf7XhvV51557K9Kk4/ZcnW/NsSSCYJXSJkxrnh
         3VAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+W2Rf2N+TivFXUdouS54JCcB/lYS8iDWsBbOSRyxFZnXmlpGfX//vBsW/VT22rSOu6XyJyzQfWBWENZWTE@vger.kernel.org
X-Gm-Message-State: AOJu0YwwRoCF2z5m9Xydm5K3vyAzzRcRSrt/UmCr5WDcmOo9QBYbNhBA
	Zg1u2fU4OB0yDH3Lb24TiwqD7k62Kl8gq4nrCHMD52X5cfpA8EdWxJNG/eE3V3LizIoVOHY0zn4
	EzUIm+NKaOF0Qhij1uO7xLQzaksCXweB2s5de5kU/TS5qX3OdJOlsVwvo33gEvTu1RMff
X-Gm-Gg: AfdE7ckD877y+T/7klkz+lkrll2RnUTp9hd30WCTN+b+T9DQUdB//F8CSh58Ykaeh9/
	s8S/1Ixaim/5wm1ed2NxuOQOId5bKKd3yu14/G5VUdhXUUMj/88fkt0n4h2uNcDT7eJ3EXdFmWO
	bSmNHrz5X8UKJkNXNkkbKTpebwI5+bhvHCRNafF3BQybn33ZSgh8cge6dgkPeQBrStPRSHObAAT
	vx1bx577I7EE4Y5uUusp7Z9IdbKvlIj/SeXcoHnRJlAwXJtKDohUriagMPFGFl8acBjL1WZARpB
	5h6XWBHdfKjALLJIA+y5aAMvgrU3y0x5qNDNhgY5Y7/zfKc1dq1rrTCLGS68ZdThjDcStyfOJko
	7OpDLHYDAHvJbl8UhsnfQ/+C1giv/CM/i0dw=
X-Received: by 2002:a17:90b:3c85:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37d15e63243mr359565a91.14.1781803312749;
        Thu, 18 Jun 2026 10:21:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3c85:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37d15e63243mr359520a91.14.1781803312329;
        Thu, 18 Jun 2026 10:21:52 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm187129a91.16.2026.06.18.10.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:21:52 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:51:20 +0530
Subject: [PATCH 5/5] dt-bindings: mailbox: qcom: Document Maili CPUCP
 mailbox controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-maili_initial_clock-v1-5-d6ede0352113@oss.qualcomm.com>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
In-Reply-To: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a342931 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5FXc3QUEpXE_4WiDhFYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfXxnVg55vhtdSo
 3Bbalij+gwKM0rftVm6jhNaM1iZSahgdCjB22koZCsMu5PKh9X2QR0DHLt663ioAyJ22jMeJ/Lh
 G0CUQRA5pC2m6yQ80iMKoEq32ZrlON0=
X-Proofpoint-GUID: quij7Eq7F7OgxkR0m3BxGDV9tEay7zXJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfXz4KOZ42pTNxR
 uEFoRcMt0G0rVPfG6++EVstV6E+3M7lJSztMlGfwbixs4q/53KpxoTpiEcVtti3saCDDQJB7o+R
 ZZZceUz+a39fg0DNgLTh7dCW2vQJejxK9R28fvsmfycuCjbwJdop/Tn5YTM2gXxQGhGIiq+vAJt
 hfQf8L5J4rE+Er7lU9KQT3I1IhA8Hr0A8nfN5nNrCqD+Js/X81hDRqhlal53Ucb47/p9ncRGuJG
 kyAS7rFUfgNmUIguhHBZ20Iutx/ht2UvCwtlVlS9IPao2gvKU9okLCfjQ7+0t7eo5JbNVv77qZO
 v2JkRjcM49WVnr07Q5eT0cybJNpySn9WIhuZcU301WER5AKKEkKAVJF3E+DVK2E/Nlh1LC7tvcz
 II+vwr0i2DngN6V0vCVL//f1Lfs+GDGknFpp3Wz5RE21q8IDOMEu6LdM3p1fbtQwEPFDnbZcRxm
 LrhXu7zNJ4uEp5rws6Q==
X-Proofpoint-ORIG-GUID: quij7Eq7F7OgxkR0m3BxGDV9tEay7zXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113798-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: A45F66A1E97

Document the CPU Control Processor (CPUCP) mailbox controller for the
Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
mailbox controller and uses it as a fallback compatible string.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 03359479d926a623c467f1b8ba857d787366d411..2185920e1b5d2154a23b67905106f35e0b71eee9 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,glymur-cpucp-mbox
               - qcom,hawi-cpucp-mbox
               - qcom,kaanapali-cpucp-mbox
+              - qcom,maili-cpucp-mbox
               - qcom,nord-cpucp-mbox
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox

-- 
2.34.1


