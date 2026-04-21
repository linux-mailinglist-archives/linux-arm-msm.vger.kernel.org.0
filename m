Return-Path: <linux-arm-msm+bounces-103878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPnsEQD75mlu2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 06:20:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C05436405
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 06:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 187FE300D46F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 04:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C5D258CE7;
	Tue, 21 Apr 2026 04:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgZadMAz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2tJz3q4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3462741B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776745187; cv=none; b=BbNVm/w7nd8gHnanrRs2FtMSe3M3+NAgc2J3dcufvctrUu7rfoo2l4MFhiEFUVIKo+XYwU0nnV+FZnOnxNQNKGSIhSAviALqHs6SC3uEf/PqcncOEcrdQHgT1m6AdQ/V2X4/FnFVq9Cic6CdclvNCiB3Hq5gNcWs5a9lu+xgVcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776745187; c=relaxed/simple;
	bh=S/MQjkfpEEHThR7cbA92TUnpI+4dDVvsU7zpT8ApvpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8HZb97DKbVCFdwb4LO8QdxPx56xWxNGdJ4dB3lBb0dKvGFuDOj0mt0Xb4KFiD+2NrkEclvTXABXqYrkDjkDRRZZ1v2DzD/5TbN7SSZUGbkSlSzCkrhhJeYbU8XjHryyDWD834azwg25No6rfhPZzPXokT6q+mV/xcZBqsQo8zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgZadMAz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2tJz3q4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L30awG046227
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgkZj8p14OFqDpl5D0zxpdlBxTPKkGk08zNkOauHOzk=; b=FgZadMAzhjyiufc6
	dl8NkEXflBUsTRrE3kJ7Py409CQzMzruHLKxtODgoRmmixr0n8RsPllROC9XbHo6
	tDq9ZAjglKG1crsrP8j5rsHpVJEOeTCZU3PU6uK8+CGpCXLnPZvO5bZpr1E5NMUp
	FXnHag1gsOL8WxNITjvz8/HX/iRO0vcIptd9tdAUN+LdV+KEAjaWtyvw0ReiCoJx
	eY0ALd+xIMOkITzjribbWyez+1uPd1zb+qx3Dv5Qwov5olDSQcsTzIQyTttKCFg+
	Dt025VWT8HU8E107nrtBUTWdTnDpJvCHppsrunFgOm9oJxzc03MtlOM+bzngOU7w
	rfHftw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp0y1r6q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:19:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b461b36990so38902775ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 21:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776745185; x=1777349985; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CgkZj8p14OFqDpl5D0zxpdlBxTPKkGk08zNkOauHOzk=;
        b=W2tJz3q4aaVpy6uSHr2zYy0bIiT5eRoOBT78EkK/8oTgFcRTq4OSsG21NA82tdJUC4
         ALRs2+MkyzbQ+Jd0KHMvp7Pzq9cSyrQfhXmWBCdJTkw1GILOTB6a5q7qm2unT3cPdBg5
         f3WEETk18NHRDWTXK1VlE7JxCn/np9GcEFLW6GnFam8jky425jxChbI63RFId/jOW7RO
         vTc2+NIICetw04lJ/k+D86fojpJwnX5sanycvIiZ67Bg9GwAEVeMjDEpkPg8SzBUxbpF
         cLEQR6QbEJY3F0Cyum2xyaVydNDpC+eh8TNMmbdXcPS1XYzFeuNGZfN7IBq13l+xqo47
         eJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776745185; x=1777349985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CgkZj8p14OFqDpl5D0zxpdlBxTPKkGk08zNkOauHOzk=;
        b=Ohnq8wQteUH88deYetjUqEQTrRn5tRPdbJgPjzHqZf/XWmCYUn1RQWwReQHXvaqxNy
         uo2EXZOgKUPyKzbaJGghGAfMEotQ7xwZxg2YuzgddKO1OSW9QaPYoWUSkDOwnTxWkCCZ
         zFS6BE/hZ12Lflk8Djk+puyqvZ92XV/OV51SEEQ8967/NFXOj8uau0IvU7MlpcG1vHVs
         wuIOygmCpGTgbLnKEIRfiuQDh2oMBOnfmCrfqxZ1douGR3V+kYTMvhbeaLEOf+uLT6Bz
         Uvnn/EavBwFmSU+DrEkZwEAufBAAeg+47apnnMhjBlkB9Cv1cnATt+O5wCXh+Tfg2+NY
         DEsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QZF20z5sruvkGj6OmVE2WdjJeWVaiqeo/i0jqIipW5E1UbkF5woXmBqcsmk7pUXQWovOdgqhnh5xnXFcG@vger.kernel.org
X-Gm-Message-State: AOJu0YyPIdLhW01s5f4nfjaSlpdxNCgidK0GyRyoZVHRaGuY3eqjn+fy
	pEaZt7yf/0Lw38b8VVw4FxCvuGohC3Oz2qnFWBDcDc9ZGnwvWw0GxCqLI1gRE8rG8Rc9B7JdFFL
	YK611ph7/5nCGGbb1kiIh206aq/ftxxXUJAX8lp6ttabmIU63uM00I2vG7YxaaBHd0BiK
X-Gm-Gg: AeBDietrF38eQ3GS+GGm+To5zb2NpRuisRy+KYT4vJytOXdMSdEb1mix7JHgHEEONk5
	SZVEyTZIHJ/6zDV5LtyFmu6Le9/fP46GAOB6sw36H+OymX70ziGFj4ONbL5VD/rnWjrG0X8V7el
	G7qUyGlWUiDWC1j6BNvsSrEANGEY0NeZrnAH6iKybYpADrFA4qRujhshlOVNQx9zVxJjJXb10Mn
	4eGpfbSInFgVt9dgrCpo7s8K6aY7wQUu7DyfBy68ybRCbe6OuBg0xwEMR4x5RmF3ILCeuivrT2B
	+n6lQyZbf2cGPfZ3jNfd/msxyf3aDdo5Q4NLU5ESCQ+IRdBQnLBkd5JkproitFk3fJGX1UhLAjb
	StNozL3Seixy9fZRiJIFsWlQ7nPlvcztG2xrvvbB0AzZ4+P+H0eki1CE6jKHBL3X/e/MWWQK1+x
	6Yd671Z3qz4ocMUmMyxHQ8pvaDEQI=
X-Received: by 2002:a17:902:e78f:b0:2b7:88d8:efee with SMTP id d9443c01a7336-2b788d8f3a9mr8305665ad.28.1776745184959;
        Mon, 20 Apr 2026 21:19:44 -0700 (PDT)
X-Received: by 2002:a17:902:e78f:b0:2b7:88d8:efee with SMTP id d9443c01a7336-2b788d8f3a9mr8305375ad.28.1776745184476;
        Mon, 20 Apr 2026 21:19:44 -0700 (PDT)
Received: from [10.133.33.243] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab32cfasm150643255ad.69.2026.04.20.21.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 21:19:44 -0700 (PDT)
Message-ID: <6810ee8b-8a75-4acf-8bcb-2d503d4a77c8@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 12:19:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Nord
 SA8797P
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com>
 <20260421040231.1256998-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260421040231.1256998-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VNLtWdPX c=1 sm=1 tr=0 ts=69e6fae1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wq6Rj_IcCcRUD3ssO4UA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAzOSBTYWx0ZWRfX+y2sNUOZr6jb
 lsG/IZ3YtPXrStCXnJWvcyyVCWZmshz/A0AqeGZaUIMExdjzBqLQWupEYTR+sz7XmBvGhf2ouJs
 PgN9yL2oEwupeDJGg6xvCMSZW91XtMU+Z1lELFO+bJ6bGvJ+Eh0jsZUut000+1PERLxvs4bRwSh
 ckvrHj2btgVk4vc/8iTfl/O7lOniTwhCPogq/B35zdM9Mn/FnIdJFNoRMRZwXIXQXvgpbn4+M3A
 KyMbnLRWpmkip4G/CajMHgKR5ySbmaVeS9OFV5IENU9+eRQFJcYVL/EKRWlyraIF3TKHDkfIv7Z
 UZilLHvye9UBh7y3lRLTJrSPvEfcWckro52eo7oYxACifeg2ODNv0dAJJZ8ouzj1g+27cB2vNbO
 ghN/PY4mYzjn+4XGck/EhKISTomKj1IiK80ta7R72VbW5h7c0bBMk08AX0Ms5RWjtzxalLje/Wo
 Uy8WrWoxq5ztWry5DTw==
X-Proofpoint-ORIG-GUID: Efwm4lCznVY-Azj3VE5caEZlH5AB-rN7
X-Proofpoint-GUID: Efwm4lCznVY-Azj3VE5caEZlH5AB-rN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210039
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103878-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99C05436405
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/21/2026 12:02 PM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Nord is a SoC family from Qualcomm designed as the next generation of
> Lemans series.  SA8797P is the automotive variant of Nord, where

Nitpick: extra space. Ditto for patch2

Thanks,
Jingyi

> the platform resources such as clocks, regulators, interconnects, etc.
> are managed by firmware through SCMI.
> 
> Add SoC ID for Nord SA8797P.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>   include/dt-bindings/arm/qcom,ids.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
> index 336f7bb7188a..be4657417192 100644
> --- a/include/dt-bindings/arm/qcom,ids.h
> +++ b/include/dt-bindings/arm/qcom,ids.h
> @@ -297,6 +297,7 @@
>   #define QCOM_ID_QCS8275			675
>   #define QCOM_ID_QCS9075			676
>   #define QCOM_ID_QCS615			680
> +#define QCOM_ID_SA8797P			690
>   #define QCOM_ID_CQ7790M			731
>   #define QCOM_ID_CQ7790S			732
>   #define QCOM_ID_IPQ5200			765


