Return-Path: <linux-arm-msm+bounces-90752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LN5KveoeGl9rwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:00:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4A593F44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17A673018750
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0C230BF6A;
	Tue, 27 Jan 2026 12:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxfuF+my";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dpk0u1hu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD958288C30
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515244; cv=none; b=VnLBsUp0QxRVIpU0jDXgWPGEa/xfKMSrJFwEZA3qS/Gc/Pf/RJccRbTlr0jPESH+DDjePYIsK2I3TYZmaESW/a+hpioV36OE/1x4qobE9LDz6lyk4o7mX1YtMqSjFNr2zrtnKD4Yv+BgyU2ODPVI2ljgaLk/4ph6sAP5/5AasG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515244; c=relaxed/simple;
	bh=COAX13BQ0BssH8UFRO5C0W52tZsy+r/D3rPcoFyQeMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3HoAGZShlQB95fYh6LBHXGeIhZR4Z9hyMd2b+2m7ye8UR+Bu/n9U1ayTMI7LD1UrTuC3Ny5+lIKTDkYsSbOsGLf2cQiuy1es3ZUlrT2dEmr8F6hJOvmWdGePPVE5OtzZGYn7SqXTq4wheiKZ5RIl3XgVMfYqvM/GqYE8a5VJ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxfuF+my; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dpk0u1hu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7Rso5112447
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LNiSDf13rGS8T/IjUUar/9UDiB5owxUtIf2BxjiRE0U=; b=QxfuF+my+edrfNpb
	sq1xzsZLX7XxcBzvRXewlP8ibCskN0RKM/wTpTlybZmXEzyPfzksBeh8OIHMJC0v
	iJROq1xR1ZERuCXLCkJVNsszLU6LlgnJ6VeVa6e9SO4Cyufo4weUopWf6DXKyqJM
	C6RwrqRBVCQPIAQ1UkE5xqhzj2rroIfsJyWoQ/chQ18soqYV/3QvpEBKPVIo+OYP
	gjkUrtRLOOWj2Q5RoCVsgrJOqLaS9lor9LhLYSOSL2a+0hrSEqq+TFw1J1ayf7/D
	pxuohKAulysscRoCIcK2j2saI1FOEjNzwem1vAcPdB7n3y2vaf0w938ojx7jZU1O
	IioApw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxs0e0yn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:00:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c709a3a56dso25072685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 04:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769515241; x=1770120041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LNiSDf13rGS8T/IjUUar/9UDiB5owxUtIf2BxjiRE0U=;
        b=Dpk0u1hu1k4ZNCbBNXr1PIY/hS4Zlves5Z1TnQRGBImpMWOh8kLm7UIzf0kQdXPxbM
         Lsp59518P7JjXyHQW1C0dViboh9irsj0FQZafoFwZqilaaddge2NI15sXeUoBpBx9QYw
         kXQLDuSlBRqrZbtKksBrtmEriHMzmfBS2bAkrcLzXpszbfivrC3L2drmAOIFETs2J6kJ
         6ZITSPeIDbHVKHQwHhuuFtsNd87K2UmAa7SHJ6KkFLRopFc/N7Hou7cqgSncBxvz6PaN
         PH0k4duF08sIpLyAMVLSrpK15ML953TAdOemNFG/4wIWz5ZBvcKHvNWYoOWtOE72/puC
         Yzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515241; x=1770120041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNiSDf13rGS8T/IjUUar/9UDiB5owxUtIf2BxjiRE0U=;
        b=utPRulZflRUUiMvzve+c+A94nUAmE+RmRDZf63PEdVgINg+nITf2ljTOPd0Q5UE+CZ
         r+JLKQr/OikQ3r4/m0oYTUrjmR96MG1chsj9mGD7yj6/JijdDHh7jiNzOEpkKITj0UqE
         jpswNMqb+nalMvI78Aw0y+nmYZnfDU7SMgtfHY4bSCyuxWrBbvB3pMUETXwz5N9PDIg4
         G2dWf1rx+b2c4inVKp7+BpCbNiMsW3SejxZ9dT84vr8XW7PGjOy4CIUMy5IAiSAJ5zkd
         9EjKHi8RVCCRE5Pr/uKl6vigc2L2e/hSx+IuEcYoU9ndlJVC5LKJbk9Qja/7dhT51tRw
         njVg==
X-Gm-Message-State: AOJu0Ywk8g0jad/PAbCaNOlLkgE1stxqZL54ePXkHUGBucZ+9zjso1AK
	bC4PGm6VPDyyMX/B3nwAyI3CFF3TE2ErExxChVstmAkRPH9DEyl+U3OLSQEvkBJt1ZU+EBuOd1J
	ZH8WG5DWLltRhllVY5ibzpKD16YSqCVz3eWd4/g93Kvxm5CINGrvQJcanrsLxS0H49gFXysu9G7
	R1
X-Gm-Gg: AZuq6aIZkxTqepY73fgqFIwC5G8f3LoCdWoRHc/UVNCN5hz9TvTjaR+yJCE54qQgFgg
	eI9P73rVbJAB4AZ8s4WfhBzYG2J1MIuv34NPP5q86Xlm0fdAwODqtpHCuvzkUEvmUbYqaAFD6Ur
	D1GDtXQfVZmdzLnd46VcatB1G0YKrJc3LsC9uSM6zUdT3hEhqau8TTkk1WOldRsnqgOxMkivqsM
	NHHuTjt6mtkV1zJEJ2W5DP6gt9+xcBD0ihh61stiUnnsSp/kCWjCeXTCqenfuUWxwp8KGmVxcDR
	hppQGwolPYzhrbSXjtPmaObG/E0NFFsoQFyMZcGM6Fqu6w+C8uv54GNsaYmkpS/I8jNisqMpACd
	J+sWHKElVOm6GR5nmRPwYA5b1QbOOyAp/H6Cufdfw77wk9eWH5L0L2LWmSMbx8STadOo=
X-Received: by 2002:a05:620a:1a9d:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c70b845972mr110123585a.2.1769515240755;
        Tue, 27 Jan 2026 04:00:40 -0800 (PST)
X-Received: by 2002:a05:620a:1a9d:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c70b845972mr110117585a.2.1769515240184;
        Tue, 27 Jan 2026 04:00:40 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658666bbcc2sm4496530a12.9.2026.01.27.04.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 04:00:39 -0800 (PST)
Message-ID: <0ca0920a-aebb-4072-a098-48c4c9938c26@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 13:00:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Enable SDHC1 for eMMC
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com
References: <20260116214354.256878-1-loic.poulain@oss.qualcomm.com>
 <20260116214354.256878-3-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116214354.256878-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5OCBTYWx0ZWRfXxcHc19+VX8tV
 msR5/FbwLXz5GdJB55aj/pClqnDOiHYOsn9LXcGt6B6PnXqxXU9BT94p01gLNrgGfkVfY/RXXeT
 BAgJ1PNiv2qQ/uOgf4S2XkUm/Zpq2rXZSj7z4U07HptSjmqBfGm/fFhmA1ROSNQ0Hd8uA63UPSR
 SlWT+kgrHTAAkKu7NlrT8OmRJj7eLGEbeOnT8G/0Ing865lbaNxVRnJgSC6l2xrTMIYsHQsl6uN
 Pmd40+LJhjBRH5oCiMiynD+AThWRxFOYxoyWVQrByxpHxRJnLqHcpe/VaaKKCbk8OTb8Fn0DQy+
 K/qNM5tKxJOroOaw2ErZ5gWZ7UXyQkiUyNMYv62v1d1Qpjb9RKKCAg1tghFEKEyL+PhgiYLw8zy
 NHZixXsR1Xzj18tKq0kewoKry0n6k6ieyR6uqt84uBk/+lsv4yFBUq125RmxAdiM3oQ+ablBLe0
 AkFbGIOUXyyq0K3hNVQ==
X-Proofpoint-ORIG-GUID: A3UQwJTx9YS6JqHvEb8Yx06tAk7DbZGV
X-Authority-Analysis: v=2.4 cv=Hvh72kTS c=1 sm=1 tr=0 ts=6978a8ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=F2uzNt_Jvis__oCUEkcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: A3UQwJTx9YS6JqHvEb8Yx06tAk7DbZGV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90752-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.c.6.3.0.1.0.0.e.4.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: CD4A593F44
X-Rspamd-Action: no action

On 1/16/26 10:43 PM, Loic Poulain wrote:
> Monaco EVK has onboard eMMC, that can be used either as primary
> boot storage or as secondary storage when booting from UFS.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> index bb35893da73d..c272d7db80e2 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -76,6 +76,15 @@ platform {
>  			};
>  		};
>  	};
> +
> +	/* This comes from a PMIC handled within the SAIL domain */
> +	vreg_s2s: vreg-s2s {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s2s";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;

Is that the case for both SAIL- and SAIL-free SKUs?

Konrad

