Return-Path: <linux-arm-msm+bounces-93488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DMRMaU6mGkQDgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:42:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F59166F19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B5243018429
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135942D130C;
	Fri, 20 Feb 2026 10:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkh2Ia58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJsBPQmP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BDC33E363
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771584164; cv=none; b=cjM2habzD+o6+mfxQwAnsdj6OkEnavQRP3GQss3XLdHU4MXD8waigw/8O5yz//Vo09wU9UvkAT9yH3ORx02n9SvLDcWW44IPanGuPfpqouZHCBqrSBhXXYVRPB+VC/kdc8B5A/BYwatE1Wna+/Ie3ULOFUDuZpvE00kR/SyyWDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771584164; c=relaxed/simple;
	bh=6BVn1qYdZvLap01i8wLVVonFLkT7a7RGiRr3/802B9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ed+LamttH+/3ufzeG7Vz7JQG81IeNVEZw9TeNoSixC5U2HdEwATwi3RY22KySR0QrGzFx1HvCtt8eLxWPGRjykgh50sVojtmMKkYFA0r6aCt9GLgqOyDQR8lHdHsM19ddJQwhC/c8xmzsvN20Gjx7Xw2llZWO8KhYPiG/hkRHOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkh2Ia58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJsBPQmP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5S7PJ3337636
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSoT8RDYh9SGpDdFyfFsOMy6GeOKmTmsEzsrIG2MK2U=; b=dkh2Ia58/Mtv1We0
	QtpBeZ/xdktZgRhbqNbsWhsJqvBjEFkwsyDUhGSz509q26vfgeNoZvuPuGOzelsf
	XFW10udHu8sKUKRpaSNYVbhyXv4D3F4DAWmvC2Ab4D4EQuOiw2kktajLbXHP9ios
	aTsL612xnQDjD3RQtUj7wjeOIvLp8RZhzG5EDZHYff0iJLxkB3fRgBgnAnYqzEPB
	YTf15k2+f1P4dBSPtbJdRNpCb/9Hrec5MpoId80ZYm3H9/CUcUv3DPQTjRJBC7f+
	UiIwtRMXxxooQixbNtoSuGf6qrF0LgUjdLozQlxR4GI/jcNCfEzvJ3GMppu69GNL
	RG11Zw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cedp6ha5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:42:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89496f5086dso19568926d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 02:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771584160; x=1772188960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSoT8RDYh9SGpDdFyfFsOMy6GeOKmTmsEzsrIG2MK2U=;
        b=NJsBPQmPsVZJk6G26zjgqzlK139c0oFv5OHKUvX0QpepiwYR9IdziAjSz8Z+DCEWel
         jJBxfKF3MJv2Skanq07yfWf8yOhu8YXbIGNfhiz0UfVYTIKYnA8CucIPqt5MW0j6I9l4
         Vib4CDq6OLhgsktsArcruKWLm42Khe7Bzz9Og++hPy/ZJzgOdP/mNyEaS3YJFFjZwmPd
         nQxcHCT8chIpJB4SODbNH4xPjGCNZWiENpP6x+ZdQ6Nzflr/09EZi/50HIYB5gc5X5bb
         760/BggHRUIqd2SkDvKe+DMFuz+OMqHVDt5i30KUGv86BVnnDLKBBlW8z97/1D2+BLAI
         iKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771584160; x=1772188960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSoT8RDYh9SGpDdFyfFsOMy6GeOKmTmsEzsrIG2MK2U=;
        b=iC2czTJZBniAFpRrxRKARrK585DxcIBtM4oO6O1QgeQcqXG1PiN/yOG/e4EEwmY2Jo
         GP619+DlAWGlYVNO71jX1WsIqEyyW5XhqZSI+BafkhnUZwJ1+TsxFmW28YeYj9xxO7eU
         tnEMNkfN786JEKCdyorTkBefmCoT3NWljM/AAaqOenRwP7M3zv0WxsKVLuP9nrPHMKQk
         BYhW4Xu5c++oyfsQOE2Wfh0HcBM/S53PEQeCFLH3vp8yFBJ9umjeFJrPMVIuugGVBva6
         9+8DaEu5ED1xBk+Mai6Y3aPjeOUevogX83ZESg7rrMG28Fum4skgCGU/Hl0shjeX7r2C
         AelQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk3GTVssJuuiC5l8Q34JUkfobrIG34R7mtY8M+9CpM9Nr1+Rmgtcao3BSZdVAd7+M0QqR/zRNgKLgApA3b@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ivAGer+3O8xYf5Mh2zIbpCp+Rs8D4TDACrkHYcoqTVWUmXCn
	uHkxjgqqjNcvNUv0zYQF8/y6n+wh/mcE+d0Tvz2vZ7jLILE1yh1/nGG2UlCGm+UdJlDPnuq/xYc
	RwLwXhIlWgzeoOw7u7RDRqPTgaLGH34jgwRcQI2LQSlfRNdumbScl1FCJpTjzEdvYVBGh
X-Gm-Gg: AZuq6aI/2RgAchumtzz8X31NZWmzgRFq7yJcQCYCtVm7Hg+n02idg3rt+LJ5ARRRzMN
	tJT0CmmlyYv80rSnnyanlXvJGmw24zph1tcSAfTCWyYe432DglzkOplDb9r8ZfBCIaA8rbQUJTM
	T8my/eBdurFWYXeOGa86J289k0eQ0UdZtxRY4Q/ff64n7UL6B6prAUqT6tsL6QdSj+ZpWLpwZg0
	CkUBeJVPoIvc2AEEnf8TNf6plt4BsLEGLj8bb7Nw6qWd9nmtnJ4nfWt3Wy6SSuyXq739DWzj1fR
	yWBnKUH1sNN7aPLOcOQbmoizzAq67N8uOmo8/y6iYVfmhEhclzAr1cXbGBqdFYCVVo8fDmqdz5d
	WTD05VwgpvxBsrm0VbII0XGR5lgWeZHtHQ5F2IzJqHQy280EgquHVns2auptlnKTALbl16IyAoJ
	C6wCo=
X-Received: by 2002:a05:6214:601a:b0:897:2556:d963 with SMTP id 6a1803df08f44-897346f2bf7mr248079056d6.2.1771584160020;
        Fri, 20 Feb 2026 02:42:40 -0800 (PST)
X-Received: by 2002:a05:6214:601a:b0:897:2556:d963 with SMTP id 6a1803df08f44-897346f2bf7mr248078866d6.2.1771584159478;
        Fri, 20 Feb 2026 02:42:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735d66esm639408066b.4.2026.02.20.02.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 02:42:38 -0800 (PST)
Message-ID: <9d896a50-0310-42c9-8a65-2e15e1c4148a@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 11:42:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Add support for MM clock
 controllers for Glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260220-glymur_mmcc_dt_config-v1-0-e0e2f43a32af@oss.qualcomm.com>
 <20260220-glymur_mmcc_dt_config-v1-1-e0e2f43a32af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260220-glymur_mmcc_dt_config-v1-1-e0e2f43a32af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA5MyBTYWx0ZWRfXximl16bQws3R
 8tp8V4PzEeHvGkrW8xLgIsiMU6Adt3h5MzUz5svmiGa4j4dRjCjZ5dmeS/bJK7MDO0VpNEq8ZhZ
 mFSFb7xrhtLJIg86Gxa0ITuZeSKKVENvSu5qbtnb9QJtJX8vyLaX1Ma8EAoSoa8RsprfUKysqED
 QoRx5TLakpmEUNz4cIv3sr7dwpQ8SbrEzbx2rYlFvZE7xu/J2a5Z/SR6qvLlQKyp7v+1wxCNGhg
 PM8jSlY59bSX4VA3W6gYP6ZbXwYNyYkslIcrZhsbXwAVn64CcRbpAIg5K2/KAYX3coozS/cFkLW
 TeSCcWjLJ6QJVpqyqavyEczvvMYrkkdcuf2zpCsLEXzbbNSxli4eroe48RO9f2uvMvB1Bt/z5Rg
 LLeemgDu/Ei8z/po2OWqQrBuT2VKpx8EjHdKipx6eN77A5qC4noJhwoF7Ok942m81FnT5lxbIq/
 nxO05W7tCA32mweWxEQ==
X-Proofpoint-ORIG-GUID: tmNbcWJdOy5UeTFJTVo1TF3bFaGyowW9
X-Authority-Analysis: v=2.4 cv=Vuouwu2n c=1 sm=1 tr=0 ts=69983aa1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=uQchpHfze1H8qr-n8IoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: tmNbcWJdOy5UeTFJTVo1TF3bFaGyowW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-93488-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64F59166F19
X-Rspamd-Action: no action

On 2/20/26 11:16 AM, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers videocc, gpucc
> and gxclkctl.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +		videocc: clock-controller@0aaf0000 {

stray zero in the front

> +			compatible = "qcom,glymur-videocc";
> +			reg = <0 0x0aaf0000 0 0x10000>;

Please use 0x0 for consistency

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

