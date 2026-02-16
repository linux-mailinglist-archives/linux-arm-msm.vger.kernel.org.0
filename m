Return-Path: <linux-arm-msm+bounces-92944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKoDFscPk2lO1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:38:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C018E1435FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F89530158AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA9E1A23B6;
	Mon, 16 Feb 2026 12:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbL6T15s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+APJMWu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED10C13AD26
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771245507; cv=none; b=aDgmGiZrVrvbgtgXXYuchZf1s8k0hzzZsJted6cwoaMHZkLhjw0JBecpkAiuRs55kcYsquoLx/4p3TsheVrbhRDHmIBsTT0B9O9Aeini3iy3edlf7SYh8SvYI7+XaUcSN5ycznvOujqCehlsaiSYUO6Fs0CcEShqW8e3SCOmv5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771245507; c=relaxed/simple;
	bh=9VRJwY6iRkDsQtNMB2nDXFF8e0kuihJq65MDPNcoThs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RziIiGqXAa868aonliaiMH+az2OKSPV0lwhC7D98u9fLAbfnkslbyB1jhWxQbwgrzdZVpfhsCFg8GTEKotG1qT2UJgUyWOiXrS9MX5rDnlPS3LJAVLSSZaikGqBrD/fYSonw+j+lf+YxWZkSwtZv4Co66+8jwtLiIud1PPOPFkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbL6T15s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+APJMWu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBJf5M2617484
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UShD8Uz1Mv9kGLbCfZTe1a7JofET5bcN3YTFLcFt/1s=; b=gbL6T15sqJc0Tsdr
	uD2SJ45kZp7gEYZTO7k6JB4S3W7oaoGb/igiMo0dYJNGCk9vswjloZhJakdGNu2F
	KAFnfov3IuF7El3XTNAlQ2Dk88IJkz0rdrwUmitq0x0+58+lXfRZEiWyRepmptsQ
	Zo5JS2zg1Y8DTyi8cJyJIz6LnpuyDk+usm/3kVLoWEYTAJ4PlaVlm3318bPseh4n
	sKzGs3J2blz9TDsncTFbTQwyWTPDk3si+9OT86eRC185UHfR2RiBEwUQsvRgyVXs
	xcKCp0r/nwPwZ7ggmLFqL+oCnVjCHmIKagL9itk3sNaAYc6kbcQitsU4QnVzeMP3
	/W4/JQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahe64f11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:38:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3978cdb2so210665985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 04:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771245504; x=1771850304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UShD8Uz1Mv9kGLbCfZTe1a7JofET5bcN3YTFLcFt/1s=;
        b=R+APJMWulXxAeAB5m+ptvqo9/ofj4ph1jenxeDMzMMsPFo0llMftuqwIG4NQedOXRu
         msDBls4wy7SfWLm2PXStDokihP5XnNgxatmspZKgDq0rmeDYYGzFEC45BCPr27/p4M5a
         UvMnWf6bNrFZuEGi/Ndqw+8GRiL03eiVEX7Sk/sILQehSmmm3CiA7b3xcJsP9s44dRgG
         9SapCj9StDHaZnG8HwhhCRiIxyMPzs/EkkSgxi60xWeaA6ITuqN63HMMog+TuLMBOGAb
         J4tm/tBsXyToYZSPkvwGSiD1NEdUBnvHuk2QKjvTr1zM08B2zUB/pYrlQ8SDbH388dzh
         B5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771245504; x=1771850304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UShD8Uz1Mv9kGLbCfZTe1a7JofET5bcN3YTFLcFt/1s=;
        b=GLzVNqidVQ9b47ZXGZlDbC9hBlVaiWZOA3BZjLl5c9xLuYslGZ9OB7wRAHQ4OVi+OO
         wEtsW/18SM6v0kZ1+JhxULmxN5C8rSoU3k9sGTTNnZraPwbbddPBADL5Rd9t8stuIMke
         ODsQ1N7vG03igrt4UzOh04UteRVLqVwXWw6hatVmpPWzD/sqUst31l1NqXRHQ33Ho4cI
         9wMvrM8ReuSFfTxU60ayOZerg/JPYDETEv/CWOd6ToFZfur1RPTzbvxE3ouHyEm6dYxP
         F8y/R783AwjF5gLwsbyjdei2ID0tKrMyhAbZwXn59ULryMVj5R7dfMb0xsjWd1IgeTAD
         RxOw==
X-Gm-Message-State: AOJu0YwhEkNfZ5WQRigMEYj06wQEL+N7eWchqQcb1z/dxC/vnHEZ703b
	3szjI8PZAT4MvrWkCXNy818TVslXvFsEYS75bYgr2+PeEMW/B7z7at3z6PmQyszG83sYF7mZjQW
	sOe8OV7QqmX8jH1N00urZxsVHYO2B8Mmo1g6rtz7TAgTUl1xc3j3ULitVjvAwaqdv8mh+wO3JMo
	bu
X-Gm-Gg: AZuq6aKHIo8lFrwHNzs2xtEenUpV/TaGa/gbYlufVSYzYE/XmpLrT2vA9ZGKAMMZrJW
	oOlvYvDXmhFJ8UHd6JkwecK+FfWWoslWPeD2oYJ94hNZYv1sexNSxSS6LJobDM9B/AlGCwElt1F
	nGctFH7xPOyFC7XBN8RkQtdyAtIpNN0o0gTbc3oMsjXqeUfCaI1nGq+qDbzdmL0eaxsQjma8oJQ
	K8R4hr1yAqZWEi1fohfBKAOf5TduCRVI44khpXltc9pJFCiKqpa6Kxx93I8YZYZKfKfnWzaIrdA
	EbaWRLblt6q2klDFspt7jRgj++WJxHDiBDx+0HqISwFyyWJwYaUOjAevbx6u20Rjzk02hzqT1PS
	qzJygT6ZGMLgzof19ymMaFqdB7K+K+DO1xpB+PDJdaM35v1Y2FgG9Rq1UPxs86Ra2qA53Wqn8hV
	IdxKo=
X-Received: by 2002:a05:620a:2905:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cb408ccb63mr1015965485a.9.1771245504040;
        Mon, 16 Feb 2026 04:38:24 -0800 (PST)
X-Received: by 2002:a05:620a:2905:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cb408ccb63mr1015962985a.9.1771245503673;
        Mon, 16 Feb 2026 04:38:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad29df12sm1924858a12.14.2026.02.16.04.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 04:38:23 -0800 (PST)
Message-ID: <5fa8e2d0-5122-4ff6-b0db-b6e31216cdb8@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 13:38:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Stanislav Zaikin <zstaseg@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20260216120715.3432191-1-zstaseg@gmail.com>
 <20260216120715.3432191-3-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216120715.3432191-3-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c5WmgB9l c=1 sm=1 tr=0 ts=69930fc0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=yr-2ec9jEi1U7REnfNwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 1ogheiTassT_jLyT8XqIYs9JZ5lSmBhe
X-Proofpoint-ORIG-GUID: 1ogheiTassT_jLyT8XqIYs9JZ5lSmBhe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEwNyBTYWx0ZWRfX95wBg7XzTjAl
 QcZmdgpmcXxOBV2OX7HC2M4CK9pI0dmeBKKsFiDMB4ZFI7s3qPrZKy6CzORbhmvuIBTr3oF8NvL
 LGXuWFfIUcBSrHDLwcHHMDaJXrV5aIaRbUCMecpUPEFLcEeTLC+MxhW8AMi0vHPUvRYX7aVwRc2
 hUaCMRA7/lzxy2hYk36pDlrlULC3JcBRA3a/BqpHp+5CR4SAyQERjRi3YAINj5LP3uL8PPIQCWQ
 dgBeqlA5KPkKmu1L8YZl9oWV7RXXFp3I2RS6ZkS9ppxT07M0nkrBw+z1imEvKpG638Wu8WcC53J
 NAiR153uXWbjljuXs2C2zF+vVFsG7Pk27AX5GUoFfJf2ue+f/4P8iUH1cJ1pbv2DugYhA3ks8lO
 ywfF1+Bi9iBGK7POSex0GuK0WGdf4kK5lnyXeGW+FVe0fbug+UWmNr0se1a5x5McJgQczoNyFIj
 XIFtlstOl6gdgp0EB1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92944-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C018E1435FC
X-Rspamd-Action: no action

On 2/16/26 1:07 PM, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G is a handset released in 2022
> 
> This commit has the following features working:
> - Display (with simple fb)
> - Touchscreen
> - UFS
> - Power and volume buttons
> - Pinctrl
> - RPM Regulators
> - Remoteprocs - wifi, bluetooth
> - USB (Device Mode)
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---

[...]

> +		framebuffer0: framebuffer@e1000000 {
> +			compatible = "simple-framebuffer";
> +			memory-region = <&framebuffer_reserved>;

Since this no longer has a 'reg' property, please drop the unit address
too (after '@')

Otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

