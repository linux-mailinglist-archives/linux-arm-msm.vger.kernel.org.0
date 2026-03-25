Return-Path: <linux-arm-msm+bounces-99780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M/VDJRew2m1qQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:03:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DF431F660
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21D4831BE1D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59841428F4;
	Wed, 25 Mar 2026 03:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWZb5xiC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBrwYkAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832CF3451CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410847; cv=none; b=lrn8sFNLSGJnlpXaGdanIGKwAFDN4p8q8mDe85NQVoRs4S18VwMTKn5EXCzi32TpY+X1fGzUveT0Q0icoa8d1cfY6CRJFNKQsAceXV59n6GukYggBzURPs7eWrFrgunHRK8fPmygJuabN9IRJJ8yjDqfmbK+17g+esdUZOq5Adw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410847; c=relaxed/simple;
	bh=+KjoD7mU/vlqAGhGWGVLACM2Gls8RTB5jTBpNY7UISQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oj8SCopkyoiv5/bDnqmCQSh5YPV6LInSy7DVnGy6XCIpn5/XMS5/9sgoHQjYmYVuBx92CJxIWth7E9OYpSGfo2Enu5AAS+19Q/dCQab5pXJfPPZQTYTgxffapTUj/thiGI+bh7h1SmylTlLZSaUB0G10cpaoIPkJEyAoofCRTy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWZb5xiC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBrwYkAC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJnlCt2075454
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=di67ISekbvw
	bJhWpM+p15imtrW+SyyjQjZ671m+0fHk=; b=QWZb5xiC7p2mZ5gV13bNOJYB6qH
	ht92Txoa/5EqyO0OAAybey6OMfi+1c0NTMqpVXgAT7+FClKSKmeo7J2+eP1bf8+j
	Q5KkNEwLP+mVOc533w4qtVerILtPz7X3WvkxVJHJiFXkfjJqt5DgnuGxUaO2LaP9
	wt85BhDLDSaJb9mMnNh+QKXb+bdfLtMM7qL4M0SXA4gKrM8PS4fG6XCxnhYrEGdD
	dwWwBvK85MSBS08g4V0/qg+OtzsDBERBjaURsjI/jHDnSXOG+KJbRJF0slQpb9JA
	tknGKhGHTegzrAi0AE+92a523560a+wQnDOMIufCwiVPAf0+c+q7Flq/pAw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41411an7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:54:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c714cb65eso232543b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774410845; x=1775015645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=di67ISekbvwbJhWpM+p15imtrW+SyyjQjZ671m+0fHk=;
        b=VBrwYkACouO5TmuwhHp/HOciTnVLxxgdg3IP06p2f2vixix0Nbq7PHQlG1PEho2eqn
         3GJXwVVoKzJWHmx6Eqc5kBgLpSOqJkGecwHrxgG4eKT4tAWnNU5j7ZItm6goZyuMxkY+
         LG+Yx8TczWcYaL8f+nnvD/8PBkSHy529QtwK1rFOqDRbKHSvQbfLllATlWlV9Z51VxMP
         HgPpFWxWKandcfmJqgLb5r6MTZrVKuW+lDtU9XWB6XVk48UefULGhBq3WdPebAHapLZF
         FsdfHRE5cOmm1LfB1KTDvTfQPAx07B3R3O6aQrUnNQx+qM5wqJ31YYnFAVNu/JlLeR03
         Eemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774410845; x=1775015645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=di67ISekbvwbJhWpM+p15imtrW+SyyjQjZ671m+0fHk=;
        b=fHgvjchICmCnXorrqEcGNslXUrTB9LucsJ0qoIzuOnjM8YB5N1N42cwqvOcggMBgSX
         2CB0QSVjEdOcx+NxxeXUHbzCqOOLBAlEwYixghrY+7y6jBKzd0PhgaejkrS5MyqriPnh
         Dzo34M3m6yfc738afhmtxCxR2MOsVwWZE2KMcuAaYDkBTRTiptisKFnhWG+6P/bOlF/k
         8tmshYPSAUAX9++6db+cm+6Z+CAdLRmkdIZsLHpe9+BHV4pbcP1GTaL68u+sRgnnBdIn
         wmNc1XF3GC78CPJgGeMTa4SI8m1BKe3QiRQQp0/1DbLkQnc9sftC38Qx0+BIIu2ENTbI
         TMwA==
X-Gm-Message-State: AOJu0Yx0xkoi0wossQ24rbqe9ACOhxAJF+mKVkepGQMfAcs3Z0bE4bRM
	GglnxoFoNyIN2IB09k6h0kFoT95DbC5b5KtaeqP54fH3Zqq3dkV85GBzlDbUjIyu0OlSw9EOuWr
	gubj0Qe5JdS+gZTkOOJ/OKNUzKX8Ypp/BA9BLxU+I/xHNJDKXzPtRwI5e8lbPwCcCxoWV
X-Gm-Gg: ATEYQzxa1HJrbhGgUHZFNJOIJjUE47SWgg/bi+qgqPP1SEj2KiB7FedV+0dDsLEKSh4
	621HjLdFetSqG9wc6sAIKfLrqXuBdEiz5NgrMWx+X7NrV1kUfRlkPEOa2pcyAdzmlu9p53p38B6
	kggzTOH+JmEVjPTbOF8BIu1yFRL3lGrrWQrFNYGVRSeXCp4PlQCM71IY9kCutmvILfrtufb32M/
	UZv46c7lVJmFqE+6kF/pw8ROFryvMixZ9qKsyx3FIc3bntNS0nYFH2wAj9baBS7hGFmC0+BXCEK
	tME9jgk1jnrAXRV0vqUjRces62wtqsZmc/rxsF76Hjx4phD4vQL1iOLYlQN9+m0FGkF/S/He2EK
	mtqdd8XfptaNZgafVNBON+hylZUTVW4OUjB/ElhXnXoFYguZfsvm1VMQwaSAayL9hJwAtcqhMnz
	tqvWBCzLbPGWHJlAKxAXuBbcVrTHozFh6HHE2Z
X-Received: by 2002:a05:6a00:4c07:b0:829:924c:348a with SMTP id d2e1a72fcca58-82c6e0e2146mr1713896b3a.45.1774410845154;
        Tue, 24 Mar 2026 20:54:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c07:b0:829:924c:348a with SMTP id d2e1a72fcca58-82c6e0e2146mr1713864b3a.45.1774410844193;
        Tue, 24 Mar 2026 20:54:04 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410870csm14220689b3a.52.2026.03.24.20.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:54:03 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V6 3/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Date: Wed, 25 Mar 2026 09:23:36 +0530
Message-Id: <20260325035338.1393287-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c35c5d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=w-eP6_cFhoaRftvBz5kA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 5HySBs4qSaqkyGCBtHaO869O6UPjUQhs
X-Proofpoint-ORIG-GUID: 5HySBs4qSaqkyGCBtHaO869O6UPjUQhs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMyBTYWx0ZWRfX4b8PkrPMbKCJ
 ByZoLGohlC1k0VgCbNgMZmjsFgAtojC/YnDkx4gmnevsno3WJzRDTMvDNGv3R6fdrLXS6PKz9sE
 /9Jvbh8nLMdAJcU/rWs+klLRe65EFMuObRHylR1Mw0kFRypt6+gLZ7XfLRxvPYjGx47REE7EJ5w
 oqse3JDawpzsLqInXjVnJ5VIjWBUP9lz7nNxpvAYGf06sRzPrSERqViEjz24WfWGVrmjgIcdjB9
 1B8GkhY+a2hi1LX0Hv1f5SmC6oBvqFjQwU29uAnv66iEw3PL4BeavXoz5HRWI+UVsg5iMm5m5P/
 mxmYpQMcx4+USQE3tnWkmvpxPlZ/i16s0ctDtri1lfP55i9lT6hALc9eW5zcDHj+S5upjWw3aGl
 u2dOVVjZss+cxyN3EkQB0TtYVw+Id5EkaiUYbK7oDHbhVcvhD+9I6HjcTE3FEtGdw0eD9NCvnIp
 Pq31b4ApWAl+3+tMnLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250023
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99780-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61DF431F660
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable ADSP and CDSP on Glymur CRD board.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index abc6cc8bb0a8..690b90e3d6ce 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -478,6 +478,20 @@ &pon_resin {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/adsp.mbn",
+			"qcom/glymur/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/cdsp.mbn",
+			"qcom/glymur/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
-- 
2.34.1


