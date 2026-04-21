Return-Path: <linux-arm-msm+bounces-103900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH6+LalD52n55wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 11:30:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7742C438E4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 11:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77693303B8ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CF83A3834;
	Tue, 21 Apr 2026 09:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSqRt6Zx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4mQi31+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59E73A1A59
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776763688; cv=none; b=ZyHCEqm3rU1eg6Q0RVM1XevFkOv0zFJub7FGhfXGwHeKvdzymVI6TUKl8JkNGBXxeyyk7vqoni7pO1uGOwQqqXebwCJLVBlGMLziL3CswtswfKi+tezLsgIQXpKflWsTt0xHsmgGnmKgma+XBbjMKYBKmRaicSDyX7bmzwiD2ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776763688; c=relaxed/simple;
	bh=ZNfISKpSCjCGscK8/Ib7YAmiEv+e/c+WMOCf3R0g/PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dTPt9/PYECj7LhgLnWyqiXBtbW+YWIiPi4UUAlT22TpoW94shm1ouCBcqjH9AK6W0GmD4wVTOJOREaK5CYDt89qXMaTgOVETbfRCa+0RdLIGkfd9x0H0zXPvcl2Wi/pb/vdp01TfXQeneTZX8GwkFwJ8eRWIE1vlPUD367pB9/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSqRt6Zx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4mQi31+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L8R0pN1599885
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XG0WfbWW1KDOp5vpDhXYtbdAi1HkcHqFYHF/2b8RrvE=; b=JSqRt6Zx2TClGGPY
	pZEMExS6VcQRHcHEpVMr/j0SPz/WC8Xi9eciiwDm0NptLMro2QP9hPghccAbaeEB
	zEXir5DaIo5+ifXjHJexGJLSHcmYAQ3S1YLvce7BdYigOgDPtSBsNmGZO4JNGpO/
	Zd53XcYEdtuNerSMa10xiMW1BjjwLaRydqfVgkBhYr4wGUHzpn/IqxCprRSZBIlw
	DuXxXi2Xtsm/ZKzo5NGT7hXKS5/lQYyCTDwPvDELq4PDTi2K9aK2eN77FM+6Co6t
	ohQiTqvqlocMYHOhbPccrM0TgtJenAI2+Rucws+eBJQTLSapeCMHN8oJ+ugCe+xF
	ZBjVmA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh89crv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:28:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9278587bso4583820a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776763685; x=1777368485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XG0WfbWW1KDOp5vpDhXYtbdAi1HkcHqFYHF/2b8RrvE=;
        b=L4mQi31+prlrTIEWlmHNbZ/1ivELseYWdY/oC/U4gCHyIfGAkNrgdLZtYEdbUzhBzF
         ZKRpiY+UoSgR2UVftLv7dWPtJcijdEcftPrMXQZycxk5uWED37mh4xZt1NkpXXJe+5Ll
         EN2zU3w0TryPpfC527dNnHq0M3SdA+0CtzQv3AzbsKBP+lRL5tKad9SC3x5W0OGf9Iv9
         14FaKZeq2pLhZjqO+xsE1VbmGOBOMm/n3x1RYz58CtyUFecf81VVuEA4X+9g/ZK/osvT
         1SWuRRF+GauDYBhk5GKNtbzOMQwfa7qz4/8hkSoszY14BZVpYfiOvINDtlkV0tv8HLuZ
         EoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776763685; x=1777368485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XG0WfbWW1KDOp5vpDhXYtbdAi1HkcHqFYHF/2b8RrvE=;
        b=AaMw8aRNaMpMFnI1X2vzo+FXrG0UNvQdw/sEn5RSm4SkXM8w1hc4XqFRsN2tVuZsuY
         nNv/z5kUln16Rl9INDYRZMDwkbDe9oGMp9K92M+o27ZmQAZeOrqnck6u0Oe++g6H5bvO
         ICX1C2xHRKssMUjLQakhKHbIFpeh0Di2Vu1A1Wh7heBW8PuoZKvEzasx/h2TVW3eEb1y
         a/8YoWlrisbCuxzKJOcjBPYMaYLmHKUtZpT1v3sfN4YTcTTiy10TWR/16f21EI7NaOpE
         WGaVrlVJIx1I6QHTflNRux3tFJid8ZOGydHsdaPFQa6+RMhQybkHBflfhWQaHBWZUEaD
         yH+A==
X-Forwarded-Encrypted: i=1; AFNElJ9961wkJZIx91nX4sSf6ZF6BgXmgI4qJZVRKxl69/+W/pieByV7ARVIaM8pSqf7hrKIiMhKfwSXFjxqmYpH@vger.kernel.org
X-Gm-Message-State: AOJu0YwNMPLomhtY/sZA1+g8vvc0UH+c6fG5WssItxMmjgelsdqWnKmj
	ZL6ZpnZCWS00wWgkC16fFcvKd+gTKn1e2WA38wh0i7GPLKJ42K27It5Nnbmh4w37PXPgZ0lWg1D
	gr1mQwqwDmIb3+vhLbXLNIhpACYdKu/npYNh7zPTDcn7oi6tMFS1inzW4qSrVxIZ6PJ0N
X-Gm-Gg: AeBDieuJfaQFMktYS5fwAjyxShVtJbxZB+y1mI3p0aTJZe2geBZ2I7C8B5Zj5JcE359
	sW6C+MbEC6kk7bUQM77xb5Fl6bsNTz6KbZZ45gKHsxAmD4UjglWAqGB8Ny8njTcW2BNnxOqnmEV
	hua1UIxz/9yFyzBh9uAVWYeP5cmIdR6QyixpEpdyqDVCNA4F2EWQK+aCdNK0GwmWAveUE1Ck8rd
	3vnuLT+pKn7M+NhViea6kDOhzf1IxhMHsd6hqb/Y6rtRuVLDFY2yKupBY+d2w0YAd4vPy8nS91g
	JvQfZYr/qVlVi0bCrvjBsxN6iK5+lhNcsyU5AsZyIHmm9qcXQbSlzzDvjYiCwWomwSMB5RxAzzU
	7wtq8DHums2Ng3Yw/nILyk5FVvbSAUBmQjarqKJ3OkL5/i+JBaGT62ktZO1WJv98=
X-Received: by 2002:a17:90b:394e:b0:359:d54:846f with SMTP id 98e67ed59e1d1-361403f10f9mr16859870a91.7.1776763684512;
        Tue, 21 Apr 2026 02:28:04 -0700 (PDT)
X-Received: by 2002:a17:90b:394e:b0:359:d54:846f with SMTP id 98e67ed59e1d1-361403f10f9mr16859847a91.7.1776763684031;
        Tue, 21 Apr 2026 02:28:04 -0700 (PDT)
Received: from [10.218.21.127] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614198f775sm15294860a91.16.2026.04.21.02.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 02:28:03 -0700 (PDT)
Message-ID: <743ae20d-1894-4566-992f-db8dccebee9f@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 14:57:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] arm64: dts: qcom: milos: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-12-5ccf5d7e2846@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-12-5ccf5d7e2846@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5MSBTYWx0ZWRfX83wKmGZ0x0t1
 sHV4HDvMlJg4a7CLJkFU/JzhuaaSTRopY7mWMhovCNDzpfbIixE/cqLeE6LH49T3mx+7/jf+lQb
 O8RsDM2IofF9+oyh4pmodYf21IkeRsmi7PLi689nUePNHbjAYiz/2Xc5MzRdt3h1Acwdv2WPPlq
 puIwVKIcL1ynRM3EhXAnC/TBNXS8Ljnw7iktcqcuJtom9QLbYw5H0ffonfcnfpl56atDdSfjzw/
 V2Va1BasFOYzcdElnRuxtJS5HwQ3REgo7CoODzxku0SjwcTNR/CFi4Ns4ZnNbwbkZyRGbStYJZS
 xy/boZkrTPI9IrDpD/oaLSLshCYkAkzDCC9yul8cRYbtcme1nDloHKxU9BtfEU8nVgNrSKjQjFW
 qX13JsflhdsXSWl0L3eBL+SjtaUz0oELjBAPGcRIinqysoR0V6PHW1F+iT5mcErH760ISqbnfTO
 ErXEVRhSQq1NXCuuWgw==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e74325 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Axf_PIk1QrVmbuagBqjO8QsuB1gHwOWt
X-Proofpoint-GUID: Axf_PIk1QrVmbuagBqjO8QsuB1gHwOWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103900-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7742C438E4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16-04-2026 17:29, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for milos.
> 
> Fixes: 04bb37433330e ("arm64: dts: qcom: milos: Add UFS nodes")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


