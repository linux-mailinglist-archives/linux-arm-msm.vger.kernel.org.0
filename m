Return-Path: <linux-arm-msm+bounces-91281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKBDABmPfGkQNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:59:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F0CB9A74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E73FF3017797
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C6037880C;
	Fri, 30 Jan 2026 10:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T87iEZud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhycgUH6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE0E2F745B
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769770762; cv=none; b=qgOYTUu2tMGfRKg9ylfE9lxOBnffcsCaZiENRuJhFn2DtFe11nJNRUXsrP+Co6zriRz5c4flEpKF3Ap2ode3Sc6Mks0MIo7Ui/wcpo9243FsJW4Xz2UsdSpp+h7Qj5pqkLvSCBK0XI6T+jhw4HRjtFHTZw+wghXVUFsFZruFM8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769770762; c=relaxed/simple;
	bh=T2NYE4X2s0Wcny4CQ5sr/iWlpw/nR1anrQveUcaKd04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0sFy4sAdr7KXemCYeoDOKWTelzheR0Jjo1Whn30WXKB9zALdSEhmnD8MMzfBaEDWhFcINyCh4dPr1s9/KIDBGiqgG65zzYLryqG+ZxwTeqYQeCUZctRhSeXwR9MHuavhM02pyOaEBtdAlQeR1xbwa5dU/NjwRUL2SQHZZclXnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T87iEZud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhycgUH6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U4tqhK2295325
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cXpreNydN/pOT0A1jYz8txGp0ZVcD92+G7nTlpdHr3g=; b=T87iEZudaOnvhlCq
	KTdVC9B0u0GKZkpC8ERXGQar2xPiFW+81vx4GDAuVvvANIW6GOVh9nE0RB9HlrHX
	unxR7acOJ3y/mhiwLEbWtaQU3M7PuHI56PoammSZlp77aq5//Y9qXZF0Gz3IhMdX
	10FUs255Vh4ia5qWH5aa0q+sYcSpKyST0ya953jMaDF7DcHx/OKmB318Suardktr
	VYurKUpuytTyzuyEIMxmA9jF9QHJqjnCNXCJLZ7/B7fwGHE8ln/RRqmzgMBM3eQW
	eR/LslAu/031CMsyQqf4IWH0eJPDdZ58MTPqyx2NlmU5lRFypVkzk8hHBp4+YLFq
	uYTGXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p1x90uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:59:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c536c9d2f7so15435985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769770758; x=1770375558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cXpreNydN/pOT0A1jYz8txGp0ZVcD92+G7nTlpdHr3g=;
        b=fhycgUH6v6qMF5KjXRiP2aRkvmNYAvurkIVw8u54dj6amm77BATv521jT2RNOTxhBp
         h9pCchZ/A7SXlnMEjLf7yzVpsbOmWvf+YQp1BtUOIIz0yQy3k0S54Vir/hGW4KLddKEv
         kyj7RkYyBvybPMb8DoNI6iGmUGxVlfE5cGnaKm2Df/8s7hbXJcDAqmrtfOgkhnQXumZ2
         1N2kc+2gJiiZfcDKYkqzX4ZhDOyTf600RVyYypFmMUi9NEtYpH5LQONN2DNhQv5piLvS
         MRSQHCBaX7RqKR8R1A3RkXCvW1xOY//zE6vC5grMbQ3c3EdZezHhq/ICn11Dszbf+Tnu
         eJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769770758; x=1770375558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXpreNydN/pOT0A1jYz8txGp0ZVcD92+G7nTlpdHr3g=;
        b=sefSMGWOKhQSmNb3rlfJeD6RcCk6azOLZLPMlr8CGA7P1HUbf3Ey9WvrRLqrEgM1C9
         1HBRSacumsrW4AMJiApcc59r7ftP/KtZeRWytgMD6uL7k9E5SD4f1dvtN8qxYah5Hlqq
         XvNMLbcttbJALhF1Ux26F5mmGT2k7vm+NN3ahxPRFR+SpwOxfluQiI/s6x9VQmhaR9+9
         afBWUnnkJY83ymSJENonKB5t/5cgnjMX2CMsFpd9MPvLg8EXnq4WmAbV0zvkSaUXwc9q
         vyy0BSnvoO2pUorUb8kuu3MrW3v1So2yafKM3U9i7AKhe0kBx609QWp3+t2txUYvGoXh
         JAKA==
X-Gm-Message-State: AOJu0YxntHsprMbLq+uRmz0L++3IyyloXkET1SMazvyCdtpRPqCPZpHf
	yAULI6ILcBtIqVdfCDE4IiAzEVOUzE0Q55tG56JricteNiOVSSyQrBwJ62Xz9INUgHVQDSm0hAI
	TyStxMYLpkPz76FemV3+z/STVJXiiItJz8kwlzOsuvbSTf7cvB6hb7rysiIyFwqSENRnR
X-Gm-Gg: AZuq6aJgQDEoM+J1Ooti5ourdFpeNxwI9YWlaNTrRWe0JoAkqoCkhAr7i9vDF5nEtz5
	osCYAWJLFobVhkml85311UHJ80cNRh72cNfh/AW7WCIeUePKQign/2iwZ8j5FYAiFCGMRn6y8dI
	eV7e4DoETKgBVPcQLlUvk74WnDIuSywlurXrccGMBKusgvnkbLjVv5w8RS8NI5QPoQ6UsYqMLXw
	YhAv3pWX7/q5OyQ3BNcVFOTms/23x54puExN29WTSbmw6dFHbVulTHhMxAo8TOW886vDRv2bDiO
	ogWLgFaKsBWx4k3YPZVERZSKUpsZ8yw3l3tfQU+uzQLlsN3c8zw/nKYl7lvDpDo23IkE0pyYDeb
	I1Rqzch7JTy27NJcuD/vupAzmcxWHc1McX/eSPlnRSDxdj389IZIMA8M22imvVPPsQro=
X-Received: by 2002:a05:620a:29cc:b0:896:ead2:a657 with SMTP id af79cd13be357-8c9eb131963mr264164785a.0.1769770758531;
        Fri, 30 Jan 2026 02:59:18 -0800 (PST)
X-Received: by 2002:a05:620a:29cc:b0:896:ead2:a657 with SMTP id af79cd13be357-8c9eb131963mr264162985a.0.1769770758110;
        Fri, 30 Jan 2026 02:59:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f1f55sm402198366b.70.2026.01.30.02.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 02:59:17 -0800 (PST)
Message-ID: <eef70e37-3841-47f3-a436-13e18c157176@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 11:59:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550: Add tz-log node
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Kumar Sharma <quic_vksharma@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lei Chen <quic_chenlei@quicinc.com>
References: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
 <20260129-sm8550-abl-dtbo-v1-2-abca3be14024@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260129-sm8550-abl-dtbo-v1-2-abca3be14024@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z9DzGbL07P1vV9V5RUvVy19KbBzSF-nI
X-Proofpoint-ORIG-GUID: Z9DzGbL07P1vV9V5RUvVy19KbBzSF-nI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4OSBTYWx0ZWRfX711cKOOmLQqq
 FnlSA9ogWTLQLDQM44+dG3W3ZLqgos4MjPNO3O2luocrbbu1B/Q9W1tW499OME8OJY+cbz9doX6
 PPE+3sdeZVqR1r7obH5bpxuAnyaGxOVEkqwNO6tzXl0LwFvKhC5gwAkogpsERW/RHMaKx9BdXK3
 P+i7H2+iUGaq2CdauSMcbrdwcKf5gn5rXP76F3RwoXqP42StPSJDMwPUrD4Glf7HPp7BG1Zd4Of
 scr0uWVKqAqdGzbpTpmYMn0iobLVrBKVVPDriyr2NABME2JQL2jeh+ZTl09gxq2tyg8eo6E0yzX
 y/voaCPuUSUEV9RfKwSzFsAznOr5DOISZ2DCP6RpbQ6d3Wg4L12apbpKHSURyOv9wKvD5H2KeQL
 T6q7iJavp06DrRtMgpgDq5cMdaRKo2Jc45EN16ifEPL5TEPFyrAg6JzLWuxn9hUd4KfTlt9JYax
 n0ANVna00QAPNpdXtAw==
X-Authority-Analysis: v=2.4 cv=G5cR0tk5 c=1 sm=1 tr=0 ts=697c8f07 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8
 a=pJPL6FOcZzJov8t0v3kA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91281-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 84F0CB9A74
X-Rspamd-Action: no action

On 1/29/26 8:46 AM, Aaron Kling via B4 Relay wrote:
> From: Lei Chen <quic_chenlei@quicinc.com>
> 
> Add DT node to enable tz-log driver.
> 
> Signed-off-by: Lei Chen <quic_chenlei@quicinc.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

It's nice that you preserved the original authorship.

Please extend the rather lackluster commit message to explain the
"why", which is notably different from the original downstream
addition, since your goal here is to mainly appease a grumpy
bootloader.

>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..740e3c238e8ed0f162dd168291f6e307ace66e80 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -5136,6 +5136,14 @@ data-pins {
>  			};
>  		};
>  
> +		qcom_tzlog: tz-log@146aa720 {

If we were to implement qcom,tz-log upstream, this would definitely
not be a node randomly in the middle of /soc, rather a child of
imem, most likely.

Could you please check whether adding a qcom_tzlog label to *any*
node makes the BL happy enough? Does it need the properties that
this node has?

Konrad


