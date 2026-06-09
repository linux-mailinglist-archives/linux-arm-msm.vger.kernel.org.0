Return-Path: <linux-arm-msm+bounces-112092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8jObOd7fJ2om3wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:41:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3C865E6FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:41:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="RiQ/uF3m";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NVaX12XM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112092-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112092-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8D4030E8EE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3F12EA48F;
	Tue,  9 Jun 2026 09:31:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56173909AC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:31:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997467; cv=none; b=O9357RYC16WEhuUCibIC5tsFhpcUurAl+158zJDAZtDyqgGQog1CMmu7Nukp8P+IhVSiyvan6fumCGM7b2NpTCulm+7aLmzCw4psvg05gWoLx1znV5Km+u6CBWgQR3wzB24Xd8eazk65dHEOqQJktjuzmWEkBCZ6FOX3SASVD1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997467; c=relaxed/simple;
	bh=MNkG34kMsVvnIhkvNI7U4mabmb8YGJmSa1V1L6Dp6No=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nhrbxgoizZ4zfmV4zQ/H2Y5fZuGBSzt6lMwbHghV2m6I/FOv9k4iHGncn/F7MOc38dROAHc/ySWzDyrs5feZJhzTxfkKtf0VjKCBX7wwwpajbDtDXH22ZKjy/4Dxh87nDcXvt9BJFCSDZ23JKgmdCL4QsPxr/B0WkL67VEmRz78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RiQ/uF3m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVaX12XM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597ruJ92001674
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMa3qXAR5txkpAwY5jpKqli4jX9daJVnoCU3TE9NuOI=; b=RiQ/uF3mP/XnZ6bU
	SId5H3m4HAASGnXJXGsMf3odDzD3ZsQxdsKs5Z1hd7j6+ZSLE7s0pe8eXz+9OW2w
	GMFWzmITNWuh4yYqvd26yhZrlzVN0cX0JuLPz13twLM1ot3WxcTckKFb8jQPx03t
	OcSd8PRmTgKtgNdP+Xk8GEEV2L3UKVFwVrCEEVhXzX/nhA0QBg0yjXBTl2aAtMn0
	tmAasEXfrPRJwouMqnJRQoRqdfaGWhh13pFnZpAgArLuHQAuQXpfoweFq01jvRHd
	+/5QA0EvGOwZ8xB6ezMvYtshvnHxUJtD/yG88zIVAKvcrdTFEkURRmjrS9DK1o4+
	mHj4MQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25rkxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:31:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5177b12d7bbso9460061cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780997464; x=1781602264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMa3qXAR5txkpAwY5jpKqli4jX9daJVnoCU3TE9NuOI=;
        b=NVaX12XM42/UxPdmc1N8Cbn+lmwD9K+6LsrQq52HGDCLnuG74sSap2h7e5LMhxBfsC
         9V4JuWUlm+rJee5Yj9qeNcGyi7HIZaYLboFpZhhF75OqmmxdsgkICvC7VPTVze2psSM8
         PPO0qahvqXUYrYZybunKiDUMHVk09VojOe4MSorDfdEdA5tc+tkCjbxqvIvhcR+gHRqg
         cFTbAxZ0z3inw/zoOPXs17hStYNQgxyiSNkofXBQ8PNwMSQwMcVE+iHbVvptM9Uif0O4
         rxcJ3Pr02afvk5Qr0zSPtNMJiC815I1v4/OX+LsugL+BCQk4jpCjU6fo34zGsHPVg6jB
         BKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997464; x=1781602264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMa3qXAR5txkpAwY5jpKqli4jX9daJVnoCU3TE9NuOI=;
        b=CUUzY588JIwzDnF26mMSE5vrVbxzJ5tS4OZekcAfvavdiyILqW5cfpOHdi0ysTwFmb
         SIudfk1UBEqdNlpShVfh6qVDH+7PtRtHyYHquUj4vQ7slcy8nPTakGdcMMyj7I1rxg72
         HO5CPCXaHx+BGtNoAceb8ovfAuHv7c7A4AHzu79HRrm/sheHEywRXiaLYVi3ZHOivh9R
         rquMvsLW+Nm13a542Seu7eYFSpvc1tp7g06Csi4NVip4Xr3EC6fkHHqfc3vwEg94VqVt
         zU2FfgRugoGzMelQvaW1zHv3pbGzg98DdoInoWNqcyYZEc2mTcUuoJ/YpLcQcpBXGYAb
         v7AA==
X-Forwarded-Encrypted: i=1; AFNElJ8mvSGh+E7BUM0JMAMjD9CDMR/yHdf56weG8YHdE44uVgKBtqtm0rfS6g9AJEIqLymGljk15GrQ1HAojcpj@vger.kernel.org
X-Gm-Message-State: AOJu0YzbUcAV1DurRXoP5Ocd1Gax2Hwm+9GeDwzsNt32Yz7JpINWPB6s
	2GEfJ2BV13JYO3PqT+XgO/JLKO9OI28rJMZ4RPlpacdd9AgjD8YUZfcpfHxWZi5i559z3fh9yp+
	H7QHRZUbgYMN+OyAB4YRnSL6acgde3sjprpk8iPbNulr9C7p8TuWeB1lDI6Lq6LCxgqFh
X-Gm-Gg: Acq92OGI4ccc+al2VYd+nQ0ngTbtdMbUlPZiep7lmMFrG+S5ZqdwT+15dNInX72zZl8
	CxtxJl46peZSGwXoIwC4zln/7zzluROK3+WCuORv1kokpHJl4e/pgHwo41pAAGtGjF9JFGekNEr
	ubK6E9KHie4UB3wPFgx/9hkoAWccLvHjWDmhL8lOdDiuRjWnyh8qOfnBE8PsGp4CMYTjjYvRZd6
	s2cS8I+JNWz4f8BNeGgoj1ScGo7VeOlDdvcYH7Ehski6XiKn7zpUvv4dXkf7hNgf/qd6oUeoavY
	/AQsBphWiATqMTQl6JzSYibzy5v4TZy1TvH57ZiNVzP4eELml+SNvnKHpnBEdcbWOp/CwIoW4Tj
	7n8EKb17MErSTAbXgLIHvz2cSANUWBV1mtYVcTFvmYJ2eAwOZVss/Q1Lk
X-Received: by 2002:ac8:59c8:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-51795c56077mr168230441cf.6.1780997464174;
        Tue, 09 Jun 2026 02:31:04 -0700 (PDT)
X-Received: by 2002:ac8:59c8:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-51795c56077mr168229991cf.6.1780997463612;
        Tue, 09 Jun 2026 02:31:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05228a16csm1005080866b.28.2026.06.09.02.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:30:59 -0700 (PDT)
Message-ID: <4ced3207-a132-4ec5-a0eb-79f75f5cb4bb@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:30:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add Microsoft Surface Pro 12in
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: jikos@kernel.org, bentiss@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20260529011619.9586-1-harrison.vanderbyl@gmail.com>
 <20260529011619.9586-3-harrison.vanderbyl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260529011619.9586-3-harrison.vanderbyl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OpW9ZU8j_OeeBj_GDQkKiikT6nEZeBM-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4OCBTYWx0ZWRfX2w7IMEUWeGLG
 gGO/RFxUL1yME65GUjvvK50UimvNilpbpB380tEVNUc47f8vsgOx3c8ZcOer4v1cpEwwm6nSfjC
 xPYEzx6G5TPBg0Tzm8/60vqaSWDt5EROfLLGUt30tj6V84ccCw1zhfUzYs7SvG+LUok+tTQn1j/
 zi8TZhzqVjXDo9ZyfOyb7cujUBKCyjjDQSss0lKGtPBMZsBwg9xM2kIBtg6NmuQdHJBQNoChtvw
 yjE0RzJ5vFVYufQ99KHGZJXgOvi2/X6wDtBJxbfPhU106J/E25qkjsqX/maQfQguwea+7iLt8lb
 arWVW7RrkQ4FCdme7QpYrH2mMQe6md3YajPUGeKswyh6jN2svCmc24K5CMPdyd2XLh7XhcPnS+x
 5kAbk9941i1GVZPDF8yJPMHd93yIxydD8kP5/Rn2KNT1fWHHC8de68Q2o2rB6teN9HvHDpdXDwX
 i3FBY5q0riYUqsvxkMA==
X-Proofpoint-GUID: OpW9ZU8j_OeeBj_GDQkKiikT6nEZeBM-
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27dd58 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_XXtN2VGHKrtNHovNKMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harrison.vanderbyl@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:jikos@kernel.org,m:bentiss@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:harrisonvanderbyl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-112092-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D3C865E6FD

On 5/29/26 3:16 AM, Harrison Vanderbyl wrote:
> Initial device tree for Microsoft Surface Pro 12in
> 
> Currently supported:
>   - UFS
>   - Touchscreen
>   - Pen
>   - USB 3.2 x2 (DP Alt Mode)
>   - Audio
>   - Wifi
>   - Bluetooth
>   - CDSP
>   - ADSP
>   - GPU
> 
> Not currently supported:
>   - Accelerometer
>   - Front, Back and IR cameras
>   - IRIS video decoder
> 
> Tested on Surface_Pro_12in_1st_Ed_with_Snapdragon_2110
> 
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

lg, just a couple nits


[...]

> +			codec {
> +				sound-dai = <&left_spkr>, <&right_spkr>,
> +						<&swr0 0>, <&lpass_wsamacro 0>;

Please align the <s

[...]


> +&i2c9 {
> +	clock-frequency = <400000>;
> +
> +	/* NFC @28, commercial devices only */
> +
> +	status = "okay";

Because we'd put the subnodes for devices under the 'status' line (DTC
enforces that), please move the comment below as well

Or since it's @28, perhaps it's just nxp,nxp-nci-i2c and it could work
for you ootb?

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <34 2>, /* Unused */
> +				   <44 4>; /* SPI (TPM) */

Please align the <s (or is it my mail client playing tricks on me?)

Konrad

