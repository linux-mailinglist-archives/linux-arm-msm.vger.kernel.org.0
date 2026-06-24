Return-Path: <linux-arm-msm+bounces-114317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EG+RLp+oO2rBawgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:51:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AF66BD121
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:51:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SjFpc78b;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RhAb7NKz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114317-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114317-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AD1D3019B92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77ABF2C08BC;
	Wed, 24 Jun 2026 09:49:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C523A0B13
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 09:49:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294599; cv=none; b=KspGn3peA1TflS/WN9c2WuhlsO6S4i6xCS/Gl8+GYdKS7ebUzQLReIoIX/IRZDV+16BBrDfSEbSLP9HetKuW2w4Mk4D2/7UYSMeT+/1kJC52hIYrhApWURD9jkBSstMOsETar1hZrYf/kUpmf1p+6gOKoTCWMuEuIXJu3OyqTJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294599; c=relaxed/simple;
	bh=NOeWjRx/+N6Tt+3yCcJaVQnYDy9sxYSfEhEFJNU0Krk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a2C8ynRYwYUVzYSiduCOY5bBSQ3lS9+t9GJ3NutdFHEktHVSM9cPbcHC1jf0v1WmeHuA0T6c58EwiQ4oQTPR7CJE0tB9gs0ENAA95ZZvrM+n6kv/ZizvIbYYXlLOvMpiiW7LfYRLbVp0Rpy4/khg3wUhPFWc5wHYHhs+XuQQMZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjFpc78b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RhAb7NKz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5u5rl1889415
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 09:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1JsjvqyGuqGJ2AUuXYyxfGScXM8BYsrNI9EyivldDU=; b=SjFpc78bDHurmRP5
	jZ/vVuS/1MXvmhvtNjie+4rISTrAhhpO/Agdvagxpm9UKqfxv3wRRVEOF3vrgbVR
	X+IKrca26ixW2Don9WAia1+dKnmrqjkZ44spXq1wS62peJxMX2P8/naIkLvZWuhA
	5WVhoubztpGiy3Ht19xSi9cWeBvSY/o3SjDkQygdFLFBW76X8maVSKk8PxeVu3KX
	Fwtopjq0GH/ZT7TUkgbCP7i9DjruCPtFpEWUAfK4sx/RRUeTzUZ+LpetMhgiCP6h
	OrtE6BbzZ9hK3cjKHduicu5ROhFaF6irN1ulSu7vEfR2v587uzH7KKKOvrnfu0qM
	MocF1Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3me0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 09:49:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842211d6e48so1173559b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782294597; x=1782899397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1JsjvqyGuqGJ2AUuXYyxfGScXM8BYsrNI9EyivldDU=;
        b=RhAb7NKzlbUl4O5uKV0Nqpi/ZAlg6FtpIR0r3DBWNZWt50fof7MAqXBCzOYMTXvLZb
         cL5gS8WuKLcdwf4zXRMw8xQ3yHbk+xqA4fxg2edx88q1QDpIxkPOVFnsSmnbQqfcDWWZ
         fQNpkYPe1v2saDdw0Al2sB+qKTiFEXoDFyodwQQt/bM6r0KtnAj4a8ZemNSEDDnIhOa7
         hUih5XVBnz/fd76FuY0qCfCzLTim7QH7g0ptmRRHUIImsE/4POA40OuF1ORDc6ze2BEM
         y6J6iQJTXWxCb+Q5WAAF1UwRO0cNrWT4twizxvtJ6d6tBJ3zfqPjHwdf6lb+mDJXHYO4
         k/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294597; x=1782899397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J1JsjvqyGuqGJ2AUuXYyxfGScXM8BYsrNI9EyivldDU=;
        b=dsQ0Q/nVvQ0SDyJYyz5uEV66AK/igIMIKJ3Uyd6MRH1vLoQNK3B7Xsfg1CExiMofuv
         ADCcqFcu9d3uxkqKHqHhldFQTNBo1F+vORF5ZZskWbp7zUAf0jgjUIZctgtvTtyvPfyo
         Jp0EMd/TWSut70KP+iEek7UG5xh79sDnYPCX8we7y5iTjx/lUd9Xo7GaAH9sHXFZ+y2T
         QXICGrMq0VLjM+oHztq5ORRovp+oBqwomSnv3x/MxxvzvSiSjCDJtCTKwDdhDZndrxX5
         N07reNq0lk2axKjB2p3bPyeg5Ck7ZD2CCHXoVhxPabhRTwQrENUfjDUfO0rL8cvtOiBn
         8DbA==
X-Forwarded-Encrypted: i=1; AFNElJ+3IqjIjC9PsMCs8eMbs+NLU+Pej3qlWSO9cw4v/28Tpkkd9NnQzbYnlMphyq4nYV26Rbzpp+vyzl+okX29@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56GmGaTIgyOF5rWnFLEGfxK14J96YVU0r+SDVi8hbLqe4cF/N
	B0DD1lm4HQtXWDCTdFsIRuhHJi0XCWc1029zG53HS5cH1M70mk2EyI3Y6XKiIDnh7vtmQguPApo
	VjQ3qIImdxnVluybkusCJlh0Eudv+rXhJsgYABwKI3+sQ12+lPLriAN1oetZ3c3NO2tfO
X-Gm-Gg: AfdE7cms/+Eem+7rsZp1YKYsMfw8m6lyC9g0dipBBHLoeSQkB/s2flr8djROeQ0j2sJ
	wRcFMCk8I72xCPymEzpr5LfdnKc2oqVNLCeQ1LhI/Et/ms/0RmLfQ5pH2MKHm0AZIybGvyPQEwu
	RQEoMVN4RPAw2nxFJY2UOMM2Q4sZzNJcyFB2+8usFMoW9KWDMP/nylxarXTp53EFF68z+C8eHiQ
	KcOoKWkAN3vQGSeet6Lcl9t7FU2VAeUvK6ifIYUyzswLNGlY7GcMzOiuOX6JQkGtN0b1PvTBOC3
	NziR2mYw2omEOODRgRU1GtWm6fq7bKfjjBjl9Kst8fL6p0uSx+mbnEuX73NcH+BDXBwSbvN3BWg
	kag53SMCNxl+NawpVybuHJ83LBThdiJo68qxJeb8oQnzb2AJNUeo0jEMz2YGQwQnCabRd6Fm4/Q
	==
X-Received: by 2002:a05:6a00:2a09:b0:845:34ea:75ac with SMTP id d2e1a72fcca58-845a27beb31mr3220465b3a.0.1782294596797;
        Wed, 24 Jun 2026 02:49:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2a09:b0:845:34ea:75ac with SMTP id d2e1a72fcca58-845a27beb31mr3220436b3a.0.1782294596412;
        Wed, 24 Jun 2026 02:49:56 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb7b3sm2161302b3a.13.2026.06.24.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 02:49:55 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 17:49:26 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782294579; l=1011;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=NOeWjRx/+N6Tt+3yCcJaVQnYDy9sxYSfEhEFJNU0Krk=;
 b=Wi05gzbNeph1isJpH4EZJiEZGHTd+QoP61914r7LB4+nEaCkaU8hXCuaYbH2LnMooI7P3pklW
 dkn3b8QAuzOAH6AUaGfRLWFuoA2V8qTSVPOqJCCYjdAK7XxTIrHdiY7
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfX3SndO31qVwEg
 snvG29fJ34feu4YHfda98fmnQWpm+daQtb0jl3RgNwN2msMTH9pRuzFEJ55hUWlPp9dS92I/iIN
 sOes1I7amsiyGh/mM4PZcg+fjHEiF58=
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3ba845 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GaqzazX96i3VkeCjfTUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 7bBpAC6TVVRK2RJgpVhuX8ug58RbmG0b
X-Proofpoint-GUID: 7bBpAC6TVVRK2RJgpVhuX8ug58RbmG0b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfXyqQvcrSDZLMI
 asORJtdJgkean+2TDVwqJOZPcWk0BLjD01J5s0xFi/dat2qsbjMgQQtPxgNBRwOvkJqvFsI/KfU
 4w1hi8AJs8ctDpW+AbPyJqeEIW2tuzKn0lyDHiKXJ75vbiOresYh0Ig5RXhWefXBNZQpJ+xvHZP
 5EeijZ1OY0vuKelZN/WbDvNYGUy/3J/ws5J7ExuG1C9rOQ3XeALKzyZvWY3cqul8aQ7s0CJBS7n
 zW9/OJ8O6/WSxpEE1XL8/Lbm/J0hbm5CWh4badpPtuvSPXfDEvMCap9p8b3ECeaMcOTe8OK58ZN
 y9fqkaNsAtPZNbf+OOXJlXaHe/aFZ2MnhrhEwq7iH4wTu4lnwK689ss1bHtLmXwOX1Rnze4HyFL
 MXeeXBOJLeyVEagkiSCRht4JjrrY3lPsO6OhcB9/zqybzmVGqtQAb36grm6LA0CI++RufhPS88Z
 +McV89ZWuwhh3nH4PWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114317-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12AF66BD121

The AMBA bus attempts to read the CID/PID of a device before invoking
its probe function if the arm,primecell-periphid property is absent.
This causes a deferred probe issue for the TraceNoC device, as the
CID/PID cannot be read from the periphid register.
Add the arm,primecell-periphid property to bypass the AMBA bus
check and resolve the probe issue.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..25820f7c04cd 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5009,6 +5009,7 @@ tn@111b8000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,primecell-periphid = <0x000f0c00>;
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1


