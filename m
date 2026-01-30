Return-Path: <linux-arm-msm+bounces-91285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNZaBISUfGkQNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:22:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA00BA054
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A97733055CB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337BE3590CD;
	Fri, 30 Jan 2026 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxqFUA1V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QdCylakC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0080314D17
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769771941; cv=none; b=CbrG+uk1b7lxB0kR6Xn6K5LSz2cF7koRVsnKPAK7TBksFbWeCAbrZwOZN2FR9xmo5UMBS4nA6QyqUT2NXBoQ9sqhcV/xGT6cyfTzXI/ZpvVBWeWEjiQ+7TQ7wuVXOC9JVRmWoheV5NI87URInAyMEeH4uHYnnB9S/bYcd/s163o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769771941; c=relaxed/simple;
	bh=wgAliZeWKdq9v7QPy4UKFSpZpHhIs0m4Meochnf1yC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPc1LR0e6llaA0/76G7jKcBTQCeWF6e0HSRWwpdgAFeNzvwmB0kVo45thPLSs4H7nemZrLee0hXZmJ4ddkXka6Im8qg9NYfBadDrBUp4YcDgZbYq/tmK0mVYhQ2BQFbVaMX+oTf7em4M7oZ5YVW3bgVH0Aij82CIOIHXU8jhcpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxqFUA1V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QdCylakC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U52cVt555356
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ex9GO0Pup1IY1uEeAFsAZWtpuM+CzU6Onq13HSd9IRQ=; b=AxqFUA1VaFwyISRM
	F3Nb7I6SS6DB/CiqFcK56bHvxxJ8izidZFKiQfEyb46n0utoY1FV2oqXA8mhHU4F
	dEplIj4sLXU7yXY5yNToSVUndZ/RiRoZCSmHlKMdMW9Us9EfJfOLf31/dTaOYmMN
	J3IHwKuJldkN1YjboKIf05EGa/lWncZevTtKOSW0exrQHVAmVMmUfiBYo00PU8wO
	UO9x46/XXRUB6wdi1MNZnq6S8Nh2IMjpvHcIVXarTmywFuxHC4l/qZ3LdSjvI/J3
	fLKay4snj9sYcrVqVGreSIrMFkYNUne9RbIo3Q1ygEhdj39vpHGVBmeSO/9nSShf
	fQ1vjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p59h35h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:18:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52de12a65so40504985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 03:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769771938; x=1770376738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ex9GO0Pup1IY1uEeAFsAZWtpuM+CzU6Onq13HSd9IRQ=;
        b=QdCylakCr/FksmyHn+Wh4ogNtXAZd+K/5LUwugk12fcW4SPN76dBhnaDtWbFp3KqHs
         cfXNeNiDxVm3W7y1L7N5uWVmhe73qF1KXDXhYDpT0vYzpPz/psFmPiPZYB1DnJVwNyXp
         W8HrPU7BP7td5oXZC/CH6iZ1JZj57CI8wO1fLU2NIPicPAeuNr2N+X2lFCRdZlJpKchD
         +mtOc6RF7mWBIDRkP1nneESuRF82ddquPWwvr1UvkfqRJvnO0l1O1v+fuWk9yhhw40NS
         Bm9tAHYeavFSsulPBNAqWsYZs4RGn03jFVK84tS0Cw0l5b782jTzHHKKov5oov+D0Dh6
         QyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769771938; x=1770376738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ex9GO0Pup1IY1uEeAFsAZWtpuM+CzU6Onq13HSd9IRQ=;
        b=EjBIYaPyg4xfz2/o+zqB69tY8CaiV38radZ80y5QCCAl9y81x0I7rv9HK7Z93bpcbl
         cFeJnaRjXON6Q8JKWO5/QVpC+PsLX9RJzQFHecbTwWhSrvEprGW9DxvmoIJ/KMRo4Acn
         1WhQV4/V6utJaZJiokU02pRFAOl8A0iB6xAAiNM9YJGAjUqY9aEAmCXomQmESJ3gL1P8
         0Vjh19z2SwuSB8kTZ0/7iAqURLIlFXYcXBDP3AxWg65WewesnUjv6Gs21xanJmyPx9RP
         Lj6L7UBFeQSTxXbB4pJ8GTd0I+AbszVR5Xes1xX1r7AQ50eVoW8qZfYf+cIauMiIMUEz
         8adQ==
X-Gm-Message-State: AOJu0Yx3vz8LOj0+d8pfDgoRM6l3vK9nzLbQxtP2cORFLqQUemkrZ6aq
	w4YPrauvuU4HB8F8GM7pFsD29n23BGvSLGiDJ3avnEWV0RsXto4De+6Z8lS85/RQpJdLqzhJzJt
	2K2BRs81O0+HH9/636MvnNiqYmAHxgsRhb1T2dZtcwlAgGouoWbwUnLkGlkAS1tO9JOgo
X-Gm-Gg: AZuq6aId6cFPnyPtlBT9xKxlqUhhEwyFjAjef57xDRwmah8qpFVsYzG4GOgAIyo5nDa
	myPBBcLA6YpmvGv/A/02ikFvkttExZ3kiZ/L2cCgTO4mOa7rtVH2ns/iJABahQjclPEHzc80u9I
	t9tL92Q2ExCothiiFeBivIKhFhWyP7rQ5Q525tsOMc9+Km6dW8Wk2pzwE4dBc0MWMdSGcBrHuf3
	6+JlFJTTvAYZXjfoV6iiBMtMcvZd34aFKyz+pmBFgOFj/oIKKU/goeeS4dLcdL8kLpwl8IYqrAo
	KZwikYCnzny+n8uP8y+DXPnBmm7WqGwbkvr8XUORYKNR5W8lD6lBHs6lCsUnr6O1x6h/ddCY5sb
	G9FcP/A8dhrXKhMziq/8dcn08cq8ApoFUbf+U3Y3NVz7gZcfpwV6a+UxMFdarP2j2ldo=
X-Received: by 2002:a05:620a:28c4:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8c9eb2f9759mr241396985a.7.1769771938065;
        Fri, 30 Jan 2026 03:18:58 -0800 (PST)
X-Received: by 2002:a05:620a:28c4:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8c9eb2f9759mr241394985a.7.1769771937616;
        Fri, 30 Jan 2026 03:18:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691d15sm3906121a12.19.2026.01.30.03.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 03:18:55 -0800 (PST)
Message-ID: <0b4ac3c1-11b3-4991-83c2-0c39a81baa8f@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:18:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-pmics: Add PON power key and
 reset inputs
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com
References: <20260122-add_pwrkey_and_resin-v1-1-a9fe87537816@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122-add_pwrkey_and_resin-v1-1-a9fe87537816@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wsf61-2Bjo1wiAzfr30f1k6eX1HmGAUZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5MiBTYWx0ZWRfXyi38pFlEzXOt
 Q4LaJHw+MHQ48MOaNlhOq77ReIxBtdfTq1yW1gdqt6MXSpZfuS3e0xIN23xM/x9+ZnLZp8FyKdI
 lwDK2bQqg6VhKDIkndonhC4wgLNIKHkcrQVLIC028JAdVl4AGvv9+81uTIRdNKA81fWZ7h1kjkX
 WNXNk496ew1NSziwb9/+YoDWvYrwuA7KgF0GJ/36HNs+3T5nG8h3SdO+h59M5f4HA203kwNsUot
 daM574U+eTioSi0VnwMBfNLpb5F4j4funlpjZX2IT1sKn+gZjY/2jtprw+hr0VHd+nRO0i6NFcZ
 pqO93CqRGfydoJ3zaxL6RrxxrMXLfc3IhLmvV0FlM3zKcX76kcqHLkD0gmP9J7fAmV+jubmZnuF
 V5PDwBaNYwavz5NZl3EFs19UWc+Leg5xt8ns8teaDUfQp/sUFKRV3cS2A8nVXzDxqcQyaT9e69K
 vpIqxFLd2fzso9IS0Aw==
X-Proofpoint-GUID: wsf61-2Bjo1wiAzfr30f1k6eX1HmGAUZ
X-Authority-Analysis: v=2.4 cv=Re+dyltv c=1 sm=1 tr=0 ts=697c93a2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K3N-fI1i-WqjdmaUcisA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91285-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.4.176:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5EA00BA054
X-Rspamd-Action: no action

On 1/22/26 7:59 AM, Rakesh Kota wrote:
> Add the Power On (PON) peripheral with power key and reset input
> support for the PMM8654AU PMIC on Monaco platforms.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> index e990d7367719beaa9e0cea87d9c183ae18c3ebc8..051407cd83eef8eace8521084b1ad012a5192ace 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> @@ -13,6 +13,26 @@ pmm8620au_0: pmic@0 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		pmm8654au_0_pon: pon@1200 {
> +			compatible = "qcom,pmk8350-pon";

I see pmm8655x has some slight changes vs pmk8350 (more configs but
generally backwards compatible if we don't use them), let's add a
separate compatible in bindings so that we can maybe handle these
differences down the line:

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
index 979a377cb4ff..14b85b0d97da 100644
--- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
@@ -17,12 +17,16 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8916-pon
-      - qcom,pm8941-pon
-      - qcom,pms405-pon
-      - qcom,pm8998-pon
-      - qcom,pmk8350-pon
+    oneOf:
+      - enum:
+          - qcom,pm8916-pon
+          - qcom,pm8941-pon
+          - qcom,pms405-pon
+          - qcom,pm8998-pon
+          - qcom,pmk8350-pon
+      - items:
+          - const: qcom,pmm8654au-pon
+          - const: qcom,pmk8350-pon
 


Konrad

