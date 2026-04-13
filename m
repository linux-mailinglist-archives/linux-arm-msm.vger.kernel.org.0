Return-Path: <linux-arm-msm+bounces-102901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPf3Adut3GnfVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:48:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB263E9511
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC4713008223
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB8A3AC0DC;
	Mon, 13 Apr 2026 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDYb/7nG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YpWY+IBx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3DD37E302
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069871; cv=none; b=TwyxJHGJdfVIO8ryPn+M0MzS/TZc9j2EHSP1DjoVmow/FafiJhXHZBFWQM7PUmADmeDA+wEvYtOY6jSc+PGsutgSEzbVr4/EhLo8PLAERbawYKVPsqbugtnS8EnDJPRrrwNy3E8TUfS6fp3x58dLhiw+7pyJvz9JcT6KAFv7dk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069871; c=relaxed/simple;
	bh=Xa47Ih2+joKTi5xGwY6jRk1mo9tGejqiWWwq5tw16dU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vj94+qY6HcF/X7iyf2jovr9DpHzJC929AaPvapB2Kop5/jJyHWMxw4W7Bj5193qRvk7vphP7RtL9DceqPlb7yqWAJyKlfuqgoKTeT5G8xmYQUhEzLcKD5GQgW5E/f1fpEZU3twCJ/aWBiZQ7A+tGntLJo+mfCMfnMKyeIrjdwug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDYb/7nG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YpWY+IBx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D80x90142037
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9g1zvMDpW/df9uLnMfu0SsgzTiV62o1JoKxyAAnaSc=; b=eDYb/7nGaXRcjPjn
	vJduO4FuN6FOax3jScBJ7kTg4zCG5I2gtq2fPYZO4C1EYGPh7zkcqGuxhPDnzTy7
	jOLhLyJxcBMyPs6XxiM6knGFvrbctt0YFO9QN3qQV18zWNsfM1jCatH/i/eoaNT4
	gEsrm2NEpBVk9UmQO3bgc0N/zt8AZmj+hGctIIDADaX5YBZ05WfKVm8xdMZoGphF
	d5XDjH4LCyaz/EsRtJlazRFQuYGmZsHdOXok4REpr6rQKz9OLjsbcunSxlRFhgTt
	njSj8bFiphOvEAbKJoymM/Mp2xOE2Zv1oT6J5jEqcJy91FrF4IjekfdKk5Bsekq0
	CBPmKg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkvhqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:44:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a5bf7ee420so13753676d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776069868; x=1776674668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9g1zvMDpW/df9uLnMfu0SsgzTiV62o1JoKxyAAnaSc=;
        b=YpWY+IBxNzllVfxskhFXB1tZFEJykJz5rEcHmrQOeh7cJlSe/lGpijg++NOR4FfdHv
         1jd0qQi+Mjn567ryU5mhDaKZ3gvGDEMVGW7h3yCXXXHWW+bS/mHxyJODh5LS1pYq/atH
         sznUChK8E/jWz0UFuyigCgVmbXlx9jTLphlidGhhgvFPa2kIi03XhjXhBzUSLgBs77HU
         LJOaHZW/EKRmopkoaFs9sifTSMhps9VOSqiAjdt6U8Xw49RcYHSmeyHWKsrCXMrlqXpw
         bVBzZpODrNojbp+DbB9MLyDbSgACgbYkCX6Nvs+aZ5uP+cF85NCEJiLXa+ZVt1dWgWZa
         LmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069868; x=1776674668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9g1zvMDpW/df9uLnMfu0SsgzTiV62o1JoKxyAAnaSc=;
        b=XFKiDMmehv89JF7mm2+orh4LMkcwpPfSumhhhgQPpgjuFsRxTEtcwaLC51zeLcwj5D
         0X3PJerubt4qOR5ffuIyj+2pABBF/3U99FiXHLpHADV0ItUKzggP+g7MGhAN4tGxsVhY
         cwVQzk/GMQCxfnoh8Gtl2RiBa6D/Bco9V6ogxTAfwPypmA0H0qNShpEroJJFKonnXmFq
         WEUpMVlqBGUzjUKHq8+7M+dNpNOJ87ELBp/2dk/SLgnRqhbjnzehVOSqg1DILLO1VJqg
         FjN2hdU1R7VZxk9iObMQvfBkht+2A7FZB0uEtOuWLwKw/YlcwLk8nrZr0c2Arqg1DikF
         VNew==
X-Gm-Message-State: AOJu0YzuttuxvQjpSFF5FvS9GMEPtEW94WvmOSRUkAXIPqUI47ttWTJR
	UkU7Yihspta8u6FuOe60BRyHWLQb3P1LGYA8ohYpbWFZBhLAv9fKYACvsq1VndPJNjl31bhSaq+
	dR857Emr3AFcioXNx9++UKl4FRLcgNCjQaiv4JhjjnCiMtnYXWns/cm0066g5SaKn5iNi
X-Gm-Gg: AeBDiesCrcXulzoMoVIJ1sG+ROoCTkdUj7NZp/ri347c0dH/ViV2KM9uuiqJOGOf4Cx
	1pnP0hPZxW+MJtoQAleyxGKLcN0TWPAXn39VnYAF2k1qTZ4dCZEC050CCgaVws3rW71n98a7JD6
	nY3Ycod4J4BpL2hhv5M4GWVy6eBY8I4PCYWLzMmP0SLy11qZ+ZT0yH43sKcXuz7L4e3HlAODKJE
	nyN/CCxhYG1mj9ZrE/h9spmo+4FBSVr1nAz/JbwDBPPOo56S9dw6QZcnvl4qg3yEPsHS4aXHj0M
	OFvpEz9mkwJIqEij3dryFt6P4tfSFxYTURsTCac+cLuj74FvKEN1aVyBaEs2xcLpXrK2GwLoBEY
	3KwpCMqHE1Es3KcKAxHnFYvQ9ZjF+NSwfjv6tzKkcLjdBR1HAIfgvgnUjCnaXU2LC3A5EwF2/xL
	ZYMM0=
X-Received: by 2002:a05:6214:2424:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-8ac8627aaacmr145221526d6.7.1776069868621;
        Mon, 13 Apr 2026 01:44:28 -0700 (PDT)
X-Received: by 2002:a05:6214:2424:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-8ac8627aaacmr145221356d6.7.1776069868194;
        Mon, 13 Apr 2026 01:44:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a13sm290371966b.53.2026.04.13.01.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:44:27 -0700 (PDT)
Message-ID: <579913ed-4fc9-4eee-9093-13b1f701e018@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:44:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: lemans: Enable DISPLAY-PORT
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260413043713.1659-1-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413043713.1659-1-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dcaced cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=C7MUFykBl6qcWS5LoXUA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4NCBTYWx0ZWRfX9QI9NCYcmNJr
 Hf1f3cqSRRUjCVLwdo20fDns0i5vUb65uIOUIfNSsO8XYw21+m0yCpKrt0R4z7ApH2E3PBfFNMM
 3dupFKj8jmOiXX0xtAEQO0JugUEUcI5tfVKce8Raj957l8qXtrXCs660dpPT/L1K5eVjNHOEvQq
 RKR1RKiZc8hTxWNWMluB1elgxRLv7ivgyMJ6p0iRPg7sIT2VQ4VPVG1eaoj0pEzRd4QiM0rqube
 rZ0s92SaIXXb6NHzaLiLaAbSQxedog6pIoQ6/qNtjjQGMtobeBYokOIHJn5l1NTTMHqtZY85pN3
 Yqb5wZn+g65WwFwJF0X3xF3zA7hCs1T7L0hWBt7VFLtM/0ZhY95G/LW4dYdwimVUEm2Jh2xPDJr
 +3iVLLJzWEyPF6iKg3WjchTzQPOQr8wbWvyZclDPKvlEpfL/jAPlwqkFGgDrYvwZxR1OhGUWMZi
 8qORjcptgp7c2Fanf8w==
X-Proofpoint-ORIG-GUID: OFoSnfXqlB52GfElz5b17_i_8Z85n7YZ
X-Proofpoint-GUID: OFoSnfXqlB52GfElz5b17_i_8Z85n7YZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102901-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5CB263E9511
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 6:37 AM, Kumar Anurag wrote:
> Add dailinks for DISPLAY-PORT to enable audio functionality
> on edp0.

"DisplayPort"

The commit title is misleading.

[...]

> +		dp0-dai-link {
> +			link-name = "DisplayPort0 Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&mdss0_dp0>;
> +			};

'co'dec < 'cp'u, please re-sort

Konrad

