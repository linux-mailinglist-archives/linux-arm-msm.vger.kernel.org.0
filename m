Return-Path: <linux-arm-msm+bounces-108045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHEHCpPYCWossQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:02:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA908561D96
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DEF330080AD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 15:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A892392802;
	Sun, 17 May 2026 15:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QY+Embij";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HamoegBt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861A024BBEE
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030156; cv=none; b=kdIrmdqrRhvP8lw6MW/l5K+mx7I/5pdFi9OCwcLHY9bsdjLU0Gj0A2376ypLivNoYuA8gee0xcmMIQxSs668KKrONP5upM4PwMWDMDOKYHoYdpZS/JAxXev+YtFoxYHmB36pXcBbRDsppouqdxLANpZU5uVkuy4MDjjXDsAmwow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030156; c=relaxed/simple;
	bh=vhE4BRmlJVLjR2T/yRkVWMgD4CCGxjtrsf7sdSCf/8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=puOhwBwAPpKt2xHxWBvYBlOAiS7/t2Mi+VPSPLdMy2FzvoNfZpwyxfvrWTPuNqv4Acas2Z+S1HjU54/jmxmdikim4R0XGXzzn6nqWuBNJY7f8hFlzRMtHnW77k7vpGN0zKfrpHN4f+5alvmukqPEJ1u1EI9rVGXTVEJl+BVlaCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QY+Embij; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HamoegBt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GJgpYA1497050
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bc3DIPoNGYjCW6M7mGZ4Lv9bueeDw25Nkv6QIHhEfiI=; b=QY+Embijj800M9lw
	0PAtlD1CrRAxcz8HUGr2xTRsBWVM8JQUVzYktBBu0OHfvzyzb6qRXdkWdiNsYRTz
	+upE60ROVMwMsC4YuftoN5bsX/MnGtcwc/nXrWzUHoAb7/iXRzlBqjESb9Xz1Mt9
	DC0QdzGdvN/CB4Xyo6f1py965j2DzZ6+9cQKK23ym+qOA+Jm4kRleA/M5YWiBfVz
	ho7dlHjvFDkr8LIYOcdJL9swuXHvHEIOKasKz06tdQj+KcYn4k48eq0O6jHYWNHJ
	hFX87USzZD7KOpFQD6G8Sr9eT7aF7rPhNLy+vTX8+4IJW7VZoS3bd2EFj2B/ngaR
	MjVMEw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6u16d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:02:34 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4825b3a39c3so1097045b6e.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 08:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779030154; x=1779634954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bc3DIPoNGYjCW6M7mGZ4Lv9bueeDw25Nkv6QIHhEfiI=;
        b=HamoegBtto/EA/qoUhQ9uJPvU1v3zoX7tZQryBnfEm7BhLC6CL2s4zG9aN+ZVgeMGX
         JvEcGTJdCO/5HPUdc5YEpGCEkMKwhsKzRkFOdSSzrtfCp5lt5z2CkqwccPnuJXOwvMAC
         dPg4kqIBGrXm5jEXzr7MuFmB9+BfGDsHYoru3UWTYai/AQ9ouGYWzAE1UmLAQdIH4GR5
         cwfdcmSv+jHdTv3Nfbz9gJ/mpiOZG9MLx9B5uiYcx7g0fqCldt6gZ8R1fVqgXBF7ktt2
         PQyMnSYcBpR/1niQIMFTl3qV4IxsoFDYEhVal91bamZxjMVwThiheivA1tNyyFAEB5qA
         kNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779030154; x=1779634954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bc3DIPoNGYjCW6M7mGZ4Lv9bueeDw25Nkv6QIHhEfiI=;
        b=WZUI8dtkotaSj5k0ohvyj2KppMIigN57BREYBSeDuNgLZjIoto3s5xcZATJHlPPK2Y
         golH9qVxv/dU0q8rfEiFk8ue4FWn2Ggkg7ehaUhHACO8oMW0KpkrEvN282e4x1If/Vxa
         aVqfirDgW95ZmVzm22PyNEwlSmm7ssK5uv8BDm4cD7YfCyoq2B7FEl9+pxCJ1OVvQrGq
         pxxi2hszOFvQjdKXjkmzpG0JzcQQYbGYbzG7MtzjZAU9GKqaeUPnLh5uidQOOUq/zPh+
         zGJ0+nwPPmlsaLwmo3JvHITiOdGdI1M00Sf+rJgTislj1n1u+l5/xB6EU/hPkL//brDQ
         kn6A==
X-Gm-Message-State: AOJu0YwCwFWxnel313oX+7TrcMl3CGlqy7u4Dcv3qe3utBiTSlN/zCN2
	/03cD62+7LOggu6pyBrfP/vqI2xfjc1NvHeeUeKHSFDUC6GGmFdvtZSk8uYbPPAEujNpsZKIvlh
	CzNZLpJ9cyYmM8ojVe5J2QRnUKLx+o06CTkPKvgRnpYuCtYaafdSc+qoub8U0Gx5bBbNo
X-Gm-Gg: Acq92OG5hiL/QFIxaMJIzH3FANnM+yreyxYAPcR2z7nKVlKtZPUrm4E4e41/IISULU/
	5a3+z4GeMwcBICcN1+rQtfqivaogkvbzLieP7GmJ6Ihzj2HrflXsgF028n4FWDY1CzXHwu474wZ
	WDKL/ZhhSXp9sBbD7HSQ4oW5woj2RvtBD+XF9O6Y6HZr17h0t8x/vKiuGJhjkrDpe4xqAOSRVhr
	IyMWu9badLEZU0mRN1Qf13NjU5Wn3/4Kq0M3mQD4dmZHGlmmUjy3dp6B9FMQTFk/7SskYHLM8lO
	VI4rCaWYd5Ea+Zsvqn0ANEwDcoulxaVMFLHC9XjeePMrDLAaMJ9enn1pIbT+kH1gPuUqMdRUkWA
	r1EOTeMvkJlwa3VfGpq8KublixgY7Z5wwkF2kF/XhQeiyxS3U3lZhyX0mVuwEtHI6PYeKlOWaFB
	C6EOGAYn2K
X-Received: by 2002:a05:6808:1982:b0:46c:cdf4:1be4 with SMTP id 5614622812f47-482e55c7cc5mr7485029b6e.10.1779030153945;
        Sun, 17 May 2026 08:02:33 -0700 (PDT)
X-Received: by 2002:a05:6808:1982:b0:46c:cdf4:1be4 with SMTP id 5614622812f47-482e55c7cc5mr7484985b6e.10.1779030153536;
        Sun, 17 May 2026 08:02:33 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3e20:6c07:e6b8:6153? ([2a05:6e02:1041:c10:3e20:6c07:e6b8:6153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8d39esm197711785e9.7.2026.05.17.08.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 08:02:32 -0700 (PDT)
Message-ID: <b54f2acf-bd7f-4530-b9c1-7b83cd3a18c6@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:02:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Document the Shikra
 Temperature Sensor
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aDRKBp1vdYVfQLwJ_9FPlQkby6LbGaz1
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a09d88a cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2V97sGT_sAbgTsKPAcIA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: aDRKBp1vdYVfQLwJ_9FPlQkby6LbGaz1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MiBTYWx0ZWRfX7uw+ztoabDf0
 BJclaPaAmAevtuksSdS+E01nYgoyKAw7vRUHz2Z7G+300kyjP+Kvt/UsxzT0+IvITBO4uEjl6fJ
 PukA7w3bMR4IOzehG6VxAWJcJyaBiC8KaJHpWYpuS6rpBuu7fD7Vca8bqEWVBO0g314A3vosu6C
 P0VBtUIXc+2QOTNKZVZ5whHOjZR9sy4hB70PJCpOUTyW6b1WDQIeyu9jrDrIKj3Yg8DLH6vtAK1
 Lcwz3VmOFZ3SxDq4LETeKpvx8NYhQVe6cHlmE4LcfYomxWUMAgUMJkkdh2o2iNgV4X9O01UdW81
 TbCpvpssvWZDUN3gkrwNy+hJNSStxxdcd6xjqGhq9MosVin1Ycsf+spYvgKJmRLl8ggkF5Ig8Hq
 6P4YdS/Q9zXXlxNuw3YJXH9OBCimuSbAe1lmj1ywizWUXZQb7oGQnxWz+83LUheBfIU61BjvL9n
 ytNMhSVCTjCs+qFaO6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170162
X-Rspamd-Queue-Id: DA908561D96
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108045-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/13/26 09:30, Gaurav Kohli wrote:
> Document the Temperature Sensor (TSENS) on the Shikra SoC.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 7d34ba00e684..a986fdccd52e 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -74,6 +74,7 @@ properties:
>                 - qcom,sdm630-tsens
>                 - qcom,sdm670-tsens
>                 - qcom,sdm845-tsens
> +              - qcom,shikra-tsens
>                 - qcom,sm6115-tsens
>                 - qcom,sm6350-tsens
>                 - qcom,sm6375-tsens
> 
> ---

Applied, thanks

