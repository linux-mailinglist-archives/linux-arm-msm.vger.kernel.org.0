Return-Path: <linux-arm-msm+bounces-98449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFI9Bk+RumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:49:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 393902BB11F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A81473109D03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB743BE15E;
	Wed, 18 Mar 2026 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZXlAX8b0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvpYsoE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307413D3001
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834413; cv=none; b=pTrGI+vkKdc/IxC/Inj4dXOfKHcLXli65yug/ahi2x7Rhi/ce/YCK1IF7vh33Dru4BV1LVHNsc3DLsPv3DzHKUYB92X930djRyAsIdRaW4jqhptSPqLyZfrWDiJkugjhUfGDqcnNwxyhuO8RDo5DOAfudXvqxAPnLXhkyrLVNg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834413; c=relaxed/simple;
	bh=9VTykINqmCDu8R1QtHKOq25cYN0GnhWOv9xqmx9VG+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=grk/bZ+izd1Jlw8E7G5mqreqR7XjvJtXcUOktEuKhGelvO71fatYw2gXFgm/AQPSeittRkkj9gjN23MRfbJJKJP/wkjgTcPcULywCEDvHlWQFwk/FhbI1CgEall8UgkH88QLmjGwSN9+QVbu1OyA2j5UG/qNNEqOHSoqxF6/WHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZXlAX8b0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvpYsoE5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I6ZPXo2878329
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/Uji+RduemsIjiUG7+YyFltf/mmFoucUv3L55v9doI=; b=ZXlAX8b0Nv9HWeey
	I5uczQOe/+/b+yOE2assXD5TgjudCvUwaWyQw2K8UfmUKSZ8I0tef1n3MptG8NvM
	SGWfmxSb/XHZlmFBbCDvL0MuJ6VSn2/Ha44BA/GTzg+QQyuECTFpJIY7rw7OEZ/u
	ARr7r8AazjNPBbsuFf9qrEKnedYytVZD5j6G6rrZsK3H0pepXhIVfIenMIKUBbc+
	u8Gkuo0HrUi3Jug+rW4XTHtskFg5VZ+rzfMMwCX532AHjGvhaLXo0UcTHLkgxHY1
	HXK80DRP4WTsCs16W5ciPoz57tNZgw4yOvy1z1EDMSYIwig0G50T3Rh2FcJ0gESG
	bjilxw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cypwr1afr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:46:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50906758d71so34950031cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773834410; x=1774439210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/Uji+RduemsIjiUG7+YyFltf/mmFoucUv3L55v9doI=;
        b=OvpYsoE5u9cq3nz2+i0LRJrnPq9NYahly34YpQtK7MkVVO8CzZviwvZd5LEcjufLoy
         ixbx6vkNhHwTgD0JtLnj7MhjUAB3k+NnsXgnLIGAHgP7ArPeP/wUfuX9HzQbb3VqZJj6
         XJm2+Uv3QV/0m7HsWLFow/hFqaXTyGoNCiagB7BelbNjGKCJ8+dJgrHHacnvhSHUMvzh
         0t6yScHAWKV48nxooDgVxyMNBdrMbL3PiG5ogNygM2qY2oV8WUZKmm89kKw4Z/NA+Wxv
         pM6v/V6pQP1a6C9FfowAFrRti3mcL2C1Eo9HjSrW+JFgp66HCg8tt4EzOSvoEU0Sg3HV
         3RGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773834410; x=1774439210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/Uji+RduemsIjiUG7+YyFltf/mmFoucUv3L55v9doI=;
        b=sl1xR4j1SbUHY/tZ3cLCIHV+xV0IFqkYS2tKMxFwiymTjGfvqprbSjWCy09gorMHZj
         2Sv3dBlo7AORl6k+91OvS78SpyM+TRZsK+VrqoV3cfyUJdxe8BiLpuK0ZjK2KIzwrr3T
         ZxNRT7YBbLuHsH7zau2Nl20e4HOS4VCjWuDXD+JGXzxdm0oTwU6rPgNul4Xt769rEGw5
         IKWAQw9N3XHq0o31/RlXrAycF+Je769BhDfyhvuX5uWQY/qVk99rqUsZJj8GUnYfEggM
         yHwLEQjS0VmxUB2++fTPFMmWrrAVk2Q6/aIZiWsr7GX3u9ajFcsB/hlOLD1NP/6N2JfR
         kK7A==
X-Gm-Message-State: AOJu0Ywf+baHDAUyZHBZ1byXZRu2r9qEmn5B8GBYTF75F/HR2YxIzmDY
	8g1eUkQxDqRBl5aOsJRDyLSe+DVNfHtv2VwYOtRQk7Siwuk2++occjxMg9dVZirzBorCUs/mavi
	dn5/x5zYi/00edda6LeOm5CWUiSr8eJ0AE1prr0PQUTWExE7il7xr8Imp1wFZ02JJA/Lj
X-Gm-Gg: ATEYQzzF2HUgmCrsFfU651HpNDtHEq68SplD1Q9uFuIzY+OtobltPloiUWj6vb2Cdut
	AeVi2vnln6KlBHKJ573hZdhvgPWSLraovdS6+9IJjC6NtbZW/ZN17c23Rt3dz4Mb2EOAl7gHsnY
	a7tF0Lyvn0277S0KveUKvCfkEOSL303hY8HuoKW0ihUmPcLOsMeHvD1wokZwnKilLFEDKYKqVBK
	NSw4K9v6+3xbTmmnUvIz4o4tHMg5IItQYGU271N1T8LGqyLqzYzi2c4Se21Yo1femJGLqkrTkwS
	aXS2Pg3if45Jr96xBiTDJaTP4SXRuwsOc1FoYxcZ/uSrvil7TUwVWwzK4FUuDmdFkazO1fZQxi1
	8GAvwVzRt2uDTsmdbuH+6yHc0lwLyTx/XS6OaR8CTCMNbM+R8u94cnUJqb1A75B7TAq+SKG0sQ0
	yltxA=
X-Received: by 2002:ac8:5995:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-50b14752d52mr27010781cf.2.1773834410561;
        Wed, 18 Mar 2026 04:46:50 -0700 (PDT)
X-Received: by 2002:ac8:5995:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-50b14752d52mr27010481cf.2.1773834409981;
        Wed, 18 Mar 2026 04:46:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb986esm1503874a12.17.2026.03.18.04.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:46:49 -0700 (PDT)
Message-ID: <33290f42-39a7-48f3-8081-cc15bff2d370@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:46:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Introduce framebuffer
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
 <20260317-beryllium-fb-v2-1-36b69dfb760c@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-beryllium-fb-v2-1-36b69dfb760c@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bIcb4f+Z c=1 sm=1 tr=0 ts=69ba90ab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=sfOm8-O8AAAA:8 a=6HfXokFIjMK-uoYlQTEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: xHVYds98j74v_KpA_z5pB9TIBeeeAtes
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OSBTYWx0ZWRfX8W8dzqGr7I7q
 miga8EsQRuerJfs9CMO9JfnSqT0zxDb+4StpC4Jtp76T+9JGPG+IEkEDV2UvIWrTw/dHEJ8Evrp
 VJ+Vxcpok88shZtGAyZxxuZMAFM3Zff1FIUgrKSQNf3AwSl/uXdItghouuz+J/q7DRV1Hg7ySxA
 bslHW9bcGrcgPJTP82rBIPav+uQubSSeJKqgqwt+A24XLlanQzg6kz1XPqP2VmOYoHCVlh2/msZ
 DSBHu061sE1yxbhReZ41GuFcdkMTheTfDU2jmb+gCkwhCqHuouw/u3XKGQvN9I8ffGFQoFQxQ0+
 SQYhhaONLzfg/6VXTKNDoo1nMQqpeVMYWxu9MVGCL0JNm9+kckMdrNCqUh9g+mL0K4Vm2pfQDbF
 7YEV4uYoC8e8vXdDUcWNSf2l0M4HkOEWd+/ZdNSp5AsVKyyCuhpzgX2v3F1JHQssGa/48xkGpuG
 Zxtih23KxxCfJ/UEHxQ==
X-Proofpoint-GUID: xHVYds98j74v_KpA_z5pB9TIBeeeAtes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	TAGGED_FROM(0.00)[bounces-98449-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,protonmail.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ixit.cz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 393902BB11F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 11:12 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add framebuffer for early console and u-boot support.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 01b570d0880d6..b928100f6464b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -39,6 +39,22 @@ aliases {
>  		serial1 = &uart6;
>  	};
>  
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer: framebuffer-0 {

Also if the label is unused, let's drop it

Konrad

