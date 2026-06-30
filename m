Return-Path: <linux-arm-msm+bounces-115404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SniCMaOxQ2ojfQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:08:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 678EA6E3FCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:08:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D2v5+HUQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K8y0U1rA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115404-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115404-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC3473021752
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E8C409637;
	Tue, 30 Jun 2026 12:07:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14B7305665
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:07:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821277; cv=none; b=L5hP1kurfUhX6r/Yx3mLNmJb4ofIrEkQUELEBa9PA/Ht1ET55axWp+LpoCA9dKFeOfgptihDBi3AybCCJd9Evs6HqXhXIJqGo4coHuUjzOLx4lwk78T0P5LOpwBdxZHkaE1ysEH41jy0Pqvydw+G9wmHJKCP0rwVRaTgFxzwyD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821277; c=relaxed/simple;
	bh=f17Bu/wrlgfBMydvWnsBrhKXZGIzMkgdyIzjhMwpXh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3HsvM7eQ656VtVhRZRTCx2IY7HoreJNIJplVZyRkkSDsEYBjUKD3MuIqO3jCw+oNNKTq1GRdDMBnXRTFsNU9gVf64mkBiBxVgo8XqAbnXMIcqVfDN17tjKhs6Ylm02ou1283QlxIoldIfql59fJGNlZeZh2Ul8Qqdhgd+jlfJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2v5+HUQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8y0U1rA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mr5I1611705
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s8nkSVjm0+6KGt7Tt4Y+eD1mKx4t4XwrLk/9apS2gfQ=; b=D2v5+HUQhOP+k5ew
	Z9FewbHHRNAGjbwjwzMi+6+QPvMRh0K5+awIqzNGhs+g9jR8Vx6HZmvl++rOE9v0
	mB/CDYQXjCKrH3ZivfF41Wr+PV9yK2+6MOTPUCvK1DUTlDULB6rM7I9EKzjaLFhO
	VZtYIe9YWeNxQSddoW0Jb+yoccGf1jaQEcEd48kEh3J8CXZ5HMbk+XHd9uqiop1J
	ZJMeaD4Whk+hn9hCc7IULxh5ykDY1y1UhI7U35105Q3asFUvFdGWZiofrSYd/mgR
	GVUByxi66NtnpBFqhwGcazbFV1ozeTXJo3M2euirQPJ/t/SeFD3gDjLN5/MP5Lmm
	cgRqvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gtgrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:07:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bea07880dso8028801cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782821273; x=1783426073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8nkSVjm0+6KGt7Tt4Y+eD1mKx4t4XwrLk/9apS2gfQ=;
        b=K8y0U1rAzQ8WmQOthxAt7me6LVEZ26o/vtPTZ30p2SpjX+4KkvlEgu3hKTAVD1rogK
         7xVuwfKJbpQ6bKv6qDqbqW17D2b+MhWRVNYWC4kNGmyozD0d7uT8NJWo6cRKq/tvBrw4
         oMkjp/HwZU3m41vtDXrAvElVyDIYVFkW8CdwtRfaHX4eLfV7K+xJOYnP1xM68VV0vdg9
         F/A39AK7Bfa1OU/QzHfqjuxftWQq3hIZT3r/rTnxJzwcc89m+3M1Tc0VJ8pAoJNkl20n
         k0XMJuDtzxS0uhDMeqW7yahEEaxgXHQKqw4p3eS4YtMg2wOeNQzIUkfteMjrfrG0vkAN
         94AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782821273; x=1783426073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8nkSVjm0+6KGt7Tt4Y+eD1mKx4t4XwrLk/9apS2gfQ=;
        b=DtTp2SFRlxj1WFFMqbxxuDCyn9L0B14phIwP0ef8N33IByPHGphnMqvDE2hw0JVx8P
         tT9k02LYOqVUi8VNo9j8x23YqiPPgBCn8ycb2S4iwB58N7LCethZqsL32ztWtWyav+8R
         TzSmg0gCXHJaWpkccoHQkJqstwkwsUCo1KO1DHMUgUvxDnL7CUjn33jgH7FhXPzGb8vk
         s451OoM+gxUx0vQ0mIaHYGR7fvCUM+OF4zUjr8NPB5lBpmA0IPQrSadvXjStcMLPeHOs
         aio9QoXZuJlvgwoCpLlCF3wX9ZzKW+Hy2h6T8fv+hTa+5BIEtN2ZvK8ooA0pNopUMriR
         pEuQ==
X-Gm-Message-State: AOJu0YyGVtjEIPgW7jPcv+6/jaRO7UGH30V3BVWV+LHgl0PvMfcBleP7
	vTMuSQNikF/XxIND+tIN9gY8YQtb31VHQUsW+ar1gaD4gHXNIT78q1gNvt3SD6wjAZ8Qw671php
	cNTrMP5PZ63I03ff+sggTJD1BCWTAx1wp0/iALWA4fmKJ/KNuZMQ7c61ErZR2rVy2hZiYo4bWc9
	HC
X-Gm-Gg: AfdE7cmJL5C0ecJ4lSUguDWjiR6a5DCtEdiaEqyNSMCKvMbdk8Rn5y1cL89sSWnxURr
	W4N8+ONEr2k7ARzJnWRBr57yzlEEcyM55gxh+pO+1sHdIxOP5F+Ej2H5UF3WPrvBzTRdKxzVjc8
	2xLMrRXJyiaCxFB6x1gWwPFl4ZGGZnyAlNdyIQuyIJLtHBtBxqZyDeIcKnEnWt1u6YyxWexN8eh
	++Kzs40J39vXIC+MRyi6lC00pVrh3LSm5MZ/seHUgxE2SukgPZyWcI7fQC15E6ewxV4gihJii32
	0sGnnHALp48N8COCX0usnNjJkiSHGXoz2fKljb7jfagY9b6F5k0y6xTwuAbx4YboVcZhShMI0hn
	3vUFT1KpWYjmdjqR9asNClQJZ3F6zKZYQ4ts=
X-Received: by 2002:a05:622a:134b:b0:51a:8c9b:64a7 with SMTP id d75a77b69052e-51c10950a04mr25796441cf.11.1782821273185;
        Tue, 30 Jun 2026 05:07:53 -0700 (PDT)
X-Received: by 2002:a05:622a:134b:b0:51a:8c9b:64a7 with SMTP id d75a77b69052e-51c10950a04mr25795951cf.11.1782821272483;
        Tue, 30 Jun 2026 05:07:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0d68asm113569266b.31.2026.06.30.05.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:07:51 -0700 (PDT)
Message-ID: <7baab74e-1d44-4791-a599-7b2eb802e438@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:07:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
 <20260617-topic-sm8x50-adc5-gen3-v4-2-4af9251731f1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-2-4af9251731f1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExMSBTYWx0ZWRfX0/cUNvZlbFiQ
 IVR3HXrq06Fc6hCt7wt02txOCBTWgh14a4OFDYSDMkmHEGu2XdSDdHmskMuZCEslQjU0qc/wSLp
 4d/2L2KHZdTuHbQhasYm/rkFxZLi2+Y=
X-Proofpoint-ORIG-GUID: bA5Iierd3QmUjC_-aKBhh9nZv4wcXd1w
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43b19a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=iZyORjh1VVlEZnV2gd4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExMSBTYWx0ZWRfX7c5+vzmB/4nq
 ab432rUJdMjm+X7wl3sPjEh7SbRslOSV7g3FhqwcfpTyXr2wIHEYsj+/JaWA+8hjcozkKzizvAQ
 yWs8Zj4y6fAluHAPWmA142jF66wms03T4rWWtVcVpmuxUNmT8wK3XDxsOO3SZJ8J4WZky2t8rMK
 cJAhMd1cy/jOrTry4i/XT8QKbfYcXWyy/5Wv0Oqm4Vup9giCIGQxXnAUufGU6nyBRw3E9GKksxe
 qYcMRPtj2VA/ZpmMMzX16m+JQ9LaMP2l0ontKB6gJHtrTnTtgHmj3szqGpsP2eEW2C3d58Zktqa
 feaC6Orq0wK6hV/6RCxvqTHAfynbFdLIE14Y55DcsanXdrxYnoIfWq9UtuOcffJj5sJ5Kt/de4f
 xXpNZONZJmNmYNgr47xVNYO53vzkk4P50vbNixu+oDJMLfcOLQNcgxXZrmrsQnJu9RBlu7jNUjk
 oDrkTw/l/Ww6x2i0rag==
X-Proofpoint-GUID: bA5Iierd3QmUjC_-aKBhh9nZv4wcXd1w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115404-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,linaro.org:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 678EA6E3FCB

On 6/17/26 2:53 PM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 277 ++++++++++++++++++++++++++++++++
>  1 file changed, 277 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index 2fb2e0be5e4c..9356b40a1850 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -205,6 +205,92 @@ platform {
>  		};
>  	};
>  
> +	thermal-zones {
> +		skin-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> +
> +			trips {
> +				active-config0 {

trip-point0 (the current name is very misleading)

> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";

125 degC for skin-thermal with a single passive trip and no cooling
devices is.. certainly toasty

Konrad

