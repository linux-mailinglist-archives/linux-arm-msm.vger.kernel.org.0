Return-Path: <linux-arm-msm+bounces-117983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wEzaINWbT2rrkwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:02:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D16EF731577
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:02:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L75qy+Kn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O9pfSil9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117983-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117983-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 037353004D95
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CEC224AF9;
	Thu,  9 Jul 2026 12:50:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD64B22423A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:50:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601457; cv=none; b=Ltk16iNgvzNMjo0CIIs2Cb3jAorw9Ai3JUs48ccH+ZhMTqr9LW8ad4aiB2jJ78rlcNEjJ20DOERjxSJjNO9rbpYj0Pur+3RUtHgaeaWK5ZRVydvFWp42x7e6K7OsLsgPVFstqpahNchh47N5EkCqTJWoYvb3DhFEf1Xm/MoHBus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601457; c=relaxed/simple;
	bh=QYfd74pj1LXyLOWHsR+yDYGM+wigbN39WEGPo4SphxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AD6bMwCzXl5oJTRdaNEyt9CxYt6JL0X6C3txb7/QdIeY6yJm0Aqx70IKVN3zvVAwRdJTy7SOQjtVmGGbYDsxJ/dUiCKSS5K2rh2ecSytPE+ZwCRpBWSHxIr4H+U3V5MezqRMxoCqBUYdZohY2QUwxANNJhuLDGj54XeLuM0GIWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L75qy+Kn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9pfSil9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN8Ab1668605
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iH/+XPVeMK80Ur/DXU47daDG
	o5FhKhCHRyRqAW6aJiE=; b=L75qy+KnKhDXK+DVeuhnTUaC2YUXq1tGdfTWNQRx
	9y6JaEi3aqv0WaXx5tn+5z6BFD9TsK1YrPeWBi9a7UKXesRt2GGsr/syqknoBHSQ
	gXwsimYsOdyG81XdmmmYnN8c0Mjr6L8UE7zk5VSpMjWvgm/JXpZarwNJNmhZ1bQT
	D0f7crvrWEPuo8Lb8M75l7TYbeTTaW/pp5ITgjMSEHIO50NvU/ijyBXCtU9UoQDt
	Ijyj9L+KAgF3lq8O3wWp5u76aWrgWD4zrWrVhu59phV+UcpPs00gxdmonEPrHuHR
	qB7zXt04hrSwLXq9OfbdUWec2GxJqvhnh8WEmzqNDxvRUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418j6xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:50:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8db414c7so29446171cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783601454; x=1784206254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iH/+XPVeMK80Ur/DXU47daDGo5FhKhCHRyRqAW6aJiE=;
        b=O9pfSil9epbww9Ch3ikVGBLOe8lLbdpIGtaA3qBwDyoGA20lKjtrTY/WC4WXCmnbtS
         vkBTMNhSY0gJ/rjEtPcqtTlEC0pOdQ+FMpPsSqF6xKImMqhcmg5t4Umvcnug6TZFJ/lB
         OOH9+0eNRHMaFakdlqhRli4Ma/vEp14pudOjuDz5hxrL2Ba8L03yfZSNI3/dHFUmhEKf
         m8OANaiRgBaJf6Y2ELdvieVs0vsI4dqN3v3RNjFJlxAkKW2Z8+3GdKzO33xF+H3JZPzZ
         BgsJbL6HViEMXBDJfCHFBcYR7hAepWJFmOvt/sNVI1a1QfJVdG83TSrUOUnxqGsKbQ6h
         tQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783601454; x=1784206254;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iH/+XPVeMK80Ur/DXU47daDGo5FhKhCHRyRqAW6aJiE=;
        b=rwB3cXbH9edKNC4ABLpWbfsmsi/kRyWfvDbMNV4NTQFtWrnh84LOKoAoL28EuiN4jQ
         0vGY1l2Fp32LR5TQ9b8SQspLpN2QcNMzX4ZI5zSR4nrjbbPUhmYtU6mvCQvTySuzCb/h
         QKRM4FN9Z2E/3Uo/gzZD3CX2e7rkI6ttKQivBV4JwFYWwMJ5L413r3nQPtAxLz9YrLmo
         sSZNFTLXL345XWbztgv3KOoMMYR51OhzxTrMYWhstoS2oq0vLF4MRg+misdHQL0BppMx
         61866VA3jwwOKQHqYN/0Z6YrcRo6G5md/S3TvASJR+kQdP7H/ME2OAoVcJu1jvRv9txa
         jeWw==
X-Forwarded-Encrypted: i=1; AHgh+RrTALQaPYFcDAUvT4K4N6GB52IVLF6U0whVu9Wm2fDioZwD1mEtCF4smSbGYd01Uy5FpPALAn526jBpIT5q@vger.kernel.org
X-Gm-Message-State: AOJu0YwuKIVITju6oVnMb7NgXyyWl2lk/bAHqH6I0YQknXLgTdl0gMbA
	iSmeIsBQxq3tP/5ZnqM7BWRrfgSV8khC2ANMQL/vyMW5bfhwuxKr6h256nx2J8ISd7Gym+u0hn0
	DcN7TRE3Un3vbjnvIzhPeHhQ8+WOy/pbftG1vhojyUEUnyeIxBUZZRgm4H42PuW4sqS3P
X-Gm-Gg: AfdE7ck0WkILGIT6V1H4nwUlUkzyrDHJBvcJ6S5RnOYfzGr5OHmGyWiJvIldBKpmV3u
	MYJwiCv5IynVxrVUZ4W94MnAd5QV2yOd1fYjgALhNMF1Co+EFJ+VqjuMfLxEMzEW+6zmd7EYtH3
	nnh1AwNkCwKBBGTeF0QgJjJisvUMJERYmud1ABwB5hcjCq59iSqe7wmvZQ9u4cAr9cg50osds1H
	ZjqpBaKo44eXhAjva/mXzIk9jsQmf65G5qCucSzNG2Gtpf7jxha4h6pdv3cUbrzVWxkpMbccJnE
	gYLBcZdUcVoiE+JV7HjHFMTvW5czzfk1fFsBu86aVwzfa4N+tqW6r8eaqjlVoiO4pRTscPOFbuB
	zlVm8vVNd3WINUhh5sA4sZ37Ed8tinmA3xsKS+sBx9dwhuMfCAnV21/NGha6d/xGOGhS1oCicU4
	CZT7OkvVigqEi9VCZXa0MU8sTj
X-Received: by 2002:a05:622a:250:b0:51a:8c9a:8fb7 with SMTP id d75a77b69052e-51c8b4c7782mr74565451cf.72.1783601453851;
        Thu, 09 Jul 2026 05:50:53 -0700 (PDT)
X-Received: by 2002:a05:622a:250:b0:51a:8c9a:8fb7 with SMTP id d75a77b69052e-51c8b4c7782mr74564761cf.72.1783601453030;
        Thu, 09 Jul 2026 05:50:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8c2dsm5167924e87.83.2026.07.09.05.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:50:50 -0700 (PDT)
Date: Thu, 9 Jul 2026 15:50:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 01/11] dt-bindings: media: qcom,sm8550-iris: Add vpu
 sub nodes
Message-ID: <h3kbrpbz7naivqv2urba6ai4sd7kpaqz7s7vxuxuktoc5q2ojx@u6zngnmrbenb>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f992f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=EXgZ2FfgEcvmvpt9hkQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyNSBTYWx0ZWRfX89SnwWihFg7f
 eZKMW0jE4ZyJhCV7/RKv8wH7eL69aRd07CkYHfoRzTSdxFU1lgIEjaqrWRb0dYwj+iWHvBcKqhm
 FHCnKEu3LJEf6m0NLkPPmKsGZWW4LBpy4qKem0qCEOtdeAnGEY6sGcJdA1pl3Rt/9YR2GQaS98l
 ZKrlRsdscFTtcVwmTA5tbXMn+qCEZO2ROeQBdwD5zSOKaLVAz+JLb7oVOXm435jMqyHnr3yIYJx
 lljnzUxsgXOi30F6uYNGmkonMgb58oD6g/hgcPK831e4VGUHD7CwKzr4Pe6VmwKyXr1tTMUpdeT
 CjwqOxEZDvB1/Va/xQ29B7lzaPoQHfSjsdPQyQzv3apVD4vxsde+BiztlIqj574BCnKW4VbVx9l
 lNmJq8HwAM1UcZ8hbolxyyMM7rXO9rg0O4mey1G+jirnYsLifEa1yVab6ncKop8gKtcYprKKPTm
 Q14JaDfGS0UO7QB9I6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyNSBTYWx0ZWRfXwvtYGvdDsWrr
 tyXwfVeGUxed3zWTLnQlEzTZtn9O56K94jDJaPNaGFGdPgh0mUJ0UY/THQHHgpjAeM6scbhWA5y
 XbRROlzIRnCkV1/1JdT/QDaLpeBDNfg=
X-Proofpoint-GUID: KtPO1iUXMq2YQQKhcpp1EjYjNJwYYc8x
X-Proofpoint-ORIG-GUID: KtPO1iUXMq2YQQKhcpp1EjYjNJwYYc8x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117983-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	RSPAMD_URIBL_FAIL(0.00)[u6zngnmrbenb:query timed out,gitlab.freedesktop.org:query timed out];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-arm-msm@vger.kernel.org:query timed out];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gitlab.freedesktop.org:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,u6zngnmrbenb:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D16EF731577

On Thu, Jul 09, 2026 at 06:05:47PM +0530, Vikash Garodia wrote:
> VPU hardwares have a limitation where VPU streams are associated with
> dedicated addressable address range, as illustrated below
> 
>     +-----------------------------------------------------------+
>     | Stream A reserved region (600 MB)                         |
>     | 0x00000000 - 0x25800000                                   |
>     +-----------------------------------------------------------+
>     | Stream B reserved region (3.5 GB)                         |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | Other reserved regions                                    |
>     +-----------------------------------------------------------+
> 
> Mapping a stream outside its expected range can cause unintended
> behavior, including device crashes, as reported at:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> To address this limitation, the subset of stream/s are now represented as
> sub nodes, so that they can be associated to the respective addressable
> range.
> The limitation could be exposed when running usecase like concurrent
> video sessions. The binding have been validated with higher concurrent
> sessions across the SOCs supported under this schema.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8550-iris.yaml           | 66 +++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..bf4d24ce90bd38666704274390b98be450f708c0 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -91,6 +91,51 @@ properties:
>    opp-table:
>      type: object
>  
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  non-pixel:
> +    type: object
> +    description:
> +      Non pixel context bank is needed when video hardware have distinct iommus for non pixel
> +      buffers. Non pixel buffers are compressed and internal buffers.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +      memory-region:
> +        maxItems: 1
> +    required:
> +      - iommus
> +      - memory-region
> +    additionalProperties: false
> +
> +  pixel:
> +    type: object
> +    description:
> +      Pixel context bank is needed when video hardware have distinct iommus for pixel buffers.
> +      Pixel buffers are uncompressed buffers.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +    additionalProperties: false
> +
> +  firmware:
> +    type: object
> +    description:
> +      Firmware context bank represents the firmware processing domain of the VPU. Required to boot
> +      VPU when no hypervisor is present.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - power-domain-names
> @@ -98,9 +143,15 @@ required:
>    - interconnect-names
>    - resets
>    - reset-names
> -  - iommus
>    - dma-coherent
>  
> +oneOf:
> +  - required:
> +      - iommus
> +  - required:
> +      - non-pixel
> +      - pixel
> +
>  allOf:
>    - if:
>        properties:
> @@ -177,12 +228,21 @@ examples:
>          resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>          reset-names = "bus";
>  
> -        iommus = <&apps_smmu 0x1940 0x0000>,
> -                 <&apps_smmu 0x1947 0x0000>;
>          dma-coherent;
>  
>          operating-points-v2 = <&iris_opp_table>;
>  
> +        #address-cells = <2>;
> +        #size-cells = <2>;

I think you need "ranges;" here. Also an empty line before the subnodes.

> +        iris_non_pixel: non-pixel {

Drop useless labels.

> +            iommus = <&apps_smmu 0x1940 0x0000>;
> +            memory-region = <&iris_resv>;
> +        };
> +
> +        iris_pixel: pixel {
> +            iommus = <&apps_smmu 0x1947 0x0000>;
> +        };
> +
>          iris_opp_table: opp-table {
>              compatible = "operating-points-v2";
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

