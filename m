Return-Path: <linux-arm-msm+bounces-103092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JCXF/gM3mlfmgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:46:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F5C3F8286
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA1293015175
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A49D3BB9E0;
	Tue, 14 Apr 2026 09:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoO9FuEK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1iskETD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013F395D8E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159985; cv=none; b=XGd+og/mdtmeuGsOX+kvPtOaQsnFAcUuRg8w7TlmrqdI6A14XFr2uHt7RsTt/HGhVZsj1jnILslfsSb4G3FMnsEUd23TX1ADuSRhM+ochfzaKVKAa9leqwacpuWzftG0++e83VUYvuU9J47lxUdj4UwN93nvmNx29Gk5lryOvFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159985; c=relaxed/simple;
	bh=eIGlkgJRjXqEOrHmxxNOvdfyn1InkP3AlIpQDhMLaE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHhtxYqlhkWlCtq/fGDVX+4mrGzB1arwMClxVIV66U5DascRJKubWHz4/CQP4zdspNR74NtjjzYT66ZktHzi+RRQHEEkCOvtgnE1L0n/uOq/QFCv5zyh4OYZv4tj4M6y2G0uIN7tStVXK1hmvV9i8GRafJa7Awyqhk3Mw4AbBtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YoO9FuEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1iskETD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E67IIZ2633547
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jp1ReYVfH7G6wmzBbDSPxhiCdbsX5vp/GDnX91ojXgw=; b=YoO9FuEKE/xJHkZ1
	R/HBURFLYMPAPlcO2Og0Z6V6xbdBQqqSJNVoijYGZftEjmJbZZO8oUdgzNsoexXo
	ZdVy9qQVz0+sgIKdynd+VPVslzSfk4R/1GWMK93mhLQvDoEQ9spAQ6JLI1CtzCXo
	jBPu+uOcw1SMi5MGfD9u1112jfr23XGcM13BxYAd5RkM3EOaisoDLsWoygAWMofW
	9iqb9r7BHNNiO2JH/zVQwcifzafXUTMI2pxmh2YCVlnY7zYoJK7esuKmwp+tn+WP
	XoJ87S/OgXyg+jNXbq4AnjtTYXLThZDehoZsw1FDpBodXccnD9vJTlDj3NDm/i69
	hrn9QA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ca53g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:46:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cff2297253so149039685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159982; x=1776764782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jp1ReYVfH7G6wmzBbDSPxhiCdbsX5vp/GDnX91ojXgw=;
        b=a1iskETDsc4gVfHD2UUfeC52+EqvpXVD3301Bs74ZmW7/m1ib3V5jmGkru5HmGrUor
         fJy5+gx39R73UVRXNZQQtWcMedBprWTzNF1kEQjU9Y0M9Q5tpr7dyXFUEnA/rrj0OIpU
         trDLNKeYNLTa5hi9ZqfUcmKesXCGJnELS8iL1dZTgYuTNPh5LHDuXzZHq3YKV2Qbtxq6
         nBybbc//o33FSUaELdRKKOmMJUVo6ChrLqfE/46fYECRqnLqdhr06mqC4Kh6EWbCd2zX
         HWoyqIFjU4hYY44HNtep7IPk40d+mdR7XLsuB8kZgkSymOo+al5b1L5QLHrO+pZwbY4W
         WDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159982; x=1776764782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jp1ReYVfH7G6wmzBbDSPxhiCdbsX5vp/GDnX91ojXgw=;
        b=f/ElehhSovt8z4P+YbqSF2nDcqPfy9OeWbP/S7z0tK7mHSgcpQcsaBQtTAs/aCIdBA
         j4aREWWRvCLy9IShlNrOT6w1EOMMDaWr9JcDjTSmiNl5WKUzGi3LKy6bA2beHQzfLIoM
         4KJazy3CWHleTbxumhuCy0j9xsssGMYD4UrEdQXhhUmvbVGmiWiNZxJv2cDW2yYd0UOa
         ol27xSCwZ3ipb+Kh5hyhFUOFSjryQQ35XMKindOpBK7UYRTv0l/DIjFnu1kf2Q+9tj/w
         gqlZnujLgz5VhTKn3WSGt/dnJKdQ4irmnbuEUeywoktdpfQYNXLdEnAhDXOKeg4fYUtN
         tkww==
X-Forwarded-Encrypted: i=1; AFNElJ+A07z4mCwKaCQZCQ3RClcLVZMmP8gqiYIUaVqicayCqCoU929w4g0g+C93wYUeaRmEBd6oAm7yMC2Mc6ST@vger.kernel.org
X-Gm-Message-State: AOJu0YzP3++XpcUGrdl7cBblfP0/iw3GEOz4EKQfX53jhyAFOU7L5I35
	nEdHLy3zTv3bgF95Z7h13L+fETNEc9DRa0E1AccwSBLCU89fs8UqTzgmLzJyyyC08HL55Ur1o76
	IAIlfVcT15tO6EimxnmR0TcPCwldTYYnKBkXpxqXUht9tb8eecNcIJ07fkNV81LNSe3tg
X-Gm-Gg: AeBDieumb4yZXOv/Ll4h45XE92tmnqA3xyMsrrdbD7usTYGaceAAxN7SZsgFZC0NtdG
	MWzJwZGp4DILUUI9JA7jlw3lI+J1PrexOfkXHd96NeBn1pE6mfqYUAHGYCq02A0ufv9zk/4d7nf
	b2g5zFIV+pFIoNZuCFLeX0HxcuSHnUyX7WmGjtV8iOiaiCZvVHqI5ZEY0k8f2/Re1FUvJpG04o6
	nMnxJF1lka40cC1hdq9Kwjyg7l7uH5WU552APy0FE2+PWbBgoO6+P6fq8M/IlVg4CBpn2f/LNEf
	43DAN6MzP2QRfQbZGfu2H1yhAFeJ0iP9enUpud+iS6bryKI2gYv/7aXVFbaY4MfrkpThqkxql/j
	Kp0vudLhCfXij2xXyl0ylCFaGYJbO/XG9mysM3vzNrA4+yImNag8aKt+rwHIvxH1wOPqZcyNRj0
	906oIGTmkJSpurKQ==
X-Received: by 2002:a05:620a:2902:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8ddcf4b4dd5mr1581611485a.4.1776159982146;
        Tue, 14 Apr 2026 02:46:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2902:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8ddcf4b4dd5mr1581608585a.4.1776159981723;
        Tue, 14 Apr 2026 02:46:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670eb258a99sm1951183a12.15.2026.04.14.02.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:46:20 -0700 (PDT)
Message-ID: <d53f1499-0afc-43e5-bee9-ae76df3c6910@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:46:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] ARM: dts: qcom: msm8960: add SCM
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-6-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-6-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OvaEUCwxYP0_owoQet08_fWR-B98vNHH
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de0cef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=O5woWLlMtrWFXwMO6pUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MSBTYWx0ZWRfXxCYHbCwkaww/
 rljU03TSuu/XKM3bbqHHKNgJj9PAKT9qF7UVy2pgzgE3s5/LgFyGFBR8sUHrMGeabotfI31ry75
 4CRjiiB/c3wRrHLOTEYI4Gevl4cicgj1uHRoERWzBjV08L9GjOYnSDc1n/+03hVSCSUIFc0PJYh
 RiW0Gc5xLSU/kAwjysqDc/xNufHEaX9MnorMVlkkPDpDOQL/6B2oQO6MuXP+TY+pc0KLF8GrbXt
 UQ2oWyyFeqn4aarZQu6Xk/4hgNNQ16Zggobt2IBtAvYbkkyY1Lu3gynjNt9o50XRDALSNtWR/7M
 JKp7UXHe0u+bZ67qAGm4SeEfIPGq0aXIjs0UkHjm2aqOiZlYDhvpZJGj3f7I5/MNsAlHQ3vG95A
 /A2tMSEKw2R3rixffIqOWPffCdHrA9dbib5vgjRGQflJFDL36o6SPkpgCOWYxThKlaVuDbUk00t
 we4rKI2DoQC6kUMX1Sw==
X-Proofpoint-GUID: OvaEUCwxYP0_owoQet08_fWR-B98vNHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-103092-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A6F5C3F8286
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add the Secure Channel Manager firmware device node to the MSM8960
> device tree. The SCM is required for secure communication between the
> application processor and other subsystems.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index 1d5e97b6aa4b..bc3fd55e524a 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -77,6 +77,15 @@ l2: l2-cache {
>  		};
>  	};
>  
> +	firmware {
> +		scm {
> +			compatible = "qcom,scm-msm8960", "qcom,scm";
> +
> +			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>;

I'm wondering if this should be an interconnect resource, but from a
quick grepping, I think this is always supposed to be @ 64 MHz so
perhaps not really

(please tell me if you know more)

Konrad

