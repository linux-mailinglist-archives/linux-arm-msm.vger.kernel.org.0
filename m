Return-Path: <linux-arm-msm+bounces-100103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBM4KggWxWnr6QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:18:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 269223344D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8ED12301CC54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF833845C9;
	Thu, 26 Mar 2026 11:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6YyJQzE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zy9yhvzs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1455A372B2C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522891; cv=none; b=iH4zCC5yWmNww3hnanJfmScKH7/sIxRHJLke8ADUf26oJS9I1cXPgsOPylpZsDbg6uZ5yxuq9kT4nscLY7PgrgrbIu1a/OANhVScb4LBu2nnL7OXkul+ttdPLVbHAD1mY++F/PTunRW7d9kMVzIPhbt2LZqBi7B68KHXtamVpCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522891; c=relaxed/simple;
	bh=cDaY57qKIm9pIDy7cQO/mh31CNZBhQYkCGOhhBSUbv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7FkIH2cwSHPzOSfDacl7rgLDyAADRHRzDNL5OEHEfKeAAZdrALT9F1qQ/THiedlm1bVjGl6CIH1Unp+NnZ3Xr3GQD4Nb59SiCW7o5jiYRUPQ/5XXS++z0Ug8wivQW/QpeVpTNnIC89LSEwbCr+CIzgnlx+oW/O+mP4M03jZw5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6YyJQzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zy9yhvzs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q7clSb2887508
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/Y8amr0VtrBzPYxQ+o9DK37io1izH8toJT61N372kc=; b=F6YyJQzE7+q02wN6
	KXupMiSQh26bfdKkPgK6VlpzarxoN6W7akyix8e5j7ewXh0kbC9LUdEZuc+XETzE
	LLvBHfWVrbw1wlmVyyOIGCbi07lfvJaax+10AcFXultOMhx6F4l7RxhAKmWAWoDi
	FFfeplXtUbPEJ3QqyacEIVzyuG0TT4VELuHxlC6wIkycQ9nLxRR06Gth5EDH54dM
	rNtFeF4to6Oj7XiAYQI0/Po+7ZsvLbKvwOdmBf/9+P7l4z8AQ+mdrI3yKKoGCiWE
	0/T9AE09gQKnrpnvJuUaCYIrABav1zSX6kSTOS0zKZOC0MTHzwCtFJdYtdxCQ2Q/
	GjshFA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d50kg8pv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:01:28 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6000a7ab3e5so32337137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774522887; x=1775127687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/Y8amr0VtrBzPYxQ+o9DK37io1izH8toJT61N372kc=;
        b=Zy9yhvzsCRpbQI6ym/seJn4MsQfdXD05bHRpzL96bhT3VpuBU7rUaxrrFdB0/AGzKH
         K8pFPUuaYnWAuZga7/C93kOoVNhJ85EfgFCra+JalIt4xnEm5UoctyDYjzy9ZL8ozzdG
         q0iIO7275oWeGHU+XR1sByGg8XxYglScCZ7rZorF12SQEkoF4PX1tT4uBwG2nGvIEV9z
         mG5f3is/g3V1BSCkX1hfhWXc7u3YFw9DOkv1IZsRJVrJLJKYodI6A/9lgoc7KofeeioC
         jjlFuT5UgZke1d72aXryumEVlQeHRvLyVjI9ZAZcAtgP1xycfPzye2jYyuzzE/AX/oQp
         gu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774522887; x=1775127687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/Y8amr0VtrBzPYxQ+o9DK37io1izH8toJT61N372kc=;
        b=avKhWhifynCbkBuf9lLpPGpAJIb039Pt71wuld83iQ7wW6RwwPPWtuC6VIYsWv1zh1
         uNqD0P0S5NWEJEE2f67AqV2Qz5LTFeueU8gaOt/aK7/GjgbIpx/3my3/HYydLR3woKGM
         9PTqElz2sR0QP+wMVhu4Kc6FSFHMY/7dj1RR4F9HUNkaRqaswU3lHH5fNqnw+J+M8BJz
         KFrWFDIF0vFzbDCDstil2hCZCKyt+zMT1D2BnzoFL3wCrhIzkgirps4VAI1jNR1y194k
         rqcaquVoRsPU5CynTv+koKBw0LxXKek7Ej4792JATVvwWrc+ucBSKG+U6QBQ6jQHwi0C
         0H1w==
X-Gm-Message-State: AOJu0YzzE2pYoytE6HHF9i6WLxA33p5UAmu52YMXh4UCzwkfdvcd3eNv
	MU/tfJYJ5p0WOEfpTRFKP2jlza9SHqIGS+IYJmfwbJjSOZgdbeFrpeSSCmmME32jnGktVNl7YbS
	/1IUrIDv2RMzOQDDhju8shIomuqw5c2gHLVjRQoSNUdhBbchWH1HSCrHviaOPMPh7S+t4
X-Gm-Gg: ATEYQzxNCg1YJtNUT46eSRpeqmEjD+uvog5fERJVhtEH51KXc5Rt8MRTYqhwfSCjUkh
	jiu6rC/0g8nZucbONdv3j4wrZDlnGxUYpwaA7nnNfp7YwY/gkyWLiugN0YYDA2/q9diSVGvdq5k
	Qng2beOLMrJzRu5zJ7J/SZbigUffx535oLqqH2nnPHe/nz26CLHLHlCbp3BoeK6yE14OwydYFeR
	lu02j1Mk7NEBVsIvexGjzFq3bp7J97QmEcOtta4SsX1OcTRSGv2Xs2Lvkb6DhgFAtq5kaxBuOOp
	pw3JYwgv+Ot/40fJUOXa2O4bULL0aqs56u154Sw/hBHx33OioIjvMXEDq/qqW7D3CtdVpRaXf8D
	d5kJXNWH8sjgwIV4+n/HItTwQhMoxwybNzYaDQNGxIyzigi2qrkcLebalfFfoQPw85EMDaa2gGT
	sCrTI=
X-Received: by 2002:a05:6102:2910:b0:604:e850:92cf with SMTP id ada2fe7eead31-604e850937fmr121293137.3.1774522887281;
        Thu, 26 Mar 2026 04:01:27 -0700 (PDT)
X-Received: by 2002:a05:6102:2910:b0:604:e850:92cf with SMTP id ada2fe7eead31-604e850937fmr121241137.3.1774522886657;
        Thu, 26 Mar 2026 04:01:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203c0cffsm103374766b.35.2026.03.26.04.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 04:01:25 -0700 (PDT)
Message-ID: <ed0c8b2f-57c9-49d3-963e-a6d4b6d242fd@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 12:01:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: qcom: pm8921: add labels for ADC channels
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260326-pm8xxx-xoadc-label-v1-0-027805dad4db@smankusors.com>
 <20260326-pm8xxx-xoadc-label-v1-1-027805dad4db@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-pm8xxx-xoadc-label-v1-1-027805dad4db@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMZPlevH c=1 sm=1 tr=0 ts=69c51208 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8 a=Ke7W15zrM9QGlUBYRRsA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3NiBTYWx0ZWRfXwHABR+bavEfN
 HKYffLhXYCnzUpYXXXT2Jgu7YCqkp8JzcNkCMURpBOLLWI8UwJtm0KSmiKjNOZ2sXno/cse8WuF
 vwtpj+RTVLF4wIAvuAu4Q/HayRD24CAUnggYFBXG79tBPwscuulkWo36wnrso3x23ZyH/iaczW1
 q73sYqlEAJxsInH9XWhVgHpEXHZoaX9gnaTijB28052W7k6QuH56FXtPziEsNkt5ygLQk0KyN8g
 +vnzgQzrtcWLnEK8sApdBU+bRWRyJ1K1p+9d3JKnZl4SwrMpG1/x6fVzFE6dmf3333Rl5u/qWDN
 87anHKzBKz2C3h8bye12Gek/QFl8ybBKwbxWbuvhuuWjSnhdjdAocEfgT7wTySmL8B1OKW6dGi6
 2T3L0QKXRPsCUtCTcQa9vBtHkgcaB3GZh61h6g1CyWXhwzQHj9zsWzTRA5lk4lJSFlg3SNsDtUG
 56+WGBqUp4iCmewAHKw==
X-Proofpoint-GUID: M-emn3d14K5kPwrzXRNn-Ew5Wi44lh01
X-Proofpoint-ORIG-GUID: M-emn3d14K5kPwrzXRNn-Ew5Wi44lh01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100103-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smankusors.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 269223344D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 10:02 PM, Antony Kurniawan Soemardi wrote:
> Add label properties to all XOADC ADC channel nodes in the PM8921 PMIC
> device tree. This allows userspace and drivers to identify channels by
> name rather than relying on datasheet name.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

I can't find a reference but these look reasonable

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

