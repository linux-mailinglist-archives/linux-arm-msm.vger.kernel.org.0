Return-Path: <linux-arm-msm+bounces-96703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEBrBTMvsGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:48:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E9F252683
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0426C3226F9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05119391E7B;
	Tue, 10 Mar 2026 14:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsQM/M47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PosIlbpU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38A038B13A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151963; cv=none; b=MqtxbTt6rMm6xgZBNz8sC0debieVz/hq3rWxlyhfkO72/Yk7bHTU8tVzty37vCcwrPSFwKuZUlwXO60MkLKSqLlO1E6cBb/OjWQ1sYaT/ErG8RDMumjMPfQLxyDRUfAksbcQPuTKuCcvf/O6SQIq1QmHnfA5WJ6G6NRz2wSzHhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151963; c=relaxed/simple;
	bh=+0QsUmKSdIAOx3H5r3Bwuurcl+aY3MLfHPpoPquchN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2exZcKtn3HnZ7LpklAz0Mr7qT+GkApW6HeBuXFdklPZQzgDJMe7k4hkeMeIl1DJBRirQA01XxdQ8ENffTKvprGQiiLKeCoD6gpijHBKe719WLEcQ3DxxkPIGUG/qjw/OG2e2E12AAotukyJulyrpEBJHNrgznSf+eDB7p3H//U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsQM/M47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PosIlbpU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaSv2963265
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyF4wZYpsxMauFewTjHkjZxZN1aE7LqB8yEQANT66m4=; b=YsQM/M47A/tVFFWU
	TM3WoFHx2VfZxVGNJ2syTUVR+okXmuEny/juQEf8fwZ3pMnw2JikAFHjIaw8x+H/
	Q7QoYcN+IeUBHe359Gze6tYv6DatTqwFMM2NcZ9E4F5S7tWpo7ClYkMCjoYCG3bx
	w5LSrBMI6MDohr53VeXxQYckcDQHLV48mv8AwUEBdO/aRM9Ri3kpxMwI1usajMj/
	qMeNTr/GdW9JNVn4KVxgt6P7LZaWXCOTQWTImoSSbTa9z4jlw8sSNMlX+MgG4FAU
	qI2dmsuMWWOzmosed3GVpB2XN4VLp6txp5TzstSYu24qczggWf/rztznjEyjdtEu
	wIX7iw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477khjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:12:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffbef72dcbso1077687137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773151961; x=1773756761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wyF4wZYpsxMauFewTjHkjZxZN1aE7LqB8yEQANT66m4=;
        b=PosIlbpUDbfhKzXBSfF3QnZOmghopL0UuJWY0vLV/jjp64SohguqNm5dJEYqnhU+Cq
         Xcj0G/hhU2gnCzaAfylNyMVaXDg2S6qSLlT1ZhOhHP9Hbmov2iBi/3koNr3yfY0mg2Tp
         gKepIoSF4Y9wcjERWZKSH3TrjIYuRLWfkGv3+BJTNlxPK+mk6Ou5MMLHMDAambuqm/7X
         76Fic9/kr0miIPUhh2JLHKoDoHv9SRQvBCqmIVb3bSelhx6hofmlwTMa0HUgTLdkS3sR
         HCVklECPAoLSPther5cYG2SQKZHSrmk3qciJ8Zc0/fw75RINVpTrCZGfm7j6q885K57b
         kCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151961; x=1773756761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyF4wZYpsxMauFewTjHkjZxZN1aE7LqB8yEQANT66m4=;
        b=utg/3IqW+yissQuPeQpy82S/seoD9TErh/cGgLHrJaSD+8J4RW2mkbHg0cR+lZcrxB
         8xUD8xO3iJ7NpwKTyIzFtPVM5IpEDc5OnXiAafeMaTjgucrvT4mAoI4Nt0TzECWFCw9M
         8z/TQKTFiV3K0AIAxWm1VbZzHHJO8yYn/sCpMDYsYjJg1ejYbhoDpH8rtjN3r0d+knry
         YhCjycqZ2UInZwULVmdW7RxDNgvVBlfow4XM3B9i6wSkeC0Durmr4NYdQ29to/9ZoDJE
         xU+H9NDV716+V/Fr3dvY+n4m429cu7CQIGlOdZza9L7c6xz1/DBQK3sbVWAFUrmenK/T
         855A==
X-Forwarded-Encrypted: i=1; AJvYcCXWjOnPZPXbbX2DLGRIuUgRUZbQjBiqFzqlZxZvV6a5R0ClHshPyEm2H7sEPMxXxDIQ3GBNcJYH/QnWhxFh@vger.kernel.org
X-Gm-Message-State: AOJu0YzVMRxL0Kza0CAUAVQV/KoIr2exMdZvHw0vWhMFzJXqTFGSNoNX
	Wjae2yd95WAfTkZ4fexWfLp0gNdJdDnV/au/VRAIcEJWNy01DGqYzuIjCB5YxQ+QC80hrwJhZg4
	N1Z3LlUhoe/EShadACmHaOCxGawKjd8Zh8QuuXoPaoJ4sOCSonusyX1sFsT0yA6uXrjmq
X-Gm-Gg: ATEYQzxlc8PtM+BBSxrnwMB1jZ+MtF4rulESltsUsMYTS4VWS5xBRy1OkDnFUXj3Rp/
	8ZYU6+lFGUrj4aYp6TYgtP/s0mIMMadTkmzwrj0cx79Eukv0jkBVppYrpwuuyCaVZRjieSod8jF
	F7kdroYKmBAwIDzVDau5Di5lgmCzm8Ud8Xo0lr6JV3jA9ZwLp4lemK/tL7/j4UrMRITbupykWyf
	JagHFcfPovnxTh13XPZZP1zG1tzaqkfLDxqDPWssiTmoAoyVIKRLOdIIKnwdaX3rRvn0X0Dty+P
	iFuFigX1oTiNLcziZVIThDsbAyK6bso9fmIvUxknx0oCA0Pci0MqWu7tFP6b7//GPdPDCwvewHy
	J6vjveZt/oVxjzGOectpX49qPPAv6/jMc6KKdwHqK53yRiUZHtOYQ8mPumJA8TeQq7JHp6tSdtZ
	v4b3A=
X-Received: by 2002:a05:6102:32c1:b0:5ff:a16b:93e2 with SMTP id ada2fe7eead31-5ffe5e9712bmr2763503137.2.1773151961081;
        Tue, 10 Mar 2026 07:12:41 -0700 (PDT)
X-Received: by 2002:a05:6102:32c1:b0:5ff:a16b:93e2 with SMTP id ada2fe7eead31-5ffe5e9712bmr2763489137.2.1773151960520;
        Tue, 10 Mar 2026 07:12:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d3fsm4317323a12.2.2026.03.10.07.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 07:12:39 -0700 (PDT)
Message-ID: <39c6d1de-53d7-4aab-b054-067c182fe0c0@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:12:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] arm64: dts: qcom: monaco: Add power-domain and
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
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
 <20260310-qcom_ice_power_and_clk_vote-v2-4-b9c2a5471d9e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310-qcom_ice_power_and_clk_vote-v2-4-b9c2a5471d9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfXwqkC7kUVMbQg
 q+htIDAVvsfw7iikvucDJWw+m0i2hOKxoBF2JbXSij+tVzfbz39G8rZYbqgOmA/wNOuQ/FtuU1p
 eesA5Pt8rhvWN1hxjbzO+dnnyQH/5dOVTB5LANgR61SdL4V4wgaX3hAfGasUPvzySYcgYnE4v1E
 zqy1G+wc8gr9iwnGcvmptGenNpBpq6329+krK49K2KCcqHSqC7iaNRk7NjiMby/C05lEVR+OhnD
 /Wd3comH1wWVwpfroBkMX6T/BULoNLtgNt++RLJ681fO/dyRkxb7SdvsKIPaPbpMkrlpLZlPK3T
 TZtlmsxAPX+snQmZz9SPgQsZkFqkIOyfkbxLaHKsLSq7kVPYzruSpKFgRbDQgy+2RB/uQMap8I0
 /hVOSRHdYuNHVt4IOI1h9sYZWER1muetWe8dJDDEP1ciQj4crVNzGetKLzDWAIxcQT6SVpv3Ouj
 oz81lX6S7tGkwltp/+Q==
X-Proofpoint-GUID: lBqOJ40EF6TcTvV1FP8ysuYAz9ZvTiti
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b026d9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=z_dnvKGLtVwtNw_c-ccA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: lBqOJ40EF6TcTvV1FP8ysuYAz9ZvTiti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100124
X-Rspamd-Queue-Id: 72E9F252683
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96703-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action

On 3/10/26 9:06 AM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
> monaco.
> 
> Fixes: cc9d29aad876d ("arm64: dts: qcom: qcs8300: enable the inline crypto engine")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

