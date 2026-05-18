Return-Path: <linux-arm-msm+bounces-108120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGgPFHzHCmqf8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:02:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9418568525
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49EE2303EEA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 07:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7767E3E0C7A;
	Mon, 18 May 2026 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbgbxFSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECODCa32"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E41346770
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090827; cv=none; b=EdJBl3IsaYG+ySUqa7P7IxGbhiPJjolMNwKXgzy0KzEj27Dmo175ZW0cqkVDCvAMV5eRUPpV4r9lPgaFq3YXroGrLapIALBfY+CEz5OWq/WptYWK92Z+R1cCvvNerGz+c/xzTbk1VyNEP4WntwYHY2C2EhzHm5wcAFSXLaDSdSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090827; c=relaxed/simple;
	bh=B9gyGzCV1B54Pe8zE/IjJGy0FqlQ/bm+Wt6xaBcByfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbR6qZfCX89Oqa4hUj2LDaUwLhhvwALhjtCW7VhfpXPgpD6paZnqpepVpdD++r26CP301HVC8LEOQMH0B17jM2ln1r3YmcmGHUvODhYTZ7EFaZJG1U4ivq2eAlCweCIhpSZ/W496cQzfb1qpOrMGIzXxxbLeu4d0zl+2TV3577g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbgbxFSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECODCa32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5bKiW1696718
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXxtdNBAthLA/h80lp+57IJHfTZAirh3+QYdTFgQFE4=; b=mbgbxFSRDwBQdxNy
	0+oxP5n4iF+DtH42d/MWqM7JoEXQSrCfwGQ/3s2THAU6/35ess9Ud4v6BHe1lOYO
	g5aiJasDhXLphcMoNxd5QHA9adm+EHEed8lIGBPDdl7K4BqYseVtlMV0oQlv/Cru
	LTYIOd7/8fvros62aRVAstKOzF21B1oLDF6d+k9SAcnZ1HEtDZAvVdKVr7BJJymp
	IWiqz+BPcAJTDOapXhY3G6BIPc41Ub3Y1ns0jrQOEmB43Hi9PNLSW6vvxklKRNC0
	EQUll9rqsS/qT/n7knGd4JDTcqpwQlLulnlWeCUtIQbu4UDMSq9GblUxE7swk5ZI
	VONyDA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vsk0k9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:53:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50de6db1eabso7412771cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 00:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779090820; x=1779695620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dXxtdNBAthLA/h80lp+57IJHfTZAirh3+QYdTFgQFE4=;
        b=ECODCa32MXLcT0QSscfT7pRQ0vvaRwa6g+6IsLovQVaUX5qWEudNQqtCy3pHzkcGUO
         s8iWXV1AnfYXJ2d+Xaf/VjPmLJjyyzwm2Alkhr6bl1FSA0ZmIj2X2Mhh4ohEzJmtmaOV
         OQyzHodlWO2vYjuZ3fY0ywuenAW1XQpqF2HVvRKHDPI+ahBf+WSO0mH5ool30yaWlfO2
         UjHfgl2SsAGdCd0Oqa5dViwcYy9AAJ8ZvIonGLbdh4/9sP1tgm3XlptsfhbA4VwUcd+c
         UW6+mw347uo9Dtgz2MtQdwDRx9LXmYCSyuJGCBuzEM+a0YIAYFaWsfW5tCd23xxN0LLi
         YxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090820; x=1779695620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXxtdNBAthLA/h80lp+57IJHfTZAirh3+QYdTFgQFE4=;
        b=KjcNuhRz3tS2+eiXBt2FjWUV33t6HGNrxvpVOuC9EouqHiMVlaAw1WbNp3eBwhbzf6
         TX8CE9oT+6LxHpVh0JcIEg0IwfF0coP+i9DabrTarfYlBU4sBMWXTNzxDgrB7kSg3uSf
         n90AM8A27tImD7rino4TdIXFcNhrmA7lXORAAVt8jvbA0T+dBuOPI9KlDzS9+lSbSRmi
         90m+bty66sJSn5ywEzBBdsJe+/scwcykQv1pV7wSFVIuVJzk1mf5xh1BDpnIZSx34BXH
         DzHJQwjj/QdcqzaJjAZ9ieHbsCmmvmclOdPdkmLwnSJ39BVTbECt4LylTiCBgAm8eLah
         AuQw==
X-Forwarded-Encrypted: i=1; AFNElJ/dqC+/DfcwyuCcQP7I+Tpqlb/3Qh7pt8qYME4qjJH2dVYcYJDXf8Mo/dP54l3BzOcIB4v9gmjQFKkUvT3F@vger.kernel.org
X-Gm-Message-State: AOJu0YyXFTwusCzQcZLG8ZrK+iCIBJMu1oS2bw8Q08uQYEs6A9y3J/My
	pSe1nHCxkSl2Y6bNiWXh+6aO1pskV3KXEcduvJWpWkVtep+DJi1ZS6Dzc1fvgE4Mqxu2iJAnmQj
	XKNmpI1icmeBqBB8ixagv4NsE4oOqmuwC7BYSMckoqu2HDwsEUrhzza+SBK7xAvji60xq
X-Gm-Gg: Acq92OEGcnlIhjsAhvrvm3/dlbvdNePvf3XXu/5Bv5DfLkXpFGguzdrP4bJ7wJlDkL4
	1usSRIKOmcQ8VM+oSzMRxb7VRc1VSh+Qmia9yxsVivwYr1rZIAOSuWktqun8iYqPekMZaG8HoAe
	v8lceg9m5GjZQWhkGu3aRps78JVB/NPFYIuVCrPmMsdv4udH1iZavy0MJySMWy9h0eGwY4OgjzH
	pJip4Jy/gLOI/lUNhL6TyLO04ZlDRzVpMFkzbWNpZ7tu8oB3kggG9SwGegFjWMenYvaK9ihLjmO
	M/h9Pg7H/6hPLlJyJo19h75N5xZFn+iJLCnWLyJO2xKcsTJUDLXMI27/lEzDQ6F5BNOPB8YETgb
	3px0VXYTvDxI6L8aY91mJwJF2/SyHKSGlGxieca0Fc7I4fl56ihgb55paoTCDJI5IJN8XyW4n7E
	cJpmn85h1OgT7Wlg==
X-Received: by 2002:a05:622a:4d0c:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51659fadfe7mr113897931cf.2.1779090820557;
        Mon, 18 May 2026 00:53:40 -0700 (PDT)
X-Received: by 2002:a05:622a:4d0c:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51659fadfe7mr113897711cf.2.1779090819967;
        Mon, 18 May 2026 00:53:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831187d5f0sm4789600a12.28.2026.05.18.00.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:53:38 -0700 (PDT)
Message-ID: <e35598ad-85f0-4f00-a2af-b1dc92210040@oss.qualcomm.com>
Date: Mon, 18 May 2026 09:53:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: qcom: dts: qcm6490: Add JPEG encoder DT
 properties
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Kapatrala Syed <akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
 <20260515-qcom-jpeg-v4l2-v1-3-f38c2e1b3555@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-3-f38c2e1b3555@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3NCBTYWx0ZWRfXzaLVInW7f9c1
 gjB7U3gTfoqbVxeJKMb7HI5/pttNYpCKC1eFSnCMpQt8d0SVYrnappzLuRrXJ5PukigI7z1z1eC
 1lKjH/YVcA/9kP8cmily7Uhp9YPTVXEduvMVGK6sDN4WeT1HSDb/dK9ntWH0HNFZ2MRYuiu7/hN
 H7tqZ77lpg1URo+exyQeuo8NtNo3J19MMv6SOUYDqztv4TAU+GnwdCxjUMDKD/yOrhIjh0cDlmv
 M48xBgW8I0R3GmE59tJgthXX27jZQ2JME9yiWNPxEiyvktbPREDpKq2eQ7V+572nyLWuroSLQYG
 7ztmncCbeUWYE6VY+HDitksVoJe9Gd34IUHl0sZjl9j8uDsCTw1CUo/84hFEJVtyzCD28W/qTMh
 /uIpHUbBDMU4F5ySVYOetlPIkjNrL72jkuHbnu1ankhoY9h8QxM3cGhn3r19bWoDKYfevfDmuL0
 9Icq45Xy0bXlZK7FRkA==
X-Authority-Analysis: v=2.4 cv=Bq+tB4X5 c=1 sm=1 tr=0 ts=6a0ac585 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xYWKWClV66zwq8RDQgIA:9 a=S4w2FMICIi4s7N89:21
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Th7gOjJSM09JrL7BbWu6Uu6p2C1Bl6tI
X-Proofpoint-ORIG-GUID: Th7gOjJSM09JrL7BbWu6Uu6p2C1Bl6tI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180074
X-Rspamd-Queue-Id: B9418568525
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-108120-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.4:email,ac4e000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 1:47 PM, Atanas Filipov wrote:
> Add the required JPEG encoder definitions to the device tree.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 52 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..dbfc6cc051f3 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5198,6 +5198,58 @@ port@4 {
>  			};
>  		};
>  
> +		qcom_jpeg_enc: qcom,jpegenc@ac4e000 {
> +				cell-index = <0>;

Will there ever be more than one instance of it? cell-index is
generally discouraged

[...]

> +				iommus =
> +						<&apps_smmu 0x20C0 0x20>,
> +						<&apps_smmu 0x20E0 0x20>;

Please use lowercase hex

> +
> +				interconnects =
> +						<&gem_noc MASTER_APPSS_PROC 0
> +						&cnoc2 SLAVE_CAMERA_CFG 0>,
> +						<&mmss_noc MASTER_CAMNOC_HF 0
> +						&mc_virt SLAVE_EBI1 0>,
> +						<&mmss_noc MASTER_CAMNOC_SF 0
> +						&mc_virt SLAVE_EBI1 0>,
> +						<&mmss_noc MASTER_CAMNOC_ICP 0
> +						&mc_virt SLAVE_EBI1 0>;

Instead of zeros, use defines from

include/dt-bindings/interconnect/qcom,icc.h

Konrad

