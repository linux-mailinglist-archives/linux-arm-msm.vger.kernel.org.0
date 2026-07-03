Return-Path: <linux-arm-msm+bounces-116268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DmxyFuyKR2roagAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:11:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0658F701096
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:11:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JWpgvTlP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TqzQ4tPA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116268-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116268-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E48F3106CC2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41C23B7B7A;
	Fri,  3 Jul 2026 10:04:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284C03C109F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:04:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073066; cv=none; b=VkOobrNaBMsGTKURFmd8sCLv8ku2ixXBQmfAi+ynFL0jUNzdH+PNsxizhCWEg307Bt0Hu+XzuAHhMCBoBJKdY0p4tWappupIfHNMKuZcbbciyKx28/TH6FdGB/4l/ZRU3U4xtGNYcrVLByA6vDIVIYOeVcC+/qEf1+/Tsqptl0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073066; c=relaxed/simple;
	bh=6IUDRPm8vWXd3Ap2chxvIhrLJKPJP1JURTs7mxhVP8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lXWtLKVuHsVErscma3pnQsn/RVE3gytWzVoG9mVb5Jb5jptYaMlXYSxuekJ2EaVLrkyoS2koRUJ6+Q4SUwQYizJYnQ9/BZ1EEyoo3HcyGVBB/iq2SX60tdwG6qvzQp4hp690qRGZ7rWxffJ2ZEslesAk1HNmiOBi/K6SjNRaGCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWpgvTlP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TqzQ4tPA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s0kp3124210
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vzY6VtgRaXQm2ALYg/hWmUCpgwFNEblpl/7KboAIqFA=; b=JWpgvTlPz0bQog+z
	NqyiIGfmu2cWZ3ArF2+0yp0CKPB1aW5cBFlIwbu4daYbG+r+wVThBJOo0TIUtGU/
	yLoOLXBBKVSzHPtKgK4fa/GGJrJPwvbg0GawNSZ6W9dTPUacfSaxdkLajZElBZnM
	f4BKDq3S5YVEovPWlDkVsMMVbhkkSfnBk8tcQb/rrH0e0QglX7TU2SGS+MG0piKx
	tqNjmuxgfmfZCU8VDvOqwYU9pzfRbGU1O9Yqa6rGY5dep7mWvYES2Ixv9HWhDRtO
	7Ej6N1myQtPuTXCHvMYTFpCWLe1DfjBtogtWPg5ZYXfDltC6+VV03E/0PCAuuktJ
	nnQKSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpcses-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:04:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e695a3b28so159318585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073062; x=1783677862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzY6VtgRaXQm2ALYg/hWmUCpgwFNEblpl/7KboAIqFA=;
        b=TqzQ4tPAdpsVI3x3rGHhKve8Vx4ttMGVop7G7p98HF/5OLMNsAwx6aemyuwHSBRFLJ
         tAhQFTBYwVTPy9FUqzttWwt1TyjmeWa3I3o8yLarI7uG7VzLARwrDQvhCu2xqcM/FVeg
         GeqjdRzL0ImNL8WrIdT9SNQ0LrT+EoZUQCtJSWSqSdHgERfSob4VMUa9i2Y9MlVblXJy
         bCiyjIduF2wkGqG9WcW38Wi3nFxcLzjw/kyp91ORCMcSqSZGJoc/3TET+NOamaaCBYVk
         vbv3jlNbVswk0y7b3i0/R+zDN+ixeDo1gghOXYsdQE8dmmHGW/qMdP4ObIKrsY50Ei+h
         VKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073062; x=1783677862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vzY6VtgRaXQm2ALYg/hWmUCpgwFNEblpl/7KboAIqFA=;
        b=LxFJqdSLCioJBelbCSkS8MW02BwO8JniYL8TFjAjiYD6fJhqh7Ut7DfxmBM6qlznue
         91PDAncQCPo4R5wTnbVkx7lrJMACWoL0YUKkkfVSdV4ZoJzMrkBuaPIEDBE4vypIGRNR
         fUfWHpkC7iHRq0SVjbWhq2GCc0jewFPxG/C5ZCfKcioAmYo1k40HqwbBkVi2O0i6uFjL
         wKBFFAzoSdMwkBYSGYKiBpRzcnnhkt4HcrzgVnCNTSXu2OB1hQoE8tI/4gYQmZi0ssRO
         SDk7gQVErX5bD7L61oRnaXzV3DoQvOUmtJcgofDA0h0EdQZhBG1R8oSgWvwi/qpRrO+D
         1l+w==
X-Gm-Message-State: AOJu0Yyev4cfWa8y29Mb+B0f4Zq+5DStiEVPmQmP4aGgODnGus//sSoU
	HrfwUhc6OsaDv2G1YfBPY9cfCCJhYMyT1H4IDItdeL+B8nrVO6I45YYIo/r7neEkCdaEOkUP1Jr
	f2I3HCm3rbxDOioMOMlkcVEQkl0IzqOeXnuQmY4O6WKYi04x7nNivZCX6dhEy9kpH27hz
X-Gm-Gg: AfdE7ckDUVfLaqAKr2dfmgp52CqYOO98f1Bg46oAuXKPmAyTFialbeeSwCUkW4jgJ1d
	+ViPJO2vmUf02PDIFgAvZnCUX/uO2CFrNnwrc0pNh6FBXfP7Be5bCgijgZGJIhX970hrfaId4u0
	o8McM5BjA1AGkET+PCrV7/s+1mb9tMkibWSe9JW5a+xoLn1N5bxm0l70BS28znKtu/ZGqEEJuOd
	qxYWO2w1Xj70ovobegXC96+fGq35R41/m2Q1CpT+zorpBGk4ihp2JBAXQI9coHKFosw/m6BfZDE
	DeGJk30xDeYuZw2t6XzSdKqhyDim0eBfWmHzVwa58kn+eRUvqg+faarC0fzD3Pt7grXIkuly25W
	H0lfJTDrjBQyuyh5c+rJMpQwdOz7256qiclM=
X-Received: by 2002:a05:620a:288d:b0:92e:5b63:224d with SMTP id af79cd13be357-92e8b50a646mr388577185a.26.1783073062453;
        Fri, 03 Jul 2026 03:04:22 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:92e:5b63:224d with SMTP id af79cd13be357-92e8b50a646mr388571285a.26.1783073061913;
        Fri, 03 Jul 2026 03:04:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:04:00 +0200
Subject: [PATCH v3 2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-2-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6IUDRPm8vWXd3Ap2chxvIhrLJKPJP1JURTs7mxhVP8o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kVqxQIqKFkGTfTuOe+2a9hTQwLHaVhoVBew
 UyZ6qrLjlWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJFQAKCRDBN2bmhouD
 18BhD/9gxKiAWPubM37j9jOGrQ1wOEDTmfvOxGim2SUQHd3X1MB6Vbe1cn3BnrCgzayktB5J2h/
 QD8pe5JM1nO8WV9muwgZF9oez7XFzdWmgNpTY90dMybUcP4I3FIHgZyRsuce+0TT55yV5Di8znq
 byEBDJ3LECftpEV+CYfv+gIoXzqAlUUZlepmdJRqGjYsxe3f3UhHcx8yQgdZu2Du9CuVeQQOP6Z
 xtZGY0XCa7/AcwRmQnB/82jv92ZSg3U8bK8k2pifkAO/kBMrrzUKRwNGDHdQ/v2C6gDL7oJeqUJ
 6MpatpuUxCbLkahxjVQZHjEqgfmuQqt4i3nWcNZoiLlYrZzJ7wnxDU4mfcTjWllnU0C3UeU71b/
 Iv79p1CJn82HJmxE4CfLHk8oo3U3z1Q9For6whQdgwPBxVpQaWdd7okTEbeCYL6lLOK8+daAeXf
 rqnYuugGyu5JtmSkgvToOdQirlWSCzFdUPuzdrLSjc+03zqtA6jFVe5jvUTwFcFmHIgU1GrKtsr
 IVulZbTZtLZDF4cWICgoIdVdO1z3pXyHiCgvrEkwk+vERdajNJ6MhePKE1fDJ0dbGn9CfH+gey2
 M25aNpNHKY3J4bnuACGgupYsVcaVqekkUNPX8pjqmVbJKgQbhxmsujbIKKxRP6StPcRVnkawuAJ
 AcE8MomTP14zgAw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX2GhtVFumOe3I
 gQoJHrCaTd5BttXARprjvUPSNnAMQiRXahL+plAM1Bu87zqEAJd8VDJ83mtdzA+D9su0MnQO+Pp
 McrORqAFklv8sK/aTJrN4DuZrUil0qI=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a478927 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZSuaVHzWtUHH4nz7hFsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfXxprVGUcYQCY5
 9ckBqGTwwP87H2d0+qwWdmf6/0duc5a4tG1aQu4EWloMzpoeAqNyiaZ2j8AYtjlmz79UIWWoCUL
 faghFlP6lAmnXNo6Mir1HgeLXHv9BfXgMU3DhvmA7QJWRfLp4z6wCAht9A4kG3QTeF7gZ9VYhcs
 IdOFV7oUsxHVAQFEnLLAD3J2iMHPJQ1YCXaP0uBM28S4rOgs3MN7/mmiUBNpGSBBv5OFejnN5sv
 +RclySGkiSdHiBeMIdT7kGrorC0qop2wY4kX1JLBhTWt0wClHRBZOMYXwMTRnfqmD/CEi5g2d1z
 1wvZ4Zj4TyjK15QDJyGI8xamzNov1RtOr8M+uLEVlb9MgaJir+uQxSkJUagrUgnZA3shI5TOILO
 zfgr/hqHIR3hcg8TNxWf4sCpVECq34X418RWINgLFoAlp791u3JxhSJH3nUl5hn4B08YGlGcglt
 xiBh5oziHdnP7Nk0l6Q==
X-Proofpoint-ORIG-GUID: yjzt_MtccRPZS8My2KPFIKc71J_WF10d
X-Proofpoint-GUID: yjzt_MtccRPZS8My2KPFIKc71J_WF10d
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116268-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0658F701096

IPQ4019 is ARM 32-bit only SoC and QCOM_A7PLL is used only on SDX55 and
SDX65, which are 32-bit as well.

Do not allow building them for ARM64 to make built kernels smaller and
user choices easier.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
1. New patch
---
 drivers/clk/qcom/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d4f80c6953e3..f07455328e5c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -250,6 +250,7 @@ config QCOM_A53PLL
 
 config QCOM_A7PLL
 	tristate "A7 PLL driver for SDX55 and SDX65"
+	depends on ARM || COMPILE_TEST
 	help
 	  Support for the A7 PLL on SDX55 and SDX65 devices. It provides the CPU with
 	  frequencies above 1GHz.
@@ -396,6 +397,7 @@ config IPQ_CMN_PLL
 
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
+	depends on ARM || COMPILE_TEST
 	help
 	  Support for the global clock controller on ipq4019 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,

-- 
2.53.0


