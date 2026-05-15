Return-Path: <linux-arm-msm+bounces-107839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIJODTAIB2qcqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:49:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFDC54EC2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C9DD30FF6A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC2E47B41F;
	Fri, 15 May 2026 11:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8oG5DKO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkMlldeY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B377C47B435
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844124; cv=none; b=WVZY41Dw7CKHwrlpxHG2TbjBz8h82G4i5/vzMcuMLq2aqZDR6yGyZNqXzQBXZEzZXRZgQDBg8I1crevqyTsvyLehrxO6qDrKWOsIpAXsowMrLQfY777dsZxzHhUPkz4snJ4PPdeph2kkaQDpg3ihNRyLOkKF6EnixzZp72FbCmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844124; c=relaxed/simple;
	bh=GCagT5/UUux/qXyPO83GkqwqURmvjqqrJMXH71wcSdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PTMMxhncZYVP1dSz4V5hWpUtvAgX2oCp8oJoF4VCy4RYqeWHC5AiBmaGfLFQIbvKvd0dIUr2SKKJthYKSprSlQoXgcQBEeADP3DBuj3klL/tZuwTWuExIAmHVnP3cQxVn/g7GiFVZCzpxw6nyDzm9mUDO368i/ip1hy3cGd1ns8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8oG5DKO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kkMlldeY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5bGT71847994
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29eN7brQ9toN+Y0GHSPBAue/u/p4I7SNtJeSFWoBlpc=; b=b8oG5DKOJ5TGqNPF
	5LyiPbgpThDDTi1nTxq1Q8KafUIyeF8gy8V0lGRapCIVBXPgwOIP9iPg2a/o8bKV
	/9iH9OMsyxjScjyVs7GC/6j0nr0fZ6fy76Bpl9L9dNGKYE486Kck5tMc+o7hdXxC
	cY8NKUCIEJehGasjlml4KlNb0vlg9YlEIdtBxGu9qGSJPdX9kzzD/h8tqqDwMIPk
	mhavTKLSSoek7Z6zweiV8Yc+iRe0XwE0X9IPOofSzU6I/S7jpm423IYQHQdufqxa
	Fokzb6cid0QEIsb07AycTnxftTfgBV2exu0kcVIm7rGlJpnLmeCoiA5oE7cGdxLj
	w7KsOA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2yrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:22:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514ae0e3ad6so20529961cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844121; x=1779448921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29eN7brQ9toN+Y0GHSPBAue/u/p4I7SNtJeSFWoBlpc=;
        b=kkMlldeYo1rfte9nEf/tCXFSCBQjGyKkikX06CF2uy3+zjYfkLor+aA9airfiGpWzm
         P8QIBjY32Wkqxg/y3YEpcn9j1+KfRdJJhqnAq3WH8k+9JhEJAMwyt2CZmGOn2gmhfs3u
         AERGCh5tRvlX108sA4WNfM/fxslL3i2rU07FhAOWiG4jhPATPz8NiXbLCVhsQtLTVGLF
         w6a9t1U8eAsMp/LJMVjL8Lz9hTZGnrsWAnK0FvRGP3YIsLKrGkxqj//HP4AfhzCMdUNl
         FhSHJKNgy+rkktMN/2ozDywX83ZVLooMzMkFfB1XoFiv8xjUCfFjNlM5LNmWnUsgJ0tI
         xOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844121; x=1779448921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=29eN7brQ9toN+Y0GHSPBAue/u/p4I7SNtJeSFWoBlpc=;
        b=EK1S+S04w0YyYeomBLjn5NlBX5NjzNQtvn26cvaBnJUUCCKh/5kvOcJRv62HoTzxB4
         9wPQU5Tw+z548oeOYoI406RUvabk61AkaM7skohdIODCZ+dcdk96o99rBTEml9nqa5Fk
         z2lyCES3lfDFekeBoLbQSSr6aGcTuDs6jhBIpgey1SfzJPBL/50ePDl8xkAQ+WtFirGd
         9+gMrHmiuFPWaqXiK5KfaX6QHj78SeHxJAfTlyu5g3IvWzzVLSy90GmXGLAv4YDnibj8
         1epTk2bp0PX31TJh6P9NvzuGzYv620TH6Uq3Au7KVP/rHELeldCf3Xa6vs9v/39B66XW
         AGKA==
X-Forwarded-Encrypted: i=1; AFNElJ/5wJeq4+4IVeZTKg6S1QoA0fZJ4ceQCUM6NhSSHSGgdZQk6p3721/TDY2jm0S7/QfjV0m02gJQwbMnU9ng@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrq+XV/WT1Xh5MOf7h5PL9GKAVBgLYMhRxeaO6b4exb+uH9LIe
	9QJrCYBAohgujQdVVhx3Bli6ABr8tFdhb3rLGlUx4TP4WsMdQxZ6hezBA1HsAD3Q5YpQoeKIxBB
	PJPB3U5bJ4kESoBTNkfIoywHdXIOdl0byPZMpQ7tDGQN1aqs7adwuySYhAn/cH34RZjjy
X-Gm-Gg: Acq92OGjp2WThItQ/s7cU11CzjSjLEAdgLd3a2DcgAMoodrHeSuuzLKH6e49CQoF4aZ
	lU1I1LT9gKFBQcE3HFuxC09FVR4gjpb/6a0CF1u4HmtDROlrBbWDmtyOy62eytP22evXdG+O/Ss
	CLVqBlt/TgXynZ8tbFUUipJBaq8EBGMSB9NLluigV96eqqy2fb/LXXwubqA98WkTA6V0QCEuDJA
	wXmfR2DrwRrUMA/Fl8GMuD+gYXxnMEbdSIvfj29a+nZ9bZksAxMGrih6ibyp7J8Jm2qIbxSiQKm
	+S+/2+R1wXGzhYUZvPLme9SnGZcY4hYcqWI5b+vQzrWbsZd5Nphb3eIKY0WyXbT5yEpGUfScrG5
	H3jtDcHa7ZWiKOZyVaZqBjkIgYstt
X-Received: by 2002:ac8:59c3:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-5164159ee2dmr97169071cf.12.1778844120851;
        Fri, 15 May 2026 04:22:00 -0700 (PDT)
X-Received: by 2002:ac8:59c3:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-5164159ee2dmr97168541cf.12.1778844120324;
        Fri, 15 May 2026 04:22:00 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm14059726f8f.20.2026.05.15.04.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:21:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:21:51 +0300
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,eliza-tlmm: Merge
 QUP1_SE4 lane functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-1-ebb630de0dcf@oss.qualcomm.com>
References: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-0-ebb630de0dcf@oss.qualcomm.com>
In-Reply-To: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-0-ebb630de0dcf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1774;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=GCagT5/UUux/qXyPO83GkqwqURmvjqqrJMXH71wcSdc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBwHSE2gSiBNqQzFYHAU6gJ+cGTu6/7uoBjLEh
 xehyNIA1jyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagcB0gAKCRAbX0TJAJUV
 VnQ5EADFcV9CTWgPH1RcOSToY38XFxsH1YHeX5STBPQype4yEC0YXwwbVtSR2nIpnVxJR6q9Cs9
 QOGb/OQS8esGZpwlnLB8wXXQfYkJGKvNmT5Aw8HjJeSNOtxufLTIaTrcDPkotFdpr2CPXT7HeDK
 9/5wKGuuCVKQVL1sJBROB5lN2YStAdEEOckMBREnbeWx8463VH8MXHO3KPJrSjKeMFox1Hil0bt
 pX+hT/u/PdVHX00K0eOVa0f73TSAvxaxPCXX1yckjsya7Im14AUI67mctVj2X/BTl9buPli+zAk
 y6rFZhqT7TtdztVh6hh7EewOEQb80XkHv9Firurm5B8AVIxl7hVEGBRDRDnHAun4noK0GOs8H4l
 8E5bPHwJ3pg1Jcoci/GyQFjcHvCWQZp7nskFKNfUS0/UGfqIJU0qpllmExu0l2w6P+i6Z/mQszz
 rjxsXnGL75KArKInKem7W7zG3SWPKU11jK5uAj1fGrEfKgNI2X/Qti3zLly+S99vK34eFwZNBSe
 ogcTmqfUvnskrM+Ntdielg9tC5j6L3Q69GGB/Cf2pyP/NcCg+BFvLMlNULrUuc3STzMkzRi3lHd
 MWNUdfUsuHrNueYrORKRELGhiEQBiY+TCTwSeUn3GBCfmE3UZ5K1XnFnYdAS7NCHIJvPfiJPnYA
 Nq8fqQLHkzZAj6g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a0701d9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vTIpTUZqmxZYEWQhA6AA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfXzHFXJSe3UMER
 qI6Ghf6IU6wds3r6k4R3dyJY2vGxoe9emclNckX6FTIHA3dYXl89YuvnHQsvTYrwxSJC9j950+Y
 vPE+0qOAf4pmjmYM+4HAiicluqCBZBdKV8VRqYfAmoU+hfZ6tFFKd6Ge2ou3Wi4qabVUEg33Q8w
 V9bNduP0JoW1Qw/brOJBow+UPYNJxR6wOhPhGM+Hx35b2lYOgYuq0MqDRBy1U5p5VvjU5L/hz6n
 IcLEX+z3/VTU6inwVf3Difp/emsqaOw8ocSrxTYTe4SG3/mi8VDdXCpcOGBRwuNYrIjVt+eHHv0
 hsvrrOY0k/fObZz7o53vQvkP+BXRV5H64aYemuVW+aH8B9MnRBXzPBbh7FgxSmWYv96F+hbh4B7
 5hm7N9/hN3UzSawgP7GxqitXxZo4NeeoN8TdjBCB+HMBdKyGXEcf4jQPcv7Q0fomdeGtBYLuCji
 vNKfNHgmkTNK96bJAiQ==
X-Proofpoint-ORIG-GUID: llhiQ5pxsBLeyDpJe8Wh3P116B5BuK4w
X-Proofpoint-GUID: llhiQ5pxsBLeyDpJe8Wh3P116B5BuK4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150115
X-Rspamd-Queue-Id: 8BFDC54EC2C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107839-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

QUP1_SE4 uses GPIO36 and GPIO37 for two selectable lane pairs. The
previous split added one function name per lane. Since these are usually
configured in pairs in devicetree, it makes more sense to have them
grouped.

So replace the per-lane qup1_se4_l[0-3] names with names for the two
selectable pairs, qup1_se4_01 and qup1_se4_23.

Fixes: 1bd5c56253c5 ("dt-bindings: pinctrl: qcom,eliza-tlmm: Split QUP1_SE4 lanes")
Suggested-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
index fa0177529277..aaaeca8e7bb7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
@@ -88,8 +88,8 @@ $defs:
                 qlink_little_request, qlink_wmss, qspi0, qspi_clk,
                 qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se2_l2_mira,
                 qup1_se2_l2_mirb, qup1_se2_l3_mira, qup1_se2_l3_mirb,
-                qup1_se3, qup1_se4_l0, qup1_se4_l1, qup1_se4_l2,
-                qup1_se4_l3, qup1_se5, qup1_se6, qup1_se6_l1_mira,
+                qup1_se3, qup1_se4_01, qup1_se4_23,
+                qup1_se5, qup1_se6, qup1_se6_l1_mira,
                 qup1_se6_l1_mirb, qup1_se6_l3_mira, qup1_se6_l3_mirb,
                 qup1_se7, qup1_se7_l0_mira, qup1_se7_l0_mirb,
                 qup1_se7_l1_mira, qup1_se7_l1_mirb, qup2_se0, qup2_se1,

-- 
2.54.0


