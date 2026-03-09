Return-Path: <linux-arm-msm+bounces-96285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHT8AdrgrmnsJgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:01:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A780223B2D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7CB930FD39D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 14:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFB23D6685;
	Mon,  9 Mar 2026 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWtLmZbt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kdi0cY6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577D03D667D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068246; cv=none; b=ljrpDe1/T4otNkjICobFCvaQPHpPP00e5DlUuwSLXI4owWZ/TPPkk+vY2x7rWh/O3uwSzQACRgt9rxSkO0g9Ud7YsIt79lB+B2HLL9kmZq4X7ua93MZavkrvr4i36aeHE+uTK+nTPrwcJWYTNqT5rAvLWRCdYfgZu8sQaKQHFK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068246; c=relaxed/simple;
	bh=GQ7dGMa3tf5kHMlBUxRYraP3OVzeDyIU4kqGDOpcIds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5YFPfUCvAD2Y0j4NtUTtsGIcAo2SgGC0xKC/nCxu6qIHZ+oSKEFSBYi+HFVP8nbam+fO7IUgVBbuRg6/cw4flB2LcLrE/B6VM/3toLWjTVpAfLC1t2AymVAGgKlKrhzT5JYjQF7Tucvde69jAEYYzDlfG8r1XoZUOKbVoclJlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWtLmZbt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kdi0cY6e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629EIr8p890833
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 14:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGQUX6uRI0gsVYc6U+7QzY2wZWL8mdiBLQKJb3JDjdQ=; b=mWtLmZbt6CQcfhP6
	hyho/9YK68Q0RSO/j88J8ZTRKE02lYAjFoJRfNgAq5/AKvr4p2faBPJzxX9KRtVT
	dYMEkqgg5/abbdD7ytwCSKguPUsmKdK6j44wb1dO+DRXhCROCNm2nafcwJ/ETz84
	YFRgN1S7Vm8d8EM1luSf8Ix9zziPR2yej2f0Y8r5sliBZOsZUwCCgipXieGb7rLt
	o4ZWypaIRGpqiPNcCcJuh7jfdE1cyBY3N5OALS8Hlwv8i4AHikcVeGp37ioDkWRI
	BB62GkfcjGOXcdowrw3ZHMrv/x2arcQQ7zgkk3HJOzXp6Si/gjT1X1JYPtz/I4+z
	ayXxKg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1853y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 14:57:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a108d17d2so373964856d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 07:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773068244; x=1773673044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGQUX6uRI0gsVYc6U+7QzY2wZWL8mdiBLQKJb3JDjdQ=;
        b=Kdi0cY6ebL7iIr1b84Tr1bMC6BQaSf/VUD0LUs8NKU1P7z7NI6x2duRY8LH0b5WHCl
         U3DVfbEg5dQ8SpscLQ0Qn2mGFjhHtP40yirPAVPA05dwhryVdlUBd1t1LBxGoOQkkxtn
         C4irJvyDtqXUFZavm7ZFE0sgPxefUHxnYYpyIVusdWBXL2SiaSa7Ojwqk9WBOnVkOIsY
         vf5d8658E2DfcAe+bQfMqtVSj7u9PoxlHO6O/TbzJIpRl5S10udTPUCaDg4RkyYEsNiz
         H6RuEV2DUzLui5qCGOB/HIc/cqz0C+ibhvY2nDfWy8J4jO0K617T97ru1p3s5iu3Jr/u
         8VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068244; x=1773673044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XGQUX6uRI0gsVYc6U+7QzY2wZWL8mdiBLQKJb3JDjdQ=;
        b=KkmC+VCgp4pXv+fsd6WkSAj1WJTF7HfmOq+VS94wO27Le1XPmFAoL7iNth9NJ03Pg0
         5Lo19YKrwZXNthbBQlr7TuIlD6PZc2+WCTCt1u72yQslFRgCv+W0QrLJKuqabVdf6I/c
         Xfp4OruQneIz5wxXIwcgsFsi3PvGGvHpOYtGccvBc+R/B34Nw/HTCdBlFusDNbqp0uBP
         qYvMWehqm++WLYW5VMyOplrE9BAy+BZef1U854F7llxPHy5tD/4VkhZlfIXDvWZn7Gkn
         c89ifD9WHdKZi0poYnEBbeqnELrwXTlocGBml5v8TpJ+zX0sg98adWtFn5wHk8IQGjc4
         cDag==
X-Forwarded-Encrypted: i=1; AJvYcCXFxKo4OVBRG02hxzyhSzJqFTFAkkG+7ucf3hdGhhfYetBR38rumrwmc/fIob/lEiyJ9C8nIRygenbOt/3E@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk9GvL7zYFVG0tUG8vUPVBN5U+gSNZvfeEpDJ5WZqpkajCjSDH
	anSEdwr+poxKRnIs+WaQKErOhany3iUENRu4fXgM/RRIewdJILw69CoCSZlwq8ABPmZB65FhbvB
	kb1Ty16C3GMZNw+u5/T4lsDvhpKdZ/OH1EydY8rx/Fu9uHd0yYyn8r61nr6sQ9V5hxHoo
X-Gm-Gg: ATEYQzxA5cnDsm/7zI39RSgao6fjQEjMoJCZmTLJPt7gBA7z6I7fOgxpFWnYYAWieR/
	ZCKbRgd7LS6Lca+SXtMbKsgRFR997lxsQckeYwmWfHbP5muRQUpoPVxLG8CmQcysxoOWov6RnE1
	EquZR5S63kSjRp4iQGHCyMBim/mQ6lsfJ41PZR3rHwaHvHLbGP/so+UAYoIjSjTyPJXEF3fp6fq
	VqIIStwG54gn/m9gCQodIBbGkyRfBfoLZ4afhJfw3F7tJcqquL65Qp5YApLciUFSI/bdGxPtbxP
	1M0Z1JUAW8qwQKrr7KwjDQv8Jbxtvgg7o4AX4Y3TGDhpbNT6TxFhIFqwT4S/Y45Y86wJgdAFyIC
	97uegPAMcNO79OB/Z9W7Xmj6vBCbjSA==
X-Received: by 2002:a05:620a:700a:b0:8c6:af5b:d50a with SMTP id af79cd13be357-8cd6d4d753dmr1202493785a.43.1773068243458;
        Mon, 09 Mar 2026 07:57:23 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:8c6:af5b:d50a with SMTP id af79cd13be357-8cd6d4d753dmr1202490585a.43.1773068242956;
        Mon, 09 Mar 2026 07:57:22 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm29906008f8f.5.2026.03.09.07.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:57:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 16:57:14 +0200
Subject: [PATCH v4 2/2] arm64: dts: qcom: glymur-crd: Enable eDP display
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-dts-qcom-glymur-crd-add-edp-v4-2-fe4e33acdfb6@oss.qualcomm.com>
References: <20260309-dts-qcom-glymur-crd-add-edp-v4-0-fe4e33acdfb6@oss.qualcomm.com>
In-Reply-To: <20260309-dts-qcom-glymur-crd-add-edp-v4-0-fe4e33acdfb6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2623;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kULyH24uT8TnKoxOXCpwvFcbUOa6RxILB5Fw9MzwpUk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprt/Mj/19pD/+uVmFOvnHyxkhd4EWz/ETYCPv7
 GRmQtvLKsiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa7fzAAKCRAbX0TJAJUV
 Vo9lD/9So/9LdkUPkOsMObS0QCQ15mpk5ybBgXCP+zr9dSc9W5VNt6JoBJYVzgBC2PgXjxny1tI
 vuqlG1kaS/2fRHsWwt/z9glMiDC7N2o7tJXczqWY8YhsmUKPAOASDqxzyaqIKnep+EzhZVvLs6I
 nMgx6sUO/xovLi6MfEevQutWaCAwhi0pxxdOk1XPj7b68r00kOzGfnTTdzGuXuy6tdWO3VER2ZA
 WqiwuYUAfks+zRW5A8Y71M5Og3Ip8cRj/7H3ljZUSIVw5mhNSCMAIaOqkTXSr3IJD3JnVMIfmJi
 QaLnx8Ij/HfPIUivt8mE8Bk9Yyv9vxeBKrir3yijf8Wq9NdpzvswdnBId3XVe0YIqPpmd3ODH6G
 +uZyxzAdYm3WtFcjUp/U60vKcwlb/+vc+gAL0exXJfsbMH87gkh2W4bGAX+71/+OnFLx0CzUHvh
 eDO7GJLlTKB8R5h6u6RmcdXHfJlh0ubRGxbf3yCUsoiKdv4i1J5tvkaOWlELJc8/20+j/vsG9/X
 3TMatDBWi3+3EG7UkZWRuevroLmRP7NobUDM+GI1wa11IXeXKV8Bsvrtz9J0qOFIZR80gq7Sv+1
 1akNm3FiqoqsTnxX544Fvl+IXVBxAzX1mv/HVmoJaNJuPLFqR0wH5W/jdBsjkxJwQG0bhF56V8D
 S1Wt80RHLfUA0KA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 7dlxVnvZqoIw6P5qRiGZCMubCgjaRNFN
X-Proofpoint-ORIG-GUID: 7dlxVnvZqoIw6P5qRiGZCMubCgjaRNFN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzNSBTYWx0ZWRfX/0iwK9+SsKak
 xpl6M0XLqwiMuN9nq6xaemEFeZe8TFYF2aJBXmRXIISUXa9bQKoAlQljaPG0ZmMDDlOi3lgwYd9
 DZUGYxqnQaqdZwTpDoVYJLfK++/xZfatQkRclOSPT/Am3BX2BW8a+yYhyvngQ7LPbhgCjEd0LX6
 TwMjawLujjGsNEarN128W5kNAP7GrqFr2y7Jt+82W62Vgd/Gn7qvlwex4BczyBNIJudhIFXQhvq
 L5IUCyU+Up2u2837m7y18/fdUiMO29UuSrd2rsdHLow9KhaGrsdLEhjtm40uLVxJayU6zloMcpP
 gBjmMcXXEaoONRP/NgD+JwkBhxcgeIp814risTORUN6lkzSMjbL/2zS2UDy4ybf8lxTDX6EICLv
 npj+dmjhprIvgsYC8LOXNf9UjZwBtnhjsKJVBZbPuJ34RHxk0ICangQ+zCiaANqMmBXNIqyVcEz
 74zTkRAcYnYJ9Bei2eQ==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69aedfd4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=68_4jy3stEaJOreQ4WQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090135
X-Rspamd-Queue-Id: A780223B2D4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96285-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[abel.vesa.linaro.org:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.47:email,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.939];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Abel Vesa <abel.vesa@linaro.org>

Enable the MDSS (Mobile Display SubSystem) along with the 3rd
DisplayPort controller and its PHY in order to bring support
for the panel on Glymur CRD platform. Also describe the voltage
regulator needed by the eDP panel.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 71 +++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index a7b30accbd1e..38cdcf662ba7 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -123,6 +123,22 @@ pmic_glink_ss_in1: endpoint {
 		};
 	};
 
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -460,6 +476,47 @@ ptn3222_1: redriver@47 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "samsung,atna60cl08", "samsung,atna33xc20";
+			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l2f_e1_0p83>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -593,6 +650,20 @@ &tlmm {
 			       <10 2>, /* OOB UART */
 			       <44 4>; /* Security SPI (TPM) */
 
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";

-- 
2.48.1


