Return-Path: <linux-arm-msm+bounces-100295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Aq6LER6xmnwKgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:38:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B643534449D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B7011300808F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A4722CBC6;
	Fri, 27 Mar 2026 12:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/9oU4EV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdiAeJcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D822222AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615102; cv=none; b=fYC7KAuS3AYOT5BViAzvhRpyp7Qetj/a/4W4Hs+eSXgZuaXCxTxfrun5fv2h8G9SVVKmKXYgXUXJN8CIYCuyDA9N7SM+qfM6HewJy+N0jcM1yVuamF9EfxlFfzeM6+gCYQNBBn9yoPyptFcex+xjAPxYHDkkqXMnsmQLGt1jACs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615102; c=relaxed/simple;
	bh=2e/we/OejT8jR7LpR46W/LqsBN/KR3kZ/VKrfYK5fN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=o91ZcJ7JPZD88V05QVKQQO074GLohnKXckQ7y9KB136E5PJYbUl8etnq77Dlt+wnEFJXEZa/3sc8fUD888U21NEYdg5cAx7eDYSlWqFz9sSEUr16vVdYDP1C1qFC3PkmSjCRvjDwyckI+AH4HOlYCpT2aQtsF3eoL2oORWe9J68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/9oU4EV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdiAeJcp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vqOT298548
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8lTJiQQbjA6cM3TQhlJ9uuo3fVulj9CHLFEalD5HBZw=; b=l/9oU4EVMOsRLZbY
	+sqa8Rs5BFo+7OWNckvKcMt3JPLAEGkgelfNfeI7DcBi1DNf8dWC5tccVkmO19nt
	UrVbcbhEUH6HiUwhKVAKk2x2lX5bGbm1vDnyMveD3kNmULOpb2hMeyovgFMRs+Pw
	m4J5xWvlW17piiQEl8+nubxZlGIMjNkGTTvNjIJbdmJiTczL13Q6WCP6QuDyMVNG
	qp1uKB3PxMJoOSG9xamgtpDxJVDju8vYWhcUU04pucj/yG0n+vaPuJnoAdKD+87v
	9uxeuEcDb1N68N9v/hITo4L3Y9QG2LWPVGKV3lL3rJpcmpGthOu8oijaPyxGYZ+F
	KgTbOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8u2sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:38:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b86b756c4so5960411cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 05:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774615100; x=1775219900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8lTJiQQbjA6cM3TQhlJ9uuo3fVulj9CHLFEalD5HBZw=;
        b=hdiAeJcpszelVofEbQkTPdiMtkrCAix3Pxz3wyjK///p7wKgvZTTM6njPKxh+Jhh02
         regTfmSQ86SppPOTa95GnG36mKEf0YRBc4ZZdYnI+cXxXahEBsjihXstWzqDYQUw1K/x
         LFbotFYjYNC28sfS1UfJx0f7f2+4xW5CFHPpWp1vKbeavOjlJz7f6i8+Dii6/LpkgEXQ
         T/WPXax02Aai88tzRxcVSmmU6tb1SLEbwanPhymrRBFw4qTuemQAybrHvBO+ZMLOCuU2
         i14EuERgubSkevpFIeAnz3AdGxLPzOwXfqTFkQIVd0/owKGVnwpzV7DuSfFquOht04zK
         vdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615100; x=1775219900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lTJiQQbjA6cM3TQhlJ9uuo3fVulj9CHLFEalD5HBZw=;
        b=UBY0o4mUP8dql7rVlm5hnkkXtrWy/hi5bhuO6iqUVjWbqUpaq6fMgZarf15XG/vCaB
         0yXWxH2scqC9Bvy3ZDW3ixrlC4gKcnp/caz94KaBFkameK55vOx/W8+OmMFHx0J7dYRt
         ip/NCpUSJZ70T1P+Gy9t2OaJixEe6G9zUlzhWdoJ5m0DYbWDSvmU+t9DOofXnBuAQmvv
         +Eq87mhSZ6rGfYOHxYkEkGbiy1OiXBhdf3fy4mqhl2O7n7iLy2CT+Ap7GhNMXF9xgPu2
         hzoaqABqrFXfdLGLK2M28kLarPbXJw3rbGIRK56VOQF9EiQXQPd67PDziFFj8KyMDHY6
         zGMw==
X-Forwarded-Encrypted: i=1; AJvYcCXUJaPrOGEQF6KttmkcZoDd3rSOEFcIQzkpa5MTvzraw8+Z42xy7fAjrTrkjvjj70Vk6SIaRytl8Klwo20u@vger.kernel.org
X-Gm-Message-State: AOJu0YzWIu76JPwqG0oas8evqmO2bFjVDOkjXy0q2AYhW0/iiUUgxE8Z
	NugzDQr75f9imVpNnePQ38TZV11uk6g3SFwiyd/ANArvpiKzFgmpLLPP8hC22XR0vVs4mwit1Mt
	aSDPOabuRR2TpKNe3wvmuy1UWM/ylVz0vEyiTHmgZhAnc45i58r/4OmQEr76D4LoVntgS0Nhnui
	H0
X-Gm-Gg: ATEYQzzMrsYHuLyKssAgGiQ1QxS+1NywzJhzP7pxoGkKrG/rQuS4JtmoYqmy38YTrMt
	CECwN7uhZCIx3LoF9d8gVErkyX8P19nLDVQzrXlRjvMT62xt5RA0wumQptTv3bqc53zupjUkbaM
	94B+qkam//ctIM5YLTNPXSdfWhVGZDA+aqsHWaGnAdI/3Z/bzMmQzAbc83/K+tAsZlFz8AkDKyX
	CJs2Ht0h8+vCRI3ybWBw/CK/wlYq+Jr18RJVtQ9g0q3U8iS/mlLd/bSZSyWGbuRa4okSVbtv9Om
	PGR1MPmOOfasZxIr22vHiryb29gkE0k2PyymNhaJugyqg/y3rBPz9uORLtxAQsBIRZvNDISVK+Y
	rijDC/oh/COvYZol3posILC/rj8kMfkqjFNzJs99dnz37l8C75Iky9CasMeYG6ks156mQdZj1F5
	FVxMo=
X-Received: by 2002:a05:622a:1e1a:b0:50b:2972:4bec with SMTP id d75a77b69052e-50ba3858ba1mr23296121cf.3.1774615099679;
        Fri, 27 Mar 2026 05:38:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1e1a:b0:50b:2972:4bec with SMTP id d75a77b69052e-50ba3858ba1mr23295851cf.3.1774615099232;
        Fri, 27 Mar 2026 05:38:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20445b9esm239458566b.62.2026.03.27.05.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:38:18 -0700 (PDT)
Message-ID: <4ff355a7-bf1b-45bc-8a72-aa773dc95582@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:38:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add thermal sensors
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327101225.382493-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327101225.382493-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NiBTYWx0ZWRfX8/G0a1B9VdgL
 4T5v1v6pu+23YhtvLh62aiUVUMhIen9Wq25m3vZ1LLmNwvq2RnuIBAMLG0hYlHS2pYnuqZTCu7i
 FVsRjBkixV9To2pAdUyls4eo0tNP8WQX7cuIk3ltSAEBRbqlUIwX30lIhPw2Hn2CeHj1tA7Jqgn
 X7k/CgPBFdRzZTSbp0T8eA486CBZ2S78KJYpISQDJv+NDWJEG0h2kcsIaIa6tOROnRNHTEnRJLa
 TOHn37QyO3UVmT4pZt4f7wWxRq+pBHrYDOxRqRtLLx3NySjo458rLQIxbIDJW5ubiA6hpKO22JJ
 vV6rlsW5XXcKox5ZJoFTPAgjLBaXhf7EV54JwwssgPHFRkxK7+YeAxPL8Js1UA5XEDf3z/QzGys
 g1OOcxOPbSpsl8HtzR9mx0Bs6y+91pMmFN5NWnD+jaeKZasbeRL5c3lsmQAxmOqO/Z7HZOvz2Ft
 ie6c0uaglmPkfs1b7qw==
X-Proofpoint-ORIG-GUID: rc6D-kVG2Yw40bvJoYndjL1rBRXs5rCz
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c67a3c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=imO6bpS-6So6pA60xL8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: rc6D-kVG2Yw40bvJoYndjL1rBRXs5rCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270086
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100295-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B643534449D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 11:12 AM, Krzysztof Kozlowski wrote:
> Add TSENS thermal sensors to Qualcomm Eliza SoC among with thermal
> zones.  The TSENS is compatible with previous generations.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Binding was waiting for 1.5 months on the lists. Eventually I resent it
> now:
> https://lore.kernel.org/all/20260327100733.365573-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> so feel free to pick up the DTS with the binding, since it is not being
> taken via thermal.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

