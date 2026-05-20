Return-Path: <linux-arm-msm+bounces-108664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMDQHd+EDWonygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:54:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E209B58B293
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5B32301DD8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA84A34B183;
	Wed, 20 May 2026 09:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsBfcvaG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SMcNWqEm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCB03CA4BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270293; cv=none; b=NlcltfoETdMQcm1aBhUaf5LzZBigah9dyQ4A3fuJQdEbpWAwrUKTD9Vt4QKJ/VJ1dvP3QZ2Dw4K53xC+JPR2kdV+KLgSHGRDpc5YN/kg1rYBnfzENEG3jheCY33+c0XvQ5W63iRnXvsanVwjJGgNhDnopvb+k1nVTF+U5eQhxX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270293; c=relaxed/simple;
	bh=wqoAuXb/5kA/5+x5+834kRW1w86XaBss8UnzXjuaKOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Los41ZdyUK19eSqtfuNNG61Ysv7ajm3ZkpqXYIluAmx5qXta0GP+pIqgAEdoP89lnkMBSlkyHkXACPi9MXwAGhCnkQvkepkQ1nobkug50f23fjaHOXmtN8Wk/EJV+kVCEpE5MEjOvroG2AtdYFY2Ax9AZqKG3L5OHYq5Wqi+hpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsBfcvaG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SMcNWqEm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7qqeD1637044
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ek9kRaJbW8YclFvMHyc7DFynBm4ugWlo225XSv2d0eA=; b=HsBfcvaG2Rybi5yZ
	tKkR9RjPZ35hf5lJlf800qC+fcA2avUEgi467t4NCb1T81wC5GYvJ9wS2RXZ62pP
	hF7rqTuMtjDCJ0kvmuSPC5YH+riS7L77t21HE8wGDUA8mJHIUYv4MrdqZiGI3E0A
	YvhpmN4g4ppeKb6Rm/zWum7G3ovTu3QuP4zAVqw5yWZGnfURwJugW0AlY16EHOqj
	Y0MQ+zft1RCMf0Tk4Vd/FcdOwr5Mq+eCRv34ojKOizvzbCMyNpQrLbrOcQv9LTct
	angZlbzZ4Xb6+Hlrk/PzcxRfQu6PF0TtThDHZbXIn0EBu8BtnAdTrJfrnHNSBFUt
	SrdZOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sc00j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:44:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-90fe39eab32so77274185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779270287; x=1779875087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ek9kRaJbW8YclFvMHyc7DFynBm4ugWlo225XSv2d0eA=;
        b=SMcNWqEmrKJu2j4hPwY1dNIra3sIWpKsDALX5/0LTfgVV259xFlcbxEWmDCKxNl5Mt
         07F5swvkY6fJYWSbf0JVAhqO5kjaMkM3nl2mgGbbo+NLzOBefRnmWco8QuVHxS2W650g
         evafuQxOl9zAdwEolsBSjX/cj7ueQDTV0d91gEvmMATu2XYUBLGFBxLTlMfbvuK8sysF
         T7qQ5+2ER/j+/uujV6ZxAH5sohxsRdLZdpxwCKcv/CSfYeTpl+Xxv3ylNORJAzO4Ok/R
         TvgeHs14FEuur8J/ri/otRgx4MnXdMS+Jj3AIs311wP+DXZHgsNcIMLCLuOBUHq0+LB4
         PD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779270287; x=1779875087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ek9kRaJbW8YclFvMHyc7DFynBm4ugWlo225XSv2d0eA=;
        b=q+JzHSQAXodkp9EamyebhD9lyv8s3Q5YDI2qldoeTvodJkjHy6YJHfWpoxWOcEhoyM
         Oep9DrQQvRdsCnwCgKlSerwbGP315+4k/OsSfCuORTZ/MBQ0giVnz62l4AwO+3vAonDn
         6RXR60RTPYAga4FioqC74tsjOJeKOu7v4XIVRz08qJKQVJTkFkR14LTkQ9SIuC+M4ohS
         dvJkPYwbaMcpAVILuJ8sbJRU0sYFL72J2HKHJx0bwO4aUQN3lu+SSIN4afDlr9jecmkK
         WdfY5L3ob1GSJ9dub4qyqkiA3tucv+FfCMJicukG8QZ20qRCWxQ9iUFygLwYQuFoZf+3
         pErQ==
X-Gm-Message-State: AOJu0YyVyG0KZ0XFKjePAyBL7ZZCa5jzaRz/zoNG4G0+piQEfDPQfoEF
	SEPE+HB+cJveDHGgCuoVkq6l3q1zS95/mn6y+WLgPi/2ND0ckyt7wKJqNJ69nehs/jsLmm9GjGE
	g7LSDTsDzGrwkgR8N0wpazyWIQ13aeJuSjEWazoLsrrytc2IEW0PuOYWNQCe3jOiDOlCN
X-Gm-Gg: Acq92OFHdNJuvCVmkI6T2JmIWeKcCBXghfXcjsS+j3D9RuX+Kx3Qxdm2BUzrz/PuzVZ
	ku1rqCjEyKbxor69My0AZHvJPvTqhoQM+vi5K2k8NzSSipfQRD4QZdil4faT9fYQXqHyJbU/FTp
	ChFPs+aCygrkjv7SGYroDXRFSoArVBu3HlQUNTUYdsDxVovTefk3TTzGeHlmVbau/a5z2gOMi6O
	T9GpQLgY06eh58pqA6vWdHFGN4H9NuaG9uiudlgklQvQFmZgDmpUmXF1yZyegfi812pHnmJJ9Oe
	h1sB1jNkZixHY4/XtCRIjzKaQCETFV91r4agXlxLfhgQqKhih3kHNrNA7ORiNaYhf/j+ObbC7Io
	fRKzaGhYc/qQ8AiZK/JCnvnPvmxZCpWgLEbdHZM8CnxnOxrAdj3d9AsdrEBTlAKY7edrHMpdCUo
	kmpb0=
X-Received: by 2002:a05:620a:1997:b0:8d7:ed38:8189 with SMTP id af79cd13be357-911cb003cd7mr2291567485a.0.1779270286758;
        Wed, 20 May 2026 02:44:46 -0700 (PDT)
X-Received: by 2002:a05:620a:1997:b0:8d7:ed38:8189 with SMTP id af79cd13be357-911cb003cd7mr2291564885a.0.1779270286221;
        Wed, 20 May 2026 02:44:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c31404sm838279966b.25.2026.05.20.02.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 02:44:45 -0700 (PDT)
Message-ID: <253db4e4-7b69-466f-b4b6-59a77609b9fe@oss.qualcomm.com>
Date: Wed, 20 May 2026 11:44:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 qcom,pm4125-vbus-reg
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
 <20260520-add_pm4125-vbus-reg-v1-1-f6d15d7dbbe8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-add_pm4125-vbus-reg-v1-1-f6d15d7dbbe8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MyBTYWx0ZWRfX21Tzo9SoUVLx
 YWUwYC2W7Lc/soQJR1TkgcisRm+VGKpXXAANcQWT6Ql4MYok6LzKnjsTogrksvhoxxk3PApoU+N
 qs9SP4x2deiZAxWiyVIUibmAUPVojhCt5dNVkwB/p5sJbhXa+UaSmLNczIkrVV6bbK2uKO9g0LS
 2nD8CPooWxAAQUqfFkBD+TotydF/Ch7APef5Aq4e0xi7cHik9LS1g5K8Euz7fvmuiJpWstj0w+0
 wf5pbo2ZGQGQBblc1KWvWjmo+9pcL3WNmR0KCqR4+B44kFqma4VOT6K6uaiFU08I+0cX/UFPMmw
 y0fqURAgtfgDIeO3ED25EAd+6qV0tFcyeY9axEjzCkaHuCuhYOiS5oqZk04Bd0Rg48Q2yrVQAVo
 lp5f0oMbbAOWl7NA4+63BdpfSs7iAF75uJ+wY29x1mECyZBJJZTW9hie0QVW0lpmzhaK8wZ4TfV
 LiyyYwpxM5mQ/9mRivw==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0d828f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oHsx0W_1LivJTKj_SDAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: VB1vSzhZje9X7FK2bDWwnCWRAtFfLE03
X-Proofpoint-ORIG-GUID: VB1vSzhZje9X7FK2bDWwnCWRAtFfLE03
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108664-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.19.136:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: E209B58B293
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 11:07 AM, Rakesh Kota wrote:
> The pm4125 PMIC uses a different USB VBUS register layout than pm8150b.
> It uses a 2-bit VBOOST voltage selector supporting output voltages of
> 4.25 V, 4.5 V, 4.75 V and 5.0 V, instead of a current-limit selector.
> 
> Move qcom,pm4125-vbus-reg from the pm8150b fallback items list into the
> standalone enum since the driver handles it with its own match-data and
> register layout.
> 
> Make regulator-min/max-microamp conditional so they are only required
> for current-limit variants (pm8150b, pm6150, pm7250b, pmi632). Add an
> if/then condition for qcom,pm4125-vbus-reg requiring regulator-min/
> max-microvolt instead, and update the pm4125 example accordingly.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  .../regulator/qcom,usb-vbus-regulator.yaml         | 50 +++++++++++++++++++---
>  1 file changed, 45 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> index fcefc722ee2a495837fedba026669de97350c566..7c74573848bcdafbf6260f69cfcd7a9b58bc9f2d 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> @@ -14,17 +14,21 @@ description: |
>    regulator will be enabled in situations where the device is required to
>    provide power to the connected peripheral.
>  
> -allOf:
> -  - $ref: regulator.yaml#
> +  The pm8150b variant uses an OTG current-limit selector, supporting limits
> +  of 500 mA, 1000 mA, 1500 mA, 2000 mA, 2500 mA and 3000 mA.
> +
> +  The pm4125 variant uses a different register layout with a 2-bit VBOOST
> +  voltage selector supporting output voltages of 4.25 V, 4.5 V, 4.75 V
> +  and 5.0 V.
>  
>  properties:
>    compatible:
>      oneOf:
>        - enum:
>            - qcom,pm8150b-vbus-reg
> +          - qcom,pm4125-vbus-reg
>        - items:
>            - enum:
> -              - qcom,pm4125-vbus-reg
>                - qcom,pm6150-vbus-reg
>                - qcom,pm7250b-vbus-reg
>                - qcom,pmi632-vbus-reg

This change needs to be paired with an update to the existing DTS users,
or validation will fail

[...]

> +     pmic {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        usb-vbus-regulator@5000 {
> +            compatible = "qcom,pm4125-vbus-reg";
> +            reg = <0x1100>;

This should fail make dt_binding_check, as the reg value doesn't match the
unit address (after the @ sign)

Konrad

