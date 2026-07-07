Return-Path: <linux-arm-msm+bounces-117332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VfYnMIQDTWoGtgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:47:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B5B71C1A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:47:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eOUjFhc+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Ak1/9Kt/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117332-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117332-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A75F130B7D05
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 13:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E10141F7EC;
	Tue,  7 Jul 2026 13:36:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3044D41F7CE
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 13:36:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431386; cv=none; b=lhuN9VoKBDnelv1mBPlYHx6c6hkvNc54+01u4+exEh3G+4HYXAJhZcmAEwXWX/CjHtZEUsmk37yoArQV6k3RGjqtaabZpYfdXTyOEZ6mKHF58fOkEbc8SzrK47scqHmP4bBKlOuZOphM5ErrZSGHYshCdzACQTfbkviMTN7VTqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431386; c=relaxed/simple;
	bh=XQKaEmXy+IkQvNCpt68fGOLoSj/EmDQxgixJ3SA/H+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=az8ui2VPzxVDoZbU1LGqAHsqn+RILLWidKW2J7mWJeF2gK0Rx3bqhNJZYbryDBam9NWmFfwtMV2qL5qxb4E6QxGnXdlAiZtjJ6yqWhSBIatlm39kJdJNPbJd/7OOT1K9iScKE3dweW136Hzr7hKQvrlbVwuvvg0+MgV09q5Trqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOUjFhc+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ak1/9Kt/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C9DWB3590399
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 13:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8S1EgtHaaxWnA0b5bvyvYYEoM6PzdfJqkWhdR0zWP3M=; b=eOUjFhc+cvhpNz7d
	D6L/mofikMZrjEJmFzPY355TJ0ora6WLsGjVxHS8UHYJRV7DndX2kRzmoksn004Z
	0i27orBiv6MfpYdkMGfAgBxWnHWwZjX0eYl/4h018bY4WViT8+rjkKcfk7vHJFWP
	dSf+9GHQ2Ke9RMK+E5nIoJ57H7heETruyVZxaKsapAGpjgGqf4sbayaH/9umyRaF
	5EZRykWwdfpYTYp8KyxSHjeDA/RC38M4Oka8tbHSmSZ1DoaSC3h6qf+PQ3ENOT65
	1QFFr/SDLiG+wXiujBv1I7efj1qXCddjzQn7PBgFBNDJhCgYj/VL2pdvFcM7XchG
	5rPRNQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u9ej2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:36:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1852a86fso47814671cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431382; x=1784036182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8S1EgtHaaxWnA0b5bvyvYYEoM6PzdfJqkWhdR0zWP3M=;
        b=Ak1/9Kt/qQqUFAkzAZv2APpLdqFFQABf/IfqLzUKcvb/BWpvnIWOFoMT3qfLIiGh5n
         TG2QWKdRxcBoI8kWDF9n7oOsVF7pIewYdrTMcARLrEmwPlFuJye+ItDemjATBuRZOHGi
         LvG3I3nj6otzEZT2UO1tSidyq0UI1Vg//AAPfiTO0ChWdhoF/NumZR9hR+j2qY75fjr/
         uhwMC0YFG/Gxsqj+PFxEEKVFio5ILA2rQknfN1BBbDbuZG00D7QKil0425U8d2SR/RmN
         w3814j1dKF2dBq2l09rgaOF+/1Va1aSKfL1y529aUqgm4U9t0rvC0/DJryjFNnufRAoc
         0fUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431382; x=1784036182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8S1EgtHaaxWnA0b5bvyvYYEoM6PzdfJqkWhdR0zWP3M=;
        b=SZYrzZhXxl5KouAR+pn0x+7i1jm8sYMFRdDCMJU6MwhctkVGRTKOQq9kv/Dzv1JSyF
         c/mHnhddp+W2pdADBEBrVyyXT0fq5CCLzCVMmmorC04wPfbRho4AZUbcJndwwmwTrj1p
         A2AOHCJBTg0buXUobxCV4GhyUuiGLCSI/OpJUi5MexxafoSqysp4UwaZ1WchxXd/nIA9
         Dex5dpYlePO/74xyMeWahu5d0pXkrAv9az0t2CGe7iOd2383IGsTR680Oj+DL7zsDakO
         ZN+q2ylct/0JmDM+x5OW9/MSeUHGWU4AnbWs2dD3AlgDl68WoK9YvjJeFHRSzDAP5E7+
         5eqg==
X-Gm-Message-State: AOJu0YzObt8akU+MkZvmkzuhPI/FpQ8ROP5yaNuAL3uTbDdudmnxSyzh
	itn8U6JeDfnOHaZFBaWAqrT3wWrPEjT5lHhZ8vs47ZkWuA3jBPACnTFlDja3n2LUkgkZ0gBNAB9
	zA6+q8bOPQKvWuudSTswMBdXw0nDoA+y7z1hoFRj2sgOcVsai9A9usfP+4jPX42eL6TUx
X-Gm-Gg: AfdE7claJG2VOrj3X2eqp/aunqiYgKhSqWyxU9EC5WRMEO6jscgAjQ2qE5jZa9MSExd
	1DkjHfLCcl+2kc3VMVxGt0ZbhKhFBX8lUKQTYryZikvMO0Qg+9e3R2t3SFsjosWgkGzG+wsuFue
	x4ag0M5PjzUt4sJxYYY7npcoXGEEMSvgrLMMnoVEveQPvs27RspiaWUvTzkwGPxegl2C73fR4PW
	5hIFxVW8hOqM5lgBXCRoquHNtH2QQx2szg8c5P1P2n/+hOJS8ny+USG848niqrNmcUoLIbnlTPO
	jWBtw/rTRlgQDhxSMXqKeEMUz+V4o6vwOJQydvtMLHoYuarohWe6k6OUlr7xg8CV0iTxTOLpNI3
	N50VImjKw4YyfSigOilsJHmOfQe8GJQ35qNs=
X-Received: by 2002:ac8:5806:0:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51c74829b78mr51640121cf.33.1783431381846;
        Tue, 07 Jul 2026 06:36:21 -0700 (PDT)
X-Received: by 2002:ac8:5806:0:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51c74829b78mr51639541cf.33.1783431381212;
        Tue, 07 Jul 2026 06:36:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm34258187f8f.22.2026.07.07.06.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:36:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 15:36:01 +0200
Subject: [PATCH v2 3/4] dt-bindings: arm: qcom-soc: Validate nodes with
 fallbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dt-bindings-qcom-soc-naming-v2-3-1b7d695be2e1@oss.qualcomm.com>
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
In-Reply-To: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10555;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XQKaEmXy+IkQvNCpt68fGOLoSj/EmDQxgixJ3SA/H+M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTQDJkPs7S2N7YzThoHU5gWfvzN7jntYz8DT+F
 RaU1hGVoiGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak0AyQAKCRDBN2bmhouD
 1/AuD/4wFiKzwwu+rdd6PQUIuFOlV7kwafJTtWZi2xVPvF9tZ6+xdIY+fbeVFaLvOowjaRs4pmr
 aP3wEKRGahHe1ftanfEteW8wUelMQryFXx10a1K2YayM7FtATwDewntJ1AvKZZRQH//9hzfJSCY
 y2ZaQKLxxd1ZhL0/xzFsfDtCY6JBHT12vOOst0Ml8zoNXxqXa8rbvFn+Tz93C/pHZFr+Cw9fvPv
 91KY9R8AAT6jAZ3dYv3rbUBOhDHnTo84DcTpeyp2urf3sOFEH6eODsSwEMzSn7Yhl3Wv4/2Kmpd
 PnqMKooLZAsUOdIehW9bOaNHIBPQWDi4V9gFhXvxA9e0Hdg8PrD5O7pDniI+34NHR2+9rKRJZ54
 0C4Z/LAxM3Jj4uBidNc/3VI/F2LcCDvK8K5B+HGum8IWC/bt/v7BjROCxZ7gKQTIghcgudxu7Ct
 77uqDYVt74SPsnC1iIuNa42NuJs2y4+WuNN8OgEb6qhh+fgVedZq6v9odo9ODTByaNP4oSW0VmV
 U/lP/4KCElXEovsX+n7XTFh3mfQonPzrBXZDAu6eDeyUFppnpdo9/TckT5GHoQHwYJ8CwTeKNS6
 Ib71bGsu0moOBf099KW/zF3JiHDY/iL121e2jI8fc2PYV3NRbv8foCrYR/eLObcXjaHE7/GNys0
 SsiA9eTnyyegElQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX+Wcb6+TdDDUe
 5afWOeKedddqdahGiAb7NW9U4/025jxddRmsQtJMQ+wEnrvliety0BWmpxj8a7aFMJK+9X3LR2n
 Gke6/QQIcpC9x7QnKFzuRW4FOF8rxSA=
X-Proofpoint-GUID: eRiUg86YqiemBS17OCxDcFv0QAcBOYes
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX/tyfssLUdaCZ
 6w6C0AId+rCh15LY9ae72BrRSt77DwkAoznbZQG0Wm8h6/gIXEzGDWD1PEMOApQ8qnD/D6zNMwv
 owTGR1S4oTumJ4vdzEwahSvYEQtTiOvknoUQRT5qhXtl8Nt5GHGIhVDXh4P32cwwEYl1kYEXUeT
 p/WJ+aXv8teOPrR2xeIm3jBvyaRqUQzcOQQRKD5ambPj0f7tv+REPlp4CI4Ari6WbjBAfdguHjj
 Z1DXgPp9YEUHmK7/Djm9gK1xES+WDM+Vz4Ci+uKgeM55QKIFDfh+QsII/oAXyyoNG2HCkTMrXRb
 9Ae/iguJnUmFCdFISFzhccuxa1nAuYOEvAgEfbXBsuRI66UktQGiy9NsykLFJhGv4ZCJBPOKX0S
 UxCpoGhqYnD3imil6KyUlgMKo+h8uw7kWJTlx/Z+jA9Xpst0rhi56tEeSqP+lwT+VXzWYXsPvLi
 ECDjpECFEDvyxDsUQLw==
X-Proofpoint-ORIG-GUID: eRiUg86YqiemBS17OCxDcFv0QAcBOYes
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4d00d6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lNdm6IUHfFykFOeWzTwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117332-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19B5B71C1A0

The schema checking for expected naming patterns for SoC IP block nodes
was really incomplete and was checking only nodes with single
compatible.  Fixing this and applying schema for nodes with fallbacks is
not trivial, because obvious solution like:

  minItems: 1
  items:
    - oneOf:
        - pattern: ...
        - pattern: ...
    - {}
    - {}

is not allowed by dtschema.  The binding should also skip root nodes,
which have SoC-based fallback, but completely random front compatibles.

Solve this all by:
1. Extending the select pattern to match all nodes except root node.
2. Apply schema to all items of "compatible" property, which means it
   will be evaluating also all sorts of generic compatibles like
   "syscon".  List them all and let's hope that fallback list will not
   grow too much, because generic compatible fallbacks are discouraged.

The benefit is that this schema is finally very specific and evaluates
all nodes for desired naming.

Diff is a bit obfuscated, due to indentation change so briefly
explaining:
1. None of the patterns are changed (neither in "Preferred naming style"
   group nor in "Legacy namings").
2. None of the enums with "Legacy namings" and "Legacy compatibles with
   wild-cards" are changed.
3. Add pattern for sound cards.
4. Add enum with qcom,hamoa-crd-ec, because it is used as fallback to
   SoC-codename (Glymur).
5. Add list with all used generic fallbacks.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom-soc.yaml          | 190 ++++++++++++++++-----
 1 file changed, 143 insertions(+), 47 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index d934afd59df1..ffdaff073c92 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -22,60 +22,156 @@ description: |
 
 select:
   properties:
+    # Select all nodes which have SoC-based compatibles, but not the root
+    # "/" node, because its front compatibles do not follow any SoC patterns
+    $nodename:
+      pattern: "[^/]"
     compatible:
-      oneOf:
-        - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+      contains:
+        oneOf:
+          - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
 properties:
   compatible:
-    oneOf:
-      # Preferred naming style for compatibles of SoC components:
-      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
-      - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
-      - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
+    # SoC specific compatibles can appear alone or be followed by another SoC
+    # specific compatible or generic fallbacks, therefore check for compatible
+    # should use ideally:
+    #
+    #   minItems: 1
+    #   items:
+    #     - oneOf:
+    #         - pattern: ...
+    #         - pattern: ...
+    #     - {}
+    #     - {}
+    #
+    # but that is not allowed by dtschema ("oneOf" cannot be used as an item
+    # for a compatible).  Work around this by defining schema for all items,
+    # but drawback is that we need also to list all known generic fallbacks
+    # like "syscon" etc.
+    minItems: 1
+    maxItems: 4
+    items:
+      # Use anyOf, because soundcards will match few patterns
+      anyOf:
+        # Preferred naming style for compatibles of SoC components:
+        - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
+        - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
+        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
+        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
+        # SoC codenames used for non-SoC components:
+        - enum:
+            - qcom,hamoa-crd-ec
 
-      # Legacy namings - variations of existing patterns/compatibles are OK,
-      # but do not add completely new entries to these:
-      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        # qcom,apss-wdt with codenames
-      - pattern: "^qcom,apss-wdt-[a-z]+$"
-      - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
-      - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-      - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        # qcom,scm with codenames
-      - pattern: "^qcom,scm-[a-z]+$"
-      - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
-      - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-      - enum:
-          - qcom,dsi-ctrl-6g-qcm2290
-          - qcom,gpucc-sdm630
-          - qcom,gpucc-sdm660
-          - qcom,lcc-apq8064
-          - qcom,lcc-ipq8064
-          - qcom,lcc-mdm9615
-          - qcom,lcc-msm8960
-          - qcom,lpass-cpu-apq8016
-          - qcom,usb-hs-ipq4019-phy
-          - qcom,usb-hsic-phy-mdm9615
-          - qcom,usb-hsic-phy-msm8974
-          - qcom,usb-ss-ipq4019-phy
-          - qcom,vqmmc-ipq4019-regulator
+        # Legacy namings - variations of existing patterns/compatibles are OK,
+        # but do not add completely new entries to these:
+        - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+          # qcom,apss-wdt with codenames
+        - pattern: "^qcom,apss-wdt-[a-z]+$"
+        - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
+        - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+          # qcom,scm with codenames
+        - pattern: "^qcom,scm-[a-z]+$"
+        - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
+        - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
 
-      # Legacy compatibles with wild-cards - list cannot grow with new bindings:
-      - enum:
-          - qcom,ipq806x-ahci
-          - qcom,ipq806x-gmac
-          - qcom,ipq806x-nand
-          - qcom,ipq806x-sata-phy
-          - qcom,ipq806x-usb-phy-ss
-          - qcom,ipq806x-usb-phy-hs
+        - enum:
+            - qcom,dsi-ctrl-6g-qcm2290
+            - qcom,gpucc-sdm630
+            - qcom,gpucc-sdm660
+            - qcom,lcc-apq8064
+            - qcom,lcc-ipq8064
+            - qcom,lcc-mdm9615
+            - qcom,lcc-msm8960
+            - qcom,lpass-cpu-apq8016
+            - qcom,usb-hs-ipq4019-phy
+            - qcom,usb-hsic-phy-mdm9615
+            - qcom,usb-hsic-phy-msm8974
+            - qcom,usb-ss-ipq4019-phy
+            - qcom,vqmmc-ipq4019-regulator
+
+        # Legacy compatibles with wild-cards - list cannot grow with new bindings:
+        - enum:
+            - qcom,ipq806x-ahci
+            - qcom,ipq806x-gmac
+            - qcom,ipq806x-nand
+            - qcom,ipq806x-sata-phy
+            - qcom,ipq806x-usb-phy-ss
+            - qcom,ipq806x-usb-phy-hs
+
+        # Schema matches also sound card nodes and its front compatibles can be anything
+        - pattern: "^.*,.*sndcard$"
+
+        # List all used generic fallbacks. The list can grow, but in practice
+        # it is not expected, because specific compatibles are preferred for
+        # fallbacks as well.
+        - enum:
+            - arm,gic-v3
+            - arm,mmu-500
+            - generic-ahci
+            - jedec,ufs-2.0
+            - mmio-sram
+            - qcom,adreno-smmu
+            - qcom,aoss-qmp
+            - qcom,cpr
+            - qcom,cpufreq-epss
+            - qcom,cpufreq-hw
+            - qcom,dcc
+            - qcom,dwc3
+            - qcom,epss-l3
+            - qcom,eud
+            - qcom,glink-smd-rpm
+            - qcom,inline-crypto-engine
+            - qcom,ipcc
+            - qcom,kpss-gcc
+            - qcom,kpss-timer
+            - qcom,kpss-wdt
+            - qcom,mdp5
+            - qcom,mdss-dsi-ctrl
+            - qcom,msm-iommu-v1
+            - qcom,msm-iommu-v2
+            - qcom,msm-timer
+            - qcom,osm-l3
+            - qcom,pcie2-phy
+            - qcom,pdc
+            - qcom,pmic-glink
+            - qcom,qce
+            - qcom,qfprom
+            - qcom,qspi-v1
+            - qcom,qusb2-v2-phy
+            - qcom,rpm-proc
+            - qcom,rpmh-rsc
+            - qcom,rpmcc
+            - qcom,saw2
+            - qcom,scm
+            - qcom,sdhci-msm-v4
+            - qcom,sdhci-msm-v5
+            - qcom,sec-qfprom
+            - qcom,smd-rpm
+            - qcom,smmu-500
+            - qcom,smmu-v2
+            - qcom,snps-dwc3
+            - qcom,ssc-block-bus
+            - qcom,tcsr-mutex
+            - qcom,trng
+            - qcom,tsens-v0_1
+            - qcom,tsens-v1
+            - qcom,tsens-v2
+            - qcom,ufshc
+            - qcom,usb-hs-phy
+            - qcom,usb-hsic-phy
+            - qcom,usb-snps-hs-5nm-phy
+            - qcom,usb-snps-hs-7nm-phy
+            - simple-mfd
+            - snps,dwmac
+            - syscon
 
 additionalProperties: true

-- 
2.53.0


