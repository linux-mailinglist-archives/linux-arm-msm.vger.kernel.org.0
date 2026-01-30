Return-Path: <linux-arm-msm+bounces-91261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBt3EyCAfGlVNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:55:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F2CB918F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 117C93010DAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 09:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D779354ADA;
	Fri, 30 Jan 2026 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ma51icA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ICVKmIl/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262D34E75D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769766933; cv=none; b=XOMPX7ko1mEmvGVHjh8O8e403AmL+LZhWXTELIrRAKcBGpY1r22tiH/b42EaYseLDtyalxDq/bl0qVXvD/5CSqyJayeHVNvnsVsGOu6CcS3Gy9GvtrTg8r/hYpQZ83nH1DKEfKfpjpYPj9bSY2jtkEojDpz597qqeTSvffk/v+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769766933; c=relaxed/simple;
	bh=LCiS/f2tpueWranb2vZDsO7aMcHwlPN3ZBP0H7aGbyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bgagx+sHOS4r/CaQ95CDwGpurkHlVSdgB8mDRy18w49oxKLaWj4dsa8vgfYq032guljbK8D4bSAS10iEooOa1CjJluEnmQ0zd68DVOpDyXeMhHDYXXQfNH4mNQsNtU9ZqpUiiNuBFVNJcOevJNsaocvRjGqDQMjnTE0s9Pkhsfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ma51icA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ICVKmIl/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3VZ3X1022132
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	citeBoKTPpnUKJdt7uEyLg/IUCEGXd/i5qHN3Lwq5no=; b=ma51icA+jsduw5Ur
	N6yIoFMjb361n6ckJK3YOl12X+YA6L/dBAazyD/O/lPF9FqwRdkvjqRuNt7GOC0t
	NN/NMsnElgMl4C+zQjuVrHClRchriaMrjENFLN/GglLkubVpoB7j7RaOG98nWASS
	FKt+9z5Dmh/bwHdZLRnne7COwyjgMsDEiK/Fq0q168Kjy3DaeHF2rlOlvxfKl7sX
	NW9PY6CRP9C/IbmgFgSb9Kq8N/OPjBy6o/uhOOcReKIzIcWAyPN+s7Ik/iMrA+KV
	m7sC6/+iiZXrLyUp3cliThSfNNi0WAGf9ww70ANcKFYv+0U6+YhmdpJFirlD6yfH
	m4PhFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0e3ka43t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:55:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52de12a65so39297185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 01:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769766929; x=1770371729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=citeBoKTPpnUKJdt7uEyLg/IUCEGXd/i5qHN3Lwq5no=;
        b=ICVKmIl/mKLKc3PCkhTOX5HtK549Ta86VZa/QCVB7kGgbaYJ4tonI6k1QcQRMOfWpz
         z6IREWvaE3DuuV1Ieok9knqvGcLe1qv/Ce08/hPvRBJtfmclwa5PB2Iyffc+0yNQzWcS
         FVWU0p5+ko7wFNkhUJ/Y7HNuxBlo+w+s8fGlWVxQib5PdlqTXHUt+fHrFDrJioXQJu+V
         ImCwpgsdoSB7cRRnJlvDSlxv12/4Cz+KMd6BVfpAz8b5AtlPJmU/R2j42yUfEZ6+Dbfd
         zdSi5fQf6zXdhIWPMyA6R0Yb+H+mx/wVWezNBtsit19Z9c13LzlpXQHJmzRIRbvRGIzm
         JhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769766929; x=1770371729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=citeBoKTPpnUKJdt7uEyLg/IUCEGXd/i5qHN3Lwq5no=;
        b=kJNaDS0xPKjqo/vBN1mgJKpNCBxkFIBQzkSjpaqSj0FM2n3j124xkirhq4s9qGvxzM
         cKnApVX38bymqZubhhytnpl+cr5Zhs3jJTDww2TSapBNVJqkV4cKvm6HjhesVo+OxZAZ
         pY8y6gPLxTalkj1BrPRbYqffNNOl9Yjl7sTPzAA+KLv1e8mbvEGW/guRnmibtkgdghy9
         z+PSVKUj8C8Ow5fDhtwitQIBRJX0kJEo07lYyFaLf72oQrdZIzIKJrmWX+NwAVh/XpJO
         MqLTlqmemGVh47qxOf3db5fabSRa6608WhvKFK2y+DafYZPfBLoKTtHkmZShn6U8CRsU
         7XsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCww1Nh8MrWCKP+VVNruH7ycRKQURqF0fTXKzoPbtXMNRyiuPWydZqDsHowmpq/3zPZNpDp+Kgq3IuOae5@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQcl6GzkborFndBBKy+jVIPk5DUxrx50ZY7CnXHw9Qex3A8yV
	op7kRIa7Qp3lrxufkAPFNOtkaQ86mT+2sU/Z/25sVRvT57ZHW3e3LEoo8S7JpXVu8uoAsaTcKes
	FwWt0FTQC2V70427UxUQwz5syyn3NPG9m2WoHga96XoxynfWWHyOLbD5GHJB8We+qUIxI
X-Gm-Gg: AZuq6aK2vpFjjiJaL+Z+izribW4WtWoq9N/Xq+nphyK49080GPCOc5ssKHzfrVj7Wy0
	BHVhrjGM/YJo1ETwdPJc7UWO4bomIV21D67Xi/mKlx3apsOECtdq1iNjAPtJhgPrRrEKEMZJoPb
	lazPXVykzOFmwElNh9jHVLWuTz+O3cZn6BoccdKQ+70qDrFStLiERkXN2E8gsIv6i2v3fs+r6Yy
	tuyGTZRItYcaqLkBGTtKdZ0P1AaVFPdmvBt24+sJX4eo6yCTa3tdlvow6cnqgURknUdS5hkTHG2
	z91jE915P5+HVECeVc7CPjFZnnzyMu+HmVojxJ1jkELkLQa1SBHM5rQF5aFNhpFrtPsir89M3to
	9LoH0jC/avgfhh42DgmZUVzKgFyPe6xbJPs4KKMx7CrMiyKxQTyeplvrOJyCE21UL63Q=
X-Received: by 2002:a05:620a:1a8d:b0:8c6:2539:dcda with SMTP id af79cd13be357-8c9eb229dd1mr253237385a.2.1769766929359;
        Fri, 30 Jan 2026 01:55:29 -0800 (PST)
X-Received: by 2002:a05:620a:1a8d:b0:8c6:2539:dcda with SMTP id af79cd13be357-8c9eb229dd1mr253234685a.2.1769766928922;
        Fri, 30 Jan 2026 01:55:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ed6f8sm393035566b.65.2026.01.30.01.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 01:55:27 -0800 (PST)
Message-ID: <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 10:55:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VI3QXtPX c=1 sm=1 tr=0 ts=697c8012 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EIOd5lv5QegryJ6n6bMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 6CuR6idhpAxREMjzKOib28sG9FoECdrS
X-Proofpoint-ORIG-GUID: 6CuR6idhpAxREMjzKOib28sG9FoECdrS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA3NiBTYWx0ZWRfXxM9SWuO4L8tF
 NyvksQB74CF7E/riO2kQ0uy5ev8kNzQlyqzguG7IBwIgJiS+FsnCVp5192/lcvWioJapQBv1u2s
 Ix9gYa+ChRT815nVzK9yTMjZg2o4YXXtCfLZ+tZVTewncqkT69AgCaMR5lQHQUk023nd8BFGgwL
 Rvt+bLR6V0AYV7L2AIrpAzP5pOGTNkMqYIvpGWrZAR03b2tSDoQ/n6Z3q+YY6M9WmBUKIaivM5x
 xcDxVG7wzoq4cKY1QINC8u0fg7Ev0MgPuaO9JusVGWT7D6jg1lKWKmYaXhQoozAm/5PSNVjG5iX
 lxEeszDrR6YZW8tJndF6RJEwHCJpqRCmHC2uae8rgA+pNPUDCm54VhlreSxutu1JHtorSHAYvRb
 cDHRzGn9PNx/4mKGZjPgBMCFtYrGLjxJ4VUPfoZN5MkU/qOODiryddx3AhjX0XirEd6bbM9VeSc
 anh33EVugJQ/RhRKoBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91261-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E0F2CB918F
X-Rspamd-Action: no action

On 1/29/26 1:13 AM, Sibi Sankar wrote:
> Enable ADSP and CDSP on Glymur CRD board.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 0899214465ac..0eed4faa8b07 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -487,6 +487,20 @@ &pon_resin {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	firmware-name = "qcom/glymur/adsp.mbn",
> +			"qcom/glymur/adsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/glymur/cdsp.mbn",
> +			"qcom/glymur/cdsp_dtb.mbn";
> +
> +	status = "okay";
> +};

Please make sure it gets to L-F (only Kaanapali is there right now)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


