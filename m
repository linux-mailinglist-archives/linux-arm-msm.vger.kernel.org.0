Return-Path: <linux-arm-msm+bounces-92661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFAlAwymjWlh5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:06:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C0F12C3B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 90A32300E4AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFAB32D47F1;
	Thu, 12 Feb 2026 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUAl9blk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tk6HeeFS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C470A770FE
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890600; cv=none; b=h+KyrPfRrIl5fUfG48qcIPGCaLyWrfJ38zRuSi/T5wAMI2H11gP3y2lC5yo+MXMrV9tpS5U/VxKa8JLkyhkuGyaZ5D05CTYyNFQuyrp0Uh+9F+ghNs9VPZjo+SKX2lWUdIE8u9ZqfRU4WXlfFs44h8WCdwrSpt/NwqJuO+9kGcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890600; c=relaxed/simple;
	bh=X56/u8WeM/Y71e5qKoFPTOygw3DtBsvJhqfolLf20hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xdync3fx3dz1Kgnbnt1t7Zh3tZwiw5pePiI7s4yVGJX0rxbJTO8DXqrw3h9XZ3TRAyQ+kHnoFgEP6axPOCM7gysWPQuA78jPm2u6h9HCApqLm4z1mZteAhOJ5Qi21anOCUuxg/lhw+443NuZ/s5GqpJcmy1ZVAaq1EHxIPJ6Df0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUAl9blk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tk6HeeFS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3Ru7p3615999
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+p1cN7aSBgnW4IUjK+ldKoLS/3oTMQXiZNUPzdstFZM=; b=CUAl9blkb6Y0W/37
	TFsPFM74ZiIoMmULLdirHaBpz3DTAOlzcGx4tPWszeI13e7d80pZiEQBJX0NfUul
	98iR4x6Bo1iTJbiutZtEU2UQ8c1a5Ti2lIG1MGOYwYze57A0TlC7CFmwq2G6FVwO
	PiIfQ5c0jNqryZA4dPZmXPbxwmfPnqvgdxkZ0FOR4AK7HRJRdevKWL4H+N+Ztjm1
	N2Uv0QZS6+DZf9Lw4lCNAkMEOladjPuKspmGUFeSXXdSz+azrtLUkL4BodR9Ihve
	kbTzrx0ex1wvbiq2I5UJfZeAJGms3MJhSCauqV+yzmkTfiH6IjjOd9hC9Mmr79eh
	Tl12LA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8ydn2e5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:03:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c709a3a56dso397754885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 02:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770890598; x=1771495398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+p1cN7aSBgnW4IUjK+ldKoLS/3oTMQXiZNUPzdstFZM=;
        b=Tk6HeeFSsypulajC7V6v7vaU/Gnd5mk0GKYZHMfdfra3II+ylwiy+CcvL0i+WoWwII
         CiwtJSgXYdrIxutcgNw6hUL+BuoMOtYZrLe8rS+81P4sqQFqVCIR5tH9U72DJ9ICn8SR
         KQ9rTjoW0vMoZ5reu5ZSWgXr8oqUEa+CNZFRYs0LiM1oMyf02JlLyaKsdrt9U9LcFrIk
         kYKmpQV+NgT909YHOmB3X0M2usG3O2at1EA4E4onFxLDxzm9+IK8oIg5CewBXJ2Lg0Im
         CrOaM+pU6Zbu9vYqgQKmaHVab62mA6vwuI4nmJP5/jibR7tsyYOmQXo36HlrOYuqJw+o
         cNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770890598; x=1771495398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+p1cN7aSBgnW4IUjK+ldKoLS/3oTMQXiZNUPzdstFZM=;
        b=t1zYoNeLPt8lT/nMRu+SP/8HkneuAj5J9RsQJUSNYBDdM8wgiuodgh/cePmD8qUZfs
         XA/4x9U4OS4ZaVWF25fvCGwJqEFPsRCIXyLIke9RNAvV0KIWc6HB6y6Q+nSJI3rYms5Z
         Js/KMlbjE+/OIVxQlNhPv6vCIqgr2HtRfmjHbjkc6FRp6nJRhZIYYq40MgRLm3lZsh/j
         75HYWl5EW9QYh6nbJQfC1FMY0QAltJ4W8+mxEDAVrUQqAM+6nEk0AqLNqq33GMZ4sd6K
         m+puqTkFUHJGC2rXLV2VVkTd0HCawTRUg2W7IB3AP1evavBsDipFz587VsVXhpgvwcFl
         TTYA==
X-Gm-Message-State: AOJu0Yw+KUBj/tqLx/2BLSFuMkKADQd+HX+3VbdFaYn7mV/yqu0yIPFb
	hQGI2GtF7C0vMzoWCRaL1Ef+o6B2xzTmM0jbufOvPekGdY9oLWQTDKBvzyR5DWUno5vSNFJjf90
	zc3asFk3+V33SIdcgKnojoosxhMgh8VUkJVaMqia/NeuVQkbVF8dRkme2g7CNdNLUi+yX
X-Gm-Gg: AZuq6aKuy9a7jcpLmxPMZU6pnNInFbW5YtTm4me6xRjqfgGSlSKGuypzsFHRYLcrN0o
	hzEwmhOrRkosr8vGgtR3WktkLpwpQPYys1t0W3rU/rsUG0GG5UJNOdk39gnVN+XqfnWNuC6EOcB
	lbggupy9EWg7RTFPyn177nMlmeohyXojb7ckUR45WR0Qdffk/WX9g+UgfEfFUppWOslicSIs32C
	HG25ZSapfvjayjv1rTPjECd7a38ikSR/Dnkt3cHWghaS05dByvai1HfG9j79N62rYoDNWTxKSRP
	PXlEG3wb24kLDo7MGVU7xWzgRg/f1Pfyv12VZ7VQoQBT9Psk9niO0x8pu+zQwDQjJlGOKC3aU0y
	e8Issx3iSF7rMzceMCnhC7WpLQwYS0kE7+FQ/8KU7BJpEXNz8R3yargyB0r8BfSBEjCmk+Y0W6t
	+2u9s=
X-Received: by 2002:a05:620a:2545:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cb33166e10mr206668285a.8.1770890597810;
        Thu, 12 Feb 2026 02:03:17 -0800 (PST)
X-Received: by 2002:a05:620a:2545:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cb33166e10mr206665085a.8.1770890597345;
        Thu, 12 Feb 2026 02:03:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f82e70799sm103896466b.8.2026.02.12.02.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 02:03:16 -0800 (PST)
Message-ID: <478f9622-55e4-40b8-b48c-f5589fa015ca@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:03:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1-vivobook-s15: add
 Purwa-compatible device tree
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maud Spierings <maud_spierings@hotmail.com>,
        "Colin K. Williams" <colin@li-nk.org>
References: <20260211-b4-vivobook-v2-0-9f500415d2ed@oldschoolsolutions.biz>
 <20260211-b4-vivobook-v2-4-9f500415d2ed@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211-b4-vivobook-v2-4-9f500415d2ed@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NLHYOk6g c=1 sm=1 tr=0 ts=698da566 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=-Yt9tNsTAAAA:8 a=gxl3bz0cAAAA:8 a=MmgdznzwAAAA:8 a=EUspDBNiAAAA:8
 a=T_4u0W65Cwe58pMtjlMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=kiRiLd-pWN9FGgpmzFdl:22 a=bHFXaHSPdiGCh6GRCv3g:22
X-Proofpoint-GUID: P0K-ZH0m1qpDSjTXHiUu-Eq6d-Mi2GBA
X-Proofpoint-ORIG-GUID: P0K-ZH0m1qpDSjTXHiUu-Eq6d-Mi2GBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3MyBTYWx0ZWRfX9LFsZJ0XlVZ/
 Lg41gMVMlAQrt6SRHTuQ6P3JYJ4o/mQa+dEA/ZNR0huDvzp/PrYnFxFVi5JFxWiZTPr/gN4W1jC
 SaRUZOMWQANNeImzapPkizTNmUcO6fsujbg7IDEAg5OJvxueiEoG/VjEiE+fdfu8Vs857XEV66P
 ayNNDWrC/iHALveu98Ly9Osp5tx/z8i5gVFUzGUjM9zkEPUP0ejlc+GhnUmg/nLkIxoXL1Xm6cr
 JEWEJDojcIKplHIMLcFtMj3O0WRjMj0zdowxUVlrdiN8Skax7xzcopkalWT4p8TOsYFpOqENHpG
 m+3ShZ1Zpyov0qqnPpNX5hgoHlYiWnLPFAJtLqFecMWCkK/4EgOVJOfetb6eMJfvP4VM2upVXSi
 oC31R+dQqr3OeidBQU/aGNX+bBK0EOk5TyeJyyLfS3BID1QIjf5U9KntQl+ODrUn5XZLIXXdbCx
 AzzR06pOaHydvUYl3Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[oldschoolsolutions.biz:server fail,oss.qualcomm.com:server fail,li-nk.org:server fail,asus.com:server fail,qualcomm.com:server fail,sin.lore.kernel.org:server fail];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:query timed out];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92661-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com,li-nk.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70C0F12C3B3
X-Rspamd-Action: no action

On 2/11/26 9:37 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The ASUS Vivobook S15 (S5507) [1] is available with Hamoa and Purwa SoC.
> 
> Add the Purwa-based device tree.
> 
> [1]: https://www.asus.com/de/laptops/for-home/vivobook/asus-vivobook-s-15-s5507/techspec/
> 
> Tested-by: Colin K. Williams <colin@li-nk.org>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

[...]

> +/delete-node/ &pmc8380_6;
> +/delete-node/ &pmc8380_6_thermal;
> +
> +/ {
> +	model = "ASUS Vivobook S 15 X1P-42-100";
> +	compatible = "asus,vivobook-s15-x1p4", "qcom,x1p42100";
> +	chassis-type = "laptop";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qcdxkmsucpurwa.mbn";
> +};
> +
> +&iris {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qcvss8380.mbn";
> +	status = "okay";

nit: Ideally there would be a consistent \n before this status, like near
the ones below

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qcadsp8380.mbn",
> +			"qcom/x1p42100/ASUSTeK/vivobook-s15/adsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qccdsp8380.mbn",
> +			"qcom/x1p42100/ASUSTeK/vivobook-s15/cdsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> 

