Return-Path: <linux-arm-msm+bounces-92233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLS+JTCjiWlU/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:04:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AA010D537
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 034B13003BFD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 09:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894FF325720;
	Mon,  9 Feb 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jey9vRpV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KOtMi/5m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43205309F1F
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770627883; cv=none; b=Xu6rJvc0Lx99y5RhquxRT0G42JJe6QRqf2asYgPnGBYScwhR+G6texmwXxANGBLGQfydC9b+Jezom3Vq8sHgQRYrnGcGxlGovQ2eqZ3+beP+6/DvaMji8rz/6j/k3QpCDl5QHGzB2gpLFDKk+rlKfMe81Hp9O76jTqlZD8rD0yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770627883; c=relaxed/simple;
	bh=0dOW/9Wq3pIyUwQZW5yorzdcu0ypBEvDIu0R+Yni0bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r9NyrXplT9Vfk3Yez2zTw69BPwo2Bh0jevSRZXl+p73G6xnwyquQhEc2PjN5Roe8DdcsajjHpfUIPP9AnaD99iTDtrfmq7Ye0rNsHI0Gtxr59OYmGTnjbZb8GaWxnMIGwMnI6cGEDXWbUZWFy6V3aEHhDftnD1LO62GwL0ldbl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jey9vRpV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KOtMi/5m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6197fBsV2814553
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 09:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzMs5SskDqinFJetgH8lviwVjpgw5DGTzopkJ0CQ2GU=; b=Jey9vRpVseh1xvF9
	3OwSfdhWlXKBvGMS02gbVNi2aB+q2b30bhdWHTA1uy3LJA0foTs2g1Fl38g+YiHR
	08+gkF9/evLt1wl6xdOzfU/UyueRsrQN+ar+n8FmwLQsGGwUeJIanVzktKWwPaBV
	bf7vn4C4o1zNCv1S4VX9FHhrg8O0Ey0jqXCm3x6Per5sn56JO5OuJLGxC8c8ZcXK
	CxL3PeURwI69zo7BSTJIxjiLx+I8yLxVtps5N1iYGc2WxtcnENPF4UWj504y/9l8
	MKDCTY+kns+4bKWnRYXdsvI89ZFDmY2zHfHD1rjQXiQk7hVUGz9IIo0Fyc9Vppno
	E52KKA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c6g65atuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:04:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-896f35bc8ffso11740546d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 01:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770627881; x=1771232681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzMs5SskDqinFJetgH8lviwVjpgw5DGTzopkJ0CQ2GU=;
        b=KOtMi/5m0ebgRVgqCiGz4SD1XBTr14w3AS7OaPMul1r7mPclMCByG4ITG8hPpmoWuD
         1TYddbCx5ASfdJbNIQpLd+alwt2T8b1F7+ZXhKW/VRIKOSfjdHrDANp293jUPdjNNSxq
         RlKc7vmSZ96jFLPywCK+hweGeKzP9WSn/Eyg2PWNUPGviE6yzPkJOEPv1rgVhSUMfJF8
         Aj2jEapIG118UokDJKMNFbzx6FRpuwcDJpWjdEcz4t4aihPKIwjJ9zxj2rqX7oJRCydH
         8nLddbjCkfZcH3N8JdJsrDEaPJ80+TjpFZPfXEsPdMIBGIjLmYT18Racr+2jvTa+oN+R
         VVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770627881; x=1771232681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzMs5SskDqinFJetgH8lviwVjpgw5DGTzopkJ0CQ2GU=;
        b=kde6zKtPAADKgzrpGzidqTHObGvqg2yPVCRCOKPGB376wULa2SIAgxAsnx3ayIxn+s
         /gW5RmkyqKK/7WTgGHpu0Dl0jk0GA7h79z5NKUdZRgMFWKh+APuFtC0g7BPRiXrIZ261
         W1VBR0jcuvdy9nLpQg+XSIZpdyW86riR/ZnyDjhbAr7PkRrYg/EYvWB2yMaITNbYqw1z
         vJC/9OAekeySeEF9pWF9uKHMUsuUfMas2HMvY1RbS0ELIcEpeRDjV8L4yeheDcdtQdkr
         iS1c/cKgH5PMalL/XmVJBY12uQrm9WW2dTOX0kIS3FiyKTJCCuZDep6ZtXBUkLW0Vwmk
         HrFw==
X-Gm-Message-State: AOJu0YzS8aGY/+LiPGyvw6nkxoQw/GHxE4xEI/TcgnSUAejJijZVK6A1
	uFxTGKwFpZhJHOfV/49OtZN6smc7WW63E3t2oza54V6r/KRKvfJYcMeng2dKaGAPS+GzqoeI2wW
	/ioNvsmmYnOB1C6d+nIwQoeerQKiC3cc2J5tsj1XJYDhdIWSH9/Ibb/jBxhRvjvWc/mQP9zXXWr
	mS
X-Gm-Gg: AZuq6aIpu2Vij0x8fAIq8f6yVklJXagzfODbwD8j+4jaqLLJPzJZgLPJEJekWXCphAP
	AQU8vQR/lBMHVKFtjl6iKSnm/+DVfvstMtDpxpFG7wqa/0p8cMBIRaNN5XZwHuNXbgSo6r+qFlm
	03TkvP0MdS7v9U43lV2XGkCJyO6ozUZ+cQQE+wG4friWzz3T80mezroYTA4SKwTUoQZXbKwa2GH
	C5eHgz1e4g2H+cZcfuKWapdBqNtzR2afUTVQ3RQ02F74Gl1fPzZWASnMZJXVxvOIbpkjlwHIC4q
	B5EqgY9KF/aVcABoXS6IljASffHRPSGb8ogGUgIr6ZfK+RwhhYViCWHR5Qo2s/ZESf9ypsyndEb
	+584Z9kcpJOmtJlVkcq9r2vi1kKVrrO+HCGuT0TkG9Sudzo+TXHwJK9Xu0UcErP+JltM=
X-Received: by 2002:a05:620a:400b:b0:8c9:eb7f:b6d with SMTP id af79cd13be357-8caef4fe153mr1071114785a.4.1770627881516;
        Mon, 09 Feb 2026 01:04:41 -0800 (PST)
X-Received: by 2002:a05:620a:400b:b0:8c9:eb7f:b6d with SMTP id af79cd13be357-8caef4fe153mr1071113485a.4.1770627881109;
        Mon, 09 Feb 2026 01:04:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae3bab5sm358582766b.61.2026.02.09.01.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 01:04:40 -0800 (PST)
Message-ID: <a745718d-1960-401b-b8cf-fb7b56dae933@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 10:04:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8550: add OSM L3 node
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260207-sm8550-ddr-bw-scaling-v1-0-d96c3f39ac4b@gmail.com>
 <20260207-sm8550-ddr-bw-scaling-v1-1-d96c3f39ac4b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260207-sm8550-ddr-bw-scaling-v1-1-d96c3f39ac4b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GqNPO01C c=1 sm=1 tr=0 ts=6989a32a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=VgqQaG3eaoaoUmCyVBsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: OXtLAVslwtQ_g-q_5nGIC2eRtAcOQmKK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3NCBTYWx0ZWRfX/3EGD7ExjSr+
 ssb4vcU5npGKgbKDFGso7pJycyMcnKF0Boq2r0HhtJchHYDvc9hdoPkB4M/Lw7C1u5V83iKe1qo
 WBUy4ZaoAlsj/EPnX/PIy5Z/k/qKgFk9pleKRtVoz03KE2+vf+1Sb9QYc9fSm5WLev4Q+bWwPig
 Oh1Zm/4ttd+8yA30WqHkrru6A0LGADzDhTkCV8uXNWjhmPHk0Ij0paO6wiAG0DA8pgFAYGmAqV+
 ezJuhkxaHZaCyjFU5AQ3wqQxPRNYZKDIgPJwpMIGl/xAkj8kG3/6DKS45pGoM5qL42yUxT7L4iI
 8WAaPt6rHEKNkG5U0+2kxNszi7BOpsCS4zD7O08tMULLXs+YJo0c+rQ0kMXJmIsW4zIway1DsyT
 nwgD/stjf/SnXf7Xs0K1fQOMKpCDTV6dWReuC/FfOeb/XaSZaXR8Y1vwdn/8aiPcPzdXA58kS8f
 HFvP3/fRs0gB8hn4zCQ==
X-Proofpoint-GUID: OXtLAVslwtQ_g-q_5nGIC2eRtAcOQmKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92233-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4AA010D537
X-Rspamd-Action: no action

On 2/8/26 2:28 AM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add the OSC L3 Cache controller node.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..80fc437c9874fd5009ff1eaf4227b75bec5fe883 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -5437,6 +5437,16 @@ rpmhpd_opp_turbo_l1: opp-416 {
>  			};
>  		};
>  
> +		epss_l3: interconnect@17d90000 {
> +			compatible = "qcom,sm8650-epss-l3", "qcom,epss-l3";
					     ^ this
should definitely be changed to say 8550 instead (it's going to require
an addition to dt-bindings too)

Konrad

