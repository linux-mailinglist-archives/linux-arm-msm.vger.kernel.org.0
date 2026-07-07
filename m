Return-Path: <linux-arm-msm+bounces-117426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ij1FChuBTWol1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:43:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA0872033C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:43:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CgfMYNWZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=asvTJplo;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117426-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117426-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FA8431648B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 22:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21084C955A;
	Tue,  7 Jul 2026 22:30:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CCC4C9542
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 22:30:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463420; cv=none; b=gwTt3niyzPJDX+SoNyNMf2YkH/UjeCcjSqY/h5IntvHI6WP+lBL7Z+S1tMGPW6HpTC7vVCU0XU59EhfKixd6ghULOQxy6PTz5QTp1KFyncyn31ZcLbbz3zybYrVYBHFoD/lm591vc8lpKNs8XqVKtRfgwtNIQ5K3gcoFZ4dY6gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463420; c=relaxed/simple;
	bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RNi1jab8YZMnbJXEojmT1Sa6V3uXJ6XWyKX8RXZSlEkKqEB/+vOKbkocgqmyISjmWTmqrEfKpl3o260FqZATdul+FzPjHsnyzC5IWAd4QahEYhPqLD7MyDmTeLngIzS0b+atVmmEIwko7hPWZjzLMkMH+59+HIH79g46LlVSNLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgfMYNWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asvTJplo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5QwF472315
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 22:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=; b=CgfMYNWZdBX/GBdQ
	aj3opMyWCiVmB0q89LHsHUTw3FoLoXULVVCODUQAFamRW1lKdHirb4l1yMfRgK4V
	zxpSRF7JYTPYe+sG+o9eCkiVxGHUXoOwYbpx6mNpD7tcfha1CIQrja1U3hMwM2nA
	FkubDIe8RUrwVjr+IS34XwSNqaMoV9uRJoLsg3tpCmzpwqCGNxAxF7/QqpFsZpS9
	2DpGQBIzFnPh1sRAoW+63NKUg6DEgPCDowEWIxszQVtxwNUmZe6LbTdITv4UpKDX
	dHVHRrCYzYZmeau/j4ZInIHp9lpqSU91PcMSmofHa9U5LRb0Nl9y2lPkMew8NQWv
	BW0fTw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd1f08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:30:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738de163061so1200313137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 15:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463417; x=1784068217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=asvTJploLBkWLnLxllf4dA+Q2y4WHgWCN0jHG4YJWB8xYCfpn7QQ2w1mbM5BlGaiOD
         zWZKzKzj5lD1P+9D1J9K1+6Eky2PLsOR68xHPhok/TihFg4/+EdHpd/lN3Vq5yMLi+iB
         8gynj4oRVD94/D2O1iTBn7ubW7ndJ+ub6iNdZf6EQDrbfLFPMrcSmVf2OJX6kV8tGZaT
         cK57m3kHbMTzPEiGtLFZcHRBeDk58w7MVCnRBCq+xREA65Z7CfSMX+qyFqOBUH+4YhBS
         ulaAbXdFDnlY6zTXLgLDmE78R+6gE2000xLp4r3/b/hO3XrcE+kRLqtKtHWS8iP+Itud
         5opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463417; x=1784068217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=UswK/ZSW/B3wXql7wsPT1bmEevUSCFbY4VYkSlvOP4/GxhkNEGt8uqDa1JoAtvp4rk
         i30U9oJg3ekanjLOOUYLPd+/053xmgws6PpAnPIypwn4KM6DKcV3ZxYf6+59ri0DxbiO
         XCSiT9gSQmstrgwl0S+eUuas9uvnWtGwjexP+Gnitm8ZWuN8d76ebDDYbDiwjYb/vyko
         x6au3YoofQ7+062WcR1Xm0C5uQLVIwbol5kuYqx2IFbNrbBhiEyR0JLHELbxTbOkX5qh
         0RvOhbbQHSdxxHF9D/Cicl7obElpAio1tQgLVfP/8XC4EZUA0ij78YfFnF1RjMV1cY6j
         CEnw==
X-Forwarded-Encrypted: i=1; AHgh+RpcQuXhDzdVDrjsv5dBK0WFFwBjRR23hmEw/u5L065PVqcoC4I+7WGUDcKrV0NAuUc9R8XBItrbrHWiCul7@vger.kernel.org
X-Gm-Message-State: AOJu0YwnN3ORx8JLGJXQkZtTqm2hUufsEZSrk9fcC6jN4F86Cb/4M9Br
	3Q5NxyR1zZqAh9OjtzCfXucwHPlJtFKF3V4LnnzlQU+9fbaGKIft51k6lMJyukyfvfiCEn/eFRe
	PVIO79rBW2m+AguH+zXzASP0KPEz5bxiO5ObZybYkpbTnjee5+PI2/lqYrPjmDUv9ZwN6
X-Gm-Gg: AfdE7ckt3p98hOUu9k27p/HqhzcvWuH+QEpNOm1o8Xj5KTIOPS9ggVp9aUpHrP7SOXX
	3rnBqP7UN9qJSyrCVUuUY73EDMbWxoSQ3YZvQ9QXGxjsOmSBiuuI+VQ0cuuI/h4xZGh/ys1cUrR
	Rb4HBuXZWYybogBvwJ+b//WZC0u1EfW6/uta6mfwWUMCB2Bbj79iH3IRKH9bvcvrCvSuEOLHC3E
	l2lfe7WEyK32pzYYBaitxxRYf8uyh9OKT8Vz8cCfFFOxf8Q58DQ/hJmLTTPpi6NFks4PC27otfC
	hcFT/P3mE8yImWRooW6lOE3ms75gyOuMxxvWO7AGTNbezaTd+O2u0tvVHPo+DoWuvP3ZU/3CMK3
	3Br3lZ49UItDBqc+6MsPbuqaYlhD6Cz038vMShRnl8QCA2zp3ioTbzq+uCp2dFCvhPLcLDaZ49T
	rHRhnaL+PyngEmg8X3btLOfevP
X-Received: by 2002:a05:6102:819a:10b0:738:2cd3:2b28 with SMTP id ada2fe7eead31-744c21fe8c7mr2219849137.8.1783463417465;
        Tue, 07 Jul 2026 15:30:17 -0700 (PDT)
X-Received: by 2002:a05:6102:819a:10b0:738:2cd3:2b28 with SMTP id ada2fe7eead31-744c21fe8c7mr2219818137.8.1783463417032;
        Tue, 07 Jul 2026 15:30:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:30:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:29:00 +0300
Subject: [PATCH v6 17/18] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-17-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGpNfaqh8eD09/9ebEAKHQImNV79crVg8ysUpmvNI9cK5jX9/
 4kBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJqTX2qAAoJEIs8ij4CKSjVyLQH/0GE
 4mGVIOZx/bqtvByuFLo6kSLLoJG37X90IkFC2o/Wv5FYcjxJAMQFN/SJQ+BBJEdL+BE1+jZ5Qd1
 KV0wqLbNVspBWgs0p9rPHJEb6ZudcihD52qtacYIXAvYceQZakmt6MzRkDpydBZsCQLhm0lkhnY
 /zpiTUxKHQztR5C7e6OgLkt7kIQtOThbdH7CluNXlYEs9/OJgUz2OTbzi8arS7A8oVKwsieHJLt
 vUHJ6zXu1L4VXWZ0G9AUXOQmJEUtr5JDxQVyyhDZjd9YZbdjYUiGFR68KUE6uINz7EOgNH4kCGp
 SXnIOXI/BFb9YjGpnyuRuzqT6D5THQtO+kVr6AA=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX+JIYEzD6Nacc
 zg53Fgm41hS4Vy0F9x8lpJnHgSG0Mwm2Brv+Iz27s0gGgVPzH21byUVrOCZsHOKszTw6r7UnP0x
 pNqXagRVBwBuir4aPHSaCLKU4NtF8CUxHzwB5GsvwmIdZalBgKWtZDAIlUNt0OhH4nuENI27T4H
 CYEpMabli1AGvwBGFlJiySXab+fKbIAbkNwa2mfFlbRhcCJgHWy5lfeAJTc7pRN1xhhqZUgwnhF
 PTr9Y6M8oXVmgBUPw6P/3s4tmoqqqcys58I/xTlN8TPMaocu4pZVszcP8Dy7Ae7beIr8LCLFUBT
 hZiiRTaYBLLTjUwxa2cK/QAp3HG+QPELQdg5/mbRDr5Hx8hqopTvuGSM962J4ox2fUZMlrjydLh
 bHfX61f6f0YjbltFJ+ZY7m532t+fKg23wyaaMNydx7jgJIhQQDuGalwKxAB4eUFoFCyOq+8pHhj
 C/HzpAihE9hhUHOMrvA==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4d7dfa cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4ldMYZ-nzf-nUnInMJoA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: ZO-BO81Hnnc0eW9Se_fx6XT9weKG22qt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX/smyQkdNu5ln
 8wGZtkZ1CGL2msdBc4R7CaQGS53WNz5BjoA68i5+Z/2R1HYv3MrM0Rki7ZHeBE+IJLhxKKEiNdx
 UWSnS7/juJt2ravWF2e3AcRXefpjufo=
X-Proofpoint-GUID: ZO-BO81Hnnc0eW9Se_fx6XT9weKG22qt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117426-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEA0872033C

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..3c88594eb1d0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1118,7 +1118,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1169,13 +1168,16 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },

-- 
2.47.3


