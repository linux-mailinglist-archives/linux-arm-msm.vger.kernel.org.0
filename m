Return-Path: <linux-arm-msm+bounces-115306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HUvoLktvQ2qIYQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:24:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 361EC6E11BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:24:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NklSeFQF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FfbsMbkt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115306-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115306-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23F093065E94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EDDD39D6DD;
	Tue, 30 Jun 2026 07:23:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BD939A048
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:23:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804185; cv=none; b=ptidnsA+AGsPM2jk3I5SIJm9vGzN+wltlOt7iD4+eHvqt8jTe2otLx3C+/YCEf4zEyj3LMSPTy8ALSD8vje0xm63XVNL4TGd5HP++tw5xHJZ9e0UlfW4x2ABc1ERoFdzXKTmqXTd6ATx7VSy8/Ypg49Eh17DpvnKHVxxyQXQDi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804185; c=relaxed/simple;
	bh=PZ1XNXCW7b9cydEjIO2vFBBFLv79PQzEbNvAVpI5+nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0U4ZzJ7rpgdgkEIiQi91ltOTLbT1cSQM6YIhh8f6g7tsu0m4mf2MDhhsXF09xwmq4u7zt0yTI70C3OSp+2TQLf7wIBgXxXBMrxsxa7Zbo/s+5zh30zDamqX5X15HzWFVe9PRBu1cfKW+JXDi51V73Q9ucT4HUBEObJSulOdVNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NklSeFQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FfbsMbkt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CLeF999684
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8CaWce5TrqZ+S0f4vMpdI7oxRpV1Eg4sjuMXi8VkGg=; b=NklSeFQFckZbheRF
	BDJQiSKwSsXBJE8zju1pn+sNdqBrdohJmsI9onF7wuY5eEFjsva9FqA6aX8XXBGa
	yw9E4/bi9iNeyhnkWenzikLpE5/n/PQOHXT2rJ/I9nut1Ht5xL5Vg7XSGZSFhQNz
	nd/qM6x8cNdHuTGw82NAATEJ9WRbjD1P0GX5XGbgPOAtBxhOH/q4goUTEum30LRk
	7aFA33lwHJQ4LPBikUVuhm+25Tu5WVcliZHp494u05lKxRou7CSvKQWBekhLr87s
	daelJwilFXxTVHxb/B/4tyL6mnS3tGZpYT3QL4vUvSPLsKMUleOPTQ60i28hD52I
	B2+bcQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j24qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:23:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so309265685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 00:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782804182; x=1783408982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8CaWce5TrqZ+S0f4vMpdI7oxRpV1Eg4sjuMXi8VkGg=;
        b=FfbsMbkt6jFLUqL/L0MyN5eYOSgqwepeURDcoor5uMCZZjSFRbLweCj3yKuqfRxxXR
         EotxMZ/V6riBMGF0ZxTBbPpaNaHgpF5HlClX7dahT+lY0pYO4Ylqp/LH5GBKdYyks8Bx
         aXslUyYZ7gMHuPTahySlnBNQbyvWO6ELtBqn1+fgiANLaJsiVA6wbgyXkqpgdvYcARjE
         xReY8HBi7vOGUgd4oWv60MnSGudMRVFrjU9QFJq4cMaMd/ig/Eint5DUtuYPyH8bdamc
         S3hOJsN2t++5bLtfYT0I0ygxutNspL522/RTeLlpSLx9eXz1E3gkw6PAtWuVTbaCiPk6
         UcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804182; x=1783408982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8CaWce5TrqZ+S0f4vMpdI7oxRpV1Eg4sjuMXi8VkGg=;
        b=QDGuBNFD/qU2yU6wPSxN9dTHhPZl5q6sXZDdqMqViPlxHOf09sFcvMULfby8HAK1mZ
         EPR0SIzT2ivUjvWpR0L4aGRAWMy7+kDRrb3QtsMtEGuDh72HgyST/fdE0oibhA0n4M1g
         xMtFKcn1noEkkWm5DcMe8mAhW44jOUBTfXoAltZn/KTDGxa7M4W+foiyiUYkuKB7KaP7
         uUHFzM/N3MDDr1BwMrj1PHORSC9HsUyYdLv5SarkISE0SECigR8EykrR3vMXHBpl6S8c
         onC8vKwEagvN1dpMOp7mDEY9hTKsED3T3lwbyMR9FU+T5oWDeO9jbgq/KYRrKKPvTA6p
         0gBg==
X-Gm-Message-State: AOJu0Yx3ySOgPTKWVMNweUW+ehS2QCUT7u1+Y6pB579Dp0XFLOse60Oq
	an1GDddv+9ur6HEHkJdmy+55XVfzwyaw2oIA/R8UdDX0vU7MU1vimECg4z9Q/Ofz3TLBXq8wonX
	QZT1IUDNXdPT0YCYpjRNV/u4avkRzwJqGKnOy97A3W93Nm8Ssz8HhIN/3vYgGEigS+Fsx
X-Gm-Gg: AfdE7clS80w9oJVpFT+9VrZv2lOoooS9po4W9hOXrRNp5ko6KTqF6yXzLPT7RBM1H+Z
	sjysxxT9Jv+qymsEGmS5yDhXUIUKmxzp0ehWGowKxxDvHuo01b6jl5ndJvPBO9py1EZ8AuQTvZG
	CjFYfXbRUp1yE+psPnu3en57jVdKaHbXs51sOmL2cbkkqLUZRWJhPFS9nw5gsNRSCOzFU4C+c6b
	ebrZc1qbqNTnxK4qUUX4RpyM3sNIGWqvXbYjW+ZGQ8elRJBstOavuetNqD6U9iYcexWUbo/MGhc
	wj+H9V40QxYEOHgxyJ/XLG8Rae8MMu6gjGSYA7Qej+mtdUYPNbhsT1oX4mk7zqq122MmH3R7KAo
	ATC9U2Vnq4oN64E4=
X-Received: by 2002:a05:620a:f0e:b0:915:a6ca:f12a with SMTP id af79cd13be357-92e627e74e3mr403363285a.54.1782804181863;
        Tue, 30 Jun 2026 00:23:01 -0700 (PDT)
X-Received: by 2002:a05:620a:f0e:b0:915:a6ca:f12a with SMTP id af79cd13be357-92e627e74e3mr403359085a.54.1782804181147;
        Tue, 30 Jun 2026 00:23:01 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778fac3sm4718622f8f.32.2026.06.30.00.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:23:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 10:22:42 +0300
Subject: [PATCH v4 3/3] arm64: dts: qcom: Add Eliza CQS EVK board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-eliza-dts-qcs-evk-v4-3-18cbbdba6e7e@oss.qualcomm.com>
References: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
In-Reply-To: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2559;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PZ1XNXCW7b9cydEjIO2vFBBFLv79PQzEbNvAVpI5+nU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqQ27MmpMRzUWkT4bwkvoZwWD1hrqazLKCiB8SQ
 UYWLFcpiWuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCakNuzAAKCRAbX0TJAJUV
 VneiD/9cBoESIpYNMi46MSIdkxtLCeO2gxv9fznD9UuJQhIy+p9223CgeaHKEZxGz+yETQX483P
 RE+s7svUdBpsWJsLcnyEXD932OFqtyKCM1Liz8frx1pDGZ39Fn580QVo/UNnGKxLoiRiv4OBXVD
 6HHTXUee0rsxz4yb8jqsE1bxm4MYXBYuEiE7GySq+YeR+RgMPSD9v5cy5TMCC7nZrrmjlGAp4ql
 +zeI0P6MIxVxrIx5eFLKsn9SaBrP/swbqvGqcQsa1LG4g7uycEHOU9vAvwP+7WSK5bk2qGdXQ0e
 m0BNL6wydALUa8d9Sq83y+JaL5q0VlBbtbDYhKi7TW5L5Ctfzq8I+Nig8b4Shhcv14HzkL88MGh
 sSDyDi3ko5KFOF3P3nxNCBWL9XWg4U3n3MnPwbH4Z/4cT45tuBkLMUapds/IejqoZxFxeQxwjYr
 q6O3GSRzpsSW+UMk/5Aw5IDPJgsKbaX5Zj2juLxbLJMoTV1AM6oq5pIktyrICj4Qk9dd6Welw3u
 /0NlC9dHBciYQwxd4qMUTXmMBRj63GpMuTDbd8m5t96E5GBIalueKy/axYfGVAsFAD4LPyrPH8T
 qj/qbEZg6dGnCpcuFPUHCQ2wD/ND1+w3/58tXnw/sqwUUXENKu7TgFUfbfl6grfXBIToY1y5fO1
 Gebw7c7+z35mBdw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: UheO7wW1EyGgeUfpxFeeqeP1a_Na5Wx6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX5pJ0LzUr+tg5
 sk0/O8dwfyRYPpcyGIsDC8BMxXZStElcpOv6XvHhSCGjzbiR9HBS/nC9qABVJ2K3FGbXXD7b6QY
 ogMwFxmmFJexMaRTmZhY0VnGQg9Fjp38PSCTxVGl1kmMG+U/mNlnYOM9HpOSx5HvaCV6+KvY0bi
 N7OFG1eqRgYk6cjgJgkcUrrtYJtCed/5VKGUZmdezhSQb5UHjMhBk2biV2i4/DycLVFgjYuywPF
 rSexjfznkup/q8237OXawLFHm/SxQVAVb0C5oLuu/CPRMy67g+3zdwnL+5RQ6nuoc+KL+hDivfg
 RB+vdOSNx0baOSSGjd1ZmtEo/Bgyz/ZttkYmbaYO/Bc7qJXkgEfs5WK+VdLUn90nVf/0+fkaXqh
 NGtdk4URJm8k5CL3hlZHJqpzppZT+ea5HMkSYSrIxw41Sf24e5DKLb7FApe/WV4QagYGj1CkRwb
 3roKCfGiE/vEwXiYc4g==
X-Proofpoint-GUID: UheO7wW1EyGgeUfpxFeeqeP1a_Na5Wx6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX1bcglMPyoyVZ
 +nfzsN1nAQ4EA9IOyvazORlKcNSk5uZjbU/STcJe//FzSUtUkBTvx0FkbMuzPp0wEQRk10oiXiw
 ig8ipU7lB3oa/EGh6vtKUm1Z8u5kNO0=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a436ed6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nfd1YeTbQLvsyS6wM0MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115306-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 361EC6E11BB

The Eliza CQS EVK board combines the CQ7790S-based (Eliza) SoM with the
common Eliza EVK base board, which provides connectors for different
peripherals.

Add a common Eliza EVK dtsi for the base board bits that can be reused
alongside other Eliza SoM variants. Then, add the final Eliza CQS EVK dts,
including the CQS SoM and common EVK dtsi.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile          |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 20 ++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..001e18cc4bc3 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
new file mode 100644
index 000000000000..43d428a4ed2d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
+	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
new file mode 100644
index 000000000000..e47b24f8b827
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/ {
+	aliases {
+		serial0 = &uart13;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart13 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};

-- 
2.54.0


