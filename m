Return-Path: <linux-arm-msm+bounces-92465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD3KLqkBi2npPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:00:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2341194B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70F58305BBE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD66A34253B;
	Tue, 10 Feb 2026 09:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqPulL6t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STGqbZbI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B4B341AC5
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717352; cv=none; b=hrLS5bE+DnjVxa3MRNuNlbIia1e1yaTg2ozndC41sEiWaI3JhwQzGT61/pIXgaQ0W7nWC9CIJlTuOePomzjSQuYcR43+qSe/VLDYLB+dEEbjras/1+6A1iDllmy9X7EEhN5RhwFsF+pJVQVW+jHAEhScjUvVzAKuuuvZ23scOKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717352; c=relaxed/simple;
	bh=vDzLlOeCCHxI4iHnGqAV4YJU1/XH1hwY13MM1gj2Oak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbFOCmeDgObDx+dgDmNOOa6zwOBgoEfkJHGz0WeB+lByWy1BJlWXOnsOa7XPxSfNap3UZcX8A5SL09sR0Dr3XKChoHUnQEWWDSsMuQ2dcyUHlZrBHmrU9vulOeFVcHhLDD06lsSTSx9LeH0ILN25aRzQTrull+v4lGio/8lCylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqPulL6t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STGqbZbI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7eTCJ1421846
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33gRBKU0BmnrDYmMCny4DNczWXh1stbAnHES83h4vtM=; b=bqPulL6ta5xK1k+z
	JleBEx5CohRNACzE8mK2/ylIeONFCNX7NnNNydns4jmbwuERshJU0pIDhU8twQYJ
	7XLOiGBynDzVOvUBt4o+osulhBBQ57PM31IM50hQCbkPQkNw9lUJQrGhEwI85z0+
	CLUKJaYiEJ6np2yAcVYrYA5qBYFLM/hQLkWgxQhRpff+fcibQXKE4S7NewX9r44T
	3xhFJtfnzT8L23SUgs9hc4hLh7b4Pbc21qZk66YkeBH9/n+70yhW9b+/svq0OCf0
	FZ3g5ZTnzJlVTRdnuAW+ADaqviqYUL4W78BPtFavJnxqsQ44a8eLj1BvDAKaRXx4
	BtRf1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7rpvsyxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:55:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c533f07450so166565285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770717350; x=1771322150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=33gRBKU0BmnrDYmMCny4DNczWXh1stbAnHES83h4vtM=;
        b=STGqbZbIL1HXRZuNcb2HsNA4GlDRFkafgxNRCb+n2zIO3n9z1IVi9gOxDdewKfzYsg
         Ag7mYpZIFss2yVbhzH29c6OKHwm4IMcpgTx+0nV3KqE+INkf3aP5m/0ZOs8ovadfKfoG
         UK0tNIngLywF9CbkNtWlC7lvKa0R6J3Mz+XeBT5XnHXRzCUW6s4oFX+fF4dM/qzDnSZ/
         9g1DQ78R5CYblIH7rNPBw87GTsXHw8HLbQ9F2FXuj4uJ/3+4bOsCe+y2uhvWcOzyhCJs
         hnYj+ITEZ2vwVethP6pgkpMSA6DiBWJ53294QtepcFFRiVgb+mzZ4RIY1H/de7cO9Pbb
         DHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717350; x=1771322150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33gRBKU0BmnrDYmMCny4DNczWXh1stbAnHES83h4vtM=;
        b=XDY5RIxxhd0arMpq6uGApdziwA5te6I7oBJ6vRE0B2T5qIgskbn8UurSsF0rWs1mVz
         aAiUi+EqyyA8yg7v1v57jkhZ5YeNBargNs5fR4yC2idOWhT8KmrQg4jnjvTtvHhtLw45
         68xPbKulE1Pmq17bnYOTik0OboHts+sZkdGSgttkYfMjwonUEeekw4f2pBYjYyh2ULk5
         LBmNn4x/rJrlU6qpnmU0JXSMJr19RcZBClX4CgMac9QfhRvAFN41Ih3Rd5MZ3ki6EPJL
         xm0nO6fLNU3twSQQ1MNHfPdY+cnoVETwzMMuxGcv8j6wMGxAjdPPjGQAGCBmgVZCOwWL
         0CRg==
X-Gm-Message-State: AOJu0YzDpeN5HMng9S507FDOnuT2GKmJ3iv4msN0WM/3r8rycThnVbtG
	hoCBkubsFqZDWlLtq9a0kOHkijhCNpqU8Ci/AmN3XRjqG74hc0KKFyYKn0U/QsrcSs525sIL65a
	+LeChfcUemEXXqr00z28bfPO3h0bqVxIneZxioh+cOOIKweJhzsLmC3UCDGlWRSXFEinh
X-Gm-Gg: AZuq6aLcZBr857UbHG/Jku4MSK9EWCEPJzGJW8J1g1StqTaxSnSAm/j5DckwjV/R7gU
	DTc651ShGTRhaeCW7R05rfVg6hixbii8Jk3tnT76DkRqb1sM5SfMhV4+mmVkMFbnfMS/5k4qBkn
	WsocfWU8DpHqiyZuzGOX0cxqj47L6ftlk2dT6GGlaaJdvpQY7pnnur8s9WfXqceBPd7hm5ENfBg
	ewXaVmAtauZNTqLWNbLvajnLxYB3+JZVYaHpszKzUEXIKq8WPx0aONyK1gK57qRYMlZllj5sICk
	LJbeCytNO01HUa/4Od4iPTbSvK/6dN5yPfiMFsIuLSgzKqZNewIque0JjKOL/D8gsQihM20DbXk
	ENtBTM97kng5z5K9U50VvuuQ3x4Dld6wYJ9FZl4w8wHgu+8CC68QgOtGSbuRhoV/xflGjNxmYui
	QE1Qs=
X-Received: by 2002:a05:620a:45ac:b0:8c7:110c:762f with SMTP id af79cd13be357-8cb1fee2ebfmr110934885a.4.1770717349979;
        Tue, 10 Feb 2026 01:55:49 -0800 (PST)
X-Received: by 2002:a05:620a:45ac:b0:8c7:110c:762f with SMTP id af79cd13be357-8cb1fee2ebfmr110933885a.4.1770717349556;
        Tue, 10 Feb 2026 01:55:49 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacb3002sm499106766b.39.2026.02.10.01.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:55:48 -0800 (PST)
Message-ID: <d7a3becc-99f4-414c-969e-b703201f76fe@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:55:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-evk: Add DP0/DP1 audio
 playback support
To: Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260210024037.3719191-1-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210024037.3719191-1-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MyBTYWx0ZWRfX5cj7BGccAtK7
 EN4yCOopuhj+kQJglRRI/JHtuRmr4Y6ESIoIJvUQ0Ubp2Vooik3V+R0i+nAnSZapKnVDvM2/Ewc
 3AloqaD4orrFGR2DV28MBHG7a+kkUiRgGkxWi9A6bm0s12siTQOq2BLuBl5/0agJhfL83Vsxceo
 8GoOgePWNZ8Ms4+iHX7eJMbflJYYE//mAZ86D0hNXCA4MqiaojOFGVBLU0ST61Jy2ACYWr/3Qzx
 bN6IhYCB0qCxmz9NSQaf3vluJ5mIwQNbJTs157QRH19VS6f4teLRHsSh9php5M3BqtfK601/uRd
 XC/cGXK5nYVQFcBwEhYD0KrYOuEcMQAe9x8Zp5uVfCMPrNQ2GIy4fd+JnmtvAbl9supVqKKaBxH
 B7c2jDyKh9bJgYbR0Aoo1y5Xn789Zun8YQcwUcIzZPoEaEX5Bv9W+1918MaZNMDDcz0Wro1L8uC
 471qh7whkdyKnCwZwwA==
X-Authority-Analysis: v=2.4 cv=KKZXzVFo c=1 sm=1 tr=0 ts=698b00a6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=KF-y9ULfsUGcPjRbMZ0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: haK1RGxQqGCNESRVNH3RlDRg3EJa16_l
X-Proofpoint-GUID: haK1RGxQqGCNESRVNH3RlDRg3EJa16_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92465-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D2341194B9
X-Rspamd-Action: no action

On 2/10/26 3:40 AM, Le Qi wrote:
> The hamoa-evk DTS currently lacks DAI links for DP0 and DP1, preventing
> the sound card from exposing these playback paths. Add the missing links
> to enable audio output on both DP interfaces.
> 
> ---

No DP2?

[...]

> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -616,6 +616,38 @@ platform {
>  				sound-dai = <&q6apm>;
>  			};
>  		};
> +
> +		dp0-dai-link {

Ideally, these would be sorted alphabetically (so, above 'wcd-foo')

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

