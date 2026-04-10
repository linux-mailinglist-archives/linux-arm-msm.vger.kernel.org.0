Return-Path: <linux-arm-msm+bounces-102698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DlcKfUi2WlrmggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:19:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6FC3DA477
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CF4F30532A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 15:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA403D902B;
	Fri, 10 Apr 2026 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p76lyKcK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7XKEGmH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487F53C4559
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836533; cv=none; b=RcbaCbGo9gNCm15isxv9xvQxuHfhB34KbkXAyzudON+EaCIPnemAwy/6D4wdNeWNPpH8TzzBCayC9QitbzamuTUuorN29M73KOtIpMfrX9+n+mshZDyBbJddSAwJvvhAfH/mQk+vfivvOsuJ6BPrOEQzk120/ptnA0mB8e0bDfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836533; c=relaxed/simple;
	bh=CxybIaQH7MFOHyBvFKSmsTpkPwl8WGXSWFMtatyLJos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3UXUB1GNRxqWLSjE2oyPevXWQu6/7H6GVj13cwPZDyZ17NwFoK+biV75RB1SSh17bNsMqJZS8JDakhMDlDbZMUuYJ0wrlRUlvQLhGH+/tB3EFQ0Z1p0AQTtCXSgXwccWK7jboHy7OfLT25k12OrTxfXJhTmyB5VRUL3/t4vSdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p76lyKcK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7XKEGmH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA9fC92047336
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PmZzFPxdGek+nVk0XuXvnYbQ
	TpPE/KFBaQPEfM9RE7w=; b=p76lyKcKs1kTi6Qfc5kHlM4nx2zxVjd0Zk/AQyvd
	Mtd2pChBrntA/j05nQ0bA33QSISozVBV5m20cuXxJBNELZ68VOpDFRLQu+o6nLCi
	EjIqAvpd34HTe3h6BaJcsWSCG0B4kJTk/LAt1scb6y157/vcb1MMtNh21sHEHrQB
	3ULN6KIhpimIsQG8finKjMDYCRG0k/eoryCGJKlThojMjFZsHRqgBNrD5MVNf+Ue
	KSZsPcmYVDzZKocRHOuYyrx+m3MauXA5+F4+lSb5X8Z2Itr2M2PrR6RuVd2/DIjc
	XtNps5RCPSBYm2UFWHxuNXjlWvX6csGK48yXVxeftA5D6A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey7792an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:55:31 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1276e71652fso3132174c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836530; x=1776441330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PmZzFPxdGek+nVk0XuXvnYbQTpPE/KFBaQPEfM9RE7w=;
        b=S7XKEGmH5TTF/MOX56F7oDhYOUSh3d+kqeCbyOrFq+mEP98QV9SXuOTbKj+VupxN+k
         Fy169tpKXk9Lsn544Q8TTRr6/dBAnAjIWpZ9/mlMehGBdfd7rAIIV8OSDrH420VKA2QJ
         Pqit/P7vzT6QgdXBYfPkuBllDChVbGtO8yJZMXHPrpuKRdF72FXJoCeF1+UAKua49Ce6
         Eiz94GbbJImHGscWwWw7PCw0+nSvmJgwH8Ky3hJANX+9BtcvLTeEwFoRdr/URwtgW0C6
         E3ZA5Y20vVI+AYzimCD/2xKGLk7r9ifyR5y3FzQ1/P18yi0/XQWIKCwVfmk+/FNZoUr2
         +ykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836530; x=1776441330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmZzFPxdGek+nVk0XuXvnYbQTpPE/KFBaQPEfM9RE7w=;
        b=VKphQAUiD1OOPw5iKIAmXaoI3rP89Z1xQZrAPrBNdpHjHtue1e/v8ZA91JZcuXFpfF
         mz6iWpxqR/3FEBzfmmQ/YDEl1tTOiaQHcGnePya3bRWIu83X88LdBnovfV5vSDoLVtuu
         LLX6t/BX6uEpaquHrqjGXxujUaEHlLS1DqIZBO6d5+ewObNHjJgXbw+021IiqmS12rAG
         inV2v5RJLPZ+ujCwcamrOilIZFF4DZ/BGuFognWWKEPdScwfQrAo2D06kGS12Q6X0/sr
         vyqRstDH8llgtnRWPo8XcKmZCa1CvEivLofDH9GJ36QM7gPcB8FxgkCTLX/tgV0KJYt9
         LZ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiN0yBlcQfnIfJXxX8lNKB4rAdQjGCva1sMDGn2ZBbORiYd56Q1yrqDQ9vQHi9eiGGUhwGi6AEFoTKq9zx@vger.kernel.org
X-Gm-Message-State: AOJu0YwjM3K0hW/p6PJFpmusKIMZk+9RPquNY1jEQqPVMhYJ78G74/Hr
	CxPQthIrfDU6bNmCcaHwXf0LE7L5GJ0Sja4x1ijy2KUiVFIOxz2s2be8fjjUY/IfmXBtFdwo7cO
	UVYS9Cv/RNPDaTn0VbrTowm6Ue1XRELbEK0IfeqkhU7mKM0a9cIZcdzHUQJCEv0Okf+EE
X-Gm-Gg: AeBDieuXHhM8QkPVCEircNU8xeDRTm1cfvSM6pXiZvAvGhlTzZWQWjsFVJQ1ZIQRBW8
	XG5wHvs85L/QnvRQsXAxpLWLeDaGXZGZFgnfHSoJd3XirOJSVBbfWPX4irN34aOC29o8JqlG8Py
	qH5PJ15k/V89zCVzGzYfz+hPJYuWP+bOjH1xvOmXhRrUYiOLb5xsH0giEQlsMqmGXkX0k2iE9hg
	jzVoS9ZXCu1ptJcCh+VZGu6JGvepkNLTCfoAR5t4Zdx2XOK0eq1P37SIU5d+yskxByHepMIb72X
	r2yPSGa4iuphWqyUzsmy7eCftfc1x8WyX76kVmjaX5GPNJ/ZyZf7z0MJBMa+x84v0LScP7CPble
	A0Eb1KjYm5fqGSMw0s9vq0DJJbJuJhHlqVvTIs0M4+opETOZ0I8ZXr5cSogdqNKETLys4DngPqq
	Y=
X-Received: by 2002:a05:7022:4a2:b0:127:9ece:c47a with SMTP id a92af1059eb24-12c34f160e8mr1898530c88.36.1775836530278;
        Fri, 10 Apr 2026 08:55:30 -0700 (PDT)
X-Received: by 2002:a05:7022:4a2:b0:127:9ece:c47a with SMTP id a92af1059eb24-12c34f160e8mr1898513c88.36.1775836529688;
        Fri, 10 Apr 2026 08:55:29 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb228sm4328082c88.9.2026.04.10.08.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:55:29 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:55:27 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: qcom: Add Hawi TCSR clock
 controller
Message-ID: <adkdb5NFp8gec0A1@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-2-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-2-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jmHneIDdBqngPPrdqFdF5PbseyGE6csS
X-Proofpoint-GUID: jmHneIDdBqngPPrdqFdF5PbseyGE6csS
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=69d91d73 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L_GWj2w26O6mB9MJDZMA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfX/RwCsSZBu/7D
 gCt99K9zS3Y2kn9x6ABPcYd4AgN0Pa68VDn3fh04RUEyD/Nxns50o4OSLo8Jzno/A/eBvrZE1eH
 0YJJcoEhq1GxgGYR+GhpwXJ1DOeNl6Lj4ASqxeqmttqNeci8RL/KL/DD8AzhoQC17HdQnGwDW8c
 IuU1RMpEtYNOIyUO5/UcXdhHbCsN8GQJrP/HT8Y2rKZFCLs3p0QMbp9ChLS5juQjdvFrx4fq1a9
 qxfiMpgeF+OcNKREXV47dOUrKdB7RrSLCnKwUQmnF6MgrNYPoEk3vgRKVmQ/e1KDNv1MDE1v0ta
 n9QUGgCmFOsQ6FPWipCJ8ytCF9AH//2EPYCBjzCzk+3aJoqg0j0V/QiYYDN+MOSOzzx5+GjcyQL
 KNxh2ej+as6+CIkUAYILV3NJP+O99TZD1STV/ID3IFm3u45MCextwbvB9np+7UzQLImzLl4xW97
 lcwVMQ5oYZJOEwg4nHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102698-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mdtipton-lv.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA6FC3DA477
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 01:51:36PM -0700, Vivek Aknurwar wrote:
> Add bindings documentation for TCSR clock controller on the
> Qualcomm Hawi SoC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml      |  2 ++
>  include/dt-bindings/clock/qcom,hawi-tcsrcc.h             | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike

