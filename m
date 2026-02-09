Return-Path: <linux-arm-msm+bounces-92227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC9gOaigiWlU/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:54:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 628CB10D3DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51931300C9BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 08:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507B0325726;
	Mon,  9 Feb 2026 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E16QCMYF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U/qC1afg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BA530C34E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770627238; cv=none; b=eSsgXT7q8HMb/f4vQuQRwOBnB+ewlZClX015RnFUBUk1/ZIKWYmzq/0cDueVERGOVhVNAVdArDhsreRW9dZcsGIMHOxADXEvU56tUZwrcJeHDq8SH38O7zeAfFzE04jKcFG3VPI2a5vOuunRlskKd042e0qM+jl+VmYhPnFWfBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770627238; c=relaxed/simple;
	bh=BrBZsjwWaf2XsMq/I5R1KtMQUDwHUJrvmQol7WQysVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X56aszkdBBCQ/uoMsIfGv7TfzaeKGmwvGPaiC8LumXRTLtNJJ4+JOggdWKQxBmwCT0z31CCPGm4iDpDl+hewgAI1kmXJsgzCSRQFNvrSUjngM9/YjjZ4ebr8TR8rJwpXYD7SPsg77bBvwidk/Z/+Q4Oau/8srYP8Ykel6aZ+ZkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E16QCMYF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U/qC1afg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195Ndc32031733
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 08:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90zRJ2l5zzlz0Ue4j9HhTVeCKnf0b8++PwghUJfL5YQ=; b=E16QCMYFgG/vcS5+
	forNQMItfvT5tGXtHMWcBjJDtzACfYeUNrlNZgHTTZW9ZXb9ZS7368I9P+Nq5jI0
	xtmp0ZQJuGvh7bZ2HE6j4vgjjjY6Df4Rw5GzTQWFIrLixxIlfuSSkC7HRV9xumL7
	lDicEwd/u/1BnJaOewE8zjW/wCWn2uZcIQ+FgB4z2nMmRjj0Iy9JUB6NpKPOY4Vm
	8f0Y9DK/1nu76oaUVsyvVJC+1p+Vfhm0jqISA/rWOQC5Qu1N9ISyXqIrEu58keaK
	6/IdkU3iDy7fPtfDMmtSQmrZ9E7AsDxK4gdUr3ZBwfByLXUni7/VJQoxDTMrXty/
	/6k3ZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79d30ppf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 08:53:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb10b964e6so46658785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 00:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770627236; x=1771232036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=90zRJ2l5zzlz0Ue4j9HhTVeCKnf0b8++PwghUJfL5YQ=;
        b=U/qC1afgrYYG7uZIVS+DCCk8o/ZnpoYaCAN8VVGJwy1rsiUU7ZG3vO+cobovxejOpa
         6I1Q2i+u5if7xBEWl+cYWJ4Q/GWUu72Wp+dQ2tkckolXgFPLwr7QGguDVlKS0K59AHF6
         w9YsospQR0cl566aR6+faKqr7eeobMJ+RihSaMAiUWCpDk0k4aIjxri+9Ijz18BsHL1Q
         tgC/JhTnVBDoc+y1pxcnA/TXBRMT23zAlCtxg4yBMGGY9ccNM/gTZYUivmHFenDKrQkl
         rVUDc1bzSKtyfgQpGED0VyQH+OMmX4otUk/nTE6Mc0FWf5jOqf7nAgwrkkHJNxYWW4JE
         yrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770627236; x=1771232036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90zRJ2l5zzlz0Ue4j9HhTVeCKnf0b8++PwghUJfL5YQ=;
        b=MJ5Wu3wE/Vo8yXN1H2MlkR67I4DmlM9unce5WrnuM/IEgV8KzqiYRAOJlc8wzt/1iM
         Fn+wH6/kLI0cIvQAHDV6PePWLiOxgpZYWBUAD7XrW+meYMkOkbLKGZ36oB3zHeM6sqNA
         zuGEQH7M5Es3fBOeHU9u8Nfhg9Uzbkyelz4sC4RTOZNeX0ICVFJuHB9zdnbBXkfZTB4W
         o6PoZEzeqaO8F/WlPSc2oq2owUDSViEHJbjfGA/GLmaaT1ZXm55Oxiy3GG0XN9lAHysY
         fCpWXkJaFoi/a83OL6WzqfP6GAocQ4dZjcFGXf1Mt960EevZb0YptsmVDnxp2nJDW+22
         qYzw==
X-Forwarded-Encrypted: i=1; AJvYcCUlxiZRyFbhiKOR/X/akKT5j0jBqE/lTvZto2Xfy9WQDBteBfECwBc+MmTo64Vwqp8rpn/+u3zxcTgiAwNd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyan+M5z+4ACl3Qr5263zgCu7ni+7/JiOuC+eT3lG2L1M8B8sMJ
	dmZDfaIgIVbEvROKZ8BsdmoD0f3Xw1U2P5njcd6wGoJOEzPS6n5B4XyZe7M+vJKeAV3hIDcKvzR
	Ywi/H3AKQzVRlEjaFXgY+46ti3xQc87U5fevJkEy0DTA13WxnYxpfMvnv5mnW3ADtukM9
X-Gm-Gg: AZuq6aJ+Y9sgihKf3PP7C/By9RF74k39didUb8Js+Gzg6fvrCHbChmLY2gJGF92WSNe
	n0PzWc4YdDGgWdkNKlkKB+9JHhCByC/P33ym0JDyI5QViySCcbVIZy33E/eRDD3Z1nHmZrep4qr
	8/RShtJaqejaagGCyu6vwZvQLJYylyFcjq4+24r4ddmSd07DCFLj+GjrWwALhDA3Y590oPHd0r8
	YT7J0IbSqzzxUinJRqstkJd/4/r8T9hIALWiOhGB1K/kjUAbTiJSO5HwKYoUFNnvq1tQePUcvFt
	nwVkhJiZBjiR8LlWp5S2LSDjLpI6WpbGN+cZ0bPJjMCGaL3grDOi1bnSk9GeG046aDzrwJakGqb
	UewgK8wiUjnCcXcOUMlN7+c3xYqKjTRuxfWVPoQeaRfoSyaw2Cvxn1VbEic7UcoeI+9I=
X-Received: by 2002:a05:620a:46a6:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8caeeb51263mr1147316285a.1.1770627236495;
        Mon, 09 Feb 2026 00:53:56 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8caeeb51263mr1147315585a.1.1770627236136;
        Mon, 09 Feb 2026 00:53:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae39441sm358996766b.59.2026.02.09.00.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 00:53:54 -0800 (PST)
Message-ID: <af694d66-4e5a-4c44-8858-8d30e9d5a70d@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 09:53:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: purwa-iot-som: enable video
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
 <20260209-enable_iris_on_purwa-v1-5-537c410f604f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260209-enable_iris_on_purwa-v1-5-537c410f604f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3MyBTYWx0ZWRfXx6HVNfnmHGil
 IwMPICcJhgR3ss9iDLrSZ4NzGaQi1ZcYKf1FH7f0HNp/eeuq/8HuZM51ce3mUcMTxP8LUk11zXW
 jMIQpziP6p2dN+DoYwN+6T7SYtZP9N9fYkJmqLx+EnRvy0FPSMT5ewR11zYkivEqRdlB0vHzGY9
 gq2/JDOuB2WG4zhJzGQ+nSFTJHDxsht5gX+2VqagvdoQokh2NorW0OLj7EkULHadaGfo4fZsOTR
 tH1MSUYFGyU1EMahrqlju3yjSMc02uGavHeDLgbAgYlWJJ6S7av6xzLPeIwrWXPGdo/WLbXUeTA
 0mZb1e1zqo33mbCNOtFRW7UI5H1ZixcJkMv/DKNm0udTvcie3YLmNE8/qAJ7Q2aIHFXPBcGcwR1
 XLHl7oTAUy8MNmFLVZvConTqFKmlTJ/dG+/aI/pmAtX9DHiOs6n83Go4a2nPUo/U9PC+gDmxIwm
 Xr/Np0vS/UVeuoeOttA==
X-Proofpoint-ORIG-GUID: lCBajknD5AjtaDTXrBY2z8InadP-VqIG
X-Authority-Analysis: v=2.4 cv=GJAF0+NK c=1 sm=1 tr=0 ts=6989a0a5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=KOkvy7CdQc8EJBPl0WAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: lCBajknD5AjtaDTXrBY2z8InadP-VqIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92227-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 628CB10D3DA
X-Rspamd-Action: no action

On 2/9/26 8:39 AM, Wangao Wang wrote:
> Enable video nodes on the purwa-iot-som board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

