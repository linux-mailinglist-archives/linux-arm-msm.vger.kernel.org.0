Return-Path: <linux-arm-msm+bounces-101417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN4jIiXkzWlVigYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 05:36:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5535383329
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 05:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9262730790B6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 03:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B8C30F95F;
	Thu,  2 Apr 2026 03:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/LcCczC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzjZJ7SW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDB421773D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 03:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100654; cv=none; b=BHR3yI4hAHXGzJYfjMfX+1Ohqc5Fdr5fMZfuJ85q2tEvaH2EOT+4x89LFrRQdYacFCk83ZBf8SRkjwi4HT5S2SWdsxJdB7Li6b9QOvcK01QkRJq5wTdUYHs1yZ4Ld2nIbmQb+XZG8cA/WXjEA4VFiT2YtYe1X/dr/vASDfYZxkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100654; c=relaxed/simple;
	bh=8kIa19Ekrpc7EhaxAZctHPg+VCTd3Xh4jwwlgIM66NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELiSocJqSXYCA6LQkP7w/R4LuT6rNEa0PZLbPZy8dLXdtE9z5B3sMG580hQ7ScfpT159dhXi25p3QcQvKrOiqRFALiEbHRwumCAOBQDuTxbJ0ECzQK4QynmXMER7AbbeVDleOVqPlcNxHsWYscuMZ4kctKbW3OlyHlNoJRqZW9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/LcCczC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzjZJ7SW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4Fmd1424683
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 03:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1pqEHhYwMMVIe2koTgQ1gR5h
	4w4HzkgIGLpFjCG7OJ8=; b=H/LcCczCOw4frN2ztYEk2U6S5jJBbBh6YmGq2xd2
	fyOdecXETV5YO5d47WUiNW8WDJN07ia1Vj3qDiGo7ipbfmIY5McG+OApQQuuAJZ1
	cNiTVju1borx0F8SerGcMsGJpIU2zWjP/OdlfLX5PcgMu4dOkSVxl8haOMc4pUR8
	TLxpfIJiwZy+hV5znwpzxqVKSRJaO2XjaOoubdxoeWQQH9m0InautLf2l/YbgTfT
	FtFKgsSbb8O+0cAQERACPJbl2CC6pdUpHl7RMv2AcOLg7dlhDQKgi1H8Z7o4u4mR
	VLyI+/QScLHoVGK3BoT4Hvb9kSRQwKf0Zkl0eEosmEKwNA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9511anky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 03:30:51 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12a77b008deso2139193c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 20:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775100651; x=1775705451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1pqEHhYwMMVIe2koTgQ1gR5h4w4HzkgIGLpFjCG7OJ8=;
        b=PzjZJ7SW9PMMyM/5Vwj7pUOWnMdW+ljfiKDRtYI8vst3BhzPEOEOkpPoiSHmtgvID2
         p/6A7laiidiWP1ZsGtY4qAV+tv1BmrQIJmU5uiVrYjEWVsKJviNTn/DBx5BU6HuISVEI
         m08Z3h3AKuzx8WsGZTSv+2TE1xhdObfwheJwPri2cGLLOan3nWUX/5GGGvxnFAIHK9Pf
         JDGFTlTzB6eP3wUv4uP6XXK4bDxSL9OP7LWMWOcsgSVlwBhScwU5CCJFpusc0LhWYjMN
         JT8auQYxfbQIQVBeqw3tM8pFpwrD4w3uqttiye/mO4RsHaHsotZFtAjxfrdldXDbN6VJ
         8sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100651; x=1775705451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pqEHhYwMMVIe2koTgQ1gR5h4w4HzkgIGLpFjCG7OJ8=;
        b=sWGapsE1tSnVfL3fOZFtNfeH+wJQgYgBTeHno5o6LwtPNRWF4LK6ctysrz4U+l5Q7D
         D6jQuggv9czLpv4qbaMnZvFWaR2wFti/SnbesGz+8EIMsC8wabhwjYRz1cg759crvZtB
         0Xqy/InF3mLpao0tnYYozNdZ21F6vIo6gfBHHFV270863lHmLxSrGhjuSWwkc5hVuu0N
         nU4Y4kj5NdnmFgM96/DmQAeWp6s/ApY5FcN1jKnVPrsTc8rTya0/ufa+hhCmQ35Ttxzm
         kPsJOQcOyzXqQ131cAe2y5R+P/Gqckfcz1v4rLfTdb8lMLryOA6OSD+4CK8nwhHIrMpo
         Zbxg==
X-Forwarded-Encrypted: i=1; AJvYcCVNh1g5zjRM+IMEv/njBEiQZIuEMFkyZhvVjighynVH9cNH7wrAZVyqXxlEZTFwRQGdpuGlCiNolTHa+BzQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwGek49MbVTEmGBFjpxYjddEeDbQuNhNvh7AcMvctBu7xqIt/Ju
	Sg0xD69g3eJVdE44Cac+BhvXNQGVy/wWuumWyJ6ugK5e2lIHeCuYMStmzjQZ7ueHHUOZCtR2lut
	GI3hZxRd99Ekn+egUUwNn6NVydPMXImyhtbmUaBp0MW1zqhhaTXUy+FKlr39OerGXLDrr
X-Gm-Gg: ATEYQzyCa7oaN6SxalPdMf4MSwq92XJZjp58FGHSlQ30qG9+eyxZprNxiwW5zG2p8Pc
	+ezIZQ/lR7idlSBXNz23hvjGQdbTUvyigupcPnaeJJVGTJAZuXWgDcLe8M7uEvDIcCe6hU8g0y5
	5ovckSqsevS6nbj4MrO39hgrHi6pp29IpqLBQhMknTHjLgFG1YwdbdtdqrdkhL5iy7ZUOeWfe+z
	+bc+LvNxTNNM84I6bR/k8lDBEnysJYXYMfJpsrCZGENtnAV6LGfYwEmKTkwdQ45Xbtlu7+EfIzT
	peAdkY0aXPnvbe7p41D89LQ9YmZaEuXyOAZrbV3OxjG0S3oKIS7kav1PEZzQC0XrXcRI4lAK6Ad
	FHgbNRipqCQcGWCEYhr5tEEKtv0909N4vtvQTHbS9IStVbKKS4C4NcuNGWGVP0Aet
X-Received: by 2002:a05:7022:458c:b0:128:d5f1:d594 with SMTP id a92af1059eb24-12bee639048mr1107265c88.10.1775100650593;
        Wed, 01 Apr 2026 20:30:50 -0700 (PDT)
X-Received: by 2002:a05:7022:458c:b0:128:d5f1:d594 with SMTP id a92af1059eb24-12bee639048mr1107249c88.10.1775100649937;
        Wed, 01 Apr 2026 20:30:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd651aasm1200374c88.4.2026.04.01.20.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:30:49 -0700 (PDT)
Date: Thu, 2 Apr 2026 11:30:44 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: Move board nodes to common DTSI
Message-ID: <ac3i5MIlEQ6y9SNp@QCOM-aGQu4IUr3Y>
References: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyOSBTYWx0ZWRfX4I47gKlx33Yf
 7WVcHf/xeIn0xSpbdEvgKjCseKDZY2tWK+GZ2L0Zq54bsnObMa8HNDRin3e6UyDcAEzg3SX0GYC
 3yO5+bYEHeyk789qdEU4WjxWV0Hf4qjaO2OpI20oUwTdPaQVpy6zUKIh+UkH1n2U5n+1ObIiy48
 iDnmmhxxwF8eJlXgy7K+pS5/VLs22w3fWdd9rknfdiXf/927BZoht0NupBFz9q54L0uQ51oGQmS
 RKdAc32zRfuOEEUYdMVKuAJyEVWhXupW9RvEaXfiU0fYdckQzp3TTueulqmIM3Vbh+m1IrmrgEr
 KMJbl8ccUc/xWSEhq4BkJAMsmOwYGPCI3nEH1YLBBsbilc2HeQXRr19PKAuyD+u1jHG+AYZ2nKg
 jQ9VcSD55/6L/GM4AaB8FRvG+zr8TuyfP2LerO/qo08oo1tTFIztf7Tyl/H35PWP3cBPQpqo9u7
 x7QeHJ1ZppKMm1PrGhQ==
X-Proofpoint-GUID: qEZWVYn8I_GiXhPBBOh0p_eU7N12pj8g
X-Proofpoint-ORIG-GUID: qEZWVYn8I_GiXhPBBOh0p_eU7N12pj8g
X-Authority-Analysis: v=2.4 cv=F8pat6hN c=1 sm=1 tr=0 ts=69cde2eb cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=abC_UhDIVLrPloPe-V4A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020029
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101417-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5535383329
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 07:21:01AM -0700, Gopikrishna Garmidi wrote:
> The display, peripherals (touchpad/touchscreen/keypad), usb and their
> dependent device nodes are common to both Glymur and Mahua CRDs,
> so move them from glymur-crd.dts to glymur-crd.dtsi to enable code
> reuse.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

You may want to have glymur-crd on the subject prefix to tell the scope
of the change.

Shawn

