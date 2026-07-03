Return-Path: <linux-arm-msm+bounces-116271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ThPCVCMR2rEawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:17:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A22D7011B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:17:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ul47y63m;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CtXQevSU;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116271-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116271-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4723307C3FF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645DD3B95E3;
	Fri,  3 Jul 2026 10:04:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ACD3B83F9
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:04:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073077; cv=none; b=lldOSZSXab/TQzfc/YzL803k4vYxprvK3mdajuUGKsPPuoEIMXjv+y1oQMDiiB2WBzRwZvGfmPtvhRYBS99m+H0DN6QR+WomgoAFhaibvFUdM3vYsqy9f/2GCkk/B31kNgM0St4CRLQ4padNmh4Wy4Qb64mk++I0XCfpuukRF2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073077; c=relaxed/simple;
	bh=+aK9kvGHZhm1bGs/Wkf1edno9WOKBO800F/6MDlu6DY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pwj1MI0eqYSRqY8VGYAyAchuJfLI7kITwVUKicVHFhgqtl7Dg4MPxboQnH3rOn9+ecHw0j9Qy4KFhDmpyrAPyVaXb0WNMUB1UCGaxUD1gl/i2e/G089FJzDTmN0RdJMXJfSpDoFanobGK0HdcG/iKFslCqIACWix523TEn7eqBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ul47y63m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CtXQevSU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rjZ13123373
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79FJThuLWiI8wI4jTZg4M5KJaU3sfd86ekhAyk1kKTw=; b=Ul47y63mZ/6v7clO
	HAyrat3skp5YfrHzuoJ279L3m1GO3pTbyAQqkkONmw9kw0dtzOjHb+bk7DRbKcZv
	Echx/lQU5cbXKd1pkoJe/16GWkzmkG8ZN/+JjR2Q98CUZdA/favHQkn0t9nXqfub
	gPp6QFry7CrM9V6ROH8uUS2JXaqZfkYJQgL8G3E4IKl26vW90HS0FWgO2gw/H9YD
	rvrxu+3DUbWNoPsIDJgziG0Rt8xVkZf7Os9Kvp0k/4qRxenuZVrSkC6PrAcJVq+O
	a8F64Fo6khu3dCJ8k45LsQjLFb1IJmcB8I7IT9dNBf7ba4MrRN98bnvYE91aZ8Sh
	UeQKFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpcsfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:04:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e606e8f3eso25861185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073073; x=1783677873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79FJThuLWiI8wI4jTZg4M5KJaU3sfd86ekhAyk1kKTw=;
        b=CtXQevSUJ1BXqeDKhrSFw0gfEZZCaw2+T9tI9aEAfvlqGA2kiiuTu+TlQVjSYPy29s
         bL/LxzD5aDQJR/giEfO8qv9PVPixs4WsXeWmy5IOP3zH6cTSZzmBfyCLPplr/d00uPJT
         4en44dqd32RsI4wHi2e3193gVnu9FeDy3LXqo3yRA0bAPStZs4kORISBhIydpYr+EBbn
         lf3P+Yjt5MhQIcVqWOXbakUITLDy0WzNlISrMwGTW0uysYxepiQ0N8mTS1zuA/+QLGrf
         F+peScO3NIRPuAJ7BBbJXZ6ByxCktEAK+tquwuau3uHgzpjcPZKlwUle+QdWCyC0xNEn
         uKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073073; x=1783677873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=79FJThuLWiI8wI4jTZg4M5KJaU3sfd86ekhAyk1kKTw=;
        b=jcnP9Fx1aM/kFM/VaeiIkss9MyihyDw8bxTlHJgQIGcdgSqvUht6LESSqyziDlFCs4
         aXWW4Ed3u9btxHTDYrcjYsKHqoZGArcsfv4x+PftWO/uAG9zNxZx62XQHePQxnAhT4+H
         rYVl0T4Ay+xG4HJZG9NJMXX+r9RFYmbwpvkswXkksvpd7rQshoIarZpjJLlsQi4S06Ku
         ugQJS/kAmgnIsS91lH1gFPoC+hxZhti7Jdljt0f3sd8O0kOpC/FMaZ3CC5xYT1uhW5Xp
         ala7UlUwO595bH3Kv3K3Dba348O8afofBupY6PcQKPCiAl6ZzrZicvuvlzMz4eecpXGf
         MpXA==
X-Gm-Message-State: AOJu0YzBa5jOfUrGXsCWr8X2SRFft6mjH8G6xODJAvHS/dm04pz6Nn3Z
	bFT21MFeCcoR1G0uWgaosd/hsHwfcJzhtE8XIs7RI4u0aJOnODNpmdDlrS45qanoOV3uDzB3l35
	sqD6cWfr3w7OEMmPPOH+gHmHKa85mKHmHCOtY4/1Ywev0VksJS8RDSUK4TCCu9c5eYIat
X-Gm-Gg: AfdE7cnfPCcwdFt4fh2UYOfH9r7eA4jKleS/ZoVJ9t7oqGMTiU6bhwqHNcteLVW+eyq
	l+S00+Twhx3fdfDXZKD0NN1I4FRUKlLihMZDZw54jcs++1go0gGINe5pBj6cejY9R54JvLv1uUS
	nW6ALMkNdRODF14e/6KxmPZgdaQUjW6d+P5u7gArUTlxMTd+39ei8xnwq6OjH9TgtX9NtVh4iYJ
	TEtjCbB11EXjgwQWStDk1bURyKlTGVc/JwLC/Bj2qjoeIfUQv+vt2CelvX07MH0sjgZgvl8pSvt
	bFcg9IpWKngW02N4lSkIyWynbC7U7vWvoTmkUDAp0zol2YTryYsJSxaUtO6hJxgTLP+g+72ixgy
	uFm22/fp3UnG4oxjIq+4xQAmjXazOlyD3Viw=
X-Received: by 2002:a05:620a:800a:b0:92e:600d:b9e3 with SMTP id af79cd13be357-92e784e84c3mr1205444585a.51.1783073072673;
        Fri, 03 Jul 2026 03:04:32 -0700 (PDT)
X-Received: by 2002:a05:620a:800a:b0:92e:600d:b9e3 with SMTP id af79cd13be357-92e784e84c3mr1205438185a.51.1783073071985;
        Fri, 03 Jul 2026 03:04:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:04:03 +0200
Subject: [PATCH v3 5/7] clk: qcom: Add defaults for desired arm64 drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-5-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12243;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+aK9kvGHZhm1bGs/Wkf1edno9WOKBO800F/6MDlu6DY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kY3Cm3l//WeHPOULPhTHFmpuXoFzkow6eN/
 lVDiavbfNCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJGAAKCRDBN2bmhouD
 16tVD/9EIr9Rs1wZqnvLbTZdf2mOUWQq0A4nQP7tZaNwPQdAb9aupr3OGD+gok1cCm8gxTEzzKy
 KG33mPRPH+rnCh0QGYFGYpDE4ts3lD9jDWM49xaAsKjJqq8bzXOJ053f/nYQtvt10xg5agwo5GO
 9eWHONCZFt/zPMZeJ0CiUy4NxhQMPkDjkCxlCgvoZOnyzFUM4VcL2qS9g+C6lqxjdqcb8fXCiyr
 M4VpsRYONEh2BK93YR68S81y4+xkCU7uDHF+7AwRLV+3du1rQfjfXN5lwfogoFziYYL1jywwPJw
 CC7MNqX9CHw57PN1fP93LxrdMOdeu4DmyiEKmqAZ/Y+JHy7UGyR3xr/KWt/G8+wongN7JOhXKqT
 A7o7S2CiuxPXqtXy3xar0w8wkHD++7gHGL3BZn701otlBHUQU0375NBmO+GL64ni50TtTpuVE2q
 P7DLsqg/BzwoeLupwwpNXt5QXN9Nxoxm21+6Ffnrg5Rsc/MSm97nYg8/CAOhfBxUd50gq7L8JXh
 fyJ7Ch4gBcltBNR0zPTzV6Vi8TQeWhKpUII5aZr8oG1sgCS4woXlLpRPaCIUPih4d6wHt4W6R3S
 xGGs9d6QMlCqKfi7H2hMdgFiJxp6sLe22fdqutkliHmVL0EfCCsJ1/aosrGL/UIu6eJrEM471sV
 C/MRPHGDM+fQoNw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX9rahNd8iSGME
 DYjwCzI3GCUEsvgSSu5TTmrhPyAwSXc/0h9+0b3CETmbc5OPDKNHIqPST+wgjJYwOgCt+6XYGuU
 7E+wyF4RR50jnG78hHvOfuegaI3H00Y=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a478931 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=oRM-sv2Ew5iZelD02ewA:9 a=_dTl747PDKSlraET:21
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfXwO03F+H3pHZO
 laAD3Q9MtqrRDJCMV7t2CIFAdjN2FSLV1KUtOuDZ001u9rItwQFXzirHfDx0dSRVtgPBITgb2ty
 8EASz9+jtF1YqiS4ZcUx6wlTvTkLdqH3AgOokC2qTetECi0RV8JwRmdiQDs6KIR+qpj3Erw/DyZ
 laIhFmZL69sKsHywgT4FanDp6b/B2+LL/kx9i/dOD9GgqGScXh0sHF5ymW6rPc/dj5UHwjuLzQh
 ql0v8FMFvM+o/KeY9cuyLePgwwszQ7lWRoh2QhkyFEf/n0ZjWkD1USeTQD+E2CmiOF6lQ5SLKRy
 ERgv37v6aw1LPjcXI+8irYh65Wkicznp4PRI6+a+h6kqf5mAZFJ0y/f3kICXI4s6h1Q/yqiu7rZ
 KPVECPkiWRTerNe2t7Xvwcu4mTEmMSOHduqVpm1Ne2tDc14Qz1ZBdWRo2LZuid0fNgFfCyWpbLQ
 SEQvRHGn830hR2r9Cjw==
X-Proofpoint-ORIG-GUID: N-h12PMSAFotUKe8L0rSEm1niDramMTt
X-Proofpoint-GUID: N-h12PMSAFotUKe8L0rSEm1niDramMTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116271-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A22D7011B2

Clock controller drivers are essential for booting up SoCs and are not
really optional for a given platform.  Kernel should not ask users
choice of drivers when that choice is obvious and known to the
developers that answer should be 'yes' or 'module'.

Enable drivers for upstreamed or being upstreamed SoCs, which are not
yed enabled in defconfig: Glymur, Hawi, Nord, MSM8976, MSM8998 (GPU CC),
SC7180, SC8180X, SC8280XP, SC7280, SDM660, QDU1000, SM4450, SM7150,
SM8150, SM8450, SM6125, SM6375.  Note that main GCC clock controller
drivers are usually already enabled for these.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
1. Make builtin SDM_GCC_660 (Konrad)

Changes in v2:
1. Add defaults for: MSM_GCC_8976, MSM_GPUCC_8998, SDM_GCC_660,
   SDM_MMCC_660, SDM_GPUCC_660, HAWI

2. Drop the Konrad RB tag, considering above a significant change.
---
 drivers/clk/qcom/Kconfig | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 11adab354eb1..5b421bee001e 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -73,6 +73,7 @@ config CLK_GLYMUR_GPUCC
 	tristate "GLYMUR Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on GLYMUR devices.
 	  Say Y if you want to support graphics controller devices and
@@ -91,6 +92,7 @@ config CLK_GLYMUR_VIDEOCC
 	tristate "Glymur Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Glymur devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -161,6 +163,7 @@ config CLK_NORD_GCC
 	tristate "Nord Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Nord devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -350,6 +353,7 @@ config CLK_HAWI_GCC
 	tristate "Hawi Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Hawi devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -358,6 +362,7 @@ config CLK_HAWI_GCC
 config CLK_HAWI_TCSRCC
 	tristate "Hawi TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Hawi devices.
 	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
@@ -683,6 +688,7 @@ config MSM_MMCC_8974
 config MSM_GCC_8976
 	tristate "MSM8956/76 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on msm8956/76 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -738,6 +744,7 @@ config MSM_GPUCC_8998
 	tristate "MSM8998 Graphics Clock Controller"
 	select MSM_GCC_8998
 	select QCOM_GDSC
+	default m if ARCH_QCOM && ARM64
 	help
 	  Support for the graphics clock controller on MSM8998 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -807,6 +814,7 @@ config QCS_GCC_404
 config CLK_NORD_TCSRCC
 	tristate "Nord TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Nord devices.
 	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS etc.
@@ -867,6 +875,7 @@ config SC_CAMCC_7180
 	tristate "SC7180 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC7180 devices.
@@ -888,6 +897,7 @@ config SC_CAMCC_8180X
 	tristate "SC8180X Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8180X
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC8180X devices.
@@ -920,6 +930,7 @@ config SC_DISPCC_7180
 	tristate "SC7180 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SC7180 devices.
@@ -1036,6 +1047,7 @@ config SC_GPUCC_7180
 	tristate "SC7180 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SC7180 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1065,6 +1077,7 @@ config SC_LPASSCC_7280
 	tristate "SC7280 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SC7280 devices.
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
@@ -1106,6 +1119,7 @@ config SC_VIDEOCC_7180
 	tristate "SC7180 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SC7180 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1134,6 +1148,7 @@ config SDM_GCC_660
 	tristate "SDM660 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SDM660 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1144,6 +1159,7 @@ config SDM_MMCC_660
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_660
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on SDM660 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -1154,6 +1170,7 @@ config SDM_GPUCC_660
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_660
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SDM630/636/660 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1187,6 +1204,7 @@ config QDU_ECPRICC_1000
 	tristate "QDU1000/QRU1000 ECPRI Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QDU_GCC_1000
+	default m if ARCH_QCOM
 	help
 	  Support for the ECPRI clock controller on QDU1000 and
 	  QRU1000 devices. Say Y if you want to support the ECPRI
@@ -1276,6 +1294,7 @@ config SM_CAMCC_4450
 	tristate "SM4450 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM4450 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1293,6 +1312,7 @@ config SM_CAMCC_7150
 	tristate "SM7150 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_7150
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM7150 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1310,6 +1330,7 @@ config SM_CAMCC_8150
 	tristate "SM8150 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8150
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SM8150 devices.
@@ -1329,6 +1350,7 @@ config SM_CAMCC_8450
 	tristate "SM8450 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8450 or SM8475 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1366,6 +1388,7 @@ config SM_DISPCC_4450
 	tristate "SM4450 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM4450 devices.
@@ -1387,6 +1410,7 @@ config SM_DISPCC_6125
 	tristate "SM6125 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6125
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6125 devices.
@@ -1397,6 +1421,7 @@ config SM_DISPCC_7150
 	tristate "SM7150 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_7150
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM7150 devices.
@@ -1429,6 +1454,7 @@ config SM_DISPCC_6375
 	tristate "SM6375 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6375
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6375 devices.
@@ -1504,6 +1530,7 @@ config SM_GCC_6125
 	tristate "SM6125 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6125 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1523,6 +1550,7 @@ config SM_GCC_6375
 	tristate "SM6375 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6375 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1532,6 +1560,7 @@ config SM_GCC_7150
 	tristate "SM7150 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM7150 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1622,6 +1651,7 @@ config SM_GPUCC_4450
 	tristate "SM4450 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM4450 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1641,6 +1671,7 @@ config SM_GPUCC_6125
 	tristate "SM6125 Graphics Clock Controller"
 	select SM_GCC_6125
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6125 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1650,6 +1681,7 @@ config SM_GPUCC_6375
 	tristate "SM6375 Graphics Clock Controller"
 	select SM_GCC_6375
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6375 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1750,6 +1782,7 @@ config SM_LPASSCC_6115
 	tristate "SM6115 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6115
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SM6115 devices.
 	  Say Y if you want to toggle LPASS-adjacent resets within
@@ -1810,6 +1843,7 @@ config SM_VIDEOCC_7150
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_7150
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM7150 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1832,6 +1866,7 @@ config SM_VIDEOCC_8150
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8150
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM8150 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1853,6 +1888,7 @@ config SM_VIDEOCC_8350
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8350 || SC_GCC_8280XP
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM8350 or SC8280XP devices.
 	  Say Y if you want to support video devices and functionality such as

-- 
2.53.0


