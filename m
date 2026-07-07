Return-Path: <linux-arm-msm+bounces-117218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a3lmOuzDTGp1pQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:16:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7A87199B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:16:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=p6mu7xrS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZmNg2tuf;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117218-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117218-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8737308A60B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8A2390C95;
	Tue,  7 Jul 2026 09:10:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AB839023D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:10:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415414; cv=none; b=Ic+vJdkS69lfcYYnDVdCch0/qMLAY0ZokozVvvlpsPyCBznyRr7A+DUEKza0jVosdmF18fuOuAlSgya7XStsTincbkSQgDvboJeSh9a6GDF4b7CnZghycIIcmU/5G0vpeAyWAd3A3GRZsDlVnSJgFdRB9NSHsouufY84IZIQGWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415414; c=relaxed/simple;
	bh=pqcZl4dXfI3xeUcINWwsjZ78bDT6nSOItVcnh4qNNIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJCuHCeLtgzwfk8pRdLi1wUQy9ZMVtezQjXOCPbFPrzCz6N4pGFseXC11lvWSxwBGi7YBPoDjOrNX8ZWUKJnXceBR1p8H7O+s0weEdIk1c5zH9S5HniggEq4OYmadSf18FewbdT0/BBwvjLY850aCw2CScQ2N9Zu3j8Ad4HyLTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6mu7xrS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmNg2tuf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dtgn3139321
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ht7oYlNkxKe0u4wT9G5Vg+QiDuKRglvW8oxmwk7HV/U=; b=p6mu7xrSpOVnqEKD
	x+1QKPDsyxlqNxgFWL5b5Ysoqut9dajtbw6tBQytMTmhdo74Gza3NrM48xAwNgxT
	7ZXmyXQ5K+cPLIX1UI9mAX5NJgiBEC0tse/TGsmQUt8t/q2DunqDedhL1dpQJZVQ
	31fru7plv9DHRVbMaf7JEccJ7ZtIAmz5e/nzfxJNMmDj+BcnN445kvVERPuBoKbE
	3Fc/VStikqxouIO0HKzHoRdpJ392lQXypcsxLCSJzo7Z5q5tdKg2bVwnGLT7PG4Y
	pYvy7S7fKi6vd+xi1NqfDywgjewz93Q8fER4p9siJDZiBigW3LHSEC5kFEssBjzi
	W3W3pA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t1595v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:10:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84786d85ec2so5312907b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415410; x=1784020210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ht7oYlNkxKe0u4wT9G5Vg+QiDuKRglvW8oxmwk7HV/U=;
        b=ZmNg2tuftfb1cWPADgOZsYY1PUQxZFJhVZabq7Ripzzjz8j+zNGJkFZnfPD9GiMx2B
         av/gzsU5gGZ4/GKQkOgPMJTSVUkg/Rrt3h4Jt+nX/3drWKC/MjaULIEEFbmfz4s4GsYm
         yEHwkU5wfvMJhWm7w3CkO7ItRQl+bZi3UrQ3y46+pv4z2Tm3B5R0FRaOqEIiJd8iWUYn
         LF5o825tKRRywxCUvYo8xYaskle7U/CF6V2oN+Bfr74Pa4RTaJ/L1BE+vjphjuAGnTwN
         UKQJ3iK0VnkBNLbSAbggfO7ZIkFqSPngri1kymT5J3uXjuo17Jm/ljgvcgd5Q7+Sh/Ha
         NQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415410; x=1784020210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ht7oYlNkxKe0u4wT9G5Vg+QiDuKRglvW8oxmwk7HV/U=;
        b=e0orRA0IebUe2kl65cBjqECJLS9yFPHryWsBJT4aGazskwIl0NKvCCrcoJFyrukuAs
         E7N0A/1/286lFZj+41RQNOvF3Fqxzu/ANWEHE4BMtk0PgcbDM7Le64u1V0nWDmfeJBRH
         JRs6sKJFjOzKwXt3bQgD1lsiM6XKPsBtMHO0yIUZld6sbQvI6nKCGYXxjdZ9aLxn1MN3
         qOx4BxnhK6k9IMZZhKQ4kumfBkCECVqAWwk7brrRvtvo+xOhZo8fhOq+T5RWJYQ3e8xS
         Favpud959UWWrQI6HM9d+Ku9riszo93PkUSnzBPSptD4T71NrHmh76XnMEgXYkay6aM6
         XAJg==
X-Forwarded-Encrypted: i=1; AHgh+RpLrrmmq/jEnrly0yb0jlDgZ9jTho0HemTW5GSWlDEzNRAUsgyC6tlqS45LSQZXHZ+8Kg4/u0nj4j/E/f4w@vger.kernel.org
X-Gm-Message-State: AOJu0Yxov6IFfthT8EblOMViyn1dHE1jszh9GIY4byR/+eqjt+vo14jx
	khJrYDEWxqg4qeOXoXRs5TEEumHieTaoATrYRmai+B9FxDJrFBW0+jaHqmukQ2dWNrBo7qnJpdK
	3y9uU5UzjPixhz0YPakgwNkdC7cNZ+sQ1O0VwKrAMlqJa6sbDl6r4jf8OvWRu/Fx5hU6K
X-Gm-Gg: AfdE7ckM4TROI+IKN9HPiOdYE0JQo4Q9A1zsR7aA1rhEnqytGGEjAmtcvZgnhPfjxz9
	f4w881QYDpkklDMFPgsfjRn80l20ymBCZXQDzqfu+K5mtYX59QRTf97r6PdhN/hRrrFWdxBoy89
	nlLoHPRJKxzF8gm7lR1+5bfzp9loW4ev/PVTXWSXMBMUS/Qpek/ZuUpNF3qAN2tHAgsLl/jg6g3
	Gm8sY36h+BdEGRepspW9dNMbIIklo7eybVgbbywz53CPGYEt3/cfWOqFjqVtk4hXZ7OsidRw0VR
	yK5Wdy1GVHvUQ0eNiAQ8Uwr9qHBKZ9324odhoaNPGyI5/XWGkrB1siM2FSn3a2HrMpAhGv4hmfn
	ZxSJ1zP6zYCtQdIP71Ix6xVEsG0fCQJLlVafMRAIYaWtNBjtyBL3QwiobniiIBVguLAaa9oZIAA
	==
X-Received: by 2002:a05:6a00:22d6:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-84826bd9cd5mr4293117b3a.1.1783415410417;
        Tue, 07 Jul 2026 02:10:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d6:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-84826bd9cd5mr4293077b3a.1.1783415409905;
        Tue, 07 Jul 2026 02:10:09 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:10:09 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:53 +0800
Subject: [PATCH v5 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-5-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415366; l=1695;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=pqcZl4dXfI3xeUcINWwsjZ78bDT6nSOItVcnh4qNNIs=;
 b=5HHJnkm39slqQ9UX2bJHvZpN3UYwa7J3cDec9uIf8brWFiKJYlFxocFnTmcXBeYVowQ/gttRb
 YcS0kEcwribDZi/1DH2EgK2KkuKfaA5wiblQ548vOtqjYaLqsXfCfyl
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: aLm7NF_2jCxD0SvLneIAiDQ6_Jg3045v
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cc273 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VopqNUcg1dr8wGNk0jsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: aLm7NF_2jCxD0SvLneIAiDQ6_Jg3045v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfXyNL4gM57tHwm
 N0p2cGj1XiXahC53DVpk678bYfkPydgnpTRXILme+hdtsgOv6094rCUb23mqJXqQPDIkCTk828R
 SQRox/SgI5pcIMF1OkrFnKcToGPaaqY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX3xHp25Lbtqet
 MdlnUXdWflNHjnalWJV1tY7ZY18iPMlLSNXiv6JW9BHpHnYcigo+MKNUc2xqNdeLW+UEGtzxezr
 w/hQCi2EszcPU37yTLEXKILEuVUEKAjogoxFxtrzxDaD//SnSlfUyhvN5ppPRZhGDTiO6i0tFjO
 NYWza1CxFs5fHOvxgvG3KE02QnbP8mhgpzkvutC6ZdlCXd5x0MBvGzweOdjHl+pS89zqOvjFhFk
 2NEU0JefOjOqViHE+dP5HlMA0YA+j9Nrs8zVWyrKuJH4phsfrekE/UM/N9O4fbpk+ZfvrksEuAA
 xS61vP0WE7WAKIij5OgwF1CBN8hY0+C2S8866AwICTN5AFQvOA0fMrfUZa9yxWOWrRb1pHhS6u/
 27X/e3AUuBzPQ9ba6U/41x0Bc8NT7X///vfsJjlVYoMXq/iTMG9yR4ziVwTX74ChZ7PAIip2uIJ
 rnEeQ1zUipRhNIT0nVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088
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
	TAGGED_FROM(0.00)[bounces-117218-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 7F7A87199B3

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It is marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never
assigned an ATID. As a result the aggregator has no trace ID and cannot
tag the merged trace.

An Interconnect TNOC is a subsystem-level aggregator: it merges trace
from the ATB sources within its subsystem (TPDMs and other ATB masters)
and forwards the combined stream to the system-level Aggregator TNOC. It
carries no ATID of its own, because the Aggregator TNOC downstream in the
path already owns the ATID.

Switch the node to "qcom,coresight-tnoc" so it is described as the
Aggregator TNOC it is and is assigned a system trace ID. Rename the node
to "tn" and use the "apb_pclk" clock name as required by the Aggregator
TNOC binding.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..0c04dca5e557 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6038,12 +6038,12 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000  {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1


