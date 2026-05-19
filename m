Return-Path: <linux-arm-msm+bounces-108458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLjEH4FIDGoMdAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:24:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3E657D873
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B8E731084FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482683F0ABA;
	Tue, 19 May 2026 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAyjzPjW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DtVGiYRr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D322E370AEF
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187811; cv=none; b=PDW6ntoNkeV6xTqKGPvlYWEC35YMgx+vftvEOzPu+d9EH5AVJmLeEpwrf5ekyPyIw4OwLxBxc1qK1fFchGdcvVq2ca++RJc8/RZC1XqdGCd76YvvSqMT4pFXfwNrpwCpDTWjDyZXuAV5c5fSfl0smvTUiH4N+TmgqwWcv9H9ciw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187811; c=relaxed/simple;
	bh=59a1bqAkNbTTke8UBP+MFLaZilRvk7+htDvhhaKSv9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p51MQ6z7q7reZB7WoamKfCjJgBJ9EOI/LqXA1e9NFfEo06MtWoyu+XfiirQ5MfUtWBPNP7AUJADBbW1PDN0lYm5IMy0sH35O6gu8MsGAUJE07/GoV+KD7sZscKJf529/sZaK4iiRBzViWeY8xLRksgmrmWMWikxSU+/x1ornc4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAyjzPjW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DtVGiYRr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9Yooi254044
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c8Rmh7dG3rOXWAKkItGDmmHDLB58CWNuH+BpEhhcO/Y=; b=hAyjzPjWjojtzeDt
	TOYs+UUd/EOFHtMLh4clvmq+5OTdBm1gt9YQ6l2QK5mvZrmZXkVAdVLK4ifPdcql
	eIecm19gQgiEnZVkABvMUARYhHNs54NplzF00/LMoC4we0TXk7UbiP05eFgHYMnZ
	/lD+duA7nTeGNIWTXncXJrfUQ14ql2ziu1G8SixvuC9VqSMMM8aRNen+IGlqMdFD
	5EfmQcb6UmKNSAwvlG4rwjpycmHqQ9Jpat+EN8OHJJnkUwMlqGJkoVtqPZl4Ixk2
	4XM4kOTaIn+5SA73fqheR3whr3mQoasdC3kUeg2Ok5Ssw8AIzDoEF7YAticVZiNd
	vGYmuQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8h87sg3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4530a90fdso48647805ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187808; x=1779792608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8Rmh7dG3rOXWAKkItGDmmHDLB58CWNuH+BpEhhcO/Y=;
        b=DtVGiYRrcztgXmyBD/15Nafn6I22UasbguaQzlXEi46DMAaGAglW96h9fYhp5KMCbg
         /ifYUygJ8zuMhI66z38G0Sei2FhitUZ0zhopY76U1gPbaInoObG8PTce/ohOPmuJ1alM
         dO6TrHO2VCLgcO3OmkHlavaSn+JM+EiB6UA38JXcCn/UujC2Iabb9Zoo2Ig0TsieyaAg
         PECFW7zXIR5aAN/P73EyMwiW6CxeJ3fVOk/aYN0Es3/gsyfrJvYy5heRCGVfIGMIL3SI
         ktL1dXa7Tfd99XHhKQp7+8bR8s708PtfoncJpkLcBap1gza+9JAOLiiTbioII4e/PADc
         wFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187808; x=1779792608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8Rmh7dG3rOXWAKkItGDmmHDLB58CWNuH+BpEhhcO/Y=;
        b=GZPoWeyz/UKb09sptge9gXXf/f0keY0BfmnOtdphZYPHv+QS6ZlnbYyTryhipxG7oY
         l5dhXYB9krxs42fmv923D791BR6k0lpIps4brs9rnz0TjPILcEl0GOlKDzStUTJqjyzt
         nWYAzeCRC8PAc25ilfbselmR482gCyXN9nvOcJiQC26C1d3+tBADfHq6d1J9QteP8COO
         VY0JlDWO7vFzClpzzrJ650xcB7KeHpK82k032AKJWShUErWaxS1E0aOa/a/2kk/etPVz
         Hs+1xuz9kgZL37BntHNeWa9HptNU6pFyZVLAP+I5W/MZWNMem8TDH2oLQibB8/OWPkW7
         fKiA==
X-Forwarded-Encrypted: i=1; AFNElJ/MbGrL9SPO2Jz/XWu6NQtc0K9sPnSVeni44vIMsL2R+58vXZ39oVoc5yffUkcwfg23fkbvJsFes7oOqr5u@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa+nik70djYXpkDCvd1kFjqALD+mqjrDz9dKGTUSrKuCkR6pd4
	3Cgj9MhydduXVSHkD+45GyJfCIgZhcGfgXFJZQpKjPHc75wGk5jQ9Ud7Tf3iS6BocrBND5b1N0n
	BFUxGpSUXqOF/5CNiC7WnanRqqEPg3NvrV9wEULr8yYjVFOVHTGcsKWsSdWBx6/7P3ChthdL4UW
	Rm
X-Gm-Gg: Acq92OHfZbL62yAl5KUx5WhbxwIAxjQ5IIO75J/tJ520uMl/wOAdUtnumoSG2IlGsPL
	I/A9xpisn6YUmfG/2+IFLhlP4OXi7eKzleqmwEC1vRzwBI4el1HdnkNPxwFW0o/jawTjUAhzVGU
	OBshOI0tZh5m66/afijuBkcz/B7MCsPEYlmhkFv2MlEW5hJiRltDq5LBVZ0yUZjrOnFNT5MR3as
	nqprXX+CDCcelHmd/0f5W/hl6bd9sYE0jgoZad3im1XXPQ+nefU19tBI/wxco1tIdiiA3NxGQHc
	dlJuEJ658zTHbjwQmho66QfFXZJTam0LyP2dtWA6Xvwz/j3XlqJ1RvOcONZPJwkov6P85r3/vuR
	BxuK9f1CKc5q1VpOgo/tNSDRMT/uUibhTFje/gxfSDaUC7GhpoCU=
X-Received: by 2002:a17:903:f8d:b0:2bd:49ce:d240 with SMTP id d9443c01a7336-2bd7e7e3ca0mr207297275ad.5.1779187807707;
        Tue, 19 May 2026 03:50:07 -0700 (PDT)
X-Received: by 2002:a17:903:f8d:b0:2bd:49ce:d240 with SMTP id d9443c01a7336-2bd7e7e3ca0mr207296935ad.5.1779187807266;
        Tue, 19 May 2026 03:50:07 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2dcsm180876345ad.13.2026.05.19.03.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:50:06 -0700 (PDT)
Message-ID: <fbe2df11-d662-4df8-9059-a64e90634ac5@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:20:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Nord ICE
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
 <20260519063505.883379-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260519063505.883379-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BNMfQ1axoNv_c3PJCP9IEOwVldvICjp9
X-Proofpoint-ORIG-GUID: BNMfQ1axoNv_c3PJCP9IEOwVldvICjp9
X-Authority-Analysis: v=2.4 cv=a9sAM0SF c=1 sm=1 tr=0 ts=6a0c4060 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9SpUgLBwT_rzJ8k7LZ0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX70OA/jkTH4rG
 toJY6E2HsZ17U9PncQXNjL21NOo6GYT231KybVOG/dXVCwptMe1v+NQxvwAZorGY2xzE5H0xE85
 4DDjSGK1sjqw2HWDkMiXGEgIV8cBkUSnxWI28nDlN7QhbDIKJ+gzAbokYBVbUaNQtihFHxS6HCm
 y5psjIr8H4qsBHL/ZD7W6CzG4c3uTzGJhN6gAtNrhDmRNwQW5AompUK5LUj/o6HrjEqs9W3MLll
 XR97uLH6HkW/v1MXq78BY/BpzRwr/20kpN5Xjf886DvpP8eik1SybX+xkexMx41fZ72IOhLQkGH
 YM68+17lneyPJOhFyPpak2fthnHVe9Y8gRjAZW8QBd+yXJBtsHMSVruJ65LW0wMBgfYPKv6InKy
 FbAUdCVL6N0QN8gy4Wn+UlXvQY3xQShmjhWRwNwLuGN9T+Wo5f9fhAYrqqX4vE6apuR1iPK33lX
 CemjsTgX5rlQ1lXBpqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108458-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF3E657D873
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/2026 12:05 PM, Shawn Guo wrote:
> Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> index ccb6b8dd8e11..c497528826a4 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> @@ -16,6 +16,7 @@ properties:
>            - qcom,eliza-inline-crypto-engine
>            - qcom,kaanapali-inline-crypto-engine
>            - qcom,milos-inline-crypto-engine
> +          - qcom,nord-inline-crypto-engine
>            - qcom,qcs8300-inline-crypto-engine
>            - qcom,sa8775p-inline-crypto-engine
>            - qcom,sc7180-inline-crypto-engine
> @@ -62,6 +63,7 @@ allOf:
>              enum:
>                - qcom,eliza-inline-crypto-engine
>                - qcom,milos-inline-crypto-engine
> +              - qcom,nord-inline-crypto-engine

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal

>  
>      then:
>        required:


