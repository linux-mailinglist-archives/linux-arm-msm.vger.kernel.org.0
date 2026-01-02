Return-Path: <linux-arm-msm+bounces-87165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E263CEDA0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 04:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53C783000531
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 03:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433A21F8AC8;
	Fri,  2 Jan 2026 03:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EsdGxvty";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OqUnEmnZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FBB7E0E4
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 03:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767325946; cv=none; b=XmMu2/SWqWyjW15z8LnDBmx0PUufQY7l3Rf8xsW7Y4zqaGzYo0Rusu03uV1jP1KvurfskA4BnGBWyHiaIrELfpxDXE1+pVhbx01cSDMkozqJpWXCUqJicnfSmBdCqV2TZcvy0jAtCYTh9elrFvD/2Fwp1wPd5q65zS4i4VxccNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767325946; c=relaxed/simple;
	bh=Rp+uBO5VCABx56c9L2JztalDnHvrp+oYJVAo/4zxB6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sRmhI63H3eEK5AEDbixErZj61nAlLpB7L9K2Hnqb90xkcvmFbor6L8OtH+fgg1hm3jf4rUZI1gxwvFUS7cXGFUylaHO5qf6BFXirEZHKBc/Tmepkq+EnRx/c4BVUy6IzkdVzaNwyByZleodMAgRbiQMx/GnqVXq52Z8zeWcYE+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EsdGxvty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OqUnEmnZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6023ogl23930402
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 03:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S61SjyiHBkIhWo/HAA8SDc3EP7YavRLTn5aWkirrCNM=; b=EsdGxvtyhsO3XTzz
	lMtW7AFOjv/2/3n9+XcrlezBBNytqIsqOgzo2q89u1tNvUw3yRBl7cBRTmYw6RU4
	cKtwBkbfzhdGMjeJaa7aRW5jd3TEcKghzFhK3SD0pAylfXlq9btoSCzF/UbxJbBY
	Jx9v4Vcs3eOqZ7j3Pf5DC0nCjVO9q+CIKFSb68X43+dk8mV1M127MwH71fNqPJcu
	7/posnD7wgh8MrvcHPf7Clo4b4JiNjgOJ4Ylnr/6qOvnWAfBOg3m/lMyKqpVPE28
	gY67g3GCK5QQ74RRTB+/cKm/7dunh9MvbK29Cz1GLBNulc72CtjsYmCS9/3uMhVa
	lup9Rg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjr03e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 03:52:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a99a5f77e0so19946355b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 19:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767325943; x=1767930743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S61SjyiHBkIhWo/HAA8SDc3EP7YavRLTn5aWkirrCNM=;
        b=OqUnEmnZBXcL/TtDWP3pcHyeNVDgsfZlE2unDc66zlJxYimlN5JJ8Y9eKQJwMjqr+M
         JBQnsgOkA6usQVPfHmxtpnO6cr66VilQE+berZO+yR9yN6vak0Rqif3cDWOUt3DfDB4j
         kSbkhg4d/ptvL6I/sgrnhDB0fT7mQWfUyc2JsvuRvrzw1PiD/bdZSBSAP2Z3avCaC5aG
         4KFuEjg250cv1FhL8s2fZZRzF0D6lWAv4WJmzE4VA/kj/iUHoskKtT5/TNdmxcycRbob
         HOsCvjH8pjj0PlOpXHNH31gTFvrDTaS/p25YabbPNN3CeP7HdFM4NYa65pVSQXX+zI+Z
         vijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767325943; x=1767930743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S61SjyiHBkIhWo/HAA8SDc3EP7YavRLTn5aWkirrCNM=;
        b=l52YLFW3oPox+9u+i71hsSoQoKMndgymupIb9M/RuMLcWOw0WPDdyROnqZwRb3N4ax
         5lnAGM2AkqQtpcqAzBvHIv9InU7Go5VWfzHn/CMUUraKtPgdBygU135V0ziMXkQD+0cC
         yh615NzRORAG5ooIyJ9Lkc7xatvAIxhUb5WHYq3Zo8Cjq3o3ECQ0MXmuYFgEt3xQ5FE3
         Bq8758KKiEiWqTjDHCSRB4sD4GtlXhNBbmb9hKD25Uv5FE+LZ8y82Kc6WZfpvVgp6l4Q
         6mNz6ikzu5/tnFVhYJWCjW+IiD04fmOUeE40RJFOJGukPHpjWxeQ6lOH3ZTCLkElRHRO
         J86g==
X-Gm-Message-State: AOJu0YyvYxSdbjCVRs0IV4s0fthp37d/2HGD3ZhQ5ZsBP7ELPDZ0O40f
	o1OoplBFaER8p6kl1zopr1ZZvdsdPZebQe4qNQpUg2vs/k6+HkdTJKaZTWzeOdUBK/sejR9NGWh
	FsZroXFfwpnG1nkjfZMCaHHtrRb/SjppiI9nnijZ4BUS5zmwJYGyq2lK+Q/U2mZWhaEFb
X-Gm-Gg: AY/fxX5jS4JrOLznM6xdoZO0ksgJfDcXrZzV/6hhMzAGU/HXjEfwKv7fDPxZpplDhdG
	T/spUwwc+g3xvLfP9Y+tBdWsk78WSWtOGCsmKEFSfaOlZ5H1eGqZX98T4lFQbfCL4cnFd7s4ZGG
	HB94BGu35TqaJQw6mFHz7pFfOkCm4EDZH+87vUSMlg4eJVPTe0vLs3gREE17wSg1ez72sD4/6i7
	aZPvaLjkmRfYvVlWGuEBkfic3145nUjag3QQrq3vBiXOgLS0hkn8nfnKqdDSnhMayji2NIczzUD
	cBOhC4oBHNRnOzZCMPNLdU2oNZdRe9wVVBc+NIXb50Tbkgi8s+NKaf9k3AYEhVcamZCg7Mn5s1P
	fBeCbVFA0AiCwjI383plZ4gEjfULpDncU348sJw==
X-Received: by 2002:aa7:8e0f:0:b0:7ff:c6fd:d687 with SMTP id d2e1a72fcca58-7ffc6fdd6c0mr25749799b3a.8.1767325943065;
        Thu, 01 Jan 2026 19:52:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCUiCeAS919Ljjowcde1IpwT1czKdpjSEIheCNC48NWCcuQPiQiqia/YF9M2MMiRl0VY40wg==
X-Received: by 2002:aa7:8e0f:0:b0:7ff:c6fd:d687 with SMTP id d2e1a72fcca58-7ffc6fdd6c0mr25749782b3a.8.1767325942574;
        Thu, 01 Jan 2026 19:52:22 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff77abe95dsm39061316b3a.0.2026.01.01.19.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jan 2026 19:52:22 -0800 (PST)
Message-ID: <93a90b3a-f083-4621-8a25-f3d1171c812a@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 09:22:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/4] arm64: dts: qcom: hamoa: Add UFS nodes for
 x1e80100 SoC
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>, vkoul@kernel.org,
        neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, martin.petersen@oracle.com, andersson@kernel.org,
        konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251231101951.1026163-4-pradeep.pragallapati@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251231101951.1026163-4-pradeep.pragallapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=695740f7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gjJwvVq1TDH_Shb35fsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: WPWRVSjMzRbTavEsQ9CELqFKFVR7apdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDAzMyBTYWx0ZWRfXxXOR3Y84l5es
 h0296dKYXcP6XbLJRJ67Mg0CO5mIKMgzp91KD0rLyFP9YDHKZZknF2D/8fXJDqT11d80ts6iPa7
 TqtVKMxrJfmVF+tLXVtIe+87YTPATCQ+rfTO4DeOSf5meKCSLI5EtGeqHDJPBCNvK2XDqlkrRtL
 sDx9Cx49kcx5cSndtU8m1IempPAbSbTuEK2S2QzP6UUhPY2m0CM5IlPK6PjnBODmjM0P0omIAVq
 fUr0NejvxR+aavwjJ8DtmuNwX3MwChGlZmZ+nnTZIXKIULaeOYtTo5Oq7xoxaTylahfSbRBsryX
 gyTRIy1ZZlv7L7iNPEcmpl9A6TaY9S7VtkveJtr4AY1s3oE1Yhc98jCCO2C7bCJOVwON4NfkvML
 UPprkg8f89ZnyZDlfFzORhrMMEVE9WYp6/wFkKQln6volmhZn+QzN56W2vi6eMQZwRX8xWQLeaO
 P2mSqGpbxy91DohFE9w==
X-Proofpoint-GUID: WPWRVSjMzRbTavEsQ9CELqFKFVR7apdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020033



On 12/31/2025 3:49 PM, Pradeep P V K wrote:
> Add UFS host controller and PHY nodes for x1e80100 SoC.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 123 +++++++++++++++++++++++++++-
>  1 file changed, 120 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 21ab6ef61520..cd7e2f130fe2 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -835,9 +835,9 @@ gcc: clock-controller@100000 {
>  				 <0>,
>  				 <0>,
>  				 <0>,
> -				 <0>,
> -				 <0>,
> -				 <0>;
> +				 <&ufs_mem_phy 0>,
> +				 <&ufs_mem_phy 1>,
> +				 <&ufs_mem_phy 2>;

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


