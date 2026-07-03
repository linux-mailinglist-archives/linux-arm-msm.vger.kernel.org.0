Return-Path: <linux-arm-msm+bounces-116163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lVwdLjJIR2pjVQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:27:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CE06FEB7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:27:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T9PXqbS5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C377dvxS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116163-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116163-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37B0730A8E3A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2AF390CAB;
	Fri,  3 Jul 2026 05:05:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EAD388390
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:04:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055099; cv=none; b=WGlDKixJUJYeyZlh5WSZCIhHqAlbndZ8EAifWpghjOaEsX+rxCm5GcZNfGl1ZM3kcj7EktBTSqXly4QWwXn41yOTZTTib+vQIDDdqCFwp3OOOO9eRZQ5oxRRs0tMbwfyM+xMvOrxHkKaFqP++butHELGwgznCukAoQ+vW6vjXHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055099; c=relaxed/simple;
	bh=ABIa2dnZxJbkTD7vqVOMfkjbVDGiXVjQk1hCuVnse1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=npOKrsRMuimQkjt6v5utey9EW+xOTk+nHxDKOgooL6K2/D3n5sVgDKkg3lcPbLLCiO0kcuyqTNfxPE2WwxByCKGIvn2VlFsPq1doRTr5YQoI8Ptl88cv+OMhuuIyWph8SPA9J3QhR5/5OTnZnoy7tY/W24KaU94uOyDNK7Eoq+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9PXqbS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C377dvxS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342XA92654689
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaM6ECTNt+y7sLb5IR1bYHVjHz4BwlWWghAHWGeWZI4=; b=T9PXqbS5zFqPbSOI
	TchufIj0UyPDKBvN3eNQwjqgYZwUsW8RyTyiyK+JMVilcxetDqFiazu6kG5x7VZb
	Hr4DV5R/3u+z4ZEKCCqaXBMk+42Q0mt2YpSFdUXI8Az4U8Aji5xeEpgWoyGowDEX
	QCHGK8eIA4GlWNaF5Dgq/z9RXY7+Ub2zAotiWkTbfOUSKUfkx3caaRNSONEMMWPs
	pG03As/2kX4VaQeV+MUn4kcO++eZIPxht7xsfdtj1Bc6a9SkseZSipAmeaW0umz2
	CAnK9f0WmskxWVITV3A6f4C4NLwl/Yx/RnAz8iM7rhxID3pdUtkOFvAuanKnnzdo
	1Gpf+A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5nprc684-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:04:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fccad2b01so755223a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055081; x=1783659881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaM6ECTNt+y7sLb5IR1bYHVjHz4BwlWWghAHWGeWZI4=;
        b=C377dvxSZYaI+otihL2u+09/AYQaobUnP5MteLo+XMLdh1ddhTSxrjt6uU8C/GjVgp
         7BaUnET3F6lP5jWrnqPTFy5+AssOeJoBn5g/qNLrio07em0H+NmToR6EcuEe172XTEmf
         sWQouL+08G3iyzV51eXTWAngzkctJE2182pImoBGtRw+hRSO0O+UzYm6FNko8kKCtYvj
         CDvzYA1j8d5fuLUu79n/0XvKqByUg82ql67oP9TiXOMQj3jUYkhZcbsYYJwjZCdDYnc0
         VS6EqRDOi3Pp1jRfbWpFn7OcqQL0LGfKNehwL5yjNU4L+UK4xc8LXHguoVshxIzIFd91
         2Pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055081; x=1783659881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yaM6ECTNt+y7sLb5IR1bYHVjHz4BwlWWghAHWGeWZI4=;
        b=cSgst0rhON3AbGotKBuPtr2qsNUHELK8Hq8sfsm0ZAYFcw7U5mtN+PHkXI0anjVmks
         o0c8zJaqRZfPni84cPMG2krejTr/g/nWqoSBmqtFs62pW9PZbQcBWFh87QSNKaSqxRmB
         +qXvJ3ul621rwFfBwQUY8pbYwvizAzjHyV9Z2byUeJH6gpJ3pZeVTYYd7Ga7D/f/8jbQ
         ScbvOmKbdcwhz2FixeMyj/J4jODhlSW/PHzXMmqM0f+J83/Wp7vMwA8VHSKdy0p+Hkm3
         RxBGLuDNUTuGrfQerJhAxBaKZRmjUaqmg0ijNloQ8CR8yHATAbBQw0NBG8oahJ0B825o
         Z+Jw==
X-Gm-Message-State: AOJu0YxC5b0IlHCrtjsAIqAI3Kfm1dM6WswFQ6rhJ1wtegJ7b6+Va50u
	bGCXl7j70TacOgPBAHc/sJlg8IsVy5pyNyTrAfs/MmW95cuZ11X69DbfxHYbRecteGigrzGBeTX
	qSWJOVhx8T4I/WDVwJosi1UKoBRDSQFG3kbjsS06lf3BfJc19Iyfj+UVz0nENiC3583U4
X-Gm-Gg: AfdE7cmLDfnUtcVWwTiUccbJaj6Zm7FeurI27AzipzZVsG4H960FFjYAsDutWahobLm
	f0Tms/KOnrTKsBRs8C/SmWKr3R9usDSJlJLbgbUztwzScTaAB86pmbV8uugwn1Hc8Clk7Ep/M8H
	F6+aTHPSyfhyc0BIvaI4MwYZyrfQdWSukiJBUfk6RT8C1y1PgOX17jS6Xt7V9EgSXjnfpT2Is61
	PiUOfp3os/W6itDasHFWaFw/AEQFDPoDBP9mQmQLQ+Mlu4PCT9+Ou4DhH+M9z0joRFl2lkgTMsj
	PHIQiHg5IvmJu/KIxCWGIghA/lj8KNiMQuPl5+F/SptwDCqN0kxPoxc+/566H4gH+tynhHUHo32
	b+0K5v+WhWfeq2kqE/Pf/F0OOpR7DOs/G9H6MMztb
X-Received: by 2002:a17:90b:5845:b0:380:7763:3b16 with SMTP id 98e67ed59e1d1-380ba9453c6mr8281714a91.19.1783055080840;
        Thu, 02 Jul 2026 22:04:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5845:b0:380:7763:3b16 with SMTP id 98e67ed59e1d1-380ba9453c6mr8281673a91.19.1783055080342;
        Thu, 02 Jul 2026 22:04:40 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:04:39 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:12 +0530
Subject: [PATCH v4 09/10] arm64: dts: qcom: monaco: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260703-qmi-tmd-v4-9-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
In-Reply-To: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=4833;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=ABIa2dnZxJbkTD7vqVOMfkjbVDGiXVjQk1hCuVnse1M=;
 b=C3B3kXOPyMnurF2RpED0IwL8hSGIsqTdUydr1v1qHP2nQzRzcLOKVf8dJbsnt6PsED3sarXiu
 FAKixSDQXR3BO63VF+TbkcCa0Aki7qTV69fqwvkOC899zXbH60BXSvb
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: jn2sIPHVPBEaizs7Y97VzhP7GCOr1Nuk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX7C62tpj+ZI2T
 yfroiRu78wYYCjQVHYThtvEX8RdqPgVpxKoE1iYQwe8AFVPjBplbdW+Oya8QdsCQ5IUOecNVnjX
 L5HRCH4qlsfHAb1oza0VUm/9z2DYin8=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a4742e9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WTijfvStGCArOK70lPgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: jn2sIPHVPBEaizs7Y97VzhP7GCOr1Nuk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXwkzqGIPdPfX3
 P+an4o1c59xWk4GVV+MBQ8SIF/6yYNysKM1spXRXIZtIanUFS59az9lyWg0O1V5iWeSUcA5qmPt
 2T3qz4XYKFT4uj/OnZ+nYEBXdhzmSlKnycgYcOjZhbugPfC5PNEJ+u/enCU634Wos+m5WnAgFyi
 VqG5D7X0Yes7fMYn/r0fjZl46eAWyp3poZTT6RajJzh6+IbDuO2YYrfqDvOIQAhrO+PoCo3KQZD
 1cFHTE2NfZtO0roJ4AJe+eMh8Oi4Xvh61n7sCkgAEq+u2pXrcL86fSEOhtIcDO2qveyK9bZYtKk
 LETMvIg5p25m7iUnshH7TfEp2DDq6FTJeVTATNoLwSKv/99/TO4nHvvXmS/hF1QLNjoxKEVDycc
 xObwsrfz7Rws6//tdFybJpM7nclF/0AkzRCGyXylvuqRE2atQJmRJWD3KihGro3NLaOJu4LpY5e
 4eJ0OLWodEGyiQef7LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116163-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A8CE06FEB7A

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in monaco.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 115°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..4576f9670962 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
 #include <dt-bindings/clock/qcom,sa8775p-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,qmi-tmd.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
@@ -7728,6 +7729,8 @@ remoteproc_cdsp: remoteproc@26300000 {
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -8160,39 +8163,87 @@ cpu-critical {
 		};
 
 		nsp-0-0-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
+				nsp_0_0_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
+				nsp_0_1_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
+				nsp_0_2_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-0-thermal {
@@ -8280,39 +8331,87 @@ cpu-critical {
 		};
 
 		nsp-0-0-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 5>;
 
 			trips {
+				nsp_0_0_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 6>;
 
 			trips {
+				nsp_0_1_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 7>;
 
 			trips {
+				nsp_0_2_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-1-thermal {

-- 
2.34.1


